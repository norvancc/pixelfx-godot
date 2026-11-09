@tool
extends EditorPlugin
const Preset=preload("res://addons/pixelfx/resources/preset.gd")
const Cache=preload("res://addons/pixelfx/runtime/frame_cache.gd")
var failures: Array=[]
var checks := 0
func _enter_tree() -> void: call_deferred("run")
func check(ok: bool,message: String) -> void:
	checks+=1
	if not ok: failures.append(message); push_error(message)
func dock_node():
	for node in EditorInterface.get_base_control().find_children("*","VBoxContainer",true,false):
		if node.get_script() and node.get_script().resource_path.ends_with("/editor/preview_dock.gd"): return node
	return null
func run() -> void:
	var dock
	for i in range(120):
		await get_tree().process_frame
		dock=dock_node()
		if dock and dock.player and dock.player.instance: break
	check(dock!=null,"editor plugin creates preview dock")
	if dock:
		var preset=load("res://addons/pixelfx/presets/fireball.tres")
		dock.edit_preset(preset)
		check(dock.player.is_playing(),"editor playback uses runtime player")
		check(dock.inspector.get_edited_object()==dock.edited,"Inspector bound to working preset")
		dock.edited.set_parameter("radius",7.0)
		for i in range(60): await get_tree().process_frame
		check(dock.player.get_parameters().radius==7.0,"schema edits update live preview")
		check(preset.get_parameter("radius")==5.0,"editor does not mutate original preset")
		var buttons=dock.find_children("*","Button",true,false)
		for button in buttons:
			if button.text=="暂停/继续": button.pressed.emit(); break
		check(dock.player.paused,"pause control wired")
		dock._time.value=0.5
		check(is_equal_approx(dock.player.instance.t,0.5),"editor timeline seeks")
		dock._save("res://builds/pixelfx/editor-saved.tres")
		var saved=load("res://builds/pixelfx/editor-saved.tres")
		check(saved is Preset and saved.get_parameter("radius")==7.0,"save produces reusable resource")
		for id in ["ice_lance","laser_bolt","sunburst","ripples"]:
			dock.edit_preset(load("res://addons/pixelfx/presets/"+id+".tres"))
			check(dock.player.is_playing() and dock.player.instance.meta.id=="pixelfx."+id,id+" editor preview")
			dock._time.value=.1
			dock._time.value=.2
			check(dock.player.paused and is_equal_approx(dock.player.instance.t,.2),id+" editor seek")
			dock._save("res://builds/pixelfx/editor-"+id+".tres")
			check(load("res://builds/pixelfx/editor-"+id+".tres").validate().is_empty(),id+" editor save")
		var additional_ids = []
		var provenance = JSON.parse_string(FileAccess.get_file_as_string("res://addons/pixelfx/provenance.json"))
		for source in provenance.effects:
			var id = str(source).get_file().replace("-","_")
			if id not in ["fireball","ice_lance","laser_bolt","sunburst","ripples"]: additional_ids.append(id)
		for id in additional_ids:
			dock.edit_preset(load("res://addons/pixelfx/presets/"+id+".tres"))
			check(dock.player.is_playing() and dock.player.instance.meta.id=="pixelfx."+id,id+" editor preview")
			var analytic: bool=dock.player.instance.meta.cacheable
			check(dock._time.editable==analytic,id+" editor enables timeline only for analytic effects")
			dock.edited.set_parameter("seed",-923); dock._replay()
			check(dock.player.get_parameters().seed==-923,id+" editor parameter replay")
			dock._save("res://builds/pixelfx/editor-"+id+".tres")
			check(load("res://builds/pixelfx/editor-"+id+".tres").validate().is_empty(),id+" editor save/readback")
		make_bottom_panel_item_visible(dock)
		for i in range(4): await get_tree().process_frame
		if DisplayServer.get_name()!="headless":
			await RenderingServer.frame_post_draw
			EditorInterface.get_base_control().get_viewport().get_texture().get_image().save_png("res://builds/pixelfx/editor-preview.png")
		dock.request_refresh() # Deliberately queue a refresh before disabling the plugin.
		EditorInterface.set_plugin_enabled("pixelfx",false)
		for i in range(4): await get_tree().process_frame
		check(dock_node()==null,"disabling plugin removes UI")
		check(Cache.statistics().entries==0,"disabling plugin releases cache")
		EditorInterface.set_plugin_enabled("pixelfx",true)
		for i in range(8): await get_tree().process_frame
		check(dock_node()!=null,"re-enabling plugin recreates UI")
	FileAccess.open("res://builds/pixelfx/editor-v010.json",FileAccess.WRITE).store_string(JSON.stringify({"checks":checks,"failures":failures},"  "))
	print("PIXELFX_EDITOR_QA checks=",checks," failures=",failures.size())
	get_tree().quit(0 if failures.is_empty() else 1)
