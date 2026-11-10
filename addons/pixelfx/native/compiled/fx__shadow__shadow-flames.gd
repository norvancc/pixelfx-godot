@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/shadow-flames.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Shadow flames"}, {"desc": "Inside-out fire on the floor: a black heart wrapped in violet flame with pale skin and tips, shedding embers and dark smoke."}, {"tags": ["shadow", "fire", "flame", "ground", "dark", "magic", "loop"]}, {"size": [104, 112]}, {"origin": [52, 102]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", 2.4)
	_S.define(_e, "GX", 22)
	_S.define(_e, "GY", 60)
	_S.define(_e, "TONGUES", [[_S.unary("-", 11), 20, 4.2, 1], [11, 22, 4.4, 2], [_S.unary("-", 6), 31, 5.4, 3], [6, 29, 5.2, 4], [0, 40, 6.6, 5]])
	_S.define(_e, "LAYERS", [[1, 1, 0], [0.8, 0.88, 1], [0.54, 0.68, 2], [0.32, 0.48, 3]])
	_S.define(_e, "lnoise", _S.function_value(_e, "_f13"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	_S.invoke(_n_p_b0,"ellipse",[0, 0.5, 22, 3.2, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
	_S.invoke(_n_p_b0,"glow",[0, (-2), 46, _S.index_value(_n_C_b3,4), 0.3])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 14, (_n_S_b4 + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f3"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f4")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,0) if _S.truth((_n_d_b0 < 0.6)) else _S.index_value(_n_C,1))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_d_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_d_b0 < 0.85)) else ((1 - _n_d_b0) * 6))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.2, 1.9])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_L_b1)
	var _n_x_b4 = (_S.invoke(_n_r_b2,"range",[(-6), 6]) + ((sin(((_n_u_b3 * 4) + _S.invoke(_n_r_b2,"range",[0, 6]))) * 5) * _n_u_b3))
	var _n_y_b5 = ((-30) - (_n_u_b3 * _S.invoke(_n_r_b2,"range",[36, 52])))
	var _n_rad_b6 = (3 + (_n_u_b3 * 6))
	var _n_a_b7 = ((minf(1,(_n_u_b3 * 6)) * (1 - _n_u_b3)) * 0.7)
	_S.invoke(_n_p,"disc",[_n_x_b4, _n_y_b5, _n_rad_b6, _S.ColorFX.mix(_S.ColorFX.mix(_S.index_value(_n_C,3),_S.index_value(_n_C,2),0.5),_S.index_value(_n_C,1),_n_u_b3), _n_a_b7])
	_S.invoke(_n_p,"disc",[(_n_x_b4 - (_n_rad_b6 * 0.2)), (_n_y_b5 - (_n_rad_b6 * 0.3)), (_n_rad_b6 * 0.5), _S.index_value(_n_C,3), (_n_a_b7 * 0.4)])
	_S.invoke(_n_p,"disc",[_n_x_b4, (_n_y_b5 + (_n_rad_b6 * 0.45)), (_n_rad_b6 * 0.55), _S.index_value(_n_C,5), ((_n_a_b7 * 0.45) * (1 - _n_u_b3))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_Int8Array = _S.read(_parent,"Int8Array")
	var _n_GX = _S.read(_parent,"GX")
	var _n_GY = _S.read(_parent,"GY")
	var _n_TONGUES = _S.read(_parent,"TONGUES")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_LAYERS = _S.read(_parent,"LAYERS")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	var _n_TONE_b5 = [_S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,0)]
	var _n_grid_b6 = _S.invoke(_S.construct(_n_Int8Array,[((_n_GX * 2) * _n_GY)]),"fill",[(-1)])
	var _n_set_b7 = _S.function_value(_S.capture(_parent,{"grid":_n_grid_b6,"this":_this}),"_f6")
	var _n_order_b8 = _S.invoke(_S.invoke(_n_TONGUES,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f7")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
	for _iter_0 in _S.array(_n_order_b8):
		var _n_i_b10 = _iter_0
		var _tuple_1 = _S.index_value(_n_TONGUES,_n_i_b10)
		var _n_dx_b11 = _S.prop(_tuple_1,0)
		var _n_H0_b12 = _S.prop(_tuple_1,1)
		var _n_w_b13 = _S.prop(_tuple_1,2)
		var _n_n_b14 = _S.prop(_tuple_1,3)
		var _n_h_b15 = (_n_H0_b12 * (0.78 + (0.22 * _S.call_value(_n_lnoise,[_n_t_b1, (_n_n_b14 * 3), _n_n_b14, 4]))))
		var _n_sway_b16 = (_S.call_value(_n_lnoise,[_n_t_b1, (_n_n_b14 * 7), (_n_n_b14 + 9), 3]) * 3)
		for _iter_2 in _S.array(_n_LAYERS):
			var _tuple_3 = _iter_2
			var _n_lw_b17 = _S.prop(_tuple_3,0)
			var _n_lh_b18 = _S.prop(_tuple_3,1)
			var _n_tone_b19 = _S.prop(_tuple_3,2)
			var _n_Hl_b20 = (_n_h_b15 * _n_lh_b18)
			if true:
				var _n_r_b21 = 0
				while _S.truth((_n_r_b21 <= _n_Hl_b20)):
					var _n_u_b22 = (float(_n_r_b21)/maxf(1,_n_Hl_b20))
					var _n_half_b23 = (((((_n_w_b13 * _n_lw_b17) * pow((1 - _n_u_b22),0.85)) * minf(1,(float((_n_r_b21 + 1.5))/3.5))) + (_S.call_value(_n_lnoise,[_n_t_b1, ((_n_r_b21 * 0.45) + _n_n_b14), (_n_n_b14 + 20), 6]) * 1.1)) + (_S.call_value(_n_lnoise,[_n_t_b1, ((_n_r_b21 * 1.3) + (_n_n_b14 * 5)), (_n_n_b14 + 50), 9]) * 0.6))
					var _n_cx_b24 = ((_n_dx_b11 + (((_n_sway_b16 * _n_u_b22) * _n_u_b22) * _n_lh_b18)) + ((_S.call_value(_n_lnoise,[_n_t_b1, ((_n_r_b21 * 0.2) + (_n_n_b14 * 2)), (_n_n_b14 + 30), 5]) * _n_u_b22) * 1.4))
					if _S.truth((_n_half_b23 < 0.3)):
						_n_r_b21 += 1.0
						continue
					if true:
						var _n_x_b25 = floori((_n_cx_b24 - _n_half_b23)+0.5)
						while _S.truth((_n_x_b25 <= floori((_n_cx_b24 + _n_half_b23)+0.5))):
							if _S.truth(((_S.call_value(_n_lnoise,[_n_t_b1, (((_n_x_b25 * 0.9) + (_n_r_b21 * 0.7)) + _n_n_b14), (_n_n_b14 + 60), 8]) > 0.35) if _S.truth(((_n_u_b22 > 0.45) if _S.truth(_S.binary("===",_n_tone_b19,0)) else _S.binary("===",_n_tone_b19,0))) else ((_n_u_b22 > 0.45) if _S.truth(_S.binary("===",_n_tone_b19,0)) else _S.binary("===",_n_tone_b19,0)))):
								_n_x_b25 += 1.0
								continue
							_S.call_value(_n_set_b7,[_n_x_b25, (-_n_r_b21), _n_tone_b19])
							_n_x_b25 += 1.0
					_n_r_b21 += 1.0
	if true:
		var _n_j_b26 = 0
		while _S.truth((_n_j_b26 < _n_GY)):
			if true:
				var _n_i_b27 = 0
				while _S.truth((_n_i_b27 < (_n_GX * 2))):
					var _n_v_b28 = _S.index_value(_n_grid_b6,(((_n_j_b26 * _n_GX) * 2) + _n_i_b27))
					if _S.truth((_n_v_b28 < 0)):
						_n_i_b27 += 1.0
						continue
					var _n_x_b29 = (_n_i_b27 - _n_GX)
					var _n_y_b30 = (_n_j_b26 - _n_GY)
					var _n_c_b31 = _S.index_value(_n_TONE_b5,_n_v_b28)
					if _S.truth((((_S.index_value(_n_grid_b6,((((_n_j_b26 - 1) * _n_GX) * 2) + _n_i_b27)) if _S.index_value(_n_grid_b6,((((_n_j_b26 - 1) * _n_GX) * 2) + _n_i_b27))!=null else (-1)) < 0) if _S.truth(((_n_y_b30 < (-24)) if _S.truth(_S.binary("===",_n_v_b28,0)) else _S.binary("===",_n_v_b28,0))) else ((_n_y_b30 < (-24)) if _S.truth(_S.binary("===",_n_v_b28,0)) else _S.binary("===",_n_v_b28,0)))):
						_n_c_b31 = (_n_WHITE if _S.truth((_n_y_b30 < (-32))) else _S.index_value(_n_C_b3,7))
					_S.invoke(_n_p_b0,"px",[(_n_x_b29 + 0.5), (_n_y_b30 + 0.5), _n_c_b31])
					_n_i_b27 += 1.0
			_n_j_b26 += 1.0
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 34, _n_S_b4, _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f10")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 30, (_n_S_b4 + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f11"), _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f12")])
	var _n_fl_b9 = (0.85 + (0.15 * _S.call_value(_n_lnoise,[_n_t_b1, 0, 77, 6])))
	_S.invoke(_n_p_b0,"glow",[0, (-16), 52, _S.index_value(_n_C_b3,4), (0.5 * _n_fl_b9)])
	_S.invoke(_n_p_b0,"glow",[0, (-12), 26, _S.index_value(_n_C_b3,6), (0.34 * _n_fl_b9)])
	if true:
		var _n_j_b32 = 0
		while _S.truth((_n_j_b32 < _n_GY)):
			if true:
				var _n_i_b33 = 0
				while _S.truth((_n_i_b33 < (_n_GX * 2))):
					if _S.truth(_S.binary("===",_S.index_value(_n_grid_b6,(((_n_j_b32 * _n_GX) * 2) + _n_i_b33)),3)):
						var _n_sx_b34 = (_S.invoke(_n_p_b0,"cellX",[((_n_i_b33 - _n_GX) + 0.5), ((_n_j_b32 - _n_GY) + 0.5)]) - _S.named_value(_n_p_b0,"ox"))
						var _n_sy_b35 = (_S.invoke(_n_p_b0,"cellY",[((_n_i_b33 - _n_GX) + 0.5), ((_n_j_b32 - _n_GY) + 0.5)]) - _S.named_value(_n_p_b0,"oy"))
						if _S.truth(((_n_sy_b35 < _S.named_value(_n_p_b0,"h")) if _S.truth(((_n_sx_b34 < _S.named_value(_n_p_b0,"w")) if _S.truth(((_n_sy_b35 >= 0) if _S.truth((_n_sx_b34 >= 0)) else (_n_sx_b34 >= 0))) else ((_n_sy_b35 >= 0) if _S.truth((_n_sx_b34 >= 0)) else (_n_sx_b34 >= 0)))) else ((_n_sx_b34 < _S.named_value(_n_p_b0,"w")) if _S.truth(((_n_sy_b35 >= 0) if _S.truth((_n_sx_b34 >= 0)) else (_n_sx_b34 >= 0))) else ((_n_sy_b35 >= 0) if _S.truth((_n_sx_b34 >= 0)) else (_n_sx_b34 >= 0))))):
							_S.set_prop(_S.named_value(_n_p_b0,"L"),((_n_sy_b35 * _S.named_value(_n_p_b0,"w")) + _n_sx_b34),0,"=")
					_n_i_b33 += 1.0
			_n_j_b32 += 1.0
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_GX = _S.read(_parent,"GX")
	var _n_GY = _S.read(_parent,"GY")
	var _n_grid = _S.read(_parent,"grid")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_v_b2 = _S.arg(_args,2)
	var _n_i_b3 = (floori(_n_x_b0+0.5) + _n_GX)
	var _n_j_b4 = (floori(_n_y_b1+0.5) + _n_GY)
	if _S.truth(((_n_j_b4 < _n_GY) if _S.truth(((_n_i_b3 < (_n_GX * 2)) if _S.truth(((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))) else ((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0)))) else ((_n_i_b3 < (_n_GX * 2)) if _S.truth(((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))) else ((_n_j_b4 >= 0) if _S.truth((_n_i_b3 >= 0)) else (_n_i_b3 >= 0))))):
		_S.set_prop(_n_grid,(((_n_j_b4 * _n_GX) * 2) + _n_i_b3),_n_v_b2,"=")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _n_i_b1
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TONGUES = _S.read(_parent,"TONGUES")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (absf(_S.index_value(_S.index_value(_n_TONGUES,_n_b_b1),0)) - absf(_S.index_value(_S.index_value(_n_TONGUES,_n_a_b0),0)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.25, 0.5])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_TONGUES = _S.read(_parent,"TONGUES")
	var _n_p = _S.read(_parent,"p")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_L_b1)
	var _n_k_b4 = _S.invoke(_n_r_b2,"int",[0, 4])
	var _tuple_0 = _S.index_value(_n_TONGUES,_n_k_b4)
	var _n_dx_b5 = _S.prop(_tuple_0,0)
	var _n_H0_b6 = _S.prop(_tuple_0,1)
	var _n_x_b7 = ((_n_dx_b5 + _S.invoke(_n_r_b2,"range",[(-4), 4])) + (_n_u_b3 * _S.invoke(_n_r_b2,"range",[(-5), 5])))
	var _n_y_b8 = (((-_n_H0_b6) * _S.invoke(_n_r_b2,"range",[0.45, 0.85])) - (_n_u_b3 * _S.invoke(_n_r_b2,"range",[10, 20])))
	var _n_rad_b9 = ((_S.invoke(_n_r_b2,"range",[1, 2.2]) * (1 - _n_u_b3)) + 0.3)
	_S.invoke(_n_p,"circle",[_n_x_b7, _n_y_b8, (_n_rad_b9 + 0.6), (_S.index_value(_n_C,6) if _S.truth((_n_u_b3 < 0.5)) else _S.index_value(_n_C,4))])
	if _S.truth((_n_rad_b9 > 1)):
		_S.invoke(_n_p,"circle",[_n_x_b7, (_n_y_b8 + 0.4), (_n_rad_b9 * 0.5), (_S.index_value(_n_C,2) if _S.truth((_n_u_b3 < 0.3)) else _S.index_value(_n_C,4))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1, 1.8])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_u_b3 = (float(_n_age_b0)/_n_L_b1)
	var _n_x_b4 = (_S.invoke(_n_r_b2,"range",[(-12), 12]) + ((sin(((_n_u_b3 * 6) + _S.invoke(_n_r_b2,"range",[0, 6]))) * 5) * _n_u_b3))
	var _n_y_b5 = ((-10) - (_n_u_b3 * _S.invoke(_n_r_b2,"range",[40, 70])))
	if _S.truth(((sin(((_n_age_b0 * 40) + _n_x_b4)) < 0) if _S.truth((_n_u_b3 > 0.7)) else (_n_u_b3 > 0.7))):
		return null
	_S.invoke(_n_p,"px",[_n_x_b4, _n_y_b5, (_n_WHITE if _S.truth((_n_u_b3 < 0.3)) else (_S.index_value(_n_C,7) if _S.truth((_n_u_b3 < 0.6)) else _S.index_value(_n_C,6)))])
	_S.invoke(_n_p,"glow",[_n_x_b4, _n_y_b5, 3, _S.index_value(_n_C,6), (0.35 * (1 - _n_u_b3))])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	var _n_seed_b2 = _S.arg(_args,2)
	var _n_speed_b3 = _S.coalesce(_S.arg(_args,3),func():return 5)
	return _S.NoiseKernels.noise2(((cos((float((_n_TAU * _n_t_b0))/_n_D)) * _n_speed_b3) + _n_v_b1),(sin((float((_n_TAU * _n_t_b0))/_n_D)) * _n_speed_b3),_n_seed_b2)
	return null
