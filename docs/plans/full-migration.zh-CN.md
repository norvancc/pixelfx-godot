# PixelFX 全量迁移计划

日期：2026-11-09。本文是执行计划，不表示以下能力已经实现；仅新增计划，不修改运行时代码。

## 1. 范围与基线

以 `addons/pixelfx/provenance.json` 固定的 PixelFX 0.3.0、提交 `a84159688af3ca37a4be05a0d422b94451b2e24e` 为唯一迁移基线。本地上游目录共 21 类、244 个效果模块。已迁移 Fireball、Ice lance、Laser bolt、Sunburst、Ripples，剩余 239 个。Arcane Fireball 是换色预设，不另计一个效果。上游后续新增内容另开增量计划，不改变本轮分母。

“全量”包括 moves、critters、transitions 等困难类别，不能用相似动画或静态截图抵充。actor / rig / act / poses 等系统以支撑这 244 个效果所需的能力为本轮范围；完整角色制作工具不自动纳入。依赖外部图像、角色或场景输入的效果必须提供输入接口与可运行示例，不能静默删掉行为。

依据：`history.md` 的五效果交付记录、当前源码、AUTHORING、ROADMAP、验证脚本及本地固定版本上游目录。历史记录中的 447 组渲染比较、70 项运行检查、171 项目录/边界/图鉴检查及 23 项编辑器检查是 v0.2.0 的历史结果，本次文档工作没有重新运行这些检查。

## 2. 从前五个效果沿用的做法

- 原生 GDScript 重现原算法，保留来源、MIT 声明与文件哈希；不以预渲染序列帧替代算法迁移。
- 同 seed、参数、时间、背景及前后层做上游 RGBA 对照。历史上浮点差异已出现，必须记录差异原因和范围，不能随效果数量增加而统一放宽容差。
- Ripples 的前后层围绕场景对象绘制是分层范例；两层必须读取同一时刻、同一模拟实例。
- 五个已有效果都是循环效果；下一步先验证一次性生命周期与真实有状态效果，再规模复制。
- 历史冷生成均值约 3.7–28 ms/帧，说明 CPU 成本需要持续测量；不能把演示图鉴临时 64 MiB 缓存当成库默认值，当前默认仍为 32 MiB。

## 3. 代码规划

保持现有契约 v1 和已发布脚本路径。增加效果不修改播放器或编辑器中的名称分支，也不为整理目录移动五个已发布模块，以免破坏 `.tres` 引用。

| 位置 | 职责与约束 |
| --- | --- |
| `addons/pixelfx/effects/` | 现有五效果保留；新效果按 `<category>/<effect>.gd` 放置，首批确认递归发现与打包覆盖 |
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

批次是依赖与验收里程碑，不是一个巨大 PR。每个实现 PR 建议 2–4 个同依赖效果；新增基础能力单独提交。先做以下 B1 的六个探针：`impacts/hit-spark`、`explosions/small-explosion`、`spawn/poof`、`fire/campfire`、`projectiles/rocket`、`water/splash`。这些是候选探针，开工逐项读取源码确认真实依赖；若不能覆盖一次性、有状态与发射组合，必须在 B1 中替换并登记原因。

B1 完成前不批量铺开；其余效果按下表所属类别归组。跨类别依赖可提前迁入最小 helper，但不能提前把未验收效果算作完成。B1 六项从其后批次扣除，避免重复计数。

| 批次 | 新增数 | 累计数 | 工作重点 |
| --- | ---: | ---: | --- |
| B0 基线盘点 | 0 | 5 | 建台账、确认目录与依赖、保存现有回归基线 |
| B1 能力探针 | 6 | 11 | 一次性、有状态、组合播放与边界验证 |
| B2 | 49 | 60 | 复用已验证类别，补齐基础元素与弹体 |
| B3 | 42 | 102 | 一次性命中、爆炸、生成消散及结束清理 |
| B4 | 35 | 137 | 复杂轨迹、chain 与叠层光照 |
| B5 | 38 | 175 | 持续模拟、环境覆盖与实例成本 |
| B6 | 35 | 210 | 数值/文字输入、交互展示和复杂程序绘制 |
| B7 | 12 | 222 | 生物形态、骨架或程序运动依赖 |
| B8 | 10 | 232 | 场景输入、遮罩及过渡起止 |
| B9 | 12 | 244 | 所需 actor/rig/act/poses 与组合时间线；游戏逻辑留在外层 |

B0 建议新增机器可读 `docs/migration-status.json`：每项包含 upstream_id、source/hash、batch、依赖、解析/模拟类型、状态、Godot 路径、参考案例、视觉证据、性能报告及剩余问题。状态依次为待分析、依赖准备、实现中、像素验证、运行/视觉验证、完成；阻塞项明确原因。自动检查 244 项唯一且无遗漏，预设不计数。此文件是待实施工作，本次未生成或声称其已存在。

B2–B6 依赖 B1；B7、B8 先完成各自能力探针再扩展；B9 在被引用基础效果和角色编排能力验收后完成。每批允许重排内部顺序，调整批次归属必须保持总数守恒。

## 6. 每批退出条件与发布

只有模块、预设/API、来源记录、参考测试、正常速度视觉验收、生命周期、边界与性能证据齐全才算完成。已有五效果在每批完整回归中持续保留。任何无法等价迁移的项必须列为阻塞，不得靠换名、空实现或改计数完成批次。

统一执行 `python3 tools/pixelfx/check.py`（需要时设置 GODOT_BIN、PIXELFX_UPSTREAM），新增项必须进入 gate，不能仅新增独立测试文件。保留当前 Godot 4.3/Linux CI 与本机验证；其他平台列为待验证。持续测量目录扫描和图鉴加载，避免全目录启动时同步预热 244 项；按选中项/常用预设预热并遵守缓存上限。

每批验收后可形成一个预览版本，版本号在发布时确定，不预先绑定批次数。使用现有 package_demo.py 打包，在干净项目验证 addon 安装和源码图鉴，检查来源声明、包内容、校验和及 CI；版本、CHANGELOG 和兼容性说明同步。文档计划本身不授权自动推送、合并或发布。

## 7. 估算与下一步

先完成 B0 和 B1，记录每效果的阅读、依赖、移植、对照、视觉修正耗时，以及共用能力的独立成本。按解析型、模拟型、角色编排型、场景输入型分别估算剩余工作；每批完成后更新。未审阅全部间接依赖前，不给出虚假的固定交付日期。

首个执行任务：建立 244 项台账、保留五项已完成状态，审阅六个探针依赖并选出真正有状态案例；先把这一小组从源码到图鉴、对照和运行验收做完整，再推进全类别。

## 附录：剩余效果的批次清单

下列清单直接取自本地固定版本的效果目录。B1 六项见上文，已有五项不再列入；B2–B9 合计 233 项，连同 B1 为剩余 239 项。

### B2（49 项）

- `fire/brazier`
- `fire/candle`
- `fire/fire-breath`
- `fire/fire-ring`
- `fire/fire-tornado`
- `fire/flame-pillar`
- `fire/flamethrower`
- `fire/meteor`
- `fire/spirit-flame`
- `fire/torch`
- `ice/blizzard-vortex`
- `ice/freeze`
- `ice/frost-breath`
- `ice/frost-nova`
- `ice/ice-crystal`
- `ice/ice-shatter`
- `ice/ice-spikes`
- `ice/icicle-fall`
- `ice/snowflake-burst`
- `projectiles/arrow`
- `projectiles/bullet-tracer`
- `projectiles/cannonball`
- `projectiles/energy-disc`
- `projectiles/flare`
- `projectiles/homing-missile`
- `projectiles/magic-missile`
- `projectiles/muzzle-pistol`
- `projectiles/muzzle-shotgun`
- `projectiles/muzzle-smg`
- `projectiles/plasma-shot`
- `holy/blessing`
- `holy/divine-shield`
- `holy/feather-burst`
- `holy/halo`
- `holy/heal-aoe`
- `holy/heal`
- `holy/holy-pillar`
- `holy/resurrection`
- `holy/smite`
- `water/bubbles`
- `water/drip`
- `water/fountain`
- `water/geyser`
- `water/rain-splash`
- `water/water-jet`
- `water/water-orb`
- `water/waterfall`
- `water/wave-crash`
- `water/whirlpool`

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
