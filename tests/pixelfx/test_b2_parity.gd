extends SceneTree
const Fx=preload("res://addons/pixelfx/core/fx.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
var failures: Array=[]
var results: Array=[]
var tolerances: Dictionary=JSON.parse_string(FileAccess.get_file_as_string("res://tests/pixelfx/b2_tolerances.json"))
func _initialize() -> void:
	var data = JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/reference-b2/cases.json"))
	for row in data.cases:
		if OS.get_environment("B2_EFFECT") != "" and row.id != OS.get_environment("B2_EFFECT"): continue
		var preset = load("res://addons/pixelfx/presets/"+row.id+".tres")
		var module = preset.new_module()
		var fx = Fx.new(module,row.options); var frame=Frame.new(512,384,-256,-288)
		for bytes in row.updates64: fx.update(PackedByteArray(bytes).decode_double(0))
		if row.has("stopAge"): fx.stop(); fx.update(row.stopAge)
		fx.draw(frame,row.get("layer",""))
		var bg = int(row.bg) if row.get("bg") != null else null
		var actual: PackedByteArray=frame.composite(bg)
		var expected = FileAccess.get_file_as_bytes("res://builds/pixelfx/reference-b2/"+row.name+".rgba")
		var changed=0; var max_error=0; var sum_error=0
		for i in range(0 if actual == expected else actual.size()):
			var error=absi(int(actual[i])-int(expected[i]))
			if error: changed+=1; max_error=maxi(error,max_error); sum_error+=error
		results.append({"name":row.name,"effect":row.id,"changed_bytes":changed,"max_channel_error":max_error,"sum_error":sum_error})
		var limit: Dictionary = tolerances.get(row.name,{"max_channel_error":1,"changed_bytes":20})
		var outside = false
		if limit.has("pixel_rect"):
			var bounds = Rect2i(limit.pixel_rect[0],limit.pixel_rect[1],limit.pixel_rect[2],limit.pixel_rect[3])
			for i in range(actual.size()):
				if actual[i] != expected[i] and not bounds.has_point(Vector2i((i/4)%512-256,(i/4)/512-288)): outside = true; break
		if max_error > limit.max_channel_error or changed > limit.changed_bytes or outside:
			failures.append(row.name)
			print("B2_DIFF ",row.name," changed=",changed," max=",max_error)
			FileAccess.open("res://builds/pixelfx/b2-"+row.name+"-actual.rgba",FileAccess.WRITE).store_buffer(actual)
			frame.image(bg).save_png("res://builds/pixelfx/b2-"+row.name+"-actual.png")
	FileAccess.open("res://builds/pixelfx/parity-b2"+OS.get_environment("B2_EFFECT")+".json",FileAccess.WRITE).store_string(JSON.stringify({"cases":results,"failures":failures},"  "))
	print("PIXELFX_B2_PARITY cases=",results.size()," failures=",failures.size())
	quit(0 if failures.is_empty() else 1)
