extends SceneTree
const Semantics=preload("res://addons/pixelfx/native/semantics.gd")
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
const Act=preload("res://addons/pixelfx/native/act.gd")
func _initialize():call_deferred("run")
func run():
	var phase=OS.get_environment("PIXELFX_ACCEPTANCE_PHASE")
	if phase.is_empty():phase="survey"
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/acceptance/config-"+phase+".json"))
	var shard=int(OS.get_environment("PIXELFX_SHARD"));var shards=maxi(1,int(OS.get_environment("PIXELFX_SHARDS")))
	var selected=OS.get_environment("PIXELFX_EFFECT").split(",",false)
	var records: Array=[]
	var measurements: Array=[]
	for row in config.entries:
		if int(row.index)%shards!=shard or not selected.is_empty() and row.source not in selected:continue
		print("NATIVE_ACCEPT_START ",row.source)
		var start=Time.get_ticks_msec();var errors_start=Semantics.errors.size()
		for group in row.groups:
			var fx=Act.new(row.source,group.options) if group.get("act",false) else Fx.new(load("res://"+row.implementation).new(),group.options)
			for sample in group.cases:
				var frame=Frame.new(int(row.viewport.w),int(row.viewport.h),int(row.viewport.ox),int(row.viewport.oy))
				frame.track_writes=true
				for step in sample.get("updates64",[sample.update64]):fx.update(PackedByteArray(step).decode_double(0))
				if sample.get("stop",false):fx.stop()
				var draw_start=Time.get_ticks_usec()
				if group.get("act",false):fx.draw(frame)
				else:fx.draw(frame,group.get("layer",""))
				var drawn=Time.get_ticks_usec()
				var bytes=frame.composite(int(group.bg) if group.has("bg") else null)
				measurements.append({"effect":row.source,"case":sample.name,"draw_ms":(drawn-draw_start)/1000.0,"composite_ms":(Time.get_ticks_usec()-drawn)/1000.0})
				FileAccess.open("res://builds/pixelfx/acceptance/"+sample.name+".actual.rgba",FileAccess.WRITE).store_buffer(bytes)
				print("NATIVE_ACCEPT_FRAME ",sample.name)
			fx=null
		var record={"effect":row.source,"milliseconds":Time.get_ticks_msec()-start,"errors":Semantics.errors.slice(errors_start)}
		records.append(record)
		FileAccess.open("res://builds/pixelfx/acceptance/run-"+phase+"-"+str(shard)+".json",FileAccess.WRITE).store_string(JSON.stringify(records,"\t"))
		print("NATIVE_ACCEPT_EFFECT ",JSON.stringify(record))
		# Release lexical cycles between effects; module caches are rebuilt independently.
		Semantics.shutdown()
	FileAccess.open("res://builds/pixelfx/acceptance/timings-"+phase+"-"+str(shard)+".json",FileAccess.WRITE).store_string(JSON.stringify(measurements))
	print("NATIVE_ACCEPT_DONE effects=",records.size());quit(0)
