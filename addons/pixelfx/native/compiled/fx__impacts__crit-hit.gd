@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/crit-hit.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "brokenRing", _S.import_value("fx/impacts/_lib.js", "brokenRing"))
	_S.define(_e, "flare", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Critical hit"}, {"desc": "A critical hit: a jagged starburst slams in white and overshoots, a ring breaks into flying arcs, sparks streak off, shards tumble to the floor under a big flare."}, {"tags": ["impact", "hit", "crit", "critical", "combat", "directional", "one-shot"]}, {"size": [216, 136]}, {"origin": [84, 106]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a0510", "#5c0a1c", "#a3142a", "#e0302c", "#ff7a2a", "#ffc23d", "#fff09a", "#ffffff"]}, {"height": 26}, {"aim": 0.12}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "KEYS", [[0, 1, 1, 1, [6, 7, 7, 7]], [0.025, 1.3, 1, 1, [2, 5, 6, 7]], [0.058, 1.05, 0.72, 1, [2, 4, 5, 6]], [0.092, 1.22, 0.3, 1, [1, 2, 3, 4]], [0.125]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	var _n_C_b5 = _S.arg(_args,5)
	for _iter_0 in _S.array([[1, 0, _n_L_b3], [0, 1, (_n_L_b3 * 0.45)], [0.7, 0.7, (_n_L_b3 * 0.16)], [0.7, (-0.7), (_n_L_b3 * 0.16)]]):
		var _tuple_1 = _iter_0
		var _n_dx_b6 = _S.prop(_tuple_1,0)
		var _n_dy_b7 = _S.prop(_tuple_1,1)
		var _n_len_b8 = _S.prop(_tuple_1,2)
		for _iter_2 in _S.array([(-1), 1]):
			var _n_s_b9 = _iter_2
			if true:
				var _n_d_b10 = 1
				while _S.truth((_n_d_b10 <= _n_len_b8)):
					var _n_u_b11 = (float(_n_d_b10)/_n_len_b8)
					var _n_a_b12 = (1 if _S.truth((_n_u_b11 < 0.7)) else (_n_k_b4 * (1.6 - _n_u_b11)))
					_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + ((_n_s_b9 * _n_dx_b6) * _n_d_b10)), (_n_y_b2 + ((_n_s_b9 * _n_dy_b7) * _n_d_b10)), (_n_WHITE if _S.truth((_n_u_b11 < 0.35)) else (_S.index_value(_n_C_b5,6) if _S.truth((_n_u_b11 < 0.7)) else _S.index_value(_n_C_b5,5))), _n_a_b12])
					if _S.truth(((_n_u_b11 < 0.42) if _S.truth(_S.binary("===",_n_dy_b7,0)) else _S.binary("===",_n_dy_b7,0))):
						for _iter_3 in _S.array([(-1), 1]):
							var _n_e_b13 = _iter_3
							_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (_n_s_b9 * _n_d_b10)), (_n_y_b2 + _n_e_b13), (_S.index_value(_n_C_b5,6) if _S.truth((_n_u_b11 < 0.2)) else _S.index_value(_n_C_b5,5)), (1 if _S.truth((_n_u_b11 < 0.3)) else _n_k_b4)])
					_n_d_b10 += 1.0
	_S.invoke(_n_p_b0,"glowLine",[(_n_x_b1 - _n_L_b3), _n_y_b2, (_n_x_b1 + _n_L_b3), _n_y_b2, 6, _S.index_value(_n_C_b5,6), (0.5 * _n_k_b4)])
	_S.invoke(_n_p_b0,"glowLine",[_n_x_b1, (_n_y_b2 - (_n_L_b3 * 0.45)), _n_x_b1, (_n_y_b2 + (_n_L_b3 * 0.45)), 4, _S.index_value(_n_C_b5,6), (0.3 * _n_k_b4)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "aim"))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 14, _S.read(_e, "A"), _S.merge([{"len": [11, 15]}, {"w": [1.8, 2.5]}, {"fwd": 1.4}, {"back": 0.6}, {"jag": 0.5}])]))
	_S.invoke(_S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "sp"))]), "sort", [_S.function_value(_e, "_f3")]), "slice", [0, 2]), "forEach", [_S.function_value(_e, "_f4")])
	_S.define(_e, "segs", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f5")]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 84, _S.prop(_S.read(_e, "C"), 5), 0.6, 0.5])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 30, _S.read(_e, "WHITE"), 0.7, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.unary("-", 4), 44, _S.prop(_S.read(_e, "C"), 4), 0.3, 0.45])
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), 36)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "back", _S.invoke(_S.read(_v10, "R"), "chance", [0.22]))
		_S.define(_v10, "a", _S.binary("+", (_S.binary("+", _S.read(_v10, "A"), _S.prop(_S.read(_v10, "Math"), "PI")) if _S.truth(_S.read(_v10, "back")) else _S.read(_v10, "A")), _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1), 1]), (0.6 if _S.truth(_S.read(_v10, "back")) else 0.8))))
		_S.define(_v10, "v", _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [170, 430]), (0.6 if _S.truth(_S.read(_v10, "back")) else 1)))
		_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SPARK"), _S.read(_v10, "X"), _S.read(_v10, "Y"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "v")), 50), _S.invoke(_S.read(_v10, "R"), "range", [0.15, 0.5]), _S.read(_v10, "WHITE"), 1, (_S.invoke(_S.read(_v10, "R"), "range", [0, 0.04]) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.3])) else 0)])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 10)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.binary("-", _S.binary("+", _S.read(_v12, "A"), _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1), 1]), 1.1)), 0.35))
		_S.define(_v12, "v", _S.invoke(_S.read(_v12, "R"), "range", [110, 280]))
		_S.invoke(_S.read(_v12, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v12, "B"), "SHARD")}, {"x": _S.read(_v12, "X")}, {"y": _S.read(_v12, "Y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "v"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "v")), 40)}, {"g": 0.8}, {"drag": 0.7}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v12, "R"), "range", [0.55, 0.85])}, {"a": _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")])}, {"va": _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 25), 25])}, {"s": _S.invoke(_S.read(_v12, "R"), "range", [2, 4.5])}, {"c": _S.invoke(_S.read(_v12, "R"), "pick", [[_S.prop(_S.read(_v12, "C"), 7), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 5)]])}])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 12)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "a", _S.binary("+", _S.binary("-", _S.read(_v14, "A"), _S.binary("/", _S.prop(_S.read(_v14, "Math"), "PI"), 2)), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.4), 1.4])))
		_S.define(_v14, "v", _S.invoke(_S.read(_v14, "R"), "range", [35, 110]))
		_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "MOTE"), _S.binary("+", _S.read(_v14, "X"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), 4)), _S.binary("+", _S.read(_v14, "Y"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "v")), 15), _S.invoke(_S.read(_v14, "R"), "range", [0.35, 0.7]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "C"), 6), _S.prop(_S.read(_v14, "C"), 5), _S.prop(_S.read(_v14, "C"), 5)]]), 0.6, _S.invoke(_S.read(_v14, "R"), "range", [0, 0.05])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), 5)):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
		_S.define(_v16, "d", _S.invoke(_S.read(_v16, "R"), "range", [14, 34]))
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "STAR"), _S.binary("+", _S.read(_v16, "X"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "d"))), _S.binary("+", _S.read(_v16, "Y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "d")), 0.8)), 0, _S.unary("-", 4), _S.invoke(_S.read(_v16, "R"), "range", [0.22, 0.38]), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.read(_v16, "WHITE")), _S.invoke(_S.read(_v16, "R"), "range", [1.6, 3]), _S.invoke(_S.read(_v16, "R"), "range", [0.08, 0.32])])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_b_b1,"len") - _S.named_value(_n_a_b0,"len"))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	return _S.set_prop(_n_s_b0,"len",1.3,"*=")
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (_n_A + ((float(_n_i_b1)/7) * _n_TAU))
	return {"a":_n_a_b2,"gap":_S.invoke(_n_R,"range",[0.55, 0.85]),"dr":(_S.invoke(_n_R,"range",[0.08, 0.4]) + (0.15 * maxf(0,cos((_n_a_b2 - _n_A))))),"w":(0.7 + (0.5 * maxf(0,cos((_n_a_b2 - _n_A)))))}
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ease = _S.read(_parent,"ease")
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_segs = _S.read(_parent,"segs")
	var _n_C = _S.read(_parent,"C")
	var _n_brokenRing = _S.read(_parent,"brokenRing")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_flare = _S.read(_parent,"flare")
	var _n_KEYS = _S.read(_parent,"KEYS")
	var _n_sp = _S.read(_parent,"sp")
	var _n_star = _S.read(_parent,"star")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_u_b1 = clampf((float((_n_t - 0.03))/0.37),0.0,1.0)
	if _S.truth(((_n_u_b1 < 1) if _S.truth((_n_t >= 0.03)) else (_n_t >= 0.03))):
		var _n_r_b4 = (10 + (30 * _S.invoke(_n_ease,"outCubic",[_n_u_b1])))
		var _n_brk_b5 = _S.MathFX.smooth(0.12,0.6,_n_u_b1)
		var _n_th_b6 = maxf(1,(3.6 * pow((1 - _n_u_b1),1.2)))
		var _n_i_b7 = (7 if _S.truth((_n_u_b1 < 0.12)) else (6 if _S.truth((_n_u_b1 < 0.3)) else (5 if _S.truth((_n_u_b1 < 0.5)) else (4 if _S.truth((_n_u_b1 < 0.75)) else 3))))
		_S.call_value(_n_brokenRing,[_n_p_b0, _n_X, _n_Y, _n_r_b4, _n_th_b6, _n_segs, _n_brk_b5, _S.index_value(_n_C,_n_i_b7), _S.index_value(_n_C,maxf(2,(_n_i_b7 - 2))), (1 if _S.truth((_n_u_b1 < 0.6)) else (float((1 - _n_u_b1))/0.4)), 1, 0])
		if _S.truth((_n_u_b1 < 0.6)):
			_S.invoke(_n_p_b0,"glowRing",[_n_X, _n_Y, _n_r_b4, 6, _S.index_value(_n_C,5), (0.35 * pow((1 - (float(_n_u_b1)/0.6)),2))])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	var _n_f_b2 = (float((_n_t - 0.04))/0.28)
	if _S.truth(((_n_f_b2 < 1) if _S.truth((_n_f_b2 > 0)) else (_n_f_b2 > 0))):
		_S.call_value(_n_flare,[_n_p_b0, _n_X, _n_Y, (64 * pow((1 - _n_f_b2),1.3)), (1 - _n_f_b2), _n_C])
		_S.invoke(_n_p_b0,"glow",[_n_X, _n_Y, 56, _S.index_value(_n_C,5), (0.4 * (1 - _n_f_b2))])
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < (_S.prop(_n_KEYS,"length") - 1))):
			if _S.truth(((_n_t < _S.index_value(_S.index_value(_n_KEYS,(_n_i_b8 + 1)),0)) if _S.truth((_n_t >= _S.index_value(_S.index_value(_n_KEYS,_n_i_b8),0))) else (_n_t >= _S.index_value(_S.index_value(_n_KEYS,_n_i_b8),0)))):
				var _tuple_0 = _S.index_value(_n_KEYS,_n_i_b8)
				var _n_sc_b9 = _S.prop(_tuple_0,1)
				var _n_th_b10 = _S.prop(_tuple_0,2)
				var _n_a_b11 = _S.prop(_tuple_0,3)
				var _n_cols_b12 = _S.prop(_tuple_0,4)
				_S.call_value(_n_star,[_n_p_b0, _n_X, _n_Y, _n_sp, _n_sc_b9, _n_th_b10, _S.invoke(_n_cols_b12,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f8")]), _n_a_b11, 2.6])
			_n_i_b8 += 1.0
	var _n_pop_b3 = exp((float((-_n_t))/0.05))
	if _S.truth((_n_pop_b3 > 0.02)):
		_S.invoke(_n_p_b0,"glow",[_n_X, _n_Y, 44, _S.index_value(_n_C,5), (0.4 * _n_pop_b3)])
		_S.invoke(_n_p_b0,"glow",[_n_X, _n_Y, 12, _n_WHITE, (0.6 * _n_pop_b3)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_j_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,_n_j_b0)
	return null
