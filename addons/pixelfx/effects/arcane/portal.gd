@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/arcane/portal.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.portal","name":"Portal","desc":"An upright rift: fibrous spiral arms wind down into the dark, a lit rim wobbles, motes and streaks are pulled in, the floor glows.","tags":["arcane","portal","rift","teleport","magic","ground","loop"],"size":[152,116],"origin":[76,106],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#140a26","#2b1252","#481c88","#6b2cc0","#9a48ec","#c684ff","#ecc8ff","#ffffff"],"width":17,"height":29,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/arcane/portal.js"
