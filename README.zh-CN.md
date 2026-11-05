# PixelFX for Godot

**基于 [patch-gg/pixelfx](https://github.com/patch-gg/pixelfx) 的非官方 Godot 移植。** 原作者为 Patch 与 Hugo Duprez，采用 MIT 协议；此仓库由 norvancc 独立维护。

[English](README.md) · [发行包](https://github.com/norvancc/pixelfx-godot/releases) · [API](addons/pixelfx/docs/API.md) · [新增特效](addons/pixelfx/docs/EFFECTS.md)

![Godot 实时火球](docs/images/fireball.png)

## 当前状态

0.1.0 已实现公共库基础设施与 Fireball。上游固定版本共 244 个效果，目前只移植 1 个，另外 243 个尚未移植。Arcane Fireball 是调色预设，不是第二种算法。

这是真正的 GDScript CPU 程序生成，生成后通过纹理交给 Godot 绘制；不是 GPU Shader 移植、JS 包装或预录图集。运行时不依赖 Node.js、C#、Autoload 或外部图片。

已包含预设资源与参数校验、实例隔离、完整播放控制、前后分层、共享缓存、预热、对象池、编辑器实时预览、时间轴、调参保存、扩展模板及测试。

## 安装和运行

1. 从 Releases 下载插件 ZIP，将其中的 `addons/pixelfx` 复制到项目。
2. 项目设置 → 插件 → 启用 PixelFX，可获得底部编辑器预览面板；运行时无需启用插件。
3. 添加 PixelFXPlayer2D 节点，将 `presets/fireball.tres` 赋给 Effect。
4. 也可以克隆完整仓库，用 Godot 打开 `project.godot` 后按 F5 运行演示。

角色挂点、移动、碰撞和伤害由游戏负责，库负责视觉效果；示例在 `demos/pixelfx/projectile_example.gd`。

## 后续扩展

新特效实现统一的 metadata、parameter_schema、bounds、draw 接口，即可被编辑器发现并由同一播放器播放。有状态效果增加 update。专用模拟、组合或角色演出依赖仍须随相应效果移植，不代表这些上游模块已经完成。

详细说明：[API](addons/pixelfx/docs/API.md)、[效果制作](addons/pixelfx/docs/EFFECTS.md)、[路线图](ROADMAP.md)。

## 验证与性能边界

目标 Godot 4.3+；本地实测为 4.7.2 / macOS / GL Compatibility，4.3 Linux 由 CI 检查，以实际运行结果为准。其他平台、版本、渲染器不能自动视为通过。

本地通过 78 组原版渲染对照、69 项运行检查、11 项编辑器检查；并导出启动了 macOS 应用。完整误差记录见 [VALIDATION.md](addons/pixelfx/VALIDATION.md)。

不同参数的冷生成约 20ms/个，建议在加载阶段预热常用预设。热缓存基准不代表任意复杂特效的高并发 GPU 性能；见 [性能说明](addons/pixelfx/docs/PERFORMANCE.md)。

开发验证：`python3 tools/pixelfx/check.py`；打包：`python3 tools/pixelfx/package_demo.py`。需要 Python、Godot 和用于上游参考的 Node.js。

## 开源协作

贡献请阅读 [CONTRIBUTING.md](CONTRIBUTING.md)。保留上游署名、许可和来源记录；新增特效需提供参数、时序、分层、边界、正常速度视觉对照与性能验证。不要只凭脚本解析成功声称迁移完成。
