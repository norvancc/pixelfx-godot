@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/hologram.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.hologram","name":"Hologram","desc":"A floor projector throws a cone of light holding a turning wireframe model: scanlines roll through it, a data ring circles it, and it flickers, tears and jitters.","tags":["scifi","hologram","projector","wireframe","display","glitch","ground","loop"],"size":[112,104],"origin":[56,92],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#050c1e","#0a1f48","#123b80","#1d64b8","#2e98e8","#6cd0ff","#c8f0ff","#ffffff"],"metal":["#0e0d14","#1e1c27","#312e3e","#4b4759","#6f6a82","#9d98b0"],"split":"#ff4fd8","seed":21},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/hologram.js"
