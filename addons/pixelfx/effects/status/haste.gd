@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/haste.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.haste","name":"Haste","desc":"Sped up: striped after-images stream out behind, speed lines whip past, dust kicks off the heels and the leading edge catches the wind. Faces right.","tags":["status","haste","speed","fast","buff","directional","loop"],"size":[100,56],"origin":[64,48],"duration":1.2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#4c25ab","#773ae4","#5b6cff","#5eb0ff","#a3dcff","#ccf6ff","#ffffff"],"dust":"#8a8090","seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/haste.js"
