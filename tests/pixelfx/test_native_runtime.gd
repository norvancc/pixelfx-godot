extends SceneTree
const S=preload("res://addons/pixelfx/native/semantics.gd")
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
const Player=preload("res://addons/pixelfx/pixel_fx_player_2d.gd")
const Cache=preload("res://addons/pixelfx/runtime/frame_cache.gd")
var failures: Array=[]
var checks=0
func check(ok,message):
	checks+=1
	if not ok:failures.append(message);push_error(message)
func bytes(fx,rect,layer=""):
	var frame=Frame.new(rect.size.x,rect.size.y,rect.position.x,rect.position.y);fx.draw(frame,layer);return frame.composite().duplicate()
func _initialize():call_deferred("run")
func run():
	var config=JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/acceptance/config-b2-full.json"))
	var records: Array=[]
	for row in config.entries:
		var error_start=S.errors.size();print("NATIVE_RUNTIME_START ",row.source)
		var preset=load("res://addons/pixelfx/presets/"+row.id+".tres")
		var data=preset.resolve();check(data.ok,row.source+" resolves schema")
		var rect: Rect2i=data.bounds
		var a=Fx.new(preset.new_module(),data.options);var b=Fx.new(preset.new_module(),data.options)
		a.update(.2);b.update(.2)
		check(bytes(a,rect)==bytes(b,rect),row.source+" deterministic initial simulation")
		var before=bytes(a,rect);b.update(.1)
		check(before==bytes(a,rect),row.source+" isolated instances")
		var clock=a.t;var back=bytes(a,rect,"back");var front=bytes(a,rect,"front")
		check(a.t==clock and back==bytes(a,rect,"back") and front==bytes(a,rect,"front"),row.source+" draw has no time advancement")
		var p=Player.new();p.autoplay=false;p.update_mode=Player.UpdateMode.MANUAL;p.effect=preset;root.add_child(p)
		var finishes=[0];p.finished.connect(func():finishes[0]+=1)
		check(p.play(),row.source+" player starts")
		p.paused=true;p.advance(.2);check(p.instance.t==0,row.source+" pause freezes time")
		p.paused=false;p.playback_speed=2;p.advance(.05);check(is_equal_approx(p.instance.t,.1),row.source+" speed")
		check(not p.seek(.5),row.source+" rejects unsupported seek")
		p.paused=true;p.set_parameters({"seed":-923});check(p.paused and p.instance.t==0 and preset.get_parameter("seed")!=-923,row.source+" isolated tuning and restart")
		p.paused=false;p.playback_speed=1;p.restart();p.advance(data.meta.duration)
		if data.meta.loop:check(p.is_playing() and finishes[0]==0,row.source+" loop stays active");p.stop();p.advance(.301)
		check(p.state==Player.State.FINISHED and p.get_layer_texture()==null and p.get_layer_texture("back")==null,row.source+" finished removes both textures")
		p.advance(.5);check(finishes[0]==1,row.source+" finished exactly once")
		check(p.restart() and p.get_parameters().seed==-923,row.source+" replay retains parameters")
		p.stop();p.advance(.301);check(p.state==Player.State.FINISHED,row.source+" interrupted stop")
		p.free();a=null;b=null;S.shutdown();await process_frame
		check(S.errors.size()==error_start,row.source+" no semantic errors")
		records.append({"effect":row.source,"checks":checks,"failures":failures.duplicate()})
		FileAccess.open("res://builds/pixelfx/acceptance/runtime-b2-native.json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures,"records":records},"\t"))
	print("NATIVE_RUNTIME_DONE checks=",checks," failures=",failures.size());S.shutdown();quit(0 if failures.is_empty() else 1)
