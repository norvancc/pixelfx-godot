@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/eclipse.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.eclipse","name":"Eclipse","desc":"A black moon over the sun: a breathing pearl corona with long streamers, a thin white rim, and one diamond bead blazing on its edge.","tags":["shadow","eclipse","moon","sun","corona","sky","magic","loop"],"size":[160,144],"origin":[80,72],"duration":4,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"pearl":["#5a4f8a","#a99be0","#e6defa","#fffaf2"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/eclipse.js"
