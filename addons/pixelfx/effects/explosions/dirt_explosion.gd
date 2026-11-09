@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/dirt-explosion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.dirt_explosion","name":"Dirt explosion","desc":"A buried charge goes off: a flash under the floor, a V of dirt clods and grit thrown high, a brown dust plume that billows and settles, and a crater left behind.","tags":["explosion","dirt","earth","dust","debris","ground","one-shot"],"size":[260,240],"origin":[130,206],"duration":3.6,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#1c1610","#33281c","#4f3f2c","#6e5a40","#927a58","#b89f78","#dcc8a2"],"fire":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/dirt-explosion.js"
