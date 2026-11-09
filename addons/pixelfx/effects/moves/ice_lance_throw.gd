@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/ice-lance-throw.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.ice_lance_throw","name":"Ice lance throw","desc":"Frost gathers into a spear in his hand, he throws it like a javelin, and the target ices over in a burst of snowflakes and shivers.","tags":["move","ice","spell","projectile","one-shot"],"size":[310,136],"origin":[86,134],"duration":4.34,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/ice-lance-throw.js"
