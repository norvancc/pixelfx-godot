# PixelFX for Godot — source / B2 (unreleased)

A reusable Godot addon for procedural pixel effects: typed presets, editor preview,
playback, layered rendering, bounded frame sharing, prewarming and pooling.

这是可独立复制到 Godot 项目的特效库。当前源码提供完整的库接入流程与 31 种效果。B0/B1 的 11 项为：Fireball、Ice lance、Laser bolt、Sunburst、Ripples、Hit spark、Poof、Campfire、Rocket、Small explosion、Splash；
本次 B2 新增 20 项火焰、弹体/枪口及水系效果，详见 [validation/b2.json](validation/b2.json)。
后续效果只需实现统一算法接口、参数 schema 和绘制边界，可选提供 `.tres` 预设。
运行时无需 Node.js、Phaser、编辑器插件或外部图片素材。

## 安装

将发行包中的 `addons/pixelfx` 整个复制到项目的同名目录。
在 Godot「项目设置 → 插件」启用 PixelFX，可获得底部实时预览面板。
未启用编辑器插件时，运行时节点和资源仍然可用。无需 Autoload，不修改项目渲染配置。

在场景中添加 `PixelFXPlayer2D`，把 `presets/fireball.tres` 拖到 Effect 属性。
它可以作为手部、武器或弹体的子节点，位置、缩放、旋转遵循标准 Node2D 变换。
如果通过游戏事件触发，关闭 Autoplay，再调用 `play()`。

```gdscript
const Fireball = preload("res://addons/pixelfx/presets/fireball.tres")

func launch_visual(at: Vector2) -> PixelFXPlayer2D:
    var fx := PixelFXPlayer2D.new()
    fx.autoplay = false
    fx.effect = Fireball
    fx.free_when_finished = true
    add_child(fx)
    fx.global_position = at
    fx.play({"radius": 7.0})
    return fx

# 命中时由游戏停止循环特效；伤害/碰撞不由特效库计算。
# fx.stop()  # 0.3 秒淡出，finished 后自动释放
```

## 编辑器工作流

底部 PixelFX 面板可以选择算法默认参数或现有预设、播放/暂停/淡出/翻转、改变速度和缩放、
切换背景，并对纯时间驱动效果拖动时间轴。右侧属性来自算法 schema，包含类型、范围和重置默认值。
预览编辑的是私有副本；点击「另存预设」才写入所选 `.tres` 文件。
选中场景中的播放器或预设资源也可以打开预览面板。

默认扫描 `addons/pixelfx/effects`、`addons/pixelfx/presets`、`res://pixelfx`。
其他目录可通过项目设置 `pixelfx/editor/effect_directories`（PackedStringArray）添加。
运行时直接引用预设资源，导出游戏不依赖目录扫描或源代码文件名。

## 播放与集成

- `PixelFXPlayer2D`：实例状态、时间、速度、控制、事件和本地前后层。
- `PixelFXPreset`：可保存、可复用的资源；实例参数不会写回共享预设。
- `PixelFXLayer2D`：在其他场景层级中显示同一实例的 front/back，不重复模拟。
- `PixelFXPreloader`：在加载阶段逐帧预热纯时间驱动效果，可取消、有进度事件。
- `PixelFXPool`：可选、有容量上限的节点池。
- `PixelFXFrameCache`：LRU 缓存与统计；默认 32 MiB / 256 帧，可配置或禁用。

详见 [API](docs/API.md)、[新增特效](docs/EFFECTS.md)、[性能与兼容](docs/PERFORMANCE.md)。
`templates/effect.gd.txt` 是可以直接复制的扩展模板。

## 示例与验证

完整源码工程包含 `demos/pixelfx/gallery.tscn`（五效果演示）、`demos/pixelfx/b1_gallery.tscn`（六项新增效果）、`demos/pixelfx/b2_gallery.tscn`（本批 20 项）及旧 `fireball_demo.tscn`、挂点/移动弹体示例、测试、打包工具及 CI 配置。
在独立源码工程根目录执行：

```sh
# GODOT_BIN 指向 Godot 可执行文件；默认尝试 godot 和 macOS 默认安装位置。
python3 tools/pixelfx/check.py
```

需要 Python 3 和 Node.js 18+ 来生成上游测试参考；这些工具不是游戏运行依赖。
上游源码按固定提交下载，并验证 provenance.json 中的 SHA-256。
检查包括原版逐帧对照、资源序列化、参数隔离、生命周期、前后层、缓存、对象池、扩展发现与并发基准。
实际验证结果和平台边界见 [VALIDATION.md](VALIDATION.md)。

## 范围与维护

公共扩展契约为 v1，最新发行版本为 0.2.0；B1/B2 新增项仍为未发布源码。验收数据见 [validation/b1.json](validation/b1.json)。B1 的四个及 B2 的五个有状态一次性效果不支持 seek/共享帧缓存/预热，调参将重播；其余新增项为解析循环。
同一契约内新增特效不需要修改播放器、缓存、预览面板或注册表。
新增效果自己的算法/辅助绘制代码属于效果模块；不要求预先迁移原库所有内部助手。
当前没有将上游两百多个效果、actor/rig/poses 系统或专用 sim 模拟器全部迁移。
GPU/原生加速不是当前依赖；支持多种参数的冷生成成本仍需按项目预算评估。

源项目：<https://github.com/patch-gg/pixelfx>，0.3.0，固定提交
`a84159688af3ca37a4be05a0d422b94451b2e24e`。
保留原作者 Patch 与 Hugo Duprez 的 MIT 声明，见 LICENSE；来源哈希见 provenance.json。

Godot 官方设计参考：
[EditorPlugin](https://docs.godotengine.org/en/stable/tutorials/plugins/editor/making_plugins.html)、
[Resources](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html)、
[Asset Library packaging](https://docs.godotengine.org/en/stable/community/asset_library/submitting_to_assetlib.html)。
