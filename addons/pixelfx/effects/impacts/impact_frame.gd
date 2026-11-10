@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/impact-frame.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.impact_frame","name":"Impact frame","desc":"An anime impact: two frames of white with black burst lines rushing at the hit, two frames inverted, then the lines pull out past the edges and vanish.","tags":["impact","hit","anime","manga","flash","speed-lines","screen","one-shot"],"size":[320,180],"origin":[160,90],"duration":0.3,"loop":false,"fps":30,"bg":"black","options":{"palette":["#000000","#ffffff"],"lines":64,"seed":19},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/impact-frame.js"
