# API 与游戏接入

所有效果共用 `PixelFXPreset` 与 `PixelFXPlayer2D`。资源和公共接口保持 v1。详细签名和约束以[插件 API 文档](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/docs/API.md)为准。

## 常用控制

| 操作 | API |
| --- | --- |
| 从头播放并应用本次参数 | `play(overrides)` |
| 保留实例参数重播 | `restart()` |
| 合并参数覆盖 | `set_parameters(values)` |
| 暂停 / 调整速度 | `paused` / `playback_speed` |
| 淡出结束 / 立即清屏 | `stop()` / `cancel()` |
| 定位解析效果 | `seek(seconds)`，仅 cacheable 效果支持 |
| 手动推进 | `update_mode = MANUAL`，由宿主调用 `advance(delta)` |
| 面向目标 | `face_target(position)` / `aim_at(position)` |

常用信号为 `started`、`finished`、`cancelled`、`looped`、`frame_changed` 和 `validation_failed`。`free_when_finished=true` 适合临时效果。

## 参数与实例隔离

直接播放预设会复制实例参数。修改某次播放用 `set_parameters()`，需要编辑和保存资源则先调用 `preset.copy()`。不要修改共享缓存纹理。

有状态效果每次播放使用独立模拟；修改参数会重播，不支持 seek、共享帧缓存或预热。解析效果可按其元数据使用这些能力，不能把一类效果的能力推广到全部目录。

## 前后层与游戏逻辑

Player 可以从同一次模拟输出 back/front 两层，适合让烟雾、水波等绕过角色。默认前后 Sprite2D 的 z_index 为 -1/+1。复杂 y-sort 或 CanvasLayer 使用 `external_layers` 与 `PixelFXLayer2D`，不要为两层分别推进模拟。

效果负责画面。游戏负责运动、碰撞、命中、伤害和角色状态。Actor/scene/act 输入的本机类型和约束见[原生迁移接入](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/FULL_MIGRATION.md)。

[完整 API](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/docs/API.md) · [效果契约](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/docs/EFFECTS.md) · [自定义效果](https://github.com/norvancc/pixelfx-godot/blob/main/docs/AUTHORING.md)
