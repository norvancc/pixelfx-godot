# Attribution and third-party notices

## Upstream PixelFX

This is an independent, unofficial Godot port of [patch-gg/pixelfx](https://github.com/patch-gg/pixelfx), version 0.3.0, commit `a84159688af3ca37a4be05a0d422b94451b2e24e`.

Original PixelFX: Copyright (c) 2026 Patch and Copyright (c) 2026 Hugo Duprez, MIT License. The license is retained in `LICENSE` and `addons/pixelfx/LICENSE`. The port adapts foundational drawing, math, color, particles and lifecycle code plus 31 effect algorithms and their selected helpers: five original effects, six B1 probes and twenty B2 fire, projectile/muzzle and water effects. See the [complete effect catalog](addons/pixelfx/docs/CATALOG.md) and [exact upstream reference-file hashes](addons/pixelfx/provenance.json). Alternate palette presets do not count as additional algorithms.

Godot integration, resources, editor tooling, tests and documentation: Copyright (c) 2026 norvancc and PixelFX for Godot contributors, MIT License.

## Upstream credits and exclusions

Upstream credits Hugo Duprez / [Sprite Fusion](https://www.spritefusion.com/pixel-art-vfx) for `sim.js` and specifically marked effects. It credits [rehan-remade/hollow-crown](https://github.com/rehan-remade/hollow-crown) (MIT) for parts of its acting system. The B1/B2 ports include the particle, light, blaze, debris, smoke, casing and water helpers they require; the full acting systems and unused simulation helpers remain outside the accepted migration scope. Preserve their notices when porting them later.

Upstream's Patch Pixel gallery font has separate terms and is not part of the upstream MIT grant. That font, upstream gallery assets and third-party game character artwork are **not bundled here**. The preview image is a capture of this project's Godot demo. Verification downloads upstream into ignored build directories; it does not redistribute that checkout in addon packages.

Names and links identify source projects and do not imply endorsement.
