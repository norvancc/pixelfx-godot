@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/hammer-smash.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.hammer_smash","name":"Hammer smash","desc":"A hammer drops in front in a wedge of motion: a white slam with rays, a dome of force, a dent with cracks, rocks thrown up that bounce and settle, and dust.","tags":["melee","smash","hammer","heavy","ground","shockwave","debris","combat","directional","one-shot"],"size":[208,112],"origin":[80,92],"duration":2,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#141834","#242c5c","#38479a","#5a72d0","#8fa8f0","#c4d4ff","#eef3ff","#ffffff"],"stone":"#4a3f69","seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/hammer-smash.js"
