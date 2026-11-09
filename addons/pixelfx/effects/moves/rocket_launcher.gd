@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/rocket-launcher.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.rocket_launcher","name":"Rocket launcher","desc":"He drops to one knee, shoulders the tube and fires: the kick shoves him back along the floor, the rocket crawls out on its jet and the target goes up.","tags":["move","gun","rocket","projectile","explosion","one-shot"],"size":[480,244],"origin":[178,198],"duration":6.5600000000000005,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/rocket-launcher.js"
