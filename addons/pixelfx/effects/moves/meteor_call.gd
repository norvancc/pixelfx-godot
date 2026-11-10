@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/meteor-call.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.meteor_call","name":"Meteor call","desc":"A long chant: a circle draws itself round him, it flares, he points, and a burning rock comes down on the target and flattens the scene.","tags":["move","fire","spell","meteor","ultimate","one-shot"],"size":[380,240],"origin":[92,212],"duration":6.43,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/meteor-call.js"
