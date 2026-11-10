@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/aurora.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"aurora_blur","_f4":"aurora_row","_f5":"aurora_curtain"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "field", _S.import_value("fx/weather/_lib.js", "field"))
	_S.define(_e, "sample", _S.import_value("fx/weather/_lib.js", "sample"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "blur", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "curtain", _S.function_value(_e, "_f5"))
	_S.define(_e, "stars", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Aurora"}, {"desc": "Rippling curtains of green-to-violet light over a starfield: folding hems burn bright, rays shimmer up into violet, and the whole sky slowly breathes."}, {"tags": ["weather", "aurora", "northern lights", "sky", "night", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 180]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#081a1e", "#0d3a36", "#13664e", "#1fa06a", "#3fd88e", "#9af7bf", "#e6fff0"]}, {"upper": ["#120b2a", "#26164f", "#41208a", "#6a34c0", "#9c62e8", "#d2b4ff", "#f6eeff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "W", 320)
	_S.define(_e, "H", 180)
	_S.define(_e, "BAY", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "I", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "HV", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "BL", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "TMP", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "PROF", _S.invoke(_S.read(_e, "Float32Array"), "from", [_S.merge([{"length": 201}]), _S.function_value(_e, "_f8")]))
	_S.define(_e, "cyc", _S.function_value(_e, "_f9"))
	_S.define(_e, "CURTAINS", [_S.merge([{"y": _S.unary("-", 132)}, {"slope": _S.unary("-", 0.08)}, {"amp": 8}, {"lam": 210}, {"fold": 14}, {"flam": 150}, {"height": 40}, {"k": 0.6}, {"s0": _S.unary("-", 210)}, {"s1": 210}, {"rip": 1.6}, {"c": [1, 1, 2]}, {"hue": 0.35}]), _S.merge([{"y": _S.unary("-", 88)}, {"slope": 0.22}, {"amp": 13}, {"lam": 250}, {"fold": 19}, {"flam": 165}, {"height": 82}, {"k": 1.5}, {"s0": _S.unary("-", 195)}, {"s1": 180}, {"rip": 2.4}, {"c": [1, 2, 3]}, {"hue": 0}]), _S.merge([{"y": _S.unary("-", 38)}, {"slope": _S.unary("-", 0.05)}, {"amp": 5}, {"lam": 150}, {"fold": 10}, {"flam": 110}, {"height": 20}, {"k": 0.45}, {"s0": _S.unary("-", 210)}, {"s1": 210}, {"rip": 1.4}, {"c": [2, 1, 3]}, {"hue": 0}])])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_TMP = _S.read(_parent,"TMP")
	var _n_H = _S.read(_parent,"H")
	var _n_src_b0 = _S.arg(_args,0)
	var _n_dst_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_n_b3 = ((2 * _n_r_b2) + 1)
	if true:
		var _n_y_b4 = 0
		while _S.truth((_n_y_b4 < _n_H)):
			var _n_acc_b5 = 0
			var _n_o_b6 = (_n_y_b4 * _n_W)
			if true:
				var _n_x_b7 = (-_n_r_b2)
				while _S.truth((_n_x_b7 < (_n_W + _n_r_b2))):
					if _S.truth(((_n_x_b7 + _n_r_b2) < _n_W)):
						_n_acc_b5 += _S.index_value(_n_src_b0,(_n_o_b6 + minf((_n_W - 1),(_n_x_b7 + _n_r_b2))))
					if _S.truth((((_n_x_b7 - _n_r_b2) - 1) >= 0)):
						_n_acc_b5 -= _S.index_value(_n_src_b0,(((_n_o_b6 + _n_x_b7) - _n_r_b2) - 1))
					if _S.truth(((_n_x_b7 < _n_W) if _S.truth((_n_x_b7 >= 0)) else (_n_x_b7 >= 0))):
						_S.set_prop(_n_TMP,(_n_o_b6 + _n_x_b7),(float(_n_acc_b5)/_n_n_b3),"=")
					_n_x_b7 += 1.0
			_n_y_b4 += 1.0
	if true:
		var _n_x_b8 = 0
		while _S.truth((_n_x_b8 < _n_W)):
			var _n_acc_b9 = 0
			if true:
				var _n_y_b10 = (-_n_r_b2)
				while _S.truth((_n_y_b10 < (_n_H + _n_r_b2))):
					if _S.truth(((_n_y_b10 + _n_r_b2) < _n_H)):
						_n_acc_b9 += _S.index_value(_n_TMP,((minf((_n_H - 1),(_n_y_b10 + _n_r_b2)) * _n_W) + _n_x_b8))
					if _S.truth((((_n_y_b10 - _n_r_b2) - 1) >= 0)):
						_n_acc_b9 -= _S.index_value(_n_TMP,((((_n_y_b10 - _n_r_b2) - 1) * _n_W) + _n_x_b8))
					if _S.truth(((_n_y_b10 < _n_H) if _S.truth((_n_y_b10 >= 0)) else (_n_y_b10 >= 0))):
						_S.set_prop(_n_dst_b1,((_n_y_b10 * _n_W) + _n_x_b8),(float(_n_acc_b9)/_n_n_b3),"=")
					_n_y_b10 += 1.0
			_n_x_b8 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_box = _S.read(_parent,"box")
	var _n_stars = _S.read(_parent,"stars")
	var _n_I = _S.read(_parent,"I")
	var _n_HV = _S.read(_parent,"HV")
	var _n_field = _S.read(_parent,"field")
	var _n_cyc = _S.read(_parent,"cyc")
	var _n_CURTAINS = _S.read(_parent,"CURTAINS")
	var _n_blur = _S.read(_parent,"blur")
	var _n_BL = _S.read(_parent,"BL")
	var _n_rows = _S.read(_parent,"rows")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_B_b4 = _S.call_value(_n_box,[_n_meta])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_G_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_U_b7 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"upper"),7)
	_S.call_value(_n_stars,[_n_q_b3, _n_t_b1, _n_S_b5, _n_G_b6, _n_U_b7])
	_S.invoke(_n_I,"fill",[0])
	_S.invoke(_n_HV,"fill",[0])
	var _n_F_b8 = _S.call_value(_n_field,[((_n_S_b5 * 5) + 1), 256, 128, [8, 16, 32]])
	var _n_breath_b9 = (0.75 + (0.25 * sin(_S.call_value(_n_cyc,[_n_t_b1, 1, (-1.2)]))))
	var _n_rays_b10 = []
	_S.invoke(_n_CURTAINS,"forEach",[_S.function_value(_S.capture(_parent,{"q":_n_q_b3,"t":_n_t_b1,"F":_n_F_b8,"breath":_n_breath_b9,"rays":_n_rays_b10,"G":_n_G_b6,"this":_this}),"_f2")])
	_S.call_value(_n_blur,[_n_I, _n_BL, 5])
	var _n_GM_b11 = _S.invoke(_n_G_b6,"map",[_S.function_value(_S.capture(_parent,{"U":_n_U_b7,"this":_this}),"_f3")])
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, _S.named_value(_n_B_b4,"y0"), (-12), _S.function_value(_S.capture(_parent,{"B":_n_B_b4,"G":_n_G_b6,"GM":_n_GM_b11,"U":_n_U_b7,"this":_this}),"_f4")])
	for _iter_0 in _S.array(_n_rays_b10):
		var _n_r_b12 = _iter_0
		var _n_n_b13 = floori(_S.named_value(_n_r_b12,"h")+0.5)
		if true:
			var _n_j_b14 = 1
			while _S.truth((_n_j_b14 < _n_n_b13)):
				var _n_u_b15 = (float(_n_j_b14)/_n_n_b13)
				_S.invoke(_n_q_b3,"blend",[_S.named_value(_n_r_b12,"x"), (_S.named_value(_n_r_b12,"hem") - _n_j_b14), (_S.index_value(_n_G_b6,5) if _S.truth((_n_u_b15 < 0.35)) else (_S.ColorFX.mix(_S.index_value(_n_G_b6,5),_S.index_value(_n_U_b7,5),0.5) if _S.truth((_n_u_b15 < 0.6)) else _S.index_value(_n_U_b7,5))), (_S.named_value(_n_r_b12,"k") * pow((1 - _n_u_b15),1.3))])
				_n_j_b14 += 1.0
		_S.invoke(_n_q_b3,"px",[_S.named_value(_n_r_b12,"x"), _S.named_value(_n_r_b12,"hem"), _S.index_value(_n_G_b6,6)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_curtain = _S.read(_parent,"curtain")
	var _n_q = _S.read(_parent,"q")
	var _n_t = _S.read(_parent,"t")
	var _n_F = _S.read(_parent,"F")
	var _n_breath = _S.read(_parent,"breath")
	var _n_rays = _S.read(_parent,"rays")
	var _n_G = _S.read(_parent,"G")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.arg(_args,1)
	return _S.call_value(_n_curtain,[_n_q, _n_c_b0, _n_n_b1, _n_t, _n_F, _n_breath, _n_rays, _n_G])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_U = _S.read(_parent,"U")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.ColorFX.mix(_n_g_b0,_S.index_value(_n_U,_n_i_b1),0.5)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_W = _S.read(_parent,"W")
	var _n_I = _S.read(_parent,"I")
	var _n_BL = _S.read(_parent,"BL")
	var _n_HV = _S.read(_parent,"HV")
	var _n_BAY = _S.read(_parent,"BAY")
	var _n_G = _S.read(_parent,"G")
	var _n_GM = _S.read(_parent,"GM")
	var _n_U = _S.read(_parent,"U")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	var _n_base_b2 = ((floori(_n_y_b0) - _S.named_value(_n_B,"y0")) * _n_W)
	var _n_by_b3 = _S.binary("<<",_S.binary("&",floori(_n_y_b0),3),2)
	if true:
		var _n_xi_b4 = 0
		while _S.truth((_n_xi_b4 < _n_W)):
			var _n_i_b5 = (_n_base_b2 + _n_xi_b4)
			var _n_raw_b6 = _S.index_value(_n_I,_n_i_b5)
			var _n_bl_b7 = _S.index_value(_n_BL,_n_i_b5)
			var _n_k_b8 = (minf(0.4,(_n_bl_b7 * 0.6)) if _S.truth((_n_bl_b7 > 0.015)) else 0)
			if _S.truth((_n_raw_b6 >= 0.03)):
				var _n_e_b9 = (float((_n_raw_b6 * 1.5))/(1 + (_n_raw_b6 * 1.5)))
				var _n_v_b10 = (float(_S.index_value(_n_HV,_n_i_b5))/_n_raw_b6)
				var _n_th_b11 = ((_S.index_value(_n_BAY,_S.binary("|",_n_by_b3,_S.binary("&",_n_xi_b4,3))) * 0.06) if _S.truth((_n_e_b9 > 0.45)) else 0)
				var _n_lv_b12 = (6 if _S.truth((_n_e_b9 > (0.86 + _n_th_b11))) else (5 if _S.truth((_n_e_b9 > (0.72 + _n_th_b11))) else (4 if _S.truth((_n_e_b9 > (0.56 + _n_th_b11))) else (3 if _S.truth((_n_e_b9 > (0.4 + _n_th_b11))) else (2 if _S.truth((_n_e_b9 > 0.24)) else 1)))))
				if _S.truth((_n_v_b10 > 0.35)):
					_n_lv_b12 = minf(_n_lv_b12,5)
				var _n_c_b13 = (_S.index_value(_n_G,_n_lv_b12) if _S.truth((_n_v_b10 < 0.3)) else (_S.index_value(_n_GM,_n_lv_b12) if _S.truth((_n_v_b10 < 0.5)) else _S.index_value(_n_U,_n_lv_b12)))
				if _S.truth((_n_lv_b12 >= 3)):
					_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_xi_b4,_n_c_b13,"=")
					_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_xi_b4,clampf(((_n_e_b9 - 0.3) * 2.2),0.0,1.0),"=")
					_S.set_prop(_S.named_value(_n_R_b1,"b"),_n_xi_b4,(1 if _S.truth((_n_lv_b12 < 5)) else 0),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_xi_b4,((_S.index_value(_n_G,4) if _S.truth((_n_v_b10 < 0.4)) else _S.index_value(_n_U,4)) if _S.truth((_n_lv_b12 >= 3)) else (_S.index_value(_n_G,4) if _S.truth(_S.binary("===",_n_c_b13,_S.index_value(_n_G,_n_lv_b12))) else (_S.index_value(_n_U,4) if _S.truth(_S.binary("===",_n_c_b13,_S.index_value(_n_U,_n_lv_b12))) else _S.index_value(_n_GM,4)))),"=")
				_n_k_b8 += (_n_e_b9 * (0.28 if _S.truth((_n_lv_b12 >= 3)) else 0.72))
			else:
				_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_xi_b4,_S.index_value(_n_G,4),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_xi_b4,_n_k_b8,"=")
			_n_xi_b4 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_cyc = _S.read(_parent,"cyc")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_PROF = _S.read(_parent,"PROF")
	var _n_I = _S.read(_parent,"I")
	var _n_HV = _S.read(_parent,"HV")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_F_b4 = _S.arg(_args,4)
	var _n_breath_b5 = _S.arg(_args,5)
	var _n_rays_b6 = _S.arg(_args,6)
	var _n_G_b7 = _S.arg(_args,7)
	var _n_X0_b8 = (-160)
	var _n_Y0_b9 = (-180)
	var _n_fast_b10 = (float(((256 * 2) * _n_t_b3))/_n_D)
	var _n_slow_b11 = (float((256 * _n_t_b3))/_n_D)
	var _n_p1_b12 = 0
	var _n_p2_b13 = 0
	var _n_lastX_b14 = (-999)
	if true:
		var _n_s_b15 = _S.named_value(_n_c_b1,"s0")
		while _S.truth((_n_s_b15 < _S.named_value(_n_c_b1,"s1"))):
			var _n_x_b16 = ((_n_s_b15 + (_S.named_value(_n_c_b1,"fold") * sin(((float((_n_TAU * _n_s_b15))/_S.named_value(_n_c_b1,"flam")) + _S.call_value(_n_cyc,[_n_t_b3, _S.index_value(_S.named_value(_n_c_b1,"c"),0), (_n_n_b2 * 2)]))))) + (5 * sin(((float((_n_TAU * _n_s_b15))/64) + _S.call_value(_n_cyc,[_n_t_b3, _S.index_value(_S.named_value(_n_c_b1,"c"),2), _n_n_b2])))))
			if _S.truth(((_n_x_b16 < (_n_X0_b8 - 2)) if _S.truth((_n_x_b16 < (_n_X0_b8 - 2))) else (_n_x_b16 >= ((_n_X0_b8 + _n_W) + 1)))):
				_n_s_b15 += 0.5
				continue
			var _n_hem_b17 = (((_S.named_value(_n_c_b1,"y") + (_S.named_value(_n_c_b1,"slope") * _n_s_b15)) + (_S.named_value(_n_c_b1,"amp") * sin(((float((_n_TAU * _n_s_b15))/_S.named_value(_n_c_b1,"lam")) + _S.call_value(_n_cyc,[_n_t_b3, _S.index_value(_S.named_value(_n_c_b1,"c"),1), (_n_n_b2 * 1.7)]))))) + (_S.named_value(_n_c_b1,"rip") * sin(((float((_n_TAU * _n_s_b15))/23) - _S.call_value(_n_cyc,[_n_t_b3, 7, _n_n_b2])))))
			var _n_env_b18 = (_S.MathFX.smooth(_S.named_value(_n_c_b1,"s0"),(_S.named_value(_n_c_b1,"s0") + 60),_n_s_b15) * (1 - _S.MathFX.smooth((_S.named_value(_n_c_b1,"s1") - 70),_S.named_value(_n_c_b1,"s1"),_n_s_b15)))
			var _n_r1_b19 = clampf(((_S.Accelerators.Weather.sample_at(_n_F_b4,(((_n_s_b15 * 5) - _n_fast_b10) + (_n_n_b2 * 40)),(10 + (_n_n_b2 * 30))) - 0.38) * 3.2),0.0,1.0)
			var _n_r2_b20 = clampf(((_S.Accelerators.Weather.sample_at(_n_F_b4,(((_n_s_b15 * 4.3) + (_n_fast_b10 * 0.7)) + (_n_n_b2 * 90)),(50 + (_n_n_b2 * 13))) - 0.35) * 3),0.0,1.0)
			var _n_patch_b21 = _S.Accelerators.Weather.sample_at(_n_F_b4,(((_n_s_b15 * 0.7) + _n_slow_b11) + (_n_n_b2 * 17)),(80 + (_n_n_b2 * 9)))
			var _n_k_b22 = ((((_S.named_value(_n_c_b1,"k") * _n_env_b18) * _n_breath_b5) * (0.2 + (0.8 * _n_r1_b19))) * (0.3 + (1.4 * maxf(0,(_n_patch_b21 - 0.3)))))
			if _S.truth((_n_k_b22 < 0.01)):
				_n_s_b15 += 0.5
				continue
			var _n_h_b23 = ((_S.named_value(_n_c_b1,"height") * (0.45 + (0.75 * _n_r2_b20))) * (0.75 + (0.5 * _n_patch_b21)))
			var _n_xi_b24 = floori((_n_x_b16 - _n_X0_b8))
			var _n_fr_b25 = ((_n_x_b16 - _n_X0_b8) - _n_xi_b24)
			if _S.truth(_S.logical("&&",((absf((_n_x_b16 - _n_lastX_b14)) > 2) if _S.truth(((_n_p1_b12 >= _n_r1_b19) if _S.truth(((_n_p1_b12 >= _n_p2_b13) if _S.truth((_n_p1_b12 > 0.75)) else (_n_p1_b12 > 0.75))) else ((_n_p1_b12 >= _n_p2_b13) if _S.truth((_n_p1_b12 > 0.75)) else (_n_p1_b12 > 0.75)))) else ((_n_p1_b12 >= _n_r1_b19) if _S.truth(((_n_p1_b12 >= _n_p2_b13) if _S.truth((_n_p1_b12 > 0.75)) else (_n_p1_b12 > 0.75))) else ((_n_p1_b12 >= _n_p2_b13) if _S.truth((_n_p1_b12 > 0.75)) else (_n_p1_b12 > 0.75)))),func():return (_n_k_b22 > 0.25))):
				_S.invoke(_n_rays_b6,"push",[{"x":_n_x_b16,"hem":(_n_hem_b17 - 1),"h":(_n_h_b23 * 0.9),"k":minf(0.85,(_n_k_b22 * 0.9))}])
				_n_lastX_b14 = _n_x_b16
			_n_p2_b13 = _n_p1_b12
			_n_p1_b12 = _n_r1_b19
			if _S.truth(((_n_xi_b24 < (-1)) if _S.truth((_n_xi_b24 < (-1))) else (_n_xi_b24 >= _n_W))):
				_n_s_b15 += 0.5
				continue
			var _n_top_b26 = maxf(0,floori(((_n_hem_b17 - _n_h_b23) - _n_Y0_b9)))
			var _n_bot_b27 = minf((_n_H - 1),(floori((_n_hem_b17 - _n_Y0_b9)) + 3))
			var _n_inv_b28 = (float(1)/_n_h_b23)
			var _n_k0_b29 = ((_n_k_b22 * 0.5) * (1 - _n_fr_b25))
			var _n_k1_b30 = ((_n_k_b22 * 0.5) * _n_fr_b25)
			var _n_v_b31 = ((((_n_hem_b17 - _n_Y0_b9) - 0.5) - _n_top_b26) * _n_inv_b28)
			if true:
				var _n_yi_b32 = _n_top_b26
				while _S.truth((_n_yi_b32 <= _n_bot_b27)):
					var _n_pr_b33 = (_S.index_value(_n_PROF,minf(200,_S.binary("|",(_n_v_b31 * 200),0))) if _S.truth((_n_v_b31 >= 0)) else maxf(0,(0.45 + ((_n_v_b31 * _n_h_b23) * 0.16))))
					var _n_o_b34 = ((_n_yi_b32 * _n_W) + _n_xi_b24)
					var _n_hv_b35 = (0 if _S.truth(((_n_v_b31 + _S.named_value(_n_c_b1,"hue")) < 0)) else (1 if _S.truth(((_n_v_b31 + _S.named_value(_n_c_b1,"hue")) > 1)) else (_n_v_b31 + _S.named_value(_n_c_b1,"hue"))))
					if _S.truth((_n_pr_b33 <= 0)):
						_n_yi_b32 += 1.0
						_n_v_b31 -= _n_inv_b28
						continue
					if _S.truth((_n_xi_b24 >= 0)):
						_S.set_prop(_n_I,_n_o_b34,(_n_k0_b29 * _n_pr_b33),"+=")
						_S.set_prop(_n_HV,_n_o_b34,((_n_k0_b29 * _n_pr_b33) * _n_hv_b35),"+=")
					if _S.truth(((_n_xi_b24 + 1) < _n_W)):
						_S.set_prop(_n_I,(_n_o_b34 + 1),(_n_k1_b30 * _n_pr_b33),"+=")
						_S.set_prop(_n_HV,(_n_o_b34 + 1),((_n_k1_b30 * _n_pr_b33) * _n_hv_b35),"+=")
					_n_yi_b32 += 1.0
					_n_v_b31 -= _n_inv_b28
			_n_s_b15 += 0.5
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_cyc = _S.read(_parent,"cyc")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_G_b3 = _S.arg(_args,3)
	var _n_U_b4 = _S.arg(_args,4)
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 150)):
			var _n_x_b6 = ((-160) + (_S.MathFX.rand([_n_S_b2,_n_i_b5,1]) * 320))
			var _n_y_b7 = ((-180) + (_S.MathFX.rand([_n_S_b2,_n_i_b5,2]) * 175))
			var _n_r_b8 = _S.MathFX.rand([_n_S_b2,_n_i_b5,3])
			var _n_c_b9 = (1 + floori((_S.MathFX.rand([_n_S_b2,_n_i_b5,4]) * 4)))
			var _n_tw_b10 = (0.5 + (0.5 * sin(_S.call_value(_n_cyc,[_n_t_b1, _n_c_b9, (_S.MathFX.rand([_n_S_b2,_n_i_b5,5]) * _n_TAU)]))))
			var _n_col_b11 = (_S.ColorFX.mix(_S.index_value(_n_U_b4,3),_n_WHITE,0.2) if _S.truth((_n_r_b8 < 0.6)) else (_S.ColorFX.mix(_S.index_value(_n_U_b4,5),_n_WHITE,0.5) if _S.truth((_n_r_b8 < 0.9)) else _n_WHITE))
			if _S.truth((_n_r_b8 < 0.6)):
				_S.invoke(_n_q_b0,"dot",[_n_x_b6, _n_y_b7, _n_col_b11, (0.35 + (0.5 * _n_tw_b10))])
			else:
				if _S.truth((_n_r_b8 < 0.95)):
					_S.invoke(_n_q_b0,"px",[_n_x_b6, _n_y_b7, _n_col_b11])
					_S.invoke(_n_q_b0,"glow",[(_n_x_b6 + 0.5), (_n_y_b7 + 0.5), 3, _S.index_value(_n_U_b4,5), (0.25 * _n_tw_b10)])
				else:
					_S.call_value(_n_sparkle,[_n_q_b0, _n_x_b6, _n_y_b7, (1 + floori((_n_tw_b10 * 2)+0.5)), _S.ColorFX.mix(_S.index_value(_n_U_b4,5),_n_WHITE,0.6), _S.index_value(_n_U_b4,4), (0.35 * _n_tw_b10)])
			_n_i_b5 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (float((_n_v_b0 + 0.5))/16)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_v_b2 = (float(_n_i_b1)/200)
	return (2.6 if _S.truth((_n_v_b2 < 0.035)) else ((1.15 - _n_v_b2) if _S.truth((_n_v_b2 < 0.22)) else (pow((1 - _n_v_b2),1.5) * 0.9)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_c_b1 = _S.arg(_args,1)
	var _n_ph_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return ((float(((_n_TAU * _n_c_b1) * _n_t_b0))/_n_D) + _n_ph_b2)
	return null
