@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/energy-core.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.energy_core","name":"Energy core","desc":"A plasma core beating in a steel cage: it swells and throws a shock ring on each beat, two tilted rings orbit it, and arcs jump to the bars and spark.","tags":["scifi","reactor","core","power","plasma","machine","prop","ground","loop"],"size":[112,100],"origin":[56,88],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1a0516","#3d0a33","#701560","#b0228f","#f53cd1","#ff86e6","#ffd2f6","#ffffff"],"metal":["#0e0d14","#1e1c27","#312e3e","#4b4759","#6f6a82","#9d98b0"],"seed":35},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/energy-core.js"
