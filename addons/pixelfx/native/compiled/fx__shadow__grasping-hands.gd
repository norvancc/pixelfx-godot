@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/grasping-hands.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "Drops", _S.import_value("fx/shadow/_lib.js", "Drops"))
	_S.define(_e, "floorPool", _S.import_value("fx/shadow/_lib.js", "floorPool"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "arm", _S.function_value(_e, "_f0"))
	_S.define(_e, "gripOf", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawArm", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawHand", _S.function_value(_e, "_f4"))
	_S.define(_e, "create", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Grasping hands"}, {"desc": "Shadow arms burst up out of a dark pool with a splash, clench their hands into claws, strain, and are dragged back under, fingers clawing at the air."}, {"tags": ["shadow", "hands", "arms", "grab", "ground", "dark", "magic", "one-shot"]}, {"size": [200, 116]}, {"origin": [100, 100]}, {"duration": 3.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RX", 42)
	_S.define(_e, "OPEN", 0.32)
	_S.define(_e, "SHUT", 2.35)
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_gripOf = _S.read(_parent,"gripOf")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_e_b2 = clampf((float((_n_t_b1 - _S.named_value(_n_A_b0,"t0")))/0.22),0.0,1.0)
	var _n_d_b3 = clampf((float((_n_t_b1 - _S.named_value(_n_A_b0,"td")))/0.34),0.0,1.0)
	if _S.truth(((_n_e_b2 <= 0) if _S.truth((_n_e_b2 <= 0)) else (_n_d_b3 >= 1))):
		return null
	var _n_rise_b4 = (_S.invoke(_n_ease,"outBack",[_n_e_b2, 1.6]) * (1 - _S.invoke(_n_ease,"inQuad",[_n_d_b3])))
	var _n_hidden_b5 = ((1 - _n_rise_b4) * _S.named_value(_n_A_b0,"L"))
	var _n_grip_b6 = _S.call_value(_n_gripOf,[_n_A_b0, _n_t_b1])
	var _n_strain_b7 = ((sin(((_n_t_b1 * 47) + _S.named_value(_n_A_b0,"ph"))) * 0.03) if _S.truth(((_n_t_b1 < _S.named_value(_n_A_b0,"td")) if _S.truth((_n_t_b1 > (_S.named_value(_n_A_b0,"t0") + 0.5))) else (_n_t_b1 > (_S.named_value(_n_A_b0,"t0") + 0.5)))) else 0)
	var _n_elbow_b8 = (((_S.named_value(_n_A_b0,"bend") * (0.3 + (0.7 * _n_grip_b6))) * (1 - _n_d_b3)) + _n_strain_b7)
	var _n_lean_b9 = ((_S.named_value(_n_A_b0,"lean") + (0.06 * sin(((_n_t_b1 * 2.2) + _S.named_value(_n_A_b0,"ph"))))) + ((_n_d_b3 * _S.named_value(_n_A_b0,"lean")) * 0.6))
	var _n_th_b10 = ((float((-PI))/2) + _n_lean_b9)
	var _n_x_b11 = (_S.named_value(_n_A_b0,"x") - (cos(_n_th_b10) * _n_hidden_b5))
	var _n_y_b12 = (_S.named_value(_n_A_b0,"y") - (sin(_n_th_b10) * _n_hidden_b5))
	var _n_pts_b13 = []
	var _n_n_b14 = ceili((float(_S.named_value(_n_A_b0,"L"))/0.5))
	if true:
		var _n_i_b15 = 0
		while _S.truth((_n_i_b15 <= _n_n_b14)):
			var _n_s_b16 = (_n_i_b15 * 0.5)
			var _n_u_b17 = (float(_n_s_b16)/_S.named_value(_n_A_b0,"L"))
			_S.invoke(_n_pts_b13,"push",[{"x":_n_x_b11,"y":_n_y_b12,"th":_n_th_b10,"w":((_S.named_value(_n_A_b0,"W") * (1 - (0.5 * _n_u_b17))) + 0.4),"u":_n_u_b17}])
			_n_th_b10 += (0.5 * ((float((_n_elbow_b8 * exp((-pow((float((_n_u_b17 - 0.52))/0.07),2)))))/((0.07 * sqrt(PI)) * _S.named_value(_n_A_b0,"L"))) + (float(_S.named_value(_n_A_b0,"curve"))/_S.named_value(_n_A_b0,"L"))))
			_n_x_b11 += (cos(_n_th_b10) * 0.5)
			_n_y_b12 += (sin(_n_th_b10) * 0.5)
			_n_i_b15 += 1.0
	return _n_pts_b13
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_shut_b2 = _S.invoke(_n_ease,"outBack",[clampf((float(((_n_t_b1 - _S.named_value(_n_A_b0,"t0")) - 0.3))/0.12),0.0,1.0), 2.2])
	var _n_splay_b3 = _S.MathFX.smooth(_S.named_value(_n_A_b0,"td"),(_S.named_value(_n_A_b0,"td") + 0.12),_n_t_b1)
	return ((_n_shut_b2 * (1 - _n_splay_b3)) - (0.35 * _n_splay_b3))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_LX = _S.read(_parent,"LX")
	var _n_LY = _S.read(_parent,"LY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_pts_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_surf_b4 = _S.named_value(_n_A_b1,"y")
	for _iter_0 in _S.array(_n_pts_b2):
		var _n_q_b6 = _iter_0
		if _S.truth((_S.named_value(_n_q_b6,"y") > _n_surf_b4)):
			continue
		var _n_nx_b7 = (-sin(_S.named_value(_n_q_b6,"th")))
		var _n_ny_b8 = cos(_S.named_value(_n_q_b6,"th"))
		var _n_ks_b9 = (1 if _S.truth((((_n_nx_b7 * _n_LX) + (_n_ny_b8 * _n_LY)) >= 0)) else (-1))
		if true:
			var _n_v_b10 = (-_S.named_value(_n_q_b6,"w"))
			while _S.truth((_n_v_b10 <= _S.named_value(_n_q_b6,"w"))):
				var _n_x_b11 = (_S.named_value(_n_q_b6,"x") + (_n_nx_b7 * _n_v_b10))
				var _n_y_b12 = (_S.named_value(_n_q_b6,"y") + (_n_ny_b8 * _n_v_b10))
				var _n_u_b13 = ((float(_n_v_b10)/_S.named_value(_n_q_b6,"w")) * _n_ks_b9)
				if _S.truth((_n_y_b12 <= _n_surf_b4)):
					_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b12, (_S.index_value(_n_C_b3,2) if _S.truth((_n_u_b13 > 0.55)) else (_S.index_value(_n_C_b3,1) if _S.truth((_n_u_b13 > (-0.45))) else _S.index_value(_n_C_b3,0)))])
				_n_v_b10 += 0.5
	for _iter_1 in _S.array(_n_pts_b2):
		var _n_q_b14 = _iter_1
		if _S.truth((_S.named_value(_n_q_b14,"y") > _n_surf_b4)):
			continue
		var _n_nx_b15 = (-sin(_S.named_value(_n_q_b14,"th")))
		var _n_ny_b16 = cos(_S.named_value(_n_q_b14,"th"))
		var _n_f_b17 = ((_n_nx_b15 * _n_LX) + (_n_ny_b16 * _n_LY))
		var _n_ks_b18 = (1 if _S.truth((_n_f_b17 >= 0)) else (-1))
		var _n_l_b19 = (_n_ks_b18 * _S.named_value(_n_q_b14,"w"))
		if _S.truth(((_S.named_value(_n_q_b14,"y") - (_n_ny_b16 * _n_l_b19)) <= _n_surf_b4)):
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_q_b14,"x") - (_n_nx_b15 * _n_l_b19)), (_S.named_value(_n_q_b14,"y") - (_n_ny_b16 * _n_l_b19)), _S.index_value(_n_C_b3,3)])
		if _S.truth(((_S.named_value(_n_q_b14,"y") + (_n_ny_b16 * _n_l_b19)) <= _n_surf_b4)):
			_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_q_b14,"x") + (_n_nx_b15 * _n_l_b19)), (_S.named_value(_n_q_b14,"y") + (_n_ny_b16 * _n_l_b19)), (_S.index_value(_n_C_b3,7) if _S.truth((absf(_n_f_b17) > 0.8)) else _S.index_value(_n_C_b3,6))])
	var _n_base_b5 = _S.invoke(_n_pts_b2,"find",[_S.function_value(_S.capture(_parent,{"surf":_n_surf_b4,"this":_this}),"_f3")])
	if _S.truth(_n_base_b5):
		_S.invoke(_n_p_b0,"line",[((_S.named_value(_n_base_b5,"x") - _S.named_value(_n_base_b5,"w")) - 1.5), _n_surf_b4, ((_S.named_value(_n_base_b5,"x") + _S.named_value(_n_base_b5,"w")) + 1.5), _n_surf_b4, _S.index_value(_n_C_b3,5)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_surf = _S.read(_parent,"surf")
	var _n_q_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_q_b0,"y") <= _n_surf)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_gripOf = _S.read(_parent,"gripOf")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_pts_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_tip_b5 = _S.index_value(_n_pts_b2,(_S.prop(_n_pts_b2,"length") - 1))
	if _S.truth((_S.named_value(_n_tip_b5,"y") > (_S.named_value(_n_A_b1,"y") - 2))):
		return null
	var _n_th_b6 = _S.named_value(_n_tip_b5,"th")
	var _n_dx_b7 = cos(_n_th_b6)
	var _n_dy_b8 = sin(_n_th_b6)
	var _n_nx_b9 = (-_n_dy_b8)
	var _n_ny_b10 = _n_dx_b7
	var _n_g_b11 = _S.call_value(_n_gripOf,[_n_A_b1, _n_t_b4])
	var _n_side_b12 = _S.named_value(_n_A_b1,"curl")
	var _n_cx_b13 = (_S.named_value(_n_tip_b5,"x") + (_n_dx_b7 * 2.6))
	var _n_cy_b14 = (_S.named_value(_n_tip_b5,"y") + (_n_dy_b8 * 2.6))
	_S.invoke(_n_p_b0,"shade",[(_n_cx_b13 - 5), (_n_cy_b14 - 5), (_n_cx_b13 + 5), (_n_cy_b14 + 5), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b13,"dx":_n_dx_b7,"cy":_n_cy_b14,"dy":_n_dy_b8,"nx":_n_nx_b9,"ny":_n_ny_b10,"side":_n_side_b12,"C":_n_C_b3,"this":_this}),"_f5")])
	var _n_bone_b15 = _S.function_value(_S.capture(_parent,{"side":_n_side_b12,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f6")
	var _n_spread_b16 = (1 - (0.65 * maxf(0,_n_g_b11)))
	var _n_curl_b17 = (_n_g_b11 * 1.2)
	_S.invoke([(-2.2), (-0.75), 0.75, 2.2],"forEach",[_S.function_value(_S.capture(_parent,{"cx":_n_cx_b13,"dx":_n_dx_b7,"nx":_n_nx_b9,"cy":_n_cy_b14,"dy":_n_dy_b8,"ny":_n_ny_b10,"th":_n_th_b6,"spread":_n_spread_b16,"bone":_n_bone_b15,"curl":_n_curl_b17,"side":_n_side_b12,"this":_this}),"_f7")])
	var _tuple_0 = _S.call_value(_n_bone_b15,[(_n_cx_b13 - ((_n_nx_b9 * _n_side_b12) * 2.4)), (_n_cy_b14 - ((_n_ny_b10 * _n_side_b12) * 2.4)), (_n_th_b6 - (_n_side_b12 * (1 - (0.6 * _n_g_b11)))), 2.4, false])
	var _n_jx_b18 = _S.prop(_tuple_0,0)
	var _n_jy_b19 = _S.prop(_tuple_0,1)
	_S.call_value(_n_bone_b15,[_n_jx_b18, _n_jy_b19, (_n_th_b6 - (_n_side_b12 * (0.6 - (1.4 * _n_g_b11)))), 2, true])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b13, _n_cy_b14, 8, _S.index_value(_n_C_b3,5), (0.18 + (0.3 * maxf(0,_n_g_b11)))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_dx = _S.read(_parent,"dx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_dy = _S.read(_parent,"dy")
	var _n_nx = _S.read(_parent,"nx")
	var _n_ny = _S.read(_parent,"ny")
	var _n_C = _S.read(_parent,"C")
	var _n_side = _S.read(_parent,"side")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((_n_x_b0 - _n_cx) * _n_dx) + ((_n_y_b1 - _n_cy) * _n_dy))
	var _n_b_b3 = (((_n_x_b0 - _n_cx) * _n_nx) + ((_n_y_b1 - _n_cy) * _n_ny))
	var _n_d_b4 = (pow((float(_n_a_b2)/3),2) + pow((float(_n_b_b3)/2.7),2))
	if _S.truth((_n_d_b4 > 1.25)):
		return null
	if _S.truth((_n_d_b4 > 1)):
		return (_S.index_value(_n_C,6) if _S.truth(((_n_b_b3 * _n_side) < 0)) else _S.index_value(_n_C,3))
	return (_S.index_value(_n_C,2) if _S.truth(((_n_b_b3 * _n_side) < (-1))) else _S.index_value(_n_C,1))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_side = _S.read(_parent,"side")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_ang_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_last_b4 = _S.arg(_args,4)
	var _n_x1_b5 = (_n_x0_b0 + (cos(_n_ang_b2) * _n_len_b3))
	var _n_y1_b6 = (_n_y0_b1 + (sin(_n_ang_b2) * _n_len_b3))
	var _n_ox_b7 = floori((((-sin(_n_ang_b2)) * _n_side) * (-1))+0.5)
	var _n_oy_b8 = floori(((cos(_n_ang_b2) * _n_side) * (-1))+0.5)
	_S.invoke(_n_p,"line",[_n_x0_b0, _n_y0_b1, _n_x1_b5, _n_y1_b6, _S.index_value(_n_C,1)])
	_S.invoke(_n_p,"line",[(_n_x0_b0 + _n_ox_b7), (_n_y0_b1 + _n_oy_b8), (_n_x1_b5 + _n_ox_b7), (_n_y1_b6 + _n_oy_b8), _S.index_value(_n_C,5)])
	if _S.truth(_n_last_b4):
		_S.invoke(_n_p,"px",[_n_x1_b5, _n_y1_b6, _n_WHITE])
		_S.invoke(_n_p,"px",[(_n_x1_b5 + cos(_n_ang_b2)), (_n_y1_b6 + sin(_n_ang_b2)), _S.index_value(_n_C,7)])
	return [_n_x1_b5, _n_y1_b6]
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_dx = _S.read(_parent,"dx")
	var _n_nx = _S.read(_parent,"nx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_dy = _S.read(_parent,"dy")
	var _n_ny = _S.read(_parent,"ny")
	var _n_th = _S.read(_parent,"th")
	var _n_spread = _S.read(_parent,"spread")
	var _n_bone = _S.read(_parent,"bone")
	var _n_curl = _S.read(_parent,"curl")
	var _n_side = _S.read(_parent,"side")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_bx_b2 = ((_n_cx + (_n_dx * 2.6)) + ((_n_nx * _n_o_b0) * 0.9))
	var _n_by_b3 = ((_n_cy + (_n_dy * 2.6)) + ((_n_ny * _n_o_b0) * 0.9))
	var _n_len_b4 = (2.6 if _S.truth((_S.binary("===",_n_i_b1,0) if _S.truth(_S.binary("===",_n_i_b1,0)) else _S.binary("===",_n_i_b1,3))) else 3.2)
	var _n_a0_b5 = (_n_th + ((_n_o_b0 * 0.2) * _n_spread))
	var _tuple_0 = _S.call_value(_n_bone,[_n_bx_b2, _n_by_b3, (_n_a0_b5 + ((_n_curl * _n_side) * 0.6)), _n_len_b4, false])
	var _n_jx_b6 = _S.prop(_tuple_0,0)
	var _n_jy_b7 = _S.prop(_tuple_0,1)
	_S.call_value(_n_bone,[_n_jx_b6, _n_jy_b7, (_n_a0_b5 + ((_n_curl * _n_side) * 1.5)), (_n_len_b4 * 0.85), true])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "splash", _S.function_value(_e, "_f9"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f10"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.55]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), 0.5])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "ripples", [])
	_S.define(_e, "splats", [])
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", 0)
	_S.define(_e, "rx", _S.function_value(_e, "_f11"))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"onLand": _S.function_value(_e, "_f12")}])]))
	_S.define(_e, "LAY", [[_S.unary("-", 20), _S.unary("-", 2.5), 1], [17, _S.unary("-", 2.5), _S.unary("-", 1)], [_S.unary("-", 30), 2.5, 1], [28, 2.5, _S.unary("-", 1)]])
	_S.define(_e, "arms", _S.invoke(_S.read(_e, "LAY"), "map", [_S.function_value(_e, "_f13")]))
	return _S.merge([{"update": _S.function_value(_e, "_f14")}, {"drawBack": _S.function_value(_e, "_f15")}, {"draw": _S.function_value(_e, "_f16")}])

static func _f9(_parent,_args:Array,_this=null):
	var _n_drops = _S.read(_parent,"drops")
	var _n_R = _S.read(_parent,"R")
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_t = _S.read(_parent,"t")
	var _n_lights = _S.read(_parent,"lights")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _n_n_b2)):
			_S.invoke(_n_drops,"add",[(_n_x_b0 + _S.invoke(_n_R,"range",[(-2), 2])), (_n_y_b1 - 1), (_S.invoke(_n_R,"range",[(-70), 70]) * _n_k_b3), ((-_S.invoke(_n_R,"range",[90, 220])) * _n_k_b3), (2 if _S.truth(_S.invoke(_n_R,"chance",[0.4])) else 1)])
			_n_i_b4 += 1.0
	_S.invoke(_n_ripples,"push",[{"x":_n_x_b0,"t0":_n_t,"life":0.7,"w":1}])
	_S.invoke(_n_lights,"push",[{"x":_n_x_b0,"y":(_n_y_b1 - 7),"r":30,"k":(0.55 * _n_k_b3),"life":0.25,"max":0.25}])
	return null

static func _f10(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_RX = _S.read(_parent,"RX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_tt_b0 = _S.arg(_args,0)
	return ((_n_RX * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_tt_b0)/_n_OPEN),0.0,1.0)])) * (1 - _S.invoke(_n_ease,"inCubic",[clampf((float((_n_tt_b0 - _n_SHUT))/0.45),0.0,1.0)])))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_t = _S.read(_parent,"t")
	var _n_rx = _S.read(_parent,"rx")
	var _n_splats = _S.read(_parent,"splats")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_v_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	return (_S.invoke(_n_ripples,"push",[{"x":_n_x_b0,"t0":_n_t,"life":0.5,"w":0.6}]) if _S.truth((absf(_n_x_b0) < (_S.call_value(_n_rx,[_n_t]) * 0.95))) else _S.invoke(_n_splats,"push",[{"x":_n_x_b0,"t0":_n_t,"s":_n_s_b3}]))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_toward_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	return {"x":(_n_x_b0 + _S.invoke(_n_R,"range",[(-3), 3])),"y":_n_y_b1,"back":(_n_y_b1 < 0),"L":(_S.invoke(_n_R,"range",[44, 52]) if _S.truth((_n_y_b1 < 0)) else _S.invoke(_n_R,"range",[36, 44])),"W":(_S.invoke(_n_R,"range",[3.2, 3.8]) if _S.truth((_n_y_b1 < 0)) else _S.invoke(_n_R,"range",[3.6, 4.2])),"lean":((-_n_toward_b2) * _S.invoke(_n_R,"range",[0.16, 0.3])),"bend":(_n_toward_b2 * _S.invoke(_n_R,"range",[0.35, 0.6])),"curve":(_n_toward_b2 * _S.invoke(_n_R,"range",[0.05, 0.15])),"curl":_n_toward_b2,"t0":((0.3 + (_S.index_value([1, 3, 0, 2],_n_i_b3) * 0.06)) + _S.invoke(_n_R,"range",[0, 0.03])),"td":((1.45 + (_S.index_value([2, 0, 3, 1],_n_i_b3) * 0.09)) + _S.invoke(_n_R,"range",[0, 0.05])),"ph":_S.invoke(_n_R,"range",[0, _n_TAU]),"up":false,"shut":false,"down":false}
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v14 in _S.array(_S.read(_e, "arms")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "A", _v14)
		var _v16 = _S.scope(_v15)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v16, "A"), "up")), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.prop(_S.read(_v16, "A"), "t0")))):
			_S.last([_S.set_prop(_S.read(_v16, "A"), "up", true, "=", false), _S.call_value(_S.read(_v16, "splash"), [_S.prop(_S.read(_v16, "A"), "x"), _S.prop(_S.read(_v16, "A"), "y"), 12, 1])])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v16, "A"), "shut")), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.binary("+", _S.prop(_S.read(_v16, "A"), "t0"), 0.36)))):
			var _v17 = _S.scope(_v16)
			_S.set_prop(_S.read(_v17, "A"), "shut", true, "=", false)
			_S.define(_v17, "pts", _S.call_value(_S.read(_v17, "arm"), [_S.read(_v17, "A"), _S.read(_v17, "t")]))
			if _S.truth(_S.read(_v17, "pts")):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "q", _S.prop(_S.read(_v18, "pts"), _S.binary("-", _S.prop(_S.read(_v18, "pts"), "length"), 1)))
				_S.invoke(_S.read(_v18, "lights"), "push", [_S.merge([{"x": _S.prop(_S.read(_v18, "q"), "x")}, {"y": _S.prop(_S.read(_v18, "q"), "y")}, {"r": 22}, {"k": 0.7}, {"life": 0.2}, {"max": 0.2}])])
				_S.set_prop(_S.read(_v18, "A"), "snap", _S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v18, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.prop(_S.read(_v18, "q"), "th")]), 4))}, {"y": _S.binary("+", _S.prop(_S.read(_v18, "q"), "y"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.prop(_S.read(_v18, "q"), "th")]), 4))}, {"t0": _S.read(_v18, "t")}]), "=", false)
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v19, "i"), 6)):
					var _v20 = _S.scope(_v19)
					_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
					_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [60, 130]))
					_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.prop(_S.prop(_S.read(_v20, "A"), "snap"), "x"), _S.prop(_S.prop(_S.read(_v20, "A"), "snap"), "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), 20), _S.invoke(_S.read(_v20, "R"), "range", [0.12, 0.3])])
					_v19 = _S.iteration(_v19)
					_S.write(_v19, "i", 1, "+=", true)
				_S.invoke(_S.read(_v18, "puffs"), "spawn", [_S.prop(_S.read(_v18, "PK"), "SOOT"), _S.prop(_S.prop(_S.read(_v18, "A"), "snap"), "x"), _S.prop(_S.prop(_S.read(_v18, "A"), "snap"), "y"), 0, _S.unary("-", 12), 0.6, 3.5])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v16, "A"), "down")), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.binary("+", _S.prop(_S.read(_v16, "A"), "td"), 0.28)))):
			_S.last([_S.set_prop(_S.read(_v16, "A"), "down", true, "=", false), _S.call_value(_S.read(_v16, "splash"), [_S.prop(_S.read(_v16, "A"), "x"), _S.prop(_S.read(_v16, "A"), "y"), 8, 0.7])])
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "r"), 8), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SHUT"), 0.4)))):
		var _v21 = _S.scope(_e)
		var _v22 = _S.scope(_v21)
		_S.write(_v22, "acc", _S.binary("*", _S.read(_v22, "dt"), 8), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v22, "acc"), 1)):
			_S.invoke(_S.read(_v22, "puffs"), "spawn", [_S.prop(_S.read(_v22, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "r")), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [1, 4])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [14, 28])), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 0.85]), _S.invoke(_S.read(_v22, "R"), "range", [3, 6])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [_S.binary("*", _S.read(_v21, "dt"), 12)])):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v21, "r")), _S.unary("-", 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 70])), _S.invoke(_S.read(_v21, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "C"), 7), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 5)]]), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1])])
		if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [_S.binary("*", _S.read(_v21, "dt"), 6)])):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v21, "r")), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [2, 8])), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [10, 22])), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 0.9]), (_S.prop(_S.read(_v21, "C"), 3) if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])) else _S.prop(_S.read(_v21, "C"), 4)), _S.invoke(_S.read(_v21, "R"), "range", [3, 6])])
		if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [_S.binary("*", _S.read(_v21, "dt"), 3)])):
			_S.invoke(_S.read(_v21, "ripples"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v21, "r"))}, {"t0": _S.read(_v21, "t")}, {"life": 0.6}, {"w": 0.5}])])
	for _v23 in _S.array([_S.read(_e, "ripples"), _S.read(_e, "splats")]):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "a", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "i", _S.binary("-", _S.prop(_S.read(_v25, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v25, "i"), 0)):
			if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.prop(_S.read(_v25, "a"), _S.read(_v25, "i")), "t0")), _S.logical("??", _S.prop(_S.prop(_S.read(_v25, "a"), _S.read(_v25, "i")), "life"), func(): return 0.6))):
				_S.invoke(_S.read(_v25, "a"), "splice", [_S.read(_v25, "i"), 1])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
	var _v26 = _S.scope(_e)
	_S.define(_v26, "i", _S.binary("-", _S.prop(_S.read(_v26, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v26, "lights"), _S.read(_v26, "i")), "life", _S.read(_v26, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v26, "lights"), "splice", [_S.read(_v26, "i"), 1])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_rx = _S.read(_parent,"rx")
	var _n_t = _S.read(_parent,"t")
	var _n_RX = _S.read(_parent,"RX")
	var _n_C = _S.read(_parent,"C")
	var _n_ripples = _S.read(_parent,"ripples")
	var _n_floorPool = _S.read(_parent,"floorPool")
	var _n_puffs = _S.read(_parent,"puffs")
	var _n_PK = _S.read(_parent,"PK")
	var _n_ps = _S.read(_parent,"ps")
	var _n_arm = _S.read(_parent,"arm")
	var _n_drawArm = _S.read(_parent,"drawArm")
	var _n_DIM = _S.read(_parent,"DIM")
	var _n_drawHand = _S.read(_parent,"drawHand")
	var _n_arms = _S.read(_parent,"arms")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.call_value(_n_rx,[_n_t])
	var _n_k_b2 = (float(_n_r_b1)/_n_RX)
	_S.call_value(_n_floorPool,[_n_p_b0, _n_C, _n_r_b1, _n_t, _n_ripples])
	if _S.truth((_n_k_b2 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-16), 80, _S.index_value(_n_C,4), (0.2 * _n_k_b2)])
		_S.invoke(_n_p_b0,"glow",[0, (-8), ((_n_r_b1 * 1.7) + 12), _S.index_value(_n_C,4), (0.3 * _n_k_b2)])
		_S.invoke(_n_p_b0,"glow",[0, 0, (_n_r_b1 * 1.15), _S.index_value(_n_C,5), (0.16 * _n_k_b2)])
	_S.invoke(_n_puffs,"draw",[_n_p_b0, _S.named_value(_n_PK,"SOOT"), {"x":0,"y":6,"k":_n_k_b2,"reach":70}])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	for _iter_0 in _S.array(_n_arms):
		var _n_A_b3 = _iter_0
		if _S.truth(_S.named_value(_n_A_b3,"back")):
			var _n_pts_b4 = _S.call_value(_n_arm,[_n_A_b3, _n_t])
			if _S.truth(_n_pts_b4):
				_S.call_value(_n_drawArm,[_n_p_b0, _n_A_b3, _n_pts_b4, _n_DIM])
				_S.call_value(_n_drawHand,[_n_p_b0, _n_A_b3, _n_pts_b4, _n_DIM, _n_t])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_arm = _S.read(_parent,"arm")
	var _n_t = _S.read(_parent,"t")
	var _n_drawArm = _S.read(_parent,"drawArm")
	var _n_C = _S.read(_parent,"C")
	var _n_drawHand = _S.read(_parent,"drawHand")
	var _n_arms = _S.read(_parent,"arms")
	var _n_ease = _S.read(_parent,"ease")
	var _n_ringFast = _S.read(_parent,"ringFast")
	var _n_drops = _S.read(_parent,"drops")
	var _n_splats = _S.read(_parent,"splats")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_arms):
		var _n_A_b1 = _iter_0
		if _S.truth(not _S.truth(_S.named_value(_n_A_b1,"back"))):
			var _n_pts_b2 = _S.call_value(_n_arm,[_n_A_b1, _n_t])
			if _S.truth(_n_pts_b2):
				_S.call_value(_n_drawArm,[_n_p_b0, _n_A_b1, _n_pts_b2, _n_C])
				_S.call_value(_n_drawHand,[_n_p_b0, _n_A_b1, _n_pts_b2, _n_C, _n_t])
	for _iter_1 in _S.array(_n_arms):
		var _n_A_b3 = _iter_1
		if _S.truth((((_n_t - _S.named_value(_S.named_value(_n_A_b3,"snap"),"t0")) < 0.22) if _S.truth(_S.named_value(_n_A_b3,"snap")) else _S.named_value(_n_A_b3,"snap"))):
			var _n_u_b4 = (float((_n_t - _S.named_value(_S.named_value(_n_A_b3,"snap"),"t0")))/0.22)
			_S.call_value(_n_ringFast,[_n_p_b0, _S.named_value(_S.named_value(_n_A_b3,"snap"),"x"), _S.named_value(_S.named_value(_n_A_b3,"snap"),"y"), (2 + (5 * _S.invoke(_n_ease,"outCubic",[_n_u_b4]))), 1, (_S.index_value(_n_C,6) if _S.truth((_n_u_b4 < 0.4)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b4 < 0.7)) else _S.index_value(_n_C,3)))])
	_S.invoke(_n_drops,"draw",[_n_p_b0, _S.index_value(_n_C,1), _S.index_value(_n_C,5)])
	for _iter_2 in _S.array(_n_splats):
		var _n_s_b5 = _iter_2
		var _n_a_b6 = (1 - (float((_n_t - _S.named_value(_n_s_b5,"t0")))/0.6))
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b5,"x"), (-0.5), _S.index_value(_n_C,1), (_n_a_b6 * 1.5)])
		_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_s_b5,"x") + 1), (-0.5), _S.index_value(_n_C,2), _n_a_b6])
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_s_b5,"x"), (-1.5), _S.index_value(_n_C,5), _n_a_b6])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	for _iter_3 in _S.array(_n_lights):
		var _n_l_b7 = _iter_3
		var _n_q_b8 = (float(_S.named_value(_n_l_b7,"life"))/_S.named_value(_n_l_b7,"max"))
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_l_b7,"x"), _S.named_value(_n_l_b7,"y"), (_S.named_value(_n_l_b7,"r") * (0.6 + (0.4 * _n_q_b8))), _S.index_value(_n_C,5), ((_S.named_value(_n_l_b7,"k") * _n_q_b8) * _n_q_b8)])
	return null
