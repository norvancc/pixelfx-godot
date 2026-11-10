@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/frog.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.frog","name":"Frog","desc":"A frog puffs its throat, blinks, crouches and leaps to snap a buzzing fly out of the air, then lands with a squash and a puff of dust, gulps and settles.","tags":["critter","frog","animal","hop","ground","loop"],"size":[112,88],"origin":[56,80],"duration":2.6,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0a160c","#173a18","#256024","#3a8a2e","#62b440","#a8e070","#e8ffc0"],"belly":["#5e5a24","#bdb45a","#efe9a8"],"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/frog.js"
