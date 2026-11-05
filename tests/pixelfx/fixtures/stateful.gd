@tool
extends "res://addons/pixelfx/core/effect.gd"
var steps := 0
var x := 0.0
func metadata() -> Dictionary:
	return {"id":"test.stateful","name":"Stateful probe","duration":0.25,"loop":false,"fps":30,"cacheable":false,"layers":["front","back"],"options":{}}
func parameter_schema() -> Array[Dictionary]:
	return [{"name":"speed","type":TYPE_FLOAT,"default":12.0,"min":0.0,"max":100.0}]
func bounds(_o: Dictionary) -> Rect2i: return Rect2i(-8,-8,32,16)
func update(dt: float,o: Dictionary) -> void: steps+=1; x+=o.speed*dt
func draw(p,_t: float,_o: Dictionary) -> void: p.rect(x,0,3,3,0xff0000ff)
func draw_back(p,_t: float,_o: Dictionary) -> void: p.rect(x,0,3,3,0xff00ff00)
