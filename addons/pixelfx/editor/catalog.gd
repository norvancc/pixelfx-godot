@tool
extends RefCounted
const Preset = preload("../resources/preset.gd")
const Effect = preload("../core/effect.gd")
## Discovery is editor-only. Exported games reference presets directly, never scan source files.
static func discover(roots: PackedStringArray) -> Array:
	var paths: Array[String] = []
	for root in roots: _walk(root, paths)
	paths.sort()
	var items: Array = []
	var seen := {}
	for path in paths:
		if seen.has(path): continue
		seen[path] = true
		if path.ends_with(".tres"):
			var resource = load(path)
			if resource is Preset and resource.validate().is_empty(): items.append(resource)
		elif path.ends_with(".gd"):
			var script = load(path)
			if not script is Script or script == Effect or not script.can_instantiate(): continue
			var base: Script = script.get_base_script()
			while base != null and base != Effect: base = base.get_base_script()
			if base == null: continue
			var preset := Preset.new(); preset.implementation = script
			if preset.validate().is_empty():
				preset.display_name = preset.new_module().metadata().name + " / 默认参数"
				items.append(preset)
	return items
static func _walk(root: String, paths: Array[String], depth: int = 0) -> void:
	if depth > 12 or not DirAccess.dir_exists_absolute(root): return
	for name in DirAccess.get_files_at(root):
		if name.ends_with(".gd") or name.ends_with(".tres"): paths.append(root.path_join(name))
	for name in DirAccess.get_directories_at(root):
		if not name.begins_with("."): _walk(root.path_join(name), paths, depth + 1)
