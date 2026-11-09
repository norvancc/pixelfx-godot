@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/key-glint.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.key_glint","name":"Key glint","desc":"An ornate silver key hovering and rocking; a glint runs from its bow down the shaft to the teeth and bursts off the tip as falling sparks.","tags":["pickup","key","unlock","item","loop"],"size":[72,60],"origin":[36,54],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0e1018","#222838","#3c4660","#5e6d8e","#8c9cbc","#bccae2","#e6eeff","#ffffff"],"seed":7},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/key-glint.js"
