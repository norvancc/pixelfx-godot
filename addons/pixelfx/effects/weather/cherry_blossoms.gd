@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/weather/cherry-blossoms.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.cherry_blossoms","name":"Cherry blossoms","desc":"Pink petals flutter down on a spring breeze, tumbling in little spirals and flashing as they catch the light, with a few whole blossoms spinning among them.","tags":["weather","cherry blossom","sakura","petals","spring","wind","ambient","loop"],"size":[320,180],"origin":[160,170],"duration":10,"loop":true,"fps":30,"bg":"sky","options":{"palette":["#4a1832","#8e3460","#d26a94","#f2a2c0","#ffd2e2","#fff4f8"],"seed":12},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/weather/cherry-blossoms.js"
