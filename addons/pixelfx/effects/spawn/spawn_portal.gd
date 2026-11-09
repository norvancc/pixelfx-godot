@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/spawn-portal.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.spawn_portal","name":"Spawn portal","desc":"A rift tears open on the floor and swirls, belches violet smoke and sparks, spits a fountain of wisps up out of itself, then twists shut with a pop.","tags":["spawn","portal","summon","rift","arcane","smoke","ground","one-shot"],"size":[208,150],"origin":[104,122],"duration":3.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#12081f","#2a0f4d","#481b8c","#7330d0","#a35cff","#cf9bff","#f1dcff","#ffffff"],"width":28,"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/spawn-portal.js"
