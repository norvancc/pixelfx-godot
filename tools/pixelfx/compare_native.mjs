import fs from 'node:fs';
const dir='builds/pixelfx/acceptance';const phase=process.argv[2]??'survey';const config=JSON.parse(fs.readFileSync(`${dir}/config-${phase}.json`));
const audit=JSON.parse(fs.readFileSync('tests/pixelfx/native_batches/b2-completion.json')).tolerances??{};
const entries=[];let total=0,failed=0,pending=0,exact=0;
for(const row of config.entries){
 const cases=[];
 for(const group of row.groups)for(const sample of group.cases){
  const expected=fs.readFileSync(`${dir}/${sample.name}.expected.rgba`),file=`${dir}/${sample.name}.actual.rgba`;
  if(!fs.existsSync(file)){pending++;continue;}
  const actual=fs.readFileSync(file);if(actual.length!==expected.length)throw Error(sample.name+' byte size');
  let count=0,max=0,sum=0,alpha=0,minX=Infinity,minY=Infinity,maxX=-Infinity,maxY=-Infinity;
  for(let i=0;i<actual.length;i++){const error=Math.abs(actual[i]-expected[i]);if(!error)continue;count++;sum+=error;max=Math.max(max,error);if(i%4===3)alpha++;const px=Math.floor(i/4);const x=px%row.viewport.w+row.viewport.ox,y=Math.floor(px/row.viewport.w)+row.viewport.oy;minX=Math.min(minX,x);minY=Math.min(minY,y);maxX=Math.max(maxX,x);maxY=Math.max(maxY,y);}
  const rect=count?[minX,minY,maxX-minX+1,maxY-minY+1]:[];
  const exception=audit[`${row.source}:${group.name}:${sample.t}`];
  const audited=!!exception&&alpha===0&&count===exception.changed_bytes&&max===exception.max_error&&sum===exception.sum_error&&JSON.stringify(rect)===JSON.stringify(exception.rect);
  const passed=max<=1&&count<=20||audited;total++;if(!passed)failed++;if(!count)exact++;
  cases.push({name:sample.name,t:sample.t,group:group.name,changed_bytes:count,max_error:max,sum_error:sum,alpha_bytes:alpha,rect,passed,...(audited?{audited_exception:exception.reason}:{})});
 }
 entries.push({effect:row.source,cases,passed:cases.length===row.groups.reduce((n,g)=>n+g.cases.length,0)&&cases.every(c=>c.passed)});
}
fs.writeFileSync(`${dir}/comparison-${phase}.json`,JSON.stringify({phase,total,failed,pending,exact,entries},null,2));
console.log(JSON.stringify({phase,total,failed,pending,exact,effects_complete:entries.filter(e=>e.passed).length}));
console.log(entries.filter(e=>e.cases.some(c=>!c.passed)).map(e=>({effect:e.effect,failed:e.cases.filter(c=>!c.passed).map(c=>({name:c.name,changed:c.changed_bytes,max:c.max_error,alpha:c.alpha_bytes}))})).slice(0,25));
if(failed||pending)process.exitCode=1;
