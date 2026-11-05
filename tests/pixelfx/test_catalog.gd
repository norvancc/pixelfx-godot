extends SceneTree
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Frame = preload("res://addons/pixelfx/core/frame.gd")
const Fx = preload("res://addons/pixelfx/core/fx.gd")
const Cache = preload("res://addons/pixelfx/runtime/frame_cache.gd")
const Catalog = preload("res://addons/pixelfx/editor/catalog.gd")
const IDS = ["fireball","ice_lance","laser_bolt","sunburst","ripples"]
var failures:Array=[]
var checks := 0
var performance := {}
func check(ok:bool,message:String) -> void:
	checks += 1
	if not ok: failures.append(message); push_error(message)
func _initialize() -> void: run.call_deferred()
func run() -> void:
	var entries := Catalog.discover(PackedStringArray(["res://addons/pixelfx/effects"]))
	var names := []
	for entry in entries: names.append(entry.new_module().metadata().id)
	check(names.size()==5,"catalog discovers exactly five algorithms")
	for id in IDS:
		check(names.has("pixelfx."+id),id+" discovered")
		var preset=load("res://addons/pixelfx/presets/"+id+".tres")
		check(preset.validate().is_empty(),id+" preset valid")
		var player=Player.new(); player.effect=preset; player.autoplay=false; player.update_mode=Player.UpdateMode.MANUAL; root.add_child(player)
		check(player.play(),id+" plays")
		player.paused=true; player.advance(.2); check(player.instance.t==0,id+" pause")
		player.paused=false; player.playback_speed=1.25; player.advance(.2); check(is_equal_approx(player.instance.t,.25),id+" speed")
		player.seek(.2); var first=player.get_layer_texture(); player.seek(.4); player.seek(.2)
		check(player.get_layer_texture()==first,id+" cached seek")
		var data:Dictionary=preset.resolve(); var duration:float=data.meta.duration
		player.seek(duration); check(player.is_playing(),id+" loops")
		check(player.get_layer_texture("back")!=null if id=="ripples" else player.get_layer_texture("back")==null,id+" correct layers")
		player.set_parameters({"seed":-923}); check(preset.get_parameter("seed")!=-923,id+" preset isolation")
		player.stop(); player.advance(.4); check(player.state==Player.State.FINISHED and player.get_layer_texture()==null,id+" fade and cleanup")
		check(player.restart() and player.get_parameters().seed==-923,id+" restart keeps overrides")
		player.free()
		var variants:Array=[{}, {"seed":-923,"light":3.0}]
		for field in preset.schema():
			if field.name in ["radius","speed","length","rays"]:
				variants.append({field.name:field.min}); variants.append({field.name:field.max})
		# Render into a larger canvas: every visible RGBA pixel must fit within the declared bounds.
		for overrides in variants:
			var resolved:Dictionary=preset.resolve(overrides); var bounds:Rect2i=resolved.bounds
			for fraction in [0.0,.17,.51,.97]:
				var frame=Frame.new(bounds.size.x+128,bounds.size.y+128,bounds.position.x-64,bounds.position.y-64)
				var fx=Fx.new(preset.new_module(),resolved.options); fx.update(fraction*duration); fx.draw(frame)
				var used:Rect2i=frame.image().get_used_rect(); used.position+=Vector2i(frame.ox,frame.oy)
				check(bounds.encloses(used),id+" unclipped "+str(overrides)+" at "+str(fraction))
		var times:Array=[]; var bytes := 0
		var benchmark=Player.new(); benchmark.autoplay=false; benchmark.effect=preset; benchmark.update_mode=Player.UpdateMode.MANUAL; root.add_child(benchmark)
		Cache.clear(); benchmark.play(); times.append(benchmark.last_render_ms)
		for tick in range(1,ceili(duration*30)):
			benchmark.seek(float(tick)/30); times.append(benchmark.last_render_ms)
		bytes=Cache.statistics().bytes
		var sum := 0.0
		for ms in times: sum += ms
		performance[id]={"frames":times.size(),"cold_ms_mean":sum/times.size(),"cold_ms_max":times.max(),"cache_bytes":bytes}
		benchmark.free(); Cache.clear()
	# The actual gallery uses the same public controls for all five effects.
	var gallery=load("res://demos/pixelfx/gallery.tscn").instantiate(); root.add_child(gallery); gallery.set_process(false)
	for id in range(5):
		gallery.select_effect(id); var player=gallery.players[id]; player.update_mode=Player.UpdateMode.MANUAL
		check(player.is_playing(),IDS[id]+" gallery selection")
		gallery.pause_button.pressed.emit(); check(player.paused,IDS[id]+" gallery pause")
		gallery.flip_button.pressed.emit(); check(player.flip_h,IDS[id]+" gallery flip")
		gallery.palette_select.item_selected.emit(1); check(player.get_parameters().palette.size()>0,IDS[id]+" gallery recolor")
		if gallery.parameter_name!="":
			gallery.parameter_slider.value=gallery.parameter_slider.max_value
			check(player.get_parameters()[gallery.parameter_name]==gallery.parameter_slider.max_value,IDS[id]+" gallery parameter")
		gallery.stop_button.pressed.emit(); player.advance(.4); check(player.state==Player.State.FINISHED,IDS[id]+" gallery stop")
		gallery.replay_button.pressed.emit(); check(player.is_playing(),IDS[id]+" gallery replay")
	check(gallery.back_view.get_index()<gallery.marker.get_index() and gallery.marker.get_index()<gallery.front_view.get_index(),"ripples surround the scene-owned occluder")
	gallery.free(); await process_frame
	Cache.clear()
	FileAccess.open("res://builds/pixelfx/catalog-v020.json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures,"performance":performance},"  "))
	print("PIXELFX_CATALOG checks=",checks," failures=",failures.size())
	quit(0 if failures.is_empty() else 1)
