# Roadmap and migration status

Updated 2026-11-09 with eight additional locally accepted ice/water effects. The first B2 slice in [B2 PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) was merged as `112d5d4`; Linux CI for the new slice is pending. The pinned PixelFX 0.3.0 catalog contains **244 algorithms: 39 accepted, 205 remaining**. The latest published release is still **0.2.0 (five algorithms)**; B1/B2 are source additions. Arcane Fireball is a palette preset.

## Accepted source capabilities

- Public effect/resource contract v1, validated presets and player lifecycle.
- Editor discovery, parameter editing, preview, timeline and preset saving.
- Front/back layering, bounded LRU frame sharing, analytic prewarming and player pooling.
- 39 algorithms / 40 presets: 30 analytic loops and nine isolated stateful one-shots. See the [catalog](addons/pixelfx/docs/CATALOG.md).
- Upstream RGBA comparisons, runtime, parameter/bounds, editor and replay checks; native macOS visual evidence and [Godot 4.3/Linux headless CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517). See [validation](addons/pixelfx/VALIDATION.md) for scope and numerical exceptions.

## Batch progress

Planned sizes remain fixed. The two accepted B2 slices contain 28 effects within its 49-effect milestone.

| Batch | Planned algorithms | Accepted | Remaining | Focus |
| --- | ---: | ---: | ---: | --- |
| B0 | 5 | 5 | 0 | Published five-effect baseline and complete ledger |
| B1 | 6 | 6 | 0 | Stateful/one-shot/layering probes |
| B2 | 49 | 28 | 21 | Basic elements and projectiles |
| B3 | 42 | 0 | 42 | Impacts, melee, explosions, spawn/despawn |
| B4 | 35 | 0 | 35 | Arcane, lightning and shadow combinations |
| B5 | 38 | 0 | 38 | Nature, weather and persistent status |
| B6 | 35 | 0 | 35 | Pickups, UI inputs and science fiction |
| B7 | 12 | 0 | 12 | Critters and procedural motion |
| B8 | 10 | 0 | 10 | Scene inputs and transitions |
| B9 | 12 | 0 | 12 | Required actor/rig/act/poses and move choreography |
| **Total** | **244** | **39** | **205** | |

The [machine-readable ledger](docs/migration-status.json) is the source of per-effect status. The [full migration plan](docs/plans/full-migration.zh-CN.md) lists the remaining effect IDs; [B2 review](docs/plans/b2-twenty-review.zh-CN.md) records the first completed slice; the [ice/water review](docs/plans/b2-elements-review.zh-CN.md) records the additional eight.

## Next priorities and limits

1. Continue the remaining 21 B2 effects with source/dependency review and per-effect acceptance; they remain outside the accepted source scope.
2. Reuse the validated category helpers, adding missing simulation/chain capabilities only when required. Complete upstream actor/rig/act/poses systems are still outside the accepted source scope.
3. Preserve the 4915 existing pixel comparisons, lifecycle/isolation/bounds checks and source-hashed evidence. Check parameter extremes and normal-speed native output for every new port.
4. Measure cold generation and unique-parameter workloads. Some accepted CPU effects exceed a 33.3 ms frame budget; no GPU/native accelerated backend is implemented.
5. Validate Windows, mobile, Web and additional renderers separately. Current CI is headless Linux, not visible-window or export acceptance for those platforms.
6. Choose the next release version explicitly, then update version metadata, both changelogs, packages and tagged-commit validation together. No new version or release is created by B2 or these documentation updates.
