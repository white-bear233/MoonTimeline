import {test} from 'node:test';
import assert from 'node:assert/strict';
import {spawnSync} from 'node:child_process';
import {mkdtempSync,readFileSync,writeFileSync,rmSync} from 'node:fs';
import {tmpdir} from 'node:os';
import {join,resolve} from 'node:path';
const native=process.env.MOONTIMELINE_NATIVE;
const cli=(...args)=>spawnSync(native||process.execPath,[...(native?[]:['cmd/moontimeline.mjs']),...args],{encoding:'utf8'});
const fixture='fixtures/valid/gap_clip.otio';
test('inspect and validation return real data',()=>{
 let r=cli('inspect',fixture);assert.equal(r.status,0,r.stderr||r.stdout);assert.equal(JSON.parse(r.stdout).duration,7);
 assert.equal(cli('validate',fixture).status,0);
});
test('file roundtrip split and overwrite protection',()=>{
 const d=mkdtempSync(join(tmpdir(),'moontimeline-'));try{
  const out=join(d,'split.otio');let r=cli('split',fixture,'--track','0','--clip','1','--at-frame','48','--rate','24','--output',out);
  assert.equal(r.status,0,r.stderr||r.stdout);assert.equal(JSON.parse(readFileSync(out)).tracks.children[0].children.length,3);
  assert.equal(cli('validate',out).status,0);
  const before=readFileSync(out,'utf8');assert.equal(cli('export',fixture,'--output',out).status,2);assert.equal(readFileSync(out,'utf8'),before);
  const invalidUtf8=join(d,'invalid-utf8.otio');writeFileSync(invalidUtf8,Buffer.from([0xff,0xfe,0xff]));assert.equal(cli('inspect',invalidUtf8).status,2);
  const bad=join(d,'bad.otio');const t=JSON.parse(readFileSync(fixture));t.tracks.children[0].children[1].source_range.duration.value=9999;writeFileSync(bad,JSON.stringify(t));assert.equal(cli('validate',bad).status,1);
 }finally{rmSync(d,{recursive:true,force:true});}
});
test('invalid input and arguments exit 2',()=>{
 for(const args of [['inspect','missing.otio'],['inspect','fixtures/invalid/malformed.otio'],['inspect','fixtures'],['export',fixture],['split',fixture,'--rate','NaN'],['inspect',fixture,'--oops','x']])assert.equal(cli(...args).status,2);
});
test('preserved transition stays readable',()=>{
 const r=cli('inspect','fixtures/unsupported/transition.otio');assert.equal(r.status,0,r.stderr||r.stdout);
 const body=JSON.parse(r.stdout);assert.equal(body.duration,4);
 assert.ok(body.issues.some(i=>i.code==='transition'));
 assert.equal(body.transitions.length,1);
 assert.ok(Math.abs(body.transitions[0].start-1.5)<1e-10);
 assert.ok(Math.abs(body.transitions[0].end-2.5)<1e-10);
});

test('path addressing edits items and tracks',()=>{
 const d=mkdtempSync(join(tmpdir(),'moontimeline-path-'));
 try{
  const trimmed=join(d,'trim.otio');
  let r=cli('trim',fixture,'--path','/tracks/children/0/children/1','--at-frame','24','--duration-frames','48','--rate','24','--output',trimmed);
  assert.equal(r.status,0,r.stderr||r.stdout);
  assert.equal(JSON.parse(readFileSync(trimmed)).tracks.children[0].children.length,2);
  const trackTrim=join(d,'track.otio');
  r=cli('trim',fixture,'--path','/tracks/children/0','--at-frame','24','--duration-frames','72','--rate','24','--output',trackTrim);
  assert.equal(r.status,0,r.stderr||r.stdout);
  const played=cli('inspect',trackTrim);
  assert.equal(JSON.parse(played.stdout).duration,3);
 }finally{rmSync(d,{recursive:true,force:true});}
});
