# 效果目录

`main` 当前有 **244 个算法、245 个预设**。Arcane Fireball 是配色预设，不是额外算法。每项的准确脚本、预设、生命周期与绘制层见[完整目录](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/docs/CATALOG.md)。

## 找到合适的效果

| 类别 | 例子 |
| --- | --- |
| 元素 | Flame pillar、Meteor、Ice spikes、Geyser、Lightning strike |
| 战斗 | Sword slash、Claw swipe、Hit spark、Homing missile |
| 法术 | Portal、Holy pillar、Blessing、Black hole |
| 环境 | Rain、Fog、Cherry blossoms、Aurora |
| 游戏反馈 | Coin spin、Gem spin、Damage number、Level up |
| 过场 | Iris、Diamond wipe、Pixel dissolve |
| 角色与编排 | Critters、Moves、actor / rig / act / chain |

## 在网页预览每个效果

[独立效果库](https://pixelfx-godot.craftypatio2.chatgpt.site/#effects) 为每个算法提供单独 GIF，支持类别筛选、名称/标签搜索、悬停播放、点击放大和下载。动画来自 Godot 默认生命周期或循环，角色招式包含准备、收招与定格；过场使用浅色底以看清遮罩。GIF 是离线视觉预览，不是实时性能测量。

## 在 Godot 中浏览

- **完整图鉴：** `demos/pixelfx/full_gallery.tscn`，244 项按需加载，显示 CPU 耗时和场景 FPS。
- **基础图鉴：** `demos/pixelfx/gallery.tscn`，五个正式发行效果。
- **批次图鉴：** `b1_gallery.tscn`、`b2_gallery.tscn`、`b2_elements_gallery.tscn`、`b2_simulations_gallery.tscn`、`b2_completion_gallery.tscn`，都在 `demos/pixelfx/`。

给 Player 的 `effect` 赋对应 `.tres`，使用同一套播放接口。角色/场景输入和编排的接入细节见[全量迁移说明](https://github.com/norvancc/pixelfx-godot/blob/main/addons/pixelfx/FULL_MIGRATION.md)。

## 选择前看状态

源码迁移完成与完整验收是两个计数：52 项已完整验收，192 项待完整验收。部分大画布和复杂效果仍较重。请按自己的目标硬件和同屏负载选择效果，参考 [Performance and Status](https://github.com/norvancc/pixelfx-godot/wiki/Performance-and-Status)。

[机读迁移台账](https://github.com/norvancc/pixelfx-godot/blob/main/docs/migration-status.json) · [作者接口](https://github.com/norvancc/pixelfx-godot/blob/main/docs/AUTHORING.md)
