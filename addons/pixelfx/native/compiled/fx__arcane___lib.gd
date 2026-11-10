@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f9":"arcane_floor_ring"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "tone", _S.function_value(_e, "_f0"))
	_S.define(_e, "mote", _S.function_value(_e, "_f1"))
	_S.define(_e, "streak", _S.function_value(_e, "_f2"))
	_S.define(_e, "arc", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawArc", _S.function_value(_e, "_f4"))
	_S.define(_e, "floorRing", _S.function_value(_e, "_f9"))
	_S.define(_e, "glyph", _S.function_value(_e, "_f11"))
	_S.define(_e, "sigil", _S.function_value(_e, "_f12"))
	_S.define(_e, "shades", _S.function_value(_e, "_f13"))
	_S.define(_e, "squeezed", _S.function_value(_e, "_f14"))
	_S.define(_e, "BAYER", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f15")]))
	_S.define(_e, "CROSS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_S.define(_e, "bayer", _S.function_value(_e, "_f16"))
	_exports["bayer"] = _S.read(_e, "bayer")
	_exports["tone"] = _S.read(_e, "tone")
	_exports["mote"] = _S.read(_e, "mote")
	_exports["streak"] = _S.read(_e, "streak")
	_exports["arc"] = _S.read(_e, "arc")
	_exports["drawArc"] = _S.read(_e, "drawArc")
	_exports["floorRing"] = _S.read(_e, "floorRing")
	_S.define(_e, "GLYPHS", [[".#.", "#.#", ".#.", ".#.", "#.#"], ["#.#", "#.#", ".#.", "#.#", "#.#"], ["##.", "#.#", "##.", "#..", "#.."], ["#..", "#.#", "###", "#.#", "..#"], [".##", "#..", ".#.", "..#", "##."], ["###", ".#.", "###", ".#.", ".#."], ["#.#", "###", "#.#", "..#", "..#"], [".#.", ".##", ".#.", "##.", ".#."]])
	_exports["GLYPHS"] = _S.read(_e, "GLYPHS")
	_exports["glyph"] = _S.read(_e, "glyph")
	_S.define(_e, "SIGILS", [["..#..", ".#.#.", "#.#.#", "..#..", ".###.", "..#..", ".#.#."], ["#...#", ".#.#.", "..#..", ".###.", "..#..", ".#.#.", "#...#"], ["#....", "##...", "#.#..", "#..#.", "#.#..", "##...", "#...."], ["..#..", "#.#.#", ".###.", "..#..", "..#..", ".#.#.", "#...#"], ["#.#.#", "#.#.#", "#####", "..#..", "..#..", "..#..", ".###."], ["#...#", "##.##", "#.#.#", "#...#", "#.#.#", "##.##", "#...#"], ["..#..", ".#.#.", "#...#", ".#.#.", "..#..", "..#..", "..#.."], ["#..#.", "#.#..", "##...", "#....", "##...", "#.#..", "#..#."]])
	_exports["SIGILS"] = _S.read(_e, "SIGILS")
	_exports["sigil"] = _S.read(_e, "sigil")
	_exports["shades"] = _S.read(_e, "shades")
	_exports["squeezed"] = _S.read(_e, "squeezed")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_bayer = _S.read(_parent,"bayer")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_I_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_lo_b4 = _S.coalesce(_S.arg(_args,4),func():return 0.06)
	var _n_sharp_b5 = _S.coalesce(_S.arg(_args,5),func():return 0)
	var _n_b_b6 = _S.call_value(_n_bayer,[_n_x_b2, _n_y_b3])
	if _S.truth(((_n_b_b6 > (float(_n_I_b1)/_n_lo_b4)) if _S.truth((_n_I_b1 < _n_lo_b4)) else (_n_I_b1 < _n_lo_b4))):
		return 0
	var _n_n_b7 = (_S.prop(_n_R_b0,"length") - 1)
	var _n_f_b8 = (clampf(_n_I_b1,0.0,1.0) * _n_n_b7)
	var _n_i_b9 = floori(_n_f_b8)
	var _n_q_b10 = (clampf(((float(((_n_f_b8 - _n_i_b9) - 0.5))/(1 - _n_sharp_b5)) + 0.5),0.0,1.0) if _S.truth((_n_sharp_b5 > 0)) else (_n_f_b8 - _n_i_b9))
	if _S.truth((_n_q_b10 > _n_b_b6)):
		_n_i_b9 = minf(_n_n_b7,(_n_i_b9 + 1))
	return _S.index_value(_n_R_b0,_n_i_b9)
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_size_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_k_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	var _n_glow_b8 = _S.coalesce(_S.arg(_args,8),func():return 0.4)
	var _n_sp_b9 = _S.logical("||",_S.Bridge.hypot([_n_vx_b3, _n_vy_b4]),func():return 1)
	var _n_ux_b10 = (float(_n_vx_b3)/_n_sp_b9)
	var _n_uy_b11 = (float(_n_vy_b4)/_n_sp_b9)
	var _n_len_b12 = (minf(16,(0.5 + (_n_sp_b9 * 0.026))) * _n_size_b6)
	var _n_a_b13 = ((float(_n_k_b7)/0.35) if _S.truth((_n_k_b7 < 0.35)) else 1)
	if _S.truth((_n_len_b12 > 1.2)):
		_S.invoke(_n_p_b0,"line",[(_n_x_b1 - (_n_ux_b10 * _n_len_b12)), (_n_y_b2 - (_n_uy_b11 * _n_len_b12)), (_n_x_b1 - ((_n_ux_b10 * _n_len_b12) * 0.35)), (_n_y_b2 - ((_n_uy_b11 * _n_len_b12) * 0.35)), _S.ColorFX.scale_color(_n_c_b5,0.55), _n_a_b13])
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - ((_n_ux_b10 * _n_len_b12) * 0.4)), (_n_y_b2 - ((_n_uy_b11 * _n_len_b12) * 0.4)), _n_x_b1, _n_y_b2, _n_c_b5, _n_a_b13])
	if _S.truth((_n_glow_b8 > 0)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (2.5 + _n_size_b6), _n_c_b5, (_n_glow_b8 * _n_k_b7)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_maxLen_b7 = _S.coalesce(_S.arg(_args,7),func():return 7)
	var _n_glow_b8 = _S.coalesce(_S.arg(_args,8),func():return 0.4)
	var _n_sp_b9 = _S.logical("||",_S.Bridge.hypot([_n_vx_b3, _n_vy_b4]),func():return 1)
	var _n_ux_b10 = (float(_n_vx_b3)/_n_sp_b9)
	var _n_uy_b11 = (float(_n_vy_b4)/_n_sp_b9)
	var _n_L_b12 = clampf((float(_n_sp_b9)/30),1,_n_maxLen_b7)
	if true:
		var _n_d_b13 = _n_L_b12
		while _S.truth((_n_d_b13 >= 0)):
			_S.invoke(_n_p_b0,"dot",[(_n_x_b1 - (_n_ux_b10 * _n_d_b13)), (_n_y_b2 - (_n_uy_b11 * _n_d_b13)), (_n_WHITE if _S.truth((_n_d_b13 < 1)) else (_n_c_b5 if _S.truth((_n_d_b13 < (_n_L_b12 * 0.5))) else _S.ColorFX.scale_color(_n_c_b5,0.6))), ((1 if _S.truth((_n_d_b13 < (_n_L_b12 * 0.5))) else (1.2 - (float(_n_d_b13)/_n_L_b12))) * _n_a_b6)])
			_n_d_b13 -= 0.5
	if _S.truth((_n_glow_b8 > 0)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 4, _n_c_b5, (_n_glow_b8 * _n_a_b6)])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_y1_b4 = _S.arg(_args,4)
	var _object_0 = _S.coalesce(_S.arg(_args,5),func():return {})
	var _n_jag_b5 = _S.coalesce(_S.named_value(_object_0,"jag"),func():return 0.3)
	var _n_forks_b6 = _S.coalesce(_S.named_value(_object_0,"forks"),func():return 1)
	var _n_forkLen_b7 = _S.coalesce(_S.named_value(_object_0,"forkLen"),func():return 0.5)
	var _n_L_b8 = _S.Bridge.hypot([(_n_x1_b3 - _n_x0_b1), (_n_y1_b4 - _n_y0_b2)])
	var _n_depth_b9 = maxf(1,minf(5,floori((log((float(_n_L_b8)/1.5))/log(2.0))+0.5)))
	var _n_main_b10 = _S.call_value(_n_bolt,[_n_r_b0, _n_x0_b1, _n_y0_b2, _n_x1_b3, _n_y1_b4, {"jag":_n_jag_b5,"depth":_n_depth_b9}])
	var _n_out_b11 = [{"pts":_n_main_b10,"w":1}]
	if true:
		var _n_k_b12 = 0
		while _S.truth(((_S.prop(_n_main_b10,"length") > 3) if _S.truth((_n_k_b12 < _n_forks_b6)) else (_n_k_b12 < _n_forks_b6))):
			if _S.truth((_S.invoke(_n_r_b0,"next",[]) > 0.7)):
				_n_k_b12 += 1.0
				continue
			var _n_i_b13 = (1 + floori((_S.invoke(_n_r_b0,"next",[]) * (_S.prop(_n_main_b10,"length") - 2))))
			var _tuple_1 = _S.index_value(_n_main_b10,_n_i_b13)
			var _n_x_b14 = _S.prop(_tuple_1,0)
			var _n_y_b15 = _S.prop(_tuple_1,1)
			var _tuple_2 = _S.index_value(_n_main_b10,(_n_i_b13 - 1))
			var _n_px_b16 = _S.prop(_tuple_2,0)
			var _n_py_b17 = _S.prop(_tuple_2,1)
			var _n_a_b18 = (atan2((_n_y_b15 - _n_py_b17),(_n_x_b14 - _n_px_b16)) + (((-1) if _S.truth((_S.invoke(_n_r_b0,"next",[]) < 0.5)) else 1) * (0.4 + (_S.invoke(_n_r_b0,"next",[]) * 0.6))))
			var _n_l_b19 = (((_n_L_b8 * _n_forkLen_b7) * (0.4 + (0.6 * _S.invoke(_n_r_b0,"next",[])))) * (1 - (float(_n_i_b13)/_S.prop(_n_main_b10,"length"))))
			if _S.truth((_n_l_b19 > 1.5)):
				_S.invoke(_n_out_b11,"push",[{"pts":_S.call_value(_n_bolt,[_n_r_b0, _n_x_b14, _n_y_b15, (_n_x_b14 + (cos(_n_a_b18) * _n_l_b19)), (_n_y_b15 + (sin(_n_a_b18) * _n_l_b19)), {"jag":(_n_jag_b5 * 1.1),"depth":maxf(1,(_n_depth_b9 - 2))}]),"w":0.55}])
			_n_k_b12 += 1.0
	return _n_out_b11
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_paths_b1 = _S.arg(_args,1)
	var _n_cols_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_glowK_b4 = _S.coalesce(_S.arg(_args,4),func():return 0.5)
	var _n_steps_b5 = _S.function_value(_S.capture(_parent,{"paths":_n_paths_b1,"this":_this}),"_f5")
	if _S.truth((_n_k_b3 > 0.45)):
		_S.call_value(_n_steps_b5,[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"cols":_n_cols_b2,"k":_n_k_b3,"this":_this}),"_f6")])
	if _S.truth((_n_k_b3 > 0.25)):
		_S.call_value(_n_steps_b5,[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"cols":_n_cols_b2,"this":_this}),"_f7")])
	_S.call_value(_n_steps_b5,[_S.function_value(_S.capture(_parent,{"p":_n_p_b0,"k":_n_k_b3,"cols":_n_cols_b2,"glowK":_n_glowK_b4,"this":_this}),"_f8")])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_paths = _S.read(_parent,"paths")
	var _n_fn_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_paths):
		var _n_path_b1 = _iter_0
		if true:
			var _n_i_b2 = 0
			while _S.truth((_n_i_b2 < (_S.prop(_S.named_value(_n_path_b1,"pts"),"length") - 1))):
				var _tuple_1 = _S.index_value(_S.named_value(_n_path_b1,"pts"),_n_i_b2)
				var _n_ax_b3 = _S.prop(_tuple_1,0)
				var _n_ay_b4 = _S.prop(_tuple_1,1)
				var _tuple_2 = _S.index_value(_S.named_value(_n_path_b1,"pts"),(_n_i_b2 + 1))
				var _n_bx_b5 = _S.prop(_tuple_2,0)
				var _n_by_b6 = _S.prop(_tuple_2,1)
				var _n_l_b7 = maxf(1,_S.Bridge.hypot([(_n_bx_b5 - _n_ax_b3), (_n_by_b6 - _n_ay_b4)]))
				if true:
					var _n_d_b8 = 0
					while _S.truth((_n_d_b8 <= _n_l_b7)):
						_S.call_value(_n_fn_b0,[(_n_ax_b3 + (float(((_n_bx_b5 - _n_ax_b3) * _n_d_b8))/_n_l_b7)), (_n_ay_b4 + (float(((_n_by_b6 - _n_ay_b4) * _n_d_b8))/_n_l_b7)), _n_path_b1, _n_i_b2, _S.binary("===",_n_d_b8,0)])
						_n_d_b8 += 0.5
				_n_i_b2 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_cols = _S.read(_parent,"cols")
	var _n_k = _S.read(_parent,"k")
	var _n_CROSS = _S.read(_parent,"CROSS")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_path_b2 = _S.arg(_args,2)
	if _S.truth((_S.named_value(_n_path_b2,"w") >= 1)):
		for _iter_0 in _S.array(_n_CROSS):
			var _tuple_1 = _iter_0
			var _n_dx_b3 = _S.prop(_tuple_1,0)
			var _n_dy_b4 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p,"dot",[(_n_x_b0 + (_n_dx_b3 * 1.5)), (_n_y_b1 + (_n_dy_b4 * 1.5)), _S.named_value(_n_cols,"halo"), ((_n_k - 0.45) * 1.6)])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_cols = _S.read(_parent,"cols")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_path_b2 = _S.arg(_args,2)
	if _S.truth((_S.named_value(_n_path_b2,"w") > 0.4)):
		_S.invoke(_n_p,"dot",[(_n_x_b0 + 1), _n_y_b1, _S.named_value(_n_cols,"body")])
		_S.invoke(_n_p,"dot",[_n_x_b0, (_n_y_b1 + 1), _S.named_value(_n_cols,"body")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_cols = _S.read(_parent,"cols")
	var _n_k = _S.read(_parent,"k")
	var _n_glowK = _S.read(_parent,"glowK")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_path_b2 = _S.arg(_args,2)
	var _n_i_b3 = _S.arg(_args,3)
	var _n_first_b4 = _S.arg(_args,4)
	_S.invoke(_n_p,"px",[_n_x_b0, _n_y_b1, (_S.named_value(_n_cols,"core") if _S.truth(((_n_k > 0.3) if _S.truth((_S.named_value(_n_path_b2,"w") >= 1)) else (_S.named_value(_n_path_b2,"w") >= 1))) else _S.named_value(_n_cols,"body"))])
	if _S.truth((_S.binary("===",fmod(_n_i_b3,3),0) if _S.truth(_n_first_b4) else _n_first_b4)):
		_S.invoke(_n_p,"glow",[_n_x_b0, _n_y_b1, ((9 if _S.truth((_S.named_value(_n_path_b2,"w") >= 1)) else 5) * (0.5 + (_n_k * 0.5))), _S.named_value(_n_cols,"glow"), ((_n_glowK * _n_k) * _S.named_value(_n_path_b2,"w"))])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_sy_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_keep_b7 = _S.coalesce(_S.arg(_args,7),func():return null)
	if _S.truth((_n_r_b3 < 0.5)):
		return null
	var _n_fc_b8 = _S.binary("===",_S.unary("typeof",_n_c_b5),"function")
	var _n_fa_b9 = _S.binary("===",_S.unary("typeof",_n_a_b6),"function")
	var _n_ry_b10 = (_n_r_b3 * _n_sy_b4)
	_S.invoke(_n_p_b0,"shade",[((_n_cx_b1 - _n_r_b3) - 1), ((_n_cy_b2 - _n_ry_b10) - 1), ((_n_cx_b1 + _n_r_b3) + 1), ((_n_cy_b2 + _n_ry_b10) + 1), _S.function_value(_S.capture(_parent,{"cx":_n_cx_b1,"r":_n_r_b3,"cy":_n_cy_b2,"ry":_n_ry_b10,"keep":_n_keep_b7,"fc":_n_fc_b8,"c":_n_c_b5,"fa":_n_fa_b9,"a":_n_a_b6,"this":_this}),"_f10")])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_r = _S.read(_parent,"r")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ry = _S.read(_parent,"ry")
	var _n_keep = _S.read(_parent,"keep")
	var _n_c = _S.read(_parent,"c")
	var _n_fc = _S.read(_parent,"fc")
	var _n_a = _S.read(_parent,"a")
	var _n_fa = _S.read(_parent,"fa")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_nx_b3 = (float((_n_x_b0 - _n_cx))/_n_r)
	var _n_ny_b4 = (float((_n_y_b1 - _n_cy))/maxf(0.3,_n_ry))
	var _n_d_b5 = _S.Bridge.hypot([_n_nx_b3, _n_ny_b4])
	if _S.truth((_n_d_b5 < 0.000001)):
		return null
	var _n_g_b6 = (float(_S.Bridge.hypot([(float(_n_nx_b3)/_n_r), (float(_n_ny_b4)/maxf(0.3,_n_ry))]))/_n_d_b5)
	if _S.truth(((float(absf((_n_d_b5 - 1)))/_n_g_b6) > 0.5)):
		return null
	var _n_ang_b7 = atan2(_n_ny_b4,_n_nx_b3)
	if _S.truth((not _S.truth(_S.call_value(_n_keep,[_n_ang_b7])) if _S.truth(_n_keep) else _n_keep)):
		return null
	_S.set_prop(_n_o_b2,"c",(_S.call_value(_n_c,[_n_ang_b7]) if _S.truth(_n_fc) else _n_c),"=")
	_S.set_prop(_n_o_b2,"a",(_S.call_value(_n_a,[_n_ang_b7]) if _S.truth(_n_fa) else _n_a),"=")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_GLYPHS = _S.read(_parent,"GLYPHS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	var _n_under_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_g_b7 = _S.index_value(_n_GLYPHS,fmod((fmod(_n_i_b1,_S.prop(_n_GLYPHS,"length")) + _S.prop(_n_GLYPHS,"length")),_S.prop(_n_GLYPHS,"length")))
	var _n_X_b8 = (floori(_n_x_b2+0.5) - 1)
	var _n_Y_b9 = ((floori(_n_y_b3+0.5) - _S.prop(_n_g_b7,"length")) + 1)
	if _S.truth(_n_under_b6):
		_S.invoke(_n_p_b0,"sprite",[_n_g_b7, {}, _n_X_b8, (_n_Y_b9 + 1), {"tint":_n_under_b6,"a":_n_a_b5}])
	_S.invoke(_n_p_b0,"sprite",[_n_g_b7, {}, _n_X_b8, _n_Y_b9, {"tint":_n_c_b4,"a":_n_a_b5}])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_SIGILS = _S.read(_parent,"SIGILS")
	var _n_CROSS = _S.read(_parent,"CROSS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_c_b4 = _S.arg(_args,4)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	var _n_edge_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_g_b7 = _S.index_value(_n_SIGILS,fmod((fmod(_n_i_b1,_S.prop(_n_SIGILS,"length")) + _S.prop(_n_SIGILS,"length")),_S.prop(_n_SIGILS,"length")))
	var _n_X_b8 = (floori(_n_x_b2+0.5) - 2)
	var _n_Y_b9 = (floori(_n_y_b3+0.5) - 3)
	if _S.truth(_n_edge_b6):
		for _iter_0 in _S.array(_n_CROSS):
			var _tuple_1 = _iter_0
			var _n_dx_b10 = _S.prop(_tuple_1,0)
			var _n_dy_b11 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"sprite",[_n_g_b7, {}, (_n_X_b8 + _n_dx_b10), (_n_Y_b9 + _n_dy_b11), {"tint":_n_edge_b6,"a":_n_a_b5}])
	_S.invoke(_n_p_b0,"sprite",[_n_g_b7, {}, _n_X_b8, _n_Y_b9, {"tint":_n_c_b4,"a":_n_a_b5}])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.construct(_n_Uint8Array,[(_S.named_value(_n_A_b0,"w") * _S.named_value(_n_A_b0,"h"))])
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < _S.prop(_n_s_b1,"length"))):
			if _S.truth(_S.index_value(_S.named_value(_S.named_value(_n_A_b0,"mask"),"data"),_n_i_b2)):
				_S.set_prop(_n_s_b1,_n_i_b2,((1 if _S.truth((_S.ColorFX.luma(_S.index_value(_S.named_value(_n_A_b0,"pixels"),_n_i_b2)) < 0.24)) else (2 if _S.truth((_S.ColorFX.luma(_S.index_value(_S.named_value(_n_A_b0,"pixels"),_n_i_b2)) < 0.62)) else 3)) if _S.truth(_S.named_value(_n_A_b0,"pixels")) else 2),"=")
			_n_i_b2 += 1.0
	return _n_s_b1
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_sh_b2 = _S.arg(_args,2)
	var _n_sx_b3 = _S.arg(_args,3)
	var _n_body_b4 = _S.arg(_args,4)
	var _n_edge_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_dx_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	if _S.truth((_n_sx_b3 <= 0.02)):
		return null
	var _n_cx_b8 = (_S.named_value(_n_A_b1,"x") + (float(_S.named_value(_n_A_b1,"w"))/2))
	var _n_half_b9 = ((float(_S.named_value(_n_A_b1,"w"))/2) + 1)
	if true:
		var _n_y_b10 = 0
		while _S.truth((_n_y_b10 < _S.named_value(_n_A_b1,"h"))):
			if true:
				var _n_x_b11 = floori((_n_cx_b8 - (_n_half_b9 * _n_sx_b3)))
				while _S.truth((_n_x_b11 <= ceili((_n_cx_b8 + (_n_half_b9 * _n_sx_b3))))):
					var _n_i_b12 = (floori(((_n_cx_b8 + (float(((_n_x_b11 + 0.5) - _n_cx_b8))/_n_sx_b3)) - 0.5)+0.5) - _S.named_value(_n_A_b1,"x"))
					var _n_v_b13 = (0 if _S.truth(((_n_i_b12 < 0) if _S.truth((_n_i_b12 < 0)) else (_n_i_b12 >= _S.named_value(_n_A_b1,"w")))) else _S.index_value(_n_sh_b2,((_n_y_b10 * _S.named_value(_n_A_b1,"w")) + _n_i_b12)))
					if _S.truth(_n_v_b13):
						_S.invoke(_n_p_b0,"dot",[(_n_x_b11 + _n_dx_b7), (_S.named_value(_n_A_b1,"y") + _n_y_b10), (_n_edge_b5 if _S.truth(_S.binary("===",_n_v_b13,1)) else _n_body_b4), _n_a_b6])
					_n_x_b11 += 1.0
			_n_y_b10 += 1.0
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (float((_n_v_b0 + 0.5))/16)
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_BAYER = _S.read(_parent,"BAYER")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.index_value(_n_BAYER,_S.binary("|",_S.binary("<<",_S.binary("&",floori(_n_y_b1),3),2),_S.binary("&",floori(_n_x_b0),3)))
	return null
