@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/critters/bird.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.bird","name":"Bird","desc":"A songbird flies in place: bursts of wingbeats that lift its body on each downstroke, a glide on spread wings, its tail fanning, a loose feather drifting away.","tags":["critter","bird","flying","animal","loop"],"size":[112,80],"origin":[56,40],"duration":2.4,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#0a0e1e","#18244a","#24407a","#3466aa","#5a94d4","#9cc8f0","#eaf6ff"],"breast":["#4a1a0e","#a8441c","#e8783a","#ffb070"],"seed":1},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/critters/bird.js"
