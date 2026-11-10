@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f4":"melee_smear"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "through", _S.function_value(_e, "_f0"))
	_S.define(_e, "onSwing", _S.function_value(_e, "_f1"))
	_S.define(_e, "travel", _S.function_value(_e, "_f2"))
	_S.define(_e, "plane", _S.function_value(_e, "_f3"))
	_S.define(_e, "smear", _S.function_value(_e, "_f4"))
	_S.define(_e, "trace", _S.function_value(_e, "_f6"))
	_S.define(_e, "glowAlong", _S.function_value(_e, "_f7"))
	_S.define(_e, "slash", _S.function_value(_e, "_f8"))
	_S.define(_e, "shavings", _S.function_value(_e, "_f12"))
	_S.define(_e, "stone", _S.function_value(_e, "_f13"))
	_S.define(_e, "rock", _S.function_value(_e, "_f14"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f16"))
	_S.define(_e, "star", _S.function_value(_e, "_f17"))
	_S.define(_e, "sliver", _S.function_value(_e, "_f18"))
	_S.define(_e, "along", _S.function_value(_e, "_f19"))
	_S.define(_e, "swing", _S.function_value(_e, "_f20"))
	_exports["swing"] = _S.read(_e, "swing")
	_exports["through"] = _S.read(_e, "through")
	_exports["onSwing"] = _S.read(_e, "onSwing")
	_exports["travel"] = _S.read(_e, "travel")
	_exports["plane"] = _S.read(_e, "plane")
	_exports["smear"] = _S.read(_e, "smear")
	_exports["trace"] = _S.read(_e, "trace")
	_exports["glowAlong"] = _S.read(_e, "glowAlong")
	_exports["slash"] = _S.read(_e, "slash")
	_S.define(_e, "slashEnd", _S.function_value(_e, "_f21"))
	_exports["slashEnd"] = _S.read(_e, "slashEnd")
	_exports["shavings"] = _S.read(_e, "shavings")
	_exports["stone"] = _S.read(_e, "stone")
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_exports["rock"] = _S.read(_e, "rock")
	_exports["cracks"] = _S.read(_e, "cracks")
	_exports["star"] = _S.read(_e, "star")
	_exports["sliver"] = _S.read(_e, "sliver")
	_exports["along"] = _S.read(_e, "along")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "th", _S.arg(_args, 2))
	_S.define(_e, "dir", _S.arg(_args, 3))
	_S.define(_e, "R", _S.arg(_args, 4))
	_S.define(_e, "span", _S.arg(_args, 5))
	_S.define(_e, "at", _S.coalesce(_S.arg(_args, 6), func(): return 0.55))
	_S.define(_e, "extra", _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([])))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "th"), _S.binary("/", _S.binary("*", _S.read(_e, "dir"), _S.prop(_S.read(_e, "Math"), "PI")), 2)))
	return _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "R")))}, {"cy": _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "R")))}, {"R": _S.read(_e, "R")}, {"sy": 1}, {"rot": 0}, {"a0": _S.binary("-", _S.read(_e, "a"), _S.binary("*", _S.binary("*", _S.read(_e, "dir"), _S.read(_e, "span")), _S.read(_e, "at")))}, {"dir": _S.read(_e, "dir")}, {"span": _S.read(_e, "span")}, _S.read(_e, "extra")])])

static func _f1(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_u_b2 = _S.arg(_args,2)
	var _n_a_b3 = (_S.named_value(_n_s_b0,"a0") + (_S.named_value(_n_s_b0,"dir") * _n_u_b2))
	var _n_lx_b4 = (cos(_n_a_b3) * _n_r_b1)
	var _n_ly_b5 = (((sin(_n_a_b3) * _n_r_b1) * _S.named_value(_n_s_b0,"sy")) - (_S.named_value(_n_s_b0,"k") * (_S.named_value(_n_s_b0,"R") - _n_r_b1)))
	var _n_c_b6 = cos(_S.named_value(_n_s_b0,"rot"))
	var _n_n_b7 = sin(_S.named_value(_n_s_b0,"rot"))
	return [((_S.named_value(_n_s_b0,"cx") + (_n_lx_b4 * _n_c_b6)) - (_n_ly_b5 * _n_n_b7)), ((_S.named_value(_n_s_b0,"cy") + (_n_lx_b4 * _n_n_b7)) + (_n_ly_b5 * _n_c_b6))]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_u_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.call_value(_n_onSwing,[_n_s_b0, _S.named_value(_n_s_b0,"R"), _n_u_b1])
	var _n_x0_b2 = _S.prop(_tuple_0,0)
	var _n_y0_b3 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.call_value(_n_onSwing,[_n_s_b0, _S.named_value(_n_s_b0,"R"), (_n_u_b1 + 0.01)])
	var _n_x1_b4 = _S.prop(_tuple_1,0)
	var _n_y1_b5 = _S.prop(_tuple_1,1)
	var _n_l_b6 = _S.logical("||",_S.Bridge.hypot([(_n_x1_b4 - _n_x0_b2), (_n_y1_b5 - _n_y0_b3)]),func():return 1)
	return {"x":_n_x0_b2,"y":_n_y0_b3,"dx":(float((_n_x1_b4 - _n_x0_b2))/_n_l_b6),"dy":(float((_n_y1_b5 - _n_y0_b3))/_n_l_b6),"a":(_S.named_value(_n_s_b0,"a0") + (_S.named_value(_n_s_b0,"dir") * _n_u_b1))}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_s_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_c_b3 = cos(_S.named_value(_n_s_b0,"rot"))
	var _n_n_b4 = sin(_S.named_value(_n_s_b0,"rot"))
	var _n_dx_b5 = (_n_x_b1 - _S.named_value(_n_s_b0,"cx"))
	var _n_dy_b6 = (_n_y_b2 - _S.named_value(_n_s_b0,"cy"))
	var _n_lx_b7 = ((_n_dx_b5 * _n_c_b3) + (_n_dy_b6 * _n_n_b4))
	var _n_ly_b8 = (((-_n_dx_b5) * _n_n_b4) + (_n_dy_b6 * _n_c_b3))
	if _S.truth(not _S.truth(_S.named_value(_n_s_b0,"k"))):
		return [_S.Bridge.hypot([_n_lx_b7, (float(_n_ly_b8)/_S.named_value(_n_s_b0,"sy"))]), atan2((float(_n_ly_b8)/_S.named_value(_n_s_b0,"sy")),_n_lx_b7)]
	var _n_m_b9 = (_n_ly_b8 + (_S.named_value(_n_s_b0,"k") * _S.named_value(_n_s_b0,"R")))
	var _n_A_b10 = ((_S.named_value(_n_s_b0,"sy") * _S.named_value(_n_s_b0,"sy")) - (_S.named_value(_n_s_b0,"k") * _S.named_value(_n_s_b0,"k")))
	var _n_B_b11 = ((2 * _n_m_b9) * _S.named_value(_n_s_b0,"k"))
	var _n_Cc_b12 = ((((_n_lx_b7 * _n_lx_b7) * _S.named_value(_n_s_b0,"sy")) * _S.named_value(_n_s_b0,"sy")) + (_n_m_b9 * _n_m_b9))
	var _n_r_b13 = (float(((-_n_B_b11) + sqrt(((_n_B_b11 * _n_B_b11) + ((4 * _n_A_b10) * _n_Cc_b12)))))/(2 * _n_A_b10))
	return [_n_r_b13, atan2((float((_n_m_b9 - (_S.named_value(_n_s_b0,"k") * _n_r_b13)))/_S.named_value(_n_s_b0,"sy")),_n_lx_b7)]
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_u0_b2 = _S.arg(_args,2)
	var _n_u1_b3 = _S.arg(_args,3)
	var _n_wMax_b4 = _S.arg(_args,4)
	var _n_fn_b5 = _S.arg(_args,5)
	var _n_half_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_pad_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	if _S.truth(((_n_u1_b3 - _n_u0_b2) < 0.005)):
		return null
	var _n_c_b8 = cos(_S.named_value(_n_s_b1,"rot"))
	var _n_n_b9 = sin(_S.named_value(_n_s_b1,"rot"))
	var _n_A_b10 = ((_S.named_value(_n_s_b1,"R") + _n_pad_b7) + 1)
	var _n_Bn_b11 = ((_n_A_b10 * _S.named_value(_n_s_b1,"sy")) + (_S.named_value(_n_s_b1,"k") * (_n_wMax_b4 + 2)))
	var _n_hx_b12 = (_S.Bridge.hypot([(_n_A_b10 * _n_c_b8), (_n_Bn_b11 * _n_n_b9)]) + 1)
	var _n_hy_b13 = (_S.Bridge.hypot([(_n_A_b10 * _n_n_b9), (_n_Bn_b11 * _n_c_b8)]) + 1)
	var _n_rIn_b14 = ((_S.named_value(_n_s_b1,"R") - _n_wMax_b4) - 1)
	var _n_over_b15 = (((absf(_n_n_b9) * _n_A_b10) + (_S.named_value(_n_s_b1,"k") * (_n_wMax_b4 + 2))) + 2)
	var _n_y0_b16 = ((_S.named_value(_n_s_b1,"cy") - _n_over_b15) if _S.truth((_n_half_b6 > 0)) else (_S.named_value(_n_s_b1,"cy") - _n_hy_b13))
	var _n_y1_b17 = ((_S.named_value(_n_s_b1,"cy") + _n_over_b15) if _S.truth((_n_half_b6 < 0)) else (_S.named_value(_n_s_b1,"cy") + _n_hy_b13))
	_S.invoke(_n_p_b0,"shade",[(_S.named_value(_n_s_b1,"cx") - _n_hx_b12), _n_y0_b16, (_S.named_value(_n_s_b1,"cx") + _n_hx_b12), _n_y1_b17, _S.function_value(_S.capture(_parent,{"s":_n_s_b1,"pad":_n_pad_b7,"rIn":_n_rIn_b14,"half":_n_half_b6,"u0":_n_u0_b2,"u1":_n_u1_b3,"fn":_n_fn_b5,"this":_this}),"_f5")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_plane = _S.read(_parent,"plane")
	var _n_s = _S.read(_parent,"s")
	var _n_pad = _S.read(_parent,"pad")
	var _n_rIn = _S.read(_parent,"rIn")
	var _n_half = _S.read(_parent,"half")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_u0 = _S.read(_parent,"u0")
	var _n_u1 = _S.read(_parent,"u1")
	var _n_fn = _S.read(_parent,"fn")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _tuple_0 = _S.call_value(_n_plane,[_n_s, _n_x_b0, _n_y_b1])
	var _n_r_b3 = _S.prop(_tuple_0,0)
	var _n_a_b4 = _S.prop(_tuple_0,1)
	if _S.truth(((_n_r_b3 > (_S.named_value(_n_s,"R") + _n_pad)) if _S.truth((_n_r_b3 > (_S.named_value(_n_s,"R") + _n_pad))) else (_n_r_b3 < _n_rIn))):
		return null
	if _S.truth((_S.binary("!==",((-1) if _S.truth((sin(_n_a_b4) < 0)) else 1),_n_half) if _S.truth(_n_half) else _n_half)):
		return null
	var _n_u_b5 = fmod((_S.named_value(_n_s,"dir") * (_n_a_b4 - _S.named_value(_n_s,"a0"))),_n_TAU)
	if _S.truth((_n_u_b5 < 0)):
		_n_u_b5 += _n_TAU
	while _S.truth((_n_u_b5 < _n_u0)):
		_n_u_b5 += _n_TAU
	if _S.truth((_n_u_b5 > _n_u1)):
		return null
	return _S.call_value(_n_fn,[_n_u_b5, _n_r_b3, _n_out_b2, _n_a_b4])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u0_b3 = _S.arg(_args,3)
	var _n_u1_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.arg(_args,6)
	var _n_half_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	var _n_step_b8 = _S.coalesce(_S.arg(_args,8),func():return 0.6)
	var _n_du_b9 = (float(_n_step_b8)/maxf(4,_n_r_b2))
	if true:
		var _n_u_b10 = _n_u0_b3
		while _S.truth((_n_u_b10 <= _n_u1_b4)):
			var _n_g_b11 = (_S.named_value(_n_s_b1,"a0") + (_S.named_value(_n_s_b1,"dir") * _n_u_b10))
			if _S.truth((_S.binary("!==",((-1) if _S.truth((sin(_n_g_b11) < 0)) else 1),_n_half_b7) if _S.truth(_n_half_b7) else _n_half_b7)):
				_n_u_b10 += _n_du_b9
				continue
			var _tuple_0 = _S.call_value(_n_onSwing,[_n_s_b1, _n_r_b2, _n_u_b10])
			var _n_x_b12 = _S.prop(_tuple_0,0)
			var _n_y_b13 = _S.prop(_tuple_0,1)
			var _n_k_b14 = (_S.call_value(_n_a_b6,[_n_u_b10]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_a_b6),"function")) else _n_a_b6)
			if _S.truth((_n_k_b14 > 0)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b12, _n_y_b13, (_S.call_value(_n_c_b5,[_n_u_b10]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_c_b5),"function")) else _n_c_b5), _n_k_b14])
			_n_u_b10 += _n_du_b9
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u0_b3 = _S.arg(_args,3)
	var _n_u1_b4 = _S.arg(_args,4)
	var _n_rad_b5 = _S.arg(_args,5)
	var _n_c_b6 = _S.arg(_args,6)
	var _n_k_b7 = _S.arg(_args,7)
	var _n_half_b8 = _S.coalesce(_S.arg(_args,8),func():return 0)
	var _n_step_b9 = _S.coalesce(_S.arg(_args,9),func():return 0.35)
	if true:
		var _n_u_b10 = _n_u0_b3
		while _S.truth((_n_u_b10 <= _n_u1_b4)):
			var _n_g_b11 = (_S.named_value(_n_s_b1,"a0") + (_S.named_value(_n_s_b1,"dir") * _n_u_b10))
			if _S.truth((_S.binary("!==",((-1) if _S.truth((sin(_n_g_b11) < 0)) else 1),_n_half_b8) if _S.truth(_n_half_b8) else _n_half_b8)):
				_n_u_b10 += _n_step_b9
				continue
			var _tuple_0 = _S.call_value(_n_onSwing,[_n_s_b1, _n_r_b2, _n_u_b10])
			var _n_x_b12 = _S.prop(_tuple_0,0)
			var _n_y_b13 = _S.prop(_tuple_0,1)
			var _n_kk_b14 = (_S.call_value(_n_k_b7,[_n_u_b10]) if _S.truth(_S.binary("===",_S.unary("typeof",_n_k_b7),"function")) else _n_k_b7)
			if _S.truth((_n_kk_b14 > 0.004)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b12, _n_y_b13, _n_rad_b5, _n_c_b6, _n_kk_b14])
			_n_u_b10 += _n_step_b9
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_smear = _S.read(_parent,"smear")
	var _n_glowAlong = _S.read(_parent,"glowAlong")
	var _n_trace = _S.read(_parent,"trace")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_half_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	var _n_u_b4 = (_n_t_b2 - _S.named_value(_n_s_b1,"t0"))
	if _S.truth((_n_u_b4 < 0)):
		return null
	var _n_R_b5 = _S.named_value(_n_s_b1,"ramp")
	var _n_n_b6 = _S.prop(_n_R_b5,"length")
	var _n_life_b7 = ((_S.named_value(_n_s_b1,"sweep") + _S.named_value(_n_s_b1,"hold")) + _S.named_value(_n_s_b1,"trail"))
	var _n_hot_b8 = (_S.named_value(_n_s_b1,"hot") if _S.named_value(_n_s_b1,"hot")!=null else 0)
	var _n_head_b9 = _S.invoke(_n_ease,"outExpo",[clampf((float(_n_u_b4)/_S.named_value(_n_s_b1,"sweep")),0.0,1.0)])
	var _n_tail_b10 = _S.MathFX.smooth((_S.named_value(_n_s_b1,"sweep") + _S.named_value(_n_s_b1,"hold")),_n_life_b7,_n_u_b4)
	var _n_age_b11 = clampf((float(_n_u_b4)/_n_life_b7),0.0,1.0)
	var _n_U_b12 = (_S.named_value(_n_s_b1,"span") * _n_head_b9)
	var _n_T_b13 = (_S.named_value(_n_s_b1,"span") * _n_tail_b10)
	var _n_W_b14 = (_S.named_value(_n_s_b1,"W") * (1 - (_n_tail_b10 * 0.55)))
	if _S.truth((((_n_U_b12 - _n_T_b13) > 0.01) if _S.truth((_n_tail_b10 < 1)) else (_n_tail_b10 < 1))):
		_S.call_value(_n_smear,[_n_p_b0, _n_s_b1, _n_T_b13, _n_U_b12, _n_W_b14, _S.function_value(_S.capture(_parent,{"T":_n_T_b13,"U":_n_U_b12,"W":_n_W_b14,"s":_n_s_b1,"age":_n_age_b11,"hot":_n_hot_b8,"n":_n_n_b6,"R":_n_R_b5,"this":_this}),"_f9"), _n_half_b3])
		_S.call_value(_n_glowAlong,[_n_p_b0, _n_s_b1, (_S.named_value(_n_s_b1,"R") - (_n_W_b14 * 0.4)), _n_T_b13, _n_U_b12, (5 + _n_W_b14), _S.index_value(_n_R_b5,(_n_n_b6 - 3)), _S.function_value(_S.capture(_parent,{"hot":_n_hot_b8,"age":_n_age_b11,"T":_n_T_b13,"U":_n_U_b12,"this":_this}),"_f10"), _n_half_b3, 0.3])
	var _n_th_b15 = (0.7 * (1 - clampf((float(((_n_u_b4 - _S.named_value(_n_s_b1,"sweep")) - _S.named_value(_n_s_b1,"hold")))/(_S.named_value(_n_s_b1,"trail") + 0.2)),0.0,1.0)))
	if _S.truth(((_n_th_b15 > 0) if _S.truth((_n_tail_b10 > 0.02)) else (_n_tail_b10 > 0.02))):
		_S.call_value(_n_trace,[_n_p_b0, _n_s_b1, (_S.named_value(_n_s_b1,"R") - 0.5), 0, _n_T_b13, _S.index_value(_n_R_b5,2), _S.function_value(_S.capture(_parent,{"th":_n_th_b15,"s":_n_s_b1,"this":_this}),"_f11"), _n_half_b3])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_U = _S.read(_parent,"U")
	var _n_W = _S.read(_parent,"W")
	var _n_s = _S.read(_parent,"s")
	var _n_age = _S.read(_parent,"age")
	var _n_hot = _S.read(_parent,"hot")
	var _n_n = _S.read(_parent,"n")
	var _n_R = _S.read(_parent,"R")
	var _n_uu_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_v_b3 = (float((_n_uu_b0 - _n_T))/(_n_U - _n_T))
	var _n_w_b4 = (_n_W * pow(sin((PI * pow(_n_v_b3,(1 if _S.truth(_S.named_value(_n_s,"lens")) else 2.2)))),(0.75 if _S.truth(_S.named_value(_n_s,"lens")) else 0.6)))
	if _S.truth((_n_w_b4 < 0.35)):
		return null
	var _n_q_b5 = (float((_S.named_value(_n_s,"R") - _n_r_b1))/_n_w_b4)
	if _S.truth(((_n_q_b5 < 0) if _S.truth((_n_q_b5 < 0)) else (_n_q_b5 > 1))):
		return null
	var _n_ci_b6 = (0 if _S.truth((((_n_age < 0.5) if _S.truth((_n_q_b5 < 0.22)) else (_n_q_b5 < 0.22)) if _S.truth(((_n_age < 0.5) if _S.truth((_n_q_b5 < 0.22)) else (_n_q_b5 < 0.22))) else (_n_q_b5 < (_n_hot * 0.7)))) else floori(((((((_n_q_b5 * (_n_n - 1)) * 0.75) + (_n_age * 2.4)) - (_n_v_b3 * 0.8)) + 0.4) - (_n_hot * 3))+0.5))
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_R,((_n_n - 1) - clampf(_n_ci_b6,0,(_n_n - 1)))),"=")
	_S.set_prop(_n_out_b2,"a",minf(1,(float(_n_v_b3)/(0.1 if _S.truth(_S.named_value(_n_s,"lens")) else 0.4))),"=")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_hot = _S.read(_parent,"hot")
	var _n_age = _S.read(_parent,"age")
	var _n_T = _S.read(_parent,"T")
	var _n_U = _S.read(_parent,"U")
	var _n_uu_b0 = _S.arg(_args,0)
	return (((0.22 + (_n_hot * 0.3)) * (1 - _n_age)) * (float((_n_uu_b0 - _n_T))/(_n_U - _n_T)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_th = _S.read(_parent,"th")
	var _n_s = _S.read(_parent,"s")
	var _n_uu_b0 = _S.arg(_args,0)
	return (_n_th * (0.4 + (float((0.6 * _n_uu_b0))/_S.named_value(_n_s,"span"))))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_onSwing = _S.read(_parent,"onSwing")
	var _n_P = _S.read(_parent,"P")
	var _n_ps_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.arg(_args,3)
	var _n_colors_b4 = _S.arg(_args,4)
	var _n_from_b5 = _S.coalesce(_S.arg(_args,5),func():return 0.3)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < _n_n_b3)):
			var _tuple_0 = _S.call_value(_n_onSwing,[_n_s_b2, _S.named_value(_n_s_b2,"R"), (_S.named_value(_n_s_b2,"span") * _S.invoke(_n_R_b1,"range",[_n_from_b5, 1]))])
			var _n_x_b7 = _S.prop(_tuple_0,0)
			var _n_y_b8 = _S.prop(_tuple_0,1)
			var _n_ox_b9 = (_n_x_b7 - _S.named_value(_n_s_b2,"cx"))
			var _n_oy_b10 = (_n_y_b8 - _S.named_value(_n_s_b2,"cy"))
			var _n_l_b11 = _S.logical("||",_S.Bridge.hypot([_n_ox_b9, _n_oy_b10]),func():return 1)
			var _n_sp_b12 = _S.invoke(_n_R_b1,"range",[30, 100])
			_S.invoke(_n_ps_b0,"spawn",[_S.named_value(_n_P,"MOTE"), _n_x_b7, _n_y_b8, ((float(_n_ox_b9)/_n_l_b11) * _n_sp_b12), (minf(25,((float(_n_oy_b10)/_n_l_b11) * _n_sp_b12)) - 10), _S.invoke(_n_R_b1,"range",[0.25, 0.55]), _S.invoke(_n_R_b1,"pick",[_n_colors_b4]), 0.6])
			_n_i_b6 += 1.0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_c_b0 = _S.arg(_args,0)
	_n_c_b0 = _S.call_value(_n_hex,[_n_c_b0])
	return {"light":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.35),_n_WHITE,0.08),"body":_n_c_b0,"shade":_S.ColorFX.scale_color(_n_c_b0,0.64),"dust":_S.ColorFX.mix(_S.ColorFX.scale_color(_n_c_b0,1.2),_S.ColorFX.rgb(150,140,150),0.3),"dark":_S.ColorFX.scale_color(_n_c_b0,0.42)}
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_st_b2 = _S.arg(_args,2)
	var _n_r_b3 = (0.6 + (_S.named_value(_n_b_b1,"s") * 0.75))
	var _n_fade_b4 = minf(1,(float(_S.named_value(_n_b_b1,"life"))/0.5))
	var _n_lx_b5 = ((cos(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	var _n_ly_b6 = ((sin(_S.named_value(_n_b_b1,"a")) * _n_r_b3) * 0.4)
	_S.invoke(_n_p_b0,"shade",[((_S.named_value(_n_b_b1,"x") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"y") - _n_r_b3) - 1), ((_S.named_value(_n_b_b1,"x") + _n_r_b3) + 1), ((_S.named_value(_n_b_b1,"y") + _n_r_b3) + 1), _S.function_value(_S.capture(_parent,{"b":_n_b_b1,"r":_n_r_b3,"lx":_n_lx_b5,"ly":_n_ly_b6,"st":_n_st_b2,"fade":_n_fade_b4,"this":_this}),"_f15")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_b = _S.read(_parent,"b")
	var _n_r = _S.read(_parent,"r")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_st = _S.read(_parent,"st")
	var _n_fade = _S.read(_parent,"fade")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _S.named_value(_n_b,"x"))
	var _n_dy_b4 = (_n_y_b1 - _S.named_value(_n_b,"y"))
	var _n_d_b5 = _S.Bridge.hypot([(_n_dx_b3 * 1.15), _n_dy_b4])
	if _S.truth((_n_d_b5 > (_n_r + 0.9))):
		return null
	var _n_lit_b6 = ((_n_dx_b3 * _n_lx) + (_n_dy_b4 * _n_ly))
	_S.set_prop(_n_out_b2,"c",(_n_OUTLINE if _S.truth((_n_d_b5 > _n_r)) else (_S.named_value(_n_st,"light") if _S.truth((_n_lit_b6 < (-0.4))) else (_S.named_value(_n_st,"shade") if _S.truth((_n_lit_b6 > 0.6)) else _S.named_value(_n_st,"body")))),"=")
	_S.set_prop(_n_out_b2,"a",_n_fade,"=")
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_reach_b3 = _S.arg(_args,3)
	var _n_depth_b4 = _S.coalesce(_S.arg(_args,4),func():return 7)
	var _n_bias_b5 = _S.coalesce(_S.arg(_args,5),func():return 0.3)
	var _n_out_b6 = []
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _n_n_b2)):
			var _n_side_b8 = (1 if _S.truth(_S.invoke(_n_R_b0,"chance",[(0.5 + (_n_bias_b5 * 0.5))])) else (-1))
			var _n_L_b9 = ((_n_reach_b3 * _S.invoke(_n_R_b0,"range",[0.45, 1])) * (1 if _S.truth((_n_i_b7 < 2)) else 0.7))
			var _n_pts_b10 = [[(_n_x0_b1 + (_n_side_b8 * _S.invoke(_n_R_b0,"range",[0, 1.5]))), 0]]
			var _n_x_b11 = _S.index_value(_S.index_value(_n_pts_b10,0),0)
			var _n_y_b12 = 0
			while _S.truth(_S.logical("&&",(absf((_n_x_b11 - _n_x0_b1)) < _n_L_b9),func():return (_n_y_b12 < _n_depth_b4))):
				_n_x_b11 += (_n_side_b8 * _S.invoke(_n_R_b0,"range",[1.5, 3.5]))
				_n_y_b12 = minf(_n_depth_b4,maxf(0,(_n_y_b12 + (_S.invoke(_n_R_b0,"range",[(-0.6), 1.6]) * (1 if _S.truth((absf((_n_x_b11 - _n_x0_b1)) > 3)) else 0.3)))))
				_S.invoke(_n_pts_b10,"push",[[floori(_n_x_b11+0.5), floori(_n_y_b12+0.5)]])
				if _S.truth(_S.logical("&&",_S.logical("&&",_S.invoke(_n_R_b0,"chance",[0.18]),func():return (_S.prop(_n_pts_b10,"length") > 3)),func():return (_n_y_b12 < (_n_depth_b4 - 2)))):
					var _n_f_b13 = [[floori(_n_x_b11+0.5), floori(_n_y_b12+0.5)]]
					var _n_fx_b14 = _n_x_b11
					var _n_fy_b15 = _n_y_b12
					if true:
						var _n_j_b16 = _S.invoke(_n_R_b0,"int",[1, 3])
						while _S.truth((_n_j_b16 > 0)):
							_n_fx_b14 += (_n_side_b8 * _S.invoke(_n_R_b0,"range",[1, 3]))
							_n_fy_b15 += _S.invoke(_n_R_b0,"range",[0.8, 2])
							_S.invoke(_n_f_b13,"push",[[floori(_n_fx_b14+0.5), floori(minf((_n_depth_b4 + 1),_n_fy_b15)+0.5)]])
							_n_j_b16 -= 1.0
					_S.invoke(_n_out_b6,"push",[{"pts":_n_f_b13,"at":(float(absf((_n_x_b11 - _n_x0_b1)))/_n_reach_b3),"fork":true}])
			_S.invoke(_n_out_b6,"push",[{"pts":_n_pts_b10,"at":0,"fork":false}])
			_n_i_b7 += 1.0
	return _n_out_b6
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_spikes_b3 = _S.arg(_args,3)
	var _n_sc_b4 = _S.arg(_args,4)
	var _n_th_b5 = _S.arg(_args,5)
	var _n_core_b6 = _S.arg(_args,6)
	var _n_body_b7 = _S.arg(_args,7)
	var _n_inner_b8 = _S.arg(_args,8)
	var _n_rim_b9 = _S.arg(_args,9)
	for _iter_0 in _S.array([0, 1, 2]):
		var _n_pass_b11 = _iter_0
		for _iter_1 in _S.array(_n_spikes_b3):
			var _n_s_b12 = _iter_1
			var _n_c_b13 = cos(_S.named_value(_n_s_b12,"a"))
			var _n_sn_b14 = sin(_S.named_value(_n_s_b12,"a"))
			var _n_L_b15 = (_S.named_value(_n_s_b12,"len") * _n_sc_b4)
			if true:
				var _n_d_b16 = 0
				while _S.truth((_n_d_b16 <= _n_L_b15)):
					var _n_hw0_b17 = (((_S.named_value(_n_s_b12,"w") * _n_th_b5) * (1 - (float(_n_d_b16)/_n_L_b15))) * minf(1,(0.5 + (float(_n_d_b16)/3))))
					var _n_hw_b18 = ((_n_hw0_b17 + 0.8) if _S.truth(_S.binary("===",_n_pass_b11,0)) else (_n_hw0_b17 if _S.truth(_S.binary("===",_n_pass_b11,1)) else (_n_hw0_b17 * 0.45)))
					if _S.truth(((_n_d_b16 > (_n_L_b15 * 0.55)) if _S.truth(_S.binary("===",_n_pass_b11,2)) else _S.binary("===",_n_pass_b11,2))):
						break
					if true:
						var _n_o_b19 = (-_n_hw_b18)
						while _S.truth((_n_o_b19 <= _n_hw_b18)):
							_S.invoke(_n_p_b0,"px",[((_n_x_b1 + (_n_c_b13 * _n_d_b16)) - (_n_sn_b14 * _n_o_b19)), ((_n_y_b2 + (_n_sn_b14 * _n_d_b16)) + (_n_c_b13 * _n_o_b19)), (_n_rim_b9 if _S.truth(_S.binary("===",_n_pass_b11,0)) else ((_n_inner_b8 if _S.truth((_n_d_b16 < (_n_L_b15 * 0.35))) else _n_body_b7) if _S.truth(_S.binary("===",_n_pass_b11,1)) else _n_core_b6))])
							_n_o_b19 += 0.5
					_n_d_b16 += 0.5
	var _n_r_b10 = ((2.4 * _n_sc_b4) * sqrt(_n_th_b5))
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, (_n_r_b10 + 0.8), _n_inner_b8])
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, _n_r_b10, _n_core_b6])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_arc_b5 = _S.arg(_args,5)
	var _n_c_b6 = _S.arg(_args,6)
	var _n_k_b7 = _S.arg(_args,7)
	var _n_n_b8 = ceili(((_n_r_b4 * _n_arc_b5) * 2.2))
	if true:
		var _n_j_b9 = 0
		while _S.truth((_n_j_b9 <= _n_n_b8)):
			var _n_u_b10 = ((float(_n_j_b9)/_n_n_b8) - 0.5)
			var _n_th_b11 = (_n_a_b3 + (_n_u_b10 * _n_arc_b5))
			var _n_w_b12 = (1.4 * (1 - (absf(_n_u_b10) * 2)))
			if true:
				var _n_o_b13 = ((-_n_w_b12) * 0.5)
				while _S.truth((_n_o_b13 <= ((_n_w_b12 * 0.5) + 0.01))):
					_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (cos(_n_th_b11) * (_n_r_b4 + _n_o_b13))), (_n_y_b2 + (sin(_n_th_b11) * (_n_r_b4 + _n_o_b13))), _n_c_b6, _n_k_b7])
					_n_o_b13 += 0.5
			_n_j_b9 += 1.0
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_len_b1 = _S.arg(_args,1)
	var _n_fn_b2 = _S.arg(_args,2)
	var _n_d_b3 = 0
	if true:
		var _n_i_b4 = 1
		while _S.truth(((_n_d_b3 < _n_len_b1) if _S.truth((_n_i_b4 < _S.prop(_n_pts_b0,"length"))) else (_n_i_b4 < _S.prop(_n_pts_b0,"length")))):
			var _tuple_0 = _S.index_value(_n_pts_b0,(_n_i_b4 - 1))
			var _n_x0_b5 = _S.prop(_tuple_0,0)
			var _n_y0_b6 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_i_b4)
			var _n_x1_b7 = _S.prop(_tuple_1,0)
			var _n_y1_b8 = _S.prop(_tuple_1,1)
			var _n_l_b9 = _S.Bridge.hypot([(_n_x1_b7 - _n_x0_b5), (_n_y1_b8 - _n_y0_b6)])
			var _n_f_b10 = minf(1,(float((_n_len_b1 - _n_d_b3))/_n_l_b9))
			_S.call_value(_n_fn_b2,[_n_x0_b5, _n_y0_b6, (_n_x0_b5 + ((_n_x1_b7 - _n_x0_b5) * _n_f_b10)), (_n_y0_b6 + ((_n_y1_b8 - _n_y0_b6) * _n_f_b10)), _n_d_b3])
			_n_d_b3 += _n_l_b9
			_n_i_b4 += 1.0
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	return _S.merge([{"cx": 0}, {"cy": 0}, {"R": 30}, {"sy": 1}, {"rot": 0}, {"a0": 0}, {"dir": 1}, {"k": 0}, _S.read(_e, "o")])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "travel"), [_S.merge([_S.read(_e, "s"), {"R": _S.binary("-", _S.prop(_S.read(_e, "s"), "R"), _S.binary("*", _S.prop(_S.read(_e, "s"), "W"), 0.3))}]), _S.prop(_S.read(_e, "s"), "span")])
