extends SceneTree
## Independent upstream RGBA comparisons for declarative migration batches.
const Fx = preload("res://addons/pixelfx/core/fx.gd")
const Frame = preload("res://addons/pixelfx/core/frame.gd")
var failures: Array = []
var results: Array = []

func _initialize() -> void:
	var batch = OS.get_environment("PIXELFX_BATCH")
	if batch.is_empty():
		push_error("PIXELFX_BATCH is required")
		quit(1)
		return
	var config = JSON.parse_string(FileAccess.get_file_as_string("res://tests/pixelfx/batches/"+batch+".json"))
	var data = JSON.parse_string(FileAccess.get_file_as_string("res://builds/pixelfx/reference-"+batch+"/cases.json"))
	var viewport: Dictionary = config.get("frame", {"width":512,"height":384,"x":-256,"y":-288})
	for row in data.cases:
		if OS.get_environment("PIXELFX_EFFECT") != "" and row.id != OS.get_environment("PIXELFX_EFFECT"): continue
		var preset = load("res://addons/pixelfx/presets/"+row.id+".tres")
		var fx = Fx.new(preset.new_module(), row.options)
		var frame = Frame.new(int(viewport.width), int(viewport.height), int(viewport.x), int(viewport.y))
		for bytes in row.updates64: fx.update(PackedByteArray(bytes).decode_double(0))
		if row.has("stopAge"): fx.stop(); fx.update(row.stopAge)
		fx.draw(frame, row.get("layer", ""))
		var bg = int(row.bg) if row.get("bg") != null else null
		var actual: PackedByteArray = frame.composite(bg)
		var expected = FileAccess.get_file_as_bytes("res://builds/pixelfx/reference-"+batch+"/"+row.name+".rgba")
		if actual.size() != expected.size():
			failures.append(row.name+" buffer length mismatch")
			continue
		var changed = 0
		var max_error = 0
		var sum_error = 0
		var outside = false
		var first_pixel = Vector2i(2147483647,2147483647)
		var last_pixel = Vector2i(-2147483648,-2147483648)
		var differing_pixels: Array = []
		var limit: Dictionary = config.get("tolerances", {}).get(row.name, {"max_channel_error":1,"changed_bytes":20})
		var rectangle = limit.get("pixel_rect", [])
		for i in range(0 if actual == expected else actual.size()):
			var error = absi(int(actual[i])-int(expected[i]))
			if error:
				changed += 1
				max_error = maxi(error, max_error)
				sum_error += error
				var pixel = Vector2i((i/4)%int(viewport.width)+int(viewport.x),(i/4)/int(viewport.width)+int(viewport.y))
				first_pixel = first_pixel.min(pixel)
				last_pixel = last_pixel.max(pixel)
				if differing_pixels.size() < 2048: differing_pixels.append([i,int(expected[i]),int(actual[i])])
				if rectangle.size() == 4:
					var rect = Rect2i(int(rectangle[0]),int(rectangle[1]),int(rectangle[2]),int(rectangle[3]))
					if not rect.has_point(pixel): outside = true
		results.append({"name":row.name,"effect":row.id,"changed_bytes":changed,"max_channel_error":max_error,"sum_error":sum_error,"pixel_rect":[first_pixel.x,first_pixel.y,last_pixel.x-first_pixel.x+1,last_pixel.y-first_pixel.y+1] if changed else [],"differing_channels":differing_pixels if changed<=2048 else []})
		if max_error > limit.max_channel_error or changed > limit.changed_bytes or sum_error > limit.get("sum_error",2147483647) or outside:
			failures.append(row.name)
			print("PIXELFX_BATCH_DIFF ",row.name," changed=",changed," max=",max_error)
			FileAccess.open("res://builds/pixelfx/"+batch+"-"+row.name+"-actual.rgba",FileAccess.WRITE).store_buffer(actual)
			frame.image(bg).save_png("res://builds/pixelfx/"+batch+"-"+row.name+"-actual.png")
	var suffix = OS.get_environment("PIXELFX_EFFECT")
	FileAccess.open("res://builds/pixelfx/parity-"+batch+suffix+".json",FileAccess.WRITE).store_string(JSON.stringify({"cases":results,"failures":failures},"  "))
	print("PIXELFX_BATCH_PARITY batch=",batch," cases=",results.size()," failures=",failures.size())
	quit(0 if failures.is_empty() and not results.is_empty() else 1)
