extends SceneTree
const Fx = preload("res://addons/pixelfx/core/fx.gd")
const Frame = preload("res://addons/pixelfx/core/frame.gd")
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Cache = preload("res://addons/pixelfx/runtime/frame_cache.gd")
const Preloader = preload("res://addons/pixelfx/runtime/preloader.gd")
const IDS = ["hit_spark","poof","campfire","rocket","small_explosion","splash"]
var failures: Array = []
var checks = 0
var performance = {}
func check(ok: bool,message: String) -> void:
	checks += 1
	if not ok: failures.append(message); push_error(message)
func sample(fx,layer: String="") -> PackedByteArray:
	var frame = Frame.new(384,384,-192,-288)
	fx.draw(frame,layer)
	return frame.composite().duplicate()
func _initialize() -> void: run.call_deferred()
func run() -> void:
	for id in IDS:
		var preset = load("res://addons/pixelfx/presets/"+id+".tres")
		if id=="small_explosion":
			check(not preset.resolve({"stone":Color(0.2,0.3,0.4,0.5)}).ok,"explosion rejects translucent stone colour")
			check(not preset.resolve({"stone":Color(NAN,0.3,0.4)}).ok,"explosion rejects non-finite stone colour")
		var resolved: Dictionary = preset.resolve()
		var module = preset.new_module(); var a = Fx.new(module,resolved.options)
		var b = Fx.new(preset.new_module(),resolved.options)
		check(a.implementation != b.implementation,id+" simulation instances are isolated")
		a.update(0.2); b.update(0.2)
		check(sample(a)==sample(b),id+" equal seed and schedule produce equal output")
		var expected = sample(a); var time: float = a.t
		var back = sample(a,"back"); var front = sample(a,"front")
		check(front==sample(a,"front") and back==sample(a,"back") and a.t==time,id+" drawing both layers never advances simulation")
		b.update(0.1)
		check(sample(a)==expected,id+" advancing one instance leaves the other untouched")
		var player = Player.new(); player.effect = preset; player.autoplay = false; player.update_mode = Player.UpdateMode.MANUAL; root.add_child(player)
		var completions = [0]
		player.finished.connect(func(): completions[0] += 1)
		Cache.clear(); player.play()
		player.paused = true; player.advance(0.2)
		check(player.instance.t==0,id+" pause freezes effect time")
		player.paused = false; player.playback_speed = 2; player.advance(0.05)
		check(is_equal_approx(player.instance.t,0.1),id+" playback speed advances effect seconds")
		var stateful: bool = not resolved.meta.cacheable
		if stateful:
			check(Cache.statistics().entries==0,id+" stateful output bypasses shared cache")
			check(not player.seek(0.2) and is_equal_approx(player.instance.t,0.1),id+" rejected seek preserves running simulation")
			var loader = Preloader.new(); root.add_child(loader)
			var result = await loader.warmup(preset)
			check(not result.ok,id+" rejects prewarming stateful simulation")
			loader.free()
		else:
			check(player.seek(0.2),id+" analytic seek works")
		player.paused = true; player.set_parameters({"seed":-923})
		check(player.paused and preset.get_parameter("seed")!=-923,id+" tuning preserves pause and preset isolation")
		if stateful: check(player.instance.t==0,id+" tuning replays a fresh simulation")
		player.paused = false; player.playback_speed = 1; player.restart(); player.advance(resolved.meta.duration)
		if resolved.meta.loop:
			check(player.is_playing() and completions[0]==0,id+" continuous effect loops")
			player.stop(); player.advance(0.301)
		else:
			check(player.state==Player.State.FINISHED,id+" one-shot terminates at its duration")
		check(player.state==Player.State.FINISHED and player.get_layer_texture()==null and player.get_layer_texture("back")==null,id+" finish removes both layer textures")
		player.advance(0.5); check(completions[0]==1,id+" emits finished exactly once")
		player.restart(); check(player.get_parameters().seed==-923,id+" replay retains overrides")
		player.stop(); player.advance(0.301); check(player.state==Player.State.FINISHED,id+" interrupted playback fades and ends")
		player.play(); player.free_when_finished = true; player.stop(); player.advance(0.301)
		check(player.is_queued_for_deletion(),id+" frees one-shot on completion")
		await process_frame
		Cache.clear()
	var gallery = load("res://demos/pixelfx/b1_gallery.tscn").instantiate(); root.add_child(gallery); gallery.set_process(false)
	for i in range(IDS.size()):
		gallery.select_effect(i); var active = gallery.player; active.update_mode = Player.UpdateMode.MANUAL
		check(active.is_playing() and active.instance.meta.id=="pixelfx."+IDS[i],IDS[i]+" native gallery selection")
		gallery.pause_button.pressed.emit(); check(active.paused,IDS[i]+" gallery pause")
		gallery.flip_button.pressed.emit(); check(active.flip_h,IDS[i]+" gallery mirror")
		gallery._fit()
		var rect=Rect2(active.get_frame_bounds()); rect.position.x=-rect.end.x
		var display_rect=Rect2(rect.position*gallery.stage.scale+gallery.stage.position,rect.size*gallery.stage.scale)
		check(Rect2(0,0,752,544).grow(0.01).encloses(display_rect),IDS[i]+" mirrored preview fits canvas")
		gallery.stop_button.pressed.emit(); active.advance(0.301); check(active.state==Player.State.FINISHED,IDS[i]+" gallery stop")
		gallery.replay_button.pressed.emit(); check(active.is_playing(),IDS[i]+" gallery replay")
		if IDS[i]=="splash":
			gallery.stone_button.button_pressed=false
			check(not active.get_parameters().stone,"splash gallery stone input is wired")
	check(gallery.back_view.get_index()<gallery.marker.get_index() and gallery.marker.get_index()<gallery.front_view.get_index(),"B1 gallery places scene occluder between both views")
	gallery.free(); await process_frame; Cache.clear()
	# Environment belongs with measured performance, not a hardware-independent FPS promise.
	FileAccess.open("res://builds/pixelfx/runtime-b1.json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures,"environment":{"godot":Engine.get_version_info().string,"os":OS.get_name(),"cpu":OS.get_processor_name(),"display":DisplayServer.get_name()}},"  "))
	print("PIXELFX_B1_RUNTIME checks=",checks," failures=",failures.size())
	quit(0 if failures.is_empty() else 1)
