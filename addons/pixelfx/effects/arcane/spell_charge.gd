@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/spell-charge.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.spell_charge","name":"Spell charge","desc":"Energy gathers in the caster's hand: streaks and motes spiral in, rings collapse into a swelling orb that crackles with arcs, ready to fire.","tags":["arcane","charge","spell","orb","cast","magic","loop"],"size":[120,86],"origin":[44,80],"duration":1.6,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":5},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/spell-charge.js"
