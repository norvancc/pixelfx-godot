@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/projectiles/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f3":"projectile_cloud"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "beat", _S.function_value(_e, "_f0"))
	_S.define(_e, "wake", _S.function_value(_e, "_f1"))
	_S.define(_e, "puff", _S.function_value(_e, "_f2"))
	_S.define(_e, "cloud", _S.function_value(_e, "_f3"))
	_S.define(_e, "blur", _S.function_value(_e, "_f5"))
	_S.define(_e, "spark", _S.function_value(_e, "_f6"))
	_S.define(_e, "flashShape", _S.function_value(_e, "_f7"))
	_S.define(_e, "flash", _S.function_value(_e, "_f9"))
	_S.define(_e, "casing", _S.function_value(_e, "_f11"))
	_S.define(_e, "drawCasing", _S.function_value(_e, "_f12"))
	_S.define(_e, "turnSprite", _S.function_value(_e, "_f13"))
	_S.define(_e, "pixelShape", _S.function_value(_e, "_f15"))
	_exports["beat"] = _S.read(_e, "beat")
	_exports["wake"] = _S.read(_e, "wake")
	_exports["puff"] = _S.read(_e, "puff")
	_exports["cloud"] = _S.read(_e, "cloud")
	_S.define(_e, "Smoke", _S.class_value("Smoke", _S.function_value(_e, "_f20"), {"add": _S.function_value(_e, "_f21"), "update": _S.function_value(_e, "_f23"), "puffs": _S.function_value(_e, "_f24")}, {"count": _S.function_value(_e, "_f22")}, {}, null))
	_exports["Smoke"] = _S.read(_e, "Smoke")
	_exports["spark"] = _S.read(_e, "spark")
	_exports["flashShape"] = _S.read(_e, "flashShape")
	_S.define(_e, "profile", _S.function_value(_e, "_f25"))
	_exports["flash"] = _S.read(_e, "flash")
	_exports["casing"] = _S.read(_e, "casing")
	_exports["drawCasing"] = _S.read(_e, "drawCasing")
	_exports["turnSprite"] = _S.read(_e, "turnSprite")
	_exports["pixelShape"] = _S.read(_e, "pixelShape")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_period_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_life_b4 = _S.arg(_args,4)
	var _n_fn_b5 = _S.arg(_args,5)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < _n_n_b2)):
			var _n_L_b7 = (_S.call_value(_n_life_b4,[_S.MathFX.rng([_n_seed_b3,_n_i_b6,911])]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_life_b4),"function")) else _n_life_b4)
			if true:
				var _n_age_b8 = _S.call_value(_n_wrap,[((_n_t_b0 - (float((_n_i_b6 * _n_period_b1))/_n_n_b2)) + 1e-7), _n_period_b1])
				while _S.truth((_n_age_b8 < _n_L_b7)):
					_S.call_value(_n_fn_b5,[_n_age_b8, _n_L_b7, _S.MathFX.rng([_n_seed_b3,_n_i_b6]), _n_i_b6])
					_n_age_b8 += _n_period_b1
			_n_i_b6 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_age_b4 = _S.arg(_args,4)
	var _n_V_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	var _n_g_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	var _n_e_b8 = exp(((-_n_k_b6) * _n_age_b4))
	var _n_f_b9 = (float((1 - _n_e_b8))/_n_k_b6)
	var _n_vt_b10 = (float(_n_g_b7)/_n_k_b6)
	return [((_n_x_b0 + (_n_vx_b2 * _n_f_b9)) - (_n_V_b5 * _n_age_b4)), ((_n_y_b1 + (_n_vt_b10 * _n_age_b4)) + ((_n_vy_b3 - _n_vt_b10) * _n_f_b9)), ((_n_vx_b2 * _n_e_b8) - _n_V_b5), (_n_vt_b10 + ((_n_vy_b3 - _n_vt_b10) * _n_e_b8))]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_cap_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_warm_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	var _n_wc_b8 = _S.coalesce(_S.arg(_args,8),func():return 0)
	var _n_wa_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	if _S.truth(((_n_a_b4 <= 0.01) if _S.truth((_n_a_b4 <= 0.01)) else (_n_r_b3 < 0.5))):
		return null
	_S.invoke(_n_p_b0,"disc",[_n_x_b1, _n_y_b2, _n_r_b3, _n_c_b5, (_n_a_b4 * 0.45)])
	_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + (_n_r_b3 * 0.05)), (_n_y_b2 + (_n_r_b3 * 0.06)), (_n_r_b3 * 0.74), _n_c_b5, (_n_a_b4 * 0.62)])
	if _S.truth((_n_cap_b6 > 0.02)):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b1 - (_n_r_b3 * 0.22)), (_n_y_b2 - (_n_r_b3 * 0.3)), (_n_r_b3 * 0.5), _S.ColorFX.mix(_n_c_b5,_n_WHITE,0.14), ((_n_a_b4 * 0.42) * _n_cap_b6)])
	if _S.truth((_n_warm_b7 > 0.02)):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + ((cos(_n_wa_b9) * _n_r_b3) * 0.32)), (_n_y_b2 + ((sin(_n_wa_b9) * _n_r_b3) * 0.32)), (_n_r_b3 * 0.55), _n_wc_b8, ((_n_a_b4 * 0.7) * _n_warm_b7)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "list", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "WR", _S.arg(_args, 3))
	var _v3 = _S.coalesce(_S.arg(_args, 4), func(): return _S.merge([]))
	_S.define(_e, "dens", _S.coalesce(_S.prop(_v3, "dens"), func(): return 1.5))
	_S.define(_e, "max", _S.coalesce(_S.prop(_v3, "max"), func(): return 0.86))
	_S.define(_e, "clip", _S.prop(_v3, "clip"))
	_S.define(_e, "lit", _S.coalesce(_S.prop(_v3, "lit"), func(): return 1))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "list"), "length"))):
		return null
	_S.define(_e, "X0", INF)
	_S.define(_e, "Y0", INF)
	_S.define(_e, "X1", _S.unary("-", INF))
	_S.define(_e, "Y1", _S.unary("-", INF))
	for _v4 in _S.array(_S.read(_e, "list")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "q", _v4)
		var _v6 = _S.scope(_v5)
		_S.write(_v6, "X0", _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "X0"), _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v6, "q"), "x"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
		_S.write(_v6, "X1", _S.invoke(_S.read(_v6, "Math"), "max", [_S.read(_v6, "X1"), _S.invoke(_S.read(_v6, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v6, "q"), "x"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
		_S.write(_v6, "Y0", _S.invoke(_S.read(_v6, "Math"), "min", [_S.read(_v6, "Y0"), _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v6, "q"), "y"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
		_S.write(_v6, "Y1", _S.invoke(_S.read(_v6, "Math"), "max", [_S.read(_v6, "Y1"), _S.invoke(_S.read(_v6, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v6, "q"), "y"), _S.prop(_S.read(_v6, "q"), "r"))])]), "=", false)
	_S.define(_e, "W", _S.binary("+", _S.binary("-", _S.read(_e, "X1"), _S.read(_e, "X0")), 3))
	_S.define(_e, "H", _S.binary("+", _S.binary("-", _S.read(_e, "Y1"), _S.read(_e, "Y0")), 3))
	_S.define(_e, "D", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "F", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.last([_S.write(_e, "X0", 1, "-=", true), _S.write(_e, "Y0", 1, "-=", true)])
	for _v7 in _S.array(_S.read(_e, "list")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "r", _S.prop(_S.read(_v9, "q"), "r"))
		_S.define(_v9, "r2", _S.binary("*", _S.read(_v9, "r"), _S.read(_v9, "r")))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "y", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v10, "q"), "y"), _S.read(_v10, "r"))]))
		while _S.truth(_S.binary("<=", _S.read(_v10, "y"), _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v10, "q"), "y"), _S.read(_v10, "r"))]))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "dy", _S.binary("-", _S.binary("+", _S.read(_v11, "y"), 0.5), _S.prop(_S.read(_v11, "q"), "y")))
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "x", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v12, "q"), "x"), _S.read(_v12, "r"))]))
			while _S.truth(_S.binary("<=", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v12, "q"), "x"), _S.read(_v12, "r"))]))):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "dx", _S.binary("-", _S.binary("+", _S.read(_v13, "x"), 0.5), _S.prop(_S.read(_v13, "q"), "x")))
				_S.define(_v13, "d2", _S.binary("/", _S.binary("+", _S.binary("*", _S.read(_v13, "dx"), _S.read(_v13, "dx")), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy"))), _S.read(_v13, "r2")))
				if _S.truth(_S.binary(">=", _S.read(_v13, "d2"), 1)):
					_v12 = _S.iteration(_v12)
					_S.write(_v12, "x", 1, "+=", true)
					continue
				_S.define(_v13, "k", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v13, "d2"))]), _S.prop(_S.read(_v13, "q"), "a")))
				_S.define(_v13, "i", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v13, "y"), _S.read(_v13, "Y0")), _S.read(_v13, "W")), _S.binary("-", _S.read(_v13, "x"), _S.read(_v13, "X0"))))
				_S.set_prop(_S.read(_v13, "D"), _S.read(_v13, "i"), _S.read(_v13, "k"), "+=", false)
				_S.set_prop(_S.read(_v13, "L"), _S.read(_v13, "i"), _S.binary("*", _S.read(_v13, "k"), _S.prop(_S.read(_v13, "q"), "b")), "+=", false)
				_S.set_prop(_S.read(_v13, "F"), _S.read(_v13, "i"), _S.binary("*", _S.binary("*", _S.read(_v13, "k"), _S.prop(_S.read(_v13, "q"), "w")), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v13, "clamp"), [_S.binary("+", 0.5, _S.binary("/", _S.read(_v13, "dx"), _S.read(_v13, "r")))])))), "+=", false)
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "x", 1, "+=", true)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "y", 1, "+=", true)
	_S.define(_e, "B", _S.call_value(_S.read(_e, "blur"), [_S.call_value(_S.read(_e, "blur"), [_S.read(_e, "D"), _S.read(_e, "W"), _S.read(_e, "H"), 1, 2]), _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "W"), 2]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("+", _S.read(_e, "X0"), 1), _S.binary("+", _S.read(_e, "Y0"), 1), _S.binary("+", _S.read(_e, "X1"), 1), _S.binary("+", _S.read(_e, "Y1"), 1), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_X0 = _S.read(_parent,"X0")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_D = _S.read(_parent,"D")
	var _n_clip = _S.read(_parent,"clip")
	var _n_max = _S.read(_parent,"max")
	var _n_dens = _S.read(_parent,"dens")
	var _n_B = _S.read(_parent,"B")
	var _n_lit = _S.read(_parent,"lit")
	var _n_F = _S.read(_parent,"F")
	var _n_L = _S.read(_parent,"L")
	var _n_n = _S.read(_parent,"n")
	var _n_p = _S.read(_parent,"p")
	var _n_R = _S.read(_parent,"R")
	var _n_WR = _S.read(_parent,"WR")
	var _n_lx_b0 = _S.arg(_args,0)
	var _n_ly_b1 = _S.arg(_args,1)
	var _n_sx_b2 = _S.arg(_args,2)
	var _n_sy_b3 = _S.arg(_args,3)
	var _n_cx_b4 = (floori(_n_lx_b0) - _n_X0)
	var _n_cy_b5 = (floori(_n_ly_b1) - _n_Y0)
	if _S.truth(((((_n_cx_b4 < 1) if _S.truth((_n_cx_b4 < 1)) else (_n_cy_b5 < 1)) if _S.truth(((_n_cx_b4 < 1) if _S.truth((_n_cx_b4 < 1)) else (_n_cy_b5 < 1))) else (_n_cx_b4 >= (_n_W - 1))) if _S.truth((((_n_cx_b4 < 1) if _S.truth((_n_cx_b4 < 1)) else (_n_cy_b5 < 1)) if _S.truth(((_n_cx_b4 < 1) if _S.truth((_n_cx_b4 < 1)) else (_n_cy_b5 < 1))) else (_n_cx_b4 >= (_n_W - 1)))) else (_n_cy_b5 >= (_n_H - 1)))):
		return null
	var _n_i_b6 = ((_n_cy_b5 * _n_W) + _n_cx_b4)
	var _n_d_b7 = _S.index_value(_n_D,_n_i_b6)
	if _S.truth(((_n_d_b7 < 0.05) if _S.truth((_n_d_b7 < 0.05)) else (not _S.truth(_S.call_value(_n_clip,[_n_lx_b0, _n_ly_b1])) if _S.truth(_n_clip) else _n_clip))):
		return null
	var _n_a_b8 = minf(_n_max,(float(ceili(((1 - exp(((-_n_d_b7) * _n_dens))) * 6)))/6))
	if _S.truth((_n_a_b8 < 0.15)):
		return null
	var _n_gy_b9 = (_S.index_value(_n_B,(_n_i_b6 + _n_W)) - _S.index_value(_n_B,(_n_i_b6 - _n_W)))
	var _n_gx_b10 = (_S.index_value(_n_B,(_n_i_b6 + 1)) - _S.index_value(_n_B,(_n_i_b6 - 1)))
	var _n_up_b11 = clampf((0.5 + ((atan((float(((_n_gy_b9 * 0.9) + (_n_gx_b10 * 0.35)))/((_S.index_value(_n_B,_n_i_b6) * 0.16) + 0.03))) * 0.42) * _n_lit)),0.0,1.0)
	var _n_w_b12 = (float(_S.index_value(_n_F,_n_i_b6))/_n_d_b7)
	var _n_j_b13 = clampf(floori((((((float(_S.index_value(_n_L,_n_i_b6))/_n_d_b7) * (0.3 + (0.7 * _n_up_b11))) * (_n_n - 1)) + 0.25) + (_n_w_b12 * 1.5))+0.5),0,(_n_n - 1))
	_S.invoke(_n_p,"blendPx",[_n_sx_b2, _n_sy_b3, (_S.ColorFX.mix(_S.index_value(_n_R,_n_j_b13),_S.index_value(_n_WR,_n_j_b13),minf(0.9,(float(ceili((_n_w_b12 * 10)))/10))) if _S.truth((_n_w_b12 > 0.03)) else _S.index_value(_n_R,_n_j_b13)), _n_a_b8])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_src_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.arg(_args,2)
	var _n_step_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_out_b5 = _S.construct(_n_Float32Array,[_S.prop(_n_src_b0,"length")])
	var _n_n_b6 = (_n_w_b1 if _S.truth(_S.binary("===",_n_step_b3,1)) else _n_h_b2)
	var _n_lines_b7 = (_n_h_b2 if _S.truth(_S.binary("===",_n_step_b3,1)) else _n_w_b1)
	var _n_k_b8 = (float(1)/((2 * _n_r_b4) + 1))
	if true:
		var _n_l_b9 = 0
		while _S.truth((_n_l_b9 < _n_lines_b7)):
			var _n_base_b10 = ((_n_l_b9 * _n_w_b1) if _S.truth(_S.binary("===",_n_step_b3,1)) else _n_l_b9)
			var _n_acc_b11 = 0
			if true:
				var _n_j_b12 = (-_n_r_b4)
				while _S.truth((_n_j_b12 <= _n_r_b4)):
					_n_acc_b11 += (_S.index_value(_n_src_b0,(_n_base_b10 + (_n_j_b12 * _n_step_b3))) if _S.truth(((_n_j_b12 < _n_n_b6) if _S.truth((_n_j_b12 >= 0)) else (_n_j_b12 >= 0))) else 0)
					_n_j_b12 += 1.0
			if true:
				var _n_j_b13 = 0
				while _S.truth((_n_j_b13 < _n_n_b6)):
					_S.set_prop(_n_out_b5,(_n_base_b10 + (_n_j_b13 * _n_step_b3)),(_n_acc_b11 * _n_k_b8),"=")
					var _n_a_b14 = (_n_j_b13 - _n_r_b4)
					var _n_b_b15 = ((_n_j_b13 + _n_r_b4) + 1)
					if _S.truth((_n_a_b14 >= 0)):
						_n_acc_b11 -= _S.index_value(_n_src_b0,(_n_base_b10 + (_n_a_b14 * _n_step_b3)))
					if _S.truth((_n_b_b15 < _n_n_b6)):
						_n_acc_b11 += _S.index_value(_n_src_b0,(_n_base_b10 + (_n_b_b15 * _n_step_b3)))
					_n_j_b13 += 1.0
			_n_l_b9 += 1.0
	return _n_out_b5
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_S_b6 = _S.arg(_args,6)
	var _n_glow_b7 = _S.coalesce(_S.arg(_args,7),func():return 0.45)
	var _n_stretch_b8 = _S.coalesce(_S.arg(_args,8),func():return 0.022)
	var _n_max_b9 = _S.coalesce(_S.arg(_args,9),func():return 9)
	var _n_sp_b10 = _S.logical("||",_S.Bridge.hypot([_n_vx_b3, _n_vy_b4]),func():return 1)
	var _n_ux_b11 = (float(_n_vx_b3)/_n_sp_b10)
	var _n_uy_b12 = (float(_n_vy_b4)/_n_sp_b10)
	var _n_len_b13 = minf(_n_max_b9,(1 + (_n_sp_b10 * _n_stretch_b8)))
	var _n_head_b14 = (_S.index_value(_n_S_b6,0) if _S.truth((_n_k_b5 > 0.6)) else (_S.index_value(_n_S_b6,1) if _S.truth((_n_k_b5 > 0.3)) else _S.index_value(_n_S_b6,2)))
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - (_n_ux_b11 * _n_len_b13)), (_n_y_b2 - (_n_uy_b12 * _n_len_b13)), (_n_x_b1 - ((_n_ux_b11 * _n_len_b13) * 0.4)), (_n_y_b2 - ((_n_uy_b12 * _n_len_b13) * 0.4)), (_n_head_b14 if _S.truth((_n_k_b5 > 0.5)) else _S.index_value(_n_S_b6,3))])
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - ((_n_ux_b11 * _n_len_b13) * 0.45)), (_n_y_b2 - ((_n_uy_b12 * _n_len_b13) * 0.45)), _n_x_b1, _n_y_b2, _n_head_b14])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 3, _n_head_b14, (_n_glow_b7 * _n_k_b5)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.arg(_args,1)
	var _object_0 = _S.coalesce(_S.arg(_args,2),func():return {})
	var _n_size_b2 = _S.coalesce(_S.named_value(_object_0,"size"),func():return 1)
	var _n_spike_b3 = _S.coalesce(_S.named_value(_object_0,"spike"),func():return [12, 20])
	var _n_diag_b4 = _S.coalesce(_S.named_value(_object_0,"diag"),func():return [5, 10])
	var _n_cross_b5 = _S.coalesce(_S.named_value(_object_0,"cross"),func():return [3, 6])
	var _n_back_b6 = _S.coalesce(_S.named_value(_object_0,"back"),func():return [2, 4.5])
	var _n_core_b7 = _S.coalesce(_S.named_value(_object_0,"core"),func():return 0.7)
	var _n_k_b8 = (1 if _S.truth(_S.binary("===",_n_f_b1,1)) else 0.6)
	var _n_w_b9 = (1 if _S.truth(_S.binary("===",_n_f_b1,1)) else 0.72)
	var _n_S_b10 = _n_size_b2
	var _n_L_b11 = [{"off":0.5,"a":_S.invoke(_n_r_b0,"range",[(-0.08), 0.08]),"len":((_S.invoke(_n_r_b0,"range",[5.5, 8]) * _n_S_b10) * _n_k_b8),"wid":((_S.invoke(_n_r_b0,"range",[2.1, 2.6]) * _n_S_b10) * _n_w_b9),"core":(0.5 * _n_core_b7)}, {"off":2,"a":_S.invoke(_n_r_b0,"range",[(-0.07), 0.07]),"len":((_S.invoke(_n_r_b0,"range",[_S.index_value(_n_spike_b3,0), _S.index_value(_n_spike_b3,1)]) * _n_S_b10) * _n_k_b8),"wid":((_S.invoke(_n_r_b0,"range",[1, 1.3]) * _n_S_b10) * _n_w_b9),"core":(0.35 * _n_core_b7)}]
	var _n_ray_b12 = _S.function_value(_S.capture(_parent,{"L":_n_L_b11,"r":_n_r_b0,"S":_n_S_b10,"k":_n_k_b8,"w":_n_w_b9,"core":_n_core_b7,"this":_this}),"_f8")
	for _iter_1 in _S.array([(-1), 1]):
		var _n_s_b13 = _iter_1
		_S.call_value(_n_ray_b12,[(_n_s_b13 * _S.invoke(_n_r_b0,"range",[0.3, 0.8])), _S.invoke(_n_r_b0,"range",[_S.index_value(_n_diag_b4,0), _S.index_value(_n_diag_b4,1)]), _S.invoke(_n_r_b0,"range",[1.1, 1.5]), _S.invoke(_n_r_b0,"chance",[0.85])])
		_S.call_value(_n_ray_b12,[(_n_s_b13 * _S.invoke(_n_r_b0,"range",[1.15, 1.7])), _S.invoke(_n_r_b0,"range",[_S.index_value(_n_cross_b5,0), _S.index_value(_n_cross_b5,1)]), _S.invoke(_n_r_b0,"range",[1, 1.3]), _S.invoke(_n_r_b0,"chance",[0.6])])
		_S.call_value(_n_ray_b12,[(_n_s_b13 * _S.invoke(_n_r_b0,"range",[2, 2.7])), _S.invoke(_n_r_b0,"range",[_S.index_value(_n_back_b6,0), _S.index_value(_n_back_b6,1)]), 1, _S.logical("&&",_S.invoke(_n_r_b0,"chance",[0.7]),func():return _S.binary("===",_n_f_b1,1))])
	return _n_L_b11
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_r = _S.read(_parent,"r")
	var _n_S = _S.read(_parent,"S")
	var _n_k = _S.read(_parent,"k")
	var _n_w = _S.read(_parent,"w")
	var _n_core = _S.read(_parent,"core")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_len_b1 = _S.arg(_args,1)
	var _n_wid_b2 = _S.arg(_args,2)
	var _n_on_b3 = _S.arg(_args,3)
	return (_S.invoke(_n_L,"push",[{"off":_S.invoke(_n_r,"range",[0.5, 2]),"a":_n_a_b0,"len":((_n_len_b1 * _n_S) * _n_k),"wid":((_n_wid_b2 * _n_S) * _n_w),"core":(0.25 * _n_core)}]) if _S.truth(_n_on_b3) else _n_on_b3)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "C", _S.arg(_args, 5))
	_S.define(_e, "seed", _S.arg(_args, 6))
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.define(_e, "ext", 2)
	for _v23 in _S.array(_S.read(_e, "L")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "l", _v23)
		_S.write(_v24, "ext", _S.invoke(_S.read(_v24, "Math"), "max", [_S.read(_v24, "ext"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v24, "l"), "off"), _S.prop(_S.read(_v24, "l"), "len")), 2)]), "=", false)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "ext")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ext")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "ext")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ext")), _S.function_value(_e, "_f10")])
	return _S.read(_e, "ext")

static func _f10(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_c = _S.read(_parent,"c")
	var _n_s = _S.read(_parent,"s")
	var _n_profile = _S.read(_parent,"profile")
	var _n_L = _S.read(_parent,"L")
	var _n_seed = _S.read(_parent,"seed")
	var _n_ext = _S.read(_parent,"ext")
	var _n_C = _S.read(_parent,"C")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_x)
	var _n_dy_b3 = (_n_py_b1 - _n_y)
	var _n_along_b4 = ((_n_dx_b2 * _n_c) + (_n_dy_b3 * _n_s))
	var _n_across_b5 = (((-_n_dx_b2) * _n_s) + (_n_dy_b3 * _n_c))
	var _n_m_b6 = (-9)
	var _n_hot_b7 = false
	var _n_warm_b8 = false
	for _iter_0 in _S.array(_n_L):
		var _n_l_b10 = _iter_0
		var _n_ca_b11 = cos(_S.named_value(_n_l_b10,"a"))
		var _n_sa_b12 = sin(_S.named_value(_n_l_b10,"a"))
		var _n_lu_b13 = (((_n_along_b4 - _S.named_value(_n_l_b10,"off")) * _n_ca_b11) + (_n_across_b5 * _n_sa_b12))
		var _n_lv_b14 = (((-(_n_along_b4 - _S.named_value(_n_l_b10,"off"))) * _n_sa_b12) + (_n_across_b5 * _n_ca_b11))
		if _S.truth(((_n_lu_b13 < (-1.5)) if _S.truth((_n_lu_b13 < (-1.5))) else (_n_lu_b13 > (_S.named_value(_n_l_b10,"len") + 1)))):
			continue
		var _n_r_b15 = _S.call_value(_n_profile,[_n_l_b10, maxf(0,_n_lu_b13)])
		var _n_mm_b16 = (_n_r_b15 - absf(_n_lv_b14))
		if _S.truth((_n_mm_b16 > _n_m_b6)):
			_n_m_b6 = _n_mm_b16
		if _S.truth(((absf(_n_lv_b14) <= (_n_r_b15 * 0.5)) if _S.truth((_n_lu_b13 < (_S.named_value(_n_l_b10,"len") * _S.named_value(_n_l_b10,"core")))) else (_n_lu_b13 < (_S.named_value(_n_l_b10,"len") * _S.named_value(_n_l_b10,"core"))))):
			_n_hot_b7 = true
		if _S.truth((_n_mm_b16 > (_n_r_b15 * 0.4))):
			_n_warm_b8 = true
	var _n_dm_b9 = (1.6 - _S.Bridge.hypot([(_n_along_b4 - 0.5), _n_across_b5]))
	if _S.truth((_n_dm_b9 > _n_m_b6)):
		_n_m_b6 = _n_dm_b9
	if _S.truth((_n_dm_b9 > 0.6)):
		_n_hot_b7 = true
	_n_m_b6 += (((_S.MathFX.rand([((floori(_n_px_b0) * 73) + (floori(_n_py_b1) * 151)),_n_seed]) - 0.5) * 0.5) * minf(1,(float(_n_ext)/14)))
	if _S.truth((_n_m_b6 < (-0.85))):
		return null
	return (_S.index_value(_n_C,3) if _S.truth((_n_m_b6 < 0)) else (_S.index_value(_n_C,0) if _S.truth(_n_hot_b7) else (_S.index_value(_n_C,1) if _S.truth(_n_warm_b8) else _S.index_value(_n_C,2))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_va_b4 = _S.arg(_args,4)
	var _n_age_b5 = _S.arg(_args,5)
	var _n_g_b6 = _S.arg(_args,6)
	var _n_floor_b7 = _S.arg(_args,7)
	var _n_bounce_b8 = _S.coalesce(_S.arg(_args,8),func():return 0.42)
	var _n_a0_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	var _n_t0_b10 = 0
	var _n_a_b11 = _n_a0_b9
	var _n_hit_b12 = (-1)
	if true:
		var _n_n_b13 = 0
		while _S.truth((_n_n_b13 < 6)):
			var _n_d_b14 = (_n_floor_b7 - _n_y_b1)
			var _n_T_b15 = (float(((-_n_vy_b3) + sqrt(maxf(0,((_n_vy_b3 * _n_vy_b3) + ((2 * _n_g_b6) * _n_d_b14))))))/_n_g_b6)
			if _S.truth(((_n_age_b5 - _n_t0_b10) < _n_T_b15)):
				var _n_u_b17 = (_n_age_b5 - _n_t0_b10)
				return {"x":(_n_x_b0 + (_n_vx_b2 * _n_u_b17)),"y":((_n_y_b1 + (_n_vy_b3 * _n_u_b17)) + (((0.5 * _n_g_b6) * _n_u_b17) * _n_u_b17)),"a":(_n_a_b11 + (_n_va_b4 * _n_u_b17)),"rest":false,"hit":_n_hit_b12}
			_n_x_b0 += (_n_vx_b2 * _n_T_b15)
			_n_a_b11 += (_n_va_b4 * _n_T_b15)
			_n_t0_b10 += _n_T_b15
			_n_hit_b12 = (_n_age_b5 - _n_t0_b10)
			var _n_vin_b16 = (_n_vy_b3 + (_n_g_b6 * _n_T_b15))
			_n_y_b1 = _n_floor_b7
			if _S.truth(((_n_vin_b16 * _n_bounce_b8) < 45)):
				var _n_u_b18 = (_n_age_b5 - _n_t0_b10)
				var _n_k_b19 = 7
				var _n_s_b20 = (float((1 - exp(((-_n_k_b19) * _n_u_b18))))/_n_k_b19)
				return {"x":(_n_x_b0 + ((_n_vx_b2 * 0.6) * _n_s_b20)),"y":_n_floor_b7,"a":(floori((float(_n_a_b11)/PI)+0.5) * PI),"rest":true,"hit":_n_hit_b12}
			_n_vy_b3 = ((-_n_vin_b16) * _n_bounce_b8)
			_n_vx_b2 *= 0.55
			_n_va_b4 *= 0.6
			_n_n_b13 += 1.0
	return {"x":_n_x_b0,"y":_n_floor_b7,"a":(floori((float(_n_a_b11)/PI)+0.5) * PI),"rest":true,"hit":_n_hit_b12}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_B_b2 = _S.arg(_args,2)
	var _n_fade_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_ca_b4 = cos(_S.named_value(_n_k_b1,"a"))
	var _n_sa_b5 = sin(_S.named_value(_n_k_b1,"a"))
	var _n_x_b6 = _S.named_value(_n_k_b1,"x")
	var _n_y_b7 = (_S.named_value(_n_k_b1,"y") - 0.5)
	_S.invoke(_n_p_b0,"dot",[(_n_x_b6 - _n_ca_b4), (_n_y_b7 - _n_sa_b5), _S.index_value(_n_B_b2,1), _n_fade_b3])
	_S.invoke(_n_p_b0,"dot",[_n_x_b6, _n_y_b7, _S.index_value(_n_B_b2,2), _n_fade_b3])
	_S.invoke(_n_p_b0,"dot",[(_n_x_b6 + _n_ca_b4), (_n_y_b7 + _n_sa_b5), _S.index_value(_n_B_b2,3), _n_fade_b3])
	if _S.truth(((_S.named_value(_n_k_b1,"hit") < 0.07) if _S.truth((_S.named_value(_n_k_b1,"hit") >= 0)) else (_S.named_value(_n_k_b1,"hit") >= 0))):
		_S.invoke(_n_p_b0,"px",[(_n_x_b6 + (_n_ca_b4 * 0.5)), (_n_y_b7 - 1), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, 5, _S.index_value(_n_B_b2,3), (0.55 * (1 - (float(_S.named_value(_n_k_b1,"hit"))/0.07)))])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_rows_b1 = _S.arg(_args,1)
	var _n_pal_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.arg(_args,3)
	var _n_y_b4 = _S.arg(_args,4)
	var _n_ang_b5 = _S.arg(_args,5)
	var _n_px_b6 = _S.arg(_args,6)
	var _n_py_b7 = _S.arg(_args,7)
	var _n_a_b8 = _S.coalesce(_S.arg(_args,8),func():return 1)
	var _n_H_b9 = _S.prop(_n_rows_b1,"length")
	var _n_W_b10 = _S.prop(_S.index_value(_n_rows_b1,0),"length")
	var _n_cs_b11 = cos(_n_ang_b5)
	var _n_sn_b12 = sin(_n_ang_b5)
	var _n_R_b13 = (_S.Bridge.hypot([maxf(_n_px_b6,(_n_W_b10 - _n_px_b6)), maxf(_n_py_b7,(_n_H_b9 - _n_py_b7))]) + 1)
	_S.invoke(_n_p_b0,"shade",[(_n_x_b3 - _n_R_b13), (_n_y_b4 - _n_R_b13), (_n_x_b3 + _n_R_b13), (_n_y_b4 + _n_R_b13), _S.function_value(_S.capture(_parent,{"x":_n_x_b3,"y":_n_y_b4,"cs":_n_cs_b11,"sn":_n_sn_b12,"px":_n_px_b6,"py":_n_py_b7,"W":_n_W_b10,"H":_n_H_b9,"pal":_n_pal_b2,"rows":_n_rows_b1,"a":_n_a_b8,"this":_this}),"_f14")])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_cs = _S.read(_parent,"cs")
	var _n_sn = _S.read(_parent,"sn")
	var _n_px = _S.read(_parent,"px")
	var _n_py = _S.read(_parent,"py")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_pal = _S.read(_parent,"pal")
	var _n_rows = _S.read(_parent,"rows")
	var _n_a = _S.read(_parent,"a")
	var _n_lx_b0 = _S.arg(_args,0)
	var _n_ly_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_lx_b0 - _n_x)
	var _n_dy_b4 = (_n_ly_b1 - _n_y)
	var _n_i_b5 = floori((((_n_dx_b3 * _n_cs) + (_n_dy_b4 * _n_sn)) + _n_px))
	var _n_j_b6 = floori(((((-_n_dx_b3) * _n_sn) + (_n_dy_b4 * _n_cs)) + _n_py))
	if _S.truth(((((_n_i_b5 < 0) if _S.truth((_n_i_b5 < 0)) else (_n_j_b6 < 0)) if _S.truth(((_n_i_b5 < 0) if _S.truth((_n_i_b5 < 0)) else (_n_j_b6 < 0))) else (_n_i_b5 >= _n_W)) if _S.truth((((_n_i_b5 < 0) if _S.truth((_n_i_b5 < 0)) else (_n_j_b6 < 0)) if _S.truth(((_n_i_b5 < 0) if _S.truth((_n_i_b5 < 0)) else (_n_j_b6 < 0))) else (_n_i_b5 >= _n_W))) else (_n_j_b6 >= _n_H))):
		return null
	var _n_c_b7 = _S.index_value(_n_pal,_S.index_value(_S.index_value(_n_rows,_n_j_b6),_n_i_b5))
	if _S.truth(not _S.truth(_n_c_b7)):
		return null
	_S.set_prop(_n_out_b2,"c",_n_c_b7,"=")
	_S.set_prop(_n_out_b2,"a",_n_a,"=")
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_build_b4 = _S.arg(_args,4)
	var _n_g_b5 = _S.invoke(_n_Array,"from",[{"length":_n_h_b3}, _S.function_value(_S.capture(_parent,{"w":_n_w_b2,"this":_this}),"_f16")])
	var _n_set_b6 = _S.function_value(_S.capture(_parent,{"x0":_n_x0_b0,"y0":_n_y0_b1,"w":_n_w_b2,"h":_n_h_b3,"g":_n_g_b5,"this":_this}),"_f17")
	_S.call_value(_n_build_b4,[_n_set_b6])
	var _n_solid_b7 = _S.function_value(_S.capture(_parent,{"w":_n_w_b2,"h":_n_h_b3,"g":_n_g_b5,"this":_this}),"_f18")
	if true:
		var _n_j_b8 = 0
		while _S.truth((_n_j_b8 < _n_h_b3)):
			if true:
				var _n_i_b9 = 0
				while _S.truth((_n_i_b9 < _n_w_b2)):
					if _S.truth((_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_solid_b7,[(_n_i_b9 - 1), _n_j_b8]),func():return _S.call_value(_n_solid_b7,[(_n_i_b9 + 1), _n_j_b8])),func():return _S.call_value(_n_solid_b7,[_n_i_b9, (_n_j_b8 - 1)])),func():return _S.call_value(_n_solid_b7,[_n_i_b9, (_n_j_b8 + 1)])) if _S.truth(_S.binary("===",_S.index_value(_S.index_value(_n_g_b5,_n_j_b8),_n_i_b9),".")) else _S.binary("===",_S.index_value(_S.index_value(_n_g_b5,_n_j_b8),_n_i_b9),"."))):
						_S.set_prop(_S.index_value(_n_g_b5,_n_j_b8),_n_i_b9,"o","=")
					_n_i_b9 += 1.0
			_n_j_b8 += 1.0
	return {"rows":_S.invoke(_n_g_b5,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f19")]),"x0":_n_x0_b0,"y0":_n_y0_b1}
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_w = _S.read(_parent,"w")
	return _S.invoke(_S.call_value(_n_Array,[_n_w]),"fill",["."])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_x0 = _S.read(_parent,"x0")
	var _n_y0 = _S.read(_parent,"y0")
	var _n_w = _S.read(_parent,"w")
	var _n_h = _S.read(_parent,"h")
	var _n_g = _S.read(_parent,"g")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_ch_b2 = _S.arg(_args,2)
	var _n_i_b3 = (_n_px_b0 - _n_x0)
	var _n_j_b4 = (_n_py_b1 - _n_y0)
	if _S.truth(((_n_j_b4 < _n_h) if _S.truth(((_n_i_b3 < _n_w) if _S.truth(((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))) else ((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0)))) else ((_n_i_b3 < _n_w) if _S.truth(((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))) else ((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))))):
		_S.set_prop(_S.index_value(_n_g,_n_j_b4),_n_i_b3,_n_ch_b2,"=")
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_h = _S.read(_parent,"h")
	var _n_g = _S.read(_parent,"g")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (_S.binary("!==",_S.index_value(_S.index_value(_n_g,_n_j_b1),_n_i_b0),"o") if _S.truth((_S.binary("!==",_S.index_value(_S.index_value(_n_g,_n_j_b1),_n_i_b0),".") if _S.truth(((_n_j_b1 < _n_h) if _S.truth(((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))) else ((_n_j_b1 < _n_h) if _S.truth(((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))))) else (_S.binary("!==",_S.index_value(_S.index_value(_n_g,_n_j_b1),_n_i_b0),".") if _S.truth(((_n_j_b1 < _n_h) if _S.truth(((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))) else ((_n_j_b1 < _n_h) if _S.truth(((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_w) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"join",[""])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_rng_b0 = _S.arg(_args,0)
	_S.set_prop(_this,"R",_n_rng_b0,"=")
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"t",0,"=")
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"vx": 0}, {"vy": 0}, {"drag": 2.5}, {"rise": 12}, {"grow": 2}, {"curl": 0}, {"a": 0.6}, {"b": 0.85}, {"warm": 0}, {"delay": 0}, {"age": 0}, {"seed": _S.binary("*", _S.invoke(_S.prop(_S.read(_e, "this"), "R"), "next", []), 100)}, _S.read(_e, "q")])])
	return null

static func _f22(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	_S.set_prop(_this,"t",_n_dt_b0,"+=")
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			var _n_q_b2 = _S.index_value(_S.named_value(_this,"list"),_n_i_b1)
			if _S.truth((_S.named_value(_n_q_b2,"delay") > 0)):
				_S.set_prop(_n_q_b2,"delay",_n_dt_b0,"-=")
				_n_i_b1 -= 1.0
				continue
			if _S.truth((_S.set_prop(_n_q_b2,"age",_n_dt_b0,"+=") >= _S.named_value(_n_q_b2,"life"))):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
				_n_i_b1 -= 1.0
				continue
			if _S.truth(_S.named_value(_n_q_b2,"curl")):
				var _n_c_b3 = cos((_S.named_value(_n_q_b2,"curl") * _n_dt_b0))
				var _n_s_b4 = sin((_S.named_value(_n_q_b2,"curl") * _n_dt_b0))
				var _n_vx_b5 = _S.named_value(_n_q_b2,"vx")
				_S.set_prop(_n_q_b2,"vx",((_n_vx_b5 * _n_c_b3) - (_S.named_value(_n_q_b2,"vy") * _n_s_b4)),"=")
				_S.set_prop(_n_q_b2,"vy",((_n_vx_b5 * _n_s_b4) + (_S.named_value(_n_q_b2,"vy") * _n_c_b3)),"=")
			_S.set_prop(_n_q_b2,"vy",(_S.named_value(_n_q_b2,"rise") * _n_dt_b0),"-=")
			_S.set_prop(_n_q_b2,"vx",((sin(((_S.named_value(_this,"t") * 1.3) + _S.named_value(_n_q_b2,"seed"))) * 8) * _n_dt_b0),"+=")
			_S.set_prop(_n_q_b2,"vx",((_S.named_value(_n_q_b2,"vx") * _S.named_value(_n_q_b2,"drag")) * _n_dt_b0),"-=")
			_S.set_prop(_n_q_b2,"vy",((_S.named_value(_n_q_b2,"vy") * _S.named_value(_n_q_b2,"drag")) * _n_dt_b0),"-=")
			_S.set_prop(_n_q_b2,"x",(_S.named_value(_n_q_b2,"vx") * _n_dt_b0),"+=")
			_S.set_prop(_n_q_b2,"y",(_S.named_value(_n_q_b2,"vy") * _n_dt_b0),"+=")
			_n_i_b1 -= 1.0
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_out_b0 = []
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_q_b1 = _iter_0
		if _S.truth((_S.named_value(_n_q_b1,"delay") > 0)):
			continue
		var _n_k_b2 = (float(_S.named_value(_n_q_b1,"age"))/_S.named_value(_n_q_b1,"life"))
		_S.invoke(_n_out_b0,"push",[{"x":_S.named_value(_n_q_b1,"x"),"y":_S.named_value(_n_q_b1,"y"),"r":(_S.named_value(_n_q_b1,"r0") + ((_S.named_value(_n_q_b1,"r1") - _S.named_value(_n_q_b1,"r0")) * (1 - exp(((-_S.named_value(_n_q_b1,"grow")) * _S.named_value(_n_q_b1,"age")))))),"a":((_S.named_value(_n_q_b1,"a") * minf(1,(_S.named_value(_n_q_b1,"age") * 30))) * pow((1 - _n_k_b2),1.3)),"b":(_S.named_value(_n_q_b1,"b") * (1 - (_n_k_b2 * 0.5))),"w":(_S.named_value(_n_q_b1,"warm") * exp(((-_S.named_value(_n_q_b1,"age")) * 5)))}])
	return _n_out_b0
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_l_b0 = _S.arg(_args,0)
	var _n_u_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float(_n_u_b1)/_S.named_value(_n_l_b0,"len"))
	return ((_S.named_value(_n_l_b0,"wid") * pow(maxf(0,(1 - _n_k_b2)),0.8)) * minf(1,(0.45 + (_n_k_b2 * 3))))
	return null
