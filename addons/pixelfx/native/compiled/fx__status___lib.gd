@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "shape", _S.function_value(_e, "_f0"))
	_S.define(_e, "wnoise", _S.function_value(_e, "_f2"))
	_S.define(_e, "tnoise", _S.function_value(_e, "_f3"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f4"))
	_S.define(_e, "flame", _S.function_value(_e, "_f5"))
	_S.define(_e, "smoke", _S.function_value(_e, "_f6"))
	_S.define(_e, "ember", _S.function_value(_e, "_f7"))
	_S.define(_e, "haze", _S.function_value(_e, "_f8"))
	_S.define(_e, "bitmap", _S.function_value(_e, "_f9"))
	_S.define(_e, "icon", _S.function_value(_e, "_f11"))
	_S.define(_e, "starShape", _S.function_value(_e, "_f13"))
	_S.define(_e, "eyes", _S.function_value(_e, "_f15"))
	_S.define(_e, "SHAPES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["shape"] = _S.read(_e, "shape")
	_S.define(_e, "colorAt", _S.function_value(_e, "_f24"))
	_exports["colorAt"] = _S.read(_e, "colorAt")
	_exports["wnoise"] = _S.read(_e, "wnoise")
	_exports["tnoise"] = _S.read(_e, "tnoise")
	_S.define(_e, "travel", _S.function_value(_e, "_f25"))
	_exports["travel"] = _S.read(_e, "travel")
	_S.define(_e, "LAYERS", [[1, 1, 6], [0.76, 0.86, 4], [0.54, 0.68, 2], [0.3, 0.42, 0]])
	_exports["LAYERS"] = _S.read(_e, "LAYERS")
	_exports["tongue"] = _S.read(_e, "tongue")
	_exports["flame"] = _S.read(_e, "flame")
	_S.define(_e, "rampAt", _S.function_value(_e, "_f26"))
	_exports["smoke"] = _S.read(_e, "smoke")
	_exports["ember"] = _S.read(_e, "ember")
	_exports["haze"] = _S.read(_e, "haze")
	_exports["bitmap"] = _S.read(_e, "bitmap")
	_exports["icon"] = _S.read(_e, "icon")
	_S.define(_e, "shaped", _S.function_value(_e, "_f27"))
	_exports["shaped"] = _S.read(_e, "shaped")
	_exports["starShape"] = _S.read(_e, "starShape")
	_S.define(_e, "heartShape", _S.function_value(_e, "_f29"))
	_exports["heartShape"] = _S.read(_e, "heartShape")
	_S.define(_e, "EYES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["eyes"] = _S.read(_e, "eyes")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SHAPES = _S.read(_parent,"SHAPES")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_m_b1 = _S.named_value(_n_a_b0,"mask")
	var _n_s_b2 = _S.invoke(_n_SHAPES,"get",[_n_m_b1])
	if _S.truth(_n_s_b2):
		return _n_s_b2
	var _object_0 = _n_m_b1
	var _n_w_b3 = _S.named_value(_object_0,"w")
	var _n_h_b4 = _S.named_value(_object_0,"h")
	var _n_data_b5 = _S.named_value(_object_0,"data")
	var _n_on_b6 = _S.function_value(_S.capture(_parent,{"w":_n_w_b3,"h":_n_h_b4,"data":_n_data_b5,"this":_this}),"_f1")
	var _n_body_b7 = []
	var _n_up_b8 = []
	var _n_side_b9 = []
	var _n_outline_b10 = []
	var _n_top_b11 = []
	var _n_rows_b12 = []
	if true:
		var _n_x_b13 = 0
		while _S.truth((_n_x_b13 < _n_w_b3)):
			var _n_y_b14 = 0
			while _S.truth((not _S.truth(_S.call_value(_n_on_b6,[_n_x_b13, _n_y_b14])) if _S.truth((_n_y_b14 < _n_h_b4)) else (_n_y_b14 < _n_h_b4))):
				_n_y_b14 += 1.0
			_S.invoke(_n_top_b11,"push",[(_n_y_b14 if _S.truth((_n_y_b14 < _n_h_b4)) else (-1))])
			_n_x_b13 += 1.0
	if true:
		var _n_y_b15 = 0
		while _S.truth((_n_y_b15 < _n_h_b4)):
			var _n_l_b16 = (-1)
			var _n_r_b17 = (-1)
			if true:
				var _n_x_b18 = 0
				while _S.truth((_n_x_b18 < _n_w_b3)):
					if _S.truth(not _S.truth(_S.call_value(_n_on_b6,[_n_x_b18, _n_y_b15]))):
						_n_x_b18 += 1.0
						continue
					if _S.truth((_n_l_b16 < 0)):
						_n_l_b16 = _n_x_b18
					_n_r_b17 = _n_x_b18
					_S.invoke(_n_body_b7,"push",[[_n_x_b18, _n_y_b15]])
					if _S.truth(not _S.truth(_S.call_value(_n_on_b6,[_n_x_b18, (_n_y_b15 - 1)]))):
						_S.invoke(_n_up_b8,"push",[[_n_x_b18, _n_y_b15]])
					if _S.truth(not _S.truth(_S.call_value(_n_on_b6,[(_n_x_b18 - 1), _n_y_b15]))):
						_S.invoke(_n_side_b9,"push",[[_n_x_b18, _n_y_b15, (-1)]])
					if _S.truth(not _S.truth(_S.call_value(_n_on_b6,[(_n_x_b18 + 1), _n_y_b15]))):
						_S.invoke(_n_side_b9,"push",[[_n_x_b18, _n_y_b15, 1]])
					_n_x_b18 += 1.0
			_S.invoke(_n_rows_b12,"push",[[_n_l_b16, _n_r_b17]])
			_n_y_b15 += 1.0
	if true:
		var _n_y_b19 = (-1)
		while _S.truth((_n_y_b19 <= _n_h_b4)):
			if true:
				var _n_x_b20 = (-1)
				while _S.truth((_n_x_b20 <= _n_w_b3)):
					if _S.truth(_S.call_value(_n_on_b6,[_n_x_b20, _n_y_b19])):
						_n_x_b20 += 1.0
						continue
					var _n_nx_b21 = 0
					var _n_ny_b22 = 0
					if true:
						var _n_dy_b23 = (-1)
						while _S.truth((_n_dy_b23 <= 1)):
							if true:
								var _n_dx_b24 = (-1)
								while _S.truth((_n_dx_b24 <= 1)):
									if _S.truth(_S.call_value(_n_on_b6,[(_n_x_b20 + _n_dx_b24), (_n_y_b19 + _n_dy_b23)])):
										_n_nx_b21 -= _n_dx_b24
										_n_ny_b22 -= _n_dy_b23
									_n_dx_b24 += 1.0
							_n_dy_b23 += 1.0
					if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_on_b6,[(_n_x_b20 - 1), _n_y_b19]),func():return _S.call_value(_n_on_b6,[(_n_x_b20 + 1), _n_y_b19])),func():return _S.call_value(_n_on_b6,[_n_x_b20, (_n_y_b19 - 1)])),func():return _S.call_value(_n_on_b6,[_n_x_b20, (_n_y_b19 + 1)]))):
						var _n_l_b25 = _S.logical("||",_S.Bridge.hypot([_n_nx_b21, _n_ny_b22]),func():return 1)
						_S.invoke(_n_outline_b10,"push",[[_n_x_b20, _n_y_b19, (float(_n_nx_b21)/_n_l_b25), (float(_n_ny_b22)/_n_l_b25)]])
					_n_x_b20 += 1.0
			_n_y_b19 += 1.0
	_n_s_b2 = {"w":_n_w_b3,"h":_n_h_b4,"on":_n_on_b6,"body":_n_body_b7,"up":_n_up_b8,"side":_n_side_b9,"outline":_n_outline_b10,"top":_n_top_b11,"rows":_n_rows_b12}
	_S.invoke(_n_SHAPES,"set",[_n_m_b1, _n_s_b2])
	return _n_s_b2
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_w = _S.read(_parent,"w")
	var _n_h = _S.read(_parent,"h")
	var _n_data = _S.read(_parent,"data")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_data,((_n_y_b1 * _n_w) + _n_x_b0)) > 0) if _S.truth(((_n_y_b1 < _n_h) if _S.truth(((_n_x_b0 < _n_w) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_w) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _n_h) if _S.truth(((_n_x_b0 < _n_w) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_w) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_P_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_i_b3 = floori(_n_x_b0)
	var _n_f_b4 = (_n_x_b0 - _n_i_b3)
	var _n_u_b5 = ((_n_f_b4 * _n_f_b4) * (3 - (2 * _n_f_b4)))
	var _n_a_b6 = _S.MathFX.rand([_S.call_value(_n_wrap,[_n_i_b3, _n_P_b1]),_n_seed_b2])
	var _n_b_b7 = _S.MathFX.rand([_S.call_value(_n_wrap,[(_n_i_b3 + 1), _n_P_b1]),_n_seed_b2])
	return (((_n_a_b6 + ((_n_b_b7 - _n_a_b6) * _n_u_b5)) * 2) - 1)
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_wnoise = _S.read(_parent,"wnoise")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_f_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	var _n_off_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	var _n_P_b5 = maxf(2,floori((_n_f_b2 * _n_D_b1)+0.5))
	return _S.call_value(_n_wnoise,[(((float(_n_t_b0)/_n_D_b1) * _n_P_b5) + _n_off_b4), _n_P_b5, _n_seed_b3])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_tnoise = _S.read(_parent,"tnoise")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_w_b4 = _S.arg(_args,4)
	var _n_sx_b5 = _S.arg(_args,5)
	var _n_F_b6 = _S.arg(_args,6)
	var _n_t_b7 = _S.arg(_args,7)
	var _n_D_b8 = _S.arg(_args,8)
	var _n_n_b9 = _S.arg(_args,9)
	var _n_layers_b10 = _S.coalesce(_S.arg(_args,10),func():return _n_LAYERS)
	if _S.truth((_n_h_b3 < 1)):
		return null
	for _iter_0 in _S.array(_n_layers_b10):
		var _tuple_1 = _iter_0
		var _n_lw_b11 = _S.prop(_tuple_1,0)
		var _n_lh_b12 = _S.prop(_tuple_1,1)
		var _n_ri_b13 = _S.prop(_tuple_1,2)
		if _S.truth(((_n_h_b3 < 4) if _S.truth(_S.binary("===",_n_ri_b13,0)) else _S.binary("===",_n_ri_b13,0))):
			continue
		var _n_H_b14 = (_n_h_b3 * _n_lh_b12)
		var _n_col_b15 = _S.index_value(_n_F_b6,_n_ri_b13)
		if true:
			var _n_r_b16 = 0
			while _S.truth((_n_r_b16 <= _n_H_b14)):
				var _n_u_b17 = (float(_n_r_b16)/maxf(1,_n_H_b14))
				var _n_half_b18 = ((((_n_w_b4 * _n_lw_b11) * pow((1 - _n_u_b17),0.85)) * minf(1,(float((_n_r_b16 + 1.5))/3.5))) + (_S.call_value(_n_tnoise,[_n_t_b7, _n_D_b8, 9, _n_n_b9, (_n_r_b16 * 0.45)]) * 0.5))
				if _S.truth((_n_half_b18 < 0.3)):
					_n_r_b16 += 1.0
					continue
				var _n_cx_b19 = ((_n_x_b1 + (((_n_sx_b5 * _n_u_b17) * _n_u_b17) * _n_lh_b12)) + ((_S.call_value(_n_tnoise,[_n_t_b7, _n_D_b8, 4, (_n_n_b9 + 7), (_n_r_b16 * 0.2)]) * _n_u_b17) * 1.1))
				if true:
					var _n_px_b20 = floori((_n_cx_b19 - _n_half_b18)+0.5)
					while _S.truth((_n_px_b20 <= floori((_n_cx_b19 + _n_half_b18)+0.5))):
						_S.invoke(_n_p_b0,"px",[_n_px_b20, floori((_n_y_b2 - _n_r_b16)+0.5), _n_col_b15])
						_n_px_b20 += 1.0
				_n_r_b16 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_size_b3 = _S.arg(_args,3)
	var _n_u_b4 = _S.arg(_args,4)
	var _n_F_b5 = _S.arg(_args,5)
	var _n_heatSeed_b6 = _S.coalesce(_S.arg(_args,6),func():return 0)
	var _n_n_b7 = _S.prop(_n_F_b5,"length")
	var _n_k_b8 = (1 - _n_u_b4)
	var _n_heat_b9 = minf(0.999,(pow(_n_u_b4,0.62) + (_n_heatSeed_b6 * 0.1)))
	var _n_idx_b10 = minf((_n_n_b7 - 2),floori((_n_heat_b9 * (_n_n_b7 - 1))))
	var _n_r_b11 = ((_n_size_b3 * (0.55 + (0.45 * minf(1,(_n_u_b4 * 7))))) * (1 - (_n_u_b4 * 0.55)))
	var _n_c_b12 = _S.index_value(_n_F_b5,_n_idx_b10)
	if _S.truth((_n_idx_b10 >= (_n_n_b7 - 2))):
		return _S.invoke(_n_p_b0,"disc",[_n_x_b1, _n_y_b2, _n_r_b11, _n_c_b12, (minf(1,(_n_k_b8 * 3)) * 0.85)])
	_S.invoke(_n_p_b0,"circle",[_n_x_b1, _n_y_b2, _n_r_b11, _S.index_value(_n_F_b5,minf((_n_n_b7 - 1),(_n_idx_b10 + 2)))])
	_S.invoke(_n_p_b0,"circle",[(_n_x_b1 - (_n_r_b11 * 0.16)), (_n_y_b2 - (_n_r_b11 * 0.22)), (_n_r_b11 * 0.78), _n_c_b12])
	if _S.truth((_n_r_b11 > 1.6)):
		_S.invoke(_n_p_b0,"circle",[_n_x_b1, (_n_y_b2 - (_n_r_b11 * 0.9)), (_n_r_b11 * 0.42), _n_c_b12])
	if _S.truth(((_n_r_b11 > 1.8) if _S.truth((_n_idx_b10 <= 3)) else (_n_idx_b10 <= 3))):
		_S.invoke(_n_p_b0,"circle",[(_n_x_b1 - (_n_r_b11 * 0.28)), (_n_y_b2 - (_n_r_b11 * 0.34)), (_n_r_b11 * 0.36), _S.index_value(_n_F_b5,maxf(0,(_n_idx_b10 - 1)))])
	if _S.truth((_n_idx_b10 < 6)):
		_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, ((_n_r_b11 * 2.4) + 2), _n_c_b12, (0.18 * _n_k_b8)])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_rampAt = _S.read(_parent,"rampAt")
	var _n_SMOKE_RAMP = _S.read(_parent,"SMOKE_RAMP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_size_b3 = _S.arg(_args,3)
	var _n_u_b4 = _S.arg(_args,4)
	var _n_col_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_warm_b7 = _S.coalesce(_S.arg(_args,7),func():return 0)
	var _n_r_b8 = (_n_size_b3 * ((0.65 + (minf(1,(_n_u_b4 * 2.5)) * 0.45)) + (_n_u_b4 * 0.4)))
	var _n_a_b9 = (((minf(1,(_n_u_b4 * 12)) * minf(1,((1 - _n_u_b4) * 2.4))) * 0.58) * _n_k_b6)
	if _S.truth((_n_a_b9 <= 0.01)):
		return null
	var _n_c_b10 = (_S.ColorFX.mix(_n_col_b5,_S.call_value(_n_rampAt,[_n_SMOKE_RAMP, _n_u_b4]),_n_u_b4) if _S.truth(_n_col_b5) else _S.call_value(_n_rampAt,[_n_SMOKE_RAMP, (_n_u_b4 * 1.05)]))
	_S.invoke(_n_p_b0,"disc",[_n_x_b1, _n_y_b2, _n_r_b8, _n_c_b10, (_n_a_b9 * 0.45)])
	_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + (_n_r_b8 * 0.05)), (_n_y_b2 + (_n_r_b8 * 0.06)), (_n_r_b8 * 0.74), _n_c_b10, (_n_a_b9 * 0.62)])
	if _S.truth(((_n_u_b4 < 0.6) if _S.truth(_n_warm_b7) else _n_warm_b7)):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + (_n_r_b8 * 0.1)), (_n_y_b2 + (_n_r_b8 * 0.3)), (_n_r_b8 * 0.56), _S.ColorFX.mix(_n_c_b10,_n_warm_b7,0.5), ((_n_a_b9 * 0.7) * (1 - (float(_n_u_b4)/0.6)))])
	if _S.truth((_n_u_b4 < 0.5)):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b1 - (_n_r_b8 * 0.22)), (_n_y_b2 - (_n_r_b8 * 0.3)), (_n_r_b8 * 0.5), _S.ColorFX.mix(_n_c_b10,_n_WHITE,0.12), ((_n_a_b9 * 0.4) * (1 - (_n_u_b4 * 2)))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_u_b3 = _S.arg(_args,3)
	var _n_E_b4 = _S.arg(_args,4)
	var _n_ph_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_left_b7 = (1 - _n_u_b3)
	if _S.truth(((sin((_n_ph_b5 * 40)) < 0) if _S.truth((_n_left_b7 < 0.22)) else (_n_left_b7 < 0.22))):
		return null
	var _n_c_b8 = ((_S.index_value(_n_E_b4,0) if _S.truth((sin((_n_ph_b5 * 22)) > (-0.2))) else _S.index_value(_n_E_b4,1)) if _S.truth((_n_left_b7 > 0.5)) else (_S.index_value(_n_E_b4,1) if _S.truth((_n_left_b7 > 0.22)) else _S.index_value(_n_E_b4,2)))
	_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_c_b8])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 3, _n_c_b8, ((0.32 * _n_left_b7) * _n_k_b6)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_ry_b4 = _S.arg(_args,4)
	var _n_col_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.arg(_args,6)
	if _S.truth((((_n_a_b6 <= 0.01) if _S.truth((_n_a_b6 <= 0.01)) else (_n_rx_b3 < 0.5)) if _S.truth(((_n_a_b6 <= 0.01) if _S.truth((_n_a_b6 <= 0.01)) else (_n_rx_b3 < 0.5))) else (_n_ry_b4 < 0.5))):
		return null
	if true:
		var _n_py_b7 = floori((_n_y_b2 - _n_ry_b4))
		while _S.truth((_n_py_b7 <= ceili((_n_y_b2 + _n_ry_b4)))):
			if true:
				var _n_px_b8 = floori((_n_x_b1 - _n_rx_b3))
				while _S.truth((_n_px_b8 <= ceili((_n_x_b1 + _n_rx_b3)))):
					var _n_dx_b9 = (float(((_n_px_b8 + 0.5) - _n_x_b1))/_n_rx_b3)
					var _n_dy_b10 = (float(((_n_py_b7 + 0.5) - _n_y_b2))/_n_ry_b4)
					var _n_d_b11 = ((_n_dx_b9 * _n_dx_b9) + (_n_dy_b10 * _n_dy_b10))
					if _S.truth((_n_d_b11 < 1)):
						_S.invoke(_n_p_b0,"blend",[_n_px_b8, _n_py_b7, _n_col_b5, (_n_a_b6 * (1 - _n_d_b11))])
					_n_px_b8 += 1.0
			_n_py_b7 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_rows_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.coalesce(_S.arg(_args,1),func():return 1)
	var _n_flip_b2 = _S.coalesce(_S.arg(_args,2),func():return false)
	var _n_h_b3 = _S.prop(_n_rows_b0,"length")
	var _n_w_b4 = _S.prop(_S.index_value(_n_rows_b0,0),"length")
	var _n_ox_b5 = floori((float((_n_w_b4 * _n_k_b1))/2))
	var _n_oy_b6 = floori((float((_n_h_b3 * _n_k_b1))/2))
	return _S.function_value(_S.capture(_parent,{"ox":_n_ox_b5,"k":_n_k_b1,"oy":_n_oy_b6,"w":_n_w_b4,"h":_n_h_b3,"flip":_n_flip_b2,"rows":_n_rows_b0,"this":_this}),"_f10")
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_ox = _S.read(_parent,"ox")
	var _n_k = _S.read(_parent,"k")
	var _n_oy = _S.read(_parent,"oy")
	var _n_w = _S.read(_parent,"w")
	var _n_h = _S.read(_parent,"h")
	var _n_flip = _S.read(_parent,"flip")
	var _n_rows = _S.read(_parent,"rows")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	var _n_bx_b2 = floori((float((_n_dx_b0 + _n_ox))/_n_k))
	var _n_by_b3 = floori((float((_n_dy_b1 + _n_oy))/_n_k))
	if _S.truth(((((_n_bx_b2 < 0) if _S.truth((_n_bx_b2 < 0)) else (_n_by_b3 < 0)) if _S.truth(((_n_bx_b2 < 0) if _S.truth((_n_bx_b2 < 0)) else (_n_by_b3 < 0))) else (_n_bx_b2 >= _n_w)) if _S.truth((((_n_bx_b2 < 0) if _S.truth((_n_bx_b2 < 0)) else (_n_by_b3 < 0)) if _S.truth(((_n_bx_b2 < 0) if _S.truth((_n_bx_b2 < 0)) else (_n_by_b3 < 0))) else (_n_bx_b2 >= _n_w))) else (_n_by_b3 >= _n_h))):
		return ""
	if _S.truth(_n_flip):
		_n_bx_b2 = ((_n_w - 1) - _n_bx_b2)
	var _n_c_b4 = _S.index_value(_S.index_value(_n_rows,_n_by_b3),_n_bx_b2)
	return ("" if _S.truth(_S.binary("===",_n_c_b4,".")) else _n_c_b4)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_ext_b3 = _S.arg(_args,3)
	var _n_inside_b4 = _S.arg(_args,4)
	var _n_R_b5 = _S.arg(_args,5)
	var _n_a_b6 = _S.coalesce(_S.arg(_args,6),func():return 1)
	var _n_paint_b7 = _S.coalesce(_S.arg(_args,7),func():return null)
	var _n_X_b8 = floori(_n_x_b1+0.5)
	var _n_Y_b9 = floori(_n_y_b2+0.5)
	var _n_at_b10 = _S.function_value(_S.capture(_parent,{"inside":_n_inside_b4,"this":_this}),"_f12")
	if true:
		var _n_dy_b11 = ((-_n_ext_b3) - 1)
		while _S.truth((_n_dy_b11 <= (_n_ext_b3 + 1))):
			if true:
				var _n_dx_b12 = ((-_n_ext_b3) - 1)
				while _S.truth((_n_dx_b12 <= (_n_ext_b3 + 1))):
					var _n_ch_b13 = _S.call_value(_n_inside_b4,[_n_dx_b12, _n_dy_b11])
					var _n_c_b14 = null
					if _S.truth(_n_ch_b13):
						if _S.truth((_S.binary("!==",_S.index_value(_n_paint_b7,_n_ch_b13),null) if _S.truth(_n_paint_b7) else _n_paint_b7)):
							_n_c_b14 = _S.index_value(_n_paint_b7,_n_ch_b13)
						else:
							var _n_top_b15 = not _S.truth(_S.call_value(_n_at_b10,[_n_dx_b12, (_n_dy_b11 - 1)]))
							var _n_left_b16 = not _S.truth(_S.call_value(_n_at_b10,[(_n_dx_b12 - 1), _n_dy_b11]))
							var _n_bottom_b17 = not _S.truth(_S.call_value(_n_at_b10,[_n_dx_b12, (_n_dy_b11 + 1)]))
							var _n_right_b18 = not _S.truth(_S.call_value(_n_at_b10,[(_n_dx_b12 + 1), _n_dy_b11]))
							_n_c_b14 = (_S.index_value(_n_R_b5,3) if _S.truth((_n_top_b15 if _S.truth(_n_top_b15) else _n_left_b16)) else (_S.index_value(_n_R_b5,1) if _S.truth((_n_bottom_b17 if _S.truth(_n_bottom_b17) else _n_right_b18)) else _S.index_value(_n_R_b5,2)))
					else:
						if _S.truth((_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_at_b10,[(_n_dx_b12 - 1), _n_dy_b11]),func():return _S.call_value(_n_at_b10,[(_n_dx_b12 + 1), _n_dy_b11])),func():return _S.call_value(_n_at_b10,[_n_dx_b12, (_n_dy_b11 - 1)])),func():return _S.call_value(_n_at_b10,[_n_dx_b12, (_n_dy_b11 + 1)])) if _S.truth(_S.index_value(_n_R_b5,0)) else _S.index_value(_n_R_b5,0))):
							_n_c_b14 = _S.index_value(_n_R_b5,0)
						else:
							_n_dx_b12 += 1.0
							continue
					_S.invoke(_n_p_b0,"dot",[(_n_X_b8 + _n_dx_b12), (_n_Y_b9 + _n_dy_b11), _n_c_b14, _n_a_b6])
					_n_dx_b12 += 1.0
			_n_dy_b11 += 1.0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_inside = _S.read(_parent,"inside")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	return not _S.truth(not _S.truth(_S.call_value(_n_inside,[_n_dx_b0, _n_dy_b1])))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_r0_b0 = _S.coalesce(_S.arg(_args,0),func():return 0.45)
	return _S.function_value(_S.capture(_parent,{"r0":_n_r0_b0,"this":_this}),"_f14")
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_r0 = _S.read(_parent,"r0")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	var _n_a_b2 = (atan2(_n_v_b1,_n_u_b0) + (float(PI)/2))
	var _n_d_b3 = _S.Bridge.hypot([_n_u_b0, _n_v_b1])
	var _n_seg_b4 = (float((2 * PI))/5)
	var _n_k_b5 = (1 - (float(absf((fmod((fmod(_n_a_b2,_n_seg_b4) + _n_seg_b4),_n_seg_b4) - (float(_n_seg_b4)/2))))/(float(_n_seg_b4)/2)))
	return (_n_d_b3 <= (1 - ((1 - _n_r0) * pow(_n_k_b5,0.8))))
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "EYES"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.read(_e, "list")):
		return _S.read(_e, "list")
	if _S.truth(_S.prop(_S.read(_e, "a"), "eyes")):
		var _v28 = _S.scope(_e)
		_S.write(_v28, "list", _S.invoke(_S.prop(_S.read(_v28, "a"), "eyes"), "map", [_S.function_value(_v28, "_f16")]), "=", false)
		_S.invoke(_S.read(_v28, "EYES"), "set", [_S.prop(_S.read(_v28, "a"), "mask"), _S.read(_v28, "list")])
		return _S.read(_v28, "list")
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "col", _S.function_value(_e, "_f17"))
	_S.define(_e, "dark", _S.function_value(_e, "_f18"))
	_S.define(_e, "seen", _S.construct(_S.read(_e, "Set"), []))
	_S.write(_e, "list", [], "=", false)
	for _v30 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v31 = _S.scope(_e)
		var _v32 = _v30
		_S.define(_v31, "x0", _S.prop(_v32, 0))
		_S.define(_v31, "y0", _S.prop(_v32, 1))
		var _v33 = _S.scope(_v31)
		if _S.truth(_S.logical("||", _S.invoke(_S.read(_v33, "seen"), "has", [_S.binary("+", _S.binary("*", _S.read(_v33, "y0"), _S.read(_v33, "W")), _S.read(_v33, "x0"))]), func(): return _S.unary("!", _S.call_value(_S.read(_v33, "dark"), [_S.read(_v33, "x0"), _S.read(_v33, "y0")])))):
			continue
		_S.define(_v33, "px", [])
		_S.define(_v33, "q", [[_S.read(_v33, "x0"), _S.read(_v33, "y0")]])
		_S.invoke(_S.read(_v33, "seen"), "add", [_S.binary("+", _S.binary("*", _S.read(_v33, "y0"), _S.read(_v33, "W")), _S.read(_v33, "x0"))])
		while _S.truth(_S.prop(_S.read(_v33, "q"), "length")):
			var _v34 = _S.scope(_v33)
			var _v35 = _S.invoke(_S.read(_v34, "q"), "pop", [])
			_S.define(_v34, "x", _S.prop(_v35, 0))
			_S.define(_v34, "y", _S.prop(_v35, 1))
			_S.invoke(_S.read(_v34, "px"), "push", [[_S.read(_v34, "x"), _S.read(_v34, "y")]])
			for _v36 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v37 = _S.scope(_v34)
				var _v38 = _v36
				_S.define(_v37, "dx", _S.prop(_v38, 0))
				_S.define(_v37, "dy", _S.prop(_v38, 1))
				var _v39 = _S.scope(_v37)
				_S.define(_v39, "nx", _S.binary("+", _S.read(_v39, "x"), _S.read(_v39, "dx")))
				_S.define(_v39, "ny", _S.binary("+", _S.read(_v39, "y"), _S.read(_v39, "dy")))
				_S.define(_v39, "k", _S.binary("+", _S.binary("*", _S.read(_v39, "ny"), _S.read(_v39, "W")), _S.read(_v39, "nx")))
				if _S.truth(_S.logical("||", _S.invoke(_S.read(_v39, "seen"), "has", [_S.read(_v39, "k")]), func(): return _S.unary("!", _S.logical("||", _S.call_value(_S.read(_v39, "dark"), [_S.read(_v39, "nx"), _S.read(_v39, "ny")]), func(): return _S.logical("&&", _S.invoke(_S.read(_v39, "S"), "on", [_S.read(_v39, "nx"), _S.read(_v39, "ny")]), func(): return _S.binary(">", _S.call_value(_S.read(_v39, "luma"), [_S.call_value(_S.read(_v39, "col"), [_S.read(_v39, "nx"), _S.read(_v39, "ny")])]), 0.95)))))):
					continue
				_S.invoke(_S.read(_v39, "seen"), "add", [_S.read(_v39, "k")])
				_S.invoke(_S.read(_v39, "q"), "push", [[_S.read(_v39, "nx"), _S.read(_v39, "ny")]])
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v33, "px"), "length"), 2), func(): return _S.binary(">", _S.prop(_S.read(_v33, "px"), "length"), 14))):
			continue
		_S.define(_v33, "xs", _S.invoke(_S.read(_v33, "px"), "map", [_S.function_value(_v33, "_f19")]))
		_S.define(_v33, "ys", _S.invoke(_S.read(_v33, "px"), "map", [_S.function_value(_v33, "_f20")]))
		_S.define(_v33, "counts", _S.construct(_S.read(_v33, "Map"), []))
		_S.define(_v33, "e", _S.merge([{"x0": _S.invoke(_S.read(_v33, "Math"), "min", _S.concat([_S.array(_S.read(_v33, "xs"))]))}, {"x1": _S.invoke(_S.read(_v33, "Math"), "max", _S.concat([_S.array(_S.read(_v33, "xs"))]))}, {"y0": _S.invoke(_S.read(_v33, "Math"), "min", _S.concat([_S.array(_S.read(_v33, "ys"))]))}, {"y1": _S.invoke(_S.read(_v33, "Math"), "max", _S.concat([_S.array(_S.read(_v33, "ys"))]))}, {"px": _S.read(_v33, "px")}]))
		for _v40 in _S.array(_S.read(_v33, "px")):
			var _v41 = _S.scope(_v33)
			var _v42 = _v40
			_S.define(_v41, "x", _S.prop(_v42, 0))
			_S.define(_v41, "y", _S.prop(_v42, 1))
			for _v43 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)], [2, 0], [_S.unary("-", 2), 0]]):
				var _v44 = _S.scope(_v41)
				var _v45 = _v43
				_S.define(_v44, "dx", _S.prop(_v45, 0))
				_S.define(_v44, "dy", _S.prop(_v45, 1))
				var _v46 = _S.scope(_v44)
				_S.define(_v46, "c", _S.call_value(_S.read(_v46, "col"), [_S.binary("+", _S.read(_v46, "x"), _S.read(_v46, "dx")), _S.binary("+", _S.read(_v46, "y"), _S.read(_v46, "dy"))]))
				_S.define(_v46, "l", _S.call_value(_S.read(_v46, "luma"), [_S.read(_v46, "c")]))
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_v46, "c"), func(): return _S.binary(">", _S.read(_v46, "l"), 0.5)), func(): return _S.binary("<", _S.read(_v46, "l"), 0.95)), func(): return _S.unary("!", _S.invoke(_S.read(_v46, "px"), "some", [_S.function_value(_v46, "_f21")])))):
					_S.invoke(_S.read(_v46, "counts"), "set", [_S.read(_v46, "c"), _S.binary("+", _S.logical("??", _S.invoke(_S.read(_v46, "counts"), "get", [_S.read(_v46, "c")]), func(): return 0), 1)])
		_S.set_prop(_S.read(_v33, "e"), "skin", _S.prop(_S.prop(_S.invoke(_S.concat([_S.array(_S.read(_v33, "counts"))]), "sort", [_S.function_value(_v33, "_f22")]), 0), 0), "=", false)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v33, "e"), "skin"), func(): return _S.binary("<=", _S.binary("-", _S.prop(_S.read(_v33, "e"), "x1"), _S.prop(_S.read(_v33, "e"), "x0")), 4)), func(): return _S.binary("<=", _S.binary("-", _S.prop(_S.read(_v33, "e"), "y1"), _S.prop(_S.read(_v33, "e"), "y0")), 5))):
			_S.invoke(_S.read(_v33, "list"), "push", [_S.read(_v33, "e")])
	_S.invoke(_S.read(_e, "list"), "sort", [_S.function_value(_e, "_f23")])
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "list"), "length"), 2)):
		_S.write(_e, "list", [], "=", false)
	_S.invoke(_S.read(_e, "EYES"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.read(_e, "list")])
	return _S.read(_e, "list")

static func _f16(_parent,_args:Array,_this=null):
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_a = _S.read(_parent,"a")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return {"x0":_n_x_b0,"x1":_n_x_b0,"y0":_n_y_b1,"y1":(_n_y_b1 + 1),"px":[[_n_x_b0, _n_y_b1], [_n_x_b0, (_n_y_b1 + 1)]],"skin":_S.call_value(_n_colorAt,[_n_a, _n_x_b0, _n_y_b1])}
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_colorAt = _S.read(_parent,"colorAt")
	var _n_a = _S.read(_parent,"a")
	var _n_S = _S.read(_parent,"S")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.call_value(_n_colorAt,[_n_a, _n_x_b0, _n_y_b1]) if _S.truth(_S.invoke(_n_S,"on",[_n_x_b0, _n_y_b1])) else 0)
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_S = _S.read(_parent,"S")
	var _n_col = _S.read(_parent,"col")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.logical("&&",_S.logical("&&",_S.logical("&&",_S.logical("&&",_S.logical("&&",_S.logical("&&",_S.invoke(_n_S,"on",[_n_x_b0, _n_y_b1]),func():return (_n_y_b1 < (_S.named_value(_n_S,"h") * 0.4))),func():return (_S.ColorFX.luma(_S.call_value(_n_col,[_n_x_b0, _n_y_b1])) < 0.15)),func():return _S.invoke(_n_S,"on",[(_n_x_b0 - 1), _n_y_b1])),func():return _S.invoke(_n_S,"on",[(_n_x_b0 + 1), _n_y_b1])),func():return _S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 - 1)])),func():return _S.invoke(_n_S,"on",[_n_x_b0, (_n_y_b1 + 1)]))
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	return _S.index_value(_n_p_b0,0)
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	return _S.index_value(_n_p_b0,1)
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_dx = _S.read(_parent,"dx")
	var _n_y = _S.read(_parent,"y")
	var _n_dy = _S.read(_parent,"dy")
	var _n_p_b0 = _S.arg(_args,0)
	return (_S.binary("===",_S.index_value(_n_p_b0,1),(_n_y + _n_dy)) if _S.truth(_S.binary("===",_S.index_value(_n_p_b0,0),(_n_x + _n_dx))) else _S.binary("===",_S.index_value(_n_p_b0,0),(_n_x + _n_dx)))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_q_b1,1) - _S.index_value(_n_p_b0,1))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_p_b0,"x0") - _S.named_value(_n_q_b1,"x0"))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	return (_S.index_value(_S.named_value(_n_a_b0,"pixels"),((_n_y_b2 * _S.named_value(_S.named_value(_n_a_b0,"mask"),"w")) + _n_x_b1)) if _S.truth(_S.named_value(_n_a_b0,"pixels")) else (4285229931 if _S.truth(_S.index_value(_S.named_value(_S.named_value(_n_a_b0,"mask"),"data"),((_n_y_b2 * _S.named_value(_S.named_value(_n_a_b0,"mask"),"w")) + _n_x_b1))) else 0))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.arg(_args,1)
	var _n_d_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	return ((((float(_n_g_b1)/_n_d_b2) * _n_a_b3) + (float(((_n_v_b0 - (float(_n_g_b1)/_n_d_b2)) * (1 - exp(((-_n_d_b2) * _n_a_b3)))))/_n_d_b2)) if _S.truth((_n_d_b2 > 0)) else ((_n_v_b0 * _n_a_b3) + (((0.5 * _n_g_b1) * _n_a_b3) * _n_a_b3)))
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	return _S.index_value(_n_r_b0,minf((_S.prop(_n_r_b0,"length") - 1),maxf(0,floori((_n_t_b1 * _S.prop(_n_r_b0,"length"))))))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	var _n_ang_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_c_b3 = cos(_n_ang_b2)
	var _n_n_b4 = sin(_n_ang_b2)
	return _S.function_value(_S.capture(_parent,{"f":_n_f_b0,"c":_n_c_b3,"n":_n_n_b4,"s":_n_s_b1,"this":_n_this}),"_f28")
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_c = _S.read(_parent,"c")
	var _n_n = _S.read(_parent,"n")
	var _n_s = _S.read(_parent,"s")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_dy_b1 = _S.arg(_args,1)
	var _n_x_b2 = (_n_dx_b0 + 0.5)
	var _n_y_b3 = (_n_dy_b1 + 0.5)
	return ("#" if _S.truth(_S.call_value(_n_f,[(float(((_n_x_b2 * _n_c) + (_n_y_b3 * _n_n)))/_n_s), (float((((-_n_x_b2) * _n_n) + (_n_y_b3 * _n_c)))/_n_s)])) else "")
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return ((((pow((_n_u_b0 + 0.5),2) + pow((_n_v_b1 + 0.32),2)) <= pow(0.55,2)) if _S.truth(((pow((_n_u_b0 + 0.5),2) + pow((_n_v_b1 + 0.32),2)) <= pow(0.55,2))) else ((pow((_n_u_b0 - 0.5),2) + pow((_n_v_b1 + 0.32),2)) <= pow(0.55,2))) if _S.truth((((pow((_n_u_b0 + 0.5),2) + pow((_n_v_b1 + 0.32),2)) <= pow(0.55,2)) if _S.truth(((pow((_n_u_b0 + 0.5),2) + pow((_n_v_b1 + 0.32),2)) <= pow(0.55,2))) else ((pow((_n_u_b0 - 0.5),2) + pow((_n_v_b1 + 0.32),2)) <= pow(0.55,2)))) else ((absf(_n_u_b0) <= (1.04 * pow((1 - (float((_n_v_b1 + 0.32))/1.32)),0.75))) if _S.truth(((_n_v_b1 <= 1) if _S.truth((_n_v_b1 >= (-0.32))) else (_n_v_b1 >= (-0.32)))) else ((_n_v_b1 <= 1) if _S.truth((_n_v_b1 >= (-0.32))) else (_n_v_b1 >= (-0.32)))))
	return null
