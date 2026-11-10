@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/xp-orb.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.xp_orb","name":"XP orb","desc":"A small glowing orb races a figure-eight, a comet tail tapering behind it along its path, flecks shed from the tail winking out, its light following it over the floor.","tags":["pickup","xp","orb","experience","energy","loop"],"size":[72,56],"origin":[36,48],"duration":1.8,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0c1806","#1e3a0a","#36620e","#5c9614","#8cd024","#c4f060","#effcc0","#ffffff"],"seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/xp-orb.js"
