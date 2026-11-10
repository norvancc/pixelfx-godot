# Changelog

## Unreleased — documentation and showcase

- Publish the GitHub Wiki and independent PixelFX website with a searchable, categorized library of 244 native lifecycle GIFs. Keep editable page/site sources, animation metadata and serial export tools.
- Fix numeric coercion for boolean arithmetic in generated shotgun muzzle geometry, found during the Rocket launcher animation capture; retain historical acceptance snapshots and record the targeted fix separately.
- Synchronize installation, delivery status, Linux CI evidence and source/release boundaries after PR #10 merged as `183118a`.

## Unreleased — full source migration

- Port the remaining 192 pinned algorithms to native GDScript with presets, actor/rig/act/poses/chain support, masks, pixel fonts and screen/weather helpers. Source coverage is 244/244 with 245 presets; full acceptance stays 52/244.
- Add the lazy full catalog gallery, native actor/scene input adapters, source hashes and a basic playback report. Full acceptance has resumed. Optimize pixel loops, numeric bodies, particle integration, row compositing and dependency loading; catalog-wide real-time readiness remains in progress. Fix Inspector resource switching and verify the targeted editor probe.
- Fix generated switch/continue flow, array-member destructuring, numeric object keys, missing Map numeric comparisons and unsigned frame-buffer reads. Fix transformed weather glow sampling and particle decay quantization; add stone, slash, sky and font kernels with native parity/runtime/bounds/replay probes and isolated performance measurements; acceptance remains 52/244.

- Record 6,500 completed native pixel cases and 979 editor assertions, visible playback measurements, and the later targeted optimization delta without claiming the interrupted 119-effect rerun passed.

## Unreleased — B2 simulations

- Add thirteen native stateful ports and presets: Flame pillar, Meteor, Homing missile, Ice shatter, Ice spikes, Icicle fall, Snowflake burst, Geyser, Wave crash, Feather burst, Healing ring, Holy pillar and Smite. Source coverage reaches 52/244 algorithms, 53 presets; B2 is 41/49 accepted.
- Preserve ice pane collisions/fractures, falling feathers, rotated missile pixels, fire layering, typed buffer rounding and signed 32-bit bitwise behavior. Simulation callbacks use weak references to release their owning modules.
- Add 2166 independent RGBA comparisons (2066 byte-exact and four audited quantization exceptions), runtime/bounds/replay checks and native lifecycle/parameter-limit recordings. Keep all existing regression suites.
- Update source catalog, progress, provenance, performance and validation documentation. Published release remains 0.2.0.

## Unreleased — B2 ice/water

- Add eight native analytic effects: Blizzard vortex, Frost breath, Ice crystal, Bubbles, Drip, Fountain, Rain splash and Waterfall. Source coverage is 39/244 algorithms and 40 presets; B2 is 28/49 accepted, with 205 algorithms remaining overall.
- Add declarative batch reference, pixel, runtime, bounds, replay and native movie acceptance tools. Preserve all earlier implementation hashes; fix ledger rebuilding from the remaining-only plan appendix.
- Add 1052 upstream pixel cases, 167 runtime checks, 333 catalog/bounds checks, 128 replays and 159 total editor checks. Record 66 per-case quantization limits and complete native default/extreme visual evidence.
- Update all source documentation without changing the published 0.2.0 version.

## Unreleased — first B2 slice

- Add 20 native ports: seven fire effects, ten projectile/muzzle effects and three water effects; source coverage reached 31 of 244 upstream effects in this slice.
- Preserve five isolated simulations, fifteen analytic loops, water-orb front/back layering and every upstream option. Add typed default presets and the B2 gallery.
- Add 2607 upstream RGBA comparisons, lifecycle/isolation/bounds checks, 320 replay iterations, editor save/reload coverage and source-hashed acceptance evidence. Record per-case 1–2/255 floating-point differences and measured CPU limitations.
- Accept and merge [PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) on 2026-11-09 (`112d5d4`); the implementation commit `73560f4` passes [Godot 4.3/Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517). The accepted code tree is unchanged by the merge.
- Synchronize source/release status, all-effect catalog, migration plan, validation and performance documentation. At that snapshot B2 was 20/49 accepted, with 213 algorithms remaining across the full catalog.
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
