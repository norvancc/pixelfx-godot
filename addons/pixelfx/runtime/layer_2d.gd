@tool
class_name PixelFXLayer2D
extends Node2D
## Optional view for scene-specific front/back sorting. Shares source clock and texture.
## Assign source_path and layer, enable external_layers on the player, place this view in the desired canvas layer.
@export_node_path("PixelFXPlayer2D") var source_path: NodePath
@export_enum("front", "back") var layer := "front"
@export var follow_source := true
var _source: Node

func _ready() -> void:
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
func _process(_delta: float) -> void:
	var next := get_node_or_null(source_path)
	if next != null and (not next is Node2D or not next.has_method("get_layer_texture") or not next.has_signal("frame_changed")): next = null
	if next != _source:
		if is_instance_valid(_source) and _source.frame_changed.is_connected(queue_redraw): _source.frame_changed.disconnect(queue_redraw)
		_source = next
		if _source and _source.has_signal("frame_changed"): _source.frame_changed.connect(queue_redraw)
		queue_redraw()
	if is_instance_valid(_source) and follow_source: global_transform = _source.global_transform
func _draw() -> void:
	if not is_instance_valid(_source) or not _source.has_method("get_layer_texture"): return
	var texture: Texture2D = _source.get_layer_texture(layer)
	if texture:
		draw_set_transform(Vector2.ZERO, 0, Vector2(-1 if _source.flip_h else 1, 1))
		draw_texture(texture, Vector2(_source.get_frame_bounds().position))
func _exit_tree() -> void:
	if is_instance_valid(_source) and _source.has_signal("frame_changed") and _source.frame_changed.is_connected(queue_redraw): _source.frame_changed.disconnect(queue_redraw)
