@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"nature_draw_rock","_f6":"nature_draw_spike","_f17":"ice_in_poly"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "stoneShape", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawRock", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawSpike", _S.function_value(_e, "_f6"))
	_S.define(_e, "spikeLook", _S.function_value(_e, "_f10"))
	_S.define(_e, "spikeCrack", _S.function_value(_e, "_f11"))
	_S.define(_e, "floorCrack", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawLeaf", _S.function_value(_e, "_f13"))
	_S.define(_e, "gasPuff", _S.function_value(_e, "_f15"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f16"))
	_exports["stoneShape"] = _S.read(_e, "stoneShape")
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_S.define(_e, "inPoly", _S.function_value(_e, "_f17"))
	_S.define(_e, "MASK", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", 64, 64)]))
	_S.define(_e, "FACE", _S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", 64, 64)]))
	_S.define(_e, "ROWS", 400)
	_S.define(_e, "RL", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "ROWS")]))
	_S.define(_e, "RR", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "ROWS")]))
	_S.define(_e, "RU", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "ROWS")]))
	_exports["drawRock"] = _S.read(_e, "drawRock")
	_exports["drawSpike"] = _S.read(_e, "drawSpike")
	_exports["spikeLook"] = _S.read(_e, "spikeLook")
	_exports["spikeCrack"] = _S.read(_e, "spikeCrack")
	_exports["floorCrack"] = _S.read(_e, "floorCrack")
	_exports["drawLeaf"] = _S.read(_e, "drawLeaf")
	_S.define(_e, "Drops", _S.class_value("Drops", _S.function_value(_e, "_f18"), {"add": _S.function_value(_e, "_f20"), "update": _S.function_value(_e, "_f21"), "draw": _S.function_value(_e, "_f22")}, {}, {}, null))
	_exports["Drops"] = _S.read(_e, "Drops")
	_exports["gasPuff"] = _S.read(_e, "gasPuff")
	_exports["bubble"] = _S.read(_e, "bubble")
	_S.define(_e, "Gas", _S.class_value("Gas", _S.function_value(_e, "_f23"), {"add": _S.function_value(_e, "_f24"), "prune": _S.function_value(_e, "_f25"), "at": _S.function_value(_e, "_f26"), "draw": _S.function_value(_e, "_f27")}, {}, {}, null))
	_exports["Gas"] = _S.read(_e, "Gas")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_n_b1 = _S.coalesce(_S.arg(_args,1),func():return _S.invoke(_n_R_b0,"int",[5, 7]))
	var _n_pts_b2 = []
	var _n_a0_b3 = _S.invoke(_n_R_b0,"range",[0, _n_TAU])
	var _n_squash_b4 = _S.invoke(_n_R_b0,"range",[0.7, 1])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < _n_n_b1)):
			var _n_a_b6 = (_n_a0_b3 + (float(((_n_i_b5 + _S.invoke(_n_R_b0,"range",[(-0.28), 0.28])) * _n_TAU))/_n_n_b1))
			var _n_r_b7 = _S.invoke(_n_R_b0,"range",[0.72, 1.12])
			_S.invoke(_n_pts_b2,"push",[[(cos(_n_a_b6) * _n_r_b7), ((sin(_n_a_b6) * _n_r_b7) * _n_squash_b4)]])
			_n_i_b5 += 1.0
	return _n_pts_b2
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_MASK = _S.read(_parent,"MASK")
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_FACE = _S.read(_parent,"FACE")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_pts_b5 = _S.arg(_args,5)
	var _n_S_b6 = _S.arg(_args,6)
	var _n_alpha_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_white_b8 = _S.coalesce(_S.arg(_args,8),func():return false)
	var _n_n_b9 = _S.prop(_n_S_b6,"length")
	var _n_top_b10 = (_n_n_b9 - 2)
	var _n_ca_b11 = cos(_n_a_b4)
	var _n_sa_b12 = sin(_n_a_b4)
	if _S.truth((_n_s_b3 < 1.4)):
		_S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, _S.index_value(_n_S_b6,(_n_top_b10 - 1)), _n_alpha_b7])
		_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + 1), _n_y_b2, _S.index_value(_n_S_b6,(_n_top_b10 - 3)), _n_alpha_b7])
		return null
	var _n_V_b13 = _S.invoke(_n_pts_b5,"map",[_S.function_value(_S.capture(_parent,{"ca":_n_ca_b11,"sa":_n_sa_b12,"s":_n_s_b3,"this":_this}),"_f2")])
	var _n_ang_b14 = _S.invoke(_n_V_b13,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f3")])
	var _n_lit_b15 = _S.invoke(_n_V_b13,"map",[_S.function_value(_S.capture(_parent,{"V":_n_V_b13,"this":_this}),"_f4")])
	var _n_X0_b16 = ((floori(_n_x_b1) - ceili((_n_s_b3 * 1.25))) - 1)
	var _n_Y0_b17 = ((floori(_n_y_b2) - ceili((_n_s_b3 * 1.25))) - 1)
	var _n_N_b18 = minf(62,((2 * ceili((_n_s_b3 * 1.25))) + 3))
	if true:
		var _n_j_b20 = 0
		while _S.truth((_n_j_b20 < _n_N_b18)):
			if true:
				var _n_i_b21 = 0
				while _S.truth((_n_i_b21 < _n_N_b18)):
					var _n_dx_b22 = (((_n_X0_b16 + _n_i_b21) + 0.5) - _n_x_b1)
					var _n_dy_b23 = (((_n_Y0_b17 + _n_j_b20) + 0.5) - _n_y_b2)
					var _n_k_b24 = ((_n_j_b20 * 64) + _n_i_b21)
					_S.set_prop(_n_MASK,_n_k_b24,(1 if _S.truth(_S.call_value(_n_inPoly,[_n_V_b13, _n_dx_b22, _n_dy_b23])) else 0),"=")
					if _S.truth(not _S.truth(_S.index_value(_n_MASK,_n_k_b24))):
						_n_i_b21 += 1.0
						continue
					var _n_g_b25 = atan2(_n_dy_b23,_n_dx_b22)
					var _n_f_b26 = 0
					if true:
						var _n_q_b27 = 0
						while _S.truth((_n_q_b27 < _S.prop(_n_ang_b14,"length"))):
							var _n_a0_b28 = _S.index_value(_n_ang_b14,_n_q_b27)
							var _n_a1_b29 = _S.index_value(_n_ang_b14,fmod((_n_q_b27 + 1),_S.prop(_n_ang_b14,"length")))
							var _n_d_b30 = fmod((_n_g_b25 - _n_a0_b28),_n_TAU)
							var _n_span_b31 = fmod((_n_a1_b29 - _n_a0_b28),_n_TAU)
							if _S.truth((_n_d_b30 < 0)):
								_n_d_b30 += _n_TAU
							if _S.truth((_n_span_b31 < 0)):
								_n_span_b31 += _n_TAU
							if _S.truth((_n_d_b30 <= _n_span_b31)):
								_n_f_b26 = _n_q_b27
								break
							_n_q_b27 += 1.0
					_S.set_prop(_n_FACE,_n_k_b24,_n_f_b26,"=")
					_n_i_b21 += 1.0
			_n_j_b20 += 1.0
	var _n_at_b19 = _S.function_value(_S.capture(_parent,{"N":_n_N_b18,"this":_this}),"_f5")
	if true:
		var _n_j_b32 = (-1)
		while _S.truth((_n_j_b32 <= _n_N_b18)):
			if true:
				var _n_i_b33 = (-1)
				while _S.truth((_n_i_b33 <= _n_N_b18)):
					var _n_X_b34 = (_n_X0_b16 + _n_i_b33)
					var _n_Y_b35 = (_n_Y0_b17 + _n_j_b32)
					if _S.truth(not _S.truth(_S.call_value(_n_at_b19,[_n_i_b33, _n_j_b32]))):
						if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_at_b19,[(_n_i_b33 - 1), _n_j_b32]),func():return _S.call_value(_n_at_b19,[(_n_i_b33 + 1), _n_j_b32])),func():return _S.call_value(_n_at_b19,[_n_i_b33, (_n_j_b32 - 1)])),func():return _S.call_value(_n_at_b19,[_n_i_b33, (_n_j_b32 + 1)]))):
							_S.invoke(_n_p_b0,"dot",[_n_X_b34, _n_Y_b35, _S.index_value(_n_S_b6,0), _n_alpha_b7])
						_n_i_b33 += 1.0
						continue
					if _S.truth(_n_white_b8):
						_S.invoke(_n_p_b0,"dot",[_n_X_b34, _n_Y_b35, _n_WHITE, _n_alpha_b7])
						_n_i_b33 += 1.0
						continue
					var _n_L_b36 = _S.index_value(_n_lit_b15,_S.index_value(_n_FACE,((_n_j_b32 * 64) + _n_i_b33)))
					var _n_edge_b37 = _S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_at_b19,[(_n_i_b33 - 1), _n_j_b32])),func():return not _S.truth(_S.call_value(_n_at_b19,[(_n_i_b33 + 1), _n_j_b32]))),func():return not _S.truth(_S.call_value(_n_at_b19,[_n_i_b33, (_n_j_b32 - 1)]))),func():return not _S.truth(_S.call_value(_n_at_b19,[_n_i_b33, (_n_j_b32 + 1)])))
					var _n_c_b38 = (_S.index_value(_n_S_b6,_n_top_b10) if _S.truth((_n_L_b36 > 0.55)) else (_S.index_value(_n_S_b6,(_n_top_b10 - 1)) if _S.truth((_n_L_b36 > 0.15)) else (_S.index_value(_n_S_b6,(_n_top_b10 - 2)) if _S.truth((_n_L_b36 > (-0.3))) else _S.index_value(_n_S_b6,(_n_top_b10 - 3)))))
					if _S.truth(_n_edge_b37):
						_n_c_b38 = (_S.index_value(_n_S_b6,(_n_top_b10 + 1)) if _S.truth((_n_L_b36 > 0.3)) else (_S.index_value(_n_S_b6,maxf(1,(_n_top_b10 - 4))) if _S.truth((_n_L_b36 < (-0.2))) else _n_c_b38))
					_S.invoke(_n_p_b0,"dot",[_n_X_b34, _n_Y_b35, _n_c_b38, _n_alpha_b7])
					_n_i_b33 += 1.0
			_n_j_b32 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_s = _S.read(_parent,"s")
	var _tuple_0 = _S.arg(_args,0)
	var _n_u_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [(((_n_u_b0 * _n_ca) - (_n_v_b1 * _n_sa)) * _n_s), (((_n_u_b0 * _n_sa) + (_n_v_b1 * _n_ca)) * _n_s)]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _tuple_0 = _S.arg(_args,0)
	var _n_vx_b0 = _S.prop(_tuple_0,0)
	var _n_vy_b1 = _S.prop(_tuple_0,1)
	return atan2(_n_vy_b1,_n_vx_b0)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_V = _S.read(_parent,"V")
	var _n_LX = _S.read(_parent,"LX")
	var _n_LY = _S.read(_parent,"LY")
	var _tuple_0 = _S.arg(_args,0)
	var _n_ax_b0 = _S.prop(_tuple_0,0)
	var _n_ay_b1 = _S.prop(_tuple_0,1)
	var _n_i_b2 = _S.arg(_args,1)
	var _tuple_1 = _S.index_value(_n_V,fmod((_n_i_b2 + 1),_S.prop(_n_V,"length")))
	var _n_bx_b3 = _S.prop(_tuple_1,0)
	var _n_by_b4 = _S.prop(_tuple_1,1)
	var _n_ex_b5 = (_n_bx_b3 - _n_ax_b0)
	var _n_ey_b6 = (_n_by_b4 - _n_ay_b1)
	var _n_l_b7 = _S.logical("||",_S.Bridge.hypot([_n_ex_b5, _n_ey_b6]),func():return 1)
	var _n_nx_b8 = (float(_n_ey_b6)/_n_l_b7)
	var _n_ny_b9 = (float((-_n_ex_b5))/_n_l_b7)
	if _S.truth((((_n_nx_b8 * (_n_ax_b0 + _n_bx_b3)) + (_n_ny_b9 * (_n_ay_b1 + _n_by_b4))) < 0)):
		_n_nx_b8 = (-_n_nx_b8)
		_n_ny_b9 = (-_n_ny_b9)
	return ((_n_nx_b8 * _n_LX) + (_n_ny_b9 * _n_LY))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_N = _S.read(_parent,"N")
	var _n_MASK = _S.read(_parent,"MASK")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	return (_S.binary("===",_S.index_value(_n_MASK,((_n_j_b1 * 64) + _n_i_b0)),1) if _S.truth(((_n_j_b1 < _n_N) if _S.truth(((_n_i_b0 < _n_N) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_N) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))))) else ((_n_j_b1 < _n_N) if _S.truth(((_n_i_b0 < _n_N) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))) else ((_n_i_b0 < _n_N) if _S.truth(((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0))) else ((_n_j_b1 >= 0) if _S.truth((_n_i_b0 >= 0)) else (_n_i_b0 >= 0)))))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ROWS = _S.read(_parent,"ROWS")
	var _n_RU = _S.read(_parent,"RU")
	var _n_RL = _S.read(_parent,"RL")
	var _n_RR = _S.read(_parent,"RR")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_base_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_lean_b5 = _S.arg(_args,5)
	var _n_sp_b6 = _S.arg(_args,6)
	var _n_S_b7 = _S.arg(_args,7)
	var _n_opts_b8 = _S.coalesce(_S.arg(_args,8),func():return {})
	if _S.truth((_n_h_b3 < 1.5)):
		return null
	var _n_a_b9 = (_S.named_value(_n_opts_b8,"a") if _S.named_value(_n_opts_b8,"a")!=null else 1)
	var _n_white_b10 = _S.named_value(_n_opts_b8,"white")
	var _n_glint_b11 = (_S.named_value(_n_opts_b8,"glint") if _S.named_value(_n_opts_b8,"glint")!=null else (-1))
	var _n_clip_b12 = (_S.named_value(_n_opts_b8,"clip") if _S.named_value(_n_opts_b8,"clip")!=null else 1)
	var _n_floorY_b13 = (_S.named_value(_n_opts_b8,"floor") if _S.named_value(_n_opts_b8,"floor")!=null else INF)
	var _n_hw_b14 = _S.function_value(_S.capture(_parent,{"w":_n_w_b4,"sp":_n_sp_b6,"this":_this}),"_f7")
	var _n_half_b15 = (_S.named_value(_n_opts_b8,"half") if _S.named_value(_n_opts_b8,"half")!=null else 0)
	var _n_Y0_b16 = (floori((_n_base_b2 - _n_h_b3)) - 2)
	var _n_NR_b17 = minf(_n_ROWS,((ceili(_n_base_b2) - _n_Y0_b16) + 2))
	if true:
		var _n_k_b21 = 0
		while _S.truth((_n_k_b21 < _n_NR_b17)):
			var _n_u_b22 = (float((_n_base_b2 - ((_n_Y0_b16 + _n_k_b21) + 0.5)))/_n_h_b3)
			_S.set_prop(_n_RU,_n_k_b21,_n_u_b22,"=")
			if _S.truth((((_n_u_b22 < 0) if _S.truth((_n_u_b22 < 0)) else (_n_u_b22 > 1)) if _S.truth(((_n_u_b22 < 0) if _S.truth((_n_u_b22 < 0)) else (_n_u_b22 > 1))) else (((_n_Y0_b16 + _n_k_b21) + 0.5) > _n_floorY_b13))):
				_S.set_prop(_n_RL,_n_k_b21,INF,"=")
				_S.set_prop(_n_RR,_n_k_b21,(-INF),"=")
			else:
				_S.set_prop(_n_RL,_n_k_b21,((_n_x_b1 + (_n_lean_b5 * _n_u_b22)) - _S.call_value(_n_hw_b14,[_n_u_b22, (-1)])),"=")
				_S.set_prop(_n_RR,_n_k_b21,((_n_x_b1 + (_n_lean_b5 * _n_u_b22)) + _S.call_value(_n_hw_b14,[_n_u_b22, 1])),"=")
			_n_k_b21 += 1.0
	var _n_inside_b18 = _S.function_value(_S.capture(_parent,{"Y0":_n_Y0_b16,"NR":_n_NR_b17,"clip":_n_clip_b12,"half":_n_half_b15,"this":_this}),"_f8")
	var _n_X0_b19 = floori((((_n_x_b1 - (float(_n_w_b4)/2)) - absf(_n_lean_b5)) - 2))
	var _n_X1_b20 = ceili((((_n_x_b1 + (float(_n_w_b4)/2)) + absf(_n_lean_b5)) + 2))
	if true:
		var _n_py_b23 = (floori((_n_base_b2 - _n_h_b3)) - 1)
		while _S.truth((_n_py_b23 < ceili(_n_base_b2))):
			if true:
				var _n_px_b24 = _n_X0_b19
				while _S.truth((_n_px_b24 <= _n_X1_b20)):
					if _S.truth(not _S.truth(_S.call_value(_n_inside_b18,[_n_px_b24, _n_py_b23]))):
						if _S.truth((_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside_b18,[(_n_px_b24 - 1), _n_py_b23]),func():return _S.call_value(_n_inside_b18,[(_n_px_b24 + 1), _n_py_b23])),func():return _S.call_value(_n_inside_b18,[_n_px_b24, (_n_py_b23 + 1)])),func():return _S.logical("&&",_S.call_value(_n_inside_b18,[_n_px_b24, (_n_py_b23 - 1)]),func():return (_n_py_b23 < (_n_base_b2 - 1)))) if _S.truth(((_n_py_b23 + 0.5) <= _n_floorY_b13)) else ((_n_py_b23 + 0.5) <= _n_floorY_b13))):
							_S.invoke(_n_p_b0,"dot",[_n_px_b24, _n_py_b23, _S.index_value(_n_S_b7,0), _n_a_b9])
						_n_px_b24 += 1.0
						continue
					if _S.truth(_n_white_b10):
						_S.invoke(_n_p_b0,"dot",[_n_px_b24, _n_py_b23, _n_WHITE, _n_a_b9])
						_n_px_b24 += 1.0
						continue
					var _n_k0_b25 = (_n_py_b23 - _n_Y0_b16)
					var _n_u_b26 = _S.index_value(_n_RU,_n_k0_b25)
					var _n_c_b27 = (_n_x_b1 + (_n_lean_b5 * _n_u_b26))
					var _n_l_b28 = _S.index_value(_n_RL,_n_k0_b25)
					var _n_r_b29 = _S.index_value(_n_RR,_n_k0_b25)
					var _n_fx_b30 = (_n_px_b24 + 0.5)
					var _n_band_b31 = 0
					var _n_st_b32 = false
					for _iter_0 in _S.array(_S.named_value(_n_sp_b6,"strata")):
						var _n_s_b38 = _iter_0
						var _n_d_b39 = (((_n_u_b26 * _n_h_b3) - (_n_s_b38 * _n_h_b3)) - (_S.named_value(_n_sp_b6,"slope") * (_n_fx_b30 - _n_c_b27)))
						if _S.truth((_n_d_b39 > 0)):
							_n_band_b31 += 1.0
						if _S.truth((absf(_n_d_b39) < 0.5)):
							_n_st_b32 = true
					var _n_jog_b33 = ((_S.MathFX.rand([_n_band_b31,_S.named_value(_n_sp_b6,"seed")]) - 0.5) * 0.3)
					var _n_q_b34 = (((float((_n_fx_b30 - _n_l_b28))/maxf(0.5,(_n_r_b29 - _n_l_b28))) * 2) - 1)
					var _n_qr_b35 = ((-0.18) + _n_jog_b33)
					var _n_i_b36 = null
					if _S.truth((_n_u_b26 > 0.93)):
						_n_i_b36 = (7 if _S.truth((_n_q_b34 < (_n_qr_b35 + 0.3))) else 5)
					else:
						if _S.truth((absf((_n_q_b34 - _n_qr_b35)) < maxf(0.09,(float(0.55)/maxf(1,(_n_r_b29 - _n_l_b28)))))):
							_n_i_b36 = 7
						else:
							if _S.truth((_n_q_b34 < _n_qr_b35)):
								_n_i_b36 = (7 if _S.truth(((_n_fx_b30 - _n_l_b28) < 1)) else (6 if _S.truth((_n_q_b34 < ((-0.5) + _n_jog_b33))) else 5))
							else:
								_n_i_b36 = (3 if _S.truth(((_n_r_b29 - _n_fx_b30) < 1)) else (4 if _S.truth((_n_q_b34 < (0.38 + _n_jog_b33))) else 2))
					if _S.truth(((_n_i_b36 < 7) if _S.truth(_n_st_b32) else _n_st_b32)):
						_n_i_b36 -= 1
					var _n_fleck_b37 = _S.MathFX.rand([((_n_px_b24 * 7) + 3),((_n_py_b23 * 13) + 5)])
					if _S.truth((_n_fleck_b37 < 0.035)):
						_n_i_b36 = (7 if _S.truth((_n_q_b34 < _n_qr_b35)) else (_n_i_b36 - 1))
					else:
						if _S.truth((_n_fleck_b37 > 0.965)):
							_n_i_b36 -= 1
					if _S.truth(((_n_q_b34 < (_n_qr_b35 + 0.1)) if _S.truth((_n_glint_b11 >= 0)) else (_n_glint_b11 >= 0))):
						var _n_g_b40 = absf((_n_u_b26 - _n_glint_b11))
						if _S.truth((_n_g_b40 < 0.035)):
							_n_i_b36 = 8
						else:
							if _S.truth((_n_g_b40 < 0.07)):
								_n_i_b36 = maxf(_n_i_b36,7)
					_S.invoke(_n_p_b0,"dot",[_n_px_b24, _n_py_b23, (_n_WHITE if _S.truth((_n_i_b36 >= 8)) else _S.index_value(_n_S_b7,clampf(_n_i_b36,0,(_S.prop(_n_S_b7,"length") - 1)))), _n_a_b9])
					_n_px_b24 += 1.0
			_n_py_b23 += 1.0
	if _S.truth(((_S.named_value(_n_opts_b8,"crack") > 0) if _S.truth(_S.named_value(_n_opts_b8,"cracks")) else _S.named_value(_n_opts_b8,"cracks"))):
		for _iter_1 in _S.array(_S.named_value(_n_opts_b8,"cracks")):
			var _n_path_b41 = _iter_1
			var _n_m_b42 = maxf(1,floori((_S.prop(_n_path_b41,"length") * _S.named_value(_n_opts_b8,"crack"))))
			if true:
				var _n_k_b43 = 1
				while _S.truth((_n_k_b43 < _n_m_b42)):
					var _tuple_2 = _S.index_value(_n_path_b41,(_n_k_b43 - 1))
					var _n_u0_b44 = _S.prop(_tuple_2,0)
					var _n_v0_b45 = _S.prop(_tuple_2,1)
					var _tuple_3 = _S.index_value(_n_path_b41,_n_k_b43)
					var _n_u1_b46 = _S.prop(_tuple_3,0)
					var _n_v1_b47 = _S.prop(_tuple_3,1)
					var _n_P_b48 = _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"lean":_n_lean_b5,"hw":_n_hw_b14,"base":_n_base_b2,"h":_n_h_b3,"this":_this}),"_f9")
					var _tuple_4 = _S.call_value(_n_P_b48,[[_n_u0_b44, _n_v0_b45]])
					var _n_ax_b49 = _S.prop(_tuple_4,0)
					var _n_ay_b50 = _S.prop(_tuple_4,1)
					var _tuple_5 = _S.call_value(_n_P_b48,[[_n_u1_b46, _n_v1_b47]])
					var _n_bx_b51 = _S.prop(_tuple_5,0)
					var _n_by_b52 = _S.prop(_tuple_5,1)
					if _S.truth((_n_u1_b46 > _n_clip_b12)):
						break
					if _S.truth(_S.logical("||",not _S.truth(_S.call_value(_n_inside_b18,[floori(_n_ax_b49), floori(_n_ay_b50)])),func():return not _S.truth(_S.call_value(_n_inside_b18,[floori(_n_bx_b51), floori(_n_by_b52)])))):
						_n_k_b43 += 1.0
						continue
					var _n_hot_b53 = (_S.named_value(_n_opts_b8,"heat") if _S.named_value(_n_opts_b8,"heat")!=null else 0)
					var _n_Gl_b54 = _S.named_value(_n_opts_b8,"glowRamp")
					if _S.truth((_n_Gl_b54 if _S.truth((_n_hot_b53 > 0.05)) else (_n_hot_b53 > 0.05))):
						_S.invoke(_n_p_b0,"line",[(_n_ax_b49 + 1), _n_ay_b50, (_n_bx_b51 + 1), _n_by_b52, _S.index_value(_n_S_b7,0), _n_a_b9])
						_S.invoke(_n_p_b0,"line",[_n_ax_b49, _n_ay_b50, _n_bx_b51, _n_by_b52, (_S.index_value(_n_Gl_b54,4) if _S.truth((_n_hot_b53 > 0.7)) else (_S.index_value(_n_Gl_b54,3) if _S.truth((_n_hot_b53 > 0.4)) else (_S.index_value(_n_Gl_b54,2) if _S.truth((_n_hot_b53 > 0.2)) else _S.index_value(_n_Gl_b54,1)))), _n_a_b9])
						if _S.truth(_S.binary("===",fmod(_n_k_b43,2),0)):
							_S.invoke(_n_p_b0,"glow",[_n_bx_b51, _n_by_b52, 7, _S.index_value(_n_Gl_b54,2), (0.35 * _n_hot_b53)])
					else:
						_S.invoke(_n_p_b0,"line",[_n_ax_b49, _n_ay_b50, _n_bx_b51, _n_by_b52, _S.index_value(_n_S_b7,0), _n_a_b9])
						_S.invoke(_n_p_b0,"dot",[(_n_bx_b51 + 1), (_n_by_b52 - 1), _S.index_value(_n_S_b7,6), (_n_a_b9 * 0.7)])
					_n_k_b43 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_sp = _S.read(_parent,"sp")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_side_b1 = _S.arg(_args,1)
	var _n_v_b2 = (((float(_n_w)/2) * pow(maxf(0,(1 - _n_u_b0)),0.85)) + 0.3)
	for _iter_0 in _S.array(_S.named_value(_n_sp,"notches")):
		var _n_n_b3 = _iter_0
		if _S.truth(((_n_u_b0 < (_S.named_value(_n_n_b3,"u") + 0.07)) if _S.truth(((_n_u_b0 > _S.named_value(_n_n_b3,"u")) if _S.truth(_S.binary("===",_S.named_value(_n_n_b3,"side"),_n_side_b1)) else _S.binary("===",_S.named_value(_n_n_b3,"side"),_n_side_b1))) else ((_n_u_b0 > _S.named_value(_n_n_b3,"u")) if _S.truth(_S.binary("===",_S.named_value(_n_n_b3,"side"),_n_side_b1)) else _S.binary("===",_S.named_value(_n_n_b3,"side"),_n_side_b1)))):
			_n_v_b2 -= (_S.named_value(_n_n_b3,"d") * (1 - (_n_u_b0 * 0.5)))
	return maxf(0,_n_v_b2)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_NR = _S.read(_parent,"NR")
	var _n_RL = _S.read(_parent,"RL")
	var _n_RR = _S.read(_parent,"RR")
	var _n_clip = _S.read(_parent,"clip")
	var _n_RU = _S.read(_parent,"RU")
	var _n_half = _S.read(_parent,"half")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_k_b2 = (_n_py_b1 - _n_Y0)
	var _n_fx_b3 = (_n_px_b0 + 0.5)
	if _S.truth(((((_n_k_b2 < 0) if _S.truth((_n_k_b2 < 0)) else (_n_k_b2 >= _n_NR)) if _S.truth(((_n_k_b2 < 0) if _S.truth((_n_k_b2 < 0)) else (_n_k_b2 >= _n_NR))) else (_n_fx_b3 < _S.index_value(_n_RL,_n_k_b2))) if _S.truth((((_n_k_b2 < 0) if _S.truth((_n_k_b2 < 0)) else (_n_k_b2 >= _n_NR)) if _S.truth(((_n_k_b2 < 0) if _S.truth((_n_k_b2 < 0)) else (_n_k_b2 >= _n_NR))) else (_n_fx_b3 < _S.index_value(_n_RL,_n_k_b2)))) else (_n_fx_b3 > _S.index_value(_n_RR,_n_k_b2)))):
		return false
	if _S.truth(((_S.index_value(_n_RU,_n_k_b2) > (_n_clip + ((_S.MathFX.rand([_n_px_b0,77]) - 0.5) * 0.07))) if _S.truth((_n_clip < 1)) else (_n_clip < 1))):
		return false
	if _S.truth(not _S.truth(_n_half)):
		return true
	var _n_q_b4 = (((float((_n_fx_b3 - _S.index_value(_n_RL,_n_k_b2)))/maxf(0.5,(_S.index_value(_n_RR,_n_k_b2) - _S.index_value(_n_RL,_n_k_b2)))) * 2) - 1)
	return ((_n_q_b4 < (-0.18)) if _S.truth((_n_half < 0)) else (_n_q_b4 >= (-0.18)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_lean = _S.read(_parent,"lean")
	var _n_hw = _S.read(_parent,"hw")
	var _n_base = _S.read(_parent,"base")
	var _n_h = _S.read(_parent,"h")
	var _tuple_0 = _S.arg(_args,0)
	var _n_u_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [((_n_x + (_n_lean * _n_u_b0)) + (_n_v_b1 * _S.call_value(_n_hw,[_n_u_b0, ((-1) if _S.truth((_n_v_b1 < 0)) else 1)]))), (_n_base - (_n_u_b0 * _n_h))]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_notches_b1 = []
	var _n_strata_b2 = []
	if true:
		var _n_i_b3 = 0
		var _n_n_b4 = _S.invoke(_n_R_b0,"int",[3, 5])
		while _S.truth((_n_i_b3 < _n_n_b4)):
			_S.invoke(_n_notches_b1,"push",[{"u":_S.invoke(_n_R_b0,"range",[0.1, 0.8]),"side":_S.invoke(_n_R_b0,"sign",[]),"d":_S.invoke(_n_R_b0,"range",[0.8, 1.8])}])
			_n_i_b3 += 1.0
	if true:
		var _n_i_b5 = 0
		var _n_n_b6 = _S.invoke(_n_R_b0,"int",[2, 4])
		while _S.truth((_n_i_b5 < _n_n_b6)):
			_S.invoke(_n_strata_b2,"push",[_S.invoke(_n_R_b0,"range",[0.12, 0.8])])
			_n_i_b5 += 1.0
	return {"notches":_n_notches_b1,"strata":_n_strata_b2,"slope":_S.invoke(_n_R_b0,"range",[(-0.25), 0.25]),"seed":_S.invoke(_n_R_b0,"int",[1, 9999])}
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_u0_b1 = _S.arg(_args,1)
	var _n_v0_b2 = _S.arg(_args,2)
	var _n_dir_b3 = _S.arg(_args,3)
	var _n_pts_b4 = [[_n_u0_b1, _n_v0_b2]]
	var _n_u_b5 = _n_u0_b1
	var _n_v_b6 = _n_v0_b2
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 9)):
			_n_u_b5 += _S.invoke(_n_R_b0,"range",[0.03, 0.08])
			_n_v_b6 += ((_n_dir_b3 * _S.invoke(_n_R_b0,"range",[0.05, 0.28])) + _S.invoke(_n_R_b0,"range",[(-0.12), 0.12]))
			if _S.truth(((_n_u_b5 > 0.95) if _S.truth((_n_u_b5 > 0.95)) else (absf(_n_v_b6) > 1))):
				break
			_S.invoke(_n_pts_b4,"push",[[_n_u_b5, _n_v_b6]])
			_n_i_b7 += 1.0
	return _n_pts_b4
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	_S.define(_e, "len", _S.arg(_args, 2))
	_S.define(_e, "pts", [[0, 0]])
	var _v47 = _S.scope(_e)
	_S.define(_v47, "x", 0)
	while _S.truth(_S.binary("<", _S.invoke(_S.read(_v47, "Math"), "abs", [_S.read(_v47, "x")]), _S.read(_v47, "len"))):
		var _v48 = _S.scope(_v47)
		_S.write(_v48, "x", _S.binary("*", _S.read(_v48, "side"), _S.invoke(_S.read(_v48, "R"), "range", [2, 5])), "+=", false)
		_S.invoke(_S.read(_v48, "pts"), "push", [[_S.read(_v48, "x"), _S.invoke(_S.read(_v48, "R"), "int", [0, 2])]])
	return _S.read(_e, "pts")

static func _f13(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_wid_b4 = _S.arg(_args,4)
	var _n_ang_b5 = _S.arg(_args,5)
	var _n_fl_b6 = _S.arg(_args,6)
	var _n_pal_b7 = _S.arg(_args,7)
	var _n_alpha_b8 = _S.coalesce(_S.arg(_args,8),func():return 1)
	var _n_ca_b9 = cos(_n_ang_b5)
	var _n_sa_b10 = sin(_n_ang_b5)
	var _n_sq_b11 = cos(_n_fl_b6)
	var _n_w_b12 = maxf(0.55,(absf(_n_sq_b11) * _n_wid_b4))
	var _n_under_b13 = (_n_sq_b11 < 0)
	var _n_R_b14 = ceili(((float(_n_len_b3)/2) + 2))
	var _n_X_b15 = floori(_n_x_b1+0.5)
	var _n_Y_b16 = floori(_n_y_b2+0.5)
	var _n_inside_b17 = _S.function_value(_S.capture(_parent,{"ca":_n_ca_b9,"sa":_n_sa_b10,"len":_n_len_b3,"w":_n_w_b12,"this":_this}),"_f14")
	if true:
		var _n_j_b18 = (-_n_R_b14)
		while _S.truth((_n_j_b18 <= _n_R_b14)):
			if true:
				var _n_i_b19 = (-_n_R_b14)
				while _S.truth((_n_i_b19 <= _n_R_b14)):
					var _n_s_b20 = _S.call_value(_n_inside_b17,[_n_i_b19, _n_j_b18])
					if _S.truth(not _S.truth(_n_s_b20)):
						if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside_b17,[(_n_i_b19 - 1), _n_j_b18]),func():return _S.call_value(_n_inside_b17,[(_n_i_b19 + 1), _n_j_b18])),func():return _S.call_value(_n_inside_b17,[_n_i_b19, (_n_j_b18 - 1)])),func():return _S.call_value(_n_inside_b17,[_n_i_b19, (_n_j_b18 + 1)]))):
							_S.invoke(_n_p_b0,"dot",[(_n_X_b15 + _n_i_b19), (_n_Y_b16 + _n_j_b18), _S.index_value(_n_pal_b7,0), _n_alpha_b8])
						_n_i_b19 += 1.0
						continue
					var _n_u_b21 = ((((_n_i_b19 + 0.5) * _n_ca_b9) + ((_n_j_b18 + 0.5) * _n_sa_b10)) + (float(_n_len_b3)/2))
					var _n_v_b22 = (((-(_n_i_b19 + 0.5)) * _n_sa_b10) + ((_n_j_b18 + 0.5) * _n_ca_b9))
					var _n_rib_b23 = _S.logical("&&",_S.logical("&&",_S.logical("&&",(absf(_n_v_b22) < 0.5),func():return (_n_u_b21 > (_n_len_b3 * 0.12))),func():return (_n_u_b21 < (_n_len_b3 * 0.88))),func():return (_n_w_b12 > 1.2))
					_S.invoke(_n_p_b0,"dot",[(_n_X_b15 + _n_i_b19), (_n_Y_b16 + _n_j_b18), (_S.index_value(_n_pal_b7,1) if _S.truth(_n_rib_b23) else (_S.index_value(_n_pal_b7,3) if _S.truth(_S.binary("!==",_S.binary("===",_n_s_b20,1),_n_under_b13)) else _S.index_value(_n_pal_b7,2))), _n_alpha_b8])
					_n_i_b19 += 1.0
			_n_j_b18 += 1.0
	_S.invoke(_n_p_b0,"dot",[(_n_X_b15 - (_n_ca_b9 * ((float(_n_len_b3)/2) + 1))), (_n_Y_b16 - (_n_sa_b10 * ((float(_n_len_b3)/2) + 1))), _S.index_value(_n_pal_b7,1), _n_alpha_b8])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_ca = _S.read(_parent,"ca")
	var _n_sa = _S.read(_parent,"sa")
	var _n_len = _S.read(_parent,"len")
	var _n_w = _S.read(_parent,"w")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_j_b1 = _S.arg(_args,1)
	var _n_u_b2 = ((((_n_i_b0 + 0.5) * _n_ca) + ((_n_j_b1 + 0.5) * _n_sa)) + (float(_n_len)/2))
	var _n_v_b3 = (((-(_n_i_b0 + 0.5)) * _n_sa) + ((_n_j_b1 + 0.5) * _n_ca))
	if _S.truth(((_n_u_b2 < 0) if _S.truth((_n_u_b2 < 0)) else (_n_u_b2 > _n_len))):
		return 0
	var _n_half_b4 = (_n_w * pow(sin((float((PI * _n_u_b2))/_n_len)),0.75))
	return ((1 if _S.truth((_n_v_b3 < 0)) else 2) if _S.truth((absf(_n_v_b3) <= _n_half_b4)) else 0)
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_belly_b5 = _S.arg(_args,5)
	var _n_body_b6 = _S.arg(_args,6)
	var _n_cap_b7 = _S.arg(_args,7)
	var _n_hi_b8 = _S.coalesce(_S.arg(_args,8),func():return 0)
	if _S.truth(((_n_a_b4 < 0.02) if _S.truth((_n_a_b4 < 0.02)) else (_n_r_b3 < 0.6))):
		return null
	_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + (_n_r_b3 * 0.06)), (_n_y_b2 + (_n_r_b3 * 0.28)), (_n_r_b3 * 0.9), _n_belly_b5, (_n_a_b4 * 0.55)])
	_S.invoke(_n_p_b0,"disc",[_n_x_b1, _n_y_b2, _n_r_b3, _n_body_b6, (_n_a_b4 * 0.45)])
	_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + (_n_r_b3 * 0.03)), (_n_y_b2 - (_n_r_b3 * 0.02)), (_n_r_b3 * 0.76), _n_body_b6, (_n_a_b4 * 0.5)])
	_S.invoke(_n_p_b0,"disc",[(_n_x_b1 - (_n_r_b3 * 0.2)), (_n_y_b2 - (_n_r_b3 * 0.34)), (_n_r_b3 * 0.52), _n_cap_b7, (_n_a_b4 * 0.45)])
	if _S.truth(_n_hi_b8):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b1 - (_n_r_b3 * 0.3)), (_n_y_b2 - (_n_r_b3 * 0.55)), (_n_r_b3 * 0.26), _n_hi_b8, (_n_a_b4 * 0.32)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_c1_b4 = _S.arg(_args,4)
	var _n_c2_b5 = _S.arg(_args,5)
	var _n_fill_b6 = _S.arg(_args,6)
	var _n_a_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_dome_b8 = _S.coalesce(_S.arg(_args,8),func():return false)
	var _n_R_b9 = (ceili(_n_r_b3) + 1)
	var _n_X_b10 = floori(_n_x_b1+0.5)
	var _n_Y_b11 = floori(_n_y_b2+0.5)
	if true:
		var _n_j_b12 = (-_n_R_b9)
		while _S.truth((_n_j_b12 <= (0 if _S.truth(_n_dome_b8) else _n_R_b9))):
			if true:
				var _n_i_b13 = (-_n_R_b9)
				while _S.truth((_n_i_b13 <= _n_R_b9)):
					var _n_d_b14 = _S.Bridge.hypot([_n_i_b13, _n_j_b12])
					if _S.truth((_n_d_b14 > (_n_r_b3 + 0.45))):
						_n_i_b13 += 1.0
						continue
					if _S.truth((_n_d_b14 > (_n_r_b3 - 0.6))):
						_S.invoke(_n_p_b0,"dot",[(_n_X_b10 + _n_i_b13), (_n_Y_b11 + _n_j_b12), (_n_c1_b4 if _S.truth(((_n_j_b12 < ((-_n_r_b3) * 0.2)) if _S.truth((_n_i_b13 < 0)) else (_n_i_b13 < 0))) else _n_c2_b5), _n_a_b7])
					else:
						_S.invoke(_n_p_b0,"blend",[(_n_X_b10 + _n_i_b13), (_n_Y_b11 + _n_j_b12), _n_fill_b6, (0.3 * _n_a_b7)])
					_n_i_b13 += 1.0
			_n_j_b12 += 1.0
	if _S.truth((_n_r_b3 >= 1.5)):
		_S.invoke(_n_p_b0,"dot",[(_n_X_b10 - floori((_n_r_b3 * 0.45)+0.5)), (_n_Y_b11 - floori((_n_r_b3 * 0.5)+0.5)), _n_WHITE, _n_a_b7])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_V_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_inside_b3 = false
	if true:
		var _n_i_b4 = 0
		var _n_j_b5 = (_S.prop(_n_V_b0,"length") - 1)
		while _S.truth((_n_i_b4 < _S.prop(_n_V_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_V_b0,_n_i_b4)
			var _n_xi_b6 = _S.prop(_tuple_0,0)
			var _n_yi_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_V_b0,_n_j_b5)
			var _n_xj_b8 = _S.prop(_tuple_1,0)
			var _n_yj_b9 = _S.prop(_tuple_1,1)
			if _S.truth(((_n_x_b1 < ((float(((_n_xj_b8 - _n_xi_b6) * (_n_y_b2 - _n_yi_b7)))/(_n_yj_b9 - _n_yi_b7)) + _n_xi_b6)) if _S.truth(_S.binary("!==",(_n_yi_b7 > _n_y_b2),(_n_yj_b9 > _n_y_b2))) else _S.binary("!==",(_n_yi_b7 > _n_y_b2),(_n_yj_b9 > _n_y_b2)))):
				_n_inside_b3 = not _S.truth(_n_inside_b3)
			_n_j_b5 = _n_i_b4
			_n_i_b4 += 1.0
	return _n_inside_b3
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_ground_b0 = _S.coalesce(_S.arg(_args,0),func():return _S.function_value(_S.capture(_parent,{"this":_this}),"_f19"))
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"ground",_n_ground_b0,"=")
	return null

static func _f19(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_s_b4 = _S.coalesce(_S.arg(_args,4),func():return 1)
	var _n_delay_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	_S.invoke(_S.named_value(_this,"list"),"push",[{"x":_n_x_b0,"y":_n_y_b1,"vx":_n_vx_b2,"vy":_n_vy_b3,"s":_n_s_b4,"delay":_n_delay_b5}])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "onLand", _S.arg(_args, 1))
	var _v60 = _S.scope(_e)
	_S.define(_v60, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v60, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v60, "i"), 0)):
		var _v61 = _S.scope(_v60)
		_S.define(_v61, "d", _S.prop(_S.prop(_S.read(_v61, "this"), "list"), _S.read(_v61, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v61, "d"), "delay"), 0)):
			var _v62 = _S.scope(_v61)
			_S.set_prop(_S.read(_v62, "d"), "delay", _S.read(_v62, "dt"), "-=", false)
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "-=", true)
			continue
		_S.define(_v61, "drag", _S.binary("/", 0.6, _S.prop(_S.read(_v61, "d"), "s")))
		_S.define(_v61, "py", _S.prop(_S.read(_v61, "d"), "y"))
		_S.set_prop(_S.read(_v61, "d"), "vy", _S.binary("*", _S.read(_v61, "GRAVITY"), _S.read(_v61, "dt")), "+=", false)
		_S.set_prop(_S.read(_v61, "d"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vx"), _S.read(_v61, "drag")), _S.read(_v61, "dt")), "-=", false)
		_S.set_prop(_S.read(_v61, "d"), "vy", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vy"), _S.read(_v61, "drag")), 0.5), _S.read(_v61, "dt")), "-=", false)
		_S.set_prop(_S.read(_v61, "d"), "x", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vx"), _S.read(_v61, "dt")), "+=", false)
		_S.set_prop(_S.read(_v61, "d"), "y", _S.binary("*", _S.prop(_S.read(_v61, "d"), "vy"), _S.read(_v61, "dt")), "+=", false)
		_S.define(_v61, "g", _S.invoke(_S.read(_v61, "this"), "ground", [_S.prop(_S.read(_v61, "d"), "x")]))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v61, "d"), "vy"), 0), func(): return _S.binary("<=", _S.read(_v61, "py"), _S.read(_v61, "g"))), func(): return _S.binary(">=", _S.prop(_S.read(_v61, "d"), "y"), _S.read(_v61, "g")))):
			var _v63 = _S.scope(_v61)
			_S.optional_call(_S.read(_v63, "onLand"), [_S.read(_v63, "d"), _S.read(_v63, "g")])
			_S.invoke(_S.prop(_S.read(_v63, "this"), "list"), "splice", [_S.read(_v63, "i"), 1])
		_v60 = _S.iteration(_v60)
		_S.write(_v60, "i", 1, "-=", true)
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.prop(_n_C_b1,"length")
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_d_b3 = _iter_0
		if _S.truth((_S.named_value(_n_d_b3,"delay") > 0)):
			continue
		var _n_sp_b4 = _S.logical("||",_S.Bridge.hypot([_S.named_value(_n_d_b3,"vx"), _S.named_value(_n_d_b3,"vy")]),func():return 1)
		var _n_ux_b5 = (float(_S.named_value(_n_d_b3,"vx"))/_n_sp_b4)
		var _n_uy_b6 = (float(_S.named_value(_n_d_b3,"vy"))/_n_sp_b4)
		var _n_len_b7 = minf(5,(0.5 + (_n_sp_b4 * 0.012)))
		_S.invoke(_n_p_b0,"line",[(_S.named_value(_n_d_b3,"x") - (_n_ux_b5 * _n_len_b7)), (_S.named_value(_n_d_b3,"y") - (_n_uy_b6 * _n_len_b7)), (_S.named_value(_n_d_b3,"x") - _n_ux_b5), (_S.named_value(_n_d_b3,"y") - _n_uy_b6), _S.index_value(_n_C_b1,(_n_n_b2 - 4))])
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_d_b3,"x"), _S.named_value(_n_d_b3,"y"), _S.index_value(_n_C_b1,(_n_n_b2 - 1))])
		if _S.truth((_S.named_value(_n_d_b3,"s") > 1)):
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_d_b3,"x") - _n_ux_b5), (_S.named_value(_n_d_b3,"y") - _n_uy_b6), _S.index_value(_n_C_b1,(_n_n_b2 - 2))])
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_d_b3,"x") + 1), _S.named_value(_n_d_b3,"y"), _S.index_value(_n_C_b1,(_n_n_b2 - 3))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_d_b3,"x"), _S.named_value(_n_d_b3,"y"), (3 + (_S.named_value(_n_d_b3,"s") * 1.5)), _S.index_value(_n_C_b1,(_n_n_b2 - 2)), 0.3])
	return null

static func _f23(_parent,_args:Array,_this=null):
	_S.set_prop(_this,"list",[],"=")
	_S.set_prop(_this,"n",0,"=")
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "r0", _S.arg(_args, 5))
	_S.define(_e, "r1", _S.arg(_args, 6))
	_S.define(_e, "end", _S.arg(_args, 7))
	_S.define(_e, "rise", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"r0": _S.read(_e, "r0")}, {"r1": _S.read(_e, "r1")}, {"t0": _S.read(_e, "t")}, {"end": _S.read(_e, "end")}, {"rise": _S.read(_e, "rise")}, {"seed": _S.binary("%", _S.binary("*", _S.set_prop(_S.read(_e, "this"), "n", 1, "+=", true), 37.7), 100)}])])
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	if true:
		var _n_i_b1 = (_S.prop(_S.named_value(_this,"list"),"length") - 1)
		while _S.truth((_n_i_b1 >= 0)):
			if _S.truth((_n_t_b0 > _S.named_value(_S.index_value(_S.named_value(_this,"list"),_n_i_b1),"end"))):
				_S.invoke(_S.named_value(_this,"list"),"splice",[_n_i_b1, 1])
			_n_i_b1 -= 1.0
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_age_b2 = (_n_t_b1 - _S.named_value(_n_q_b0,"t0"))
	var _n_e_b3 = (1 - exp(((-_n_age_b2) * 2.2)))
	var _n_sw_b4 = minf(1,_n_age_b2)
	var _n_x_b5 = ((_S.named_value(_n_q_b0,"x") + ((float(_S.named_value(_n_q_b0,"vx"))/2.2) * _n_e_b3)) + ((sin(((_n_t_b1 * 1.7) + _S.named_value(_n_q_b0,"seed"))) * 2.5) * _n_sw_b4))
	var _n_y_b6 = (((_S.named_value(_n_q_b0,"y") + ((float(_S.named_value(_n_q_b0,"vy"))/2.2) * _n_e_b3)) - (_S.named_value(_n_q_b0,"rise") * _n_age_b2)) + ((sin(((_n_t_b1 * 1.3) + (_S.named_value(_n_q_b0,"seed") * 2))) * 1.5) * _n_sw_b4))
	var _n_u_b7 = clampf((float(_n_age_b2)/maxf(0.01,(_S.named_value(_n_q_b0,"end") - _S.named_value(_n_q_b0,"t0")))),0.0,1.0)
	var _n_r_b8 = (_S.named_value(_n_q_b0,"r0") + ((_S.named_value(_n_q_b0,"r1") - _S.named_value(_n_q_b0,"r0")) * (1 - pow((1 - minf(1,(float(_n_age_b2)/1.2))),3))))
	return {"x":_n_x_b5,"y":_n_y_b6,"r":_n_r_b8,"a":(clampf((float(_n_age_b2)/0.15),0.0,1.0) * (1 - clampf((float((_n_u_b7 - 0.4))/0.6),0.0,1.0))),"u":_n_u_b7}
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_gasPuff = _S.read(_parent,"gasPuff")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_belly_b2 = _S.arg(_args,2)
	var _n_body_b3 = _S.arg(_args,3)
	var _n_cap_b4 = _S.arg(_args,4)
	var _n_hi_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	var _n_k_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_glow_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	for _iter_0 in _S.array(_S.named_value(_this,"list")):
		var _n_q_b8 = _iter_0
		var _n_g_b9 = _S.invoke(_this,"at",[_n_q_b8, _n_t_b1])
		if _S.truth((_S.named_value(_n_g_b9,"a") <= 0.02)):
			continue
		_S.call_value(_n_gasPuff,[_n_p_b0, _S.named_value(_n_g_b9,"x"), _S.named_value(_n_g_b9,"y"), _S.named_value(_n_g_b9,"r"), (_S.named_value(_n_g_b9,"a") * _n_k_b6), _n_belly_b2, _n_body_b3, _n_cap_b4, (_n_hi_b5 if _S.truth((_S.named_value(_n_g_b9,"u") < 0.5)) else 0)])
		if _S.truth(((_S.named_value(_n_g_b9,"r") > 4) if _S.truth(_n_glow_b7) else _n_glow_b7)):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_g_b9,"x"), _S.named_value(_n_g_b9,"y"), (_S.named_value(_n_g_b9,"r") * 1.6), _n_glow_b7, ((0.07 * _S.named_value(_n_g_b9,"a")) * _n_k_b6)])
	return null
