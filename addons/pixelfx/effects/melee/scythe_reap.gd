@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/scythe-reap.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.scythe_reap","name":"Scythe reap","desc":"A slow, huge dark crescent reaps round the front with a pale ghostly edge; it hangs, then tears away from the tail into curling wisps and cold vapour.","tags":["melee","scythe","reap","dark","ghost","death","slash","combat","one-shot"],"size":[184,116],"origin":[84,98],"duration":2.1,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#07040c","#140a22","#24113a","#3b1d58","#5a3a82","#7fd6c0","#d8fff2","#ffffff"],"seed":13},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/scythe-reap.js"
