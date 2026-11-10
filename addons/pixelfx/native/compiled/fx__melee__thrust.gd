@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/thrust.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "longStar", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Thrust"}, {"desc": "A piercing stab: a bundle of streaks shoots out from the hand to a point, a long four-point star flares at the tip with a pierce ring, sparks and speed lines."}, {"tags": ["melee", "thrust", "stab", "spear", "rapier", "pierce", "combat", "directional", "one-shot"]}, {"size": [196, 76]}, {"origin": [34, 62]}, {"duration": 0.75}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a1608", "#6b3c10", "#b8701a", "#f0b42e", "#ffe27a", "#fff6cf", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"reach": 66}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STANCE", _S.merge([_S.read(_e, "READY"), {"weapon": "sword"}, {"x": _S.unary("-", 14)}, {"fx": 12}, {"fy": _S.unary("-", 21)}, {"sa": _S.unary("-", 0.3)}]))
	_S.define(_e, "BACK", _S.merge([_S.read(_e, "STANCE"), {"crouch": 5}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 3)}, {"fy": _S.unary("-", 19)}, {"sa": _S.unary("-", 0.05)}, {"bx": 8}, {"by": _S.unary("-", 30)}, {"armsFront": true}, {"ffx": 10}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "LUNGE", _S.merge([_S.read(_e, "STANCE"), {"crouch": 6}, {"lean": 6}, {"fx": 23}, {"fy": _S.unary("-", 20)}, {"sa": 0}, {"bx": _S.unary("-", 8)}, {"by": _S.unary("-", 24)}, {"ffx": 15}, {"fbx": _S.unary("-", 11)}, {"toeB": true}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 80}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "STANCE")], [_S.unary("-", 0.24), _S.read(_e, "BACK")], [_S.unary("-", 0.05), _S.merge([_S.read(_e, "BACK"), {"crouch": 6}, {"fx": _S.unary("-", 5)}])], [0, _S.merge([_S.read(_e, "LUNGE"), {"ghost": 1}]), "snap"], [0.07, _S.read(_e, "LUNGE"), "snap"], [0.3, _S.merge([_S.read(_e, "LUNGE"), {"crouch": 5}, {"lean": 5}])], [0.7, _S.read(_e, "STANCE")]]}, {"hits": [_S.merge([{"t": 0.07}, {"stop": 0.12}, {"shake": 0.14}, {"amp": 2}, {"push": 2.8}, {"straw": 16}, {"y": _S.unary("-", 26)}])]}, {"dust": [_S.merge([{"t": 0}, {"x": _S.unary("-", 24)}, {"n": 6}, {"dir": _S.unary("-", 1)}]), _S.merge([{"t": 0.07}, {"x": 1}, {"n": 6}, {"dir": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "OUT", 0.07)
	_S.define(_e, "HOLD", 0.06)
	_S.define(_e, "PULL", 0.2)
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
	if _S.truth((_n_L_b3 < 1)):
		return null
	var _n_arms_b6 = [[1, 0, _n_L_b3], [(-1), 0, (_n_L_b3 * 0.7)], [0, (-1), (_n_L_b3 * 0.42)], [0, 1, (_n_L_b3 * 0.42)]]
	for _iter_0 in _S.array(_n_arms_b6):
		var _tuple_1 = _iter_0
		var _n_dx_b7 = _S.prop(_tuple_1,0)
		var _n_dy_b8 = _S.prop(_tuple_1,1)
		var _n_len_b9 = _S.prop(_tuple_1,2)
		if true:
			var _n_d_b10 = 1
			while _S.truth((_n_d_b10 <= _n_len_b9)):
				var _n_u_b11 = (float(_n_d_b10)/_n_len_b9)
				var _n_c_b12 = (_n_WHITE if _S.truth((_n_u_b11 < 0.3)) else (_S.index_value(_n_C_b5,5) if _S.truth((_n_u_b11 < 0.65)) else _S.index_value(_n_C_b5,4)))
				_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (_n_dx_b7 * _n_d_b10)), (_n_y_b2 + (_n_dy_b8 * _n_d_b10)), _n_c_b12, (1 if _S.truth((_n_u_b11 < 0.7)) else (1 - (float((_n_u_b11 - 0.7))/0.35)))])
				if _S.truth(((_n_len_b9 > 6) if _S.truth((_n_u_b11 < 0.25)) else (_n_u_b11 < 0.25))):
					_S.invoke(_n_p_b0,"dot",[((_n_x_b1 + (_n_dx_b7 * _n_d_b10)) - _n_dy_b8), ((_n_y_b2 + (_n_dy_b8 * _n_d_b10)) + _n_dx_b7), _S.index_value(_n_C_b5,5)])
					_S.invoke(_n_p_b0,"dot",[((_n_x_b1 + (_n_dx_b7 * _n_d_b10)) + _n_dy_b8), ((_n_y_b2 + (_n_dy_b8 * _n_d_b10)) - _n_dx_b7), _S.index_value(_n_C_b5,5)])
				_n_d_b10 += 0.5
	for _iter_2 in _S.array([[1, 1], [1, (-1)], [(-1), 1], [(-1), (-1)]]):
		var _tuple_3 = _iter_2
		var _n_dx_b13 = _S.prop(_tuple_3,0)
		var _n_dy_b14 = _S.prop(_tuple_3,1)
		if true:
			var _n_d_b15 = 1
			while _S.truth((_n_d_b15 <= minf(3,(_n_L_b3 * 0.14)))):
				_S.invoke(_n_p_b0,"px",[(_n_x_b1 + (_n_dx_b13 * _n_d_b15)), (_n_y_b2 + (_n_dy_b14 * _n_d_b15)), (_S.index_value(_n_C_b5,5) if _S.truth((_n_d_b15 < 2)) else _S.index_value(_n_C_b5,4))])
				_n_d_b15 += 1.0
	_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (6 + (_n_L_b3 * 1.3)), _S.index_value(_n_C_b5,4), (0.35 * _n_k_b4)])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (3 + (_n_L_b3 * 0.4)), _n_WHITE, (0.3 * _n_k_b4)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f2")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "HX", 9)
	_S.define(_e, "HY", _S.unary("-", 20))
	_S.define(_e, "TX", _S.binary("+", _S.read(_e, "HX"), _S.prop(_S.read(_e, "o"), "reach")))
	_S.define(_e, "TY", _S.read(_e, "HY"))
	_S.define(_e, "streaks", _S.invoke([_S.unary("-", 7), _S.unary("-", 4), _S.unary("-", 2), 0, 2, 4, 7], "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "lines", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "struck", false)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_HX = _S.read(_parent,"HX")
	var _n_Rg = _S.read(_parent,"Rg")
	var _n_off_b0 = _S.arg(_args,0)
	return {"off":_n_off_b0,"x0":(((_n_HX + 1) + _S.invoke(_n_Rg,"range",[0, 5])) + (absf(_n_off_b0) * 0.6)),"t0":(_S.invoke(_n_Rg,"range",[0, 0.02]) + (absf(_n_off_b0) * 0.003)),"w":(2 if _S.truth(_S.binary("===",_n_off_b0,0)) else 1),"hot":_S.binary("===",_n_off_b0,0),"len":_S.invoke(_n_Rg,"range",[0.75, 1])}
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.08)), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.5]))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "s", _S.invoke(_S.read(_v9, "Rg"), "sign", []))
		_S.invoke(_S.read(_v9, "lines"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v9, "HX"), _S.invoke(_S.read(_v9, "Rg"), "range", [0, _S.binary("*", _S.prop(_S.read(_v9, "o"), "reach"), 0.6)]))}, {"y": _S.binary("+", _S.read(_v9, "HY"), _S.binary("*", _S.read(_v9, "s"), _S.invoke(_S.read(_v9, "Rg"), "range", [7, 17])))}, {"l": _S.invoke(_S.read(_v9, "Rg"), "range", [18, 42])}, {"v": _S.invoke(_S.read(_v9, "Rg"), "range", [200, 340])}, {"t": _S.read(_v9, "t")}])])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", _S.binary("-", _S.prop(_S.read(_v10, "lines"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v10, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v10, "t"), _S.prop(_S.prop(_S.read(_v10, "lines"), _S.read(_v10, "i")), "t")), 0.24)):
			_S.invoke(_S.read(_v10, "lines"), "splice", [_S.read(_v10, "i"), 1])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "-=", true)
	for _v11 in _S.array(_S.read(_e, "lines")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "l", _v11)
		_S.set_prop(_S.read(_v12, "l"), "x", _S.binary("*", _S.prop(_S.read(_v12, "l"), "v"), _S.read(_v12, "dt")), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "struck")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OUT")))):
		var _v13 = _S.scope(_e)
		_S.write(_v13, "struck", true, "=", false)
		_S.invoke(_S.read(_v13, "lights"), "add", [_S.read(_v13, "TX"), _S.read(_v13, "TY"), 44, _S.prop(_S.read(_v13, "C"), 4), 0.45, 0.3])
		_S.invoke(_S.read(_v13, "lights"), "add", [_S.read(_v13, "TX"), _S.read(_v13, "TY"), 14, _S.read(_v13, "WHITE"), 0.6, 0.06])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 12)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "a", _S.invoke(_S.read(_v15, "Rg"), "range", [_S.unary("-", 0.55), 0.45]))
			_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "Rg"), "range", [150, 330]))
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.read(_v15, "TX"), _S.read(_v15, "TY"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), 30), _S.invoke(_S.read(_v15, "Rg"), "range", [0.12, 0.35])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
		var _v16 = _S.scope(_v13)
		_S.define(_v16, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 10)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("+", _S.invoke(_S.read(_v17, "Rg"), "range", [_S.unary("-", 0.9), 0.9]), (_S.prop(_S.read(_v17, "Math"), "PI") if _S.truth(_S.invoke(_S.read(_v17, "Rg"), "chance", [0.3])) else 0)))
			_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "Rg"), "range", [40, 120]))
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "MOTE"), _S.binary("+", _S.read(_v17, "TX"), _S.invoke(_S.read(_v17, "Rg"), "range", [_S.unary("-", 6), 2])), _S.binary("+", _S.read(_v17, "TY"), _S.invoke(_S.read(_v17, "Rg"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "Rg"), "range", [0.25, 0.5]), (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.invoke(_S.read(_v17, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v17, "C"), 4)), 0.6])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		var _v18 = _S.scope(_v13)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 4)):
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "STAR"), _S.binary("+", _S.read(_v18, "TX"), _S.invoke(_S.read(_v18, "Rg"), "range", [_S.unary("-", 10), 8])), _S.binary("+", _S.read(_v18, "TY"), _S.invoke(_S.read(_v18, "Rg"), "range", [_S.unary("-", 9), 9])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v18, "Rg"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v18, "C"), 5) if _S.truth(_S.invoke(_S.read(_v18, "Rg"), "chance", [0.5])) else _S.read(_v18, "WHITE")), _S.invoke(_S.read(_v18, "Rg"), "range", [1, 2]), _S.invoke(_S.read(_v18, "Rg"), "range", [0.06, 0.2])])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HX = _S.read(_parent,"HX")
	var _n_HY = _S.read(_parent,"HY")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_lines = _S.read(_parent,"lines")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_PULL = _S.read(_parent,"PULL")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TX = _S.read(_parent,"TX")
	var _n_streaks = _S.read(_parent,"streaks")
	var _n_TY = _S.read(_parent,"TY")
	var _n_longStar = _S.read(_parent,"longStar")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < 0.05)):
		_S.call_value(_n_sparkle,[_n_p_b0, (_n_HX + 2), _n_HY, ((5 * (1 - (float(_n_t)/0.05))) + 1), _S.index_value(_n_C,5), _S.index_value(_n_C,3), 0.4])
	for _iter_0 in _S.array(_n_lines):
		var _n_l_b3 = _iter_0
		var _n_k_b4 = (float((_n_t - _S.named_value(_n_l_b3,"t")))/0.24)
		if true:
			var _n_d_b5 = 0
			while _S.truth((_n_d_b5 < (_S.named_value(_n_l_b3,"l") * (1 - (_n_k_b4 * 0.6))))):
				_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_l_b3,"x") - _n_d_b5), _S.named_value(_n_l_b3,"y"), (_n_WHITE if _S.truth((_n_d_b5 < 3)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b5 < (_S.named_value(_n_l_b3,"l") * 0.4))) else _S.index_value(_n_C,3))), ((1 - (float(_n_d_b5)/_S.named_value(_n_l_b3,"l"))) * (1 - _n_k_b4))])
				_n_d_b5 += 1.0
	var _n_pull_b1 = _S.MathFX.smooth((_n_OUT + _n_HOLD),((_n_OUT + _n_HOLD) + _n_PULL),_n_t)
	for _iter_1 in _S.array(_n_streaks):
		var _n_s_b6 = _iter_1
		var _n_u_b7 = clampf((float((_n_t - _S.named_value(_n_s_b6,"t0")))/_n_OUT),0.0,1.0)
		var _n_head_b8 = _S.invoke(_n_ease,"outExpo",[_n_u_b7])
		if _S.truth(((_n_u_b7 <= 0) if _S.truth((_n_u_b7 <= 0)) else (_n_pull_b1 >= 1))):
			continue
		var _n_y0_b9 = (_n_HY + _S.named_value(_n_s_b6,"off"))
		var _n_end_b10 = (_S.named_value(_n_s_b6,"x0") + ((_n_TX - _S.named_value(_n_s_b6,"x0")) * _S.named_value(_n_s_b6,"len")))
		var _n_x1_b11 = (_S.named_value(_n_s_b6,"x0") + ((_n_end_b10 - _S.named_value(_n_s_b6,"x0")) * _n_head_b8))
		var _n_xa_b12 = (_S.named_value(_n_s_b6,"x0") + ((_n_end_b10 - _S.named_value(_n_s_b6,"x0")) * maxf(_n_pull_b1,(((_n_head_b8 * 0.35) * (1 - _S.named_value(_n_s_b6,"len"))) * 3))))
		var _n_yAt_b13 = _S.function_value(_S.capture(_parent,{"y0":_n_y0_b9,"s":_n_s_b6,"this":_this}),"_f6")
		if true:
			var _n_x_b14 = _n_xa_b12
			while _S.truth((_n_x_b14 <= _n_x1_b11)):
				var _n_v_b15 = (float((_n_x_b14 - _n_xa_b12))/maxf(1,(_n_x1_b11 - _n_xa_b12)))
				var _n_c_b16 = (_n_WHITE if _S.truth((_n_v_b15 > 0.88)) else ((_S.index_value(_n_C,6) if _S.truth((_n_v_b15 > 0.35)) else _S.index_value(_n_C,5)) if _S.truth(_S.named_value(_n_s_b6,"hot")) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b15 > 0.55)) else (_S.index_value(_n_C,4) if _S.truth((_n_v_b15 > 0.25)) else _S.index_value(_n_C,3)))))
				_S.invoke(_n_p_b0,"dot",[_n_x_b14, _S.call_value(_n_yAt_b13,[_n_x_b14]), _n_c_b16, ((float(_n_v_b15)/0.12) if _S.truth((_n_v_b15 < 0.12)) else 1)])
				if _S.truth(((_n_v_b15 > 0.1) if _S.truth((_S.named_value(_n_s_b6,"w") > 1)) else (_S.named_value(_n_s_b6,"w") > 1))):
					_S.invoke(_n_p_b0,"dot",[_n_x_b14, (_S.call_value(_n_yAt_b13,[_n_x_b14]) + 1), (_S.index_value(_n_C,5) if _S.truth((_n_v_b15 > 0.6)) else _S.index_value(_n_C,3)), ((float(_n_v_b15)/0.2) if _S.truth((_n_v_b15 < 0.2)) else 1)])
				_n_x_b14 += 0.5
	if _S.truth((_n_t < ((_n_OUT + _n_HOLD) + _n_PULL))):
		_S.invoke(_n_p_b0,"glowLine",[(_n_HX + ((_n_TX - _n_HX) * _n_pull_b1)), _n_HY, (_n_HX + ((_n_TX - _n_HX) * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_t)/_n_OUT),0.0,1.0)]))), _n_TY, 6, _S.index_value(_n_C,4), (0.22 * (1 - _n_pull_b1))])
	var _n_q_b2 = (_n_t - _n_OUT)
	if _S.truth(((_n_q_b2 < 0.4) if _S.truth((_n_q_b2 >= 0)) else (_n_q_b2 >= 0))):
		var _n_g_b17 = ((_S.invoke(_n_ease,"outBack",[clampf((float(_n_q_b2)/0.04),0.0,1.0), 2.4]) * (1 - _S.MathFX.smooth(0.08,0.4,_n_q_b2))) * (1 + (0.12 * sin((_n_q_b2 * 70)))))
		_S.call_value(_n_longStar,[_n_p_b0, _n_TX, _n_TY, (24 * _n_g_b17), (1 - (float(_n_q_b2)/0.4)), _n_C])
	if _S.truth(((_n_q_b2 < 0.2) if _S.truth((_n_q_b2 >= 0)) else (_n_q_b2 >= 0))):
		var _n_k_b18 = (float(_n_q_b2)/0.2)
		var _n_rx_b19 = (2 + (7 * _S.invoke(_n_ease,"outCubic",[_n_k_b18])))
		var _n_ry_b20 = (4 + (12 * _S.invoke(_n_ease,"outCubic",[_n_k_b18])))
		if true:
			var _n_a_b21 = 0
			while _S.truth((_n_a_b21 < _n_TAU)):
				_S.invoke(_n_p_b0,"dot",[(((_n_TX + 4) + (10 * _n_k_b18)) + (cos(_n_a_b21) * _n_rx_b19)), (_n_TY + (sin(_n_a_b21) * _n_ry_b20)), (_n_WHITE if _S.truth((_n_k_b18 < 0.3)) else _S.index_value(_n_C,5)), (1.15 - _n_k_b18)])
				_n_a_b21 += 0.05
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_y0 = _S.read(_parent,"y0")
	var _n_TY = _S.read(_parent,"TY")
	var _n_s = _S.read(_parent,"s")
	var _n_TX = _S.read(_parent,"TX")
	var _n_x_b0 = _S.arg(_args,0)
	return (_n_y0 + (((_n_TY - _n_y0) * clampf((float((_n_x_b0 - _S.named_value(_n_s,"x0")))/(_n_TX - _S.named_value(_n_s,"x0"))),0.0,1.0)) * 0.85))
	return null
