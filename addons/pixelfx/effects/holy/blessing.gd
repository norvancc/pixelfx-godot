@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/holy/blessing.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.blessing","name":"Blessing","desc":"A soft cone of light rests on the character from above; sparkles drift down through it, twinkling, and wink out where they land on the head and shoulders.","tags":["holy","blessing","buff","light","sparkle","character","loop"],"size":[80,128],"origin":[40,108],"duration":3,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3b1d2a","#7a3a2c","#c4652e","#f0a040","#ffd25e","#fff0a0","#fffbe0","#ffffff"],"seed":7},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/holy/blessing.js"
