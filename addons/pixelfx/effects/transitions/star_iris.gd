@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/star-iris.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.star_iris","name":"Star iris","desc":"A five-point star iris spins shut on the middle of the screen, its gold rim lit and its tips twinkling and shedding motes; it closes on a glint and spins open again from a flash.","tags":["transition","screen","iris","star","gold","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":2.2,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#1e1206","#4a2c08","#86520c","#c48412","#f0b424","#ffe066","#fff6c4","#ffffff"],"focus":[160,96]},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/star-iris.js"
