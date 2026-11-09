@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/mana-burst.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.mana_burst","name":"Mana burst","desc":"Energy rushes into a point and blows out in a white flash and rings, flinging glowing runes that flare and pop into sparks one after another.","tags":["arcane","burst","mana","rune","nova","magic","ground","one-shot"],"size":[208,150],"origin":[104,124],"duration":1.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/mana-burst.js"
