# Changelog

## 0.1.0 — 2026-11-05

First reusable Godot addon release. Public effect/resource contract v1.

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
