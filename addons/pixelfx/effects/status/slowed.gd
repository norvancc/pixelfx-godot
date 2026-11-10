@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/slowed.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.slowed","name":"Slowed","desc":"Dragged through time: a glassy clock dial behind the head ticks round in heavy steps, flashing with each, while drops sink in slow motion and spread slow rings.","tags":["status","slow","time","clock","debuff","loop"],"size":[64,76],"origin":[32,68],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#081a24","#0e3446","#165a6e","#2a8a9a","#52bcc4","#9ee6e0","#e2fff8","#ffffff"],"seed":7},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/slowed.js"
