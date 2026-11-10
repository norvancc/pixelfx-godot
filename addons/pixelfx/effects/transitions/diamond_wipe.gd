@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/diamond-wipe.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.diamond_wipe","name":"Diamond wipe","desc":"A wave of faceted diamonds swells across the screen, rims bright and ridges lit, cooling to black as they lock; then they rise as gems again and shrink away with glints.","tags":["transition","screen","diamond","lattice","geometric","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":2,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"]},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/diamond-wipe.js"
