@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/spin-slash.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.spin_slash","name":"Spin slash","desc":"The blade whirls once round the waist on a tilted plane, behind the body and back in front; the closed ring flares white, dissolves into a dotted trace and throws sparks.","tags":["melee","slash","spin","sword","aoe","combat","one-shot"],"size":[208,104],"origin":[104,84],"duration":0.8,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#16224a","#1f4a86","#2a7fc0","#48b8ec","#9fe2ff","#e2f7ff","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"radius":46,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/spin-slash.js"
