@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/chain-lightning.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.chain_lightning","name":"Chain lightning","desc":"A bolt leaps from the caster's hand through three targets in turn; each flashes, sparks and grounds itself to the floor while the arcs between them flicker, then the chain snaps.","tags":["lightning","electric","chain","spell","combat","directional","one-shot"],"size":[248,104],"origin":[40,82],"duration":1.8,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/chain-lightning.js"
