@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/blinds.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.blinds","name":"Blinds","desc":"Slats catch the light edge-on, then tilt shut top to bottom, lit rims glinting as warm light squeezes through the closing gaps with dust in it; then they tilt open and fade.","tags":["transition","screen","blinds","slats","light","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":2,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#1a120c","#33241a","#5a4030","#8a6848","#c09a6a","#e8cc98","#fff0cc","#ffffff"]},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/blinds.js"
