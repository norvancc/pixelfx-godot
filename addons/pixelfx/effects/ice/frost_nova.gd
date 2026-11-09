@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ice/frost-nova.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.frost_nova","name":"Frost nova","desc":"Frost spirals into a spinning snowflake, then a wave blooms three rings of ice crystals round the caster; snow drifts, frost creeps, and the ice melts back into the floor.","tags":["ice","nova","aoe","frost","magic","one-shot"],"size":[288,192],"origin":[144,150],"duration":3.4,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"reach":104,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ice/frost-nova.js"
