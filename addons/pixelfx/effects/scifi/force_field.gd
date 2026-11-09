@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/force-field.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.force_field","name":"Force field","desc":"A glassy dome of hex plates over the hero: plates glint, tracers from the right slam into it, a ripple and cracks of light race across, sparks glance off.","tags":["scifi","shield","barrier","dome","hex","hit","defense","loop"],"size":[184,104],"origin":[76,84],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0b1030","#152a63","#1d4f9e","#2582d2","#36b9ee","#8ae8ff","#d4fbff","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"radius":44,"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/force-field.js"
