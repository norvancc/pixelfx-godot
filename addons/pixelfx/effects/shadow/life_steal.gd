@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/life-steal.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.life_steal","name":"Life steal","desc":"A target on the right is struck and bleeds red orbs; they hang a moment, then whip home as comet streaks and flood the caster crimson.","tags":["shadow","life-steal","drain","blood","heal","directional","magic","one-shot"],"size":[184,100],"origin":[36,92],"duration":2.2,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#14040a","#3a0a14","#6a101c","#a01824","#d42a30","#ff5a50","#ff9a8a","#ffe6de"],"dark":"#2a1040","seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/life-steal.js"
