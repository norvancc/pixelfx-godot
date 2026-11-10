@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/chest-open.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.chest_open","name":"Chest open","desc":"A banded chest rattles with gold light leaking from its seam, the lid kicks open, rays fan up, and coins and gems arc out, bounce, glint and get collected.","tags":["pickup","chest","treasure","loot","reward","gold","one-shot"],"size":[176,112],"origin":[88,96],"duration":4.6,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#1e1206","#4a2c08","#86520c","#c48412","#f0b424","#ffe066","#fff6c4","#ffffff"],"wood":["#110a10","#24131a","#3a1f1f","#552d24","#73402c","#925737","#b07246"],"coins":12,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/chest-open.js"
