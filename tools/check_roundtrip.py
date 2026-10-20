"""Run the real MoonBit writer and read its output with official OTIO."""
import argparse, json, subprocess
from pathlib import Path
import opentimelineio as otio
p=argparse.ArgumentParser();p.add_argument('--target',default='js');args=p.parse_args()
root=Path(__file__).resolve().parents[1]
s=subprocess.check_output(['moon','run','examples/roundtrip','--target',args.target],cwd=root,text=True)
t=otio.adapters.read_from_string(s,'otio_json')
assert t.duration().to_seconds()==7
assert t.tracks[0][1].source_range.start_time.to_seconds()==10
assert t.tracks[0].range_of_child_at_index(1).start_time.to_seconds()==2
assert json.loads(s)==json.loads((root/'fixtures/valid/gap_clip.otio').read_text())
assert json.loads(otio.adapters.write_to_string(t,'otio_json'))==json.loads(s)
print('MoonBit -> OTIO -> JSON: complete fixture semantic roundtrip passed')
