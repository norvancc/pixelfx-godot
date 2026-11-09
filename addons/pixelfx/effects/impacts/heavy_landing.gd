@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/heavy-landing.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.heavy_landing","name":"Heavy landing","desc":"A character lands hard: the floor dents and cracks under their feet, two rings of dust roll out along the floor one after the other, and pebbles hop away.","tags":["impact","landing","ground","stomp","dust","rocks","actor","one-shot"],"size":[176,80],"origin":[88,60],"duration":1.6,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#1c1a24","#2f2a3a","#4a4258","#6b6280","#9088a4","#bdb6cc","#e6e1ee"],"stone":"#4a3f69","seed":14},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/heavy-landing.js"
