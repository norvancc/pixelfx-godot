@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/quest-complete.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.quest_complete","name":"Quest complete","desc":"A stitched ribbon unrolls from the middle, QUEST COMPLETE types on letter by letter, a gold seal stamps down and ticks, stars pop; then it all rolls away.","tags":["ui","quest","banner","reward","text","one-shot"],"size":[204,92],"origin":[102,46],"duration":2.6,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#2a1405","#5c3008","#9a5a0e","#d48e18","#f5b92c","#ffde5e","#fff4bc","#ffffff"],"ribbon":["#1e0608","#45101a","#7a1a26","#ad2632","#d8433f","#f27a5e","#ffb79a"],"text":"QUEST COMPLETE","seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/quest-complete.js"
