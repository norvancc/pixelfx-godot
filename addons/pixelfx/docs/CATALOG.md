# Effect catalog / 效果目录

当前迁移源码已提供 **244/244** 个算法、**245 个预设**。其中 **52 项完整验收、192 项已迁移但待完整验收**。以下第一张表保留已验收范围。最新发行包 **0.2.0** 只含 B0 的五个算法及 Arcane Fireball 换色预设，B1/B2 尚未发布为新版本。

30 个解析循环支持 seek、共享帧缓存和预热；22 个有状态一次性效果使用独立模拟，自动结束，调参重播，不支持 seek、共享帧缓存或预热。全部支持 seed、调色/辅助颜色、light、播放控制及 Node2D 变换；具体可编辑字段和范围由各预设的 Inspector schema 给出。

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
| Flame pillar · `fire/flame-pillar` | [flame_pillar.tres](../presets/flame_pillar.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Meteor · `fire/meteor` | [meteor.tres](../presets/meteor.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Homing missile · `projectiles/homing-missile` | [homing_missile.tres](../presets/homing_missile.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Ice shatter · `ice/ice-shatter` | [ice_shatter.tres](../presets/ice_shatter.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Ice spikes · `ice/ice-spikes` | [ice_spikes.tres](../presets/ice_spikes.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Icicle fall · `ice/icicle-fall` | [icicle_fall.tres](../presets/icicle_fall.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Snowflake burst · `ice/snowflake-burst` | [snowflake_burst.tres](../presets/snowflake_burst.tres) | 独立模拟，一次性 | Front | B2 simulations |
| Geyser · `water/geyser` | [geyser.tres](../presets/geyser.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Wave crash · `water/wave-crash` | [wave_crash.tres](../presets/wave_crash.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Feather burst · `holy/feather-burst` | [feather_burst.tres](../presets/feather_burst.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Healing ring · `holy/heal-aoe` | [heal_aoe.tres](../presets/heal_aoe.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Holy pillar · `holy/holy-pillar` | [holy_pillar.tres](../presets/holy_pillar.tres) | 独立模拟，一次性 | Back + front | B2 simulations |
| Smite · `holy/smite` | [smite.tres](../presets/smite.tres) | 独立模拟，一次性 | Back + front | B2 simulations |

Arcane Fireball（[arcane_fireball.tres](../presets/arcane_fireball.tres)）复用 Fireball 算法，不另计一个算法。

B2 的 Flamethrower `speed` 为 60..520，拒绝 0；这是算法传播延迟的分母，与播放器的 `playback_speed=0` 暂停时间不同。Energy disc 的 `teeth` 为 4..16 的整数。其他字段以各模块的 `parameter_schema()` 为准。

源码与许可见 [provenance.json](../provenance.json) 和 [NOTICE.md](../NOTICE.md)；验收、逐案例误差与平台范围见 [VALIDATION.md](../VALIDATION.md)。算法输入、参数、时间和数值平台会影响像素差异与 CPU 成本，目录中的“完成”仅覆盖已记录的验收范围。

## 新增全量迁移范围（待完整验收）

新增项运行原生 GDScript，不依赖 JavaScript 引擎或预渲染素材。所有新增项暂设 `cacheable=false`，暂不承诺 seek、共享帧缓存与预热。基础运行检查不等于像素或视觉验收。

| 上游算法 | 预设 | 生命周期 | 批次 | 验收状态 |
| --- | --- | --- | --- | --- |
| `arcane/arcane-beam` | [arcane_beam.tres](../presets/arcane_beam.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `arcane/arcane-missiles` | [arcane_missiles.tres](../presets/arcane_missiles.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `arcane/arcane-orb` | [arcane_orb.tres](../presets/arcane_orb.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `arcane/blink-in` | [blink_in.tres](../presets/blink_in.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `arcane/blink-out` | [blink_out.tres](../presets/blink_out.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `arcane/magic-circle-cast` | [magic_circle_cast.tres](../presets/magic_circle_cast.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `arcane/mana-burst` | [mana_burst.tres](../presets/mana_burst.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `arcane/portal` | [portal.tres](../presets/portal.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `arcane/rune-circle` | [rune_circle.tres](../presets/rune_circle.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `arcane/spell-charge` | [spell_charge.tres](../presets/spell_charge.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `arcane/star-fall` | [star_fall.tres](../presets/star_fall.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `arcane/time-stop` | [time_stop.tres](../presets/time_stop.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `critters/bat` | [bat.tres](../presets/bat.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/bird` | [bird.tres](../presets/bird.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/butterfly` | [butterfly.tres](../presets/butterfly.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/eyeball` | [eyeball.tres](../presets/eyeball.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/fish-school` | [fish_school.tres](../presets/fish_school.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/flying-skull` | [flying_skull.tres](../presets/flying_skull.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/frog` | [frog.tres](../presets/frog.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/ghost` | [ghost.tres](../presets/ghost.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/jellyfish` | [jellyfish.tres](../presets/jellyfish.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/slime` | [slime.tres](../presets/slime.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/snake` | [snake.tres](../presets/snake.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `critters/wisp` | [wisp.tres](../presets/wisp.tres) | 解析绘制，循环 | B7 | 待完整验收 |
| `explosions/barrel-explosion` | [barrel_explosion.tres](../presets/barrel_explosion.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/big-explosion` | [big_explosion.tres](../presets/big_explosion.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/cartoon-pow` | [cartoon_pow.tres](../presets/cartoon_pow.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/dirt-explosion` | [dirt_explosion.tres](../presets/dirt_explosion.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/firework-burst` | [firework_burst.tres](../presets/firework_burst.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/firework-rocket` | [firework_rocket.tres](../presets/firework_rocket.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/grenade` | [grenade.tres](../presets/grenade.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/implosion` | [implosion.tres](../presets/implosion.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/nuke` | [nuke.tres](../presets/nuke.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/plasma-explosion` | [plasma_explosion.tres](../presets/plasma_explosion.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `explosions/smoke-bomb` | [smoke_bomb.tres](../presets/smoke_bomb.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `fire/fire-ring` | [fire_ring.tres](../presets/fire_ring.tres) | 独立模拟，一次性 | B2 | 待完整验收 |
| `holy/blessing` | [blessing.tres](../presets/blessing.tres) | 解析绘制，循环 | B2 | 待完整验收 |
| `holy/divine-shield` | [divine_shield.tres](../presets/divine_shield.tres) | 解析绘制，循环 | B2 | 待完整验收 |
| `holy/halo` | [halo.tres](../presets/halo.tres) | 解析绘制，循环 | B2 | 待完整验收 |
| `holy/heal` | [heal.tres](../presets/heal.tres) | 独立模拟，一次性 | B2 | 待完整验收 |
| `holy/resurrection` | [resurrection.tres](../presets/resurrection.tres) | 独立模拟，一次性 | B2 | 待完整验收 |
| `ice/freeze` | [freeze.tres](../presets/freeze.tres) | 独立模拟，一次性 | B2 | 待完整验收 |
| `ice/frost-nova` | [frost_nova.tres](../presets/frost_nova.tres) | 独立模拟，一次性 | B2 | 待完整验收 |
| `impacts/blunt-hit` | [blunt_hit.tres](../presets/blunt_hit.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/bullet-impact` | [bullet_impact.tres](../presets/bullet_impact.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/crit-hit` | [crit_hit.tres](../presets/crit_hit.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/ground-slam` | [ground_slam.tres](../presets/ground_slam.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/heavy-landing` | [heavy_landing.tres](../presets/heavy_landing.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/hit-flash` | [hit_flash.tres](../presets/hit_flash.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/impact-frame` | [impact_frame.tres](../presets/impact_frame.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/parry` | [parry.tres](../presets/parry.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/ricochet` | [ricochet.tres](../presets/ricochet.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `impacts/shield-block` | [shield_block.tres](../presets/shield_block.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `lightning/ball-lightning` | [ball_lightning.tres](../presets/ball_lightning.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `lightning/chain-lightning` | [chain_lightning.tres](../presets/chain_lightning.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `lightning/charge-up` | [charge_up.tres](../presets/charge_up.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `lightning/electrified` | [electrified.tres](../presets/electrified.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `lightning/lightning-strike` | [lightning_strike.tres](../presets/lightning_strike.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `lightning/plasma-ball` | [plasma_ball.tres](../presets/plasma_ball.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `lightning/spark-arc` | [spark_arc.tres](../presets/spark_arc.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `lightning/storm-cloud` | [storm_cloud.tres](../presets/storm_cloud.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `lightning/tesla-coil` | [tesla_coil.tres](../presets/tesla_coil.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `lightning/thunderclap` | [thunderclap.tres](../presets/thunderclap.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `lightning/zap-hit` | [zap_hit.tres](../presets/zap_hit.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `melee/claw-swipe` | [claw_swipe.tres](../presets/claw_swipe.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/dagger-flurry` | [dagger_flurry.tres](../presets/dagger_flurry.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/double-slash` | [double_slash.tres](../presets/double_slash.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/hammer-smash` | [hammer_smash.tres](../presets/hammer_smash.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/heavy-cleave` | [heavy_cleave.tres](../presets/heavy_cleave.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/scythe-reap` | [scythe_reap.tres](../presets/scythe_reap.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/spear-sweep` | [spear_sweep.tres](../presets/spear_sweep.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/spin-slash` | [spin_slash.tres](../presets/spin_slash.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/sword-slash` | [sword_slash.tres](../presets/sword_slash.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/thrust` | [thrust.tres](../presets/thrust.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/uppercut` | [uppercut.tres](../presets/uppercut.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `melee/whip-crack` | [whip_crack.tres](../presets/whip_crack.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `moves/arrow-shot` | [arrow_shot.tres](../presets/arrow_shot.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/dash-strike` | [dash_strike.tres](../presets/dash_strike.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/earth-stomp` | [earth_stomp.tres](../presets/earth_stomp.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/fireball-throw` | [fireball_throw.tres](../presets/fireball_throw.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/ground-pound` | [ground_pound.tres](../presets/ground_pound.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/holy-smite` | [holy_smite.tres](../presets/holy_smite.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/ice-lance-throw` | [ice_lance_throw.tres](../presets/ice_lance_throw.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/lightning-call` | [lightning_call.tres](../presets/lightning_call.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/meteor-call` | [meteor_call.tres](../presets/meteor_call.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/pistol-shots` | [pistol_shots.tres](../presets/pistol_shots.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/rocket-launcher` | [rocket_launcher.tres](../presets/rocket_launcher.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `moves/sword-combo` | [sword_combo.tres](../presets/sword_combo.tres) | 独立模拟，一次性 | B9 | 待完整验收 |
| `nature/acid-splash` | [acid_splash.tres](../presets/acid_splash.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/boulder` | [boulder.tres](../presets/boulder.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/earth-spike` | [earth_spike.tres](../presets/earth_spike.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/healing-bloom` | [healing_bloom.tres](../presets/healing_bloom.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/leaf-storm` | [leaf_storm.tres](../presets/leaf_storm.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `nature/poison-cloud` | [poison_cloud.tres](../presets/poison_cloud.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `nature/quake` | [quake.tres](../presets/quake.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/root-snare` | [root_snare.tres](../presets/root_snare.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/spore-burst` | [spore_burst.tres](../presets/spore_burst.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/thorns` | [thorns.tres](../presets/thorns.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `nature/tornado` | [tornado.tres](../presets/tornado.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `nature/toxic-puddle` | [toxic_puddle.tres](../presets/toxic_puddle.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `nature/vine-whip` | [vine_whip.tres](../presets/vine_whip.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `pickups/chest-open` | [chest_open.tres](../presets/chest_open.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `pickups/coin-spin` | [coin_spin.tres](../presets/coin_spin.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/collect-burst` | [collect_burst.tres](../presets/collect_burst.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `pickups/crystal-shard` | [crystal_shard.tres](../presets/crystal_shard.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/gem-spin` | [gem_spin.tres](../presets/gem_spin.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/heart-pickup` | [heart_pickup.tres](../presets/heart_pickup.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/key-glint` | [key_glint.tres](../presets/key_glint.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/loot-beam` | [loot_beam.tres](../presets/loot_beam.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/potion` | [potion.tres](../presets/potion.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/power-star` | [power_star.tres](../presets/power_star.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `pickups/xp-orb` | [xp_orb.tres](../presets/xp_orb.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/emp-blast` | [emp_blast.tres](../presets/emp_blast.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `scifi/energy-core` | [energy_core.tres](../presets/energy_core.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/force-field` | [force_field.tres](../presets/force_field.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/glitch` | [glitch.tres](../presets/glitch.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/hologram` | [hologram.tres](../presets/hologram.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/jetpack` | [jetpack.tres](../presets/jetpack.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/laser-grid` | [laser_grid.tres](../presets/laser_grid.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/scanner` | [scanner.tres](../presets/scanner.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/teleporter-pad` | [teleporter_pad.tres](../presets/teleporter_pad.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/tractor-beam` | [tractor_beam.tres](../presets/tractor_beam.tres) | 解析绘制，循环 | B6 | 待完整验收 |
| `scifi/warp-in` | [warp_in.tres](../presets/warp_in.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `scifi/warp-out` | [warp_out.tres](../presets/warp_out.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `shadow/black-hole` | [black_hole.tres](../presets/black_hole.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `shadow/curse` | [curse.tres](../presets/curse.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `shadow/dark-explosion` | [dark_explosion.tres](../presets/dark_explosion.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `shadow/eclipse` | [eclipse.tres](../presets/eclipse.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `shadow/grasping-hands` | [grasping_hands.tres](../presets/grasping_hands.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `shadow/hex-sigil` | [hex_sigil.tres](../presets/hex_sigil.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `shadow/life-steal` | [life_steal.tres](../presets/life_steal.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `shadow/necro-skulls` | [necro_skulls.tres](../presets/necro_skulls.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `shadow/shadow-flames` | [shadow_flames.tres](../presets/shadow_flames.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `shadow/shadow-tendrils` | [shadow_tendrils.tres](../presets/shadow_tendrils.tres) | 独立模拟，一次性 | B4 | 待完整验收 |
| `shadow/soul-drain` | [soul_drain.tres](../presets/soul_drain.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `shadow/void-orb` | [void_orb.tres](../presets/void_orb.tres) | 解析绘制，循环 | B4 | 待完整验收 |
| `spawn/coin-drop` | [coin_drop.tres](../presets/coin_drop.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/disintegrate` | [disintegrate.tres](../presets/disintegrate.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/dissolve-burn` | [dissolve_burn.tres](../presets/dissolve_burn.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/egg-hatch` | [egg_hatch.tres](../presets/egg_hatch.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/respawn-beam` | [respawn_beam.tres](../presets/respawn_beam.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/shatter-death` | [shatter_death.tres](../presets/shatter_death.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/soul-rise` | [soul_rise.tres](../presets/soul_rise.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/spawn-portal` | [spawn_portal.tres](../presets/spawn_portal.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `spawn/summon-rise` | [summon_rise.tres](../presets/summon_rise.tres) | 独立模拟，一次性 | B3 | 待完整验收 |
| `status/bleeding` | [bleeding.tres](../presets/bleeding.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/burning` | [burning.tres](../presets/burning.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/charmed` | [charmed.tres](../presets/charmed.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/confused` | [confused.tres](../presets/confused.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/cursed` | [cursed.tres](../presets/cursed.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/frozen` | [frozen.tres](../presets/frozen.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/haste` | [haste.tres](../presets/haste.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/petrified` | [petrified.tres](../presets/petrified.tres) | 独立模拟，一次性 | B5 | 待完整验收 |
| `status/poisoned` | [poisoned.tres](../presets/poisoned.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/rage` | [rage.tres](../presets/rage.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/sleep` | [sleep.tres](../presets/sleep.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/slowed` | [slowed.tres](../presets/slowed.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `status/stunned` | [stunned.tres](../presets/stunned.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `transitions/blinds` | [blinds.tres](../presets/blinds.tres) | 独立模拟，一次性 | B8 | 待完整验收 |
| `transitions/burn-away` | [burn_away.tres](../presets/burn_away.tres) | 独立模拟，一次性 | B8 | 待完整验收 |
| `transitions/crt-off` | [crt_off.tres](../presets/crt_off.tres) | 解析绘制，一次性 | B8 | 待完整验收 |
| `transitions/diamond-wipe` | [diamond_wipe.tres](../presets/diamond_wipe.tres) | 解析绘制，一次性 | B8 | 待完整验收 |
| `transitions/glitch-wipe` | [glitch_wipe.tres](../presets/glitch_wipe.tres) | 解析绘制，一次性 | B8 | 待完整验收 |
| `transitions/iris` | [iris.tres](../presets/iris.tres) | 独立模拟，一次性 | B8 | 待完整验收 |
| `transitions/pixel-dissolve` | [pixel_dissolve.tres](../presets/pixel_dissolve.tres) | 解析绘制，一次性 | B8 | 待完整验收 |
| `transitions/shatter-wipe` | [shatter_wipe.tres](../presets/shatter_wipe.tres) | 独立模拟，一次性 | B8 | 待完整验收 |
| `transitions/slash-wipe` | [slash_wipe.tres](../presets/slash_wipe.tres) | 独立模拟，一次性 | B8 | 待完整验收 |
| `transitions/star-iris` | [star_iris.tres](../presets/star_iris.tres) | 独立模拟，一次性 | B8 | 待完整验收 |
| `ui/achievement` | [achievement.tres](../presets/achievement.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/coin-collect` | [coin_collect.tres](../presets/coin_collect.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/combo-counter` | [combo_counter.tres](../presets/combo_counter.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/confetti` | [confetti.tres](../presets/confetti.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/countdown` | [countdown.tres](../presets/countdown.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/crit-number` | [crit_number.tres](../presets/crit_number.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/damage-number` | [damage_number.tres](../presets/damage_number.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/exclamation` | [exclamation.tres](../presets/exclamation.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/health-bar-hit` | [health_bar_hit.tres](../presets/health_bar_hit.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/heart-lost` | [heart_lost.tres](../presets/heart_lost.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/level-up` | [level_up.tres](../presets/level_up.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `ui/quest-complete` | [quest_complete.tres](../presets/quest_complete.tres) | 独立模拟，一次性 | B6 | 待完整验收 |
| `weather/aurora` | [aurora.tres](../presets/aurora.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/blizzard` | [blizzard.tres](../presets/blizzard.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/cherry-blossoms` | [cherry_blossoms.tres](../presets/cherry_blossoms.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/clouds` | [clouds.tres](../presets/clouds.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/falling-leaves` | [falling_leaves.tres](../presets/falling_leaves.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/fireflies` | [fireflies.tres](../presets/fireflies.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/fog` | [fog.tres](../presets/fog.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/god-rays` | [god_rays.tres](../presets/god_rays.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/rain` | [rain.tres](../presets/rain.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/shooting-stars` | [shooting_stars.tres](../presets/shooting_stars.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/snow` | [snow.tres](../presets/snow.tres) | 解析绘制，循环 | B5 | 待完整验收 |
| `weather/storm` | [storm.tres](../presets/storm.tres) | 解析绘制，循环 | B5 | 待完整验收 |
