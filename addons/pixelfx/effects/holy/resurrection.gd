@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/holy/resurrection.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.resurrection","name":"Resurrection","desc":"Light pours down on the fallen and life climbs back up the body; wings of light unfold, a halo forms, one great wingbeat, then the wings scatter into feathers.","tags":["holy","revive","resurrect","wings","halo","light","character","one-shot"],"size":[192,160],"origin":[96,140],"duration":4.8,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3b1d2a","#7a3a2c","#c4652e","#f0a040","#ffd25e","#fff0a0","#fffbe0","#ffffff"],"ash":["#16131c","#26222f","#3a3546","#524c5e","#6e6878","#8c8796"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/holy/resurrection.js"
