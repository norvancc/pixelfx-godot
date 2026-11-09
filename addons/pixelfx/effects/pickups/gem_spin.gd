@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/gem-spin.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.gem_spin","name":"Gem spin","desc":"A brilliant-cut ruby turning on its axis: real facets catch the light in turn, flashes roll over the crown, refracted light slides across the floor, sparkles wink round it.","tags":["pickup","gem","jewel","treasure","ruby","loop"],"size":[64,64],"origin":[32,56],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#16040e","#3e0a1e","#760e2e","#b8163c","#ec3250","#ff7482","#ffc4c8","#ffffff"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/gem-spin.js"
