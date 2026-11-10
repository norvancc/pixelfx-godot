@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/necro-skulls.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.necro_skulls","name":"Necro skulls","desc":"Spectral skulls circle a cold green flame on a tilted orbit, passing behind and before it, eyes lit, trailing curls of ghost smoke.","tags":["shadow","necromancy","skull","orbit","ghost","spectral","magic","loop"],"size":[136,116],"origin":[68,108],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#040e10","#0a2228","#0f3d44","#16615f","#23907f","#45c4a0","#9af0c8","#e8fff4"],"bone":["#0c1a1c","#2c4a4a","#5c847c","#a6cdb8","#e4fff0"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/necro-skulls.js"
