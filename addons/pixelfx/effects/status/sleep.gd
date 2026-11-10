@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/sleep.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.sleep","name":"Sleep","desc":"Fast asleep: eyes shut, soft outlined Zs float up off the head one after another, swaying and growing as they rise, dream motes drift, a slow breathing glow.","tags":["status","sleep","zzz","rest","debuff","loop"],"size":[60,82],"origin":[26,74],"duration":2.4,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#1a1636","#3c3a7a","#6f78c8","#a9b8f0","#dfe6ff","#ffffff"],"seed":3},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/sleep.js"
