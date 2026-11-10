@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/god-rays.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.god_rays","name":"God rays","desc":"Shafts of light slant down from high on the left, breathing and swaying, pooling on the floor, as drifting dust motes light up whenever they cross a beam.","tags":["weather","god rays","light","sunbeam","dust","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":10,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#1a1208","#3a2810","#7a5a24","#c89a44","#f2d27a","#fff2c4","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/god-rays.js"
