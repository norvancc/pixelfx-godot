@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/quake.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.quake","name":"Quake","desc":"The ground jolts three times: a rift tears out along the floor glowing deep inside, slabs of floor heave up and drop back askew, pebbles hop and dust bursts out of the split.","tags":["nature","earth","quake","rift","aoe","ground","one-shot"],"size":[288,104],"origin":[144,88],"duration":3.1,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0e0c14","#1a1724","#211d2d","#2b2639","#3a3450","#4a4263","#6a6088","#8e86a8"],"glow":["#4a1a0c","#a8401a","#ff8a2a","#ffd27a","#fff4d0"],"reach":118,"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/quake.js"
