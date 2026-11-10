@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/icicle-fall.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "Panes", _S.import_value("fx/ice/_lib.js", "Panes"))
	_S.define(_e, "splitPoly", _S.import_value("fx/ice/_lib.js", "splitPoly"))
	_S.define(_e, "centroid", _S.import_value("fx/ice/_lib.js", "centroid"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "icicle", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Icicle fall"}, {"desc": "An icicle drips and trembles, snaps off its frosted root, drops, stabs the floor and bursts into skidding shards, splinters and rolling frost."}, {"tags": ["ice", "icicle", "fall", "trap", "shatter", "one-shot"]}, {"size": [152, 120]}, {"origin": [76, 100]}, {"duration": 2.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "ROOT", _S.unary("-", 80))
	_S.define(_e, "LEN", 36)
	_S.define(_e, "W", 12)
	_S.define(_e, "DRIP", 0.16)
	_S.define(_e, "TREMBLE", 0.3)
	_S.define(_e, "SNAP", 0.6)
	_S.define(_e, "FREE", _S.binary("+", _S.read(_e, "SNAP"), 0.04))
	_S.define(_e, "FALL_T", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.binary("*", 2, _S.binary("-", _S.unary("-", _S.read(_e, "ROOT")), _S.read(_e, "LEN"))), _S.read(_e, "GRAVITY"))]))
	_S.define(_e, "IMPACT", _S.binary("+", _S.read(_e, "FREE"), _S.read(_e, "FALL_T")))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_top_b3 = _S.arg(_args,3)
	var _n_len_b4 = _S.arg(_args,4)
	var _n_w_b5 = _S.arg(_args,5)
	var _n_opts_b6 = _S.coalesce(_S.arg(_args,6),func():return {})
	var _n_hw_b7 = _S.function_value(_S.capture(_parent,{"w":_n_w_b5,"this":_this}),"_f1")
	var _n_tilt_b8 = (_S.named_value(_n_opts_b6,"tilt") if _S.named_value(_n_opts_b6,"tilt")!=null else 0)
	var _n_cut_b9 = (_S.named_value(_n_opts_b6,"cut") if _S.named_value(_n_opts_b6,"cut")!=null else 0)
	_S.invoke(_n_p_b0,"shade",[((_n_x_b2 - (float(_n_w_b5)/2)) - 4), (_n_top_b3 - 1), (((_n_x_b2 + (float(_n_w_b5)/2)) + 4) + (absf(_n_tilt_b8) * _n_len_b4)), ((_n_top_b3 + _n_len_b4) + 1), _S.function_value(_S.capture(_parent,{"top":_n_top_b3,"len":_n_len_b4,"x":_n_x_b2,"tilt":_n_tilt_b8,"cut":_n_cut_b9,"hw":_n_hw_b7,"C":_n_C_b1,"opts":_n_opts_b6,"this":_this}),"_f2")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_u_b0 = _S.arg(_args,0)
	return (((((float(_n_w)/2) * pow((1 - _n_u_b0),0.75)) * (1 + (0.14 * sin(((_n_u_b0 * 13) + 0.5))))) * (1.15 if _S.truth((_n_u_b0 < 0.08)) else 1)) + 0.3)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_len = _S.read(_parent,"len")
	var _n_x = _S.read(_parent,"x")
	var _n_tilt = _S.read(_parent,"tilt")
	var _n_cut = _S.read(_parent,"cut")
	var _n_hw = _S.read(_parent,"hw")
	var _n_C = _S.read(_parent,"C")
	var _n_opts = _S.read(_parent,"opts")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float((_n_py_b1 - _n_top))/_n_len)
	var _n_cx_b4 = ((_n_x + ((_n_tilt * _n_len) * _n_u_b3)) + (0.7 * sin(((_n_u_b3 * 6) + 1))))
	var _n_s_b5 = (_n_px_b0 - _n_cx_b4)
	if _S.truth(((_n_u_b3 < _n_cut) if _S.truth((_n_u_b3 < _n_cut)) else (_n_u_b3 > 1))):
		return null
	var _n_h_b6 = _S.call_value(_n_hw,[_n_u_b3])
	if _S.truth((absf(_n_s_b5) > (_n_h_b6 + 1))):
		return null
	if _S.truth((absf(_n_s_b5) > _n_h_b6)):
		_S.set_prop(_n_o_b2,"c",_S.index_value(_n_C,1),"=")
		return null
	if _S.truth(_S.named_value(_n_opts,"white")):
		return _S.set_prop(_n_o_b2,"c",_n_WHITE,"=")
	var _n_q_b7 = (float(_n_s_b5)/_n_h_b6)
	var _n_ring_b8 = (sin(((_n_u_b3 * 13) + 0.5)) > 0.7)
	var _n_c_b9 = (_n_WHITE if _S.truth((_n_u_b3 > 0.88)) else (_S.index_value(_n_C,6) if _S.truth((_n_q_b7 < (-0.72))) else ((_S.index_value(_n_C,7) if _S.truth(_n_ring_b8) else _S.index_value(_n_C,5)) if _S.truth((_n_q_b7 < (-0.2))) else ((_S.index_value(_n_C,7) if _S.truth((_n_u_b3 < 0.72)) else _S.index_value(_n_C,6)) if _S.truth((_n_q_b7 < 0.18)) else (_S.index_value(_n_C,2) if _S.truth((_n_q_b7 > 0.8)) else (_S.index_value(_n_C,5) if _S.truth(_S.logical("&&",_S.logical("&&",(absf((_n_q_b7 - 0.45)) < 0.1),func():return (_n_u_b3 > 0.15)),func():return (_n_u_b3 < 0.6))) else (_S.index_value(_n_C,4) if _S.truth((_n_q_b7 < 0.6)) else _S.index_value(_n_C,3))))))))
	if _S.truth(((absf((_n_u_b3 - _S.named_value(_n_opts,"glint"))) < 0.06) if _S.truth(((_n_q_b7 < 0.25) if _S.truth((_S.named_value(_n_opts,"glint") >= 0)) else (_S.named_value(_n_opts,"glint") >= 0))) else ((_n_q_b7 < 0.25) if _S.truth((_S.named_value(_n_opts,"glint") >= 0)) else (_S.named_value(_n_opts,"glint") >= 0)))):
		_n_c_b9 = _n_WHITE
	_S.set_prop(_n_o_b2,"c",_n_c_b9,"=")
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "splinter", _S.function_value(_e, "_f5"))
	_S.define(_e, "panes", _S.construct(_S.read(_e, "Panes"), [_S.merge([{"ground": _S.read(_e, "floor")}, {"onLand": _S.function_value(_e, "_f6")}, {"onCrumble": _S.function_value(_e, "_f7")}])]))
	_S.define(_e, "rime", [])
	var _v2 = _S.scope(_e)
	_S.define(_v2, "x", _S.unary("-", 18))
	while _S.truth(_S.binary("<=", _S.read(_v2, "x"), 18)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "h", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "x"), _S.prop(_S.read(_v3, "o"), "seed"), 2]))
		_S.define(_v3, "d", _S.binary("/", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]), 18))
		_S.invoke(_S.read(_v3, "rime"), "push", [_S.merge([{"x": _S.read(_v3, "x")}, {"h": _S.binary("+", 1, _S.invoke(_S.read(_v3, "Math"), "round", [_S.binary("*", _S.binary("+", 0.6, _S.binary("*", _S.read(_v3, "h"), 1.8)), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "d"), 0.7)))]))}, {"stub": (_S.binary("+", 2, _S.invoke(_S.read(_v3, "Math"), "round", [_S.binary("*", _S.binary("*", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "x"), 5]), 5), _S.binary("-", 1, _S.binary("*", _S.read(_v3, "d"), 0.5)))])) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v3, "h"), 0.3), func(): return _S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "x")]), 7))) else 0)}])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "x", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "snapped", false)
	_S.define(_e, "landed", false)
	_S.define(_e, "dripped", false)
	_S.define(_e, "y", 0)
	_S.define(_e, "top", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"drawBack": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f4(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_n_b3)):
			_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":(_n_x_b0 + _S.invoke(_n_R,"range",[(-2), 2])),"y":(_n_y_b1 - 1),"vx":((_n_vx_b2 * 0.5) + _S.invoke(_n_R,"range",[(-45), 45])),"vy":(-_S.invoke(_n_R,"range",[30, 100])),"g":0.8,"drag":0.6,"bounce":0.35,"life":_S.invoke(_n_R,"range",[0.4, 0.75]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-18), 18]),"s":_S.invoke(_n_R,"range",[1.2, 2.4]),"c":_S.index_value(_n_C,_S.invoke(_n_R,"int",[4, 7]))}])
			_n_i_b4 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_v_b3 = _S.arg(_args,3)
	if _S.truth((_n_v_b3 < 100)):
		return null
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), _n_x_b1, (_n_y_b2 - 1), _S.invoke(_n_R,"range",[(-15), 15]), (-_S.invoke(_n_R,"range",[2, 8])), _S.invoke(_n_R,"range",[0.4, 0.6]), _S.index_value(_n_C,6), _S.invoke(_n_R,"range",[1.4, 2.2])])
	_S.call_value(_n_splinter,[_n_x_b1, _n_y_b2, _S.named_value(_n_q_b0,"vx"), 2])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_splinter = _S.read(_parent,"splinter")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_splinter,[_S.named_value(_n_q_b0,"x"), 0, _S.named_value(_n_q_b0,"vx"), 3])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_ROOT = _S.read(_parent,"ROOT")
	var _n_t = _S.read(_parent,"t")
	var _n_FREE = _S.read(_parent,"FREE")
	var _n_GRAVITY = _S.read(_parent,"GRAVITY")
	return (_n_ROOT + (0 if _S.truth((_n_t < _n_FREE)) else ((0.5 * _n_GRAVITY) * pow((_n_t - _n_FREE),2))))
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "dripped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DRIP")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "dripped", true, "=", false)
		_S.invoke(_S.read(_v4, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v4, "B"), "DRIP")}, {"x": 0.5}, {"y": _S.binary("+", _S.binary("+", _S.read(_v4, "ROOT"), _S.read(_v4, "LEN")), 1)}, {"vy": 20}, {"g": 0.9}, {"life": 1.2}, {"c": _S.prop(_S.read(_v4, "C"), 6)}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "TREMBLE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.25]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "FLAKE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.read(_e, "ROOT"), _S.invoke(_S.read(_e, "R"), "range", [0, 3])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_e, "R"), "range", [5, 20]), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1.1]), (_S.read(_e, "WHITE") if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "R"), "range", [0.5, 1.1])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "snapped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "snapped", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.binary("+", _S.read(_v5, "ROOT"), 4), 24, _S.read(_v5, "WHITE"), 0.6, 0.1])
		_S.invoke(_S.read(_v5, "lights"), "add", [0, _S.binary("+", _S.read(_v5, "ROOT"), 4), 32, _S.prop(_S.read(_v5, "C"), 5), 0.4, 0.3])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 7)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v7, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v7, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 4), 4])}, {"y": _S.binary("+", _S.read(_v7, "ROOT"), 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 20)}, {"g": 0.8}, {"drag": 0.8}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v7, "R"), "range", [0.5, 0.9])}, {"a": _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")])}, {"va": _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v7, "R"), "range", [1, 2])}, {"c": _S.prop(_S.read(_v7, "C"), _S.invoke(_S.read(_v7, "R"), "int", [5, 7]))}])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 3)):
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "VAPOUR"), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 5), 5]), _S.binary("+", _S.read(_v8, "ROOT"), 2), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v8, "R"), "range", [_S.unary("-", 5), 5]), _S.invoke(_S.read(_v8, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v8, "C"), 6), _S.invoke(_S.read(_v8, "R"), "range", [1.6, 2.6])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v9 = _S.scope(_v5)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 5)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "FLAKE"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 6), 6]), _S.binary("+", _S.read(_v9, "ROOT"), 2), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 30), 30]), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 1.2]), (_S.read(_v9, "WHITE") if _S.truth(_S.invoke(_S.read(_v9, "R"), "chance", [0.5])) else _S.prop(_S.read(_v9, "C"), 6)), _S.invoke(_S.read(_v9, "R"), "range", [0.5, 1.3])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "FREE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "IMPACT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "tp", _S.call_value(_S.read(_v10, "top"), []))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "MOTE"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("+", _S.read(_v10, "tp"), _S.invoke(_S.read(_v10, "R"), "range", [0, _S.binary("*", _S.read(_v10, "LEN"), 0.6)])), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 40), _S.unary("-", 10)]), _S.invoke(_S.read(_v10, "R"), "range", [0.2, 0.35]), (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 5)), 0.6])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "landed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IMPACT")))):
		var _v11 = _S.scope(_e)
		_S.write(_v11, "landed", true, "=", false)
		_S.define(_v11, "tp", _S.unary("-", _S.read(_v11, "LEN")))
		_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 16), 46, _S.read(_v11, "WHITE"), 0.85, 0.12])
		_S.invoke(_S.read(_v11, "lights"), "add", [0, _S.unary("-", 16), 58, _S.prop(_S.read(_v11, "C"), 4), 0.5, 0.5])
		_S.define(_v11, "parts", [[[_S.binary("/", _S.unary("-", _S.read(_v11, "W")), 2), _S.read(_v11, "tp")], [_S.binary("/", _S.read(_v11, "W"), 2), _S.read(_v11, "tp")], [0.5, 0]]])
		for _v12 in _S.array([0.3, 0.58, 0.8]):
			var _v13 = _S.scope(_v11)
			_S.define(_v13, "v", _v12)
			_S.write(_v13, "parts", _S.invoke(_S.read(_v13, "parts"), "flatMap", [_S.function_value(_v13, "_f10")]), "=", false)
		_S.write(_v11, "parts", _S.invoke(_S.read(_v11, "parts"), "flatMap", [_S.function_value(_v11, "_f11")]), "=", false)
		for _v14 in _S.array(_S.read(_v11, "parts")):
			var _v15 = _S.scope(_v11)
			_S.define(_v15, "part", _v14)
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "m", _S.call_value(_S.read(_v16, "centroid"), [_S.read(_v16, "part")]))
			_S.define(_v16, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_v16, "m"), "x"), 0.5)) else 1))
			_S.define(_v16, "low", _S.call_value(_S.read(_v16, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v16, "m"), "y")), _S.read(_v16, "LEN"))]))
			_S.invoke(_S.read(_v16, "panes"), "add", [_S.merge([{"pts": _S.invoke(_S.read(_v16, "part"), "map", [_S.function_value(_v16, "_f12")])}, {"x": _S.prop(_S.read(_v16, "m"), "x")}, {"y": _S.prop(_S.read(_v16, "m"), "y")}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v16, "side"), _S.invoke(_S.read(_v16, "R"), "range", [30, 110])), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 15), 15]))}, {"vy": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [70, 200])), _S.binary("+", 0.4, _S.read(_v16, "low")))}, {"a": 0}, {"va": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 12), 12])}, {"f": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 0.7), 0.7])}, {"vf": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 8), 8])}, {"lit": 0.75}, {"g": 0.9}, {"drag": 0.6}, {"bounce": 0.35}, {"solid": true}, {"ridge": _S.binary("/", _S.prop(_S.read(_v16, "Math"), "PI"), 2)}, {"brittle": 2}, {"crumble": _S.invoke(_S.read(_v16, "R"), "range", [0.15, 0.45])}, {"life": _S.invoke(_S.read(_v16, "R"), "range", [1, 1.4])}])])
		var _v18 = _S.scope(_v11)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 52)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1.25), 1.25])))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [60, 230]))
			_S.invoke(_S.read(_v19, "bits"), "add", [_S.merge([{"kind": (_S.prop(_S.read(_v19, "B"), "CHUNK") if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.15])) else _S.prop(_S.read(_v19, "B"), "SHARD"))}, {"x": _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 3), 3])}, {"y": _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [1, 10]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp"))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v19, "R"), "range", [0.6, 1.2])}, {"a": _S.invoke(_S.read(_v19, "R"), "range", [0, _S.read(_v19, "TAU")])}, {"va": _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v19, "R"), "range", [1.2, 3])}, {"c": _S.prop(_S.read(_v19, "C"), _S.invoke(_S.read(_v19, "R"), "int", [4, 7]))}, {"ramp": [_S.prop(_S.read(_v19, "C"), 1), _S.prop(_S.read(_v19, "C"), 3), _S.prop(_S.read(_v19, "C"), 4), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 7)]}])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		var _v20 = _S.scope(_v11)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 10)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "s", _S.invoke(_S.read(_v21, "R"), "sign", []))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "VAPOUR"), _S.binary("*", _S.read(_v21, "s"), _S.invoke(_S.read(_v21, "R"), "range", [0, 8])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [1, 6])), _S.binary("*", _S.read(_v21, "s"), _S.invoke(_S.read(_v21, "R"), "range", [25, 90])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [2, 14])), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v21, "C"), 6), _S.invoke(_S.read(_v21, "R"), "range", [2.2, 3.8])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v11)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 12)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "FLAKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [2, 16])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [30, 110])), _S.invoke(_S.read(_v22, "R"), "range", [1, 1.5]), (_S.read(_v22, "WHITE") if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.6])) else _S.prop(_S.read(_v22, "C"), 6)), _S.invoke(_S.read(_v22, "R"), "range", [0.5, 1.5])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
		var _v23 = _S.scope(_v11)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 6)):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "STAR"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 24), 24]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 34])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 14])), _S.invoke(_S.read(_v23, "R"), "range", [0.4, 0.8]), (_S.read(_v23, "WHITE") if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.5])) else _S.prop(_S.read(_v23, "C"), 6)), _S.invoke(_S.read(_v23, "R"), "range", [1, 2.2])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "landed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "IMPACT"), 0.9))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08])), func(): return _S.prop(_S.prop(_S.read(_e, "bits"), "list"), "length"))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "b", _S.invoke(_S.read(_v24, "R"), "pick", [_S.prop(_S.read(_v24, "bits"), "list")]))
		_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "STAR"), _S.prop(_S.read(_v24, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v24, "b"), "y"), 1), 0, _S.unary("-", 3), _S.invoke(_S.read(_v24, "R"), "range", [0.2, 0.4]), (_S.read(_v24, "WHITE") if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else _S.prop(_S.read(_v24, "C"), 6)), _S.invoke(_S.read(_v24, "R"), "range", [0.6, 1.4])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "panes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps"), _S.read(_e, "bits"), _S.read(_e, "panes")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_tp = _S.read(_parent,"tp")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_v = _S.read(_parent,"v")
	var _n_R = _S.read(_parent,"R")
	var _n_splitPoly = _S.read(_parent,"splitPoly")
	var _n_poly_b0 = _S.arg(_args,0)
	return _S.call_value(_n_splitPoly,[_n_poly_b0, 0, ((_n_tp + (_n_LEN * _n_v)) + _S.invoke(_n_R,"range",[(-2), 2])), _S.invoke(_n_R,"range",[(-0.4), 0.4])])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_centroid = _S.read(_parent,"centroid")
	var _n_R = _S.read(_parent,"R")
	var _n_splitPoly = _S.read(_parent,"splitPoly")
	var _n_poly_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_splitPoly,[_n_poly_b0, _S.named_value(_S.call_value(_n_centroid,[_n_poly_b0]),"x"), _S.named_value(_S.call_value(_n_centroid,[_n_poly_b0]),"y"), ((float(PI)/2) + _S.invoke(_n_R,"range",[(-0.5), 0.5]))]) if _S.truth((_S.named_value(_S.call_value(_n_centroid,[_n_poly_b0]),"area") > 22)) else [_n_poly_b0])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 - _S.named_value(_n_m,"x")), (_n_y_b1 - _S.named_value(_n_m,"y"))]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_TREMBLE = _S.read(_parent,"TREMBLE")
	var _n_IMPACT = _S.read(_parent,"IMPACT")
	var _n_FREE = _S.read(_parent,"FREE")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t < (_n_IMPACT + 0.05)) if _S.truth((_n_t > _n_TREMBLE)) else (_n_t > _n_TREMBLE))):
		var _n_k_b1 = ((_S.MathFX.seg(_n_t,_n_TREMBLE,_n_FREE) * 0.35) if _S.truth((_n_t < _n_FREE)) else (0.35 + (0.65 * _S.MathFX.seg(_n_t,_n_FREE,_n_IMPACT))))
		var _n_rx_b2 = (3 + (7 * _n_k_b1))
		if true:
			var _n_x_b3 = floori((-_n_rx_b2))
			while _S.truth((_n_x_b3 <= _n_rx_b2)):
				var _n_f_b4 = (1 - pow((float(_n_x_b3)/_n_rx_b2),2))
				_S.invoke(_n_p_b0,"blend",[(_n_x_b3 + 0.5), 0, _S.index_value(_n_C,0), ((0.7 * _n_k_b1) * _n_f_b4)])
				if _S.truth((absf(_n_x_b3) < (_n_rx_b2 * 0.7))):
					_S.invoke(_n_p_b0,"blend",[(_n_x_b3 + 0.5), 1, _S.index_value(_n_C,0), ((0.45 * _n_k_b1) * _n_f_b4)])
				_n_x_b3 += 1.0
	if _S.truth((_n_t >= _n_IMPACT)):
		var _n_g_b5 = _S.invoke(_n_ease,"outCubic",[_S.MathFX.seg(_n_t,_n_IMPACT,(_n_IMPACT + 0.25))])
		var _n_out_b6 = (1 - _S.MathFX.smooth((_n_IMPACT + 0.8),(_n_IMPACT + 1.5),_n_t))
		if true:
			var _n_x_b8 = (-26)
			while _S.truth((_n_x_b8 <= 26)):
				var _n_d_b9 = (float(absf((_n_x_b8 + 0.5)))/26)
				var _n_h_b10 = _S.MathFX.rand([_n_x_b8,23])
				var _n_a_b11 = (_n_out_b6 * clampf((float(((_n_g_b5 * 1.15) - _n_d_b9))/0.15),0.0,1.0))
				if _S.truth((_n_a_b11 <= 0)):
					_n_x_b8 += 1.0
					continue
				_S.invoke(_n_p_b0,"dot",[_n_x_b8, 0, (_n_WHITE if _S.truth(((_n_h_b10 < 0.35) if _S.truth((_n_h_b10 < 0.35)) else (_n_d_b9 > (_n_g_b5 - 0.12)))) else _S.index_value(_n_C,6)), _n_a_b11])
				if _S.truth((_n_h_b10 < 0.4)):
					if true:
						var _n_j_b12 = 1
						while _S.truth((_n_j_b12 <= floori(((1 + (_S.MathFX.rand([_n_x_b8,3]) * 2.5)) * (1 - _n_d_b9))+0.5))):
							_S.invoke(_n_p_b0,"dot",[(_n_x_b8 + (signf(_n_x_b8) * (1 if _S.truth((_n_j_b12 > 1)) else 0))), (-_n_j_b12), (_n_WHITE if _S.truth((_n_j_b12 > 1)) else _S.index_value(_n_C,5)), _n_a_b11])
							_n_j_b12 += 1.0
				if true:
					var _n_j_b13 = 1
					while _S.truth((_n_j_b13 <= floori(((2 + (_S.MathFX.rand([_n_x_b8,7]) * 3)) * (1 - (_n_d_b9 * 0.6)))+0.5))):
						_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_j_b13, (_S.index_value(_n_C,5) if _S.truth((_n_j_b13 < 2)) else _S.index_value(_n_C,4)), (_n_a_b11 * (1.1 - (float(_n_j_b13)/6)))])
						_n_j_b13 += 1.0
				_n_x_b8 += 1.0
		var _n_k_b7 = _S.MathFX.seg(_n_t,_n_IMPACT,(_n_IMPACT + 0.35))
		if _S.truth((_n_k_b7 < 1)):
			_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (6 + (34 * _S.invoke(_n_ease,"outCubic",[_n_k_b7]))), 0.18, maxf(1,(4 * (1 - _n_k_b7))), (1.1 - _n_k_b7), [_S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f14")])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return (sin(_n_a_b0) < 0)
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_ROOT = _S.read(_parent,"ROOT")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_rime = _S.read(_parent,"rime")
	var _n_snapped = _S.read(_parent,"snapped")
	var _n_W = _S.read(_parent,"W")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_IMPACT = _S.read(_parent,"IMPACT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_top = _S.read(_parent,"top")
	var _n_TREMBLE = _S.read(_parent,"TREMBLE")
	var _n_FREE = _S.read(_parent,"FREE")
	var _n_GRAVITY = _S.read(_parent,"GRAVITY")
	var _n_icicle = _S.read(_parent,"icicle")
	var _n_LEN = _S.read(_parent,"LEN")
	var _n_DRIP = _S.read(_parent,"DRIP")
	var _n_panes = _S.read(_parent,"panes")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_ra_b1 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.7),(_S.named_value(_n_meta,"duration") - 0.2),_n_t))
	for _iter_0 in _S.array(_n_rime):
		var _n_r_b2 = _iter_0
		if true:
			var _n_j_b3 = 0
			while _S.truth((_n_j_b3 < (_S.named_value(_n_r_b2,"h") + 1))):
				_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_r_b2,"x"), ((_n_ROOT - 1) - _n_j_b3), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b3,_S.named_value(_n_r_b2,"h"))) else (_S.index_value(_n_C,6) if _S.truth(_S.binary("===",_n_j_b3,(_S.named_value(_n_r_b2,"h") - 1))) else (_S.index_value(_n_C,3) if _S.truth(_S.binary("===",_n_j_b3,0)) else _S.index_value(_n_C,5)))), _n_ra_b1])
				_n_j_b3 += 1.0
		if true:
			var _n_j_b4 = 0
			while _S.truth((_n_j_b4 < _S.named_value(_n_r_b2,"stub"))):
				_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_r_b2,"x"), (_n_ROOT + _n_j_b4), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b4,(_S.named_value(_n_r_b2,"stub") - 1))) else (_S.index_value(_n_C,5) if _S.truth(_S.binary("===",_n_j_b4,0)) else _S.index_value(_n_C,4))), _n_ra_b1])
				_n_j_b4 += 1.0
		if _S.truth((_S.named_value(_n_r_b2,"stub") > 4)):
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_r_b2,"x") + 1), _n_ROOT, _S.index_value(_n_C,3), _n_ra_b1])
	if _S.truth(_n_snapped):
		if true:
			var _n_x_b5 = ((float((-_n_W))/2) + 1)
			while _S.truth((_n_x_b5 <= ((float(_n_W)/2) - 1))):
				var _n_L_b6 = (1 + floori((_S.MathFX.rand([_n_x_b5,77]) * 2.5)+0.5))
				if true:
					var _n_j_b7 = 0
					while _S.truth((_n_j_b7 < _n_L_b6)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b5, (_n_ROOT + _n_j_b7), ((_n_WHITE if _S.truth((_n_t < (_n_SNAP + 0.15))) else _S.index_value(_n_C,6)) if _S.truth(_S.binary("===",_n_j_b7,(_n_L_b6 - 1))) else (_S.index_value(_n_C,5) if _S.truth((_n_x_b5 < 0)) else _S.index_value(_n_C,3))), _n_ra_b1])
						_n_j_b7 += 1.0
				_n_x_b5 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, _n_ROOT, 18, _S.index_value(_n_C,4), (0.3 * _n_ra_b1)])
	if _S.truth((_n_t >= _n_IMPACT)):
		var _n_k_b8 = _S.MathFX.seg(_n_t,_n_IMPACT,(_n_IMPACT + 0.35))
		if _S.truth((_n_k_b8 < 1)):
			_S.call_value(_n_band,[_n_p_b0, 0, 0.5, (6 + (34 * _S.invoke(_n_ease,"outCubic",[_n_k_b8]))), 0.18, maxf(1,(4 * (1 - _n_k_b8))), (1.1 - _n_k_b8), [_S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f16"), (_n_k_b8 < 0.15)])
		if _S.truth((_n_t < (_n_IMPACT + 0.22))):
			_S.call_value(_n_sparkle,[_n_p_b0, 0.5, (-3), ((10 * _S.invoke(_n_ease,"outBack",[minf(1,(float((_n_t - _n_IMPACT))/0.05))])) * (1 - (float((_n_t - _n_IMPACT))/0.22))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.7])
	if _S.truth((_n_t < _n_IMPACT)):
		var _n_tp_b9 = _S.call_value(_n_top,[])
		var _n_jx_b10 = (((1 if _S.truth(fmod(floori((_n_t * 36)),2)) else 0) * floori(((_S.MathFX.seg(_n_t,_n_TREMBLE,_n_SNAP) * 1.4) + 0.4)+0.5)) if _S.truth(((_n_t < _n_SNAP) if _S.truth((_n_t > _n_TREMBLE)) else (_n_t > _n_TREMBLE))) else 0)
		var _n_falling_b11 = (_n_t >= _n_FREE)
		var _n_sp_b12 = ((_n_GRAVITY * (_n_t - _n_FREE)) if _S.truth(_n_falling_b11) else 0)
		if _S.truth(_n_falling_b11):
			for _iter_1 in _S.array([[(-3), 0.7], [0.5, 1], [4, 0.6]]):
				var _tuple_2 = _iter_1
				var _n_dx_b14 = _S.prop(_tuple_2,0)
				var _n_k_b15 = _S.prop(_tuple_2,1)
				var _n_L_b16 = (minf(30,(_n_sp_b12 * 0.07)) * _n_k_b15)
				if _S.truth((_n_L_b16 > 2)):
					_S.invoke(_n_p_b0,"line",[_n_dx_b14, (_n_tp_b9 - _n_L_b16), _n_dx_b14, (_n_tp_b9 + 3), _S.function_value(_S.capture(_parent,{"this":_this}),"_f17")])
		var _n_gl_b13 = (float((_n_t - 0.04))/0.3)
		_S.call_value(_n_icicle,[_n_p_b0, _n_C, (_n_jx_b10 + 0.5), _n_tp_b9, _n_LEN, _n_W, {"white":((_n_t >= (_n_IMPACT - 0.025)) if _S.truth((_n_t >= (_n_IMPACT - 0.025))) else ((_n_t < (_n_SNAP + 0.03)) if _S.truth((_n_t >= _n_SNAP)) else (_n_t >= _n_SNAP))),"glint":(_n_gl_b13 if _S.truth(((_n_gl_b13 <= 1) if _S.truth((_n_gl_b13 >= 0)) else (_n_gl_b13 >= 0))) else (-1))}])
		if _S.truth(((_n_t < (_n_SNAP + 0.12)) if _S.truth(_n_snapped) else _n_snapped)):
			_S.invoke(_n_p_b0,"line",[((float((-_n_W))/2) - 1), (_n_ROOT + 1), ((float(_n_W)/2) + 1), (_n_ROOT + 1), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0.5, (_n_tp_b9 + (_n_LEN * 0.5)), 20, _S.index_value(_n_C,4), 0.28])
		if _S.truth((_n_t < _n_DRIP)):
			var _n_s_b17 = _S.MathFX.seg(_n_t,0,_n_DRIP)
			_S.invoke(_n_p_b0,"dot",[0.5, ((_n_ROOT + _n_LEN) + 1), _S.index_value(_n_C,6), _n_s_b17])
			if _S.truth((_n_s_b17 > 0.6)):
				_S.invoke(_n_p_b0,"px",[0.5, ((_n_ROOT + _n_LEN) + 2), _n_WHITE])
	_S.invoke(_n_panes,"draw",[_n_p_b0, _n_C])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return (sin(_n_a_b0) >= 0)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 > 0.75)) else (_S.index_value(_n_C,4) if _S.truth((_n_u_b0 > 0.4)) else _S.index_value(_n_C,3)))
	return null
