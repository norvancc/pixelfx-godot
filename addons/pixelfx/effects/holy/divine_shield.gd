@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/holy/divine-shield.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.divine_shield","name":"Divine shield","desc":"A bubble of gold light round the character: a bright rim and a thin gold film, meridians turning like a slow globe, a sheen sweeping across and sparkles winking on it.","tags":["holy","shield","bubble","barrier","buff","character","loop"],"size":[88,84],"origin":[44,68],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3b1d2a","#7a3a2c","#c4652e","#f0a040","#ffd25e","#fff0a0","#fffbe0","#ffffff"],"radius":29,"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/holy/divine-shield.js"
