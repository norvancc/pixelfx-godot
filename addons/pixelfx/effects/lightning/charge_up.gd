@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/charge-up.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.charge_up","name":"Charge up","desc":"Sparks streak and arcs whip in to a crackling core at the caster's hand that swells and pulses faster, then it flashes and bursts: bolts every way, a ring, a spray of sparks.","tags":["lightning","electric","charge","spell","power-up","actor","one-shot"],"size":[272,184],"origin":[124,148],"duration":2.7,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"charge":1.6,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/charge-up.js"
