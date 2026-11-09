@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/nuke.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.nuke","name":"Nuke","desc":"A blinding white frame, then a fireball lifts on a thin stem into a wide rolling cap that glows from inside; a white skirt flashes and a dust surge sweeps the floor.","tags":["explosion","nuke","mushroom","cloud","big","ground","one-shot"],"size":[400,320],"origin":[200,284],"duration":9,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"dust":"#8a7466","seed":5},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/nuke.js"
