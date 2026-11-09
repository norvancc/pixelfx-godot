@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/damage-number.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.damage_number","name":"Damage number","desc":"A red -27 punches out of a hit spark, white for a frame, arcs up, lands with a squash and a little hop, then fades as it lifts away.","tags":["ui","damage","number","combat","text","hit","one-shot"],"size":[76,68],"origin":[30,52],"duration":1.05,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#1a0508","#4a0b12","#8c1420","#d42a2e","#ff5a4a","#ff9a86","#ffd8cc","#ffffff"],"text":"-27","seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/damage-number.js"
