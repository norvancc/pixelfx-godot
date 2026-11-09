@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/falling-leaves.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.falling_leaves","name":"Falling leaves","desc":"Autumn leaves swing down through the air, tilting and flipping to show their pale backs, ride a gust, land flat in the litter and fade.","tags":["weather","leaves","autumn","fall","wind","nature","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":10,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#4a1d0c","#8a3a14","#c8621e","#f0982e","#ffcf72","#fff0c4"],"reds":["#40101a","#7c1c22","#b8302a","#e85a3c","#ff9a72","#ffd8c4"],"golds":["#3e300c","#7a5c14","#b8901e","#e8c23a","#fff09a","#fffbe0"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/falling-leaves.js"
