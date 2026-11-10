@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/arcane-missiles.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "HX", 15)
	_S.define(_e, "HY", _S.unary("-", 24))
	_S.define(_e, "TX", 152)
	_S.define(_e, "TY", _S.unary("-", 22))
	_S.define(_e, "N", 5)
	_S.define(_e, "TRAIL", 18)
	_S.define(_e, "meta", _S.merge([{"name": "Arcane missiles"}, {"desc": "A volley of violet bolts fans out of the hand, curls round on twisting ribbons and pops on the target one after another."}, {"tags": ["arcane", "missile", "projectile", "homing", "volley", "magic", "directional", "one-shot"]}, {"size": [240, 116]}, {"origin": [26, 88]}, {"duration": 1.75}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OPEN", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 24)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 22)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "KICK", _S.merge([_S.read(_e, "OPEN"), {"fx": 15}, {"fy": _S.unary("-", 26)}, {"lean": 2}]))
	_S.define(_e, "GATHER", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": _S.unary("-", 2)}, {"fx": 6}, {"fy": _S.unary("-", 24)}, {"bx": 8}, {"by": _S.unary("-", 24)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 152}])}, {"poses": [[_S.unary("-", 0.52), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.24), _S.read(_e, "GATHER")], [0, _S.merge([_S.read(_e, "GATHER"), {"crouch": 5}])], [0.05, _S.read(_e, "KICK"), "snap"], [0.1, _S.read(_e, "OPEN"), "snap"], [0.15, _S.read(_e, "KICK"), "snap"], [0.2, _S.read(_e, "OPEN"), "snap"], [0.25, _S.read(_e, "KICK"), "snap"], [0.29, _S.read(_e, "OPEN"), "snap"], [0.33, _S.read(_e, "KICK"), "snap"], [0.38, _S.read(_e, "OPEN"), "snap"], [0.43, _S.read(_e, "KICK"), "snap"], [0.48, _S.read(_e, "OPEN"), "snap"], [1.2, _S.merge([_S.read(_e, "OPEN"), {"crouch": 3}])], [1.7, _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])]]}, {"hits": [_S.merge([{"t": 0.77}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 0.85}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 0.95}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 1.08}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 1.2}, {"stop": 0.07}, {"shake": 0.14}, {"amp": 1}, {"push": 1.4}, {"straw": 9}, {"y": _S.unary("-", 24)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "ribbon", _S.function_value(_e, "_f1"))
	_S.define(_e, "head", _S.function_value(_e, "_f2"))
	_S.define(_e, "pop", _S.function_value(_e, "_f3"))
	_S.define(_e, "lock", _S.function_value(_e, "_f4"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f5")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "fan", [_S.unary("-", 1.05), 0.7, _S.unary("-", 0.5), 1.1, _S.unary("-", 1.4)])
	_S.define(_e, "bolts", _S.invoke(_S.read(_e, "fan"), "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "pops", [])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_pts_b2 = _S.named_value(_n_b_b1,"trail")
	var _n_n_b3 = _S.prop(_n_pts_b2,"length")
	var _n_fade_b4 = (1 if _S.truth((_S.named_value(_n_b_b1,"hit") < 0)) else (1 - clampf((float((_n_t - _S.named_value(_n_b_b1,"hit")))/0.16),0.0,1.0)))
	if _S.truth(((_n_n_b3 < 2) if _S.truth((_n_n_b3 < 2)) else (_n_fade_b4 <= 0))):
		return null
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < (_n_n_b3 - 1))):
			var _tuple_0 = _S.index_value(_n_pts_b2,_n_i_b5)
			var _n_x0_b6 = _S.prop(_tuple_0,0)
			var _n_y0_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b2,(_n_i_b5 + 1))
			var _n_x1_b8 = _S.prop(_tuple_1,0)
			var _n_y1_b9 = _S.prop(_tuple_1,1)
			var _n_L_b10 = _S.logical("||",_S.Bridge.hypot([(_n_x1_b8 - _n_x0_b6), (_n_y1_b9 - _n_y0_b7)]),func():return 1)
			var _n_nx_b11 = (float((-(_n_y1_b9 - _n_y0_b7)))/_n_L_b10)
			var _n_ny_b12 = (float((_n_x1_b8 - _n_x0_b6))/_n_L_b10)
			if true:
				var _n_d_b13 = 0
				while _S.truth((_n_d_b13 < _n_L_b10)):
					var _n_u_b14 = (float((_n_i_b5 + (float(_n_d_b13)/_n_L_b10)))/(_n_n_b3 - 1))
					var _n_x_b15 = (_n_x0_b6 + (float(((_n_x1_b8 - _n_x0_b6) * _n_d_b13))/_n_L_b10))
					var _n_y_b16 = (_n_y0_b7 + (float(((_n_y1_b9 - _n_y0_b7) * _n_d_b13))/_n_L_b10))
					var _n_a_b17 = (((1 - _n_u_b14) * 1.7) * _n_fade_b4)
					var _n_w_b18 = ((2.6 * pow((1 - _n_u_b14),0.8)) + 0.3)
					if true:
						var _n_q_b19 = (-_n_w_b18)
						while _S.truth((_n_q_b19 <= _n_w_b18)):
							var _n_v_b20 = (float(absf(_n_q_b19))/_n_w_b18)
							_S.invoke(_n_p_b0,"dot",[(_n_x_b15 + (_n_nx_b11 * _n_q_b19)), (_n_y_b16 + (_n_ny_b12 * _n_q_b19)), ((_n_WHITE if _S.truth((_n_u_b14 < 0.25)) else _S.index_value(_n_C,6)) if _S.truth((_n_v_b20 < 0.35)) else ((_S.index_value(_n_C,6) if _S.truth((_n_u_b14 < 0.4)) else _S.index_value(_n_C,5)) if _S.truth((_n_v_b20 < 0.7)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b14 < 0.5)) else _S.index_value(_n_C,4)))), (_n_a_b17 * (1 if _S.truth((_n_v_b20 < 0.7)) else 0.75))])
							_n_q_b19 += 0.5
					for _iter_2 in _S.array([0, PI]):
						var _n_s_b21 = _iter_2
						var _n_ph_b22 = ((((_n_u_b14 * 10) - (_n_t * 26)) + _S.named_value(_n_b_b1,"tw")) + _n_s_b21)
						var _n_off_b23 = (sin(_n_ph_b22) * (_n_w_b18 + 1.4))
						if _S.truth((cos(_n_ph_b22) > (-0.2))):
							_S.invoke(_n_p_b0,"dot",[(_n_x_b15 + (_n_nx_b11 * _n_off_b23)), (_n_y_b16 + (_n_ny_b12 * _n_off_b23)), ((_n_WHITE if _S.truth((_n_u_b14 < 0.35)) else _S.index_value(_n_C,6)) if _S.truth((cos(_n_ph_b22) > 0.4)) else _S.index_value(_n_C,4)), _n_a_b17])
					_n_d_b13 += 0.5
			if _S.truth(_S.binary("===",fmod(_n_i_b5,3),0)):
				_S.invoke(_n_p_b0,"glow",[_n_x0_b6, _n_y0_b7, ((9 * (1 - (float(_n_i_b5)/_n_n_b3))) + 3), _S.index_value(_n_C,5), ((0.3 * (1 - (float(_n_i_b5)/_n_n_b3))) * _n_fade_b4)])
			_n_i_b5 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.named_value(_n_b_b1,"x")
	var _n_y_b3 = _S.named_value(_n_b_b1,"y")
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 4)):
			var _n_a_b5 = (((_n_t * 24) + (float((_n_i_b4 * _n_TAU))/4)) + _S.named_value(_n_b_b1,"tw"))
			var _n_l_b6 = (5.5 + (1.5 * sin(((_n_t * 50) + _n_i_b4))))
			_S.invoke(_n_p_b0,"line",[(_n_x_b2 + (cos(_n_a_b5) * 3.2)), (_n_y_b3 + (sin(_n_a_b5) * 3.2)), (_n_x_b2 + (cos(_n_a_b5) * _n_l_b6)), (_n_y_b3 + (sin(_n_a_b5) * _n_l_b6)), _S.index_value(_n_C,6)])
			_n_i_b4 += 1.0
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, 3.8, _S.index_value(_n_C,4)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, 3, _S.index_value(_n_C,5)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, 2.1, _S.index_value(_n_C,6)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, 1.2, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, 24, _S.index_value(_n_C,5), 0.6])
	_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, 7, _n_WHITE, 0.4])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	if _S.truth((_n_q_b1 < 0.16)):
		var _n_r_b5 = ((9 * (1 - (float(_n_q_b1)/0.16))) + 1.5)
		_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, (_n_r_b5 + 1.5), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[_n_x_b2, _n_y_b3, _n_r_b5, _n_WHITE])
	if _S.truth((_n_q_b1 < 0.4)):
		var _n_l_b6 = ((15 * (1 - (float(_n_q_b1)/0.4))) + 3)
		if true:
			var _n_d_b7 = (-_n_l_b6)
			while _S.truth((_n_d_b7 <= _n_l_b6)):
				var _n_a_b8 = (float(absf(_n_d_b7))/_n_l_b6)
				var _n_c_b9 = (_n_WHITE if _S.truth((_n_a_b8 < 0.3)) else (_S.index_value(_n_C,6) if _S.truth((_n_a_b8 < 0.65)) else _S.index_value(_n_C,5)))
				_S.invoke(_n_p_b0,"dot",[(_n_x_b2 + _n_d_b7), _n_y_b3, _n_c_b9, (1.15 - _n_a_b8)])
				_S.invoke(_n_p_b0,"dot",[_n_x_b2, (_n_y_b3 + (_n_d_b7 * 0.7)), _n_c_b9, (1.15 - _n_a_b8)])
				_n_d_b7 += 1.0
	var _n_rr_b4 = (3 + (18 * _S.invoke(_n_ease,"outCubic",[_n_q_b1])))
	_S.invoke(_n_p_b0,"ring",[_n_x_b2, _n_y_b3, (_n_rr_b4 + 0.5), maxf(1,(3 * (1 - _n_q_b1))), (_n_WHITE if _S.truth((_n_q_b1 < 0.3)) else _S.index_value(_n_C,6)), (1.2 - _n_q_b1)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_pops = _S.read(_parent,"pops")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_TX = _S.read(_parent,"TX")
	var _n_TY = _S.read(_parent,"TY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (_S.MathFX.smooth(0,0.22,_n_t) * (1 - _S.MathFX.smooth(1.15,1.45,_n_t)))
	if _S.truth((_n_k_b1 <= 0)):
		return null
	var _n_kick_b2 = 0
	for _iter_0 in _S.array(_n_pops):
		var _n_q_b5 = _iter_0
		_n_kick_b2 = maxf(_n_kick_b2,exp((-pow((float((_n_t - _S.named_value(_n_q_b5,"t")))/0.06),2))))
	var _n_r_b3 = ((9 + (10 * (1 - _S.invoke(_n_ease,"outCubic",[_S.MathFX.smooth(0,0.22,_n_t)])))) + (3 * _n_kick_b2))
	var _n_spin_b4 = (_n_t * 1.5)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 4)):
			var _n_a0_b7 = ((_n_spin_b4 + (float((_n_i_b6 * _n_TAU))/4)) - 0.38)
			if true:
				var _n_a_b8 = _n_a0_b7
				while _S.truth((_n_a_b8 <= (_n_a0_b7 + 0.76))):
					_S.invoke(_n_p_b0,"dot",[(_n_TX + (cos(_n_a_b8) * _n_r_b3)), (_n_TY + (sin(_n_a_b8) * _n_r_b3)), (_n_WHITE if _S.truth((_n_kick_b2 > 0.4)) else _S.index_value(_n_C,5)), _n_k_b1])
					_n_a_b8 += 0.06
			_n_i_b6 += 1.0
	_S.invoke(_n_p_b0,"glow",[_n_TX, _n_TY, 12, _S.index_value(_n_C,4), (0.2 * _n_k_b1)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_TX = _S.read(_parent,"TX")
	var _n_TY = _S.read(_parent,"TY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	_n_a_b0 += _S.invoke(_n_R,"range",[(-0.12), 0.12])
	var _n_sp_b2 = _S.invoke(_n_R,"range",[130, 165])
	return {"t0":(0.05 + (_n_i_b1 * 0.1)),"x":_n_HX,"y":_n_HY,"vx":(cos(_n_a_b0) * _n_sp_b2),"vy":(sin(_n_a_b0) * _n_sp_b2),"trail":[],"hit":(-1),"on":false,"tx":(_n_TX + _S.invoke(_n_R,"range",[(-3), 3])),"ty":(_n_TY + _S.invoke(_n_R,"range",[(-6), 6])),"tw":_S.invoke(_n_R,"range",[0, _n_TAU]),"acc":0}
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v22 in _S.array(_S.read(_e, "bolts")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _v22)
		var _v24 = _S.scope(_v23)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v24, "t"), _S.prop(_S.read(_v24, "b"), "t0")), func(): return _S.binary(">=", _S.prop(_S.read(_v24, "b"), "hit"), 0))):
			continue
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v24, "b"), "on"))):
			var _v25 = _S.scope(_v24)
			_S.set_prop(_S.read(_v25, "b"), "on", true, "=", false)
			_S.invoke(_S.read(_v25, "lights"), "add", [_S.read(_v25, "HX"), _S.read(_v25, "HY"), 28, _S.prop(_S.read(_v25, "C"), 5), 0.7, 0.14])
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v26, "i"), 4)):
				_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "MOTE"), _S.read(_v26, "HX"), _S.read(_v26, "HY"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.binary("+", _S.invoke(_S.read(_v26, "Math"), "atan2", [_S.prop(_S.read(_v26, "b"), "vy"), _S.prop(_S.read(_v26, "b"), "vx")]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.6), 0.6]))]), _S.invoke(_S.read(_v26, "R"), "range", [60, 140])), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.invoke(_S.read(_v26, "Math"), "atan2", [_S.prop(_S.read(_v26, "b"), "vy"), _S.prop(_S.read(_v26, "b"), "vx")]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.6), 0.6]))]), _S.invoke(_S.read(_v26, "R"), "range", [60, 140])), _S.invoke(_S.read(_v26, "R"), "range", [0.12, 0.25]), _S.prop(_S.read(_v26, "C"), 6), 0.6])
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
		_S.define(_v24, "age", _S.binary("-", _S.read(_v24, "t"), _S.prop(_S.read(_v24, "b"), "t0")))
		_S.define(_v24, "dx", _S.binary("-", _S.prop(_S.read(_v24, "b"), "tx"), _S.prop(_S.read(_v24, "b"), "x")))
		_S.define(_v24, "dy", _S.binary("-", _S.prop(_S.read(_v24, "b"), "ty"), _S.prop(_S.read(_v24, "b"), "y")))
		_S.define(_v24, "d", _S.logical("||", _S.invoke(_S.read(_v24, "Math"), "hypot", [_S.read(_v24, "dx"), _S.read(_v24, "dy")]), func(): return 1))
		_S.define(_v24, "sp", _S.binary("+", 150, _S.binary("*", _S.binary("*", 560, _S.read(_v24, "age")), _S.read(_v24, "age"))))
		_S.define(_v24, "steer", _S.invoke(_S.read(_v24, "Math"), "min", [1, _S.binary("*", _S.binary("+", 1.4, _S.binary("*", 15, _S.read(_v24, "age"))), _S.read(_v24, "dt"))]))
		_S.set_prop(_S.read(_v24, "b"), "vx", _S.binary("*", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v24, "dx"), _S.read(_v24, "d")), _S.read(_v24, "sp")), _S.prop(_S.read(_v24, "b"), "vx")), _S.read(_v24, "steer")), "+=", false)
		_S.set_prop(_S.read(_v24, "b"), "vy", _S.binary("*", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v24, "dy"), _S.read(_v24, "d")), _S.read(_v24, "sp")), _S.prop(_S.read(_v24, "b"), "vy")), _S.read(_v24, "steer")), "+=", false)
		_S.set_prop(_S.read(_v24, "b"), "x", _S.binary("*", _S.prop(_S.read(_v24, "b"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "b"), "y", _S.binary("*", _S.prop(_S.read(_v24, "b"), "vy"), _S.read(_v24, "dt")), "+=", false)
		_S.invoke(_S.prop(_S.read(_v24, "b"), "trail"), "unshift", [[_S.prop(_S.read(_v24, "b"), "x"), _S.prop(_S.read(_v24, "b"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v24, "b"), "trail"), "length"), _S.read(_v24, "TRAIL"))):
			_S.invoke(_S.prop(_S.read(_v24, "b"), "trail"), "pop", [])
		if _S.truth(_S.binary(">", _S.set_prop(_S.read(_v24, "b"), "acc", _S.read(_v24, "dt"), "+=", false), 0.012)):
			var _v27 = _S.scope(_v24)
			_S.set_prop(_S.read(_v27, "b"), "acc", 0, "=", false)
			if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.6])):
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "MOTE"), _S.prop(_S.read(_v27, "b"), "x"), _S.prop(_S.read(_v27, "b"), "y"), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v27, "b"), "vx")), 0.08), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 25), 25])), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v27, "b"), "vy")), 0.08), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 25), 25])), _S.invoke(_S.read(_v27, "R"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v27, "C"), 6) if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.5])) else _S.prop(_S.read(_v27, "C"), 5)), 0.55])
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v24, "d"), 3), func(): return _S.binary(">", _S.read(_v24, "age"), 1.3))):
			var _v28 = _S.scope(_v24)
			_S.set_prop(_S.read(_v28, "b"), "hit", _S.read(_v28, "t"), "=", false)
			_S.invoke(_S.read(_v28, "pops"), "push", [_S.merge([{"t": _S.read(_v28, "t")}, {"x": _S.prop(_S.read(_v28, "b"), "x")}, {"y": _S.prop(_S.read(_v28, "b"), "y")}])])
			_S.invoke(_S.read(_v28, "lights"), "add", [_S.prop(_S.read(_v28, "b"), "x"), _S.prop(_S.read(_v28, "b"), "y"), 70, _S.prop(_S.read(_v28, "C"), 5), 0.9, 0.3])
			_S.invoke(_S.read(_v28, "lights"), "add", [_S.prop(_S.read(_v28, "b"), "x"), _S.prop(_S.read(_v28, "b"), "y"), 24, _S.read(_v28, "WHITE"), 0.85, 0.09])
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v29, "i"), 16)):
				var _v30 = _S.scope(_v29)
				_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")]))
				_S.define(_v30, "v", _S.invoke(_S.read(_v30, "R"), "range", [80, 230]))
				_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SPARK"), _S.prop(_S.read(_v30, "b"), "x"), _S.prop(_S.read(_v30, "b"), "y"), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "v")), 40), _S.invoke(_S.read(_v30, "R"), "range", [0.15, 0.45])])
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "i", 1, "+=", true)
			var _v31 = _S.scope(_v28)
			_S.define(_v31, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "i"), 7)):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "a", _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v32, "Math"), "PI")), 0.3]))
				_S.define(_v32, "v", _S.invoke(_S.read(_v32, "R"), "range", [40, 140]))
				_S.invoke(_S.read(_v32, "ps"), "spawn", [(_S.prop(_S.read(_v32, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v32, "i"), 2)) else _S.prop(_S.read(_v32, "P"), "MOTE")), _S.prop(_S.read(_v32, "b"), "x"), _S.prop(_S.read(_v32, "b"), "y"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "v")), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "v")), _S.invoke(_S.read(_v32, "R"), "range", [0.25, 0.48]), _S.invoke(_S.read(_v32, "R"), "pick", [[_S.read(_v32, "WHITE"), _S.prop(_S.read(_v32, "C"), 6), _S.prop(_S.read(_v32, "C"), 5)]]), _S.invoke(_S.read(_v32, "R"), "range", [0.8, 1.6])])
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_pops = _S.read(_parent,"pops")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_pops):
		var _n_q_b1 = _iter_0
		var _n_k_b2 = (1 - clampf((float((_n_t - _S.named_value(_n_q_b1,"t")))/0.5),0.0,1.0))
		if _S.truth((_n_k_b2 > 0)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_q_b1,"x"), (-1), 22, _S.index_value(_n_C,5), ((0.25 * _n_k_b2) * _n_k_b2)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_lock = _S.read(_parent,"lock")
	var _n_ribbon = _S.read(_parent,"ribbon")
	var _n_bolts = _S.read(_parent,"bolts")
	var _n_head = _S.read(_parent,"head")
	var _n_t = _S.read(_parent,"t")
	var _n_pop = _S.read(_parent,"pop")
	var _n_pops = _S.read(_parent,"pops")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_lock,[_n_p_b0])
	for _iter_0 in _S.array(_n_bolts):
		var _n_b_b1 = _iter_0
		if _S.truth(_S.named_value(_n_b_b1,"on")):
			_S.call_value(_n_ribbon,[_n_p_b0, _n_b_b1])
	for _iter_1 in _S.array(_n_bolts):
		var _n_b_b2 = _iter_1
		if _S.truth(((_S.named_value(_n_b_b2,"hit") < 0) if _S.truth(_S.named_value(_n_b_b2,"on")) else _S.named_value(_n_b_b2,"on"))):
			_S.call_value(_n_head,[_n_p_b0, _n_b_b2])
	for _iter_2 in _S.array(_n_pops):
		var _n_q_b3 = _iter_2
		var _n_k_b4 = (float((_n_t - _S.named_value(_n_q_b3,"t")))/0.35)
		if _S.truth((_n_k_b4 < 1)):
			_S.call_value(_n_pop,[_n_p_b0, _n_k_b4, _S.named_value(_n_q_b3,"x"), _S.named_value(_n_q_b3,"y")])
	if _S.truth((_n_t < 0.55)):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_HX, _n_HY, (3 + (2 * sin((_n_t * 40)))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), (0.45 * (1 - (float(_n_t)/0.55)))])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
