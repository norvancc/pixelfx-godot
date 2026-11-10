@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/heavy-cleave.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.heavy_cleave","name":"Heavy cleave","desc":"A glint over the head, then a thick ember arc accelerates over the top into the floor: a white slam, glowing cracks, dust rolling both ways, grit and rising embers.","tags":["melee","slash","cleave","axe","heavy","ground","fire","combat","directional","one-shot"],"size":[208,116],"origin":[68,96],"duration":1.9,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a0c10","#5c1414","#a3241a","#e0481c","#ff8a2a","#ffc23d","#fff0a0","#ffffff"],"stone":"#4a3f69","seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/heavy-cleave.js"
