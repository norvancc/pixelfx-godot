@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/ground-pound.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.ground_pound","name":"Ground pound","desc":"He coils, leaps out of frame height, hangs, and comes down like a rock: the floor cracks, shock waves race out and throw the target about as they pass.","tags":["move","impact","jump","landing","shockwave","one-shot"],"size":[304,204],"origin":[152,168],"duration":3.8200000000000003,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/ground-pound.js"
