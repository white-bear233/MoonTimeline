import {test} from 'node:test';import assert from 'node:assert/strict';import {readFileSync} from 'node:fs';import {run} from '../dist/moontimeline.mjs';
const original=readFileSync('fixtures/valid/gap_clip.otio','utf8');
const call=(s,a='inspect',ti=0,ii=0,at=0,d=0,r=24)=>JSON.parse(run(s,a,ti,ii,at,d,r));
test('size limit and malformed JSON cannot crash the API',()=>{
 for(const s of [' '.repeat(4000001),'['.repeat(100)+']'.repeat(100),'null','[]','{"OTIO_SCHEMA":', '{"x":1,"x":2}'])assert.equal(call(s).code,2);
});
test('120 deterministic split points preserve continuity and total duration',()=>{
 for(let i=1;i<=120;i++){
  const point=i*120/121;const r=call(original,'split',0,1,point,0,24);assert.equal(r.code,0,r.body);
  const parsed=JSON.parse(r.output),pieces=parsed.tracks.children[0].children.slice(1);
  assert.ok(Math.abs(pieces[0].source_range.duration.value+pieces[1].source_range.duration.value-120)<1e-10);
  assert.ok(Math.abs(pieces[1].source_range.start_time.value-(240+point))<1e-10);
  assert.ok(Math.abs(JSON.parse(r.body).duration-7)<1e-10);
 }
 assert.equal(JSON.parse(original).tracks.children[0].children.length,2);
});
test('failed editing returns no output',()=>{
 for(const at of [0,-1,120,Infinity,NaN]){const r=call(original,'split',0,1,at);assert.equal(r.code,2);assert.equal(r.output,null);}
});
