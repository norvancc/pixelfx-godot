@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/zap-hit.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "fern", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Zap hit"}, {"desc": "A contact zap: an arc snaps in from the left, the hit point overloads into a knot of tiny crackling zigzags, a fern of burn marks glows outward, sparks jink away, ozone puffs."}, {"tags": ["lightning", "electric", "hit", "impact", "combat", "directional", "one-shot"]}, {"size": [144, 112]}, {"origin": [76, 56]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SNAP", 0.05)
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#6a6680"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	_S.define(_e, "grow", _S.function_value(_e, "_f1"))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 6)):
		_S.call_value(_S.read(_v3, "grow"), [0, 0, _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v3, "i"), 6), _S.read(_v3, "TAU")), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.35), 0.35])), _S.invoke(_S.read(_v3, "R"), "range", [18, 32]), 1, 0, 0])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_grow = _S.read(_parent,"grow")
	var _n_out = _S.read(_parent,"out")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_d_b5 = _S.arg(_args,5)
	var _n_depth_b6 = _S.arg(_args,6)
	var _n_pts_b7 = [[_n_x_b0, _n_y_b1, _n_d_b5]]
	var _n_side_b8 = _S.invoke(_n_R,"sign",[])
	if true:
		var _n_s_b9 = 0
		while _S.truth((_n_s_b9 < _n_len_b3)):
			_n_a_b2 += _S.invoke(_n_R,"range",[(-0.3), 0.3])
			_n_x_b0 += (cos(_n_a_b2) * 1.4)
			_n_y_b1 += (sin(_n_a_b2) * 1.4)
			_n_d_b5 += 1.4
			_S.invoke(_n_pts_b7,"push",[[_n_x_b0, _n_y_b1, _n_d_b5]])
			if _S.truth((_S.invoke(_n_R,"chance",[0.24]) if _S.truth(((_n_s_b9 > 2) if _S.truth((_n_depth_b6 < 2)) else (_n_depth_b6 < 2))) else ((_n_s_b9 > 2) if _S.truth((_n_depth_b6 < 2)) else (_n_depth_b6 < 2)))):
				_n_side_b8 = (-_n_side_b8)
				_S.call_value(_n_grow,[_n_x_b0, _n_y_b1, (_n_a_b2 + (_n_side_b8 * _S.invoke(_n_R,"range",[0.55, 1.05]))), ((_n_len_b3 - _n_s_b9) * _S.invoke(_n_R,"range",[0.3, 0.55])), (_n_w_b4 * 0.6), _n_d_b5, (_n_depth_b6 + 1)])
			_n_s_b9 += 1.4
	_S.invoke(_n_out,"push",[{"pts":_n_pts_b7,"w":_n_w_b4}])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "tree", _S.call_value(_S.read(_e, "fern"), [_S.read(_e, "R")]))
	_S.define(_e, "Y0", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 14), 6]))
	_S.define(_e, "kinked", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 16}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_a_b0 = (_S.invoke(_n_R,"range",[(-1.2), 1.2]) + (0 if _S.truth(_S.invoke(_n_R,"chance",[0.7])) else PI))
	var _n_sp_b1 = _S.invoke(_n_R,"range",[130, 250])
	return {"x":0,"y":0,"vx":(cos(_n_a_b0) * _n_sp_b1),"vy":((sin(_n_a_b0) * _n_sp_b1) - 40),"life":_S.invoke(_n_R,"range",[0.2, 0.36]),"age":(-_n_SNAP),"next":_S.invoke(_n_R,"range",[0.02, 0.05]),"trail":[]}
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "hit", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 60, _S.prop(_S.read(_v4, "C"), 4), 0.7, 0.3])
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 14, _S.read(_v4, "WHITE"), 0.5, 0.07])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 3)):
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SMOKE"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 3), 5]), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 4), 2]), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 5), 8]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [8, 16])), _S.invoke(_S.read(_v5, "R"), "range", [0.55, 0.75]), _S.call_value(_S.read(_v5, "mix"), [_S.read(_v5, "ASH"), _S.prop(_S.read(_v5, "C"), 4), 0.3]), _S.invoke(_S.read(_v5, "R"), "range", [2.5, 3.8]), _S.invoke(_S.read(_v5, "R"), "range", [0.08, 0.16])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	for _v6 in _S.array(_S.read(_e, "kinked")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _v6)
		var _v8 = _S.scope(_v7)
		if _S.truth(_S.logical("||", _S.binary("<", _S.set_prop(_S.read(_v8, "s"), "age", _S.read(_v8, "dt"), "+=", false), 0), func(): return _S.binary(">=", _S.prop(_S.read(_v8, "s"), "age"), _S.prop(_S.read(_v8, "s"), "life")))):
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v8, "s"), "next", _S.read(_v8, "dt"), "-=", false), 0)):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "s"), "next", _S.invoke(_S.read(_v9, "R"), "range", [0.025, 0.055]), "=", false)
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "Math"), "hypot", [_S.prop(_S.read(_v9, "s"), "vx"), _S.prop(_S.read(_v9, "s"), "vy")]))
			_S.define(_v9, "a", _S.binary("+", _S.invoke(_S.read(_v9, "Math"), "atan2", [_S.prop(_S.read(_v9, "s"), "vy"), _S.prop(_S.read(_v9, "s"), "vx")]), _S.binary("*", _S.invoke(_S.read(_v9, "R"), "sign", []), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 1.3]))))
			_S.set_prop(_S.read(_v9, "s"), "vx", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), "=", false)
			_S.set_prop(_S.read(_v9, "s"), "vy", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), "=", false)
			_S.invoke(_S.prop(_S.read(_v9, "s"), "trail"), "push", [[_S.prop(_S.read(_v9, "s"), "x"), _S.prop(_S.read(_v9, "s"), "y")]])
			if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v9, "s"), "trail"), "length"), 4)):
				_S.invoke(_S.prop(_S.read(_v9, "s"), "trail"), "shift", [])
		_S.set_prop(_S.read(_v8, "s"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vx"), 3), _S.read(_v8, "dt")), "-=", false)
		_S.set_prop(_S.read(_v8, "s"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vy"), 3), _S.read(_v8, "dt")), _S.binary("*", 140, _S.read(_v8, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v8, "s"), "x", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vx"), _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "s"), "y", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vy"), _S.read(_v8, "dt")), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_tree = _S.read(_parent,"tree")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_SNAP)):
		return null
	var _n_cool_b1 = _S.MathFX.smooth(0.45,0.85,_n_t)
	var _n_fade_b2 = (1 - _S.MathFX.smooth(0.78,0.88,_n_t))
	for _iter_0 in _S.array(_n_tree):
		var _n_br_b3 = _iter_0
		if true:
			var _n_i_b4 = 1
			while _S.truth((_n_i_b4 < _S.prop(_S.named_value(_n_br_b3,"pts"),"length"))):
				var _tuple_1 = _S.index_value(_S.named_value(_n_br_b3,"pts"),(_n_i_b4 - 1))
				var _n_x0_b5 = _S.prop(_tuple_1,0)
				var _n_y0_b6 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_S.named_value(_n_br_b3,"pts"),_n_i_b4)
				var _n_x_b7 = _S.prop(_tuple_2,0)
				var _n_y_b8 = _S.prop(_tuple_2,1)
				var _n_d_b9 = _S.prop(_tuple_2,2)
				var _n_age_b10 = ((_n_t - _n_SNAP) - (float(_n_d_b9)/260))
				if _S.truth((_n_age_b10 < 0)):
					break
				var _n_k_b11 = (exp((float((-_n_age_b10))/0.22)) - (_n_cool_b1 * 0.3))
				var _n_c_b12 = (_n_WHITE if _S.truth((_n_k_b11 > 0.75)) else (_S.index_value(_n_C,6) if _S.truth((_n_k_b11 > 0.45)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b11 > 0.25)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b11 > 0.1)) else (_S.index_value(_n_C,2) if _S.truth((_n_k_b11 > (-0.05))) else _S.index_value(_n_C,1))))))
				_S.invoke(_n_p_b0,"line",[_n_x0_b5, _n_y0_b6, _n_x_b7, _n_y_b8, _n_c_b12, _n_fade_b2])
				if _S.truth(((_n_d_b9 < 9) if _S.truth((_S.named_value(_n_br_b3,"w") >= 1)) else (_S.named_value(_n_br_b3,"w") >= 1))):
					_S.invoke(_n_p_b0,"line",[(_n_x0_b5 + 1), _n_y0_b6, (_n_x_b7 + 1), _n_y_b8, (_S.index_value(_n_C,5) if _S.truth((_n_k_b11 > 0.45)) else _S.index_value(_n_C,2)), _n_fade_b2])
				if _S.truth(((_n_k_b11 > 0) if _S.truth(_S.binary("===",_S.binary("&",_n_i_b4,3),0)) else _S.binary("===",_S.binary("&",_n_i_b4,3),0))):
					_S.invoke(_n_p_b0,"glow",[_n_x_b7, _n_y_b8, 5, _S.index_value(_n_C,5), ((0.35 * _n_k_b11) * _n_fade_b2)])
				_n_i_b4 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_o = _S.read(_parent,"o")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_C = _S.read(_parent,"C")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_kinked = _S.read(_parent,"kinked")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = floori(((_n_t * 30) + 0.0001))
	if _S.truth((_n_t < 0.32)):
		var _n_r_b2 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),2,_n_f_b1])
		var _n_b_b3 = _S.call_value(_n_zigzag,[_n_r_b2, (-66), _n_Y0, 0, 0, 0.22, 0.35])
		var _n_u_b4 = clampf((float(_n_t)/_n_SNAP),0.0,1.0)
		var _n_k_b5 = (1 if _S.truth((_n_t < _n_SNAP)) else ((0.7 if _S.truth(fmod(_n_f_b1,2)) else 1) if _S.truth((_n_t < 0.2)) else (0.55 * (1 - (float((_n_t - 0.2))/0.12)))))
		_S.call_value(_n_stroke,[_n_p_b0, ({"paths":[_S.index_value(_S.named_value(_n_b_b3,"paths"),0)]} if _S.truth((_n_u_b4 < 1)) else _n_b_b3), _n_k_b5, _n_C, (0.95 if _S.truth((_n_t < (_n_SNAP + 0.034))) else 0.7), {"upTo":_n_u_b4,"hero":((_n_t < (_n_SNAP + 0.034)) if _S.truth((_n_t >= _n_SNAP)) else (_n_t >= _n_SNAP))}])
		if _S.truth((_n_u_b4 < 1)):
			var _n_tp_b6 = _S.named_value(_S.index_value(_S.named_value(_n_b_b3,"paths"),0),"pts")
			var _tuple_0 = _S.index_value(_n_tp_b6,floori((_n_u_b4 * (_S.prop(_n_tp_b6,"length") - 1))))
			var _n_hx_b7 = _S.prop(_tuple_0,0)
			var _n_hy_b8 = _S.prop(_tuple_0,1)
			_S.invoke(_n_p_b0,"circle",[_n_hx_b7, _n_hy_b8, 2, _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_hx_b7, _n_hy_b8, 14, _S.index_value(_n_C,5), 0.6])
	if _S.truth(((_n_t < 0.45) if _S.truth((_n_t >= _n_SNAP)) else (_n_t >= _n_SNAP))):
		var _n_a_b9 = (float((_n_t - _n_SNAP))/0.4)
		var _n_r_b10 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),5,_n_f_b1])
		var _n_R0_b11 = (8 * (1 - (_n_a_b9 * 0.6)))
		var _n_m_b12 = floori((11 * (1 - (_n_a_b9 * 0.5)))+0.5)
		if true:
			var _n_i_b13 = 0
			while _S.truth((_n_i_b13 < _n_m_b12)):
				var _n_ang_b14 = _S.invoke(_n_r_b10,"range",[0, _n_TAU])
				var _n_d0_b15 = _S.invoke(_n_r_b10,"range",[0.5, (_n_R0_b11 * 0.5)])
				var _n_ang2_b16 = (_n_ang_b14 + _S.invoke(_n_r_b10,"range",[(-1.2), 1.2]))
				var _n_d1_b17 = _S.invoke(_n_r_b10,"range",[(_n_R0_b11 * 0.55), _n_R0_b11])
				_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b10, (cos(_n_ang_b14) * _n_d0_b15), (sin(_n_ang_b14) * _n_d0_b15), (cos(_n_ang2_b16) * _n_d1_b17), (sin(_n_ang2_b16) * _n_d1_b17), 0.5, 0]), ((0.75 * (1 - _n_a_b9)) + 0.25), _n_C, 0.25])
				_n_i_b13 += 1.0
		_S.invoke(_n_p_b0,"circle",[0, 0, ((3 * (1 - _n_a_b9)) + 1), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[0, 0, ((2 * (1 - _n_a_b9)) + 0.5), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, 0, 20, _S.index_value(_n_C,4), (0.55 * (1 - _n_a_b9))])
		if _S.truth((_n_t < (_n_SNAP + 0.07))):
			_S.invoke(_n_p_b0,"glow",[0, 0, 9, _n_WHITE, 0.4])
	for _iter_1 in _S.array(_n_kinked):
		var _n_s_b18 = _iter_1
		if _S.truth(((_S.named_value(_n_s_b18,"age") < 0) if _S.truth((_S.named_value(_n_s_b18,"age") < 0)) else (_S.named_value(_n_s_b18,"age") >= _S.named_value(_n_s_b18,"life")))):
			continue
		var _n_k_b19 = (1 - (float(_S.named_value(_n_s_b18,"age"))/_S.named_value(_n_s_b18,"life")))
		var _n_path_b20 = _S.concat([_S.array(_S.named_value(_n_s_b18,"trail")),[[_S.named_value(_n_s_b18,"x"), _S.named_value(_n_s_b18,"y")]]])
		if true:
			var _n_i_b21 = 0
			while _S.truth((_n_i_b21 < (_S.prop(_n_path_b20,"length") - 1))):
				_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_n_path_b20,_n_i_b21),0), _S.index_value(_S.index_value(_n_path_b20,_n_i_b21),1), _S.index_value(_S.index_value(_n_path_b20,(_n_i_b21 + 1)),0), _S.index_value(_S.index_value(_n_path_b20,(_n_i_b21 + 1)),1), ((_n_WHITE if _S.truth((_n_k_b19 > 0.5)) else _S.index_value(_n_C,6)) if _S.truth(_S.binary("===",_n_i_b21,(_S.prop(_n_path_b20,"length") - 2))) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b19 > 0.5)) else _S.index_value(_n_C,4))), (0.6 + (0.4 * (float(_n_i_b21)/_S.prop(_n_path_b20,"length"))))])
				_n_i_b21 += 1.0
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_s_b18,"x"), _S.named_value(_n_s_b18,"y"), (_n_WHITE if _S.truth((_n_k_b19 > 0.4)) else _S.index_value(_n_C,5))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b18,"x"), _S.named_value(_n_s_b18,"y"), 4, _S.index_value(_n_C,5), (0.4 * _n_k_b19)])
	if _S.truth((_n_t >= _n_SNAP)):
		_S.invoke(_n_p_b0,"glow",[0, 0, (40 * maxf(0,(1 - (float(_n_t)/0.85)))), _S.index_value(_n_C,3), ((0.45 * exp(((-(_n_t - _n_SNAP)) * 5))) * (0.7 if _S.truth(fmod(_n_f_b1,2)) else 1))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
