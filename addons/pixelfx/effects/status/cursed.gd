@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/cursed.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.cursed","name":"Cursed","desc":"Hexed: violet smoke rises off the body in winding trails, a dark stain creeps up from the feet with a glowing edge, the eyes burn, a skull glitches in overhead.","tags":["status","curse","hex","dark","debuff","shadow","loop"],"size":[64,84],"origin":[32,76],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0c0612","#1f0f2e","#3a1a55","#5e2a85","#8a3fc0","#b86ef0","#e0b0ff","#ffffff"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/cursed.js"
