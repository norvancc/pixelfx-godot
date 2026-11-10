extends SceneTree
## Run by itself: total native update + render cost, with first-use and warm samples separated.
const S=preload("res://addons/pixelfx/native/semantics.gd")
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Renderer=preload("res://addons/pixelfx/runtime/renderer.gd")
func _initialize():call_deferred("run")
func run():
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/acceptance/config-b2-full.json"))
	var rows=[]
	for row in config.entries:
		var preset=load("res://addons/pixelfx/presets/"+row.id+".tres");var data=preset.resolve()
		var cold=Time.get_ticks_usec();var fx=Fx.new(preset.new_module(),data.options);var renderer=Renderer.new()
		renderer.render(fx,data.bounds,30,"performance-probe",false)
		var first_ms=(Time.get_ticks_usec()-cold)/1000.0
		var full_cycle=OS.get_environment("PIXELFX_PERFORMANCE_FULL_CYCLE")=="1"
		if not full_cycle:fx.update(data.meta.duration*0.17)
		var samples=[];var draw_samples=[];var update_samples=[]
		for i in range(ceili(data.meta.duration*30) if full_cycle else 12):
			var start=Time.get_ticks_usec();fx.update(1.0/30);var updated=Time.get_ticks_usec()
			renderer.render(fx,data.bounds,30,"performance-probe",false)
			var end=Time.get_ticks_usec()
			samples.append((end-start)/1000.0);update_samples.append((updated-start)/1000.0);draw_samples.append((end-updated)/1000.0)
		var sorted=samples.duplicate();sorted.sort();var p50=sorted[sorted.size()/2];var p95=sorted[mini(sorted.size()-1,ceili(sorted.size()*0.95)-1)]
		var record={"effect":row.source,"first_use_ms":first_ms,"total_ms":samples,"update_ms":update_samples,"render_ms":draw_samples,"p50_ms":p50,"p95_ms":p95,"max_ms":sorted[-1],"budget_ms":1000.0/30,"meets_30fps":p95<=1000.0/30,"approx_serial_fps":1000.0/p50}
		rows.append(record);print("NATIVE_PERFORMANCE ",JSON.stringify(record));fx=null;renderer=null;S.shutdown()
	FileAccess.open("res://builds/pixelfx/acceptance/performance-b2-native"+("-full-cycle" if OS.get_environment("PIXELFX_PERFORMANCE_FULL_CYCLE")=="1" else "")+".json",FileAccess.WRITE).store_string(JSON.stringify({"environment":{"godot":Engine.get_version_info().string,"os":OS.get_name(),"cpu":OS.get_processor_name()},"method":"Sequential single process, one active effect, full lifecycle at 30 Hz." if OS.get_environment("PIXELFX_PERFORMANCE_FULL_CYCLE")=="1" else "Sequential single process, one active effect, twelve warm 30 Hz update+render samples after 17 percent of duration. CPU cost excludes scene/UI overhead; approximate FPS is a CPU upper bound, not measured presentation FPS.","records":rows},"\t"))
	print("NATIVE_PERFORMANCE_DONE effects=",rows.size());quit()
