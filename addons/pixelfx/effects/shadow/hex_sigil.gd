@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/shadow/hex-sigil.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.hex_sigil","name":"Hex sigil","desc":"A burning pen traces a cursed sigil in the air, its glyphs pop in one by one, then it flares white and crumbles into falling embers.","tags":["shadow","hex","sigil","rune","curse","magic","circle","one-shot"],"size":[168,128],"origin":[84,112],"duration":4.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#06040b","#150c26","#2a1150","#461a84","#6f2cc0","#9d5cec","#cfa6ff","#f6eaff"],"seed":7},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/shadow/hex-sigil.js"
