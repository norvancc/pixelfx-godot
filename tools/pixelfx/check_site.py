"""Check the repository-hosted website and every linked native preview asset."""
from hashlib import sha256
from html.parser import HTMLParser
import json
from pathlib import Path
import re
import struct
from urllib.parse import unquote, urlsplit

ROOT = Path(__file__).resolve().parents[2]
SITE = ROOT / "docs/site"
URL = "https://norvancc.github.io/pixelfx-godot/"


def local_asset(url):
    parsed = urlsplit(url)
    if parsed.scheme or parsed.netloc or not parsed.path:
        return
    if parsed.path.startswith("/"):
        raise SystemExit("Project Pages requires relative local assets: " + url)
    path = (SITE / unquote(parsed.path)).resolve()
    if not path.is_relative_to(SITE.resolve()) or not path.is_file():
        raise SystemExit("Missing or invalid website asset: " + url)
    return path


class Assets(HTMLParser):
    def __init__(self):
        super().__init__()
        self.canonical = None

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == "link" and attrs.get("rel") == "canonical":
            self.canonical = attrs.get("href")
        for key in ("href", "src", "poster"):
            if attrs.get(key):
                local_asset(attrs[key])


def main():
    html = (SITE / "index.html").read_text()
    parsed = Assets()
    parsed.feed(html)
    if parsed.canonical != URL or f'content="{URL}assets/portal-forest.webp"' not in html:
        raise SystemExit("Website metadata must point at the GitHub Pages project URL")
    for url in re.findall(r"url\(['\"]?([^)'\"]+)", (SITE / "style.css").read_text()):
        local_asset(url)
    manifest = json.loads((SITE / "assets/previews/manifest.json").read_text())
    catalog = json.loads((ROOT / "docs/migration-status.json").read_text())["entries"]
    ids = [row["id"] for row in manifest]
    if len(ids) != 244 or len(set(ids)) != 244 or set(ids) != {row["effect"] for row in catalog}:
        raise SystemExit("Website preview catalog must cover all 244 unique algorithms")
    for row in manifest:
        gif = local_asset(row["gif"])
        poster = local_asset(row["poster"])
        data = gif.read_bytes()
        if data[:6] not in (b"GIF87a", b"GIF89a") or struct.unpack("<HH", data[6:10]) != (480, 320):
            raise SystemExit("Invalid GIF format or size: " + row["id"])
        if len(data) != row["bytes"] or sha256(data).hexdigest() != row["gif_sha256"]:
            raise SystemExit("Preview GIF does not match its recorded hash: " + row["id"])
        header = poster.read_bytes()[:24]
        if header[:8] != b"\x89PNG\r\n\x1a\n" or struct.unpack(">II", header[16:24]) != (480, 320):
            raise SystemExit("Invalid poster: " + row["id"])
        if not (ROOT / row["implementation"]).is_file():
            raise SystemExit("Preview source link is missing: " + row["id"])
    print("PIXELFX_SITE_CHECKS_PASSED effects=244 gifs=244 posters=244 project_path=/pixelfx-godot/")


if __name__ == "__main__":
    main()
