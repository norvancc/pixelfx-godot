@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/vine-whip.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.vine_whip","name":"Vine whip","desc":"A thorny vine bursts from the floor, rears back coiled, then lashes out right in a whip crack that sprays sap and tears off leaves, before sliding back into the ground.","tags":["nature","vine","plant","whip","melee","directional","one-shot"],"size":[216,128],"origin":[60,114],"duration":1.4,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0c1a10","#173a1a","#24582a","#357a34","#52a03e","#86c84e","#c4ec7a","#f4ffd0"],"thorn":["#2a1410","#5e2a1a","#a04c2e","#e89a6a"],"soil":["#120c0c","#251917","#3b2a24","#553d31","#715440","#8f6e52","#b8966e","#e6d0a8"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/vine-whip.js"
