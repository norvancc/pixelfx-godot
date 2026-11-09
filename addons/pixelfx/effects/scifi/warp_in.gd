@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/warp-in.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.warp_in","name":"Warp in","desc":"A beam slams down, rings run down it and a scanline paints the hero in from head to toe, white-hot pixels cooling to their own colors; the beam pinches shut in sparks.","tags":["scifi","teleport","warp","beam","spawn","arrive","one-shot"],"size":[192,168],"origin":[96,128],"duration":3,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0b1030","#152a63","#1d4f9e","#2582d2","#36b9ee","#8ae8ff","#d4fbff","#ffffff"],"width":15,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/warp-in.js"
