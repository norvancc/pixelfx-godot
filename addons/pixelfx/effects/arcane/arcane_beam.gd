@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/arcane-beam.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.arcane_beam","name":"Arcane beam","desc":"A beam fires right from the hand: a white core, strands twisting round it, pulses running down it, a flaring source and an end that sprays sparks.","tags":["arcane","beam","laser","ray","magic","directional","loop"],"size":[264,100],"origin":[26,84],"duration":1.2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":10},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/arcane-beam.js"
