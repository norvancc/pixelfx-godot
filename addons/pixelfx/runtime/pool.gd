class_name PixelFXPool
extends Node2D
## Optional bounded player pool. Connect per-shot callbacks with CONNECT_ONE_SHOT.
signal capacity_reached
const Player = preload("../pixel_fx_player_2d.gd")
@export_range(1, 256, 1) var capacity := 32
var _idle: Array = []
var _active: Dictionary = {}
var _all: Array = []

func spawn(preset, world_position: Vector2, overrides: Dictionary = {}):
	var player
	while not _idle.is_empty() and player == null:
		var candidate = _idle.pop_back()
		if is_instance_valid(candidate): player = candidate
	_all = _all.filter(func(p): return is_instance_valid(p))
	if player == null:
		if _all.size() >= capacity: capacity_reached.emit(); return null
		player = Player.new(); player.autoplay = false; add_child(player); _all.append(player)
		player.finished.connect(_release.bind(player))
		player.cancelled.connect(_release.bind(player))
		player.tree_exiting.connect(func(): _active.erase(player.get_instance_id()); _idle.erase(player))
	player.effect = preset
	player.free_when_finished = false; player.paused = false; player.visible = true
	player.rotation = 0; player.scale = Vector2.ONE; player.modulate = Color.WHITE
	player.flip_h = false; player.external_layers = false; player.playback_speed = 1
	player.update_mode = Player.UpdateMode.IDLE; player.process_mode = Node.PROCESS_MODE_INHERIT
	player.render_fps = 0; player.cache_enabled = true; player.render_when_hidden = false
	player.global_position = world_position
	_active[player.get_instance_id()] = player
	if not player.play(overrides): _release(player); return null
	return player

func _release(player) -> void:
	if not is_instance_valid(player) or not _active.has(player.get_instance_id()): return
	_active.erase(player.get_instance_id())
	player.cancel(); player.visible = false
	if not _idle.has(player): _idle.append(player)

func stop_all(immediate: bool = false) -> void:
	for player in _active.values().duplicate():
		if immediate: player.cancel()
		else: player.stop()

func active_count() -> int: return _active.size()
