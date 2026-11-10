@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/god-rays.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f4":"weather_god_rays_row"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "lightAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "shafts", _S.function_value(_e, "_f6"))
	_S.define(_e, "motes", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "God rays"}, {"desc": "Shafts of light slant down from high on the left, breathing and swaying, pooling on the floor, as drifting dust motes light up whenever they cross a beam."}, {"tags": ["weather", "god rays", "light", "sunbeam", "dust", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 170]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#1a1208", "#3a2810", "#7a5a24", "#c89a44", "#f2d27a", "#fff2c4", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "W", 320)
	_S.define(_e, "SX", _S.unary("-", 230))
	_S.define(_e, "SY", _S.unary("-", 300))
	_S.define(_e, "AX", _S.invoke(_S.read(_e, "Math"), "cos", [0.94]))
	_S.define(_e, "AY", _S.invoke(_S.read(_e, "Math"), "sin", [0.94]))
	_S.define(_e, "NX", _S.unary("-", _S.read(_e, "AY")))
	_S.define(_e, "NY", _S.read(_e, "AX"))
	_S.define(_e, "SHAFTS", [_S.merge([{"c": _S.unary("-", 0.27)}, {"h": 0.03}, {"k": 0.65}, {"b": 1}, {"sw": 0.006}]), _S.merge([{"c": _S.unary("-", 0.17)}, {"h": 0.022}, {"k": 0.55}, {"b": 2}, {"sw": 0.005}]), _S.merge([{"c": _S.unary("-", 0.07)}, {"h": 0.05}, {"k": 1}, {"b": 1}, {"sw": 0.008}]), _S.merge([{"c": 0.03}, {"h": 0.018}, {"k": 0.6}, {"b": 3}, {"sw": 0.004}]), _S.merge([{"c": 0.12}, {"h": 0.042}, {"k": 0.85}, {"b": 2}, {"sw": 0.007}]), _S.merge([{"c": 0.23}, {"h": 0.026}, {"k": 0.6}, {"b": 1}, {"sw": 0.005}])])
	_S.define(_e, "STR", _S.construct(_S.read(_e, "Float32Array"), [512]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SX = _S.read(_parent,"SX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_AX = _S.read(_parent,"AX")
	var _n_AY = _S.read(_parent,"AY")
	var _n_NX = _S.read(_parent,"NX")
	var _n_NY = _S.read(_parent,"NY")
	var _n_STR = _S.read(_parent,"STR")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_sh_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _n_SX)
	var _n_dy_b4 = (_n_y_b1 - _n_SY)
	var _n_r_b5 = ((_n_dx_b3 * _n_AX) + (_n_dy_b4 * _n_AY))
	var _n_ang_b6 = (float(((_n_dx_b3 * _n_NX) + (_n_dy_b4 * _n_NY)))/_n_r_b5)
	var _n_e_b7 = 0
	for _iter_0 in _S.array(_n_sh_b2):
		var _n_s_b10 = _iter_0
		var _n_q_b11 = (float(absf((_n_ang_b6 - _S.named_value(_n_s_b10,"c"))))/_S.named_value(_n_s_b10,"h"))
		if _S.truth((_n_q_b11 < 1)):
			_n_e_b7 += (_S.named_value(_n_s_b10,"k") * pow((1 - (_n_q_b11 * _n_q_b11)),1.5))
	if _S.truth((_n_e_b7 <= 0)):
		return 0
	var _n_strand_b8 = _S.index_value(_n_STR,clampf(floori(((_n_ang_b6 + 0.36) * 700)),0,511))
	var _n_fall_b9 = clampf((1.25 - (float((_n_r_b5 - 230))/420)),0.0,1.0)
	return ((_n_e_b7 * _n_fall_b9) * (0.7 + (0.45 * _n_strand_b8)))
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_shafts = _S.read(_parent,"shafts")
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_rows = _S.read(_parent,"rows")
	var _n_motes = _S.read(_parent,"motes")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_sh_b6 = _S.call_value(_n_shafts,[_n_t_b1, _n_S_b4])
	var _n_L_b7 = _S.invoke(_n_C_b5,"map",[_S.function_value(_S.capture(_parent,{"C":_n_C_b5,"this":_this}),"_f2")])
	var _n_n_b8 = _S.prop(_n_sh_b6,"length")
	var _n_SC_b9 = _S.construct(_n_Float32Array,[_n_n_b8])
	var _n_SI_b10 = _S.construct(_n_Float32Array,[_n_n_b8])
	var _n_SK_b11 = _S.construct(_n_Float32Array,[_n_n_b8])
	_S.invoke(_n_sh_b6,"forEach",[_S.function_value(_S.capture(_parent,{"SC":_n_SC_b9,"SI":_n_SI_b10,"SK":_n_SK_b11,"this":_this}),"_f3")])
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (-170), 9, _S.function_value(_S.capture(_parent,{"C":_n_C_b5,"n":_n_n_b8,"SC":_n_SC_b9,"SI":_n_SI_b10,"SK":_n_SK_b11,"L":_n_L_b7,"this":_this}),"_f4")])
	_S.invoke(_n_q_b3,"glow",[(-168), (-178), 130, _S.index_value(_n_C_b5,3), 0.3])
	_S.invoke(_n_q_b3,"glow",[(-168), (-178), 50, _S.index_value(_n_C_b5,5), 0.35])
	_S.call_value(_n_motes,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, _n_sh_b6, false])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_c_b0 = _S.arg(_args,0)
	return _S.ColorFX.mix(_S.index_value(_n_C,0),_n_c_b0,0.75)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.last([_S.set_prop(_S.read(_e, "SC"), _S.read(_e, "j"), _S.prop(_S.read(_e, "s"), "c"), "=", false), _S.set_prop(_S.read(_e, "SI"), _S.read(_e, "j"), _S.binary("/", 1, _S.prop(_S.read(_e, "s"), "h")), "=", false), _S.set_prop(_S.read(_e, "SK"), _S.read(_e, "j"), _S.prop(_S.read(_e, "s"), "k"), "=", false)])

static func _f4(_parent,_args:Array,_this=null):
	var _n_SY = _S.read(_parent,"SY")
	var _n_SX = _S.read(_parent,"SX")
	var _n_AX = _S.read(_parent,"AX")
	var _n_AY = _S.read(_parent,"AY")
	var _n_NX = _S.read(_parent,"NX")
	var _n_NY = _S.read(_parent,"NY")
	var _n_C = _S.read(_parent,"C")
	var _n_SC = _S.read(_parent,"SC")
	var _n_SI = _S.read(_parent,"SI")
	var _n_SK = _S.read(_parent,"SK")
	var _n_n = _S.read(_parent,"n")
	var _n_STR = _S.read(_parent,"STR")
	var _n_L = _S.read(_parent,"L")
	var _n_W = _S.read(_parent,"W")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_floor_b2 = (_n_y_b0 > 0)
	var _n_dy_b3 = (_n_y_b0 - _n_SY)
	var _n_air_b4 = (0.8 if _S.truth(_n_floor_b2) else 0.66)
	var _n_boost_b5 = (1.6 if _S.truth(_n_floor_b2) else 1)
	var _n_r_b6 = (((((-160) + 0.5) - _n_SX) * _n_AX) + (_n_dy_b3 * _n_AY))
	var _n_nn_b7 = (((((-160) + 0.5) - _n_SX) * _n_NX) + (_n_dy_b3 * _n_NY))
	_S.invoke(_S.named_value(_n_R_b1,"a"),"fill",[_n_air_b4])
	_S.invoke(_S.named_value(_n_R_b1,"b"),"fill",[1])
	_S.invoke(_S.named_value(_n_R_b1,"c"),"fill",[_S.index_value(_n_C,0)])
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < _n_W)):
			var _n_ang_b9 = (float(_n_nn_b7)/_n_r_b6)
			var _n_e_b10 = 0
			if true:
				var _n_j_b14 = 0
				while _S.truth((_n_j_b14 < _n_n)):
					var _n_q2_b15 = ((_n_ang_b9 - _S.index_value(_n_SC,_n_j_b14)) * _S.index_value(_n_SI,_n_j_b14))
					if _S.truth(((_n_q2_b15 < 1) if _S.truth((_n_q2_b15 > (-1))) else (_n_q2_b15 > (-1)))):
						var _n_w_b16 = (1 - (_n_q2_b15 * _n_q2_b15))
						_n_e_b10 += ((_S.index_value(_n_SK,_n_j_b14) * _n_w_b16) * sqrt(_n_w_b16))
					_n_j_b14 += 1.0
			if _S.truth((_n_e_b10 <= 0)):
				_n_i_b8 += 1.0
				_n_r_b6 += _n_AX
				_n_nn_b7 += _n_NX
				continue
			var _n_fall_b11 = (1.35 - (float((_n_r_b6 - 200))/330))
			var _n_si_b12 = _S.binary("|",((_n_ang_b9 + 0.36) * 700),0)
			_n_e_b10 *= (((1 if _S.truth((_n_fall_b11 > 1)) else (0 if _S.truth((_n_fall_b11 < 0)) else _n_fall_b11)) * (0.7 + (0.45 * _S.index_value(_n_STR,(0 if _S.truth((_n_si_b12 < 0)) else (511 if _S.truth((_n_si_b12 > 511)) else _n_si_b12)))))) * _n_boost_b5)
			if _S.truth((_n_e_b10 < 0.06)):
				_n_i_b8 += 1.0
				_n_r_b6 += _n_AX
				_n_nn_b7 += _n_NX
				continue
			var _n_lv_b13 = (6 if _S.truth((_n_e_b10 > 1.05)) else (5 if _S.truth((_n_e_b10 > 0.78)) else (4 if _S.truth((_n_e_b10 > 0.52)) else (3 if _S.truth((_n_e_b10 > 0.3)) else 2))))
			_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b8,(_S.index_value(_n_C,_n_lv_b13) if _S.truth(_n_floor_b2) else _S.index_value(_n_L,_n_lv_b13)),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b8,(0.85 if _S.truth(_n_floor_b2) else minf(0.78,(0.12 + (_n_e_b10 * 0.5)))),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b8,_S.index_value(_n_C,4),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b8,(_n_e_b10 * (0.32 if _S.truth(_n_floor_b2) else 0.26)),"=")
			_n_i_b8 += 1.0
			_n_r_b6 += _n_AX
			_n_nn_b7 += _n_NX
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_motes = _S.read(_parent,"motes")
	var _n_shafts = _S.read(_parent,"shafts")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	_S.call_value(_n_motes,[_n_q_b3, _n_t_b1, _n_S_b4, _n_C_b5, _S.call_value(_n_shafts,[_n_t_b1, _n_S_b4]), true])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_STR = _S.read(_parent,"STR")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_SHAFTS = _S.read(_parent,"SHAFTS")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_S_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < 512)):
			var _n_a_b3 = (float(_n_i_b2)/512)
			_S.set_prop(_n_STR,_n_i_b2,(0.5 + ((0.5 * sin((((_n_a_b3 * 190) + (sin((float((_n_TAU * _n_t_b0))/_n_D)) * 2)) + _n_S_b1))) * sin((((_n_a_b3 * 77) - (float((_n_TAU * _n_t_b0))/_n_D)) + (_n_S_b1 * 2))))),"=")
			_n_i_b2 += 1.0
	return _S.invoke(_n_SHAFTS,"map",[_S.function_value(_S.capture(_parent,{"t":_n_t_b0,"this":_this}),"_f7")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"c":(_S.named_value(_n_s_b0,"c") + (_S.named_value(_n_s_b0,"sw") * sin(((float((_n_TAU * _n_t))/_n_D) + (_n_i_b1 * 1.3))))),"h":(_S.named_value(_n_s_b0,"h") * (1 + (0.15 * sin(((float(((_n_TAU * _S.named_value(_n_s_b0,"b")) * _n_t))/_n_D) + _n_i_b1))))),"k":(_S.named_value(_n_s_b0,"k") * (0.72 + (0.28 * sin(((float(((_n_TAU * _S.named_value(_n_s_b0,"b")) * _n_t))/_n_D) + (_n_i_b1 * 2.1))))))}
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_lightAt = _S.read(_parent,"lightAt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_sh_b4 = _S.arg(_args,4)
	var _n_front_b5 = _S.arg(_args,5)
	if true:
		var _n_i_b6 = (0 if _S.truth(_n_front_b5) else 50)
		while _S.truth((_n_i_b6 < (50 if _S.truth(_n_front_b5) else 160))):
			var _n_R_b7 = _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"i":_n_i_b6,"this":_this}),"_f9")
			var _n_n1_b8 = (1 + floori((_S.call_value(_n_R_b7,[1]) * 2)))
			var _n_n2_b9 = (1 + floori((_S.call_value(_n_R_b7,[2]) * 2)))
			var _n_x_b10 = (((-170) + (_S.call_value(_n_R_b7,[3]) * 340)) + ((8 + (_S.call_value(_n_R_b7,[4]) * 14)) * sin(((float(((_n_TAU * _n_n1_b8) * _n_t_b1))/_n_D) + (_S.call_value(_n_R_b7,[5]) * _n_TAU)))))
			var _n_y_b11 = ((((-170) + (_S.call_value(_n_R_b7,[6]) * 172)) + ((6 + (_S.call_value(_n_R_b7,[7]) * 10)) * sin(((float(((_n_TAU * _n_n2_b9) * _n_t_b1))/_n_D) + (_S.call_value(_n_R_b7,[8]) * _n_TAU))))) + (4 * sin(((float(((_n_TAU * 3) * _n_t_b1))/_n_D) + _n_i_b6))))
			var _n_e_b12 = _S.call_value(_n_lightAt,[_n_x_b10, _n_y_b11, _n_sh_b4])
			if _S.truth((_n_e_b12 < 0.12)):
				_n_i_b6 += 1.0
				continue
			var _n_big_b13 = ((_S.call_value(_n_R_b7,[9]) < 0.5) if _S.truth(_n_front_b5) else _n_front_b5)
			var _n_k_b14 = minf(1,_n_e_b12)
			_S.invoke(_n_q_b0,"px",[_n_x_b10, _n_y_b11, (_n_WHITE if _S.truth((_n_k_b14 > 0.6)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_k_b14 > 0.3)) else _S.index_value(_n_C_b3,4)))])
			if _S.truth(((_n_k_b14 > 0.5) if _S.truth(_n_big_b13) else _n_big_b13)):
				_S.invoke(_n_q_b0,"px",[(_n_x_b10 + 1), _n_y_b11, _S.index_value(_n_C_b3,4)])
				_S.invoke(_n_q_b0,"px",[_n_x_b10, (_n_y_b11 + 1), _S.index_value(_n_C_b3,4)])
			_S.invoke(_n_q_b0,"glow",[_n_x_b10, _n_y_b11, (6 if _S.truth(_n_big_b13) else 4), _S.index_value(_n_C_b3,4), (0.4 * _n_k_b14)])
			_n_i_b6 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_i = _S.read(_parent,"i")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([_n_S,_n_i,_n_k_b0])
	return null
