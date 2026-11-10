@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/electrified.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.electrified","name":"Electrified","desc":"Current runs through a character: arcs crawl over and leap across the body, sparks spit off, the body flares to an electric silhouette on each jolt, and the feet ground out.","tags":["lightning","electric","status","shock","stun","actor","loop"],"size":[108,92],"origin":[54,76],"duration":2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/electrified.js"
