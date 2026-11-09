@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/combo-counter.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.combo_counter","name":"Combo counter","desc":"x5 COMBO rockets in on streaming speed lines, smearing, and slams to a stop: a white flash, a ring, sparks; it pulses while a timer bar drains, then whooshes out.","tags":["ui","combo","counter","combat","text","one-shot"],"size":[208,100],"origin":[104,50],"duration":1.45,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#1a0516","#3d0a33","#701560","#b0228f","#f53cd1","#ff86e6","#ffd2f6","#ffffff"],"count":5,"label":"COMBO","seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/combo-counter.js"
