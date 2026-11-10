# PixelFX 全量迁移计划

更新：2026-11-10，已开始完整验收。源码覆盖仍为 **244/244**、**245 个预设**，完整验收仍为 **52 项**。本轮已完成生成语义、帧缓冲与多个实时性能热点修复；新增路径 6500 个像素用例、979 项编辑器断言通过。八项重点效果可见播放接近 30 次效果更新/秒；全目录仍有超预算项，完整验收尚未通过。详见 [本轮验收记录](native-acceptance-review.zh-CN.md)。

历史验收：冰水八项与模拟十三项已通过本地验收。B2 首批 20 项已通过 [PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) 合入主分支（`112d5d4`）。本文同时记录已验收进度与后续计划；未完成条目仍为计划，不表示已实现。

## 1. 范围与基线

以 `addons/pixelfx/provenance.json` 固定的 PixelFX 0.3.0、提交 `a84159688af3ca37a4be05a0d422b94451b2e24e` 为唯一迁移基线。本地上游目录共 21 类、244 个效果模块。已验收 B0 五项、B1 六项、B2 首批二十项、冰水八项及模拟十三项，累计 **52/244**，剩余 **192** 个。B2 原定 49 项中已完成 41 项，剩余 8 项。最新发行包仍为 0.2.0 的五项，新增 47 项为未发布源码。Arcane Fireball 是换色预设，不另计一个效果。上游后续新增内容另开增量计划，不改变本轮分母。

“全量”包括 moves、critters、transitions 等困难类别，不能用相似动画或静态截图抵充。actor / rig / act / poses 等系统以支撑这 244 个效果所需的能力为本轮范围；完整角色制作工具不自动纳入。依赖外部图像、角色或场景输入的效果必须提供输入接口与可运行示例，不能静默删掉行为。

进度依据为 [迁移台账](../migration-status.json)、[B1 验收](../../addons/pixelfx/validation/b1.json)、[B2 验收](../../addons/pixelfx/validation/b2.json)与对应源码哈希。当前完整检查保留 447 + 809 + 2607 + 1052 + 2166 = **7081** 组上游对照；B2 的 [Godot 4.3/Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517) 已通过。新增十三项的本地完整 gate、原生正常速度录像及参数极值画面均通过；其 Linux 检查记录见 [PR #9](https://github.com/norvancc/pixelfx-godot/pull/9/checks)。[模拟十三项验收](b2-simulations-review.zh-CN.md)记录独立范围。[冰水验收说明](b2-elements-review.zh-CN.md)记录独立范围。

## 2. 从前五个效果沿用的做法

- 原生 GDScript 重现原算法，保留来源、MIT 声明与文件哈希；不以预渲染序列帧替代算法迁移。
- 同 seed、参数、时间、背景及前后层做上游 RGBA 对照。历史上浮点差异已出现，必须记录差异原因和范围，不能随效果数量增加而统一放宽容差。
- Ripples 的前后层围绕场景对象绘制是分层范例；两层必须读取同一时刻、同一模拟实例。
- 最初五项均为循环效果；B1 已验证一次性生命周期与真实有状态模拟，B2 继续复用这些能力。当前共有 30 项解析循环、22 项独立模拟一次性效果。
- 历史冷生成均值约 3.7–28 ms/帧，说明 CPU 成本需要持续测量；不能把演示图鉴临时 64 MiB 缓存当成库默认值，当前默认仍为 32 MiB。

## 3. 代码规划

保持现有契约 v1 和已发布脚本路径。增加效果不修改播放器或编辑器中的名称分支，也不为整理目录移动五个已发布模块，以免破坏 `.tres` 引用。

| 位置 | 职责与约束 |
| --- | --- |
| `addons/pixelfx/effects/` | 五个已发布模块路径保留；B1/B2 新效果按 `<category>/<effect>.gd` 放置，递归发现与打包已经验证 |
| `effects/<category>/*_common.gd` | 类别算法与专用 helper；已有 fire_common、analytic_helpers 按实际复用继续使用，不先做大重构 |
| `core/` | 数学、颜色、Painter、帧和粒子等通用原语；只有多个类别实际需要时才提取新能力 |
| `runtime/` | 播放、缓存、预热、池化；与效果种类解耦，新增通用能力先单独验证 |
| `resources/preset.gd`、`presets/` | 参数资源与预设；不保存播放器的可变模拟状态 |
| `editor/` | 通用发现、参数编辑、预览、保存；244 项规模下增加分类/搜索前先测现有体验 |
| `tools/pixelfx/reference.mjs` | 固定上游参考输出；逐批增加效果适配及确定性时序，不依赖在线最新版 |
| `tests/pixelfx/` | 图像比较、生命周期、实例隔离、边界、编辑器及性能报告 |
| `demos/` | 分类图鉴和特殊输入/角色编排示例，游戏控制逻辑不混入视觉模块 |

每个模块必须声明唯一 id、正 duration、loop、fps、layers、cacheable，参数声明类型、默认值、边界及调色板，bounds 覆盖全部粒子与光照且满足现有 1..1024 限制。超过限制的效果先提出明确方案，不靠裁剪隐藏问题。

解析型效果采用纯 `draw(time, options, seed)`，允许 seek、共享缓存与预热。有状态效果采用独立实例、`cacheable=false`、`update(dt)`，沿用最大 1/120 秒步进；draw/draw_back 不推进状态，调参明确重播，不承诺 seek/预热。优先忠实保留原模拟，只有证明等价后才考虑解析化。

chain、sim、actor、场景输入等缺失能力按使用案例补齐。视觉播放器只处理视觉生命周期；移动轨迹、碰撞判定、伤害和命中时间由游戏或演示编排层负责。确需修改公共契约时，单独设计版本升级、旧预设读取及回归，不在某个效果 PR 中暗改。

## 4. 单个效果的标准迁移流程

1. 阅读上游模块、类别 `_lib` 和间接依赖，记录生命周期、随机数顺序、输入、分层、参数和来源哈希。
2. 建立参考用例：默认值、多种 seed、参数极值、配色、开始/峰值/结束、循环接缝；有状态效果明确固定步长和更新顺序。
3. 先补最小依赖及对应验证，再实现效果模块和默认预设。依赖已有实现时复用，禁止重新造一份近似 RNG 或混色逻辑。
4. 对照参考帧定位差异，逐项解释取整、颜色混合、随机序列及浮点误差；容差按效果和案例登记，不能只比较平均误差。
5. 检查暂停、倍速、停止、重播、结束信号、实例隔离、前后遮挡和最大边界。一次性效果检查终止与残留，有状态效果检查不同帧率下的时间推进。
6. 在原生 Godot 正常速度观看透明、明暗背景和极值参数；录制对照与接缝，检查节奏、拖尾、遮挡、裁切。像素测试通过不能代替视觉验收。
7. 测冷生成、热缓存、独立参数、多实例、内存和长时间播放；报告硬件/版本及工作负载，发现超预算再优化，不提前承诺 GPU 重写。
8. 更新来源、迁移台账、图鉴、文档，运行相关验证。小 PR 合入前执行现有完整 gate；发布再核验标签提交 CI、安装包内容与 SHA-256。

## 5. 批次策略

批次是依赖与验收里程碑，不是一个巨大 PR。后续实现可按 2–4 个同依赖效果拆分 PR；明确指定较大批次时，每项仍须满足同样退出条件。B2 首批按 20 项交付。新增基础能力应保持可独立审阅。已完成以下 B1 六个探针：`impacts/hit-spark`、`explosions/small-explosion`、`spawn/poof`、`fire/campfire`、`projectiles/rocket`、`water/splash`。六项的依赖选择、实现边界及验收见 [B1 审阅](b1-probe-review.zh-CN.md)。

B1 已完成；后续效果按下表所属类别归组。跨类别依赖可提前迁入最小 helper，但不能提前把未验收效果算作完成。B1 六项从其后批次扣除，避免重复计数。

| 批次 | 计划算法数 | 目标累计 | 已完成 | 剩余 | 工作重点 |
| --- | ---: | ---: | ---: | ---: | --- |
| B0 基线盘点 | 5（既有基线） | 5 | 5 | 0 | 五效果基线、244 项台账与依赖盘点 |
| B1 能力探针 | 6 | 11 | 6 | 0 | 一次性、有状态、组合播放与边界验证 |
| B2 | 49 | 60 | 41 | 8 | 基础元素与弹体；四十一项已验收 |
| B3 | 42 | 102 | 0 | 42 | 命中、近战、爆炸、生成消散与结束清理 |
| B4 | 35 | 137 | 0 | 35 | 复杂轨迹、chain 与叠层光照 |
| B5 | 38 | 175 | 0 | 38 | 持续模拟、环境覆盖与实例成本 |
| B6 | 35 | 210 | 0 | 35 | 数值/文字输入、交互展示和复杂程序绘制 |
| B7 | 12 | 222 | 0 | 12 | 生物形态、骨架或程序运动依赖 |
| B8 | 10 | 232 | 0 | 10 | 场景输入、遮罩及过渡起止 |
| B9 | 12 | 244 | 0 | 12 | 所需 actor/rig/act/poses 与组合时间线 |
| **合计（含 B0 基线）** | **244** | **244** | **52** | **192** | |

机器可读 [docs/migration-status.json](../migration-status.json) 已建立，覆盖全部 244 项，包含来源/hash、批次、依赖、类型、状态、Godot 路径、参考案例、视觉证据、性能与剩余问题。状态依次为待分析、依赖准备、实现中、像素验证、运行/视觉验证、完成；脚本检查无遗漏、无重复，预设不计数。B1/B2 的完成状态由验收记录及源码哈希校验约束。

B2–B6 依赖 B1；B7、B8 先完成各自能力探针再扩展；B9 在被引用基础效果和角色编排能力验收后完成。每批允许重排内部顺序，调整批次归属必须保持总数守恒。

## 6. 每批退出条件与发布

只有模块、预设/API、来源记录、参考测试、正常速度视觉验收、生命周期、边界与性能证据齐全才算完成。已有五效果在每批完整回归中持续保留。任何无法等价迁移的项必须列为阻塞，不得靠换名、空实现或改计数完成批次。

统一执行 `python3 tools/pixelfx/check.py`（需要时设置 GODOT_BIN、PIXELFX_UPSTREAM），新增项必须进入 gate，不能仅新增独立测试文件。保留当前 Godot 4.3/Linux CI 与本机验证；其他平台列为待验证。持续测量目录扫描和图鉴加载，避免全目录启动时同步预热 244 项；按选中项/常用预设预热并遵守缓存上限。

每批验收后可形成一个预览版本，版本号在发布时确定，不预先绑定批次数。使用现有 package_demo.py 打包，在干净项目验证 addon 安装和源码图鉴，检查来源声明、包内容、校验和及 CI；版本、CHANGELOG 和兼容性说明同步。文档计划本身不授权自动推送、合并或发布。

## 7. 估算与下一步

B0、B1 与 B2 的 41 项已完成。后续继续记录每效果的阅读、依赖、移植、对照、视觉修正耗时，以及共用能力的独立成本。按解析型、模拟型、角色编排型、场景输入型分别估算剩余工作；每批完成后更新。未审阅全部间接依赖前，不给出虚假的固定交付日期。

下一步：依据逐项性能测量继续处理超过预算的效果，再补齐 192 项的视觉与平台验收。逐像素执行层与首次依赖初始化已有优化；Inspector 切换已修复，最新探针与性能数据统一记录在本轮验收报告。源码已覆盖 B2–B9，台账的“完成”仍只用于完整验收通过的 52 项。

## 附录：待完整验收效果的批次清单

下列清单来自固定版本目录和当前台账，列出本轮已迁移、待完整验收的 192 项：B2 尚待验收 8 项，B3–B9 共 184 项，合计 **192 项**。已验收的 52 项见[完整目录](../../addons/pixelfx/docs/CATALOG.md)，B2 首批 20 项见[本批验收说明](b2-twenty-review.zh-CN.md)。

### B2（剩余 8 项；原计划 49 项）

- `fire/fire-ring`
- `ice/freeze`
- `ice/frost-nova`
- `holy/blessing`
- `holy/divine-shield`
- `holy/halo`
- `holy/heal`
- `holy/resurrection`

### B3（42 项）

- `impacts/blunt-hit`
- `impacts/bullet-impact`
- `impacts/crit-hit`
- `impacts/ground-slam`
- `impacts/heavy-landing`
- `impacts/hit-flash`
- `impacts/impact-frame`
- `impacts/parry`
- `impacts/ricochet`
- `impacts/shield-block`
- `melee/claw-swipe`
- `melee/dagger-flurry`
- `melee/double-slash`
- `melee/hammer-smash`
- `melee/heavy-cleave`
- `melee/scythe-reap`
- `melee/spear-sweep`
- `melee/spin-slash`
- `melee/sword-slash`
- `melee/thrust`
- `melee/uppercut`
- `melee/whip-crack`
- `explosions/barrel-explosion`
- `explosions/big-explosion`
- `explosions/cartoon-pow`
- `explosions/dirt-explosion`
- `explosions/firework-burst`
- `explosions/firework-rocket`
- `explosions/grenade`
- `explosions/implosion`
- `explosions/nuke`
- `explosions/plasma-explosion`
- `explosions/smoke-bomb`
- `spawn/coin-drop`
- `spawn/disintegrate`
- `spawn/dissolve-burn`
- `spawn/egg-hatch`
- `spawn/respawn-beam`
- `spawn/shatter-death`
- `spawn/soul-rise`
- `spawn/spawn-portal`
- `spawn/summon-rise`

### B4（35 项）

- `arcane/arcane-beam`
- `arcane/arcane-missiles`
- `arcane/arcane-orb`
- `arcane/blink-in`
- `arcane/blink-out`
- `arcane/magic-circle-cast`
- `arcane/mana-burst`
- `arcane/portal`
- `arcane/rune-circle`
- `arcane/spell-charge`
- `arcane/star-fall`
- `arcane/time-stop`
- `lightning/ball-lightning`
- `lightning/chain-lightning`
- `lightning/charge-up`
- `lightning/electrified`
- `lightning/lightning-strike`
- `lightning/plasma-ball`
- `lightning/spark-arc`
- `lightning/storm-cloud`
- `lightning/tesla-coil`
- `lightning/thunderclap`
- `lightning/zap-hit`
- `shadow/black-hole`
- `shadow/curse`
- `shadow/dark-explosion`
- `shadow/eclipse`
- `shadow/grasping-hands`
- `shadow/hex-sigil`
- `shadow/life-steal`
- `shadow/necro-skulls`
- `shadow/shadow-flames`
- `shadow/shadow-tendrils`
- `shadow/soul-drain`
- `shadow/void-orb`

### B5（38 项）

- `nature/acid-splash`
- `nature/boulder`
- `nature/earth-spike`
- `nature/healing-bloom`
- `nature/leaf-storm`
- `nature/poison-cloud`
- `nature/quake`
- `nature/root-snare`
- `nature/spore-burst`
- `nature/thorns`
- `nature/tornado`
- `nature/toxic-puddle`
- `nature/vine-whip`
- `weather/aurora`
- `weather/blizzard`
- `weather/cherry-blossoms`
- `weather/clouds`
- `weather/falling-leaves`
- `weather/fireflies`
- `weather/fog`
- `weather/god-rays`
- `weather/rain`
- `weather/shooting-stars`
- `weather/snow`
- `weather/storm`
- `status/bleeding`
- `status/burning`
- `status/charmed`
- `status/confused`
- `status/cursed`
- `status/frozen`
- `status/haste`
- `status/petrified`
- `status/poisoned`
- `status/rage`
- `status/sleep`
- `status/slowed`
- `status/stunned`

### B6（35 项）

- `pickups/chest-open`
- `pickups/coin-spin`
- `pickups/collect-burst`
- `pickups/crystal-shard`
- `pickups/gem-spin`
- `pickups/heart-pickup`
- `pickups/key-glint`
- `pickups/loot-beam`
- `pickups/potion`
- `pickups/power-star`
- `pickups/xp-orb`
- `ui/achievement`
- `ui/coin-collect`
- `ui/combo-counter`
- `ui/confetti`
- `ui/countdown`
- `ui/crit-number`
- `ui/damage-number`
- `ui/exclamation`
- `ui/health-bar-hit`
- `ui/heart-lost`
- `ui/level-up`
- `ui/quest-complete`
- `scifi/emp-blast`
- `scifi/energy-core`
- `scifi/force-field`
- `scifi/glitch`
- `scifi/hologram`
- `scifi/jetpack`
- `scifi/laser-grid`
- `scifi/scanner`
- `scifi/teleporter-pad`
- `scifi/tractor-beam`
- `scifi/warp-in`
- `scifi/warp-out`

### B7（12 项）

- `critters/bat`
- `critters/bird`
- `critters/butterfly`
- `critters/eyeball`
- `critters/fish-school`
- `critters/flying-skull`
- `critters/frog`
- `critters/ghost`
- `critters/jellyfish`
- `critters/slime`
- `critters/snake`
- `critters/wisp`

### B8（10 项）

- `transitions/blinds`
- `transitions/burn-away`
- `transitions/crt-off`
- `transitions/diamond-wipe`
- `transitions/glitch-wipe`
- `transitions/iris`
- `transitions/pixel-dissolve`
- `transitions/shatter-wipe`
- `transitions/slash-wipe`
- `transitions/star-iris`

### B9（12 项）

- `moves/arrow-shot`
- `moves/dash-strike`
- `moves/earth-stomp`
- `moves/fireball-throw`
- `moves/ground-pound`
- `moves/holy-smite`
- `moves/ice-lance-throw`
- `moves/lightning-call`
- `moves/meteor-call`
- `moves/pistol-shots`
- `moves/rocket-launcher`
- `moves/sword-combo`

交付状态：2026-11-10，[PR #10](https://github.com/norvancc/pixelfx-godot/pull/10) 已合并到 `main`（`183118a`）。[Godot 4.3 / Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42786437638) 通过目录基础播放、语义与既有验收范围回归、编辑器和打包检查；新增 192 项的完整验收计数保持不变。使用入口见 [Wiki](https://github.com/norvancc/pixelfx-godot/wiki)。
