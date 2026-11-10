@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/thrust.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.thrust","name":"Thrust","desc":"A piercing stab: a bundle of streaks shoots out from the hand to a point, a long four-point star flares at the tip with a pierce ring, sparks and speed lines.","tags":["melee","thrust","stab","spear","rapier","pierce","combat","directional","one-shot"],"size":[196,76],"origin":[34,62],"duration":0.75,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a1608","#6b3c10","#b8701a","#f0b42e","#ffe27a","#fff6cf","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"reach":66,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/thrust.js"
