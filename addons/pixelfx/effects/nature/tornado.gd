@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/tornado.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.tornado","name":"Tornado","desc":"A snaking funnel of spinning wind bands under a flared, churning top that flickers with lightning; leaves and debris whirl round it front and back, dust boils at its foot.","tags":["nature","wind","tornado","storm","hazard","ground","loop"],"size":[196,168],"origin":[98,152],"duration":2,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#141221","#231f33","#36314a","#4d4762","#68617d","#8a839e","#b3adc4","#e2def0"],"dust":["#2a2018","#4e3e2e","#76624a","#a08a6a","#cbb894"],"leaves":["#4a200c","#a8541c","#e8962e","#ffd27a","#123818","#2f7a2a","#6cb83a","#c8f070"],"height":112,"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/tornado.js"
