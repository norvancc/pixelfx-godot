# Changelog

## Unreleased — B2

- Add 20 native ports: seven fire effects, ten projectile/muzzle effects and three water effects; 31 of 244 upstream effects are now implemented.
- Preserve five isolated simulations, fifteen analytic loops, water-orb front/back layering and every upstream option. Add typed default presets and the B2 gallery.
- Add 2607 upstream RGBA comparisons, lifecycle/isolation/bounds checks, 320 replay iterations, editor save/reload coverage and source-hashed acceptance evidence. Record per-case 1–2/255 floating-point differences and measured CPU limitations.
- Accept and merge [PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) on 2026-11-09 (`112d5d4`); the implementation commit `73560f4` passes [Godot 4.3/Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517). The accepted code tree is unchanged by the merge.
- Synchronize source/release status, all-effect catalog, migration plan, validation and performance documentation. B2 remains 20/49 accepted; 213 algorithms remain across the full catalog.
- Keep effect contract v1 and published script paths stable. No new release version is created.

## Unreleased — B1

- Port Hit spark, Poof, Campfire, Rocket, Small explosion and Splash from the pinned upstream algorithms. Preserve the five published module paths; add new modules under their category directories.
- Add stateful particles, landing callbacks, burning debris, water drops/rings/mist, merged smoke and pixel-shape drawing required by these ports.
- Add the selectable B1 gallery, a 244-entry migration ledger, 809 upstream image cases, simulation/editor/replay checks and explicit per-case floating-point tolerances.
- Record native 30 FPS visual evidence and CPU/cache costs. B1 is not a new release package or a GPU performance guarantee.

## 0.2.0 — 2026-11-05

- Port Ice lance, Laser bolt, Sunburst and Ripples from the pinned upstream algorithms: five effects total. Alternate palettes remain presets, not extra effects.
- Add validated presets and a live five-effect gallery with playback, parameter, palette, direction and background controls. Ripples uses separate front/back layers around a scene-owned occluder.
- Add full-cycle and parameter/layer/stop comparisons: 447 rendering cases, 171 catalog/bounds/gallery checks, plus the existing runtime suite and extended editor checks.
- Preserve binary64 reference timestamps across JSON to prevent decimal-parser rounding from selecting a different seeded ripple at modulo boundaries.
- Record per-effect cold rendering and cache costs; retain public effect/resource contract v1 without player/renderer API changes.

## 0.1.0 — 2026-11-05

First reusable Godot addon release. Public effect/resource contract v1.

- Godot 4.3-compatible preset copying and native Inspector fallback.
- Typed PixelFXPreset resources with dynamic Inspector schema, range validation and isolated overrides.
- Generic Player lifecycle, inherited scene pause, idle/physics/manual updates and reliable completion/cancellation.
- One simulation with separate front/back outputs, attachable views, target facing and native transforms.
- Immutable bounded LRU frame sharing, cancelable prewarm and optional bounded player pool.
- Editor preview, effect discovery, timeline, parameter editing and explicit save/load of preset copies.
- Algorithm extension template, default/arcane fireball presets, examples, reference checks and release tooling.
- Raw Fireball rendering remains checked against pinned upstream PixelFX.

Migration from the unpublished prototype: assign a PixelFXPreset to `effect` instead of `effect_script/options`;
use `set_parameters` instead of `set_options`; use flip_h/Node2D.rotation for placement;
use get_layer_texture/get_frame_bounds for custom views; use restart to keep parameter overrides.
