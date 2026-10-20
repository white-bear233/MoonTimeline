import {execFileSync} from 'node:child_process';
import {mkdirSync,copyFileSync} from 'node:fs';
execFileSync('moon',['build','--target','js'],{stdio:'inherit'});
mkdirSync('dist',{recursive:true});
copyFileSync('_build/js/debug/build/bridge/bridge.js','dist/moontimeline.mjs');
