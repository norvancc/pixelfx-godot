"""Refresh shared-source hashes only after reproducing the accepted 52-effect contracts.

Historical visual/CI evidence keeps its original date and scope. This records a
new local regression; it does not claim that historical CI ran on current code.
"""
from datetime import datetime, timezone
from pathlib import Path
import hashlib
import json
import re

ROOT=Path(__file__).resolve().parents[2]
BUILD=ROOT/'builds/pixelfx'

def digest(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def read(name):return json.loads((BUILD/name).read_text())
def main():
 snapshot=read('current-gate-sources.json')
 artifacts={}
 stages=['reference-release','parity-release','runtime-release','catalog-release',
         'reference-b1','parity-b1','runtime-b1','soak-b1',
         'reference-b2','parity-b2','runtime-b2','catalog-b2','soak-b2',
         'reference-b2-elements','parity-b2-elements','runtime-b2-elements','catalog-b2-elements','soak-b2-elements',
         'reference-b2-simulations','parity-b2-simulations','runtime-b2-simulations','catalog-b2-simulations','soak-b2-simulations',
         'benchmark-release','editor-release']
 for stage in stages:
  path=BUILD/(stage+'.log');text=path.read_text()
  if re.search(r'(?m)(SCRIPT ERROR:|ERROR:)',text):raise SystemExit('Engine error in '+stage)
  marker='Generated' if stage.startswith('reference-') else 'PIXELFX_BENCHMARK' if stage=='benchmark-release' else 'failures=0'
  if marker not in text:raise SystemExit('Incomplete '+stage)
  artifacts[path.relative_to(ROOT).as_posix()]=digest(path)
 total=0
 for filename,count in [('parity.json',447),('parity-b1.json',809),('parity-b2.json',2607),('parity-b2-elements.json',1052),('parity-b2-simulations.json',2166)]:
  report=read(filename)
  if report.get('failures') or len(report['cases'])!=count:raise SystemExit('Parity scope mismatch: '+filename)
  total+=count
  path=BUILD/filename;artifacts[path.relative_to(ROOT).as_posix()]=digest(path)
 editor=read('editor-v010.json')
 if editor.get('failures') or editor['checks']!=979:raise SystemExit('Full 244-effect editor regression did not pass')
 editor_log=BUILD/'editor-qa.log'
 if re.search(r'(?m)(SCRIPT ERROR:|ERROR:)',editor_log.read_text()):raise SystemExit('Editor engine errors')
 artifacts[editor_log.relative_to(ROOT).as_posix()]=digest(editor_log)
 for label in ['b1','b2','b2-elements','b2-simulations']:
  path=ROOT/'addons/pixelfx/validation'/(label+'.json');report=json.loads(path.read_text());changes={}
  for name,previous in report['source_sha256'].items():
   current=digest(ROOT/name)
   if current==previous:continue
   if snapshot.get(name)!=current:raise SystemExit('Source changed after regression began: '+name)
   if name not in ['addons/pixelfx/core/frame.gd','addons/pixelfx/editor/preview_dock.gd','addons/pixelfx/runtime/renderer.gd']:
    raise SystemExit('Unreviewed accepted implementation change: '+name)
   changes[name]={'previous_sha256':previous,'current_sha256':current}
   report['source_sha256'][name]=current
  report['local_shared_source_regression']={
   'verified_at':datetime.now(timezone.utc).isoformat(),
   'environment':read('runtime-b2.json')['environment'],
   'pixel_cases':total,'editor_checks':editor['checks'],'changes':changes,
   'artifact_sha256':artifacts,
   'scope':'Current shared frame/renderer/Inspector changes; historical visual and Linux CI evidence retains its original scope.'}
  path.write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
 print('PIXELFX_ACCEPTED_HASHES_REFRESHED cases='+str(total)+' editor_checks='+str(editor['checks']))
if __name__=='__main__':main()
