@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/blizzard.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.blizzard","name":"Blizzard","desc":"Snow driven almost flat by a gale: streaks at three depths race past, gusts throw translucent sheets of snow across the sky and spindrift streams off the drifts.","tags":["weather","blizzard","snow","wind","storm","winter","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":8,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0d111f","#182035","#27324d","#3e4d6e","#64779c","#9cb0d0","#d8e4f6","#ffffff"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/blizzard.js"
