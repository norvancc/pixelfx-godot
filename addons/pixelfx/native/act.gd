@tool
extends RefCounted
## Optional native actor choreography. Visual simulation and game damage remain separate.
const Semantics=preload("semantics.gd")
var instance
var module_id: String
func _init(source: String,options: Dictionary={}):
	module_id="fx/"+source+".js" if not source.begins_with("fx/") else source
	instance=Semantics.call_value(Semantics.module("core/act.js").createAct,[Semantics.module(module_id),options])
	Semantics.register_owner(self,"instance")
func update(dt: float) -> void:Semantics.invoke(instance,"update",[dt])
func draw(frame,body=true,target=true) -> void:
	Semantics.invoke(instance,"draw",[frame,{"body":body,"target":target}]);Semantics.collect_after_draw()
func stop() -> void:Semantics.invoke(instance,"stop",[])
func done() -> bool:return Semantics.truth(Semantics.invoke(instance,"done",[]))
func current_time() -> float:return Semantics.number(Semantics.prop(instance,"t"))
func current_pose():return Semantics.prop(instance,"pose")
func shake():return Semantics.prop(instance,"shake")
func timings():return Semantics.call_value(Semantics.module("core/act.js").actTiming,[Semantics.module(module_id)])
static func stock_actor(scale_value=2):return Semantics.call_value(Semantics.module("core/actor.js").stockActor,[scale_value])
static func posed_actor(pose: Dictionary,options: Dictionary={}):return Semantics.call_value(Semantics.module("core/rig.js").posed,[pose,options])
