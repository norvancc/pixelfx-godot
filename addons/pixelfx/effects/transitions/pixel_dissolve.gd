@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/pixel-dissolve.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.pixel_dissolve","name":"Pixel dissolve","desc":"Clumps of blocks wink in, each drawn in a white outline that fills black and cools, with glints; then they wink out, outlines collapsing, the last small ones sparkling away.","tags":["transition","screen","dissolve","pixel","blocks","glint","one-shot"],"size":[320,180],"origin":[0,0],"duration":2.2,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#1a0516","#3d0a33","#701560","#b0228f","#f53cd1","#ff86e6","#ffd2f6","#ffffff"]},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/pixel-dissolve.js"
