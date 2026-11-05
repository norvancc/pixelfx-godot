"""Build reproducible addon-only and standalone-source release archives."""
from pathlib import Path
import hashlib
import json
import shutil
import zipfile

root = Path(__file__).resolve().parents[2]
version = '0.2.0'
package = root / f'builds/pixelfx-godot-{version}'
package.mkdir(parents=True, exist_ok=True)
for relative in ('addons/pixelfx', 'demos/pixelfx', 'tests/pixelfx', 'tools/pixelfx', '.github', 'docs'):
    target = package / relative
    if target.exists():
        shutil.rmtree(target)
    shutil.copytree(root / relative, target, ignore=shutil.ignore_patterns('__pycache__', '.DS_Store'))
for name in ('project.godot', 'export_presets.cfg', '.gitignore', '.gitattributes', '.editorconfig',
             'README.md', 'README.zh-CN.md', 'LICENSE', 'NOTICE.md', 'CHANGELOG.md',
             'CONTRIBUTING.md', 'CODE_OF_CONDUCT.md', 'SECURITY.md', 'SUPPORT.md', 'ROADMAP.md',
             '打开演示.command', '打开编辑器.command'):
    shutil.copy2(root / name, package / name)
(package / 'builds/pixelfx').mkdir(parents=True, exist_ok=True)
(package / 'builds/.gdignore').touch()
artifacts = []
for name, base, tree in (
    (f'pixelfx-godot-{version}.zip', package, package),
    (f'pixelfx-addon-{version}.zip', root, root / 'addons/pixelfx'),
):
    output = root / 'builds' / name
    with zipfile.ZipFile(output, 'w', zipfile.ZIP_DEFLATED) as archive:
        for path in sorted(tree.rglob('*')):
            relative = path.relative_to(base)
            if not path.is_file() or any(x in relative.parts for x in ('.godot', 'builds', '__pycache__', '.DS_Store')):
                continue
            target = Path(package.name) / relative if base == package else relative
            # Fixed timestamps and modes make identical source produce identical archives.
            info = zipfile.ZipInfo(str(target), date_time=(2026, 11, 5, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.create_system = 3
            info.external_attr = (0o100755 if path.suffix == '.command' else 0o100644) << 16
            archive.writestr(info, path.read_bytes())
    artifacts.append({'file': name, 'sha256': hashlib.sha256(output.read_bytes()).hexdigest(), 'bytes': output.stat().st_size})
(root / 'builds/pixelfx').mkdir(parents=True, exist_ok=True)
(root / 'builds/pixelfx/release.json').write_text(json.dumps({'version': version, 'artifacts': artifacts}, indent=2) + '\n')
(root / 'builds/SHA256SUMS').write_text(''.join(f"{a['sha256']}  {a['file']}\n" for a in artifacts))
print(package)
