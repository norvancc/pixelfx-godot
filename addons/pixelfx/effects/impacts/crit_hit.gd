@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/crit-hit.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.crit_hit","name":"Critical hit","desc":"A critical hit: a jagged starburst slams in white and overshoots, a ring breaks into flying arcs, sparks streak off, shards tumble to the floor under a big flare.","tags":["impact","hit","crit","critical","combat","directional","one-shot"],"size":[216,136],"origin":[84,106],"duration":0.9,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#2a0510","#5c0a1c","#a3142a","#e0302c","#ff7a2a","#ffc23d","#fff09a","#ffffff"],"height":26,"aim":0.12,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/crit-hit.js"
