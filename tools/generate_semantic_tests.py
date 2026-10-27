"""Author original fixtures using OTIO 0.18.1 and generate cross-backend oracles.

Structural expectations come from the official API, not MoonTimeline output.
Playback retiming has separate explicit contract tests (OTIO structural transforms
do not evaluate TimeEffects). Regenerate, moon fmt conformance, then review diff.
"""
import json
from pathlib import Path
import opentimelineio as otio

assert otio.__version__ == "0.18.1"
ROOT = Path(__file__).resolve().parents[1]
rt = otio.opentime.RationalTime
tr = otio.opentime.TimeRange


def span(start, duration, rate=24):
    return tr(rt(start * rate, rate), rt(duration * rate, rate))


def clip(name="A", start=10, duration=4, scalar=None):
    c = otio.schema.Clip(name=name, source_range=span(start, duration),
        media_reference=otio.schema.ExternalReference(target_url=f"{name}.mov",
            available_range=span(0, 100)), metadata={"vendor": {"id": name, "tags": [1, None, "中文"]}})
    c.markers.extend([
        otio.schema.Marker(name="point", marked_range=span(start + 1, 0), metadata={"review": [1, 2]}),
        otio.schema.Marker(name="crossing", marked_range=span(start + 1, 2)),
        otio.schema.Marker(name="outside", marked_range=span(start - 2, 1)),
    ])
    if scalar is not None:
        c.effects.append(otio.schema.FreezeFrame() if scalar == 0 else otio.schema.LinearTimeWarp(time_scalar=scalar))
    return c


def transition(a=1, b=.5):
    return otio.schema.Transition(name="Dissolve", transition_type="SMPTE_Dissolve",
        in_offset=rt(a * 24, 24), out_offset=rt(b * 30, 30), metadata={"vendor": {"curve": [0, .5, 1]}})


def timeline(children, window=None):
    track = otio.schema.Track(name="V1", children=children, source_range=window,
        metadata={"track": {"notes": ["keep"]}})
    track.markers.append(otio.schema.Marker(name="track mark", marked_range=span(2, 0)))
    t = otio.schema.Timeline(name="Review fixture", tracks=[track], metadata={"project": ["keep", 42]})
    t.tracks.metadata["root"] = {"keep": True}
    t.tracks.markers.append(otio.schema.Marker(name="root mark", marked_range=span(1, 1)))
    return t


def cases():
    result = {
        "internal": timeline([clip(), transition(), clip("B", 20, 3)]),
        "leading": timeline([transition(.25, .5), clip()]),
        "trailing": timeline([clip(), transition(.25, .5)]),
        "both_edges": timeline([transition(.25, .5), clip(), transition(.75, .25)]),
        "trimmed": timeline([clip(), transition(), clip("B", 20, 3)], span(3.5, .75)),
        "zero_gap": timeline([otio.schema.Gap(source_range=span(0, 0)), transition(), clip()]),
        "plain": timeline([clip()]),
    }
    inner = otio.schema.Track(children=[clip(duration=8), transition(), clip("B", 20, 6)], source_range=span(2, 10))
    stack = otio.schema.Stack(children=[inner], source_range=span(1, 7))
    nested = timeline([otio.schema.Gap(source_range=span(0, 2)), stack], span(3, 5))
    nested.tracks.source_range = span(1, 3)
    result["nested_trimmed"] = nested
    for n, s in [("double", 2), ("half", .5), ("reverse", -1), ("freeze", 0)]:
        result[n] = timeline([clip(scalar=s)])
    return result


def q(text):
    return json.dumps(text, ensure_ascii=False)


def num(value):
    return repr(float(value))


def render():
    data = cases()
    lines = ["// Generated from official OTIO 0.18.1 by tools/generate_semantic_tests.py.", "", "///|",
             "fn review_fixture(name : String) -> @model.Timeline {", "  let source = match name {"]
    for name, t in data.items():
        source = json.dumps(json.loads(otio.adapters.write_to_string(t, "otio_json")), ensure_ascii=False, separators=(",", ":"))
        lines.append(f"    {q(name)} => {q(source)}")
    lines += ['    _ => abort("unknown fixture")', "  }", "  @otio.read(source).unwrap()", "}", "", "///|",
              "fn near(a : Double, b : Double) -> Unit raise {", "  assert_true((a - b).abs() < 0.00000001)", "}"]
    for name, t in data.items():
        if name in ["double", "half", "reverse", "freeze"]:
            continue  # separately tested playback contract, not an upstream oracle
        lines += ["", "///|", f'test "OTIO structural oracle {name}" {{',
                  f"  let t = review_fixture({q(name)})", "  let l = @timeline.layout(t).unwrap()",
                  f"  near(l.duration_seconds, {num(t.duration().to_seconds())})"]
        leaves, transitions = [], []

        def walk(node, start, end, out_start, path):
            if not isinstance(node, otio.core.Composition):
                leaves.append((path, out_start, out_start + end - start,
                               node.trimmed_range().start_time.to_seconds() + start))
                return
            base = node.trimmed_range().start_time.to_seconds()
            lo, hi = base + start, base + end
            for i, child in enumerate(node):
                r = node.range_of_child_at_index(i)
                a, b = r.start_time.to_seconds(), r.end_time_exclusive().to_seconds()
                x, y = max(a, lo), min(b, hi)
                child_path = f"{path}/children/{i}"
                if y <= x:
                    continue
                if isinstance(child, otio.schema.Transition):
                    transitions.append((child_path, out_start + a - lo, out_start + b - lo,
                                        out_start + x - lo, out_start + y - lo))
                else:
                    walk(child, x - a, y - a, out_start + x - lo, child_path)
        walk(t.tracks, 0, t.duration().to_seconds(), 0, "/tracks")
        lines.append(f"  assert_eq(l.items.length(), {len(leaves)})")
        for i, (path, a, b, source) in enumerate(leaves):
            lines += [f"  assert_eq(l.items[{i}].path, {q(path)})",
                      f"  near(l.items[{i}].start_seconds, {num(a)})",
                      f"  near(l.items[{i}].end_seconds, {num(b)})",
                      f"  near(l.items[{i}].source_at({num(a)}).unwrap().to_seconds().unwrap(), {num(source)})"]
        lines.append(f"  assert_eq(l.transitions.length(), {len(transitions)})")
        for i, (path, a, b, x, y) in enumerate(transitions):
            lines += [f"  assert_eq(l.transitions[{i}].path, {q(path)})"]
            for field, value in [("start_seconds", a), ("end_seconds", b), ("visible_start_seconds", x), ("visible_end_seconds", y)]:
                lines.append(f"  near(l.transitions[{i}].{field}, {num(value)})")
        lines += ["}"]
    return "\n".join(lines) + "\n"


if __name__ == "__main__":
    (ROOT / "conformance/oracle_test.mbt").write_text(render(), encoding="utf-8", newline="\n")
    print("Generated 8 structural oracles and 12 original fixtures using OTIO 0.18.1")
