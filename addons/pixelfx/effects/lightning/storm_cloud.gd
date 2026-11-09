@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/storm-cloud.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.storm_cloud","name":"Storm cloud","desc":"A storm cloud boils overhead, billows lit from inside by flickering discharges, ragged scud under its flat dark base; rain slants down and once a loop a bolt cracks to the floor.","tags":["lightning","storm","weather","cloud","rain","ambient","loop"],"size":[168,176],"origin":[84,164],"duration":3,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"cloud":["#09070f","#120f1e","#1b182e","#252640","#323758","#464d78","#646b9c"],"rain":["#2b3250","#46527a","#6d7cab","#a5b5e0"],"seed":8},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/storm-cloud.js"
