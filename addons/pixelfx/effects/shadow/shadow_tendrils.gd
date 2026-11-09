@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/shadow-tendrils.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.shadow_tendrils","name":"Shadow tendrils","desc":"A dark pool opens on the floor; tentacles with lit rims and hooked tips lash up out of it with a splash, writhe, and sink back as it closes.","tags":["shadow","tentacle","tendril","ground","dark","magic","one-shot"],"size":[208,130],"origin":[104,106],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/shadow-tendrils.js"
