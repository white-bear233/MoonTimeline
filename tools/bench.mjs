#!/usr/bin/env node
// Scale benchmark: synthetic timelines with many clips through the shipped CLI.
// Subprocess output is discarded so wall time reflects work, not terminal IO.
import { spawnSync } from 'node:child_process';
import { writeFileSync, rmSync, mkdirSync, statSync } from 'node:fs';
import { join, dirname } from 'node:path';
import { tmpdir } from 'node:os';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const scratch = join(tmpdir(), 'moontimeline-bench');
mkdirSync(scratch, { recursive: true });

function clipJson(i) {
  return `{"OTIO_SCHEMA":"Clip.2","metadata":{},"name":"c${i}","source_range":{"OTIO_SCHEMA":"TimeRange.1","duration":{"OTIO_SCHEMA":"RationalTime.1","rate":24.0,"value":48.0},"start_time":{"OTIO_SCHEMA":"RationalTime.1","rate":24.0,"value":${i * 48}}},"effects":[],"markers":[],"enabled":true,"color":null,"media_references":{"DEFAULT_MEDIA":{"OTIO_SCHEMA":"ExternalReference.1","metadata":{},"name":"","available_range":null,"available_image_bounds":null,"target_url":"media/${i}.mov"}},"active_media_reference_key":"DEFAULT_MEDIA"}`;
}

function timelineJson(totalClips, tracks = 10) {
  const perTrack = Math.ceil(totalClips / tracks);
  const trackJson = (t) => {
    const clips = [];
    for (let i = 0; i < perTrack; i += 1) clips.push(clipJson(t * perTrack + i));
    return `{"OTIO_SCHEMA":"Track.1","metadata":{},"name":"V${t}","source_range":null,"effects":[],"markers":[],"enabled":true,"color":null,"kind":"Video","children":[${clips.join(',')}]}`;
  };
  const tracksJson = [];
  for (let t = 0; t < tracks; t += 1) tracksJson.push(trackJson(t));
  return `{"OTIO_SCHEMA":"Timeline.1","metadata":{},"name":"bench","global_start_time":null,"tracks":{"OTIO_SCHEMA":"Stack.1","metadata":{},"name":"tracks","source_range":null,"effects":[],"markers":[],"enabled":true,"color":null,"children":[${tracksJson.join(',')}]}}`;
}

function run(args) {
  const start = process.hrtime.bigint();
  const r = spawnSync(process.execPath, ['cmd/moontimeline.mjs', ...args], { cwd: root, stdio: 'ignore' });
  const ms = Number(process.hrtime.bigint() - start) / 1e6;
  return { ms, status: r.status };
}

const build = spawnSync(process.execPath, ['tools/build-js.mjs'], { cwd: root, stdio: 'ignore' });
if (build.status !== 0) {
  console.error('build failed');
  process.exit(2);
}

const sizes = process.argv.slice(2).map(Number).filter((n) => n > 0);
const targets = sizes.length ? sizes : [1000, 5000, 10000, 20000];
const baselineFile = join(scratch, 'empty.otio');
writeFileSync(baselineFile, timelineJson(0, 1));
const baseline = run(['inspect', baselineFile]).ms;

const rows = [];
for (const total of targets) {
  const file = join(scratch, `bench-${total}.otio`);
  writeFileSync(file, timelineJson(total));
  const bytes = statSync(file).size;
  const inspect = run(['inspect', file]);
  const validate = run(['validate', file]);
  const out = join(scratch, `bench-${total}.out.otio`);
  rmSync(out, { force: true });
  const exported = run(['export', file, '--output', out]);
  rows.push({
    clips: total,
    mb: (bytes / 1048576).toFixed(1),
    parse: Math.max(0, inspect.ms - baseline).toFixed(0),
    validate: Math.max(0, validate.ms - baseline).toFixed(0),
    export: Math.max(0, exported.ms - baseline).toFixed(0),
    ok: inspect.status === 0 && validate.status === 0 && exported.status === 0,
  });
  rmSync(out, { force: true });
}

console.log(`baseline (empty timeline, process startup): ${baseline.toFixed(0)} ms\n`);
console.log('clips'.padEnd(8), 'size(MB)'.padEnd(9), 'inspect(ms)'.padEnd(13), 'validate(ms)'.padEnd(13), 'export(ms)'.padEnd(11), 'ok');
for (const r of rows) {
  console.log(
    String(r.clips).padEnd(8),
    String(r.mb).padEnd(9),
    String(r.parse).padEnd(13),
    String(r.validate).padEnd(13),
    String(r.export).padEnd(11),
    r.ok ? 'yes' : 'no',
  );
}
console.log('\nWall-clock times include JSON file IO and exclude process startup.');
