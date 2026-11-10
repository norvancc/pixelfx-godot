@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/butterfly.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.butterfly","name":"Butterfly","desc":"An iridescent butterfly wanders a loop in bursts of quick wingbeats and open-winged glides, its veined, spotted wings shedding a twinkling trail of glowing dust.","tags":["critter","butterfly","insect","flying","magic","glow","loop"],"size":[128,88],"origin":[64,44],"duration":3.2,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0b0f24","#16224f","#1f3f8a","#2f74c8","#4fb4f0","#a0e6ff","#ffffff"],"spots":["#3a1a08","#c8641a","#ffb43c","#fff0b0"],"seed":1},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/butterfly.js"
