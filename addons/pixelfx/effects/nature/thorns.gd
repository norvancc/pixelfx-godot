@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/thorns.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.thorns","name":"Thorns","desc":"A seam races along the floor and hooked thorns punch up out of it one after another, each bigger than the last, in bursts of dirt and green light; they hold, then sink.","tags":["nature","thorns","plant","spikes","ground","attack","one-shot"],"size":[232,92],"origin":[48,78],"duration":2.4,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#160c0e","#2e1418","#4e2224","#743a30","#9a5a3e","#c08458","#e2b484","#fbe8c8"],"glow":["#123818","#2f7a2a","#6cb83a","#c8f070"],"soil":["#120c0c","#251917","#3b2a24","#553d31","#715440","#8f6e52","#b8966e","#e6d0a8"],"count":6,"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/thorns.js"
