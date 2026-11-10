@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/curse.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.curse","name":"Curse","desc":"Wisps gather over the head, a skull stamps down with a flash, its eyes burn as the curse floods the body violet, then it cracks and crumbles.","tags":["shadow","curse","debuff","skull","status","dark","magic","one-shot"],"size":[112,124],"origin":[56,108],"duration":3.4,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"bone":["#170f26","#4a3a6e","#7f6ea6","#b3a4d4","#e2d8f6"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/curse.js"
