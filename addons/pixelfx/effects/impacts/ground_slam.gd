@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/ground-slam.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.ground_slam","name":"Ground slam","desc":"Something lands hard: the floor flashes and cracks, two crescent shock waves race out along it, a dust wave and a tall dust cloud rise, rocks erupt, bounce and settle.","tags":["impact","ground","slam","shockwave","quake","rocks","dust","one-shot"],"size":[288,208],"origin":[144,164],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#2a1712","#5e2c1c","#a4502a","#e8893a","#ffc764","#fff0b4","#ffffff"],"stone":"#4a3f69","reach":104,"seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/ground-slam.js"
