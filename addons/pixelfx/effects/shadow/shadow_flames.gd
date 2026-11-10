@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/shadow-flames.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.shadow_flames","name":"Shadow flames","desc":"Inside-out fire on the floor: a black heart wrapped in violet flame with pale skin and tips, shedding embers and dark smoke.","tags":["shadow","fire","flame","ground","dark","magic","loop"],"size":[104,112],"origin":[52,102],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/shadow-flames.js"
