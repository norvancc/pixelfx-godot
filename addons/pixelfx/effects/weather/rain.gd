@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/rain.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.rain","name":"Rain","desc":"Slanted rain at four depths: far drops fade into the dark, near ones glint and splash, drops ring the puddles and a low mist drifts over the wet floor.","tags":["weather","rain","storm","water","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":8,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0e1322","#1a2440","#283a5e","#3a5482","#5674a8","#84a6d6","#c0dcf8","#f2f8ff"],"density":1,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/rain.js"
