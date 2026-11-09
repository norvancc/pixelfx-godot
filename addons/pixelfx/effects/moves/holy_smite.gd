@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/holy-smite.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.holy_smite","name":"Holy smite","desc":"Both hands go up and a glint marks the target; he brings them down and a bolt of light drops like a hammer, leaving the target blanched.","tags":["move","holy","spell","strike","one-shot"],"size":[252,182],"origin":[42,151],"duration":2.8,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/holy-smite.js"
