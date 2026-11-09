@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/leaf-storm.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.leaf_storm","name":"Leaf storm","desc":"Leaves tumble up a rising spiral round the character, passing behind and in front, turning and flipping, wrapped in bright bands of wind; litter swirls at their feet.","tags":["nature","wind","leaves","buff","aura","actor","loop"],"size":[112,104],"origin":[56,92],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#1a2420","#2e4038","#4a6656","#7a9a84","#b4d0b8","#eef8e8"],"leaves":["#123818","#2f7a2a","#6cb83a","#c8f070","#4a2a08","#a8701c","#e8b42e","#fff09a","#3a1010","#9a2e1c","#e0642a","#ffb070"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/leaf-storm.js"
