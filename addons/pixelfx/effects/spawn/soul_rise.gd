@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/soul-rise.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.soul_rise","name":"Soul rise","desc":"The body's outline flares and dims, then a pale glowing copy of it lifts out, stretching as its legs melt into a rippling wisp, shedding motes until it thins into light.","tags":["spawn","death","soul","ghost","spirit","rise","light","one-shot"],"size":[96,140],"origin":[48,126],"duration":3.2,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#101a33","#1f3563","#35609e","#5c96d4","#94c8f0","#d2f0ff","#ffffff"],"height":50,"seed":27},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/soul-rise.js"
