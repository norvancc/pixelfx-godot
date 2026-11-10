"""Re-run the existing accepted pixel/runtime/soak contracts after shared rasterizer changes."""
from pathlib import Path
import argparse
import os
import re
import shutil
import subprocess
import sys

ROOT=Path(__file__).resolve().parents[2]
BUILD=ROOT/'builds/pixelfx'

def main():
 parser=argparse.ArgumentParser();parser.add_argument('upstream',type=Path);parser.add_argument('--start-at',help='Resume a serial regression at a named stage after inspecting earlier successful logs');args=parser.parse_args()
 active=not args.start_at
 godot=os.environ.get('GODOT_BIN') or shutil.which('godot') or '/Applications/Godot.app/Contents/MacOS/Godot'
 def run(name,command,expected=None,env=None):
  nonlocal active
  if name==args.start_at:active=True
  if not active:return
  print(name+': running',flush=True)
  with (BUILD/(name+'.log')).open('w') as log:
   result=subprocess.run(command,cwd=ROOT,env=env,stdout=log,stderr=subprocess.STDOUT,text=True,timeout=2100)
  text=(BUILD/(name+'.log')).read_text()
  if result.returncode or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)',text) or expected and expected not in text:raise SystemExit(name+': failed')
  print(name+': passed',flush=True)
 base=[godot,'--headless','--path',str(ROOT),'--script']
 for label,reference,test in [('release','reference.mjs','test_parity.gd'),('b1','reference_b1.mjs','test_b1_parity.gd'),('b2','reference_b2.mjs','test_b2_parity.gd')]:
  run('reference-'+label,['node','tools/pixelfx/'+reference,str(args.upstream)],'Generated')
  run('parity-'+label,base+['tests/pixelfx/'+test],'failures=0')
  for phase in ['runtime']+(['catalog'] if label!='b1' else [])+(['soak'] if label!='release' else []):
   name='test_'+(label+'_' if label!='release' else '')+phase+'.gd'
   run(phase+'-'+label,base+['tests/pixelfx/'+name],'failures=0')
 import json
 for config_path in sorted((ROOT/'tests/pixelfx/batches').glob('*.json')):
  config=json.loads(config_path.read_text());label=config['id'];env={**os.environ,'PIXELFX_BATCH':label,'PIXELFX_EFFECT':''}
  run('reference-'+label,['node','tools/pixelfx/reference_batch.mjs',str(args.upstream),str(config_path)],'Generated',env)
  for phase in ['parity','runtime','catalog','soak']:run(phase+'-'+label,base+['tests/pixelfx/test_batch_'+phase+'.gd'],'failures=0',env)
 run('benchmark-release',base+['tests/pixelfx/benchmark.gd'],'PIXELFX_BENCHMARK')
 run('editor-release',[sys.executable,'tools/pixelfx/check_editor.py'],'failures=0')
 if not active:raise SystemExit('Unknown start stage: '+args.start_at)
 print('PIXELFX_ACCEPTED_REGRESSION_PASSED',flush=True)

if __name__=='__main__':main()
