@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/wisp.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.wisp","name":"Wisp","desc":"A will-o'-the-wisp loops a figure-eight over the floor: a little soul-flame with a face, its flame tail licking up and streaming behind, shedding puffs and sparks.","tags":["critter","wisp","spirit","flame","magic","flying","loop"],"size":[128,104],"origin":[64,96],"duration":3.2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a1f2e","#0f3d52","#14707e","#1fa8a8","#4fe0c8","#a8fff0","#ffffff"],"hover":36,"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/wisp.js"
