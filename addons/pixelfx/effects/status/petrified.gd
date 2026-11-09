@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/petrified.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.petrified","name":"Petrified","desc":"Turned to stone: grey creeps up from the feet behind a crackling edge that spits grit, the statue holds, cracks run through it, and it bursts into tumbling chunks and dust.","tags":["status","stone","petrify","petrified","debuff","death","one-shot"],"size":[120,74],"origin":[60,64],"duration":3.8,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#16141c","#2a2733","#433f4d","#5f5a6a","#7d7889","#a29dab","#cdc8d2","#f0edf3"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/petrified.js"
