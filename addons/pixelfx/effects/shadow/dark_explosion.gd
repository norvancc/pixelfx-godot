@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/dark-explosion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.dark_explosion","name":"Dark explosion","desc":"Motes swirl into a pulsing core, a black star cuts across a violet-white flash, and a black sphere burns at the rim, throws lit shards and smoke, then collapses.","tags":["shadow","explosion","void","dark","magic","impact","one-shot"],"size":[280,248],"origin":[140,206],"duration":3.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/dark-explosion.js"
