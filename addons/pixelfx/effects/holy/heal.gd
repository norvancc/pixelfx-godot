@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/holy/heal.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.heal","name":"Heal","desc":"Petals of light bloom under the feet, a hoop of light rises up the body restoring its colour and leaving sparkles, and motes spiral up and pop into tiny hearts.","tags":["holy","heal","restore","buff","petals","hearts","character","one-shot"],"size":[80,104],"origin":[40,92],"duration":1.9,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3d2027","#7d3f35","#c97a4a","#f2b46a","#ffd994","#fff0cf","#fffaf2","#ffffff"],"seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/holy/heal.js"
