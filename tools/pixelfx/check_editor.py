"""Run editor plugin save/reload/enable/disable tests in a disposable isolated project."""
from pathlib import Path
import os, re, shutil, subprocess, sys
root=Path(__file__).resolve().parents[2]
godot=os.environ.get('GODOT_BIN') or shutil.which('godot') or '/Applications/Godot.app/Contents/MacOS/Godot'
qa=root/'builds/pixelfx/editor-qa'
for relative in ('addons/pixelfx','tests/pixelfx/editor_probe'):
    shutil.copytree(root/relative,qa/relative,dirs_exist_ok=True)
(qa/'builds/pixelfx').mkdir(parents=True,exist_ok=True)
project='''config_version=5
[application]
config/name="PixelFX Editor QA"
[rendering]
renderer/rendering_method="gl_compatibility"
[editor_plugins]
enabled=PackedStringArray("res://addons/pixelfx/plugin.cfg")
'''
(qa/'project.godot').write_text(project)
result=subprocess.run([godot,'--headless','--path',str(qa),'--editor','--import','--quit'],capture_output=True,text=True)
if result.returncode or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)',result.stdout+result.stderr):
    print(result.stdout+result.stderr);raise SystemExit(1)
(qa/'project.godot').write_text(project.replace('"res://addons/pixelfx/plugin.cfg")','"res://addons/pixelfx/plugin.cfg", "res://tests/pixelfx/editor_probe/plugin.cfg")'))
args=[godot,'--path',str(qa),'--editor']
if '--visible' not in sys.argv:args.insert(1,'--headless')
with (root/'builds/pixelfx/editor-qa.log').open('w') as log:
    process=subprocess.Popen(args,stdout=log,stderr=subprocess.STDOUT,text=True)
    try:
        process.wait(timeout=1800)
    except subprocess.TimeoutExpired:
        process.terminate()
        try:
            process.wait(timeout=10)
        except subprocess.TimeoutExpired:
            process.kill()
            process.wait()
        raise SystemExit('Editor QA timed out; process stopped')
result=subprocess.CompletedProcess(args,process.returncode,(root/'builds/pixelfx/editor-qa.log').read_text())
for name in ['editor-v010.json','editor-preview.png']:
    source=qa/'builds/pixelfx'/name
    if source.exists():shutil.copy2(source,root/'builds/pixelfx'/name)
if result.returncode or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)',result.stdout) or 'PIXELFX_EDITOR_QA checks=' not in result.stdout or 'failures=0' not in result.stdout:
    print(result.stdout);raise SystemExit('Editor QA failed')
print(result.stdout)
