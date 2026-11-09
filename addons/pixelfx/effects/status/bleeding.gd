@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/bleeding.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.bleeding","name":"Bleeding","desc":"Bleeding out: beads swell at three wounds, run, let go and fall to spatter into a glossy pool that ripples; each heartbeat spurts a little and flashes the body red.","tags":["status","bleed","blood","dot","debuff","wound","loop"],"size":[60,56],"origin":[30,46],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#350711","#5e0c1b","#931327","#c71e33","#f2384a","#ff8a7a"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/bleeding.js"
