@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/glitch-wipe.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.glitch_wipe","name":"Glitch wipe","desc":"Torn bands of black stutter across the screen, freezing and jerking back, their ragged edges split into magenta and cyan ghosts spitting data slivers; then they tear on through.","tags":["transition","screen","glitch","digital","rgb","bands","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":1.8,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#041418","#08303a","#0c5260","#108088","#18b4b0","#4ce8d8","#b4fff0","#ffffff"],"split":"#ff2d6f"},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/glitch-wipe.js"
