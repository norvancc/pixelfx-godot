@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/confetti.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.confetti","name":"Confetti","desc":"Two party poppers bang one after the other: paper bits and curly streamers burst out, stall, then tumble and flutter down, flipping, and settle on the floor.","tags":["ui","celebration","confetti","party","reward","one-shot"],"size":[200,140],"origin":[100,126],"duration":3.4,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#ff4a5a","#ff9a2a","#ffe03c","#5ad84a","#3cc8ff","#7a6cff","#f53cd1"],"seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/confetti.js"
