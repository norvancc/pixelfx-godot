@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/arcane-orb.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.arcane_orb","name":"Arcane orb","desc":"A floating orb of smoky violet glass with a swirl turning round a white-hot heart, two tilted rings of light orbiting behind and in front.","tags":["arcane","orb","sphere","magic","floating","loop"],"size":[136,112],"origin":[68,104],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/arcane-orb.js"
