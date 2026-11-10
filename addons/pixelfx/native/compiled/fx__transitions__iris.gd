@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/iris.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Iris"}, {"desc": "A lit iris closes onto a warm spotlight where dust drifts, holds as its rim twinkles, snaps shut into a glint, then pops open from a flash with a white-hot rim throwing sparks."}, {"tags": ["iris", "circle", "spotlight", "wipe"]}, {"duration": 2.2}, {"options": _S.merge([{"palette": ["#1c140c", "#3b2a18", "#6e5233", "#a8875a", "#d9bd8a", "#f3e2bd", "#fff7e8", "#ffffff"]}, {"focus": [160, 100]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "CLOSE", 0.62)
	_S.define(_e, "SNAP", 0.9)
	_S.define(_e, "SHUT", 0.99)
	_S.define(_e, "POP", 1.2)
	_S.define(_e, "OPEN", 1.75)
	_S.define(_e, "RS", 24)
	_S.define(_e, "RW", 5)
	_S.define(_e, "GLO", 16)
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
	var _v0 = _S.prop(_S.read(_e, "o"), "focus")
	_S.define(_e, "fx", _S.prop(_v0, 0))
	_S.define(_e, "fy", _S.prop(_v0, 1))
	_S.define(_e, "R0", _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.invoke([[0, 0], [_S.read(_e, "W"), 0], [0, _S.read(_e, "H")], [_S.read(_e, "W"), _S.read(_e, "H")]], "map", [_S.function_value(_e, "_f1")]))])), _S.read(_e, "RW")), 2))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "radius", _S.function_value(_e, "_f2"))
	_S.define(_e, "t", 0)
	_S.define(_e, "shut", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "prevR", _S.read(_e, "R0"))
	_S.define(_e, "end", _S.binary("-", _S.read(_e, "D"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_fx = _S.read(_parent,"fx")
	var _n_fy = _S.read(_parent,"fy")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return _S.Bridge.hypot([(_n_x_b0 - _n_fx), (_n_y_b1 - _n_fy)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_RS = _S.read(_parent,"RS")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_ease = _S.read(_parent,"ease")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_POP = _S.read(_parent,"POP")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_t_b0 = _S.arg(_args,0)
	return ((_n_RS + ((_n_R0 - _n_RS) * (1 - _S.invoke(_n_ease,"inOutCubic",[(float(_n_t_b0)/_n_CLOSE)])))) if _S.truth((_n_t_b0 < _n_CLOSE)) else ((_n_RS + ((sin(((_n_t_b0 - _n_CLOSE) * 22)) * 0.8) * (1 - (float((_n_t_b0 - _n_CLOSE))/(_n_SNAP - _n_CLOSE))))) if _S.truth((_n_t_b0 < _n_SNAP)) else ((_n_RS * (1 - _S.invoke(_n_ease,"inCubic",[(float((_n_t_b0 - _n_SNAP))/(_n_SHUT - _n_SNAP))]))) if _S.truth((_n_t_b0 < _n_SHUT)) else (0 if _S.truth((_n_t_b0 < _n_POP)) else (_n_R0 * _S.invoke(_n_ease,"outQuart",[clampf((float((_n_t_b0 - _n_POP))/(_n_OPEN - _n_POP)),0.0,1.0)]))))))
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "r", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CLOSE"), 0.25)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.25]))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
		_S.define(_v2, "d", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sqrt", [_S.invoke(_S.read(_v2, "R"), "next", [])]), _S.read(_v2, "r")), 0.9))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "EMBER"), _S.binary("+", _S.read(_v2, "fx"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "d"))), _S.binary("+", _S.read(_v2, "fy"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "d"))), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v2, "R"), "range", [4, 14])), _S.invoke(_S.read(_v2, "R"), "range", [0.4, 0.8]), 0, 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "CLOSE"), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.3]))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "STAR"), _S.binary("+", _S.read(_v3, "fx"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.binary("+", _S.read(_v3, "r"), 1))), _S.binary("+", _S.read(_v3, "fy"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.binary("+", _S.read(_v3, "r"), 1))), 0, 0, _S.invoke(_S.read(_v3, "R"), "range", [0.2, 0.4]), (_S.read(_v3, "WHITE") if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.5])) else _S.prop(_S.read(_v3, "C"), 6)), _S.invoke(_S.read(_v3, "R"), "range", [1, 2.4])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shut")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHUT")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "shut", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "fx"), _S.read(_v4, "fy"), 50, _S.prop(_S.read(_v4, "C"), 5), 0.7, 0.3])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "popped", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "fx"), _S.read(_v5, "fy"), 140, _S.prop(_S.read(_v5, "C"), 5), 0.7, 0.45])
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "fx"), _S.read(_v5, "fy"), 50, _S.read(_v5, "WHITE"), 0.9, 0.12])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 40)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "v", _S.invoke(_S.read(_v7, "R"), "range", [150, 420]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.binary("+", _S.read(_v7, "fx"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), 3)), _S.binary("+", _S.read(_v7, "fy"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), 3)), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.invoke(_S.read(_v7, "R"), "range", [0.2, 0.5])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.1)))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "vr", _S.binary("/", _S.binary("-", _S.read(_v8, "r"), _S.read(_v8, "prevR")), _S.read(_v8, "dt")))
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "k"), 2)):
			var _v10 = _S.scope(_v9)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v10, "R"), "chance", [0.6]))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "k", 1, "+=", true)
				continue
			_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
			_S.define(_v10, "x", _S.binary("+", _S.read(_v10, "fx"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "r"))))
			_S.define(_v10, "y", _S.binary("+", _S.read(_v10, "fy"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "r"))))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v10, "x"), 0), func(): return _S.binary("<", _S.read(_v10, "y"), 0)), func(): return _S.binary(">=", _S.read(_v10, "x"), _S.read(_v10, "W"))), func(): return _S.binary(">=", _S.read(_v10, "y"), _S.read(_v10, "H")))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "k", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "MOTE"), _S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "vr")), 0.35), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "vr")), 0.35), _S.invoke(_S.read(_v10, "Math"), "min", [_S.invoke(_S.read(_v10, "R"), "range", [0.2, 0.45]), _S.binary("-", _S.read(_v10, "end"), _S.read(_v10, "t"))]), (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 5)), 0.7])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "k", 1, "+=", true)
	_S.write(_e, "prevR", _S.read(_e, "r"), "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_radius = _S.read(_parent,"radius")
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_RW = _S.read(_parent,"RW")
	var _n_SHUT = _S.read(_parent,"SHUT")
	var _n_fy = _S.read(_parent,"fy")
	var _n_W = _S.read(_parent,"W")
	var _n_ink = _S.read(_parent,"ink")
	var _n_rect = _S.read(_parent,"rect")
	var _n_fx = _S.read(_parent,"fx")
	var _n_GLO = _S.read(_parent,"GLO")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_H = _S.read(_parent,"H")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_glint = _S.read(_parent,"glint")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _n_r_b2 = _S.call_value(_n_radius,[_n_t])
	var _n_hot_b3 = ((1 - _S.MathFX.smooth(_n_POP,_n_OPEN,_n_t)) if _S.truth((_n_t >= _n_POP)) else ((0.45 + (0.25 * _S.MathFX.smooth((_n_CLOSE - 0.2),_n_CLOSE,_n_t))) if _S.truth((_n_t < _n_SNAP)) else 0.7))
	var _n_rw_b4 = (_n_RW + ((3 * _n_hot_b3) if _S.truth((_n_t >= _n_POP)) else 0))
	if _S.truth((not _S.truth(((_n_r_b2 <= 0) if _S.truth(((_n_t < _n_POP) if _S.truth((_n_t >= _n_SHUT)) else (_n_t >= _n_SHUT))) else ((_n_t < _n_POP) if _S.truth((_n_t >= _n_SHUT)) else (_n_t >= _n_SHUT)))) if _S.truth((_n_t < (_n_OPEN + 0.05))) else (_n_t < (_n_OPEN + 0.05)))):
		if true:
			var _n_y_b7 = 0
			while _S.truth((_n_y_b7 < _n_H)):
				var _n_dy_b8 = ((_n_y_b7 + 0.5) - _n_fy)
				var _n_xo_b9 = sqrt(maxf(0,(pow((_n_r_b2 + _n_rw_b4),2) - (_n_dy_b8 * _n_dy_b8))))
				var _n_xi_b10 = (sqrt(((_n_r_b2 * _n_r_b2) - (_n_dy_b8 * _n_dy_b8))) if _S.truth((absf(_n_dy_b8) < _n_r_b2)) else 0)
				if _S.truth((_n_xo_b9 <= 0)):
					_S.call_value(_n_rect,[_n_p0_b0, 0, _n_y_b7, _n_W, 1, _n_ink])
					_n_y_b7 += 1.0
					continue
				var _n_a0_b11 = clampf(floori((_n_fx - _n_xo_b9)),0,_n_W)
				var _n_b1_b12 = clampf(ceili((_n_fx + _n_xo_b9)),0,_n_W)
				if _S.truth((_n_a0_b11 > 0)):
					_S.call_value(_n_rect,[_n_p0_b0, 0, _n_y_b7, _n_a0_b11, 1, _n_ink])
				if _S.truth((_n_b1_b12 < _n_W)):
					_S.call_value(_n_rect,[_n_p0_b0, _n_b1_b12, _n_y_b7, (_n_W - _n_b1_b12), 1, _n_ink])
				var _n_g_b13 = (sqrt(maxf(0,(pow((_n_r_b2 - _n_GLO),2) - (_n_dy_b8 * _n_dy_b8)))) if _S.truth((_n_r_b2 > _n_GLO)) else 0)
				if true:
					var _n_x_b14 = _n_a0_b11
					while _S.truth((_n_x_b14 < _n_b1_b12)):
						var _n_dx_b15 = ((_n_x_b14 + 0.5) - _n_fx)
						if _S.truth((absf(_n_dx_b15) < _n_g_b13)):
							_n_x_b14 += 1.0
							continue
						var _n_d_b16 = (_S.Bridge.hypot([_n_dx_b15, _n_dy_b8]) - _n_r_b2)
						if _S.truth((_n_d_b16 >= 0)):
							var _n_q_b17 = (float(_n_d_b16)/_n_rw_b4)
							var _n_lit_b18 = (0.5 - (float((0.5 * ((_n_dx_b15 * 0.7) + (_n_dy_b8 * 0.7))))/((_n_r_b2 + _n_d_b16) + 0.01)))
							var _n_h_b19 = (_n_hot_b3 * (0.55 + (0.6 * _n_lit_b18)))
							_S.invoke(_n_p0_b0,"px",[_n_x_b14, _n_y_b7, (_n_ink if _S.truth((_n_q_b17 >= 1)) else ((_n_WHITE if _S.truth((_n_h_b19 > 0.5)) else (_S.index_value(_n_C,6) if _S.truth((_n_h_b19 > 0.3)) else _S.index_value(_n_C,5))) if _S.truth((_n_q_b17 < 0.2)) else ((_S.index_value(_n_C,6) if _S.truth((_n_h_b19 > 0.38)) else _S.index_value(_n_C,5)) if _S.truth((_n_q_b17 < 0.4)) else ((_S.index_value(_n_C,5) if _S.truth((_n_h_b19 > 0.3)) else _S.index_value(_n_C,4)) if _S.truth((_n_q_b17 < 0.65)) else (_S.index_value(_n_C,3) if _S.truth((_n_q_b17 < 0.85)) else _S.index_value(_n_C,2))))))])
							if _S.truth((_n_q_b17 < 0.5)):
								_S.invoke(_n_p0_b0,"light",[_n_x_b14, _n_y_b7, _S.index_value(_n_C,5), ((0.45 * _n_h_b19) * (1 - (_n_q_b17 * 2)))])
						else:
							if _S.truth((_n_d_b16 > (-_n_GLO))):
								_S.invoke(_n_p0_b0,"light",[_n_x_b14, _n_y_b7, _S.index_value(_n_C,5), ((0.18 + (0.3 * _n_hot_b3)) * pow((1 + (float(_n_d_b16)/_n_GLO)),2))])
						_n_x_b14 += 1.0
				_n_y_b7 += 1.0
	else:
		if _S.truth(((_n_t < _n_POP) if _S.truth((_n_t >= _n_SHUT)) else (_n_t >= _n_SHUT))):
			_S.call_value(_n_rect,[_n_p0_b0, 0, 0, _n_W, _n_H, _n_ink])
	if _S.truth(((_n_t < _n_SHUT) if _S.truth(((_n_r_b2 < 80) if _S.truth((_n_r_b2 > 0)) else (_n_r_b2 > 0))) else ((_n_r_b2 < 80) if _S.truth((_n_r_b2 > 0)) else (_n_r_b2 > 0)))):
		var _n_k_b20 = (1 - (float(_n_r_b2)/80))
		_S.invoke(_n_p_b1,"glow",[_n_fx, _n_fy, ((_n_r_b2 * 1.15) + 6), _S.index_value(_n_C,5), (0.18 + (0.32 * _n_k_b20))])
		_S.invoke(_n_p_b1,"glow",[_n_fx, _n_fy, ((_n_r_b2 * 0.6) + 3), _S.index_value(_n_C,6), (0.25 * _n_k_b20)])
	if _S.truth(((_n_t < _n_SNAP) if _S.truth((_n_t > 0.08)) else (_n_t > 0.08))):
		var _n_a_b21 = ((-2.4) + ((float((_n_t - 0.08))/(_n_SNAP - 0.08)) * _n_TAU))
		var _n_gx_b22 = (_n_fx + (cos(_n_a_b21) * (_n_r_b2 + 1)))
		var _n_gy_b23 = (_n_fy + (sin(_n_a_b21) * (_n_r_b2 + 1)))
		if _S.truth(((_n_gy_b23 < (_n_H - 2)) if _S.truth(((_n_gx_b22 < (_n_W - 2)) if _S.truth(((_n_gy_b23 > 2) if _S.truth((_n_gx_b22 > 2)) else (_n_gx_b22 > 2))) else ((_n_gy_b23 > 2) if _S.truth((_n_gx_b22 > 2)) else (_n_gx_b22 > 2)))) else ((_n_gx_b22 < (_n_W - 2)) if _S.truth(((_n_gy_b23 > 2) if _S.truth((_n_gx_b22 > 2)) else (_n_gx_b22 > 2))) else ((_n_gy_b23 > 2) if _S.truth((_n_gx_b22 > 2)) else (_n_gx_b22 > 2))))):
			_S.call_value(_n_glint,[_n_p_b1, _n_gx_b22, _n_gy_b23, (7 + (3 * sin((_n_t * 9)))), (_n_t * 3), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.9])
	var _n_s_b5 = (_n_t - _n_SHUT)
	if _S.truth(((_n_s_b5 < 0.22) if _S.truth((_n_s_b5 > (-0.06))) else (_n_s_b5 > (-0.06)))):
		_S.call_value(_n_glint,[_n_p_b1, _n_fx, _n_fy, (14 * (1 - (float(absf((_n_s_b5 + 0.01)))/0.23))), (_n_s_b5 * 4), _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
	var _n_u_b6 = (_n_t - _n_POP)
	if _S.truth(((_n_u_b6 < 0.18) if _S.truth((_n_u_b6 >= 0)) else (_n_u_b6 >= 0))):
		_S.call_value(_n_glint,[_n_p_b1, _n_fx, _n_fy, (20 * (1 - (float(_n_u_b6)/0.18))), (0.4 - (_n_u_b6 * 3)), _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b1,"glow",[_n_fx, _n_fy, 60, _n_WHITE, (0.6 * (1 - (float(_n_u_b6)/0.18)))])
	_S.invoke(_n_ps,"draw",[_n_p_b1])
	_S.invoke(_n_lights,"draw",[_n_p_b1])
	return null
