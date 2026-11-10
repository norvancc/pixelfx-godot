@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/firework-burst.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.firework_burst","name":"Firework burst","desc":"A shell climbs, slows and bursts into a sphere of coloured trailing stars round a gold core; they droop, crackle into white pops and fade, leaving glitter.","tags":["firework","celebration","sparkle","sky","burst","one-shot"],"size":[240,248],"origin":[120,100],"duration":3.6,"loop":false,"fps":30,"bg":"sky","options":{"palette":["#3d0a33","#701560","#b0228f","#f53cd1","#ff86e6","#ffd2f6","#ffffff"],"core":["#4a2c08","#86520c","#c48412","#f0b424","#ffe066","#fff6c4","#ffffff"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/firework-burst.js"
