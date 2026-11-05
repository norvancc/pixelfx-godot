@tool
extends EditorPlugin
const Dock = preload("preview_dock.gd")
const Preset = preload("../resources/preset.gd")
const Cache = preload("../runtime/frame_cache.gd")
const Player = preload("../pixel_fx_player_2d.gd")
var _dock
var _panel_button: Button
func _enter_tree() -> void:
	_dock = Dock.new()
	_panel_button = add_control_to_bottom_panel(_dock, "PixelFX")
	EditorInterface.get_resource_filesystem().filesystem_changed.connect(_dock.request_refresh)
func _exit_tree() -> void:
	var filesystem := EditorInterface.get_resource_filesystem()
	if is_instance_valid(_dock):
		if filesystem.filesystem_changed.is_connected(_dock.request_refresh): filesystem.filesystem_changed.disconnect(_dock.request_refresh)
		remove_control_from_bottom_panel(_dock); _dock.queue_free()
	_dock = null
	Cache.clear()
func _handles(object: Object) -> bool: return object is Preset or object is Player
func _edit(object: Object) -> void:
	if not is_instance_valid(_dock) or object == null: return
	if object is Preset: _dock.edit_preset(object)
	elif object is Player and object.effect: _dock.edit_preset(object.effect)
func _make_visible(visible: bool) -> void:
	if visible and is_instance_valid(_dock): make_bottom_panel_item_visible(_dock)
