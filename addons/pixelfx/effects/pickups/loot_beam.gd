@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/loot-beam.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.loot_beam","name":"Loot beam","desc":"A dropped sword in a tall pillar of rarity light: a white core thinning to the sky, rings pulsing across the floor, motes streaming up, a glint racing up the shaft.","tags":["pickup","loot","beam","rarity","drop","item","loop"],"size":[96,176],"origin":[48,162],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#140a24","#2c1250","#4b1d86","#7330c0","#a050f0","#c890ff","#ecd4ff","#ffffff"],"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/loot-beam.js"
