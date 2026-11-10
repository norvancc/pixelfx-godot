@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/root-snare.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.root_snare","name":"Root snare","desc":"The floor cracks and roots burst up round the character, spiralling round its legs; they cinch tight with a snap, hold, then crack and crumble into bark and dust.","tags":["nature","roots","plant","snare","root","status","actor","one-shot"],"size":[128,96],"origin":[64,78],"duration":2.7,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#140c08","#2a1a10","#46301e","#64462a","#86623a","#a8824e","#ccaa70","#ecd6a0"],"glow":["#123818","#2f7a2a","#6cb83a","#c8f070"],"seed":7},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/root-snare.js"
