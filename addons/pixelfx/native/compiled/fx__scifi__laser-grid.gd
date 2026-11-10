@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/laser-grid.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "beams", _S.function_value(_e, "_f0"))
	_S.define(_e, "laser", _S.function_value(_e, "_f2"))
	_S.define(_e, "cross", _S.function_value(_e, "_f4"))
	_S.define(_e, "near", _S.function_value(_e, "_f5"))
	_S.define(_e, "post", _S.function_value(_e, "_f6"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.merge([{"name": "Laser grid"}, {"desc": "Security lasers between two steel posts: red beams slide and scissor across, dust and haze light up only where they cut through, and the floor sweepers scorch and spark."}, {"tags": ["scifi", "laser", "security", "trap", "hazard", "beam", "ground", "loop"]}, {"size": [128, 84]}, {"origin": [64, 76]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0408", "#4a0a12", "#8a1020", "#d01c2a", "#ff4a4a", "#ff9a90", "#ffe4e0", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"seed": 31}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "PX", 48)
	_S.define(_e, "TOP", _S.unary("-", 64))
	_S.define(_e, "IN", _S.binary("-", _S.read(_e, "PX"), 4))
	_S.define(_e, "SLIDE", [[_S.unary("-", 14), 8, 1, 0], [_S.unary("-", 31), 12, 2, 1.3], [_S.unary("-", 48), 9, 1, 3.6]])
	_S.define(_e, "sweepX", _S.function_value(_e, "_f12"))
	_S.define(_e, "slideY", _S.function_value(_e, "_f13"))
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SLIDE = _S.read(_parent,"SLIDE")
	var _n_IN = _S.read(_parent,"IN")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_sweepX = _S.read(_parent,"sweepX")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_out_b1 = _S.invoke(_n_SLIDE,"map",[_S.function_value(_S.capture(_parent,{"t":_n_t_b0,"this":_this}),"_f1")])
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b2 = _iter_0
		_S.invoke(_n_out_b1,"push",[[(_n_s_b2 * _n_IN), (_n_TOP + 6), _S.call_value(_n_sweepX,[_n_t_b0, _n_s_b2]), 0]])
	return _n_out_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_IN = _S.read(_parent,"IN")
	var _n_slideY = _S.read(_parent,"slideY")
	var _n_t = _S.read(_parent,"t")
	var _n_b_b0 = _S.arg(_args,0)
	return [(-_n_IN), _S.call_value(_n_slideY,[_n_t, _n_b_b0]), _n_IN, _S.call_value(_n_slideY,[_n_t, _n_b_b0])]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_seed_b4 = _S.arg(_args,4)
	var _tuple_0 = _n_b_b1
	var _n_x0_b5 = _S.prop(_tuple_0,0)
	var _n_y0_b6 = _S.prop(_tuple_0,1)
	var _n_x1_b7 = _S.prop(_tuple_0,2)
	var _n_y1_b8 = _S.prop(_tuple_0,3)
	var _n_steep_b9 = (absf((_n_y1_b8 - _n_y0_b6)) > absf((_n_x1_b7 - _n_x0_b5)))
	var _n_ox_b10 = (1 if _S.truth(_n_steep_b9) else 0)
	var _n_oy_b11 = (0 if _S.truth(_n_steep_b9) else 1)
	for _iter_1 in _S.array([(-1), 1]):
		var _n_s_b13 = _iter_1
		_S.invoke(_n_p_b0,"line",[(_n_x0_b5 + (_n_s_b13 * _n_ox_b10)), (_n_y0_b6 + (_n_s_b13 * _n_oy_b11)), (_n_x1_b7 + (_n_s_b13 * _n_ox_b10)), (_n_y1_b8 + (_n_s_b13 * _n_oy_b11)), (_S.index_value(_n_C_b2,4) if _S.truth((_n_s_b13 < 0)) else _S.index_value(_n_C_b2,3))])
	_S.invoke(_n_p_b0,"line",[_n_x0_b5, _n_y0_b6, _n_x1_b7, _n_y1_b8, _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"C":_n_C_b2,"this":_this}),"_f3")])
	var _n_L_b12 = _S.Bridge.hypot([(_n_x1_b7 - _n_x0_b5), (_n_y1_b8 - _n_y0_b6)])
	if true:
		var _n_d_b14 = 0
		while _S.truth((_n_d_b14 <= _n_L_b12)):
			var _n_x_b15 = _S.numeric_lerp(_n_x0_b5,_n_x1_b7,(float(_n_d_b14)/_n_L_b12))
			var _n_y_b16 = _S.numeric_lerp(_n_y0_b6,_n_y1_b8,(float(_n_d_b14)/_n_L_b12))
			var _n_h_b17 = (0.5 + (0.5 * _S.NoiseKernels.tile_fbm(((float(_n_x_b15)/14) + ((float(_n_t_b3)/_n_D) * 4)),(float(_n_y_b16)/10),4,0,_n_seed_b4)))
			_S.invoke(_n_p_b0,"glow",[_n_x_b15, _n_y_b16, (6 + (4 * _n_h_b17)), _S.index_value(_n_C_b2,3), (0.14 + ((0.3 * _n_h_b17) * _n_h_b17))])
			_n_d_b14 += 5
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_u_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((fmod((fmod(((_n_u_b0 * 5) - (_n_t * 3)),1) + 1),1) < 0.12)) else _n_WHITE)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _tuple_0 = _n_a_b0
	var _n_x1_b2 = _S.prop(_tuple_0,0)
	var _n_y1_b3 = _S.prop(_tuple_0,1)
	var _n_x2_b4 = _S.prop(_tuple_0,2)
	var _n_y2_b5 = _S.prop(_tuple_0,3)
	var _tuple_1 = _n_b_b1
	var _n_x3_b6 = _S.prop(_tuple_1,0)
	var _n_y3_b7 = _S.prop(_tuple_1,1)
	var _n_x4_b8 = _S.prop(_tuple_1,2)
	var _n_y4_b9 = _S.prop(_tuple_1,3)
	var _n_d_b10 = (((_n_x1_b2 - _n_x2_b4) * (_n_y3_b7 - _n_y4_b9)) - ((_n_y1_b3 - _n_y2_b5) * (_n_x3_b6 - _n_x4_b8)))
	if _S.truth((absf(_n_d_b10) < 0.000001)):
		return null
	var _n_u_b11 = (float((((_n_x1_b2 - _n_x3_b6) * (_n_y3_b7 - _n_y4_b9)) - ((_n_y1_b3 - _n_y3_b7) * (_n_x3_b6 - _n_x4_b8))))/_n_d_b10)
	var _n_v_b12 = (float((-(((_n_x1_b2 - _n_x2_b4) * (_n_y1_b3 - _n_y3_b7)) - ((_n_y1_b3 - _n_y2_b5) * (_n_x1_b2 - _n_x3_b6)))))/_n_d_b10)
	return ([(_n_x1_b2 + (_n_u_b11 * (_n_x2_b4 - _n_x1_b2))), (_n_y1_b3 + (_n_u_b11 * (_n_y2_b5 - _n_y1_b3)))] if _S.truth(((_n_v_b12 <= 1) if _S.truth(((_n_v_b12 >= 0) if _S.truth(((_n_u_b11 <= 1) if _S.truth((_n_u_b11 >= 0)) else (_n_u_b11 >= 0))) else ((_n_u_b11 <= 1) if _S.truth((_n_u_b11 >= 0)) else (_n_u_b11 >= 0)))) else ((_n_v_b12 >= 0) if _S.truth(((_n_u_b11 <= 1) if _S.truth((_n_u_b11 >= 0)) else (_n_u_b11 >= 0))) else ((_n_u_b11 <= 1) if _S.truth((_n_u_b11 >= 0)) else (_n_u_b11 >= 0))))) else null)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _tuple_0 = _n_b_b0
	var _n_x0_b3 = _S.prop(_tuple_0,0)
	var _n_y0_b4 = _S.prop(_tuple_0,1)
	var _n_x1_b5 = _S.prop(_tuple_0,2)
	var _n_y1_b6 = _S.prop(_tuple_0,3)
	var _n_dx_b7 = (_n_x1_b5 - _n_x0_b3)
	var _n_dy_b8 = (_n_y1_b6 - _n_y0_b4)
	var _n_u_b9 = clampf((float((((_n_x_b1 - _n_x0_b3) * _n_dx_b7) + ((_n_y_b2 - _n_y0_b4) * _n_dy_b8)))/((_n_dx_b7 * _n_dx_b7) + (_n_dy_b8 * _n_dy_b8))),0.0,1.0)
	var _n_ex_b10 = ((_n_x0_b3 + (_n_dx_b7 * _n_u_b9)) - _n_x_b1)
	var _n_ey_b11 = ((_n_y0_b4 + (_n_dy_b8 * _n_u_b9)) - _n_y_b2)
	return sqrt(((_n_ex_b10 * _n_ex_b10) + (_n_ey_b11 * _n_ey_b11)))
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "x0", _S.binary("-", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "PX")), 4))
	_S.define(_e, "B", _S.invoke(_S.read(_e, "SLIDE"), "map", [_S.function_value(_e, "_f7")]))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "y", _S.binary("+", _S.read(_v10, "TOP"), 4))
	while _S.truth(_S.binary("<", _S.read(_v10, "y"), 0)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "glint", _S.invoke(_S.read(_v11, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.read(_v11, "B"), "map", [_S.function_value(_v11, "_f8")]))])))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 8)):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "x", _S.binary("+", _S.read(_v13, "x0"), _S.read(_v13, "i")))
			_S.define(_v13, "inner", (_S.binary(">=", _S.read(_v13, "i"), 6) if _S.truth(_S.binary("<", _S.read(_v13, "s"), 0)) else _S.binary("<=", _S.read(_v13, "i"), 1)))
			_S.define(_v13, "c", (_S.prop(_S.read(_v13, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v13, "i"), 0), func(): return _S.binary("===", _S.read(_v13, "i"), 7))) else (_S.prop(_S.read(_v13, "H"), 4) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 1)) else (_S.prop(_S.read(_v13, "H"), 3) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 2)) else (_S.prop(_S.read(_v13, "H"), 1) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 4)) else (_S.prop(_S.read(_v13, "H"), 2) if _S.truth(_S.binary("===", _S.read(_v13, "i"), 6)) else _S.prop(_S.read(_v13, "H"), 3)))))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_v13, "inner"), func(): return _S.binary("!==", _S.read(_v13, "i"), 0)), func(): return _S.binary("!==", _S.read(_v13, "i"), 7)), func(): return _S.binary(">", _S.read(_v13, "glint"), 0.35))):
				_S.write(_v13, "c", (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "glint"), 0.75)) else _S.prop(_S.read(_v13, "C"), 3)), "=", false)
			_S.invoke(_S.read(_v13, "p"), "px", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "y", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "y", _S.binary("+", _S.read(_v14, "TOP"), 12))
	while _S.truth(_S.binary("<", _S.read(_v14, "y"), _S.unary("-", 4))):
		_S.invoke(_S.read(_v14, "p"), "px", [_S.binary("+", _S.read(_v14, "x0"), 3), _S.read(_v14, "y"), _S.prop(_S.read(_v14, "H"), 5)])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "y", 9, "+=", false)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "y", _S.read(_v15, "TOP"))
	while _S.truth(_S.binary("<", _S.read(_v15, "y"), _S.binary("+", _S.read(_v15, "TOP"), 10))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<", _S.read(_v16, "i"), 9)):
			_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("+", _S.read(_v16, "x0"), _S.read(_v16, "i")), _S.read(_v16, "y"), (_S.prop(_S.read(_v16, "H"), 0) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("===", _S.read(_v16, "i"), _S.unary("-", 1)), func(): return _S.binary("===", _S.read(_v16, "i"), 8)), func(): return _S.binary("===", _S.read(_v16, "y"), _S.read(_v16, "TOP"))), func(): return _S.binary("===", _S.read(_v16, "y"), _S.binary("+", _S.read(_v16, "TOP"), 9)))) else (_S.prop(_S.read(_v16, "H"), 5) if _S.truth(_S.binary("===", _S.read(_v16, "y"), _S.binary("+", _S.read(_v16, "TOP"), 1))) else (_S.prop(_S.read(_v16, "H"), 4) if _S.truth(_S.binary("<", _S.read(_v16, "i"), 3)) else _S.prop(_S.read(_v16, "H"), 2))))])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "i", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 6), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 5), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 7), _S.prop(_S.read(_e, "C"), 4)])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", _S.unary("-", 3))
	while _S.truth(_S.binary("<", _S.read(_v17, "i"), 11)):
		_S.last([_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.read(_v17, "x0"), _S.read(_v17, "i")), _S.unary("-", 2), (_S.prop(_S.read(_v17, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v17, "i"), _S.unary("-", 3)), func(): return _S.binary("===", _S.read(_v17, "i"), 10))) else _S.prop(_S.read(_v17, "H"), 4))]), _S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.read(_v17, "x0"), _S.read(_v17, "i")), _S.unary("-", 1), (_S.prop(_S.read(_v17, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v17, "i"), _S.unary("-", 3)), func(): return _S.binary("===", _S.read(_v17, "i"), 10))) else _S.prop(_S.read(_v17, "H"), 2))]), _S.invoke(_S.read(_v17, "p"), "px", [_S.binary("+", _S.read(_v17, "x0"), _S.read(_v17, "i")), 0, _S.prop(_S.read(_v17, "H"), 1)])])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "+=", true)
	for _v18 in _S.array(_S.read(_e, "B")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "by", _v18)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "y", _S.invoke(_S.read(_v20, "Math"), "round", [_S.read(_v20, "by")]))
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "j", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v21, "j"), 2)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "i"), 4)):
				_S.invoke(_S.read(_v22, "p"), "px", [(_S.binary("+", _S.binary("+", _S.read(_v22, "x0"), 5), _S.read(_v22, "i")) if _S.truth(_S.binary("<", _S.read(_v22, "s"), 0)) else _S.binary("+", _S.binary("-", _S.read(_v22, "x0"), 1), _S.read(_v22, "i"))), _S.binary("+", _S.read(_v22, "y"), _S.read(_v22, "j")), (_S.prop(_S.read(_v22, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.read(_v22, "j")]), 2), func(): return _S.binary("===", _S.read(_v22, "i"), (3 if _S.truth(_S.binary("<", _S.read(_v22, "s"), 0)) else 0)))) else (_S.prop(_S.read(_v22, "H"), 5) if _S.truth(_S.binary("<", _S.read(_v22, "j"), 0)) else _S.prop(_S.read(_v22, "H"), 3)))])
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "i", 1, "+=", true)
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "j", 1, "+=", true)
		_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "IN")), _S.read(_v20, "y"), _S.read(_v20, "WHITE")])
		_S.invoke(_S.read(_v20, "p"), "glow", [_S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "IN")), _S.read(_v20, "y"), 7, _S.prop(_S.read(_v20, "C"), 4), 0.55])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "s"), _S.read(_e, "IN")), _S.binary("+", _S.read(_e, "TOP"), 6), 8, _S.prop(_S.read(_e, "C"), 4), 0.55])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_slideY = _S.read(_parent,"slideY")
	var _n_t = _S.read(_parent,"t")
	var _n_b_b0 = _S.arg(_args,0)
	return _S.call_value(_n_slideY,[_n_t, _n_b_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_y = _S.read(_parent,"y")
	var _n_by_b0 = _S.arg(_args,0)
	return exp((-pow((float((_n_y - _n_by_b0))/2.5),2)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_sweepX = _S.read(_parent,"sweepX")
	var _n_P = _S.read(_parent,"P")
	var _n_hex = _S.read(_parent,"hex")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_key_b2 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + "")
	if _S.truth(_S.invoke(_n_cache,"has",[_n_key_b2])):
		return _S.invoke(_n_cache,"get",[_n_key_b2])
	var _n_rn_b3 = _S.construct(_n_Rng,[_S.named_value(_n_o_b0,"seed")])
	var _n_g_b4 = _S.construct(_n_Ghosts,[_n_D, {"ground":_S.function_value(_S.capture(_parent,{"this":_this}),"_f10"),"sparks":[_n_WHITE, _S.index_value(_n_C_b1,6), _S.index_value(_n_C_b1,4), _S.index_value(_n_C_b1,3)],"box":[(-62), (-80), 62, 7]}])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 36)):
			var _n_tb_b6 = (((float(_n_i_b5)/36) * _n_D) + _S.invoke(_n_rn_b3,"range",[0, 0.05]))
			var _n_s_b7 = (1 if _S.truth(fmod(_n_i_b5,2)) else (-1))
			var _n_x_b8 = _S.call_value(_n_sweepX,[_n_tb_b6, _n_s_b7])
			var _n_dir_b9 = _S.logical("||",signf((_S.call_value(_n_sweepX,[(_n_tb_b6 + 0.02), _n_s_b7]) - _n_x_b8)),func():return 1)
			var _n_a_b10 = ((float((-PI))/2) - (_n_dir_b9 * _S.invoke(_n_rn_b3,"range",[0.2, 1.1])))
			_S.invoke(_n_g_b4,"add",[_n_tb_b6, _S.named_value(_n_P,"SPARK"), _n_x_b8, (-1), (cos(_n_a_b10) * _S.invoke(_n_rn_b3,"range",[50, 140])), (sin(_n_a_b10) * _S.invoke(_n_rn_b3,"range",[50, 140])), _S.invoke(_n_rn_b3,"range",[0.2, 0.45])])
			if _S.truth(_S.binary("===",fmod(_n_i_b5,4),0)):
				_S.invoke(_n_g_b4,"add",[_n_tb_b6, _S.named_value(_n_P,"SMOKE"), _n_x_b8, (-2), _S.invoke(_n_rn_b3,"range",[(-4), 4]), (-_S.invoke(_n_rn_b3,"range",[6, 14])), _S.invoke(_n_rn_b3,"range",[0.8, 1.2]), _S.call_value(_n_hex,["#3a2a30"]), _S.invoke(_n_rn_b3,"range",[1.6, 2.4])])
			_n_i_b5 += 1.0
	_S.invoke(_n_cache,"set",[_n_key_b2, _n_g_b4])
	return _n_g_b4
	return null

static func _f10(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_beams = _S.read(_parent,"beams")
	var _n_sweepX = _S.read(_parent,"sweepX")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_D = _S.read(_parent,"D")
	var _n_IN = _S.read(_parent,"IN")
	var _n_near = _S.read(_parent,"near")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_post = _S.read(_parent,"post")
	var _n_laser = _S.read(_parent,"laser")
	var _n_cross = _S.read(_parent,"cross")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ghosts = _S.read(_parent,"ghosts")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),6)
	var _n_B_b5 = _S.call_value(_n_beams,[_n_t_b1])
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b8 = _iter_0
		if true:
			var _n_k_b9 = 0
			while _S.truth((_n_k_b9 < 14)):
				var _n_ago_b10 = (_n_k_b9 * 0.025)
				var _n_x_b11 = _S.call_value(_n_sweepX,[(_n_t_b1 - _n_ago_b10), _n_s_b8])
				var _n_c_b12 = (_n_WHITE if _S.truth((_n_k_b9 < 2)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_k_b9 < 5)) else (_S.index_value(_n_C_b3,4) if _S.truth((_n_k_b9 < 9)) else _S.index_value(_n_C_b3,3))))
				_S.invoke(_n_p_b0,"dot",[_n_x_b11, 0, _n_c_b12, (1 - (float(_n_k_b9)/14))])
				_S.invoke(_n_p_b0,"dot",[_n_x_b11, 1, _S.index_value(_n_C_b3,3), (0.6 - (float(_n_k_b9)/24))])
				_n_k_b9 += 1.0
	if true:
		var _n_x_b13 = (-40)
		while _S.truth((_n_x_b13 <= 40)):
			_S.invoke(_n_p_b0,"glow",[_n_x_b13, (-2), 20, _S.index_value(_n_C_b3,3), 0.12])
			_n_x_b13 += 20
	var _n_ph_b7 = (float(_n_t_b1)/_n_D)
	if true:
		var _n_y_b14 = (-60)
		while _S.truth((_n_y_b14 < 0)):
			if true:
				var _n_x_b15 = ((-_n_IN) + 1)
				while _S.truth((_n_x_b15 < _n_IN)):
					var _n_d_b16 = 99
					for _iter_1 in _S.array(_n_B_b5):
						var _n_b_b21 = _iter_1
						_n_d_b16 = minf(_n_d_b16,_S.call_value(_n_near,[_n_b_b21, (_n_x_b15 + 0.5), (_n_y_b14 + 0.5)]))
					if _S.truth((_n_d_b16 > 11)):
						_n_x_b15 += 1.0
						continue
					var _n_low_b17 = (0.35 + (0.65 * clampf((float((_n_y_b14 + 60))/50),0.0,1.0)))
					var _n_n_b18 = (0.5 + (0.5 * _S.NoiseKernels.tile_fbm(((float((_n_x_b15 + 0.5))/18) + (_n_ph_b7 * 3)),((float((_n_y_b14 + 0.5))/7) + (0.4 * sin((_n_TAU * _n_ph_b7)))),3,0,(_n_S_b6 + 7),2)))
					var _n_dens_b19 = (clampf(((_n_n_b18 - 0.42) * 2.2),0.0,1.0) * _n_low_b17)
					if _S.truth((_n_dens_b19 <= 0.02)):
						_n_x_b15 += 1.0
						continue
					var _n_lit_b20 = exp((float((-_n_d_b16))/4.5))
					_S.invoke(_n_p_b0,"blend",[(_n_x_b15 + 0.5), (_n_y_b14 + 0.5), (_S.index_value(_n_C_b3,4) if _S.truth((_n_lit_b20 > 0.5)) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_lit_b20 > 0.15)) else _S.index_value(_n_C_b3,1))), ((_n_dens_b19 * 0.8) * _n_lit_b20)])
					_n_x_b15 += 1.0
			_n_y_b14 += 1.0
	for _iter_2 in _S.array([(-1), 1]):
		var _n_s_b22 = _iter_2
		_S.call_value(_n_post,[_n_p_b0, _n_s_b22, _n_H_b4, _n_C_b3, _n_t_b1])
	for _iter_3 in _S.array(_n_B_b5):
		var _n_b_b23 = _iter_3
		_S.call_value(_n_laser,[_n_p_b0, _n_b_b23, _n_C_b3, _n_t_b1, _n_S_b6])
	if true:
		var _n_i_b24 = 0
		while _S.truth((_n_i_b24 < 90)):
			var _n_x_b25 = ((((_S.MathFX.rand([_n_S_b6,_n_i_b24]) * 2) - 1) * (_n_IN - 3)) + (4 * sin(((_n_TAU * (float(_n_t_b1)/_n_D)) + _n_i_b24))))
			var _n_y_b26 = (((-2) - (_S.MathFX.rand([_n_S_b6,_n_i_b24,1]) * 62)) + (3 * sin((((_n_TAU * 2) * (float(_n_t_b1)/_n_D)) + (_n_i_b24 * 1.7)))))
			var _n_d_b27 = 9
			for _iter_4 in _S.array(_n_B_b5):
				var _n_b_b28 = _iter_4
				_n_d_b27 = minf(_n_d_b27,_S.call_value(_n_near,[_n_b_b28, _n_x_b25, _n_y_b26]))
			if _S.truth((_n_d_b27 < 1.6)):
				_S.invoke(_n_p_b0,"px",[_n_x_b25, _n_y_b26, (_n_WHITE if _S.truth((_n_d_b27 < 0.9)) else _S.index_value(_n_C_b3,6))])
				_S.invoke(_n_p_b0,"glow",[_n_x_b25, _n_y_b26, 3, _S.index_value(_n_C_b3,5), 0.45])
			_n_i_b24 += 1.0
	if true:
		var _n_i_b29 = 0
		while _S.truth((_n_i_b29 < _S.prop(_n_B_b5,"length"))):
			if true:
				var _n_j_b30 = (_n_i_b29 + 1)
				while _S.truth((_n_j_b30 < _S.prop(_n_B_b5,"length"))):
					var _n_c_b31 = _S.call_value(_n_cross,[_S.index_value(_n_B_b5,_n_i_b29), _S.index_value(_n_B_b5,_n_j_b30)])
					if _S.truth(not _S.truth(_n_c_b31)):
						_n_j_b30 += 1.0
						continue
					_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_c_b31,0), _S.index_value(_n_c_b31,1), 9, _S.index_value(_n_C_b3,5), 0.4])
					_S.call_value(_n_sparkle,[_n_p_b0, _S.index_value(_n_c_b31,0), _S.index_value(_n_c_b31,1), 2, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.3])
					_n_j_b30 += 1.0
			_n_i_b29 += 1.0
	for _iter_5 in _S.array([(-1), 1]):
		var _n_s_b32 = _iter_5
		var _n_x_b33 = _S.call_value(_n_sweepX,[_n_t_b1, _n_s_b32])
		_S.invoke(_n_p_b0,"px",[_n_x_b33, (-1), _n_WHITE])
		_S.invoke(_n_p_b0,"px",[(_n_x_b33 - 1), 0, _S.index_value(_n_C_b3,6)])
		_S.invoke(_n_p_b0,"px",[(_n_x_b33 + 1), 0, _S.index_value(_n_C_b3,6)])
		_S.invoke(_n_p_b0,"glow",[_n_x_b33, (-1), 10, _S.index_value(_n_C_b3,4), 0.55])
		_S.invoke(_n_p_b0,"glow",[_n_x_b33, (-1), 4, _n_WHITE, 0.35])
	_S.invoke(_S.invoke(_S.call_value(_n_ghosts,[_n_o_b2, _n_C_b3]),"at",[_n_t_b1]),"draw",[_n_p_b0])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_s_b1 = _S.arg(_args,1)
	return (_n_s_b1 * (34 - (68 * (0.5 - (0.5 * cos(((_n_TAU * (float(_n_t_b0)/_n_D)) + (0 if _S.truth((_n_s_b1 > 0)) else 1.9))))))))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.arg(_args,1)
	var _n_y_b1 = _S.prop(_tuple_0,0)
	var _n_a_b2 = _S.prop(_tuple_0,1)
	var _n_n_b3 = _S.prop(_tuple_0,2)
	var _n_f_b4 = _S.prop(_tuple_0,3)
	return (_n_y_b1 + (_n_a_b2 * sin((((_n_TAU * _n_n_b3) * (float(_n_t_b0)/_n_D)) + _n_f_b4))))
	return null
