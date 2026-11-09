# 全量源码迁移（基础检查阶段）

固定基线仍为 PixelFX 0.3.0 / `a84159688af3ca37a4be05a0d422b94451b2e24e`。源码阶段覆盖 **244/244 个算法、245 个预设**；原有 **52 项完整验收记录不变**，新增 **192 项待完整验收**。最新已发布版本仍为 0.2.0，不包含本分支全部效果。

本轮用户明确要求先迁完全部效果，只做导入、加载、播放的成功性检查，暂缓单测、完整像素对照和录像。本说明及 [smoke.json](native/smoke.json) 只记录这个范围。基础检查覆盖创建实例、加载默认预设、绘制前后层、1/30 秒播放推进及约 45% 生命周期的单个抽样时刻；不证明视觉等价、全部生命周期、参数极值、实时性能或跨平台兼容。

## 实现与生成

新增项以固定源码为输入，构建时将函数、类、几何绘制、粒子模拟、闭包和动作编排编译成原生 GDScript。`native/compiled/` 保存生成的依赖模块；`effects/<category>/` 保存 192 个公共效果入口；每项均有 `.tres` 默认预设。运行时不解析 JavaScript、没有 JavaScript 引擎，也不使用烘焙动画替代算法。

`native/semantics.gd` 补充闭包作用域、JS 的 32 位位运算、Float32/整数缓冲、稳定排序和集合行为；Painter 复用原有原生绘制方法，并补齐遮罩、像素字体和裁剪。所有新增项暂时禁用共享帧缓存、seek 和预热，避免未经验证的缓存语义。通用生成路径的 CPU 成本还未优化，不沿用前 52 项的性能结论。

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

本轮生成实现保留了全部源算法和依赖，但尚未经过像素或完整视觉验证，不能据此宣称与上游逐像素等价。天气等大画布效果通过通用生成路径执行，基础检查记录里可能出现数十秒甚至更长的初始化与抽样成本；实际项目接入前需要补做性能优化与预算验证。
