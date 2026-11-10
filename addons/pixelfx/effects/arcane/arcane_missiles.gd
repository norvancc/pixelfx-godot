@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/arcane-missiles.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.arcane_missiles","name":"Arcane missiles","desc":"A volley of violet bolts fans out of the hand, curls round on twisting ribbons and pops on the target one after another.","tags":["arcane","missile","projectile","homing","volley","magic","directional","one-shot"],"size":[240,116],"origin":[26,88],"duration":1.75,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/arcane-missiles.js"
