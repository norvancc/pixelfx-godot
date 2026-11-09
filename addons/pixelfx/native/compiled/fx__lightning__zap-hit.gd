@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/zap-hit.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "fern", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Zap hit"}, {"desc": "A contact zap: an arc snaps in from the left, the hit point overloads into a knot of tiny crackling zigzags, a fern of burn marks glows outward, sparks jink away, ozone puffs."}, {"tags": ["lightning", "electric", "hit", "impact", "combat", "directional", "one-shot"]}, {"size": [144, 112]}, {"origin": [76, 56]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SNAP", 0.05)
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#6a6680"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	_S.define(_e, "grow", _S.function_value(_e, "_f1"))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 6)):
		_S.call_value(_S.read(_v3, "grow"), [0, 0, _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v3, "i"), 6), _S.read(_v3, "TAU")), _S.invoke(_S.read(_v3, "R"), "range", [_S.unary("-", 0.35), 0.35])), _S.invoke(_S.read(_v3, "R"), "range", [18, 32]), 1, 0, 0])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "d", _S.arg(_args, 5))
	_S.define(_e, "depth", _S.arg(_args, 6))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "d")]])
	_S.define(_e, "side", _S.invoke(_S.read(_e, "R"), "sign", []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "s"), _S.read(_v0, "len"))):
		var _v1 = _S.scope(_v0)
		_S.write(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.3), 0.3]), "+=", false)
		_S.write(_v1, "x", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), 1.4), "+=", false)
		_S.write(_v1, "y", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), 1.4), "+=", false)
		_S.write(_v1, "d", 1.4, "+=", false)
		_S.invoke(_S.read(_v1, "pts"), "push", [[_S.read(_v1, "x"), _S.read(_v1, "y"), _S.read(_v1, "d")]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v1, "depth"), 2), func(): return _S.binary(">", _S.read(_v1, "s"), 2)), func(): return _S.invoke(_S.read(_v1, "R"), "chance", [0.24]))):
			var _v2 = _S.scope(_v1)
			_S.write(_v2, "side", _S.unary("-", _S.read(_v2, "side")), "=", false)
			_S.call_value(_S.read(_v2, "grow"), [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.binary("+", _S.read(_v2, "a"), _S.binary("*", _S.read(_v2, "side"), _S.invoke(_S.read(_v2, "R"), "range", [0.55, 1.05]))), _S.binary("*", _S.binary("-", _S.read(_v2, "len"), _S.read(_v2, "s")), _S.invoke(_S.read(_v2, "R"), "range", [0.3, 0.55])), _S.binary("*", _S.read(_v2, "w"), 0.6), _S.read(_v2, "d"), _S.binary("+", _S.read(_v2, "depth"), 1)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "s", 1.4, "+=", false)
	_S.invoke(_S.read(_e, "out"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": _S.read(_e, "w")}])])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "tree", _S.call_value(_S.read(_e, "fern"), [_S.read(_e, "R")]))
	_S.define(_e, "Y0", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 14), 6]))
	_S.define(_e, "kinked", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 16}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"drawBack": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1.2), 1.2]), (0 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.7])) else _S.prop(_S.read(_e, "Math"), "PI"))))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "R"), "range", [130, 250]))
	return _S.merge([{"x": 0}, {"y": 0}, {"vx": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "sp")), 40)}, {"life": _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.36])}, {"age": _S.unary("-", _S.read(_e, "SNAP"))}, {"next": _S.invoke(_S.read(_e, "R"), "range", [0.02, 0.05])}, {"trail": []}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "hit", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 60, _S.prop(_S.read(_v4, "C"), 4), 0.7, 0.3])
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 14, _S.read(_v4, "WHITE"), 0.5, 0.07])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 3)):
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SMOKE"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 3), 5]), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 4), 2]), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 5), 8]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [8, 16])), _S.invoke(_S.read(_v5, "R"), "range", [0.55, 0.75]), _S.call_value(_S.read(_v5, "mix"), [_S.read(_v5, "ASH"), _S.prop(_S.read(_v5, "C"), 4), 0.3]), _S.invoke(_S.read(_v5, "R"), "range", [2.5, 3.8]), _S.invoke(_S.read(_v5, "R"), "range", [0.08, 0.16])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	for _v6 in _S.array(_S.read(_e, "kinked")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _v6)
		var _v8 = _S.scope(_v7)
		if _S.truth(_S.logical("||", _S.binary("<", _S.set_prop(_S.read(_v8, "s"), "age", _S.read(_v8, "dt"), "+=", false), 0), func(): return _S.binary(">=", _S.prop(_S.read(_v8, "s"), "age"), _S.prop(_S.read(_v8, "s"), "life")))):
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v8, "s"), "next", _S.read(_v8, "dt"), "-=", false), 0)):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "s"), "next", _S.invoke(_S.read(_v9, "R"), "range", [0.025, 0.055]), "=", false)
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "Math"), "hypot", [_S.prop(_S.read(_v9, "s"), "vx"), _S.prop(_S.read(_v9, "s"), "vy")]))
			_S.define(_v9, "a", _S.binary("+", _S.invoke(_S.read(_v9, "Math"), "atan2", [_S.prop(_S.read(_v9, "s"), "vy"), _S.prop(_S.read(_v9, "s"), "vx")]), _S.binary("*", _S.invoke(_S.read(_v9, "R"), "sign", []), _S.invoke(_S.read(_v9, "R"), "range", [0.6, 1.3]))))
			_S.set_prop(_S.read(_v9, "s"), "vx", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), "=", false)
			_S.set_prop(_S.read(_v9, "s"), "vy", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp")), "=", false)
			_S.invoke(_S.prop(_S.read(_v9, "s"), "trail"), "push", [[_S.prop(_S.read(_v9, "s"), "x"), _S.prop(_S.read(_v9, "s"), "y")]])
			if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v9, "s"), "trail"), "length"), 4)):
				_S.invoke(_S.prop(_S.read(_v9, "s"), "trail"), "shift", [])
		_S.set_prop(_S.read(_v8, "s"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vx"), 3), _S.read(_v8, "dt")), "-=", false)
		_S.set_prop(_S.read(_v8, "s"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vy"), 3), _S.read(_v8, "dt")), _S.binary("*", 140, _S.read(_v8, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v8, "s"), "x", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vx"), _S.read(_v8, "dt")), "+=", false)
		_S.set_prop(_S.read(_v8, "s"), "y", _S.binary("*", _S.prop(_S.read(_v8, "s"), "vy"), _S.read(_v8, "dt")), "+=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))):
		return null
	_S.define(_e, "cool", _S.call_value(_S.read(_e, "smooth"), [0.45, 0.85, _S.read(_e, "t")]))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [0.78, 0.88, _S.read(_e, "t")])))
	for _v10 in _S.array(_S.read(_e, "tree")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "br", _v10)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.prop(_S.prop(_S.read(_v12, "br"), "pts"), "length"))):
			var _v13 = _S.scope(_v12)
			var _v14 = _S.prop(_S.prop(_S.read(_v13, "br"), "pts"), _S.binary("-", _S.read(_v13, "i"), 1))
			_S.define(_v13, "x0", _S.prop(_v14, 0))
			_S.define(_v13, "y0", _S.prop(_v14, 1))
			var _v15 = _S.prop(_S.prop(_S.read(_v13, "br"), "pts"), _S.read(_v13, "i"))
			_S.define(_v13, "x", _S.prop(_v15, 0))
			_S.define(_v13, "y", _S.prop(_v15, 1))
			_S.define(_v13, "d", _S.prop(_v15, 2))
			_S.define(_v13, "age", _S.binary("-", _S.binary("-", _S.read(_v13, "t"), _S.read(_v13, "SNAP")), _S.binary("/", _S.read(_v13, "d"), 260)))
			if _S.truth(_S.binary("<", _S.read(_v13, "age"), 0)):
				break
			_S.define(_v13, "k", _S.binary("-", _S.invoke(_S.read(_v13, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_v13, "age")), 0.22)]), _S.binary("*", _S.read(_v13, "cool"), 0.3)))
			_S.define(_v13, "c", (_S.read(_v13, "WHITE") if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.75)) else (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.45)) else (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.25)) else (_S.prop(_S.read(_v13, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.1)) else (_S.prop(_S.read(_v13, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v13, "k"), _S.unary("-", 0.05))) else _S.prop(_S.read(_v13, "C"), 1)))))))
			_S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x0"), _S.read(_v13, "y0"), _S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "c"), _S.read(_v13, "fade")])
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v13, "br"), "w"), 1), func(): return _S.binary("<", _S.read(_v13, "d"), 9))):
				_S.invoke(_S.read(_v13, "p"), "line", [_S.binary("+", _S.read(_v13, "x0"), 1), _S.read(_v13, "y0"), _S.binary("+", _S.read(_v13, "x"), 1), _S.read(_v13, "y"), (_S.prop(_S.read(_v13, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v13, "k"), 0.45)) else _S.prop(_S.read(_v13, "C"), 2)), _S.read(_v13, "fade")])
			if _S.truth(_S.logical("&&", _S.binary("===", _S.binary("&", _S.read(_v13, "i"), 3), 0), func(): return _S.binary(">", _S.read(_v13, "k"), 0))):
				_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x"), _S.read(_v13, "y"), 5, _S.prop(_S.read(_v13, "C"), 5), _S.binary("*", _S.binary("*", 0.35, _S.read(_v13, "k")), _S.read(_v13, "fade"))])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.0001)]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.32)):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "r", _S.call_value(_S.read(_v16, "rng"), [_S.prop(_S.read(_v16, "o"), "seed"), 2, _S.read(_v16, "f")]))
		_S.define(_v16, "b", _S.call_value(_S.read(_v16, "zigzag"), [_S.read(_v16, "r"), _S.unary("-", 66), _S.read(_v16, "Y0"), 0, 0, 0.22, 0.35]))
		_S.define(_v16, "u", _S.call_value(_S.read(_v16, "clamp"), [_S.binary("/", _S.read(_v16, "t"), _S.read(_v16, "SNAP"))]))
		_S.define(_v16, "k", (1 if _S.truth(_S.binary("<", _S.read(_v16, "t"), _S.read(_v16, "SNAP"))) else ((0.7 if _S.truth(_S.binary("%", _S.read(_v16, "f"), 2)) else 1) if _S.truth(_S.binary("<", _S.read(_v16, "t"), 0.2)) else _S.binary("*", 0.55, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v16, "t"), 0.2), 0.12))))))
		_S.call_value(_S.read(_v16, "stroke"), [_S.read(_v16, "p"), (_S.merge([{"paths": [_S.prop(_S.prop(_S.read(_v16, "b"), "paths"), 0)]}]) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 1)) else _S.read(_v16, "b")), _S.read(_v16, "k"), _S.read(_v16, "C"), (0.95 if _S.truth(_S.binary("<", _S.read(_v16, "t"), _S.binary("+", _S.read(_v16, "SNAP"), 0.034))) else 0.7), _S.merge([{"upTo": _S.read(_v16, "u")}, {"hero": _S.logical("&&", _S.binary(">=", _S.read(_v16, "t"), _S.read(_v16, "SNAP")), func(): return _S.binary("<", _S.read(_v16, "t"), _S.binary("+", _S.read(_v16, "SNAP"), 0.034)))}])])
		if _S.truth(_S.binary("<", _S.read(_v16, "u"), 1)):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "tp", _S.prop(_S.prop(_S.prop(_S.read(_v17, "b"), "paths"), 0), "pts"))
			var _v18 = _S.prop(_S.read(_v17, "tp"), _S.invoke(_S.read(_v17, "Math"), "floor", [_S.binary("*", _S.read(_v17, "u"), _S.binary("-", _S.prop(_S.read(_v17, "tp"), "length"), 1))]))
			_S.define(_v17, "hx", _S.prop(_v18, 0))
			_S.define(_v17, "hy", _S.prop(_v18, 1))
			_S.invoke(_S.read(_v17, "p"), "circle", [_S.read(_v17, "hx"), _S.read(_v17, "hy"), 2, _S.read(_v17, "WHITE")])
			_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "hx"), _S.read(_v17, "hy"), 14, _S.prop(_S.read(_v17, "C"), 5), 0.6])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")), func(): return _S.binary("<", _S.read(_e, "t"), 0.45))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "a", _S.binary("/", _S.binary("-", _S.read(_v19, "t"), _S.read(_v19, "SNAP")), 0.4))
		_S.define(_v19, "r", _S.call_value(_S.read(_v19, "rng"), [_S.prop(_S.read(_v19, "o"), "seed"), 5, _S.read(_v19, "f")]))
		_S.define(_v19, "R0", _S.binary("*", 8, _S.binary("-", 1, _S.binary("*", _S.read(_v19, "a"), 0.6))))
		_S.define(_v19, "m", _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("*", 11, _S.binary("-", 1, _S.binary("*", _S.read(_v19, "a"), 0.5)))]))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "m"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "ang", _S.invoke(_S.read(_v21, "r"), "range", [0, _S.read(_v21, "TAU")]))
			_S.define(_v21, "d0", _S.invoke(_S.read(_v21, "r"), "range", [0.5, _S.binary("*", _S.read(_v21, "R0"), 0.5)]))
			_S.define(_v21, "ang2", _S.binary("+", _S.read(_v21, "ang"), _S.invoke(_S.read(_v21, "r"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v21, "d1", _S.invoke(_S.read(_v21, "r"), "range", [_S.binary("*", _S.read(_v21, "R0"), 0.55), _S.read(_v21, "R0")]))
			_S.call_value(_S.read(_v21, "crackle"), [_S.read(_v21, "p"), _S.call_value(_S.read(_v21, "zigzag"), [_S.read(_v21, "r"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "ang")]), _S.read(_v21, "d0")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "ang")]), _S.read(_v21, "d0")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "ang2")]), _S.read(_v21, "d1")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "ang2")]), _S.read(_v21, "d1")), 0.5, 0]), _S.binary("+", _S.binary("*", 0.75, _S.binary("-", 1, _S.read(_v21, "a"))), 0.25), _S.read(_v21, "C"), 0.25])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		_S.invoke(_S.read(_v19, "p"), "circle", [0, 0, _S.binary("+", _S.binary("*", 3, _S.binary("-", 1, _S.read(_v19, "a"))), 1), _S.prop(_S.read(_v19, "C"), 5)])
		_S.invoke(_S.read(_v19, "p"), "circle", [0, 0, _S.binary("+", _S.binary("*", 2, _S.binary("-", 1, _S.read(_v19, "a"))), 0.5), _S.read(_v19, "WHITE")])
		_S.invoke(_S.read(_v19, "p"), "glow", [0, 0, 20, _S.prop(_S.read(_v19, "C"), 4), _S.binary("*", 0.55, _S.binary("-", 1, _S.read(_v19, "a")))])
		if _S.truth(_S.binary("<", _S.read(_v19, "t"), _S.binary("+", _S.read(_v19, "SNAP"), 0.07))):
			_S.invoke(_S.read(_v19, "p"), "glow", [0, 0, 9, _S.read(_v19, "WHITE"), 0.4])
	for _v22 in _S.array(_S.read(_e, "kinked")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "s", _v22)
		var _v24 = _S.scope(_v23)
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v24, "s"), "age"), 0), func(): return _S.binary(">=", _S.prop(_S.read(_v24, "s"), "age"), _S.prop(_S.read(_v24, "s"), "life")))):
			continue
		_S.define(_v24, "k", _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v24, "s"), "age"), _S.prop(_S.read(_v24, "s"), "life"))))
		_S.define(_v24, "path", _S.concat([_S.array(_S.prop(_S.read(_v24, "s"), "trail")), [[_S.prop(_S.read(_v24, "s"), "x"), _S.prop(_S.read(_v24, "s"), "y")]]]))
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), _S.binary("-", _S.prop(_S.read(_v25, "path"), "length"), 1))):
			_S.invoke(_S.read(_v25, "p"), "line", [_S.prop(_S.prop(_S.read(_v25, "path"), _S.read(_v25, "i")), 0), _S.prop(_S.prop(_S.read(_v25, "path"), _S.read(_v25, "i")), 1), _S.prop(_S.prop(_S.read(_v25, "path"), _S.binary("+", _S.read(_v25, "i"), 1)), 0), _S.prop(_S.prop(_S.read(_v25, "path"), _S.binary("+", _S.read(_v25, "i"), 1)), 1), ((_S.read(_v25, "WHITE") if _S.truth(_S.binary(">", _S.read(_v25, "k"), 0.5)) else _S.prop(_S.read(_v25, "C"), 6)) if _S.truth(_S.binary("===", _S.read(_v25, "i"), _S.binary("-", _S.prop(_S.read(_v25, "path"), "length"), 2))) else (_S.prop(_S.read(_v25, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v25, "k"), 0.5)) else _S.prop(_S.read(_v25, "C"), 4))), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.binary("/", _S.read(_v25, "i"), _S.prop(_S.read(_v25, "path"), "length"))))])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		_S.invoke(_S.read(_v24, "p"), "px", [_S.prop(_S.read(_v24, "s"), "x"), _S.prop(_S.read(_v24, "s"), "y"), (_S.read(_v24, "WHITE") if _S.truth(_S.binary(">", _S.read(_v24, "k"), 0.4)) else _S.prop(_S.read(_v24, "C"), 5))])
		_S.invoke(_S.read(_v24, "p"), "glow", [_S.prop(_S.read(_v24, "s"), "x"), _S.prop(_S.read(_v24, "s"), "y"), 4, _S.prop(_S.read(_v24, "C"), 5), _S.binary("*", 0.4, _S.read(_v24, "k"))])
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP"))):
		_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("*", 40, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.85))])), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SNAP"))), 5)])), (0.7 if _S.truth(_S.binary("%", _S.read(_e, "f"), 2)) else 1))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
