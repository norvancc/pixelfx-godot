@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/bat.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.bat","name":"Bat","desc":"A bat flaps in four snappy wing frames along a figure-eight, its body lifting on each downbeat, moonlight on its wing bones, red eyes glowing and glinting.","tags":["critter","bat","night","flying","spooky","loop"],"size":[112,80],"origin":[56,40],"duration":2.4,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0c0912","#1f1629","#382645","#5b3f66","#866089","#b88fb0","#e8cfe0"],"eyes":["#8a1020","#ff3b30","#ffb04a","#fff0c0"],"seed":1},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/bat.js"
