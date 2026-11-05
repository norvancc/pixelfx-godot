// Generate independent ground truth from the unmodified, pinned upstream package.
// Usage: node tools/pixelfx/reference.mjs /path/to/node_modules/pixelfx
import fs from 'node:fs';
import path from 'node:path';
import {pathToFileURL} from 'node:url';
const upstream = path.resolve(process.argv[2] || 'node_modules/pixelfx');
const root = path.resolve('builds/pixelfx/reference');
fs.mkdirSync(root,{recursive:true});
const load = p => import(pathToFileURL(path.join(upstream,'src',p)));
const {createFx,createFrame,composite} = await load('core/fx.js');
const {Painter} = await load('core/painter.js');
const M = await load('core/math.js');
const C = await load('core/color.js');
const fireball = await load('fx/fire/fireball.js');
const cases = [];
for(let i=0;i<36;i++) cases.push({name:`loop-${String(i).padStart(2,'0')}`,t:i/30});
for(const [name,options] of Object.entries({flip:{flip:true},rotate:{angle:0.61},'rotate-flip':{angle:-0.41,flip:true},'seed-negative':{seed:-923},'seed-large':{seed:4294967295},radius:{radius:8},speed:{speed:180},light:{light:0},palette:{palette:['#0a1730','#2580cc','#a0eaff','#ffffff']},position:{x:7.3,y:-2.8}})) {
  for(const t of [0,0.37,1.18]) cases.push({name:`${name}-${t}`,t,options});
}
for(const bg of [null,C.hex('#192b3c'),C.hex('#eed4a1')]) cases.push({name:`background-${bg}`,t:0.4,bg});
for(const stopAge of [0,0.1,0.299,0.301]) cases.push({name:`stop-${stopAge}`,t:0.4,stopAge});
cases.push({name:'back-layer',t:0.4,layer:'back'});
function writeFrame(name,f,bg=null){fs.writeFileSync(path.join(root,name+'.rgba'),composite(f,new Uint8ClampedArray(f.w*f.h*4),bg));}
for(const c of cases){
  const fx=createFx(fireball,c.options||{}),f=createFrame(224,224,-112,-112);
  fx.update(c.t);
  if(c.stopAge!==undefined){fx.stop();fx.update(c.stopAge);}
  fx.draw(f,c.layer);
  writeFrame(c.name,f,c.bg??null);
}
const primitiveCases=[];
for(const flip of [false,true]) for(const angle of [0,0.37]){
  const name=`painter-${flip}-${angle}`,f=createFrame(96,96,-48,-48),p=new Painter(f);
  p.place(2,-3,flip,angle);p.fade=0.73;p.lightK=0.8;
  p.rect(-30,-30,15,12,C.hex('#7035bc'),0.6);
  p.line(-35,-5,35,4,C.hex('#ffeecc'));
  p.circle(-20,15,8,C.hex('#ff8c2a'));
  p.disc(-17,13,7,C.hex('#123b92'),0.35);
  p.ellipse(0,20,10,5,C.hex('#99efaa'));
  p.ring(22,20,10,3,C.hex('#ffe166'));
  p.arc(15,-18,12,5,0.3,4.8,C.hex('#3caaff'));
  p.beam(-5,-20,0,-5,4,C.hex('#aaffcc'));
  p.poly([[-38,30],[-30,39],[-42,40]],C.hex('#aaeeff'));
  p.glow(-15,15,15,C.hex('#ffaa33'),0.43);
  p.glowLine(-20,0,20,5,5,C.hex('#66bbff'),0.61);
  p.glowRing(22,20,10,4,C.hex('#ffbb33'),0.35);
  writeFrame(name,f);primitiveCases.push({name,flip,angle});
}
const math = [-2147483648,-123,-1,0,1,5,4294967295].map(seed=>{
 const r=M.rng(seed,77);return {seed,hash:M.hash(seed,77),rng:Array.from({length:12},()=>r.next()*4294967296),noise:M.noise(-1.37,seed),noise2:M.noise2(1.13,-4.17,seed),fbm:M.fbm(1.13,-4.17,seed),tile:M.tileNoise(1.13,-4.17,3,5,seed)};
});
fs.writeFileSync(path.join(root,'cases.json'),JSON.stringify({cases,primitiveCases,math},null,2));
console.log(`Generated ${cases.length} effect + ${primitiveCases.length} painter references from ${upstream}`);
