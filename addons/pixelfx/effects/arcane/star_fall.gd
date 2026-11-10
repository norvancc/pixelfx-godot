@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/star-fall.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.star_fall","name":"Star fall","desc":"Stars streak down on long trails across an area, each landing with a white flash, a ring across the floor and a kick of sparks.","tags":["arcane","star","meteor","rain","aoe","magic","ground","one-shot"],"size":[232,172],"origin":[124,150],"duration":2.5,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":13},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/star-fall.js"
