@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/dash-strike.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.dash_strike","name":"Dash strike","desc":"A crouch, then he's across the floor in a blur of after-images and already cutting: a critical hit, a beat, and he hops back to where he started.","tags":["move","melee","sword","dash","crit","one-shot"],"size":[372,156],"origin":[66,136],"duration":2.3,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/dash-strike.js"
