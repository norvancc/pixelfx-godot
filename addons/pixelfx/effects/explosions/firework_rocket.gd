@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/firework-rocket.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.firework_rocket","name":"Firework rocket","desc":"A rocket fizzes off the ground on a sparkling gold trail, coasts, and bursts into a palm: heavy gold fronds arc out, droop on glittering trails and crackle at the tips.","tags":["firework","rocket","celebration","sparkle","sky","one-shot"],"size":[300,300],"origin":[150,288],"duration":3.8,"loop":false,"fps":30,"bg":"sky","options":{"palette":["#2a1406","#6a3a0c","#b8701a","#f0a830","#ffd860","#fff2b0","#ffffff"],"tips":["#0c2a3a","#1a5a78","#36a2c8","#7cd8f0","#c8f4ff","#ffffff"],"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/firework-rocket.js"
