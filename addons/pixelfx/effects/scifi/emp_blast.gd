@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/emp-blast.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.emp_blast","name":"EMP blast","desc":"A disc charge ticks, pops white, and a bubble of rolling scanlines swells out with arcs crawling its skin; it strobes, tears and shorts out into falling dead pixels.","tags":["scifi","emp","pulse","shockwave","electric","grenade","glitch","one-shot"],"size":[152,116],"origin":[76,84],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0d0820","#1c1658","#2d2aa0","#3f55e8","#5a8eff","#9cc4ff","#dceaff","#ffffff"],"fringe":"#ff5ad8","radius":56,"seed":33},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/emp-blast.js"
