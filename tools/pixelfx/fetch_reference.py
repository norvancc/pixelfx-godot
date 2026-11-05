"""Fetch the pinned upstream source for tests and verify the recorded source hashes."""
from pathlib import Path
import hashlib, io, json, tarfile, urllib.request
root = Path(__file__).resolve().parents[2]
meta = json.loads((root/'addons/pixelfx/provenance.json').read_text())
revision = meta['revision']
target = root/'builds/pixelfx/upstream'/revision

def valid():
    return all((target/name).is_file() and hashlib.sha256((target/name).read_bytes()).hexdigest()==digest
               for name,digest in meta['upstream_sha256'].items())
if not valid():
    url = f'https://codeload.github.com/patch-gg/pixelfx/tar.gz/{revision}'
    with urllib.request.urlopen(url, timeout=60) as response:
        data = response.read()
    target.mkdir(parents=True, exist_ok=True)
    with tarfile.open(fileobj=io.BytesIO(data), mode='r:gz') as archive:
        for member in archive.getmembers():
            parts = Path(member.name).parts[1:]
            if not parts or not member.isfile(): continue
            path = target.joinpath(*parts)
            if target.resolve() not in path.resolve().parents: raise ValueError('Unsafe archive path')
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(archive.extractfile(member).read())
    if not valid(): raise RuntimeError('Pinned upstream checksum mismatch')
print(target)
