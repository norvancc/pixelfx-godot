@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/slash-wipe.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "fillConvex", _S.import_value("fx/transitions/_lib.js", "fillConvex"))
	_S.define(_e, "halfPlane", _S.import_value("fx/transitions/_lib.js", "halfPlane"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Slash wipe"}, {"desc": "A white-hot blade edge slices across the screen, light ahead of it and sparks spraying back over the cover; a second cut flashes through and the cover splits apart."}, {"tags": ["slash", "blade", "cut", "sparks", "wipe"]}, {"duration": 1.7}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#b8c9e8", "#e8f1ff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 2}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SL", 0.55)
	_S.define(_e, "CS", _S.binary("/", 1, _S.invoke(_S.read(_e, "Math"), "hypot", [1, _S.read(_e, "SL")])))
	_S.define(_e, "HALO", 18)
	_S.define(_e, "T0", 0.06)
	_S.define(_e, "SWEEP", 0.62)
	_S.define(_e, "E0", _S.binary("-", _S.binary("*", _S.unary("-", _S.binary("/", _S.read(_e, "H"), 2)), _S.read(_e, "SL")), 4))
	_S.define(_e, "E1", _S.binary("+", _S.binary("+", _S.read(_e, "W"), _S.binary("*", _S.binary("/", _S.read(_e, "H"), 2), _S.read(_e, "SL"))), 24))
	_S.define(_e, "CUT", 0.84)
	_S.define(_e, "CSW", 0.07)
	_S.define(_e, "CHOLD", 0.05)
	_S.define(_e, "CTRAIL", 0.12)
	_S.define(_e, "SLIP", _S.binary("+", _S.read(_e, "CUT"), 0.12))
	_S.define(_e, "SPLIT", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "CUT"), _S.read(_e, "CSW")), _S.read(_e, "CHOLD")), _S.read(_e, "CTRAIL")))
	_S.define(_e, "edgeAt", _S.function_value(_e, "_f9"))
	_S.define(_e, "speedAt", _S.function_value(_e, "_f10"))
	_S.define(_e, "xAt", _S.function_value(_e, "_f11"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "R"), "range", [0.42, 0.56]))
	_S.define(_e, "ux", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))
	_S.define(_e, "uy", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	_S.define(_e, "nx", _S.read(_e, "uy"))
	_S.define(_e, "ny", _S.unary("-", _S.read(_e, "ux")))
	_S.define(_e, "cx", _S.binary("+", _S.binary("/", _S.read(_e, "W"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 24), 24])))
	_S.define(_e, "cy", _S.binary("+", _S.binary("/", _S.read(_e, "H"), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 10])))
	_S.define(_e, "area", [[_S.unary("-", 24), _S.unary("-", 24)], [_S.binary("+", _S.read(_e, "W"), 24), _S.unary("-", 24)], [_S.binary("+", _S.read(_e, "W"), 24), _S.binary("+", _S.read(_e, "H"), 24)], [_S.unary("-", 24), _S.binary("+", _S.read(_e, "H"), 24)]])
	_S.define(_e, "ends", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f1")]))
	var _v2 = _S.read(_e, "ends")
	_S.define(_e, "A", _S.prop(_v2, 0))
	_S.define(_e, "B", _S.prop(_v2, 1))
	_S.define(_e, "LC", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_e, "B"), 0), _S.prop(_S.read(_e, "A"), 0)), _S.binary("-", _S.prop(_S.read(_e, "B"), 1), _S.prop(_S.read(_e, "A"), 1))]))
	_S.define(_e, "halves", _S.invoke([1, _S.unary("-", 1)], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", 0)
	_S.define(_e, "entered", false)
	_S.define(_e, "tipped", false)
	_S.define(_e, "split", false)
	_S.define(_e, "end", _S.binary("-", _S.read(_e, "D"), 0.05))
	_S.define(_e, "placeOf", _S.function_value(_e, "_f3"))
	_S.define(_e, "moved", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_ux = _S.read(_parent,"ux")
	var _n_cy = _S.read(_parent,"cy")
	var _n_uy = _S.read(_parent,"uy")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_lo_b1 = 0
	var _n_hi_b2 = 400
	if true:
		var _n_k_b3 = 0
		while _S.truth((_n_k_b3 < 30)):
			var _n_m_b4 = (float((_n_lo_b1 + _n_hi_b2))/2)
			var _n_x_b5 = (_n_cx + ((_n_s_b0 * _n_ux) * _n_m_b4))
			var _n_y_b6 = (_n_cy + ((_n_s_b0 * _n_uy) * _n_m_b4))
			if _S.truth(((_n_y_b6 <= _n_H) if _S.truth(((_n_y_b6 >= 0) if _S.truth(((_n_x_b5 <= _n_W) if _S.truth((_n_x_b5 >= 0)) else (_n_x_b5 >= 0))) else ((_n_x_b5 <= _n_W) if _S.truth((_n_x_b5 >= 0)) else (_n_x_b5 >= 0)))) else ((_n_y_b6 >= 0) if _S.truth(((_n_x_b5 <= _n_W) if _S.truth((_n_x_b5 >= 0)) else (_n_x_b5 >= 0))) else ((_n_x_b5 <= _n_W) if _S.truth((_n_x_b5 >= 0)) else (_n_x_b5 >= 0))))):
				_n_lo_b1 = _n_m_b4
			else:
				_n_hi_b2 = _n_m_b4
			_n_k_b3 += 1.0
	return [(_n_cx + ((_n_s_b0 * _n_ux) * _n_lo_b1)), (_n_cy + ((_n_s_b0 * _n_uy) * _n_lo_b1))]
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_area = _S.read(_parent,"area")
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_nx = _S.read(_parent,"nx")
	var _n_ny = _S.read(_parent,"ny")
	var _n_halfPlane = _S.read(_parent,"halfPlane")
	var _n_R = _S.read(_parent,"R")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.call_value(_n_halfPlane,[_n_area, _n_cx, _n_cy, (_n_s_b0 * _n_nx), (_n_s_b0 * _n_ny)])
	var _n_mx_b2 = 0
	var _n_my_b3 = 0
	for _iter_0 in _S.array(_n_pts_b1):
		var _tuple_1 = _iter_0
		var _n_x_b4 = _S.prop(_tuple_1,0)
		var _n_y_b5 = _S.prop(_tuple_1,1)
		_n_mx_b2 += (float(_n_x_b4)/_S.prop(_n_pts_b1,"length"))
		_n_my_b3 += (float(_n_y_b5)/_S.prop(_n_pts_b1,"length"))
	return {"s":_n_s_b0,"pts":_n_pts_b1,"mx":_n_mx_b2,"my":_n_my_b3,"spin":(_n_s_b0 * _S.invoke(_n_R,"range",[0.5, 0.9]))}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_SLIP = _S.read(_parent,"SLIP")
	var _n_SPLIT = _S.read(_parent,"SPLIT")
	var _n_ux = _S.read(_parent,"ux")
	var _n_nx = _S.read(_parent,"nx")
	var _n_uy = _S.read(_parent,"uy")
	var _n_ny = _S.read(_parent,"ny")
	var _n_hf_b0 = _S.arg(_args,0)
	var _n_slip_b1 = ((5 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _n_SLIP))/0.12),0.0,1.0)])) * (1 if _S.truth((_S.named_value(_n_hf_b0,"s") > 0)) else (-0.4)))
	var _n_u_b2 = maxf(0,(_n_t - _n_SPLIT))
	var _n_sep_b3 = ((30 * _n_u_b2) + (((0.5 * 1500) * _n_u_b2) * _n_u_b2))
	var _n_rot_b4 = ((_S.named_value(_n_hf_b0,"spin") * _n_u_b2) * _n_u_b2)
	return {"dx":((_n_ux * _n_slip_b1) + ((_S.named_value(_n_hf_b0,"s") * _n_nx) * _n_sep_b3)),"dy":((_n_uy * _n_slip_b1) + ((_S.named_value(_n_hf_b0,"s") * _n_ny) * _n_sep_b3)),"rot":_n_rot_b4,"sep":_n_sep_b3}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_hf_b0 = _S.arg(_args,0)
	var _n_pl_b1 = _S.arg(_args,1)
	var _tuple_0 = _S.arg(_args,2)
	var _n_x_b2 = _S.prop(_tuple_0,0)
	var _n_y_b3 = _S.prop(_tuple_0,1)
	var _n_c_b4 = cos(_S.named_value(_n_pl_b1,"rot"))
	var _n_s_b5 = sin(_S.named_value(_n_pl_b1,"rot"))
	var _n_lx_b6 = (_n_x_b2 - _S.named_value(_n_hf_b0,"mx"))
	var _n_ly_b7 = (_n_y_b3 - _S.named_value(_n_hf_b0,"my"))
	return [(((_S.named_value(_n_hf_b0,"mx") + (_n_lx_b6 * _n_c_b4)) - (_n_ly_b7 * _n_s_b5)) + _S.named_value(_n_pl_b1,"dx")), (((_S.named_value(_n_hf_b0,"my") + (_n_lx_b6 * _n_s_b5)) + (_n_ly_b7 * _n_c_b4)) + _S.named_value(_n_pl_b1,"dy"))]
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "speedAt"), [_S.read(_e, "t")]))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "edgeAt"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "entered")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T0")))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "entered", true, "=", false)
		_S.invoke(_S.read(_v7, "lights"), "add", [4, 4, 60, _S.prop(_S.read(_v7, "C"), 5), 0.6, 0.25])
	var _v8 = _S.scope(_e)
	_S.write(_v8, "acc", _S.binary("*", _S.binary("*", _S.read(_v8, "sp"), _S.read(_v8, "dt")), 0.035), "+=", false)
	while _S.truth(_S.binary(">", _S.read(_v8, "acc"), 1)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "y", _S.invoke(_S.read(_v9, "R"), "range", [4, _S.binary("-", _S.read(_v9, "H"), 4)]))
		_S.define(_v9, "x", _S.binary("-", _S.call_value(_S.read(_v9, "xAt"), [_S.read(_v9, "e"), _S.read(_v9, "y")]), 1))
		_S.define(_v9, "a0", _S.binary("+", _S.prop(_S.read(_v9, "Math"), "PI"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.1), 0.6])))
		_S.define(_v9, "n", _S.invoke(_S.read(_v9, "R"), "int", [5, 10]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v9, "x"), 0), func(): return _S.binary(">=", _S.read(_v9, "x"), _S.read(_v9, "W")))):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "acc", 1, "-=", true)
			continue
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.read(_v10, "n"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "a", _S.binary("+", _S.read(_v11, "a0"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 0.75), 0.75])))
			_S.define(_v11, "v", _S.binary("*", _S.invoke(_S.read(_v11, "R"), "range", [0.2, 1]), _S.binary("+", 140, _S.binary("*", 0.22, _S.read(_v11, "sp")))))
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.read(_v11, "x"), _S.binary("+", _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), _S.invoke(_S.read(_v11, "R"), "range", [0.15, 0.4])])
			if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.4])):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "MOTE"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "v")), 0.45), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "v")), 0.45), 20), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.5]), (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "C"), 5)), 0.7])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		_S.invoke(_S.read(_v9, "lights"), "add", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.invoke(_S.read(_v9, "R"), "range", [30, 46]), _S.prop(_S.read(_v9, "C"), 5), 0.35, 0.14])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "acc", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "tipped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CUT"), _S.read(_e, "CSW"))))):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "tipped", true, "=", false)
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 12)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.invoke(_S.read(_v14, "Math"), "atan2", [_S.read(_v14, "uy"), _S.read(_v14, "ux")]), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.define(_v14, "v", _S.invoke(_S.read(_v14, "R"), "range", [150, 400]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), _S.binary("-", _S.prop(_S.read(_v14, "B"), 0), _S.binary("*", _S.read(_v14, "ux"), 2)), _S.binary("-", _S.prop(_S.read(_v14, "B"), 1), _S.binary("*", _S.read(_v14, "uy"), 2)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "v")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "v")), _S.invoke(_S.read(_v14, "R"), "range", [0.12, 0.35])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v12)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 18)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "k", _S.invoke(_S.read(_v16, "R"), "range", [0.1, 1]))
			_S.define(_v16, "x", _S.binary("+", _S.prop(_S.read(_v16, "A"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v16, "B"), 0), _S.prop(_S.read(_v16, "A"), 0)), _S.read(_v16, "k"))))
			_S.define(_v16, "y", _S.binary("+", _S.prop(_S.read(_v16, "A"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v16, "B"), 1), _S.prop(_S.read(_v16, "A"), 1)), _S.read(_v16, "k"))))
			_S.define(_v16, "s", _S.invoke(_S.read(_v16, "R"), "sign", []))
			_S.define(_v16, "v", _S.invoke(_S.read(_v16, "R"), "range", [30, 100]))
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "MOTE"), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v16, "s"), _S.read(_v16, "nx")), _S.read(_v16, "v")), _S.binary("*", _S.read(_v16, "ux"), 20)), _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v16, "s"), _S.read(_v16, "ny")), _S.read(_v16, "v")), 10), _S.invoke(_S.read(_v16, "R"), "range", [0.25, 0.55]), (_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 4)), 0.6])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v12)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 5)):
			_S.invoke(_S.read(_v17, "lights"), "add", [_S.binary("+", _S.prop(_S.read(_v17, "A"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "B"), 0), _S.prop(_S.read(_v17, "A"), 0)), _S.binary("+", _S.read(_v17, "i"), 0.5)), 5)), _S.binary("+", _S.prop(_S.read(_v17, "A"), 1), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "B"), 1), _S.prop(_S.read(_v17, "A"), 1)), _S.binary("+", _S.read(_v17, "i"), 0.5)), 5)), 46, _S.prop(_S.read(_v17, "C"), 5), 0.45, 0.3])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "split")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SPLIT")))):
		var _v18 = _S.scope(_e)
		_S.write(_v18, "split", true, "=", false)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 46)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "k", _S.invoke(_S.read(_v20, "R"), "range", [0, 1]))
			_S.define(_v20, "x", _S.binary("+", _S.prop(_S.read(_v20, "A"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v20, "B"), 0), _S.prop(_S.read(_v20, "A"), 0)), _S.read(_v20, "k"))))
			_S.define(_v20, "y", _S.binary("+", _S.prop(_S.read(_v20, "A"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v20, "B"), 1), _S.prop(_S.read(_v20, "A"), 1)), _S.read(_v20, "k"))))
			_S.define(_v20, "s", _S.invoke(_S.read(_v20, "R"), "sign", []))
			_S.define(_v20, "v", _S.invoke(_S.read(_v20, "R"), "range", [80, 320]))
			_S.define(_v20, "a", _S.binary("+", _S.invoke(_S.read(_v20, "Math"), "atan2", [_S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "ny")), _S.binary("*", _S.read(_v20, "s"), _S.read(_v20, "nx"))]), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.7), 0.7])))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "v")), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "v")), _S.invoke(_S.read(_v20, "Math"), "min", [_S.invoke(_S.read(_v20, "R"), "range", [0.15, 0.45]), _S.binary("-", _S.read(_v20, "end"), _S.read(_v20, "t"))])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v18)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 6)):
			_S.invoke(_S.read(_v21, "lights"), "add", [_S.binary("+", _S.prop(_S.read(_v21, "A"), 0), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "B"), 0), _S.prop(_S.read(_v21, "A"), 0)), _S.binary("+", _S.read(_v21, "i"), 0.5)), 6)), _S.binary("+", _S.prop(_S.read(_v21, "A"), 1), _S.binary("/", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v21, "B"), 1), _S.prop(_S.read(_v21, "A"), 1)), _S.binary("+", _S.read(_v21, "i"), 0.5)), 6)), 56, _S.prop(_S.read(_v21, "C"), 5), 0.5, 0.35])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_t = _S.read(_parent,"t")
	var _n_CUT = _S.read(_parent,"CUT")
	var _n_CSW = _S.read(_parent,"CSW")
	var _n_CHOLD = _S.read(_parent,"CHOLD")
	var _n_SLIP = _S.read(_parent,"SLIP")
	var _n_edgeAt = _S.read(_parent,"edgeAt")
	var _n_speedAt = _S.read(_parent,"speedAt")
	var _n_xAt = _S.read(_parent,"xAt")
	var _n_CS = _S.read(_parent,"CS")
	var _n_W = _S.read(_parent,"W")
	var _n_HALO = _S.read(_parent,"HALO")
	var _n_ink = _S.read(_parent,"ink")
	var _n_rect = _S.read(_parent,"rect")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_H = _S.read(_parent,"H")
	var _n_placeOf = _S.read(_parent,"placeOf")
	var _n_moved = _S.read(_parent,"moved")
	var _n_A = _S.read(_parent,"A")
	var _n_B = _S.read(_parent,"B")
	var _n_nx = _S.read(_parent,"nx")
	var _n_ny = _S.read(_parent,"ny")
	var _n_fillConvex = _S.read(_parent,"fillConvex")
	var _n_halves = _S.read(_parent,"halves")
	var _n_CTRAIL = _S.read(_parent,"CTRAIL")
	var _n_LC = _S.read(_parent,"LC")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SPLIT = _S.read(_parent,"SPLIT")
	var _n_ux = _S.read(_parent,"ux")
	var _n_uy = _S.read(_parent,"uy")
	var _n_n = _S.read(_parent,"n")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.call_value(_n_clipTo,[_n_p0_b0])
	if _S.truth(((_n_t < (((_n_CUT + _n_CSW) + _n_CHOLD) + 0.02)) if _S.truth((_n_t < (((_n_CUT + _n_CSW) + _n_CHOLD) + 0.02))) else (_n_t < _n_SLIP))):
		var _n_e_b3 = _S.call_value(_n_edgeAt,[_n_t])
		var _n_sp_b4 = _S.call_value(_n_speedAt,[_n_t])
		var _n_Ls_b5 = clampf((_n_sp_b4 * 0.0065),1.5,8)
		var _n_echo_b6 = (clampf((float(_n_sp_b4)/900),0.0,1.0) * 0.6)
		if true:
			var _n_y_b7 = 0
			while _S.truth((_n_y_b7 < _n_H)):
				var _n_xe_b8 = _S.call_value(_n_xAt,[_n_e_b3, (_n_y_b7 + 0.5)])
				var _n_ia_b9 = clampf(floori((_n_xe_b8 - (float((_n_Ls_b5 + 10))/_n_CS))),0,_n_W)
				var _n_ib_b10 = clampf(ceili((_n_xe_b8 + (float(_n_HALO)/_n_CS))),0,_n_W)
				if _S.truth((_n_ia_b9 > 0)):
					_S.call_value(_n_rect,[_n_p0_b0, 0, _n_y_b7, _n_ia_b9, 1, _n_ink])
				if true:
					var _n_x_b11 = _n_ia_b9
					while _S.truth((_n_x_b11 < _n_ib_b10)):
						var _n_d_b12 = ((_n_xe_b8 - (_n_x_b11 + 0.5)) * _n_CS)
						if _S.truth((_n_d_b12 < 0)):
							var _n_u_b13 = (1 + (float(_n_d_b12)/_n_HALO))
							_S.invoke(_n_p0_b0,"light",[_n_x_b11, _n_y_b7, _S.index_value(_n_C,5), ((0.32 * _n_u_b13) * _n_u_b13)])
							if _S.truth((_n_d_b12 > (-4))):
								_S.invoke(_n_p0_b0,"light",[_n_x_b11, _n_y_b7, _n_WHITE, (0.3 * pow((1 + (float(_n_d_b12)/4)),2))])
							_n_x_b11 += 1.0
							continue
						if _S.truth((_n_d_b12 < 1)):
							_S.invoke(_n_p0_b0,"px",[_n_x_b11, _n_y_b7, _n_WHITE])
						else:
							if _S.truth((_n_d_b12 < 2)):
								_S.invoke(_n_p0_b0,"px",[_n_x_b11, _n_y_b7, _S.index_value(_n_C,6)])
							else:
								var _n_q_b14 = (float((_n_d_b12 - 2))/_n_Ls_b5)
								_S.invoke(_n_p0_b0,"px",[_n_x_b11, _n_y_b7, (_S.index_value(_n_C,5) if _S.truth((_n_q_b14 < 0.3)) else (_S.index_value(_n_C,4) if _S.truth((_n_q_b14 < 0.55)) else (_S.index_value(_n_C,3) if _S.truth((_n_q_b14 < 0.8)) else (_S.index_value(_n_C,2) if _S.truth((_n_q_b14 < 1)) else _n_ink))))])
								if _S.truth(_S.logical("&&",((absf(((_n_d_b12 - _n_Ls_b5) - 7)) < 0.5) if _S.truth((_n_echo_b6 > 0)) else (_n_echo_b6 > 0)),func():return _S.binary("===",fmod((_n_x_b11 + _n_y_b7),3),0))):
									_S.invoke(_n_p0_b0,"dot",[_n_x_b11, _n_y_b7, _S.index_value(_n_C,4), _n_echo_b6])
						if _S.truth((_n_d_b12 < (_n_Ls_b5 + 2))):
							_S.invoke(_n_p0_b0,"light",[_n_x_b11, _n_y_b7, _S.index_value(_n_C,5), (0.3 * (1 - (float(_n_d_b12)/(_n_Ls_b5 + 2))))])
						_n_x_b11 += 1.0
				_n_y_b7 += 1.0
	if _S.truth((_n_t >= _n_SLIP)):
		var _n_heat_b15 = (1 - clampf((float(((_n_t - _n_CUT) - 0.05))/0.5),0.0,1.0))
		for _iter_0 in _S.array(_n_halves):
			var _n_hf_b16 = _iter_0
			var _n_pl_b17 = _S.call_value(_n_placeOf,[_n_hf_b16])
			var _n_pts_b18 = _S.invoke(_S.named_value(_n_hf_b16,"pts"),"map",[_S.function_value(_S.capture(_parent,{"hf":_n_hf_b16,"pl":_n_pl_b17,"this":_this}),"_f7")])
			var _n_a_b19 = _S.call_value(_n_moved,[_n_hf_b16, _n_pl_b17, _n_A])
			var _n_b_b20 = _S.call_value(_n_moved,[_n_hf_b16, _n_pl_b17, _n_B])
			var _n_c_b21 = cos(_S.named_value(_n_pl_b17,"rot"))
			var _n_sn_b22 = sin(_S.named_value(_n_pl_b17,"rot"))
			var _n_mx_b23 = (_S.named_value(_n_hf_b16,"s") * ((_n_nx * _n_c_b21) - (_n_ny * _n_sn_b22)))
			var _n_my_b24 = (_S.named_value(_n_hf_b16,"s") * ((_n_nx * _n_sn_b22) + (_n_ny * _n_c_b21)))
			var _n_rim_b25 = [(_n_WHITE if _S.truth((_n_heat_b15 > 0.55)) else (_S.index_value(_n_C,6) if _S.truth((_n_heat_b15 > 0.25)) else _S.index_value(_n_C,5))), (_S.index_value(_n_C,6) if _S.truth((_n_heat_b15 > 0.4)) else _S.index_value(_n_C,4)), (_S.index_value(_n_C,5) if _S.truth((_n_heat_b15 > 0.3)) else _S.index_value(_n_C,3)), (_S.index_value(_n_C,4) if _S.truth((_n_heat_b15 > 0.3)) else _n_ink)]
			var _n_deep_b26 = clampf((1 + (_S.named_value(_n_pl_b17,"sep") * 0.5)),1,4)
			_S.call_value(_n_fillConvex,[_n_p0_b0, _n_pts_b18, _S.function_value(_S.capture(_parent,{"a":_n_a_b19,"mx":_n_mx_b23,"my":_n_my_b24,"deep":_n_deep_b26,"p0":_n_p0_b0,"heat":_n_heat_b15,"rim":_n_rim_b25,"this":_this}),"_f8")])
			if _S.truth((_n_heat_b15 > 0)):
				if true:
					var _n_i_b27 = 0
					while _S.truth((_n_i_b27 < 8)):
						var _n_k_b28 = (float((_n_i_b27 + 0.5))/8)
						_S.invoke(_n_p_b1,"glow",[(_S.index_value(_n_a_b19,0) + ((_S.index_value(_n_b_b20,0) - _S.index_value(_n_a_b19,0)) * _n_k_b28)), (_S.index_value(_n_a_b19,1) + ((_S.index_value(_n_b_b20,1) - _S.index_value(_n_a_b19,1)) * _n_k_b28)), (12 + (_S.named_value(_n_pl_b17,"sep") * 0.15)), _S.index_value(_n_C,5), (0.3 * _n_heat_b15)])
						_n_i_b27 += 1.0
	var _n_u_b2 = (_n_t - _n_CUT)
	if _S.truth(((_n_u_b2 < (((_n_CSW + _n_CHOLD) + _n_CTRAIL) + 0.25)) if _S.truth((_n_u_b2 >= 0)) else (_n_u_b2 >= 0))):
		var _n_head_b29 = (_n_LC * _S.invoke(_n_ease,"outExpo",[clampf((float(_n_u_b2)/_n_CSW),0.0,1.0)]))
		var _n_tail_b30 = (_n_LC * _S.MathFX.smooth((_n_CSW + _n_CHOLD),((_n_CSW + _n_CHOLD) + _n_CTRAIL),_n_u_b2))
		var _n_age_b31 = clampf((float(_n_u_b2)/((_n_CSW + _n_CHOLD) + _n_CTRAIL)),0.0,1.0)
		var _n_Wc_b32 = (3.6 * (1 - ((float(_n_tail_b30)/_n_LC) * 0.55)))
		var _n_span_b33 = (_n_head_b29 - _n_tail_b30)
		var _n_sn_b34 = absf(_n_nx)
		if _S.truth(((_n_t < _n_SPLIT) if _S.truth(((_n_tail_b30 < (_n_LC - 1)) if _S.truth((_n_span_b33 > 1)) else (_n_span_b33 > 1))) else ((_n_tail_b30 < (_n_LC - 1)) if _S.truth((_n_span_b33 > 1)) else (_n_span_b33 > 1)))):
			if true:
				var _n_y_b36 = 0
				while _S.truth((_n_y_b36 < _n_H)):
					var _n_x0_b37 = (_S.index_value(_n_A,0) + (float((((_n_y_b36 + 0.5) - _S.index_value(_n_A,1)) * _n_ux))/_n_uy))
					var _n_hw_b38 = (float((_n_Wc_b32 + 1))/_n_sn_b34)
					if true:
						var _n_x_b39 = maxf(0,floori((_n_x0_b37 - _n_hw_b38)))
						while _S.truth((_n_x_b39 < minf(_n_W,ceili((_n_x0_b37 + _n_hw_b38))))):
							var _n_px_b40 = ((_n_x_b39 + 0.5) - _S.index_value(_n_A,0))
							var _n_py_b41 = ((_n_y_b36 + 0.5) - _S.index_value(_n_A,1))
							var _n_s_b42 = ((_n_px_b40 * _n_ux) + (_n_py_b41 * _n_uy))
							var _n_v_b43 = (float((_n_s_b42 - _n_tail_b30))/_n_span_b33)
							if _S.truth(((_n_v_b43 < 0) if _S.truth((_n_v_b43 < 0)) else (_n_v_b43 > 1))):
								_n_x_b39 += 1.0
								continue
							var _n_w_b44 = (_n_Wc_b32 * pow(sin((PI * pow(_n_v_b43,2.2))),0.6))
							if _S.truth((_n_w_b44 < 0.35)):
								_n_x_b39 += 1.0
								continue
							var _n_q_b45 = (float(absf(((_n_px_b40 * _n_nx) + (_n_py_b41 * _n_ny))))/_n_w_b44)
							if _S.truth((_n_q_b45 > 1)):
								_n_x_b39 += 1.0
								continue
							var _n_ci_b46 = (0 if _S.truth(((_n_age_b31 < 0.5) if _S.truth((_n_q_b45 < 0.34)) else (_n_q_b45 < 0.34))) else floori((((((_n_q_b45 * (_n_n - 1)) * 0.75) + (_n_age_b31 * 2.4)) - (_n_v_b43 * 0.8)) + 0.4)+0.5))
							_S.invoke(_n_p0_b0,"dot",[_n_x_b39, _n_y_b36, _S.index_value(_n_C,((_n_n - 1) - clampf(_n_ci_b46,0,(_n_n - 1)))), minf(1,(float(_n_v_b43)/0.4))])
							if _S.truth((_n_q_b45 < 0.5)):
								_S.invoke(_n_p0_b0,"light",[_n_x_b39, _n_y_b36, _S.index_value(_n_C,5), (0.4 * (1 - _n_age_b31))])
							_n_x_b39 += 1.0
					_n_y_b36 += 1.0
		if _S.truth(((_n_t < _n_SPLIT) if _S.truth((_n_tail_b30 > 2)) else (_n_tail_b30 > 2))):
			if true:
				var _n_s_b47 = 0
				while _S.truth((_n_s_b47 < _n_tail_b30)):
					_S.invoke(_n_p_b1,"dot",[(_S.index_value(_n_A,0) + (_n_ux * _n_s_b47)), (_S.index_value(_n_A,1) + (_n_uy * _n_s_b47)), _S.index_value(_n_C,5), (0.7 * (0.4 + (float((0.6 * _n_s_b47))/_n_LC)))])
					_n_s_b47 += 1.6
		if _S.truth((_n_u_b2 < 0.3)):
			var _n_hx_b48 = (_S.index_value(_n_A,0) + (_n_ux * _n_head_b29))
			var _n_hy_b49 = (_S.index_value(_n_A,1) + (_n_uy * _n_head_b29))
			_S.invoke(_n_p_b1,"glow",[_n_hx_b48, _n_hy_b49, 46, _S.index_value(_n_C,4), (0.55 * (1 - (float(_n_u_b2)/0.3)))])
		var _n_g_b35 = (_n_u_b2 - (_n_CSW * 0.6))
		if _S.truth(((_n_g_b35 < 0.24) if _S.truth((_n_g_b35 > 0)) else (_n_g_b35 > 0))):
			_S.call_value(_n_sparkle,[_n_p_b1, (_S.index_value(_n_B,0) - (_n_ux * 3)), (_S.index_value(_n_B,1) - (_n_uy * 3)), ((11 * _S.invoke(_n_ease,"outBack",[minf(1,(float(_n_g_b35)/0.05))])) * (1 - (float(_n_g_b35)/0.24))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.7])
	_S.invoke(_n_ps,"draw",[_n_p_b1])
	_S.invoke(_n_lights,"draw",[_n_p_b1])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_moved = _S.read(_parent,"moved")
	var _n_hf = _S.read(_parent,"hf")
	var _n_pl = _S.read(_parent,"pl")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_moved,[_n_hf, _n_pl, _n_q_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_mx = _S.read(_parent,"mx")
	var _n_my = _S.read(_parent,"my")
	var _n_deep = _S.read(_parent,"deep")
	var _n_p0 = _S.read(_parent,"p0")
	var _n_C = _S.read(_parent,"C")
	var _n_heat = _S.read(_parent,"heat")
	var _n_rim = _S.read(_parent,"rim")
	var _n_ink = _S.read(_parent,"ink")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_d_b2 = (((_n_x_b0 - _S.index_value(_n_a,0)) * _n_mx) + ((_n_y_b1 - _S.index_value(_n_a,1)) * _n_my))
	if _S.truth((_n_d_b2 < _n_deep)):
		if _S.truth((_n_d_b2 < 2)):
			_S.invoke(_n_p0,"light",[_n_x_b0, _n_y_b1, _S.index_value(_n_C,5), ((0.4 * _n_heat) * (1 - (float(_n_d_b2)/2)))])
		return _S.index_value(_n_rim,maxf(0,floori(_n_d_b2)))
	return _n_ink
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_E0 = _S.read(_parent,"E0")
	var _n_E1 = _S.read(_parent,"E1")
	var _n_ease = _S.read(_parent,"ease")
	var _n_T0 = _S.read(_parent,"T0")
	var _n_SWEEP = _S.read(_parent,"SWEEP")
	var _n_t_b0 = _S.arg(_args,0)
	return (_n_E0 + ((_n_E1 - _n_E0) * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_T0))/_n_SWEEP),0.0,1.0)])))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_T0 = _S.read(_parent,"T0")
	var _n_SWEEP = _S.read(_parent,"SWEEP")
	var _n_E1 = _S.read(_parent,"E1")
	var _n_E0 = _S.read(_parent,"E0")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth(((_n_t_b0 < _n_T0) if _S.truth((_n_t_b0 < _n_T0)) else (_n_t_b0 > (_n_T0 + _n_SWEEP)))) else (float((((_n_E1 - _n_E0) * 3) * pow((1 - (float((_n_t_b0 - _n_T0))/_n_SWEEP)),2)))/_n_SWEEP))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_SL = _S.read(_parent,"SL")
	var _n_e_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_n_e_b0 + (((float(_n_H)/2) - _n_y_b1) * _n_SL))
	return null
