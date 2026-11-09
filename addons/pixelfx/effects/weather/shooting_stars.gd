@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/shooting-stars.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.shooting_stars","name":"Shooting stars","desc":"Meteors burn across a starry sky, white heads trailing gold and rose; the big ones flare and break up, and each leaves a glowing train that twists and fades.","tags":["weather","meteor","shooting star","night","sky","stars","ambient","loop"],"size":[320,180],"origin":[160,180],"duration":10,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#3a1e5a","#7a3a8a","#e0607a","#ffa86a","#ffe6a8","#ffffff"],"sky":["#141428","#2a2a4a","#4c4c7c","#8e8ec4","#dcdcff"],"seed":4},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/shooting-stars.js"
