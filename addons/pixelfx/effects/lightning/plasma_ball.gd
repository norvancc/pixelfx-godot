@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/plasma-ball.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.plasma_ball","name":"Plasma ball","desc":"A glass globe on a dark pedestal: wandering plasma tendrils reach from the core to the glass and fan out in bright feet where they touch it, lighting the stand and floor.","tags":["lightning","electric","plasma","lamp","prop","loop"],"size":[112,104],"origin":[56,96],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1a0828","#3b0f5e","#6a1d9c","#a03ad6","#d46cf2","#f2a8ff","#ffe2ff","#ffffff"],"tendrils":9,"seed":6},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/plasma-ball.js"
