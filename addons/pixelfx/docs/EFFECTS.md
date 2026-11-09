# 新增特效：只增加模块和可选预设

1. 复制 `templates/effect.gd.txt` 到项目的 `res://pixelfx/my_effect.gd`。
2. 编写 metadata、parameter_schema、bounds 和 draw；需要前后遮挡时添加 draw_back。
3. Godot 导入后，底部 PixelFX 面板会自动发现它。调参并另存为 `.tres`。
4. 把预设交给 PixelFXPlayer2D；播放器和编辑器不需要添加特效名称分支。

第三方模块建议放在 `res://pixelfx`，升级 addons/pixelfx 不会覆盖项目自己的效果。
测试已经通过临时新模块验证这一扩展链路；效果数增加不需要维护手写注册清单。

当前已验收的 52 项与 53 个预设见 [效果目录](CATALOG.md)，运行、视觉、误差及平台边界见 [验证记录](../VALIDATION.md)。下文是扩展契约，不表示其余 192 项或上游演出系统已实现。

## 契约

脚本必须 `@tool` 并继承 `res://addons/pixelfx/core/effect.gd`。
metadata 应包含 id、name、duration（正秒数）、loop、fps（1..120）、layers（front/back）、cacheable。
可显式声明 `api_version: 1`。未知契约版本会拒绝。
每个参数在 parameter_schema 中声明唯一 name、Godot Variant type、default，数字可提供 min/max，
Inspector 使用 hint/hint_string。调色板使用 TYPE_PACKED_COLOR_ARRAY，代码调用也可传十六进制颜色数组。
非法参数在创建/绘制前拒绝；不要在 draw 中假定未声明的自由字段存在。
整数与浮点类型必须忠实表达算法要求，例如 Energy disc 的 `teeth` 为整数；以参数作除数时必须排除零，例如 Flamethrower 的 `speed` 为 60..520。

`bounds(options) -> Rect2i` 返回局部像素边界，包含火花、烟雾、阴影和光晕的完整范围。
库校验单边 1..1024 像素。超出 bounds 的像素会被裁掉，因此必须按最远粒子运动计算边距。
方向、世界位置和缩放由 Node2D / flip_h 负责，默认不要把它们做成算法参数。

### 纯时间驱动

设置 cacheable=true。draw(painter, time, options) 必须仅依赖 time/options/显式 seed，
不能读取系统时钟、全局随机数或可变场景状态，不能在 draw 中推进模拟或改变 options。
这样才可定位时间、共享缓存并预热。缓存按效果 fps 采样，播放器逻辑时钟仍连续推进。

### 有状态模拟

设置 cacheable=false，实现 `update(dt, options)`。单个播放器持有独立模块实例，
模拟步长最多 1/120 秒；前后层读取同一个实例状态。draw/draw_back 都不得推进状态。
可选 create(options) 返回自定义实现，需提供 draw 以及可选 update/draw_back。
seek/预热不适用；set_parameters 会从新参数明确重播，避免构造期参数与模拟状态不一致。
效果自己的模拟数据放在模块实例中，不能放入共享 PixelFXPreset。

## 绘制接口

Painter 提供像素 px/dot、line/polyline、circle/disc/ellipse、ring/arc/beam、rect/poly/tri、
透明混合 blend/blend_px、CPU shade、glow/glow_line/glow_ring，以及局部坐标变换。
颜色为 ABGR uint32，使用 core/color.gd 的 hex/rgb/fit/mix 生成。
frame 同时保留颜色与光照，最后合成为 RGBA8；这里的 shade 是 CPU 回调，不是 GPU Shader。

可复用 core/math.gd 的确定性 RNG/噪声，core/particles.gd 的闭式轨迹/循环粒子/基本状态模拟。
专用辅助函数随特效放在自己的文件中，使用 `@tool`；不要求改通用核心。

## 新效果验收

- 参数极值、种子、循环接缝、暂停/变速/停止、前后层。
- 正常速度运行中的轮廓、光照和完整绘制边界。
- 有参考实现时输出同一时间、参数和种子的 RGBA 对照。
- 记录冷生成成本、帧数、缓存占用；大纹理或大量独立参数会增加负担。
- 效果模块本身不得决定游戏伤害、命中或者角色逻辑。
- 仓库迁移需同步来源哈希、机器台账、完整效果目录、中英文首页、迁移计划/路线图、两份 CHANGELOG 和验收/性能记录；确认源码批次与发行包版本不混淆。
- 数值例外逐案例登记原因、通道/字节上限及必要的像素矩形，禁止整体放宽门槛；原生录制检查完整生命周期和接缝，确认窗口遮挡时没有录到旧帧。
