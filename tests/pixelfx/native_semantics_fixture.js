function directNumeric(out,input) {
 for(let i=0;i<4;i++) {
  if(i===1)continue;
  out[i]=Math.sin(input+i)/3;
 }
 let total=0;for(const value of out)total+=value;
 const payload={input,0:7};
 {const input=2;total+=input;}
 for(let i=0;i<2;i++)total+=i;
 for(let i=0;i<2;i++)total-=i;
 total-=payload.input-payload.input+payload['0']-7;
 return [Math.round(-0.5), Math.floor(total*10000), out[1], Math.floor(Math.max(1,total)*1000000),+'6',~4294967295];
}
function directProbe(input) {return directNumeric(new Float32Array(4),input);}
// This is an oracle input for the build-time generator; Godot executes only its generated GDScript.
export function result() {
 const xs=[3,8,13];[xs[0],xs[2]]=[xs[2],xs[0]];
 const trace=[];
 for(let i=0;i<6;i++) {
  switch(i%3) {
   case 0: trace.push([i,'continue']);continue;
   case 1: if(i>0){trace.push([i,'break']);break;}trace.push('unreachable');
   default: trace.push([i,'default']);
  }
  trace.push([i,'tail']);
 }
 const callbacks=[];
 for(let i=0;i<4;i++)callbacks.push(()=>i);
 let shared=0;const add=()=>++shared;
 const glyphs={0:'zero',1:'one'};glyphs['2']='two';
 const map=new Map([['null',null],['zero',0]]);
 const numericKeys=new Map([[Math.floor(2.3),'two'],[NaN,'nan']]);
 let loopKey=0;for(let i=0;i<2;i++)loopKey++;
 return {numberKeys:[numericKeys.get(loopKey),numericKeys.get(NaN)],intrinsic:intrinsicArguments(),readonly:readonlyCallbacks(2),mutable:mutableCallbacks(),direct:directProbe(0.37),mapNumbers:[map.get('missing')<1,map.get('null')<1,map.get('zero')<1],keys:Object.keys(glyphs),glyph:glyphs['1'],xs,trace,iteration:callbacks.map(f=>f()),shared:[add(),add(),shared]};
}
import {lerp} from './core/index.js';

function intrinsicArguments() {
 const inputs=[2,8,0.25,99];
 const value=lerp(inputs.shift(),inputs.shift(),inputs.shift());
 return [value,inputs];
}
function readonlyCallbacks(input) {
 const callbacks=[];
 for(let i=0;i<4;i++)callbacks.push(()=>input+i);
 const {x,y=3}={x:input};
 return [callbacks.map(f=>f()),[x,y].map(v=>v*2)];
}
function mutableCallbacks() {
 let value=1;const read=()=>value;value=4;
 const change=()=>++value;change();
 return read();
}
