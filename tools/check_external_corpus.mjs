#!/usr/bin/env node
// Verify the reader against OpenTimelineIO's own sample corpus.
// Files are downloaded from a pinned upstream tag so results are reproducible.
import { spawnSync } from 'node:child_process';
import { mkdirSync, existsSync, mkdtempSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { tmpdir } from 'node:os';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const tag = 'v0.18.1';
const base = `https://raw.githubusercontent.com/AcademySoftwareFoundation/OpenTimelineIO/${tag}/tests/sample_data`;
const files = [
  'big_int.otio', 'clip_example.otio', 'effects.otio',
  'generator_reference_test.otio', 'multiple_track.otio', 'multitrack.otio',
  'nested_example.otio', 'preflattened.otio', 'premiere_example.otio',
  'screening_example.otio', 'simple_cut.otio', 'transition.otio',
  'transition_test.otio',
];

const cache = join(tmpdir(), 'moontimeline-corpus', tag);
mkdirSync(cache, { recursive: true });

for (const name of files) {
  const target = join(cache, name);
  if (existsSync(target)) continue;
  const response = await fetch(`${base}/${name}`);
  if (!response.ok) throw new Error(`${name}: HTTP ${response.status}`);
  const body = await response.text();
  const { writeFileSync } = await import('node:fs');
  writeFileSync(target, body);
}

const build = spawnSync(process.execPath, ['tools/build-js.mjs'], { cwd: root, encoding: 'utf8' });
if (build.status !== 0) {
  console.error(build.stderr || build.stdout);
  process.exit(2);
}

function inspect(file) {
  const r = spawnSync(process.execPath, ['cmd/moontimeline.mjs', 'inspect', file], { cwd: root, encoding: 'utf8' });
  let body = null;
  try { body = JSON.parse(r.stdout); } catch { /* not JSON */ }
  return { ok: r.status === 0, body, stderr: (r.stderr || '').trim() };
}

const scratch = mkdtempSync(join(tmpdir(), 'moontimeline-roundtrip-'));
// OTIO numeric extensions now roundtrip without coercion.
const expectedReadFailures = new Set();

const rows = [];
let readable = 0, computable = 0, writable = 0, identical = 0;
for (const name of files) {
  const file = join(cache, name);
  const first = inspect(file);
  const row = { file: name, read: first.ok, compute: false, write: false, same: false, note: '', expectedRejection: false };
  if (!first.ok) {
    row.note = first.stderr || 'unreadable';
    row.expectedRejection = expectedReadFailures.has(name) && row.note.includes('invalid_json');
    rows.push(row);
    continue;
  }
  readable += 1;
  row.compute = first.body && first.body.duration !== null && !first.body.layout_error;
  if (row.compute) computable += 1;
  row.note = first.body?.layout_error || '';
  const expectedCompute = name !== 'nested_example.otio';
  if (row.compute !== expectedCompute || (!expectedCompute && !row.note.startsWith('unsupported_composition_retime:'))) {
    throw new Error(`${name}: unexpected computation status: ${row.note}`);
  }
  const out = join(scratch, `${name}.out.otio`);
  const write = spawnSync(process.execPath, ['cmd/moontimeline.mjs', 'export', file, '--output', out], { cwd: root, encoding: 'utf8' });
  row.write = write.status === 0 && existsSync(out);
  if (row.write) {
    writable += 1;
    const second = inspect(out);
    row.same = second.ok && JSON.stringify(second.body) === JSON.stringify(first.body);
    if (row.same) identical += 1;
  }
  rows.push(row);
}

const mark = (v) => (v ? 'yes' : 'no ');
console.log(`corpus: OpenTimelineIO ${tag} tests/sample_data (${files.length} files)`);
console.log('file'.padEnd(30), 'read', 'compute', 'write', 'same');
for (const r of rows) {
  console.log(r.file.padEnd(30), mark(r.read).padEnd(4), mark(r.compute).padEnd(7), mark(r.write).padEnd(5), mark(r.same).padEnd(4), r.note);
}
console.log(`\nreadable ${readable}/${files.length}  computable ${computable}/${files.length}  writable ${writable}/${files.length}  stable ${identical}/${files.length}`);

if (rows.some(r => r.read ? (!r.write || !r.same) : !r.expectedRejection)) process.exit(1);
console.log('Read/write preservation gate passed; compute means layout returned, not full conformance.');
