@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/disintegrate.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.disintegrate","name":"Disintegrate","desc":"The character crackles with light, flashes white, then peels away from the head down: each pixel flares white-hot and streams off on the wind as a cooling mote of light.","tags":["spawn","death","disintegrate","dissolve","pixels","energy","light","one-shot"],"size":[176,100],"origin":[48,86],"duration":3.4,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#120a26","#2a1658","#3d2f9c","#3f68d4","#3fa8ec","#86e0ff","#d6f8ff","#ffffff"],"accent":["#7a3ae4","#b682ff","#ecd2ff"],"wind":1,"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/disintegrate.js"
