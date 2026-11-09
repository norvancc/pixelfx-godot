@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/scifi/jetpack.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.jetpack","name":"Jetpack","desc":"Twin thrusters fire straight down: white-hot cores with shock diamonds inside ragged flames, puffs that cool into smoke billowing below, lit by the fire.","tags":["scifi","jetpack","thrust","rocket","fire","smoke","flight","loop"],"size":[96,116],"origin":[48,30],"duration":2,"loop":true,"fps":30,"bg":"dark","options":{"palette":["#2a0e12","#5c1818","#a02818","#e0501a","#ff8a2a","#ffc23d","#fff3a6","#ffffff"],"metal":["#0e0d14","#1e1c27","#312e3e","#4b4759","#6f6a82","#9d98b0"],"length":26,"seed":30},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/scifi/jetpack.js"
