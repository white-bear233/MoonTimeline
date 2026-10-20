"""Deterministic generated OTIO corpus; compare real CLI outputs with official OTIO.
Optional native binary compares Native and JS outputs on identical inputs.
"""
import argparse, json, os, random, subprocess, tempfile
from pathlib import Path
import opentimelineio as otio
p=argparse.ArgumentParser();p.add_argument('--native');a=p.parse_args()
root=Path(__file__).resolve().parents[1]
rng=random.Random(20261020)
def invoke(prefix,args):
 r=subprocess.run(prefix+args,cwd=root,text=True,capture_output=True)
 assert r.returncode==0,(r.stdout,r.stderr)
 return json.loads(r.stdout)
with tempfile.TemporaryDirectory(prefix='moontimeline-corpus-') as directory:
 d=Path(directory)
 for n in range(12):
  rate=rng.choice([24,25,30,24000/1001]);start=rng.randint(0,1000);frames=rng.randint(2,1000)
  rt=otio.opentime.RationalTime;tr=otio.opentime.TimeRange
  clip=otio.schema.Clip(name=f'clip {n}',source_range=tr(rt(start,rate),rt(frames,rate)),media_reference=otio.schema.ExternalReference(target_url='media/测试.mov',available_range=tr(rt(0,rate),rt(start+frames+500,rate))))
  gap=otio.schema.Gap(source_range=tr(rt(0,30),rt(30,30)))
  t=otio.schema.Timeline(name=f'corpus {n}',tracks=[otio.schema.Track(children=[gap,clip]),otio.schema.Track(kind='Audio',children=[otio.schema.Gap(source_range=tr(rt(0,24),rt(12,24)))])])
  source=d/f'{n}.otio';source.write_text(otio.adapters.write_to_string(t,'otio_json'),encoding='utf-8')
  prefixes=[['node','cmd/moontimeline.mjs']]+([[a.native]] if a.native else [])
  summaries=[];exports=[]
  for i,prefix in enumerate(prefixes):
   report=invoke(prefix,['inspect',str(source)]);summaries.append(report)
   assert abs(report['duration']-t.duration().to_seconds())<1e-10
   output=d/f'{n}-{i}-split.otio'
   invoke(prefix,['split',str(source),'--track','0','--clip','1','--at-frame',str(frames/2),'--rate',str(rate),'--output',str(output)])
   result=otio.adapters.read_from_file(str(output));assert len(result.tracks[0])==3
   assert abs(result.duration().to_seconds()-t.duration().to_seconds())<1e-10
   assert abs(result.tracks[0][2].source_range.start_time.value-(start+frames/2))<1e-9
   exports.append(json.loads(output.read_text(encoding='utf-8')))
  if a.native:
   assert summaries[0]==summaries[1]
   assert exports[0]==exports[1]
print('12 OTIO corpus cases passed'+(' with exact JS/Native JSON parity' if a.native else ' (JS + official OTIO)'))
