@tool
class_name PixelFXPlayer2D
extends Node2D
## PixelFX public playback API v1. No autoload or editor plugin is required at runtime.
## Parameters belong to each instance; shared presets are never mutated by playback.
signal started
signal finished
signal cancelled
signal looped(count: int)
signal frame_changed
signal validation_failed(messages: PackedStringArray)

const Preset = preload("resources/preset.gd")
const Fx = preload("core/fx.gd")
const Renderer = preload("runtime/renderer.gd")
enum UpdateMode { IDLE, PHYSICS, MANUAL }
enum State { STOPPED, PLAYING, FADING, FINISHED }

@export var effect: Preset:
	set(value):
		if effect == value: return
		if effect and effect.changed.is_connected(_on_preset_changed): effect.changed.disconnect(_on_preset_changed)
		effect = value
		if effect: effect.changed.connect(_on_preset_changed)
		if is_inside_tree():
			cancel(); update_configuration_warnings()
			if Engine.is_editor_hint() and preview_in_editor and autoplay and effect: play.call_deferred()
@export var autoplay := true
@export_enum("Idle", "Physics", "Manual") var update_mode: int = UpdateMode.IDLE
@export_range(0, 8, 0.05) var playback_speed := 1.0
@export_range(0, 120, 1) var render_fps := 0 ## 0 uses effect metadata.
@export var cache_enabled := true
@export var render_when_hidden := false
@export var free_when_finished := false
@export var preview_in_editor := false:
	set(value):
		preview_in_editor = value
		if Engine.is_editor_hint() and is_node_ready():
			if value and effect: play()
			else: cancel()
@export var flip_h := false:
	set(value):
		flip_h = value; queue_redraw(); frame_changed.emit()
@export var external_layers := false ## Hide local drawing; PixelFXLayer2D views draw it instead.
@export var back_z_index := -1:
	set(value):
		back_z_index = value
		if is_instance_valid(_back): _back.z_index = value
@export var front_z_index := 1:
	set(value):
		front_z_index = value
		if is_instance_valid(_front): _front.z_index = value

var paused := false
var state: State = State.STOPPED
var instance: Fx
var last_render_ms := 0.0
var last_error := PackedStringArray()
var _renderer = Renderer.new()
var _overrides: Dictionary = {}
var _packet: Dictionary = {}
var _bounds := Rect2i()
var _signature := ""
var _fps := 30
var _accumulator := 0.0
var _generation := 0
var _front: Sprite2D
var _back: Sprite2D

func _ready() -> void:
	texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	_create_views()
	if autoplay and (not Engine.is_editor_hint() or preview_in_editor): play()

func _create_views() -> void:
	if is_instance_valid(_front): return
	_back = Sprite2D.new(); _back.name = "_PixelFXBack"; _back.centered = false; _back.z_index = back_z_index; add_child(_back)
	_front = Sprite2D.new(); _front.name = "_PixelFXFront"; _front.centered = false; _front.z_index = front_z_index; add_child(_front)
	# No owner: these runtime views are never serialized into a scene.

func play(overrides: Dictionary = {}) -> bool:
	var resolved := _resolve(overrides)
	if not resolved.get("ok", false): return _reject(resolved.errors)
	_generation += 1
	_overrides = overrides.duplicate(true)
	instance = Fx.new(effect.new_module(), resolved.options)
	_bounds = resolved.bounds
	_signature = effect.signature(resolved.options, _bounds)
	_fps = render_fps if render_fps > 0 else int(resolved.meta.get("fps", 30))
	_fps = clampi(_fps, 1, 120)
	_accumulator = 0; paused = false; state = State.PLAYING; last_error.clear()
	render_frame()
	started.emit()
	return true

func restart() -> bool:
	return play(_overrides)

func set_parameters(values: Dictionary) -> bool:
	var next := _overrides.duplicate(true); next.merge(values, true)
	var resolved := _resolve(next)
	if not resolved.get("ok", false): return _reject(resolved.errors)
	if instance and not instance.meta.get("cacheable", false):
		var was_paused := paused
		var success := play(next)
		paused = was_paused
		return success
	_overrides = next
	if instance:
		var old_time := instance.t; var old_stop := instance.stop_at
		instance = Fx.new(effect.new_module(), resolved.options)
		instance.t = old_time; instance.stop_at = old_stop
		_bounds = resolved.bounds; _signature = effect.signature(resolved.options, _bounds)
		if is_playing(): render_frame()
	return true

func get_parameters() -> Dictionary:
	return instance.options.duplicate(true) if instance else _resolve(_overrides).get("options", {})

func stop() -> void:
	if not is_playing(): return
	instance.stop(); state = State.FADING

func cancel() -> void:
	var was_playing := is_playing()
	_generation += 1; state = State.STOPPED; paused = false; instance = null
	_clear_visuals()
	if was_playing: cancelled.emit()

func seek(seconds: float) -> bool:
	if not instance or not instance.meta.get("cacheable", false): return _reject(PackedStringArray(["seek requires a cacheable (time-addressable) effect."]))
	if not is_finite(seconds) or seconds < 0: return _reject(PackedStringArray(["seek time must be finite and nonnegative."]))
	instance.t = seconds; instance.stop_at = INF
	state = State.PLAYING
	if instance.done(): _finish()
	else: render_frame()
	return true

func is_playing() -> bool:
	return state in [State.PLAYING, State.FADING] and instance != null

func face_target(world_position: Vector2) -> void:
	flip_h = to_local(world_position).x < 0

func aim_at(world_position: Vector2) -> void:
	flip_h = false
	global_rotation = (world_position - global_position).angle()

func _process(delta: float) -> void:
	_update_views()
	if Engine.is_editor_hint() and not preview_in_editor: return
	if update_mode == UpdateMode.IDLE: advance(delta)

func _physics_process(delta: float) -> void:
	if Engine.is_editor_hint() and not preview_in_editor: return
	if update_mode == UpdateMode.PHYSICS: advance(delta)

func advance(delta: float) -> void:
	if not is_playing() or paused or playback_speed == 0: return
	if not is_finite(delta) or delta < 0 or not is_finite(playback_speed) or playback_speed < 0 or delta * playback_speed > 10:
		_reject(PackedStringArray(["advance requires a finite step in 0..10 effect seconds."])); return
	var generation := _generation
	var previous := instance.t
	instance.update(delta * playback_speed)
	if instance.meta.get("loop", false):
		var count := floori(instance.t / instance.meta.duration) - floori(previous / instance.meta.duration)
		if count > 0: looped.emit(count)
	if generation != _generation or not is_playing(): return
	if instance.done(): _finish(); return
	_accumulator += delta * playback_speed
	if _accumulator >= 1.0 / _fps:
		_accumulator = fmod(_accumulator, 1.0 / _fps)
		if render_when_hidden or is_visible_in_tree(): render_frame()

func render_frame() -> void:
	if not instance or not is_playing(): return
	_packet = _renderer.render(instance, _bounds, _fps, _signature, cache_enabled)
	last_render_ms = _renderer.last_render_ms
	_update_views(); frame_changed.emit()

func get_layer_texture(layer: String = "front") -> Texture2D:
	return _packet.get(layer)

func get_render_fps() -> int: return _fps

func get_frame_bounds() -> Rect2i:
	return _bounds

func _update_views() -> void:
	if not is_instance_valid(_front): return
	for pair in [[_front, "front"], [_back, "back"]]:
		var view: Sprite2D = pair[0]
		view.texture = get_layer_texture(pair[1])
		view.position = Vector2(_bounds.position)
		view.scale = Vector2.ONE
		if flip_h:
			view.scale.x = -1; view.position.x = -_bounds.position.x
		view.visible = not external_layers

func _finish() -> void:
	if not is_playing(): return
	var generation := _generation
	state = State.FINISHED; _clear_visuals(); finished.emit()
	# A callback may restart or return this node to a pool.
	if free_when_finished and generation == _generation and state == State.FINISHED and not Engine.is_editor_hint(): queue_free()

func _clear_visuals() -> void:
	_renderer = Renderer.new()
	_packet = {}; _update_views(); frame_changed.emit()

func _resolve(overrides: Dictionary) -> Dictionary:
	if effect == null: return {"ok": false, "errors": PackedStringArray(["Assign a PixelFXPreset resource."])}
	return effect.resolve(overrides)

func _reject(messages: PackedStringArray) -> bool:
	last_error = messages; validation_failed.emit(messages)
	return false

func _on_preset_changed() -> void:
	update_configuration_warnings()
	if is_playing():
		var was_paused := paused
		if restart(): paused = was_paused
		else: cancel()

func _get_configuration_warnings() -> PackedStringArray:
	if effect == null: return PackedStringArray(["Assign a PixelFXPreset to Effect."])
	return effect.validate()
