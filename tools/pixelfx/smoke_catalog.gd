extends SceneTree
const Semantics=preload("res://addons/pixelfx/native/semantics.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
const Fx=preload("res://addons/pixelfx/core/fx.gd")
func _initialize():call_deferred("run")
func run():
	if OS.get_environment("PIXELFX_PARSE_ONLY")=="1":
		for path in Semantics.Registry.PATHS.values():
			if path.ends_with("core__painter.gd"):continue
			var script=load(path)
			if script==null or not script.can_instantiate():print("PARSE_FAILED ",path);quit(1);return
		print("PIXELFX_NATIVE_PARSE_PASSED");quit(0);return
	var catalog=JSON.parse_string(FileAccess.get_file_as_string("res://addons/pixelfx/native/catalog.json"))
	var filter=OS.get_environment("PIXELFX_EFFECT")
	var first=OS.get_environment("PIXELFX_START")
	var records: Array=[]
	if not first.is_empty() and FileAccess.file_exists("res://builds/pixelfx/full-smoke.json"):
		records=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/full-smoke.json")).records
	for row in catalog:
		if not filter.is_empty() and row.source not in filter.split(","):continue
		if not first.is_empty() and row.source<first:continue
		print("SMOKE_START ",row.source)
		var start=Time.get_ticks_msec();var error_start=Semantics.errors.size()
		var script=load("res://"+row.implementation)
		if script==null or not script.can_instantiate():print("SMOKE_LOAD_FAILED ",row.source);quit(1);return
		var preset=load("res://addons/pixelfx/presets/"+row.id+".tres")
		var resolved=preset.resolve()
		if not resolved.ok:print("SMOKE_RESOLVE_FAILED ",row.source," ",resolved.errors);quit(1);return
		var fx=Fx.new(script.new(),resolved.options)
		var bounds=resolved.bounds;var frame=Frame.new(bounds.size.x,bounds.size.y,bounds.position.x,bounds.position.y)
		fx.draw(frame)
		var occupied_samples=[frame.color.size()-frame.color.count(0)+frame.light.size()-frame.light.count(0)]
		# A short native playback step checks construction, update and both drawing layers.
		fx.update(1.0/30.0);frame.clear();fx.draw(frame)
		occupied_samples.append(frame.color.size()-frame.color.count(0)+frame.light.size()-frame.light.count(0))
		if OS.get_environment("PIXELFX_SMOKE_PEAK")=="1":
			# Short chained strikes can finish before the middle of the declared actor scene.
			for fraction in [0.17,0.45]:
				fx.update(maxf(0.0,float(row.meta.duration)*fraction-fx.t));frame.clear();fx.draw(frame)
				occupied_samples.append(frame.color.size()-frame.color.count(0)+frame.light.size()-frame.light.count(0))
		if occupied_samples.max()==0:Semantics.fail("No pixels at sampled times for "+row.source)
		var record={"occupied_samples":occupied_samples,"effect":row.source,"milliseconds":Time.get_ticks_msec()-start,"errors":Semantics.errors.slice(error_start)}
		records=records.filter(func(r):return r.effect!=row.source)
		record["drawn_at_seconds"]=[0.0,1.0/30.0]
		if OS.get_environment("PIXELFX_SMOKE_PEAK")=="1":
			for fraction in [0.17,0.45]:record.drawn_at_seconds.append(float(row.meta.duration)*fraction)
		records.append(record);print("SMOKE_RESULT ",JSON.stringify(record))
		var file=FileAccess.open("res://builds/pixelfx/full-smoke.json",FileAccess.WRITE);file.store_string(JSON.stringify({"records":records},"\t"));file.close()
		if not record.errors.is_empty():Semantics.shutdown();quit(1);return
	print("PIXELFX_CATALOG_SMOKE_PASSED count=",records.size());Semantics.shutdown();quit(0)
