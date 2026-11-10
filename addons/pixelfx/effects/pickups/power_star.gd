@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/power-star.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.power_star","name":"Power star","desc":"A fat bevelled star rocks side to side and swells on each beat, rays of light turning slowly behind it, sparks spinning off its points.","tags":["pickup","star","power-up","invincible","bonus","loop"],"size":[88,84],"origin":[44,76],"duration":1.6,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#2a1604","#5e3208","#a05c0c","#e09414","#ffc626","#ffe866","#fff8c4","#ffffff"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/power-star.js"
