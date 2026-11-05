@tool
class_name PixelFXEffect
extends RefCounted
## Extension contract v1. One algorithm instance per player; never store playback state in a Resource.
## cacheable=true promises draw() is a pure function of time/options (including seed).
## Stateful effects use cacheable=false and update(dt, options); both layers share that simulation.

func metadata() -> Dictionary:
	return {"id": "custom.effect", "name": "Custom effect", "duration": 1.0,
		"loop": false, "fps": 30, "cacheable": false, "layers": ["front"], "options": {}}

func parameter_schema() -> Array[Dictionary]:
	return []

func bounds(_options: Dictionary) -> Rect2i:
	return Rect2i(-64, -64, 128, 128)

func draw(_painter, _time: float, _options: Dictionary) -> void:
	pass

func draw_back(_painter, _time: float, _options: Dictionary) -> void:
	pass
