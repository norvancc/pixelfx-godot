@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/soul-drain.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.soul_drain","name":"Soul drain","desc":"Pale souls are torn loose on the right and dragged down a funnel of streaks into a black crystal vessel, which flares violet as each one lands.","tags":["shadow","soul","drain","necromancy","funnel","directional","magic","loop"],"size":[208,120],"origin":[40,110],"duration":3.2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"soul":["#2c3f66","#7d9fd0","#cfe6ff","#ffffff"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/soul-drain.js"
