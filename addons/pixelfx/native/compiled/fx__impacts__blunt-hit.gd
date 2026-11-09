@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/blunt-hit.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "stone", _S.import_value("fx/impacts/_lib.js", "stone"))
	_S.define(_e, "rock", _S.import_value("fx/impacts/_lib.js", "rock"))
	_S.define(_e, "rockShape", _S.import_value("fx/impacts/_lib.js", "rockShape"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Blunt hit"}, {"desc": "A heavy, soft thud: a white-hot lumpy blob cools to cream in a warm pool of light, inked wedges jab out and snap back, a squashed ring of dust puffs swells and drifts, clods drop."}, {"tags": ["impact", "hit", "blunt", "punch", "club", "thump", "dust", "comic", "one-shot"]}, {"size": [128, 88]}, {"origin": [64, 72]}, {"duration": 0.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1d1620", "#4a3a3c", "#7d6a66", "#b09c90", "#dccab4", "#f6ead2", "#ffffff"]}, {"warm": "#ffc98a"}, {"dust": "#b7a8a6"}, {"clod": "#6e5a5a"}, {"height": 22}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "lump", _S.function_value(_e, "_f10"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "X", 0)
	_S.define(_e, "Y", _S.unary("-", _S.prop(_S.read(_e, "o"), "height")))
	_S.define(_e, "PH", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "WARM", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "warm")]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "dust")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "clod")]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 48, _S.read(_e, "WARM"), 0.6, 0.4])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.read(_e, "Y"), 16, _S.read(_e, "WHITE"), 0.6, 0.07])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "X"), _S.unary("-", 2), 36, _S.read(_e, "WARM"), 0.25, 0.4])
	_S.define(_e, "wedges", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "puffs", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 30}]), _S.function_value(_e, "_f3")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 5)):
		_S.invoke(_S.read(_v0, "puffs"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v0, "X"), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 6), 6]))}, {"y": _S.binary("-", _S.read(_v0, "Y"), _S.invoke(_S.read(_v0, "R"), "range", [3, 6]))}, {"vx": _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 30), 30])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [20, 45]))}, {"r": _S.invoke(_S.read(_v0, "R"), "range", [3.5, 5.5])}, {"life": _S.invoke(_S.read(_v0, "R"), "range", [0.6, 0.85])}, {"max": 0}, {"t0": _S.invoke(_S.read(_v0, "R"), "range", [0.05, 0.1])}, {"lift": _S.invoke(_S.read(_v0, "R"), "range", [14, 24])}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	for _v1 in _S.array(_S.read(_e, "puffs")):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "q", _v1)
		_S.set_prop(_S.read(_v2, "q"), "max", _S.prop(_S.read(_v2, "q"), "life"), "=", false)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 5)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "s", _S.invoke(_S.read(_v4, "R"), "sign", []))
		_S.define(_v4, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v4, "Math"), "PI")), 2), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 1.3]))))
		_S.define(_v4, "v", _S.invoke(_S.read(_v4, "R"), "range", [70, 140]))
		_S.invoke(_S.read(_v4, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v4, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v4, "X"), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [4, 8])))}, {"y": _S.binary("+", _S.read(_v4, "Y"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 3), 3]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "v"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "v"))}, {"g": 1}, {"drag": 0.6}, {"bounce": 0.28}, {"life": _S.invoke(_S.read(_v4, "R"), "range", [0.65, 0.85])}, {"a": _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")])}, {"va": _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [8, 16]))}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.4])) else 1)}, {"pts": _S.call_value(_S.read(_v4, "rockShape"), [_S.read(_v4, "R")])}, {"pvy": 0}])])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.define(_e, "kicks", [])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 9), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.2), 0.2]))}, {"len": _S.invoke(_S.read(_e, "R"), "range", [6, 15])}, {"w": _S.invoke(_S.read(_e, "R"), "range", [3.2, 5])}, {"r0": _S.invoke(_S.read(_e, "R"), "range", [13, 16])}, {"t0": _S.invoke(_S.read(_e, "R"), "range", [0.015, 0.04])}, {"out": _S.invoke(_S.read(_e, "R"), "range", [0.04, 0.06])}, {"back": _S.invoke(_S.read(_e, "R"), "range", [0.09, 0.14])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 30), _S.read(_e, "TAU")), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.12), 0.12])))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])]))
	_S.define(_e, "v", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [40, 140]), _S.binary("+", 0.6, _S.binary("*", 0.5, _S.read(_e, "side")))))
	return _S.merge([{"x": _S.binary("+", _S.read(_e, "X"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 9))}, {"y": _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 6))}, {"vx": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "v"))}, {"vy": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "v")), 0.5)}, {"r": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [2.4, 6.2]), _S.binary("+", 0.75, _S.binary("*", 0.35, _S.read(_e, "side"))))}, {"life": _S.invoke(_S.read(_e, "R"), "range", [0.35, 0.85])}, {"max": 0}, {"t0": _S.invoke(_S.read(_e, "R"), "range", [0.03, 0.1])}, {"lift": _S.invoke(_S.read(_e, "R"), "range", [4, 16])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v5 in _S.array(_S.read(_e, "puffs")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "q", _v5)
		var _v7 = _S.scope(_v6)
		if _S.truth(_S.binary("<", _S.read(_v7, "t"), _S.prop(_S.read(_v7, "q"), "t0"))):
			continue
		_S.set_prop(_S.read(_v7, "q"), "life", _S.read(_v7, "dt"), "-=", false)
		_S.set_prop(_S.read(_v7, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vx"), 4.5), _S.read(_v7, "dt")), "-=", false)
		_S.set_prop(_S.read(_v7, "q"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vy"), 4.5), _S.read(_v7, "dt")), _S.binary("*", _S.logical("??", _S.prop(_S.read(_v7, "q"), "lift"), func(): return 6), _S.read(_v7, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v7, "q"), "x", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vx"), _S.read(_v7, "dt")), "+=", false)
		_S.set_prop(_S.read(_v7, "q"), "y", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vy"), _S.read(_v7, "dt")), "+=", false)
	for _v8 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "b", _v8)
		_S.set_prop(_S.read(_v9, "b"), "pvy", _S.prop(_S.read(_v9, "b"), "vy"), "=", false)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v10 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "b", _v10)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v11, "b"), "pvy"), 60), func(): return _S.binary("<=", _S.prop(_S.read(_v11, "b"), "vy"), 0))):
			var _v12 = _S.scope(_v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "i"), 2)):
				_S.invoke(_S.read(_v13, "kicks"), "push", [_S.merge([{"x": _S.prop(_S.read(_v13, "b"), "x")}, {"y": _S.unary("-", 1)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v13, "R"), "sign", []), _S.invoke(_S.read(_v13, "R"), "range", [8, 22]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [3, 10]))}, {"r": _S.invoke(_S.read(_v13, "R"), "range", [1.2, 2])}, {"life": 0.4}, {"max": 0.4}, {"t0": 0}])])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "i", 1, "+=", true)
			_S.set_prop(_S.read(_v12, "b"), "pvy", 0, "=", false)
	for _v14 in _S.array(_S.read(_e, "kicks")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "q", _v14)
		var _v16 = _S.scope(_v15)
		_S.set_prop(_S.read(_v16, "q"), "life", _S.read(_v16, "dt"), "-=", false)
		_S.set_prop(_S.read(_v16, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vx"), 4), _S.read(_v16, "dt")), "-=", false)
		_S.set_prop(_S.read(_v16, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vy"), 4), _S.read(_v16, "dt")), "-=", false)
		_S.set_prop(_S.read(_v16, "q"), "x", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vx"), _S.read(_v16, "dt")), "+=", false)
		_S.set_prop(_S.read(_v16, "q"), "y", _S.binary("*", _S.prop(_S.read(_v16, "q"), "vy"), _S.read(_v16, "dt")), "+=", false)
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v17 in _S.array(_S.concat([_S.array(_S.read(_e, "puffs")), _S.array(_S.read(_e, "kicks"))])):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "q", _v17)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "k", _S.binary("/", _S.prop(_S.read(_v19, "q"), "life"), _S.prop(_S.read(_v19, "q"), "max")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v19, "t"), _S.prop(_S.read(_v19, "q"), "t0")), func(): return _S.binary("<=", _S.read(_v19, "k"), 0))):
			continue
		_S.define(_v19, "r", _S.binary("*", _S.prop(_S.read(_v19, "q"), "r"), _S.binary("+", 0.7, _S.binary("*", _S.binary("-", 1, _S.read(_v19, "k")), 0.85))))
		_S.define(_v19, "a", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "pow", [_S.read(_v19, "k"), 1.25]), _S.invoke(_S.read(_v19, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_v19, "t"), _S.prop(_S.read(_v19, "q"), "t0")), 0.03)])))
		_S.define(_v19, "c", _S.call_value(_S.read(_v19, "mix"), [_S.read(_v19, "DUST"), _S.read(_v19, "WARM"), _S.binary("*", _S.call_value(_S.read(_v19, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v19, "t"), 0.03), 0.25))]), 0.55)]))
		_S.invoke(_S.read(_v19, "p"), "disc", [_S.prop(_S.read(_v19, "q"), "x"), _S.prop(_S.read(_v19, "q"), "y"), _S.read(_v19, "r"), _S.read(_v19, "c"), _S.function_value(_v19, "_f6")])
		_S.invoke(_S.read(_v19, "p"), "disc", [_S.binary("-", _S.prop(_S.read(_v19, "q"), "x"), _S.binary("*", _S.read(_v19, "r"), 0.22)), _S.binary("-", _S.prop(_S.read(_v19, "q"), "y"), _S.binary("*", _S.read(_v19, "r"), 0.32)), _S.binary("*", _S.read(_v19, "r"), 0.58), _S.call_value(_S.read(_v19, "mix"), [_S.read(_v19, "c"), _S.read(_v19, "WHITE"), 0.55]), _S.function_value(_v19, "_f7")])
	for _v20 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "b", _v20)
		_S.call_value(_S.read(_v21, "rock"), [_S.read(_v21, "p"), _S.read(_v21, "b"), _S.read(_v21, "st")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.058)):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "f", (0 if _S.truth(_S.binary("<", _S.read(_v22, "t"), 0.025)) else 1))
		_S.define(_v22, "R0", (13.5 if _S.truth(_S.read(_v22, "f")) else 11.5))
		_S.invoke(_S.read(_v22, "p"), "shade", [_S.binary("-", _S.read(_v22, "X"), _S.binary("*", _S.read(_v22, "R0"), 1.4)), _S.binary("-", _S.read(_v22, "Y"), _S.binary("*", _S.read(_v22, "R0"), 1.4)), _S.binary("+", _S.read(_v22, "X"), _S.binary("*", _S.read(_v22, "R0"), 1.4)), _S.binary("+", _S.read(_v22, "Y"), _S.binary("*", _S.read(_v22, "R0"), 1.4)), _S.function_value(_v22, "_f8")])
	for _v23 in _S.array(_S.read(_e, "wedges")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "w", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "u", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "w"), "t0")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v25, "u"), 0), func(): return _S.binary(">", _S.read(_v25, "u"), _S.binary("+", _S.prop(_S.read(_v25, "w"), "out"), _S.prop(_S.read(_v25, "w"), "back"))))):
			continue
		_S.define(_v25, "s", (_S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.binary("/", _S.read(_v25, "u"), _S.prop(_S.read(_v25, "w"), "out"))]) if _S.truth(_S.binary("<", _S.read(_v25, "u"), _S.prop(_S.read(_v25, "w"), "out"))) else _S.binary("-", 1, _S.invoke(_S.read(_v25, "ease"), "inQuad", [_S.binary("/", _S.binary("-", _S.read(_v25, "u"), _S.prop(_S.read(_v25, "w"), "out")), _S.prop(_S.read(_v25, "w"), "back"))]))))
		_S.define(_v25, "L", _S.binary("*", _S.prop(_S.read(_v25, "w"), "len"), _S.read(_v25, "s")))
		if _S.truth(_S.binary("<", _S.read(_v25, "L"), 1.5)):
			continue
		_S.define(_v25, "ca", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.prop(_S.read(_v25, "w"), "a")]))
		_S.define(_v25, "sa", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.prop(_S.read(_v25, "w"), "a")]))
		_S.define(_v25, "r0", _S.binary("+", _S.prop(_S.read(_v25, "w"), "r0"), _S.binary("*", 2, _S.read(_v25, "s"))))
		_S.define(_v25, "hw", _S.binary("/", _S.binary("*", _S.prop(_S.read(_v25, "w"), "w"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v25, "s")))), 2))
		_S.define(_v25, "tip", [_S.binary("+", _S.read(_v25, "X"), _S.binary("*", _S.read(_v25, "ca"), _S.read(_v25, "r0"))), _S.binary("+", _S.read(_v25, "Y"), _S.binary("*", _S.read(_v25, "sa"), _S.read(_v25, "r0")))])
		_S.define(_v25, "end", [_S.binary("+", _S.read(_v25, "X"), _S.binary("*", _S.read(_v25, "ca"), _S.binary("+", _S.read(_v25, "r0"), _S.read(_v25, "L")))), _S.binary("+", _S.read(_v25, "Y"), _S.binary("*", _S.read(_v25, "sa"), _S.binary("+", _S.read(_v25, "r0"), _S.read(_v25, "L"))))])
		_S.define(_v25, "n", [_S.binary("*", _S.unary("-", _S.read(_v25, "sa")), _S.read(_v25, "hw")), _S.binary("*", _S.read(_v25, "ca"), _S.read(_v25, "hw"))])
		_S.define(_v25, "wedge", _S.function_value(_v25, "_f9"))
		_S.invoke(_S.read(_v25, "p"), "poly", [_S.call_value(_S.read(_v25, "wedge"), [1]), _S.prop(_S.read(_v25, "C"), 1)])
		_S.invoke(_S.read(_v25, "p"), "poly", [_S.call_value(_S.read(_v25, "wedge"), [0]), (_S.read(_v25, "WHITE") if _S.truth(_S.binary("<", _S.read(_v25, "u"), _S.binary("+", _S.prop(_S.read(_v25, "w"), "out"), 0.02))) else _S.prop(_S.read(_v25, "C"), 5))])
	_S.define(_e, "pop", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.06)]))
	if _S.truth(_S.binary(">", _S.read(_e, "pop"), 0.02)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "X"), _S.read(_e, "Y"), 28, _S.read(_e, "WARM"), _S.binary("*", 0.5, _S.read(_e, "pop"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", 0.58, _S.read(_e, "a")), _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d")), 0.75)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", 0.48, _S.read(_e, "a")), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "X")))
	_S.define(_e, "dy", _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")), (1.25 if _S.truth(_S.read(_e, "f")) else 1.1)))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "ro", _S.call_value(_S.read(_e, "lump"), [_S.read(_e, "R0"), _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]), _S.binary("+", _S.read(_e, "PH"), _S.binary("*", _S.read(_e, "f"), 0.6))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "ro"))):
		return null
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "ro")))
	return ((_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.55)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.86)) else _S.prop(_S.read(_e, "C"), 4))) if _S.truth(_S.binary("===", _S.read(_e, "f"), 0)) else (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.3)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.72)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.9)) else _S.prop(_S.read(_e, "C"), 3)))))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return [[_S.binary("-", _S.prop(_S.read(_e, "tip"), 0), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "g"))), _S.binary("-", _S.prop(_S.read(_e, "tip"), 1), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "g")))], [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "end"), 0), _S.binary("*", _S.prop(_S.read(_e, "n"), 0), _S.binary("+", 1, _S.binary("*", _S.read(_e, "g"), 0.45)))), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "g"))), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "end"), 1), _S.binary("*", _S.prop(_S.read(_e, "n"), 1), _S.binary("+", 1, _S.binary("*", _S.read(_e, "g"), 0.45)))), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "g")))], [_S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "end"), 0), _S.binary("*", _S.prop(_S.read(_e, "n"), 0), _S.binary("+", 1, _S.binary("*", _S.read(_e, "g"), 0.45)))), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "g"))), _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "end"), 1), _S.binary("*", _S.prop(_S.read(_e, "n"), 1), _S.binary("+", 1, _S.binary("*", _S.read(_e, "g"), 0.45)))), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "g")))]]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	return _S.binary("*", _S.read(_e, "r"), _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 5, _S.read(_e, "a")), _S.read(_e, "ph"))]))), _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", 9, _S.read(_e, "a")), _S.binary("*", _S.read(_e, "ph"), 2.3))]))))
