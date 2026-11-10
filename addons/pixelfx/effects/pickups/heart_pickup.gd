@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/heart-pickup.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.heart_pickup","name":"Heart pickup","desc":"A plump glossy heart hovering over its shadow beats lub-dub: a big squash and stretch, a smaller echo, light and a thin ring pulsing out, tiny hearts drifting off.","tags":["pickup","heart","health","life","loop"],"size":[56,60],"origin":[28,52],"duration":1.2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1a0408","#4a0a14","#8a1222","#d02436","#ff4a56","#ff8a8e","#ffd0cc","#ffffff"],"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/heart-pickup.js"
