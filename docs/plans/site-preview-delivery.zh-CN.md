# 独立效果库与逐项 GIF

独立站：https://norvancc.github.io/pixelfx-godot

Wiki：https://github.com/norvancc/pixelfx-godot/wiki

独立效果库为固定目录中的每一个算法提供 GIF、静态封面和源代码链接。搜索支持名称、类别、描述与标签；可按类别筛选，悬停播放，点击放大，下载当前 GIF，也可以播放或暂停当前视野内的动画。页面按需加载 GIF，滚出视野后恢复静态封面。大 GIF 加载期间先显示封面，载入后再播放。

交付文件核对：**244 个 GIF、244 张封面、21357 个解码帧，总播放时长 746.43 秒**。所有文件为 480×320，算法 ID 与 244 项目录完全一致，已核对文件哈希与格式。

## 视觉与素材

页面构图参考用户指定 Pinterest 搜索中的 [Dark RPG UI](https://www.pinterest.com/pin/989666086888419457/)：紧凑导航、左侧像素标题、右侧整合场景和描边信息栏。没有分发参考图中的角色与插画。

森林基于 [Magical Road / Luis Zuno](https://opengameart.org/content/magical-road-pixel-art-environment)，使用其 CC0 素材并保留来源与许可；夜景配色与门廊由本项目制作。首屏角色来自 MIT 上游 stockActor；传送门来自本机 Godot 的 Portal 动画，以屏幕混合模式叠加在背景上。Pixelify Sans、DM Sans 随页面自托管并保留 OFL。

## 动画制作

`tools/pixelfx/render_preview.gd` 直接加载原生算法和默认预设，逐个推进、绘制并输出 RGBA。`export_previews.py` 串行调用 Godot 与 FFmpeg，为每个算法生成 480×320 GIF。全周期保持 30 Hz 原生时间采样，不用静态帧拉长成动画。

普通效果输出默认完整周期或循环；Moves 输出角色演出的准备、收招和命中定格。过场使用浅底，使黑色遮罩也能看清。`finish_previews.py` 根据全部帧的运动范围使用一个固定裁剪矩形，不逐帧追踪镜头，保留播放时长。GIF 会量化到最多 256 色，重复的静止帧可以合并时长。

GIF 是离线媒体，不证明实时 FPS、所有参数或跨平台完整验收。源码仍为 244/244，完整验收仍为 52/244。

## 复现与维护

```sh
python3 tools/pixelfx/export_previews.py --output /absolute/path/to/site/assets/previews
# 导出完全结束后，在装有 Pillow 的 Python 环境执行：
python3 tools/pixelfx/finish_previews.py /absolute/path/to/site/assets/previews
```

导出过程支持已有清单断点续作；重录一项时先移除其清单记录，再用 `--effects category/effect` 限定该项。取景脚本不能与导出脚本同时改写同一份清单。`manifest.json` 记录算法 ID、名称、路径、源文件哈希、GIF 哈希、时长、帧数和大小，可核对全部目录覆盖。

独立站源码在 `docs/site/`，该目录含 `.gdignore`，不参与 Godot 导入。发布使用 GitHub Pages，推送 `main` 中的页面文件后由 `.github/workflows/pages.yml` 自动更新，保持公开访问。Wiki 源码在 `docs/wiki/`；API 和验证细节继续链接插件内的正式文档。

## 录制发现的问题

Rocket launcher 的完整演出触发了 shotgun 枪口形状中的 `27 + (s > 0)`。直接数值编译器曾将它原样交给 GDScript，造成整数与布尔值加法报错。修复只对可确定为布尔表达式的算术操作数调用数字转换；源码扫描仅命中该上游模块。独立 Node/Godot 语义用例通过，Rocket launcher 重录完成。历史验收记录保留原快照，交付哈希与本次定向修复分开记录。
