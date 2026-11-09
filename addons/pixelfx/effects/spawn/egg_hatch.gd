@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/spawn/egg-hatch.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.egg_hatch","name":"Egg hatch","desc":"A speckled egg rocks three times, each rock cracking it further with warm light leaking out, then pops: light pours out of the opening and lit shell halves tumble away.","tags":["spawn","egg","hatch","birth","crack","shell","light","ground","one-shot"],"size":[120,96],"origin":[60,84],"duration":3.1,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#1e1826","#4a3e52","#857684","#c4b4ac","#ece0d2","#fffaf0"],"glow":["#ff8a2a","#ffd25a","#fff3c0"],"speckle":"#9a6a52","seed":31},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/spawn/egg-hatch.js"
