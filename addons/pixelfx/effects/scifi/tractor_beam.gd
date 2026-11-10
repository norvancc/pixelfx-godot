@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/tractor-beam.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.tractor_beam","name":"Tractor beam","desc":"A hovering pod projects a cone of light to the floor; rocks tear loose in puffs of dust and spiral up spinning into the lens while rings of light climb the beam.","tags":["scifi","beam","tractor","lift","abduct","debris","ground","loop"],"size":[120,132],"origin":[60,114],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#06161a","#0b2e33","#11505a","#1a7f84","#2bb5a8","#7ef0c8","#d6fff0","#ffffff"],"hull":["#0d0f17","#1c2030","#2e3448","#4a5470","#7a86a8","#b8c4e0"],"stone":["#1a1622","#2e2838","#4a4258","#6d6480","#9a90aa"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/tractor-beam.js"
