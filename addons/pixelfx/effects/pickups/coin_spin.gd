@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/pickups/coin-spin.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.coin_spin","name":"Coin spin","desc":"A thick gold coin turning on its edge: an embossed star face, a reeded rim showing as it goes edge-on, a flash sweeping the face, bobbing over its shadow.","tags":["pickup","coin","gold","money","loop"],"size":[56,56],"origin":[28,48],"duration":1.6,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#1e1206","#4a2c08","#86520c","#c48412","#f0b424","#ffe066","#fff6c4","#ffffff"],"seed":3},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/pickups/coin-spin.js"
