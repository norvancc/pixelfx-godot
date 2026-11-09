@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/ball-lightning.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.ball_lightning","name":"Ball lightning","desc":"A crackling ball of plasma drifts on a wandering loop, spitting arcs off its skin and leaving a wake of fading motes, and zaps the floor when it dips low.","tags":["lightning","electric","plasma","orb","wisp","ambient","loop"],"size":[136,104],"origin":[68,92],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"seed":9},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/ball-lightning.js"
