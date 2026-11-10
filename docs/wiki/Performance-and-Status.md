# 性能与当前状态

更新于 2026-11-10。全量源码迁移已通过 [PR #10](https://github.com/norvancc/pixelfx-godot/pull/10) 合并到 `main`，merge commit 为 `183118a`。

| 指标 | 当前记录 |
| --- | --- |
| 源码覆盖 | 244/244 算法，245 个预设 |
| 完整验收 | 52/244；新增 192 项继续保留待完整验收标记 |
| 正式发行包 | 0.2.0，五个算法 |
| 新增路径最后完整本机快照 | 6500 个像素用例、979 项编辑器断言通过 |
| 旧 52 项回归 | 7081 个像素用例及运行/边界/重复播放检查通过 |
| Linux CI | [Godot 4.3 / Ubuntu](https://github.com/norvancc/pixelfx-godot/actions/runs/42786437638) 通过；含目录基础播放、语义、既有验收范围回归、编辑器和打包 |

6500 用例属于最后完整快照。之后的优化有定向检查，119 项扩展复跑按交付决定中止，没有写成通过。报告保留历史源码哈希与交付差异；Linux CI 通过也不表示全部新增项的极值参数、视觉和性能已经通过。

## 实际性能

渲染在 CPU 生成像素后上传纹理。通用执行层的多个秒级热点已降到几十毫秒，例如 Jetpack 约从 1000 ms 降到 24 ms，Gem spin 从约 674 ms 降到 9–11 ms；这些是指定帧的 CPU 采样，不是全生命周期 FPS。

M4 Pro / macOS / Godot 4.7.2 的可见窗口中，Fire ring、Blessing、Divine shield、Halo、Heal、Resurrection、Freeze、Frost nova 在禁帧缓存时测得约 **29.4–29.9 次效果更新/秒**。八项完整周期 CPU p95 均低于 33.3 ms，仍有约 52 ms 的单帧峰值。该结果只覆盖这八项和该测试环境。

192 项三点暖帧基线仍有 98 项超出 33.3 ms；之后若干定向优化改善了热点，但没有再次宣称全目录达到 30 FPS。

## 接入建议

使用完整图鉴观察 `CPU ms` 与场景 FPS，按目标机器实测同屏负载。有状态效果不能依赖共享帧缓存。解析效果可以在加载时预热，缓存有内存预算；不要在首个战斗帧集中初始化许多重型效果。

[本轮完整记录](https://github.com/norvancc/pixelfx-godot/blob/main/docs/plans/native-acceptance-review.zh-CN.md) · [性能文档](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/docs/PERFORMANCE.md) · [机器报告](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/validation/native-review.json) · [反馈问题](https://github.com/norvancc/pixelfx-godot/issues)
