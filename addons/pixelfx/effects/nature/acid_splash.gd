@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/acid-splash.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.acid_splash","name":"Acid splash","desc":"A gob of acid bursts into a crown and spatters; it eats a glowing, smoking pit into the floor and boils down into it, spitting bright beads, pale steam curling off.","tags":["nature","acid","poison","splash","liquid","ground","one-shot"],"size":[184,116],"origin":[92,100],"duration":2.8,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0e140a","#1c3010","#2c5214","#457e18","#6aae1c","#a0dc2a","#dcff6a","#f8ffd0"],"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/acid-splash.js"
