@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/whip-crack.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.whip_crack","name":"Whip crack","desc":"A whip rolls out to the right as a loop running down its length, faster and faster, until the tip flips over and cracks: a white pop, a ring of air, sparks and a puff of smoke.","tags":["melee","whip","crack","lash","combat","directional","one-shot"],"size":[192,80],"origin":[30,68],"duration":0.85,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a1a10","#5c3a1e","#9c6a34","#d8a45a","#ffd890","#fff4d6","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"length":76,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/whip-crack.js"
