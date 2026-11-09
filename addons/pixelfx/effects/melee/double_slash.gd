@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/double-slash.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.double_slash","name":"Double slash","desc":"A down cut, then an up cut that crosses it: the moment the X closes both strokes flash white, the crossing bursts with light and sparks, and a dotted X lingers.","tags":["melee","slash","combo","sword","cross","combat","directional","one-shot"],"size":[164,108],"origin":[44,92],"duration":0.8,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#2a0a22","#5e1238","#a01f4e","#e0386a","#ff86a6","#ffd2dd","#ffffff"],"sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/double-slash.js"
