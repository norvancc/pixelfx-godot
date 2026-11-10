"""Record this acceptance wave, including failures; never promote a pending port on pixel checks alone."""
from datetime import datetime, timezone
from pathlib import Path
import argparse
import hashlib
import json
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BUILD = ROOT / 'builds/pixelfx'
PINNED = 'a84159688af3ca37a4be05a0d422b94451b2e24e'


def read(path):
    return json.loads((ROOT / path).read_text())


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def close_delivery():
    """Keep completed evidence immutable when delivery ends a later rerun."""
    report_path = ROOT / 'addons/pixelfx/validation/native-review.json'
    report = json.loads(report_path.read_text())
    current = {name: digest(ROOT / name) for name in report['source_sha256']}
    changed = sorted(name for name, value in current.items() if value != report['source_sha256'][name])
    evidence = ['builds/pixelfx/comparison-diamond-probe.log',
                'builds/pixelfx/parity-diamond-probe.log',
                'builds/pixelfx/native-performance-shader-final-probe.log',
                'builds/pixelfx/parity-native-expanded.log',
                'builds/pixelfx/acceptance/config-expanded.json']
    delivery = {
        'recorded_at': datetime.now(timezone.utc).isoformat(),
        'reason': 'User requested delivery and an end to repeated acceptance runs.',
        'full_recheck_completed': False,
        'source_sha256': current,
        'changed_since_completed_review': changed,
        'evidence_scope': 'Top-level source/artifact hashes and results describe the last completed snapshot. Delivery hashes identify the later code; targeted diamond and performance probes completed, but the 119-effect expanded rerun was stopped and is not a pass.',
        'artifact_sha256': {name: digest(ROOT / name) for name in evidence},
    }
    report['delivery'] = delivery
    report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    smoke_path = ROOT / 'addons/pixelfx/native/smoke.json'
    smoke = json.loads(smoke_path.read_text())
    smoke['delivery'] = delivery
    smoke_path.write_text(json.dumps(smoke, ensure_ascii=False, indent=2) + '\n')
    print('PIXELFX_DELIVERY_RECORDED full_recheck_completed=false changed=' + str(len(changed)))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--visual-reviewed', action='store_true')
    parser.add_argument('--refresh-basic', action='store_true')
    parser.add_argument('--close-delivery', action='store_true')
    args = parser.parse_args()
    if args.close_delivery:
        close_delivery()
        return
    catalog = read('addons/pixelfx/native/catalog.json')
    scope = read('tests/pixelfx/native_batches/b2-completion.json')
    expected = {row['source'] for row in catalog}
    phases = {}
    for phase in ['survey', 'b2-full', 'b2-extra', 'b2-act', 'b2-background']:
        report = read('builds/pixelfx/acceptance/comparison-' + phase + '.json')
        if report['pending']:
            raise SystemExit(phase + ': incomplete pixel checks')
        phases[phase] = report
    expanded_path = BUILD / 'acceptance/comparison-expanded.json'
    expanded_log = BUILD / 'parity-native-expanded.log'
    if expanded_path.exists() and expanded_log.exists():
        expanded = json.loads(expanded_path.read_text())
        config = read('builds/pixelfx/acceptance/config-expanded.json')
        optimized = read('tests/pixelfx/native_batches/optimized-parameters.json')
        if {row['source'] for row in config['entries']} != set(optimized['effects']):
            raise SystemExit('Expanded parameter regression scope does not match the declared optimized effects')
        count = len(config['entries'])
        text = expanded_log.read_text()
        if expanded['pending'] or f'NATIVE_ACCEPT_DONE effects={count}' not in text or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', text):
            raise SystemExit('Expanded parameter regression has not completed cleanly')
        phases['expanded'] = expanded
    artifacts = {}
    for phase in ['b2-full', 'b2-extra', 'b2-act', 'b2-background']:
        log = BUILD / ('parity-native-' + phase + '.log')
        text = log.read_text()
        if 'NATIVE_ACCEPT_DONE effects=8' not in text or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', text):
            raise SystemExit('Incomplete native execution: ' + log.name)
        for artifact in [log, BUILD / 'acceptance' / ('comparison-' + phase + '.json'),
                         BUILD / 'acceptance' / ('config-' + phase + '.json')]:
            artifacts[artifact.relative_to(ROOT).as_posix()] = digest(artifact)
    log = BUILD / 'parity-native-survey.log'
    text = log.read_text()
    if 'NATIVE_ACCEPT_DONE effects=192' not in text or re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', text):
        raise SystemExit('Final serial source survey has not completed')
    records = [json.loads(line.split('NATIVE_ACCEPT_EFFECT ', 1)[1])
               for line in text.splitlines() if line.startswith('NATIVE_ACCEPT_EFFECT ')]
    logs = [log]
    if 'expanded' in phases:
        logs.append(expanded_log)
        for name in ['comparison-expanded.json', 'config-expanded.json']:
            artifact = BUILD / 'acceptance' / name
            artifacts[artifact.relative_to(ROOT).as_posix()] = digest(artifact)
    if len(records) != 192 or {row['effect'] for row in records} != expected or any(row['errors'] for row in records):
        raise SystemExit('Final survey does not cover all 192 effects')
    paths = list((ROOT / 'addons/pixelfx').rglob('*.gd'))
    paths += [ROOT / row['implementation'] for row in catalog]
    paths += [ROOT / 'addons/pixelfx/presets' / (row['id'] + '.tres') for row in catalog]
    paths += [ROOT / name for name in ['addons/pixelfx/native/catalog.json', 'addons/pixelfx/native/sources.json',
              'addons/pixelfx/core/fx.gd', 'addons/pixelfx/core/frame.gd', 'addons/pixelfx/core/painter.gd',
              'addons/pixelfx/core/math.gd', 'addons/pixelfx/core/color.gd',
              'addons/pixelfx/effects/simulation_bridge.gd', 'tools/pixelfx/codegen/generate.mjs', 'tools/pixelfx/codegen/direct.mjs',
              'tools/pixelfx/reference_native.mjs', 'tools/pixelfx/compare_native.mjs',
              'tools/pixelfx/check_native.py', 'tools/pixelfx/write_native_review.py',
              'tools/pixelfx/benchmark_native_reference.mjs', 'tools/pixelfx/check_native_semantics.py',
              'tests/pixelfx/native_batches/b2-completion.json', 'tests/pixelfx/native_semantics_fixture.js',
              'tests/pixelfx/native_batches/optimized-parameters.json',
              'tests/pixelfx/core/index.js', 'tools/pixelfx/recheck_accepted.py', 'tools/pixelfx/check_editor.py',
              'tools/pixelfx/refresh_accepted_regression.py', 'demos/pixelfx/full_gallery.gd',
              'demos/pixelfx/b2_completion_gallery.gd']]
    paths += list((ROOT / 'tests/pixelfx').glob('*native*.gd'))
    paths += list((ROOT / 'addons/pixelfx/native/third_party').glob('*LICENSE*'))
    hashes = {p.relative_to(ROOT).as_posix(): digest(p) for p in sorted(set(paths))}
    summary = {phase: {k: value[k] for k in ['total', 'failed', 'pending', 'exact']}
               for phase, value in phases.items()}
    report = {'passed': False, 'full_acceptance': False, 'reviewed_at': datetime.now(timezone.utc).isoformat(),
              'upstream_revision': PINNED, 'scope': '192 six-time surveys; eight pending B2 effects receive deeper local acceptance checks; expanded parameter checks cover 119 effects',
              'survey_scope': sorted(expected), 'b2_scope': [row['source'] for row in scope['effects']],
              'pixel_checks': summary, 'source_sha256': hashes, 'artifact_sha256': artifacts,
              'runtime': read('builds/pixelfx/acceptance/runtime-b2-native.json'),
              'bounds': read('builds/pixelfx/acceptance/catalog-b2-native.json'),
              'soak': read('builds/pixelfx/acceptance/soak-b2-native.json'),
              'performance': read('builds/pixelfx/acceptance/performance-b2-native.json'),
              'full_cycle_performance': read('builds/pixelfx/acceptance/performance-b2-native-full-cycle.json'),
              'catalog_performance_samples': read('builds/pixelfx/acceptance/performance-native-catalog.json'),
              'upstream_performance': read('builds/pixelfx/acceptance/performance-b2-upstream.json'),
              'editor': read('builds/pixelfx/editor-v010.json'),
              'limitations': ['The other 184 effects have six default lifecycle times plus expanded parameter snapshots for selected optimized effects; complete lifecycle acceptance remains pending.',
                              'macOS Godot 4.7.2 only; no new Linux or cross-platform acceptance.',
                              'Offline fixed-frame movies do not prove real-time playback performance.']}
    if 'expanded' in phases:
        report['expanded_scope'] = sorted(optimized['effects'])
    report['blocked_by'] = [{'gate': 'real_time_30fps', 'effect': row['effect'], 'p95_ms': row['p95_ms']}
                            for row in report['performance']['records'] if not row['meets_30fps']]
    initial_path = BUILD / 'acceptance/performance-b2-initial.json'
    if initial_path.exists():
        report['initial_performance_baseline'] = json.loads(initial_path.read_text())
        artifacts[initial_path.relative_to(ROOT).as_posix()] = digest(initial_path)
    report['blocked_by'] += [{'gate': 'full_cycle_30fps', 'effect': row['effect'], 'p95_ms': row['p95_ms']}
                             for row in report['full_cycle_performance']['records'] if not row['meets_30fps']]
    sampled = report['catalog_performance_samples']['records']
    if len(sampled) != 192 or {row['effect'] for row in sampled} != expected:
        raise SystemExit('Catalog performance sample does not cover all 192 effects')
    report['catalog_render_budget'] = {
        'budget_ms': 1000 / 30,
        'sampled_effects': len(sampled),
        'effects_with_an_over_budget_sample': [
            {'effect': row['effect'], 'max_sampled_draw_ms': max(s['draw_ms'] for s in row['samples'])}
            for row in sampled if any(s['draw_ms'] > 1000 / 30 for s in row['samples'])],
        'limitation': 'Three warm render times exclude update and do not establish lifecycle or scene FPS.'}
    if report['catalog_render_budget']['effects_with_an_over_budget_sample']:
        report['blocked_by'].append({'gate': 'catalog_sampled_render_budget',
                                    'effects': report['catalog_render_budget']['effects_with_an_over_budget_sample']})
    for phase, value in phases.items():
        if value['failed']:
            report['blocked_by'].append({'gate': 'pixels_' + phase, 'failed_cases': value['failed']})
    for phase in ['runtime', 'bounds', 'soak', 'editor']:
        if report[phase]['failures']:
            report['blocked_by'].append({'gate': phase, 'failures': report[phase]['failures']})
    editor_log = (BUILD / 'editor-qa.log').read_text()
    editor_errors = re.findall(r'(?m)^(?:SCRIPT ERROR:|ERROR:).+$', editor_log)
    report['editor']['engine_errors'] = editor_errors
    report['editor']['passed'] = not report['editor']['failures'] and not editor_errors
    if editor_errors:
        report['blocked_by'].append({'gate': 'editor_engine_errors', 'errors': editor_errors})
    realtime_path = BUILD / 'acceptance/performance-b2-realtime.json'
    realtime_log = BUILD / 'native-performance-realtime.log'
    if realtime_path.exists() and realtime_log.exists():
        realtime = json.loads(realtime_path.read_text())
        log_text = realtime_log.read_text()
        if ('NATIVE_REALTIME_DONE effects=8' not in log_text or
                re.search(r'(?m)(SCRIPT ERROR:|ERROR:)', log_text) or
                {row['effect'] for row in realtime['records']} != {row['id'] for row in scope['effects']}):
            raise SystemExit('Visible real-time playback evidence is incomplete')
        report['visible_realtime'] = realtime
        for artifact in [realtime_path, realtime_log]:
            artifacts[artifact.relative_to(ROOT).as_posix()] = digest(artifact)
        for row in realtime['records']:
            artifact = ROOT / row['screenshot']
            artifacts[artifact.relative_to(ROOT).as_posix()] = digest(artifact)
    if args.visual_reviewed:
        visual = read('builds/pixelfx/b2-completion-visual-frames.json')
        movie = BUILD / 'b2-completion-native.mp4'
        probe = json.loads(subprocess.check_output(['ffprobe', '-v', 'error', '-count_frames', '-show_entries',
                           'stream=width,height,avg_frame_rate,nb_read_frames:format=duration', '-of', 'json', str(movie)]))
        stream = probe['streams'][0]
        if int(stream['nb_read_frames']) != visual['expected_frames'] or stream['avg_frame_rate'] != '30/1':
            raise SystemExit('Incomplete movie')
        if {sample['id'] for sample in visual['samples']} != {row['id'] for row in scope['effects']}:
            raise SystemExit('Incomplete visual scope')
        report['native_visual'] = {'reviewed': True, 'frames': visual['expected_frames'], 'fps': 30,
                                  'movie': movie.relative_to(ROOT).as_posix(), 'movie_sha256': digest(movie),
                                  'samples': visual['samples'], 'coverage': ['default lifecycles', 'dark/light', 'mirror', 'actor occlusion'],
                                  'limitation': 'Fixed-frame recording; parameter extremes and complete actor choreography movies remain pending.'}
        artifacts['builds/pixelfx/b2-completion-visual-frames.json'] = digest(BUILD / 'b2-completion-visual-frames.json')
        for sample in visual['samples']:
            artifact = ROOT / sample['path']
            artifacts[artifact.relative_to(ROOT).as_posix()] = digest(artifact)
    else:
        report['native_visual'] = {'reviewed': False}
    for artifact in [BUILD / 'acceptance' / ('comparison-survey.json'), BUILD / 'acceptance' / 'config-survey.json',
                     BUILD / 'acceptance' / 'runtime-b2-native.json', BUILD / 'acceptance' / 'catalog-b2-native.json',
                     BUILD / 'acceptance' / 'soak-b2-native.json', BUILD / 'acceptance' / 'performance-b2-native.json',
                     BUILD / 'acceptance' / 'performance-b2-upstream.json', BUILD / 'acceptance' / 'performance-b2-native-full-cycle.json',
                     BUILD / 'acceptance' / 'performance-native-catalog.json', BUILD / 'editor-qa.log', BUILD / 'editor-v010.json'] + logs:
        artifacts[artifact.relative_to(ROOT).as_posix()] = digest(artifact)
    report['blocked_by'].append({'gate': 'remaining_visual_and_platform_scope',
                                 'reason': ('Extreme-parameter and complete actor choreography visual reviews, plus Linux validation, remain pending.'
                                            if args.visual_reviewed else
                                            'Native recording/review, extreme-parameter and complete actor choreography visual reviews, plus Linux validation, remain pending.')})
    (ROOT / 'addons/pixelfx/validation/native-review.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
    if args.refresh_basic:
        if phases['survey']['failed']:
            raise SystemExit('Cannot refresh basic evidence from failing survey')
        config = read('builds/pixelfx/acceptance/config-survey.json')
        by_effect = {row['source']: row for row in config['entries']}
        for row in records:
            row['drawn_at_seconds'] = [sample['t'] for sample in by_effect[row['effect']]['groups'][0]['cases']]
        basic = {'check_kind': 'native_lifecycle_survey_only', 'full_acceptance': False, 'upstream_revision': PINNED,
                 'environment': report['performance']['environment'], 'records': sorted(records, key=lambda r: r['effect']),
                 'timing_note': 'Six-time survey totals include creation and simulation; use the isolated benchmark for frame performance.',
                 'pixel_summary': summary['survey'], 'source_sha256': hashes,
                 'log_sha256': {log.name: digest(log) for log in logs}}
        (ROOT / 'addons/pixelfx/native/smoke.json').write_text(json.dumps(basic, ensure_ascii=False, indent=2) + '\n')
    print('PIXELFX_NATIVE_REVIEW_RECORDED full_acceptance=false blockers=' + str(len(report['blocked_by'])))


if __name__ == '__main__':
    main()
