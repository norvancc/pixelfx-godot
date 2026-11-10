@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/stunned.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.stunned","name":"Stunned","desc":"Seeing stars: three spinning stars and two little birds circle the head on a tilted ring, ducking behind it and sweeping round in front, trailing glitter.","tags":["status","stun","dizzy","daze","stars","birds","debuff","loop"],"size":[60,64],"origin":[30,56],"duration":2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3a1e0c","#8a4a12","#d88a1c","#f5c030","#ffe36e","#fff6c8","#ffffff"],"birds":["#1a1422","#6a7fae","#b8c8e8","#f4f8ff"],"beak":"#ffae35","seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/stunned.js"
