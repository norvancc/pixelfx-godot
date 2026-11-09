@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/blink-out.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.blink_out","name":"Blink out","desc":"The caster crackles with gathering light, flashes white, squeezes into a line of light that collapses and pops away in sparks.","tags":["arcane","blink","teleport","vanish","movement","magic","one-shot"],"size":[136,96],"origin":[68,80],"duration":1.6,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/blink-out.js"
