@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/explosions/barrel-explosion.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.barrel_explosion","name":"Barrel explosion","desc":"An explosive barrel shudders, its lid bulging and spitting flame, then blows: a fireball column, staves and the lid flying, burning fuel splashed over the floor.","tags":["explosion","barrel","fire","smoke","debris","ground","one-shot"],"size":[300,240],"origin":[150,204],"duration":5.2,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"],"barrel":["#1c0a0e","#4a1218","#7c1a1e","#b02a26","#d8483a","#f08a70"],"seed":8},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/explosions/barrel-explosion.js"
