@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/void-orb.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "fbm", _S.import_value("core/index.js", "fbm"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "ringLight", _S.import_value("fx/shadow/_lib.js", "ringLight"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "tables", _S.function_value(_e, "_f0"))
	_S.define(_e, "vortex", _S.function_value(_e, "_f1"))
	_S.define(_e, "lensing", _S.function_value(_e, "_f2"))
	_S.define(_e, "orb", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Void orb"}, {"desc": "A black orb hangs in the air, a pale rim crawling round it; a dark vortex winds into it, motes and streaks are pulled in, and light bends round its edge."}, {"tags": ["shadow", "void", "orb", "vortex", "dark", "magic", "loop"]}, {"size": [168, 160]}, {"origin": [84, 150]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "Y", _S.unary("-", 62))
	_S.define(_e, "R", 12)
	_S.define(_e, "VR", 48)
	_S.define(_e, "GAP", _S.binary("+", _S.read(_e, "R"), 9))
	_S.define(_e, "E", _S.binary("+", _S.read(_e, "R"), 4.5))
	_S.define(_e, "D", 3.2)
	_S.define(_e, "ARMS", 3)
	_S.define(_e, "K", 7)
	_S.define(_e, "WIND", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "D")))
	_S.define(_e, "GULPS", [0.2, 0.68])
	_S.define(_e, "wrap", _S.function_value(_e, "_f14"))
	_S.define(_e, "gulp", _S.function_value(_e, "_f15"))
	_S.define(_e, "SOURCES", [_S.merge([{"cx": 0}, {"cy": 0}, {"rho": 6}, {"n": 1}, {"ph": 0}, {"s": 2.6}, {"sy": 0.75}]), _S.merge([{"cx": 1}, {"cy": _S.unary("-", 1)}, {"rho": 8}, {"n": _S.unary("-", 1)}, {"ph": 2.2}, {"s": 2}, {"sy": 0.6}]), _S.merge([{"cx": 18}, {"cy": _S.unary("-", 6)}, {"rho": 24}, {"n": 1}, {"ph": 0.4}, {"s": 2.4}, {"sy": 0.7}]), _S.merge([{"cx": _S.unary("-", 26)}, {"cy": 10}, {"rho": 30}, {"n": 1}, {"ph": 2.6}, {"s": 2}, {"sy": 0.55}]), _S.merge([{"cx": 8}, {"cy": 22}, {"rho": 20}, {"n": 2}, {"ph": 4.1}, {"s": 1.6}, {"sy": 0.8}]), _S.merge([{"cx": _S.unary("-", 12)}, {"cy": _S.unary("-", 26)}, {"rho": 34}, {"n": 1}, {"ph": 5.3}, {"s": 1.8}, {"sy": 0.6}]), _S.merge([{"cx": 34}, {"cy": 18}, {"rho": 16}, {"n": 2}, {"ph": 1.2}, {"s": 1.4}, {"sy": 0.9}])])
	_S.define(_e, "TAB", null)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	if _S.truth(_S.read(_e, "TAB")):
		return _S.read(_e, "TAB")
	_S.define(_e, "n", _S.binary("*", _S.read(_e, "VR"), 2))
	_S.define(_e, "N", _S.binary("*", _S.read(_e, "n"), _S.read(_e, "n")))
	_S.define(_e, "r", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "th", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "ln", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "nz", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "j"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.read(_v1, "n"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "x", _S.binary("+", _S.binary("-", _S.read(_v2, "i"), _S.read(_v2, "VR")), 0.5))
			_S.define(_v2, "y", _S.binary("+", _S.binary("-", _S.read(_v2, "j"), _S.read(_v2, "VR")), 0.5))
			_S.define(_v2, "k", _S.binary("+", _S.binary("*", _S.read(_v2, "j"), _S.read(_v2, "n")), _S.read(_v2, "i")))
			_S.define(_v2, "a", _S.invoke(_S.read(_v2, "Math"), "atan2", [_S.read(_v2, "y"), _S.read(_v2, "x")]))
			_S.define(_v2, "d", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.read(_v2, "x"), _S.read(_v2, "y")]))
			_S.define(_v2, "l", _S.invoke(_S.read(_v2, "Math"), "log", [_S.invoke(_S.read(_v2, "Math"), "max", [1, _S.read(_v2, "d")])]))
			_S.set_prop(_S.read(_v2, "r"), _S.read(_v2, "k"), _S.read(_v2, "d"), "=", false)
			_S.set_prop(_S.read(_v2, "th"), _S.read(_v2, "k"), _S.read(_v2, "a"), "=", false)
			_S.set_prop(_S.read(_v2, "ln"), _S.read(_v2, "k"), _S.read(_v2, "l"), "=", false)
			_S.set_prop(_S.read(_v2, "nz"), _S.read(_v2, "k"), _S.call_value(_S.read(_v2, "fbm"), [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), 2.5), _S.binary("*", _S.read(_v2, "l"), 2.4)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), 2.5), _S.binary("*", _S.read(_v2, "l"), 2.4)), 17, 3]), "=", false)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	return _S.write(_e, "TAB", _S.merge([{"n": _S.read(_e, "n")}, {"r": _S.read(_e, "r")}, {"th": _S.read(_e, "th")}, {"ln": _S.read(_e, "ln")}, {"nz": _S.read(_e, "nz")}]), "=", false)

static func _f1(_parent,_args:Array,_this=null):
	var _n_tables = _S.read(_parent,"tables")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_GAP = _S.read(_parent,"GAP")
	var _n_VR = _S.read(_parent,"VR")
	var _n_ARMS = _S.read(_parent,"ARMS")
	var _n_K = _S.read(_parent,"K")
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_Y = _S.read(_parent,"Y")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	var _n_T_b4 = _S.call_value(_n_tables,[])
	var _n_n_b5 = _S.named_value(_n_T_b4,"n")
	var _n_wf_b6 = (float((_n_TAU * 12))/_n_D)
	if true:
		var _n_j_b7 = 0
		while _S.truth((_n_j_b7 < _n_n_b5)):
			if true:
				var _n_i_b8 = 0
				while _S.truth((_n_i_b8 < _n_n_b5)):
					var _n_k_b9 = ((_n_j_b7 * _n_n_b5) + _n_i_b8)
					var _n_r_b10 = _S.index_value(_S.named_value(_n_T_b4,"r"),_n_k_b9)
					if _S.truth(((_n_r_b10 < _n_GAP) if _S.truth((_n_r_b10 < _n_GAP)) else (_n_r_b10 > _n_VR))):
						_n_i_b8 += 1.0
						continue
					var _n_env_b11 = (_S.MathFX.smooth(_n_VR,(_n_VR * 0.42),_n_r_b10) * _S.MathFX.smooth(_n_GAP,(_n_GAP + 4),_n_r_b10))
					var _n_ph_b12 = ((((_n_ARMS * _S.index_value(_S.named_value(_n_T_b4,"th"),_n_k_b9)) + (_n_K * _S.index_value(_S.named_value(_n_T_b4,"ln"),_n_k_b9))) + (_n_WIND * _n_t_b2)) + (_S.index_value(_S.named_value(_n_T_b4,"nz"),_n_k_b9) * 2.6))
					var _n_cs_b13 = cos(_n_ph_b12)
					var _n_A_b14 = (((0.5 + (0.5 * _n_cs_b13)) * _n_env_b11) * (1 + (0.4 * _n_g_b3)))
					if _S.truth((_n_A_b14 < 0.16)):
						_n_i_b8 += 1.0
						continue
					var _n_x_b15 = ((_n_i_b8 - _n_VR) + 0.5)
					var _n_y_b16 = (((_n_Y + _n_j_b7) - _n_VR) + 0.5)
					var _n_hot_b17 = (1 - _S.MathFX.smooth(_n_GAP,(_n_GAP + 16),_n_r_b10))
					var _n_fil_b18 = cos(((((12 * _S.index_value(_S.named_value(_n_T_b4,"th"),_n_k_b9)) + (28 * _S.index_value(_S.named_value(_n_T_b4,"ln"),_n_k_b9))) + (_n_wf_b6 * _n_t_b2)) + (_S.index_value(_S.named_value(_n_T_b4,"nz"),_n_k_b9) * 1.6)))
					var _n_dash_b19 = cos(((((9 * _S.index_value(_S.named_value(_n_T_b4,"ln"),_n_k_b9)) * 2.2) + (2.2 * _S.index_value(_S.named_value(_n_T_b4,"th"),_n_k_b9))) + ((_n_wf_b6 * 0.75) * _n_t_b2)))
					if _S.truth(((_n_dash_b19 > (-0.55)) if _S.truth(((_n_A_b14 > 0.3) if _S.truth((_n_fil_b18 > 0.86)) else (_n_fil_b18 > 0.86))) else ((_n_A_b14 > 0.3) if _S.truth((_n_fil_b18 > 0.86)) else (_n_fil_b18 > 0.86)))):
						var _n_c_b20 = (_S.index_value(_n_C_b1,7) if _S.truth((_n_hot_b17 > 0.6)) else (_S.index_value(_n_C_b1,6) if _S.truth(((_n_dash_b19 > 0) if _S.truth(((_n_hot_b17 > 0.25) if _S.truth((_n_hot_b17 > 0.25)) else (_n_fil_b18 > 0.97))) else ((_n_hot_b17 > 0.25) if _S.truth((_n_hot_b17 > 0.25)) else (_n_fil_b18 > 0.97)))) else _S.index_value(_n_C_b1,5)))
						_S.invoke(_n_p_b0,"px",[_n_x_b15, _n_y_b16, _n_c_b20])
						_S.invoke(_n_p_b0,"light",[_n_x_b15, _n_y_b16, _n_c_b20, (0.1 + (0.2 * _n_hot_b17))])
						_n_i_b8 += 1.0
						continue
					if _S.truth(((sin(_n_ph_b12) > 0) if _S.truth(((_n_A_b14 < 0.46) if _S.truth((_n_A_b14 > 0.36)) else (_n_A_b14 > 0.36))) else ((_n_A_b14 < 0.46) if _S.truth((_n_A_b14 > 0.36)) else (_n_A_b14 > 0.36)))):
						_S.invoke(_n_p_b0,"px",[_n_x_b15, _n_y_b16, (_S.index_value(_n_C_b1,6) if _S.truth((_n_hot_b17 > 0.4)) else _S.index_value(_n_C_b1,4))])
						_n_i_b8 += 1.0
						continue
					_S.invoke(_n_p_b0,"blend",[_n_x_b15, _n_y_b16, (_S.index_value(_n_C_b1,3) if _S.truth((_n_A_b14 > 0.6)) else _S.index_value(_n_C_b1,2)), minf(0.75,((_n_A_b14 - 0.16) * 1.4))])
					_n_i_b8 += 1.0
			_n_j_b7 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_E = _S.read(_parent,"E")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_Y = _S.read(_parent,"Y")
	var _n_R = _S.read(_parent,"R")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SOURCES = _S.read(_parent,"SOURCES")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	if true:
		var _n_a_b4 = 0
		var _n_st_b5 = (float(0.7)/_n_E)
		while _S.truth((_n_a_b4 < _n_TAU)):
			var _n_f_b6 = ((0.5 + (0.5 * cos(((5 * _n_a_b4) - (float(((_n_TAU * 2) * _n_t_b2))/_n_D))))) + (0.5 * _n_g_b3))
			_S.invoke(_n_p_b0,"px",[(cos(_n_a_b4) * _n_E), (_n_Y + (sin(_n_a_b4) * _n_E)), (_S.index_value(_n_C_b1,5) if _S.truth((_n_f_b6 > 0.85)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_f_b6 > 0.45)) else _S.index_value(_n_C_b1,3)))])
			_n_a_b4 += _n_st_b5
	for _iter_0 in _S.array(_n_SOURCES):
		var _n_s_b7 = _iter_0
		var _n_q_b8 = ((float(((_n_TAU * _S.named_value(_n_s_b7,"n")) * _n_t_b2))/_n_D) + _S.named_value(_n_s_b7,"ph"))
		var _n_sx_b9 = (_S.named_value(_n_s_b7,"cx") + (_S.named_value(_n_s_b7,"rho") * cos(_n_q_b8)))
		var _n_sy_b10 = (_S.named_value(_n_s_b7,"cy") + ((_S.named_value(_n_s_b7,"rho") * sin(_n_q_b8)) * _S.named_value(_n_s_b7,"sy")))
		var _n_b_b11 = maxf(0.3,_S.Bridge.hypot([_n_sx_b9, _n_sy_b10]))
		var _n_al_b12 = atan2(_n_sy_b10,_n_sx_b9)
		var _n_root_b13 = sqrt(((_n_b_b11 * _n_b_b11) + ((4 * _n_E) * _n_E)))
		var _n_images_b14 = [[(float((_n_b_b11 + _n_root_b13))/2), _n_al_b12, 1], [(float((_n_root_b13 - _n_b_b11))/2), (_n_al_b12 + PI), 0.55]]
		for _iter_1 in _S.array(_n_images_b14):
			var _tuple_2 = _iter_1
			var _n_r_b15 = _S.prop(_tuple_2,0)
			var _n_a0_b16 = _S.prop(_tuple_2,1)
			var _n_w_b17 = _S.prop(_tuple_2,2)
			if _S.truth((_n_r_b15 < (_n_R + 1.5))):
				continue
			var _n_mag_b18 = ((float(_n_r_b15)/_n_b_b11) * _n_w_b17)
			var _n_hw_b19 = minf(PI,(float((_S.named_value(_n_s_b7,"s") * 1.6))/(2 * _n_b_b11)))
			var _n_step_b20 = (float(0.6)/_n_r_b15)
			if true:
				var _n_a_b21 = (_n_a0_b16 - _n_hw_b19)
				while _S.truth((_n_a_b21 <= ((_n_a0_b16 + _n_hw_b19) + 0.000001))):
					var _n_u_b22 = ((float(absf((_n_a_b21 - _n_a0_b16)))/_n_hw_b19) if _S.truth((_n_hw_b19 > 0)) else 0)
					var _n_x_b23 = (cos(_n_a_b21) * _n_r_b15)
					var _n_y_b24 = (_n_Y + (sin(_n_a_b21) * _n_r_b15))
					_S.invoke(_n_p_b0,"dot",[_n_x_b23, _n_y_b24, (_n_WHITE if _S.truth(((_n_mag_b18 > 0.8) if _S.truth((_n_u_b22 < 0.3)) else (_n_u_b22 < 0.3))) else (_S.index_value(_n_C_b1,7) if _S.truth((_n_u_b22 < 0.65)) else _S.index_value(_n_C_b1,5))), (minf(1,(_n_mag_b18 * 1.4)) * (1.15 - _n_u_b22))])
					if _S.truth(((_n_u_b22 < 0.6) if _S.truth((_n_mag_b18 > 1.2)) else (_n_mag_b18 > 1.2))):
						_S.invoke(_n_p_b0,"dot",[(_n_x_b23 + cos(_n_a_b21)), (_n_y_b24 + sin(_n_a_b21)), _S.index_value(_n_C_b1,6), 0.8])
					_n_a_b21 += _n_step_b20
			_S.invoke(_n_p_b0,"glow",[(cos(_n_a0_b16) * _n_r_b15), (_n_Y + (sin(_n_a0_b16) * _n_r_b15)), (4 + minf(10,(_n_hw_b19 * _n_r_b15))), _S.index_value(_n_C_b1,6), minf(0.5,(0.18 * _n_mag_b18))])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_Y = _S.read(_parent,"Y")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	_S.invoke(_n_p_b0,"shade",[((-_n_R) - 1), ((_n_Y - _n_R) - 1), (_n_R + 1), ((_n_Y + _n_R) + 1), _S.function_value(_S.capture(_parent,{"t":_n_t_b2,"g":_n_g_b3,"C":_n_C_b1,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_g = _S.read(_parent,"g")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = _n_x_b0
	var _n_dy_b3 = (_n_y_b1 - _n_Y)
	var _n_d_b4 = sqrt(((_n_dx_b2 * _n_dx_b2) + (_n_dy_b3 * _n_dy_b3)))
	if _S.truth((_n_d_b4 > (_n_R + 0.5))):
		return null
	var _n_a_b5 = atan2(_n_dy_b3,_n_dx_b2)
	if _S.truth((_n_d_b4 > (_n_R - 0.6))):
		var _n_f_b6 = ((((0.5 * cos(((3 * _n_a_b5) - (float(((_n_TAU * 2) * _n_t))/_n_D)))) + (0.3 * cos((((7 * _n_a_b5) + (float(((_n_TAU * 3) * _n_t))/_n_D)) + 1)))) + (0.25 * cos((((13 * _n_a_b5) - (float(((_n_TAU * 5) * _n_t))/_n_D)) + 2)))) + _n_g)
		return (_n_WHITE if _S.truth((_n_f_b6 > 0.5)) else (_S.index_value(_n_C,6) if _S.truth((_n_f_b6 > 0.05)) else (_S.index_value(_n_C,5) if _S.truth((_n_f_b6 > (-0.4))) else _S.index_value(_n_C,4))))
	if _S.truth(((cos((_n_a_b5 - 0.8)) > 0.6) if _S.truth(((_n_R - _n_d_b4) < 1.4)) else ((_n_R - _n_d_b4) < 1.4))):
		return _S.index_value(_n_C,2)
	if _S.truth(((pow((_n_dx_b2 + (_n_R * 0.42)),2) + pow((_n_dy_b3 + (_n_R * 0.45)),2)) < 1.6)):
		return _S.index_value(_n_C,3)
	return _S.index_value(_n_C,0)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_gulp = _S.read(_parent,"gulp")
	var _n_vortex = _S.read(_parent,"vortex")
	var _n_lensing = _S.read(_parent,"lensing")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_g_b4 = _S.call_value(_n_gulp,[_n_t_b1])
	_S.invoke(_n_p_b0,"glow",[0, (-1), 52, _S.index_value(_n_C_b3,4), (0.22 + (0.1 * _n_g_b4))])
	_S.call_value(_n_vortex,[_n_p_b0, _n_C_b3, _n_t_b1, _n_g_b4])
	_S.call_value(_n_lensing,[_n_p_b0, _n_C_b3, _n_t_b1, _n_g_b4])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_gulp = _S.read(_parent,"gulp")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_R = _S.read(_parent,"R")
	var _n_VR = _S.read(_parent,"VR")
	var _n_ease = _S.read(_parent,"ease")
	var _n_Y = _S.read(_parent,"Y")
	var _n_ringFast = _S.read(_parent,"ringFast")
	var _n_ringLight = _S.read(_parent,"ringLight")
	var _n_GULPS = _S.read(_parent,"GULPS")
	var _n_orb = _S.read(_parent,"orb")
	var _n_halo = _S.read(_parent,"halo")
	var _n_unlight = _S.read(_parent,"unlight")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_g_b4 = _S.call_value(_n_gulp,[_n_t_b1])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 14, (_n_S_b5 + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f8")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 30, _n_S_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"p":_n_p_b0,"this":_this}),"_f10")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 9, (_n_S_b5 + 1), 0.42, _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f12")])
	for _iter_0 in _S.array(_n_GULPS):
		var _n_gp_b6 = _iter_0
		var _n_u_b7 = (float(_S.call_value(_n_wrap,[((float(_n_t_b1)/_n_D) - _n_gp_b6)]))/(float(0.4)/_n_D))
		if _S.truth((_n_u_b7 >= 1)):
			continue
		var _n_rr_b8 = ((_n_R + 2) + ((_n_VR - _n_R) * (1 - _S.invoke(_n_ease,"inQuad",[_n_u_b7]))))
		_S.call_value(_n_ringFast,[_n_p_b0, 0, _n_Y, _n_rr_b8, 1, _S.index_value(_n_C_b3,4), (0.35 * (1 - _n_u_b7))])
		_S.call_value(_n_ringLight,[_n_p_b0, 0, _n_Y, _n_rr_b8, 4, _S.index_value(_n_C_b3,5), (0.3 * (1 - _n_u_b7))])
	_S.call_value(_n_orb,[_n_p_b0, _n_C_b3, _n_t_b1, _n_g_b4])
	_S.call_value(_n_halo,[_n_p_b0, 0, _n_Y, (_n_R - 0.5), (_n_R + 7), _S.index_value(_n_C_b3,6), (0.6 + (0.3 * _n_g_b4))])
	_S.call_value(_n_halo,[_n_p_b0, 0, _n_Y, (_n_R - 0.5), (_n_R + 46), _S.index_value(_n_C_b3,4), (0.38 + (0.15 * _n_g_b4))])
	_S.call_value(_n_unlight,[_n_p_b0, (-_n_R), (_n_Y - _n_R), _n_R, (_n_Y + _n_R), _S.function_value(_S.capture(_parent,{"this":_this}),"_f13")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.6, 2.4])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_Y = _S.read(_parent,"Y")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_x0_b3 = _S.invoke(_n_r_b2,"range",[(-44), 44])
	var _n_u_b4 = pow((float(_n_age_b0)/_n_L_b1),1.7)
	var _n_side_b5 = _S.logical("||",signf(_n_x0_b3),func():return 1)
	var _n_ea_b6 = ((float(PI)/2) + (_n_side_b5 * _S.invoke(_n_r_b2,"range",[0.3, 1])))
	var _n_ex_b7 = (cos(_n_ea_b6) * _n_R)
	var _n_ey_b8 = (_n_Y + (sin(_n_ea_b6) * _n_R))
	var _n_mx_b9 = (_n_x0_b3 * 0.2)
	var _n_my_b10 = ((-18) - _S.invoke(_n_r_b2,"range",[0, 12]))
	var _n_x_b11 = (((((1 - _n_u_b4) * (1 - _n_u_b4)) * _n_x0_b3) + (((2 * (1 - _n_u_b4)) * _n_u_b4) * _n_mx_b9)) + ((_n_u_b4 * _n_u_b4) * _n_ex_b7))
	var _n_y_b12 = (((((1 - _n_u_b4) * (1 - _n_u_b4)) * (-1)) + (((2 * (1 - _n_u_b4)) * _n_u_b4) * _n_my_b10)) + ((_n_u_b4 * _n_u_b4) * _n_ey_b8))
	if _S.truth((_n_age_b0 < 0.5)):
		_S.invoke(_n_p,"disc",[_n_x0_b3, (-1.5), (2 + (_n_age_b0 * 6)), _S.index_value(_n_C,3), (0.4 * (1 - (float(_n_age_b0)/0.5)))])
	_S.invoke(_n_p,"dot",[_n_x_b11, _n_y_b12, (_S.index_value(_n_C,7) if _S.truth((_n_u_b4 > 0.6)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b4 > 0.25)) else _S.index_value(_n_C,5))), minf(1,(_n_age_b0 * 4))])
	if _S.truth((_n_u_b4 > 0.3)):
		_S.invoke(_n_p,"glow",[_n_x_b11, _n_y_b12, 3, _S.index_value(_n_C,5), 0.25])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.1, 1.8])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th0")]), 0.75)):
		_S.write(_e, "th0", _S.unary("-", _S.read(_e, "th0")), "=", false)
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "r"), "range", [30, 64]))
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.6]))
	_S.define(_e, "col", _S.invoke(_S.read(_e, "r"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]]))
	_S.define(_e, "pos", _S.function_value(_e, "_f11"))
	var _v20 = _S.call_value(_S.read(_e, "pos"), [_S.read(_e, "age")])
	_S.define(_e, "x", _S.prop(_v20, 0))
	_S.define(_e, "y", _S.prop(_v20, 1))
	_S.define(_e, "rr", _S.prop(_v20, 2))
	var _v21 = _S.call_value(_S.read(_e, "pos"), [_S.binary("-", _S.read(_e, "age"), 0.05)])
	_S.define(_e, "tx", _S.prop(_v21, 0))
	_S.define(_e, "ty", _S.prop(_v21, 1))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 5)]))
	if _S.truth(_S.binary("<", _S.read(_e, "rr"), _S.binary("+", _S.read(_e, "R"), 3))):
		var _v22 = _S.scope(_e)
		_S.invoke(_S.read(_v22, "p"), "px", [_S.read(_v22, "x"), _S.read(_v22, "y"), _S.read(_v22, "WHITE")])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "x"), _S.read(_v22, "y"), 5, _S.prop(_S.read(_v22, "C"), 6), 0.5])
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "tx"), _S.read(_e, "ty"), _S.binary("/", _S.binary("+", _S.read(_e, "tx"), _S.read(_e, "x")), 2), _S.binary("/", _S.binary("+", _S.read(_e, "ty"), _S.read(_e, "y")), 2), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "a"), 0.8)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("/", _S.binary("+", _S.read(_e, "tx"), _S.read(_e, "x")), 2), _S.binary("/", _S.binary("+", _S.read(_e, "ty"), _S.read(_e, "y")), 2), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "col"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "col"), _S.binary("*", 0.3, _S.read(_e, "a"))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_L = _S.read(_parent,"L")
	var _n_R = _S.read(_parent,"R")
	var _n_r0 = _S.read(_parent,"r0")
	var _n_th0 = _S.read(_parent,"th0")
	var _n_sw = _S.read(_parent,"sw")
	var _n_Y = _S.read(_parent,"Y")
	var _n_aa_b0 = _S.arg(_args,0)
	var _n_u_b1 = clampf((float(_n_aa_b0)/_n_L),0.0,1.0)
	var _n_k_b2 = pow(_n_u_b1,1.8)
	var _n_rr_b3 = ((_n_R + 1) + (((_n_r0 - _n_R) - 1) * (1 - _n_k_b2)))
	var _n_th_b4 = (_n_th0 - (_n_sw * (_n_k_b2 + (0.5 * _n_u_b1))))
	return [(cos(_n_th_b4) * _n_rr_b3), (_n_Y + (sin(_n_th_b4) * _n_rr_b3)), _n_rr_b3]
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_p = _S.read(_parent,"p")
	var _n_Y = _S.read(_parent,"Y")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_r_b2,"range",[0, _n_TAU])
	if _S.truth((sin(_n_th_b3) > 0.45)):
		_n_th_b3 = (-_n_th_b3)
	var _n_r0_b4 = _S.invoke(_n_r_b2,"range",[56, 74])
	var _n_u_b5 = (float(_n_age_b0)/_n_L_b1)
	var _n_k_b6 = (float((exp((3 * _n_u_b5)) - 1))/(exp(3) - 1))
	var _n_rr_b7 = (_n_r0_b4 - (((_n_r0_b4 - _n_R) - 1) * _n_k_b6))
	var _n_len_b8 = (2 + (10 * _n_k_b6))
	var _n_ca_b9 = cos(_n_th_b3)
	var _n_sa_b10 = sin(_n_th_b3)
	if true:
		var _n_d_b11 = 0
		while _S.truth((_n_d_b11 <= _n_len_b8)):
			_S.invoke(_n_p,"dot",[(_n_ca_b9 * (_n_rr_b7 + _n_d_b11)), (_n_Y + (_n_sa_b10 * (_n_rr_b7 + _n_d_b11))), (_n_WHITE if _S.truth((_n_d_b11 < 1)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b11 < (_n_len_b8 * 0.5))) else _S.index_value(_n_C,4))), (1 if _S.truth((_n_d_b11 < (_n_len_b8 * 0.5))) else (1.2 - (float(_n_d_b11)/_n_len_b8)))])
			_n_d_b11 += 0.5
	_S.invoke(_n_p,"glow",[(_n_ca_b9 * _n_rr_b7), (_n_Y + (_n_sa_b10 * _n_rr_b7)), 4, _S.index_value(_n_C,6), 0.4])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_Y = _S.read(_parent,"Y")
	var _n_R = _S.read(_parent,"R")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (((_n_x_b0 * _n_x_b0) + pow((_n_y_b1 - _n_Y),2)) < pow((_n_R - 0.6),2))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return (_n_x_b0 - floori(_n_x_b0))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_GULPS = _S.read(_parent,"GULPS")
	var _n_this = _S.read(_parent,"this")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.invoke(_n_GULPS,"reduce",[_S.function_value(_S.capture(_parent,{"t":_n_t_b0,"this":_n_this}),"_f16"), 0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.arg(_args,1)
	return (_n_s_b0 + exp((-pow((float(((_S.call_value(_n_wrap,[(((float(_n_t)/_n_D) - _n_g_b1) + 0.5)]) - 0.5) * _n_D))/0.07),2))))
	return null
