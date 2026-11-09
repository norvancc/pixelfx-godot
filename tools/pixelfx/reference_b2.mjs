// Independent RGBA references, executing only the hash-pinned upstream modules.
import fs from 'node:fs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
const upstream=path.resolve(process.argv[2]);
const load=p=>import(pathToFileURL(path.join(upstream,'src',p)));
const {createFx,createFrame,composite}=await load('core/fx.js');
const C=await load('core/color.js');
const root=path.resolve('builds/pixelfx/reference-b2');fs.mkdirSync(root,{recursive:true});
const cases=[];
for(const {id,source,limits} of JSON.parse(fs.readFileSync('tests/pixelfx/b2_effects.json','utf8'))) {
 const mod=await load(`fx/${source}.js`),D=mod.meta.duration;
 const add=(suffix,t,options={},extra={})=>cases.push({name:`${id}-${suffix}`,id,source,t,options,...extra});
 for(let i=0;i<Math.ceil(D*30);i++)add(`cycle-${i}`,i/30);
 for(const [name,options] of Object.entries({seed0:{seed:0},negative:{seed:-923},large:{seed:4294967295},palette:{palette:['#180d32','#58c5e0','#ffffff']},dark:{light:0},bright:{light:3},flip:{flip:true},rotate:{angle:0.41},position:{x:7.3,y:-2.8},...Object.fromEntries(Object.entries(limits).flatMap(([k,[min,max]])=>[[`${k}-min`,{[k]:min}],[`${k}-max`,{[k]:max}]]))}))
  for(const t of [0,D*.17,D*.51,D-.001])add(`${name}-${t}`,t,options);
 for(const key of Object.keys(mod.meta.options).filter(k=>!['palette','seed',...Object.keys(limits)].includes(k))){
  const v=mod.meta.options[key],variant=Array.isArray(v)?['#153050','#a0efff','#ffffff']:typeof v==='boolean'?!v:typeof v==='string'?'#309070':null;
  if(variant!==null)add(`option-${key}`,D*.17,{[key]:variant});
 }
 for(const layer of ['front','back'])for(const f of [.01,.17,.51,.97])add(`${layer}-${f}`,D*f,{}, {layer});
 for(const t of [D-1e-6,D,D+1e-6])add(`end-${t}`,t);
 for(const stopAge of [0,.1,.299,.301])add(`stop-${stopAge}`,D*.17,{}, {stopAge});
 for(const bg of [C.hex('#192b3c'),C.hex('#eed4a1')])add(`bg-${bg}`,D*.17,{}, {bg});
 for(const hz of [30,60,120])add(`steps-${hz}`,D*.51,{}, {hz});
 for(const c of cases.filter(c=>c.id===id)){
  const fx=createFx(mod,c.options),f=createFrame(512,384,-256,-288);
  c.updates=c.hz?Array.from({length:Math.floor(c.t*c.hz)},()=>1/c.hz):[c.t];
  if(c.hz && c.t-c.updates.length/c.hz>1e-12)c.updates.push(c.t-c.updates.length/c.hz);
  for(const dt of c.updates)fx.update(dt);
  if(c.stopAge!==undefined){fx.stop();fx.update(c.stopAge);}
  fx.draw(f,c.layer);
  fs.writeFileSync(path.join(root,c.name+'.rgba'),composite(f,new Uint8ClampedArray(f.w*f.h*4),c.bg??null));
  c.updates64=c.updates.map(dt=>{const b=Buffer.alloc(8);b.writeDoubleLE(dt);return [...b];});
 }
}
fs.writeFileSync(path.join(root,'cases.json'),JSON.stringify({cases},null,2));
console.log(`Generated ${cases.length} B2 references`);
