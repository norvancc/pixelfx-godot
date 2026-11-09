"""Freeze basic run evidence, allowing an explicit successful recheck to supersede a failed effect."""
from pathlib import Path
import hashlib,json,subprocess,argparse
root=Path(__file__).resolve().parents[2]
parser=argparse.ArgumentParser();parser.add_argument('log',type=Path,nargs='+');args=parser.parse_args()
records={};latest_errors={};attempts={};log_hashes={}
for log in args.log:
 current=None;messages=[];finished=set();log_hashes[log.name]=hashlib.sha256(log.read_bytes()).hexdigest()
 for line in log.read_text().splitlines():
  if line.startswith('SMOKE_START '):current=line.split('SMOKE_START ',1)[1];messages=[]
  elif line.startswith(('SCRIPT ERROR:','ERROR:','SMOKE_LOAD_FAILED','SMOKE_RESOLVE_FAILED')):messages.append(line)
  elif line.startswith('SMOKE_RESULT '):
   row=json.loads(line.split('SMOKE_RESULT ',1)[1]);current=row['effect'];finished.add(current)
   attempts.setdefault(current,[]).append({'log':log.name,'runtime_error_lines':len(messages),'reported_errors':row.get('errors',[])})
   records[current]=row;latest_errors[current]=list(messages)+row.get('errors',[]);messages=[]
 if messages:raise SystemExit('Unattributed/exit errors in '+str(log)+': '+str(messages[:5]))
 if not finished:raise SystemExit('No completed effects in '+str(log))
expected={r['source'] for r in json.loads((root/'addons/pixelfx/native/catalog.json').read_text())}
if set(records)!=expected:raise SystemExit('Incomplete basic-check coverage: '+str(sorted(expected-set(records))))
problems={effect:errors for effect,errors in latest_errors.items() if errors}
if problems:raise SystemExit('Unresolved basic-check failures: '+str(problems))
if any(len(row.get('drawn_at_seconds',[]))<3 for row in records.values()):raise SystemExit('Missing sampled playback time')
paths=[root/'tools/pixelfx/smoke_catalog.gd']
for row in json.loads((root/'addons/pixelfx/native/catalog.json').read_text()):paths.extend([root/row['implementation'],root/'addons/pixelfx/presets'/f"{row['id']}.tres"])
paths.extend(p for p in (root/'addons/pixelfx/native').rglob('*') if p.is_file() and p.suffix in ['.gd','.json'] and p.name!='smoke.json')
report={'check_kind':'basic_native_playback_only','full_acceptance':False,'upstream_revision':'a84159688af3ca37a4be05a0d422b94451b2e24e','environment':{'os':'macOS','cpu':'Apple M4 Pro','godot':subprocess.check_output(['/Applications/Godot.app/Contents/MacOS/Godot','--version'],text=True).strip()},'records':[records[key] for key in sorted(records)],'attempts_rechecked':{key:value for key,value in attempts.items() if len(value)>1},'log_sha256':log_hashes,'source_sha256':{p.relative_to(root).as_posix():hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(paths))}}
(root/'addons/pixelfx/native/smoke.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
print('PIXELFX_BASIC_REPORT_RECORDED effects=192 full_acceptance=false')
