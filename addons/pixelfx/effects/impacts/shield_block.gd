@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/shield-block.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.shield_block","name":"Shield block","desc":"A blow is caught on a half-dome of energy in front of the character: its diamond lattice flashes, a ripple runs over it, sparks glance off, then it blinks out cell by cell.","tags":["impact","block","shield","barrier","energy","ripple","actor","one-shot"],"size":[148,104],"origin":[40,88],"duration":1.1,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/shield-block.js"
