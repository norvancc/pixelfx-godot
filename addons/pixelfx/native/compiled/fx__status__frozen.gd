@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/frozen.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "plan", _S.function_value(_e, "_f0"))
	_S.define(_e, "frost", _S.function_value(_e, "_f24"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f25"))
	_S.define(_e, "draw", _S.function_value(_e, "_f27"))
	_S.define(_e, "meta", _S.merge([{"name": "Frozen"}, {"desc": "Chilled to the bone: frost ferns creep over the body, icicles hang from chin and hands and drip, breath steams, snow settles, a shiver every second, frost spreads underfoot."}, {"tags": ["status", "ice", "freeze", "frozen", "cold", "chill", "debuff", "loop"]}, {"size": [72, 64]}, {"origin": [36, 54]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STIFF", _S.merge([{"turn": 0.9}, {"crouch": 1}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 15)}, {"bx": 7}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 2)}, {"fbx": 3}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "STIFF"), {"crouch": 2}])], [0.22, _S.read(_e, "STIFF")], [1, _S.read(_e, "STIFF")], [1, _S.merge([_S.read(_e, "STIFF"), {"crouch": 2}]), "snap"], [1.22, _S.read(_e, "STIFF")], [2, _S.merge([_S.read(_e, "STIFF"), {"crouch": 2}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SHIVER", 1)
	_S.define(_e, "since", _S.function_value(_e, "_f32"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f33"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "shake", _S.function_value(_e, "_f34"))
	_S.define(_e, "PLANS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "PLANS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.unary("!", _S.read(_e, "m"))):
		_S.invoke(_S.read(_e, "PLANS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.write(_e, "m", _S.construct(_S.read(_e, "Map"), []), "=", false)])
	if _S.truth(_S.invoke(_S.read(_e, "m"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "m"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 11), 1)]))
	_S.define(_e, "ferns", [])
	_S.define(_e, "roots", _S.invoke(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "side"), "filter", [_S.function_value(_e, "_f1")]), "sort", [_S.function_value(_e, "_f2")]), "slice", [0, 6]))
	_S.invoke(_S.read(_e, "roots"), "forEach", [_S.function_value(_e, "_f3")])
	_S.define(_e, "clear", _S.function_value(_e, "_f4"))
	_S.define(_e, "hangs", _S.invoke(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f5")]), "map", [_S.function_value(_e, "_f6")]), "filter", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "best", _S.function_value(_e, "_f8"))
	_S.define(_e, "icicles", _S.invoke(_S.invoke([_S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f15"), _S.function_value(_e, "_f16")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f17"), _S.function_value(_e, "_f18")]), _S.call_value(_S.read(_e, "best"), [_S.function_value(_e, "_f19"), _S.function_value(_e, "_f20")])], "filter", [_S.read(_e, "Boolean")]), "map", [_S.function_value(_e, "_f21")]))
	_S.define(_e, "snow", _S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "up"), "filter", [_S.function_value(_e, "_f22")]), "map", [_S.function_value(_e, "_f23")]))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")]))
	_S.define(_e, "mouth", ([_S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "E"), 0), "x1"), _S.prop(_S.prop(_S.read(_e, "E"), 1), "x0")), 1), 2), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.prop(_S.read(_e, "E"), 0), "y1"), _S.prop(_S.prop(_S.read(_e, "E"), 1), "y1")]), 2)] if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "E"), "length"), 2)) else [_S.binary("/", _S.read(_e, "W"), 2), _S.binary("*", _S.read(_e, "H"), 0.38)]))
	_S.define(_e, "out", _S.merge([{"ferns": _S.read(_e, "ferns")}, {"icicles": _S.read(_e, "icicles")}, {"snow": _S.read(_e, "snow")}, {"mouth": _S.read(_e, "mouth")}]))
	_S.invoke(_S.read(_e, "m"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	return ((_n_y_b0 < (_n_H * 0.85)) if _S.truth((_n_y_b0 > (_n_H * 0.2))) else (_n_y_b0 > (_n_H * 0.2)))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return (_S.invoke(_n_R,"next",[]) - 0.5)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_S = _S.read(_parent,"S")
	var _n_ferns = _S.read(_parent,"ferns")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x0_b0 = _S.prop(_tuple_0,0)
	var _n_y0_b1 = _S.prop(_tuple_0,1)
	var _n_dir_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	var _n_x_b4 = _n_x0_b0
	var _n_y_b5 = _n_y0_b1
	var _n_ang_b6 = ((-0.5) if _S.truth((_n_dir_b2 < 0)) else (PI + 0.5))
	_n_ang_b6 += _S.invoke(_n_R,"range",[(-0.4), 0.4])
	if true:
		var _n_s_b7 = 0
		while _S.truth((_n_s_b7 < 9)):
			_n_x_b4 += (cos(_n_ang_b6) * 1.1)
			_n_y_b5 += (sin(_n_ang_b6) * 1.1)
			var _n_px_b8 = floori(_n_x_b4+0.5)
			var _n_py_b9 = floori(_n_y_b5+0.5)
			if _S.truth(not _S.truth(_S.invoke(_n_S,"on",[_n_px_b8, _n_py_b9]))):
				break
			_S.invoke(_n_ferns,"push",[[_n_px_b8, _n_py_b9, (float(_n_s_b7)/9), _n_i_b3]])
			if _S.truth(_S.binary("===",fmod(_n_s_b7,2),1)):
				for _iter_1 in _S.array([(-1), 1]):
					var _n_side_b10 = _iter_1
					var _n_ba_b11 = (_n_ang_b6 + (_n_side_b10 * 1.05))
					var _n_L_b12 = (1 + floori((_S.invoke(_n_R,"range",[0, 2]) * (1 - (float(_n_s_b7)/9)))+0.5))
					if true:
						var _n_k_b13 = 1
						while _S.truth((_n_k_b13 <= _n_L_b12)):
							var _n_bx_b14 = floori((_n_x_b4 + (cos(_n_ba_b11) * _n_k_b13))+0.5)
							var _n_by_b15 = floori((_n_y_b5 + (sin(_n_ba_b11) * _n_k_b13))+0.5)
							if _S.truth(_S.invoke(_n_S,"on",[_n_bx_b14, _n_by_b15])):
								_S.invoke(_n_ferns,"push",[[_n_bx_b14, _n_by_b15, (float((_n_s_b7 + (_n_k_b13 * 0.6)))/9), _n_i_b3]])
							_n_k_b13 += 1.0
			_n_ang_b6 += _S.invoke(_n_R,"range",[(-0.25), 0.25])
			_n_s_b7 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_S = _S.read(_parent,"S")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_n_b2 = 0
	while _S.truth((not _S.truth(_S.invoke(_n_S,"on",[_n_x_b0, ((_n_y_b1 + 1) + _n_n_b2)])) if _S.truth(((((_n_y_b1 + 1) + _n_n_b2) < _n_H) if _S.truth((_n_n_b2 < 7)) else (_n_n_b2 < 7))) else ((((_n_y_b1 + 1) + _n_n_b2) < _n_H) if _S.truth((_n_n_b2 < 7)) else (_n_n_b2 < 7)))):
		_n_n_b2 += 1.0
	return _n_n_b2
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return _S.logical("&&",_S.logical("&&",_S.logical("&&",not _S.truth(_S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 + 1)])),func():return _S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 - 1)])),func():return (_n_y_b1 < (_n_H * 0.72))),func():return (_n_y_b1 > 4))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_clear = _S.read(_parent,"clear")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [_n_x_b0, _n_y_b1, _S.call_value(_n_clear,[_n_x_b0, _n_y_b1])]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_c_b0 = _S.prop(_tuple_0,2)
	return (_n_c_b0 >= 4)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_hangs = _S.read(_parent,"hangs")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_key_b1 = _S.arg(_args,1)
	return _S.index_value(_S.invoke(_S.invoke(_n_hangs,"filter",[_n_f_b0]),"sort",[_n_key_b1]),0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	return (_n_y_b0 < (_n_H * 0.36))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_p_b0,0) - _S.index_value(_n_q_b1,0))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	return (_n_y_b0 < (_n_H * 0.36))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_q_b1,0) - _S.index_value(_n_p_b0,0))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return ((_n_x_b0 < (float(_n_W)/2)) if _S.truth(((_n_y_b1 < (_n_H * 0.5)) if _S.truth((_n_y_b1 >= (_n_H * 0.36))) else (_n_y_b1 >= (_n_H * 0.36)))) else ((_n_y_b1 < (_n_H * 0.5)) if _S.truth((_n_y_b1 >= (_n_H * 0.36))) else (_n_y_b1 >= (_n_H * 0.36))))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_q_b1,0) - _S.index_value(_n_p_b0,0))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return ((_n_x_b0 >= (float(_n_W)/2)) if _S.truth(((_n_y_b1 < (_n_H * 0.5)) if _S.truth((_n_y_b1 >= (_n_H * 0.36))) else (_n_y_b1 >= (_n_H * 0.36)))) else ((_n_y_b1 < (_n_H * 0.5)) if _S.truth((_n_y_b1 >= (_n_H * 0.36))) else (_n_y_b1 >= (_n_H * 0.36))))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_p_b0,0) - _S.index_value(_n_q_b1,0))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return ((_n_x_b0 < (float(_n_W)/2)) if _S.truth((_n_y_b1 >= (_n_H * 0.5))) else (_n_y_b1 >= (_n_H * 0.5)))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_p_b0,0) - _S.index_value(_n_q_b1,0))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return ((_n_x_b0 >= (float(_n_W)/2)) if _S.truth((_n_y_b1 >= (_n_H * 0.5))) else (_n_y_b1 >= (_n_H * 0.5)))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_q_b1,0) - _S.index_value(_n_p_b0,0))
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_c_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	return {"x":_n_x_b0,"y":(_n_y_b1 + 1),"len":minf((_n_c_b2 - 1),_S.invoke(_n_R,"range",[3, 5.5])),"phase":_S.invoke(_n_R,"next",[]),"period":(1 if _S.truth(fmod(_n_i_b3,2)) else 2)}
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _tuple_0 = _S.arg(_args,0)
	var _n_y_b0 = _S.prop(_tuple_0,1)
	return (_n_y_b0 < (_n_H * 0.6))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_seed = _S.read(_parent,"seed")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [_n_x_b0, _n_y_b1, (1 + (1 if _S.truth((_S.MathFX.rand([_n_x_b0,_n_seed,3]) < 0.45)) else 0))]
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_reach_b3 = _S.arg(_args,3)
	if true:
		var _n_x_b4 = ((-ceili(_n_reach_b3)) - 1)
		while _S.truth((_n_x_b4 <= (_n_reach_b3 + 1))):
			var _n_q_b5 = (float(absf((_n_x_b4 + 0.5)))/_n_reach_b3)
			var _n_h_b6 = _S.MathFX.rand([_n_x_b4,17])
			var _n_k_b7 = (1 - (_n_q_b5 * _n_q_b5))
			if _S.truth((_n_q_b5 > (1 + (_n_h_b6 * 0.15)))):
				_n_x_b4 += 1.0
				continue
			var _n_tw_b8 = (sin(((((float(_n_t_b2)/_n_D) * _n_TAU) * 2) + (_S.MathFX.rand([_n_x_b4,3]) * _n_TAU))) > 0.94)
			_S.invoke(_n_p_b0,"px",[_n_x_b4, 0, (_S.index_value(_n_C_b1,7) if _S.truth((_n_tw_b8 if _S.truth(_n_tw_b8) else (_n_h_b6 < 0.3))) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_q_b5 > 0.85)) else _S.index_value(_n_C_b1,6)))])
			if _S.truth((_n_h_b6 < (0.3 * _n_k_b7))):
				_S.invoke(_n_p_b0,"px",[_n_x_b4, (-1), _S.index_value(_n_C_b1,6)])
			if true:
				var _n_j_b9 = 1
				while _S.truth((_n_j_b9 <= (1 + floori((2 * _n_k_b7)+0.5)))):
					_S.invoke(_n_p_b0,"dot",[_n_x_b4, _n_j_b9, (_S.index_value(_n_C_b1,5) if _S.truth(_S.binary("===",_n_j_b9,1)) else _S.index_value(_n_C_b1,4)), ((1.05 - (float(_n_j_b9)/4)) * 0.85)])
					_n_j_b9 += 1.0
			_n_x_b4 += 1.0
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_frost = _S.read(_parent,"frost")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_reach_b4 = (13 + (3.5 * sin(((float(_n_t_b1)/_n_D) * _n_TAU))))
	_S.invoke(_n_p_b0,"shade",[(-28), (-3), 28, 6, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f26")])
	_S.call_value(_n_frost,[_n_p_b0, _n_C_b3, _n_t_b1, _n_reach_b4])
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float(_n_x_b0)/24), (float((_n_y_b1 - 0.5))/4)])
	if _S.truth((_n_d_b3 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,4),"=")
		_S.set_prop(_n_out_b2,"k",((0.24 * (1 - _n_d_b3)) * (1 - _n_d_b3)),"=")
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_shape = _S.read(_parent,"shape")
	var _n_plan = _S.read(_parent,"plan")
	var _n_shake = _S.read(_parent,"shake")
	var _n_since = _S.read(_parent,"since")
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_travel = _S.read(_parent,"travel")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_a_b4 = _S.named_value(_n_o_b2,"actor")
	var _n_S_b5 = _S.call_value(_n_shape,[_n_a_b4])
	var _n_H_b6 = _S.named_value(_n_S_b5,"h")
	var _n_P_b7 = _S.call_value(_n_plan,[_n_a_b4, _S.named_value(_n_o_b2,"seed")])
	var _n_dx_b8 = _S.call_value(_n_shake,[_n_t_b1])
	var _n_ph_b9 = _S.call_value(_n_since,[_n_t_b1])
	var _n_X_b10 = _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"dx":_n_dx_b8,"this":_this}),"_f28")
	var _n_Y_b11 = _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"this":_this}),"_f29")
	for _iter_0 in _S.array(_S.named_value(_n_S_b5,"body")):
		var _tuple_1 = _iter_0
		var _n_mx_b15 = _S.prop(_tuple_1,0)
		var _n_my_b16 = _S.prop(_tuple_1,1)
		var _n_c_b17 = _S.call_value(_n_colorAt,[_n_a_b4, _n_mx_b15, _n_my_b16])
		var _n_ice_b18 = _S.index_value(_n_C_b3,clampf((1 + floori((_S.ColorFX.luma(_n_c_b17) * 5.6)+0.5)),1,7))
		var _n_rim_b19 = _S.logical("||",_S.logical("||",not _S.truth(_S.invoke(_n_S_b5,"on",[(_n_mx_b15 - 1), _n_my_b16])),func():return not _S.truth(_S.invoke(_n_S_b5,"on",[_n_mx_b15, (_n_my_b16 - 1)]))),func():return not _S.truth(_S.invoke(_n_S_b5,"on",[(_n_mx_b15 + 1), _n_my_b16])))
		_S.invoke(_n_p_b0,"px",[_S.call_value(_n_X_b10,[_n_mx_b15]), _S.call_value(_n_Y_b11,[_n_my_b16]), ((_S.index_value(_n_C_b3,5) if _S.truth(((_n_my_b16 < (_n_H_b6 * 0.5)) if _S.truth((_n_my_b16 < (_n_H_b6 * 0.5))) else not _S.truth(_S.invoke(_n_S_b5,"on",[(_n_mx_b15 - 1), _n_my_b16])))) else _S.index_value(_n_C_b3,3)) if _S.truth(((_S.ColorFX.luma(_n_c_b17) < 0.3) if _S.truth(_n_rim_b19) else _n_rim_b19)) else _S.ColorFX.mix(_n_c_b17,_n_ice_b18,0.38))])
	var _n_grow_b12 = (0.2 + (0.65 * _S.MathFX.smooth(0.05,0.95,_n_ph_b9)))
	for _iter_2 in _S.array(_S.named_value(_n_P_b7,"ferns")):
		var _tuple_3 = _iter_2
		var _n_x_b20 = _S.prop(_tuple_3,0)
		var _n_y_b21 = _S.prop(_tuple_3,1)
		var _n_u_b22 = _S.prop(_tuple_3,2)
		if _S.truth((_n_u_b22 < _n_grow_b12)):
			_S.invoke(_n_p_b0,"px",[_S.call_value(_n_X_b10,[_n_x_b20]), _S.call_value(_n_Y_b11,[_n_y_b21]), (_n_WHITE if _S.truth((_n_u_b22 > (_n_grow_b12 - 0.1))) else (_S.index_value(_n_C_b3,6) if _S.truth((_S.MathFX.rand([_n_x_b20,_n_y_b21,5]) < 0.5)) else _S.index_value(_n_C_b3,5)))])
	for _iter_4 in _S.array(_S.named_value(_n_P_b7,"snow")):
		var _tuple_5 = _iter_4
		var _n_x_b23 = _S.prop(_tuple_5,0)
		var _n_y_b24 = _S.prop(_tuple_5,1)
		var _n_d_b25 = _S.prop(_tuple_5,2)
		_S.invoke(_n_p_b0,"px",[_S.call_value(_n_X_b10,[_n_x_b23]), (_S.call_value(_n_Y_b11,[_n_y_b24]) - 1), _S.index_value(_n_C_b3,7)])
		if _S.truth((_n_d_b25 > 1)):
			_S.invoke(_n_p_b0,"px",[_S.call_value(_n_X_b10,[_n_x_b23]), (_S.call_value(_n_Y_b11,[_n_y_b24]) - 2), (_S.index_value(_n_C_b3,7) if _S.truth((_S.MathFX.rand([_n_x_b23,_n_y_b24,9]) < 0.5)) else _S.index_value(_n_C_b3,6))])
	for _iter_6 in _S.array(_S.named_value(_n_P_b7,"icicles")):
		var _n_ic_b26 = _iter_6
		var _n_per_b27 = _S.named_value(_n_ic_b26,"period")
		var _n_u_b28 = fmod((fmod(((float(_n_t_b1)/_n_per_b27) + _S.named_value(_n_ic_b26,"phase")),1) + 1),1)
		var _n_L_b29 = (_S.named_value(_n_ic_b26,"len") * (0.55 + (0.45 * _S.MathFX.smooth(0,0.7,_n_u_b28))))
		var _n_x_b30 = _S.call_value(_n_X_b10,[_S.named_value(_n_ic_b26,"x")])
		var _n_y0_b31 = _S.call_value(_n_Y_b11,[_S.named_value(_n_ic_b26,"y")])
		if true:
			var _n_j_b32 = 0
			while _S.truth((_n_j_b32 < _n_L_b29)):
				var _n_v_b33 = (float(_n_j_b32)/_n_L_b29)
				_S.invoke(_n_p_b0,"px",[_n_x_b30, (_n_y0_b31 + _n_j_b32), (_n_WHITE if _S.truth((_n_v_b33 > 0.75)) else (_S.index_value(_n_C_b3,7) if _S.truth((_n_v_b33 < 0.3)) else _S.index_value(_n_C_b3,6)))])
				if _S.truth((_n_v_b33 < 0.5)):
					_S.invoke(_n_p_b0,"px",[(_n_x_b30 + 1), (_n_y0_b31 + _n_j_b32), _S.index_value(_n_C_b3,4)])
				_n_j_b32 += 1.0
		if _S.truth(((_n_u_b28 < 0.86) if _S.truth((_n_u_b28 > 0.7)) else (_n_u_b28 > 0.7))):
			_S.invoke(_n_p_b0,"px",[_n_x_b30, (_n_y0_b31 + _n_L_b29), _S.index_value(_n_C_b3,6)])
		else:
			if _S.truth((_n_u_b28 >= 0.86)):
				var _n_f_b34 = ((_n_u_b28 - 0.86) * _n_per_b27)
				var _n_y_b35 = ((_n_y0_b31 + _n_L_b29) + (((0.5 * 760) * _n_f_b34) * _n_f_b34))
				if _S.truth((_n_y_b35 < (-1))):
					_S.invoke(_n_p_b0,"px",[_n_x_b30, _n_y_b35, _S.index_value(_n_C_b3,6)])
					_S.invoke(_n_p_b0,"px",[_n_x_b30, (_n_y_b35 - 1), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"glow",[_n_x_b30, (_n_y0_b31 + (_n_L_b29 * 0.6)), 4, _S.index_value(_n_C_b3,5), 0.18])
	var _tuple_7 = _S.named_value(_n_P_b7,"mouth")
	var _n_mx0_b13 = _S.prop(_tuple_7,0)
	var _n_my0_b14 = _S.prop(_tuple_7,1)
	if true:
		var _n_i_b36 = 0
		while _S.truth((_n_i_b36 < 4)):
			var _n_age_b37 = ((_n_ph_b9 - 0.35) - (_n_i_b36 * 0.05))
			if _S.truth(((_n_age_b37 < 0) if _S.truth((_n_age_b37 < 0)) else (_n_age_b37 > 0.65))):
				_n_i_b36 += 1.0
				continue
			var _n_u_b38 = (float(_n_age_b37)/0.65)
			var _n_x_b39 = (((_S.call_value(_n_X_b10,[_n_mx0_b13]) + 1) + _S.call_value(_n_travel,[16, 0, 2.2, _n_age_b37])) + _n_i_b36)
			var _n_y_b40 = ((_S.call_value(_n_Y_b11,[_n_my0_b14]) - _S.call_value(_n_travel,[6, 3, 1, _n_age_b37])) - (_n_i_b36 * 0.5))
			var _n_rad_b41 = (0.8 + (2.4 * sqrt(_n_u_b38)))
			_S.invoke(_n_p_b0,"disc",[_n_x_b39, _n_y_b40, _n_rad_b41, _S.index_value(_n_C_b3,7), ((0.5 * (1 - _n_u_b38)) * minf(1,(_n_u_b38 * 8)))])
			_S.invoke(_n_p_b0,"disc",[(_n_x_b39 - (_n_rad_b41 * 0.2)), (_n_y_b40 - (_n_rad_b41 * 0.3)), (_n_rad_b41 * 0.5), _n_WHITE, (0.4 * (1 - _n_u_b38))])
			_n_i_b36 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 9, (_S.named_value(_n_o_b2,"seed") + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f30"), _S.function_value(_S.capture(_parent,{"a":_n_a_b4,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f31")])
	if _S.truth((_n_ph_b9 < 0.5)):
		if true:
			var _n_i_b42 = 0
			while _S.truth((_n_i_b42 < 8)):
				var _n_side_b43 = (1 if _S.truth(fmod(_n_i_b42,2)) else (-1))
				var _n_vx_b44 = (_n_side_b43 * (20 + (30 * _S.MathFX.rand([_n_i_b42,4]))))
				var _n_vy_b45 = (-(20 + (30 * _S.MathFX.rand([_n_i_b42,5]))))
				var _n_x_b46 = ((_n_side_b43 * (6 + (6 * _S.MathFX.rand([_n_i_b42,6])))) + (_n_vx_b44 * _n_ph_b9))
				var _n_y_b47 = (((_S.named_value(_n_a_b4,"y") + (3 * _S.MathFX.rand([_n_i_b42,7]))) + (_n_vy_b45 * _n_ph_b9)) + (((0.5 * 300) * _n_ph_b9) * _n_ph_b9))
				_S.invoke(_n_p_b0,"dot",[_n_x_b46, _n_y_b47, (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_i_b42,3)) else _n_WHITE), (1.2 - (_n_ph_b9 * 2))])
				_n_i_b42 += 1.0
	if _S.truth((_n_ph_b9 < 0.25)):
		_S.call_value(_n_sparkle,[_n_p_b0, _S.call_value(_n_X_b10,[floori((_S.named_value(_n_S_b5,"w") * 0.3)+0.5)]), _S.call_value(_n_Y_b11,[4]), floori((3 * (1 - (float(_n_ph_b9)/0.25)))+0.5), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.4])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + (_n_H_b6 * 0.45)), 30, _S.index_value(_n_C_b3,4), (0.2 + (0.12 * exp((float((-_n_ph_b9))/0.2))))])
	_S.invoke(_n_p_b0,"glow",[0, (_S.named_value(_n_a_b4,"y") + 2), 16, _S.index_value(_n_C_b3,5), 0.1])
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_dx = _S.read(_parent,"dx")
	var _n_mx_b0 = _S.arg(_args,0)
	return ((_S.named_value(_n_a,"x") + _n_mx_b0) + _n_dx)
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_my_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_a,"y") + _n_my_b0)
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.2, 1.8])
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a = _S.read(_parent,"a")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x_b3 = (_S.invoke(_n_r_b2,"range",[(-14), 14]) + (sin(((_n_age_b0 * 3) + (_S.invoke(_n_r_b2,"next",[]) * _n_TAU))) * 1.5))
	var _n_y_b4 = ((_S.named_value(_n_a,"y") - 16) + (_n_age_b0 * 14))
	if _S.truth((_n_y_b4 > (_S.named_value(_n_a,"y") + 2))):
		return null
	_S.invoke(_n_p,"dot",[_n_x_b3, _n_y_b4, (_n_WHITE if _S.truth((_S.invoke(_n_r_b2,"next",[]) < 0.5)) else _S.index_value(_n_C,6)), minf(1,(_n_age_b0 * 4))])
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_SHIVER = _S.read(_parent,"SHIVER")
	var _n_t_b0 = _S.arg(_args,0)
	return fmod((fmod(_n_t_b0,_n_SHIVER) + _n_SHIVER),_n_SHIVER)
	return null

static func _f33(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_since = _S.read(_parent,"since")
	var _n_t_b0 = _S.arg(_args,0)
	return ((1 if _S.truth(fmod(floori((_n_t_b0 * 50)),2)) else (-1)) if _S.truth((_S.call_value(_n_since,[_n_t_b0]) < 0.22)) else 0)
	return null
