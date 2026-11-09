@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/grenade.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.grenade","name":"Grenade","desc":"A grenade is lobbed in, bounces, rolls to a stop with its fuse fizzing, shudders, then blows: a white flash, shrapnel streaks, sparks, a small fireball and a scorch.","tags":["explosion","grenade","shrapnel","fire","smoke","ground","one-shot"],"size":[300,200],"origin":[160,170],"duration":4.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"body":["#141a10","#2c3a1e","#4a5c30","#6e8446","#9ab06a"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/grenade.js"
