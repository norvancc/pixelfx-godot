@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/warp-out.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.warp_out","name":"Warp out","desc":"The hero's outline flickers on, they flash white and break into light from the head down, streaming up a beam that lifts off the floor and pinches shut.","tags":["scifi","teleport","warp","beam","despawn","leave","one-shot"],"size":[128,168],"origin":[64,128],"duration":2.6,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#0b1030","#152a63","#1d4f9e","#2582d2","#36b9ee","#8ae8ff","#d4fbff","#ffffff"],"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/warp-out.js"
