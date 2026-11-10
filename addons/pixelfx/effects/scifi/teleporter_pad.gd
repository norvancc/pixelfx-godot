@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/teleporter-pad.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.teleporter_pad","name":"Teleporter pad","desc":"A steel pad glows on the floor, its rings rippling outward; a soft column of light rises off it and rings of light lift away, sparkles drifting up through them.","tags":["scifi","teleporter","pad","portal","beam","spawn","ground","loop"],"size":[96,104],"origin":[48,92],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#120a26","#26145a","#3c2296","#5a3ad2","#7f66f0","#b4a2ff","#e6deff","#ffffff"],"metal":["#0e0d14","#1e1c27","#312e3e","#4b4759","#6f6a82","#9d98b0"],"seed":26},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/teleporter-pad.js"
