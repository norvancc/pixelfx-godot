@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/earth-stomp.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.earth_stomp","name":"Earth stomp","desc":"A knee comes up, the boot slams down, the floor heaves under the target and a stone spike rams up through it.","tags":["move","earth","spell","stomp","one-shot"],"size":[290,142],"origin":[50,128],"duration":3.46,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/earth-stomp.js"
