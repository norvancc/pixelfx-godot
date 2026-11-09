# Roadmap and migration status

Updated 2026-11-09: source migration now covers 244/244 algorithms and 245 presets. The new 192 ports have basic playback checks only; full acceptance remains 52/244. See [full source migration](addons/pixelfx/FULL_MIGRATION.md). Historical acceptance milestones follow. The first B2 slice in [B2 PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) was merged as `112d5d4`; Linux acceptance for the simulation slice is recorded in [PR #9](https://github.com/norvancc/pixelfx-godot/pull/9/checks). The pinned PixelFX 0.3.0 catalog contains **244 algorithms: 52 accepted, 192 remaining**. The latest published release is still **0.2.0 (five algorithms)**; B1/B2 are source additions. Arcane Fireball is a palette preset.

## Accepted source capabilities

- Public effect/resource contract v1, validated presets and player lifecycle.
- Editor discovery, parameter editing, preview, timeline and preset saving.
- Front/back layering, bounded LRU frame sharing, analytic prewarming and player pooling.
- Fully accepted subset: 52 algorithms / 53 presets: 30 analytic loops and twenty-two isolated stateful one-shots. See the [catalog](addons/pixelfx/docs/CATALOG.md).
- Upstream RGBA comparisons, runtime, parameter/bounds, editor and replay checks; native macOS visual evidence and [Godot 4.3/Linux headless CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517). See [validation](addons/pixelfx/VALIDATION.md) for scope and numerical exceptions.

## Batch progress

Planned sizes remain fixed. The three accepted B2 slices contain 41 effects within its 49-effect milestone.

| Batch | Planned algorithms | Accepted | Remaining | Focus |
| --- | ---: | ---: | ---: | --- |
| B0 | 5 | 5 | 0 | Published five-effect baseline and complete ledger |
| B1 | 6 | 6 | 0 | Stateful/one-shot/layering probes |
| B2 | 49 | 41 | 8 | Basic elements and projectiles |
| B3 | 42 | 0 | 42 | Impacts, melee, explosions, spawn/despawn |
| B4 | 35 | 0 | 35 | Arcane, lightning and shadow combinations |
| B5 | 38 | 0 | 38 | Nature, weather and persistent status |
| B6 | 35 | 0 | 35 | Pickups, UI inputs and science fiction |
| B7 | 12 | 0 | 12 | Critters and procedural motion |
| B8 | 10 | 0 | 10 | Scene inputs and transitions |
| B9 | 12 | 0 | 12 | Required actor/rig/act/poses and move choreography |
| **Total** | **244** | **52** | **192** | |

The [machine-readable ledger](docs/migration-status.json) is the source of per-effect status. The [full migration plan](docs/plans/full-migration.zh-CN.md) lists the effect IDs awaiting full acceptance; [B2 review](docs/plans/b2-twenty-review.zh-CN.md) records the first completed slice; the [ice/water review](docs/plans/b2-elements-review.zh-CN.md) records the ice/water eight; the [simulation review](docs/plans/b2-simulations-review.zh-CN.md) records the thirteen simulations.

## Next priorities and limits

1. Fully accept the 192 new ports, beginning with the 8 pending B2 actor effects. Source/dependency migration is complete; pixel, lifecycle, visual and platform acceptance remains.
2. Verify the newly ported actor/rig/act/poses/chain systems and external image inputs against the pinned upstream behavior. Keep the older accepted helpers and evidence intact.
3. Preserve the 7081 existing pixel comparisons, lifecycle/isolation/bounds checks and source-hashed evidence. Check parameter extremes and normal-speed native output for every new port.
4. Measure cold generation and unique-parameter workloads. Some accepted CPU effects exceed a 33.3 ms frame budget; no GPU/native accelerated backend is implemented.
5. Validate Windows, mobile, Web and additional renderers separately. Current CI is headless Linux, not visible-window or export acceptance for those platforms.
6. Choose the next release version explicitly, then update version metadata, both changelogs, packages and tagged-commit validation together. No new version or release is created by B2 or these documentation updates.

## Source migration phase

B2–B9 now have GDScript entries and presets for every pinned algorithm. The next phase is full acceptance of the 192 new ports, including pixel parity, normal-speed native visual review, parameters/lifecycle, performance and platform coverage. Unit tests and recording were deferred for this migration phase at the user’s request.
