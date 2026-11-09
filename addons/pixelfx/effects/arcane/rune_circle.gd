@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/rune-circle.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.rune_circle","name":"Rune circle","desc":"A rune circle turns on the floor in perspective: a carousel of runes lit by chasing light, a turning square, ticks, motes rising off it.","tags":["arcane","rune","circle","magic","aura","ground","loop"],"size":[136,100],"origin":[68,80],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/rune-circle.js"
