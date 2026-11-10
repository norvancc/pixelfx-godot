"""Basic native import/load/playback check; deliberately not full acceptance."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess,sys
root=Path(__file__).resolve().parents[2]
godot=os.environ.get('GODOT_BIN') or shutil.which('godot') or '/Applications/Godot.app/Contents/MacOS/Godot'
folder=root/'builds/pixelfx';folder.mkdir(parents=True,exist_ok=True)
log=folder/os.environ.get('PIXELFX_CHECK_LOG','basic-check.log')
check_env={**os.environ,'PIXELFX_SMOKE_PEAK':'1'}
import_log=folder/'basic-import.log'
with import_log.open('w') as output:
 imported=subprocess.run([godot,'--headless','--path',str(root),'--editor','--import','--quit'],cwd=root,stdout=output,stderr=subprocess.STDOUT,timeout=600)
import_text=import_log.read_text()
if imported.returncode or any(line.startswith(('SCRIPT ERROR:','ERROR:')) for line in import_text.splitlines()):
 raise SystemExit('Native import failed; see '+str(import_log))
with log.open('w') as output:
 result=subprocess.run([godot,'--headless','--path',str(root),'--script','tools/pixelfx/smoke_catalog.gd'],cwd=root,stdout=output,stderr=subprocess.STDOUT,timeout=7200,env=check_env)
text=log.read_text()
problems=[line for line in text.splitlines() if line.startswith(('SCRIPT ERROR:','ERROR:','SMOKE_LOAD_FAILED','SMOKE_RESOLVE_FAILED'))]
if result.returncode or problems or 'PIXELFX_CATALOG_SMOKE_PASSED count=192' not in text:
 print('\n'.join(problems[:30]));raise SystemExit('Basic native check failed; see '+str(log))
data={'records':[json.loads(line.split('SMOKE_RESULT ',1)[1]) for line in text.splitlines() if line.startswith('SMOKE_RESULT ')]};data.update({'check_kind':'basic_native_playback_only','full_acceptance':False,'upstream_revision':'a84159688af3ca37a4be05a0d422b94451b2e24e','godot':subprocess.check_output([godot,'--version'],text=True).strip(),'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest()})
paths=[root/"tools/pixelfx/smoke_catalog.gd"]
for row in json.loads((root/'addons/pixelfx/native/catalog.json').read_text()):
 paths.extend([root/row['implementation'],root/'addons/pixelfx/presets'/f"{row['id']}.tres"])
paths.extend(p for p in (root/'addons/pixelfx/native').rglob('*') if p.is_file() and p.suffix in ['.gd','.json'] and p.name!='smoke.json')
data['source_sha256']={p.relative_to(root).as_posix():hashlib.sha256(p.read_bytes()).hexdigest() for p in sorted(set(paths))}
(root/'addons/pixelfx/native/smoke.json').write_text(json.dumps(data,ensure_ascii=False,indent=2)+'\n')
print('PIXELFX_BASIC_CHECK_PASSED count=192 full_acceptance=false')
