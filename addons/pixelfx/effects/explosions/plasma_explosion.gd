@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/plasma-explosion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.plasma_explosion","name":"Plasma explosion","desc":"A blue-violet energy blast with no smoke: a white flash, a ball of plasma swelling into a thinning shell, shock rings in and out of depth, lightning arcs crackling off it.","tags":["explosion","plasma","energy","electric","magic","sci-fi","one-shot"],"size":[224,200],"origin":[112,100],"duration":1.7,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#0a0828","#1a1c6e","#2c3cc0","#4a7cf0","#7cc0ff","#c8ecff","#ffffff"],"accent":["#1c0a30","#4a1a8c","#8a3ce0","#c48cff","#f0d8ff"],"seed":7},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/plasma-explosion.js"
