@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/holy/halo.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.halo","name":"Halo","desc":"A ring of gold light floats over the head with a glint running round it; fine dust sifts down from it and the head catches its light.","tags":["holy","halo","saint","buff","glow","character","loop"],"size":[56,80],"origin":[28,70],"duration":2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3b1d2a","#7a3a2c","#c4652e","#f0a040","#ffd25e","#fff0a0","#fffbe0","#ffffff"],"seed":5},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/holy/halo.js"
