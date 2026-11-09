@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/blink-in.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.blink_in","name":"Blink in","desc":"Glittering bits spiral in to a point of light that opens into a line, then into a white silhouette that cools into the caster.","tags":["arcane","blink","teleport","appear","movement","magic","one-shot"],"size":[136,96],"origin":[68,80],"duration":1.4,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/blink-in.js"
