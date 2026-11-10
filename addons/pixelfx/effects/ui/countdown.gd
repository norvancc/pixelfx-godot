@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/countdown.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.countdown","name":"Countdown","desc":"3, 2, 1 slam into a timer ring that drains like a burning fuse, throwing sparks; then GO! bursts out as the ring blows into a shockwave with rays.","tags":["ui","countdown","start","timer","text","one-shot"],"size":[152,136],"origin":[76,68],"duration":3.1,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#0a1030","#142a66","#1f4fae","#2f86e6","#5cc4ff","#a8e8ff","#e6fbff","#ffffff"],"go":["#0b2410","#16501c","#22882a","#3cc23a","#7ee84c","#c4ff8a","#f0ffd6","#ffffff"],"from":3,"word":"GO!","seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/countdown.js"
