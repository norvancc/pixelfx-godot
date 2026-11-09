@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/potion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.potion","name":"Potion","desc":"A round glass flask of glowing brew rocks in the air: the brew sloshes behind the rock, bubbles rise and pop, light glows through the glass, wisps curl off the cork.","tags":["pickup","potion","flask","brew","magic","loop"],"size":[56,72],"origin":[28,64],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1a0516","#3d0a33","#701560","#b0228f","#f53cd1","#ff86e6","#ffd2f6","#ffffff"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/potion.js"
