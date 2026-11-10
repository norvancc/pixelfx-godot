@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/magic-circle-cast.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.magic_circle_cast","name":"Magic circle cast","desc":"A circle draws itself on the floor, runes ignite one by one, it flashes, and a column of light fires up and breaks apart into glints.","tags":["arcane","magic","circle","rune","cast","column","summon","ground","one-shot"],"size":[200,220],"origin":[100,192],"duration":3.9,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/magic-circle-cast.js"
