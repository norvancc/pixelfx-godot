# Public API v1

当前源码提供 39 个算法、40 个预设，最新发行版 0.2.0 仍为五个算法。公共接口与资源格式保持 v1；各项路径、生命周期和绘制层见 [效果目录](CATALOG.md)。

## PixelFXPreset

`implementation: Script` 必须继承 PixelFXEffect；`display_name` 用于展示。
`set_parameter(name, value) -> bool` 校验后原子更新资源，失败保留原值。
`get_parameter(name)` 返回编辑器形式的参数（调色板为 PackedColorArray）。
`validate() -> PackedStringArray` 返回问题列表；空列表表示有效。
`resolve(overrides)` 用于工具/测试，返回 ok/errors/options/meta/bounds；正常项目通过播放器接入即可。

参数通过动态 Inspector 属性编辑，序列化到 parameter_values。
`format_version=1` 是资源格式版本；不支持的版本拒绝播放。
已有预设共享是正常行为。Player.play/set_parameters 始终使用实例副本，不能污染其他角色。
主动修改共享资源会通知其播放器重新开始；想单独修改某个实例，使用 set_parameters。

## PixelFXPlayer2D

| 接口 | 行为 |
| --- | --- |
| `effect` | PixelFXPreset；运行中更换会取消原播放 |
| `play(overrides={}) -> bool` | 新播放；替换旧覆盖值，时间归零；失败不应用无效参数 |
| `restart() -> bool` | 保留当前实例覆盖值并重播 |
| `set_parameters(values) -> bool` | 原子合并覆盖值；纯时间效果保留时间；有状态效果明确重播 |
| `get_parameters() -> Dictionary` | 返回当前参数副本；不能通过返回字典修改实例 |
| `paused` | 暂停实例；淡出时间也暂停 |
| `playback_speed` | 非负时间倍率；0 冻结；Inspector 提供 0..8 |
| `stop()` | 幂等，0.3 个效果秒淡出后完成；不隐式取消暂停 |
| `cancel()` | 立即停止/清屏，发 cancelled，不发 finished |
| `seek(seconds) -> bool` | 仅 cacheable 效果可用；取消淡出并定位，不补发历史 looped |
| `advance(delta)` | 推进秒数；有限且缩放后在 0..10 范围；不依赖绘制帧率 |
| `update_mode` | IDLE / PHYSICS / MANUAL；手动模式必须由宿主调用 advance |
| `render_fps` | 0 跟随效果默认，否则 1..120；修改后重播生效 |
| `render_frame()` | 显式刷新当前画面 |
| `flip_h` / `face_target(global_position)` | 镜像/按目标左右朝向，不重新生成贴图 |
| `aim_at(global_position)` | 通过标准 Node2D global_rotation 朝向目标，取消镜像 |
| `cache_enabled` | 使用共享缓存；有状态/淡出帧不会共享 |
| `render_when_hidden` | 隐藏时是否生成画面；无论取值如何时间/完成事件继续推进 |
| `free_when_finished` | 完成回调后自动释放；回调中重启时不会误删新播放 |
| `preview_in_editor` | 场景内 @tool 预览；默认关闭，不在编辑器里自动执行游戏行为 |

信号：`started`、`finished`、`cancelled`、`looped(count)`、`frame_changed`、`validation_failed(messages)`。
一次播放 finished 最多发一次。切换/重启产生新实例状态；池中复用时业务的一次性连接请使用 CONNECT_ONE_SHOT。
`last_error` 保存最近校验失败，`last_render_ms` 是最近一次渲染/缓存读取的 CPU 耗时。
Node.process_mode 默认继承 SceneTree 暂停规则；需要暂停菜单中特效继续时由项目设置 PROCESS_MODE_ALWAYS。

## 当前效果的能力差异

30 个解析循环支持 `seek()`、共享帧缓存和预热。九个有状态一次性效果为 Hit spark、Poof、Small explosion、Splash、Cannonball、Flare、Magic missile、Pistol shot、Shotgun blast：每次播放隔离状态，按 `duration` 自动完成，改参重播，不支持 seek/共享帧缓存/预热。具体显示名称与预设文件名对应关系见 [目录](CATALOG.md)。

参数范围以预设 schema 为准：Flamethrower 的算法 `speed` 为 60..520，不能传 0；播放器 `playback_speed=0` 仍可冻结所有效果。Energy disc 的 `teeth` 必须是 4..16 的整数。

## 前后遮挡与挂点

默认播放器创建不保存到场景文件的前后 Sprite2D，z_index 分别为 -1/+1，可以覆盖。
Ripples、Poof、Small explosion、Splash 和 Water orb 使用 back/front；各层读取同一时刻、同一实例。例如把播放器放在角色身体节点下，背部与前部画面可分别绘制；坐标/层级最终遵循项目的 CanvasItem 规则。
复杂 y-sort/CanvasLayer 布局使用 `external_layers=true`，再创建两个 PixelFXLayer2D，
分别配置 source_path 指向播放器、layer 为 back/front，并放入项目所需的层。
`follow_source=true` 跟随源的全局变换；false 时采用视图自身位置/旋转/缩放。
两个视图只读取同一份纹理，不调用 update，不会导致粒子加速或重复模拟。

## 预热和池

```gdscript
var preloader := PixelFXPreloader.new()
add_child(preloader)
preloader.progress.connect(func(done, total): print(done, "/", total))
var result: Dictionary = await preloader.warmup(preload("res://addons/pixelfx/presets/fireball.tres"))
preloader.queue_free()
# result.ok 为 false 时检查 errors / cancelled，不能把未完成的预热视为成功。
```

预热单次最多 600 帧，整个效果必须容纳于缓存预算，否则显式失败。
`cancel()` 中止请求；每生成一帧让出事件循环。冷生成单帧仍可能耗费较长时间，应在加载阶段使用。

`PixelFXPool.spawn(preset, world_position, overrides={})` 返回播放器或容量满时的 null。
默认容量 32；满时发 capacity_reached。完成/取消自动归还，重新获取会重置位置、旋转、缩放、暂停等状态。
`stop_all(immediate=false)` 默认淡出，true 立即取消。`active_count()` 返回当前占用。
Pool 不负责游戏弹体碰撞、伤害或弹道，项目继续控制这些逻辑。

`PixelFXFrameCache.configure(memory_mb=32, frame_limit=256)` 更改预算并清空缓存；
0 可禁用缓存。`clear()` 主动清理，`statistics()` 提供 entries/bytes/hits/misses/evictions。
缓存返回的纹理应视为只读；不要调用 update 修改共享贴图。

使用 `preset.copy()` 创建可编辑副本：隔离参数数据但共享算法 Script，避免旧版 Godot 深复制脚本时破坏相对继承路径。
