@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/ripples.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "alive", _S.function_value(_e, "_f0"))
	_S.define(_e, "surface", _S.function_value(_e, "_f1"))
	_S.define(_e, "rings", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Ripples"}, {"desc": "A drop plinks on still dark water and rings spread out across it at a low angle: the swell of each ring catches the light, crests glint, and they fade into the calm."}, {"tags": ["water", "ripples", "rings", "surface", "pond", "ambient", "loop"]}, {"size": [136, 52]}, {"origin": [68, 30]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.26)
	_S.define(_e, "EVERY", 0.5)
	_S.define(_e, "LIFE", 2)
	_S.define(_e, "RMAX", 60)
	_S.define(_e, "PATCH", 64)
	_S.define(_e, "radius", _S.function_value(_e, "_f8"))
	_S.define(_e, "power", _S.function_value(_e, "_f9"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_EVERY = _S.read(_parent,"EVERY")
	var _n_D = _S.read(_parent,"D")
	var _n_LIFE = _S.read(_parent,"LIFE")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_out_b1 = []
	if true:
		var _n_k_b2 = 0
		while _S.truth(((_n_k_b2 * _n_EVERY) < _n_LIFE)):
			var _n_a_b3 = fmod((fmod((_n_t_b0 - (_n_k_b2 * _n_EVERY)),_n_D) + _n_D),_n_D)
			if _S.truth((_n_a_b3 < _n_LIFE)):
				_S.invoke(_n_out_b1,"push",[[_n_a_b3, floori((float(fmod((fmod((_n_t_b0 - _n_a_b3),_n_D) + _n_D),_n_D))/_n_EVERY)+0.5)]])
			_n_k_b2 += 1.0
	return _n_out_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_alive = _S.read(_parent,"alive")
	var _n_PATCH = _S.read(_parent,"PATCH")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_rs_b3 = _S.invoke(_S.call_value(_n_alive,[_n_t_b2]),"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
	if true:
		var _n_Y_b4 = floori(((-_n_PATCH) * _n_SY))
		while _S.truth((_n_Y_b4 < (_n_PATCH * _n_SY))):
			if true:
				var _n_X_b5 = (-_n_PATCH)
				while _S.truth((_n_X_b5 < _n_PATCH)):
					var _n_x_b6 = (_n_X_b5 + 0.5)
					var _n_y_b7 = (_n_Y_b4 + 0.5)
					var _n_z_b8 = (float(_n_y_b7)/_n_SY)
					var _n_r_b9 = _S.Bridge.hypot([_n_x_b6, _n_z_b8])
					var _n_e_b10 = (float(_n_r_b9)/_n_PATCH)
					if _S.truth((_n_e_b10 > 1)):
						_n_X_b5 += 1.0
						continue
					var _n_edge_b11 = (1 - _S.MathFX.smooth(0.6,1,_n_e_b10))
					_S.invoke(_n_p_b0,"blend",[_n_x_b6, _n_y_b7, _S.index_value(_n_C_b1,1), (0.55 * _n_edge_b11)])
					var _n_slope_b12 = 0
					for _iter_0 in _S.array(_n_rs_b3):
						var _tuple_1 = _iter_0
						var _n_R_b14 = _S.prop(_tuple_1,0)
						var _n_k_b15 = _S.prop(_tuple_1,1)
						var _n_w_b16 = _S.prop(_tuple_1,2)
						var _n_d_b17 = (_n_r_b9 - _n_R_b14)
						if _S.truth(((_n_d_b17 > (2.2 * _n_w_b16)) if _S.truth((_n_d_b17 > (2.2 * _n_w_b16))) else (_n_d_b17 < ((-2.2) * _n_w_b16)))):
							continue
						_n_slope_b12 += (((_n_k_b15 * exp((-pow((float(_n_d_b17)/_n_w_b16),2)))) * (-sin((_n_d_b17 * 1.15)))) * 1.15)
					if _S.truth(_S.binary("===",_n_slope_b12,0)):
						_n_X_b5 += 1.0
						continue
					var _n_face_b13 = (_n_slope_b12 * (float((-((_n_x_b6 * (-0.55)) + (_n_z_b8 * (-0.84)))))/maxf(1,_n_r_b9)))
					if _S.truth((_n_face_b13 > 0.18)):
						_S.invoke(_n_p_b0,"blend",[_n_x_b6, _n_y_b7, (_S.index_value(_n_C_b1,5) if _S.truth((_n_face_b13 > 0.6)) else _S.index_value(_n_C_b1,4)), (minf(0.9,((_n_face_b13 - 0.18) * 2.2)) * _n_edge_b11)])
					else:
						if _S.truth((_n_face_b13 < (-0.25))):
							_S.invoke(_n_p_b0,"blend",[_n_x_b6, _n_y_b7, _S.index_value(_n_C_b1,0), (minf(0.8,(((-_n_face_b13) - 0.25) * 2)) * _n_edge_b11)])
					_n_X_b5 += 1.0
			_n_Y_b4 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_power = _S.read(_parent,"power")
	var _tuple_0 = _S.arg(_args,0)
	var _n_a_b0 = _S.prop(_tuple_0,0)
	return [_S.call_value(_n_radius,[_n_a_b0]), _S.call_value(_n_power,[_n_a_b0]), (3 + (_n_a_b0 * 2.2))]
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_power = _S.read(_parent,"power")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_alive = _S.read(_parent,"alive")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_half_b3 = _S.arg(_args,3)
	for _iter_0 in _S.array(_S.call_value(_n_alive,[_n_t_b2])):
		var _tuple_1 = _iter_0
		var _n_a_b4 = _S.prop(_tuple_1,0)
		var _n_i_b5 = _S.prop(_tuple_1,1)
		var _n_R_b6 = _S.call_value(_n_radius,[_n_a_b4])
		var _n_k_b7 = _S.call_value(_n_power,[_n_a_b4])
		_S.call_value(_n_ring,[_n_p_b0, 0, 0, _n_R_b6, _n_SY, (0.85 * _n_k_b7), _n_C_b1, {"n":2,"gap":(3 + (_n_a_b4 * 1.4)),"half":_n_half_b3,"hot":(_n_a_b4 < 0.14),"glint":(_n_k_b7 if _S.truth(((_n_a_b4 > 0.1) if _S.truth((_n_half_b3 > 0)) else (_n_half_b3 > 0))) else 0),"seed":(_n_i_b5 + 1),"wob":(0.4 + (_n_a_b4 * 1.1))}])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_surface = _S.read(_parent,"surface")
	var _n_rings = _S.read(_parent,"rings")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_surface,[_n_p_b0, _n_C_b3, _n_t_b1])
	_S.call_value(_n_rings,[_n_p_b0, _n_C_b3, _n_t_b1, (-1)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_rings = _S.read(_parent,"rings")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_alive = _S.read(_parent,"alive")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_S_b4 = _S.named_value(_n_o_b2,"seed")
	_S.call_value(_n_rings,[_n_p_b0, _n_C_b3, _n_t_b1, 1])
	for _iter_0 in _S.array(_S.call_value(_n_alive,[_n_t_b1])):
		var _tuple_1 = _iter_0
		var _n_a_b5 = _S.prop(_tuple_1,0)
		if _S.truth((_n_a_b5 < 0.08)):
			_S.invoke(_n_p_b0,"px",[0, 0, _n_WHITE])
			_S.invoke(_n_p_b0,"px",[(-1), 0, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"px",[1, 0, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"glow",[0, 0, 8, _S.index_value(_n_C_b3,5), (0.5 * (1 - (float(_n_a_b5)/0.08)))])
		var _n_b_b6 = (_n_a_b5 - 0.04)
		var _n_h_b7 = ((90 * _n_b_b6) - (((0.5 * 700) * _n_b_b6) * _n_b_b6))
		if _S.truth(((_n_h_b7 > 0) if _S.truth((_n_b_b6 > 0)) else (_n_b_b6 > 0))):
			_S.invoke(_n_p_b0,"px",[0, (-_n_h_b7), _n_WHITE])
			_S.invoke(_n_p_b0,"px",[0, ((-_n_h_b7) + 1), _S.index_value(_n_C_b3,5)])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 10, (_n_S_b4 + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f7")])
	_S.invoke(_n_p_b0,"glow",[0, 0, 40, _S.index_value(_n_C_b3,4), 0.14])
	_S.invoke(_n_p_b0,"glow",[0, 0, 14, _S.index_value(_n_C_b3,5), 0.12])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"range",[0.25, 0.45])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_alive = _S.read(_parent,"alive")
	var _n_t = _S.read(_parent,"t")
	var _n_radius = _S.read(_parent,"radius")
	var _n_power = _S.read(_parent,"power")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p = _S.read(_parent,"p")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_all_b3 = _S.call_value(_n_alive,[_n_t])
	var _tuple_0 = _S.logical("??",_S.index_value(_n_all_b3,floori((_S.invoke(_n_r_b2,"next",[]) * _S.prop(_n_all_b3,"length")))),func():return [0])
	var _n_a_b4 = _S.prop(_tuple_0,0)
	var _n_ang_b5 = _S.invoke(_n_r_b2,"range",[0.3, (PI - 0.3)])
	var _n_R_b6 = _S.call_value(_n_radius,[_n_a_b4])
	var _n_k_b7 = (sin((float((PI * _n_age_b0))/_n_life_b1)) * _S.call_value(_n_power,[_n_a_b4]))
	if _S.truth(((_n_k_b7 < 0.15) if _S.truth((_n_k_b7 < 0.15)) else (_n_R_b6 < 6))):
		return null
	var _n_x_b8 = (cos(_n_ang_b5) * _n_R_b6)
	var _n_y_b9 = ((sin(_n_ang_b5) * _n_R_b6) * _n_SY)
	_S.invoke(_n_p,"px",[_n_x_b8, _n_y_b9, _n_WHITE])
	if _S.truth((_n_k_b7 > 0.5)):
		for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_2 = _iter_1
			var _n_dx_b10 = _S.prop(_tuple_2,0)
			var _n_dy_b11 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p,"px",[(_n_x_b8 + _n_dx_b10), (_n_y_b9 + _n_dy_b11), _S.index_value(_n_C,6)])
	_S.invoke(_n_p,"glow",[_n_x_b8, _n_y_b9, 5, _S.index_value(_n_C,5), (0.4 * _n_k_b7)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_RMAX = _S.read(_parent,"RMAX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_LIFE = _S.read(_parent,"LIFE")
	var _n_a_b0 = _S.arg(_args,0)
	return (2 + ((_n_RMAX - 2) * _S.invoke(_n_ease,"outCubic",[(float(_n_a_b0)/_n_LIFE)])))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_LIFE = _S.read(_parent,"LIFE")
	var _n_a_b0 = _S.arg(_args,0)
	return (pow((1 - (float(_n_a_b0)/_n_LIFE)),1.5) * minf(1,(float(_n_a_b0)/0.08)))
	return null
