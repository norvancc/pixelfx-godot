# B1 探针依赖审阅

日期：2026-11-09。审阅基线为 `addons/pixelfx/provenance.json` 固定的
`a84159688af3ca37a4be05a0d422b94451b2e24e`。本文件记录源码阅读结果，不能代替
Godot 实现、像素对照或正常速度视觉验收。六项探针现已完成；下文保留当时的依赖判断，最新全目录状态为 31/244，见 [迁移台账](../migration-status.json)。

## 选择结果

六项探针覆盖了两种生命周期、一次性和循环效果、前后层以及粒子/光照组合：

| 效果 | 类型 | 生命周期 | 主要依赖 | 选择理由 |
| --- | --- | --- | --- | --- |
| `impacts/hit-spark` | 有状态 `create()` | 0.5 秒，一次性 | `core/sim.js` 的 `Particles`、`Lights`、`core/color.js` | 最小的一次性命中火花，包含粒子、前后绘制和光照 |
| `explosions/small-explosion` | 有状态 `create()` | 5.4 秒，一次性 | `core/sim.js` 的 `Particles/Bits/Blazes/Lights/band` | 覆盖烟雾、火焰、岩块、落地回调、前后层和结束清理 |
| `spawn/poof` | 有状态 `create()` | 1.6 秒，一次性 | `core/sim.js`、`core/color.js` | 覆盖延迟粒子、消散时的二次生成和前后遮罩 |
| `fire/campfire` | 解析型 `draw(t)` | 3 秒，循环 | `fire/_lib.js`、`core/particles.js`、`core/math.js` | 验证循环噪声、闭合粒子相位、火焰与木柴叠层 |
| `projectiles/rocket` | 解析型 `draw(t)` | 1.2 秒，循环 | `projectiles/_lib.js`、`fire/_lib.js`、`core/sim.js` | 验证专用 `pixelShape`、弹体/尾焰/烟雾组合与方向性 |
| `water/splash` | 有状态 `create()` | 2.5 秒，一次性 | `water/_lib.js`、`core/particles.js`、`core/sim.js`、`core/math.js` | 覆盖水冠前后层、落点回调、环、泡沫、薄雾及多次事件 |

## 已确认的实现边界

- `hit-spark`、`small-explosion`、`poof`、`splash` 都在 `create()` 中保存可变模拟状态，不能复用解析效果的 seek、共享帧缓存或预热路径。播放器应继续以独立实例和最大 1/120 秒步进驱动它们。
- `campfire` 和 `rocket` 不保存播放状态，可沿用 `draw(time, options, seed)` 契约；循环噪声和粒子相位必须在 `t=0` 与 `t=duration` 对齐。
- `small-explosion` 与 `splash` 的落地回调会在更新期间继续生成粒子或水滴。回调顺序、随机数消费顺序和二次生成必须保持稳定，不能先解析化。
- `splash`、`small-explosion`、`poof` 依赖前后层共享同一模拟实例；`draw_back` 只能绘制，不能推进状态。
- `rocket` 的上游 `pixelShape` 是新的通用原语候选，但在确认至少两个效果复用前不提取到 `core/`；第一版迁移可以保留在 `effects/projectiles/` 专用 helper。

## 依赖准备顺序

1. 先补齐 `Lights`、有状态粒子列表、落地回调和专用绘制 helper，并为这些原语添加隔离/步进测试。
2. 实现 `hit-spark` 作为最小有状态探针，完成默认、seed、极值、停止和前后层用例。
3. 复用同一粒子/光照原语实现 `poof`，再实现 `small-explosion` 的岩块、火焰和落地二次生成。
4. 在水类 helper 就绪后实现 `splash`，重点检查同一实例的前后层遮挡与多事件顺序。
5. 最后实现解析型 `campfire` 和 `rocket`，确认循环接缝、`pixelShape` 边界及冷生成成本。

每项完成前必须写入 `docs/migration-status.json` 的参考案例、视觉证据、性能报告和剩余问题；只生成脚本或能被目录发现不能改变状态为“完成”。

## 当前实现进度

六项均已完成算法修正、809 组上游像素对照、原生 30 FPS 深浅背景/镜像录制及运行、编辑器和重复播放检查。新增脚本位于分类子目录，台账由 `addons/pixelfx/validation/b1.json` 的验收记录及源码哈希决定完成状态；源码变化会使该验收失效。原生录制不代表冷生成或高并发实时帧率保证。B2 首批 20 项已复用这些能力并验收；当前源码的 Linux 回归与 B2 新增结果见 [B2 本批说明](b2-twenty-review.zh-CN.md) 和[总验证记录](../../addons/pixelfx/VALIDATION.md)。
