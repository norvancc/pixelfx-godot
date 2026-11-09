@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/melee/uppercut.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.uppercut","name":"Uppercut","desc":"A crescent rises from the floor past the face, and at the top a comic impact star bursts: bold outline, hot core, burst lines, twinkles and sparks.","tags":["melee","uppercut","punch","rising","launcher","comic","combat","directional","one-shot"],"size":[132,128],"origin":[48,110],"duration":0.85,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#3a1408","#7a2a10","#c4501a","#f08a2a","#ffc94a","#fff2a8","#ffffff"],"outline":"#2a0a08","sparks":["#fff3a6","#ffe26b","#ff8a2a","#f2561d"],"seed":11},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/melee/uppercut.js"
