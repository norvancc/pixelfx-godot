// Same sampled workload as benchmark_native.gd, without Godot texture upload.
import fs from 'node:fs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
import {performance} from 'node:perf_hooks';
const upstream=path.resolve(process.argv[2]);
const {createFx,createFrame,clearFrame,composite}=await import(pathToFileURL(upstream+'/src/core/fx.js'));
const config=JSON.parse(fs.readFileSync('builds/pixelfx/acceptance/config-b2-full.json'));
const records=[];
for(const row of config.entries){
 const mod=await import(pathToFileURL(upstream+'/src/fx/'+row.source+'.js'));
 const size=mod.meta.size,origin=mod.meta.origin;
 const frames=row.meta.layers.map(layer=>({layer,frame:createFrame(size[0]+192,size[1]+192,-origin[0]-96,-origin[1]-96),out:new Uint8ClampedArray((size[0]+192)*(size[1]+192)*4)}));
 const fx=createFx(mod);
 const draw=()=>{for(const entry of frames){clearFrame(entry.frame);fx.draw(entry.frame,entry.layer);composite(entry.frame,entry.out);}};
 draw();fx.update(mod.meta.duration*.17);
 const samples=[];
 for(let i=0;i<12;i++){const start=performance.now();fx.update(1/30);draw();samples.push(performance.now()-start);}
 const sorted=samples.toSorted((a,b)=>a-b);
 records.push({effect:row.source,total_ms:samples,p50_ms:sorted[6],p95_ms:sorted[11]});
}
const report={environment:{runtime:process.version,cpu:'Apple M4 Pro',os:process.platform},method:'Pinned upstream JS; same 12 update/draw/composite samples and padded front/back canvases as native measurement. No Godot texture upload or scene presentation.',records};
fs.writeFileSync('builds/pixelfx/acceptance/performance-b2-upstream.json',JSON.stringify(report,null,2)+'\n');
for(const row of records)console.log(row.effect,'p50_ms='+row.p50_ms.toFixed(3),'p95_ms='+row.p95_ms.toFixed(3));
