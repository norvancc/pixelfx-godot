# 性能、兼容与导出

## 渲染策略

算法在 CPU 生成像素，合成为 RGBA8，经 ImageTexture/Sprite2D 交给 Godot。
纯时间效果按参数、算法源码版本、边界、采样帧建立共享缓存；变换、镜像和节点位置不进入缓存键。
未命中时实时生成，命中后只复用纹理。缓存是在运行时按需生成的，不要求额外美术图集。
缓存关闭、有状态模拟和淡出使用实例纹理更新；没有把不同实例的模拟状态合并。

默认 LRU 为 32 MiB、256 个采样帧，以双份 RGBA8 估算 CPU/GPU 图像成本。
这不是整个进程的显存/内存上限：活动实例、Godot 驱动、帧缓冲和其他场景资源另占空间。
预热检查整个效果是否可容纳；预算不足会失败，避免“预热完却已把前面的帧淘汰”。

## 已测基准

macOS / Apple M4 Pro / Godot 4.7.2，headless CPU 基准，默认火球 30 FPS，逻辑更新 60 Hz。
先预热一个完整循环，再运行 180 个逻辑 tick。下表衡量 CPU 更新/缓存查找/纹理指派，**不包含完整场景 GPU 合成**。

| 同参数、同步实例 | 平均 CPU ms/tick | P95 ms/tick | 缓存未命中 |
| --- | ---: | ---: | ---: |
| 1 | 0.0033 | 0.006 | 0 |
| 16 | 0.0528 | 0.090 | 0 |
| 64 | 0.2031 | 0.346 | 0 |

一个循环 36 帧，估算缓存约 6.5 MiB，预热约 0.73 秒。
16 个不同 seed 的首次创建/校验/绘制/上传，平均约 20.0 ms/个、最大约 21.2 ms/个。
数据来自 builds/pixelfx/benchmark-v010.json；负载和平台变化后应重新测量。

因此项目应在加载阶段预热常用预设，复用相同参数，按需使用对象池。
大量每帧变化的参数、大画布和独立种子会降低共享率。库已提供预算/统计/禁用选项，
但不能据热缓存数据声称任意 64 个复杂特效都能达到同样速度。
有状态效果仍按各自算法成本运行；需要更多吞吐时可在保持公共接口不变的前提下增加原生后端。

## 0.2.0 五效果默认参数成本

同一本机 Godot 4.7.2 headless，逐帧冷生成完整循环。CPU 均值与估算缓存如下，
不是其他机器或 GPU 的性能承诺。

| 效果 | 冷生成均值 ms/帧 | 循环帧数 | 缓存 MiB |
| --- | ---: | ---: | ---: |
| Fireball | 20.2 | 36 | 6.52 |
| Ice lance | 12.3 | 24 | 4.92 |
| Laser bolt | 3.7 | 15 | 0.79 |
| Sunburst | 28.0 | 120 | 15.00 |
| Ripples | 24.7 | 60 | 10.96 |

总循环 255 帧、约 38.2 MiB，超过库默认 32 MiB 预算。演示图鉴单独申请
64 MiB / 384 帧，退出后恢复配置；库默认值不变。场景应按实际需要预热或提高预算，
不要同时启动大量未预热且参数不同的日芒/涟漪。参考 `catalog-v020.json`。

## B1 默认参数成本（未发布源码）

新增六项的完整默认循环/生命周期在同一本机 headless 环境测量。具体数值、帧数和环境保存在 `../validation/b1.json`，由 `catalog-latest.json` 的当前运行生成。一次性效果均为独立模拟，缓存占用为 0；Campfire/Rocket 可共享缓存及预热。爆炸边界随 size 增长。

本机测得 Hit spark 约 5 ms、Poof 约 10 ms、Splash 约 23 ms、Small explosion 约 32 ms/帧；Campfire/Rocket 约 38–42 ms/冷帧。爆炸峰值可达约 90 ms。实际数值以验收 JSON 为准；这些是默认参数下的测量，不承诺 30 FPS，也不含完整游戏的 GPU 合成和逻辑成本。

384 次重播检查每项 32 个 seed，完成两轮后对象数不增加，静态内存增长低于 1 MiB，取消后缓存清空。这是固定重播负载的资源检查，不等价于长时间真实游戏的内存保证。

## 兼容范围

运行时是标准 GDScript + CanvasItem，不依赖编辑器 API、外部动态库或 Autoload。
API 目标为 Godot 4.3+。**4.7.2 / macOS / GL Compatibility** 已做可见编辑器和演示检查。
**Godot 4.3 / Ubuntu / headless** 已通过 GitHub CI 的导入、原版对照、运行时、编辑器和打包检查：
[验证运行](https://github.com/norvancc/pixelfx-godot/actions/runs/42019538955)。4.3 使用主 Inspector 编辑预览参数；新版可使用内嵌 Inspector。
其他 Godot 版本、Windows/Linux 可见窗口实机、移动端、Web 及 Forward+/Mobile 渲染器未实测。

## 导出

项目只需直接引用 `.tres` 预设，Godot 会收集其 Script 依赖。
运行时没有目录扫描；不要求把编辑器插件启用状态带入游戏。
示例 export_presets.cfg 排除 editor、templates、tests、tools，保留 MIT 声明和来源信息。
macOS universal/arm64 示例项目启用 Godot 所需的 ETC2 ASTC 导入选项。

本次 macOS universal .app 已实际导出、校验 ad-hoc 签名并启动检查。
这属于本机运行验证，未进行 Apple 公证或商店发布。
不要把 macOS 导出成功等同于其他平台已验证。
