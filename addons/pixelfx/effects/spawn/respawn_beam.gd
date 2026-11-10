@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/respawn-beam.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.respawn_beam","name":"Respawn beam","desc":"A guide line drops, a pillar of light slams onto the spot, and a scan bar climbs from the feet writing the character back in row by row, white-hot lines cooling to its colors.","tags":["spawn","respawn","beam","teleport","scanline","light","one-shot"],"size":[128,150],"origin":[64,136],"duration":2.5,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#061e1b","#0c3e36","#136a5a","#1f9c80","#45d1a8","#a8f5d8","#ffffff"],"width":15,"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/respawn-beam.js"
