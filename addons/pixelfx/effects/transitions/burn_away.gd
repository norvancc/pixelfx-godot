@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/transitions/burn-away.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.burn_away","name":"Burn away","desc":"The screen burns in from its edges behind a ragged ember line of licking flames, embers and smoke; then the black smoulders and burns open from the middle.","tags":["transition","screen","burn","fire","embers","smoke","wipe","one-shot"],"size":[320,180],"origin":[0,0],"duration":3,"loop":false,"fps":30,"bg":"sky","options":{"color":"#0b0a10","seed":3,"palette":["#4a1712","#8a1f17","#c9281f","#f2561d","#ff8a2a","#ffc23d","#ffe26b","#fff3a6","#ffffff"]},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/transitions/burn-away.js"
