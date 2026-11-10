@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/fireball-throw.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.fireball_throw","name":"Fireball throw","desc":"He gathers fire in his hand, leans back and hurls it: the ball flies, the target takes it in a blast and comes out charred.","tags":["move","fire","spell","projectile","explosion","one-shot"],"size":[356,244],"origin":[64,198],"duration":6.8100000000000005,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/fireball-throw.js"
