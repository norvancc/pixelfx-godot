@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/thunderclap.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.thunderclap","name":"Thunderclap","desc":"A thunderclap round the caster: a white flash, forked bolts burst out and stab the floor, a heavy shock ring tears across the ground raising dust and grit, sparks streak away.","tags":["lightning","electric","nova","aoe","spell","shockwave","one-shot"],"size":[288,156],"origin":[144,124],"duration":1.9,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"reach":104,"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/thunderclap.js"
