@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/zap-hit.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.zap_hit","name":"Zap hit","desc":"A contact zap: an arc snaps in from the left, the hit point overloads into a knot of tiny crackling zigzags, a fern of burn marks glows outward, sparks jink away, ozone puffs.","tags":["lightning","electric","hit","impact","combat","directional","one-shot"],"size":[144,112],"origin":[76,56],"duration":0.9,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/zap-hit.js"
