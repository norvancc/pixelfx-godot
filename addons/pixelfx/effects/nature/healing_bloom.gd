@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/nature/healing-bloom.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.healing_bloom","name":"Healing bloom","desc":"A sprout pushes up and unfurls, a bud swells and opens round a glowing golden heart in a flare of healing light; its petals lift away one by one as motes.","tags":["nature","heal","flower","plant","buff","ground","one-shot"],"size":[124,120],"origin":[62,108],"duration":3.3,"loop":false,"fps":30,"bg":"ground","options":{"palette":["#0c1a10","#173a1a","#24582a","#357a34","#52a03e","#86c84e","#c4ec7a","#f4ffd0"],"petal":["#4a1a3a","#a8406e","#ec8ab0","#ffd8e8"],"heart":["#a8641a","#f0b42e","#ffe680","#fffbe0"],"seed":4},"cacheable":false,"layers":["back","front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/nature/healing-bloom.js"
