@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/dagger-flurry.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.dagger_flurry","name":"Dagger flurry","desc":"A flurry of small quick crescents at every angle in front of the fighter, each with a flick of sparks, finished by one big cut that glints and bursts.","tags":["melee","slash","dagger","combo","flurry","fast","combat","directional","one-shot"],"size":[148,104],"origin":[36,86],"duration":0.95,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#1b1630","#3a2f63","#6150a3","#9480d8","#c7b8f5","#efe9ff","#ffffff"],"sparks":["#ffffff","#efe9ff","#c7b8f5","#9480d8"],"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/dagger-flurry.js"
