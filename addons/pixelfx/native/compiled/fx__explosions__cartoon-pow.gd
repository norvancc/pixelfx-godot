@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/cartoon-pow.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Cartoon POW"}, {"desc": "A comic-book hit: a jagged two-tone burst star slams in with a shake and boiling edges, POW! drops in letter by letter, action lines fly, then it all snaps away."}, {"tags": ["cartoon", "comic", "pow", "hit", "impact", "text", "one-shot"]}, {"size": [184, 144]}, {"origin": [92, 72]}, {"duration": 1.05}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#1a0e14", "#6e1a12", "#c8361a", "#f47a24", "#ffc23c", "#fff07a", "#ffffff"]}, {"text": "POW!"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "N", 14)
	_S.define(_e, "IN", 0.05)
	_S.define(_e, "GO", 0.66)
	_S.define(_e, "END", 0.8)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "INK", _S.prop(_S.read(_e, "C"), 0))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.binary("*", _S.read(_e, "N"), 2)}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "lines", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 16}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "burst", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"r":(_S.invoke(_n_R,"range",[0.5, 0.6]) if _S.truth(fmod(_n_i_b1,2)) else _S.invoke(_n_R,"range",[0.85, 1.05])),"j":(_S.invoke(_n_R,"next",[]) * 100)}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":((float((_n_i_b1 + _S.invoke(_n_R,"range",[0.2, 0.8])))/16) * _n_TAU),"r":_S.invoke(_n_R,"range",[0.92, 1.08]),"L":_S.invoke(_n_R,"range",[10, 17]),"t0":_S.invoke(_n_R,"range",[0, 0.06])}
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IN")))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "burst", true, "=", false)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 22)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
			_S.define(_v2, "sp", _S.invoke(_S.read(_v2, "R"), "range", [180, 360]))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), 14), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), 10), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "sp")), _S.invoke(_S.read(_v2, "R"), "range", [0.12, 0.3])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "GO")))):
		var _v3 = _S.scope(_e)
		_S.write(_v3, "popped", true, "=", false)
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 14)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [60, 150]))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), 26), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), 18), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "R"), "range", [0.25, 0.42]), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.prop(_S.read(_v5, "C"), 6), _S.prop(_S.read(_v5, "C"), 5), _S.prop(_S.read(_v5, "C"), 4)]]), _S.invoke(_S.read(_v5, "R"), "range", [1.2, 2.4])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 3), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 1), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 3)])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "IN"))]))
	_S.define(_e, "s", (_S.binary("+", 0.25, _S.binary("*", 0.95, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "IN"))) else (_S.binary("+", 1, _S.binary("*", _S.binary("*", 0.18, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN"))), 18)])), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN")), 40)]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "GO"))) else _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "GO")), _S.binary("-", _S.read(_e, "END"), _S.read(_e, "GO")))]), 2])))))
	_S.define(_e, "shake", (_S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.3)), 2.2) if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.3)) else 0))
	_S.define(_e, "sx", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 97)]), _S.read(_e, "shake"))]))
	_S.define(_e, "sy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "t"), 83)]), _S.read(_e, "shake"))]))
	if _S.truth(_S.binary(">", _S.read(_e, "s"), 0.02)):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "boil", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("*", _S.read(_v6, "t"), 12)]))
		_S.define(_v6, "outer", _S.binary("*", 50, _S.read(_v6, "s")))
		_S.define(_v6, "rot", _S.binary("+", _S.unary("-", 0.1), (_S.binary("*", _S.binary("-", _S.read(_v6, "t"), _S.read(_v6, "GO")), 3) if _S.truth(_S.binary(">", _S.read(_v6, "t"), _S.read(_v6, "GO"))) else 0)))
		_S.define(_v6, "M", _S.binary("*", _S.read(_v6, "N"), 2))
		_S.define(_v6, "rad", _S.invoke(_S.read(_v6, "spikes"), "map", [_S.function_value(_v6, "_f5")]))
		_S.invoke(_S.read(_v6, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_v6, "sx"), _S.read(_v6, "outer")), 4), _S.binary("-", _S.binary("-", _S.read(_v6, "sy"), _S.read(_v6, "outer")), 4), _S.binary("+", _S.binary("+", _S.read(_v6, "sx"), _S.read(_v6, "outer")), 4), _S.binary("+", _S.binary("+", _S.read(_v6, "sy"), _S.read(_v6, "outer")), 4), _S.function_value(_v6, "_f6")])
		_S.invoke(_S.read(_v6, "p"), "glow", [_S.read(_v6, "sx"), _S.read(_v6, "sy"), _S.binary("*", _S.read(_v6, "outer"), 1.3), _S.prop(_S.read(_v6, "C"), 5), _S.binary("*", 0.3, _S.invoke(_S.read(_v6, "Math"), "min", [1, _S.read(_v6, "s")]))])
	for _v7 in _S.array(_S.read(_e, "lines")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "u", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v9, "t"), _S.read(_v9, "IN")), _S.prop(_S.read(_v9, "q"), "t0")), 0.32))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v9, "u"), 0), func(): return _S.binary(">=", _S.read(_v9, "u"), 1))):
			continue
		_S.define(_v9, "r0", _S.binary("*", _S.binary("+", 46, _S.binary("*", 22, _S.invoke(_S.read(_v9, "ease"), "outCubic", [_S.read(_v9, "u")]))), _S.prop(_S.read(_v9, "q"), "r")))
		_S.define(_v9, "L", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v9, "q"), "L"), 0.7), _S.binary("-", 1, _S.read(_v9, "u"))))
		_S.define(_v9, "ca", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.prop(_S.read(_v9, "q"), "a")]))
		_S.define(_v9, "sa", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.prop(_S.read(_v9, "q"), "a")]), 0.82))
		_S.invoke(_S.read(_v9, "p"), "line", [_S.binary("*", _S.read(_v9, "ca"), _S.read(_v9, "r0")), _S.binary("*", _S.read(_v9, "sa"), _S.read(_v9, "r0")), _S.binary("*", _S.read(_v9, "ca"), _S.binary("+", _S.read(_v9, "r0"), _S.read(_v9, "L"))), _S.binary("*", _S.read(_v9, "sa"), _S.binary("+", _S.read(_v9, "r0"), _S.read(_v9, "L"))), _S.function_value(_v9, "_f7")])
	_S.define(_e, "ru", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN")), 0.24))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "ru"), 0), func(): return _S.binary("<", _S.read(_e, "ru"), 1))):
		_S.invoke(_S.read(_e, "p"), "ring", [0, 0, _S.binary("+", 30, _S.binary("*", 34, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "ru")]))), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_e, "ru")))]), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "ru"), 0.4)) else _S.prop(_S.read(_e, "C"), 5)), _S.binary("-", 1.1, _S.read(_e, "ru"))])
	_S.define(_e, "word", _S.call_value(_S.read(_e, "String"), [_S.logical("??", _S.prop(_S.read(_e, "o"), "text"), func(): return "POW!")]))
	_S.define(_e, "scale", 3)
	_S.define(_e, "widths", _S.invoke(_S.concat([_S.array(_S.read(_e, "word"))]), "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "x", _S.binary("/", _S.unary("-", _S.invoke(_S.read(_e, "widths"), "reduce", [_S.function_value(_e, "_f9"), _S.unary("-", _S.read(_e, "scale"))])), 2))
	_S.invoke(_S.concat([_S.array(_S.read(_e, "word"))]), "forEach", [_S.function_value(_e, "_f10")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "IN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "IN"), 0.12)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "sx"), 34), _S.binary("-", _S.read(_e, "sy"), 22), _S.binary("*", 6, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN")), 0.12))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.6])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_boil = _S.read(_parent,"boil")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_q_b0,"r") * (1 + ((_S.MathFX.rand([_n_i_b1,_n_boil,7]) - 0.5) * 0.08)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_sx = _S.read(_parent,"sx")
	var _n_sy = _S.read(_parent,"sy")
	var _n_rot = _S.read(_parent,"rot")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_M = _S.read(_parent,"M")
	var _n_rad = _S.read(_parent,"rad")
	var _n_outer = _S.read(_parent,"outer")
	var _n_INK = _S.read(_parent,"INK")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_x_b0 - _n_sx)
	var _n_dy_b3 = (float((_n_y_b1 - _n_sy))/0.82)
	var _n_d_b4 = _S.Bridge.hypot([_n_dx_b2, _n_dy_b3])
	var _n_u_b5 = (fmod((fmod((float((atan2(_n_dy_b3,_n_dx_b2) - _n_rot))/_n_TAU),1) + 1),1) * _n_M)
	var _n_i_b6 = fmod(floori(_n_u_b5),_n_M)
	var _n_f_b7 = (_n_u_b5 - floori(_n_u_b5))
	var _n_r_b8 = (_S.index_value(_n_rad,_n_i_b6) + ((_S.index_value(_n_rad,fmod((_n_i_b6 + 1),_n_M)) - _S.index_value(_n_rad,_n_i_b6)) * _n_f_b7))
	var _n_e_b9 = (float(_n_d_b4)/_n_r_b8)
	if _S.truth((_n_e_b9 > (_n_outer + 2.5))):
		return null
	if _S.truth((_n_e_b9 > _n_outer)):
		return _n_INK
	if _S.truth((_n_e_b9 > ((_n_outer * 0.66) + 2))):
		return (_S.index_value(_n_C,4) if _S.truth(_S.logical("&&",(_S.binary("===",fmod((floori(_n_x_b0) + (floori(_n_y_b1) * 2)),4),0) if _S.truth((((_n_dx_b2 * 0.6) + (_n_dy_b3 * 0.8)) > (_n_outer * 0.25))) else (((_n_dx_b2 * 0.6) + (_n_dy_b3 * 0.8)) > (_n_outer * 0.25))),func():return _S.binary("===",fmod(floori(_n_y_b1),2),0))) else _S.index_value(_n_C,5))
	if _S.truth((_n_e_b9 > (_n_outer * 0.66))):
		return _n_INK
	return (_S.index_value(_n_C,3) if _S.truth((_n_e_b9 > (_n_outer * 0.44))) else _S.index_value(_n_C,4))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_v_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_v_b0 < 0.5)) else _S.index_value(_n_C,5))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_scale = _S.read(_parent,"scale")
	var _n_ch_b0 = _S.arg(_args,0)
	return _S.index_value(_S.invoke(_n_p,"measure",[_n_ch_b0, {"font":"big","scale":_n_scale}]),0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_scale = _S.read(_parent,"scale")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.arg(_args,1)
	return ((_n_a_b0 + _n_w_b1) + _n_scale)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ch", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN")), 0.04), _S.binary("*", _S.read(_e, "i"), 0.05)), 0.12))
	_S.define(_e, "away", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "GO")), _S.binary("-", _S.binary("-", _S.read(_e, "END"), _S.read(_e, "GO")), 0.04))]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "away"), 1))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "drop", _S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v10, "ease"), "outBack", [_S.call_value(_S.read(_v10, "clamp"), [_S.read(_v10, "u")]), 2.4])), _S.unary("-", 14)))
		_S.define(_v10, "y", _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("+", _S.binary("+", _S.binary("-", _S.binary("+", _S.unary("-", 11), _S.read(_v10, "drop")), _S.binary("*", _S.read(_v10, "i"), 1.5)), _S.read(_v10, "sy")), _S.binary("*", _S.read(_v10, "away"), 6))]))
		_S.define(_v10, "lx", _S.invoke(_S.read(_v10, "Math"), "round", [_S.binary("+", _S.read(_v10, "x"), _S.read(_v10, "sx"))]))
		_S.define(_v10, "a", _S.binary("-", 1, _S.read(_v10, "away")))
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "d", 4)
		while _S.truth(_S.binary(">=", _S.read(_v11, "d"), 1)):
			_S.invoke(_S.read(_v11, "p"), "text", [_S.read(_v11, "ch"), _S.binary("+", _S.read(_v11, "lx"), _S.read(_v11, "d")), _S.binary("+", _S.read(_v11, "y"), _S.read(_v11, "d")), (_S.read(_v11, "INK") if _S.truth(_S.binary(">=", _S.read(_v11, "d"), 3)) else _S.prop(_S.read(_v11, "C"), 1)), _S.merge([{"font": "big"}, {"scale": _S.read(_v11, "scale")}, {"a": _S.read(_v11, "a")}, {"outline": (_S.read(_v11, "INK") if _S.truth(_S.binary("===", _S.read(_v11, "d"), 4)) else null)}])])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "d", 1, "-=", true)
		for _v12 in _S.array([[_S.unary("-", 2), 0], [2, 0], [0, _S.unary("-", 2)], [0, 2], [_S.unary("-", 1), _S.unary("-", 1)], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1], [1, 1]]):
			var _v13 = _S.scope(_v10)
			var _v14 = _v12
			_S.define(_v13, "ox", _S.prop(_v14, 0))
			_S.define(_v13, "oy", _S.prop(_v14, 1))
			_S.invoke(_S.read(_v13, "p"), "text", [_S.read(_v13, "ch"), _S.binary("+", _S.read(_v13, "lx"), _S.read(_v13, "ox")), _S.binary("+", _S.read(_v13, "y"), _S.read(_v13, "oy")), _S.read(_v13, "INK"), _S.merge([{"font": "big"}, {"scale": _S.read(_v13, "scale")}, {"a": _S.read(_v13, "a")}])])
		_S.invoke(_S.read(_v10, "p"), "text", [_S.read(_v10, "ch"), _S.read(_v10, "lx"), _S.read(_v10, "y"), _S.function_value(_v10, "_f11"), _S.merge([{"font": "big"}, {"scale": _S.read(_v10, "scale")}, {"a": _S.read(_v10, "a")}])])
	_S.write(_e, "x", _S.binary("+", _S.prop(_S.read(_e, "widths"), _S.read(_e, "i")), _S.read(_e, "scale")), "+=", false)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_gx_b0 = _S.arg(_args,0)
	var _n_gy_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,6) if _S.truth((_n_gy_b1 < 4)) else (_S.index_value(_n_C,5) if _S.truth((_n_gy_b1 < 6)) else _S.index_value(_n_C,4)))
	return null
