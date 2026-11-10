@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/time-stop.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.time_stop","name":"Time stop","desc":"A clock face springs open, ticks slower and slower, freezes drained of colour, cracks, then shatters into falling shards.","tags":["arcane","time","clock","freeze","stop","shatter","magic","one-shot"],"size":[196,136],"origin":[98,118],"duration":3.6,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"seed":14},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/time-stop.js"
