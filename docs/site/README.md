# PixelFX public effect library

Public site: https://norvancc.github.io/pixelfx-godot

Buildless HTML, CSS and JavaScript. Serve this `docs/site/` directory with a static HTTP server. The native Godot render tools in the addon repository export each algorithm as an individual animated GIF. The browser loads animation on hover, on explicit play, or in the detail dialog; it does not run 244 effects at once.

## Design and art sources

- Layout reference: [Dark RPG UI Design on Pinterest](https://www.pinterest.com/pin/989666086888419457/), from the user's [pixel landingpage search](https://www.pinterest.com/search/pins/?q=%E5%83%8F%E7%B4%A0%20landingpage&rs=typed). Compact navigation, left pixel headline, right integrated scenery, thin outlined information panels. Reference artwork is not redistributed.
- Forest artwork: [Magical Road by Luis Zuno / ansimuz](https://opengameart.org/content/magical-road-pixel-art-environment), CC0. Local night recoloring and portal composition are described by `create-scene.py`; preserve `assets/SCENERY-LICENSE.txt`.
- Hero portal and catalog GIFs: actual native Godot effect output from PixelFX. Hero characters are the upstream stockActor pixel data. Original algorithms and actors by Patch / Hugo Duprez, MIT. The hero uses additive compositing against the scenery; catalog GIFs show native output on a consistent preview field.
- Self-hosted Pixelify Sans and DM Sans use the SIL Open Font License; the license files accompany the fonts.

## Animation exports

In the addon repository, run `python3 tools/pixelfx/export_previews.py --output /absolute/path/to/assets/previews`. It captures one Godot effect at a time, preserving its full default lifecycle or loop. The motion timing is recorded at 30 fps; this is an offline visual export, not a runtime FPS benchmark.

After export stops, run `python3 tools/pixelfx/finish_previews.py /absolute/path/to/assets/previews` in an environment with Pillow. It uses the complete animation's motion bounds for one stable framing rectangle and preserves playback duration. Never run the framing script while the exporter is still writing the manifest. `manifest.json` binds each named effect to a GIF, poster, timing and hash.

Move/choreography previews include wind-up, recovery and hit freezes. Transitions use a light field so dark wipes remain visible. GIFs are 480×320 with the format's 256-color limit.

This directory is the source of truth for GitHub Pages. `.github/workflows/pages.yml` validates and publishes it automatically when page files change on `main`; it can also be run manually. Pages uses the repository’s GitHub Actions source. All local asset URLs are relative, so the `/pixelfx-godot/` project prefix works. Edit and commit these files to update the site; there is no separate site checkout or manual source synchronization.

The directory is excluded from Godot asset import with `.gdignore`. For a local preview, run `python3 -m http.server 8000` at the repository root, then open `http://localhost:8000/docs/site/`. Run `python3 tools/pixelfx/check_site.py` before publishing.
