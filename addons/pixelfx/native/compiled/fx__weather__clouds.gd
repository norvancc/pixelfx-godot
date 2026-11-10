@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/clouds.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "bayer", _S.import_value("fx/weather/_lib.js", "bayer"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "moon", _S.function_value(_e, "_f2"))
	_S.define(_e, "cloud", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Clouds"}, {"desc": "Layers of clouds drift past a bright moon at night: silver-lit tops, dark bellies, edges that flare where they cross the moon, forming and thinning as they go."}, {"tags": ["weather", "clouds", "moon", "night", "sky", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 180]}, {"duration": 12}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0c0c18", "#16172a", "#232540", "#363a5a", "#545a80", "#8088ae", "#bcc4e2", "#f2f4ff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 12)
	_S.define(_e, "MX", 92)
	_S.define(_e, "MY", _S.unary("-", 128))
	_S.define(_e, "MR", 12)
	_S.define(_e, "LAYERS", [_S.merge([{"n": 7}, {"w": [40, 70]}, {"h": [6, 11]}, {"y": [_S.unary("-", 150), _S.unary("-", 110)]}, {"v": 3}, {"life": [8, 11]}, {"tone": [2, 3, 4, 5]}, {"alpha": 0.7}]), _S.merge([{"n": 6}, {"w": [60, 100]}, {"h": [9, 15]}, {"y": [_S.unary("-", 120), _S.unary("-", 70)]}, {"v": 6}, {"life": [8, 11]}, {"tone": [1, 2, 4, 6]}, {"alpha": 0.88}]), _S.merge([{"n": 5}, {"w": [90, 140]}, {"h": [12, 20]}, {"y": [_S.unary("-", 80), _S.unary("-", 30)]}, {"v": 10}, {"life": [9, 12]}, {"tone": [1, 2, 3, 6]}, {"alpha": 1}])])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_moon = _S.read(_parent,"moon")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_moon,[_n_q_b3, _n_C_b5])
	_S.invoke(_n_LAYERS,"forEach",[_S.function_value(_S.capture(_parent,{"q":_n_q_b3,"t":_n_t_b1,"S":_n_S_b4,"C":_n_C_b5,"this":_this}),"_f1")])
	_S.invoke(_n_q_b3,"glow",[_n_MX, _n_MY, 110, _S.index_value(_n_C_b5,4), 0.14])
	_S.invoke(_n_q_b3,"glow",[_n_MX, _n_MY, 40, _S.index_value(_n_C_b5,5), 0.25])
	_S.invoke(_n_q_b3,"glow",[_n_MX, _n_MY, 18, _S.index_value(_n_C_b5,6), 0.3])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_cloud = _S.read(_parent,"cloud")
	var _n_q = _S.read(_parent,"q")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_L_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < _S.named_value(_n_L_b0,"n"))):
			_S.call_value(_n_cloud,[_n_q, _n_t, _n_S, _n_C, _n_L_b0, _n_j_b1, _n_i_b2])
			_n_i_b2 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_MX = _S.read(_parent,"MX")
	var _n_MR = _S.read(_parent,"MR")
	var _n_MY = _S.read(_parent,"MY")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	_S.invoke(_n_q_b0,"shade",[((_n_MX - _n_MR) - 1), ((_n_MY - _n_MR) - 1), ((_n_MX + _n_MR) + 1), ((_n_MY + _n_MR) + 1), _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f3")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_MR = _S.read(_parent,"MR")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = (_n_x_b0 - _n_MX)
	var _n_dy_b4 = (_n_y_b1 - _n_MY)
	var _n_d_b5 = (float(_S.Bridge.hypot([_n_dx_b3, _n_dy_b4]))/_n_MR)
	if _S.truth((_n_d_b5 > 1)):
		return null
	var _n_sea_b6 = ((((pow((_n_dx_b3 + 4),2) + pow((_n_dy_b4 + 2),2)) < 14) if _S.truth(((pow((_n_dx_b3 + 4),2) + pow((_n_dy_b4 + 2),2)) < 14)) else ((pow((_n_dx_b3 - 3),2) + pow((_n_dy_b4 - 4),2)) < 9)) if _S.truth((((pow((_n_dx_b3 + 4),2) + pow((_n_dy_b4 + 2),2)) < 14) if _S.truth(((pow((_n_dx_b3 + 4),2) + pow((_n_dy_b4 + 2),2)) < 14)) else ((pow((_n_dx_b3 - 3),2) + pow((_n_dy_b4 - 4),2)) < 9))) else ((pow((_n_dx_b3 - 5),2) + pow((_n_dy_b4 + 5),2)) < 4))
	_S.set_prop(_n_out_b2,"c",((_S.index_value(_n_C,6) if _S.truth(((_n_dx_b3 + _n_dy_b4) < 0)) else _n_WHITE) if _S.truth((_n_d_b5 > 0.86)) else (_S.index_value(_n_C,5) if _S.truth(_n_sea_b6) else (_n_WHITE if _S.truth((((_n_dx_b3 + _n_dy_b4) < 0) if _S.truth((_n_d_b5 < 0.5)) else (_n_d_b5 < 0.5))) else _S.index_value(_n_C,7)))),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_box = _S.read(_parent,"box")
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_S_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_L_b4 = _S.arg(_args,4)
	var _n_j_b5 = _S.arg(_args,5)
	var _n_i_b6 = _S.arg(_args,6)
	var _n_R_b7 = _S.function_value(_S.capture(_parent,{"S":_n_S_b2,"j":_n_j_b5,"i":_n_i_b6,"this":_this}),"_f5")
	var _n_life_b8 = (_S.index_value(_S.named_value(_n_L_b4,"life"),0) + (_S.call_value(_n_R_b7,[1]) * (_S.index_value(_S.named_value(_n_L_b4,"life"),1) - _S.index_value(_S.named_value(_n_L_b4,"life"),0))))
	var _n_age_b9 = _S.call_value(_n_wrap,[(_n_t_b1 - (_S.call_value(_n_R_b7,[2]) * _n_D)), _n_D])
	if _S.truth((_n_age_b9 >= _n_life_b8)):
		return null
	var _n_u_b10 = (float(_n_age_b9)/_n_life_b8)
	var _n_grow_b11 = (minf(1,(_n_u_b10 * 4)) * minf(1,((1 - _n_u_b10) * 4)))
	var _n_w_b12 = ((_S.index_value(_S.named_value(_n_L_b4,"w"),0) + (_S.call_value(_n_R_b7,[3]) * (_S.index_value(_S.named_value(_n_L_b4,"w"),1) - _S.index_value(_S.named_value(_n_L_b4,"w"),0)))) * (0.6 + (0.4 * _n_grow_b11)))
	var _n_x0_b13 = (((-200) + (_S.call_value(_n_R_b7,[4]) * 330)) + (_S.named_value(_n_L_b4,"v") * _n_age_b9))
	var _n_base_b14 = (_S.index_value(_S.named_value(_n_L_b4,"y"),0) + (_S.call_value(_n_R_b7,[5]) * (_S.index_value(_S.named_value(_n_L_b4,"y"),1) - _S.index_value(_S.named_value(_n_L_b4,"y"),0))))
	var _n_H_b15 = ((_S.index_value(_S.named_value(_n_L_b4,"h"),0) + (_S.call_value(_n_R_b7,[6]) * (_S.index_value(_S.named_value(_n_L_b4,"h"),1) - _S.index_value(_S.named_value(_n_L_b4,"h"),0)))) * _n_grow_b11)
	if _S.truth((_n_H_b15 < 1.5)):
		return null
	var _n_n_b16 = (4 + floori((_S.call_value(_n_R_b7,[7]) * 4)))
	var _n_puffs_b17 = []
	if true:
		var _n_k_b21 = 0
		while _S.truth((_n_k_b21 < _n_n_b16)):
			var _n_f_b22 = (float((_n_k_b21 + 0.5))/_n_n_b16)
			var _n_r_b23 = (((_n_H_b15 * (0.5 + (0.35 * sin((PI * _n_f_b22))))) * (0.75 + (0.5 * _S.call_value(_n_R_b7,[(10 + _n_k_b21)])))) * (1 + (0.06 * sin((((float((_n_TAU * _n_t_b1))/_n_D) + _n_k_b21) + _n_i_b6)))))
			_S.invoke(_n_puffs_b17,"push",[[((_n_x0_b13 + (_n_w_b12 * (_n_f_b22 - 0.5))) + ((_S.call_value(_n_R_b7,[(20 + _n_k_b21)]) - 0.5) * 6)), ((_n_base_b14 - (_n_r_b23 * 0.3)) - ((_S.call_value(_n_R_b7,[(30 + _n_k_b21)]) * _n_H_b15) * 0.15)), _n_r_b23]])
			_n_k_b21 += 1.0
	if true:
		var _n_k_b24 = 0
		while _S.truth((_n_k_b24 < (1 + floori((_S.call_value(_n_R_b7,[8]) * 3))))):
			var _n_f_b25 = (0.3 + (_S.call_value(_n_R_b7,[(40 + _n_k_b24)]) * 0.4))
			var _n_r_b26 = ((_n_H_b15 * (0.75 + (0.35 * _S.call_value(_n_R_b7,[(50 + _n_k_b24)])))) * (1 + (0.05 * sin((((float((_n_TAU * _n_t_b1))/_n_D) + (_n_k_b24 * 2)) + _n_i_b6)))))
			_S.invoke(_n_puffs_b17,"push",[[(_n_x0_b13 + (_n_w_b12 * (_n_f_b25 - 0.5))), ((_n_base_b14 - (_n_H_b15 * 0.55)) - (_n_r_b26 * 0.2)), _n_r_b26]])
			_n_k_b24 += 1.0
	var _n_x1_b18 = ((_n_x0_b13 - (float(_n_w_b12)/2)) - _n_H_b15)
	var _n_x2_b19 = ((_n_x0_b13 + (float(_n_w_b12)/2)) + _n_H_b15)
	var _n_B_b20 = _S.call_value(_n_box,[_n_meta])
	if true:
		var _n_x_b27 = maxf(_S.named_value(_n_B_b20,"x0"),floori(_n_x1_b18))
		while _S.truth((_n_x_b27 <= minf((_S.named_value(_n_B_b20,"x1") - 1),ceili(_n_x2_b19)))):
			var _n_cx_b28 = (_n_x_b27 + 0.5)
			var _n_top_b29 = INF
			var _n_top2_b30 = INF
			for _iter_0 in _S.array(_n_puffs_b17):
				var _tuple_1 = _iter_0
				var _n_px_b35 = _S.prop(_tuple_1,0)
				var _n_py_b36 = _S.prop(_tuple_1,1)
				var _n_r_b37 = _S.prop(_tuple_1,2)
				var _n_dx_b38 = (_n_cx_b28 - _n_px_b35)
				if _S.truth(((_n_dx_b38 * _n_dx_b38) >= (_n_r_b37 * _n_r_b37))):
					continue
				var _n_y_b39 = (_n_py_b36 - sqrt(((_n_r_b37 * _n_r_b37) - (_n_dx_b38 * _n_dx_b38))))
				if _S.truth((_n_y_b39 < _n_top_b29)):
					_n_top2_b30 = _n_top_b29
					_n_top_b29 = _n_y_b39
				else:
					if _S.truth((_n_y_b39 < _n_top2_b30)):
						_n_top2_b30 = _n_y_b39
			if _S.truth(_S.binary("===",_n_top_b29,INF)):
				_n_x_b27 += 1.0
				continue
			var _n_end_b31 = (float(minf((_n_cx_b28 - _n_x1_b18),(_n_x2_b19 - _n_cx_b28)))/_n_H_b15)
			var _n_bot_b32 = (((_n_base_b14 + 1.5) + (sin(((_n_cx_b28 * 0.21) + _n_i_b6)) * 0.8)) - (((1 - _n_end_b31) * 4) if _S.truth((_n_end_b31 < 1)) else 0))
			if _S.truth((_n_bot_b32 <= _n_top_b29)):
				_n_x_b27 += 1.0
				continue
			var _n_h_b33 = (_n_bot_b32 - _n_top_b29)
			var _n_inner_b34 = (floori(_n_top2_b30) if _S.truth(((_n_top2_b30 < (_n_bot_b32 - 2)) if _S.truth(((_n_top2_b30 - _n_top_b29) > 2.5)) else ((_n_top2_b30 - _n_top_b29) > 2.5))) else (-999))
			if true:
				var _n_y_b40 = floori(_n_top_b29)
				while _S.truth((_n_y_b40 < _n_bot_b32)):
					var _n_d_b41 = ((_n_y_b40 + 0.5) - _n_top_b29)
					var _n_v_b42 = (float(_n_d_b41)/_n_h_b33)
					var _n_th_b43 = (((_S.Painter.BAYER[((floori(_n_y_b40)&3)<<2)|(floori(_n_x_b27)&3)]+0.5)/16.0) * 0.12)
					var _n_md_b44 = _S.Bridge.hypot([(_n_cx_b28 - _n_MX), (_n_y_b40 - _n_MY)])
					var _n_c_b45 = (_S.index_value(_S.named_value(_n_L_b4,"tone"),3) if _S.truth((_n_d_b41 < 1)) else (_S.index_value(_S.named_value(_n_L_b4,"tone"),2) if _S.truth((_n_v_b42 < (0.25 + _n_th_b43))) else (_S.index_value(_S.named_value(_n_L_b4,"tone"),1) if _S.truth((_n_v_b42 < (0.62 + _n_th_b43))) else _S.index_value(_S.named_value(_n_L_b4,"tone"),0))))
					if _S.truth(_S.binary("===",_n_y_b40,_n_inner_b34)):
						_n_c_b45 = maxf(_n_c_b45,_S.index_value(_S.named_value(_n_L_b4,"tone"),2))
					if _S.truth(((_n_v_b42 > 0.5) if _S.truth((((_n_bot_b32 - _n_y_b40) - 0.5) < 1)) else (((_n_bot_b32 - _n_y_b40) - 0.5) < 1))):
						_n_c_b45 = maxf(0,(_S.index_value(_S.named_value(_n_L_b4,"tone"),0) - 1))
					if _S.truth(((((_n_d_b41 < 2) if _S.truth((_n_d_b41 < 2)) else _S.binary("===",_n_y_b40,_n_inner_b34)) if _S.truth(((_n_d_b41 < 2) if _S.truth((_n_d_b41 < 2)) else _S.binary("===",_n_y_b40,_n_inner_b34))) else (_n_v_b42 < 0.3)) if _S.truth((_n_md_b44 < 46)) else (_n_md_b44 < 46))):
						_n_c_b45 = minf(7,(_n_c_b45 + (2 if _S.truth((_n_md_b44 < 24)) else 1)))
					var _n_a_b46 = (_S.named_value(_n_L_b4,"alpha") * minf(1,(_n_grow_b11 * 1.5)))
					if _S.truth((_n_a_b46 >= 1)):
						_S.invoke(_n_q_b0,"px",[_n_x_b27, _n_y_b40, _S.index_value(_n_C_b3,_n_c_b45)])
					else:
						_S.invoke(_n_q_b0,"blend",[_n_x_b27, _n_y_b40, _S.index_value(_n_C_b3,_n_c_b45), _n_a_b46])
					if _S.truth(((_n_md_b44 < 46) if _S.truth((_n_d_b41 < 1)) else (_n_d_b41 < 1))):
						_S.invoke(_n_q_b0,"light",[_n_x_b27, _n_y_b40, _S.index_value(_n_C_b3,6), (0.35 * (1 - (float(_n_md_b44)/46)))])
					_n_y_b40 += 1.0
			_n_x_b27 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_j = _S.read(_parent,"j")
	var _n_i = _S.read(_parent,"i")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.MathFX.rand([_n_S,_n_j,_n_i,_n_k_b0])
	return null
