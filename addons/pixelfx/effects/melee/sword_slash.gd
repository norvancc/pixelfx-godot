@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/sword-slash.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.sword_slash","name":"Sword slash","desc":"A tilted crescent whips round in two frames, cools from white to deep blue as it trails off, glints at the tip and throws sparks.","tags":["melee","slash","sword","combat","directional","one-shot"],"size":[136,104],"origin":[44,92],"duration":0.75,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#212f6b","#2c58aa","#3a8bd8","#62c8f4","#b8c9e8","#e8f1ff","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"radius":42,"seed":2},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/sword-slash.js"
