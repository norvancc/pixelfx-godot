@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/butterfly.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f3":"geometry_edge_distance","_f12":"ice_in_poly"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "flapping", _S.function_value(_e, "_f0"))
	_S.define(_e, "fold", _S.function_value(_e, "_f1"))
	_S.define(_e, "at", _S.function_value(_e, "_f2"))
	_S.define(_e, "edgeDist", _S.function_value(_e, "_f3"))
	_S.define(_e, "wingColor", _S.function_value(_e, "_f4"))
	_S.define(_e, "butterfly", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f9"))
	_S.define(_e, "meta", _S.merge([{"name": "Butterfly"}, {"desc": "An iridescent butterfly wanders a loop in bursts of quick wingbeats and open-winged glides, its veined, spotted wings shedding a twinkling trail of glowing dust."}, {"tags": ["critter", "butterfly", "insect", "flying", "magic", "glow", "loop"]}, {"size": [128, 88]}, {"origin": [64, 44]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#0b0f24", "#16224f", "#1f3f8a", "#2f74c8", "#4fb4f0", "#a0e6ff", "#ffffff"]}, {"spots": ["#3a1a08", "#c8641a", "#ffb43c", "#fff0b0"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 22), _S.unary("-", 20), 44, 40]))
	_S.define(_e, "FORE", [[0, _S.unary("-", 1)], [3, _S.unary("-", 6)], [8, _S.unary("-", 11)], [13, _S.unary("-", 12.5)], [16.5, _S.unary("-", 10.5)], [16.5, _S.unary("-", 6)], [13, _S.unary("-", 1.5)], [7, 1], [2, 1.5]])
	_S.define(_e, "HIND", [[0, 1], [6, 1.5], [11, 4], [12.5, 8.5], [10.5, 12.5], [6.5, 13.5], [3, 11], [0.5, 6]])
	_S.define(_e, "BURSTS", [[0, 0.95], [1.5, 2.55]])
	_S.define(_e, "inPoly", _S.function_value(_e, "_f12"))
	_S.define(_e, "FSPOTS", [[13.2, _S.unary("-", 10.2)], [15.2, _S.unary("-", 8.4)], [14.6, _S.unary("-", 5.6)], [11.6, _S.unary("-", 11.4)]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_BURSTS = _S.read(_parent,"BURSTS")
	var _n_t_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_BURSTS):
		var _tuple_1 = _iter_0
		var _n_a_b1 = _S.prop(_tuple_1,0)
		var _n_b_b2 = _S.prop(_tuple_1,1)
		if _S.truth(((_n_t_b0 < _n_b_b2) if _S.truth((_n_t_b0 >= _n_a_b1)) else (_n_t_b0 >= _n_a_b1))):
			return true
	return false
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_BURSTS = _S.read(_parent,"BURSTS")
	var _n_t_b0 = _S.arg(_args,0)
	_n_t_b0 = _S.call_value(_n_wrap,[_n_t_b0, _n_D])
	for _iter_0 in _S.array(_n_BURSTS):
		var _tuple_1 = _iter_0
		var _n_a_b1 = _S.prop(_tuple_1,0)
		var _n_b_b2 = _S.prop(_tuple_1,1)
		if _S.truth(((_n_t_b0 < _n_b_b2) if _S.truth((_n_t_b0 >= _n_a_b1)) else (_n_t_b0 >= _n_a_b1))):
			var _n_n_b3 = floori(((_n_b_b2 - _n_a_b1) * 6.3)+0.5)
			var _n_ph_b4 = ((float((_n_t_b0 - _n_a_b1))/(_n_b_b2 - _n_a_b1)) * _n_n_b3)
			return (0.14 + (0.86 * (0.5 + (0.5 * cos((_n_ph_b4 * _n_TAU))))))
	return 1
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_BURSTS = _S.read(_parent,"BURSTS")
	var _n_t_b0 = _S.arg(_args,0)
	_n_t_b0 = _S.call_value(_n_wrap,[_n_t_b0, _n_D])
	var _n_a_b1 = ((float(_n_t_b0)/_n_D) * _n_TAU)
	var _n_lift_b2 = 0
	for _iter_0 in _S.array(_n_BURSTS):
		var _tuple_1 = _iter_0
		var _n_s_b3 = _S.prop(_tuple_1,0)
		var _n_e_b4 = _S.prop(_tuple_1,1)
		_n_lift_b2 += ((-3) * sin((PI * clampf((float((_n_t_b0 - _n_s_b3))/(_n_e_b4 - _n_s_b3)),0.0,1.0))))
	return {"x":((30 * sin(_n_a_b1)) + (6 * sin((3 * _n_a_b1)))),"y":((12 * sin(((2 * _n_a_b1) + 0.4))) + _n_lift_b2),"vx":cos(_n_a_b1)}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_m_b3 = INF
	if true:
		var _n_i_b4 = 0
		var _n_j_b5 = (_S.prop(_n_pts_b0,"length") - 1)
		while _S.truth((_n_i_b4 < _S.prop(_n_pts_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b0,_n_j_b5)
			var _n_ax_b6 = _S.prop(_tuple_0,0)
			var _n_ay_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_i_b4)
			var _n_bx_b8 = _S.prop(_tuple_1,0)
			var _n_by_b9 = _S.prop(_tuple_1,1)
			var _n_dx_b10 = (_n_bx_b8 - _n_ax_b6)
			var _n_dy_b11 = (_n_by_b9 - _n_ay_b7)
			var _n_L2_b12 = (((_n_dx_b10 * _n_dx_b10) + (_n_dy_b11 * _n_dy_b11)) if _S.truth(((_n_dx_b10 * _n_dx_b10) + (_n_dy_b11 * _n_dy_b11))) else 1)
			var _n_u_b13 = clampf((float((((_n_x_b1 - _n_ax_b6) * _n_dx_b10) + ((_n_y_b2 - _n_ay_b7) * _n_dy_b11)))/_n_L2_b12),0.0,1.0)
			var _n_px_b14 = ((_n_ax_b6 + (_n_dx_b10 * _n_u_b13)) - _n_x_b1)
			var _n_py_b15 = ((_n_ay_b7 + (_n_dy_b11 * _n_u_b13)) - _n_y_b2)
			_n_m_b3 = minf(_n_m_b3,_S.Bridge.hypot([_n_px_b14, _n_py_b15]))
			_n_j_b5 = _n_i_b4
			_n_i_b4 += 1.0
	return _n_m_b3
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_HIND = _S.read(_parent,"HIND")
	var _n_FORE = _S.read(_parent,"FORE")
	var _n_edgeDist = _S.read(_parent,"edgeDist")
	var _n_FSPOTS = _S.read(_parent,"FSPOTS")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_Sp_b1 = _S.arg(_args,1)
	var _n_hind_b2 = _S.arg(_args,2)
	var _n_u_b3 = _S.arg(_args,3)
	var _n_v_b4 = _S.arg(_args,4)
	var _n_pts_b5 = (_n_HIND if _S.truth(_n_hind_b2) else _n_FORE)
	var _n_e_b6 = _S.call_value(_n_edgeDist,[_n_pts_b5, _n_u_b3, _n_v_b4])
	var _n_r_b7 = _S.Bridge.hypot([_n_u_b3, _n_v_b4])
	var _n_ang_b8 = atan2(_n_v_b4,_n_u_b3)
	if _S.truth((_n_e_b6 < 1)):
		return _S.index_value(_n_C_b0,0)
	if _S.truth(not _S.truth(_n_hind_b2)):
		if _S.truth((((_n_u_b3 + (_n_v_b4 * (-0.45))) > 14.2) if _S.truth(((_n_u_b3 + (_n_v_b4 * (-0.45))) > 14.2)) else ((_n_v_b4 < (-4)) if _S.truth((_n_r_b7 > 12.5)) else (_n_r_b7 > 12.5)))):
			for _iter_0 in _S.array(_n_FSPOTS):
				var _tuple_1 = _iter_0
				var _n_sx_b9 = _S.prop(_tuple_1,0)
				var _n_sy_b10 = _S.prop(_tuple_1,1)
				if _S.truth((_S.Bridge.hypot([(_n_u_b3 - _n_sx_b9), (_n_v_b4 - _n_sy_b10)]) < 0.9)):
					return _S.index_value(_n_C_b0,6)
			return _S.index_value(_n_C_b0,0)
	else:
		if _S.truth(((_n_r_b7 > 8) if _S.truth((_n_e_b6 < 2)) else (_n_e_b6 < 2))):
			return (_S.index_value(_n_C_b0,5) if _S.truth((sin((_n_ang_b8 * 10)) > 0.5)) else _S.index_value(_n_C_b0,1))
		var _n_d_b11 = _S.Bridge.hypot([(_n_u_b3 - 7.6), (_n_v_b4 - 9.4)])
		if _S.truth((_n_d_b11 < 0.7)):
			return _S.index_value(_n_C_b0,6)
		if _S.truth((_n_d_b11 < 1.4)):
			return _S.index_value(_n_C_b0,0)
		if _S.truth((_n_d_b11 < 2.2)):
			return _S.index_value(_n_Sp_b1,2)
	for _iter_2 in _S.array(([0.5, 1, 1.45] if _S.truth(_n_hind_b2) else [(-1.2), (-0.75), (-0.3)])):
		var _n_va_b12 = _iter_2
		if _S.truth(_S.logical("&&",((absf((_n_ang_b8 - _n_va_b12)) * _n_r_b7) < 0.45),func():return (_n_r_b7 > 3.5))):
			return _S.index_value(_n_C_b0,1)
	if _S.truth((_n_r_b7 < 3)):
		return _S.index_value(_n_C_b0,2)
	if _S.truth((_n_r_b7 < 6)):
		return _S.index_value(_n_C_b0,3)
	if _S.truth(((_n_v_b4 < (-3)) if _S.truth(((_n_e_b6 < 2.4) if _S.truth(not _S.truth(_n_hind_b2)) else not _S.truth(_n_hind_b2))) else ((_n_e_b6 < 2.4) if _S.truth(not _S.truth(_n_hind_b2)) else not _S.truth(_n_hind_b2)))):
		return _S.index_value(_n_C_b0,5)
	return _S.index_value(_n_C_b0,4)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_HIND = _S.read(_parent,"HIND")
	var _n_FORE = _S.read(_parent,"FORE")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_Sp_b2 = _S.arg(_args,2)
	var _n_w_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	_S.invoke(_n_g_b0,"clear",[])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b5 = _iter_0
		for _iter_1 in _S.array([true, false]):
			var _n_hind_b6 = _iter_1
			var _n_pts_b7 = (_n_HIND if _S.truth(_n_hind_b6) else _n_FORE)
			_S.invoke(_n_g_b0,"shade",[(-20), (-15), 20, 16, _S.function_value(_S.capture(_parent,{"s":_n_s_b5,"w":_n_w_b3,"pts":_n_pts_b7,"C":_n_C_b1,"Sp":_n_Sp_b2,"hind":_n_hind_b6,"this":_this}),"_f6")])
	_S.invoke(_n_g_b0,"ellipse",[0, 0.5, 1.6, 2.6, _S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f7")])
	if true:
		var _n_y_b8 = 3
		while _S.truth((_n_y_b8 < 10)):
			_S.invoke(_n_g_b0,"set",[(-1), _n_y_b8, (_S.index_value(_n_C_b1,2) if _S.truth((_n_y_b8 < 6)) else _S.index_value(_n_C_b1,1))])
			if _S.truth((_n_y_b8 < 8)):
				_S.invoke(_n_g_b0,"set",[0, _n_y_b8, _S.index_value(_n_C_b1,1)])
			_n_y_b8 += 1.0
	_S.invoke(_n_g_b0,"set",[(-1), (-3), _S.index_value(_n_C_b1,3)])
	_S.invoke(_n_g_b0,"set",[0, (-3), _S.index_value(_n_C_b1,2)])
	_S.invoke(_n_g_b0,"set",[(-1), (-4), _S.index_value(_n_C_b1,2)])
	_S.invoke(_n_g_b0,"set",[0, (-4), _S.index_value(_n_C_b1,1)])
	for _iter_2 in _S.array([(-1), 1]):
		var _n_s_b9 = _iter_2
		var _n_tip_b10 = [((_n_s_b9 * 4) - (0 if _S.truth((_n_s_b9 > 0)) else 1)), (-9.5)]
		_S.invoke(_n_g_b0,"line",[(0 if _S.truth((_n_s_b9 > 0)) else (-1)), (-5), _S.index_value(_n_tip_b10,0), _S.index_value(_n_tip_b10,1), _S.index_value(_n_C_b1,2)])
		_S.invoke(_n_g_b0,"set",[_S.index_value(_n_tip_b10,0), _S.index_value(_n_tip_b10,1), _S.index_value(_n_C_b1,6)])
	_S.invoke(_n_g_b0,"outline",[_S.function_value(_S.capture(_parent,{"C":_n_C_b1,"this":_this}),"_f8")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_s = _S.read(_parent,"s")
	var _n_w = _S.read(_parent,"w")
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_pts = _S.read(_parent,"pts")
	var _n_wingColor = _S.read(_parent,"wingColor")
	var _n_C = _S.read(_parent,"C")
	var _n_Sp = _S.read(_parent,"Sp")
	var _n_hind = _S.read(_parent,"hind")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	if _S.truth(_S.binary("!==",signf((_n_x_b0 + 0.001)),_n_s)):
		return 0
	var _n_u_b2 = (float((absf(_n_x_b0) - 1))/_n_w)
	var _n_v_b3 = _n_y_b1
	if _S.truth(((_n_u_b2 < 0) if _S.truth((_n_u_b2 < 0)) else not _S.truth(_S.call_value(_n_inPoly,[_n_pts, _n_u_b2, _n_v_b3])))):
		return 0
	var _n_c_b4 = _S.call_value(_n_wingColor,[_n_C, _n_Sp, _n_hind, _n_u_b2, _n_v_b3])
	if _S.truth((_S.binary("!==",_n_c_b4,_S.index_value(_n_C,0)) if _S.truth((_n_w < 0.5)) else (_n_w < 0.5))):
		_n_c_b4 = _S.ColorFX.mix(_n_c_b4,_S.index_value(_n_C,1),((0.5 - _n_w) * 1.6))
	return _n_c_b4
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_nx_b0 = _S.arg(_args,0)
	var _n_ny_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,3) if _S.truth(((_n_nx_b0 + _n_ny_b1) < (-0.4))) else _S.index_value(_n_C,1))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_nx_b2 = _S.arg(_args,2)
	var _n_ny_b3 = _S.arg(_args,3)
	return _S.index_value(_n_C,0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_fold = _S.read(_parent,"fold")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_butterfly = _S.read(_parent,"butterfly")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_C_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),7)
	var _n_Sp_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"spots"),4)
	var _n_S_b6 = _S.call_value(_n_at,[_n_t_b3])
	var _n_w_b7 = _S.call_value(_n_fold,[_n_t_b3])
	_S.call_value(_n_cycle,[_n_t_b3, _n_D, 56, ((_S.named_value(_n_o_b2,"seed") * 7) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"p":_n_p_b0,"C":_n_C_b4,"Sp":_n_Sp_b5,"this":_this}),"_f11")])
	var _n_g_b8 = _n_GRID
	_S.call_value(_n_butterfly,[_n_g_b8, _n_C_b4, _n_Sp_b5, _n_w_b7, _n_t_b3])
	_S.invoke(_n_g_b8,"draw",[_n_p_b0, 1, _S.named_value(_n_S_b6,"x"), _S.named_value(_n_S_b6,"y")])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_S_b6,"x"), _S.named_value(_n_S_b6,"y"), 38, _S.index_value(_n_C_b4,4), (0.16 + (0.14 * _n_w_b7))])
	_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_S_b6,"x"), _S.named_value(_n_S_b6,"y"), 12, _S.index_value(_n_C_b4,5), (0.12 + (0.1 * _n_w_b7))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1, 1.8])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_at = _S.read(_parent,"at")
	var _n_flapping = _S.read(_parent,"flapping")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_Sp = _S.read(_parent,"Sp")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_born_b4 = _S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D])
	var _n_B_b5 = _S.call_value(_n_at,[_n_born_b4])
	var _n_k_b6 = (float(_n_age_b0)/_n_L_b1)
	if _S.truth(_S.logical("&&",not _S.truth(_S.call_value(_n_flapping,[_n_born_b4])),func():return _S.invoke(_n_r_b2,"chance",[0.45]))):
		return null
	var _n_x_b7 = ((_S.named_value(_n_B_b5,"x") + _S.invoke(_n_r_b2,"range",[(-9), 9])) + (sin(((_n_age_b0 * 3) + _n_i_b3)) * 1.5))
	var _n_y_b8 = (((_S.named_value(_n_B_b5,"y") + _S.invoke(_n_r_b2,"range",[(-4), 8])) + (7 * _n_age_b0)) + ((3 * _n_age_b0) * _n_age_b0))
	var _n_tw_b9 = (0.5 + (0.5 * sin(((_n_age_b0 * 11) + (_n_i_b3 * 2.1)))))
	var _n_a_b10 = (minf(1,(_n_k_b6 * 8)) * (1 - _n_k_b6))
	_S.invoke(_n_p,"dot",[_n_x_b7, _n_y_b8, (_S.index_value(_n_C,6) if _S.truth((_n_tw_b9 > 0.7)) else (_S.index_value(_n_Sp,2) if _S.truth(_S.invoke(_n_r_b2,"chance",[0.3])) else _S.index_value(_n_C,5))), (_n_a_b10 * 1.2)])
	_S.invoke(_n_p,"glow",[_n_x_b7, _n_y_b8, 6, _S.index_value(_n_C,4), ((0.5 * _n_a_b10) * _n_tw_b9)])
	if _S.truth(((_n_k_b6 < 0.5) if _S.truth(((_n_tw_b9 > 0.85) if _S.truth(_S.binary("===",fmod(_n_i_b3,9),0)) else _S.binary("===",fmod(_n_i_b3,9),0))) else ((_n_tw_b9 > 0.85) if _S.truth(_S.binary("===",fmod(_n_i_b3,9),0)) else _S.binary("===",fmod(_n_i_b3,9),0)))):
		_S.call_value(_n_sparkle,[_n_p, _n_x_b7, _n_y_b8, 2, _S.index_value(_n_C,6), _S.index_value(_n_C,5), (0.3 * _n_a_b10)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_inside_b3 = false
	if true:
		var _n_i_b4 = 0
		var _n_j_b5 = (_S.prop(_n_pts_b0,"length") - 1)
		while _S.truth((_n_i_b4 < _S.prop(_n_pts_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_pts_b0,_n_i_b4)
			var _n_xi_b6 = _S.prop(_tuple_0,0)
			var _n_yi_b7 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,_n_j_b5)
			var _n_xj_b8 = _S.prop(_tuple_1,0)
			var _n_yj_b9 = _S.prop(_tuple_1,1)
			if _S.truth(((_n_x_b1 < ((float(((_n_xj_b8 - _n_xi_b6) * (_n_y_b2 - _n_yi_b7)))/(_n_yj_b9 - _n_yi_b7)) + _n_xi_b6)) if _S.truth(_S.binary("!==",(_n_yi_b7 > _n_y_b2),(_n_yj_b9 > _n_y_b2))) else _S.binary("!==",(_n_yi_b7 > _n_y_b2),(_n_yj_b9 > _n_y_b2)))):
				_n_inside_b3 = not _S.truth(_n_inside_b3)
			_n_j_b5 = _n_i_b4
			_n_i_b4 += 1.0
	return _n_inside_b3
	return null
