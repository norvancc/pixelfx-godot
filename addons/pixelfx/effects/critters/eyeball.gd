@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/eyeball.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.eyeball","name":"Eyeball","desc":"A bloodshot eyeball floats in its fleshy lids: its glowing iris snaps from one look to the next, it blinks, and its nerve sways behind it as it bobs.","tags":["critter","eyeball","eye","monster","spooky","float","loop"],"size":[96,108],"origin":[48,100],"duration":3.2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#2a1420","#6a3040","#b07078","#dcbcb4","#f4e9de","#ffffff"],"flesh":["#1e0c16","#4a1a2c","#7c2c40","#b04a58","#e07a80"],"iris":["#0c2a14","#1f6a2a","#3fae3a","#9be05a","#e8ffb0"],"hover":48,"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/eyeball.js"
