# 全量源码迁移与待验收范围

固定基线仍为 PixelFX 0.3.0 / `a84159688af3ca37a4be05a0d422b94451b2e24e`。源码阶段覆盖 **244/244 个算法、245 个预设**；原有 **52 项完整验收记录不变**，新增 **192 项待完整验收**。最新已发布版本仍为 0.2.0，不包含本分支全部效果。

2026-11-09 的源码迁移阶段仅做基础检查；2026-11-10 已恢复像素、运行、录像与性能验收。本轮已修复多项语义错误和实时性能瓶颈，并完成 6500 个像素用例、192 项性能抽样及 979 项编辑器断言。重点八项可见播放接近 30 次效果更新/秒；全目录仍有超预算项，完整验收尚未通过。详见 [本轮验收记录](../../docs/plans/native-acceptance-review.zh-CN.md)。[smoke.json](native/smoke.json) 仍保留 `full_acceptance=false`，不能代表全部生命周期、参数极值、实时性能或跨平台兼容。

## 实现与生成

新增项以固定源码为输入，构建时将函数、类、几何绘制、粒子模拟、闭包和动作编排编译成原生 GDScript。`native/compiled/` 保存生成的依赖模块；`effects/<category>/` 保存 192 个公共效果入口；每项均有 `.tres` 默认预设。运行时不解析 JavaScript、没有 JavaScript 引擎，也不使用烘焙动画替代算法。

`native/semantics.gd` 补充闭包作用域、JS 的 32 位位运算、Float32/整数缓冲、稳定排序和集合行为；Painter 复用原有原生绘制方法，并补齐遮罩、像素字体和裁剪。所有新增项暂时禁用共享帧缓存、seek 和预热，避免未经验证的缓存语义。数值局部变量、逐行合成、确定性噪声格点、循环粒子与逐像素热点已有直接原生路径；其余函数保留通用语义路径，性能仍按效果独立测量。

来源及文件 SHA-256 见 [sources.json](native/sources.json) 和 [provenance.json](provenance.json)。再生成命令：

```sh
node tools/pixelfx/codegen/generate.mjs /absolute/path/to/pinned/upstream
```

生成器只处理 `native/catalog.json` 声明的 192 项公共入口，不覆盖前 52 项的已验收 GDScript。Acorn 8.15.0 仅用于构建，MIT 声明位于仓库 `tools/pixelfx/codegen/ACORN-LICENSE`；插件运行包不需要它。上游额外声明保留在 [UPSTREAM-NOTICE.md](native/UPSTREAM-NOTICE.md)。未打包上游 gallery 字体或角色游戏素材。

## 使用与输入

在 Godot 中打开 `demos/pixelfx/full_gallery.tscn`，搜索或选择效果；每次只加载选中项，可切换角色演出、暂停、重播和背景。插件单独安装时，给现有 `PixelFXPlayer2D.effect` 赋对应预设。目录见 [CATALOG.md](docs/CATALOG.md)。

角色效果支持 `actor` Dictionary：`{mask:{w,h,data},pixels,x,y,w,h,k,head,chest}`。`mask.data` 为逐像素占用，`pixels` 为 ABGR 颜色，`x/y` 为相对效果原点的左上角；未提供时使用上游默认角色。可用 `native/act.gd` 的 `stock_actor()`、`posed_actor()`，或 `native/inputs.gd` 从自己的 Image 构建输入。

角色演出可用 `native/act.gd`：以 `Act.new("moves/fireball-throw", options)` 创建，调用 `update(dt)` / `draw(frame)`，读取 pose、shake、timings；生成的 act/rig/poses/chain 保留上游演出数据。游戏仍自行处理伤害与碰撞。原始模块输入可经 `Semantics.module("fx/<category>/<effect>.js")` 获得；这里的字符串只是模块标识。

转场是独立 320×180 覆盖层；先画自己的场景，再叠加效果输出，起止画面由游戏提供。它不会替换应用场景或读取外部文件。天气保留上游画布裁剪。

## 接下来的验收

迁移台账分别记录源码覆盖和完整验收。新增 192 项仍需逐案例像素对照、默认与极值参数、完整生命周期/重播/隔离/边界、原生正常速度视觉审阅、性能与平台验收。带随机比较器的上游排序依赖引擎的比较调用顺序，需单独核对 Frozen 的随机序列；通用生成器的数值和回调兼容也属于后续验收重点。不要将基础检查报告当作旧的完整验收清单。

新增效果首次运行时会注册会话退出清理，应用或编辑器退出时自动断开闭包引用。主动关闭整个新增效果会话时，也可在释放所有实例后调用 `Semantics.shutdown()`，清除模块缓存并断开词法闭包的引用环。它是整个会话的清理入口；单个仍在使用的效果不应触发全局关闭。完整目录图鉴会在退出时调用，并在切换选中效果时回收不再使用的闭包。

基础输入检查还覆盖 73 个带角色/招式的演出入口，以及原生图片遮罩输入；独立干净项目导入后、插件禁用时，245 个预设可加载并解析为 244 个唯一算法。该结果见 [input-smoke.json](native/input-smoke.json)，仍不等同于完整动作视觉验收。

本轮生成实现保留了全部源算法和依赖，已开始逐案例像素检查，但完整视觉、实时性能和平台验收仍未完成，不能据此宣称全目录逐像素等价。天气等大画布效果已针对噪声、行缓冲和合成优化，仍有超过单实例实时预算的项目；实际接入前需要依据最新逐项测量选择负载。

交付状态：2026-11-10，[PR #10](https://github.com/norvancc/pixelfx-godot/pull/10) 已合并到 `main`（`183118a`）。[Godot 4.3 / Linux CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42786437638) 通过目录基础播放、语义与既有验收范围回归、编辑器和打包检查；新增 192 项的完整验收计数保持不变。使用入口见 [Wiki](https://github.com/norvancc/pixelfx-godot/wiki)。
