@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/level-up.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.level_up","name":"Level up","desc":"Gold gathers at the feet and bursts up as a pillar of light round the hero; rings climb it, LEVEL UP! drops in letter by letter, a shine sweeps it, sparkles twinkle.","tags":["ui","level","reward","text","light","one-shot"],"size":[176,138],"origin":[88,114],"duration":3.2,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a1405","#5c3008","#9a5a0e","#d48e18","#f5b92c","#ffde5e","#fff4bc","#ffffff"],"text":"LEVEL UP!","seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/level-up.js"
