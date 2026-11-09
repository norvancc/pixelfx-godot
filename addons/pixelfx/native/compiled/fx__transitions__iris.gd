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

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v1 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v1, 0))
	_S.define(_e, "y", _S.prop(_v1, 1))
	return _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "fx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "fy"))])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("+", _S.read(_e, "RS"), _S.binary("*", _S.binary("-", _S.read(_e, "R0"), _S.read(_e, "RS")), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "CLOSE"))])))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLOSE"))) else (_S.binary("+", _S.read(_e, "RS"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLOSE")), 22)]), 0.8), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLOSE")), _S.binary("-", _S.read(_e, "SNAP"), _S.read(_e, "CLOSE")))))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))) else (_S.binary("*", _S.read(_e, "RS"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SNAP")), _S.binary("-", _S.read(_e, "SHUT"), _S.read(_e, "SNAP")))]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHUT"))) else (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))) else _S.binary("*", _S.read(_e, "R0"), _S.invoke(_S.read(_e, "ease"), "outQuart", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), _S.binary("-", _S.read(_e, "OPEN"), _S.read(_e, "POP")))])]))))))

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

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "t")]))
	_S.define(_e, "hot", (_S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "POP"), _S.read(_e, "OPEN"), _S.read(_e, "t")])) if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP"))) else (_S.binary("+", 0.45, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "CLOSE"), 0.2), _S.read(_e, "CLOSE"), _S.read(_e, "t")]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))) else 0.7)))
	_S.define(_e, "rw", _S.binary("+", _S.read(_e, "RW"), (_S.binary("*", 3, _S.read(_e, "hot")) if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP"))) else 0)))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.05)), func(): return _S.unary("!", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHUT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))), func(): return _S.binary("<=", _S.read(_e, "r"), 0))))):
		var _v11 = _S.scope(_e)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "y"), _S.read(_v12, "H"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "dy", _S.binary("-", _S.binary("+", _S.read(_v13, "y"), 0.5), _S.read(_v13, "fy")))
			_S.define(_v13, "xo", _S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.invoke(_S.read(_v13, "Math"), "max", [0, _S.binary("-", _S.binary("**", _S.binary("+", _S.read(_v13, "r"), _S.read(_v13, "rw")), 2), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy")))])]))
			_S.define(_v13, "xi", (_S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_v13, "r"), _S.read(_v13, "r")), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy")))]) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.read(_v13, "dy")]), _S.read(_v13, "r"))) else 0))
			if _S.truth(_S.binary("<=", _S.read(_v13, "xo"), 0)):
				var _v14 = _S.scope(_v13)
				_S.call_value(_S.read(_v14, "rect"), [_S.read(_v14, "p0"), 0, _S.read(_v14, "y"), _S.read(_v14, "W"), 1, _S.read(_v14, "ink")])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "y", 1, "+=", true)
				continue
			_S.define(_v13, "a0", _S.call_value(_S.read(_v13, "clamp"), [_S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("-", _S.read(_v13, "fx"), _S.read(_v13, "xo"))]), 0, _S.read(_v13, "W")]))
			_S.define(_v13, "b1", _S.call_value(_S.read(_v13, "clamp"), [_S.invoke(_S.read(_v13, "Math"), "ceil", [_S.binary("+", _S.read(_v13, "fx"), _S.read(_v13, "xo"))]), 0, _S.read(_v13, "W")]))
			if _S.truth(_S.binary(">", _S.read(_v13, "a0"), 0)):
				_S.call_value(_S.read(_v13, "rect"), [_S.read(_v13, "p0"), 0, _S.read(_v13, "y"), _S.read(_v13, "a0"), 1, _S.read(_v13, "ink")])
			if _S.truth(_S.binary("<", _S.read(_v13, "b1"), _S.read(_v13, "W"))):
				_S.call_value(_S.read(_v13, "rect"), [_S.read(_v13, "p0"), _S.read(_v13, "b1"), _S.read(_v13, "y"), _S.binary("-", _S.read(_v13, "W"), _S.read(_v13, "b1")), 1, _S.read(_v13, "ink")])
			_S.define(_v13, "g", (_S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.invoke(_S.read(_v13, "Math"), "max", [0, _S.binary("-", _S.binary("**", _S.binary("-", _S.read(_v13, "r"), _S.read(_v13, "GLO")), 2), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy")))])]) if _S.truth(_S.binary(">", _S.read(_v13, "r"), _S.read(_v13, "GLO"))) else 0))
			var _v15 = _S.scope(_v13)
			_S.define(_v15, "x", _S.read(_v15, "a0"))
			while _S.truth(_S.binary("<", _S.read(_v15, "x"), _S.read(_v15, "b1"))):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "dx", _S.binary("-", _S.binary("+", _S.read(_v16, "x"), 0.5), _S.read(_v16, "fx")))
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "dx")]), _S.read(_v16, "g"))):
					_v15 = _S.iteration(_v15)
					_S.write(_v15, "x", 1, "+=", true)
					continue
				_S.define(_v16, "d", _S.binary("-", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.read(_v16, "dx"), _S.read(_v16, "dy")]), _S.read(_v16, "r")))
				if _S.truth(_S.binary(">=", _S.read(_v16, "d"), 0)):
					var _v17 = _S.scope(_v16)
					_S.define(_v17, "q", _S.binary("/", _S.read(_v17, "d"), _S.read(_v17, "rw")))
					_S.define(_v17, "lit", _S.binary("-", 0.5, _S.binary("/", _S.binary("*", 0.5, _S.binary("+", _S.binary("*", _S.read(_v17, "dx"), 0.7), _S.binary("*", _S.read(_v17, "dy"), 0.7))), _S.binary("+", _S.binary("+", _S.read(_v17, "r"), _S.read(_v17, "d")), 0.01))))
					_S.define(_v17, "h", _S.binary("*", _S.read(_v17, "hot"), _S.binary("+", 0.55, _S.binary("*", 0.6, _S.read(_v17, "lit")))))
					_S.invoke(_S.read(_v17, "p0"), "px", [_S.read(_v17, "x"), _S.read(_v17, "y"), (_S.read(_v17, "ink") if _S.truth(_S.binary(">=", _S.read(_v17, "q"), 1)) else ((_S.read(_v17, "WHITE") if _S.truth(_S.binary(">", _S.read(_v17, "h"), 0.5)) else (_S.prop(_S.read(_v17, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v17, "h"), 0.3)) else _S.prop(_S.read(_v17, "C"), 5))) if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.2)) else ((_S.prop(_S.read(_v17, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v17, "h"), 0.38)) else _S.prop(_S.read(_v17, "C"), 5)) if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.4)) else ((_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v17, "h"), 0.3)) else _S.prop(_S.read(_v17, "C"), 4)) if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.65)) else (_S.prop(_S.read(_v17, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.85)) else _S.prop(_S.read(_v17, "C"), 2))))))])
					if _S.truth(_S.binary("<", _S.read(_v17, "q"), 0.5)):
						_S.invoke(_S.read(_v17, "p0"), "light", [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.prop(_S.read(_v17, "C"), 5), _S.binary("*", _S.binary("*", 0.45, _S.read(_v17, "h")), _S.binary("-", 1, _S.binary("*", _S.read(_v17, "q"), 2)))])
				else:
					if _S.truth(_S.binary(">", _S.read(_v16, "d"), _S.unary("-", _S.read(_v16, "GLO")))):
						_S.invoke(_S.read(_v16, "p0"), "light", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "C"), 5), _S.binary("*", _S.binary("+", 0.18, _S.binary("*", 0.3, _S.read(_v16, "hot"))), _S.binary("**", _S.binary("+", 1, _S.binary("/", _S.read(_v16, "d"), _S.read(_v16, "GLO"))), 2))])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "y", 1, "+=", true)
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SHUT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP")))):
			_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p0"), 0, 0, _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "ink")])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "r"), 0), func(): return _S.binary("<", _S.read(_e, "r"), 80)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHUT")))):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "k", _S.binary("-", 1, _S.binary("/", _S.read(_v18, "r"), 80)))
		_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "fx"), _S.read(_v18, "fy"), _S.binary("+", _S.binary("*", _S.read(_v18, "r"), 1.15), 6), _S.prop(_S.read(_v18, "C"), 5), _S.binary("+", 0.18, _S.binary("*", 0.32, _S.read(_v18, "k")))])
		_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "fx"), _S.read(_v18, "fy"), _S.binary("+", _S.binary("*", _S.read(_v18, "r"), 0.6), 3), _S.prop(_S.read(_v18, "C"), 6), _S.binary("*", 0.25, _S.read(_v18, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.08), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP")))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "a", _S.binary("+", _S.unary("-", 2.4), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v19, "t"), 0.08), _S.binary("-", _S.read(_v19, "SNAP"), 0.08)), _S.read(_v19, "TAU"))))
		_S.define(_v19, "gx", _S.binary("+", _S.read(_v19, "fx"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.binary("+", _S.read(_v19, "r"), 1))))
		_S.define(_v19, "gy", _S.binary("+", _S.read(_v19, "fy"), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.binary("+", _S.read(_v19, "r"), 1))))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v19, "gx"), 2), func(): return _S.binary(">", _S.read(_v19, "gy"), 2)), func(): return _S.binary("<", _S.read(_v19, "gx"), _S.binary("-", _S.read(_v19, "W"), 2))), func(): return _S.binary("<", _S.read(_v19, "gy"), _S.binary("-", _S.read(_v19, "H"), 2)))):
			_S.call_value(_S.read(_v19, "glint"), [_S.read(_v19, "p"), _S.read(_v19, "gx"), _S.read(_v19, "gy"), _S.binary("+", 7, _S.binary("*", 3, _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.read(_v19, "t"), 9)]))), _S.binary("*", _S.read(_v19, "t"), 3), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 5), 0.9])
	_S.define(_e, "s", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SHUT")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "s"), _S.unary("-", 0.06)), func(): return _S.binary("<", _S.read(_e, "s"), 0.22))):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "fx"), _S.read(_e, "fy"), _S.binary("*", 14, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "s"), 0.01)]), 0.23))), _S.binary("*", _S.read(_e, "s"), 4), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.18))):
		_S.last([_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "fx"), _S.read(_e, "fy"), _S.binary("*", 20, _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.18))), _S.binary("-", 0.4, _S.binary("*", _S.read(_e, "u"), 3)), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]), _S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "fx"), _S.read(_e, "fy"), 60, _S.read(_e, "WHITE"), _S.binary("*", 0.6, _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.18)))])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
