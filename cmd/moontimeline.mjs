#!/usr/bin/env node
import {readFile,writeFile,stat} from 'node:fs/promises';
import {run,parse} from '../dist/moontimeline.mjs';
const args=process.argv.slice(2);
if(['convert','pack','unpack','flatten','filter','find','trim-range','expand-transitions','schemas'].includes(args[0])) {
 try { await (await import('./otio.mjs')).main(args); }
 catch(e) {console.error(JSON.stringify({error:e.message}));process.exitCode=2;}
} else {
if(args.length===1 && ['--help','-h'].includes(args[0])) { console.log('moontimeline inspect|validate|export|split|trim|gap|convert|pack|unpack|flatten|filter|find|trim-range|expand-transitions INPUT [--output FILE] [--track N --clip N --at-frame N --duration-frames N --rate FPS] [--format json]');process.exit(0); }
try {
 const c=JSON.parse(parse(args)); if(c.error) throw new Error(c.error);
 if((await stat(c.input)).size>16000000) throw new Error('Input exceeds 16 MB');
 const source=new TextDecoder('utf-8',{fatal:true}).decode(await readFile(c.input));
 const r=JSON.parse(run(source,c.action,c.track,c.item,c.at,c.duration,c.rate,c.path||''));
 if(r.output!==null) await writeFile(c.output,r.output+'\n',{encoding:'utf8',flag:'wx'});
 (r.code===2?console.error:console.log)(r.body);process.exitCode=r.code;
} catch(e) {console.error(JSON.stringify({error:e.message}));process.exitCode=2;}
}
