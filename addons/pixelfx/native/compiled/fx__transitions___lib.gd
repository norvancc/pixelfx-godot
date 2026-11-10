@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f6":"transition_field","_f11":"transition_pixels"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Painter", _S.import_value("core/index.js", "Painter"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "screenMeta", _S.function_value(_e, "_f0"))
	_S.define(_e, "clipTo", _S.function_value(_e, "_f1"))
	_S.define(_e, "rect", _S.function_value(_e, "_f2"))
	_S.define(_e, "fillConvex", _S.function_value(_e, "_f3"))
	_S.define(_e, "halfPlane", _S.function_value(_e, "_f4"))
	_S.define(_e, "field", _S.function_value(_e, "_f6"))
	_S.define(_e, "pixels", _S.function_value(_e, "_f11"))
	_S.define(_e, "glint", _S.function_value(_e, "_f22"))
	_S.define(_e, "W", 320)
	_S.define(_e, "H", 180)
	_exports["W"] = _S.read(_e, "W")
	_exports["H"] = _S.read(_e, "H")
	_exports["screenMeta"] = _S.read(_e, "screenMeta")
	_S.define(_e, "Clipped", _S.class_value("Clipped", null, {"inside": _S.function_value(_e, "_f23"), "put": _S.function_value(_e, "_f24"), "add": _S.function_value(_e, "_f25"), "blendPx": _S.function_value(_e, "_f26")}, {}, {}, _S.read(_e, "Painter")))
	_S.define(_e, "clips", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["clipTo"] = _S.read(_e, "clipTo")
	_S.define(_e, "unrotated", _S.function_value(_e, "_f27"))
	_S.define(_e, "col0", _S.function_value(_e, "_f28"))
	_exports["rect"] = _S.read(_e, "rect")
	_exports["fillConvex"] = _S.read(_e, "fillConvex")
	_exports["halfPlane"] = _S.read(_e, "halfPlane")
	_exports["field"] = _S.read(_e, "field")
	_exports["pixels"] = _S.read(_e, "pixels")
	_exports["glint"] = _S.read(_e, "glint")
	_S.define(_e, "lifeLeft", _S.function_value(_e, "_f29"))
	_exports["lifeLeft"] = _S.read(_e, "lifeLeft")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "name", _S.prop(_v0, "name"))
	_S.define(_e, "desc", _S.prop(_v0, "desc"))
	_S.define(_e, "tags", _S.prop(_v0, "tags"))
	_S.define(_e, "duration", _S.prop(_v0, "duration"))
	_S.define(_e, "options", _S.prop(_v0, "options"))
	return _S.merge([{"name": _S.read(_e, "name")}, {"desc": _S.read(_e, "desc")}, {"tags": _S.concat([["transition"], ["screen"], _S.array(_S.read(_e, "tags")), ["one-shot"]])}, {"size": [_S.read(_e, "W"), _S.read(_e, "H")]}, {"origin": [0, 0]}, {"duration": _S.read(_e, "duration")}, {"loop": false}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"color": "#0b0a10"}, {"seed": 1}, _S.read(_e, "options")])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "clips"), "get", [_S.read(_e, "p")]))
	if _S.truth(_S.unary("!", _S.read(_e, "q"))):
		_S.invoke(_S.read(_e, "clips"), "set", [_S.read(_e, "p"), _S.write(_e, "q", _S.construct(_S.read(_e, "Clipped"), [_S.prop(_S.read(_e, "p"), "frame")]), "=", false)])
	_S.invoke(_S.read(_e, "q"), "reset", [])
	_S.set_prop(_S.read(_e, "q"), "tx", _S.prop(_S.read(_e, "p"), "tx"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "ty", _S.prop(_S.read(_e, "p"), "ty"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "fx", _S.prop(_S.read(_e, "p"), "fx"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "cs", _S.prop(_S.read(_e, "p"), "cs"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "sn", _S.prop(_S.read(_e, "p"), "sn"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "fade", _S.prop(_S.read(_e, "p"), "fade"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "lightK", _S.prop(_S.read(_e, "p"), "lightK"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "layer", _S.prop(_S.read(_e, "p"), "layer"), "=", false)
	return _S.read(_e, "q")

static func _f2(_parent,_args:Array,_this=null):
	var _n_unrotated = _S.read(_parent,"unrotated")
	var _n_col0 = _S.read(_parent,"col0")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_w_b3 = _S.arg(_args,3)
	var _n_h_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	if _S.truth(not _S.truth(_S.call_value(_n_unrotated,[_n_p_b0]))):
		return _S.invoke(_n_p_b0,"rect",[_n_x_b1, _n_y_b2, _n_w_b3, _n_h_b4, _n_c_b5])
	var _n_X0_b6 = floori(_n_x_b1+0.5)
	var _n_X1_b7 = floori((_n_x_b1 + _n_w_b3)+0.5)
	var _n_Y0_b8 = floori(_n_y_b2+0.5)
	var _n_Y1_b9 = floori((_n_y_b2 + _n_h_b4)+0.5)
	var _n_fx_b10 = _S.named_value(_n_p_b0,"fx")
	var _n_b_b11 = _S.call_value(_n_col0,[_n_p_b0])
	if true:
		var _n_yy_b12 = _n_Y0_b8
		while _S.truth((_n_yy_b12 < _n_Y1_b9)):
			var _n_sy_b13 = floori(((_S.named_value(_n_p_b0,"ty") + _n_yy_b12) + 0.5))
			if true:
				var _n_xx_b14 = _n_X0_b6
				while _S.truth((_n_xx_b14 < _n_X1_b7)):
					_S.invoke(_n_p_b0,"put",[(_n_b_b11 + (_n_fx_b10 * _n_xx_b14)), _n_sy_b13, _n_c_b5, 1])
					_n_xx_b14 += 1.0
			_n_yy_b12 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_unrotated = _S.read(_parent,"unrotated")
	var _n_col0 = _S.read(_parent,"col0")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_y0_b4 = INF
	var _n_y1_b5 = (-INF)
	for _iter_0 in _S.array(_n_pts_b1):
		var _tuple_1 = _iter_0
		var _n_y_b10 = _S.prop(_tuple_1,1)
		_n_y0_b4 = minf(_n_y0_b4,_n_y_b10)
		_n_y1_b5 = maxf(_n_y1_b5,_n_y_b10)
	var _n_r0_b6 = maxf(0,ceili((_n_y0_b4 - 0.5)))
	var _n_r1_b7 = minf((_n_H - 1),floori((_n_y1_b5 - 0.5)))
	var _n_n_b8 = _S.prop(_n_pts_b1,"length")
	var _n_fc_b9 = _S.binary("===",_S.unary("typeof",_n_c_b2),"function")
	if true:
		var _n_y_b11 = _n_r0_b6
		while _S.truth((_n_y_b11 <= _n_r1_b7)):
			var _n_yc_b12 = (_n_y_b11 + 0.5)
			var _n_xl_b13 = INF
			var _n_xr_b14 = (-INF)
			if true:
				var _n_i_b17 = 0
				var _n_j_b18 = (_n_n_b8 - 1)
				while _S.truth((_n_i_b17 < _n_n_b8)):
					var _tuple_2 = _S.index_value(_n_pts_b1,_n_i_b17)
					var _n_xi_b19 = _S.prop(_tuple_2,0)
					var _n_yi_b20 = _S.prop(_tuple_2,1)
					var _tuple_3 = _S.index_value(_n_pts_b1,_n_j_b18)
					var _n_xj_b21 = _S.prop(_tuple_3,0)
					var _n_yj_b22 = _S.prop(_tuple_3,1)
					if _S.truth(_S.binary("===",(_n_yi_b20 > _n_yc_b12),(_n_yj_b22 > _n_yc_b12))):
						_n_j_b18 = _n_i_b17
						_n_i_b17 += 1.0
						continue
					var _n_x_b23 = (_n_xi_b19 + (float(((_n_yc_b12 - _n_yi_b20) * (_n_xj_b21 - _n_xi_b19)))/(_n_yj_b22 - _n_yi_b20)))
					if _S.truth((_n_x_b23 < _n_xl_b13)):
						_n_xl_b13 = _n_x_b23
					if _S.truth((_n_x_b23 > _n_xr_b14)):
						_n_xr_b14 = _n_x_b23
					_n_j_b18 = _n_i_b17
					_n_i_b17 += 1.0
			var _n_c0_b15 = maxf(0,ceili((_n_xl_b13 - 0.5)))
			var _n_c1_b16 = minf((_n_W - 1),floori((_n_xr_b14 - 0.5)))
			if _S.truth(_S.call_value(_n_unrotated,[_n_p_b0])):
				var _n_fx_b24 = _S.named_value(_n_p_b0,"fx")
				var _n_b_b25 = _S.call_value(_n_col0,[_n_p_b0])
				var _n_sy_b26 = floori((_S.named_value(_n_p_b0,"ty") + _n_yc_b12))
				if true:
					var _n_x_b27 = _n_c0_b15
					while _S.truth((_n_x_b27 <= _n_c1_b16)):
						var _n_col_b28 = (_S.call_value(_n_c_b2,[(_n_x_b27 + 0.5), _n_yc_b12]) if _S.truth(_n_fc_b9) else _n_c_b2)
						if _S.truth(_n_col_b28):
							_S.invoke(_n_p_b0,"put",[(_n_b_b25 + (_n_fx_b24 * _n_x_b27)), _n_sy_b26, _n_col_b28, _n_a_b3])
						_n_x_b27 += 1.0
			else:
				if true:
					var _n_x_b29 = _n_c0_b15
					while _S.truth((_n_x_b29 <= _n_c1_b16)):
						var _n_col_b30 = (_S.call_value(_n_c_b2,[(_n_x_b29 + 0.5), _n_yc_b12]) if _S.truth(_n_fc_b9) else _n_c_b2)
						if _S.truth(_n_col_b30):
							_S.invoke(_n_p_b0,"dot",[_n_x_b29, _n_y_b11, _n_col_b30, _n_a_b3])
						_n_x_b29 += 1.0
			_n_y_b11 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_nx_b3 = _S.arg(_args,3)
	var _n_ny_b4 = _S.arg(_args,4)
	var _n_out_b5 = []
	var _n_side_b6 = _S.function_value(_S.capture(_parent,{"cx":_n_cx_b1,"nx":_n_nx_b3,"cy":_n_cy_b2,"ny":_n_ny_b4,"this":_this}),"_f5")
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _S.prop(_n_pts_b0,"length"))):
			var _n_a_b8 = _S.index_value(_n_pts_b0,_n_i_b7)
			var _n_b_b9 = _S.index_value(_n_pts_b0,fmod((_n_i_b7 + 1),_S.prop(_n_pts_b0,"length")))
			var _n_sa_b10 = _S.call_value(_n_side_b6,[_n_a_b8])
			var _n_sb_b11 = _S.call_value(_n_side_b6,[_n_b_b9])
			if _S.truth((_n_sa_b10 >= 0)):
				_S.invoke(_n_out_b5,"push",[_n_a_b8])
			if _S.truth(_S.binary("!==",(_n_sa_b10 >= 0),(_n_sb_b11 >= 0))):
				var _n_k_b12 = (float(_n_sa_b10)/(_n_sa_b10 - _n_sb_b11))
				_S.invoke(_n_out_b5,"push",[[(_S.index_value(_n_a_b8,0) + ((_S.index_value(_n_b_b9,0) - _S.index_value(_n_a_b8,0)) * _n_k_b12)), (_S.index_value(_n_a_b8,1) + ((_S.index_value(_n_b_b9,1) - _S.index_value(_n_a_b8,1)) * _n_k_b12))]])
			_n_i_b7 += 1.0
	return _n_out_b5
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_nx = _S.read(_parent,"nx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_ny = _S.read(_parent,"ny")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return (((_n_x_b0 - _n_cx) * _n_nx) + ((_n_y_b1 - _n_cy) * _n_ny))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_Uint32Array = _S.read(_parent,"Uint32Array")
	var _n_fn_b0 = _S.arg(_args,0)
	var _n_gmin_b1 = _S.coalesce(_S.arg(_args,1),func():return 0.45)
	var _n_gmax_b2 = _S.coalesce(_S.arg(_args,2),func():return 3)
	var _n_f_b3 = _S.construct(_n_Float32Array,[(_n_W * _n_H)])
	var _n_g_b4 = _S.construct(_n_Float32Array,[(_n_W * _n_H)])
	var _n_ny_b5 = _S.construct(_n_Float32Array,[(_n_W * _n_H)])
	var _n_lo_b6 = INF
	var _n_hi_b7 = (-INF)
	if true:
		var _n_y_b11 = 0
		while _S.truth((_n_y_b11 < _n_H)):
			if true:
				var _n_x_b12 = 0
				while _S.truth((_n_x_b12 < _n_W)):
					var _n_v_b13 = _S.call_value(_n_fn_b0,[(_n_x_b12 + 0.5), (_n_y_b11 + 0.5)])
					_S.set_prop(_n_f_b3,((_n_y_b11 * _n_W) + _n_x_b12),_n_v_b13,"=")
					if _S.truth((_n_v_b13 < _n_lo_b6)):
						_n_lo_b6 = _n_v_b13
					if _S.truth((_n_v_b13 > _n_hi_b7)):
						_n_hi_b7 = _n_v_b13
					_n_x_b12 += 1.0
			_n_y_b11 += 1.0
	if true:
		var _n_y_b14 = 0
		while _S.truth((_n_y_b14 < _n_H)):
			if true:
				var _n_x_b15 = 0
				while _S.truth((_n_x_b15 < _n_W)):
					var _n_xa_b16 = maxf(0,(_n_x_b15 - 1))
					var _n_xb_b17 = minf((_n_W - 1),(_n_x_b15 + 1))
					var _n_ya_b18 = maxf(0,(_n_y_b14 - 1))
					var _n_yb_b19 = minf((_n_H - 1),(_n_y_b14 + 1))
					var _n_gx_b20 = (float((_S.index_value(_n_f_b3,((_n_y_b14 * _n_W) + _n_xb_b17)) - _S.index_value(_n_f_b3,((_n_y_b14 * _n_W) + _n_xa_b16))))/(_n_xb_b17 - _n_xa_b16))
					var _n_gy_b21 = (float((_S.index_value(_n_f_b3,((_n_yb_b19 * _n_W) + _n_x_b15)) - _S.index_value(_n_f_b3,((_n_ya_b18 * _n_W) + _n_x_b15))))/(_n_yb_b19 - _n_ya_b18))
					var _n_L_b22 = _S.Bridge.hypot([_n_gx_b20, _n_gy_b21])
					_S.set_prop(_n_g_b4,((_n_y_b14 * _n_W) + _n_x_b15),(float(1)/clampf(_n_L_b22,_n_gmin_b1,_n_gmax_b2)),"=")
					_S.set_prop(_n_ny_b5,((_n_y_b14 * _n_W) + _n_x_b15),((float(_n_gy_b21)/_n_L_b22) if _S.truth((_n_L_b22 > 0.000001)) else 0),"=")
					_n_x_b15 += 1.0
			_n_y_b14 += 1.0
	var _n_order_b8 = _S.invoke(_S.invoke(_n_Uint32Array,"from",[{"length":(_n_W * _n_H)}, _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")]),"sort",[_S.function_value(_S.capture(_parent,{"f":_n_f_b3,"this":_this}),"_f8")])
	var _n_sorted_b9 = _S.invoke(_n_Float32Array,"from",[_n_order_b8, _S.function_value(_S.capture(_parent,{"f":_n_f_b3,"this":_this}),"_f9")])
	var _n_below_b10 = _S.function_value(_S.capture(_parent,{"sorted":_n_sorted_b9,"this":_this}),"_f10")
	return {"f":_n_f_b3,"g":_n_g_b4,"ny":_n_ny_b5,"lo":_n_lo_b6,"hi":_n_hi_b7,"order":_n_order_b8,"below":_n_below_b10}
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _n_i_b1
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_f,_n_a_b0) - _S.index_value(_n_f,_n_b_b1))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_f,_n_i_b0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_sorted = _S.read(_parent,"sorted")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_a_b1 = 0
	var _n_b_b2 = _S.prop(_n_sorted,"length")
	while _S.truth((_n_a_b1 < _n_b_b2)):
		var _n_m_b3 = _S.binary(">>",(_n_a_b1 + _n_b_b2),1)
		if _S.truth((_S.index_value(_n_sorted,_n_m_b3) < _n_v_b0)):
			_n_a_b1 = (_n_m_b3 + 1)
		else:
			_n_b_b2 = _n_m_b3
	return _n_a_b1
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "sx", 0)
	_S.define(_e, "sy", 0)
	_S.define(_e, "i0", 0)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "p"), "sn"), 0), func(): return _S.binary("===", _S.prop(_S.read(_e, "p"), "cs"), 1))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "tx", _S.prop(_S.read(_v29, "p"), "tx"))
		_S.define(_v29, "ty", _S.prop(_S.read(_v29, "p"), "ty"))
		_S.define(_v29, "fx", _S.prop(_S.read(_v29, "p"), "fx"))
		return _S.merge([{"at": _S.function_value(_v29, "_f12")}, {"put": _S.function_value(_v29, "_f13")}, {"add": _S.function_value(_v29, "_f14")}, {"blend": _S.function_value(_v29, "_f15")}])
	_S.define(_e, "x", _S.function_value(_e, "_f16"))
	_S.define(_e, "y", _S.function_value(_e, "_f17"))
	return _S.merge([{"at": _S.function_value(_e, "_f18")}, {"put": _S.function_value(_e, "_f19")}, {"add": _S.function_value(_e, "_f20")}, {"blend": _S.function_value(_e, "_f21")}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.write(_e, "sx", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.read(_e, "tx"), _S.binary("*", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.read(_e, "W")), 0.5), _S.read(_e, "fx")))]), "=", false)
	_S.write(_e, "sy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("+", _S.read(_e, "ty"), _S.binary("|", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "W")), 0)), 0.5)]), "=", false)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.coalesce(_S.arg(_args,1),func():return 1)
	return _S.invoke(_n_p,"put",[_n_sx, _n_sy, _n_c_b0, _n_a_b1])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return _S.invoke(_n_p,"add",[_n_sx, _n_sy, _n_c_b0, _n_k_b1])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return _S.invoke(_n_p,"blendPx",[_n_sx, _n_sy, _n_c_b0, _n_a_b1])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_i0 = _S.read(_parent,"i0")
	var _n_W = _S.read(_parent,"W")
	return (fmod(_n_i0,_n_W) + 0.5)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_i0 = _S.read(_parent,"i0")
	var _n_W = _S.read(_parent,"W")
	return (_S.binary("|",(float(_n_i0)/_n_W),0) + 0.5)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.write(_e, "i0", _S.read(_e, "i"), "=", false)
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.coalesce(_S.arg(_args,1),func():return 1)
	return _S.invoke(_n_p,"dot",[_S.call_value(_n_x,[]), _S.call_value(_n_y,[]), _n_c_b0, _n_a_b1])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return _S.invoke(_n_p,"light",[_S.call_value(_n_x,[]), _S.call_value(_n_y,[]), _n_c_b0, _n_k_b1])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return _S.invoke(_n_p,"blend",[_S.call_value(_n_x,[]), _S.call_value(_n_y,[]), _n_c_b0, _n_a_b1])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_L_b3 = _S.arg(_args,3)
	var _n_ang_b4 = _S.arg(_args,4)
	var _n_c1_b5 = _S.arg(_args,5)
	var _n_c2_b6 = _S.arg(_args,6)
	var _n_a_b7 = _S.coalesce(_S.arg(_args,7),func():return 1)
	if _S.truth(((_n_L_b3 < 0.8) if _S.truth((_n_L_b3 < 0.8)) else (_n_a_b7 <= 0))):
		return null
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < 8)):
			var _n_diag_b9 = _S.binary("===",fmod(_n_i_b8,2),1)
			var _n_an_b10 = (_n_ang_b4 + (float((_n_i_b8 * _n_TAU))/8))
			var _n_len_b11 = ((_n_L_b3 * 0.42) if _S.truth(_n_diag_b9) else _n_L_b3)
			var _n_ca_b12 = cos(_n_an_b10)
			var _n_sa_b13 = sin(_n_an_b10)
			if true:
				var _n_d_b14 = 0
				while _S.truth((_n_d_b14 <= _n_len_b11)):
					var _n_u_b15 = (float(_n_d_b14)/_n_len_b11)
					var _n_c_b16 = ((_n_c1_b5 if _S.truth((_n_u_b15 < 0.5)) else _n_c2_b6) if _S.truth(_n_diag_b9) else (_n_WHITE if _S.truth((_n_u_b15 < 0.3)) else (_n_c1_b5 if _S.truth((_n_u_b15 < 0.65)) else _n_c2_b6)))
					_S.invoke(_n_p_b0,"dot",[(_n_x_b1 + (_n_ca_b12 * _n_d_b14)), (_n_y_b2 + (_n_sa_b13 * _n_d_b14)), _n_c_b16, (_n_a_b7 * (1 if _S.truth((_n_u_b15 < 0.7)) else (1 - (float((_n_u_b15 - 0.7))/0.35))))])
					if _S.truth(((_n_L_b3 > 4) if _S.truth(((_n_u_b15 < 0.22) if _S.truth(not _S.truth(_n_diag_b9)) else not _S.truth(_n_diag_b9))) else ((_n_u_b15 < 0.22) if _S.truth(not _S.truth(_n_diag_b9)) else not _S.truth(_n_diag_b9)))):
						_S.invoke(_n_p_b0,"dot",[((_n_x_b1 + (_n_ca_b12 * _n_d_b14)) - _n_sa_b13), ((_n_y_b2 + (_n_sa_b13 * _n_d_b14)) + _n_ca_b12), _n_c1_b5, _n_a_b7])
						_S.invoke(_n_p_b0,"dot",[((_n_x_b1 + (_n_ca_b12 * _n_d_b14)) + _n_sa_b13), ((_n_y_b2 + (_n_sa_b13 * _n_d_b14)) - _n_ca_b12), _n_c1_b5, _n_a_b7])
					_n_d_b14 += 0.5
			_n_i_b8 += 1.0
	_S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, _n_WHITE, _n_a_b7])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (4 + (_n_L_b3 * 1.4)), _n_c1_b5, (0.5 * _n_a_b7)])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, (2 + (_n_L_b3 * 0.5)), _n_WHITE, (0.4 * _n_a_b7)])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_lx_b2 = _S.invoke(_this,"fromX",[(_n_sx_b0 + 0.5), (_n_sy_b1 + 0.5)])
	var _n_ly_b3 = _S.invoke(_this,"fromY",[(_n_sx_b0 + 0.5), (_n_sy_b1 + 0.5)])
	return ((_n_ly_b3 < _n_H) if _S.truth(((_n_lx_b2 < _n_W) if _S.truth(((_n_ly_b3 >= 0) if _S.truth((_n_lx_b2 >= 0)) else (_n_lx_b2 >= 0))) else ((_n_ly_b3 >= 0) if _S.truth((_n_lx_b2 >= 0)) else (_n_lx_b2 >= 0)))) else ((_n_lx_b2 < _n_W) if _S.truth(((_n_ly_b3 >= 0) if _S.truth((_n_lx_b2 >= 0)) else (_n_lx_b2 >= 0))) else ((_n_ly_b3 >= 0) if _S.truth((_n_lx_b2 >= 0)) else (_n_lx_b2 >= 0))))
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	if _S.truth(_S.invoke(_S.read(_e, "this"), "inside", [_S.read(_e, "sx"), _S.read(_e, "sy")])):
		_S.invoke(_S.super_value(_S.read(_e, "this")), "put", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	if _S.truth(_S.invoke(_S.read(_e, "this"), "inside", [_S.read(_e, "sx"), _S.read(_e, "sy")])):
		_S.invoke(_S.super_value(_S.read(_e, "this")), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "k")])
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	if _S.truth(_S.invoke(_S.read(_e, "this"), "inside", [_S.read(_e, "sx"), _S.read(_e, "sy")])):
		_S.invoke(_S.super_value(_S.read(_e, "this")), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "a")])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	return (_S.binary("===",_S.named_value(_n_p_b0,"cs"),1) if _S.truth(_S.binary("===",_S.named_value(_n_p_b0,"sn"),0)) else _S.binary("===",_S.named_value(_n_p_b0,"sn"),0))
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	return (floori((_S.named_value(_n_p_b0,"tx") + 0.5)) if _S.truth((_S.named_value(_n_p_b0,"fx") > 0)) else floori((_S.named_value(_n_p_b0,"tx") - 0.5)))
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_life_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_end_b2 = _S.arg(_args,2)
	return minf(_n_life_b0,(_n_end_b2 - _n_t_b1))
	return null
