@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/earth-spike.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "drawSpike", _S.import_value("fx/nature/_lib.js", "drawSpike"))
	_S.define(_e, "spikeLook", _S.import_value("fx/nature/_lib.js", "spikeLook"))
	_S.define(_e, "spikeCrack", _S.import_value("fx/nature/_lib.js", "spikeCrack"))
	_S.define(_e, "floorCrack", _S.import_value("fx/nature/_lib.js", "floorCrack"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Earth spike"}, {"desc": "The floor cracks with light and heaves, a faceted stone spike rams up with two side shards in a burst of chips, grit and dust; rubble rains, then it splits and crumbles."}, {"tags": ["nature", "earth", "stone", "spike", "ground", "attack", "one-shot"]}, {"size": [272, 150]}, {"origin": [136, 132]}, {"duration": 3.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#120c0c", "#251917", "#3b2a24", "#553d31", "#715440", "#8f6e52", "#b8966e", "#e6d0a8"]}, {"glow": ["#4a1a0c", "#a8401a", "#ff8a2a", "#ffd27a", "#fff4d0"]}, {"height": 62}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "UP", 0.34)
	_S.define(_e, "RISE", 0.09)
	_S.define(_e, "CRACK", 1.18)
	_S.define(_e, "SPLIT", 1.5)
	_S.define(_e, "PART", 0.1)
	_S.define(_e, "FALL", 0.42)
	_S.define(_e, "SINK", 0.55)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 6), _S.call_value(_S.read(_e, "hex"), ["#8c8494"]), 0.45]))
	_S.define(_e, "DUST2", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 5), _S.call_value(_S.read(_e, "hex"), ["#6c6474"]), 0.4]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 4), _S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "spikes", [_S.merge([{"x": _S.binary("*", _S.unary("-", _S.read(_e, "H")), 0.17)}, {"H": _S.binary("*", _S.read(_e, "H"), 0.52)}, {"w": _S.binary("*", _S.read(_e, "H"), 0.22)}, {"lean": _S.binary("*", _S.unary("-", _S.read(_e, "H")), _S.invoke(_S.read(_e, "R"), "range", [0.13, 0.18]))}, {"at": _S.binary("+", _S.read(_e, "UP"), 0.045)}, {"split": _S.binary("-", _S.read(_e, "SPLIT"), 0.1)}, {"back": true}]), _S.merge([{"x": _S.binary("*", _S.read(_e, "H"), 0.18)}, {"H": _S.binary("*", _S.read(_e, "H"), 0.4)}, {"w": _S.binary("*", _S.read(_e, "H"), 0.2)}, {"lean": _S.binary("*", _S.read(_e, "H"), _S.invoke(_S.read(_e, "R"), "range", [0.11, 0.15]))}, {"at": _S.binary("+", _S.read(_e, "UP"), 0.085)}, {"split": _S.binary("+", _S.read(_e, "SPLIT"), 0.08)}, {"back": false}]), _S.merge([{"x": 0}, {"H": _S.read(_e, "H")}, {"w": _S.binary("*", _S.read(_e, "H"), 0.36)}, {"lean": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])}, {"at": _S.read(_e, "UP")}, {"split": _S.read(_e, "SPLIT")}, {"back": false}, {"main": true}])])
	for _v0 in _S.array(_S.read(_e, "spikes")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "s", _v0)
		var _v2 = _S.scope(_v1)
		_S.set_prop(_S.read(_v2, "s"), "look", _S.call_value(_S.read(_v2, "spikeLook"), [_S.read(_v2, "R")]), "=", false)
		_S.set_prop(_S.read(_v2, "s"), "cracks", [_S.call_value(_S.read(_v2, "spikeCrack"), [_S.read(_v2, "R"), _S.invoke(_S.read(_v2, "R"), "range", [0.04, 0.16]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.6), _S.unary("-", 0.1)]), 1]), _S.call_value(_S.read(_v2, "spikeCrack"), [_S.read(_v2, "R"), _S.invoke(_S.read(_v2, "R"), "range", [0.22, 0.4]), _S.invoke(_S.read(_v2, "R"), "range", [0.1, 0.6]), _S.unary("-", 1)]), _S.call_value(_S.read(_v2, "spikeCrack"), [_S.read(_v2, "R"), _S.invoke(_S.read(_v2, "R"), "range", [0.42, 0.58]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.4), 0.4]), _S.invoke(_S.read(_v2, "R"), "sign", [])])], "=", false)
		_S.set_prop(_S.read(_v2, "s"), "up", _S.set_prop(_S.read(_v2, "s"), "split0", false, "=", false), "=", false)
		_S.set_prop(_S.read(_v2, "s"), "cut", _S.invoke(_S.read(_v2, "R"), "range", [0.24, 0.32]), "=", false)
		_S.set_prop(_S.read(_v2, "s"), "top", 1, "=", false)
	_S.define(_e, "cracks", [_S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [34, 44])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), 1, _S.invoke(_S.read(_e, "R"), "range", [34, 44])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [14, 20])]), _S.call_value(_S.read(_e, "floorCrack"), [_S.read(_e, "R"), 1, _S.invoke(_S.read(_e, "R"), "range", [14, 20])])])
	_S.define(_e, "slabs", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "rock", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "grown", _S.function_value(_e, "_f4"))
	_S.define(_e, "open", _S.function_value(_e, "_f5"))
	_S.define(_e, "heat", _S.function_value(_e, "_f6"))
	_S.define(_e, "gap", _S.function_value(_e, "_f7"))
	_S.define(_e, "tip", _S.function_value(_e, "_f8"))
	_S.define(_e, "topAt", _S.function_value(_e, "_f9"))
	_S.define(_e, "erupt", _S.function_value(_e, "_f10"))
	_S.define(_e, "crumble", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawShard", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_sd_b0 = _S.arg(_args,0)
	return {"sd":_n_sd_b0,"x":(_n_sd_b0 * _S.invoke(_n_R,"range",[13, 16])),"pts":[[(-1.2), (-0.32)], [1.1, (-0.42)], [1.2, 0.36], [(-1.1), 0.4]],"s":_S.invoke(_n_R,"range",[5.5, 7]),"a":(_n_sd_b0 * _S.invoke(_n_R,"range",[0.45, 0.65]))}
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "bits"), "add", [_S.merge([_S.read(_e, "b"), {"pts": _S.call_value(_S.read(_e, "stoneShape"), [_S.read(_e, "R")])}])])

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_RISE = _S.read(_parent,"RISE")
	var _n_s_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t < _S.named_value(_n_s_b0,"at"))) else _S.invoke(_n_ease,"outBack",[clampf((float((_n_t - _S.named_value(_n_s_b0,"at")))/_n_RISE),0.0,1.0), 2.2]))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	return _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - 0.02))/0.24),0.0,1.0)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_UP = _S.read(_parent,"UP")
	var _n_t = _S.read(_parent,"t")
	return (_S.MathFX.smooth(0,_n_UP,_n_t) if _S.truth((_n_t < _n_UP)) else (1 - _S.MathFX.smooth(_n_UP,(_n_UP + 0.9),_n_t)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_PART = _S.read(_parent,"PART")
	var _n_t = _S.read(_parent,"t")
	var _n_s_b0 = _S.arg(_args,0)
	return (_S.MathFX.smooth(_S.named_value(_n_s_b0,"split"),(_S.named_value(_n_s_b0,"split") + _n_PART),_n_t) * (3 if _S.truth(_S.named_value(_n_s_b0,"main")) else 2))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_PART = _S.read(_parent,"PART")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_t = _S.read(_parent,"t")
	var _n_s_b0 = _S.arg(_args,0)
	return ((_S.MathFX.smooth(_S.named_value(_n_s_b0,"split"),((_S.named_value(_n_s_b0,"split") + _n_PART) + _n_FALL),_n_t) * 0.12) * _S.named_value(_n_s_b0,"H"))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_s_b0 = _S.arg(_args,0)
	return _S.numeric_lerp(1,_S.named_value(_n_s_b0,"cut"),_S.invoke(_n_ease,"inQuad",[clampf((float(((_n_t - _S.named_value(_n_s_b0,"split")) - 0.04))/_n_FALL),0.0,1.0)]))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_lights = _S.read(_parent,"lights")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_R = _S.read(_parent,"R")
	var _n_rock = _S.read(_parent,"rock")
	var _n_B = _S.read(_parent,"B")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_S = _S.read(_parent,"S")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_DUST2 = _S.read(_parent,"DUST2")
	var _n_PF = _S.read(_parent,"PF")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float(_S.named_value(_n_s_b0,"H"))/_n_H)
	_S.invoke(_n_lights,"add",[_S.named_value(_n_s_b0,"x"), ((-_S.named_value(_n_s_b0,"H")) * 0.4), ((30 * _n_k_b1) + 14), _n_WHITE, ((0.5 * _n_k_b1) + 0.1), 0.1])
	_S.invoke(_n_lights,"add",[_S.named_value(_n_s_b0,"x"), (-10), ((60 * _n_k_b1) + 20), _S.index_value(_n_G,2), (0.34 * _n_k_b1), 0.5])
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < (floori((16 * _n_k_b1)+0.5) + 3))):
			var _n_a_b3 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.1), 1.1]))
			var _n_sp_b4 = (_S.invoke(_n_R,"range",[140, 360]) * (0.6 + (0.4 * _n_k_b1)))
			_S.call_value(_n_rock,[{"kind":_S.named_value(_n_B,"CHUNK"),"x":(_S.named_value(_n_s_b0,"x") + _S.invoke(_n_R,"range",[(float((-_S.named_value(_n_s_b0,"w")))/3), (float(_S.named_value(_n_s_b0,"w"))/3)])),"y":(-_S.invoke(_n_R,"range",[1, 6])),"vx":(cos(_n_a_b3) * _n_sp_b4),"vy":(sin(_n_a_b3) * _n_sp_b4),"g":1,"drag":0.35,"bounce":0.32,"life":_S.invoke(_n_R,"range",[1.4, 2.4]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-14), 14]),"s":(_S.invoke(_n_R,"range",[1.6, 3.8]) * (0.6 + (0.4 * _n_k_b1)))}])
			_n_i_b2 += 1.0
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < (floori((55 * _n_k_b1)+0.5) + 10))):
			var _n_u_b6 = _S.invoke(_n_R,"range",[(-1), 1])
			var _n_a_b7 = ((float((-PI))/2) + (_n_u_b6 * 0.9))
			var _n_sp_b8 = (_S.invoke(_n_R,"range",[90, 330]) * (1 - (0.35 * absf(_n_u_b6))))
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), (_S.named_value(_n_s_b0,"x") + ((_n_u_b6 * _S.named_value(_n_s_b0,"w")) * 0.4)), (-1), (cos(_n_a_b7) * _n_sp_b8), (sin(_n_a_b7) * _n_sp_b8), _S.invoke(_n_R,"range",[1, 2]), _S.invoke(_n_R,"pick",[[_S.index_value(_n_S,6), _S.index_value(_n_S,5), _S.index_value(_n_S,4), _S.index_value(_n_S,4), _S.index_value(_n_S,3)]]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.4])) else 1)])
			_n_i_b5 += 1.0
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < (floori((9 * _n_k_b1)+0.5) + 2))):
			var _n_a_b10 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.2), 1.2]))
			var _n_sp_b11 = _S.invoke(_n_R,"range",[160, 380])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _S.named_value(_n_s_b0,"x"), (-_S.invoke(_n_R,"range",[2, 10])), (cos(_n_a_b10) * _n_sp_b11), (sin(_n_a_b10) * _n_sp_b11), _S.invoke(_n_R,"range",[0.15, 0.4])])
			_n_i_b9 += 1.0
	if true:
		var _n_i_b12 = 0
		while _S.truth((_n_i_b12 < (floori((10 * _n_k_b1)+0.5) + 3))):
			var _n_sd_b13 = _S.invoke(_n_R,"sign",[])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_S.named_value(_n_s_b0,"x") + (_n_sd_b13 * _S.invoke(_n_R,"range",[2, 10]))), (-_S.invoke(_n_R,"range",[1, 4])), ((_n_sd_b13 * _S.invoke(_n_R,"range",[50, 170])) * (0.5 + (0.5 * _n_k_b1))), (-_S.invoke(_n_R,"range",[3, 16])), _S.invoke(_n_R,"range",[0.9, 1.6]), (_n_DUST if _S.truth(_S.invoke(_n_R,"chance",[0.5])) else _n_DUST2), (_S.invoke(_n_R,"range",[3, 5.5]) * (0.6 + (0.4 * _n_k_b1))), _S.invoke(_n_R,"range",[0, 0.05]), _S.named_value(_n_PF,"BIG")])
			_n_i_b12 += 1.0
	if true:
		var _n_i_b14 = 0
		while _S.truth((_n_i_b14 < (floori((14 * _n_k_b1)+0.5) + 4))):
			var _n_sd_b15 = _S.invoke(_n_R,"sign",[])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"DUST"), (_S.named_value(_n_s_b0,"x") + (_n_sd_b15 * _S.invoke(_n_R,"range",[0, 8]))), (-_S.invoke(_n_R,"range",[0, 3])), (_n_sd_b15 * _S.invoke(_n_R,"range",[40, 160])), (-_S.invoke(_n_R,"range",[2, 20])), _S.invoke(_n_R,"range",[0.5, 1]), (_n_DUST if _S.truth(_S.invoke(_n_R,"chance",[0.5])) else _n_DUST2), _S.invoke(_n_R,"range",[1.5, 3.2])])
			_n_i_b14 += 1.0
	if true:
		var _n_i_b16 = 0
		while _S.truth((_n_i_b16 < (floori((3 * _n_k_b1)+0.5) + 1))):
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SMOKE"), (_S.named_value(_n_s_b0,"x") + _S.invoke(_n_R,"range",[(-6), 6])), (-_S.invoke(_n_R,"range",[2, 12])), _S.invoke(_n_R,"range",[(-20), 20]), (-_S.invoke(_n_R,"range",[15, 45])), _S.invoke(_n_R,"range",[1, 1.6]), _n_DUST, ((_S.invoke(_n_R,"range",[4, 6]) * _n_k_b1) + 2), _S.invoke(_n_R,"range",[0.02, 0.12]), _S.named_value(_n_PF,"BIG")])
			_n_i_b16 += 1.0
	if _S.truth(_S.named_value(_n_s_b0,"main")):
		if true:
			var _n_i_b17 = 0
			while _S.truth((_n_i_b17 < 3)):
				_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), (_S.named_value(_n_s_b0,"x") + _S.invoke(_n_R,"range",[(-5), 5])), (-_S.invoke(_n_R,"range",[10, (_S.named_value(_n_s_b0,"H") * 0.9)])), 0, (-3), _S.invoke(_n_R,"range",[0.25, 0.5]), _S.index_value(_n_S,7), _S.invoke(_n_R,"range",[1, 2.2]), _S.invoke(_n_R,"range",[0.1, 0.4])])
				_n_i_b17 += 1.0
		if true:
			var _n_i_b18 = 0
			while _S.truth((_n_i_b18 < 14)):
				_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), _S.invoke(_n_R,"range",[(-60), 60]), (-_S.invoke(_n_R,"range",[110, 125])), _S.invoke(_n_R,"range",[(-15), 15]), _S.invoke(_n_R,"range",[10, 60]), _S.invoke(_n_R,"range",[1.2, 1.8]), _S.invoke(_n_R,"pick",[[_S.index_value(_n_S,5), _S.index_value(_n_S,4), _S.index_value(_n_S,3)]]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.35])) else 1), _S.invoke(_n_R,"range",[0.25, 0.9])])
				_n_i_b18 += 1.0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_gap = _S.read(_parent,"gap")
	var _n_tip = _S.read(_parent,"tip")
	var _n_rock = _S.read(_parent,"rock")
	var _n_B = _S.read(_parent,"B")
	var _n_R = _S.read(_parent,"R")
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_S = _S.read(_parent,"S")
	var _n_DUST = _S.read(_parent,"DUST")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_u0_b1 = _S.arg(_args,1)
	var _n_u1_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.call_value(_n_gap,[_n_s_b0])
	var _n_lean_b4 = _S.named_value(_n_s_b0,"lean")
	var _n_tp_b5 = _S.call_value(_n_tip,[_n_s_b0])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_half_b6 = _iter_0
		var _n_u_b7 = (float((_n_u0_b1 + _n_u1_b2))/2)
		var _n_hw_b8 = ((float(_S.named_value(_n_s_b0,"w"))/2) * pow((1 - _n_u_b7),0.85))
		var _n_x_b9 = ((_S.named_value(_n_s_b0,"x") + (_n_lean_b4 * _n_u_b7)) + (_n_half_b6 * (((float(_n_g_b3)/2) + (_n_hw_b8 * 0.45)) + (_n_tp_b5 * _n_u_b7))))
		var _n_y_b10 = ((-_n_u_b7) * _S.named_value(_n_s_b0,"H"))
		if _S.truth(((_n_half_b6 > 0) if _S.truth((_n_hw_b8 < 0.8)) else (_n_hw_b8 < 0.8))):
			continue
		_S.call_value(_n_rock,[{"kind":_S.named_value(_n_B,"CHUNK"),"x":_n_x_b9,"y":_n_y_b10,"vx":((_n_half_b6 * _S.invoke(_n_R,"range",[8, 40])) + (_n_lean_b4 * 0.6)),"vy":(-_S.invoke(_n_R,"range",[0, 50])),"g":1,"drag":0.3,"bounce":0.3,"life":minf(_S.invoke(_n_R,"range",[1.1, 1.6]),((_S.named_value(_n_meta,"duration") - 0.15) - _n_t)),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-8), 8]),"s":clampf((_n_hw_b8 * 0.62),1.6,4.8)}])
		if true:
			var _n_i_b11 = 0
			while _S.truth((_n_i_b11 < 3)):
				_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"GRIT"), (_n_x_b9 + _S.invoke(_n_R,"range",[(-2), 2])), (_n_y_b10 + _S.invoke(_n_R,"range",[(-2), 2])), (_n_half_b6 * _S.invoke(_n_R,"range",[5, 45])), (-_S.invoke(_n_R,"range",[10, 70])), _S.invoke(_n_R,"range",[0.9, 1.6]), _S.invoke(_n_R,"pick",[[_S.index_value(_n_S,6), _S.index_value(_n_S,5), _S.index_value(_n_S,4), _S.index_value(_n_S,3)]]), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.35])) else 1)])
				_n_i_b11 += 1.0
	if _S.truth(_S.invoke(_n_R,"chance",[0.5])):
		_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"DUST"), ((_S.named_value(_n_s_b0,"x") + (_n_lean_b4 * _n_u1_b2)) + _S.invoke(_n_R,"range",[(-4), 4])), ((-_n_u1_b2) * _S.named_value(_n_s_b0,"H")), (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[15, 45])), _S.invoke(_n_R,"range",[20, 60]), _S.invoke(_n_R,"range",[0.35, 0.6]), _n_DUST, _S.invoke(_n_R,"range",[2, 3.5])])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_grown = _S.read(_parent,"grown")
	var _n_t = _S.read(_parent,"t")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_S = _S.read(_parent,"S")
	var _n_G = _S.read(_parent,"G")
	var _n_drawSpike = _S.read(_parent,"drawSpike")
	var _n_topAt = _S.read(_parent,"topAt")
	var _n_gap = _S.read(_parent,"gap")
	var _n_tip = _S.read(_parent,"tip")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.call_value(_n_grown,[_n_s_b1])
	if _S.truth((_n_g_b2 <= 0)):
		return null
	if _S.truth((_n_t < _S.named_value(_n_s_b1,"split"))):
		var _n_white_b7 = (((_n_t - _S.named_value(_n_s_b1,"at")) < 0.04) if _S.truth(((_n_t - _S.named_value(_n_s_b1,"at")) < 0.04)) else (_n_t > (_S.named_value(_n_s_b1,"split") - 0.045)))
		var _n_crack_b8 = _S.MathFX.smooth((_n_CRACK + (0 if _S.truth(_S.named_value(_n_s_b1,"main")) else 0.05)),(_S.named_value(_n_s_b1,"split") - 0.03),_n_t)
		var _n_sw_b9 = (((_n_t - _S.named_value(_n_s_b1,"at")) * 0.9) - 0.15)
		var _n_glint_b10 = ((float(fmod(_n_sw_b9,1.2))/0.55) if _S.truth(((fmod(_n_sw_b9,1.2) < 0.55) if _S.truth((_n_sw_b9 > 0)) else (_n_sw_b9 > 0))) else (-1))
		_S.call_value(_n_drawSpike,[_n_p_b0, _S.named_value(_n_s_b1,"x"), 0, (_S.named_value(_n_s_b1,"H") * _n_g_b2), _S.named_value(_n_s_b1,"w"), (_S.named_value(_n_s_b1,"lean") * minf(1,_n_g_b2)), _S.named_value(_n_s_b1,"look"), _n_S, {"white":_n_white_b7,"glint":_n_glint_b10,"cracks":_S.named_value(_n_s_b1,"cracks"),"crack":_n_crack_b8,"heat":_S.MathFX.smooth(_n_CRACK,_S.named_value(_n_s_b1,"split"),_n_t),"glowRamp":_n_G}])
		return null
	var _n_top_b3 = _S.call_value(_n_topAt,[_n_s_b1])
	var _n_gp_b4 = _S.call_value(_n_gap,[_n_s_b1])
	var _n_tp_b5 = _S.call_value(_n_tip,[_n_s_b1])
	var _n_sink_b6 = ((_S.MathFX.smooth((_S.named_value(_n_s_b1,"split") + _n_FALL),((_S.named_value(_n_s_b1,"split") + _n_FALL) + _n_SINK),_n_t) * _S.named_value(_n_s_b1,"H")) * (_S.named_value(_n_s_b1,"cut") + 0.06))
	if _S.truth((_n_sink_b6 >= (_S.named_value(_n_s_b1,"H") * (_S.named_value(_n_s_b1,"cut") + 0.05)))):
		return null
	for _iter_0 in _S.array([(-1), 1]):
		var _n_half_b11 = _iter_0
		_S.call_value(_n_drawSpike,[_n_p_b0, (_S.named_value(_n_s_b1,"x") + (float((_n_half_b11 * _n_gp_b4))/2)), _n_sink_b6, _S.named_value(_n_s_b1,"H"), _S.named_value(_n_s_b1,"w"), (_S.named_value(_n_s_b1,"lean") + (_n_half_b11 * _n_tp_b5)), _S.named_value(_n_s_b1,"look"), _n_S, {"half":_n_half_b11,"clip":_n_top_b3,"floor":0,"cracks":_S.named_value(_n_s_b1,"cracks"),"crack":1,"heat":(1 - _S.MathFX.smooth(_S.named_value(_n_s_b1,"split"),(_S.named_value(_n_s_b1,"split") + 0.45),_n_t)),"glowRamp":_n_G}])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "UP"))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "L", _S.call_value(_S.read(_v24, "open"), []))
		for _v25 in _S.array(_S.read(_v24, "cracks")):
			var _v26 = _S.scope(_v24)
			_S.define(_v26, "c", _v25)
			if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [_S.binary("*", 0.35, _S.read(_v26, "f"))])):
				var _v27 = _S.scope(_v26)
				_S.define(_v27, "q", _S.prop(_S.read(_v27, "c"), _S.invoke(_S.read(_v27, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v27, "c"), "length"), 1), _S.invoke(_S.read(_v27, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "L")]), _S.prop(_S.read(_v27, "c"), "length"))])])))
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "GRIT"), _S.prop(_S.read(_v27, "q"), 0), _S.unary("-", 1), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [30, 110])), _S.invoke(_S.read(_v27, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v27, "R"), "pick", [[_S.prop(_S.read(_v27, "S"), 5), _S.prop(_S.read(_v27, "S"), 4)]]), 1])
				if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.25])):
					_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "DUST"), _S.prop(_S.read(_v27, "q"), 0), _S.unary("-", 1), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [4, 14])), _S.invoke(_S.read(_v27, "R"), "range", [0.3, 0.6]), _S.read(_v27, "DUST2"), _S.invoke(_S.read(_v27, "R"), "range", [1.5, 3])])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v24, "t"), 0.12), func(): return _S.invoke(_S.read(_v24, "R"), "chance", [_S.binary("*", 0.2, _S.read(_v24, "f"))]))):
			_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "DUST"), _S.binary("*", _S.invoke(_S.read(_v24, "R"), "sign", []), _S.invoke(_S.read(_v24, "R"), "range", [10, 16])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 4])), _S.binary("*", _S.invoke(_S.read(_v24, "R"), "sign", []), _S.invoke(_S.read(_v24, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [4, 12])), _S.invoke(_S.read(_v24, "R"), "range", [0.4, 0.7]), _S.read(_v24, "DUST2"), _S.invoke(_S.read(_v24, "R"), "range", [2, 3.5])])
	for _v28 in _S.array(_S.read(_e, "spikes")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "s", _v28)
		var _v30 = _S.scope(_v29)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v30, "s"), "up")), func(): return _S.binary(">=", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "at")))):
			_S.last([_S.set_prop(_S.read(_v30, "s"), "up", true, "=", false), _S.call_value(_S.read(_v30, "erupt"), [_S.read(_v30, "s")])])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v30, "s"), "split0")), func(): return _S.binary(">=", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split")))):
			var _v31 = _S.scope(_v30)
			_S.set_prop(_S.read(_v31, "s"), "split0", true, "=", false)
			_S.invoke(_S.read(_v31, "lights"), "add", [_S.prop(_S.read(_v31, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v31, "s"), "H")), 0.5), 30, _S.read(_v31, "WHITE"), 0.3, 0.08])
			_S.invoke(_S.read(_v31, "ps"), "spawn", [_S.prop(_S.read(_v31, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v31, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v31, "s"), "lean"), 0.5)), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v31, "s"), "H")), 0.55), 0, _S.unary("-", 2), 0.3, _S.prop(_S.read(_v31, "S"), 7), 2.5])
		if _S.truth(_S.binary(">=", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split"))):
			var _v32 = _S.scope(_v30)
			_S.define(_v32, "top", _S.call_value(_S.read(_v32, "topAt"), [_S.read(_v32, "s")]))
			while _S.truth(_S.logical("||", _S.binary(">", _S.binary("-", _S.prop(_S.read(_v32, "s"), "top"), _S.read(_v32, "top")), 0.045), func(): return _S.logical("&&", _S.binary("<=", _S.read(_v32, "top"), _S.binary("+", _S.prop(_S.read(_v32, "s"), "cut"), 0.000001)), func(): return _S.binary(">", _S.prop(_S.read(_v32, "s"), "top"), _S.binary("+", _S.prop(_S.read(_v32, "s"), "cut"), 0.000001))))):
				var _v33 = _S.scope(_v32)
				_S.define(_v33, "u1", _S.prop(_S.read(_v33, "s"), "top"))
				_S.define(_v33, "u0", _S.invoke(_S.read(_v33, "Math"), "max", [_S.read(_v33, "top"), _S.binary("-", _S.prop(_S.read(_v33, "s"), "top"), 0.11)]))
				_S.call_value(_S.read(_v33, "crumble"), [_S.read(_v33, "s"), _S.read(_v33, "u0"), _S.read(_v33, "u1")])
				_S.set_prop(_S.read(_v33, "s"), "top", _S.read(_v33, "u0"), "=", false)
				if _S.truth(_S.binary("<=", _S.read(_v33, "u0"), _S.binary("+", _S.prop(_S.read(_v33, "s"), "cut"), 0.000001))):
					break
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split")), func(): return _S.binary(">", _S.read(_v30, "t"), _S.read(_v30, "CRACK"))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.12, _S.read(_v30, "f"))]))):
			var _v34 = _S.scope(_v30)
			_S.define(_v34, "u", _S.invoke(_S.read(_v34, "R"), "range", [0.1, 0.7]))
			_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "GRIT"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v34, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v34, "s"), "lean"), _S.read(_v34, "u"))), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.unary("-", _S.read(_v34, "u")), _S.prop(_S.read(_v34, "s"), "H")), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [0, 20])), _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v34, "R"), "pick", [[_S.prop(_S.read(_v34, "S"), 5), _S.prop(_S.read(_v34, "S"), 4)]]), 1])
			if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.3])):
				_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v34, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v34, "s"), "lean"), _S.read(_v34, "u"))), _S.binary("*", _S.unary("-", _S.read(_v34, "u")), _S.prop(_S.read(_v34, "s"), "H")), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [2, 8])), _S.invoke(_S.read(_v34, "R"), "range", [0.4, 0.7]), _S.read(_v34, "DUST"), _S.invoke(_S.read(_v34, "R"), "range", [1.5, 2.5])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v30, "s"), "up"), func(): return _S.binary("<", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split"))), func(): return _S.binary(">", _S.read(_v30, "t"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "at"), 0.2))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.05, _S.read(_v30, "f"))]))):
			var _v35 = _S.scope(_v30)
			_S.define(_v35, "u", _S.invoke(_S.read(_v35, "R"), "range", [0.2, 0.8]))
			_S.define(_v35, "sd", _S.invoke(_S.read(_v35, "R"), "sign", []))
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "GRIT"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v35, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v35, "s"), "lean"), _S.read(_v35, "u"))), _S.binary("*", _S.binary("*", _S.read(_v35, "sd"), _S.binary("/", _S.prop(_S.read(_v35, "s"), "w"), 2)), _S.binary("-", 1, _S.read(_v35, "u")))), _S.binary("*", _S.unary("-", _S.read(_v35, "u")), _S.prop(_S.read(_v35, "s"), "H")), _S.binary("*", _S.read(_v35, "sd"), _S.invoke(_S.read(_v35, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [0, 15])), _S.invoke(_S.read(_v35, "R"), "range", [0.7, 1.2]), _S.invoke(_S.read(_v35, "R"), "pick", [[_S.prop(_S.read(_v35, "S"), 6), _S.prop(_S.read(_v35, "S"), 5)]]), 1])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v30, "s"), "main"), func(): return _S.prop(_S.read(_v30, "s"), "up")), func(): return _S.binary("<", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "s"), "split"))), func(): return _S.binary(">", _S.read(_v30, "t"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "at"), 0.25))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.03, _S.read(_v30, "f"))]))):
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "x"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 4), 2])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [8, _S.binary("*", _S.prop(_S.read(_v30, "s"), "H"), 0.85)])), 0, _S.unary("-", 2), _S.invoke(_S.read(_v30, "R"), "range", [0.25, 0.45]), (_S.prop(_S.read(_v30, "S"), 7) if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else _S.prop(_S.read(_v30, "G"), 3)), _S.invoke(_S.read(_v30, "R"), "range", [0.8, 2])])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v30, "t"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "split"), _S.read(_v30, "FALL"))), func(): return _S.binary("<", _S.read(_v30, "t"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v30, "s"), "split"), _S.read(_v30, "FALL")), _S.binary("*", _S.read(_v30, "SINK"), 0.8)))), func(): return _S.invoke(_S.read(_v30, "R"), "chance", [_S.binary("*", 0.15, _S.read(_v30, "f"))]))):
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v30, "s"), "x"), _S.invoke(_S.read(_v30, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v30, "s"), "w")), 2), _S.binary("/", _S.prop(_S.read(_v30, "s"), "w"), 2)])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [0, 2])), _S.binary("*", _S.invoke(_S.read(_v30, "R"), "sign", []), _S.invoke(_S.read(_v30, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [0, 5])), _S.invoke(_S.read(_v30, "R"), "range", [0.4, 0.7]), _S.read(_v30, "DUST2"), _S.invoke(_S.read(_v30, "R"), "range", [1.5, 3])])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v36 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "b", _v36)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v37, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v37, "b"), "dusted")))):
			var _v38 = _S.scope(_v37)
			_S.set_prop(_S.read(_v38, "b"), "dusted", true, "=", false)
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v39, "i"), 2)):
				_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v39, "b"), "x"), _S.invoke(_S.read(_v39, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v39, "R"), "sign", []), _S.invoke(_S.read(_v39, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v39, "R"), "range", [2, 14])), _S.invoke(_S.read(_v39, "R"), "range", [0.3, 0.6]), _S.read(_v39, "DUST2"), _S.invoke(_S.read(_v39, "R"), "range", [1.3, 2.6])])
				_v39 = _S.iteration(_v39)
				_S.write(_v39, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_open = _S.read(_parent,"open")
	var _n_heat = _S.read(_parent,"heat")
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_G = _S.read(_parent,"G")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_ps = _S.read(_parent,"ps")
	var _n_drawShard = _S.read(_parent,"drawShard")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.call_value(_n_open,[])
	var _n_hk_b2 = _S.call_value(_n_heat,[])
	var _n_fade_b3 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 1.1),(_S.named_value(_n_meta,"duration") - 0.3),_n_t))
	for _iter_0 in _S.array(_n_cracks):
		var _n_c_b4 = _iter_0
		var _n_m_b5 = maxf(2,ceili((_S.prop(_n_c_b4,"length") * _n_L_b1)))
		if true:
			var _n_k_b6 = 1
			while _S.truth((_n_k_b6 < _n_m_b5)):
				var _tuple_1 = _S.index_value(_n_c_b4,(_n_k_b6 - 1))
				var _n_x0_b7 = _S.prop(_tuple_1,0)
				var _n_y0_b8 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_n_c_b4,_n_k_b6)
				var _n_x1_b9 = _S.prop(_tuple_2,0)
				var _n_y1_b10 = _S.prop(_tuple_2,1)
				_S.invoke(_n_p_b0,"line",[_n_x0_b7, (_n_y0_b8 + 1), _n_x1_b9, (_n_y1_b10 + 1), _S.index_value(_n_S,0), _n_fade_b3])
				_S.invoke(_n_p_b0,"line",[_n_x0_b7, _n_y0_b8, _n_x1_b9, _n_y1_b10, (_S.index_value(_n_G,4) if _S.truth((_n_hk_b2 > 0.65)) else (_S.index_value(_n_G,3) if _S.truth((_n_hk_b2 > 0.35)) else (_S.index_value(_n_G,2) if _S.truth((_n_hk_b2 > 0.12)) else (_S.index_value(_n_G,1) if _S.truth((_n_hk_b2 > 0.03)) else _S.index_value(_n_S,1))))), _n_fade_b3])
				if _S.truth(_S.binary("===",fmod(_n_k_b6,2),0)):
					_S.invoke(_n_p_b0,"glow",[_n_x1_b9, _n_y1_b10, 6, _S.index_value(_n_G,2), (0.3 * _n_hk_b2)])
				_n_k_b6 += 1.0
	if _S.truth((_n_hk_b2 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-3), 26, _S.index_value(_n_G,2), (0.35 * _n_hk_b2)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	for _iter_3 in _S.array(_n_spikes):
		var _n_s_b11 = _iter_3
		if _S.truth(_S.named_value(_n_s_b11,"back")):
			_S.call_value(_n_drawShard,[_n_p_b0, _n_s_b11])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_UP = _S.read(_parent,"UP")
	var _n_SPLIT = _S.read(_parent,"SPLIT")
	var _n_FALL = _S.read(_parent,"FALL")
	var _n_SINK = _S.read(_parent,"SINK")
	var _n_ease = _S.read(_parent,"ease")
	var _n_S = _S.read(_parent,"S")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_slabs = _S.read(_parent,"slabs")
	var _n_drawShard = _S.read(_parent,"drawShard")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_G = _S.read(_parent,"G")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_RISE = _S.read(_parent,"RISE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < (_n_UP + 0.02))):
		var _n_k_b5 = _S.MathFX.smooth(0.06,_n_UP,_n_t)
		var _n_hm_b6 = (8 * _n_k_b5)
		var _n_jx_b7 = ((sin((_n_t * 95)) * 0.8) * _n_k_b5)
		if _S.truth((_n_hm_b6 > 0.6)):
			_S.invoke(_n_p_b0,"shade",[(-16), ((-_n_hm_b6) - 1), 16, 1, _S.function_value(_S.capture(_parent,{"jx":_n_jx_b7,"hm":_n_hm_b6,"this":_this}),"_f16")])
	if _S.truth((_n_t >= _n_UP)):
		var _n_sink_b8 = (_S.MathFX.smooth((_n_SPLIT + _n_FALL),((_n_SPLIT + _n_FALL) + _n_SINK),_n_t) * 7)
		var _n_a_b9 = (1 - _S.MathFX.smooth((_n_SPLIT + _n_FALL),((_n_SPLIT + _n_FALL) + _n_SINK),_n_t))
		for _iter_0 in _S.array(_n_slabs):
			var _n_sl_b10 = _iter_0
			var _n_g_b11 = _S.invoke(_n_ease,"outBack",[clampf((float((_n_t - _n_UP))/0.1),0.0,1.0), 2])
			if _S.truth((_n_a_b9 > 0)):
				_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_sl_b10,"x"), ((-1.5) + _n_sink_b8), (_S.named_value(_n_sl_b10,"s") * minf(1,_n_g_b11)), (_S.named_value(_n_sl_b10,"a") * _n_g_b11), _S.named_value(_n_sl_b10,"pts"), _n_S, _n_a_b9, ((_n_t - _n_UP) < 0.04)])
	for _iter_1 in _S.array(_n_spikes):
		var _n_s_b12 = _iter_1
		if _S.truth(not _S.truth(_S.named_value(_n_s_b12,"back"))):
			_S.call_value(_n_drawShard,[_n_p_b0, _n_s_b12])
	var _n_m0_b1 = _S.index_value(_n_spikes,2)
	var _n_leak_b2 = (_S.MathFX.smooth(_n_CRACK,_n_SPLIT,_n_t) * (1 - _S.MathFX.smooth(_n_SPLIT,(_n_SPLIT + 0.5),_n_t)))
	if _S.truth((_n_leak_b2 > 0)):
		_S.invoke(_n_p_b0,"glowLine",[_S.named_value(_n_m0_b1,"x"), (-4), (_S.named_value(_n_m0_b1,"x") + (_S.named_value(_n_m0_b1,"lean") * 0.6)), ((-_S.named_value(_n_m0_b1,"H")) * 0.6), 20, _S.index_value(_n_G,2), (0.22 * _n_leak_b2)])
	for _iter_2 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b13 = _iter_2
		_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_b_b13,"x"), _S.named_value(_n_b_b13,"y"), _S.named_value(_n_b_b13,"s"), _S.named_value(_n_b_b13,"a"), _S.named_value(_n_b_b13,"pts"), _n_S, minf(1,(float(_S.named_value(_n_b_b13,"life"))/0.4))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	var _n_m_b3 = _S.index_value(_n_spikes,2)
	var _n_e_b4 = (_n_t - _S.named_value(_n_m_b3,"at"))
	if _S.truth(((_n_e_b4 < 0.2) if _S.truth((_n_e_b4 > 0)) else (_n_e_b4 > 0))):
		var _n_g_b14 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_e_b4)/_n_RISE),0.0,1.0), 2.2])
		_S.call_value(_n_sparkle,[_n_p_b0, (_S.named_value(_n_m_b3,"x") + _S.named_value(_n_m_b3,"lean")), ((-_S.named_value(_n_m_b3,"H")) * _n_g_b14), (10 * (1 - (float(_n_e_b4)/0.2))), _S.index_value(_n_S,7), _S.index_value(_n_G,3), 0.5])
		_S.invoke(_n_p_b0,"glowLine",[_S.named_value(_n_m_b3,"x"), 0, (_S.named_value(_n_m_b3,"x") + _S.named_value(_n_m_b3,"lean")), ((-_S.named_value(_n_m_b3,"H")) * _n_g_b14), 10, _S.index_value(_n_G,3), (0.3 * (1 - (float(_n_e_b4)/0.2)))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_jx = _S.read(_parent,"jx")
	var _n_hm = _S.read(_parent,"hm")
	var _n_S = _S.read(_parent,"S")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_x_b0 - _n_jx))/15)
	var _n_dy_b4 = (float(_n_y_b1)/_n_hm)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth(((_n_y_b1 > 0.5) if _S.truth((_n_y_b1 > 0.5)) else (_n_d_b5 > 1.18))):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_S,0) if _S.truth((_n_d_b5 > 1)) else (_S.index_value(_n_S,6) if _S.truth((_n_dy_b4 < (-0.72))) else (_S.index_value(_n_S,5) if _S.truth((_n_dx_b3 < (-0.3))) else (_S.index_value(_n_S,3) if _S.truth((_n_dx_b3 > 0.35)) else _S.index_value(_n_S,4))))),"=")
	return null
