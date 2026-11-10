@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/snow.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.snow","name":"Snow","desc":"Snow at three depths in a gusty breeze: far specks, drifting flakes, big near crystals that spin and glow; they settle on a sparkling drift and melt away.","tags":["weather","snow","winter","cold","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":12,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0c1020","#161d36","#24304f","#3a4a72","#5f74a3","#93abd6","#cfe0fa","#ffffff"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/snow.js"
