@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/cartoon-pow.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.cartoon_pow","name":"Cartoon POW","desc":"A comic-book hit: a jagged two-tone burst star slams in with a shake and boiling edges, POW! drops in letter by letter, action lines fly, then it all snaps away.","tags":["cartoon","comic","pow","hit","impact","text","one-shot"],"size":[184,144],"origin":[92,72],"duration":1.05,"loop":false,"fps":30,"bg":"dark","options":{"palette":["#1a0e14","#6e1a12","#c8361a","#f47a24","#ffc23c","#fff07a","#ffffff"],"text":"POW!","seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/cartoon-pow.js"
