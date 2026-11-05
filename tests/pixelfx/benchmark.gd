extends SceneTree
const Player=preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Preloader=preload("res://addons/pixelfx/runtime/preloader.gd")
const Cache=preload("res://addons/pixelfx/runtime/frame_cache.gd")
var report: Dictionary={}
func _initialize() -> void: call_deferred("run")
func run() -> void:
	var preset=load("res://addons/pixelfx/presets/fireball.tres")
	Cache.clear()
	var loader=Preloader.new();root.add_child(loader)
	var start=Time.get_ticks_usec()
	var result=await loader.warmup(preset)
	report["warmup"]={"result":result,"wall_ms":(Time.get_ticks_usec()-start)/1000.0,"cache":Cache.statistics()}
	loader.free()
	report["synchronized_warm"]=[]
	for count in [1,16,64]:
		var players=[]
		for i in range(count):
			var p=Player.new();p.autoplay=false;p.update_mode=Player.UpdateMode.MANUAL;p.effect=preset;root.add_child(p);p.play();players.append(p)
		var samples=[];var misses=Cache.misses
		for frame in range(180):
			start=Time.get_ticks_usec()
			for p in players:p.advance(1.0/60)
			samples.append((Time.get_ticks_usec()-start)/1000.0)
		samples.sort()
		report.synchronized_warm.append({"players":count,"mean_cpu_ms_per_tick":samples.reduce(func(a,b):return a+b,0.0)/samples.size(),"p95_cpu_ms_per_tick":samples[int(samples.size()*0.95)],"cache_misses":Cache.misses-misses})
		for p in players:p.free()
	Cache.clear();var cold=[]
	for i in range(16):
		var p=Player.new();p.autoplay=false;p.update_mode=Player.UpdateMode.MANUAL;p.effect=preset;root.add_child(p)
		start=Time.get_ticks_usec();p.play({"seed":100+i});cold.append((Time.get_ticks_usec()-start)/1000.0);p.free()
	report["unique_seed_cold"]={"instances":16,"mean_play_ms":cold.reduce(func(a,b):return a+b,0.0)/cold.size(),"max_play_ms":cold.max(),"note":"Includes construction, validation, first rasterization and upload. Not a frame-rate benchmark."}
	report["environment"]={"godot":Engine.get_version_info().string,"os":OS.get_name(),"cpu":OS.get_processor_name(),"display":DisplayServer.get_name()}
	FileAccess.open("res://builds/pixelfx/benchmark-v010.json",FileAccess.WRITE).store_string(JSON.stringify(report,"  "))
	print("PIXELFX_BENCHMARK ",JSON.stringify(report));Cache.clear();quit()
