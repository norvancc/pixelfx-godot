@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/ghost.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.ghost","name":"Ghost","desc":"A sheet ghost bobs over the floor: its scalloped hem ripples and trails its drift, little arms flutter, it glances about and blinks, motes trickle off its hem.","tags":["critter","ghost","spirit","undead","spooky","float","loop"],"size":[96,100],"origin":[48,90],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#10142a","#232c52","#3e4f86","#6b84bb","#a3b8e2","#d8e4ff","#ffffff"],"hover":14,"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/ghost.js"
