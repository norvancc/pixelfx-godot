@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/ricochet.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.ricochet","name":"Ricochet","desc":"A tracer streaks down onto the floor, glances off with a white-hot star and skips away at an angle, leaving a glowing skid while sparks skitter along the ground.","tags":["impact","ricochet","bullet","tracer","sparks","ground","directional","one-shot"],"size":[232,84],"origin":[64,60],"duration":1.1,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffe26b","#fff3a6","#ffffff"],"stone":"#5b5079","seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/ricochet.js"
