@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/tornado.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "geo", _S.function_value(_e, "_f0"))
	_S.define(_e, "body", _S.function_value(_e, "_f3"))
	_S.define(_e, "bands", _S.function_value(_e, "_f4"))
	_S.define(_e, "blob", _S.function_value(_e, "_f5"))
	_S.define(_e, "crown", _S.function_value(_e, "_f6"))
	_S.define(_e, "debris", _S.function_value(_e, "_f8"))
	_S.define(_e, "skirt", _S.function_value(_e, "_f11"))
	_S.define(_e, "flashAt", _S.function_value(_e, "_f16"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f17"))
	_S.define(_e, "draw", _S.function_value(_e, "_f18"))
	_S.define(_e, "meta", _S.merge([{"name": "Tornado"}, {"desc": "A snaking funnel of spinning wind bands under a flared, churning top that flickers with lightning; leaves and debris whirl round it front and back, dust boils at its foot."}, {"tags": ["nature", "wind", "tornado", "storm", "hazard", "ground", "loop"]}, {"size": [196, 168]}, {"origin": [98, 152]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#141221", "#231f33", "#36314a", "#4d4762", "#68617d", "#8a839e", "#b3adc4", "#e2def0"]}, {"dust": ["#2a2018", "#4e3e2e", "#76624a", "#a08a6a", "#cbb894"]}, {"leaves": ["#4a200c", "#a8541c", "#e8962e", "#ffd27a", "#123818", "#2f7a2a", "#6cb83a", "#c8f070"]}, {"height": 112}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.28)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_ph_b2 = (float((_n_TAU * _n_t_b1))/_S.named_value(_n_meta,"duration"))
	var _n_FH_b3 = _S.named_value(_n_o_b0,"height")
	return {"FH":_n_FH_b3,"ph":_n_ph_b2,"ax":_S.function_value(_S.capture(_parent,{"ph":_n_ph_b2,"this":_this}),"_f1"),"rad":_S.function_value(_S.capture(_parent,{"this":_this}),"_f2")}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_ph = _S.read(_parent,"ph")
	var _n_u_b0 = _S.arg(_args,0)
	return (((8.5 * sin((_n_ph - (2.6 * _n_u_b0)))) * (0.2 + (0.8 * _n_u_b0))) + ((3 * sin((((2 * _n_ph) + 1.3) - (4.5 * _n_u_b0)))) * _n_u_b0))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return ((3 + (20 * pow(_n_u_b0,1.5))) + (17 * pow(_S.MathFX.smooth(0.78,1,_n_u_b0),2)))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Dst_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	var _object_0 = _n_g_b3
	var _n_FH_b6 = _S.named_value(_object_0,"FH")
	var _n_ax_b7 = _S.named_value(_object_0,"ax")
	var _n_rad_b8 = _S.named_value(_object_0,"rad")
	if true:
		var _n_y_b9 = ((-ceili(_n_FH_b6)) + 2)
		while _S.truth((_n_y_b9 <= 0)):
			var _n_u_b10 = (float((-_n_y_b9))/_n_FH_b6)
			var _n_cx_b11 = _S.call_value(_n_ax_b7,[_n_u_b10])
			var _n_r_b12 = _S.call_value(_n_rad_b8,[_n_u_b10])
			var _n_K_b13 = (2 + (1 if _S.truth((_S.MathFX.rand([_n_y_b9,_n_seed_b5]) < 0.35)) else 0))
			var _n_rot_b14 = (float(((_n_TAU * _n_K_b13) * _n_t_b4))/_S.named_value(_n_meta,"duration"))
			var _n_fade_b15 = (minf(1,((_n_u_b10 * 8) + 0.25)) * (1 - _S.MathFX.smooth(0.9,1.02,_n_u_b10)))
			if true:
				var _n_x_b16 = floori((_n_cx_b11 - _n_r_b12))
				while _S.truth((_n_x_b16 <= ceili((_n_cx_b11 + _n_r_b12)))):
					var _n_c_b17 = (float(((_n_x_b16 + 0.5) - _n_cx_b11))/_n_r_b12)
					if _S.truth((absf(_n_c_b17) > 1)):
						_n_x_b16 += 1.0
						continue
					var _n_n_b18 = _S.NoiseKernels.tile_noise((float(((acos(_n_c_b17) + _n_rot_b14) * 6))/_n_TAU),(_n_y_b9 * 0.34),6,0,_n_seed_b5)
					var _n_v_b19 = ((((-_n_c_b17) * 0.55) + 0.15) + (_n_n_b18 * 0.55))
					var _n_col_b20 = (_S.index_value(_n_C_b1,6) if _S.truth((_n_v_b19 > 0.6)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_v_b19 > 0.28)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_v_b19 > (-0.05))) else (_S.index_value(_n_C_b1,3) if _S.truth((_n_v_b19 > (-0.4))) else _S.index_value(_n_C_b1,2)))))
					if _S.truth((_n_u_b10 < 0.3)):
						_n_col_b20 = _S.ColorFX.mix(_n_col_b20,_S.index_value(_n_Dst_b2,(3 if _S.truth((_n_v_b19 > 0.3)) else (2 if _S.truth((_n_v_b19 > (-0.2))) else 1))),(0.7 * (1 - (float(_n_u_b10)/0.3))))
					_S.invoke(_n_p_b0,"blend",[_n_x_b16, _n_y_b9, _n_col_b20, ((0.14 + (0.36 * sqrt((1 - (_n_c_b17 * _n_c_b17))))) * _n_fade_b15)])
					_n_x_b16 += 1.0
			_n_y_b9 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _object_0 = _n_g_b2
	var _n_FH_b6 = _S.named_value(_object_0,"FH")
	var _n_ax_b7 = _S.named_value(_object_0,"ax")
	var _n_rad_b8 = _S.named_value(_object_0,"rad")
	if true:
		var _n_j_b9 = 0
		while _S.truth((_n_j_b9 < 58)):
			var _n_R_b10 = _S.MathFX.rng([_n_seed_b4,_n_j_b9])
			var _n_u_b11 = (float((_n_j_b9 + _S.invoke(_n_R_b10,"range",[0.1, 0.9])))/58)
			var _n_K_b12 = _S.invoke(_n_R_b10,"int",[2, 4])
			var _n_span_b13 = _S.invoke(_n_R_b10,"range",[0.7, 2.1])
			var _n_lvl_b14 = _S.invoke(_n_R_b10,"next",[])
			var _n_cx_b15 = _S.call_value(_n_ax_b7,[_n_u_b11])
			var _n_r_b16 = (_S.call_value(_n_rad_b8,[_n_u_b11]) * _S.invoke(_n_R_b10,"range",[1, 1.1]))
			var _n_y0_b17 = ((-_n_u_b11) * _n_FH_b6)
			var _n_head_b18 = (_S.invoke(_n_R_b10,"range",[0, _n_TAU]) + (float(((_n_TAU * _n_K_b12) * _n_t_b3))/_S.named_value(_n_meta,"duration")))
			if _S.truth((_n_u_b11 > 0.97)):
				_n_j_b9 += 1.0
				continue
			if true:
				var _n_s_b19 = 0
				while _S.truth((_n_s_b19 <= _n_span_b13)):
					var _n_th_b20 = (_n_head_b18 - _n_s_b19)
					var _n_sn_b21 = sin(_n_th_b20)
					if _S.truth(_S.binary("===",(_n_sn_b21 > 0),_n_back_b5)):
						_n_s_b19 += (float(0.5)/maxf(2,_n_r_b16))
						continue
					var _n_k_b22 = (float(_n_s_b19)/_n_span_b13)
					var _n_x_b23 = (_n_cx_b15 + (_n_r_b16 * cos(_n_th_b20)))
					var _n_y_b24 = (_n_y0_b17 + ((_n_r_b16 * _n_SY) * _n_sn_b21))
					var _n_lit_b25 = (cos(_n_th_b20) < 0.2)
					var _n_i_b26 = (2 if _S.truth((_n_lvl_b14 < 0.18)) else (7 if _S.truth(((_n_lvl_b14 > 0.55) if _S.truth((_n_k_b22 < 0.15)) else (_n_k_b22 < 0.15))) else ((6 if _S.truth(_n_lit_b25) else 5) if _S.truth((_n_k_b22 < 0.45)) else (5 if _S.truth(_n_lit_b25) else 4))))
					if _S.truth(_n_back_b5):
						_n_i_b26 = maxf(1,(_n_i_b26 - 2))
					if _S.truth((_n_k_b22 < 0.5)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b23, _n_y_b24, _S.index_value(_n_C_b1,_n_i_b26)])
					else:
						_S.invoke(_n_p_b0,"blend",[_n_x_b23, _n_y_b24, _S.index_value(_n_C_b1,_n_i_b26), (2 * (1 - _n_k_b22))])
					_n_s_b19 += (float(0.5)/maxf(2,_n_r_b16))
			if _S.truth(((sin(_n_head_b18) > 0) if _S.truth(((_n_lvl_b14 > 0.6) if _S.truth(not _S.truth(_n_back_b5)) else not _S.truth(_n_back_b5))) else ((_n_lvl_b14 > 0.6) if _S.truth(not _S.truth(_n_back_b5)) else not _S.truth(_n_back_b5)))):
				var _n_hx_b27 = (_n_cx_b15 + (_n_r_b16 * cos(_n_head_b18)))
				var _n_hy_b28 = (_n_y0_b17 + ((_n_r_b16 * _n_SY) * sin(_n_head_b18)))
				_S.invoke(_n_p_b0,"dot",[_n_hx_b27, _n_hy_b28, _n_WHITE])
				_S.invoke(_n_p_b0,"glow",[_n_hx_b27, _n_hy_b28, 5, _S.index_value(_n_C_b1,6), 0.3])
			_n_j_b9 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.arg(_args,6)
	if true:
		var _n_y_b7 = floori((_n_cy_b2 - _n_ry_b4))
		while _S.truth((_n_y_b7 <= ceili((_n_cy_b2 + _n_ry_b4)))):
			if true:
				var _n_x_b8 = floori((_n_cx_b1 - _n_rx_b3))
				while _S.truth((_n_x_b8 <= ceili((_n_cx_b1 + _n_rx_b3)))):
					var _n_dx_b9 = (float(((_n_x_b8 + 0.5) - _n_cx_b1))/_n_rx_b3)
					var _n_dy_b10 = (float(((_n_y_b7 + 0.5) - _n_cy_b2))/_n_ry_b4)
					if _S.truth((((_n_dx_b9 * _n_dx_b9) + (_n_dy_b10 * _n_dy_b10)) <= 1)):
						_S.invoke(_n_p_b0,"blend",[_n_x_b8, _n_y_b7, _n_c_b5, _n_a_b6])
					_n_x_b8 += 1.0
			_n_y_b7 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_blob = _S.read(_parent,"blob")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_meta = _S.read(_parent,"meta")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _n_flash_b6 = _S.arg(_args,6)
	var _object_0 = _n_g_b2
	var _n_FH_b7 = _S.named_value(_object_0,"FH")
	var _n_ax_b8 = _S.named_value(_object_0,"ax")
	var _n_rad_b9 = _S.named_value(_object_0,"rad")
	var _n_cx_b10 = _S.call_value(_n_ax_b8,[1])
	var _n_r_b11 = _S.call_value(_n_rad_b9,[1])
	var _n_L_b12 = _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"flash":_n_flash_b6,"this":_this}),"_f7")
	var _n_y0_b13 = ((-_n_FH_b7) - 3)
	if _S.truth(_n_back_b5):
		_S.call_value(_n_blob,[_n_p_b0, _n_cx_b10, (_n_y0_b13 + 1), (_n_r_b11 * 0.85), 6, _S.index_value(_n_C_b1,1), 0.6])
		_S.call_value(_n_blob,[_n_p_b0, (_n_cx_b10 - 4), (_n_y0_b13 - 3), (_n_r_b11 * 0.6), 3.5, _S.call_value(_n_L_b12,[_S.index_value(_n_C_b1,3)]), 0.45])
	if true:
		var _n_j_b14 = 0
		while _S.truth((_n_j_b14 < 16)):
			var _n_R_b15 = _S.MathFX.rng([_n_seed_b4,_n_j_b14])
			var _n_rr_b16 = (_n_r_b11 * _S.invoke(_n_R_b15,"range",[0.4, 1.15]))
			var _n_K_b17 = _S.invoke(_n_R_b15,"int",[1, 2])
			var _n_span_b18 = _S.invoke(_n_R_b15,"range",[1.4, 2.8])
			var _n_head_b19 = (_S.invoke(_n_R_b15,"range",[0, _n_TAU]) + (float(((_n_TAU * _n_K_b17) * _n_t_b3))/_S.named_value(_n_meta,"duration")))
			var _n_th0_b20 = _S.invoke(_n_R_b15,"range",[3.2, 6])
			var _n_lift_b21 = (_S.invoke(_n_R_b15,"range",[(-4), 3]) - ((1 - (float(_n_rr_b16)/(_n_r_b11 * 1.15))) * 5))
			if true:
				var _n_s2_b22 = 0
				while _S.truth((_n_s2_b22 <= _n_span_b18)):
					var _n_th_b23 = (_n_head_b19 - _n_s2_b22)
					var _n_sn_b24 = sin(_n_th_b23)
					if _S.truth(_S.binary("===",(_n_sn_b24 > 0),_n_back_b5)):
						_n_s2_b22 += (float(0.6)/_n_rr_b16)
						continue
					var _n_k_b25 = (float(_n_s2_b22)/_n_span_b18)
					var _n_th2_b26 = (_n_th0_b20 * sin((PI * pow((1 - _n_k_b25),0.7))))
					var _n_x_b27 = (_n_cx_b10 + (_n_rr_b16 * cos(_n_th_b23)))
					var _n_y_b28 = ((_n_y0_b13 + _n_lift_b21) + ((_n_rr_b16 * _n_SY) * _n_sn_b24))
					var _n_T_b29 = maxf(1,floori(_n_th2_b26+0.5))
					var _n_d_b30 = (1 if _S.truth(_n_back_b5) else 0)
					var _n_lit_b31 = (cos(_n_th_b23) < 0.3)
					if true:
						var _n_i_b32 = 0
						while _S.truth((_n_i_b32 < _n_T_b29)):
							var _n_c_b33 = (_S.call_value(_n_L_b12,[_S.index_value(_n_C_b1,((6 if _S.truth(_n_lit_b31) else 5) - _n_d_b30))]) if _S.truth(_S.binary("===",_n_i_b32,0)) else (_S.index_value(_n_C_b1,1) if _S.truth(((_n_T_b29 > 2) if _S.truth(_S.binary("===",_n_i_b32,(_n_T_b29 - 1))) else _S.binary("===",_n_i_b32,(_n_T_b29 - 1)))) else _S.call_value(_n_L_b12,[_S.index_value(_n_C_b1,((4 if _S.truth(_S.binary("===",_n_i_b32,1)) else 3) - _n_d_b30))])))
							_S.invoke(_n_p_b0,"blend",[_n_x_b27, ((_n_y_b28 - (float(_n_T_b29)/2)) + _n_i_b32), _n_c_b33, ((0.55 + (0.35 * (1 - _n_k_b25))) * (0.75 if _S.truth(_n_back_b5) else 1))])
							_n_i_b32 += 1.0
					_n_s2_b22 += (float(0.6)/_n_rr_b16)
			_n_j_b14 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_flash = _S.read(_parent,"flash")
	var _n_c_b0 = _S.arg(_args,0)
	return _S.ColorFX.mix(_n_c_b0,_S.index_value(_n_C,7),(_n_flash * 0.6))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_L_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	var _n_back_b6 = _S.arg(_args,6)
	var _n_S_b7 = _S.arg(_args,7)
	var _object_0 = _n_g_b3
	var _n_FH_b8 = _S.named_value(_object_0,"FH")
	var _n_ax_b9 = _S.named_value(_object_0,"ax")
	var _n_rad_b10 = _S.named_value(_object_0,"rad")
	_S.call_value(_n_cycle,[_n_t_b4, _S.named_value(_n_meta,"duration"), 24, _n_seed_b5, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"back":_n_back_b6,"rad":_n_rad_b10,"ax":_n_ax_b9,"FH":_n_FH_b8,"L":_n_L_b2,"p":_n_p_b0,"S":_n_S_b7,"this":_this}),"_f10")])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return _S.invoke(_n_q_b0,"range",[1.3, 1.95])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_back = _S.read(_parent,"back")
	var _n_rad = _S.read(_parent,"rad")
	var _n_ax = _S.read(_parent,"ax")
	var _n_FH = _S.read(_parent,"FH")
	var _n_SY = _S.read(_parent,"SY")
	var _n_L = _S.read(_parent,"L")
	var _n_p = _S.read(_parent,"p")
	var _n_drawLeaf = _S.read(_parent,"drawLeaf")
	var _n_stoneShape = _S.read(_parent,"stoneShape")
	var _n_S = _S.read(_parent,"S")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_k_b4 = (float(_n_age_b0)/_n_life_b1)
	var _n_sk_b5 = _S.invoke(_n_R_b2,"range",[0.15, 0.3])
	var _n_q_b6 = clampf((float((_n_k_b4 - _n_sk_b5))/(1 - _n_sk_b5)),0.0,1.0)
	var _n_u_b7 = _S.numeric_lerp(0.03,0.98,pow(_n_q_b6,0.85))
	var _n_th_b8 = (_S.invoke(_n_R_b2,"range",[0, _n_TAU]) + ((_S.invoke(_n_R_b2,"range",[2, 3.2]) * _n_TAU) * _n_k_b4))
	var _n_sn_b9 = sin(_n_th_b8)
	if _S.truth(_S.binary("===",(_n_sn_b9 > 0),_n_back)):
		return null
	var _n_fling_b10 = _S.MathFX.smooth(0.78,1,_n_q_b6)
	var _n_inward_b11 = (1 - _S.MathFX.smooth(0,_n_sk_b5,_n_k_b4))
	var _n_far_b12 = _S.invoke(_n_R_b2,"range",[26, 44])
	var _n_rr_b13 = _S.numeric_lerp(minf(68,((_S.call_value(_n_rad,[_n_u_b7]) * (1.12 + (_n_fling_b10 * 1.1))) + _S.invoke(_n_R_b2,"range",[2, 7]))),_n_far_b12,_n_inward_b11)
	var _n_x_b14 = (_S.call_value(_n_ax,[_n_u_b7]) + (_n_rr_b13 * cos(_n_th_b8)))
	var _n_y_b15 = minf((-1),((((-_n_u_b7) * _n_FH) + ((_n_rr_b13 * _n_SY) * _n_sn_b9)) - (_n_fling_b10 * 8)))
	var _n_a_b16 = (minf(1,(_n_k_b4 * 8)) * (1 - _S.MathFX.smooth(0.85,1,_n_k_b4)))
	var _n_kind_b17 = _S.invoke(_n_R_b2,"next",[])
	var _n_spin_b18 = (_S.invoke(_n_R_b2,"range",[(-14), 14]) * _n_age_b0)
	var _n_dk_b19 = (1 if _S.truth(_n_back) else 0)
	if _S.truth((_n_kind_b17 < 0.62)):
		var _n_o_b20 = (0 if _S.truth((_S.invoke(_n_R_b2,"next",[]) < 0.5)) else 4)
		var _n_pal_b21 = [_S.index_value(_n_L,_n_o_b20), _S.index_value(_n_L,(_n_o_b20 + 1)), _S.index_value(_n_L,((_n_o_b20 + 2) - _n_dk_b19)), _S.index_value(_n_L,((_n_o_b20 + 3) - _n_dk_b19))]
		_S.call_value(_n_drawLeaf,[_n_p, _n_x_b14, _n_y_b15, _S.invoke(_n_R_b2,"range",[6, 9]), _S.invoke(_n_R_b2,"range",[1.8, 2.6]), _n_spin_b18, (_n_age_b0 * _S.invoke(_n_R_b2,"range",[5, 10])), _n_pal_b21, _n_a_b16])
	else:
		if _S.truth((_n_kind_b17 < 0.8)):
			var _n_ca_b22 = (cos(_n_spin_b18) * 2.5)
			var _n_sa_b23 = (sin(_n_spin_b18) * 2.5)
			_S.invoke(_n_p,"line",[(_n_x_b14 - _n_ca_b22), (_n_y_b15 - _n_sa_b23), (_n_x_b14 + _n_ca_b22), (_n_y_b15 + _n_sa_b23), (_S.index_value(_n_L,0) if _S.truth(_n_back) else _S.index_value(_n_L,1)), _n_a_b16])
			_S.invoke(_n_p,"dot",[(_n_x_b14 + _n_ca_b22), (_n_y_b15 + _n_sa_b23), _S.index_value(_n_L,2), _n_a_b16])
		else:
			_S.call_value(_n_drawRock,[_n_p, _n_x_b14, _n_y_b15, _S.invoke(_n_R_b2,"range",[1.6, 2.6]), _n_spin_b18, _S.call_value(_n_stoneShape,[_n_R_b2, 5]), _n_S, _n_a_b16])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _n_cx0_b6 = _S.invoke(_n_g_b2,"ax",[0])
	_S.call_value(_n_cycle,[_n_t_b3, _S.named_value(_n_meta,"duration"), 40, _n_seed_b4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f12"), _S.function_value(_S.capture(_parent,{"back":_n_back_b5,"cx0":_n_cx0_b6,"p":_n_p_b0,"D":_n_D_b1,"this":_this}),"_f13")])
	if _S.truth(_n_back_b5):
		return null
	_S.call_value(_n_cycle,[_n_t_b3, _S.named_value(_n_meta,"duration"), 16, (_n_seed_b4 + 7), _S.function_value(_S.capture(_parent,{"this":_this}),"_f14"), _S.function_value(_S.capture(_parent,{"cx0":_n_cx0_b6,"p":_n_p_b0,"D":_n_D_b1,"this":_this}),"_f15")])
	if true:
		var _n_j_b7 = 0
		while _S.truth((_n_j_b7 < 7)):
			var _n_R_b8 = _S.MathFX.rng([(_n_seed_b4 + 3),_n_j_b7])
			var _n_rr_b9 = _S.invoke(_n_R_b8,"range",[12, 28])
			var _n_th0_b10 = (_S.invoke(_n_R_b8,"range",[0, _n_TAU]) + (float(((_n_TAU * 3) * _n_t_b3))/_S.named_value(_n_meta,"duration")))
			var _n_span_b11 = _S.invoke(_n_R_b8,"range",[0.5, 1.1])
			if true:
				var _n_s_b12 = 0
				while _S.truth((_n_s_b12 < _n_span_b11)):
					var _n_th_b13 = (_n_th0_b10 - _n_s_b12)
					_S.invoke(_n_p_b0,"dot",[(_n_cx0_b6 + (_n_rr_b9 * cos(_n_th_b13))), (0.5 + ((_n_rr_b9 * 0.18) * sin(_n_th_b13))), _S.index_value(_n_D_b1,(3 if _S.truth((_n_s_b12 < (_n_span_b11 * 0.4))) else 2)), (1 - (float(_n_s_b12)/_n_span_b11))])
					_n_s_b12 += (float(0.6)/_n_rr_b9)
			_n_j_b7 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return _S.invoke(_n_q_b0,"range",[0.7, 1.3])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_back = _S.read(_parent,"back")
	var _n_cx0 = _S.read(_parent,"cx0")
	var _n_p = _S.read(_parent,"p")
	var _n_D = _S.read(_parent,"D")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_th_b4 = (_S.invoke(_n_R_b2,"range",[0, _n_TAU]) + (_S.invoke(_n_R_b2,"range",[5, 9]) * _n_age_b0))
	var _n_sn_b5 = sin(_n_th_b4)
	if _S.truth(_S.binary("===",(_n_sn_b5 > 0),_n_back)):
		return null
	var _n_rr_b6 = (4 + (_n_k_b3 * _S.invoke(_n_R_b2,"range",[14, 28])))
	var _n_x_b7 = (_n_cx0 + (_n_rr_b6 * cos(_n_th_b4)))
	var _n_y_b8 = (((-1.5) - (_n_k_b3 * _S.invoke(_n_R_b2,"range",[4, 16]))) + ((_n_rr_b6 * 0.3) * _n_sn_b5))
	var _n_s_b9 = (_S.invoke(_n_R_b2,"range",[3, 6]) * (0.6 + (0.8 * _n_k_b3)))
	var _n_a_b10 = ((minf(1,(_n_k_b3 * 6)) * (1 - _n_k_b3)) * 0.6)
	_S.invoke(_n_p,"disc",[_n_x_b7, (_n_y_b8 + (_n_s_b9 * 0.2)), _n_s_b9, _S.index_value(_n_D,(1 if _S.truth(_n_back) else 2)), _n_a_b10])
	_S.invoke(_n_p,"disc",[(_n_x_b7 - (_n_s_b9 * 0.2)), (_n_y_b8 - (_n_s_b9 * 0.3)), (_n_s_b9 * 0.55), _S.index_value(_n_D,(2 if _S.truth(_n_back) else 3)), (_n_a_b10 * 0.8)])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	return _S.invoke(_n_q_b0,"range",[0.35, 0.6])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_cx0 = _S.read(_parent,"cx0")
	var _n_p = _S.read(_parent,"p")
	var _n_D = _S.read(_parent,"D")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_th_b3 = _S.invoke(_n_R_b2,"range",[0, _n_TAU])
	var _n_v_b4 = _S.invoke(_n_R_b2,"range",[25, 55])
	var _n_x_b5 = (_n_cx0 + (cos(_n_th_b3) * (4 + (_n_v_b4 * _n_age_b0))))
	var _n_y_b6 = (((sin(_n_th_b3) * 2) - (_S.invoke(_n_R_b2,"range",[40, 80]) * _n_age_b0)) + ((260 * _n_age_b0) * _n_age_b0))
	if _S.truth((_n_y_b6 < 0.5)):
		_S.invoke(_n_p,"dot",[_n_x_b5, minf(0,_n_y_b6), (_S.index_value(_n_D,3) if _S.truth((_S.invoke(_n_R_b2,"next",[]) < 0.5)) else _S.index_value(_n_D,4)), (1 - (float(_n_age_b0)/_n_life_b1))])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_q_b1 = (float(_n_t_b0)/_S.named_value(_n_meta,"duration"))
	return (maxf(0,(1 - (float(absf((_n_q_b1 - 0.62)))/0.025))) + (0.6 * maxf(0,(1 - (float(absf((_n_q_b1 - 0.69)))/0.015)))))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_geo = _S.read(_parent,"geo")
	var _n_flashAt = _S.read(_parent,"flashAt")
	var _n_skirt = _S.read(_parent,"skirt")
	var _n_crown = _S.read(_parent,"crown")
	var _n_bands = _S.read(_parent,"bands")
	var _n_debris = _S.read(_parent,"debris")
	var _n_body = _S.read(_parent,"body")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_D_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"dust"),5)
	var _n_g_b5 = _S.call_value(_n_geo,[_n_o_b2, _n_t_b1])
	var _n_f_b6 = _S.call_value(_n_flashAt,[_n_t_b1])
	_S.call_value(_n_skirt,[_n_p_b0, _n_D_b4, _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 5) + 1), true])
	_S.call_value(_n_crown,[_n_p_b0, _n_C_b3, _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 7) + 2), true, _n_f_b6])
	_S.call_value(_n_bands,[_n_p_b0, _n_C_b3, _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 3) + 5), true])
	_S.call_value(_n_debris,[_n_p_b0, _n_C_b3, _S.ColorFX.fit(_S.named_value(_n_o_b2,"leaves"),8), _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 11) + 3), true, _n_C_b3])
	_S.call_value(_n_body,[_n_p_b0, _n_C_b3, _n_D_b4, _n_g_b5, _n_t_b1, _S.named_value(_n_o_b2,"seed")])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_geo = _S.read(_parent,"geo")
	var _n_flashAt = _S.read(_parent,"flashAt")
	var _n_bands = _S.read(_parent,"bands")
	var _n_crown = _S.read(_parent,"crown")
	var _n_skirt = _S.read(_parent,"skirt")
	var _n_debris = _S.read(_parent,"debris")
	var _n_meta = _S.read(_parent,"meta")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_D_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"dust"),5)
	var _n_g_b5 = _S.call_value(_n_geo,[_n_o_b2, _n_t_b1])
	var _n_f_b6 = _S.call_value(_n_flashAt,[_n_t_b1])
	var _n_cx_b7 = _S.invoke(_n_g_b5,"ax",[1])
	_S.call_value(_n_bands,[_n_p_b0, _n_C_b3, _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 3) + 5), false])
	_S.call_value(_n_crown,[_n_p_b0, _n_C_b3, _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 7) + 2), false, _n_f_b6])
	_S.call_value(_n_skirt,[_n_p_b0, _n_D_b4, _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 5) + 1), false])
	_S.call_value(_n_debris,[_n_p_b0, _n_C_b3, _S.ColorFX.fit(_S.named_value(_n_o_b2,"leaves"),8), _n_g_b5, _n_t_b1, ((_S.named_value(_n_o_b2,"seed") * 11) + 3), false, _n_C_b3])
	_S.invoke(_n_p_b0,"glowLine",[_S.invoke(_n_g_b5,"ax",[0.1]), ((-_S.named_value(_n_g_b5,"FH")) * 0.1), _n_cx_b7, ((-_S.named_value(_n_g_b5,"FH")) * 0.9), 26, _S.index_value(_n_C_b3,5), 0.08])
	_S.invoke(_n_p_b0,"glow",[_S.invoke(_n_g_b5,"ax",[0]), (-2), 30, _S.index_value(_n_D_b4,3), 0.12])
	if _S.truth((_n_f_b6 > 0.05)):
		var _n_R_b8 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),99,floori(((float(_n_t_b1)/_S.named_value(_n_meta,"duration")) * 7))])
		var _n_path_b9 = _S.call_value(_n_bolt,[_n_R_b8, (_n_cx_b7 - 18), ((-_S.named_value(_n_g_b5,"FH")) - 6), (_n_cx_b7 + 16), ((-_S.named_value(_n_g_b5,"FH")) + 2), {"jag":0.3,"depth":3}])
		_S.invoke(_n_p_b0,"polyline",[_n_path_b9, (_n_WHITE if _S.truth((_n_f_b6 > 0.6)) else _S.index_value(_n_C_b3,7)), minf(1,(_n_f_b6 * 1.5))])
		_S.invoke(_n_p_b0,"glow",[_n_cx_b7, ((-_S.named_value(_n_g_b5,"FH")) - 2), 70, _S.index_value(_n_C_b3,7), (0.45 * _n_f_b6)])
	return null
