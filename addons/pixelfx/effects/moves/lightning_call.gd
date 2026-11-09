@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/lightning-call.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.lightning_call","name":"Lightning call","desc":"An arm goes up, a sigil lights under the target, and on the downswing a thick bolt comes down on it; the target jolts through the aftershocks.","tags":["move","lightning","spell","strike","one-shot"],"size":[290,266],"origin":[42,231],"duration":3,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/lightning-call.js"
