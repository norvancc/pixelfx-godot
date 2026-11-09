@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/snake.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.snake","name":"Snake","desc":"A snake slithers along the floor, head raised: humps rise and roll back down its patterned body to the tail, dust puffs where it touches down, its forked tongue flicks.","tags":["critter","snake","reptile","ground","loop"],"size":[136,56],"origin":[68,48],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#081410","#123a1e","#1d5e2a","#2f8a36","#5cb848","#a8e070","#e8ffc0"],"belly":["#4a3a14","#b08a34","#f0d878"],"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/snake.js"
