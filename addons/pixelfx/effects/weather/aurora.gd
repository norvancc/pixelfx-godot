@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/aurora.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.aurora","name":"Aurora","desc":"Rippling curtains of green-to-violet light over a starfield: folding hems burn bright, rays shimmer up into violet, and the whole sky slowly breathes.","tags":["weather","aurora","northern lights","sky","night","ambient","loop"],"size":[320,180],"origin":[160,180],"duration":12,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#081a1e","#0d3a36","#13664e","#1fa06a","#3fd88e","#9af7bf","#e6fff0"],"upper":["#120b2a","#26164f","#41208a","#6a34c0","#9c62e8","#d2b4ff","#f6eeff"],"seed":3},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/aurora.js"
