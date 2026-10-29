"""Install the published package in a fresh consumer and verify release behavior.

No local path dependency, source checkout, Python OTIO or login token is used.
Requires Python 3.10+, Node.js, MoonBit >= 0.10.16, and registry network access.
Usage: python tools/check_published.py --version 0.2.0 --keep
"""
import argparse
import copy
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

PACKAGE = "white-bear233/moontimeline"
REQUIRED = ["schema", "graph", "plugins", "core_api", "url_utils", "opentime",
            "algorithms", "adapters", "edit", "timeline", "validate"]
IMPORTS = ["time", "range", "model", "otio", "otiojson", "schema", "graph", "plugins",
           "core_api", "url_utils", "opentime", "edit", "timeline", "validate"]
TEMPLATES = Path(__file__).resolve().parent / "published_smoke"


def run(command, directory):
    # No shell expansion, environment dump or authentication/config inspection.
    print("RUN", " ".join(map(str, command)), flush=True)
    result = subprocess.run(command, cwd=directory, text=True,
                            encoding="utf-8", errors="replace", capture_output=True)
    if result.stdout:
        print(result.stdout.rstrip(), flush=True)
    if result.stderr:
        print(result.stderr.rstrip(), flush=True)
    if result.returncode:
        raise RuntimeError("Command failed with exit code " + str(result.returncode))
    return result.stdout


def write(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8", newline="\n")


def fixture_data():
    """Small original fixtures, independent of the repository and official OTIO."""
    def rt(seconds):
        return {"OTIO_SCHEMA": "RationalTime.1", "value": seconds * 24, "rate": 24}

    def span(start, duration):
        return {"OTIO_SCHEMA": "TimeRange.1", "start_time": rt(start), "duration": rt(duration)}

    marker = {"OTIO_SCHEMA": "Marker.2", "name": "review", "color": "RED",
              "metadata": {"notes": [1, "保留", None]}, "marked_range": span(11, 2)}

    def attributes(name):
        return {"name": name, "metadata": {"vendor": {"keep": [1, "中文", None]}},
                "source_range": None, "effects": [], "markers": [copy.deepcopy(marker)],
                "enabled": True, "color": None}

    def clip(name="A", start=10, duration=4, scalar=None):
        value = dict(attributes(name), OTIO_SCHEMA="Clip.2", source_range=span(start, duration),
                     active_media_reference_key="DEFAULT_MEDIA", vendor_extension={"keep": True})
        value["media_references"] = {"DEFAULT_MEDIA": {
            "OTIO_SCHEMA": "ExternalReference.1", "name": "source", "target_url": name + ".mov",
            "metadata": {"media": ["keep"]}, "available_range": span(0, 100),
            "available_image_bounds": None}}
        if scalar is not None:
            effect = {"OTIO_SCHEMA": "FreezeFrame.1" if scalar == 0 else "LinearTimeWarp.1",
                      "name": "speed", "effect_name": "FreezeFrame" if scalar == 0 else "LinearTimeWarp",
                      "metadata": {"effect": ["keep"]}, "time_scalar": scalar}
            value["effects"] = [effect]
        return value

    def timeline(children):
        track = dict(attributes("V1"), OTIO_SCHEMA="Track.1", children=children, kind="Video")
        stack = dict(attributes("tracks"), OTIO_SCHEMA="Stack.1", children=[track])
        return {"OTIO_SCHEMA": "Timeline.1", "name": "Published consumer",
                "metadata": {"project": ["keep", 42]}, "global_start_time": None, "tracks": stack}

    transition = {"OTIO_SCHEMA": "Transition.1", "name": "dissolve",
                  "transition_type": "SMPTE_Dissolve", "metadata": {"curve": [0, .5, 1]},
                  "in_offset": rt(1), "out_offset": rt(.5)}
    result = {"internal": timeline([clip(), transition, clip("B", 20, 3)])}
    for name, scalar in [("double", 2), ("half", .5), ("reverse", -1), ("freeze", 0)]:
        original = timeline([clip(scalar=scalar)])
        result[name] = original
        for operation in ["split", "trim", "gap"]:
            expected = copy.deepcopy(original)
            children = expected["tracks"]["children"][0]["children"]
            if operation == "split":
                left, right = copy.deepcopy(children[0]), copy.deepcopy(children[0])
                left["source_range"]["duration"]["value"] = 36
                right["source_range"]["start_time"]["value"] += 36 * scalar
                right["source_range"]["duration"]["value"] = 60
                children[:] = [left, right]
            elif operation == "trim":
                children[0]["source_range"]["start_time"]["value"] += 24 * scalar
                children[0]["source_range"]["duration"]["value"] = 48
            else:
                # Gap defaults are checked separately; compare the unchanged
                # existing node and annotations without inventing gap defaults.
                continue
            result[operation + "_" + name] = expected
    return result


def create_consumer(directory):
    write(directory / "moon.mod", 'name = "release-smoke/consumer"\nversion = "0.0.0"\npreferred_target = "js"\n')
    fixture_lines = ["///|", "fn source(name : String) -> String {", "  match name {"]
    for name, value in fixture_data().items():
        source = json.dumps(value, ensure_ascii=False, separators=(",", ":"))
        fixture_lines.append("    " + json.dumps(name) + " => " + json.dumps(source, ensure_ascii=False))
    fixture_lines += ['    _ => abort("unknown fixture")', "  }", "}"]
    imports = "import {\n" + "".join('  "' + PACKAGE + "/" + item + '",\n' for item in IMPORTS) + '} for "test"\n'
    write(directory / "moon.pkg", imports)
    test = (TEMPLATES / "smoke_test.mbt.in").read_text(encoding="utf-8")
    write(directory / "smoke_test.mbt", "\n".join(fixture_lines) + "\n\n" + test)
    write(directory / "cmd/main/moon.pkg", 'import {\n  "' + PACKAGE + '/time" @timeline_time,\n}\npkgtype(kind: "executable")\n')
    write(directory / "cmd/main/main.mbt", (TEMPLATES / "main.mbt.in").read_text(encoding="utf-8"))


def installed_version(package_dir):
    modern = package_dir / "moon.mod"
    if modern.is_file():
        found = re.search(r'^version\s*=\s*"([^"]+)"', modern.read_text(encoding="utf-8"), re.M)
        if not found:
            raise RuntimeError("Downloaded moon.mod lacks a version")
        return found.group(1)
    legacy = package_dir / "moon.mod.json"
    if legacy.is_file():
        return json.loads(legacy.read_text(encoding="utf-8"))["version"]
    raise RuntimeError("Downloaded package has no module manifest")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--version", default="0.2.0", help="Exact Mooncakes package version")
    parser.add_argument("--moon", help="Path to moon executable")
    parser.add_argument("--keep", action="store_true", help="Keep temporary consumer for inspection")
    parser.add_argument("--targets", nargs="+", choices=["js", "wasm-gc", "native"], default=["js", "wasm-gc"])
    args = parser.parse_args()
    if not re.fullmatch(r"\d+\.\d+\.\d+(?:-[0-9A-Za-z.-]+)?", args.version):
        parser.error("--version must be an exact semantic version")
    default_moon = Path.home() / ".moon/bin" / ("moon.exe" if os.name == "nt" else "moon")
    moon = args.moon or shutil.which("moon") or str(default_moon)
    temp_root = Path(tempfile.gettempdir()).resolve()
    directory = Path(tempfile.mkdtemp(prefix="moontimeline-published-", dir=temp_root))
    print("Fresh consumer:", directory, flush=True)
    success = False
    try:
        create_consumer(directory)
        version = run([moon, "version", "--all"], directory)
        compiler = re.search(r"moonc\s+v?(\d+)\.(\d+)\.(\d+)", version)
        if not compiler or tuple(map(int, compiler.groups())) < (0, 10, 16):
            raise RuntimeError("MoonBit compiler >= 0.10.16 is required")
        run([moon, "add", PACKAGE + "@" + args.version], directory)
        manifest = (directory / "moon.mod").read_text(encoding="utf-8")
        if PACKAGE + "@" + args.version not in manifest or re.search(r"\b(path|git)\s*[:=]", manifest):
            raise RuntimeError("Consumer must pin the registry version without local/git overrides")
        package_dir = directory / ".mooncakes" / PACKAGE
        if package_dir.is_symlink() or not package_dir.resolve().is_relative_to((directory / ".mooncakes").resolve()):
            raise RuntimeError("Dependency resolves outside the fresh consumer registry directory")
        if installed_version(package_dir) != args.version:
            raise RuntimeError("Downloaded package version differs from the requested version")
        missing = [item for item in REQUIRED if not (package_dir / item / "moon.pkg").is_file()]
        if missing:
            raise RuntimeError("Published package is missing new modules: " + ", ".join(missing))
        for legal in ["LICENSE", "THIRD_PARTY_NOTICES.md"]:
            if not (package_dir / legal).is_file():
                raise RuntimeError("Published package is missing " + legal)
        print("Verified registry dependency:", PACKAGE + "@" + args.version, flush=True)
        for target in args.targets:
            run([moon, "check", "--target", target], directory)
            run([moon, "build", "--target", target], directory)
            output = run([moon, "run", "cmd/main", "--target", target], directory)
            if "48 帧 @ 24fps = 2 秒" not in output or "换算到 30fps = 60 帧" not in output:
                raise RuntimeError("README example output differs on " + target)
            run([moon, "test", "--target", target], directory)
        success = True
        print("PASS: exact published version, new modules, example and core release scenarios on " + ", ".join(args.targets))
    finally:
        if args.keep or not success:
            print("Consumer retained for inspection:", directory, flush=True)
        else:
            # Delete only the exact new directory owned by this invocation.
            resolved = directory.resolve()
            if (directory.is_symlink() or resolved == temp_root
                    or resolved.parent != temp_root
                    or not resolved.name.startswith("moontimeline-published-")):
                raise RuntimeError("Refusing cleanup outside the owned temporary consumer")
            shutil.rmtree(directory)


if __name__ == "__main__":
    main()
