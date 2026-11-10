# Documentation

The main branch provides **244/244 algorithms and 245 presets**: **52 fully accepted; 192 awaiting full acceptance**. Migration and performance fixes merged in [PR #10](https://github.com/norvancc/pixelfx-godot/pull/10) (`183118a`); [Godot 4.3/Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42786437638) passed. The last complete local native snapshot includes 6,500 pixel cases and 979 editor assertions. The later optimization delta and interrupted rerun are recorded separately. See [current review](plans/native-acceptance-review.zh-CN.md) and [full source migration](../addons/pixelfx/FULL_MIGRATION.md).


Full acceptance: **52/244 algorithms, 192 pending, 53 accepted presets**. B2 is **41/49** complete (8 remaining); the latest published release is **0.2.0 with five algorithms**. The first B2 implementation is merged in [PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) (`112d5d4`); [Godot 4.3/Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517) passed for that 31-effect snapshot; the new simulation slice has passed local acceptance, with Linux verification recorded in [PR #9](https://github.com/norvancc/pixelfx-godot/pull/9/checks).

[Website](https://pixelfx-godot.craftypatio2.chatgpt.site) · [GitHub Wiki](https://github.com/norvancc/pixelfx-godot/wiki) · [Wiki source](wiki/README.md) · [Website source](site/README.md)

The independent website includes an individual animated GIF for every algorithm, with searchable categories and a detailed preview. GIF production is separate from acceptance; source coverage and full acceptance remain separate counts.

## Using PixelFX

- [English overview and installation](../README.md)
- [中文说明与安装](../README.zh-CN.md)
- [All effects and presets / 完整效果目录](../addons/pixelfx/docs/CATALOG.md)
- [Full native source migration / 全量原生源码迁移](../addons/pixelfx/FULL_MIGRATION.md)
- [Public API](../addons/pixelfx/docs/API.md)
- [Effect contract](../addons/pixelfx/docs/EFFECTS.md)
- [Performance](../addons/pixelfx/docs/PERFORMANCE.md)
- [Validation evidence and limitations](../addons/pixelfx/VALIDATION.md)

## Contributing and planning

- [Contribution guide](../CONTRIBUTING.md)
- [Authoring an effect](AUTHORING.md)
- [Repository layout](REPOSITORY_LAYOUT.md)
- [Migration status and roadmap](../ROADMAP.md)
- [Full migration plan / 全量迁移计划](plans/full-migration.zh-CN.md)
- [Machine-readable migration ledger / 迁移台账](migration-status.json)
- [B2 simulation video](https://github.com/user-attachments/assets/6d2cb744-abb6-4832-ac10-51044966b747)
- [B2 simulation review](plans/b2-simulations-review.zh-CN.md)
- [B2 simulation acceptance](../addons/pixelfx/validation/b2-simulations.json)
- [B2 ice/water review](plans/b2-elements-review.zh-CN.md)
- [B2 ice/water acceptance](../addons/pixelfx/validation/b2-elements.json)
- [B2 acceptance evidence](../addons/pixelfx/validation/b2.json)
- [B2 twenty-effect review / B2 二十项迁移验收](plans/b2-twenty-review.zh-CN.md)
- [B2 normal-speed video](https://github.com/user-attachments/assets/f7feadf1-6fd1-4d19-8569-fe567e98bd2b)
- [B1 acceptance evidence](../addons/pixelfx/validation/b1.json)
- [B1 probe dependency review / B1 探针依赖审阅](plans/b1-probe-review.zh-CN.md)

- [Repository changelog](../CHANGELOG.md)
- [Addon changelog](../addons/pixelfx/CHANGELOG.md)

The addon carries its own API, license, source attribution and validation documentation so an addon-only installation remains self-contained. Repository documentation links to those files rather than maintaining another copy.
