@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/flying-skull.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.flying_skull","name":"Flying skull","desc":"A cracked bone skull bobs in the air, jaw chattering, eyes burning, a fire roaring off its crown that sheds flame puffs, embers and smoke and throws warm light.","tags":["critter","skull","undead","fire","flying","monster","loop"],"size":[96,132],"origin":[48,120],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"bone":["#1a1114","#3e2b2a","#6b5144","#9e8467","#cdb892","#efe2bf","#fffaea"],"hover":40,"floor":true,"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/flying-skull.js"
