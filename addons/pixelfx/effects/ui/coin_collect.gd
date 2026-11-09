@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/ui/coin-collect.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.coin_collect","name":"Coin collect","desc":"A coin bursts into a fountain of spinning coins that hang, then zip one by one into a HUD counter that pops and ticks up, glints and folds away.","tags":["ui","coins","pickup","reward","hud","counter","one-shot"],"size":[176,116],"origin":[60,102],"duration":2.45,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#2a1405","#5c3008","#9a5a0e","#d48e18","#f5b92c","#ffde5e","#fff4bc","#ffffff"],"count":10,"from":12,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/ui/coin-collect.js"
