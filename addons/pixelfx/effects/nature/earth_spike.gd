@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/earth-spike.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.earth_spike","name":"Earth spike","desc":"The floor cracks with light and heaves, a faceted stone spike rams up with two side shards in a burst of chips, grit and dust; rubble rains, then it splits and crumbles.","tags":["nature","earth","stone","spike","ground","attack","one-shot"],"size":[272,150],"origin":[136,132],"duration":3.4,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#120c0c","#251917","#3b2a24","#553d31","#715440","#8f6e52","#b8966e","#e6d0a8"],"glow":["#4a1a0c","#a8401a","#ff8a2a","#ffd27a","#fff4d0"],"height":62,"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/earth-spike.js"
