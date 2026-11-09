@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/lightning-strike.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.lightning_strike","name":"Lightning strike","desc":"A targeted strike: a sigil charges on the floor, the scene darkens, a thick bolt slams into it, arcs race out along the cracks it splits, the channel crumbles to a scorch.","tags":["lightning","electric","strike","spell","target","impact","ground","one-shot"],"size":[240,264],"origin":[120,228],"duration":3,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/lightning-strike.js"
