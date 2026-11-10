@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/exclamation.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.exclamation","name":"Exclamation","desc":"A bold ! springs up off the hero's head, stretching as it shoots up and squashing as it lands; surprise ticks flick out, it wobbles, then pops away.","tags":["ui","alert","surprise","emote","character","one-shot"],"size":[84,104],"origin":[42,92],"duration":1.4,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a1405","#6a2e06","#b85a0a","#f08c14","#ffc23a","#ffe580","#fff6c8","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/exclamation.js"
