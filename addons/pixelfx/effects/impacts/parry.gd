@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/parry.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.parry","name":"Parry","desc":"Two blades clash: their edges flash in an X, a white four-point star rings out, a ring breaks into arcs and a fan of gold sparks sprays up and rains down.","tags":["impact","parry","block","clash","sword","metal","sparks","one-shot"],"size":[200,112],"origin":[100,96],"duration":1,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#2a1a08","#6a4410","#b07a1a","#e8b030","#ffe066","#fff6c4","#ffffff"],"height":30,"seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/parry.js"
