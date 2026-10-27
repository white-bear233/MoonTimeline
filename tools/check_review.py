"""Verify actual CLI edit exports against official OTIO and preservation contract.

All fixtures are authored locally. --native additionally requires exact JS/native
response/export parity. This is an integration test, not a full OTIO certification.
"""
import argparse
import copy
import json
import subprocess
import tempfile
from pathlib import Path

import opentimelineio as otio
from generate_semantic_tests import cases

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--native")
    args = parser.parse_args()
    count = 0
    with tempfile.TemporaryDirectory(prefix="moontimeline-review-") as directory:
        tmp = Path(directory)
        for name in ["plain", "double", "half", "reverse", "freeze", "internal", "nested_trimmed"]:
            original = cases()[name]
            raw = json.loads(otio.adapters.write_to_string(original, "otio_json"))
            source = tmp / f"{name}.otio"
            source.write_text(json.dumps(raw, ensure_ascii=False), encoding="utf-8")
            prefixes = [["node", "cmd/moontimeline.mjs"]]
            if args.native:
                prefixes.append([args.native])
            for action in ["split", "trim", "gap"]:
                if name == "nested_trimmed":
                    path = "/tracks/children/0/children/1/children/0/children/0"
                    target = raw["tracks"]["children"][0]["children"][1]["children"][0]["children"][0]
                else:
                    path = "/tracks/children/0/children/0"
                    target = raw["tracks"]["children"][0]["children"][0]
                if action == "gap":
                    path = "/tracks/children/0"
                common = [action, str(source), "--path", path, "--rate", "24"]
                if action == "split":
                    common += ["--at-frame", "48"]
                elif action == "trim":
                    common += ["--at-frame", "24", "--duration-frames", "48"]
                else:
                    common += ["--clip", "0", "--duration-frames", "24"]
                results = []
                for backend, prefix in enumerate(prefixes):
                    output = tmp / f"{name}-{action}-{backend}.otio"
                    proc = subprocess.run(prefix + common + ["--output", str(output)], cwd=ROOT,
                                          capture_output=True, text=True, encoding="utf-8")
                    assert proc.returncode == 0, (name, action, proc.stdout, proc.stderr)
                    exported = json.loads(output.read_text(encoding="utf-8"))
                    official = otio.adapters.read_from_file(str(output))
                    assert json.loads(otio.adapters.write_to_string(official, "otio_json")) == exported
                    # Complete JSON expectation: only the intended child list and
                    # source ranges may change. Includes all marker coordinates,
                    # metadata, effects, references and ancestor annotations.
                    expected = copy.deepcopy(raw)
                    children = expected["tracks"]["children"][0]["children"]
                    if name == "nested_trimmed" and action != "gap":
                        children = children[1]["children"][0]["children"]
                    scalar = {"double": 2, "half": .5, "reverse": -1, "freeze": 0}.get(name, 1)
                    if action == "split":
                        left, right = copy.deepcopy(target), copy.deepcopy(target)
                        left["source_range"]["duration"]["value"] = 48
                        right["source_range"]["start_time"]["value"] += 48 * scalar
                        right["source_range"]["duration"]["value"] -= 48
                        children[0:1] = [left, right]
                    elif action == "trim":
                        children[0]["source_range"]["start_time"]["value"] += 24 * scalar
                        children[0]["source_range"]["duration"]["value"] = 48
                    else:
                        # Gap defaults are checked by existing CLI tests; every
                        # preexisting node must remain exactly equal after insert.
                        children.insert(0, exported["tracks"]["children"][0]["children"][0])
                    assert exported == expected, (name, action, "unintended data change")
                    results.append((json.loads(proc.stdout), exported))
                    count += 1
                if len(results) == 2:
                    assert results[0] == results[1], (name, action, "backend mismatch")
    print(f"{count} edit exports: official OTIO read/write and full JSON preservation verified")


if __name__ == "__main__":
    main()
