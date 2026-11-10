@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/hit-spark.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "ray", _S.function_value(_e, "_f0"))
	_S.define(_e, "diamond", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Hit spark"}, {"desc": "The everyday hit: a sharp, lopsided cross flare with one long ray along the blow round a white diamond core, then a cone of sparks and hot chips that fall and bounce."}, {"tags": ["impact", "hit", "spark", "combat", "directional", "one-shot"]}, {"size": [136, 80]}, {"origin": [44, 64]}, {"duration": 0.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffe26b", "#fff3a6", "#ffffff"]}, {"height": 20}, {"aim": 0.1}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_w_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _n_from_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	var _n_c_b8 = cos(_n_a_b3)
	var _n_s_b9 = sin(_n_a_b3)
	if true:
		var _n_d_b10 = (_n_from_b7 * _n_L_b4)
		while _S.truth((_n_d_b10 <= _n_L_b4)):
			var _n_u_b11 = (float(_n_d_b10)/_n_L_b4)
			var _n_hw_b12 = (_n_w_b5 * pow((1 - _n_u_b11),1.6))
			var _n_col_b13 = (_n_WHITE if _S.truth((_n_u_b11 < 0.3)) else (_S.index_value(_n_C_b6,5) if _S.truth((_n_u_b11 < 0.62)) else (_S.index_value(_n_C_b6,4) if _S.truth((_n_u_b11 < 0.88)) else _S.index_value(_n_C_b6,3))))
			_S.invoke(_n_p_b0,"px",[(_n_x_b1 + (_n_c_b8 * _n_d_b10)), (_n_y_b2 + (_n_s_b9 * _n_d_b10)), _n_col_b13])
			if _S.truth((_n_hw_b12 > 0.45)):
				if true:
					var _n_o_b14 = 0.5
					while _S.truth((_n_o_b14 <= _n_hw_b12)):
						for _iter_0 in _S.array([(-_n_o_b14), _n_o_b14]):
							var _n_e_b15 = _iter_0
							_S.invoke(_n_p_b0,"px",[((_n_x_b1 + (_n_c_b8 * _n_d_b10)) - (_n_s_b9 * _n_e_b15)), ((_n_y_b2 + (_n_s_b9 * _n_d_b10)) + (_n_c_b8 * _n_e_b15)), (_S.index_value(_n_C_b6,5) if _S.truth(((_n_o_b14 < 1) if _S.truth((_n_u_b11 < 0.3)) else (_n_u_b11 < 0.3))) else _S.index_value(_n_C_b6,4))])
						_n_o_b14 += 0.5
			_n_d_b10 += 0.5
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	if true:
		var _n_dy_b5 = ((-_n_r_b3) - 1)
		while _S.truth((_n_dy_b5 <= (_n_r_b3 + 1))):
			if true:
				var _n_dx_b6 = ((-_n_r_b3) - 1)
				while _S.truth((_n_dx_b6 <= (_n_r_b3 + 1))):
					var _n_m_b7 = (absf(_n_dx_b6) + absf(_n_dy_b5))
					if _S.truth((_n_m_b7 <= _n_r_b3)):
						_S.invoke(_n_p_b0,"px",[(_n_x_b1 + _n_dx_b6), (_n_y_b2 + _n_dy_b5), _n_WHITE])
					else:
						if _S.truth(_S.binary("===",_n_m_b7,(_n_r_b3 + 1))):
							_S.invoke(_n_p_b0,"px",[(_n_x_b1 + _n_dx_b6), (_n_y_b2 + _n_dy_b5), _S.index_value(_n_C_b4,3)])
					_n_dx_b6 += 1.0
			_n_dy_b5 += 1.0
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "aim"))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "tilt", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08]))
	_S.define(_e, "rays", [_S.merge([{"a": _S.binary("+", _S.read(_e, "A"), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [33, 37])}, {"w": 2.2}]), _S.merge([{"a": _S.binary("+", _S.binary("+", _S.read(_e, "A"), _S.prop(_S.read(_e, "Math"), "PI")), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [8, 10])}, {"w": 2.2}]), _S.merge([{"a": _S.binary("+", _S.binary("-", _S.read(_e, "A"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [15, 18])}, {"w": 2.6}]), _S.merge([{"a": _S.binary("+", _S.binary("+", _S.read(_e, "A"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [10, 12])}, {"w": 2.3}]), _S.merge([{"a": _S.binary("+", _S.binary("-", _S.read(_e, "A"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 4)), _S.read(_e, "tilt"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [5, 7])}, {"w": 1}])])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 38, _S.prop(_S.read(_e, "C"), 4), 0.35, 0.18])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.binary("+", _S.read(_e, "X"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "A")]), 10)), _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "A")]), 10)), 22, _S.prop(_S.read(_e, "C"), 5), 0.45, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.unary("-", 2), 26, _S.prop(_S.read(_e, "C"), 3), 0.22, 0.22])
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), 9)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("-", _S.binary("+", _S.read(_v9, "A"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.6), 0.6])), 0.15))
		_S.define(_v9, "v", _S.invoke(_S.read(_v9, "R"), "range", [170, 360]))
		_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "SPARK"), _S.binary("+", _S.read(_v9, "X"), 1), _S.read(_v9, "Y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "v")), 40), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.45]), _S.read(_v9, "WHITE"), 1, (_S.invoke(_S.read(_v9, "R"), "range", [0.01, 0.03]) if _S.truth(_S.binary(">", _S.read(_v9, "i"), 6)) else 0)])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 6)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "a", _S.binary("-", _S.binary("+", _S.read(_v11, "A"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 1.1), 0.5])), 0.3))
		_S.define(_v11, "v", _S.invoke(_S.read(_v11, "R"), "range", [70, 170]))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "GRIT"), _S.binary("+", _S.read(_v11, "X"), 1), _S.read(_v11, "Y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.invoke(_S.read(_v11, "R"), "range", [30, 80])), _S.invoke(_S.read(_v11, "R"), "range", [0.35, 0.45]), _S.invoke(_S.read(_v11, "R"), "pick", [[_S.prop(_S.read(_v11, "C"), 5), _S.prop(_S.read(_v11, "C"), 4), _S.prop(_S.read(_v11, "C"), 4), _S.prop(_S.read(_v11, "C"), 3)]]), 1])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_t = _S.read(_parent,"t")
	var _n_ray = _S.read(_parent,"ray")
	var _n_X = _S.read(_parent,"X")
	var _n_Y = _S.read(_parent,"Y")
	var _n_C = _S.read(_parent,"C")
	var _n_rays = _S.read(_parent,"rays")
	var _n_diamond = _S.read(_parent,"diamond")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_A = _S.read(_parent,"A")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	if _S.truth((_n_t < 0.025)):
		for _iter_0 in _S.array(_n_rays):
			var _n_r_b2 = _iter_0
			_S.call_value(_n_ray,[_n_p_b0, _n_X, _n_Y, _S.named_value(_n_r_b2,"a"), _S.named_value(_n_r_b2,"L"), _S.named_value(_n_r_b2,"w"), _n_C])
		_S.call_value(_n_diamond,[_n_p_b0, _n_X, _n_Y, 4, _n_C])
	else:
		if _S.truth((_n_t < 0.058)):
			for _iter_1 in _S.array(_n_rays):
				var _n_r_b3 = _iter_1
				_S.call_value(_n_ray,[_n_p_b0, _n_X, _n_Y, _S.named_value(_n_r_b3,"a"), (_S.named_value(_n_r_b3,"L") * 1.2), (_S.named_value(_n_r_b3,"w") * 0.55), _n_C, 0.12])
			_S.call_value(_n_diamond,[_n_p_b0, _n_X, _n_Y, 3, _n_C])
		else:
			if _S.truth((_n_t < 0.092)):
				var _n_r_b4 = _S.index_value(_n_rays,0)
				_S.call_value(_n_ray,[_n_p_b0, _n_X, _n_Y, _S.named_value(_n_r_b4,"a"), (_S.named_value(_n_r_b4,"L") * 1.3), 0.6, [_S.index_value(_n_C,0), _S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,3), _S.index_value(_n_C,3), _S.index_value(_n_C,4)], 0.4])
	var _n_pop_b1 = exp((float((-_n_t))/0.045))
	if _S.truth((_n_pop_b1 > 0.02)):
		_S.invoke(_n_p_b0,"glow",[_n_X, _n_Y, 22, _S.index_value(_n_C,4), (0.3 * _n_pop_b1)])
		_S.invoke(_n_p_b0,"glow",[_n_X, _n_Y, 7, _n_WHITE, (0.15 * _n_pop_b1)])
		_S.invoke(_n_p_b0,"glowLine",[_n_X, _n_Y, (_n_X + (cos(_n_A) * 26)), (_n_Y + (sin(_n_A) * 26)), 4, _S.index_value(_n_C,5), (0.25 * _n_pop_b1)])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
