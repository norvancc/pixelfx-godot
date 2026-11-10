@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/grasping-hands.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.grasping_hands","name":"Grasping hands","desc":"Shadow arms burst up out of a dark pool with a splash, clench their hands into claws, strain, and are dragged back under, fingers clawing at the air.","tags":["shadow","hands","arms","grab","ground","dark","magic","one-shot"],"size":[200,116],"origin":[100,100],"duration":3.1,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/grasping-hands.js"
