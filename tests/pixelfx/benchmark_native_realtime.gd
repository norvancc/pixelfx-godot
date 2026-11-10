extends SceneTree
## Visible GL scene, actual elapsed-time updates; independent of fixed-frame movies.
const S=preload("res://addons/pixelfx/native/semantics.gd")
const Player=preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
var frame_changes=0
func _initialize():call_deferred("run")
func run():
	Engine.max_fps=60
	var gallery=load("res://demos/pixelfx/b2_completion_gallery.tscn").instantiate();root.add_child(gallery)
	gallery.player.update_mode=Player.UpdateMode.MANUAL
	gallery.player.cache_enabled=false
	gallery.player.frame_changed.connect(func():frame_changes+=1)
	var records=[]
	for i in range(gallery.IDS.size()):
		gallery.select_effect(i);var duration:float=gallery.player.instance.meta.duration;var start:int=Time.get_ticks_usec();var previous:int=start;var rendered:int=0;var render_samples=[];var intervals=[]
		while gallery.player.instance.t<duration:
			await process_frame
			var now:int=Time.get_ticks_usec();var delta:float=(now-previous)/1000000.0;previous=now;intervals.append(delta*1000)
			var count:int=frame_changes;gallery.player.advance(delta)
			if frame_changes!=count and gallery.player.is_playing():rendered+=1;render_samples.append(gallery.player.last_render_ms)
		var wall:float=(Time.get_ticks_usec()-start)/1000000.0;var elapsed:float=gallery.player.instance.t;var sorted=render_samples.duplicate();sorted.sort();var gaps=intervals.duplicate();gaps.sort()
		var record={"effect":gallery.IDS[i],"wall_seconds":wall,"effect_seconds":elapsed,"presented_effect_updates":rendered,"effect_updates_per_wall_second":rendered/wall,"render_p50_ms":sorted[sorted.size()/2] if not sorted.is_empty() else 0,"render_p95_ms":sorted[mini(sorted.size()-1,ceili(sorted.size()*0.95)-1)] if not sorted.is_empty() else 0,"scene_frame_p95_ms":gaps[mini(gaps.size()-1,ceili(gaps.size()*0.95)-1)],"screenshot":"builds/pixelfx/realtime-"+gallery.IDS[i]+".png"}
		# GPU readback can stall for seconds on macOS; capture outside the timed lifecycle.
		gallery.select_effect(i);gallery.player.advance(duration*0.51)
		await RenderingServer.frame_post_draw
		root.get_texture().get_image().save_png("res://builds/pixelfx/realtime-"+gallery.IDS[i]+".png")
		records.append(record);print("NATIVE_REALTIME ",JSON.stringify(record))
		FileAccess.open("res://builds/pixelfx/acceptance/performance-b2-realtime.json",FileAccess.WRITE).store_string(JSON.stringify({"environment":{"godot":Engine.get_version_info().string,"os":OS.get_name(),"cpu":OS.get_processor_name(),"display":DisplayServer.get_name()},"method":"Visible GL Compatibility gallery, one active player, no frame cache, actual elapsed-time updates over one complete lifecycle, 60 Hz scene cap and 30 Hz effect render target. Includes UI/scene scheduling; screenshots are runtime output, not oracle references.","records":records}))
	gallery.queue_free();await process_frame;S.shutdown();print("NATIVE_REALTIME_DONE effects=",records.size());quit()
