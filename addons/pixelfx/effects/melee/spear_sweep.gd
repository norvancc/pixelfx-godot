@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/spear-sweep.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.spear_sweep","name":"Spear sweep","desc":"A wide low sweep at shin height: a long flat crescent swings from behind the legs round the front, and the wind of it kicks a wake of dust and grit along the floor.","tags":["melee","sweep","spear","polearm","low","aoe","ground","dust","combat","one-shot"],"size":[216,84],"origin":[104,70],"duration":1.5,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0f2a2a","#18504a","#22806e","#3fb894","#8fe6c0","#dcfff0","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"stone":"#4a3f69","seed":10},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/spear-sweep.js"
