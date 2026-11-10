extends SceneTree
const S=preload("res://addons/pixelfx/native/semantics.gd")
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
var failures: Array=[]
var checks=0
func check(ok,message):
	checks+=1
	if not ok:failures.append(message);push_error(message)
func _initialize():call_deferred("run")
func run():
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/acceptance/config-b2-full.json"))
	var performance={}
	for row in config.entries:
		print("NATIVE_CATALOG_START ",row.source)
		var error_start=S.errors.size()
		var preset=load("res://addons/pixelfx/presets/"+row.id+".tres")
		var variants=[{}, {"seed":-923,"light":3.0}]
		for field in preset.schema():
			if field.name in ["seed","light","actor","palette"]:continue
			if field.has("min") and field.has("max"):
				variants.append({field.name:field.min});variants.append({field.name:field.max})
				check(not preset.resolve({field.name:float(field.min)-1}).ok,row.source+" rejects lower invalid "+field.name)
				check(not preset.resolve({field.name:float(field.max)+1}).ok,row.source+" rejects upper invalid "+field.name)
		var timings=[]
		for overrides in variants:
			var data=preset.resolve(overrides);check(data.ok,row.source+" resolves extremes "+str(overrides))
			if not data.ok:continue
			var rect: Rect2i=data.bounds
			var fx=Fx.new(preset.new_module(),data.options);var previous=0.0
			for fraction in [0.0,0.17,0.51,0.97]:
				var t: float=fraction*data.meta.duration;fx.update(t-previous);previous=t
				var frame=Frame.new(rect.size.x+128,rect.size.y+128,rect.position.x-64,rect.position.y-64)
				var start=Time.get_ticks_usec();fx.draw(frame)
				if overrides.is_empty():timings.append((Time.get_ticks_usec()-start)/1000.0)
				var used=frame.image().get_used_rect();used.position+=Vector2i(frame.ox,frame.oy)
				check(used.size==Vector2i.ZERO or rect.encloses(used),row.source+" no bounds clipping "+str(overrides)+" at "+str(fraction)+" used="+str(used))
			fx=null
		check(S.errors.size()==error_start,row.source+" has no semantic errors")
		performance[row.source]={"sampled_draw_ms":timings,"note":"Four cold lifecycle samples; no real-time FPS guarantee."}
		S.shutdown()
	FileAccess.open("res://builds/pixelfx/acceptance/catalog-b2-native.json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures,"performance":performance},"\t"))
	print("NATIVE_CATALOG_DONE checks=",checks," failures=",failures.size());quit(0 if failures.is_empty() else 1)
