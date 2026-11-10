@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/shapes.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "TAU", _S.import_value("core/math.js", "TAU"))
	_S.define(_e, "bolt", _S.function_value(_e, "_f0"))
	_S.define(_e, "forks", _S.function_value(_e, "_f1"))
	_S.define(_e, "star", _S.function_value(_e, "_f2"))
	_S.define(_e, "ngon", _S.function_value(_e, "_f3"))
	_S.define(_e, "trail", _S.function_value(_e, "_f5"))
	_exports["bolt"] = _S.read(_e, "bolt")
	_exports["forks"] = _S.read(_e, "forks")
	_exports["star"] = _S.read(_e, "star")
	_exports["ngon"] = _S.read(_e, "ngon")
	_exports["trail"] = _S.read(_e, "trail")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_y1_b4 = _S.arg(_args,4)
	var _object_0 = _S.coalesce(_S.arg(_args,5),func():return {})
	var _n_jag_b5 = _S.coalesce(_S.named_value(_object_0,"jag"),func():return 0.22)
	var _n_depth_b6 = _S.coalesce(_S.named_value(_object_0,"depth"),func():return 5)
	var _n_pts_b7 = [[_n_x0_b1, _n_y0_b2], [_n_x1_b3, _n_y1_b4]]
	if true:
		var _n_d_b8 = 0
		while _S.truth((_n_d_b8 < _n_depth_b6)):
			var _n_next_b9 = [_S.index_value(_n_pts_b7,0)]
			if true:
				var _n_i_b10 = 1
				while _S.truth((_n_i_b10 < _S.prop(_n_pts_b7,"length"))):
					var _tuple_1 = _S.index_value(_n_pts_b7,(_n_i_b10 - 1))
					var _n_ax_b11 = _S.prop(_tuple_1,0)
					var _n_ay_b12 = _S.prop(_tuple_1,1)
					var _tuple_2 = _S.index_value(_n_pts_b7,_n_i_b10)
					var _n_bx_b13 = _S.prop(_tuple_2,0)
					var _n_by_b14 = _S.prop(_tuple_2,1)
					var _n_dx_b15 = (_n_bx_b13 - _n_ax_b11)
					var _n_dy_b16 = (_n_by_b14 - _n_ay_b12)
					var _n_L_b17 = _S.Bridge.hypot([_n_dx_b15, _n_dy_b16])
					var _n_off_b18 = ((((_S.invoke(_n_r_b0,"next",[]) * 2) - 1) * _n_jag_b5) * _n_L_b17)
					_S.invoke(_n_next_b9,"push",[[((float((_n_ax_b11 + _n_bx_b13))/2) + ((float((-_n_dy_b16))/(_n_L_b17 if _S.truth(_n_L_b17) else 1)) * _n_off_b18)), ((float((_n_ay_b12 + _n_by_b14))/2) + ((float(_n_dx_b15)/(_n_L_b17 if _S.truth(_n_L_b17) else 1)) * _n_off_b18))], _S.index_value(_n_pts_b7,_n_i_b10)])
					_n_i_b10 += 1.0
			_n_pts_b7 = _n_next_b9
			_n_d_b8 += 1.0
	return _n_pts_b7
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_path_b1 = _S.arg(_args,1)
	var _object_0 = _S.coalesce(_S.arg(_args,2),func():return {})
	var _n_count_b2 = _S.coalesce(_S.named_value(_object_0,"count"),func():return 3)
	var _n_len_b3 = _S.coalesce(_S.named_value(_object_0,"len"),func():return 20)
	var _n_jag_b4 = _S.coalesce(_S.named_value(_object_0,"jag"),func():return 0.3)
	var _n_spread_b5 = _S.coalesce(_S.named_value(_object_0,"spread"),func():return 0.9)
	var _n_out_b6 = []
	if true:
		var _n_k_b7 = 0
		while _S.truth((_n_k_b7 < _n_count_b2)):
			var _n_i_b8 = (1 + floori((_S.invoke(_n_r_b0,"next",[]) * (_S.prop(_n_path_b1,"length") - 2))))
			var _tuple_1 = _S.index_value(_n_path_b1,_n_i_b8)
			var _n_x_b9 = _S.prop(_tuple_1,0)
			var _n_y_b10 = _S.prop(_tuple_1,1)
			var _tuple_2 = _S.index_value(_n_path_b1,(_n_i_b8 - 1))
			var _n_px_b11 = _S.prop(_tuple_2,0)
			var _n_py_b12 = _S.prop(_tuple_2,1)
			var _n_a_b13 = (atan2((_n_y_b10 - _n_py_b12),(_n_x_b9 - _n_px_b11)) + ((((-1) if _S.truth((_S.invoke(_n_r_b0,"next",[]) < 0.5)) else 1) * _n_spread_b5) * (0.4 + (0.6 * _S.invoke(_n_r_b0,"next",[])))))
			var _n_l_b14 = (_n_len_b3 * (0.4 + (0.6 * _S.invoke(_n_r_b0,"next",[]))))
			_S.invoke(_n_out_b6,"push",[_S.call_value(_n_bolt,[_n_r_b0, _n_x_b9, _n_y_b10, (_n_x_b9 + (cos(_n_a_b13) * _n_l_b14)), (_n_y_b10 + (sin(_n_a_b13) * _n_l_b14)), {"jag":_n_jag_b4,"depth":3}])])
			_n_k_b7 += 1.0
	return _n_out_b6
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_r0_b2 = _S.arg(_args,2)
	var _n_r1_b3 = _S.arg(_args,3)
	var _n_n_b4 = _S.coalesce(_S.arg(_args,4),func():return 5)
	var _n_rot_b5 = _S.coalesce(_S.arg(_args,5),func():return (float((-PI))/2))
	var _n_pts_b6 = []
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < (_n_n_b4 * 2))):
			var _n_a_b8 = (_n_rot_b5 + (float((_n_i_b7 * PI))/_n_n_b4))
			var _n_r_b9 = (_n_r0_b2 if _S.truth(fmod(_n_i_b7,2)) else _n_r1_b3)
			_S.invoke(_n_pts_b6,"push",[[(_n_cx_b0 + (cos(_n_a_b8) * _n_r_b9)), (_n_cy_b1 + (sin(_n_a_b8) * _n_r_b9))]])
			_n_i_b7 += 1.0
	return _n_pts_b6
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_n_b3 = _S.coalesce(_S.arg(_args,3),func():return 6)
	var _n_rot_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	return _S.invoke(_n_Array,"from",[{"length":_n_n_b3}, _S.function_value(_S.capture(_parent,{"cx":_n_cx_b0,"rot":_n_rot_b4,"n":_n_n_b3,"r":_n_r_b2,"cy":_n_cy_b1,"this":_this}),"_f4")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_rot = _S.read(_parent,"rot")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_n = _S.read(_parent,"n")
	var _n_r = _S.read(_parent,"r")
	var _n_cy = _S.read(_parent,"cy")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [(_n_cx + (cos((_n_rot + (float((_n_i_b1 * _n_TAU))/_n_n))) * _n_r)), (_n_cy + (sin((_n_rot + (float((_n_i_b1 * _n_TAU))/_n_n))) * _n_r))]
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_pos_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_dt_b3 = _S.arg(_args,3)
	var _n_out_b4 = []
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < _n_n_b2)):
			_S.invoke(_n_out_b4,"push",[_S.call_value(_n_pos_b0,[maxf(0,(_n_t_b1 - (_n_i_b5 * _n_dt_b3)))])])
			_n_i_b5 += 1.0
	return _n_out_b4
	return null
