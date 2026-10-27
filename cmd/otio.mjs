import {readFile,writeFile,mkdir,readdir,lstat,stat} from 'node:fs/promises';
import {resolve,dirname,join,extname,isAbsolute} from 'node:path';
import {fileURLToPath} from 'node:url';
import {otio} from '../dist/moontimeline.mjs';

const LIMIT=256*1024*1024;
export function call(source,action,options={}) {
  const result=JSON.parse(otio(source,action,JSON.stringify(options)));
  if(result.error) throw new Error(result.error);
  return result.ok;
}
async function boundedRead(path,limit=LIMIT) {
  if((await stat(path)).size>limit) throw new Error('input_limit');
  const bytes=await readFile(path);
  if(bytes.length>limit) throw new Error('input_limit');
  return bytes;
}
const decode=bytes=>new TextDecoder('utf-8',{fatal:true}).decode(bytes);
async function directoryEntries(root) {
  const entries=Object.create(null);let remaining=LIMIT,count=0;
  async function walk(folder,prefix='') {
    for(const entry of await readdir(folder,{withFileTypes:true})) {
      const path=join(folder,entry.name),name=prefix+entry.name;
      if(entry.isSymbolicLink()) throw new Error('bundle_symlink');
      if(entry.isDirectory()) await walk(path,name+'/');
      else if(entry.isFile()) {
        if(++count>10000) throw new Error('bundle_limit');
        const bytes=await boundedRead(path,remaining);remaining-=bytes.length;
        entries[name]=bytes.toString('base64');
      } else throw new Error('unsupported_bundle_entry');
    }
  }
  await walk(root);return entries;
}
async function input(path) {
  const info=await lstat(path);
  if(info.isDirectory()) {
    const bundle=call('','read-directory',await directoryEntries(path));
    return {...bundle,base:resolve(path)};
  }
  if(extname(path).toLowerCase()==='.otioz') return {...call((await boundedRead(path)).toString('base64'),'unpack'),base:null};
  return {source:decode(await boundedRead(path,16000000)),base:dirname(resolve(path)),entries:null};
}
async function mediaFiles(document,policy) {
  const files=Object.create(null);let remaining=LIMIT;
  if(policy==='all-missing') return files;
  for(const url of call(document.source,'media-urls')) {
    const entry=decodeURIComponent(url).replaceAll('\\','/');
    if(document.entries?.[entry]!==undefined) {files[url]=document.entries[entry];continue;}
    if(document.base===null) {if(policy==='error') throw new Error('missing_bundle_media:'+url);continue;}
    let path;
    try {
      if(url.startsWith('file:')) path=fileURLToPath(url);
      else if(isAbsolute(url)) path=url;
      else if(/^[a-z][a-z0-9+.-]*:/i.test(url)) throw new Error('non_file_media');
      else path=resolve(document.base,decodeURIComponent(url));
      const bytes=await boundedRead(path,remaining);remaining-=bytes.length;
      files[url]=bytes.toString('base64');
    } catch(error) {
      if(policy==='error'||!['ENOENT','ENOTDIR'].includes(error.code)&&error.message!=='non_file_media') throw error;
    }
  }
  return files;
}
async function writeDirectory(output,entries) {
  // The MoonBit decoder has validated every path before any file is created.
  await mkdir(output); // Existing destinations are always refused.
  for(const [name,data] of Object.entries(entries)) {
    const path=join(output,...name.split('/'));
    await mkdir(dirname(path),{recursive:true});
    await writeFile(path,Buffer.from(data,'base64'),{flag:'wx'});
  }
}
export async function main(args) {
  const [action,path,...rest]=args;
  if(action==='schemas') {if(path)throw new Error('unexpected_argument');console.log(JSON.stringify(call('','schemas')));return;}
  const options=Object.create(null);
  for(let i=0;i<rest.length;i+=2) {
    const key=rest[i];
    if(!['--output','--policy','--prune','--schema','--start','--duration'].includes(key)||rest[i+1]===undefined||key in options) throw new Error('invalid_option:'+key);
    options[key]=rest[i+1];
  }
  if(!path) throw new Error('missing_input');
  const document=await input(path),output=options['--output'];
  if(action==='unpack') {
    if(!output||!document.entries)throw new Error('unpack_requires_bundle_and_output_directory');
    await writeDirectory(output,document.entries);return;
  }
  if(action==='pack'||(action==='convert'&&['.otioz','.otiod'].includes(extname(output||'').toLowerCase()))) {
    if(!output)throw new Error('missing_output');
    const policy=options['--policy']||'error';
    if(!['error','missing','all-missing'].includes(policy))throw new Error('invalid_media_policy');
    const media=await mediaFiles(document,policy);
    const directory=extname(output).toLowerCase()==='.otiod';
    const result=call(document.source,directory?'directory':'pack',{media,policy});
    if(directory)await writeDirectory(output,result.entries);
    else await writeFile(output,Buffer.from(result.archive,'base64'),{flag:'wx'});
    return;
  }
  if(document.base===null&&Object.keys(document.entries||{}).some(p=>p.startsWith('media/'))) throw new Error('use_unpack_to_preserve_archive_media');
  const result=call(document.source,action,{
    prune:options['--prune']?.split(',')||[],schema:options['--schema']||'',
    ...(options['--start']!==undefined?{start:Number(options['--start'])}:{}),
    ...(options['--duration']!==undefined?{duration:Number(options['--duration'])}:{})
  });
  const text=result.source??JSON.stringify(result);
  if(output)await writeFile(output,text+'\n',{encoding:'utf8',flag:'wx'});
  else console.log(text);
}
