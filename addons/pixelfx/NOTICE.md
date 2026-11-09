# Attribution and third-party notices

## Upstream PixelFX

This is an independent, unofficial Godot port of [patch-gg/pixelfx](https://github.com/patch-gg/pixelfx), version 0.3.0, commit `a84159688af3ca37a4be05a0d422b94451b2e24e`.

Original PixelFX: Copyright (c) 2026 Patch and Copyright (c) 2026 Hugo Duprez, MIT License. The license is retained in `LICENSE` and `addons/pixelfx/LICENSE`. The port adapts the foundational drawing, math, color, particles and lifecycle code plus the Fireball, Ice lance, Laser bolt, Sunburst, Ripples, Hit spark, Poof, Campfire, Rocket, Small explosion and Splash algorithms and their selected helpers. Exact upstream reference-file hashes are recorded in `addons/pixelfx/provenance.json`.

Godot integration, resources, editor tooling, tests and documentation: Copyright (c) 2026 norvancc and PixelFX for Godot contributors, MIT License.

## Upstream credits and exclusions

Upstream credits Hugo Duprez / [Sprite Fusion](https://www.spritefusion.com/pixel-art-vfx) for `sim.js` and specifically marked effects. It credits [rehan-remade/hollow-crown](https://github.com/rehan-remade/hollow-crown) (MIT) for parts of its acting system. The B1 ports include the particle, light, blaze and debris-update helpers they require; the full acting systems and unused simulation helpers remain outside this batch. Preserve their notices when porting them later.

Upstream's Patch Pixel gallery font has separate terms and is not part of the upstream MIT grant. That font, upstream gallery assets and third-party game character artwork are **not bundled here**. The preview image is a capture of this project's Godot demo. Verification downloads upstream into ignored build directories; it does not redistribute that checkout in addon packages.

Names and links identify source projects and do not imply endorsement.
