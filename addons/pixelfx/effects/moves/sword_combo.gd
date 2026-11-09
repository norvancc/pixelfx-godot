@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/sword-combo.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.sword_combo","name":"Sword combo","desc":"Three strokes walking forward: a slash, a crossing double cut, and a two-handed cleave into the floor that throws the target about.","tags":["move","melee","sword","combo","one-shot"],"size":[264,150],"origin":[72,130],"duration":2.975,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/sword-combo.js"
