extends SceneTree
const S=preload("res://addons/pixelfx/native/semantics.gd")
const Player=preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Cache=preload("res://addons/pixelfx/runtime/frame_cache.gd")
func _initialize():call_deferred("run")
func run():
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/acceptance/config-b2-full.json"))
	var failures=[];var observations=[];var start=Time.get_ticks_msec();var players=[]
	for row in config.entries:
		var p=Player.new();p.autoplay=false;p.update_mode=Player.UpdateMode.MANUAL
		p.effect=load("res://addons/pixelfx/presets/"+row.id+".tres");root.add_child(p);players.append(p)
	for round_index in range(3):
		for p in players:
			for replay in range(8):
				if not p.play({"seed":replay-16}):failures.append("Replay start failed")
				p.advance(p.instance.meta.duration if not p.instance.meta.loop else 0.25);p.cancel()
		Cache.clear();S.collect();await process_frame
		observations.append({"objects":Performance.get_monitor(Performance.OBJECT_COUNT),"static_bytes":OS.get_static_memory_usage(),"cache":Cache.statistics()})
		print("NATIVE_SOAK_ROUND ",round_index," ",JSON.stringify(observations[-1]))
	if observations[2].objects>observations[1].objects+8:failures.append("Objects grow across replay batches")
	if observations[2].static_bytes>observations[1].static_bytes+1048576:failures.append("More than 1 MiB retained growth across replay batches")
	if not S.errors.is_empty():failures.append_array(S.errors)
	for p in players:p.free()
	Cache.clear();S.shutdown()
	FileAccess.open("res://builds/pixelfx/acceptance/soak-b2-native.json",FileAccess.WRITE).store_string(JSON.stringify({"replays":config.entries.size()*24,"seeds_per_effect":8,"observations":observations,"wall_seconds":(Time.get_ticks_msec()-start)/1000.0,"failures":failures},"\t"))
	print("NATIVE_SOAK_DONE replays=",config.entries.size()*24," failures=",failures.size());quit(0 if failures.is_empty() else 1)
