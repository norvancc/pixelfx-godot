@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/spark-arc.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.spark_arc","name":"Spark arc","desc":"A climbing arc between two rods: it strikes white at their narrow foot, climbs on rising heat as it stretches and bows, sputters and snaps at the top, then strikes again.","tags":["lightning","electric","arc","jacobs-ladder","machine","prop","loop"],"size":[124,120],"origin":[62,108],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"seed":2},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/spark-arc.js"
