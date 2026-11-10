@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/smoke-bomb.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.smoke_bomb","name":"Smoke bomb","desc":"A round canister clinks down, fuse sparking, and pops: thick grey-violet smoke gushes out, rolls along the floor, billows into a cloud that hides all, then thins to wisps.","tags":["smoke","smoke-bomb","ninja","vanish","escape","ground","one-shot"],"size":[260,176],"origin":[130,156],"duration":5,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0e0b14","#1e1828","#30283e","#463c58","#62567a","#867a9e","#aea4c4"],"canister":["#16121e","#2a2434","#443c52","#686078","#9c94ac"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/smoke-bomb.js"
