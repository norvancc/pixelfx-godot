extends SceneTree
const Catalog=preload("res://addons/pixelfx/editor/catalog.gd")
func _initialize():call_deferred("run")
func run():
	var entries=Catalog.discover(PackedStringArray(["res://addons/pixelfx/presets"]))
	var ids: Dictionary={};var errors: Array=[]
	for preset in entries:
		var result=preset.resolve()
		if not result.ok:errors.append(result.errors)
		else:ids[result.meta.id]=true
	print("PIXELFX_INSTALL_LOAD presets=",entries.size()," algorithms=",ids.size()," errors=",errors)
	quit(0 if entries.size()==245 and ids.size()==244 and errors.is_empty() else 1)
