@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/pistol-shots.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.pistol_shots","name":"Pistol shots","desc":"Three aimed shots: the gun kicks up each time and settles, tracers cross the floor, and the target staggers under each hit.","tags":["move","gun","pistol","projectile","ranged","one-shot"],"size":[378,76],"origin":[111,72],"duration":2.6,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/pistol-shots.js"
