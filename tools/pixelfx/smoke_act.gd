extends SceneTree
const Semantics=preload("res://addons/pixelfx/native/semantics.gd")
const Act=preload("res://addons/pixelfx/native/act.gd")
const Frame=preload("res://addons/pixelfx/core/frame.gd")
func _initialize():call_deferred("run")
func run():
	var selected=OS.get_environment("PIXELFX_EFFECT")
	if selected.is_empty():selected="moves/fireball-throw"
	var act=Act.new(selected)
	var frame=Frame.new(480,280,-160,-180)
	act.draw(frame);act.update(1.0/30);frame.clear();act.draw(frame)
	print("ACT_SMOKE ",selected," errors=",Semantics.errors)
	var passed=Semantics.errors.is_empty();Semantics.shutdown();quit(0 if passed else 1)
