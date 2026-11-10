@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/implosion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.implosion","name":"Implosion","desc":"Everything is sucked in: streaks and grit rush inward, rings contract and a dark sphere collapses onto a crushed white point; a beat of stillness, then a sharp pop.","tags":["implosion","energy","magic","collapse","pop","one-shot"],"size":[208,184],"origin":[104,92],"duration":1.65,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#0a0614","#1c1236","#3a2470","#6a44c0","#a080f0","#d8c8ff","#ffffff"],"seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/implosion.js"
