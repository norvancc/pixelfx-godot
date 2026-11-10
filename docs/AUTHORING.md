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

Current source examples include 30 analytic loops and twenty-two isolated stateful one-shots; use the [effect catalog](../addons/pixelfx/docs/CATALOG.md) to choose a comparable module. Preserve the five published effect paths and public contract v1. A helper being available does not mean every upstream effect that uses it has been ported.

## Verification

Check clipping at maximum parameters, loop seams, stopping and restart, independent instances and front/back ordering. For ports, compare the same seed/options/timestamps against the original and document tolerances. Review normal-speed native Godot output, measure cold generation and cache size, and retain the original license/source reference.

Keep parameter types and legal ranges faithful to the algorithm: integer tooth counts are not floats, and a speed used as a divisor must exclude zero. Audit each numeric tolerance exception by case, bounds and reason. For native captures, verify decoded lifecycle frames and backgrounds, including when the window is occluded; a fixed-rate movie does not establish real-time FPS.

For upstream ports, update provenance, `docs/migration-status.json`, the effect catalog, both overviews/changelogs, the roadmap/full migration plan, validation and performance notes. Extend `tools/pixelfx/check.py` coverage; keep source-hashed acceptance reports tied to the validated implementation rather than regenerating a pass after an unreviewed source change. Release metadata changes only when publishing a new version.

See the [detailed contract](../addons/pixelfx/docs/EFFECTS.md) and [contribution checklist](../CONTRIBUTING.md).

## Generated native ports

The remaining 192 pinned effects use the ahead-of-time generator in `tools/pixelfx/codegen/`. Change the generator/support code, regenerate from the pinned source, and record fresh basic checks. Keep source migration separate from full acceptance; do not overwrite any accepted effect while regenerating. See [the native-port guide](../addons/pixelfx/FULL_MIGRATION.md).
