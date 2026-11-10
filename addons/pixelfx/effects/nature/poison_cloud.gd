@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/poison-cloud.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.poison_cloud","name":"Poison cloud","desc":"A miasma hugging the floor: ragged sheets of gas lit yellow-green from within, fading to violet, creep out in tongues that curl over at their tips; plumes twist up as ribbons.","tags":["nature","poison","gas","cloud","miasma","toxic","area","ground","loop"],"size":[256,100],"origin":[128,86],"duration":4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#0e0816","#24123a","#3e2056","#5a3a62","#6a6a3a","#96aa30","#cce040","#f4ffa0"],"spread":1,"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/poison-cloud.js"
