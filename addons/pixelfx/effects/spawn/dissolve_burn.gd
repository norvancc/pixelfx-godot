@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/dissolve-burn.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.dissolve_burn","name":"Dissolve burn","desc":"An ember seam lights at the feet and climbs the body: above it the body scorches and smoulders, at it flames lick up, below it there's only falling ash, embers and smoke.","tags":["spawn","death","burn","fire","ash","dissolve","embers","one-shot"],"size":[96,112],"origin":[48,100],"duration":3.6,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a0e08","#5a1a0c","#a8320f","#e8601a","#ff9a2e","#ffd25a","#fff3c0","#ffffff"],"ash":["#2a2428","#4a4248","#6e6670"],"seed":16},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/dissolve-burn.js"
