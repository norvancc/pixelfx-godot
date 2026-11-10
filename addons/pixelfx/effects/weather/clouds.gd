@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/clouds.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.clouds","name":"Clouds","desc":"Layers of clouds drift past a bright moon at night: silver-lit tops, dark bellies, edges that flare where they cross the moon, forming and thinning as they go.","tags":["weather","clouds","moon","night","sky","ambient","loop"],"size":[320,180],"origin":[160,180],"duration":12,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0c0c18","#16172a","#232540","#363a5a","#545a80","#8088ae","#bcc4e2","#f2f4ff"],"seed":7},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/clouds.js"
