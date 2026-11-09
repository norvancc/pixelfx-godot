@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/summon-rise.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.summon_rise","name":"Summon rise","desc":"A rune circle burns into the floor, the ground bursts, and a horned brute heaves up out of it through dust and rubble, lit from below, until its eyes flare.","tags":["spawn","summon","demon","rise","runes","dust","rubble","ground","one-shot"],"size":[176,116],"origin":[88,94],"duration":4.6,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#1a0608","#3d0c0c","#7a1a10","#c0381a","#f06a1e","#ffae3a","#ffe08a","#ffffff"],"body":["#060409","#0e0913","#170f1e","#211628","#2d2036"],"horn":["#0c080c","#201820","#352a32","#4e3f48","#6e5c64"],"stone":["#1a1424","#2b2639","#4a4263","#6c6488","#9a91b4"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/summon-rise.js"
