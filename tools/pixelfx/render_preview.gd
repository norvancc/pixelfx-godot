extends SceneTree
## Deterministic native preview export. Animation capture, not an acceptance test.
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
const Act=preload("res://addons/pixelfx/native/act.gd")
const Semantics=preload("res://addons/pixelfx/native/semantics.gd")
func _initialize():call_deferred("run")
func run():
	var id=OS.get_environment("PIXELFX_PREVIEW_EFFECT")
	var folder=OS.get_environment("PIXELFX_PREVIEW_DIR")
	var impl=OS.get_environment("PIXELFX_PREVIEW_IMPLEMENTATION")
	var module=load("res://"+impl).new();var meta=module.metadata()
	var preset=load("res://addons/pixelfx/presets/"+id.get_file().replace("-","_")+".tres")
	var resolved=preset.resolve()
	if not resolved.ok:push_error(str(resolved.errors));quit(1);return
	var choreographed=id.begins_with("moves/")
	var instance=Act.new(id,resolved.options) if choreographed else Fx.new(module,resolved.options)
	var rect=Rect2i(-220,-240,660,440) if choreographed else resolved.bounds
	var duration=float(meta.duration)
	if choreographed:
		var timing=instance.timings()
		if timing is Dictionary:
			duration+=float(timing.get("windup",0))+float(timing.get("recovery",0))
			for hit in timing.get("hits",[]):duration+=float(hit.get("freeze",0))+1.0/30.0
	var fps=30
	var count=ceili(duration*fps)+1
	var frame=Frame.new(rect.size.x,rect.size.y,rect.position.x,rect.position.y)
	frame.track_writes=choreographed or module.has_method("source_module")
	var output=FileAccess.open(folder+"/frames.rgba",FileAccess.WRITE)
	var capture_bounds=Rect2i()
	var has_bounds=false
	for tick in range(count):
		if tick>0:instance.update(1.0/fps)
		frame.clear();instance.draw(frame)
		if frame.dirty_x1>=frame.dirty_x0:
			var written=Rect2i(frame.dirty_x0,frame.dirty_y0,frame.dirty_x1-frame.dirty_x0+1,frame.dirty_y1-frame.dirty_y0+1)
			capture_bounds=capture_bounds.merge(written) if has_bounds else written
			has_bounds=true
		var rgba=frame.composite(0xffe8dce2 if id.begins_with("transitions/") else 0xff140d11)
		output.store_buffer(rgba)
		if tick%30==0:print("PREVIEW_PROGRESS ",id," ",tick,"/",count)
	output.close()
	FileAccess.open(folder+"/capture.json",FileAccess.WRITE).store_string(JSON.stringify({"capture_bounds":[capture_bounds.position.x,capture_bounds.position.y,capture_bounds.size.x,capture_bounds.size.y],"effect":id,"name":meta.name,"description":meta.get("desc",""),"tags":meta.get("tags",[]),"duration":duration,"loop":meta.get("loop",false),"fps":fps,"frames":count,"width":rect.size.x,"height":rect.size.y,"implementation":impl,"choreography":choreographed,"capture_version":2,"errors":Semantics.errors}))
	instance=null;Semantics.shutdown();print("PREVIEW_CAPTURE_DONE ",id);quit(0)
