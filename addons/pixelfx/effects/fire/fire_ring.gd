@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/fire/fire-ring.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.fire_ring","name":"Fire ring","desc":"A white flash at the feet, then flames race outward along the floor in a ring, flaring as the front passes and burning down behind it over a smouldering scorch.","tags":["fire","ring","nova","aoe","spell","ground","one-shot"],"size":[224,128],"origin":[112,92],"duration":3.9,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"reach":92,"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/fire/fire-ring.js"
