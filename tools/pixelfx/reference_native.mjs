// Execute pinned upstream independently; generated GDScript is never used as the oracle.
import fs from 'node:fs';import path from 'node:path';import {pathToFileURL} from 'node:url';
const up=path.resolve(process.argv[2]);const root=path.resolve('builds/pixelfx/acceptance');fs.mkdirSync(root,{recursive:true});
const {createFx,createFrame,composite}=await import(pathToFileURL(up+'/src/core/fx.js'));
const {stockActor}=await import(pathToFileURL(up+'/src/core/actor.js'));
const {createAct}=await import(pathToFileURL(up+'/src/core/act.js'));
const catalog=JSON.parse(fs.readFileSync('addons/pixelfx/native/catalog.json'));
const requested=new Set((process.env.PIXELFX_EFFECT??'').split(',').filter(Boolean));
const phase=process.env.PIXELFX_ACCEPTANCE_PHASE??'survey';
const entries=[];
for(const [index,row] of catalog.entries()){
 if(requested.size&&!requested.has(row.source))continue;
 const mod=await import(pathToFileURL(up+'/src/fx/'+row.source+'.js')),D=mod.meta.duration;
 const margin=phase==='b2-extra'?160:32;
 const viewport={w:mod.meta.size[0]+margin*2,h:mod.meta.size[1]+margin*2,ox:-mod.meta.origin[0]-margin,oy:-mod.meta.origin[1]-margin};
 const groups=[{name:'default',options:{},times:phase==='b2-full'?[...Array.from({length:Math.ceil(D*30)},(_,i)=>i/30),D,D+.001]:[0,D*.17,D*.51,D*.97,D,D+.001]}];
 if(['expanded','b2-full','b2-extra'].includes(phase)){
  for(const [name,options] of Object.entries({seed0:{seed:0},negative:{seed:-923},large:{seed:4294967295},palette:{palette:['#180d32','#58c5e0','#ffffff']},dark:{light:0},bright:{light:3},flip:{flip:true},rotate:{angle:.41},position:{x:7.3,y:-2.8}}))groups.push({name,options,times:[D*.17,D*.51,D-.001]});
  for(const [key,value]of Object.entries(mod.meta.options))if(key!=='seed'&&key!=='palette'){
   const bounds={'fire/fire-ring':{reach:[40,160]},'ice/frost-nova':{reach:[40,160]},'holy/divine-shield':{radius:[23,44]}};
   const variants=bounds[row.source]?.[key]??(typeof value==='boolean'?[!value]:typeof value==='number'?[value*.5,value*1.5]:typeof value==='string'?[value.startsWith('#')?'#309070':value]:Array.isArray(value)?value.every(v=>typeof v==='string'&&v.startsWith('#'))?[['#153050','#a0efff','#ffffff']]:value.every(v=>typeof v==='number')?[value.map(v=>v*.5),value.map(v=>v*1.5)]:[]:[]);
   for(const [n,v]of variants.entries())groups.push({name:`option-${key}-${n}`,options:{[key]:v},times:[D*.51]});
  }
 }
 if(phase==='b2-extra'){
  const plain=value=>ArrayBuffer.isView(value)?Array.from(value):Array.isArray(value)?value.map(plain):value&&typeof value==='object'?Object.fromEntries(Object.entries(value).map(([k,v])=>[k,plain(v)])):value;
  const actor=plain(stockActor(1));actor.x+=5;actor.y-=3;
  for(const layer of ['back','front'])groups.push({name:layer,layer,options:{},times:[0,D*.17,D*.51,D-.001,D,D+.001]});
  groups.push({name:'custom-actor',options:{actor},times:[D*.17,D*.51,D-.001]});
  groups.push({name:'stop',options:{},stopAt:D*.17,times:[D*.17,D*.17+.15,D*.17+.301]});
  for(const hz of [30,60,120])groups.push({name:'hz'+hz,options:{},hz,times:[D*.17,D*.51,D-.001]});
  if(mod.meta.loop)groups.push({name:'second-loop',options:{},times:[D-.001,D,D+.001,2*D-.001,2*D,2*D+.001]});
 }
 const entry={...row,index,viewport,groups};
 if(phase==='b2-act'){
  Object.assign(viewport,{w:512,h:384,ox:-208,oy:-240});
  groups.splice(0,groups.length,...[false,true].map(flip=>({name:flip?'act-flip':'act',act:true,options:{flip},times:[0,D*.17,D*.51,D*.97,D,D+.001]})));
 }
 if(phase==='b2-background')groups.splice(0,groups.length,...[0xff20140d,0xff99c8de].map((bg,index)=>({name:'background-'+index,bg,options:{},times:[D*.17,D*.51,D-.001]})));
 for(const group of groups){
  const fx=group.act?createAct(mod,group.options):createFx(mod,group.options);let previous=fx.t;group.cases=[];
  for(const [i,t]of group.times.entries()){
   const dt=t-previous;const updates=[];
   if(group.hz){let remaining=dt;while(remaining>1/group.hz){updates.push(1/group.hz);remaining-=1/group.hz;}updates.push(remaining);}else updates.push(dt);
   for(const step of updates)fx.update(step);previous=t;
   const stop=group.stopAt===t;if(stop)fx.stop();
   const frame=createFrame(viewport.w,viewport.h,viewport.ox,viewport.oy);fx.draw(frame,group.layer);
   const name=phase+'-'+row.id+'-'+group.name+'-'+i;const bytes=composite(frame,new Uint8ClampedArray(frame.w*frame.h*4),group.bg??null);
   fs.writeFileSync(root+'/'+name+'.expected.rgba',bytes);
   const buffer=Buffer.alloc(8);buffer.writeDoubleLE(dt);
   group.cases.push({name,t,update64:[...buffer],...(group.hz?{updates64:updates.map(step=>{const b=Buffer.alloc(8);b.writeDoubleLE(step);return [...b];})}:{}),...(stop?{stop:true}:{})});
  }
 }
 entries.push(entry);
 fs.writeFileSync(root+'/config-'+phase+'.json',JSON.stringify({phase,entries},null,2));
 console.log('REFERENCE_NATIVE',row.source,groups.reduce((n,g)=>n+g.cases.length,0));
}
