extends Node2D
## A consumer integration example: gameplay owns movement/impact, PixelFX owns appearance.
signal impacted(at: Vector2)
@export var projectile_speed := 260.0
var target := Vector2.ZERO
var flying := false
@onready var visual: PixelFXPlayer2D = $Visual

func launch(from: Vector2, to: Vector2, parameters: Dictionary = {}) -> void:
	global_position = from; target = to; flying = true
	visual.aim_at(target)
	if not visual.finished.is_connected(queue_free): visual.finished.connect(queue_free, CONNECT_ONE_SHOT)
	if not visual.play(parameters): queue_free()
func _process(delta: float) -> void:
	if not flying: return
	global_position = global_position.move_toward(target, projectile_speed * delta)
	if global_position.is_equal_approx(target):
		flying = false; impacted.emit(global_position); visual.stop()
