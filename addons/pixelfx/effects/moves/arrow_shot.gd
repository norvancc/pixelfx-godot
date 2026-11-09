@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/moves/arrow-shot.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.arrow_shot","name":"Arrow shot","desc":"He raises the bow, draws to his cheek, holds his breath and looses: the string snaps forward, the arrow crosses the floor and thuds home.","tags":["move","bow","arrow","projectile","ranged","one-shot"],"size":[300,74],"origin":[38,66],"duration":1.9,"loop":false,"fps":30,"bg":"ground","actor":2,"options":{"seed":1},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/moves/arrow-shot.js"
