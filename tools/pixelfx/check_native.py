"""Reproduce pending native-port checks without declaring full visual/performance acceptance."""
from pathlib import Path
import argparse
import json
import os
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[2]
PINNED = 'a84159688af3ca37a4be05a0d422b94451b2e24e'
BUILD = ROOT / 'builds/pixelfx'


def run(name, command, env):
    print(name + ': running', flush=True)
    with (BUILD / (name + '.log')).open('w') as output:
        process = subprocess.Popen(command, cwd=ROOT, env=env, text=True, stdout=output,
                                   stderr=subprocess.STDOUT)
        try:
            process.wait(timeout=7200)
        except subprocess.TimeoutExpired:
            process.terminate()
            try:
                process.wait(timeout=10)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait()
            raise SystemExit(name + ': timed out; process stopped')
    result = subprocess.CompletedProcess(command, process.returncode, (BUILD / (name + '.log')).read_text())
    if result.returncode or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', result.stdout):
        print(result.stdout)
        raise SystemExit(name + ': failed')
    print(name + ': passed', flush=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('upstream', type=Path)
    parser.add_argument('--survey', action='store_true', help='Also sample all 192 pending effects')
    parser.add_argument('--performance', action='store_true', help='Measure and enforce 33.33 ms warm CPU budget')
    parser.add_argument('--expanded', action='store_true', help='Check optimized effects across seeds, colors and transforms')
    args = parser.parse_args()
    BUILD.mkdir(parents=True, exist_ok=True)
    upstream = args.upstream.resolve()
    sources = json.loads((ROOT / 'addons/pixelfx/native/sources.json').read_text())
    import hashlib
    if sources['upstream_revision'] != PINNED:
        raise SystemExit('Wrong pinned reference')
    for row in sources['modules']:
        if hashlib.sha256((upstream / row['source']).read_bytes()).hexdigest() != row['sha256']:
            raise SystemExit('Upstream hash mismatch: ' + row['source'])
    godot = os.environ.get('GODOT_BIN') or shutil.which('godot') or '/Applications/Godot.app/Contents/MacOS/Godot'
    env = dict(os.environ, PIXELFX_EFFECT='', PIXELFX_SHARDS='1', PIXELFX_SHARD='0')
    run('native-semantics-suite', [sys.executable, 'tools/pixelfx/check_native_semantics.py'], env)
    base = [godot, '--headless', '--path', str(ROOT), '--script']
    scope = json.loads((ROOT / 'tests/pixelfx/native_batches/b2-completion.json').read_text())
    selected = ','.join(row['source'] for row in scope['effects'])
    if args.expanded:
        optimized = json.loads((ROOT / 'tests/pixelfx/native_batches/optimized-parameters.json').read_text())
        phase_env = dict(env, PIXELFX_ACCEPTANCE_PHASE='expanded', PIXELFX_EFFECT=','.join(optimized['effects']))
        run('reference-native-expanded', ['node', 'tools/pixelfx/reference_native.mjs', str(upstream)], phase_env)
        run('parity-native-expanded', base + ['tests/pixelfx/test_native_parity.gd'], phase_env)
        run('comparison-native-expanded', ['node', 'tools/pixelfx/compare_native.mjs', 'expanded'], phase_env)
    for phase in ['b2-full', 'b2-extra', 'b2-act', 'b2-background'] + (['survey'] if args.survey else []):
        phase_env = dict(env, PIXELFX_ACCEPTANCE_PHASE=phase, PIXELFX_EFFECT='' if phase == 'survey' else selected)
        run('reference-native-' + phase, ['node', 'tools/pixelfx/reference_native.mjs', str(upstream)], phase_env)
        run('parity-native-' + phase, base + ['tests/pixelfx/test_native_parity.gd'], phase_env)
        run('comparison-native-' + phase, ['node', 'tools/pixelfx/compare_native.mjs', phase], phase_env)
    for phase in ['runtime', 'catalog', 'soak']:
        run('native-' + phase + '-b2', base + ['tests/pixelfx/test_native_' + phase + '.gd'], env)
    if args.performance:
        run('native-performance-reference', ['node', 'tools/pixelfx/benchmark_native_reference.mjs', str(upstream)], env)
        run('native-performance-b2', base + ['tests/pixelfx/benchmark_native.gd'], env)
        run('native-performance-b2-full-cycle', base + ['tests/pixelfx/benchmark_native.gd'],
            dict(env, PIXELFX_PERFORMANCE_FULL_CYCLE='1'))
        for suffix in ['', '-full-cycle']:
            performance = json.loads((BUILD / ('acceptance/performance-b2-native' + suffix + '.json')).read_text())
            over = [row['effect'] for row in performance['records'] if not row['meets_30fps']]
            if over:
                raise SystemExit('Native 30 FPS CPU budget failed' + suffix + ': ' + ', '.join(over))
    print('PIXELFX_NATIVE_CORRECTNESS_PASSED; visual review and real-time performance remain separate gates')


if __name__ == '__main__':
    main()
