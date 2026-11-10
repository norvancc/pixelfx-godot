@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/slime.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.slime","name":"Slime","desc":"A glossy slime hops in place: it squashes to wind up, stretches into the jump, rounds out in the air, splats down flinging droplets that creep back, then wobbles and blinks.","tags":["critter","slime","monster","hop","goo","loop"],"size":[112,88],"origin":[56,72],"duration":1.8,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#061412","#0b2f2b","#12594a","#1f8f4f","#47c752","#a6f06a","#f0ffd2"],"hop":24,"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/slime.js"
