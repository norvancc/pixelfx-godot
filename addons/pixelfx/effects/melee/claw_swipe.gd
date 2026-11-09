@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/claw-swipe.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.claw_swipe","name":"Claw swipe","desc":"Three claw marks rake down one after another, white-hot, cooling through orange to red, then close up from both ends and leave a dotted scar, with hot flecks and drips.","tags":["melee","claw","swipe","beast","scratch","combat","directional","one-shot"],"size":[128,96],"origin":[36,84],"duration":0.9,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a0808","#5c0f12","#a51d1d","#e2401f","#ff8a2a","#ffd166","#fff3c4","#ffffff"],"sparks":["#fff3c4","#ffd166","#ff8a2a","#c42a1a"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/claw-swipe.js"
