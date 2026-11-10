@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/scene.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/color.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/math.js", "rand"))
	_S.define(_e, "backdrop", _S.function_value(_e, "_f0"))
	_S.define(_e, "SKY", _S.call_value(_S.read(_e, "hex"), ["#15131d"]))
	_S.define(_e, "SKY_TOP", _S.call_value(_S.read(_e, "hex"), ["#0d0b14"]))
	_S.define(_e, "SKY_LOW", _S.call_value(_S.read(_e, "hex"), ["#221d33"]))
	_S.define(_e, "FLOOR_EDGE", _S.call_value(_S.read(_e, "hex"), ["#4a4263"]))
	_S.define(_e, "FLOOR", _S.call_value(_S.read(_e, "hex"), ["#2b2639"]))
	_S.define(_e, "FLOOR_DARK", _S.call_value(_S.read(_e, "hex"), ["#211d2d"]))
	_S.define(_e, "MORTAR", _S.call_value(_S.read(_e, "hex"), ["#1a1724"]))
	_S.define(_e, "BAYER", [0, 8, 2, 10, 12, 4, 14, 6, 3, 11, 1, 9, 15, 7, 13, 5])
	_S.define(_e, "BACKDROPS", ["dark", "ground", "sky", "light", "black"])
	_exports["BACKDROPS"] = _S.read(_e, "BACKDROPS")
	_exports["backdrop"] = _S.read(_e, "backdrop")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Uint32Array = _S.read(_parent,"Uint32Array")
	var _n_hex = _S.read(_parent,"hex")
	var _n_SKY = _S.read(_parent,"SKY")
	var _n_BAYER = _S.read(_parent,"BAYER")
	var _n_SKY_TOP = _S.read(_parent,"SKY_TOP")
	var _n_SKY_LOW = _S.read(_parent,"SKY_LOW")
	var _n_FLOOR_EDGE = _S.read(_parent,"FLOOR_EDGE")
	var _n_MORTAR = _S.read(_parent,"MORTAR")
	var _n_FLOOR = _S.read(_parent,"FLOOR")
	var _n_FLOOR_DARK = _S.read(_parent,"FLOOR_DARK")
	var _n_kind_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.arg(_args,1)
	var _n_h_b2 = _S.arg(_args,2)
	var _n_groundY_b3 = _S.coalesce(_S.arg(_args,3),func():return _n_h_b2)
	var _n_out_b4 = _S.construct(_n_Uint32Array,[(_n_w_b1 * _n_h_b2)])
	if _S.truth(_S.binary("===",_n_kind_b0,"light")):
		return _S.invoke(_n_out_b4,"fill",[_S.call_value(_n_hex,["#ebe8f0"])])
	if _S.truth(_S.binary("===",_n_kind_b0,"black")):
		return _S.invoke(_n_out_b4,"fill",[_S.call_value(_n_hex,["#000000"])])
	if true:
		var _n_y_b5 = 0
		while _S.truth((_n_y_b5 < _n_h_b2)):
			if true:
				var _n_x_b6 = 0
				while _S.truth((_n_x_b6 < _n_w_b1)):
					var _n_c_b7 = _n_SKY
					if _S.truth(_S.binary("===",_n_kind_b0,"sky")):
						var _n_t_b8 = (float(_n_y_b5)/maxf(1,(_n_h_b2 - 1)))
						var _n_step_b9 = _S.binary("|",((_n_t_b8 * 5) + (float(_S.index_value(_n_BAYER,_S.binary("|",_S.binary("<<",_S.binary("&",_n_y_b5,3),2),_S.binary("&",_n_x_b6,3))))/16)),0)
						_n_c_b7 = _S.ColorFX.mix(_n_SKY_TOP,_n_SKY_LOW,minf(1,(float(_n_step_b9)/4)))
						var _n_r_b10 = _S.MathFX.rand([_n_x_b6,_n_y_b5,77])
						if _S.truth((_n_r_b10 > 0.994)):
							_n_c_b7 = _S.ColorFX.mix(_n_c_b7,_S.call_value(_n_hex,["#cfc8ff"]),(0.35 + ((_n_r_b10 - 0.994) * 90)))
					if _S.truth(((_n_y_b5 >= _n_groundY_b3) if _S.truth(_S.binary("===",_n_kind_b0,"ground")) else _S.binary("===",_n_kind_b0,"ground"))):
						var _n_gy_b11 = (_n_y_b5 - _n_groundY_b3)
						if _S.truth(_S.binary("===",_n_gy_b11,0)):
							_n_c_b7 = _n_FLOOR_EDGE
						else:
							var _n_row_b12 = floori((float((_n_gy_b11 - 1))/5))
							var _n_off_b13 = (6 if _S.truth(fmod(_n_row_b12,2)) else 0)
							var _n_mortar_b14 = (_S.binary("===",fmod((_n_gy_b11 - 1),5),4) if _S.truth(_S.binary("===",fmod((_n_gy_b11 - 1),5),4)) else _S.binary("===",fmod((_n_x_b6 + _n_off_b13),12),0))
							_n_c_b7 = (_n_MORTAR if _S.truth(_n_mortar_b14) else (_n_FLOOR if _S.truth((_n_gy_b11 < 3)) else _n_FLOOR_DARK))
					_S.set_prop(_n_out_b4,((_n_y_b5 * _n_w_b1) + _n_x_b6),_n_c_b7,"=")
					_n_x_b6 += 1.0
			_n_y_b5 += 1.0
	return _n_out_b4
	return null
