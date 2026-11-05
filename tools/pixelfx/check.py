"""Portable release gate; GODOT_BIN and PIXELFX_UPSTREAM can override local tools."""
from pathlib import Path
import json, os, re, shutil, subprocess, sys
root = Path(__file__).resolve().parents[2]
godot = os.environ.get('GODOT_BIN') or shutil.which('godot') or '/Applications/Godot.app/Contents/MacOS/Godot'
output = root/'builds/pixelfx'
output.mkdir(parents=True, exist_ok=True)
(root/'builds/.gdignore').touch()

def run(name, args, expected=None):
    print(name + ': running', flush=True)
    try:
        result = subprocess.run(args, cwd=root, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=180)
    except subprocess.TimeoutExpired as error:
        partial = error.stdout or b''
        if isinstance(partial, bytes): partial = partial.decode(errors='replace')
        (output/(name+'.log')).write_text(partial)
        print(partial, flush=True)
        raise SystemExit(name + ': exceeded 180 second limit')
    (output/(name+'.log')).write_text(result.stdout)
    if result.returncode or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', result.stdout) or (expected and expected not in result.stdout):
        print(result.stdout); raise SystemExit(f'{name} failed')
    print(name+': passed', flush=True)
run('import-release', [godot,'--headless','--path',str(root),'--editor','--import','--quit'])
upstream = os.environ.get('PIXELFX_UPSTREAM')
if not upstream:
    upstream = subprocess.check_output([sys.executable,str(root/'tools/pixelfx/fetch_reference.py')], cwd=root, text=True, timeout=180).strip()
# Also verify explicitly supplied upstream directories.
manifest=json.loads((root/'addons/pixelfx/provenance.json').read_text())
import hashlib
for name,digest in manifest['upstream_sha256'].items():
    if hashlib.sha256((Path(upstream)/name).read_bytes()).hexdigest()!=digest: raise SystemExit('Upstream hash mismatch: '+name)
run('reference-release',['node','tools/pixelfx/reference.mjs',upstream], 'Generated')
run('parity-release',[godot,'--headless','--path',str(root),'--script','tests/pixelfx/test_parity.gd'],'failures=0')
run('runtime-release',[godot,'--headless','--path',str(root),'--script','tests/pixelfx/test_runtime.gd'],'failures=0')
run('catalog-release',[godot,'--headless','--path',str(root),'--script','tests/pixelfx/test_catalog.gd'],'failures=0')
run('benchmark-release',[godot,'--headless','--path',str(root),'--script','tests/pixelfx/benchmark.gd'],'PIXELFX_BENCHMARK')
run('editor-release',[sys.executable,'tools/pixelfx/check_editor.py'],'failures=0')
print('PIXELFX_RELEASE_CHECKS_PASSED')
