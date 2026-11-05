extends SceneTree
const Preset = preload("res://addons/pixelfx/resources/preset.gd")
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Layer = preload("res://addons/pixelfx/runtime/layer_2d.gd")
const Pool = preload("res://addons/pixelfx/runtime/pool.gd")
const Preloader = preload("res://addons/pixelfx/runtime/preloader.gd")
const Cache = preload("res://addons/pixelfx/runtime/frame_cache.gd")
const Catalog = preload("res://addons/pixelfx/editor/catalog.gd")
const Stateful = preload("res://tests/pixelfx/fixtures/stateful.gd")
const Fireball = preload("res://addons/pixelfx/effects/fireball.gd")
var failures: Array = []
var checks := 0
var completions := 0
var loops := 0
func check(ok: bool, message: String) -> void:
	checks += 1
	print("CHECK ", checks, ": ", message, " => ", ok)
	if not ok: failures.append(message); push_error(message)
func _initialize() -> void: call_deferred("run")
func make_player(preset):
	var player = Player.new(); player.autoplay = false; player.update_mode = Player.UpdateMode.MANUAL
	player.effect = preset; root.add_child(player); return player
func run() -> void:
	Cache.clear()
	var preset = load("res://addons/pixelfx/presets/fireball.tres")
	if not (preset is Preset):
		push_error("Fireball preset did not load its PixelFXPreset script")
		quit(1)
		return
	check(preset.validate().is_empty(), "default preset validates")
	var future = preset.copy(); future.format_version = 2
	check(not future.validate().is_empty(), "unknown preset format rejected")
	var bad = Preset.new()
	check(not bad.validate().is_empty(), "missing script rejected")
	bad.implementation = preload("res://addons/pixelfx/core/math.gd")
	check(not bad.validate().is_empty(), "unrelated script rejected without instantiation")
	for overrides in [{"radius": -1.0}, {"radius": INF}, {"radius": NAN}, {"radius": "big"}, {"typo": 1}, {"palette": []}, {"palette": ["oops"]}]:
		check(not preset.resolve(overrides).ok, "invalid parameters rejected: " + str(overrides))
	check(preset.resolve({"radius": 8}).ok, "integer accepted for float parameter")
	var copy = preset.copy()
	check(copy.implementation == preset.implementation and copy != preset, "preset copy shares script but isolates resource")
	check(copy.set_parameter("radius", 7.0), "typed preset setter")
	check(not copy.set_parameter("radius", -8.0) and copy.get_parameter("radius") == 7.0, "preset mutation is atomic")
	copy.set_parameter("palette", ["#123456", "#ffffff"])
	check(copy.get("parameters/palette") is PackedColorArray, "Inspector receives native color array")
	var saved := "res://builds/pixelfx/test-preset.tres"
	check(ResourceSaver.save(copy, saved) == OK, "preset save")
	var restored = ResourceLoader.load(saved, "", ResourceLoader.CACHE_MODE_IGNORE)
	check(restored is Preset and restored.get_parameter("radius") == 7.0 and restored.resolve().ok, "preset disk roundtrip")
	var player = make_player(preset); var second = make_player(preset)
	check(player.play() and second.play(), "play resource")
	check(player.get_layer_texture() == second.get_layer_texture(), "same sample shares immutable texture")
	check(Cache.statistics().hits >= 1, "cache records hit")
	check(player._back.z_index == -1 and player._front.z_index == 1, "default front/back depth")
	player.finished.connect(func(): completions += 1)
	player.looped.connect(func(count): loops += count)
	player.paused = true; player.advance(1)
	check(player.instance.t == 0, "pause freezes simulation")
	player.paused = false; player.playback_speed = 1.25; player.advance(0.2)
	check(is_equal_approx(player.instance.t, 0.25), "speed multiplier")
	player.set_parameters({"radius": 8.0})
	check(second.get_parameters().radius == 5 and preset.get_parameter("radius") == 5, "shared resource and other instances isolated")
	var before: Dictionary = player.get_parameters()
	check(not player.set_parameters({"radius": -1.0}) and player.get_parameters() == before, "invalid update preserves running effect")
	player.set_parameters({"palette": ["#112233", "#ffffff"]})
	check(player.get_parameters().palette.size() == 9, "color ramps resampled by core")
	player.position = Vector2(20,20); player.face_target(Vector2(0,20))
	check(player.flip_h, "face left target")
	player.face_target(Vector2(30,20)); check(not player.flip_h, "face right target")
	player.aim_at(Vector2(20,40)); check(is_equal_approx(player.rotation, PI/2), "aim towards target")
	player.advance(1); check(loops == 1, "loop crossing signal")
	player.stop(); var stop_time: float = player.instance.stop_at; player.advance(0.1); player.stop()
	check(player.instance.stop_at == stop_time, "stop idempotence")
	player.advance(0.3); player.advance(0.3)
	check(completions == 1 and player.state == Player.State.FINISHED, "finish exactly once")
	check(player.get_layer_texture() == null, "finish clears views")
	player.restart(); check(player.get_parameters().radius == 8, "restart preserves overrides")
	player.play(); check(player.get_parameters().radius == 5, "new play resets overrides")
	player.seek(0.4); check(is_equal_approx(player.instance.t, 0.4), "analytic seek")
	player.seek(0); check(player.instance.t == 0, "seek backwards")
	check(not player.seek(-1), "negative seek rejected")
	player.cancel(); check(completions == 1 and player.state == Player.State.STOPPED, "cancel is distinct from finish")
	player.play(); player.update_mode = Player.UpdateMode.IDLE
	paused = true; var frozen_time: float = player.instance.t
	await process_frame; await process_frame
	check(player.instance.t == frozen_time, "SceneTree pause respected")
	paused = false; player.update_mode = Player.UpdateMode.MANUAL
	var stateful_preset = Preset.new(); stateful_preset.implementation = Stateful
	var stateful = make_player(stateful_preset); stateful.play(); stateful.advance(1.0/30)
	check(stateful.instance.implementation.steps == 4, "simulation subdivided at 120Hz")
	check(stateful.get_layer_texture("front") != null and stateful.get_layer_texture("back") != null, "both layer textures produced")
	var front = Layer.new(); var back = Layer.new()
	front.source_path = stateful.get_path(); back.source_path = stateful.get_path(); back.layer = "back"
	root.add_child(front); root.add_child(back); stateful.external_layers = true
	await process_frame; await process_frame
	check(stateful.instance.implementation.steps == 4, "two layer views do not double-step simulation")
	check(not stateful.seek(0.1), "stateful seek rejected explicitly")
	stateful.set_parameters({"speed": 20.0})
	check(stateful.instance.t == 0 and stateful.instance.implementation.steps == 0, "stateful parameter change restarts simulation")
	stateful.free_when_finished = true
	stateful.finished.connect(func(): stateful.restart(), CONNECT_ONE_SHOT)
	stateful.advance(0.3)
	check(stateful.is_playing() and not stateful.is_queued_for_deletion(), "finish callback can restart safely")
	front.free(); back.free(); stateful.free(); second.free(); player.free()
	var pool = Pool.new(); pool.capacity = 2; root.add_child(pool)
	var a = pool.spawn(preset, Vector2(10,20)); var b = pool.spawn(preset, Vector2(30,40))
	check(a != null and b != null and pool.spawn(preset, Vector2.ZERO) == null, "pool bounded capacity")
	a.scale = Vector2(4,4); a.paused = true; a.cancel()
	var reused = pool.spawn(preset, Vector2(50,60))
	check(reused == a and not reused.paused and reused.scale == Vector2.ONE, "pool reuses and resets player")
	pool.stop_all(true); check(pool.active_count() == 0, "pool bulk cancellation")
	pool.free()
	var old_limit: int = Cache.max_entries
	Cache.clear(); Cache.max_entries = 2
	var lru = make_player(preset); lru.play(); lru.seek(0.1); lru.seek(0.2)
	check(Cache.statistics().entries == 2 and Cache.statistics().evictions >= 1, "bounded LRU eviction")
	Cache.max_entries = old_limit; Cache.clear(); lru.free()
	var preloader = Preloader.new(); root.add_child(preloader)
	var warmed: Dictionary = await preloader.warmup(preset)
	check(warmed.ok and warmed.frames == 36, "complete loop prewarm")
	var hot = make_player(preset); hot.play(); hot.seek(0.5)
	check(hot._renderer.cache_hit, "prewarmed frames used by runtime")
	var misses_before: int = Cache.misses
	hot.seek(0)
	for tick in range(180): hot.advance(1.0/60)
	check(Cache.misses == misses_before, "loop boundary never requests a nonexistent extra sample")
	hot.free()
	preloader.progress.connect(func(i,_total):
		if i == 1: preloader.cancel()
	)
	var aborted: Dictionary = await preloader.warmup(preset)
	check(aborted.get("cancelled", false), "prewarm cancellation")
	preloader.free()
	Cache.configure(0, 0)
	var disabled = make_player(preset); disabled.play(); disabled.advance(0.1)
	check(Cache.statistics().entries == 0, "zero cache budget supported")
	disabled.free(); Cache.configure()
	var template_path := "res://builds/pixelfx/extension/my_effect.gd"
	DirAccess.make_dir_recursive_absolute("res://builds/pixelfx/extension")
	FileAccess.open(template_path, FileAccess.WRITE).store_string(FileAccess.get_file_as_string("res://addons/pixelfx/templates/effect.gd.txt"))
	var entries := Catalog.discover(PackedStringArray(["res://builds/pixelfx/extension"]))
	check(entries.size() == 1, "new effect discovered without editing registry")
	if entries.size() == 1:
		var new_effect = entries[0]
		check(new_effect.get("parameters/radius") == 12.0, "new effect schema generates Inspector property")
		var extension_player = make_player(new_effect)
		check(extension_player.play({"radius": 18.0}) and extension_player.get_layer_texture() != null, "new effect uses unchanged player")
		extension_player.free()
	var demo = load("res://demos/pixelfx/fireball_demo.tscn").instantiate(); root.add_child(demo); demo.set_process(false); demo.player.update_mode = Player.UpdateMode.MANUAL
	demo.pause_button.pressed.emit(); check(demo.player.paused, "demo pause")
	demo.pause_button.pressed.emit(); check(not demo.player.paused, "demo resume")
	demo.flip_button.pressed.emit(); check(demo.player.flip_h, "demo mirror")
	demo.palette_select.item_selected.emit(1); check(demo.player.get_parameters().palette[0] == 0xff30170a, "demo palette")
	demo.radius_slider.value = 8; check(demo.player.get_parameters().radius == 8, "demo radius")
	demo.speed_slider.value = 1.25; check(demo.player.playback_speed == 1.25, "demo speed")
	demo.rotation_slider.value = 45; check(is_equal_approx(demo.player.rotation, PI/4), "demo rotation")
	demo.stop_button.pressed.emit(); demo.player.advance(0.4); check(demo.status.text.begins_with("已结束"), "demo completion")
	demo.replay_button.pressed.emit(); check(demo.player.is_playing(), "demo replay")
	demo.free()
	var projectile = load("res://demos/pixelfx/projectile_example.tscn").instantiate()
	root.add_child(projectile)
	projectile.visual.update_mode = Player.UpdateMode.MANUAL
	projectile.launch(Vector2.ZERO, Vector2(20, 0))
	projectile.launch(Vector2.ZERO, Vector2(20, 0))
	projectile._process(1.0)
	check(projectile.global_position == Vector2(20, 0) and not projectile.flying, "project-owned projectile movement")
	projectile.visual.advance(0.4)
	check(projectile.is_queued_for_deletion(), "projectile cleanup follows visual completion")
	await process_frame
	Cache.clear()
	FileAccess.open("res://builds/pixelfx/runtime-v010.json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures},"  "))
	print("PIXELFX_RUNTIME checks=",checks," failures=",failures.size())
	quit(0 if failures.is_empty() else 1)
