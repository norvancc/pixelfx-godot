@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/hit-flash.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.hit_flash","name":"Hit flash","desc":"The character takes damage: a white frame, then their own colors flushed red and blinking white, cooling off, while comic hit lines jab in at them.","tags":["impact","hit","damage","hurt","flash","blink","actor","comic","one-shot"],"size":[80,64],"origin":[40,54],"duration":0.5,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#14040a","#3a0a14","#6a101c","#a01824","#d42a30","#ff5a50","#ff9a8a"],"lines":7,"side":1,"seed":17},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/hit-flash.js"
