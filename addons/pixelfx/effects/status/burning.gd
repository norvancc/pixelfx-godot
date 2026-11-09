@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/status/burning.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.burning","name":"Burning","desc":"Burning over time: small flames lick from four hot spots, trailing sparks and thin smoke; every 0.6 s they flare, the body flashes white then orange, scorch marks spread.","tags":["status","fire","burn","dot","debuff","loop"],"size":[72,80],"origin":[36,70],"duration":1.2,"loop":true,"fps":30,"bg":"ground","actor":2,"options":{"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"char":["#120c0a","#2a1a14","#4a2c1c"],"smoke":"#5b5566","seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/status/burning.js"
