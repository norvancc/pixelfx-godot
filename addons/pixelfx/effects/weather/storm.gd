@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/storm.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.storm","name":"Storm","desc":"Driving rain at two depths under a churning cloud deck; a forked bolt strikes in a double flash that lights the sky and the rain, then sheet lightning glows in the clouds.","tags":["weather","storm","rain","lightning","thunder","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":10,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#09080f","#121120","#1b1a30","#262541","#363a5c","#4f5d8c","#7790c6","#c2d6ff"],"bolt":["#2a1a6e","#4835c2","#6a6cff","#78b8ff","#c6ebff","#ffffff"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/storm.js"
