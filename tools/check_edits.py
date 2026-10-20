"""Validate actual MoonBit edited exports using official OpenTimelineIO."""
import argparse, json, subprocess
from pathlib import Path
import opentimelineio as otio
p=argparse.ArgumentParser();p.add_argument('--target',default='js');a=p.parse_args()
root=Path(__file__).resolve().parents[1]
lines=subprocess.check_output(['moon','run','examples/edit','--target',a.target],cwd=root,text=True).splitlines()
assert len(lines)==3
split,trim,gap=[otio.adapters.read_from_string(s,'otio_json') for s in lines]
assert split.duration().to_seconds()==7
assert len(split.tracks[0])==3
left,right=split.tracks[0][1:3]
assert left.source_range.start_time.to_seconds()==10
assert left.source_range.end_time_exclusive().to_seconds()==12
assert right.source_range.start_time.to_seconds()==12
assert right.source_range.end_time_exclusive().to_seconds()==15
assert dict(left.metadata)==dict(right.metadata)
assert trim.duration().to_seconds()==4
assert trim.tracks[0][1].source_range.start_time.to_seconds()==11
assert trim.tracks[0][1].source_range.duration.to_seconds()==2
assert gap.duration().to_seconds()==8
assert gap.tracks[0].range_of_child_at_index(2).start_time.to_seconds()==3
for source,t in zip(lines,[split,trim,gap]):
    assert json.loads(otio.adapters.write_to_string(t,'otio_json'))==json.loads(source)
print('Official OTIO verified split, ripple trim, gap insertion and full JSON roundtrips')
