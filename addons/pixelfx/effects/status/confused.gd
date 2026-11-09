@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/confused.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.confused","name":"Confused","desc":"Head in a spin: a glowing spiral whirls over the head, question marks pop up round it and bob, the eyes dart left and right.","tags":["status","confused","confusion","dizzy","debuff","loop"],"size":[60,78],"origin":[30,70],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#1e0f2e","#4b2070","#8a3ab0","#c66ae0","#f0a8ff","#ffffff"],"marks":["#2a1608","#b0701a","#ffd84a","#fff4b8"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/confused.js"
