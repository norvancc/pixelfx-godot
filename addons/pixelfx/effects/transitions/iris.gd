@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/iris.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.iris","name":"Iris","desc":"A lit iris closes onto a warm spotlight where dust drifts, holds as its rim twinkles, snaps shut into a glint, then pops open from a flash with a white-hot rim throwing sparks.","tags":["transition","screen","iris","circle","spotlight","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":2.2,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":1,"palette":["#1c140c","#3b2a18","#6e5233","#a8875a","#d9bd8a","#f3e2bd","#fff7e8","#ffffff"],"focus":[160,100]},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/iris.js"
