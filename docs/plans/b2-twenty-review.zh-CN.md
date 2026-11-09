# B2 首批 20 项迁移与验收

上游基线固定为 PixelFX 0.3.0、`a84159688af3ca37a4be05a0d422b94451b2e24e`。本批属于原计划 B2 的 49 项中的前 20 项；该批还有 29 项，整个固定目录仍为 244 项。本批已通过 [PR #6](https://github.com/norvancc/pixelfx-godot/pull/6) 合入 `main`（`112d5d47b8165bf3f1b408b8ab5b3c5ae8a2cb47`），累计为 31 项，剩余 213 项；调色预设不单独计数。

| 上游模块 | 原生预设 | 生命周期 | 四个默认时刻冷绘制最大值 / ms |
| --- | --- | --- | ---: |
| `fire/brazier` | `brazier.tres` | 解析循环 | 30.66 |
| `fire/candle` | `candle.tres` | 解析循环 | 3.57 |
| `fire/fire-breath` | `fire_breath.tres` | 解析循环 | 55.19 |
| `fire/fire-tornado` | `fire_tornado.tres` | 解析循环 | 34.07 |
| `fire/flamethrower` | `flamethrower.tres` | 解析循环 | 24.98 |
| `fire/spirit-flame` | `spirit_flame.tres` | 解析循环 | 10.67 |
| `fire/torch` | `torch.tres` | 解析循环 | 15.17 |
| `projectiles/arrow` | `arrow.tres` | 解析循环 | 0.50 |
| `projectiles/bullet-tracer` | `bullet_tracer.tres` | 解析循环 | 4.09 |
| `projectiles/cannonball` | `cannonball.tres` | 独立有状态一次性 | 43.24 |
| `projectiles/energy-disc` | `energy_disc.tres` | 解析循环 | 3.32 |
| `projectiles/flare` | `flare.tres` | 独立有状态一次性 | 13.56 |
| `projectiles/magic-missile` | `magic_missile.tres` | 独立有状态一次性 | 6.51 |
| `projectiles/muzzle-pistol` | `muzzle_pistol.tres` | 独立有状态一次性 | 10.87 |
| `projectiles/muzzle-shotgun` | `muzzle_shotgun.tres` | 独立有状态一次性 | 40.62 |
| `projectiles/muzzle-smg` | `muzzle_smg.tres` | 解析循环 | 16.88 |
| `projectiles/plasma-shot` | `plasma_shot.tres` | 解析循环 | 30.61 |
| `water/water-jet` | `water_jet.tres` | 解析循环 | 20.65 |
| `water/water-orb` | `water_orb.tres` | 解析循环 | 11.88 |
| `water/whirlpool` | `whirlpool.tres` | 解析循环 | 29.35 |

本批保留原算法、随机调用顺序、1/120 秒最大模拟步长和全部上游选项。水球的前后层读取同一时刻；弹壳反弹、烟雾延迟/卷曲、导弹蓄力与飞行轨迹、信号弹升空与持续燃烧均在原生代码内执行。未改动已经发布的五个模块路径或公共契约 v1。

## 自动验证

- 2607 组独立上游 RGBA 参考帧：默认整周期、多 seed、逐参数极值、调色/辅助颜色、明暗背景、前后层、镜像/旋转/位移、结束与停止，以及 30/60/120 Hz 更新计划。
- 保留 B0 的 447 组与 B1 的 809 组回归。参考时间通过 binary64 字节传递，避免 JSON 十进制往返影响边界。
- 运行时验证实例隔离、只读绘制、暂停/倍速/调参重播、缓存与预热限制、完成信号、释放和图鉴控件。独立测试检查目录、默认值、参数上下限和扩大画布中的全部可见像素边界。
- 320 次重播比较两个批次的对象数与静态内存；编辑器验证所有 31 项的预览、时间轴能力、改参、保存和读取。

## 差异与参数约束

像素误差使用默认单通道 1/255、最多 20 个通道字节的限制；8 个超出默认限制的案例在 `tests/pixelfx/b2_tolerances.json` 中逐项登记通道上限、字节数与矩形。它们仅为烟雾/光晕/水雾叠加后的 1–2/255 量化误差，没有放宽整体门槛。

火焰喷射器用 `x / speed` 计算传播延迟，speed=0 会使上游产生非有限数。Godot 参数范围为 60..520，明确拒绝 0；其余允许停速的弹体保留 speed=0 的静止行为。

## 视觉与性能证据

原生 GL Compatibility 图鉴逐项录制完整生命周期/循环接缝，并切换浅色背景及镜像；水球验证前后遮挡。录像为固定 30 帧输出，不能作为实时帧率保证。验收报告校验全部 20 项、两种背景的原生截图和完整视频帧数；缺失时不能生成通过记录。

上表是 Apple M4 Pro / macOS / Godot 4.7.2 的四个默认生命周期时刻，测量调用 `draw()`，不含全部模拟更新和 GPU 上传，也不是穷举峰值。Fire breath、Fire tornado、Cannonball 与 Shotgun blast 的这些采样超过 30 FPS 的 33.3 ms 预算；解析效果可使用现有缓存，五个模拟效果不支持共享缓存或预热。默认缓存仍为 32 MiB，不随本批扩大。

机器可读验收：`addons/pixelfx/validation/b2.json`；台账：`docs/migration-status.json`；原生图鉴：`demos/pixelfx/b2_gallery.tscn`。完整 gate 为 `python3 tools/pixelfx/check.py`。Godot 4.3/Linux 的 [PR CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42574117517) 与[分支 CI](https://github.com/norvancc/pixelfx-godot/actions/runs/42573684282) 均已通过完整 gate 和打包；实现提交为 `73560f489e8dc612838657c1cda4ddba2e43bc4c`，合并代码树一致。PR 验收归档 SHA-256 为 `3ccc98dd7eae1670bab145594f59bab7b9b0c9e4f69d2cef1460d54904d9be68`，报告零失败、日志无脚本错误。其他平台仍未验证，最新发行包保持 0.2.0。

[完整正常速度视频](https://github.com/user-attachments/assets/f7feadf1-6fd1-4d19-8569-fe567e98bd2b) 为 1120×740、30 FPS、4130 个解码帧、137.666667 秒。干净项目禁用编辑器插件时，全部 31 项 / 32 个预设安装播放通过。

原生录制命令：`Godot --path . --rendering-method gl_compatibility --disable-vsync --render-thread safe --resolution 1120x740 --write-movie builds/pixelfx/b2-native.avi --fixed-fps 30 demos/pixelfx/b2_gallery.tscn -- --b2-record`。图鉴录制时会显式刷新渲染，避免 macOS 遮挡窗口保留旧帧。`tools/pixelfx/review_b2_movie.py` 需要 ffmpeg 与 Pillow，仅用于视觉证据制作，运行时和 CI gate 不依赖 Pillow。
