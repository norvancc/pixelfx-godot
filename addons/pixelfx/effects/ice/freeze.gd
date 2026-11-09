@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ice/freeze.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.freeze","name":"Freeze","desc":"Frost races in and climbs the character, turning it to ice; a faceted block crystallizes round it pane by pane, glints, cracks and bursts, and the character thaws free.","tags":["ice","freeze","frozen","status","crowd-control","one-shot"],"size":[176,128],"origin":[88,108],"duration":4,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#151a3d","#212f6b","#2c58aa","#3a8bd8","#62c8f4","#a6ecff","#dcfbff","#ffffff"],"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ice/freeze.js"
