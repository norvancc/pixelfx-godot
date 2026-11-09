@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/fog.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.fog","name":"Fog","desc":"Slow banks of moonlit fog at three depths drift past each other, crests catching the light, while thin streaks of mist slide by in front.","tags":["weather","fog","mist","haze","night","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":12,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#14121e","#24213a","#363250","#4f4a6c","#6d688b","#918cab","#bdb8d4","#ece8f6"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/fog.js"
