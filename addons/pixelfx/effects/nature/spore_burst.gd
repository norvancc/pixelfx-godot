@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/spore-burst.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.spore_burst","name":"Spore burst","desc":"A toadstool pushes up, swells and trembles as its gills glow, then squashes and puffs a lumpy cloud of glowing spores that billows up and drifts down twinkling.","tags":["nature","mushroom","spores","poison","cloud","ground","one-shot"],"size":[212,132],"origin":[106,118],"duration":3.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#06141c","#0c2a34","#11484e","#17706a","#22a08a","#4cd0a8","#a8f4d0","#f0fff6"],"cap":["#1a0c1e","#3a1438","#62204e","#8e3462","#bc5276","#e88a96"],"stem":["#2a2230","#5a4e5e","#9a8e98","#d8ccd0","#f6eeee"],"seed":9},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/spore-burst.js"
