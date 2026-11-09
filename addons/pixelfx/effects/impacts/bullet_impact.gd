@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/impacts/bullet-impact.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.bullet_impact","name":"Bullet impact","desc":"A bullet hits a wall on the right: a hot half-star, sparks sprayed back in a cone, a puff of grit, chips that fall and bounce, a pock mark cooling to soot.","tags":["impact","bullet","gun","wall","sparks","debris","directional","one-shot"],"size":[152,100],"origin":[116,84],"duration":1.4,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#4a1712","#c9281f","#f2561d","#ff8a2a","#ffe26b","#fff3a6","#ffffff"],"stone":"#5b5079","height":24,"seed":6},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/impacts/bullet-impact.js"
