@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/boulder.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.boulder","name":"Boulder","desc":"A spinning boulder arcs right shedding dust and pebbles, smashes into the floor in a white flash and bursts into tumbling chunks, gravel and rolling dust.","tags":["nature","earth","rock","projectile","impact","directional","one-shot"],"size":[264,120],"origin":[40,104],"duration":2.3,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#100e12","#1e1a22","#302a36","#463e4c","#5e5464","#7c7080","#a0949e","#cec4c8"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"size":11,"seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/boulder.js"
