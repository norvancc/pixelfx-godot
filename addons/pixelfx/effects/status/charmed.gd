@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/charmed.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.charmed","name":"Charmed","desc":"Smitten: a big heart beats over the head, throwing a ring and a flush of light with every beat, little hearts float up, the eyes go pink and the cheeks blush.","tags":["status","charm","love","hearts","debuff","loop"],"size":[60,76],"origin":[30,68],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3a0a1e","#7a1238","#c4245a","#f04e86","#ff8ab0","#ffc8da","#ffffff"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/charmed.js"
