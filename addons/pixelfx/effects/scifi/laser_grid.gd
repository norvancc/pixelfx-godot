@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/laser-grid.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.laser_grid","name":"Laser grid","desc":"Security lasers between two steel posts: red beams slide and scissor across, dust and haze light up only where they cut through, and the floor sweepers scorch and spark.","tags":["scifi","laser","security","trap","hazard","beam","ground","loop"],"size":[128,84],"origin":[64,76],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1a0408","#4a0a12","#8a1020","#d01c2a","#ff4a4a","#ff9a90","#ffe4e0","#ffffff"],"metal":["#0e0d14","#1e1c27","#312e3e","#4b4759","#6f6a82","#9d98b0"],"seed":31},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/laser-grid.js"
