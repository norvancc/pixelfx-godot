# 安装与第一个效果

目标引擎为 **Godot 4.3+**。已通过 Godot 4.3 / Ubuntu headless CI，本机视觉与性能记录使用 Godot 4.7.2 / macOS。运行时不需要 Node.js、C#、GDExtension 或 Autoload。

## 安装

1. [下载 main 源码 ZIP](https://github.com/norvancc/pixelfx-godot/archive/refs/heads/main.zip)，或克隆仓库。正式发行包 0.2.0 只包含早期五个算法。
2. 将 `addons/pixelfx/` 整个目录复制到你的 Godot 项目。
3. 在 **Project → Project Settings → Plugins** 中启用 PixelFX，获得底部预览面板。运行时可以不启用编辑器插件。
4. 在场景里添加 `PixelFXPlayer2D`，将 `addons/pixelfx/presets/fireball.tres` 拖到 **Effect** 属性。

## 代码播放

```gdscript
const FIREBALL = preload("res://addons/pixelfx/presets/fireball.tres")

func spawn_visual(at: Vector2) -> PixelFXPlayer2D:
    var fx := PixelFXPlayer2D.new()
    fx.autoplay = false
    fx.effect = FIREBALL
    fx.free_when_finished = true
    add_child(fx)
    fx.global_position = at
    fx.play({"radius": 7.0})
    return fx
```

命中或离场时调用 `fx.stop()`，效果会淡出。弹道、碰撞和伤害由游戏自己控制。

## 跑图鉴

直接在 Godot 打开仓库里的 `project.godot`。F5 是五效果入口；要浏览全部 244 项，打开 `demos/pixelfx/full_gallery.tscn` 后按 F6。它按选择加载，避免一次创建所有效果。

底部 **PixelFX** 面板支持预览、改参数和 **Save preset**。创建预设副本后保存，避免把共享预设当成某个实例的私有状态。

[完整安装说明](https://github.com/norvancc/pixelfx-godot/blob/main/README.zh-CN.md) · [下一步：API](https://github.com/norvancc/pixelfx-godot/wiki/API-and-Integration)
