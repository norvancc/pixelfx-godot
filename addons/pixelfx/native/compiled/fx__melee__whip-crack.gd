@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/whip-crack.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "star", _S.import_value("fx/melee/_lib.js", "star"))
	_S.define(_e, "sliver", _S.import_value("fx/melee/_lib.js", "sliver"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Whip crack"}, {"desc": "A whip rolls out to the right as a loop running down its length, faster and faster, until the tip flips over and cracks: a white pop, a ring of air, sparks and a puff of smoke."}, {"tags": ["melee", "whip", "crack", "lash", "combat", "directional", "one-shot"]}, {"size": [192, 80]}, {"origin": [30, 68]}, {"duration": 0.85}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a1a10", "#5c3a1e", "#9c6a34", "#d8a45a", "#ffd890", "#fff4d6", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"length": 76}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STANCE", _S.merge([_S.read(_e, "READY"), {"weapon": "handle"}, {"x": _S.unary("-", 7)}, {"sa": _S.unary("-", 0.3)}, {"fx": 13}, {"fy": _S.unary("-", 21)}, {"bx": 7}, {"by": _S.unary("-", 18)}]))
	_S.define(_e, "COCK", _S.merge([_S.read(_e, "STANCE"), {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 38)}, {"sa": _S.unary("-", 2.2)}, {"bx": 9}, {"by": _S.unary("-", 23)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "CRACK_", _S.merge([_S.read(_e, "STANCE"), {"crouch": 4}, {"lean": 5}, {"fx": 18}, {"fy": _S.unary("-", 21)}, {"sa": 0}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 23)}, {"ffx": 12}, {"fbx": _S.unary("-", 10)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 94}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "STANCE")], [_S.unary("-", 0.22), _S.read(_e, "COCK")], [0.02, _S.merge([_S.read(_e, "COCK"), {"lean": _S.unary("-", 4)}])], [0.06, _S.merge([_S.read(_e, "CRACK_"), {"fx": 15}, {"fy": _S.unary("-", 34)}, {"sa": _S.unary("-", 0.7)}, {"lean": 2}, {"ghost": 1}]), "snap"], [0.12, _S.read(_e, "CRACK_"), "snap"], [0.21, _S.read(_e, "CRACK_")], [0.26, _S.merge([_S.read(_e, "CRACK_"), {"fx": 15}, {"fy": _S.unary("-", 27)}, {"sa": _S.unary("-", 0.3)}, {"lean": 2}, {"crouch": 3}]), "snap"], [0.44, _S.merge([_S.read(_e, "CRACK_"), {"fx": 17}, {"fy": _S.unary("-", 22)}, {"sa": 0.1}, {"lean": 3}, {"crouch": 3}])], [0.92, _S.read(_e, "STANCE")]]}, {"hits": [_S.merge([{"t": 0.21}, {"stop": 0.1}, {"shake": 0.14}, {"amp": 2}, {"push": 2.4}, {"straw": 14}, {"y": _S.unary("-", 28)}])]}, {"dust": [_S.merge([{"t": 0.06}, {"x": 2}, {"n": 4}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "ROLL0", 0.02)
	_S.define(_e, "ROLL", 0.19)
	_S.define(_e, "CRACK", _S.binary("+", _S.read(_e, "ROLL0"), _S.read(_e, "ROLL")))
	_S.define(_e, "RECOIL", 0.16)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "L", _S.prop(_S.read(_e, "o"), "length"))
	_S.define(_e, "HX", 11)
	_S.define(_e, "HY", _S.unary("-", 21))
	_S.define(_e, "TIP", [_S.binary("+", _S.read(_e, "HX"), _S.read(_e, "L")), _S.binary("-", _S.read(_e, "HY"), 1)])
	_S.define(_e, "lam", _S.function_value(_e, "_f2"))
	_S.define(_e, "shape", _S.function_value(_e, "_f3"))
	_S.define(_e, "spikes", _S.invoke([0, 0.8, 1.6, 2.4, 3.14, 3.9, 4.7, 5.5], "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "slivers", _S.invoke([_S.unary("-", 1.2), _S.unary("-", 0.3), 0.5, 1.3], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "cracked", false)
	_S.define(_e, "tipTrail", [])
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ROLL0 = _S.read(_parent,"ROLL0")
	var _n_ROLL = _S.read(_parent,"ROLL")
	var _n_t_b0 = _S.arg(_args,0)
	return (_n_L * (0.34 + (0.66 * _S.invoke(_n_ease,"inQuad",[clampf((float((_n_t_b0 - _n_ROLL0))/_n_ROLL),0.0,1.0)]))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_lam = _S.read(_parent,"lam")
	var _n_L = _S.read(_parent,"L")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_RECOIL = _S.read(_parent,"RECOIL")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_l_b1 = _S.call_value(_n_lam,[_n_t_b0])
	var _n_r_b2 = (6.5 - (3.5 * (float(_n_l_b1)/_n_L)))
	var _n_pts_b3 = []
	var _n_recoil_b4 = _S.MathFX.smooth((_n_CRACK + 0.04),((_n_CRACK + 0.04) + _n_RECOIL),_n_t_b0)
	var _n_len_b5 = (_n_L * (1 - (_n_recoil_b4 * 0.85)))
	if true:
		var _n_s_b6 = 0
		while _S.truth((_n_s_b6 <= _n_len_b5)):
			var _n_x_b7 = null
			var _n_y_b8 = null
			if _S.truth((_n_s_b6 <= _n_l_b1)):
				_n_x_b7 = (_n_HX + _n_s_b6)
				_n_y_b8 = (_n_HY - ((sin((float((PI * _n_s_b6))/maxf(_n_l_b1,1))) * 2.5) * (1 - (float(_n_l_b1)/_n_L))))
			else:
				if _S.truth((_n_s_b6 <= (_n_l_b1 + (PI * _n_r_b2)))):
					var _n_th_b9 = (float((_n_s_b6 - _n_l_b1))/_n_r_b2)
					_n_x_b7 = ((_n_HX + _n_l_b1) + (sin(_n_th_b9) * _n_r_b2))
					_n_y_b8 = ((_n_HY + _n_r_b2) - (cos(_n_th_b9) * _n_r_b2))
				else:
					_n_x_b7 = ((_n_HX + _n_l_b1) - ((_n_s_b6 - _n_l_b1) - (PI * _n_r_b2)))
					_n_y_b8 = (_n_HY + (2 * _n_r_b2))
			if _S.truth((_n_recoil_b4 > 0)):
				_n_y_b8 += ((sin((float((PI * _n_s_b6))/_n_L)) * 6) * _n_recoil_b4)
			_S.invoke(_n_pts_b3,"push",[[_n_x_b7, _n_y_b8]])
			_n_s_b6 += 1
	return _n_pts_b3
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(_n_a_b0 + _S.invoke(_n_Rg,"range",[(-0.15), 0.15])),"len":((13 if _S.truth(_S.binary("===",_n_i_b1,0)) else (6 if _S.truth(fmod(_n_i_b1,2)) else 9)) + _S.invoke(_n_Rg,"range",[0, 3])),"w":(1.4 + _S.invoke(_n_Rg,"range",[0, 0.5]))}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_a_b0 = _S.arg(_args,0)
	return {"a":(_n_a_b0 + _S.invoke(_n_Rg,"range",[(-0.2), 0.2])),"r":_S.invoke(_n_Rg,"range",[4, 6]),"v":_S.invoke(_n_Rg,"range",[80, 120]),"arc":_S.invoke(_n_Rg,"range",[0.4, 0.7])}
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CRACK"), 0.05)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CRACK"), 0.01)))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "pts", _S.call_value(_S.read(_v3, "shape"), [_S.read(_v3, "t")]))
		_S.invoke(_S.read(_v3, "tipTrail"), "push", [_S.merge([{"p": _S.prop(_S.read(_v3, "pts"), _S.binary("-", _S.prop(_S.read(_v3, "pts"), "length"), 1))}, {"t": _S.read(_v3, "t")}])])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", _S.binary("-", _S.prop(_S.read(_v4, "tipTrail"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v4, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v4, "t"), _S.prop(_S.prop(_S.read(_v4, "tipTrail"), _S.read(_v4, "i")), "t")), 0.06)):
			_S.invoke(_S.read(_v4, "tipTrail"), "splice", [_S.read(_v4, "i"), 1])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cracked")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "cracked", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.prop(_S.read(_v5, "TIP"), 0), _S.prop(_S.read(_v5, "TIP"), 1), 46, _S.prop(_S.read(_v5, "C"), 4), 0.6, 0.3])
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.prop(_S.read(_v5, "TIP"), 0), _S.prop(_S.read(_v5, "TIP"), 1), 14, _S.read(_v5, "WHITE"), 0.8, 0.07])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 16)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "Rg"), "range", [_S.unary("-", 1.3), 1.2]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "Rg"), "range", [130, 300]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.prop(_S.read(_v7, "TIP"), 0), _S.prop(_S.read(_v7, "TIP"), 1), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), 40), _S.invoke(_S.read(_v7, "Rg"), "range", [0.12, 0.36])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v5)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 3)):
			_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v8, "TIP"), 0), _S.invoke(_S.read(_v8, "Rg"), "range", [_S.unary("-", 2), 3])), _S.binary("+", _S.prop(_S.read(_v8, "TIP"), 1), _S.invoke(_S.read(_v8, "Rg"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v8, "Rg"), "range", [10, 40]), _S.unary("-", _S.invoke(_S.read(_v8, "Rg"), "range", [6, 18])), _S.invoke(_S.read(_v8, "Rg"), "range", [0.5, 0.8]), _S.prop(_S.read(_v8, "C"), 2), _S.invoke(_S.read(_v8, "Rg"), "range", [2.5, 4]), _S.invoke(_S.read(_v8, "Rg"), "range", [0.02, 0.06])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v9 = _S.scope(_v5)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 4)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v9, "TIP"), 0), _S.invoke(_S.read(_v9, "Rg"), "range", [_S.unary("-", 8), 10])), _S.binary("+", _S.prop(_S.read(_v9, "TIP"), 1), _S.invoke(_S.read(_v9, "Rg"), "range", [_S.unary("-", 8), 8])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v9, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.invoke(_S.read(_v9, "Rg"), "chance", [0.5])) else _S.read(_v9, "WHITE")), _S.invoke(_S.read(_v9, "Rg"), "range", [0.8, 1.8]), _S.invoke(_S.read(_v9, "Rg"), "range", [0.05, 0.2])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_RECOIL = _S.read(_parent,"RECOIL")
	var _n_t = _S.read(_parent,"t")
	var _n_shape = _S.read(_parent,"shape")
	var _n_C = _S.read(_parent,"C")
	var _n_lam = _S.read(_parent,"lam")
	var _n_L = _S.read(_parent,"L")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_tipTrail = _S.read(_parent,"tipTrail")
	var _n_TIP = _S.read(_parent,"TIP")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_star = _S.read(_parent,"star")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_sliver = _S.read(_parent,"sliver")
	var _n_slivers = _S.read(_parent,"slivers")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_end_b1 = ((_n_CRACK + 0.04) + _n_RECOIL)
	if _S.truth((_n_t < _n_end_b1)):
		var _n_fade_b3 = (1 - _S.MathFX.smooth((_n_end_b1 - 0.06),_n_end_b1,_n_t))
		if _S.truth((_n_t < _n_CRACK)):
			for _iter_0 in _S.array([[0.03, _S.index_value(_n_C,1), 0.5], [0.015, _S.index_value(_n_C,2), 0.7]]):
				var _tuple_1 = _iter_0
				var _n_lag_b8 = _S.prop(_tuple_1,0)
				var _n_c_b9 = _S.prop(_tuple_1,1)
				var _n_a_b10 = _S.prop(_tuple_1,2)
				var _n_old_b11 = _S.call_value(_n_shape,[maxf(0,(_n_t - _n_lag_b8))])
				if true:
					var _n_i_b12 = 1
					while _S.truth((_n_i_b12 < _S.prop(_n_old_b11,"length"))):
						_S.invoke(_n_p_b0,"dot",[_S.index_value(_S.index_value(_n_old_b11,_n_i_b12),0), _S.index_value(_S.index_value(_n_old_b11,_n_i_b12),1), _n_c_b9, _n_a_b10])
						_n_i_b12 += 2
		var _n_pts_b4 = _S.call_value(_n_shape,[_n_t])
		var _n_n_b5 = _S.prop(_n_pts_b4,"length")
		var _n_l_b6 = _S.call_value(_n_lam,[_n_t])
		var _n_r_b7 = (6.5 - (3.5 * (float(_n_l_b6)/_n_L)))
		if true:
			var _n_i_b13 = 1
			while _S.truth((_n_i_b13 < _n_n_b5)):
				var _tuple_2 = _S.index_value(_n_pts_b4,(_n_i_b13 - 1))
				var _n_x0_b14 = _S.prop(_tuple_2,0)
				var _n_y0_b15 = _S.prop(_tuple_2,1)
				var _tuple_3 = _S.index_value(_n_pts_b4,_n_i_b13)
				var _n_x1_b16 = _S.prop(_tuple_3,0)
				var _n_y1_b17 = _S.prop(_tuple_3,1)
				var _n_u_b18 = (float(_n_i_b13)/_n_n_b5)
				var _n_s_b19 = _n_i_b13
				var _n_inLoop_b20 = ((_n_s_b19 < (_n_l_b6 + (PI * _n_r_b7))) if _S.truth(((_n_s_b19 > _n_l_b6) if _S.truth((_n_t < _n_CRACK)) else (_n_t < _n_CRACK))) else ((_n_s_b19 > _n_l_b6) if _S.truth((_n_t < _n_CRACK)) else (_n_t < _n_CRACK)))
				var _n_lead_b21 = ((absf(((_n_s_b19 - _n_l_b6) - (float((PI * _n_r_b7))/2))) < (_n_r_b7 * 0.9)) if _S.truth(_n_inLoop_b20) else _n_inLoop_b20)
				_S.invoke(_n_p_b0,"line",[_n_x0_b14, _n_y0_b15, _n_x1_b16, _n_y1_b17, (_n_WHITE if _S.truth(_n_lead_b21) else (_S.index_value(_n_C,5) if _S.truth(_n_inLoop_b20) else (_S.index_value(_n_C,4) if _S.truth((_n_u_b18 < 0.5)) else _S.index_value(_n_C,3)))), _n_fade_b3])
				if _S.truth((_n_u_b18 < 0.4)):
					_S.invoke(_n_p_b0,"line",[_n_x0_b14, (_n_y0_b15 + 1), _n_x1_b16, (_n_y1_b17 + 1), _S.index_value(_n_C,2), _n_fade_b3])
				_n_i_b13 += 1.0
		if _S.truth((_n_t < _n_CRACK)):
			var _n_l_b22 = _S.call_value(_n_lam,[_n_t])
			var _n_r_b23 = (6.5 - (3.5 * (float(_n_l_b22)/_n_L)))
			_S.invoke(_n_p_b0,"glow",[((_n_HX + _n_l_b22) + _n_r_b23), (_n_HY + _n_r_b23), 12, _S.index_value(_n_C,4), 0.4])
	if true:
		var _n_i_b24 = 1
		while _S.truth((_n_i_b24 < _S.prop(_n_tipTrail,"length"))):
			var _n_k_b25 = (1 - (float((_n_t - _S.named_value(_S.index_value(_n_tipTrail,_n_i_b24),"t")))/0.06))
			_S.invoke(_n_p_b0,"line",[_S.index_value(_S.named_value(_S.index_value(_n_tipTrail,(_n_i_b24 - 1)),"p"),0), _S.index_value(_S.named_value(_S.index_value(_n_tipTrail,(_n_i_b24 - 1)),"p"),1), _S.index_value(_S.named_value(_S.index_value(_n_tipTrail,_n_i_b24),"p"),0), _S.index_value(_S.named_value(_S.index_value(_n_tipTrail,_n_i_b24),"p"),1), (_n_WHITE if _S.truth((_n_k_b25 > 0.6)) else _S.index_value(_n_C,5)), _n_k_b25])
			_n_i_b24 += 1.0
	var _n_q_b2 = (_n_t - _n_CRACK)
	if _S.truth(((_n_q_b2 < 0.035) if _S.truth((_n_q_b2 >= 0)) else (_n_q_b2 >= 0))):
		_S.call_value(_n_star,[_n_p_b0, _S.index_value(_n_TIP,0), _S.index_value(_n_TIP,1), _n_spikes, 1, 1, _n_WHITE, _S.index_value(_n_C,5), _S.index_value(_n_C,6), _S.index_value(_n_C,4)])
	else:
		if _S.truth(((_n_q_b2 < 0.07) if _S.truth((_n_q_b2 >= 0.035)) else (_n_q_b2 >= 0.035))):
			_S.call_value(_n_star,[_n_p_b0, _S.index_value(_n_TIP,0), _S.index_value(_n_TIP,1), _n_spikes, 1.3, 0.5, _S.index_value(_n_C,6), _S.index_value(_n_C,5), _S.index_value(_n_C,5), _S.index_value(_n_C,3)])
	if _S.truth(((_n_q_b2 < 0.2) if _S.truth((_n_q_b2 >= 0.02)) else (_n_q_b2 >= 0.02))):
		var _n_k_b26 = (float((_n_q_b2 - 0.02))/0.18)
		var _n_r_b27 = (4 + (16 * _S.invoke(_n_ease,"outCubic",[_n_k_b26])))
		var _n_th_b28 = maxf(1,(2.2 * (1 - _n_k_b26)))
		var _n_col_b29 = (_n_WHITE if _S.truth((_n_k_b26 < 0.25)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b26 < 0.5)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b26 < 0.75)) else _S.index_value(_n_C,3))))
		if true:
			var _n_a_b30 = 0
			while _S.truth((_n_a_b30 < _n_TAU)):
				if true:
					var _n_o_b31 = 0
					while _S.truth((_n_o_b31 < _n_th_b28)):
						_S.invoke(_n_p_b0,"dot",[(_S.index_value(_n_TIP,0) + (cos(_n_a_b30) * (_n_r_b27 - _n_o_b31))), (_S.index_value(_n_TIP,1) + ((sin(_n_a_b30) * (_n_r_b27 - _n_o_b31)) * 0.8)), _n_col_b29, (1.15 - _n_k_b26)])
						_n_o_b31 += 0.5
				_n_a_b30 += (float(0.6)/_n_r_b27)
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_TIP,0), _S.index_value(_n_TIP,1), (_n_r_b27 + 6), _S.index_value(_n_C,4), (0.25 * (1 - _n_k_b26))])
	if _S.truth(((_n_q_b2 < 0.16) if _S.truth((_n_q_b2 >= 0.04)) else (_n_q_b2 >= 0.04))):
		var _n_k_b32 = (float((_n_q_b2 - 0.04))/0.12)
		for _iter_4 in _S.array(_n_slivers):
			var _n_s_b33 = _iter_4
			_S.call_value(_n_sliver,[_n_p_b0, _S.index_value(_n_TIP,0), _S.index_value(_n_TIP,1), _S.named_value(_n_s_b33,"a"), (_S.named_value(_n_s_b33,"r") + (_S.named_value(_n_s_b33,"v") * (_n_q_b2 - 0.04))), (_S.named_value(_n_s_b33,"arc") * (1 - (0.4 * _n_k_b32))), (_S.index_value(_n_C,6) if _S.truth((_n_k_b32 < 0.4)) else _S.index_value(_n_C,5)), (1 - _n_k_b32)])
	if _S.truth(((_n_q_b2 < 0.15) if _S.truth((_n_q_b2 >= 0)) else (_n_q_b2 >= 0))):
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_TIP,0), _S.index_value(_n_TIP,1), 26, _S.index_value(_n_C,5), (0.7 * exp((float((-_n_q_b2))/0.04)))])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
