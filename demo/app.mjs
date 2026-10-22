import {run} from '../dist/moontimeline.mjs';
const $=id=>document.getElementById(id);
let source='', selected=null, history=[], description=null;
function status(text,error=false){$('status').textContent=text;$('status').className=error?'error':'';}
function call(action,track=0,item=0,at=0,duration=0){const r=JSON.parse(run(source,action,track,item,at,duration,1,''));if(r.code===2)throw new Error(JSON.parse(r.body).error);return r;}
function node(tag,text,cls){const e=document.createElement(tag);e.textContent=text;if(cls)e.className=cls;return e;}
function render(){
 const d=description=JSON.parse(call('inspect').body);$('title').textContent=d.name||'未命名工程';$('duration').textContent=d.duration===null?'时长未知':`${d.duration.toFixed(3)} 秒`;
 $('counts').textContent=`${d.tracks.length} 条轨道 / ${d.items.length} 个片段`;$('health').textContent=d.issues.length?`${d.issues.length} 条诊断`:'检查通过';$('timeline').replaceChildren();
 const ruler=node('div','','ruler');for(let i=0;i<=5;i++)ruler.append(node('span',`${((d.duration||0)*i/5).toFixed(1)}s`));$('timeline').append(ruler);
 d.tracks.forEach((t,ti)=>{const row=node('div','','track');row.append(node('div',`${t.name||'Track '+ti} · ${t.kind}`,'track-label'));const lane=node('div','','lane');
 d.items.filter(p=>p.track===ti).forEach(p=>{const b=node('button',p.name||(p.kind==='gap'?'空白':'未命名片段'),`clip ${p.kind}`);b.style.left=`${p.start/(d.duration||1)*100}%`;b.style.width=`${Math.max((p.end-p.start)/(d.duration||1)*100,.2)}%`;b.setAttribute('aria-label',`选择轨道 ${ti} 片段 ${p.index} ${p.name||p.kind}`);b.append(node('small',`${p.start.toFixed(2)} → ${p.end.toFixed(2)}s`));b.onclick=()=>select(p,b);lane.append(b);});row.append(lane);$('timeline').append(row);});
 if(d.layout_error)$('timeline').append(node('p',`无法布局：${d.layout_error}`));
 $('issues').replaceChildren();for(const i of d.issues)$('issues').append(node('li',`${i.severity.toUpperCase()} · ${i.message} ${i.path}`));if(!d.issues.length)$('issues').append(node('li','未发现错误。媒体文件存在性不在本次检查范围内。'));
 $('json').value=source;$('download').disabled=false;$('undo').disabled=!history.length;selected=null;for(const a of ['split','trim','gap'])$(a).disabled=true;$('selection').textContent='点击时间线选择片段';$('source').textContent='素材时间与轨道时间分别显示。';
}
function select(p,b){selected=p;document.querySelectorAll('.clip').forEach(x=>x.classList.remove('selected'));b.classList.add('selected');$('selection').textContent=`轨道 ${p.track} / 片段 ${p.index} · ${p.name||'空白'}`;$('source').textContent=`轨道 ${p.start}–${p.end} 秒 · 素材起点 ${p.source_start} 秒`;for(const a of ['split','trim','gap'])$(a).disabled=false;}
function load(text){const r=JSON.parse(run(text,'inspect',0,0,0,0,1));if(r.code!==0)throw new Error(JSON.parse(r.body).error);source=text;history=[];render();status('工程已载入，检查完成。');}
$('example').onclick=async()=>{try{const r=await fetch('../fixtures/valid/gap_clip.otio');if(!r.ok)throw new Error('示例加载失败');load(await r.text());}catch(e){status(e.message,true);}};
$('file').onchange=async e=>{try{const f=e.target.files[0];if(!f)return;if(f.size>16000000)throw new Error('文件超过 16 MB');load(await f.text());}catch(e){status(e.message,true);}};
$('load').onclick=()=>{try{load($('json').value);}catch(e){status(e.message,true);}};
for(const action of ['split','trim','gap'])$(action).onclick=()=>{try{if(!selected)return;const at=Number($('offset').value),duration=Number($('length').value);if(!Number.isFinite(at)||!Number.isFinite(duration))throw new Error('请输入有效秒数');const r=call(action,selected.track,selected.index,at,duration);history.push(source);if(history.length>30)history.shift();source=r.output;render();status('编辑完成。可以撤销或下载新的 OTIO 工程。');}catch(e){status(e.message,true);}};
$('undo').onclick=()=>{if(history.length){source=history.pop();render();status('已撤销上一次编辑。');}};
$('download').onclick=()=>{try{const r=call('export');const url=URL.createObjectURL(new Blob([r.output],{type:'application/json'}));const a=document.createElement('a');a.href=url;a.download='moontimeline.otio';a.click();setTimeout(()=>URL.revokeObjectURL(url),1000);status('已生成 OTIO 下载文件。');}catch(e){status(e.message,true);}};
