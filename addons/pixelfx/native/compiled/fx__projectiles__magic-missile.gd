@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/magic-missile.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Magic missile"}, {"desc": "Motes gather into an arcane orb at a hand `height` px above the floor (the origin); it weaves to its target trailing a twisting ribbon and bursts into a star of light."}, {"tags": ["projectile", "magic", "arcane", "missile", "spell", "directional", "one-shot"]}, {"size": [208, 112]}, {"origin": [24, 104]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#140a26", "#2b1252", "#481c88", "#6b2cc0", "#9a48ec", "#c684ff", "#ecc8ff", "#ffffff"]}, {"height": 26}, {"reach": 112}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CHARGE", 0.2)
	_S.define(_e, "FLY", 0.62)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "X1", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pos", _S.function_value(_e, "_f2"))
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "trail", [])
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_X1 = _S.read(_parent,"X1")
	var _n_ease = _S.read(_parent,"ease")
	var _n_H = _S.read(_parent,"H")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_u_b0 = _S.arg(_args,0)
	return [((_n_X1 * _S.invoke(_n_ease,"inOutSine",[_n_u_b0])) + (sin((_n_u_b0 * PI)) * 6)), ((-_n_H) + ((sin(((_n_u_b0 * _n_TAU) * 1.5)) * 9) * sin((_n_u_b0 * PI))))]
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CHARGE"))):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.8])):
			var _v1 = _S.scope(_v0)
			_S.define(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
			_S.define(_v1, "d", _S.invoke(_S.read(_v1, "R"), "range", [12, 26]))
			_S.define(_v1, "sp", _S.binary("/", _S.read(_v1, "d"), 0.14))
			_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "d")), _S.binary("+", _S.unary("-", _S.read(_v1, "H")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "d"))), _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")])), _S.read(_v1, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.5)), _S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")])), _S.read(_v1, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.5)), 0.14, _S.invoke(_S.read(_v1, "R"), "pick", [[_S.prop(_S.read(_v1, "C"), 5), _S.prop(_S.read(_v1, "C"), 6), _S.read(_v1, "WHITE")]]), 0.8])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CHARGE"), _S.read(_e, "FLY")))):
			var _v2 = _S.scope(_e)
			_S.define(_v2, "u", _S.binary("/", _S.binary("-", _S.read(_v2, "t"), _S.read(_v2, "CHARGE")), _S.read(_v2, "FLY")))
			var _v3 = _S.call_value(_S.read(_v2, "pos"), [_S.read(_v2, "u")])
			_S.define(_v2, "x", _S.prop(_v3, 0))
			_S.define(_v2, "y", _S.prop(_v3, 1))
			_S.invoke(_S.read(_v2, "trail"), "push", [_S.merge([{"x": _S.read(_v2, "x")}, {"y": _S.read(_v2, "y")}, {"t": _S.read(_v2, "t")}])])
			if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.6])):
				_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "MOTE"), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 50), 50]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 50), 50]), _S.invoke(_S.read(_v2, "R"), "range", [0.2, 0.4]), _S.invoke(_S.read(_v2, "R"), "pick", [[_S.prop(_S.read(_v2, "C"), 4), _S.prop(_S.read(_v2, "C"), 5), _S.prop(_S.read(_v2, "C"), 6)]]), 0.7])
			if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.25])):
				_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STAR"), _S.binary("+", _S.read(_v2, "x"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.read(_v2, "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3])), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v2, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v2, "C"), 6), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1.6])])
		else:
			if _S.truth(_S.unary("!", _S.read(_e, "burst"))):
				var _v4 = _S.scope(_e)
				_S.write(_v4, "burst", true, "=", false)
				_S.define(_v4, "y", _S.unary("-", _S.read(_v4, "H")))
				_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X1"), _S.read(_v4, "y"), 52, _S.prop(_S.read(_v4, "C"), 4), 0.95, 0.55])
				_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "X1"), _S.read(_v4, "y"), 22, _S.read(_v4, "WHITE"), 0.8, 0.12])
				var _v5 = _S.scope(_v4)
				_S.define(_v5, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v5, "i"), 26)):
					var _v6 = _S.scope(_v5)
					_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
					_S.define(_v6, "sp", _S.binary("*", _S.invoke(_S.read(_v6, "R"), "range", [60, 150]), _S.binary("-", 1, _S.binary("*", 0.65, _S.invoke(_S.read(_v6, "Math"), "max", [0, _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")])])))))
					_S.invoke(_S.read(_v6, "ps"), "spawn", [(_S.prop(_S.read(_v6, "P"), "MOTE") if _S.truth(_S.binary("%", _S.read(_v6, "i"), 3)) else _S.prop(_S.read(_v6, "P"), "STAR")), _S.read(_v6, "X1"), _S.read(_v6, "y"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.invoke(_S.read(_v6, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 6), _S.read(_v6, "WHITE")]]), _S.invoke(_S.read(_v6, "R"), "range", [0.8, 1.8])])
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "i", 1, "+=", true)
				var _v7 = _S.scope(_v4)
				_S.define(_v7, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v7, "i"), 18)):
					var _v8 = _S.scope(_v7)
					_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
					_S.define(_v8, "sp", _S.binary("*", _S.invoke(_S.read(_v8, "R"), "range", [110, 240]), _S.binary("-", 1, _S.binary("*", 0.5, _S.invoke(_S.read(_v8, "Math"), "max", [0, _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")])])))))
					_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SPARK"), _S.read(_v8, "X1"), _S.read(_v8, "y"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 30), _S.invoke(_S.read(_v8, "R"), "range", [0.12, 0.3])])
					_v7 = _S.iteration(_v7)
					_S.write(_v7, "i", 1, "+=", true)
				var _v9 = _S.scope(_v4)
				_S.define(_v9, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v9, "i"), 14)):
					var _v10 = _S.scope(_v9)
					_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
					_S.define(_v10, "d", _S.invoke(_S.read(_v10, "R"), "range", [4, 22]))
					_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.binary("+", _S.read(_v10, "X1"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "d"))), _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "d")), 0.8)), 0, _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [2, 8])), _S.invoke(_S.read(_v10, "R"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v10, "R"), "pick", [[_S.prop(_S.read(_v10, "C"), 6), _S.read(_v10, "WHITE"), _S.prop(_S.read(_v10, "C"), 5)]]), _S.invoke(_S.read(_v10, "R"), "range", [0.8, 2.6]), _S.invoke(_S.read(_v10, "R"), "range", [0.05, 0.45])])
					_v9 = _S.iteration(_v9)
					_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_trail = _S.read(_parent,"trail")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_CHARGE = _S.read(_parent,"CHARGE")
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_H = _S.read(_parent,"H")
	var _n_pos = _S.read(_parent,"pos")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_X1 = _S.read(_parent,"X1")
	var _n_flare = _S.read(_parent,"flare")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_lights = _S.read(_parent,"lights")
	var _n_clamp = _S.read(_parent,"clamp")
	var _n_smooth = _S.read(_parent,"smooth")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_now_b1 = _n_t
	var _n_keep_b2 = _S.invoke(_n_trail,"filter",[_S.function_value(_S.capture(_parent,{"now":_n_now_b1,"this":_this}),"_f5")])
	if true:
		var _n_i_b4 = 1
		while _S.truth((_n_i_b4 < _S.prop(_n_keep_b2,"length"))):
			var _n_a_b5 = _S.index_value(_n_keep_b2,(_n_i_b4 - 1))
			var _n_b_b6 = _S.index_value(_n_keep_b2,_n_i_b4)
			var _n_dx_b7 = (_S.named_value(_n_b_b6,"x") - _S.named_value(_n_a_b5,"x"))
			var _n_dy_b8 = (_S.named_value(_n_b_b6,"y") - _S.named_value(_n_a_b5,"y"))
			var _n_l_b9 = _S.logical("||",_S.Bridge.hypot([_n_dx_b7, _n_dy_b8]),func():return 1)
			var _n_nx_b10 = (float((-_n_dy_b8))/_n_l_b9)
			var _n_ny_b11 = (float(_n_dx_b7)/_n_l_b9)
			if true:
				var _n_f_b12 = 0
				while _S.truth((_n_f_b12 < 1)):
					var _n_tt_b13 = (_S.named_value(_n_a_b5,"t") + ((_S.named_value(_n_b_b6,"t") - _S.named_value(_n_a_b5,"t")) * _n_f_b12))
					var _n_k_b14 = (1 - (float((_n_now_b1 - _n_tt_b13))/0.32))
					var _n_tw_b15 = sin((_n_tt_b13 * 26))
					var _n_w_b16 = (((3.2 * _n_k_b14) * absf(_n_tw_b15)) + 0.4)
					var _n_face_b17 = (_n_tw_b15 > 0)
					var _n_x_b18 = (_S.named_value(_n_a_b5,"x") + (_n_dx_b7 * _n_f_b12))
					var _n_y_b19 = (_S.named_value(_n_a_b5,"y") + (_n_dy_b8 * _n_f_b12))
					if true:
						var _n_s_b20 = (-_n_w_b16)
						while _S.truth((_n_s_b20 <= _n_w_b16)):
							var _n_edge_b21 = (absf(_n_s_b20) > (_n_w_b16 - 0.8))
							var _n_c_b22 = ((_S.index_value(_n_C,6) if _S.truth(_n_edge_b21) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b14 > 0.6)) else _S.index_value(_n_C,4))) if _S.truth(_n_face_b17) else (_S.index_value(_n_C,4) if _S.truth(_n_edge_b21) else _S.index_value(_n_C,2)))
							_S.invoke(_n_p_b0,"dot",[(_n_x_b18 + (_n_nx_b10 * _n_s_b20)), (_n_y_b19 + (_n_ny_b11 * _n_s_b20)), _n_c_b22, (1 if _S.truth((_n_k_b14 > 0.35)) else (float(_n_k_b14)/0.35))])
							_n_s_b20 += 0.5
					_n_f_b12 += (float(0.5)/_n_l_b9)
			if _S.truth(_S.binary("===",fmod(_n_i_b4,3),0)):
				_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b6,"x"), _S.named_value(_n_b_b6,"y"), 6, _S.index_value(_n_C,4), (0.25 * (1 - (float((_n_now_b1 - _S.named_value(_n_b_b6,"t")))/0.32)))])
			_n_i_b4 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	if _S.truth((_n_t < (_n_CHARGE + _n_FLY))):
		var _n_k_b23 = ((float(_n_t)/_n_CHARGE) if _S.truth((_n_t < _n_CHARGE)) else 1)
		var _tuple_0 = ([0, (-_n_H)] if _S.truth((_n_t < _n_CHARGE)) else _S.call_value(_n_pos,[(float((_n_t - _n_CHARGE))/_n_FLY)]))
		var _n_x_b24 = _S.prop(_tuple_0,0)
		var _n_y_b25 = _S.prop(_tuple_0,1)
		var _n_r_b26 = (1 + (3 * _S.invoke(_n_ease,"outBack",[_n_k_b23])))
		_S.invoke(_n_p_b0,"circle",[_n_x_b24, _n_y_b25, (_n_r_b26 + 1.4), _S.index_value(_n_C,3)])
		_S.invoke(_n_p_b0,"circle",[_n_x_b24, _n_y_b25, (_n_r_b26 + 0.4), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[(_n_x_b24 - 0.4), (_n_y_b25 - 0.4), (_n_r_b26 * 0.55), _n_WHITE])
		if true:
			var _n_i_b27 = 0
			while _S.truth((_n_i_b27 < 3)):
				var _n_a_b28 = ((_n_t * 14) + (float((_n_i_b27 * _n_TAU))/3))
				_S.invoke(_n_p_b0,"px",[(_n_x_b24 + (cos(_n_a_b28) * (_n_r_b26 + 3))), (_n_y_b25 + ((sin(_n_a_b28) * (_n_r_b26 + 3)) * 0.6)), (_S.index_value(_n_C,6) if _S.truth(_n_i_b27) else _n_WHITE)])
				_n_i_b27 += 1.0
		_S.invoke(_n_p_b0,"glow",[_n_x_b24, _n_y_b25, 20, _S.index_value(_n_C,4), (0.65 * _n_k_b23)])
		_S.invoke(_n_p_b0,"glow",[_n_x_b24, _n_y_b25, 7, _S.index_value(_n_C,6), (0.5 * _n_k_b23)])
	var _n_q_b3 = ((_n_t - _n_CHARGE) - _n_FLY)
	if _S.truth(((_n_q_b3 < 0.5) if _S.truth((_n_q_b3 >= 0)) else (_n_q_b3 >= 0))):
		var _n_e_b29 = (float(_n_q_b3)/0.5)
		if _S.truth((_n_e_b29 < 0.5)):
			_S.call_value(_n_flare,[_n_p_b0, _n_X1, (-_n_H), ((26 * pow((1 - (_n_e_b29 * 2)),1.2)) + 2), (1 - (_n_e_b29 * 2)), _n_C])
		if _S.truth((_n_e_b29 < 0.12)):
			_S.invoke(_n_p_b0,"circle",[_n_X1, (-_n_H), ((6 * (1 - (float(_n_e_b29)/0.12))) + 1), _n_WHITE])
		_S.invoke(_n_p_b0,"ring",[_n_X1, (-_n_H), (4 + (20 * _S.invoke(_n_ease,"outCubic",[_n_e_b29]))), maxf(1,(2.5 * (1 - _n_e_b29))), (_S.index_value(_n_C,6) if _S.truth((_n_e_b29 < 0.3)) else _S.index_value(_n_C,5)), minf(1,((1 - _n_e_b29) * 1.5))])
		if _S.truth((_n_e_b29 < 0.4)):
			_S.call_value(_n_sparkle,[_n_p_b0, _n_X1, (-_n_H), (7 * (1 - (float(_n_e_b29)/0.4))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), (0.6 * (1 - (float(_n_e_b29)/0.4)))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	_n_clamp
	_n_smooth
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_now = _S.read(_parent,"now")
	var _n_q_b0 = _S.arg(_args,0)
	return ((_n_now - _S.named_value(_n_q_b0,"t")) < 0.32)
	return null
