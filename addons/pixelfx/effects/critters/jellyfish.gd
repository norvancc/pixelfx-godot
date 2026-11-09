@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/jellyfish.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.jellyfish","name":"Jellyfish","desc":"A see-through jellyfish pulses: its bell squeezes to shove it up and relaxes as it sinks, frilled arms and long tentacles trailing, a glow inside, bubbles drifting by.","tags":["critter","jellyfish","sea","underwater","glow","swim","loop"],"size":[96,120],"origin":[48,38],"duration":3.2,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#140b2b","#2a1650","#4b2386","#7a3cb8","#b066e0","#e09cf5","#ffd6ff","#ffffff"],"glow":["#0b3550","#1f7fa8","#4fd2e8","#b8fbff"],"seed":1},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/jellyfish.js"
