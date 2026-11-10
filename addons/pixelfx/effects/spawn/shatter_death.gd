@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/shatter-death.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.shatter_death","name":"Shatter death","desc":"Frost races up the body and seals it in faceted ice, a glint sweeps it, cracks spread from the chest, then it bursts into its own facets that tumble, bounce and melt.","tags":["spawn","death","ice","freeze","shatter","shards","one-shot"],"size":[172,96],"origin":[84,84],"duration":3.3,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0e1636","#1a2f66","#2557a3","#3488d6","#5fc0f0","#a2e6ff","#dcf8ff","#ffffff"],"seed":14},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/shatter-death.js"
