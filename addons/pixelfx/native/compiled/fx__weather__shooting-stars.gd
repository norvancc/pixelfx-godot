@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/shooting-stars.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "at", _S.import_value("core/index.js", "at"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clip", _S.import_value("fx/weather/_lib.js", "clip"))
	_S.define(_e, "rows", _S.import_value("fx/weather/_lib.js", "rows"))
	_S.define(_e, "box", _S.import_value("fx/weather/_lib.js", "box"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "sky", _S.function_value(_e, "_f2"))
	_S.define(_e, "meteor", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Shooting stars"}, {"desc": "Meteors burn across a starry sky, white heads trailing gold and rose; the big ones flare and break up, and each leaves a glowing train that twists and fades."}, {"tags": ["weather", "meteor", "shooting star", "night", "sky", "stars", "ambient", "loop"]}, {"size": [320, 180]}, {"origin": [160, 180]}, {"duration": 10}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#3a1e5a", "#7a3a8a", "#e0607a", "#ffa86a", "#ffe6a8", "#ffffff"]}, {"sky": ["#141428", "#2a2a4a", "#4c4c7c", "#8e8ec4", "#dcdcff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 10)
	_S.define(_e, "METEORS", [_S.merge([{"t0": 0.5}, {"x": 60}, {"y": _S.unary("-", 170)}, {"a": 2.45}, {"v": 260}, {"life": 0.55}, {"s": 0.6}]), _S.merge([{"t0": 1.9}, {"x": _S.unary("-", 40)}, {"y": _S.unary("-", 176)}, {"a": 2.2}, {"v": 220}, {"life": 0.7}, {"s": 0.8}]), _S.merge([{"t0": 3.4}, {"x": 150}, {"y": _S.unary("-", 150)}, {"a": 2.62}, {"v": 300}, {"life": 0.45}, {"s": 0.5}]), _S.merge([{"t0": 4.6}, {"x": 130}, {"y": _S.unary("-", 178)}, {"a": 2.35}, {"v": 240}, {"life": 1.05}, {"s": 1.4}, {"flare": true}]), _S.merge([{"t0": 6.7}, {"x": _S.unary("-", 90)}, {"y": _S.unary("-", 168)}, {"a": 2.05}, {"v": 200}, {"life": 0.6}, {"s": 0.7}]), _S.merge([{"t0": 7.9}, {"x": 20}, {"y": _S.unary("-", 160)}, {"a": 2.5}, {"v": 280}, {"life": 0.5}, {"s": 0.6}]), _S.merge([{"t0": 9.2}, {"x": _S.unary("-", 10)}, {"y": _S.unary("-", 176)}, {"a": 2.28}, {"v": 230}, {"life": 0.8}, {"s": 1}, {"flare": true}])])
	_S.define(_e, "TRAIN", 1.6)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_clip = _S.read(_parent,"clip")
	var _n_box = _S.read(_parent,"box")
	var _n_sky = _S.read(_parent,"sky")
	var _n_METEORS = _S.read(_parent,"METEORS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_q_b3 = _S.call_value(_n_clip,[_n_p_b0, _n_meta])
	var _n_B_b4 = _S.call_value(_n_box,[_n_meta])
	var _n_S_b5 = _S.named_value(_n_o_b2,"seed")
	var _n_C_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),6)
	var _n_K_b7 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"sky"),5)
	_S.call_value(_n_sky,[_n_p_b0, _n_q_b3, _n_t_b1, _n_S_b5, _n_K_b7])
	_S.invoke(_n_METEORS,"forEach",[_S.function_value(_S.capture(_parent,{"q":_n_q_b3,"t":_n_t_b1,"S":_n_S_b5,"C":_n_C_b6,"this":_this}),"_f1")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_meteor = _S.read(_parent,"meteor")
	var _n_q = _S.read(_parent,"q")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_S = _S.read(_parent,"S")
	var _n_C = _S.read(_parent,"C")
	var _n_m_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.call_value(_n_meteor,[_n_q, _S.call_value(_n_wrap,[(_n_t - _S.named_value(_n_m_b0,"t0")), _n_D]), _n_m_b0, _n_i_b1, _n_S, _n_C])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_rows = _S.read(_parent,"rows")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_S_b3 = _S.arg(_args,3)
	var _n_K_b4 = _S.arg(_args,4)
	_S.call_value(_n_rows,[_n_p_b0, _n_meta, (-180), (-1), _S.function_value(_S.capture(_parent,{"K":_n_K_b4,"S":_n_S_b3,"this":_this}),"_f3")])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 130)):
			var _n_x_b6 = ((-160) + (_S.MathFX.rand([_n_S_b3,_n_i_b5,1]) * 320))
			var _n_y_b7 = ((-180) + (_S.MathFX.rand([_n_S_b3,_n_i_b5,2]) * 178))
			var _n_r_b8 = _S.MathFX.rand([_n_S_b3,_n_i_b5,3])
			var _n_c_b9 = (1 + floori((_S.MathFX.rand([_n_S_b3,_n_i_b5,4]) * 4)))
			var _n_tw_b10 = (0.5 + (0.5 * sin(((float(((_n_TAU * _n_c_b9) * _n_t_b2))/_n_D) + (_S.MathFX.rand([_n_S_b3,_n_i_b5,5]) * _n_TAU)))))
			if _S.truth((_n_r_b8 < 0.6)):
				_S.invoke(_n_q_b1,"dot",[_n_x_b6, _n_y_b7, _S.index_value(_n_K_b4,3), (0.35 + (0.5 * _n_tw_b10))])
			else:
				if _S.truth((_n_r_b8 < 0.94)):
					_S.invoke(_n_q_b1,"px",[_n_x_b6, _n_y_b7, (_S.index_value(_n_K_b4,4) if _S.truth((_n_r_b8 < 0.8)) else _n_WHITE)])
					_S.invoke(_n_q_b1,"glow",[(_n_x_b6 + 0.5), (_n_y_b7 + 0.5), 3, _S.index_value(_n_K_b4,3), (0.22 * _n_tw_b10)])
				else:
					_S.call_value(_n_sparkle,[_n_q_b1, _n_x_b6, _n_y_b7, (1 + floori((_n_tw_b10 * 2)+0.5)), _S.index_value(_n_K_b4,4), _S.index_value(_n_K_b4,3), (0.3 * _n_tw_b10)])
			_n_i_b5 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_K = _S.read(_parent,"K")
	var _n_S = _S.read(_parent,"S")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_R_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < 320)):
			var _n_x_b3 = ((_n_i_b2 - 160) + 0.5)
			var _n_d_b4 = (float(absf(((_n_y_b0 + 110) - (_n_x_b3 * (-0.32)))))/36)
			if _S.truth((_n_d_b4 >= 1)):
				_n_i_b2 += 1.0
				continue
			var _n_k_b5 = ((1 - _n_d_b4) * (1 - _n_d_b4))
			_S.set_prop(_S.named_value(_n_R_b1,"l"),_n_i_b2,_S.index_value(_n_K,2),"=")
			_S.set_prop(_S.named_value(_n_R_b1,"k"),_n_i_b2,(0.1 * _n_k_b5),"=")
			if _S.truth((_S.MathFX.rand([_n_i_b2,floori(_n_y_b0),_n_S,5]) < (0.05 * _n_k_b5))):
				_S.set_prop(_S.named_value(_n_R_b1,"c"),_n_i_b2,_S.index_value(_n_K,2),"=")
				_S.set_prop(_S.named_value(_n_R_b1,"a"),_n_i_b2,0.7,"=")
			_n_i_b2 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TRAIN = _S.read(_parent,"TRAIN")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_at = _S.read(_parent,"at")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_m_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_S_b4 = _S.arg(_args,4)
	var _n_C_b5 = _S.arg(_args,5)
	var _n_ca_b6 = cos(_S.named_value(_n_m_b2,"a"))
	var _n_sa_b7 = sin(_S.named_value(_n_m_b2,"a"))
	var _n_end_b8 = ((_S.named_value(_n_m_b2,"life") + (0.5 if _S.truth(_S.named_value(_n_m_b2,"flare")) else 0)) + _n_TRAIN)
	if _S.truth((_n_age_b1 > _n_end_b8)):
		return null
	var _n_pos_b9 = _S.function_value(_S.capture(_parent,{"m":_n_m_b2,"ca":_n_ca_b6,"sa":_n_sa_b7,"this":_this}),"_f5")
	var _n_burn_b10 = minf(_n_age_b1,_S.named_value(_n_m_b2,"life"))
	var _tuple_0 = _S.call_value(_n_pos_b9,[_n_burn_b10])
	var _n_hx_b11 = _S.prop(_tuple_0,0)
	var _n_hy_b12 = _S.prop(_tuple_0,1)
	var _n_trainK_b13 = (1 if _S.truth((_n_age_b1 < _S.named_value(_n_m_b2,"life"))) else (1 - (float((_n_age_b1 - _S.named_value(_n_m_b2,"life")))/(_n_TRAIN + (0.5 if _S.truth(_S.named_value(_n_m_b2,"flare")) else 0)))))
	if _S.truth((_n_trainK_b13 > 0)):
		var _n_len_b19 = (_S.named_value(_n_m_b2,"v") * _n_burn_b10)
		var _n_nx_b20 = (-_n_sa_b7)
		var _n_ny_b21 = _n_ca_b6
		if true:
			var _n_d_b22 = 0
			while _S.truth((_n_d_b22 < _n_len_b19)):
				var _n_passed_b23 = (_n_age_b1 - (float(_n_d_b22)/_S.named_value(_n_m_b2,"v")))
				if _S.truth((_n_passed_b23 < 0.08)):
					_n_d_b22 += 1
					continue
				var _n_g_b24 = (((_n_trainK_b13 * minf(1,((_n_passed_b23 - 0.08) * 4))) * (0.35 + (0.65 * sin((float((PI * _n_d_b22))/_n_len_b19))))) * _S.named_value(_n_m_b2,"s"))
				var _n_tw_b25 = (sin(((_n_d_b22 * 0.09) + (_n_passed_b23 * 1.7))) * minf(4,(_n_passed_b23 * 3)))
				var _n_x_b26 = (((_S.named_value(_n_m_b2,"x") + (_n_ca_b6 * _n_d_b22)) + (_n_nx_b20 * _n_tw_b25)) + (_n_passed_b23 * 4))
				var _n_y_b27 = ((_S.named_value(_n_m_b2,"y") + (_n_sa_b7 * _n_d_b22)) + (_n_ny_b21 * _n_tw_b25))
				_S.invoke(_n_q_b0,"dot",[_n_x_b26, _n_y_b27, (_S.index_value(_n_C_b5,2) if _S.truth((_n_passed_b23 < 0.6)) else _S.index_value(_n_C_b5,1)), (_n_g_b24 * 0.75)])
				if _S.truth(_S.binary("===",fmod(_n_d_b22,6),0)):
					_S.invoke(_n_q_b0,"glow",[_n_x_b26, _n_y_b27, (6 + (_n_passed_b23 * 4)), _S.index_value(_n_C_b5,1), (0.12 * _n_g_b24)])
				_n_d_b22 += 1
	if _S.truth((_n_age_b1 > (_S.named_value(_n_m_b2,"life") + (0.5 if _S.truth(_S.named_value(_n_m_b2,"flare")) else 0)))):
		return null
	var _n_u_b14 = (float(_n_age_b1)/_S.named_value(_n_m_b2,"life"))
	var _n_k_b15 = ((minf(1,(_n_u_b14 * 6)) * ((1 - (float((_n_u_b14 - 0.75))/0.25)) if _S.truth((_n_u_b14 > 0.75)) else 1)) if _S.truth((_n_age_b1 < _S.named_value(_n_m_b2,"life"))) else 0)
	if _S.truth((_n_k_b15 > 0)):
		var _n_L_b28 = ((24 + (40 * _S.named_value(_n_m_b2,"s"))) * minf(1,(_n_u_b14 * 3)))
		if true:
			var _n_d_b29 = 0
			while _S.truth((_n_d_b29 <= _n_L_b28)):
				var _n_v_b30 = (float(_n_d_b29)/_n_L_b28)
				var _n_x_b31 = (_n_hx_b11 - (_n_ca_b6 * _n_d_b29))
				var _n_y_b32 = (_n_hy_b12 - (_n_sa_b7 * _n_d_b29))
				_S.invoke(_n_q_b0,"dot",[_n_x_b31, _n_y_b32, (_n_WHITE if _S.truth((_n_v_b30 < 0.08)) else _S.call_value(_n_at,[_S.invoke(_S.invoke(_n_C_b5,"slice",[1]),"reverse",[]), (_n_v_b30 * 0.95)])), (_n_k_b15 * (1 if _S.truth((_n_v_b30 < 0.6)) else (float((1 - _n_v_b30))/0.4)))])
				if _S.truth(((_n_v_b30 < 0.4) if _S.truth((_S.named_value(_n_m_b2,"s") > 0.9)) else (_S.named_value(_n_m_b2,"s") > 0.9))):
					_S.invoke(_n_q_b0,"dot",[(_n_x_b31 - (_n_sa_b7 * 0.9)), (_n_y_b32 + (_n_ca_b6 * 0.9)), (_S.index_value(_n_C_b5,4) if _S.truth((_n_v_b30 < 0.15)) else _S.index_value(_n_C_b5,3)), (_n_k_b15 * (1 - (float(_n_v_b30)/0.4)))])
				_n_d_b29 += 0.5
		_S.invoke(_n_q_b0,"px",[_n_hx_b11, _n_hy_b12, _n_WHITE])
		if _S.truth((_S.named_value(_n_m_b2,"s") > 0.9)):
			_S.invoke(_n_q_b0,"px",[(_n_hx_b11 + 1), _n_hy_b12, _n_WHITE])
			_S.invoke(_n_q_b0,"px",[_n_hx_b11, (_n_hy_b12 + 1), _S.index_value(_n_C_b5,4)])
		_S.invoke(_n_q_b0,"glow",[_n_hx_b11, _n_hy_b12, (8 + (10 * _S.named_value(_n_m_b2,"s"))), _S.index_value(_n_C_b5,4), (0.45 * _n_k_b15)])
		_S.invoke(_n_q_b0,"glow",[(_n_hx_b11 - ((_n_ca_b6 * _n_L_b28) * 0.3)), (_n_hy_b12 - ((_n_sa_b7 * _n_L_b28) * 0.3)), (10 + (8 * _S.named_value(_n_m_b2,"s"))), _S.index_value(_n_C_b5,3), (0.2 * _n_k_b15)])
	if _S.truth((not _S.truth(_S.named_value(_n_m_b2,"flare")) if _S.truth(not _S.truth(_S.named_value(_n_m_b2,"flare"))) else (_n_age_b1 < (_S.named_value(_n_m_b2,"life") * 0.82)))):
		return null
	var _n_f_b16 = (float((_n_age_b1 - (_S.named_value(_n_m_b2,"life") * 0.82)))/((_S.named_value(_n_m_b2,"life") * 0.18) + 0.5))
	var _tuple_1 = _S.call_value(_n_pos_b9,[(_S.named_value(_n_m_b2,"life") * 0.86)])
	var _n_fx_b17 = _S.prop(_tuple_1,0)
	var _n_fy_b18 = _S.prop(_tuple_1,1)
	if _S.truth((_n_f_b16 < 0.35)):
		_S.call_value(_n_sparkle,[_n_q_b0, _n_fx_b17, _n_fy_b18, ((9 * sin((float((PI * _n_f_b16))/0.35))) + 2), _S.index_value(_n_C_b5,4), _S.index_value(_n_C_b5,3), 0.6])
		_S.invoke(_n_q_b0,"glow",[_n_fx_b17, _n_fy_b18, 40, _S.index_value(_n_C_b5,3), (0.5 * (1 - (float(_n_f_b16)/0.35)))])
	if true:
		var _n_j_b33 = 0
		while _S.truth((_n_j_b33 < 7)):
			var _n_ang_b34 = (_S.MathFX.rand([_n_S_b4,_n_i_b3,_n_j_b33,5]) * _n_TAU)
			var _n_r_b35 = (5 + (_S.MathFX.rand([_n_S_b4,_n_i_b3,_n_j_b33,6]) * 16))
			var _n_d0_b36 = (_S.MathFX.rand([_n_S_b4,_n_i_b3,_n_j_b33,7]) * 0.3)
			var _n_g_b37 = (float((_n_f_b16 - _n_d0_b36))/0.45)
			if _S.truth(((_n_g_b37 <= 0) if _S.truth((_n_g_b37 <= 0)) else (_n_g_b37 >= 1))):
				_n_j_b33 += 1.0
				continue
			var _n_sx_b38 = (_n_fx_b17 + ((cos(_n_ang_b34) * _n_r_b35) * (0.6 + (_n_g_b37 * 0.5))))
			var _n_sy_b39 = ((_n_fy_b18 + ((sin(_n_ang_b34) * _n_r_b35) * (0.6 + (_n_g_b37 * 0.5)))) - (_n_g_b37 * 3))
			var _n_arm_b40 = floori((2.5 * sin((PI * _n_g_b37)))+0.5)
			if _S.truth((_n_arm_b40 >= 1)):
				_S.call_value(_n_sparkle,[_n_q_b0, _n_sx_b38, _n_sy_b39, _n_arm_b40, (_S.index_value(_n_C_b5,4) if _S.truth(fmod(_n_j_b33,3)) else _n_WHITE), _S.index_value(_n_C_b5,3), (0.3 * (1 - _n_g_b37))])
			else:
				_S.invoke(_n_q_b0,"px",[_n_sx_b38, _n_sy_b39, _S.index_value(_n_C_b5,4)])
			_n_j_b33 += 1.0
	if true:
		var _n_j_b41 = 0
		while _S.truth((_n_j_b41 < 4)):
			var _n_da_b42 = ((_S.MathFX.rand([_n_S_b4,_n_i_b3,_n_j_b41,1]) - 0.5) * 0.5)
			var _n_sp_b43 = (_S.named_value(_n_m_b2,"v") * (0.5 + (_S.MathFX.rand([_n_S_b4,_n_i_b3,_n_j_b41,2]) * 0.4)))
			var _n_tt_b44 = (_n_f_b16 * ((_S.named_value(_n_m_b2,"life") * 0.18) + 0.5))
			var _n_g_b45 = (1 - _n_f_b16)
			var _n_x_b46 = (_n_fx_b17 + ((cos((_S.named_value(_n_m_b2,"a") + _n_da_b42)) * _n_sp_b43) * _n_tt_b44))
			var _n_y_b47 = (_n_fy_b18 + ((sin((_S.named_value(_n_m_b2,"a") + _n_da_b42)) * _n_sp_b43) * _n_tt_b44))
			if _S.truth((_n_g_b45 <= 0)):
				_n_j_b41 += 1.0
				continue
			_S.invoke(_n_q_b0,"line",[(_n_x_b46 - ((cos((_S.named_value(_n_m_b2,"a") + _n_da_b42)) * 5) * _n_g_b45)), (_n_y_b47 - ((sin((_S.named_value(_n_m_b2,"a") + _n_da_b42)) * 5) * _n_g_b45)), _n_x_b46, _n_y_b47, _S.index_value(_n_C_b5,3), _n_g_b45])
			_S.invoke(_n_q_b0,"px",[_n_x_b46, _n_y_b47, (_n_WHITE if _S.truth((_n_g_b45 > 0.5)) else _S.index_value(_n_C_b5,4))])
			_S.invoke(_n_q_b0,"glow",[_n_x_b46, _n_y_b47, 5, _S.index_value(_n_C_b5,3), (0.35 * _n_g_b45)])
			_n_j_b41 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_tt_b0 = _S.arg(_args,0)
	return [(_S.named_value(_n_m,"x") + ((_n_ca * _S.named_value(_n_m,"v")) * _n_tt_b0)), (_S.named_value(_n_m,"y") + ((_n_sa * _S.named_value(_n_m,"v")) * _n_tt_b0))]
	return null
