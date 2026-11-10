@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/snow.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"weather_snow_haze_pixel"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "pass", _S.import_value("fx/weather/_lib.js", "pass"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "layer", _S.function_value(_e, "_f3"))
	_S.define(_e, "crystal", _S.function_value(_e, "_f7"))
	_S.define(_e, "drift", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Snow"}, {"desc": "Snow at three depths in a gusty breeze: far specks, drifting flakes, big near crystals that spin and glow; they settle on a sparkling drift and melt away."}, {"tags": ["weather", "snow", "winter", "cold", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0c1020", "#161d36", "#24304f", "#3a4a72", "#5f74a3", "#93abd6", "#cfe0fa", "#ffffff"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "bank", _S.function_value(_e, "_f10"))
	_S.define(_e, "gust", _S.function_value(_e, "_f11"))
	_S.define(_e, "LAYERS", [_S.merge([{"n": 230}, {"m": [1, 2]}, {"air": 1}, {"sway": [1, 3]}, {"wind": 3}, {"gust": 0.4}]), _S.merge([{"n": 140}, {"m": [2, 3]}, {"air": 0.8}, {"sway": [3, 7]}, {"wind": 6}, {"gust": 0.7}]), _S.merge([{"n": 24}, {"m": [2, 3]}, {"air": 0.74}, {"sway": [8, 15]}, {"wind": 9}, {"gust": 1}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "AXIS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_S.define(_e, "DIAG", [[1, 1], [_S.unary("-", 1), _S.unary("-", 1)], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1]])
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_pass = _S.read(_parent,"pass")
	var _n_layer = _S.read(_parent,"layer")
	var _n_drift = _S.read(_parent,"drift")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_haze_b6 = _S.ColorFX.mix(_S.index_value(_n_C_b5,1),_S.index_value(_n_C_b5,2),0.4)
	_S.call_value(_n_pass,[_n_p_b0, _n_meta, (-170), 9, _S.function_value(_S.capture(_parent,{"haze":_n_haze_b6,"this":_this}),"_f1")])
	_S.call_value(_n_layer,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 0])
	_S.call_value(_n_drift,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5])
	_S.call_value(_n_layer,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 1])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_haze = _S.read(_parent,"haze")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	_S.set_prop(_n_out_b2,"c",_n_haze,"=")
	_S.set_prop(_n_out_b2,"a",(0.26 + (0.22 * _S.MathFX.smooth((-170),0,_n_y_b1))),"=")
	_S.set_prop(_n_out_b2,"b",1,"=")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_layer = _S.read(_parent,"layer")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_layer,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, 2])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_Ly_b5 = _S.index_value(_n_LAYERS,_n_L_b4)
	var _n_sd_b6 = ((_n_S_b2 * 13) + _n_L_b4)
	_S.call_value(_n_trips,[_n_t_b1, _n_D, _S.named_value(_n_Ly_b5,"n"), _n_sd_b6, _S.index_value(_S.named_value(_n_Ly_b5,"m"),0), _S.index_value(_S.named_value(_n_Ly_b5,"m"),1), _S.function_value(_S.capture(_parent,{"sd":_n_sd_b6,"Ly":_n_Ly_b5,"t":_n_t_b1,"L":_n_L_b4,"q":_n_q_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_D = _S.read(_parent,"D")
	var _n_this = _S.read(_parent,"this")
	var _n_Ly = _S.read(_parent,"Ly")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bank = _S.read(_parent,"bank")
	var _n_L = _S.read(_parent,"L")
	var _n_q = _S.read(_parent,"q")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_crystal = _S.read(_parent,"crystal")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_dur_b5 = (float(_n_D)/_n_m_b2)
	var _n_R_b6 = _S.function_value(_S.capture(_parent,{"i":_n_i_b3,"j":_n_j_b4,"this":_n_this}),"_f5")
	var _n_tf_b7 = (_n_dur_b5 * _S.named_value(_n_Ly,"air"))
	var _n_age_b8 = minf((_n_u_b0 * _n_dur_b5),_n_tf_b7)
	var _n_sw_b9 = (_S.index_value(_S.named_value(_n_Ly,"sway"),0) + (_S.call_value(_n_R_b6,[3]) * (_S.index_value(_S.named_value(_n_Ly,"sway"),1) - _S.index_value(_S.named_value(_n_Ly,"sway"),0))))
	var _n_f_b10 = (0.25 + (_S.call_value(_n_R_b6,[4]) * 0.35))
	var _n_ph_b11 = (_S.call_value(_n_R_b6,[5]) * _n_TAU)
	var _n_xAt_b12 = _S.function_value(_S.capture(_parent,{"R":_n_R_b6,"u":_n_u_b0,"dur":_n_dur_b5,"sw":_n_sw_b9,"f":_n_f_b10,"ph":_n_ph_b11,"this":_n_this}),"_f6")
	var _n_x_b13 = _S.call_value(_n_xAt_b12,[_n_age_b8])
	var _n_xl_b14 = _S.call_value(_n_xAt_b12,[_n_tf_b7])
	var _n_y0_b15 = (-176)
	var _n_y1_b16 = ((_S.call_value(_n_bank,[_n_xl_b14]) - 0.5) if _S.truth(_n_L) else ((-110) + (_S.call_value(_n_R_b6,[1]) * 106)))
	var _n_y_b17 = (_n_y0_b15 + ((_n_y1_b16 - _n_y0_b15) * (float(_n_age_b8)/_n_tf_b7)))
	var _n_rest_b18 = ((_n_u_b0 * _n_dur_b5) - _n_tf_b7)
	if _S.truth(_S.binary("===",_n_L,0)):
		var _n_a_b22 = minf(1,((1 - _n_u_b0) * 6))
		_S.invoke(_n_q,"dot",[_n_x_b13, _n_y_b17, (_S.index_value(_n_C,4) if _S.truth((_S.call_value(_n_R_b6,[6]) < 0.5)) else _S.index_value(_n_C,5)), _n_a_b22])
		return null
	var _n_fade_b19 = ((1 - (float(_n_rest_b18)/(_n_dur_b5 - _n_tf_b7))) if _S.truth((_n_rest_b18 > 0)) else 1)
	if _S.truth(_S.binary("===",_n_L,1)):
		var _n_big_b23 = (_S.call_value(_n_R_b6,[6]) < 0.3)
		if _S.truth((_n_rest_b18 > 0)):
			_S.invoke(_n_q,"dot",[_n_xl_b14, _n_y1_b16, _S.index_value(_n_C,7), (_n_fade_b19 * 0.9)])
			return null
		_S.invoke(_n_q,"px",[_n_x_b13, _n_y_b17, (_n_WHITE if _S.truth(_n_big_b23) else _S.index_value(_n_C,7))])
		if _S.truth(_n_big_b23):
			for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
				var _tuple_1 = _iter_0
				var _n_dx_b24 = _S.prop(_tuple_1,0)
				var _n_dy_b25 = _S.prop(_tuple_1,1)
				_S.invoke(_n_q,"px",[(_n_x_b13 + _n_dx_b24), (_n_y_b17 + _n_dy_b25), _S.index_value(_n_C,5)])
		else:
			_S.invoke(_n_q,"px",[(_n_x_b13 + 1), _n_y_b17, _S.index_value(_n_C,6)])
			_S.invoke(_n_q,"px",[_n_x_b13, (_n_y_b17 + 1), _S.index_value(_n_C,6)])
			_S.invoke(_n_q,"px",[(_n_x_b13 + 1), (_n_y_b17 + 1), _S.index_value(_n_C,5)])
		return null
	var _n_r_b20 = (3 if _S.truth((_S.call_value(_n_R_b6,[6]) < 0.4)) else (4 if _S.truth((_S.call_value(_n_R_b6,[6]) < 0.8)) else 5))
	var _n_spin_b21 = (1.5 + (_S.call_value(_n_R_b6,[7]) * 2.5))
	if _S.truth((_n_rest_b18 > 0)):
		_S.invoke(_n_q,"dot",[(_n_xl_b14 - 1), _n_y1_b16, _S.index_value(_n_C,6), _n_fade_b19])
		_S.invoke(_n_q,"dot",[_n_xl_b14, _n_y1_b16, _n_WHITE, _n_fade_b19])
		_S.invoke(_n_q,"dot",[(_n_xl_b14 + 1), _n_y1_b16, _S.index_value(_n_C,6), _n_fade_b19])
		_S.invoke(_n_q,"glow",[_n_xl_b14, _n_y1_b16, 5, _S.index_value(_n_C,5), (0.25 * _n_fade_b19)])
		return null
	_S.call_value(_n_crystal,[_n_q, _n_x_b13, _n_y_b17, _n_r_b20, fmod(floori(((_n_age_b8 * _n_spin_b21) + (_S.call_value(_n_R_b6,[8]) * 2))),2), _n_C])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_sd = _S.read(_parent,"sd")
	var _n_i = _S.read(_parent,"i")
	var _n_j = _S.read(_parent,"j")
	var _n_n_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([_n_sd,_n_i,_n_j,_n_n_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_Ly = _S.read(_parent,"Ly")
	var _n_gust = _S.read(_parent,"gust")
	var _n_t = _S.read(_parent,"t")
	var _n_u = _S.read(_parent,"u")
	var _n_dur = _S.read(_parent,"dur")
	var _n_sw = _S.read(_parent,"sw")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_f = _S.read(_parent,"f")
	var _n_ph = _S.read(_parent,"ph")
	var _n_a_b0 = _S.arg(_args,0)
	return (((((-175) + (_S.call_value(_n_R,[2]) * 350)) + (_S.named_value(_n_Ly,"wind") * _n_a_b0)) + ((_S.call_value(_n_gust,[((_n_t - (_n_u * _n_dur)) + _n_a_b0)]) - _S.call_value(_n_gust,[(_n_t - (_n_u * _n_dur))])) * _S.named_value(_n_Ly,"gust"))) + (_n_sw * sin((((_n_TAU * _n_f) * _n_a_b0) + _n_ph))))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_DIAG = _S.read(_parent,"DIAG")
	var _n_AXIS = _S.read(_parent,"AXIS")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_turn_b4 = _S.arg(_args,4)
	var _n_C_b5 = _S.arg(_args,5)
	var _n_X_b6 = floori(_n_x_b1+0.5)
	var _n_Y_b7 = floori(_n_y_b2+0.5)
	var _n_long_b8 = (_n_DIAG if _S.truth(_n_turn_b4) else _n_AXIS)
	var _n_short_b9 = (_n_AXIS if _S.truth(_n_turn_b4) else _n_DIAG)
	var _n_R_b10 = ((_n_r_b3 - 1) if _S.truth(_n_turn_b4) else _n_r_b3)
	for _iter_0 in _S.array(_n_long_b8):
		var _tuple_1 = _iter_0
		var _n_dx_b11 = _S.prop(_tuple_1,0)
		var _n_dy_b12 = _S.prop(_tuple_1,1)
		if true:
			var _n_d_b14 = 1
			while _S.truth((_n_d_b14 <= _n_R_b10)):
				_S.invoke(_n_q_b0,"px",[(_n_X_b6 + (_n_dx_b11 * _n_d_b14)), (_n_Y_b7 + (_n_dy_b12 * _n_d_b14)), (_n_WHITE if _S.truth(_S.binary("===",_n_d_b14,_n_R_b10)) else _S.index_value(_n_C_b5,6))])
				_n_d_b14 += 1.0
		var _n_nubs_b13 = (([(_n_R_b10 - 1)] if _S.truth((_n_R_b10 >= 3)) else []) if _S.truth(_n_turn_b4) else ([(_n_R_b10 - 1), (_n_R_b10 - 2)] if _S.truth((_n_R_b10 >= 5)) else ([(_n_R_b10 - 1)] if _S.truth((_n_R_b10 >= 4)) else [])))
		for _iter_2 in _S.array(_n_nubs_b13):
			var _n_n_b15 = _iter_2
			var _n_ox_b16 = (_n_dx_b11 if _S.truth(_n_turn_b4) else _n_dy_b12)
			var _n_oy_b17 = ((-_n_dy_b12) if _S.truth(_n_turn_b4) else (-_n_dx_b11))
			_S.invoke(_n_q_b0,"px",[((_n_X_b6 + (_n_dx_b11 * _n_n_b15)) + (0 if _S.truth(_n_turn_b4) else _n_ox_b16)), ((_n_Y_b7 + (_n_dy_b12 * _n_n_b15)) + (_n_oy_b17 if _S.truth(_n_turn_b4) else _n_oy_b17)), _S.index_value(_n_C_b5,4)])
			_S.invoke(_n_q_b0,"px",[(((_n_X_b6 + (_n_dx_b11 * _n_n_b15)) + ((-_n_dx_b11) if _S.truth(_n_turn_b4) else (-_n_ox_b16))) + (_n_dx_b11 if _S.truth(_n_turn_b4) else 0)), ((_n_Y_b7 + (_n_dy_b12 * _n_n_b15)) + ((_n_dy_b12 * 0) if _S.truth(_n_turn_b4) else (-_n_oy_b17))), _S.index_value(_n_C_b5,4)])
	for _iter_3 in _S.array(_n_short_b9):
		var _tuple_4 = _iter_3
		var _n_dx_b18 = _S.prop(_tuple_4,0)
		var _n_dy_b19 = _S.prop(_tuple_4,1)
		if true:
			var _n_d_b20 = 1
			while _S.truth((_n_d_b20 <= (1 if _S.truth(_n_turn_b4) else maxf(1,floori((float(_n_R_b10)/2)))))):
				_S.invoke(_n_q_b0,"px",[(_n_X_b6 + (_n_dx_b18 * _n_d_b20)), (_n_Y_b7 + (_n_dy_b19 * _n_d_b20)), (_S.index_value(_n_C_b5,6) if _S.truth(_S.binary("===",_n_d_b20,1)) else _S.index_value(_n_C_b5,5))])
				_n_d_b20 += 1.0
	_S.invoke(_n_q_b0,"px",[_n_X_b6, _n_Y_b7, _n_WHITE])
	_S.invoke(_n_q_b0,"glow",[(_n_X_b6 + 0.5), (_n_Y_b7 + 0.5), ((_n_r_b3 * 2.5) + 5), _S.index_value(_n_C_b5,5), 0.13])
	_S.invoke(_n_q_b0,"light",[_n_X_b6, _n_Y_b7, _S.index_value(_n_C_b5,6), 0.4])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pass = _S.read(_parent,"pass")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_bank = _S.read(_parent,"bank")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	_S.call_value(_n_pass,[_n_q_b0, _n_meta, (-7), 9, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f9")])
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 18)):
			var _n_x_b5 = ((-156) + (_S.MathFX.rand([_n_S_b2,_n_i_b4,81]) * 312))
			var _n_c_b6 = (1 + floori((_S.MathFX.rand([_n_S_b2,_n_i_b4,82]) * 3)))
			var _n_tw_b7 = sin(((float(((_n_TAU * _n_c_b6) * _n_t_b1))/_n_D) + (_S.MathFX.rand([_n_S_b2,_n_i_b4,83]) * _n_TAU)))
			if _S.truth((_n_tw_b7 < 0.55)):
				_n_i_b4 += 1.0
				continue
			var _n_y_b8 = (ceili(_S.call_value(_n_bank,[_n_x_b5])) + floori((_S.MathFX.rand([_n_S_b2,_n_i_b4,84]) * 3)))
			var _n_k_b9 = (float((_n_tw_b7 - 0.55))/0.45)
			_S.invoke(_n_q_b0,"px",[_n_x_b5, _n_y_b8, _n_WHITE])
			if _S.truth((_n_k_b9 > 0.5)):
				for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, (-1)]]):
					var _tuple_1 = _iter_0
					var _n_dx_b10 = _S.prop(_tuple_1,0)
					var _n_dy_b11 = _S.prop(_tuple_1,1)
					_S.invoke(_n_q_b0,"px",[(_n_x_b5 + _n_dx_b10), (_n_y_b8 + _n_dy_b11), _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_q_b0,"glow",[(_n_x_b5 + 0.5), (_n_y_b8 + 0.5), 6, _S.index_value(_n_C_b3,6), (0.35 * _n_k_b9)])
			_n_i_b4 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_bank = _S.read(_parent,"bank")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_top_b3 = _S.call_value(_n_bank,[_n_x_b0])
	var _n_d_b4 = (_n_y_b1 - _n_top_b3)
	if _S.truth((_n_d_b4 < 0)):
		return null
	_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_d_b4 < 1)) else (_S.index_value(_n_C,7) if _S.truth((_n_d_b4 < 2)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b4 < 3.5)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b4 < 6)) else _S.index_value(_n_C,4))))),"=")
	if _S.truth((_n_d_b4 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_C,6),"=")
		_S.set_prop(_n_out_b2,"k",0.12,"=")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return ((((-3) + (1.6 * sin(((_n_x_b0 * 0.045) + 1.3)))) + (1.1 * sin(((_n_x_b0 * 0.12) + 0.4)))) + (0.6 * sin(((_n_x_b0 * 0.31) + 2))))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	return ((10 * sin(((float((_n_TAU * _n_t_b0))/_n_D) + 0.6))) + (4 * sin(((float(((_n_TAU * 2) * _n_t_b0))/_n_D) + 2.1))))
	return null
