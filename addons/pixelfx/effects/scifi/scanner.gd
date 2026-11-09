@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/scanner.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.scanner","name":"Scanner","desc":"Brackets snap onto the hero, a scan line sweeps head to toe leaving a cooling outline, and a readout counts up to OK before it all lets go.","tags":["scifi","scan","target","hud","tech","status","ui","loop"],"size":[112,78],"origin":[42,58],"duration":3.2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#03140a","#06301a","#0c5a2c","#16893e","#2cc256","#7cf08c","#d0ffd4","#ffffff"],"seed":22},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/scanner.js"
