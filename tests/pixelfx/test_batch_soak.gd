extends SceneTree
const Player = preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Cache = preload("res://addons/pixelfx/runtime/frame_cache.gd")
var ids: Array = []
var batch: String
var failures: Array=[]
func _initialize() -> void: run.call_deferred()
func run() -> void:
	batch=OS.get_environment("PIXELFX_BATCH")
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://tests/pixelfx/batches/"+batch+".json"))
	for row in config.effects: ids.append(row.id)
	var players=[]
	for id in ids:
		var player=Player.new(); player.autoplay=false; player.update_mode=Player.UpdateMode.MANUAL; player.effect=load("res://addons/pixelfx/presets/"+id+".tres"); root.add_child(player); player.play(); player.cancel(); players.append(player)
	Cache.clear(); await process_frame
	var observations=[]; var start=Time.get_ticks_usec()
	for round_index in range(2):
		for player in players:
			for replay in range(8):
				player.play({"seed":replay-16})
				player.advance(player.instance.meta.duration if not player.instance.meta.loop else 0.25)
				player.cancel()
		Cache.clear(); await process_frame
		observations.append({"objects":Performance.get_monitor(Performance.OBJECT_COUNT),"static_bytes":OS.get_static_memory_usage(),"cache":Cache.statistics()})
	if observations[1].objects>observations[0].objects+8: failures.append("simulation objects grow across replay batches")
	if observations[1].static_bytes>observations[0].static_bytes+1048576: failures.append("more than 1 MiB retained growth across replay batches")
	for player in players: player.free()
	Cache.clear()
	FileAccess.open("res://builds/pixelfx/soak-"+batch+".json",FileAccess.WRITE).store_string(JSON.stringify({"replays":ids.size()*16,"seeds_per_effect":8,"batches":observations,"wall_seconds":(Time.get_ticks_usec()-start)/1000000.0,"failures":failures},"  "))
	print("PIXELFX_BATCH_SOAK batch="+batch+" replays="+str(ids.size()*16)+" failures=",failures.size())
	quit(0 if failures.is_empty() else 1)
