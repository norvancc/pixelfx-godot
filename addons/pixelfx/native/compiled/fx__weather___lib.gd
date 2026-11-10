@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/weather/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f9":"weather_pass","_f10":"weather_rows","_f11":"weather_field","_f13":"weather_sample","_f14":"weather_trips"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "box", _S.function_value(_e, "_f0"))
	_S.define(_e, "clip", _S.function_value(_e, "_f1"))
	_S.define(_e, "glow", _S.function_value(_e, "_f8"))
	_S.define(_e, "pass", _S.function_value(_e, "_f9"))
	_S.define(_e, "rows", _S.function_value(_e, "_f10"))
	_S.define(_e, "field", _S.function_value(_e, "_f11"))
	_S.define(_e, "sample", _S.function_value(_e, "_f13"))
	_S.define(_e, "trips", _S.function_value(_e, "_f14"))
	_S.define(_e, "tree", _S.function_value(_e, "_f15"))
	_S.define(_e, "splash", _S.function_value(_e, "_f16"))
	_S.define(_e, "crown", _S.function_value(_e, "_f17"))
	_S.define(_e, "BAYER", _S.invoke([0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5], "map", [_S.function_value(_e, "_f18")]))
	_exports["box"] = _S.read(_e, "box")
	_exports["clip"] = _S.read(_e, "clip")
	_S.define(_e, "OUT", _S.merge([{"c": 0}, {"a": 1}, {"b": 0}, {"l": 0}, {"k": 0}]))
	_exports["pass"] = _S.read(_e, "pass")
	_S.define(_e, "ROW", _S.merge([{"w": 0}, {"c": null}, {"a": null}, {"b": null}, {"l": null}, {"k": null}]))
	_exports["rows"] = _S.read(_e, "rows")
	_S.define(_e, "bayer", _S.function_value(_e, "_f19"))
	_exports["bayer"] = _S.read(_e, "bayer")
	_S.define(_e, "FIELDS", _S.construct(_S.read(_e, "Map"), []))
	_exports["field"] = _S.read(_e, "field")
	_exports["sample"] = _S.read(_e, "sample")
	_exports["trips"] = _S.read(_e, "trips")
	_exports["tree"] = _S.read(_e, "tree")
	_S.define(_e, "wave", _S.function_value(_e, "_f20"))
	_exports["wave"] = _S.read(_e, "wave")
	_exports["splash"] = _S.read(_e, "splash")
	_exports["crown"] = _S.read(_e, "crown")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.named_value(_n_meta_b0,"size")
	var _n_W_b1 = _S.prop(_tuple_0,0)
	var _n_H_b2 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.named_value(_n_meta_b0,"origin")
	var _n_OX_b3 = _S.prop(_tuple_1,0)
	var _n_OY_b4 = _S.prop(_tuple_1,1)
	return {"x0":(-_n_OX_b3),"y0":(-_n_OY_b4),"x1":(_n_W_b1 - _n_OX_b3),"y1":(_n_H_b2 - _n_OY_b4),"w":_n_W_b1,"h":_n_H_b2}
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "meta", _S.arg(_args, 1))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "box"), [_S.read(_e, "meta")]))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Object"), "create", [_S.read(_e, "p")]))
	_S.define(_e, "ok", null)
	if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "p"), "sn"), 0)):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "p"), "toX", [_S.prop(_S.read(_v2, "B"), "x0"), 0]))
		_S.define(_v2, "b", _S.invoke(_S.read(_v2, "p"), "toX", [_S.prop(_S.read(_v2, "B"), "x1"), 0]))
		_S.define(_v2, "sx0", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "Math"), "min", [_S.read(_v2, "a"), _S.read(_v2, "b")])]))
		_S.define(_v2, "sx1", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "Math"), "max", [_S.read(_v2, "a"), _S.read(_v2, "b")])]))
		_S.define(_v2, "sy0", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "p"), "toY", [0, _S.prop(_S.read(_v2, "B"), "y0")])]))
		_S.define(_v2, "sy1", _S.invoke(_S.read(_v2, "Math"), "round", [_S.invoke(_S.read(_v2, "p"), "toY", [0, _S.prop(_S.read(_v2, "B"), "y1")])]))
		_S.write(_v2, "ok", _S.function_value(_v2, "_f2"), "=", false)
	else:
		_S.write(_e, "ok", _S.function_value(_e, "_f3"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "put", _S.function_value(_e, "_f4"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "add", _S.function_value(_e, "_f5"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "blendPx", _S.function_value(_e, "_f6"), "=", false)
	_S.set_prop(_S.read(_e, "q"), "glow", _S.function_value(_e, "_f7"), "=", false)
	return _S.read(_e, "q")

static func _f2(_parent,_args:Array,_this=null):
	var _n_sx0 = _S.read(_parent,"sx0")
	var _n_sx1 = _S.read(_parent,"sx1")
	var _n_sy0 = _S.read(_parent,"sy0")
	var _n_sy1 = _S.read(_parent,"sy1")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	return ((_n_sy_b1 < _n_sy1) if _S.truth(((_n_sy_b1 >= _n_sy0) if _S.truth(((_n_sx_b0 < _n_sx1) if _S.truth((_n_sx_b0 >= _n_sx0)) else (_n_sx_b0 >= _n_sx0))) else ((_n_sx_b0 < _n_sx1) if _S.truth((_n_sx_b0 >= _n_sx0)) else (_n_sx_b0 >= _n_sx0)))) else ((_n_sy_b1 >= _n_sy0) if _S.truth(((_n_sx_b0 < _n_sx1) if _S.truth((_n_sx_b0 >= _n_sx0)) else (_n_sx_b0 >= _n_sx0))) else ((_n_sx_b0 < _n_sx1) if _S.truth((_n_sx_b0 >= _n_sx0)) else (_n_sx_b0 >= _n_sx0))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_B = _S.read(_parent,"B")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_lx_b2 = _S.invoke(_n_p,"fromX",[(_n_sx_b0 + 0.5), (_n_sy_b1 + 0.5)])
	var _n_ly_b3 = _S.invoke(_n_p,"fromY",[(_n_sx_b0 + 0.5), (_n_sy_b1 + 0.5)])
	return ((_n_ly_b3 < _S.named_value(_n_B,"y1")) if _S.truth(((_n_ly_b3 >= _S.named_value(_n_B,"y0")) if _S.truth(((_n_lx_b2 < _S.named_value(_n_B,"x1")) if _S.truth((_n_lx_b2 >= _S.named_value(_n_B,"x0"))) else (_n_lx_b2 >= _S.named_value(_n_B,"x0")))) else ((_n_lx_b2 < _S.named_value(_n_B,"x1")) if _S.truth((_n_lx_b2 >= _S.named_value(_n_B,"x0"))) else (_n_lx_b2 >= _S.named_value(_n_B,"x0"))))) else ((_n_ly_b3 >= _S.named_value(_n_B,"y0")) if _S.truth(((_n_lx_b2 < _S.named_value(_n_B,"x1")) if _S.truth((_n_lx_b2 >= _S.named_value(_n_B,"x0"))) else (_n_lx_b2 >= _S.named_value(_n_B,"x0")))) else ((_n_lx_b2 < _S.named_value(_n_B,"x1")) if _S.truth((_n_lx_b2 >= _S.named_value(_n_B,"x0"))) else (_n_lx_b2 >= _S.named_value(_n_B,"x0")))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ok = _S.read(_parent,"ok")
	var _n_p = _S.read(_parent,"p")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	return _S.logical("&&",_S.call_value(_n_ok,[_n_sx_b0, _n_sy_b1]),func():return _S.invoke(_n_p,"put",[_n_sx_b0, _n_sy_b1, _n_c_b2, _n_a_b3]))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ok = _S.read(_parent,"ok")
	var _n_p = _S.read(_parent,"p")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	return _S.logical("&&",_S.call_value(_n_ok,[_n_sx_b0, _n_sy_b1]),func():return _S.invoke(_n_p,"add",[_n_sx_b0, _n_sy_b1, _n_c_b2, _n_k_b3]))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ok = _S.read(_parent,"ok")
	var _n_p = _S.read(_parent,"p")
	var _n_sx_b0 = _S.arg(_args,0)
	var _n_sy_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	return _S.logical("&&",_S.call_value(_n_ok,[_n_sx_b0, _n_sy_b1]),func():return _S.invoke(_n_p,"blendPx",[_n_sx_b0, _n_sy_b1, _n_c_b2, _n_a_b3]))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_glow = _S.read(_parent,"glow")
	var _n_q = _S.read(_parent,"q")
	var _n_B = _S.read(_parent,"B")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_c_b3 = _S.arg(_args,3)
	var _n_k_b4 = _S.arg(_args,4)
	return _S.call_value(_n_glow,[_n_q, _n_B, _n_x_b0, _n_y_b1, _n_r_b2, _n_c_b3, _n_k_b4])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_r_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = _S.arg(_args,6)
	if _S.truth(((_n_r_b4 < 1) if _S.truth((_n_r_b4 < 1)) else (_n_k_b6 <= 0.004))):
		return null
	var _n_x0_b7 = maxf(_S.named_value(_n_B_b1,"x0"),floori((_n_x_b2 - _n_r_b4)))
	var _n_x1_b8 = minf((_S.named_value(_n_B_b1,"x1") - 1),ceili((_n_x_b2 + _n_r_b4)))
	var _n_y0_b9 = maxf(_S.named_value(_n_B_b1,"y0"),floori((_n_y_b3 - _n_r_b4)))
	var _n_y1_b10 = minf((_S.named_value(_n_B_b1,"y1") - 1),ceili((_n_y_b3 + _n_r_b4)))
	if true:
		var _n_py_b11 = _n_y0_b9
		while _S.truth((_n_py_b11 <= _n_y1_b10)):
			var _n_dy_b12 = (float(((_n_py_b11 + 0.5) - _n_y_b3))/_n_r_b4)
			if true:
				var _n_px_b13 = _n_x0_b7
				while _S.truth((_n_px_b13 <= _n_x1_b8)):
					var _n_dx_b14 = (float(((_n_px_b13 + 0.5) - _n_x_b2))/_n_r_b4)
					var _n_d_b15 = ((_n_dx_b14 * _n_dx_b14) + (_n_dy_b12 * _n_dy_b12))
					if _S.truth((_n_d_b15 >= 1)):
						_n_px_b13 += 1.0
						continue
					var _n_f_b16 = (1 - sqrt(_n_d_b15))
					_S.invoke(_n_q_b0,"light",[_n_px_b13, _n_py_b11, _n_c_b5, ((_n_f_b16 * _n_f_b16) * _n_k_b6)])
					_n_px_b13 += 1.0
			_n_py_b11 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_box = _S.read(_parent,"box")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_clip = _S.read(_parent,"clip")
	var _n_BAYER = _S.read(_parent,"BAYER")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_meta_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	var _n_B_b5 = _S.call_value(_n_box,[_n_meta_b1])
	var _n_o_b6 = _n_OUT
	_n_y0_b2 = maxf(_S.named_value(_n_B_b5,"y0"),floori(_n_y0_b2))
	_n_y1_b3 = minf((_S.named_value(_n_B_b5,"y1") - 1),ceili(_n_y1_b3))
	if _S.truth((_n_y0_b2 > _n_y1_b3)):
		return null
	if _S.truth(_S.binary("!==",_S.named_value(_n_p_b0,"sn"),0)):
		var _n_q_b14 = _S.call_value(_n_clip,[_n_p_b0, _n_meta_b1])
		if true:
			var _n_y_b15 = _n_y0_b2
			while _S.truth((_n_y_b15 <= _n_y1_b3)):
				if true:
					var _n_x_b16 = _S.named_value(_n_B_b5,"x0")
					while _S.truth((_n_x_b16 < _S.named_value(_n_B_b5,"x1"))):
						_S.set_prop(_n_o_b6,"c",0,"=")
						_S.set_prop(_n_o_b6,"a",1,"=")
						_S.set_prop(_n_o_b6,"b",0,"=")
						_S.set_prop(_n_o_b6,"l",0,"=")
						_S.set_prop(_n_o_b6,"k",0,"=")
						_S.call_value(_n_fn_b4,[(_n_x_b16 + 0.5), (_n_y_b15 + 0.5), _n_o_b6])
						if _S.truth(_S.named_value(_n_o_b6,"c")):
							(_S.invoke(_n_q_b14,"blend",[_n_x_b16, _n_y_b15, _S.named_value(_n_o_b6,"c"), _S.named_value(_n_o_b6,"a")]) if _S.truth(_S.named_value(_n_o_b6,"b")) else _S.invoke(_n_q_b14,"dot",[_n_x_b16, _n_y_b15, _S.named_value(_n_o_b6,"c"), _S.named_value(_n_o_b6,"a")]))
						if _S.truth((_S.named_value(_n_o_b6,"k") > 0)):
							_S.invoke(_n_q_b14,"light",[_n_x_b16, _n_y_b15, (_S.named_value(_n_o_b6,"l") if _S.truth(_S.named_value(_n_o_b6,"l")) else _S.named_value(_n_o_b6,"c")), _S.named_value(_n_o_b6,"k")])
						_n_x_b16 += 1.0
				_n_y_b15 += 1.0
		return null
	var _n_C_b7 = _S.named_value(_n_p_b0,"C")
	var _n_L_b8 = _S.named_value(_n_p_b0,"L")
	var _n_W_b9 = _S.named_value(_n_p_b0,"w")
	var _n_fade_b10 = _S.named_value(_n_p_b0,"fade")
	var _n_lk_b11 = (_S.named_value(_n_p_b0,"lightK") * _n_fade_b10)
	var _n_fx_b12 = _S.named_value(_n_p_b0,"fx")
	var _n_tx_b13 = _S.named_value(_n_p_b0,"tx")
	if true:
		var _n_y_b17 = _n_y0_b2
		while _S.truth((_n_y_b17 <= _n_y1_b3)):
			var _n_sy_b18 = floori(((_S.named_value(_n_p_b0,"ty") + _n_y_b17) + 0.5))
			var _n_ry_b19 = (_n_sy_b18 - _S.named_value(_n_p_b0,"oy"))
			if _S.truth(((_n_ry_b19 < 0) if _S.truth((_n_ry_b19 < 0)) else (_n_ry_b19 >= _S.named_value(_n_p_b0,"h")))):
				_n_y_b17 += 1.0
				continue
			var _n_row_b20 = (_n_ry_b19 * _n_W_b9)
			var _n_by_b21 = _S.binary("<<",_S.binary("&",_n_sy_b18,3),2)
			var _n_sxf_b22 = (_n_tx_b13 + ((_S.named_value(_n_B_b5,"x0") + 0.5) * _n_fx_b12))
			if true:
				var _n_x_b23 = _S.named_value(_n_B_b5,"x0")
				while _S.truth((_n_x_b23 < _S.named_value(_n_B_b5,"x1"))):
					var _n_sx_b24 = floori(_n_sxf_b22)
					var _n_rx_b25 = (_n_sx_b24 - _S.named_value(_n_p_b0,"ox"))
					if _S.truth(((_n_rx_b25 < 0) if _S.truth((_n_rx_b25 < 0)) else (_n_rx_b25 >= _n_W_b9))):
						_n_x_b23 += 1.0
						_n_sxf_b22 += _n_fx_b12
						continue
					_S.set_prop(_n_o_b6,"c",0,"=")
					_S.set_prop(_n_o_b6,"a",1,"=")
					_S.set_prop(_n_o_b6,"b",0,"=")
					_S.set_prop(_n_o_b6,"l",0,"=")
					_S.set_prop(_n_o_b6,"k",0,"=")
					_S.call_value(_n_fn_b4,[(_n_x_b23 + 0.5), (_n_y_b17 + 0.5), _n_o_b6])
					var _n_i_b26 = (_n_row_b20 + _n_rx_b25)
					if _S.truth(_S.named_value(_n_o_b6,"c")):
						var _n_a_b27 = (_S.named_value(_n_o_b6,"a") * _n_fade_b10)
						if _S.truth(_S.named_value(_n_o_b6,"b")):
							if _S.truth((_n_a_b27 > 0.004)):
								var _n_d_b28 = _S.index_value(_n_C_b7,_n_i_b26)
								var _n_da_b29 = (float(_S.binary(">>>",_n_d_b28,24))/255)
								var _n_oa_b30 = (_n_a_b27 + (_n_da_b29 * (1 - _n_a_b27)))
								var _n_k_b31 = (float(_n_a_b27)/_n_oa_b30)
								var _n_j_b32 = (1 - _n_k_b31)
								var _n_c_b33 = _S.named_value(_n_o_b6,"c")
								var _n_r_b34 = _S.binary("&",((_S.binary("&",_n_c_b33,255) * _n_k_b31) + (_S.binary("&",_n_d_b28,255) * _n_j_b32)),255)
								var _n_g_b35 = _S.binary("&",((_S.binary("&",_S.binary(">>>",_n_c_b33,8),255) * _n_k_b31) + (_S.binary("&",_S.binary(">>>",_n_d_b28,8),255) * _n_j_b32)),255)
								var _n_b_b36 = _S.binary("&",((_S.binary("&",_S.binary(">>>",_n_c_b33,16),255) * _n_k_b31) + (_S.binary("&",_S.binary(">>>",_n_d_b28,16),255) * _n_j_b32)),255)
								_S.set_prop(_n_C_b7,_n_i_b26,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",_S.binary("&",(_n_oa_b30 * 255),255),24),_S.binary("<<",_n_b_b36,16)),_S.binary("<<",_n_g_b35,8)),_n_r_b34),"=")
						else:
							if _S.truth(((_n_a_b27 >= 1) if _S.truth((_n_a_b27 >= 1)) else (_n_a_b27 > _S.index_value(_n_BAYER,_S.binary("|",_n_by_b21,_S.binary("&",_n_sx_b24,3)))))):
								_S.set_prop(_n_C_b7,_n_i_b26,_S.named_value(_n_o_b6,"c"),"=")
					if _S.truth((_S.named_value(_n_o_b6,"k") > 0)):
						var _n_k_b37 = (_S.named_value(_n_o_b6,"k") * _n_lk_b11)
						if _S.truth((_n_k_b37 > 0.004)):
							var _n_c_b38 = (_S.named_value(_n_o_b6,"l") if _S.truth(_S.named_value(_n_o_b6,"l")) else _S.named_value(_n_o_b6,"c"))
							var _n_d_b39 = _S.index_value(_n_L_b8,_n_i_b26)
							var _n_r_b40 = _S.binary("|",minf(255,(_S.binary("&",_n_d_b39,255) + (_S.binary("&",_n_c_b38,255) * _n_k_b37))),0)
							var _n_g_b41 = _S.binary("|",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b39,8),255) + (_S.binary("&",_S.binary(">>>",_n_c_b38,8),255) * _n_k_b37))),0)
							var _n_b_b42 = _S.binary("|",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b39,16),255) + (_S.binary("&",_S.binary(">>>",_n_c_b38,16),255) * _n_k_b37))),0)
							_S.set_prop(_n_L_b8,_n_i_b26,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",255,24),_S.binary("<<",_n_b_b42,16)),_S.binary("<<",_n_g_b41,8)),_n_r_b40),"=")
					_n_x_b23 += 1.0
					_n_sxf_b22 += _n_fx_b12
			_n_y_b17 += 1.0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_box = _S.read(_parent,"box")
	var _n_ROW = _S.read(_parent,"ROW")
	var _n_Object = _S.read(_parent,"Object")
	var _n_Uint32Array = _S.read(_parent,"Uint32Array")
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_clip = _S.read(_parent,"clip")
	var _n_BAYER = _S.read(_parent,"BAYER")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_meta_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	var _n_fn_b4 = _S.arg(_args,4)
	var _n_B_b5 = _S.call_value(_n_box,[_n_meta_b1])
	var _n_w_b6 = _S.named_value(_n_B_b5,"w")
	var _n_R_b7 = _n_ROW
	if _S.truth(_S.binary("!==",_S.named_value(_n_R_b7,"w"),_n_w_b6)):
		_S.invoke(_n_Object,"assign",[_n_R_b7, {"w":_n_w_b6,"c":_S.construct(_n_Uint32Array,[_n_w_b6]),"a":_S.construct(_n_Float32Array,[_n_w_b6]),"b":_S.construct(_n_Uint8Array,[_n_w_b6]),"l":_S.construct(_n_Uint32Array,[_n_w_b6]),"k":_S.construct(_n_Float32Array,[_n_w_b6])}])
	_n_y0_b2 = maxf(_S.named_value(_n_B_b5,"y0"),floori(_n_y0_b2))
	_n_y1_b3 = minf((_S.named_value(_n_B_b5,"y1") - 1),ceili(_n_y1_b3))
	var _n_rot_b8 = _S.binary("!==",_S.named_value(_n_p_b0,"sn"),0)
	var _n_q_b9 = (_S.call_value(_n_clip,[_n_p_b0, _n_meta_b1]) if _S.truth(_n_rot_b8) else null)
	var _n_C_b10 = _S.named_value(_n_p_b0,"C")
	var _n_L_b11 = _S.named_value(_n_p_b0,"L")
	var _n_W_b12 = _S.named_value(_n_p_b0,"w")
	var _n_fade_b13 = _S.named_value(_n_p_b0,"fade")
	var _n_lk_b14 = (_S.named_value(_n_p_b0,"lightK") * _n_fade_b13)
	var _n_fx_b15 = _S.named_value(_n_p_b0,"fx")
	if true:
		var _n_y_b16 = _n_y0_b2
		while _S.truth((_n_y_b16 <= _n_y1_b3)):
			_S.invoke(_S.named_value(_n_R_b7,"c"),"fill",[0])
			_S.invoke(_S.named_value(_n_R_b7,"k"),"fill",[0])
			_S.invoke(_S.named_value(_n_R_b7,"a"),"fill",[1])
			_S.invoke(_S.named_value(_n_R_b7,"b"),"fill",[0])
			_S.call_value(_n_fn_b4,[(_n_y_b16 + 0.5), _n_R_b7])
			if _S.truth(_n_rot_b8):
				if true:
					var _n_i_b22 = 0
					while _S.truth((_n_i_b22 < _n_w_b6)):
						if _S.truth(_S.index_value(_S.named_value(_n_R_b7,"c"),_n_i_b22)):
							(_S.invoke(_n_q_b9,"blend",[(_S.named_value(_n_B_b5,"x0") + _n_i_b22), _n_y_b16, _S.index_value(_S.named_value(_n_R_b7,"c"),_n_i_b22), _S.index_value(_S.named_value(_n_R_b7,"a"),_n_i_b22)]) if _S.truth(_S.index_value(_S.named_value(_n_R_b7,"b"),_n_i_b22)) else _S.invoke(_n_q_b9,"dot",[(_S.named_value(_n_B_b5,"x0") + _n_i_b22), _n_y_b16, _S.index_value(_S.named_value(_n_R_b7,"c"),_n_i_b22), _S.index_value(_S.named_value(_n_R_b7,"a"),_n_i_b22)]))
						if _S.truth((_S.index_value(_S.named_value(_n_R_b7,"k"),_n_i_b22) > 0)):
							_S.invoke(_n_q_b9,"light",[(_S.named_value(_n_B_b5,"x0") + _n_i_b22), _n_y_b16, (_S.index_value(_S.named_value(_n_R_b7,"l"),_n_i_b22) if _S.truth(_S.index_value(_S.named_value(_n_R_b7,"l"),_n_i_b22)) else _S.index_value(_S.named_value(_n_R_b7,"c"),_n_i_b22)), _S.index_value(_S.named_value(_n_R_b7,"k"),_n_i_b22)])
						_n_i_b22 += 1.0
				_n_y_b16 += 1.0
				continue
			var _n_sy_b17 = floori(((_S.named_value(_n_p_b0,"ty") + _n_y_b16) + 0.5))
			var _n_ry_b18 = (_n_sy_b17 - _S.named_value(_n_p_b0,"oy"))
			if _S.truth(((_n_ry_b18 < 0) if _S.truth((_n_ry_b18 < 0)) else (_n_ry_b18 >= _S.named_value(_n_p_b0,"h")))):
				_n_y_b16 += 1.0
				continue
			var _n_row_b19 = (_n_ry_b18 * _n_W_b12)
			var _n_by_b20 = _S.binary("<<",_S.binary("&",_n_sy_b17,3),2)
			var _n_sxf_b21 = (_S.named_value(_n_p_b0,"tx") + ((_S.named_value(_n_B_b5,"x0") + 0.5) * _n_fx_b15))
			if true:
				var _n_i_b23 = 0
				while _S.truth((_n_i_b23 < _n_w_b6)):
					var _n_c_b24 = _S.index_value(_S.named_value(_n_R_b7,"c"),_n_i_b23)
					var _n_kk_b25 = _S.index_value(_S.named_value(_n_R_b7,"k"),_n_i_b23)
					if _S.truth((not _S.truth((_n_kk_b25 > 0)) if _S.truth(not _S.truth(_n_c_b24)) else not _S.truth(_n_c_b24))):
						_n_i_b23 += 1.0
						_n_sxf_b21 += _n_fx_b15
						continue
					var _n_sx_b26 = floori(_n_sxf_b21)
					var _n_rx_b27 = (_n_sx_b26 - _S.named_value(_n_p_b0,"ox"))
					if _S.truth(((_n_rx_b27 < 0) if _S.truth((_n_rx_b27 < 0)) else (_n_rx_b27 >= _n_W_b12))):
						_n_i_b23 += 1.0
						_n_sxf_b21 += _n_fx_b15
						continue
					var _n_j_b28 = (_n_row_b19 + _n_rx_b27)
					if _S.truth(_n_c_b24):
						var _n_a_b29 = (_S.index_value(_S.named_value(_n_R_b7,"a"),_n_i_b23) * _n_fade_b13)
						if _S.truth(_S.index_value(_S.named_value(_n_R_b7,"b"),_n_i_b23)):
							if _S.truth((_n_a_b29 > 0.004)):
								var _n_d_b30 = _S.index_value(_n_C_b10,_n_j_b28)
								var _n_da_b31 = (float(_S.binary(">>>",_n_d_b30,24))/255)
								var _n_oa_b32 = (_n_a_b29 + (_n_da_b31 * (1 - _n_a_b29)))
								var _n_k_b33 = (float(_n_a_b29)/_n_oa_b32)
								var _n_m_b34 = (1 - _n_k_b33)
								var _n_r_b35 = _S.binary("&",((_S.binary("&",_n_c_b24,255) * _n_k_b33) + (_S.binary("&",_n_d_b30,255) * _n_m_b34)),255)
								var _n_g_b36 = _S.binary("&",((_S.binary("&",_S.binary(">>>",_n_c_b24,8),255) * _n_k_b33) + (_S.binary("&",_S.binary(">>>",_n_d_b30,8),255) * _n_m_b34)),255)
								var _n_b_b37 = _S.binary("&",((_S.binary("&",_S.binary(">>>",_n_c_b24,16),255) * _n_k_b33) + (_S.binary("&",_S.binary(">>>",_n_d_b30,16),255) * _n_m_b34)),255)
								_S.set_prop(_n_C_b10,_n_j_b28,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",_S.binary("&",(_n_oa_b32 * 255),255),24),_S.binary("<<",_n_b_b37,16)),_S.binary("<<",_n_g_b36,8)),_n_r_b35),"=")
						else:
							if _S.truth(((_n_a_b29 >= 1) if _S.truth((_n_a_b29 >= 1)) else (_n_a_b29 > _S.index_value(_n_BAYER,_S.binary("|",_n_by_b20,_S.binary("&",_n_sx_b26,3)))))):
								_S.set_prop(_n_C_b10,_n_j_b28,_n_c_b24,"=")
					if _S.truth((_n_kk_b25 > 0)):
						var _n_k_b38 = (_n_kk_b25 * _n_lk_b14)
						if _S.truth((_n_k_b38 > 0.004)):
							var _n_lc_b39 = (_S.index_value(_S.named_value(_n_R_b7,"l"),_n_i_b23) if _S.truth(_S.index_value(_S.named_value(_n_R_b7,"l"),_n_i_b23)) else _n_c_b24)
							var _n_d_b40 = _S.index_value(_n_L_b11,_n_j_b28)
							var _n_r_b41 = _S.binary("|",minf(255,(_S.binary("&",_n_d_b40,255) + (_S.binary("&",_n_lc_b39,255) * _n_k_b38))),0)
							var _n_g_b42 = _S.binary("|",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b40,8),255) + (_S.binary("&",_S.binary(">>>",_n_lc_b39,8),255) * _n_k_b38))),0)
							var _n_b_b43 = _S.binary("|",minf(255,(_S.binary("&",_S.binary(">>>",_n_d_b40,16),255) + (_S.binary("&",_S.binary(">>>",_n_lc_b39,16),255) * _n_k_b38))),0)
							_S.set_prop(_n_L_b11,_n_j_b28,_S.binary("|",_S.binary("|",_S.binary("|",_S.binary("<<",255,24),_S.binary("<<",_n_b_b43,16)),_S.binary("<<",_n_g_b42,8)),_n_r_b41),"=")
					_n_i_b23 += 1.0
					_n_sxf_b21 += _n_fx_b15
			_n_y_b16 += 1.0
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 1), func(): return 256))
	_S.define(_e, "h", _S.coalesce(_S.arg(_args, 2), func(): return 128))
	_S.define(_e, "cells", _S.coalesce(_S.arg(_args, 3), func(): return [4, 8, 16, 32]))
	_S.define(_e, "key", ("" + _S.string(_S.read(_e, "seed")) + "|" + _S.string(_S.read(_e, "w")) + "|" + _S.string(_S.read(_e, "h")) + "|" + _S.string(_S.read(_e, "cells")) + ""))
	_S.define(_e, "F", _S.invoke(_S.read(_e, "FIELDS"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.read(_e, "F")):
		return _S.read(_e, "F")
	_S.define(_e, "d", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "w"), _S.read(_e, "h"))]))
	_S.define(_e, "amp", 0.5)
	_S.define(_e, "total", 0)
	for _v32 in _S.array(_S.read(_e, "cells")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "n", _v32)
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "cs", _S.binary("/", _S.read(_v34, "w"), _S.read(_v34, "n")))
		_S.define(_v34, "rows", _S.invoke(_S.read(_v34, "Math"), "max", [1, _S.invoke(_S.read(_v34, "Math"), "round", [_S.binary("/", _S.read(_v34, "h"), _S.read(_v34, "cs"))])]))
		_S.define(_v34, "at", _S.function_value(_v34, "_f12"))
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "y"), _S.read(_v35, "h"))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v36, "x"), _S.read(_v36, "w"))):
				var _v37 = _S.scope(_v36)
				_S.define(_v37, "gx", _S.binary("/", _S.read(_v37, "x"), _S.read(_v37, "cs")))
				_S.define(_v37, "gy", _S.binary("*", _S.binary("/", _S.read(_v37, "y"), _S.read(_v37, "h")), _S.read(_v37, "rows")))
				_S.define(_v37, "ix", _S.invoke(_S.read(_v37, "Math"), "floor", [_S.read(_v37, "gx")]))
				_S.define(_v37, "iy", _S.invoke(_S.read(_v37, "Math"), "floor", [_S.read(_v37, "gy")]))
				_S.define(_v37, "u", _S.binary("-", _S.read(_v37, "gx"), _S.read(_v37, "ix")))
				_S.define(_v37, "v", _S.binary("-", _S.read(_v37, "gy"), _S.read(_v37, "iy")))
				_S.define(_v37, "su", _S.binary("*", _S.binary("*", _S.read(_v37, "u"), _S.read(_v37, "u")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_v37, "u")))))
				_S.define(_v37, "sv", _S.binary("*", _S.binary("*", _S.read(_v37, "v"), _S.read(_v37, "v")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_v37, "v")))))
				_S.define(_v37, "top", _S.binary("+", _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.read(_v37, "iy")]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v37, "at"), [_S.binary("+", _S.read(_v37, "ix"), 1), _S.read(_v37, "iy")]), _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.read(_v37, "iy")])), _S.read(_v37, "su"))))
				_S.define(_v37, "bot", _S.binary("+", _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.binary("+", _S.read(_v37, "iy"), 1)]), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v37, "at"), [_S.binary("+", _S.read(_v37, "ix"), 1), _S.binary("+", _S.read(_v37, "iy"), 1)]), _S.call_value(_S.read(_v37, "at"), [_S.read(_v37, "ix"), _S.binary("+", _S.read(_v37, "iy"), 1)])), _S.read(_v37, "su"))))
				_S.set_prop(_S.read(_v37, "d"), _S.binary("+", _S.binary("*", _S.read(_v37, "y"), _S.read(_v37, "w")), _S.read(_v37, "x")), _S.binary("*", _S.binary("+", _S.read(_v37, "top"), _S.binary("*", _S.binary("-", _S.read(_v37, "bot"), _S.read(_v37, "top")), _S.read(_v37, "sv"))), _S.read(_v37, "amp")), "+=", false)
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "x", 1, "+=", true)
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "y", 1, "+=", true)
		_S.write(_v34, "total", _S.read(_v34, "amp"), "+=", false)
		_S.write(_v34, "amp", 0.5, "*=", false)
	var _v38 = _S.scope(_e)
	_S.define(_v38, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v38, "i"), _S.prop(_S.read(_v38, "d"), "length"))):
		_S.set_prop(_S.read(_v38, "d"), _S.read(_v38, "i"), _S.read(_v38, "total"), "/=", false)
		_v38 = _S.iteration(_v38)
		_S.write(_v38, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "FIELDS"), "set", [_S.read(_e, "key"), _S.write(_e, "F", _S.merge([{"w": _S.read(_e, "w")}, {"h": _S.read(_e, "h")}, {"d": _S.read(_e, "d")}]), "=", false)])
	return _S.read(_e, "F")

static func _f12(_parent,_args:Array,_this=null):
	var _n_n = _S.read(_parent,"n")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_rows = _S.read(_parent,"rows")
	var _n_seed = _S.read(_parent,"seed")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return _S.MathFX.rand([_S.call_value(_n_wrap,[_n_a_b0, _n_n]),_S.call_value(_n_wrap,[_n_b_b1, _n_rows]),_n_seed,_n_n])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_F_b0 = _S.arg(_args,0)
	var _n_u_b1 = _S.arg(_args,1)
	var _n_v_b2 = _S.arg(_args,2)
	var _n_x_b3 = floori(_n_u_b1)
	var _n_y_b4 = floori(_n_v_b2)
	var _n_fx_b5 = (_n_u_b1 - _n_x_b3)
	var _n_fy_b6 = (_n_v_b2 - _n_y_b4)
	var _n_m_b7 = (_S.named_value(_n_F_b0,"w") - 1)
	var _n_n_b8 = (_S.named_value(_n_F_b0,"h") - 1)
	var _n_D_b9 = _S.named_value(_n_F_b0,"d")
	var _n_x0_b10 = _S.binary("&",_n_x_b3,_n_m_b7)
	var _n_x1_b11 = _S.binary("&",(_n_x_b3 + 1),_n_m_b7)
	var _n_y0_b12 = (_S.binary("&",_n_y_b4,_n_n_b8) * _S.named_value(_n_F_b0,"w"))
	var _n_y1_b13 = (_S.binary("&",(_n_y_b4 + 1),_n_n_b8) * _S.named_value(_n_F_b0,"w"))
	var _n_a_b14 = _S.index_value(_n_D_b9,(_n_y0_b12 + _n_x0_b10))
	var _n_b_b15 = _S.index_value(_n_D_b9,(_n_y0_b12 + _n_x1_b11))
	var _n_c_b16 = _S.index_value(_n_D_b9,(_n_y1_b13 + _n_x0_b10))
	var _n_e_b17 = _S.index_value(_n_D_b9,(_n_y1_b13 + _n_x1_b11))
	return ((_n_a_b14 + ((_n_b_b15 - _n_a_b14) * _n_fx_b5)) + (((_n_c_b16 - _n_a_b14) + ((((_n_a_b14 - _n_b_b15) - _n_c_b16) + _n_e_b17) * _n_fx_b5)) * _n_fy_b6))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_n_b2 = _S.arg(_args,2)
	var _n_seed_b3 = _S.arg(_args,3)
	var _n_m0_b4 = _S.arg(_args,4)
	var _n_m1_b5 = _S.arg(_args,5)
	var _n_fn_b6 = _S.arg(_args,6)
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _n_n_b2)):
			var _n_m_b8 = (_n_m0_b4 + floori((_S.MathFX.rand([_n_seed_b3,_n_i_b7,72]) * ((_n_m1_b5 - _n_m0_b4) + 1))))
			var _n_s_b9 = (((float(_n_t_b0)/_n_D_b1) * _n_m_b8) + _S.MathFX.rand([_n_seed_b3,_n_i_b7,71]))
			var _n_k_b10 = floori(_n_s_b9)
			_S.call_value(_n_fn_b6,[(_n_s_b9 - _n_k_b10), _n_k_b10, _n_m_b8, _n_i_b7])
			_n_i_b7 += 1.0
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "jag", _S.coalesce(_S.arg(_args, 5), func(): return 0.3))
	_S.define(_e, "forks", _S.coalesce(_S.arg(_args, 6), func(): return 0.4))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "depth", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "out", [])
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	_S.define(_e, "pts", [[_S.read(_e, "x0"), _S.read(_e, "y0")], [_S.read(_e, "x1"), _S.read(_e, "y1")]])
	_S.define(_e, "off", _S.binary("*", _S.read(_e, "L"), _S.read(_e, "jag")))
	while _S.truth(_S.binary("<", _S.prop(_S.read(_e, "pts"), "length"), _S.binary("+", 2, _S.binary("/", _S.read(_e, "L"), 3)))):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "nxt", [_S.prop(_S.read(_v41, "pts"), 0)])
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v42, "i"), _S.binary("-", _S.prop(_S.read(_v42, "pts"), "length"), 1))):
			var _v43 = _S.scope(_v42)
			var _v44 = _S.prop(_S.read(_v43, "pts"), _S.read(_v43, "i"))
			_S.define(_v43, "ax", _S.prop(_v44, 0))
			_S.define(_v43, "ay", _S.prop(_v44, 1))
			var _v45 = _S.prop(_S.read(_v43, "pts"), _S.binary("+", _S.read(_v43, "i"), 1))
			_S.define(_v43, "bx", _S.prop(_v45, 0))
			_S.define(_v43, "by", _S.prop(_v45, 1))
			_S.define(_v43, "l", _S.logical("||", _S.invoke(_S.read(_v43, "Math"), "hypot", [_S.binary("-", _S.read(_v43, "bx"), _S.read(_v43, "ax")), _S.binary("-", _S.read(_v43, "by"), _S.read(_v43, "ay"))]), func(): return 1))
			_S.define(_v43, "o", _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", _S.read(_v43, "off")), _S.read(_v43, "off")]))
			_S.invoke(_S.read(_v43, "nxt"), "push", [[_S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v43, "ax"), _S.read(_v43, "bx")), 2), _S.binary("*", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_v43, "by"), _S.read(_v43, "ay"))), _S.read(_v43, "l")), _S.read(_v43, "o"))), _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v43, "ay"), _S.read(_v43, "by")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v43, "bx"), _S.read(_v43, "ax")), _S.read(_v43, "l")), _S.read(_v43, "o")))], [_S.read(_v43, "bx"), _S.read(_v43, "by")]])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
		_S.write(_v41, "pts", _S.read(_v41, "nxt"), "=", false)
		_S.write(_v41, "off", 0.52, "*=", false)
	_S.invoke(_S.read(_e, "out"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": _S.read(_e, "w")}, {"depth": _S.read(_e, "depth")}])])
	if _S.truth(_S.binary("<", _S.read(_e, "depth"), 2)):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "i", 2)
		while _S.truth(_S.binary("<", _S.read(_v46, "i"), _S.binary("-", _S.prop(_S.read(_v46, "pts"), "length"), 3))):
			if _S.truth(_S.invoke(_S.read(_v46, "R"), "chance", [_S.binary("/", _S.binary("/", _S.read(_v46, "forks"), _S.binary("+", 1, _S.read(_v46, "depth"))), _S.invoke(_S.read(_v46, "Math"), "max", [4, _S.binary("/", _S.prop(_S.read(_v46, "pts"), "length"), 6)]))])):
				var _v47 = _S.scope(_v46)
				var _v48 = _S.prop(_S.read(_v47, "pts"), _S.read(_v47, "i"))
				_S.define(_v47, "ax", _S.prop(_v48, 0))
				_S.define(_v47, "ay", _S.prop(_v48, 1))
				var _v49 = _S.prop(_S.read(_v47, "pts"), _S.invoke(_S.read(_v47, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v47, "pts"), "length"), 1), _S.binary("+", _S.read(_v47, "i"), 3)]))
				_S.define(_v47, "bx", _S.prop(_v49, 0))
				_S.define(_v47, "by", _S.prop(_v49, 1))
				_S.define(_v47, "a", _S.binary("+", _S.invoke(_S.read(_v47, "Math"), "atan2", [_S.binary("-", _S.read(_v47, "by"), _S.read(_v47, "ay")), _S.binary("-", _S.read(_v47, "bx"), _S.read(_v47, "ax"))]), _S.binary("*", _S.invoke(_S.read(_v47, "R"), "sign", []), _S.invoke(_S.read(_v47, "R"), "range", [0.35, 0.95]))))
				_S.define(_v47, "l", _S.binary("*", _S.binary("-", _S.read(_v47, "L"), _S.binary("*", _S.binary("/", _S.read(_v47, "i"), _S.prop(_S.read(_v47, "pts"), "length")), _S.read(_v47, "L"))), _S.invoke(_S.read(_v47, "R"), "range", [0.25, 0.55])))
				_S.invoke(_S.read(_v47, "out"), "push", _S.concat([_S.array(_S.call_value(_S.read(_v47, "tree"), [_S.read(_v47, "R"), _S.read(_v47, "ax"), _S.read(_v47, "ay"), _S.binary("+", _S.read(_v47, "ax"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "a")]), _S.read(_v47, "l"))), _S.binary("+", _S.read(_v47, "ay"), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "a")]), _S.read(_v47, "l"))), _S.binary("*", _S.read(_v47, "jag"), 1.1), _S.read(_v47, "forks"), _S.binary("*", _S.read(_v47, "w"), 0.55), _S.binary("+", _S.read(_v47, "depth"), 1)]))]))
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f16(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_z_b2 = _S.arg(_args,2)
	var _n_age_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_h_b6 = _S.arg(_args,6)
	var _n_L_b7 = (0.3 + (0.12 * _n_size_b4))
	var _n_u_b8 = (float(_n_age_b3)/_n_L_b7)
	if _S.truth((_n_u_b8 >= 1)):
		return null
	if _S.truth((_n_age_b3 < 0.07)):
		_S.invoke(_n_q_b0,"px",[_n_x_b1, (_n_z_b2 - 1), _S.named_value(_n_c_b5,"hot")])
		if _S.truth((_n_size_b4 > 0.3)):
			_S.invoke(_n_q_b0,"px",[(_n_x_b1 - 1), ((_n_z_b2 - 1) - (1 if _S.truth((_n_age_b3 > 0.035)) else 0)), _S.named_value(_n_c_b5,"hot")])
			_S.invoke(_n_q_b0,"px",[(_n_x_b1 + 1), ((_n_z_b2 - 1) - (1 if _S.truth((_n_age_b3 > 0.035)) else 0)), _S.named_value(_n_c_b5,"hot")])
		if _S.truth(((_n_age_b3 > 0.03) if _S.truth((_n_size_b4 > 0.65)) else (_n_size_b4 > 0.65))):
			_S.invoke(_n_q_b0,"px",[(_n_x_b1 - 2), (_n_z_b2 - 2), _S.named_value(_n_c_b5,"cool")])
			_S.invoke(_n_q_b0,"px",[(_n_x_b1 + 2), (_n_z_b2 - 2), _S.named_value(_n_c_b5,"cool")])
	var _n_rx_b9 = (1 + ((1.2 + (3.6 * _n_size_b4)) * sqrt(_n_u_b8)))
	var _n_ry_b10 = maxf(0.5,(_n_rx_b9 * 0.26))
	var _n_n_b11 = ceili((_n_rx_b9 * 6.5))
	if true:
		var _n_j_b14 = 0
		while _S.truth((_n_j_b14 < _n_n_b11)):
			var _n_a_b15 = ((float(_n_j_b14)/_n_n_b11) * _n_TAU)
			var _n_s_b16 = sin(_n_a_b15)
			if _S.truth((_n_s_b16 < (-0.25))):
				_n_j_b14 += 1.0
				continue
			_S.invoke(_n_q_b0,"dot",[(_n_x_b1 + (cos(_n_a_b15) * _n_rx_b9)), (_n_z_b2 + (_n_s_b16 * _n_ry_b10)), (_S.named_value(_n_c_b5,"hot") if _S.truth(((_n_s_b16 > 0) if _S.truth((_n_u_b8 < 0.3)) else (_n_u_b8 < 0.3))) else _S.named_value(_n_c_b5,"cool")), ((1 if _S.truth((_n_s_b16 > 0.2)) else 0.7) if _S.truth((_n_u_b8 < 0.45)) else (((1 - _n_u_b8) * 1.6) * (1 if _S.truth((_n_s_b16 > 0.2)) else 0.6)))])
			_n_j_b14 += 1.0
	var _n_nd_b12 = (3 if _S.truth((_n_size_b4 > 0.55)) else 2)
	var _n_H_b13 = floori((_n_h_b6 * 1000000))
	if true:
		var _n_d_b17 = 0
		while _S.truth((_n_d_b17 < _n_nd_b12)):
			var _n_vx_b18 = (((_S.MathFX.rand([_n_H_b13,_n_d_b17,1]) - 0.5) * 2) * (25 + (35 * _n_size_b4)))
			var _n_vy_b19 = (-(55 + ((_S.MathFX.rand([_n_H_b13,_n_d_b17,2]) * 70) * (0.5 + _n_size_b4))))
			var _n_y_b20 = (((_n_z_b2 - 1) + (_n_vy_b19 * _n_age_b3)) + ((475 * _n_age_b3) * _n_age_b3))
			if _S.truth(((_n_y_b20 > (_n_z_b2 - 0.5)) if _S.truth((_n_y_b20 > (_n_z_b2 - 0.5))) else (_n_age_b3 > 0.34))):
				_n_d_b17 += 1.0
				continue
			var _n_xx_b21 = (_n_x_b1 + (_n_vx_b18 * _n_age_b3))
			_S.invoke(_n_q_b0,"px",[_n_xx_b21, _n_y_b20, (_S.named_value(_n_c_b5,"hot") if _S.truth((_n_age_b3 < 0.12)) else _S.named_value(_n_c_b5,"cool"))])
			if _S.truth(((_n_vy_b19 + (950 * _n_age_b3)) < (-40))):
				_S.invoke(_n_q_b0,"dot",[(_n_xx_b21 - (_n_vx_b18 * 0.012)), (_n_y_b20 + 1), _S.named_value(_n_c_b5,"cool"), 0.7])
			_n_d_b17 += 1.0
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_z_b2 = _S.arg(_args,2)
	var _n_age_b3 = _S.arg(_args,3)
	var _n_size_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_h_b6 = _S.arg(_args,6)
	var _n_L_b7 = (0.22 + (0.14 * _n_size_b4))
	var _n_u_b8 = (float(_n_age_b3)/_n_L_b7)
	var _n_X_b9 = floori(_n_x_b1+0.5)
	var _n_Z_b10 = floori(_n_z_b2+0.5)
	if _S.truth((_n_u_b8 >= 1)):
		return false
	if _S.truth((_n_age_b3 < 0.1)):
		var _n_up_b13 = (1 if _S.truth((_n_age_b3 < 0.033)) else (2 if _S.truth((_n_age_b3 < 0.067)) else (2 + (1 if _S.truth((_n_size_b4 > 0.5)) else 0))))
		_S.invoke(_n_q_b0,"px",[_n_X_b9, (_n_Z_b10 - 1), (_S.named_value(_n_c_b5,"white") if _S.truth((_n_age_b3 < 0.05)) else _S.named_value(_n_c_b5,"hot"))])
		if true:
			var _n_d_b14 = 1
			while _S.truth((_n_d_b14 <= minf(_n_up_b13,(3 if _S.truth((_n_size_b4 > 0.5)) else 1)))):
				_S.invoke(_n_q_b0,"px",[(_n_X_b9 - _n_d_b14), ((_n_Z_b10 - 1) - ((_n_d_b14 - 1) if _S.truth((_n_d_b14 > 1)) else 0)), (_S.named_value(_n_c_b5,"hot") if _S.truth(_S.binary("===",_n_d_b14,1)) else _S.named_value(_n_c_b5,"cool"))])
				_S.invoke(_n_q_b0,"px",[(_n_X_b9 + _n_d_b14), ((_n_Z_b10 - 1) - ((_n_d_b14 - 1) if _S.truth((_n_d_b14 > 1)) else 0)), (_S.named_value(_n_c_b5,"hot") if _S.truth(_S.binary("===",_n_d_b14,1)) else _S.named_value(_n_c_b5,"cool"))])
				_n_d_b14 += 1.0
	if _S.truth((_n_u_b8 > 0.15)):
		var _n_w_b15 = floori((1 + ((1.5 + (3.5 * _n_size_b4)) * sqrt(_n_u_b8)))+0.5)
		var _n_gap_b16 = (maxf(0,(_n_w_b15 - 2)) if _S.truth((_n_u_b8 > 0.55)) else (-1))
		if true:
			var _n_d_b17 = (-_n_w_b15)
			while _S.truth((_n_d_b17 <= _n_w_b15)):
				if _S.truth((absf(_n_d_b17) > _n_gap_b16)):
					_S.invoke(_n_q_b0,"px",[(_n_X_b9 + _n_d_b17), _n_Z_b10, (_S.named_value(_n_c_b5,"hot") if _S.truth(_S.logical("&&",(absf(_n_d_b17) >= (_n_w_b15 - 1)),func():return (_n_u_b8 < 0.6))) else _S.named_value(_n_c_b5,"cool"))])
				_n_d_b17 += 1.0
	var _n_nd_b11 = (2 if _S.truth((_n_size_b4 > 0.5)) else 1)
	var _n_H_b12 = floori((_n_h_b6 * 1000000))
	if true:
		var _n_d_b18 = 0
		while _S.truth((_n_d_b18 < _n_nd_b11)):
			var _n_vx_b19 = (((_S.MathFX.rand([_n_H_b12,_n_d_b18,1]) - 0.5) * 2) * (20 + (30 * _n_size_b4)))
			var _n_vy_b20 = (-(50 + ((_S.MathFX.rand([_n_H_b12,_n_d_b18,2]) * 60) * (0.4 + _n_size_b4))))
			var _n_y_b21 = (((_n_Z_b10 - 1) + (_n_vy_b20 * _n_age_b3)) + ((475 * _n_age_b3) * _n_age_b3))
			if _S.truth(((_n_age_b3 < 0.3) if _S.truth((_n_y_b21 < (_n_Z_b10 - 0.5))) else (_n_y_b21 < (_n_Z_b10 - 0.5)))):
				_S.invoke(_n_q_b0,"px",[(_n_x_b1 + (_n_vx_b19 * _n_age_b3)), _n_y_b21, (_S.named_value(_n_c_b5,"white") if _S.truth((_n_age_b3 < 0.1)) else _S.named_value(_n_c_b5,"hot"))])
			_n_d_b18 += 1.0
	return true
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_v_b0 = _S.arg(_args,0)
	return (float((_n_v_b0 + 0.5))/16)
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_BAYER = _S.read(_parent,"BAYER")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.index_value(_n_BAYER,_S.binary("|",_S.binary("<<",_S.binary("&",floori(_n_y_b1),3),2),_S.binary("&",floori(_n_x_b0),3)))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_ph_b3 = _S.coalesce(_S.arg(_args,3),func():return 0)
	return sin(((float(((_n_TAU * _n_c_b2) * _n_t_b0))/_n_D_b1) + _n_ph_b3))
	return null
