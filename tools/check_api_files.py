"""Real filesystem interoperability for every SerializableObject subclass.

Python file exceptions map to the Node host's nonzero exit. We deliberately
refuse overwrites even though upstream to_json_file overwrites by default.
"""
import json
import subprocess
import tempfile
from pathlib import Path

import opentimelineio as otio
from generate_api_tests import objects, wire

ROOT = Path(__file__).resolve().parents[1]


def convert(source, output):
    return subprocess.run(
        ['node', 'cmd/moontimeline.mjs', 'convert', str(source), '--output', str(output)],
        cwd=ROOT, capture_output=True, encoding='utf-8',
    )


def main():
    count = 0
    with tempfile.TemporaryDirectory(prefix='api-files-', dir=ROOT / '_build') as temp:
        work = Path(temp)
        for name, obj in objects():
            if not isinstance(obj, otio.core.SerializableObject):
                continue
            source, output = work / (name + '-源.otio'), work / (name + '-结果.otio')
            obj.to_json_file(str(source))
            result = convert(source, output)
            assert result.returncode == 0, result.stderr
            restored = type(obj).from_json_file(str(output))
            assert json.loads(wire(restored)) == json.loads(wire(obj)), name
            # Detached values and metadata must survive another real file cycle.
            restored.to_json_file(str(work / (name + '-official.otio')))
            count += 1

        source, output = work / 'bad.otio', work / 'must-not-exist.otio'
        for payload in [b'{', b'not json', b'\xff\xfe', b'{"OTIO_SCHEMA":"Clip.2"}']:
            source.write_bytes(payload)
            result = convert(source, output)
            assert result.returncode != 0 and not output.exists(), (payload, result)
        result = convert(work / 'missing.otio', output)
        assert result.returncode != 0 and not output.exists()
        source.write_text(wire(otio.schema.Timeline()), encoding='utf-8')
        result = convert(source, work / 'missing-parent' / 'output.otio')
        assert result.returncode != 0
        output.write_bytes(b'keep existing file')
        result = convert(source, output)
        assert result.returncode != 0 and output.read_bytes() == b'keep existing file'
    print(f'{count} SerializableObject file API roundtrips and 7 host failure cases passed')


if __name__ == '__main__':
    main()
