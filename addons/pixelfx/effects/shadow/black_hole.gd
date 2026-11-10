@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/black-hole.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.black_hole","name":"Black hole","desc":"A tilted disk of banded rings turns round a black hole, its far side bent up over the top and under the bottom; debris spirals in, stretches and is swallowed.","tags":["shadow","black-hole","void","space","gravity","dark","magic","loop"],"size":[184,132],"origin":[92,124],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"rock":["#120d1c","#2e2440","#544468","#857399"],"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/black-hole.js"
