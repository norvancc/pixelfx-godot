@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/void-orb.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.void_orb","name":"Void orb","desc":"A black orb hangs in the air, a pale rim crawling round it; a dark vortex winds into it, motes and streaks are pulled in, and light bends round its edge.","tags":["shadow","void","orb","vortex","dark","magic","loop"],"size":[168,160],"origin":[84,150],"duration":3.2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/void-orb.js"
