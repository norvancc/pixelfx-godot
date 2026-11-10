@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "bead", _S.function_value(_e, "_f0"))
	_S.define(_e, "ring", _S.function_value(_e, "_f2"))
	_S.define(_e, "lace", _S.function_value(_e, "_f3"))
	_S.define(_e, "billow", _S.function_value(_e, "_f5"))
	_S.define(_e, "pebble", _S.function_value(_e, "_f6"))
	_S.define(_e, "WATER", ["#0a1630", "#123063", "#1b5596", "#2a7fc4", "#45a9e3", "#86d3f5", "#cdf1ff", "#ffffff"])
	_exports["WATER"] = _S.read(_e, "WATER")
	_S.define(_e, "ROCK", ["#141219", "#221f2b", "#34303f", "#4a4558", "#655f74", "#8a8498"])
	_exports["ROCK"] = _S.read(_e, "ROCK")
	_exports["bead"] = _S.read(_e, "bead")
	_S.define(_e, "Drops", _S.class_value("Drops", _S.function_value(_e, "_f8"), {"add": _S.function_value(_e, "_f9"), "update": _S.function_value(_e, "_f11"), "draw": _S.function_value(_e, "_f12")}, {"count": _S.function_value(_e, "_f10")}, {}, null))
	_exports["Drops"] = _S.read(_e, "Drops")
	_exports["ring"] = _S.read(_e, "ring")
	_S.define(_e, "Ripples", _S.class_value("Ripples", _S.function_value(_e, "_f13"), {"add": _S.function_value(_e, "_f14"), "update": _S.function_value(_e, "_f16"), "draw": _S.function_value(_e, "_f17")}, {"count": _S.function_value(_e, "_f15")}, {}, null))
	_exports["Ripples"] = _S.read(_e, "Ripples")
	_exports["lace"] = _S.read(_e, "lace")
	_S.define(_e, "Mist", _S.class_value("Mist", _S.function_value(_e, "_f18"), {"add": _S.function_value(_e, "_f19"), "update": _S.function_value(_e, "_f21"), "draw": _S.function_value(_e, "_f22")}, {"count": _S.function_value(_e, "_f20")}, {}, null))
	_exports["Mist"] = _S.read(_e, "Mist")
	_exports["billow"] = _S.read(_e, "billow")
	_exports["pebble"] = _S.read(_e, "pebble")
	_S.define(_e, "rock", _S.function_value(_e, "_f25"))
	_exports["rock"] = _S.read(_e, "rock")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_s_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _n_a_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_sp_b8 = _S.logical("||",_S.Bridge.hypot([_n_vx_b3, _n_vy_b4]),func():return 1)
	var _n_ux_b9 = (float(_n_vx_b3)/_n_sp_b8)
	var _n_uy_b10 = (float(_n_vy_b4)/_n_sp_b8)
	var _n_tail_b11 = minf(5,(_n_sp_b8 * 0.011))
	if _S.truth((_n_tail_b11 >= 1)):
		_S.invoke(_n_p_b0,"line",[(_n_x_b1 - (_n_ux_b9 * (_n_tail_b11 + 1))), (_n_y_b2 - (_n_uy_b10 * (_n_tail_b11 + 1))), (_n_x_b1 - (_n_ux_b9 * 1.2)), (_n_y_b2 - (_n_uy_b10 * 1.2)), _S.function_value(_S.capture(_parent,{"C":_n_C_b6,"s":_n_s_b5,"this":_this}),"_f1"), _n_a_b7])
	if _S.truth((_n_s_b5 >= 3)):
		_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, 1.75, _S.index_value(_n_C_b6,4), _n_a_b7])
		_S.invoke(_n_p_b0,"circle",[(_n_x_b1 - 0.25), (_n_y_b2 - 0.25), 1.15, _S.index_value(_n_C_b6,6), _n_a_b7])
		_S.invoke(_n_p_b0,"dot",[(_n_x_b1 - 0.7), (_n_y_b2 - 0.7), _n_WHITE, _n_a_b7])
	else:
		if _S.truth((_n_s_b5 >= 2)):
			var _n_X_b12 = floori(_n_x_b1)
			var _n_Y_b13 = floori(_n_y_b2)
			_S.invoke(_n_p_b0,"dot",[_n_X_b12, _n_Y_b13, _n_WHITE, _n_a_b7])
			_S.invoke(_n_p_b0,"dot",[(_n_X_b12 + 1), _n_Y_b13, _S.index_value(_n_C_b6,6), _n_a_b7])
			_S.invoke(_n_p_b0,"dot",[_n_X_b12, (_n_Y_b13 + 1), _S.index_value(_n_C_b6,5), _n_a_b7])
			_S.invoke(_n_p_b0,"dot",[(_n_X_b12 + 1), (_n_Y_b13 + 1), _S.index_value(_n_C_b6,4), _n_a_b7])
		else:
			_S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, (_S.index_value(_n_C_b6,6) if _S.truth((_n_sp_b8 > 160)) else _S.index_value(_n_C_b6,5)), _n_a_b7])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_s = _S.read(_parent,"s")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,3) if _S.truth((_n_u_b0 < 0.45)) else (_S.index_value(_n_C,5) if _S.truth((_n_s > 1)) else _S.index_value(_n_C,4)))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_sy_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _object_0 = _S.coalesce(_S.arg(_args,7),func():return {})
	var _n_n_b7 = _S.coalesce(_S.named_value(_object_0,"n"),func():return 2)
	var _n_gap_b8 = _S.coalesce(_S.named_value(_object_0,"gap"),func():return 3)
	var _n_half_b9 = _S.coalesce(_S.named_value(_object_0,"half"),func():return 0)
	var _n_hot_b10 = _S.coalesce(_S.named_value(_object_0,"hot"),func():return false)
	var _n_glint_b11 = _S.coalesce(_S.named_value(_object_0,"glint"),func():return 0)
	var _n_seed_b12 = _S.coalesce(_S.named_value(_object_0,"seed"),func():return 0)
	var _n_wob_b13 = _S.coalesce(_S.named_value(_object_0,"wob"),func():return 0)
	if _S.truth(((_n_k_b5 <= 0.02) if _S.truth((_n_k_b5 <= 0.02)) else (_n_r_b3 < 0.5))):
		return null
	if true:
		var _n_j_b14 = 0
		while _S.truth((_n_j_b14 < _n_n_b7)):
			var _n_rr_b15 = (_n_r_b3 - (_n_j_b14 * _n_gap_b8))
			if _S.truth((_n_rr_b15 < 0.6)):
				break
			var _n_kj_b16 = (_n_k_b5 * (1 - (_n_j_b14 * 0.42)))
			var _n_m_b17 = maxf(6,ceili(((_n_rr_b15 * _n_TAU) * 1.3)))
			var _n_need_b18 = (1.15 - (2.3 * minf(1,(_n_kj_b16 * 1.25))))
			if true:
				var _n_i_b19 = 0
				while _S.truth((_n_i_b19 < _n_m_b17)):
					var _n_a_b20 = ((float(_n_i_b19)/_n_m_b17) * _n_TAU)
					var _n_s_b21 = sin(_n_a_b20)
					var _n_near_b22 = (_n_s_b21 > 0)
					if _S.truth(((not _S.truth(_n_near_b22) if _S.truth((_n_half_b9 > 0)) else (_n_half_b9 > 0)) if _S.truth((not _S.truth(_n_near_b22) if _S.truth((_n_half_b9 > 0)) else (_n_half_b9 > 0))) else (_n_near_b22 if _S.truth((_n_half_b9 < 0)) else (_n_half_b9 < 0)))):
						_n_i_b19 += 1.0
						continue
					if _S.truth((((_S.MathFX.noise((((_n_a_b20 * 4.7) + (_n_seed_b12 * 13.1)) + (_n_j_b14 * 5.3)),_n_seed_b12) * 0.65) + (_S.MathFX.noise(((_n_a_b20 * 11.3) + (_n_seed_b12 * 7.7)),(_n_seed_b12 + 3)) * 0.35)) < _n_need_b18)):
						_n_i_b19 += 1.0
						continue
					var _n_lit_b23 = ((_n_kj_b16 * (1 if _S.truth(_n_near_b22) else 0.7)) * (0.88 - (0.12 * cos(_n_a_b20))))
					var _n_c_b24 = (_n_WHITE if _S.truth((_S.binary("===",_n_j_b14,0) if _S.truth((_n_near_b22 if _S.truth(_n_hot_b10) else _n_hot_b10)) else (_n_near_b22 if _S.truth(_n_hot_b10) else _n_hot_b10))) else _S.index_value(_n_C_b6,(6 if _S.truth((_n_lit_b23 > 0.7)) else (5 if _S.truth((_n_lit_b23 > 0.38)) else 4))))
					var _n_ra_b25 = ((_n_rr_b15 + (_n_wob_b13 * _S.MathFX.noise((((_n_a_b20 * 2.6) + (_n_seed_b12 * 1.9)) + _n_j_b14),(_n_seed_b12 + 11)))) if _S.truth(_n_wob_b13) else _n_rr_b15)
					var _n_x_b26 = (_n_cx_b1 + (cos(_n_a_b20) * _n_ra_b25))
					var _n_y_b27 = (_n_cy_b2 + ((_n_s_b21 * _n_ra_b25) * _n_sy_b4))
					_S.invoke(_n_p_b0,"dot",[_n_x_b26, _n_y_b27, _n_c_b24])
					if _S.truth(_S.binary("===",_n_j_b14,0)):
						_S.invoke(_n_p_b0,"light",[_n_x_b26, _n_y_b27, _S.index_value(_n_C_b6,4), (0.3 * _n_lit_b23)])
					_n_i_b19 += 1.0
			_n_j_b14 += 1.0
	if _S.truth(((_n_half_b9 >= 0) if _S.truth((_n_glint_b11 > 0)) else (_n_glint_b11 > 0))):
		var _n_x_b28 = (_n_cx_b1 + (cos(2.05) * _n_r_b3))
		var _n_y_b29 = (_n_cy_b2 + ((sin(2.05) * _n_r_b3) * _n_sy_b4))
		_S.invoke(_n_p_b0,"px",[_n_x_b28, _n_y_b29, _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_x_b28, _n_y_b29, (3 + (_n_glint_b11 * 2)), _S.index_value(_n_C_b6,5), (0.35 * _n_glint_b11)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_C_b6 = _S.arg(_args,6)
	var _n_t_b7 = _S.arg(_args,7)
	var _n_seed_b8 = _S.coalesce(_S.arg(_args,8),func():return 0)
	if _S.truth(((_n_k_b5 <= 0.01) if _S.truth((_n_k_b5 <= 0.01)) else (_n_rx_b3 < 1))):
		return null
	var _n_sy_b9 = (float(_n_ry_b4)/_n_rx_b3)
	_S.invoke(_n_p_b0,"shade",[(_n_cx_b1 - _n_rx_b3), (_n_cy_b2 - _n_ry_b4), (_n_cx_b1 + _n_rx_b3), (_n_cy_b2 + _n_ry_b4), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b1,"rx":_n_rx_b3,"cy":_n_cy_b2,"ry":_n_ry_b4,"sy":_n_sy_b9,"seed":_n_seed_b8,"t":_n_t_b7,"k":_n_k_b5,"C":_n_C_b6,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_rx = _S.read(_parent,"rx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ry = _S.read(_parent,"ry")
	var _n_sy = _S.read(_parent,"sy")
	var _n_seed = _S.read(_parent,"seed")
	var _n_t = _S.read(_parent,"t")
	var _n_k = _S.read(_parent,"k")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (float((_n_x_b0 - _n_cx))/_n_rx)
	var _n_dy_b4 = (float((_n_y_b1 - _n_cy))/_n_ry)
	var _n_d_b5 = ((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))
	if _S.truth((_n_d_b5 > 1)):
		return null
	var _n_u_b6 = ((_n_x_b0 - _n_cx) * 0.36)
	var _n_v_b7 = ((float((_n_y_b1 - _n_cy))/_n_sy) * 0.36)
	var _n_n_b8 = _S.NoiseKernels.noise2((_n_u_b6 + (_n_seed * 7.13)),(_n_v_b7 - (_n_t * 0.35)),_n_seed)
	var _n_m_b9 = _S.NoiseKernels.noise2(((_n_u_b6 * 2.2) - (_n_t * 0.3)),((_n_v_b7 * 2.2) + (_n_seed * 3.1)),(_n_seed + 9))
	var _n_net_b10 = ((1 - (absf(_n_n_b8) * 4.6)) + (_n_m_b9 * 0.3))
	var _n_need_b11 = (1.02 - (_n_k * (1.15 - (_n_d_b5 * 0.9))))
	if _S.truth((_n_net_b10 < _n_need_b11)):
		return null
	_S.set_prop(_n_o_b2,"c",(_n_WHITE if _S.truth((_n_net_b10 > (_n_need_b11 + 0.4))) else _S.index_value(_n_C,6)),"=")
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	if _S.truth((_n_r_b3 < 0.9)):
		return _S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, _S.index_value(_n_C_b4,6), _n_a_b5])
	_S.invoke(_n_p_b0,"circle",[(_n_x_b1 + (_n_r_b3 * 0.12)), (_n_y_b2 + (_n_r_b3 * 0.2)), _n_r_b3, _S.index_value(_n_C_b4,4), _n_a_b5])
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, (_n_r_b3 * 0.84), _S.index_value(_n_C_b4,6), _n_a_b5])
	if _S.truth((_n_r_b3 > 1.6)):
		_S.invoke(_n_p_b0,"circle",[(_n_x_b1 - (_n_r_b3 * 0.3)), (_n_y_b2 - (_n_r_b3 * 0.32)), (_n_r_b3 * 0.46), _n_WHITE, _n_a_b5])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_ST_b4 = _S.arg(_args,4)
	_S.invoke(_n_p_b0,"shade",[((_n_x_b1 - _n_r_b3) - 1), ((_n_y_b2 - _n_r_b3) - 1), ((_n_x_b1 + _n_r_b3) + 1), ((_n_y_b2 + _n_r_b3) + 1), _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"y":_n_y_b2,"r":_n_r_b3,"ST":_n_ST_b4,"this":_this}),"_f7")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_r = _S.read(_parent,"r")
	var _n_ST = _S.read(_parent,"ST")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_px_b0 - _n_x)
	var _n_dy_b4 = (_n_py_b1 - _n_y)
	var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.1), _n_dy_b4])
	if _S.truth((_n_d_b5 > (_n_r + 0.8))):
		return null
	var _n_lit_b6 = (float((_n_dx_b3 + _n_dy_b4))/maxf(0.5,_n_r))
	_S.set_prop(_n_o_b2,"c",(_S.index_value(_n_ST,0) if _S.truth((_n_d_b5 > _n_r)) else (_S.index_value(_n_ST,5) if _S.truth((_n_lit_b6 < (-0.7))) else (_S.index_value(_n_ST,4) if _S.truth((_n_lit_b6 < 0.2)) else (_S.index_value(_n_ST,3) if _S.truth((_n_lit_b6 < 0.8)) else _S.index_value(_n_ST,2))))),"=")
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _object_0 = _S.coalesce(_S.arg(_args,0),func():return {})
	var _n_sy_b0 = _S.coalesce(_S.named_value(_object_0,"sy"),func():return 0.22)
	var _n_g_b1 = _S.coalesce(_S.named_value(_object_0,"g"),func():return 820)
	var _n_drag_b2 = _S.coalesce(_S.named_value(_object_0,"drag"),func():return 0.35)
	var _n_onLand_b3 = _S.coalesce(_S.named_value(_object_0,"onLand"),func():return null)
	_S.set_prop(_this,"sy",_n_sy_b0,"=")
	_S.set_prop(_this,"g",_n_g_b1,"=")
	_S.set_prop(_this,"drag",_n_drag_b2,"=")
	_S.set_prop(_this,"onLand",_n_onLand_b3,"=")
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "life", _S.logical("??", _S.prop(_S.read(_e, "d"), "life"), func(): return 4))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": 0}, {"z": 0}, {"h": 0}, {"vx": 0}, {"vz": 0}, {"vh": 0}, {"s": 1}, {"delay": 0}, _S.read(_e, "d"), {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f10(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.prop(_S.read(_e, "this"), "drag"), _S.read(_e, "dt")))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v9, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v9, "i"), 0)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "d", _S.prop(_S.prop(_S.read(_v10, "this"), "list"), _S.read(_v10, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v10, "d"), "delay"), 0)):
			var _v11 = _S.scope(_v10)
			_S.set_prop(_S.read(_v11, "d"), "delay", _S.read(_v11, "dt"), "-=", false)
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v10, "d"), "life", _S.read(_v10, "dt"), "-=", false), 0)):
			var _v12 = _S.scope(_v10)
			_S.invoke(_S.prop(_S.read(_v12, "this"), "list"), "splice", [_S.read(_v12, "i"), 1])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v10, "d"), "vh", _S.binary("*", _S.prop(_S.read(_v10, "this"), "g"), _S.read(_v10, "dt")), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "vx", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vx"), _S.read(_v10, "k")), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "vz", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vz"), _S.read(_v10, "k")), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "vh", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vh"), _S.read(_v10, "k")), 0.5), "-=", false)
		_S.set_prop(_S.read(_v10, "d"), "x", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vx"), _S.read(_v10, "dt")), "+=", false)
		_S.set_prop(_S.read(_v10, "d"), "z", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vz"), _S.read(_v10, "dt")), "+=", false)
		_S.set_prop(_S.read(_v10, "d"), "h", _S.binary("*", _S.prop(_S.read(_v10, "d"), "vh"), _S.read(_v10, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v10, "d"), "h"), 0), func(): return _S.binary("<", _S.prop(_S.read(_v10, "d"), "vh"), 0))):
			var _v13 = _S.scope(_v10)
			_S.set_prop(_S.read(_v13, "d"), "h", 0, "=", false)
			_S.invoke(_S.prop(_S.read(_v13, "this"), "list"), "splice", [_S.read(_v13, "i"), 1])
			_S.optional_call(_S.prop(_S.read(_v13, "this"), "onLand"), [_S.read(_v13, "d")])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "-=", true)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_bead = _S.read(_parent,"bead")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_layer_b2 = _S.arg(_args,2)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_d_b3 = _iter_0
		if _S.truth((((_S.named_value(_n_d_b3,"delay") > 0) if _S.truth((_S.named_value(_n_d_b3,"delay") > 0)) else ((_S.named_value(_n_d_b3,"z") >= 0) if _S.truth(_S.binary("===",_n_layer_b2,"back")) else _S.binary("===",_n_layer_b2,"back"))) if _S.truth(((_S.named_value(_n_d_b3,"delay") > 0) if _S.truth((_S.named_value(_n_d_b3,"delay") > 0)) else ((_S.named_value(_n_d_b3,"z") >= 0) if _S.truth(_S.binary("===",_n_layer_b2,"back")) else _S.binary("===",_n_layer_b2,"back")))) else ((_S.named_value(_n_d_b3,"z") < 0) if _S.truth(_S.binary("===",_n_layer_b2,"front")) else _S.binary("===",_n_layer_b2,"front")))):
			continue
		var _n_x_b4 = _S.named_value(_n_d_b3,"x")
		var _n_y_b5 = ((_S.named_value(_n_d_b3,"z") * _S.named_value(_this,"sy")) - _S.named_value(_n_d_b3,"h"))
		_S.call_value(_n_bead,[_n_p_b0, _n_x_b4, _n_y_b5, _S.named_value(_n_d_b3,"vx"), ((_S.named_value(_n_d_b3,"vz") * _S.named_value(_this,"sy")) - _S.named_value(_n_d_b3,"vh")), _S.named_value(_n_d_b3,"s"), _n_C_b1, minf(1,(float(_S.named_value(_n_d_b3,"life"))/0.2))])
		_S.invoke(_n_p_b0,"glow",[_n_x_b4, _n_y_b5, (2.5 + _S.named_value(_n_d_b3,"s")), _S.index_value(_n_C_b1,5), (0.1 + (0.05 * _S.named_value(_n_d_b3,"s")))])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _object_0 = _S.coalesce(_S.arg(_args,0),func():return {})
	var _n_sy_b0 = _S.coalesce(_S.named_value(_object_0,"sy"),func():return 0.22)
	_S.set_prop(_this,"sy",_n_sy_b0,"=")
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_z_b1 = _S.arg(_args,1)
	var _n_r0_b2 = _S.arg(_args,2)
	var _n_r1_b3 = _S.arg(_args,3)
	var _n_life_b4 = _S.arg(_args,4)
	var _n_o_b5 = _S.coalesce(_S.arg(_args,5),func():return {})
	_S.invoke(_S.named_value(_this,"list"),"push",[{"x":_n_x_b0,"z":_n_z_b1,"r0":_n_r0_b2,"r1":_n_r1_b3,"life":_n_life_b4,"age":(-(_S.named_value(_n_o_b5,"delay") if _S.named_value(_n_o_b5,"delay")!=null else 0)),"k":(_S.named_value(_n_o_b5,"k") if _S.named_value(_n_o_b5,"k")!=null else 1),"n":(_S.named_value(_n_o_b5,"n") if _S.named_value(_n_o_b5,"n")!=null else 2),"gap":(_S.named_value(_n_o_b5,"gap") if _S.named_value(_n_o_b5,"gap")!=null else 3),"hot":(_S.named_value(_n_o_b5,"hot") if _S.named_value(_n_o_b5,"hot")!=null else 0.1),"glint":(_S.named_value(_n_o_b5,"glint") if _S.named_value(_n_o_b5,"glint")!=null else 0),"seed":_S.set_prop(_this,"seq",((_S.named_value(_this,"seq") if _S.named_value(_this,"seq")!=null else 0) + 1),"=")}])
	return null

static func _f15(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			if _S.truth((_S.set_prop(_S.index_value(_S.named_value(_this,"list"),_n_i_b1),"age",_n_dt_b0,"+=") >= _S.named_value(_S.index_value(_S.named_value(_this,"list"),_n_i_b1),"life"))):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
			_n_i_b1 -= 1.0
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_ring = _S.read(_parent,"ring")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_half_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_q_b3 = _iter_0
		if _S.truth((_S.named_value(_n_q_b3,"age") < 0)):
			continue
		var _n_u_b4 = (float(_S.named_value(_n_q_b3,"age"))/_S.named_value(_n_q_b3,"life"))
		var _n_r_b5 = (_S.named_value(_n_q_b3,"r0") + ((_S.named_value(_n_q_b3,"r1") - _S.named_value(_n_q_b3,"r0")) * (1 - pow((1 - _n_u_b4),2.6))))
		var _n_k_b6 = (_S.named_value(_n_q_b3,"k") * pow((1 - _n_u_b4),1.7))
		_S.call_value(_n_ring,[_n_p_b0, _S.named_value(_n_q_b3,"x"), (_S.named_value(_n_q_b3,"z") * _S.named_value(_this,"sy")), _n_r_b5, _S.named_value(_this,"sy"), _n_k_b6, _n_C_b1, {"n":_S.named_value(_n_q_b3,"n"),"gap":(_S.named_value(_n_q_b3,"gap") * (0.55 + (0.6 * _n_u_b4))),"half":_n_half_b2,"hot":(_S.named_value(_n_q_b3,"age") < _S.named_value(_n_q_b3,"hot")),"glint":(_S.named_value(_n_q_b3,"glint") * _n_k_b6),"seed":_S.named_value(_n_q_b3,"seed")}])
	return null

static func _f18(_parent,_args:Array,_this=null):
	_S.set_prop(_this,"list",[],"=")
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_r0_b4 = _S.arg(_args,4)
	var _n_r1_b5 = _S.arg(_args,5)
	var _n_life_b6 = _S.arg(_args,6)
	var _n_c_b7 = _S.arg(_args,7)
	var _n_a_b8 = _S.coalesce(_S.arg(_args,8),func():return 0.25)
	var _n_delay_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"x":_n_x_b0,"y":_n_y_b1,"vx":_n_vx_b2,"vy":_n_vy_b3,"r0":_n_r0_b4,"r1":_n_r1_b5,"life":_n_life_b6,"max":_n_life_b6,"c":_S.call_value(_n_hex,[_n_c_b7]),"a":_n_a_b8,"delay":_n_delay_b9}])
	return null

static func _f20(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"list"),"length")
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_dt_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			var _n_m_b2 = _S.index_value(_S.named_value(_this,"list"),_n_i_b1)
			if _S.truth((_S.named_value(_n_m_b2,"delay") > 0)):
				_S.set_prop(_n_m_b2,"delay",_n_dt_b0,"-=")
				_n_i_b1 -= 1.0
				continue
			if _S.truth((_S.set_prop(_n_m_b2,"life",_n_dt_b0,"-=") <= 0)):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
				_n_i_b1 -= 1.0
				continue
			_S.set_prop(_n_m_b2,"vx",((_S.named_value(_n_m_b2,"vx") * 2.4) * _n_dt_b0),"-=")
			_S.set_prop(_n_m_b2,"vy",(((_S.named_value(_n_m_b2,"vy") * 2.4) * _n_dt_b0) + (7 * _n_dt_b0)),"-=")
			_S.set_prop(_n_m_b2,"x",(_S.named_value(_n_m_b2,"vx") * _n_dt_b0),"+=")
			_S.set_prop(_n_m_b2,"y",(_S.named_value(_n_m_b2,"vy") * _n_dt_b0),"+=")
			_n_i_b1 -= 1.0
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_haze_b1 = _S.arg(_args,1)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_m_b2 = _iter_0
		if _S.truth((_S.named_value(_n_m_b2,"delay") > 0)):
			continue
		var _n_age_b3 = (1 - (float(_S.named_value(_n_m_b2,"life"))/_S.named_value(_n_m_b2,"max")))
		var _n_r_b4 = (_S.named_value(_n_m_b2,"r0") + ((_S.named_value(_n_m_b2,"r1") - _S.named_value(_n_m_b2,"r0")) * (1 - pow((1 - _n_age_b3),2.2))))
		var _n_a_b5 = ((_S.named_value(_n_m_b2,"a") * minf(1,(float(_n_age_b3)/0.12))) * pow((1 - _n_age_b3),1.4))
		if _S.truth((_n_a_b5 < 0.01)):
			continue
		_S.invoke(_n_p_b0,"disc",[_S.named_value(_n_m_b2,"x"), _S.named_value(_n_m_b2,"y"), _n_r_b4, _S.named_value(_n_m_b2,"c"), _S.function_value(_S.capture(_parent,{"a":_n_a_b5,"this":_this}),"_f23")])
		_S.invoke(_n_p_b0,"disc",[(_S.named_value(_n_m_b2,"x") - (_n_r_b4 * 0.2)), (_S.named_value(_n_m_b2,"y") - (_n_r_b4 * 0.32)), (_n_r_b4 * 0.55), _n_WHITE, _S.function_value(_S.capture(_parent,{"a":_n_a_b5,"this":_this}),"_f24")])
		if _S.truth(_n_haze_b1):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_m_b2,"x"), _S.named_value(_n_m_b2,"y"), (_n_r_b4 * 1.5), _n_haze_b1, ((float((0.16 * _n_a_b5))/_S.named_value(_n_m_b2,"a")) * minf(1,(_S.named_value(_n_m_b2,"a") * 3)))])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return ((_n_a * (1 - (_n_d_b0 * _n_d_b0))) * (1 - (_n_d_b0 * 0.5)))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_d_b0 = _S.arg(_args,0)
	return (((_n_a * 0.25) * (1 - _n_d_b0)) * (1 - _n_d_b0))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_ROCK = _S.read(_parent,"ROCK")
	var _n_hex = _S.read(_parent,"hex")
	return _S.invoke(_n_ROCK,"map",[_n_hex])
	return null
