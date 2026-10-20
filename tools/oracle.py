"""Reproducible OTIO fixtures. --check never updates committed expectations."""
import argparse
import importlib.metadata
import json
import random
from pathlib import Path

import opentimelineio as otio

ROOT = Path(__file__).resolve().parents[1]
VERSION = "0.18.1"


def encode(value):
    return json.dumps(value, ensure_ascii=False, indent=2, sort_keys=True) + "\n"


def artifacts():
    assert importlib.metadata.version("opentimelineio") == VERSION
    rt = otio.opentime.RationalTime
    tr = otio.opentime.TimeRange
    gap = otio.schema.Gap(source_range=tr(rt(0, 24), rt(48, 24)))
    clip = otio.schema.Clip(
        name="Example clip",
        media_reference=otio.schema.ExternalReference(
            target_url="media/example.mov",
            available_range=tr(rt(0, 24), rt(480, 24)),
        ),
        source_range=tr(rt(240, 24), rt(120, 24)),
        metadata={"moontimeline": {"fixture": True}},
    )
    track = otio.schema.Track(name="V1", children=[gap, clip])
    timeline = otio.schema.Timeline(name="Gap and clip", tracks=[track])
    normal = otio.adapters.write_to_string(timeline, "otio_json") + "\n"
    restored = otio.adapters.read_from_string(normal, "otio_json")
    assert restored.duration().to_seconds() == 7.0
    assert restored.tracks[0].range_of_child_at_index(1).start_time.to_seconds() == 2.0
    unsupported = otio.schema.Timeline(tracks=[otio.schema.Track(children=[
        otio.schema.Gap(source_range=tr(rt(0, 24), rt(48, 24))),
        otio.schema.Transition(in_offset=rt(12, 24), out_offset=rt(12, 24)),
        otio.schema.Gap(source_range=tr(rt(0, 24), rt(48, 24))),
    ])])
    invalid = '{"OTIO_SCHEMA": "Timeline.1",'
    try:
        otio.adapters.read_from_string(invalid, "otio_json")
    except (ValueError, RuntimeError):
        pass
    else:
        raise AssertionError("Malformed JSON unexpectedly accepted")
    # Explicit boundaries plus deterministic varied rates and signs.
    inputs = [(48, 24, 30), (-1.5, 24, 24), (1.5, 24, 24),
              (24000, 24000 / 1001, 25), (0, 24, 60), (1, 3, 24)]
    rng = random.Random(20261020)
    rates = [1, 24, 25, 30, 60, 24000 / 1001, 30000 / 1001]
    inputs += [(rng.uniform(-100000, 100000), rng.choice(rates), rng.choice(rates))
               for _ in range(96)]
    vectors = []
    for value, rate, target in inputs:
        time = rt(value, rate)
        vectors.append(dict(value=value, rate=rate, target_rate=target,
                            seconds=time.to_seconds(),
                            rescaled_value=time.rescaled_to(target).value))
    return {
        "fixtures/valid/gap_clip.otio": normal,
        "fixtures/invalid/malformed.otio": invalid + "\n",
        "fixtures/unsupported/transition.otio":
            otio.adapters.write_to_string(unsupported, "otio_json") + "\n",
        "fixtures/time_vectors.json": encode({"otio_version": VERSION, "cases": vectors}),
        "fixtures/manifest.json": encode({
            "valid/gap_clip.otio": {"classification": "valid", "duration_seconds": 7,
                                    "clip_start_seconds": 2, "source_start_seconds": 10},
            "invalid/malformed.otio": {"classification": "invalid_json"},
            "unsupported/transition.otio": {"classification": "valid_otio_preserved",
                                           "reason": "Transition.1 is preserved verbatim and treated as zero duration"},
        }),
    }


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    outputs = artifacts()
    for name, content in outputs.items():
        path = ROOT / name
        if args.check:
            if not path.exists() or path.read_text(encoding="utf-8") != content:
                raise SystemExit(f"Fixture differs: {name}; review before regenerating")
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(content, encoding="utf-8", newline="\n")
    print(f"OTIO {VERSION}: {len(outputs)} artifacts {'verified' if args.check else 'generated'}")


if __name__ == "__main__":
    main()
