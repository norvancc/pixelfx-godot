@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/eyeball.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "curve", _S.import_value("fx/critters/_lib.js", "curve"))
	_S.define(_e, "look", _S.function_value(_e, "_f0"))
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	_S.define(_e, "veins", _S.function_value(_e, "_f2"))
	_S.define(_e, "eye", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Eyeball"}, {"desc": "A bloodshot eyeball floats in its fleshy lids: its glowing iris snaps from one look to the next, it blinks, and its nerve sways behind it as it bobs."}, {"tags": ["critter", "eyeball", "eye", "monster", "spooky", "float", "loop"]}, {"size": [96, 108]}, {"origin": [48, 100]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#2a1420", "#6a3040", "#b07078", "#dcbcb4", "#f4e9de", "#ffffff"]}, {"flesh": ["#1e0c16", "#4a1a2c", "#7c2c40", "#b04a58", "#e07a80"]}, {"iris": ["#0c2a14", "#1f6a2a", "#3fae3a", "#9be05a", "#e8ffb0"]}, {"hover": 48}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 18), _S.unary("-", 18), 36, 38]))
	_S.define(_e, "NERVE", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 20), _S.unary("-", 70), 40, 64]))
	_S.define(_e, "R", 13)
	_S.define(_e, "VEIN", _S.call_value(_S.read(_e, "hex"), ["#c42a3a"]))
	_S.define(_e, "LOOKS", [[0, 0, 0], [0.55, 4.2, _S.unary("-", 1.2)], [1.15, _S.unary("-", 4.4), 0.8], [1.95, 1.2, 3.4], [2.5, _S.unary("-", 2), _S.unary("-", 3.4)], [3, 0, 0]])
	_S.define(_e, "lid", _S.function_value(_e, "_f14"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_LOOKS = _S.read(_parent,"LOOKS")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_i_b1 = (_S.prop(_n_LOOKS,"length") - 1)
	while _S.truth(((_n_t_b0 < _S.index_value(_S.index_value(_n_LOOKS,_n_i_b1),0)) if _S.truth((_n_i_b1 > 0)) else (_n_i_b1 > 0))):
		_n_i_b1 -= 1.0
	var _tuple_0 = _S.index_value(_n_LOOKS,_n_i_b1)
	var _n_t0_b2 = _S.prop(_tuple_0,0)
	var _n_x1_b3 = _S.prop(_tuple_0,1)
	var _n_y1_b4 = _S.prop(_tuple_0,2)
	var _tuple_1 = _S.index_value(_n_LOOKS,fmod(((_n_i_b1 + _S.prop(_n_LOOKS,"length")) - 1),_S.prop(_n_LOOKS,"length")))
	var _n_x0_b5 = _S.prop(_tuple_1,1)
	var _n_y0_b6 = _S.prop(_tuple_1,2)
	var _n_u_b7 = _S.invoke(_n_ease,"outBack",[clampf((float((_n_t_b0 - _n_t0_b2))/0.08),0.0,1.0), 2.2])
	return [_S.numeric_lerp(_n_x0_b5,_n_x1_b3,_n_u_b7), _S.numeric_lerp(_n_y0_b6,_n_y1_b4,_n_u_b7)]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_hover_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((float(_n_t_b0)/_n_D) * _n_TAU)
	return {"x":(1.5 * sin(_n_a_b2)),"y":((-_n_hover_b1) - (3 * sin(((2 * _n_a_b2) + 0.4))))}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_seed_b0 = _S.arg(_args,0)
	var _n_out_b1 = []
	var _n_r_b2 = _S.MathFX.rng([_n_seed_b0,77])
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < 7)):
			var _n_a_b4 = (((float(_n_i_b3)/7) * _n_TAU) + _S.invoke(_n_r_b2,"range",[(-0.3), 0.3]))
			var _n_d_b5 = (_n_R - 0.5)
			var _n_pts_b6 = [[(cos(_n_a_b4) * _n_d_b5), (sin(_n_a_b4) * _n_d_b5)]]
			if true:
				var _n_k_b7 = 0
				while _S.truth((_n_k_b7 < 4)):
					_n_a_b4 += _S.invoke(_n_r_b2,"range",[(-0.35), 0.35])
					_n_d_b5 -= _S.invoke(_n_r_b2,"range",[1.2, 2.1])
					_S.invoke(_n_pts_b6,"push",[[(cos(_n_a_b4) * _n_d_b5), (sin(_n_a_b4) * _n_d_b5)]])
					_n_k_b7 += 1.0
			_S.invoke(_n_out_b1,"push",[_n_pts_b6])
			_n_i_b3 += 1.0
	return _n_out_b1
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_look = _S.read(_parent,"look")
	var _n_lid = _S.read(_parent,"lid")
	var _n_veins = _S.read(_parent,"veins")
	var _n_R = _S.read(_parent,"R")
	var _n_VEIN = _S.read(_parent,"VEIN")
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Fl_b2 = _S.arg(_args,2)
	var _n_I_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	_S.invoke(_n_g_b0,"clear",[])
	var _tuple_0 = _S.call_value(_n_look,[_n_t_b4])
	var _n_lx_b6 = _S.prop(_tuple_0,0)
	var _n_ly_b7 = _S.prop(_tuple_0,1)
	var _n_L_b8 = _S.call_value(_n_lid,[_n_t_b4])
	var _n_V_b9 = _S.call_value(_n_veins,[_n_seed_b5])
	var _n_lit_b10 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")
	_S.invoke(_n_g_b0,"shade",[(-_n_R), (-_n_R), _n_R, _n_R, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"lit":_n_lit_b10,"this":_this}),"_f5")])
	for _iter_1 in _S.array(_n_V_b9):
		var _n_pts_b19 = _iter_1
		var _n_sh_b20 = _S.invoke(_n_pts_b19,"map",[_S.function_value(_S.capture(_parent,{"lx":_n_lx_b6,"ly":_n_ly_b7,"this":_this}),"_f6")])
		if true:
			var _n_k_b21 = 1
			while _S.truth((_n_k_b21 < _S.prop(_n_sh_b20,"length"))):
				_S.invoke(_n_g_b0,"line",[_S.index_value(_S.index_value(_n_sh_b20,(_n_k_b21 - 1)),0), _S.index_value(_S.index_value(_n_sh_b20,(_n_k_b21 - 1)),1), _S.index_value(_S.index_value(_n_sh_b20,_n_k_b21),0), _S.index_value(_S.index_value(_n_sh_b20,_n_k_b21),1), (_n_VEIN if _S.truth((_n_k_b21 < 2)) else _S.ColorFX.mix(_n_VEIN,_S.index_value(_n_C_b1,3),0.45))])
				_n_k_b21 += 1.0
	var _n_off_b11 = _S.Bridge.hypot([_n_lx_b6, _n_ly_b7])
	var _n_fx_b12 = (1 - ((0.32 * pow((float(absf(_n_lx_b6))/_n_R),1.4)) * 3))
	var _n_fy_b13 = (1 - ((0.32 * pow((float(absf(_n_ly_b7))/_n_R),1.4)) * 3))
	var _n_ir_b14 = 6.4
	var _n_pr_b15 = (2 + (0.4 * sin((((float(_n_t_b4)/_n_D) * _n_TAU) * 2))))
	_S.invoke(_n_g_b0,"shade",[((_n_lx_b6 - _n_ir_b14) - 1), ((_n_ly_b7 - _n_ir_b14) - 1), ((_n_lx_b6 + _n_ir_b14) + 1), ((_n_ly_b7 + _n_ir_b14) + 1), _S.function_value(_S.capture(_parent,{"lx":_n_lx_b6,"ir":_n_ir_b14,"fx":_n_fx_b12,"ly":_n_ly_b7,"fy":_n_fy_b13,"pr":_n_pr_b15,"C":_n_C_b1,"I":_n_I_b3,"this":_this}),"_f7")])
	if _S.truth((_n_L_b8 < 0.5)):
		_S.invoke(_n_g_b0,"set",[(-4), (-5), _S.index_value(_n_C_b1,5)])
		_S.invoke(_n_g_b0,"set",[(-3), (-5), _S.index_value(_n_C_b1,5)])
		_S.invoke(_n_g_b0,"set",[(-4), (-4), _S.index_value(_n_C_b1,5)])
		_S.invoke(_n_g_b0,"set",[1, (-2), _S.index_value(_n_C_b1,5)])
	var _n_up_b16 = _S.numeric_lerp(((-_n_R) + 3),(_n_R * 0.42),_n_L_b8)
	var _n_dn_b17 = _S.numeric_lerp((_n_R - 2.2),(_n_R * 0.42),_n_L_b8)
	var _n_flit_b18 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f8")
	_S.invoke(_n_g_b0,"shade",[((-_n_R) - 1), ((-_n_R) - 1), (_n_R + 1), (_n_R + 1), _S.function_value(_S.capture(_parent,{"up":_n_up_b16,"dn":_n_dn_b17,"Fl":_n_Fl_b2,"flit":_n_flit_b18,"this":_this}),"_f9")])
	_S.invoke(_n_g_b0,"outline",[_S.index_value(_n_C_b1,0)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return (_S.Bridge.hypot([((-4) + (float((_n_x_b0 + 4))/_n_k_b2)), ((-4.5) + (float((_n_y_b1 + 4.5))/_n_k_b2))]) <= _n_R)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_lit = _S.read(_parent,"lit")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.Bridge.hypot([_n_x_b0, _n_y_b1])
	if _S.truth((_n_d_b2 > _n_R)):
		return 0
	if _S.truth(not _S.truth((_S.Bridge.hypot([(_n_x_b0 + 2), (_n_y_b1 + 2.2)]) <= _n_R))):
		return _S.index_value(_n_C,2)
	return (_S.index_value(_n_C,5) if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.5])) else (_S.index_value(_n_C,4) if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.8])) else _S.index_value(_n_C,3)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_lx = _S.read(_parent,"lx")
	var _n_R = _S.read(_parent,"R")
	var _n_ly = _S.read(_parent,"ly")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 + ((_n_lx * 0.35) * (1 - (float(_S.Bridge.hypot([_n_x_b0, _n_y_b1]))/_n_R)))), (_n_y_b1 + ((_n_ly * 0.35) * (1 - (float(_S.Bridge.hypot([_n_x_b0, _n_y_b1]))/_n_R))))]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_lx = _S.read(_parent,"lx")
	var _n_ir = _S.read(_parent,"ir")
	var _n_fx = _S.read(_parent,"fx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_fy = _S.read(_parent,"fy")
	var _n_R = _S.read(_parent,"R")
	var _n_pr = _S.read(_parent,"pr")
	var _n_C = _S.read(_parent,"C")
	var _n_I = _S.read(_parent,"I")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (float((_n_x_b0 - _n_lx))/(_n_ir * _n_fx))
	var _n_dy_b3 = (float((_n_y_b1 - _n_ly))/(_n_ir * _n_fy))
	var _n_d_b4 = _S.Bridge.hypot([_n_dx_b2, _n_dy_b3])
	if _S.truth(((_n_d_b4 > 1) if _S.truth((_n_d_b4 > 1)) else (_S.Bridge.hypot([_n_x_b0, _n_y_b1]) > (_n_R - 0.5)))):
		return 0
	var _n_pd_b5 = _S.Bridge.hypot([(float((_n_x_b0 - _n_lx))/_n_fx), (float((_n_y_b1 - _n_ly))/_n_fy)])
	if _S.truth((_n_pd_b5 < _n_pr)):
		return _S.index_value(_n_C,0)
	if _S.truth((_n_d_b4 > 0.86)):
		return _S.index_value(_n_I,0)
	var _n_ang_b6 = atan2(_n_dy_b3,_n_dx_b2)
	var _n_streak_b7 = (sin(((_n_ang_b6 * 9) + (_n_d_b4 * 4))) > 0.5)
	if _S.truth((_n_d_b4 < 0.5)):
		return (_S.index_value(_n_I,4) if _S.truth(_n_streak_b7) else _S.index_value(_n_I,3))
	if _S.truth((_n_d_b4 < 0.7)):
		return (_S.index_value(_n_I,3) if _S.truth(_n_streak_b7) else _S.index_value(_n_I,2))
	return (_S.index_value(_n_I,2) if _S.truth(_n_streak_b7) else _S.index_value(_n_I,1))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return (_S.Bridge.hypot([((-4) + (float((_n_x_b0 + 4))/_n_k_b2)), ((-5) + (float((_n_y_b1 + 5))/_n_k_b2))]) <= (_n_R + 0.6))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_up = _S.read(_parent,"up")
	var _n_dn = _S.read(_parent,"dn")
	var _n_Fl = _S.read(_parent,"Fl")
	var _n_flit = _S.read(_parent,"flit")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.Bridge.hypot([_n_x_b0, _n_y_b1])
	if _S.truth((_n_d_b2 > (_n_R + 0.6))):
		return 0
	var _n_ue_b3 = (_n_up + (1.8 * pow((float(_n_x_b0)/_n_R),2)))
	var _n_de_b4 = (_n_dn - (1.4 * pow((float(_n_x_b0)/_n_R),2)))
	var _n_tone_b5 = (_S.index_value(_n_Fl,1) if _S.truth(not _S.truth((_S.Bridge.hypot([(_n_x_b0 + 2), (_n_y_b1 + 2.2)]) <= (_n_R + 0.6)))) else (_S.index_value(_n_Fl,4) if _S.truth(_S.call_value(_n_flit,[_n_x_b0, _n_y_b1, 0.55])) else (_S.index_value(_n_Fl,3) if _S.truth(_S.call_value(_n_flit,[_n_x_b0, _n_y_b1, 0.85])) else _S.index_value(_n_Fl,2))))
	if _S.truth((_n_y_b1 < _n_ue_b3)):
		return (_S.index_value(_n_Fl,0) if _S.truth((_n_y_b1 > (_n_ue_b3 - 1.2))) else _n_tone_b5)
	if _S.truth((_n_y_b1 > _n_de_b4)):
		return (_S.index_value(_n_Fl,0) if _S.truth((_n_y_b1 < (_n_de_b4 + 1.1))) else (_S.index_value(_n_Fl,3) if _S.truth(_S.binary("===",_n_tone_b5,_S.index_value(_n_Fl,4))) else _n_tone_b5))
	return 0
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "Fl", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "flesh"), 5]))
	_S.define(_e, "I", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "iris"), 5]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "at"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "hover")]))
	_S.define(_e, "ng", _S.invoke(_S.read(_e, "NERVE"), "clear", []))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "s", 0)
	while _S.truth(_S.binary("<=", _S.read(_v12, "s"), 20)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "B", _S.call_value(_S.read(_v13, "at"), [_S.binary("-", _S.read(_v13, "t"), _S.binary("*", _S.read(_v13, "s"), 0.035)), _S.prop(_S.read(_v13, "o"), "hover")]))
		_S.define(_v13, "sw", _S.binary("*", _S.binary("*", 2.6, _S.binary("**", _S.binary("/", _S.read(_v13, "s"), 20), 1.3)), _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v13, "t"), _S.read(_v13, "D")), _S.read(_v13, "TAU")), 2), _S.binary("*", _S.read(_v13, "s"), 0.16))])))
		_S.define(_v13, "r", _S.call_value(_S.read(_v13, "lerp"), [2, 0.6, _S.binary("/", _S.read(_v13, "s"), 20)]))
		_S.define(_v13, "cx", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v13, "B"), "x"), 1), _S.read(_v13, "sw")))
		_S.define(_v13, "cy", _S.binary("+", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v13, "B"), "y"), _S.read(_v13, "R")), 2), _S.read(_v13, "s")))
		_S.invoke(_S.read(_v13, "ng"), "shade", [_S.binary("-", _S.binary("-", _S.read(_v13, "cx"), _S.read(_v13, "r")), 1), _S.binary("-", _S.read(_v13, "cy"), 1), _S.binary("+", _S.binary("+", _S.read(_v13, "cx"), _S.read(_v13, "r")), 1), _S.binary("+", _S.read(_v13, "cy"), 1), _S.function_value(_v13, "_f11")])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "s", 0.5, "+=", false)
	_S.invoke(_S.read(_e, "ng"), "outline", [_S.prop(_S.read(_e, "Fl"), 0)])
	_S.invoke(_S.read(_e, "ng"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "eye"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "Fl"), _S.read(_e, "I"), _S.read(_e, "t"), _S.prop(_S.read(_e, "o"), "seed")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, _S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y")])
	var _v14 = _S.call_value(_S.read(_e, "look"), [_S.read(_e, "t")])
	_S.define(_e, "lx", _S.prop(_v14, 0))
	_S.define(_e, "ly", _S.prop(_v14, 1))
	_S.define(_e, "snap", _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.read(_e, "LOOKS"), "map", [_S.function_value(_e, "_f12")]))])))
	_S.define(_e, "open", _S.binary("-", 1, _S.call_value(_S.read(_e, "lid"), [_S.read(_e, "t")])))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_e, "S"), "x"), _S.read(_e, "lx")), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.read(_e, "ly")), 15, _S.prop(_S.read(_e, "I"), 3), _S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.3, _S.read(_e, "snap"))), _S.read(_e, "open"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_e, "S"), "x"), _S.read(_e, "lx")), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.read(_e, "ly")), 5, _S.prop(_S.read(_e, "I"), 4), _S.binary("*", 0.4, _S.read(_e, "open"))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y"), 50, _S.prop(_S.read(_e, "I"), 1), 0.3])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 8)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "sp", _S.binary("*", (1 if _S.truth(_S.binary("%", _S.read(_v17, "i"), 2)) else _S.unary("-", 1)), (1 if _S.truth(_S.binary("%", _S.read(_v17, "i"), 3)) else 2)))
		_S.define(_v17, "a0", _S.binary("/", _S.binary("*", _S.read(_v17, "i"), _S.read(_v17, "TAU")), 8))
		_S.define(_v17, "rr", _S.binary("+", 19, _S.binary("*", _S.binary("%", _S.read(_v17, "i"), 3), 2)))
		_S.define(_v17, "prev", null)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "k", 5)
		while _S.truth(_S.binary(">=", _S.read(_v18, "k"), 0)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v19, "t"), _S.read(_v19, "D")), _S.read(_v19, "TAU")), _S.read(_v19, "sp")), _S.read(_v19, "a0")), _S.binary("*", _S.binary("*", _S.read(_v19, "sp"), _S.read(_v19, "k")), 0.035)))
			_S.define(_v19, "z", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]))
			_S.define(_v19, "x", _S.binary("+", _S.prop(_S.read(_v19, "S"), "x"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "rr"))))
			_S.define(_v19, "y", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v19, "S"), "y"), _S.binary("*", _S.read(_v19, "z"), 5)), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), 3)))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v19, "z"), 0), func(): return _S.binary("<", _S.invoke(_S.read(_v19, "Math"), "hypot", [_S.binary("-", _S.read(_v19, "x"), _S.prop(_S.read(_v19, "S"), "x")), _S.binary("-", _S.read(_v19, "y"), _S.prop(_S.read(_v19, "S"), "y"))]), _S.binary("+", _S.read(_v19, "R"), 1)))):
				var _v20 = _S.scope(_v19)
				_S.write(_v20, "prev", null, "=", false)
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "k", 1, "-=", true)
				continue
			if _S.truth(_S.logical("&&", _S.read(_v19, "prev"), func(): return _S.binary(">", _S.read(_v19, "k"), 0))):
				_S.invoke(_S.read(_v19, "p"), "line", [_S.prop(_S.read(_v19, "prev"), 0), _S.prop(_S.read(_v19, "prev"), 1), _S.read(_v19, "x"), _S.read(_v19, "y"), _S.prop(_S.read(_v19, "I"), 2), _S.binary("+", 0.4, _S.binary("*", _S.binary("-", 5, _S.read(_v19, "k")), 0.12))])
			if _S.truth(_S.binary("===", _S.read(_v19, "k"), 0)):
				_S.last([_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "x"), _S.read(_v19, "y"), (_S.prop(_S.read(_v19, "I"), 4) if _S.truth(_S.binary(">", _S.read(_v19, "z"), 0)) else _S.prop(_S.read(_v19, "I"), 3))]), _S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.read(_v19, "y"), 5, _S.prop(_S.read(_v19, "I"), 3), 0.45])])
			_S.write(_v19, "prev", [_S.read(_v19, "x"), _S.read(_v19, "y")], "=", false)
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "k", 1, "-=", true)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_r = _S.read(_parent,"r")
	var _n_cy = _S.read(_parent,"cy")
	var _n_Fl = _S.read(_parent,"Fl")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_v_b2 = (float((_n_x_b0 - _n_cx))/maxf(0.6,_n_r))
	if _S.truth(_S.logical("||",(absf(_n_v_b2) > 1),func():return (absf((_n_y_b1 - _n_cy)) > 0.5))):
		return 0
	return (_S.index_value(_n_Fl,4) if _S.truth((_n_v_b2 < (-0.35))) else (_S.index_value(_n_Fl,3) if _S.truth((_n_v_b2 < 0.4)) else _S.index_value(_n_Fl,2)))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _tuple_0 = _S.arg(_args,0)
	var _n_t0_b0 = _S.prop(_tuple_0,0)
	return maxf(0,(1 - (float(absf((_S.call_value(_n_wrap,[((_n_t - _n_t0_b0) + (float(_n_D)/2)), _n_D]) - (float(_n_D)/2))))/0.2)))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_hex = _S.read(_parent,"hex")
	var _n_shadow = _S.read(_parent,"shadow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_I_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"iris"),5)
	var _n_S_b5 = _S.call_value(_n_at,[_n_t_b3, _S.named_value(_n_o_b2,"hover")])
	_S.call_value(_n_shadow,[_n_p_b0, _S.named_value(_n_S_b5,"x"), 0, 10, 1.5, _S.call_value(_n_hex,["#0d0a12"]), 0.5])
	if true:
		var _n_x_b6 = (-26)
		while _S.truth((_n_x_b6 <= 26)):
			_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_S_b5,"x") + _n_x_b6), (-1), 18, _S.index_value(_n_I_b4,2), (0.15 * (1 - (float(absf(_n_x_b6))/34)))])
			_n_x_b6 += 6
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	return (sin((PI * (float((_n_t_b0 - 1.74))/0.18))) if _S.truth(((_n_t_b0 < 1.92) if _S.truth((_n_t_b0 > 1.74)) else (_n_t_b0 > 1.74))) else 0)
	return null
