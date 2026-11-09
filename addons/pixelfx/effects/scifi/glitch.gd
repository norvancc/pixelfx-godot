@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/glitch.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.glitch","name":"Glitch","desc":"The hero's signal breaks up in bursts: an RGB split, slices torn sideways, rows smeared out, junk blocks and dead pixels, then snaps back clean.","tags":["scifi","glitch","digital","corrupt","hologram","status","loop"],"size":[88,64],"origin":[44,54],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#14101f","#3b1f5c","#ff2e63","#ff7aa8","#2ef2ff","#b4fbff","#ffffff"],"seed":7},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/glitch.js"
