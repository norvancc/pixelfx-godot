@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/storm.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f10":"weather_storm_veil_pixel","_f11":"weather_storm_deck"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "pass", _S.import_value("fx/weather/_lib.js", "pass"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "trips", _S.import_value("fx/weather/_lib.js", "trips"))
	_S.define(_e, "tree", _S.import_value("fx/weather/_lib.js", "tree"))
	_S.define(_e, "wave", _S.import_value("fx/weather/_lib.js", "wave"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "splash", _S.import_value("fx/weather/_lib.js", "splash"))
	_S.define(_e, "sheetAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "sky", _S.function_value(_e, "_f5"))
	_S.define(_e, "rolls", _S.function_value(_e, "_f7"))
	_S.define(_e, "veil", _S.function_value(_e, "_f9"))
	_S.define(_e, "deck", _S.function_value(_e, "_f11"))
	_S.define(_e, "rain", _S.function_value(_e, "_f12"))
	_S.define(_e, "channel", _S.function_value(_e, "_f16"))
	_S.define(_e, "bolt", _S.function_value(_e, "_f18"))
	_S.define(_e, "crawler", _S.function_value(_e, "_f20"))
	_S.define(_e, "stroke", _S.function_value(_e, "_f21"))
	_S.define(_e, "strike", _S.function_value(_e, "_f22"))
	_S.define(_e, "floor", _S.function_value(_e, "_f25"))
	_S.define(_e, "meta", _S.merge([{"name": "Storm"}, {"desc": "Driving rain at two depths under a churning cloud deck; a forked bolt strikes in a double flash that lights the sky and the rain, then sheet lightning glows in the clouds."}, {"tags": ["weather", "storm", "rain", "lightning", "thunder", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#09080f", "#121120", "#1b1a30", "#262541", "#363a5c", "#4f5d8c", "#7790c6", "#c2d6ff"]}, {"bolt": ["#2a1a6e", "#4835c2", "#6a6cff", "#78b8ff", "#c6ebff", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "SLANT", 0.42)
	_S.define(_e, "T_LEAD", 2.62)
	_S.define(_e, "T1", 3)
	_S.define(_e, "T2", 3.3)
	_S.define(_e, "T_SHEET", 6.4)
	_S.define(_e, "T_FAR", 8.6)
	_S.define(_e, "BX0", 62)
	_S.define(_e, "BY0", _S.unary("-", 136))
	_S.define(_e, "BX1", 52)
	_S.define(_e, "BY1", 3)
	_S.define(_e, "F1", [1, 0.62, 0.95, 0.4, 0.7, 0.22])
	_S.define(_e, "F2", [0.92, 0.5, 0.8, 0.3, 0.12])
	_S.define(_e, "env", _S.function_value(_e, "_f29"))
	_S.define(_e, "flashAt", _S.function_value(_e, "_f30"))
	_S.define(_e, "blink", _S.function_value(_e, "_f31"))
	_S.define(_e, "farAt", _S.function_value(_e, "_f32"))
	_S.define(_e, "far2At", _S.function_value(_e, "_f33"))
	_S.define(_e, "snap", _S.function_value(_e, "_f34"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_S.define(_e, "ROWS", [_S.merge([{"base": _S.unary("-", 161)}, {"wob": 3}, {"n": 18}, {"rx": [16, 30]}, {"ry": 0.8}, {"drift": 15}, {"life": [4, 7]}, {"tone": [1, 2, 3, 4]}, {"tex": 1}]), _S.merge([{"base": _S.unary("-", 150)}, {"wob": 3}, {"n": 22}, {"rx": [10, 20]}, {"ry": 0.85}, {"drift": 10}, {"life": [3.5, 6.5]}, {"tone": [1, 2, 3, 5]}, {"tex": 1}]), _S.merge([{"base": _S.unary("-", 140)}, {"wob": 3}, {"n": 26}, {"rx": [7, 14]}, {"ry": 0.9}, {"drift": 6}, {"life": [3, 6]}, {"tone": [2, 2, 3, 5]}, {"tex": 0}, {"haze": true}])])
	_S.define(_e, "sag", _S.function_value(_e, "_f35"))
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_T_SHEET = _S.read(_parent,"T_SHEET")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = (_n_t_b0 - _n_T_SHEET)
	if _S.truth(((_n_a_b1 < 0) if _S.truth((_n_a_b1 < 0)) else (_n_a_b1 > 0.9))):
		return 0
	var _n_p1_b2 = exp((-pow((float((_n_a_b1 - 0.08))/0.05),2)))
	var _n_p2_b3 = exp((-pow((float((_n_a_b1 - 0.3))/0.09),2)))
	var _n_tail_b4 = ((exp(((-(_n_a_b1 - 0.3)) * 6)) * 0.5) if _S.truth((_n_a_b1 > 0.3)) else 0)
	return (minf(1,(((0.7 * _n_p1_b2) + _n_p2_b3) + _n_tail_b4)) * (0.75 if _S.truth(_S.binary("===",fmod(floori((_n_a_b1 * 30)),3),1)) else 1))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_snap = _S.read(_parent,"snap")
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_box = _S.read(_parent,"box")
	var _n_flashAt = _S.read(_parent,"flashAt")
	var _n_sheetAt = _S.read(_parent,"sheetAt")
	var _n_farAt = _S.read(_parent,"farAt")
	var _n_T_LEAD = _S.read(_parent,"T_LEAD")
	var _n_T1 = _S.read(_parent,"T1")
	var _n_BX0 = _S.read(_parent,"BX0")
	var _n_BY0 = _S.read(_parent,"BY0")
	var _n_far2At = _S.read(_parent,"far2At")
	var _n_sky = _S.read(_parent,"sky")
	var _n_pass = _S.read(_parent,"pass")
	var _n_veil = _S.read(_parent,"veil")
	var _n_rain = _S.read(_parent,"rain")
	var _n_T2 = _S.read(_parent,"T2")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_deck = _S.read(_parent,"deck")
	var _n_crawler = _S.read(_parent,"crawler")
	var _n_floor = _S.read(_parent,"floor")
	var _n_strike = _S.read(_parent,"strike")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_n_t_b1 = _S.call_value(_n_snap,[_n_t_b1])
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_B_b4 = _S.call_value(_n_box,[_n_meta])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_V_b7 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"bolt"),6)
	var _n_f_b8 = _S.call_value(_n_flashAt,[_n_t_b1])
	var _n_sh_b9 = _S.call_value(_n_sheetAt,[_n_t_b1])
	var _n_far_b10 = _S.call_value(_n_farAt,[_n_t_b1])
	var _n_lead_b11 = ((0.25 + (0.2 * sin((_n_t_b1 * 70)))) if _S.truth(((_n_t_b1 < _n_T1) if _S.truth((_n_t_b1 > _n_T_LEAD)) else (_n_t_b1 > _n_T_LEAD))) else 0)
	var _n_pre_b12 = ((0.12 * maxf(0,sin(((_n_t_b1 - _n_T_LEAD) * 41)))) if _S.truth(((_n_t_b1 < _n_T_LEAD) if _S.truth((_n_t_b1 > (_n_T_LEAD - 0.5))) else (_n_t_b1 > (_n_T_LEAD - 0.5)))) else 0)
	var _n_srcs_b13 = []
	if _S.truth((((_n_f_b8 + _n_lead_b11) + _n_pre_b12) > 0)):
		_S.invoke(_n_srcs_b13,"push",[[_n_BX0, (_n_BY0 - 6), 150, ((_n_f_b8 + (_n_lead_b11 * 0.5)) + _n_pre_b12)]])
	if _S.truth((_n_sh_b9 > 0)):
		_S.invoke(_n_srcs_b13,"push",[[(-96), (-146), 120, _n_sh_b9]])
	if _S.truth((_n_far_b10 > 0)):
		_S.invoke(_n_srcs_b13,"push",[[128, (-156), 80, _n_far_b10]])
	if _S.truth((_S.call_value(_n_far2At,[_n_t_b1]) > 0)):
		_S.invoke(_n_srcs_b13,"push",[[(-40), (-160), 70, _S.call_value(_n_far2At,[_n_t_b1])]])
	var _n_litAt_b14 = _S.function_value(_S.capture(_parent,{"srcs":_n_srcs_b13,"this":_this}),"_f2")
	_S.call_value(_n_sky,[_n_p_b0, _n_t_b1, _n_f_b8, _n_V_b7])
	if _S.truth((_n_sh_b9 > 0.05)):
		_S.call_value(_n_pass,[_n_p_b0, _n_meta, (-170), 0, _S.function_value(_S.capture(_parent,{"V":_n_V_b7,"sh":_n_sh_b9,"this":_this}),"_f3")])
	_S.call_value(_n_veil,[_n_p_b0, _n_t_b1, _n_S_b5, _n_C_b6, _n_V_b7, _n_f_b8])
	_S.call_value(_n_rain,[_n_q_b3, _n_t_b1, _n_S_b5, _n_C_b6, _n_V_b7, _n_f_b8, 0])
	if _S.truth(((_n_t_b1 < (_n_T2 + 0.7)) if _S.truth((_n_t_b1 > _n_T_LEAD)) else (_n_t_b1 > _n_T_LEAD))):
		_S.call_value(_n_bolt,[_n_q_b3, _n_t_b1, _n_S_b5, _n_V_b7])
	_S.call_value(_n_deck,[_n_q_b3, _n_B_b4, _n_t_b1, _n_S_b5, _n_C_b6, _n_V_b7, _n_litAt_b14, (_S.prop(_n_srcs_b13,"length") > 0)])
	_S.call_value(_n_crawler,[_n_q_b3, _n_t_b1, _n_S_b5, _n_V_b7])
	_S.call_value(_n_floor,[_n_q_b3, _n_B_b4, _n_t_b1, _n_S_b5, _n_C_b6, _n_V_b7, _n_f_b8])
	_S.call_value(_n_strike,[_n_q_b3, _n_t_b1, _n_S_b5, _n_C_b6, _n_V_b7])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_srcs = _S.read(_parent,"srcs")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_L_b2 = 0
	for _iter_0 in _S.array(_n_srcs):
		var _tuple_1 = _iter_0
		var _n_sx_b3 = _S.prop(_tuple_1,0)
		var _n_sy_b4 = _S.prop(_tuple_1,1)
		var _n_R_b5 = _S.prop(_tuple_1,2)
		var _n_k_b6 = _S.prop(_tuple_1,3)
		var _n_d_b7 = (float(_S.Bridge.hypot([(_n_x_b0 - _n_sx_b3), ((_n_y_b1 - _n_sy_b4) * 1.5)]))/_n_R_b5)
		if _S.truth((_n_d_b7 < 1)):
			_n_L_b2 += ((_n_k_b6 * (1 - _n_d_b7)) * (1 - _n_d_b7))
	return minf(1,_n_L_b2)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_V = _S.read(_parent,"V")
	var _n_sh = _S.read(_parent,"sh")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = (float(_S.Bridge.hypot([(_n_x_b0 + 96), ((_n_y_b1 + 150) * 1.3)]))/170)
	if _S.truth((_n_d_b3 < 1)):
		_S.set_prop(_n_out_b2,"l",_S.index_value(_n_V,2),"=")
		_S.set_prop(_n_out_b2,"k",(((_n_sh * 0.3) * (1 - _n_d_b3)) * (1 - _n_d_b3)),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_snap = _S.read(_parent,"snap")
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_flashAt = _S.read(_parent,"flashAt")
	var _n_rain = _S.read(_parent,"rain")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	_n_t_b1 = _S.call_value(_n_snap,[_n_t_b1])
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_V_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"bolt"),6)
	var _n_f_b7 = _S.call_value(_n_flashAt,[_n_t_b1])
	_S.call_value(_n_rain,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, _n_V_b6, _n_f_b7, 1])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pass = _S.read(_parent,"pass")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_f_b2 = _S.arg(_args,2)
	var _n_V_b3 = _S.arg(_args,3)
	var _n_k_b4 = (_n_f_b2 * 0.36)
	if _S.truth((_n_k_b4 <= 0.01)):
		return null
	var _n_c_b5 = _S.ColorFX.mix(_S.index_value(_n_V_b3,2),_S.index_value(_n_V_b3,3),0.6)
	_S.call_value(_n_pass,[_n_p_b0, _n_meta, (-170), 9, _S.function_value(_S.capture(_parent,{"c":_n_c_b5,"k":_n_k_b4,"this":_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_BX0 = _S.read(_parent,"BX0")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_c = _S.read(_parent,"c")
	var _n_k = _S.read(_parent,"k")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = (float(absf((_n_x_b0 - (float((_n_BX0 + _n_BX1))/2))))/230)
	_S.set_prop(_n_out_b2,"l",_n_c,"=")
	_S.set_prop(_n_out_b2,"k",(_n_k * (0.2 + (0.8 * pow(maxf(0,(1 - _n_d_b3)),2.2)))),"=")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_ROWS = _S.read(_parent,"ROWS")
	var _n_S_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	return _S.invoke(_n_ROWS,"map",[_S.function_value(_S.capture(_parent,{"S":_n_S_b0,"t":_n_t_b1,"this":_this}),"_f8")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_Rw_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	var _n_out_b2 = []
	if true:
		var _n_i_b3 = 0
		while _S.truth((_n_i_b3 < _S.named_value(_n_Rw_b0,"n"))):
			var _n_L_b4 = (_S.index_value(_S.named_value(_n_Rw_b0,"life"),0) + (_S.MathFX.rand([_n_S,_n_j_b1,_n_i_b3,1]) * (_S.index_value(_S.named_value(_n_Rw_b0,"life"),1) - _S.index_value(_S.named_value(_n_Rw_b0,"life"),0))))
			var _n_age_b5 = _S.call_value(_n_wrap,[(_n_t - (_S.MathFX.rand([_n_S,_n_j_b1,_n_i_b3,2]) * _n_D)), _n_D])
			if _S.truth((_n_age_b5 >= _n_L_b4)):
				_n_i_b3 += 1.0
				continue
			var _n_u_b6 = (float(_n_age_b5)/_n_L_b4)
			var _n_g_b7 = pow(sin((PI * _n_u_b6)),0.6)
			var _n_rx_b8 = (_S.index_value(_S.named_value(_n_Rw_b0,"rx"),0) + (_S.MathFX.rand([_n_S,_n_j_b1,_n_i_b3,3]) * (_S.index_value(_S.named_value(_n_Rw_b0,"rx"),1) - _S.index_value(_S.named_value(_n_Rw_b0,"rx"),0))))
			var _n_ry_b9 = (_n_rx_b8 * _S.named_value(_n_Rw_b0,"ry"))
			var _n_x_b10 = (((-200) + (_S.MathFX.rand([_n_S,_n_j_b1,_n_i_b3,4]) * 400)) + (_S.named_value(_n_Rw_b0,"drift") * (_n_age_b5 - (float(_n_L_b4)/2))))
			_S.invoke(_n_out_b2,"push",[{"x":_n_x_b10,"h":((_n_ry_b9 * _n_g_b7) * (0.6 + (0.4 * _S.MathFX.rand([_n_S,_n_j_b1,_n_i_b3,5])))),"rx":(_n_rx_b8 * (0.8 + (0.2 * _n_g_b7)))}])
			_n_i_b3 += 1.0
	return _n_out_b2
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_meta = _S.read(_parent,"meta")
	var _n_pass = _S.read(_parent,"pass")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_V_b4 = _S.arg(_args,4)
	var _n_f_b5 = _S.arg(_args,5)
	var _n_F_b6 = _S.call_value(_n_field,[(_n_S_b2 + 11), 256, 128, [4, 8, 16]])
	var _n_shift_b7 = (float(((256 * 2) * _n_t_b1))/_n_D)
	var _n_glow_b8 = _S.ColorFX.mix(_S.index_value(_n_C_b3,3),_S.index_value(_n_V_b4,3),0.5)
	_S.call_value(_n_pass,[_n_p_b0, _n_meta, (-170), (-0.5), _S.function_value(_S.capture(_parent,{"F":_n_F_b6,"shift":_n_shift_b7,"f":_n_f_b5,"C":_n_C_b3,"glow":_n_glow_b8,"this":_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_F = _S.read(_parent,"F")
	var _n_SLANT = _S.read(_parent,"SLANT")
	var _n_shift = _S.read(_parent,"shift")
	var _n_C = _S.read(_parent,"C")
	var _n_glow = _S.read(_parent,"glow")
	var _n_f = _S.read(_parent,"f")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.Accelerators.Weather.sample_at(_n_F,(((_n_x_b0 - (_n_y_b1 * _n_SLANT)) * 1.9) - _n_shift),((_n_y_b1 * 0.16) + 7))
	var _n_dens_b4 = clampf((0.45 + ((_n_n_b3 - 0.5) * 2.6)),0.0,1.0)
	_S.set_prop(_n_out_b2,"c",(_S.ColorFX.mix(_S.index_value(_n_C,1),_n_glow,minf(1,(((_n_f * _n_dens_b4) * 0.7) * maxf(0.25,(1 - (float(absf((_n_x_b0 - _n_BX1)))/220)))))) if _S.truth((_n_f > 0.05)) else _S.index_value(_n_C,1)),"=")
	_S.set_prop(_n_out_b2,"a",(0.4 + (0.38 * _n_dens_b4)),"=")
	_S.set_prop(_n_out_b2,"b",1,"=")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_rolls = _S.read(_parent,"rolls")
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_ROWS = _S.read(_parent,"ROWS")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_sag = _S.read(_parent,"sag")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_V_b5 = _S.arg(_args,5)
	var _n_litAt_b6 = _S.arg(_args,6)
	var _n_lit_b7 = _S.arg(_args,7)
	var _n_R_b8 = _S.call_value(_n_rolls,[_n_S_b3, _n_t_b2])
	var _n_F_b9 = _S.call_value(_n_field,[((_n_S_b3 * 3) + 1), 256, 128])
	var _n_drift_b10 = (float((256 * _n_t_b2))/_n_D)
	var _n_n_b11 = _S.prop(_n_ROWS,"length")
	var _n_mo_b12 = pow(cos((float((PI * _n_t_b2))/_n_D)),2)
	var _n_RAMP_b13 = [_S.index_value(_n_C_b4,0), _S.index_value(_n_C_b4,1), _S.index_value(_n_C_b4,2), _S.index_value(_n_C_b4,3), _S.index_value(_n_C_b4,4), _S.index_value(_n_C_b4,5), _S.index_value(_n_C_b4,6), _S.index_value(_n_V_b5,4), _n_WHITE]
	var _n_top_b14 = _S.construct(_n_Float32Array,[_n_n_b11])
	var _n_bot_b15 = _S.construct(_n_Float32Array,[_n_n_b11])
	var _n_bulge_b16 = _S.construct(_n_Float32Array,[_n_n_b11])
	if true:
		var _n_x_b17 = _S.named_value(_n_B_b1,"x0")
		while _S.truth((_n_x_b17 < _S.named_value(_n_B_b1,"x1"))):
			var _n_cx_b18 = (_n_x_b17 + 0.5)
			var _n_low_b19 = (-170)
			if true:
				var _n_j_b22 = 0
				while _S.truth((_n_j_b22 < _n_n_b11)):
					var _n_Rw_b23 = _S.index_value(_n_ROWS,_n_j_b22)
					var _n_und_b24 = ((((_S.Accelerators.Weather.sample_at(_n_F_b9,((_n_cx_b18 * 0.55) + (_n_j_b22 * 91)),3) * _n_mo_b12) + (_S.Accelerators.Weather.sample_at(_n_F_b9,((_n_cx_b18 * 0.55) + (_n_j_b22 * 91)),60) * (1 - _n_mo_b12))) - 0.5) * 2)
					var _n_c_b25 = (((_S.named_value(_n_Rw_b23,"base") + (_S.call_value(_n_sag,[_n_cx_b18]) * (0.4 + (_n_j_b22 * 0.3)))) + (7 * _n_und_b24)) + ((_S.named_value(_n_Rw_b23,"wob") * 2) * (_S.Accelerators.Weather.sample_at(_n_F_b9,(((_n_cx_b18 * 1.8) + (_n_j_b22 * 61)) - (_n_drift_b10 * (0.5 - (_n_j_b22 * 0.1)))),(20 + (_n_j_b22 * 17))) - 0.5)))
					var _n_bump_b26 = 0
					for _iter_0 in _S.array(_S.index_value(_n_R_b8,_n_j_b22)):
						var _n_b_b28 = _iter_0
						var _n_dx_b29 = (float((_n_cx_b18 - _S.named_value(_n_b_b28,"x")))/_S.named_value(_n_b_b28,"rx"))
						if _S.truth(((_n_dx_b29 * _n_dx_b29) < 1)):
							_n_bump_b26 = maxf(_n_bump_b26,(_S.named_value(_n_b_b28,"h") * sqrt((1 - (_n_dx_b29 * _n_dx_b29)))))
					var _n_y1_b27 = (_n_c_b25 + _n_bump_b26)
					_S.set_prop(_n_top_b14,_n_j_b22,(-999),"=")
					_S.set_prop(_n_bot_b15,_n_j_b22,_n_y1_b27,"=")
					_S.set_prop(_n_bulge_b16,_n_j_b22,_n_bump_b26,"=")
					_n_low_b19 = maxf(_n_low_b19,_n_y1_b27)
					_n_j_b22 += 1.0
			var _n_prev_b20 = (-1)
			var _n_prevBot_b21 = (-999)
			if true:
				var _n_y_b30 = _S.named_value(_n_B_b1,"y0")
				while _S.truth((_n_y_b30 < _n_low_b19)):
					var _n_cy_b31 = (_n_y_b30 + 0.5)
					var _n_j_b32 = 0
					while _S.truth((not _S.truth(((_n_cy_b31 < _S.index_value(_n_bot_b15,_n_j_b32)) if _S.truth((_n_cy_b31 >= _S.index_value(_n_top_b14,_n_j_b32))) else (_n_cy_b31 >= _S.index_value(_n_top_b14,_n_j_b32)))) if _S.truth((_n_j_b32 < _n_n_b11)) else (_n_j_b32 < _n_n_b11))):
						_n_j_b32 += 1.0
					if _S.truth((_n_j_b32 >= _n_n_b11)):
						_n_prev_b20 = (-1)
						_n_y_b30 += 1.0
						continue
					if _S.truth(_S.binary("!==",_n_j_b32,_n_prev_b20)):
						if _S.truth(((_n_prev_b20 < _n_j_b32) if _S.truth((_n_prev_b20 >= 0)) else (_n_prev_b20 >= 0))):
							_n_prevBot_b21 = _n_cy_b31
						_n_prev_b20 = _n_j_b32
					var _n_Rw_b33 = _S.index_value(_n_ROWS,_n_j_b32)
					var _n_d_b34 = (_S.index_value(_n_bot_b15,_n_j_b32) - _n_cy_b31)
					var _n_tone_b35 = _S.named_value(_n_Rw_b33,"tone")
					var _n_th_b36 = ((_S.Painter.BAYER[((floori(_n_y_b30)&3)<<2)|(floori(_n_x_b17)&3)]+0.5)/16.0)
					var _n_i_b37 = null
					if _S.truth((_n_d_b34 < 1)):
						_n_i_b37 = (_S.index_value(_n_tone_b35,3) if _S.truth((_S.index_value(_n_bulge_b16,_n_j_b32) > 3)) else (_S.index_value(_n_tone_b35,3) - 1))
					else:
						if _S.truth(((_n_j_b32 > 0) if _S.truth(((_n_cy_b31 - _n_prevBot_b21) < 1.5)) else ((_n_cy_b31 - _n_prevBot_b21) < 1.5))):
							_n_i_b37 = maxf(0,(_S.index_value(_n_tone_b35,0) - 1))
						else:
							if _S.truth((_n_d_b34 < ((2 + (_S.index_value(_n_bulge_b16,_n_j_b32) * 0.25)) + (_n_th_b36 * 2)))):
								_n_i_b37 = _S.index_value(_n_tone_b35,2)
							else:
								if _S.truth((_n_d_b34 < ((6 + (_S.index_value(_n_bulge_b16,_n_j_b32) * 0.4)) + (_n_th_b36 * 3)))):
									_n_i_b37 = _S.index_value(_n_tone_b35,1)
								else:
									var _n_nn_b39 = _S.Accelerators.Weather.sample_at(_n_F_b9,(((_n_cx_b18 * 0.9) + (_n_j_b32 * 77)) - (_n_drift_b10 * (0.6 - (_n_j_b32 * 0.12)))),((_n_cy_b31 * 1.7) + (_n_j_b32 * 31)))
									_n_i_b37 = (_S.index_value(_n_tone_b35,0) + (1 if _S.truth(((_n_nn_b39 > 0.6) if _S.truth(_S.named_value(_n_Rw_b33,"tex")) else _S.named_value(_n_Rw_b33,"tex"))) else 0))
					var _n_lk_b38 = 0
					if _S.truth(_n_lit_b7):
						var _n_Lv_b40 = _S.call_value(_n_litAt_b6,[_n_cx_b18, _n_cy_b31])
						if _S.truth((_n_Lv_b40 > 0.02)):
							_n_i_b37 = minf(8,(_n_i_b37 + floori((_n_Lv_b40 * (4.4 if _S.truth((_n_d_b34 < 1)) else (3.8 if _S.truth((_n_d_b34 < 4)) else 3.1)))+0.5)))
							_n_lk_b38 = _n_Lv_b40
					if _S.truth(((_n_d_b34 >= 1) if _S.truth((not _S.truth(_n_lk_b38) if _S.truth(_S.named_value(_n_Rw_b33,"haze")) else _S.named_value(_n_Rw_b33,"haze"))) else (not _S.truth(_n_lk_b38) if _S.truth(_S.named_value(_n_Rw_b33,"haze")) else _S.named_value(_n_Rw_b33,"haze")))):
						_S.invoke(_n_q_b0,"blend",[_n_x_b17, _n_y_b30, _S.index_value(_n_RAMP_b13,_n_i_b37), 0.75])
					else:
						_S.invoke(_n_q_b0,"px",[_n_x_b17, _n_y_b30, _S.index_value(_n_RAMP_b13,maxf(0,_n_i_b37))])
					if _S.truth((_n_lk_b38 > 0.03)):
						_S.invoke(_n_q_b0,"light",[_n_x_b17, _n_y_b30, _S.index_value(_n_V_b5,3), (_n_lk_b38 * (0.4 if _S.truth((_n_d_b34 < 3)) else 0.22))])
					_n_y_b30 += 1.0
			_n_x_b17 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_trips = _S.read(_parent,"trips")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_V_b4 = _S.arg(_args,4)
	var _n_f_b5 = _S.arg(_args,5)
	var _n_near_b6 = _S.arg(_args,6)
	var _n_litAt_b7 = _S.function_value(_S.capture(_parent,{"f":_n_f_b5,"this":_this}),"_f13")
	if _S.truth(not _S.truth(_n_near_b6)):
		var _n_BODY_b11 = [_S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,5)]
		var _n_HEAD_b12 = [_S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,6)]
		_S.call_value(_n_trips,[_n_t_b1, _n_D, 300, ((_n_S_b2 * 7) + 1), 22, 28, _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"litAt":_n_litAt_b7,"BODY":_n_BODY_b11,"HEAD":_n_HEAD_b12,"q":_n_q_b0,"this":_this}),"_f14")])
		return null
	var _n_BODY_b8 = [_S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,6), _S.index_value(_n_V_b4,4)]
	var _n_HEAD_b9 = [_S.index_value(_n_C_b3,7), _n_WHITE, _n_WHITE]
	var _n_TAIL_b10 = [_S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,5), _S.index_value(_n_V_b4,3)]
	_S.call_value(_n_trips,[_n_t_b1, _n_D, 84, ((_n_S_b2 * 7) + 2), 30, 38, _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"litAt":_n_litAt_b7,"BODY":_n_BODY_b8,"HEAD":_n_HEAD_b9,"TAIL":_n_TAIL_b10,"q":_n_q_b0,"C":_n_C_b3,"V":_n_V_b4,"this":_this}),"_f15")])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_L_b1 = (_n_f * (0.3 + (0.7 * maxf(0,(1 - (float(absf((_n_x_b0 - _n_BX1)))/170))))))
	return (2 if _S.truth((_n_L_b1 > 0.45)) else (1 if _S.truth((_n_L_b1 > 0.15)) else 0))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_S = _S.read(_parent,"S")
	var _n_SLANT = _S.read(_parent,"SLANT")
	var _n_litAt = _S.read(_parent,"litAt")
	var _n_BODY = _S.read(_parent,"BODY")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_q = _S.read(_parent,"q")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_stop_b5 = ((-14) - (_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,1]) * 90))
	var _n_y_b6 = ((-176) + ((_n_stop_b5 + 176) * _n_u_b0))
	var _n_x_b7 = (((-170) + (_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,2]) * 360)) - ((_n_stop_b5 - _n_y_b6) * _n_SLANT))
	var _n_L_b8 = (3 + (_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,3]) * 2))
	var _n_ux_b9 = (float(_n_SLANT)/_S.Bridge.hypot([_n_SLANT, 1]))
	var _n_uy_b10 = (float(1)/_S.Bridge.hypot([_n_SLANT, 1]))
	var _n_lit_b11 = _S.call_value(_n_litAt,[_n_x_b7])
	var _n_body_b12 = _S.index_value(_n_BODY,_n_lit_b11)
	var _n_head_b13 = _S.index_value(_n_HEAD,_n_lit_b11)
	_S.invoke(_n_q,"line",[(_n_x_b7 - (_n_ux_b9 * _n_L_b8)), (_n_y_b6 - (_n_uy_b10 * _n_L_b8)), (_n_x_b7 - ((_n_ux_b9 * _n_L_b8) * 0.4)), (_n_y_b6 - ((_n_uy_b10 * _n_L_b8) * 0.4)), _n_body_b12])
	_S.invoke(_n_q,"line",[(_n_x_b7 - ((_n_ux_b9 * _n_L_b8) * 0.4)), (_n_y_b6 - ((_n_uy_b10 * _n_L_b8) * 0.4)), _n_x_b7, _n_y_b6, _n_head_b13])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_S = _S.read(_parent,"S")
	var _n_SLANT = _S.read(_parent,"SLANT")
	var _n_litAt = _S.read(_parent,"litAt")
	var _n_BODY = _S.read(_parent,"BODY")
	var _n_HEAD = _S.read(_parent,"HEAD")
	var _n_TAIL = _S.read(_parent,"TAIL")
	var _n_q = _S.read(_parent,"q")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_V = _S.read(_parent,"V")
	var _n_splash = _S.read(_parent,"splash")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_j_b4 = _S.call_value(_n_wrap,[_n_k_b1, _n_m_b2])
	var _n_z_b5 = (1 + (_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,1]) * 4))
	var _n_y_b6 = ((-180) + ((_n_z_b5 + 180) * _n_u_b0))
	var _n_x_b7 = (((-175) + (_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,2]) * 370)) - ((_n_z_b5 - _n_y_b6) * _n_SLANT))
	var _n_L_b8 = (9 + (_S.MathFX.rand([_n_S,_n_i_b3,_n_j_b4,3]) * 5))
	var _n_ux_b9 = (float(_n_SLANT)/_S.Bridge.hypot([_n_SLANT, 1]))
	var _n_uy_b10 = (float(1)/_S.Bridge.hypot([_n_SLANT, 1]))
	var _n_lit_b11 = _S.call_value(_n_litAt,[_n_x_b7])
	var _n_body_b12 = _S.index_value(_n_BODY,_n_lit_b11)
	var _n_head_b13 = _S.index_value(_n_HEAD,_n_lit_b11)
	var _n_tail_b14 = _S.index_value(_n_TAIL,_n_lit_b11)
	_S.invoke(_n_q,"line",[(_n_x_b7 - (_n_ux_b9 * _n_L_b8)), (_n_y_b6 - (_n_uy_b10 * _n_L_b8)), (_n_x_b7 - ((_n_ux_b9 * _n_L_b8) * 0.55)), (_n_y_b6 - ((_n_uy_b10 * _n_L_b8) * 0.55)), _n_tail_b14])
	_S.invoke(_n_q,"line",[(_n_x_b7 - ((_n_ux_b9 * _n_L_b8) * 0.55)), (_n_y_b6 - ((_n_uy_b10 * _n_L_b8) * 0.55)), (_n_x_b7 - _n_ux_b9), (_n_y_b6 - _n_uy_b10), _n_body_b12])
	_S.invoke(_n_q,"px",[_n_x_b7, _n_y_b6, _n_head_b13])
	var _n_dur_b15 = (float(_n_D)/_n_m_b2)
	var _n_age_b16 = (_n_u_b0 * _n_dur_b15)
	if _S.truth((_n_age_b16 < 0.4)):
		var _n_jp_b17 = _S.call_value(_n_wrap,[(_n_k_b1 - 1), _n_m_b2])
		var _n_zp_b18 = (1 + (_S.MathFX.rand([_n_S,_n_i_b3,_n_jp_b17,1]) * 4))
		var _n_xp_b19 = ((-175) + (_S.MathFX.rand([_n_S,_n_i_b3,_n_jp_b17,2]) * 370))
		var _n_lit_b20 = _S.call_value(_n_litAt,[_n_xp_b19])
		_S.call_value(_n_splash,[_n_q, _n_xp_b19, _n_zp_b18, _n_age_b16, (0.25 + (float((_n_zp_b18 - 1))/5.3)), {"hot":(_n_WHITE if _S.truth(_n_lit_b20) else _S.index_value(_n_C,7)),"cool":_S.index_value([_S.index_value(_n_C,5), _S.index_value(_n_C,6), _S.index_value(_n_V,4)],_n_lit_b20)}, _S.MathFX.rand([_n_S,_n_i_b3,_n_jp_b17,4])])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_BX0 = _S.read(_parent,"BX0")
	var _n_BY0 = _S.read(_parent,"BY0")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_BY1 = _S.read(_parent,"BY1")
	var _n_tree = _S.read(_parent,"tree")
	var _n_S_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.construct(_n_Rng,[((_n_S_b0 * 31) + 1)])
	var _n_P_b2 = _S.call_value(_n_tree,[_n_R_b1, _n_BX0, _n_BY0, _n_BX1, _n_BY1, 0.26, 0.18])
	var _n_pts_b3 = _S.named_value(_S.index_value(_n_P_b2,0),"pts")
	var _n_side_b4 = _S.invoke(_n_R_b1,"sign",[])
	_S.invoke([0.2, 0.38, 0.55],"forEach",[_S.function_value(_S.capture(_parent,{"pts":_n_pts_b3,"side":_n_side_b4,"R":_n_R_b1,"P":_n_P_b2,"this":_this}),"_f17")])
	return _n_P_b2
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "u"), _S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1))]))
	var _v22 = _S.prop(_S.read(_e, "pts"), _S.read(_e, "k"))
	_S.define(_e, "ax", _S.prop(_v22, 0))
	_S.define(_e, "ay", _S.prop(_v22, 1))
	var _v23 = _S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1), _S.binary("+", _S.read(_e, "k"), 3)]))
	_S.define(_e, "bx", _S.prop(_v23, 0))
	_S.define(_e, "by", _S.prop(_v23, 1))
	_S.define(_e, "a", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("-", _S.read(_e, "by"), _S.read(_e, "ay")), _S.binary("-", _S.read(_e, "bx"), _S.read(_e, "ax"))]), _S.binary("*", (_S.unary("-", _S.read(_e, "side")) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.read(_e, "side")), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1]))))
	_S.define(_e, "l", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [36, 56]), _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 0.45))))
	_S.invoke(_S.read(_e, "P"), "push", _S.concat([_S.array(_S.call_value(_S.read(_e, "tree"), [_S.read(_e, "R"), _S.read(_e, "ax"), _S.read(_e, "ay"), _S.binary("+", _S.read(_e, "ax"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "l"))), _S.binary("+", _S.read(_e, "ay"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "l"))), 0.3, 0.5, 0.6, 1]))]))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_channel = _S.read(_parent,"channel")
	var _n_T1 = _S.read(_parent,"T1")
	var _n_BY0 = _S.read(_parent,"BY0")
	var _n_BY1 = _S.read(_parent,"BY1")
	var _n_T_LEAD = _S.read(_parent,"T_LEAD")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_BX0 = _S.read(_parent,"BX0")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_tree = _S.read(_parent,"tree")
	var _n_T2 = _S.read(_parent,"T2")
	var _n_env = _S.read(_parent,"env")
	var _n_F2 = _S.read(_parent,"F2")
	var _n_F1 = _S.read(_parent,"F1")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_V_b3 = _S.arg(_args,3)
	var _n_P1_b4 = _S.call_value(_n_channel,[_n_S_b2])
	if _S.truth((_n_t_b1 < _n_T1)):
		var _n_reach_b10 = (_n_BY0 + ((_n_BY1 - _n_BY0) * pow((float(floori(((float((_n_t_b1 - _n_T_LEAD))/(_n_T1 - _n_T_LEAD)) * 9)))/9),1.25)))
		for _iter_0 in _S.array(_n_P1_b4):
			var _n_p_b11 = _iter_0
			if true:
				var _n_i_b12 = 0
				while _S.truth((_n_i_b12 < (_S.prop(_S.named_value(_n_p_b11,"pts"),"length") - 1))):
					var _tuple_1 = _S.index_value(_S.named_value(_n_p_b11,"pts"),_n_i_b12)
					var _n_ax_b13 = _S.prop(_tuple_1,0)
					var _n_ay_b14 = _S.prop(_tuple_1,1)
					var _tuple_2 = _S.index_value(_S.named_value(_n_p_b11,"pts"),(_n_i_b12 + 1))
					var _n_bx_b15 = _S.prop(_tuple_2,0)
					var _n_by_b16 = _S.prop(_tuple_2,1)
					if _S.truth((_n_by_b16 > _n_reach_b10)):
						break
					_S.invoke(_n_q_b0,"line",[_n_ax_b13, _n_ay_b14, _n_bx_b15, _n_by_b16, (_S.index_value(_n_V_b3,2) if _S.truth((_S.named_value(_n_p_b11,"w") >= 1)) else _S.index_value(_n_V_b3,1))])
					if _S.truth(_S.binary("===",fmod(_n_i_b12,4),0)):
						_S.invoke(_n_q_b0,"glow",[_n_ax_b13, _n_ay_b14, 6, _S.index_value(_n_V_b3,3), (0.22 * _S.named_value(_n_p_b11,"w"))])
					_n_i_b12 += 1.0
		return null
	var _n_P2_b5 = _S.concat([[_S.index_value(_n_P1_b4,0)],_S.array(_S.invoke(_S.invoke(_S.call_value(_n_tree,[_S.construct(_n_Rng,[((_n_S_b2 * 31) + 2)]), _n_BX0, _n_BY0, _n_BX1, _n_BY1, 0.3, 0.3]),"slice",[1]),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f19")]))])
	var _n_s_b6 = (2 if _S.truth((_n_t_b1 >= _n_T2)) else 1)
	var _n_a_b7 = (_n_t_b1 - (_n_T2 if _S.truth(_S.binary("===",_n_s_b6,2)) else _n_T1))
	var _n_k_b8 = _S.call_value(_n_env,[_n_t_b1, (_n_T2 if _S.truth(_S.binary("===",_n_s_b6,2)) else _n_T1), (_n_F2 if _S.truth(_S.binary("===",_n_s_b6,2)) else _n_F1)])
	var _n_paths_b9 = (_n_P2_b5 if _S.truth(_S.binary("===",_n_s_b6,2)) else _n_P1_b4)
	if _S.truth((_n_k_b8 > 0)):
		_S.call_value(_n_stroke,[_n_q_b0, _n_paths_b9, _n_k_b8, _n_V_b3])
	else:
		if _S.truth((_n_a_b7 < 0.5)):
			var _n_g_b17 = (1 - (float(_n_a_b7)/0.5))
			for _iter_3 in _S.array(_n_paths_b9):
				var _n_p_b18 = _iter_3
				if _S.truth((_S.named_value(_n_p_b18,"w") >= 1)):
					for _iter_4 in _S.array(_S.named_value(_n_p_b18,"pts")):
						var _tuple_5 = _iter_4
						var _n_x_b19 = _S.prop(_tuple_5,0)
						var _n_y_b20 = _S.prop(_tuple_5,1)
						_S.invoke(_n_q_b0,"dot",[_n_x_b19, _n_y_b20, _S.index_value(_n_V_b3,1), (_n_g_b17 * 0.9)])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_n_i_b1 < 2)
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_T_SHEET = _S.read(_parent,"T_SHEET")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_tree = _S.read(_parent,"tree")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_V_b3 = _S.arg(_args,3)
	var _n_a_b4 = ((_n_t_b1 - _n_T_SHEET) - 0.22)
	if _S.truth(((_n_a_b4 < 0) if _S.truth((_n_a_b4 < 0)) else (_n_a_b4 > 0.17))):
		return null
	var _n_P_b5 = _S.call_value(_n_tree,[_S.construct(_n_Rng,[((_n_S_b2 * 7) + 3)]), (-150), (-138), (-26), (-134), 0.2, 0.7])
	var _n_reach_b6 = ((-150) + (130 * minf(1,(float((floori((_n_a_b4 * 30)) + 1))/3))))
	var _n_k_b7 = (1 if _S.truth((_n_a_b4 < 0.1)) else 0.5)
	for _iter_0 in _S.array(_n_P_b5):
		var _n_p_b8 = _iter_0
		if true:
			var _n_i_b9 = 0
			while _S.truth((_n_i_b9 < (_S.prop(_S.named_value(_n_p_b8,"pts"),"length") - 1))):
				var _tuple_1 = _S.index_value(_S.named_value(_n_p_b8,"pts"),_n_i_b9)
				var _n_ax_b10 = _S.prop(_tuple_1,0)
				var _n_ay_b11 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_S.named_value(_n_p_b8,"pts"),(_n_i_b9 + 1))
				var _n_bx_b12 = _S.prop(_tuple_2,0)
				var _n_by_b13 = _S.prop(_tuple_2,1)
				if _S.truth((_n_ax_b10 > _n_reach_b6)):
					break
				_S.invoke(_n_q_b0,"line",[_n_ax_b10, _n_ay_b11, _n_bx_b12, _n_by_b13, (_S.index_value(_n_V_b3,4) if _S.truth(((_n_k_b7 > 0.6) if _S.truth((_S.named_value(_n_p_b8,"w") >= 1)) else (_S.named_value(_n_p_b8,"w") >= 1))) else _S.index_value(_n_V_b3,3))])
				if _S.truth((_S.named_value(_n_p_b8,"w") >= 1)):
					_S.invoke(_n_q_b0,"dot",[_n_ax_b10, (_n_ay_b11 + 1), _S.index_value(_n_V_b3,2), _n_k_b7])
				if _S.truth(_S.binary("===",fmod(_n_i_b9,3),0)):
					_S.invoke(_n_q_b0,"glow",[_n_ax_b10, _n_ay_b11, 10, _S.index_value(_n_V_b3,3), ((0.35 * _n_k_b7) * _S.named_value(_n_p_b8,"w"))])
				_n_i_b9 += 1.0
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_paths_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	var _n_V_b3 = _S.arg(_args,3)
	for _iter_0 in _S.array([0, 1, 2]):
		var _n_pass_b4 = _iter_0
		for _iter_1 in _S.array(_n_paths_b1):
			var _n_p_b5 = _iter_1
			var _n_trunk_b6 = (_S.named_value(_n_p_b5,"w") >= 1)
			if _S.truth((((_n_k_b2 < 0.4) if _S.truth((_n_k_b2 < 0.4)) else ((_S.named_value(_n_p_b5,"w") < 0.5) if _S.truth(_S.binary("===",_n_pass_b4,0)) else _S.binary("===",_n_pass_b4,0))) if _S.truth(not _S.truth(_n_trunk_b6)) else not _S.truth(_n_trunk_b6))):
				continue
			if true:
				var _n_i_b7 = 0
				while _S.truth((_n_i_b7 < (_S.prop(_S.named_value(_n_p_b5,"pts"),"length") - 1))):
					var _tuple_2 = _S.index_value(_S.named_value(_n_p_b5,"pts"),_n_i_b7)
					var _n_ax_b8 = _S.prop(_tuple_2,0)
					var _n_ay_b9 = _S.prop(_tuple_2,1)
					var _tuple_3 = _S.index_value(_S.named_value(_n_p_b5,"pts"),(_n_i_b7 + 1))
					var _n_bx_b10 = _S.prop(_tuple_3,0)
					var _n_by_b11 = _S.prop(_tuple_3,1)
					var _n_l_b12 = maxf(1,_S.Bridge.hypot([(_n_bx_b10 - _n_ax_b8), (_n_by_b11 - _n_ay_b9)]))
					if true:
						var _n_d_b13 = 0
						while _S.truth((_n_d_b13 <= _n_l_b12)):
							var _n_x_b14 = (_n_ax_b8 + (float(((_n_bx_b10 - _n_ax_b8) * _n_d_b13))/_n_l_b12))
							var _n_y_b15 = (_n_ay_b9 + (float(((_n_by_b11 - _n_ay_b9) * _n_d_b13))/_n_l_b12))
							if _S.truth(_S.binary("===",_n_pass_b4,0)):
								_S.invoke(_n_q_b0,"circle",[_n_x_b14, _n_y_b15, ((2.3 if _S.truth((_n_k_b2 > 0.6)) else 1.7) if _S.truth(_n_trunk_b6) else 1.2), (_S.index_value(_n_V_b3,2) if _S.truth((_n_k_b2 > 0.6)) else _S.index_value(_n_V_b3,1))])
							else:
								if _S.truth(_S.binary("===",_n_pass_b4,1)):
									_S.invoke(_n_q_b0,"circle",[_n_x_b14, _n_y_b15, ((1.4 if _S.truth((_n_k_b2 > 0.6)) else 0.9) if _S.truth(_n_trunk_b6) else 0.6), (_S.index_value(_n_V_b3,4) if _S.truth(_n_trunk_b6) else _S.index_value(_n_V_b3,3))])
								else:
									if _S.truth(_n_trunk_b6):
										_S.invoke(_n_q_b0,"px",[_n_x_b14, _n_y_b15, (_n_WHITE if _S.truth((_n_k_b2 > 0.3)) else _S.index_value(_n_V_b3,4))])
										if _S.truth((_n_k_b2 > 0.85)):
											_S.invoke(_n_q_b0,"px",[(_n_x_b14 + 1), _n_y_b15, _n_WHITE])
									else:
										if _S.truth(((_n_k_b2 > 0.6) if _S.truth((_S.named_value(_n_p_b5,"w") > 0.4)) else (_S.named_value(_n_p_b5,"w") > 0.4))):
											_S.invoke(_n_q_b0,"px",[_n_x_b14, _n_y_b15, _S.index_value(_n_V_b3,4)])
							_n_d_b13 += 0.5
					if _S.truth((_S.binary("===",fmod(_n_i_b7,3),0) if _S.truth(_S.binary("===",_n_pass_b4,0)) else _S.binary("===",_n_pass_b4,0))):
						_S.invoke(_n_q_b0,"glow",[_n_ax_b8, _n_ay_b9, (18 if _S.truth(_n_trunk_b6) else 8), _S.index_value(_n_V_b3,3), (((0.5 if _S.truth(_n_trunk_b6) else 0.3) * _n_k_b2) * _S.named_value(_n_p_b5,"w"))])
					_n_i_b7 += 1.0
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_T1 = _S.read(_parent,"T1")
	var _n_flashAt = _S.read(_parent,"flashAt")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_BY1 = _S.read(_parent,"BY1")
	var _n_tree = _S.read(_parent,"tree")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_Particles = _S.read(_parent,"Particles")
	var _n_T2 = _S.read(_parent,"T2")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_V_b4 = _S.arg(_args,4)
	var _n_a_b5 = (_n_t_b1 - _n_T1)
	if _S.truth(((_n_a_b5 < 0) if _S.truth((_n_a_b5 < 0)) else (_n_a_b5 > 1.8))):
		return null
	var _n_k_b6 = _S.call_value(_n_flashAt,[_n_t_b1])
	if _S.truth((_n_k_b6 > 0)):
		var _n_fr_b13 = floori(((_n_t_b1 * 30) + 0.001))
		var _n_Rc_b14 = _S.construct(_n_Rng,[((_n_S_b2 * 977) + _n_fr_b13)])
		if true:
			var _n_i_b15 = 0
			while _S.truth((_n_i_b15 < 4)):
				var _n_side_b16 = (1 if _S.truth(fmod(_n_i_b15,2)) else (-1))
				var _n_l_b17 = (_S.invoke(_n_Rc_b14,"range",[10, 30]) * (0.6 + (0.4 * _n_k_b6)))
				for _iter_0 in _S.array(_S.call_value(_n_tree,[_n_Rc_b14, (_n_BX1 + _n_side_b16), (_n_BY1 - 1), (_n_BX1 + (_n_side_b16 * _n_l_b17)), (_n_BY1 + _S.invoke(_n_Rc_b14,"range",[(-2), 3])), 0.35, 0.5, 0.6, 1])):
					var _n_p_b18 = _iter_0
					_S.invoke(_n_q_b0,"polyline",[_S.named_value(_n_p_b18,"pts"), (_S.index_value(_n_V_b4,4) if _S.truth(((_S.named_value(_n_p_b18,"w") > 0.5) if _S.truth((_n_k_b6 > 0.6)) else (_n_k_b6 > 0.6))) else _S.index_value(_n_V_b4,3))])
					_S.invoke(_n_q_b0,"glow",[_S.index_value(_S.index_value(_S.named_value(_n_p_b18,"pts"),_S.binary(">>",_S.prop(_S.named_value(_n_p_b18,"pts"),"length"),1)),0), _S.index_value(_S.index_value(_S.named_value(_n_p_b18,"pts"),_S.binary(">>",_S.prop(_S.named_value(_n_p_b18,"pts"),"length"),1)),1), 8, _S.index_value(_n_V_b4,3), (0.3 * _n_k_b6)])
				_n_i_b15 += 1.0
		_S.invoke(_n_q_b0,"circle",[_n_BX1, (_n_BY1 - 1), (2 + (3 * _n_k_b6)), _S.index_value(_n_V_b4,4)])
		_S.invoke(_n_q_b0,"circle",[_n_BX1, (_n_BY1 - 1), (1 + (2 * _n_k_b6)), _n_WHITE])
		_S.invoke(_n_q_b0,"glow",[_n_BX1, (_n_BY1 - 12), 95, _S.index_value(_n_V_b4,2), (0.55 * _n_k_b6)])
		_S.invoke(_n_q_b0,"glow",[_n_BX1, (_n_BY1 - 4), 40, _S.index_value(_n_V_b4,3), (0.5 * _n_k_b6)])
		_S.invoke(_n_q_b0,"glow",[_n_BX1, (_n_BY1 - 2), 14, _n_WHITE, (0.6 * _n_k_b6)])
	var _n_ps_b7 = _S.construct(_n_Particles,[{"rng":_S.construct(_n_Rng,[((_n_S_b2 * 13) + 5)]),"ground":_S.function_value(_S.capture(_parent,{"this":_this}),"_f23"),"sparks":[_n_WHITE, _S.index_value(_n_V_b4,4), _S.index_value(_n_V_b4,3), _S.index_value(_n_V_b4,2)],"haze":_S.index_value(_n_V_b4,2)}])
	var _n_R_b8 = _S.named_value(_n_ps_b7,"R")
	var _n_steam_b9 = _S.ColorFX.mix(_S.index_value(_n_C_b3,4),_S.index_value(_n_V_b4,3),0.3)
	var _n_burst_b10 = _S.function_value(_S.capture(_parent,{"R":_n_R_b8,"ps":_n_ps_b7,"steam":_n_steam_b9,"this":_this}),"_f24")
	_S.call_value(_n_burst_b10,[48, 1])
	var _n_tt_b11 = 0
	var _n_second_b12 = false
	if true:
		var _n_dt_b19 = (float(1)/120)
		while _S.truth(((_n_tt_b11 + _n_dt_b19) <= _n_a_b5)):
			if _S.truth(((_n_tt_b11 >= (_n_T2 - _n_T1)) if _S.truth(not _S.truth(_n_second_b12)) else not _S.truth(_n_second_b12))):
				_n_second_b12 = true
				_S.call_value(_n_burst_b10,[16, 0.7])
			_S.invoke(_n_ps_b7,"update",[_n_dt_b19])
			_n_tt_b11 += _n_dt_b19
	_S.invoke(_n_ps_b7,"draw",[_n_q_b0])
	if _S.truth((_n_a_b5 < 1.6)):
		_S.invoke(_n_q_b0,"glow",[_n_BX1, _n_BY1, 16, _S.index_value(_n_V_b4,2), (0.4 * pow((1 - (float(_n_a_b5)/1.6)),2))])
	return null

static func _f23(_parent,_args:Array,_this=null):
	return 4
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_BY1 = _S.read(_parent,"BY1")
	var _n_steam = _S.read(_parent,"steam")
	var _n_n_b0 = _S.arg(_args,0)
	var _n_pow_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < _n_n_b0)):
			var _n_an_b3 = ((float((-PI))/2) + _S.invoke(_n_R,"range",[(-1.35), 1.35]))
			var _n_sp_b4 = (_S.invoke(_n_R,"range",[110, 420]) * _n_pow_b1)
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"SPARK"), _n_BX1, (_n_BY1 - 1), (cos(_n_an_b3) * _n_sp_b4), (sin(_n_an_b3) * _n_sp_b4), _S.invoke(_n_R,"range",[0.18, 0.6])])
			_n_i_b2 += 1.0
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < (6 * _n_pow_b1))):
			var _n_sd_b6 = _S.invoke(_n_R,"sign",[])
			_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), (_n_BX1 + (_n_sd_b6 * _S.invoke(_n_R,"range",[2, 8]))), (_n_BY1 - _S.invoke(_n_R,"range",[1, 3])), (_n_sd_b6 * _S.invoke(_n_R,"range",[30, 90])), (-_S.invoke(_n_R,"range",[4, 16])), _S.invoke(_n_R,"range",[0.6, 1.2]), _n_steam, _S.invoke(_n_R,"range",[2.5, 4.5]), _S.invoke(_n_R,"range",[0, 0.08])])
			_n_i_b5 += 1.0
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_field = _S.read(_parent,"field")
	var _n_D = _S.read(_parent,"D")
	var _n_meta = _S.read(_parent,"meta")
	var _n_pass = _S.read(_parent,"pass")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_V_b5 = _S.arg(_args,5)
	var _n_f_b6 = _S.arg(_args,6)
	var _n_F_b7 = _S.call_value(_n_field,[(_n_S_b3 + 3), 256, 128])
	var _n_M_b8 = _S.call_value(_n_field,[(_n_S_b3 + 4), 256, 128, [4, 8, 16]])
	var _n_wind_b9 = (float(((256 * 3) * _n_t_b2))/_n_D)
	_S.call_value(_n_pass,[_n_q_b0, _n_meta, (-14), (-0.5), _S.function_value(_S.capture(_parent,{"M":_n_M_b8,"wind":_n_wind_b9,"f":_n_f_b6,"C":_n_C_b4,"V":_n_V_b5,"this":_this}),"_f26")])
	_S.call_value(_n_pass,[_n_q_b0, _n_meta, 0, 9, _S.function_value(_S.capture(_parent,{"F":_n_F_b7,"C":_n_C_b4,"f":_n_f_b6,"V":_n_V_b5,"this":_this}),"_f27")])
	if _S.truth((_n_f_b6 > 0.2)):
		if true:
			var _n_y_b10 = 1
			while _S.truth((_n_y_b10 < 10)):
				if _S.truth((_S.MathFX.rand([_n_y_b10,floori((_n_t_b2 * 30)),3]) < 0.8)):
					_S.invoke(_n_q_b0,"dot",[(_n_BX1 + (sin(((_n_y_b10 * 1.7) + (_n_t_b2 * 40))) * 1.2)), _n_y_b10, (_n_WHITE if _S.truth((_n_y_b10 < 4)) else _S.index_value(_n_V_b5,4)), (_n_f_b6 * (1.1 - (float(_n_y_b10)/12)))])
				_n_y_b10 += 1.0
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_M = _S.read(_parent,"M")
	var _n_wind = _S.read(_parent,"wind")
	var _n_C = _S.read(_parent,"C")
	var _n_V = _S.read(_parent,"V")
	var _n_f = _S.read(_parent,"f")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_m_b3 = (_S.Accelerators.Weather.sample_at(_n_M,((_n_x_b0 * 1.1) - _n_wind),((_n_y_b1 * 4) + 9)) - 0.4)
	if _S.truth((_n_m_b3 <= 0)):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.ColorFX.mix(_S.index_value(_n_C,4),_S.index_value(_n_V,3),_n_f) if _S.truth((_n_f > 0.1)) else _S.index_value(_n_C,4)),"=")
	_S.set_prop(_n_out_b2,"a",(minf(0.3,(_n_m_b3 * 0.9)) * (1 + (float(_n_y_b1)/14))),"=")
	_S.set_prop(_n_out_b2,"b",1,"=")
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_C = _S.read(_parent,"C")
	var _n_F = _S.read(_parent,"F")
	var _n_BX1 = _S.read(_parent,"BX1")
	var _n_f = _S.read(_parent,"f")
	var _n_V = _S.read(_parent,"V")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_pool_b3 = _S.function_value(_S.capture(_parent,{"x":_n_x_b0,"this":_n_this}),"_f28")
	var _n_wet_b4 = _S.call_value(_n_pool_b3,[_n_y_b1])
	var _n_lip_b5 = (not _S.truth(_S.call_value(_n_pool_b3,[(_n_y_b1 - 1)])) if _S.truth(_n_wet_b4) else _n_wet_b4)
	_S.set_prop(_n_out_b2,"b",1,"=")
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,1),"=")
	_S.set_prop(_n_out_b2,"a",0.5,"=")
	if _S.truth((_n_y_b1 < 1)):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,4) if _S.truth((_S.Accelerators.Weather.sample_at(_n_F,(_n_x_b0 * 2),50) > 0.5)) else _S.index_value(_n_C,3)),"=")
		_S.set_prop(_n_out_b2,"a",1,"=")
		_S.set_prop(_n_out_b2,"b",0,"=")
	else:
		if _S.truth(_n_wet_b4):
			var _n_d_b6 = (float(absf((_n_x_b0 - _n_BX1)))/150)
			if _S.truth((_n_f > 0.06)):
				_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_V,4) if _S.truth((((_n_f > 0.5) if _S.truth((_n_d_b6 < 0.25)) else (_n_d_b6 < 0.25)) if _S.truth(((_n_f > 0.5) if _S.truth((_n_d_b6 < 0.25)) else (_n_d_b6 < 0.25))) else _n_lip_b5)) else _S.index_value(_n_V,3)),"=")
				_S.set_prop(_n_out_b2,"a",clampf(((_n_f * (1.35 - _n_d_b6)) * (1.4 if _S.truth(_n_lip_b5) else 1)),0.0,1.0),"=")
				_S.set_prop(_n_out_b2,"b",0,"=")
			else:
				_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,5) if _S.truth(_n_lip_b5) else _S.index_value(_n_C,3)),"=")
				_S.set_prop(_n_out_b2,"a",(1 if _S.truth(_n_lip_b5) else 0.7),"=")
			_S.set_prop(_n_out_b2,"l",_S.index_value(_n_V,3),"=")
			_S.set_prop(_n_out_b2,"k",((_n_f * 0.25) * maxf(0,(1 - _n_d_b6))),"=")
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_F = _S.read(_parent,"F")
	var _n_x = _S.read(_parent,"x")
	var _n_yy_b0 = _S.arg(_args,0)
	return (_S.Accelerators.Weather.sample_at(_n_F,((_n_x * 1.3) + 31),(_n_yy_b0 * 9)) > (0.6 - (_n_yy_b0 * 0.006)))
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_t0_b1 = _S.arg(_args,1)
	var _n_E_b2 = _S.arg(_args,2)
	var _n_i_b3 = floori((((_n_t_b0 - _n_t0_b1) * 30) + 0.001))
	return (_S.index_value(_n_E_b2,_n_i_b3) if _S.truth(((_n_i_b3 < _S.prop(_n_E_b2,"length")) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))) else 0)
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_env = _S.read(_parent,"env")
	var _n_T1 = _S.read(_parent,"T1")
	var _n_F1 = _S.read(_parent,"F1")
	var _n_T2 = _S.read(_parent,"T2")
	var _n_F2 = _S.read(_parent,"F2")
	var _n_t_b0 = _S.arg(_args,0)
	return maxf(_S.call_value(_n_env,[_n_t_b0, _n_T1, _n_F1]),_S.call_value(_n_env,[_n_t_b0, _n_T2, _n_F2]))
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_a_b0 < 0) if _S.truth((_n_a_b0 < 0)) else (_n_a_b0 > 0.3))) else (_n_k_b1 * (exp((-pow((float((_n_a_b0 - 0.06))/0.04),2))) + (0.65 * exp((-pow((float((_n_a_b0 - 0.18))/0.05),2)))))))
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_blink = _S.read(_parent,"blink")
	var _n_T_FAR = _S.read(_parent,"T_FAR")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.call_value(_n_blink,[(_n_t_b0 - _n_T_FAR), 0.45])
	return null

static func _f33(_parent,_args:Array,_this=null):
	var _n_blink = _S.read(_parent,"blink")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.call_value(_n_blink,[(_n_t_b0 - 0.9), 0.3])
	return null

static func _f34(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	return (float(floori((_n_t_b0 * 30000)+0.5))/30000)
	return null

static func _f35(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return ((9 * exp((-pow((float((_n_x_b0 - 40))/95),2)))) - 3)
	return null
