@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/big-explosion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.big_explosion","name":"Big explosion","desc":"A huge ground blast in three beats: a white dome, a rolling fireball that climbs into a mushrooming smoke column, heavy rocks, and fires left burning.","tags":["explosion","fire","smoke","debris","mushroom","big","ground","one-shot"],"size":[360,300],"origin":[180,262],"duration":7.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"stone":"#4a3f69","seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/big-explosion.js"
