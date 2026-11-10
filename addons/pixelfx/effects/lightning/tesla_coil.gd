@tool
extends "../../native/effect_adapter.gd"
## Source src/fx/lightning/tesla-coil.js; MIT Patch / Hugo Duprez.
const META = {"id":"pixelfx.tesla_coil","name":"Tesla coil","desc":"A copper coil under a steel torus throws branching arcs that lash out in volleys and now and then strike the floor in a spray of sparks, lighting the metal and the ground.","tags":["lightning","electric","tesla","machine","prop","loop"],"size":[224,136],"origin":[112,120],"duration":2.4,"loop":true,"fps":30,"bg":"ground","options":{"palette":["#120a33","#2a1b78","#4630c0","#5a62f0","#58a6ff","#9ed8ff","#e4f6ff","#ffffff"],"sparks":["#ffffff","#c8f8ff","#7ff3ff","#1ab8e6"],"copper":["#2a120c","#5a2814","#8e4a1e","#c4772f","#eaa65a","#ffd9a0"],"steel":["#0f121c","#1f2433","#353d52","#556078","#7f8ba3","#b8c3d6","#f2f6ff"],"seed":4},"cacheable":false,"layers":["front"],"migration_status":"ported_pending_acceptance"}
func metadata() -> Dictionary: return META
func source_module() -> String: return "fx/lightning/tesla-coil.js"
