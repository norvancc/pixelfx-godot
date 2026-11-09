@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/coin-drop.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.coin_drop","name":"Coin drop","desc":"An enemy goes up in a soft poof and gold coins spin out of it, bounce with a glint on each hit, settle on the floor, twinkle, and wink out one by one.","tags":["spawn","death","loot","coins","gold","drop","pickup","ground","one-shot"],"size":[160,88],"origin":[80,78],"duration":3,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#2a1606","#5c3208","#9a5a0c","#d48c14","#f5b82a","#ffe066","#fff6c4","#ffffff"],"smoke":["#3a3450","#6c6688","#a8a2c0","#dcd8ea"],"coins":7,"seed":23},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/coin-drop.js"
