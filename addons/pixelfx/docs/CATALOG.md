# Effect catalog / 效果目录

当前源码已验收 **39/244** 个上游算法，剩余 **205** 个；包含 **40 个预设**。最新发行包 **0.2.0** 只含 B0 的五个算法及 Arcane Fireball 换色预设，B1/B2 尚未发布为新版本。

30 个解析循环支持 seek、共享帧缓存和预热；9 个有状态一次性效果使用独立模拟，自动结束，调参重播，不支持 seek、共享帧缓存或预热。全部支持 seed、调色/辅助颜色、light、播放控制及 Node2D 变换；具体可编辑字段和范围由各预设的 Inspector schema 给出。

所有预设均位于本插件的 `presets/` 目录。完整仓库的默认图鉴提供 B1/B2 入口；插件单独安装后，直接给 `PixelFXPlayer2D.effect` 赋预设即可。

| 上游算法 / Source | 默认预设 / Preset | 生命周期 | 绘制层 | 批次 |
| --- | --- | --- | --- | --- |
| Fireball · `fire/fireball` | [fireball.tres](../presets/fireball.tres) | 解析循环 | Front | B0 |
| Sunburst · `holy/sunburst` | [sunburst.tres](../presets/sunburst.tres) | 解析循环 | Front | B0 |
| Ice lance · `ice/ice-lance` | [ice_lance.tres](../presets/ice_lance.tres) | 解析循环 | Front | B0 |
| Laser bolt · `projectiles/laser-bolt` | [laser_bolt.tres](../presets/laser_bolt.tres) | 解析循环 | Front | B0 |
| Ripples · `water/ripples` | [ripples.tres](../presets/ripples.tres) | 解析循环 | Back + front | B0 |
| Small explosion · `explosions/small-explosion` | [small_explosion.tres](../presets/small_explosion.tres) | 独立模拟，一次性 | Back + front | B1 |
| Campfire · `fire/campfire` | [campfire.tres](../presets/campfire.tres) | 解析循环 | Front | B1 |
| Hit spark · `impacts/hit-spark` | [hit_spark.tres](../presets/hit_spark.tres) | 独立模拟，一次性 | Front | B1 |
| Rocket · `projectiles/rocket` | [rocket.tres](../presets/rocket.tres) | 解析循环 | Front | B1 |
| Poof · `spawn/poof` | [poof.tres](../presets/poof.tres) | 独立模拟，一次性 | Back + front | B1 |
| Splash · `water/splash` | [splash.tres](../presets/splash.tres) | 独立模拟，一次性 | Back + front | B1 |
| Brazier · `fire/brazier` | [brazier.tres](../presets/brazier.tres) | 解析循环 | Front | B2 |
| Candle · `fire/candle` | [candle.tres](../presets/candle.tres) | 解析循环 | Front | B2 |
| Fire breath · `fire/fire-breath` | [fire_breath.tres](../presets/fire_breath.tres) | 解析循环 | Front | B2 |
| Fire tornado · `fire/fire-tornado` | [fire_tornado.tres](../presets/fire_tornado.tres) | 解析循环 | Front | B2 |
| Flamethrower · `fire/flamethrower` | [flamethrower.tres](../presets/flamethrower.tres) | 解析循环 | Front | B2 |
| Spirit flame · `fire/spirit-flame` | [spirit_flame.tres](../presets/spirit_flame.tres) | 解析循环 | Front | B2 |
| Torch · `fire/torch` | [torch.tres](../presets/torch.tres) | 解析循环 | Front | B2 |
| Arrow · `projectiles/arrow` | [arrow.tres](../presets/arrow.tres) | 解析循环 | Front | B2 |
| Bullet tracer · `projectiles/bullet-tracer` | [bullet_tracer.tres](../presets/bullet_tracer.tres) | 解析循环 | Front | B2 |
| Cannon shot · `projectiles/cannonball` | [cannonball.tres](../presets/cannonball.tres) | 独立模拟，一次性 | Front | B2 |
| Energy disc · `projectiles/energy-disc` | [energy_disc.tres](../presets/energy_disc.tres) | 解析循环 | Front | B2 |
| Signal flare · `projectiles/flare` | [flare.tres](../presets/flare.tres) | 独立模拟，一次性 | Front | B2 |
| Magic missile · `projectiles/magic-missile` | [magic_missile.tres](../presets/magic_missile.tres) | 独立模拟，一次性 | Front | B2 |
| Pistol shot · `projectiles/muzzle-pistol` | [muzzle_pistol.tres](../presets/muzzle_pistol.tres) | 独立模拟，一次性 | Front | B2 |
| Shotgun blast · `projectiles/muzzle-shotgun` | [muzzle_shotgun.tres](../presets/muzzle_shotgun.tres) | 独立模拟，一次性 | Front | B2 |
| SMG burst · `projectiles/muzzle-smg` | [muzzle_smg.tres](../presets/muzzle_smg.tres) | 解析循环 | Front | B2 |
| Plasma shot · `projectiles/plasma-shot` | [plasma_shot.tres](../presets/plasma_shot.tres) | 解析循环 | Front | B2 |
| Water jet · `water/water-jet` | [water_jet.tres](../presets/water_jet.tres) | 解析循环 | Front | B2 |
| Water orb · `water/water-orb` | [water_orb.tres](../presets/water_orb.tres) | 解析循环 | Back + front | B2 |
| Whirlpool · `water/whirlpool` | [whirlpool.tres](../presets/whirlpool.tres) | 解析循环 | Front | B2 |
| Blizzard vortex · `ice/blizzard-vortex` | [blizzard_vortex.tres](../presets/blizzard_vortex.tres) | 解析循环 | Front | B2 ice/water |
| Frost breath · `ice/frost-breath` | [frost_breath.tres](../presets/frost_breath.tres) | 解析循环 | Front | B2 ice/water |
| Ice crystal · `ice/ice-crystal` | [ice_crystal.tres](../presets/ice_crystal.tres) | 解析循环 | Front | B2 ice/water |
| Bubbles · `water/bubbles` | [bubbles.tres](../presets/bubbles.tres) | 解析循环 | Back + front | B2 ice/water |
| Drip · `water/drip` | [drip.tres](../presets/drip.tres) | 解析循环 | Back + front | B2 ice/water |
| Fountain · `water/fountain` | [fountain.tres](../presets/fountain.tres) | 解析循环 | Back + front | B2 ice/water |
| Rain splash · `water/rain-splash` | [rain_splash.tres](../presets/rain_splash.tres) | 解析循环 | Back + front | B2 ice/water |
| Waterfall · `water/waterfall` | [waterfall.tres](../presets/waterfall.tres) | 解析循环 | Back + front | B2 ice/water |

Arcane Fireball（[arcane_fireball.tres](../presets/arcane_fireball.tres)）复用 Fireball 算法，不另计一个算法。

B2 的 Flamethrower `speed` 为 60..520，拒绝 0；这是算法传播延迟的分母，与播放器的 `playback_speed=0` 暂停时间不同。Energy disc 的 `teeth` 为 4..16 的整数。其他字段以各模块的 `parameter_schema()` 为准。

源码与许可见 [provenance.json](../provenance.json) 和 [NOTICE.md](../NOTICE.md)；验收、逐案例误差与平台范围见 [VALIDATION.md](../VALIDATION.md)。算法输入、参数、时间和数值平台会影响像素差异与 CPU 成本，目录中的“完成”仅覆盖已记录的验收范围。
