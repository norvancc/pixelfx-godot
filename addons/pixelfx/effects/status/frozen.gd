@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/frozen.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.frozen","name":"Frozen","desc":"Chilled to the bone: frost ferns creep over the body, icicles hang from chin and hands and drip, breath steams, snow settles, a shiver every second, frost spreads underfoot.","tags":["status","ice","freeze","frozen","cold","chill","debuff","loop"],"size":[72,64],"origin":[36,54],"duration":2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/frozen.js"
