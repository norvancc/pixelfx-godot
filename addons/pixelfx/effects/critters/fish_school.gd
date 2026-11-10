@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/fish-school.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.fish_school","name":"Fish school","desc":"A school of fish holds station in two depth rows: bodies wag into swinging tails, one darts ahead now and then, bubbles rise and caustic light ripples over them.","tags":["critter","fish","school","sea","underwater","swim","loop"],"size":[136,80],"origin":[68,40],"duration":4.8,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#0a1a2a","#123552","#1d5a7e","#2f8aa8","#62bccc","#bfe8e6","#f4fff8"],"stripe":["#5a1e14","#d8582a","#ffa04a"],"seed":1},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/fish-school.js"
