"""Freeze B2 acceptance only after inspecting the complete native movie."""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import json
import math
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BUILD = ROOT / 'builds/pixelfx'


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--visual-reviewed', action='store_true', required=True)
    args = parser.parse_args()
    rows = json.loads((ROOT / 'tests/pixelfx/b2_effects.json').read_text())
    reports = {key: json.loads((BUILD / name).read_text()) for key, name in {
        'parity': 'parity-b2.json', 'runtime': 'runtime-b2.json',
        'catalog': 'catalog-b2.json', 'soak': 'soak-b2.json',
        'editor': 'editor-v010.json',
    }.items()}
    for name, report in reports.items():
        if report.get('failures') != []:
            raise SystemExit(name + ' has not passed')
    if len(rows) != 20 or len(reports['parity']['cases']) != 2607:
        raise SystemExit('Expected 20 new effects and all 2607 reference cases')
    if reports['runtime']['checks'] < 416 or reports['editor']['checks'] < 127:
        raise SystemExit('Runtime or editor coverage is missing')
    if reports['soak']['replays'] != 320:
        raise SystemExit('Replay coverage is missing')
    movie = BUILD / 'b2-native.mp4'
    probe = json.loads(subprocess.check_output([
        'ffprobe', '-v', 'error', '-show_entries',
        'format=duration:stream=width,height,avg_frame_rate,nb_frames',
        '-of', 'json', str(movie),
    ]))
    stream = probe['streams'][0]
    expected_frames = 0
    for row in rows:
        # The metadata is fixed in the native module; inspect it without executing any port.
        source = (ROOT / 'addons/pixelfx/effects' / row['source'].split('/')[0] / (row['id']+'.gd')).read_text()
        metadata = json.loads(next(line.removeprefix('const META = ') for line in source.splitlines() if line.startswith('const META = ')))
        expected_frames += 2 * math.ceil(max(3.0, metadata['duration']+0.6)*30)
        for phase in [0, 1]:
            if not (BUILD / f"b2-native-{row['id']}-{phase}-45.png").is_file():
                raise SystemExit('Missing native visual evidence for '+row['id'])
    if stream['avg_frame_rate'] != '30/1' or int(stream['nb_frames']) != expected_frames:
        raise SystemExit(f'Incomplete native movie: expected {expected_frames} frames')
    files = list((ROOT / 'addons/pixelfx').rglob('*.gd'))
    files += list((ROOT / 'addons/pixelfx/presets').glob('*.tres'))
    files += [ROOT / 'demos/pixelfx/b2_gallery.gd', ROOT / 'demos/pixelfx/b2_gallery.tscn',
              ROOT / 'tests/pixelfx/b2_effects.json', ROOT / 'tests/pixelfx/b2_tolerances.json']
    effects = {}
    for row in rows:
        cases = [case for case in reports['parity']['cases'] if case['effect'] == row['id']]
        effects[row['source']] = {
            'implementation': 'addons/pixelfx/effects/'+row['source'].split('/')[0]+'/'+row['id']+'.gd',
            'stateful': row['stateful'], 'parity_cases': len(cases),
            'byte_exact': sum(case['changed_bytes'] == 0 for case in cases),
            'performance': reports['catalog']['performance'][row['id']],
        }
    output = {
        'passed': True, 'accepted_at': datetime.now(timezone.utc).isoformat(),
        'upstream_revision': json.loads((ROOT / 'addons/pixelfx/provenance.json').read_text())['revision'],
        'scope': 'B2 first 20 effects; native macOS acceptance. Godot 4.3/Linux is validated by PR CI.',
        'environment': reports['runtime']['environment'],
        'parity': {'cases': len(reports['parity']['cases']),
                   'byte_exact': sum(case['changed_bytes'] == 0 for case in reports['parity']['cases']),
                   'default_tolerance': {'max_channel_error': 1, 'changed_bytes': 20},
                   'audited_exceptions': json.loads((ROOT / 'tests/pixelfx/b2_tolerances.json').read_text())},
        'runtime_checks': reports['runtime']['checks'], 'catalog_checks': reports['catalog']['checks'],
        'editor_checks': reports['editor']['checks'], 'replay_soak': reports['soak'],
        'native_visual': {'reviewed': args.visual_reviewed, 'frames': expected_frames, 'fps': 30,
                          'seconds': float(probe['format']['duration']), 'size': [stream['width'],stream['height']],
                          'movie': 'builds/pixelfx/b2-native.mp4', 'movie_sha256': digest(movie),
                          'poster': 'docs/images/b2-effects.png', 'poster_sha256': digest(ROOT / 'docs/images/b2-effects.png'),
                          'coverage': ['all 20 effects', 'dark/light backgrounds', 'mirroring',
                                       'complete lifecycles and loop seams', 'front/back water-orb occlusion'],
                          'limitation': 'Fixed-frame recording is visual evidence, not a real-time FPS benchmark.'},
        'source_sha256': {file.relative_to(ROOT).as_posix(): digest(file) for file in sorted(files)},
        'effects': effects,
    }
    (ROOT / 'addons/pixelfx/validation/b2.json').write_text(json.dumps(output,ensure_ascii=False,indent=2)+'\n')
    print('Wrote B2 acceptance for 20 effects')


if __name__ == '__main__':
    main()
