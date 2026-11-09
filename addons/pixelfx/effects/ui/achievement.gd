@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/achievement.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.achievement","name":"Achievement","desc":"A toast slides in on speed lines and settles; a gold medal pops onto it in a burst of sparkles, a shine sweeps the whole toast, then it slides away.","tags":["ui","achievement","toast","medal","reward","text","one-shot"],"size":[220,72],"origin":[110,36],"duration":2.4,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#2a1405","#5c3008","#9a5a0e","#d48e18","#f5b92c","#ffde5e","#fff4bc","#ffffff"],"ribbon":["#0c1430","#1f3a7a","#2f66c4","#5aa0f0","#a6d4ff"],"title":"ACHIEVEMENT","text":"UNLOCKED","seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/achievement.js"
