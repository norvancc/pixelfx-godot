@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/poisoned.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.poisoned","name":"Poisoned","desc":"Sick to the bone: green rolls up the body in waves, dark veins creep from a wound, toxic sweat drips and hisses; every 0.8 s it wobbles, blisters pop and a ring pulses out.","tags":["status","poison","toxic","dot","debuff","sick","loop"],"size":[72,64],"origin":[36,54],"duration":1.6,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0e1d14","#173320","#23552e","#318232","#55b92f","#8eea3f","#cfff63","#f6ffc2"],"veins":"#2c1a3a","seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/poisoned.js"
