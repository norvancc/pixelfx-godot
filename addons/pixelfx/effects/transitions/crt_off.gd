@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/crt-off.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.crt_off","name":"CRT off","desc":"The picture squeezes into a white-hot glowing line, the line into a dot that lingers as a fading afterglow; then it switches back on, dot to line to picture, with a warm-up glow.","tags":["transition","screen","crt","tv","retro","switch","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":2,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#060a14","#0e1a33","#1a3360","#2a5a9a","#4a8fd0","#8cc4f0","#d4ecff","#ffffff"]},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/crt-off.js"
