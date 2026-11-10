@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/heart-lost.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.heart_lost","name":"Heart lost","desc":"A HUD heart is hit: it flashes white and jolts, a crack runs down it, it splits into two halves that tumble away, leaving an empty socket that fades.","tags":["ui","health","heart","hud","damage","one-shot"],"size":[96,88],"origin":[48,34],"duration":1.5,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#1a0508","#4a0b12","#8c1420","#d42a2e","#ff5a4a","#ff9a86","#ffd8cc","#ffffff"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/heart-lost.js"
