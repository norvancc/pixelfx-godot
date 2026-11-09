extends SceneTree
const Fx = preload("res://addons/pixelfx/core/fx.gd")
const Frame = preload("res://addons/pixelfx/core/frame.gd")
const Catalog = preload("res://addons/pixelfx/editor/catalog.gd")
var failures = []
var checks = 0
var performance = {}
var batch: String
func check(ok: bool, message: String) -> void:
	checks += 1
	if not ok: failures.append(message); push_error(message)
func _initialize() -> void:
	batch=OS.get_environment("PIXELFX_BATCH")
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://tests/pixelfx/batches/"+batch+".json"))
	var rows=config.effects
	var entries = Catalog.discover(PackedStringArray(["res://addons/pixelfx/effects"]))
	var expected = JSON.parse_string(FileAccess.get_file_as_string("res://addons/pixelfx/provenance.json")).effects
	check(entries.size()==expected.size(),"catalog discovers the complete provenance scope")
	for row in rows:
		var preset = load("res://addons/pixelfx/presets/"+row.id+".tres")
		check(preset.validate().is_empty(), row.id+" default preset validates")
		var variants = [{}, {"seed":-923,"light":3.0}]
		for key in row.limits:
			variants.append({key:row.limits[key][0]})
			variants.append({key:row.limits[key][1]})
		var minimum = {}
		var maximum = {}
		for key in row.limits:
			minimum[key]=row.limits[key][0]; maximum[key]=row.limits[key][1]
		if minimum.size()>1: variants.append(minimum); variants.append(maximum)
		for field in preset.schema():
			if field.type==TYPE_BOOL: variants.append({field.name:not field.default})
		var times = []
		for overrides in variants:
			for field in preset.schema():
				if field.type==TYPE_INT and overrides.has(field.name): overrides[field.name]=int(overrides[field.name])
			var data = preset.resolve(overrides)
			check(data.ok, row.id+" parameter extremes validate: "+str(overrides))
			if not data.ok: continue
			var rect: Rect2i = data.bounds
			var fx = Fx.new(preset.new_module(), data.options)
			var previous = 0.0
			for fraction in [0.0,0.17,0.51,0.97]:
				var time: float = fraction*data.meta.duration
				fx.update(time-previous); previous=time
				var frame = Frame.new(rect.size.x+128,rect.size.y+128,rect.position.x-64,rect.position.y-64)
				var start = Time.get_ticks_usec()
				fx.draw(frame)
				if overrides.is_empty(): times.append((Time.get_ticks_usec()-start)/1000.0)
				var used: Rect2i = frame.image().get_used_rect()
				used.position += Vector2i(frame.ox,frame.oy)
				var reference_rect=Rect2i(int(config.frame.x),int(config.frame.y),int(config.frame.width),int(config.frame.height))
				check(used.size==Vector2i.ZERO or reference_rect.encloses(used),row.id+" independent reference canvas covers "+str(overrides)+" at "+str(fraction))
				check(used.size == Vector2i.ZERO or rect.encloses(used), row.id+" unclipped at "+str(fraction)+" "+str(overrides)+" used="+str(used))
		var sum = 0.0
		for ms in times: sum += ms
		performance[row.id] = {"samples":times.size(),"sampled_cold_ms_mean":sum/times.size(),"sampled_cold_ms_max":times.max(),"note":"Four lifecycle samples; not an exhaustive peak or real-time frame-rate guarantee."}
	FileAccess.open("res://builds/pixelfx/catalog-"+batch+".json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures,"performance":performance,"environment":{"godot":Engine.get_version_info().string,"os":OS.get_name(),"cpu":OS.get_processor_name()}},"  "))
	print("PIXELFX_BATCH_CATALOG batch="+batch+" checks=",checks," failures=",failures.size())
	quit(0 if failures.is_empty() else 1)
