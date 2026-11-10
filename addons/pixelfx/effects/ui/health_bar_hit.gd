@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/health-bar-hit.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.health_bar_hit","name":"Health bar hit","desc":"A segmented health bar takes a hit: it jolts and dips, the lost chunk flashes white and sheds chips, holds, then drains away behind a sparking edge.","tags":["ui","health","hud","damage","bar","one-shot"],"size":[160,64],"origin":[80,30],"duration":2,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#1a0508","#4a0b12","#8c1420","#d42a2e","#ff5a4a","#ff9a86","#ffd8cc","#ffffff"],"from":0.8,"to":0.45,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/health-bar-hit.js"
