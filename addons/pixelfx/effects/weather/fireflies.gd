@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/fireflies.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.fireflies","name":"Fireflies","desc":"Fireflies wander over a meadow at night, each glowing up and fading on its own rhythm, trailing light and lighting the grass tips beneath them.","tags":["weather","fireflies","night","glow","meadow","nature","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":12,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#2a3a10","#5a7a1a","#9ad02a","#d6ff5a","#f4ffb8","#ffffff"],"grass":["#070f0b","#0c1a12","#13281a","#1d3a24","#2b5232","#3f6e40"],"seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/fireflies.js"
