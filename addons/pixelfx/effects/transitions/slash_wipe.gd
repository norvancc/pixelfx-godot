@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/slash-wipe.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.slash_wipe","name":"Slash wipe","desc":"A white-hot blade edge slices across the screen, light ahead of it and sparks spraying back over the cover; a second cut flashes through and the cover splits apart.","tags":["transition","screen","slash","blade","cut","sparks","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":1.7,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":2,"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#b8c9e8","#e8f1ff","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"]},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/slash-wipe.js"
