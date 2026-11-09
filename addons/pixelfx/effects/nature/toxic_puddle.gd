@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/toxic-puddle.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.toxic_puddle","name":"Toxic puddle","desc":"Black tar lit from inside by chartreuse veins and a glowing rim, an oily sheen drifting on it; glossy bubbles dome, stretch and pop, vapour curls up in fraying ribbons.","tags":["nature","poison","toxic","sludge","tar","puddle","hazard","ground","loop"],"size":[176,100],"origin":[88,86],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#06070a","#0c100c","#141a10","#1e2814","#2e3c18","#5a7a1c","#a6d42a","#ecff86"],"sheen":["#2a1648","#5a2e8e","#1e7a86","#6adccc"],"width":42,"seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/toxic-puddle.js"
