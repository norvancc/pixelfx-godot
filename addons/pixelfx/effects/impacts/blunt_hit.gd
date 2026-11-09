@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/blunt-hit.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.blunt_hit","name":"Blunt hit","desc":"A heavy, soft thud: a white-hot lumpy blob cools to cream in a warm pool of light, inked wedges jab out and snap back, a squashed ring of dust puffs swells and drifts, clods drop.","tags":["impact","hit","blunt","punch","club","thump","dust","comic","one-shot"],"size":[128,88],"origin":[64,72],"duration":0.9,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#1d1620","#4a3a3c","#7d6a66","#b09c90","#dccab4","#f6ead2","#ffffff"],"warm":"#ffc98a","dust":"#b7a8a6","clod":"#6e5a5a","height":22,"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/blunt-hit.js"
