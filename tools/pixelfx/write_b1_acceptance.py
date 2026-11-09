"""Record an acceptance run after inspecting the native Godot recording."""
from pathlib import Path
from datetime import datetime, timezone
import argparse
import hashlib
import json
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[2]
BUILD = ROOT / 'builds/pixelfx'
EFFECTS = {'hit_spark':'impacts/hit-spark','poof':'spawn/poof','campfire':'fire/campfire','rocket':'projectiles/rocket','small_explosion':'explosions/small-explosion','splash':'water/splash'}


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--visual-reviewed', action='store_true', required=True,
                        help='Only use after watching the native 30 FPS output and inspecting both backgrounds.')
    args = parser.parse_args()
    reports = {name: json.loads((BUILD / file).read_text()) for name,file in {
        'parity':'parity-b1.json', 'runtime':'runtime-b1.json', 'catalog':'catalog-latest.json',
        'editor':'editor-v010.json', 'soak':'soak-b1.json',
    }.items()}
    for name, data in reports.items():
        if data.get('failures') != []:
            raise SystemExit(f'{name} has not passed')
    if len(reports['parity']['cases']) != 809:
        raise SystemExit('Expected all 809 B1 parity cases')
    if reports['runtime']['checks'] < 136 or reports['editor']['checks'] < 47:
        raise SystemExit('B1 runtime/editor coverage is missing')
    movie = BUILD / 'b1-native.mp4'
    probe = json.loads(subprocess.check_output(['ffprobe','-v','error','-show_entries','format=duration:stream=width,height,avg_frame_rate','-of','json',str(movie)]))
    stream = probe['streams'][0]
    if stream['avg_frame_rate'] != '30/1' or not 43 < float(probe['format']['duration']) < 44:
        raise SystemExit('Native recording must be 43 seconds at 30 FPS')
    poster = ROOT / 'docs/images/b1-effects.png'
    shutil.copy2(BUILD / 'b1-native-contact-0.png', poster)
    files = sorted((ROOT/'addons/pixelfx').rglob('*.gd')) + sorted((ROOT/'addons/pixelfx/presets').glob('*.tres'))
    files += [ROOT/'demos/pixelfx/b1_gallery.gd',ROOT/'demos/pixelfx/b1_gallery.tscn']
    source_hashes = {p.relative_to(ROOT).as_posix(): digest(p) for p in files}
    tolerances = json.loads((ROOT/'tests/pixelfx/b1_tolerances.json').read_text())
    effects = {}
    for id, upstream_id in EFFECTS.items():
        cases = [case for case in reports['parity']['cases'] if case['effect'] == id]
        implementation = ROOT/'addons/pixelfx/effects'/upstream_id.split('/')[0]/(id+'.gd')
        effects[upstream_id] = {
            'implementation':implementation.relative_to(ROOT).as_posix(), 'implementation_sha256':digest(implementation),
            'parity_cases':len(cases), 'byte_exact':sum(c['changed_bytes']==0 for c in cases),
            'max_changed_bytes':max(c['changed_bytes'] for c in cases),
            'max_channel_error':max(c['max_channel_error'] for c in cases),
            'performance':reports['catalog']['performance'][id],
        }
    result = {
        'passed':True, 'accepted_at':datetime.now(timezone.utc).isoformat(),
        'upstream_revision':json.loads((ROOT/'addons/pixelfx/provenance.json').read_text())['revision'],
        'environment':reports['runtime']['environment'],
        'scope':'B1 six algorithm ports; local macOS acceptance. Linux Godot 4.3 acceptance is recorded by the PR CI run.',
        'parity':{'cases':809,'byte_exact':sum(c['changed_bytes']==0 for c in reports['parity']['cases']),
                  'default_tolerance':{'max_channel_error':1,'changed_bytes':20},'audited_exceptions':tolerances},
        'runtime_checks':reports['runtime']['checks'], 'catalog_checks':reports['catalog']['checks'],
        'editor_checks':reports['editor']['checks'], 'replay_soak':reports['soak'],
        'native_visual':{'reviewed':args.visual_reviewed, 'frames':1302,'fps':30,'seconds':float(probe['format']['duration']),
                         'size':[stream['width'],stream['height']], 'movie':'builds/pixelfx/b1-native.mp4','movie_sha256':digest(movie),
                         'poster':'docs/images/b1-effects.png','poster_sha256':digest(poster),
                         'coverage':['dark and light backgrounds','mirroring','full one-shot lifecycles','loop seams','front/back occlusion'],
                         'limitation':'Movie Maker recording is visual evidence, not a real-time FPS or GPU concurrency benchmark.'},
        'source_sha256':source_hashes, 'effects':effects,
    }
    out = ROOT/'addons/pixelfx/validation/b1.json'; out.parent.mkdir(parents=True,exist_ok=True)
    out.write_text(json.dumps(result,indent=2,ensure_ascii=False)+'\n')
    print('Wrote',out)


if __name__ == '__main__':
    main()
