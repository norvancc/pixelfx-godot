# PixelFX promotional site

Buildless HTML, CSS and JavaScript. Serve `dist/` with a static HTTP server. The website uses real Godot output from the completed local regression snapshot; no upstream JavaScript is executed in the browser. The video is an illustrative recording, not an interactive benchmark.

Design reference: [Pixel Art Gallery on Pinterest](https://www.pinterest.com/pin/877357571162709112/) — charcoal/cream palette, thin outlined navigation, two-line pixel headline, framed artwork and asymmetric gallery. Reference artwork is not redistributed. All effect images are actual PixelFX Godot output; PixelFX is MIT, Patch / Hugo Duprez. The pixel wizard mark is drawn locally as SVG.

Silkscreen by Jason Kottke / The Silkscreen Project Authors and DM Sans by Colophon Foundry are self-hosted under the SIL Open Font License; the license texts live alongside the fonts.

The independent source checkout contains `prepare-assets.py`, which describes the one-time extraction from ignored local verification artifacts. These static files are self-contained and do not require those artifacts.

Public site: https://pixelfx-godot.craftypatio2.chatgpt.site

This directory mirrors the static files in the independent Sites source checkout (its `dist/` folder). It is excluded from Godot asset scanning. After editing, preview this folder, synchronize the independent source checkout and publish the same version through Sites. The site keeps its own hosting identity and source history; GitHub hosts this reviewable copy alongside the addon.
