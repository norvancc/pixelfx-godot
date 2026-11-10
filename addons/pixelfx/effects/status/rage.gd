@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/rage.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.rage","name":"Rage","desc":"Seething: the body judders on every heartbeat, an anger mark throbs at the temple, eyes burn, steam jets off the head, stress lines flash out and the floor cracks hot underfoot.","tags":["status","rage","berserk","anger","buff","loop"],"size":[80,80],"origin":[40,70],"duration":1.2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#1a0208","#4a0612","#8a0c1c","#c81828","#ff3040","#ff7a7a","#ffc8c8","#ffffff"],"heat":["#5a0a0a","#c8281a","#ff7a2a","#ffd27a"],"steam":"#f2e8ee","seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/rage.js"
