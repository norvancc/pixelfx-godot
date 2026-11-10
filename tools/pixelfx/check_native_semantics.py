"""Fast generator regression oracle; no pixel/reference checkout is required."""
from pathlib import Path
import os
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BUILD = ROOT / 'builds/pixelfx'
BUILD.mkdir(parents=True, exist_ok=True)
env = dict(os.environ, PIXELFX_CODEGEN_FIXTURE='tests/pixelfx/native_semantics_fixture.js')
subprocess.run(['node', 'tools/pixelfx/codegen/generate.mjs'], cwd=ROOT, env=env, check=True)
subprocess.run(['node', '--input-type=module', '-e',
    "import fs from 'node:fs';import {result} from './tests/pixelfx/native_semantics_fixture.js';"
    "fs.writeFileSync('builds/pixelfx/native-semantics-expected.json',JSON.stringify(result()));"], cwd=ROOT, check=True)
subprocess.run(['node', '--input-type=module', '-e',
    "import fs from 'node:fs';let state=7;const rows=[];for(let i=0;i<2048;i++){"
    "state=(Math.imul(state,1664525)+1013904223)>>>0;const k=.001+(state/4294967296)*.999;"
    "const input=Buffer.alloc(8),expected=Buffer.alloc(8);input.writeDoubleLE(k);expected.writeDoubleLE(Math.pow(k,1.3));"
    "rows.push({input:input.toString('hex'),expected:expected.toString('hex')});}"
    "fs.writeFileSync('builds/pixelfx/decay-expected.json',JSON.stringify(rows));"], cwd=ROOT, check=True)
godot = os.environ.get('GODOT_BIN') or shutil.which('godot') or '/Applications/Godot.app/Contents/MacOS/Godot'
parsed = subprocess.run([godot, '--headless', '--path', str(ROOT), '--check-only', '--script', 'tests/pixelfx/test_native_semantics.gd'],
                        cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=30)
if parsed.returncode or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', parsed.stdout):
    print(parsed.stdout)
    raise SystemExit('Native semantic scripts did not compile')
result = subprocess.run([godot, '--headless', '--path', str(ROOT), '--script', 'tests/pixelfx/test_native_semantics.gd'],
                        cwd=ROOT, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=60)
(BUILD / 'native-semantics.log').write_text(result.stdout)
print(result.stdout)
if result.returncode or 'NATIVE_SEMANTICS passed=true' not in result.stdout or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', result.stdout):
    raise SystemExit('Native semantic regression failed')
