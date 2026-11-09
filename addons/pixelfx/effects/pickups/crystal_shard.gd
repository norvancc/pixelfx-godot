@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/crystal-shard.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.crystal_shard","name":"Crystal shard","desc":"A broken amber shard hovers and sways: chipped uneven faces, its top sheared off, light pulsing up through glowing cracks and flaring out of the break; splinters orbit it.","tags":["pickup","crystal","shard","relic","broken","loop"],"size":[64,76],"origin":[32,68],"duration":3.2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1a0a04","#3e1606","#702a08","#a8480c","#e07818","#ffa838","#ffd890","#ffffff"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/crystal-shard.js"
