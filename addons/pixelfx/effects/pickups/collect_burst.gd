@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/collect-burst.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.collect_burst","name":"Collect burst","desc":"The moment of pickup: a white flash and a cross of light, a thin ring snapping out ahead of a softer one, twinkles thrown wide on curving paths that brake, hang and wink out.","tags":["pickup","collect","burst","sparkle","reward","one-shot"],"size":[112,108],"origin":[56,94],"duration":1.35,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#1a0516","#3d0a33","#701560","#b0228f","#f53cd1","#ff86e6","#ffd2f6","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/collect-burst.js"
