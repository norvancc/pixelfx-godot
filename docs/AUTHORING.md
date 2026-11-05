# Authoring an effect

Copy `addons/pixelfx/templates/effect.gd.txt` into `res://pixelfx/my_effect.gd`. Use `@tool` and extend `res://addons/pixelfx/core/effect.gd`. Project-owned effects stay outside the addon so upgrades do not overwrite them.

Implement:

- `metadata()`: unique id, name, positive duration, loop, fps (1–120), layers and cacheable. The effect contract is version 1.
- `parameter_schema()`: named, typed defaults; numeric limits and Inspector hints as needed.
- `bounds(options)`: a local `Rect2i` containing every particle, trail and glow, with each dimension 1–1024 pixels.
- `draw(painter, time, options)`: front-layer drawing. Add `draw_back` for the back layer.

The editor scans addon effects/presets and `res://pixelfx`. Additional roots may be configured with the `pixelfx/editor/effect_directories` project setting. Runtime directly references presets and does not scan directories.

## Analytic versus stateful

For analytic effects, set `cacheable=true`. Drawing must be a pure function of time, validated options and explicit seed; no global randomness, wall clock or mutation. The player can seek and share sampled frames. Position/scale/rotation remain native Node2D properties.

For stateful effects, set `cacheable=false` and implement `update(dt, options)`. Each player owns its module state, stepped at no more than 1/120 second. Front/back drawing must not advance simulation. Parameter changes restart stateful effects; seek and prewarming are unavailable. Optionally provide `create(options)` for a dedicated simulation implementation.

Use the existing deterministic math, color, Painter and particle helpers. Specialized helpers belong with the effect or in a tested shared module. The current library does not include all upstream simulators or character acting systems.

## Verification

Check clipping at maximum parameters, loop seams, stopping and restart, independent instances and front/back ordering. For ports, compare the same seed/options/timestamps against the original and document tolerances. Review normal-speed native Godot output, measure cold generation and cache size, and retain the original license/source reference.

See the [detailed contract](../addons/pixelfx/docs/EFFECTS.md) and [contribution checklist](../CONTRIBUTING.md).
