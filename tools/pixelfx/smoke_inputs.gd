extends SceneTree
const Inputs=preload("res://addons/pixelfx/native/inputs.gd")
const Semantics=preload("res://addons/pixelfx/native/semantics.gd")
const Act=preload("res://addons/pixelfx/native/act.gd")
func _initialize():call_deferred("run")
func run():
	var image=Image.create(12,18,false,Image.FORMAT_RGBA8);image.fill(Color.TRANSPARENT)
	for y in range(1,17):
		for x in range(2,10):image.set_pixel(x,y,Color("f4bd88"))
	var actor=Inputs.actor_from_image(image,Vector2i(-6,-18))
	var module=load("res://addons/pixelfx/effects/holy/halo.gd").new();module.create({"palette":module.metadata().options.palette,"seed":5,"actor":actor})
	var scene=Inputs.scene_from_image(image);module.draw(Semantics.Painter.new(scene),0.4,{})
	var posed=Act.posed_actor({"crouch":2,"fx":-4,"fy":-24})
	if posed==null or actor.mask.w!=12 or scene.w!=12 or not Semantics.errors.is_empty():push_error("Native input check failed");Semantics.shutdown();quit(1);return
	print("PIXELFX_NATIVE_INPUTS_PASSED");Semantics.shutdown();quit(0)
