@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/crit-number.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.crit_number","name":"Crit number","desc":"CRIT 128! slams in huge and white over a jagged starburst with a hard shake and speed lines, cools to fire, holds with a shine, then pops into sparks.","tags":["ui","critical","damage","number","combat","text","one-shot"],"size":[152,120],"origin":[76,60],"duration":1.5,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#2a0710","#5e0f16","#a3191c","#e0401c","#ff7b22","#ffb93b","#ffe68a","#ffffff"],"text":"128!","label":"CRIT","seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/crit-number.js"
