@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/shatter-wipe.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.shatter_wipe","name":"Shatter wipe","desc":"A dark glass pane drops over the screen and bounces; cracks race out from an impact with a flash, then it bursts into tumbling glass shards with lit edges that fall away.","tags":["transition","screen","shatter","glass","break","shards","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":2.8,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":2,"palette":["#0c1430","#162c5c","#1f4f94","#2f7fcc","#58b4ec","#9bdcff","#d8f4ff","#ffffff"]},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/shatter-wipe.js"
