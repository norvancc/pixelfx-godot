extends SceneTree
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
const Painter=preload("res://addons/pixelfx/core/painter.gd")
const Fireball=preload("res://addons/pixelfx/effects/fireball.gd")
const M=preload("res://addons/pixelfx/core/math.gd")
const C=preload("res://addons/pixelfx/core/color.gd")
var failures: Array=[]
var results: Array=[]
var render_ms: Array=[]
func check(ok: bool,message: String) -> void:
	if not ok: failures.append(message); push_error(message)
func compare(name: String,frame,bg=null) -> void:
	var actual: PackedByteArray=frame.composite(bg)
	var expected := FileAccess.get_file_as_bytes("res://builds/pixelfx/reference/"+name+".rgba")
	check(actual.size()==expected.size(),name+" buffer length")
	if actual.size()!=expected.size(): return
	var changed := 0; var max_error := 0; var sum_error := 0
	for i in range(actual.size()):
		var error := absi(int(actual[i])-int(expected[i]))
		if error: changed += 1; sum_error += error; max_error=maxi(max_error,error)
	results.append({"name":name,"changed_bytes":changed,"max_channel_error":max_error,"mean_channel_error":float(sum_error)/actual.size()})
	# Small float implementation discrepancies are recorded, never hidden in a similarity score.
	check(max_error <= 1 and changed <= 20,name+" differs: "+str(changed)+" channels, max "+str(max_error))
	if changed: frame.image(bg).save_png("res://builds/pixelfx/"+name+"-actual.png")
func _initialize() -> void:
	var source := "res://builds/pixelfx/reference/cases.json"
	if not FileAccess.file_exists(source): push_error("Generate upstream references first (tools/pixelfx/reference.mjs)"); quit(1); return
	var data: Dictionary=JSON.parse_string(FileAccess.get_file_as_string(source))
	for row in data.math:
		var seed_value: int=row.seed
		check(M.hash_numbers([seed_value,77])==int(row.hash),"hash "+str(seed_value))
		var r=M.rng([seed_value,77])
		for value in row.rng: check(r.next()*4294967296.0==value,"rng "+str(seed_value))
		check(absf(M.noise(-1.37,seed_value)-row.noise)<1e-14,"noise")
		check(absf(M.noise2(1.13,-4.17,seed_value)-row.noise2)<1e-14,"noise2")
		check(absf(M.fbm(1.13,-4.17,seed_value)-row.fbm)<1e-14,"fbm")
		check(absf(M.tile_noise(1.13,-4.17,3,5,seed_value)-row.tile)<1e-14,"tile noise")
	for row in data.cases:
		var fx=Fx.new(Fireball.new(),row.get("options",{})); var frame=Frame.new(224,224,-112,-112)
		fx.update(row.t)
		if row.has("stopAge"): fx.stop(); fx.update(row.stopAge)
		var start := Time.get_ticks_usec()
		fx.draw(frame,row.get("layer",""))
		render_ms.append((Time.get_ticks_usec()-start)/1000.0)
		var bg = int(row.bg) if row.get("bg") != null else null
		compare(row.name,frame,bg)
	for row in data.primitiveCases:
		var frame=Frame.new(96,96,-48,-48); var p=Painter.new(frame)
		p.place(2,-3,row.flip,row.angle); p.fade=0.73; p.light_k=0.8
		p.rect(-30,-30,15,12,C.hex("#7035bc"),0.6)
		p.line(-35,-5,35,4,C.hex("#ffeecc"))
		p.circle(-20,15,8,C.hex("#ff8c2a"))
		p.disc(-17,13,7,C.hex("#123b92"),0.35)
		p.ellipse(0,20,10,5,C.hex("#99efaa"))
		p.ring(22,20,10,3,C.hex("#ffe166"))
		p.arc(15,-18,12,5,0.3,4.8,C.hex("#3caaff"))
		p.beam(-5,-20,0,-5,4,C.hex("#aaffcc"))
		p.poly([[-38,30],[-30,39],[-42,40]],C.hex("#aaeeff"))
		p.glow(-15,15,15,C.hex("#ffaa33"),0.43)
		p.glow_line(-20,0,20,5,5,C.hex("#66bbff"),0.61)
		p.glow_ring(22,20,10,4,C.hex("#ffbb33"),0.35)
		compare(row.name,frame)
	var report := {"cases":results,"failures":failures,"draw_ms_min":render_ms.min(),"draw_ms_max":render_ms.max(),"godot":Engine.get_version_info().string}
	FileAccess.open("res://builds/pixelfx/parity.json",FileAccess.WRITE).store_string(JSON.stringify(report,"  "))
	print("PIXELFX_PARITY cases=",results.size()," failures=",failures.size()," draw_ms=",render_ms.min(),"..",render_ms.max())
	quit(0 if failures.is_empty() else 1)
