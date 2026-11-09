@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "hash", _S.import_value("core/index.js", "hash"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "FIRE_RAMP", _S.import_value("core/index.js", "FIRE_RAMP"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "zigzag", _S.function_value(_e, "_f0"))
	_S.define(_e, "bowed", _S.function_value(_e, "_f1"))
	_S.define(_e, "bend", _S.function_value(_e, "_f2"))
	_S.define(_e, "mark", _S.function_value(_e, "_f5"))
	_S.define(_e, "stamp", _S.function_value(_e, "_f6"))
	_S.define(_e, "flush", _S.function_value(_e, "_f7"))
	_S.define(_e, "stroke", _S.function_value(_e, "_f8"))
	_S.define(_e, "crackle", _S.function_value(_e, "_f10"))
	_S.define(_e, "trace", _S.function_value(_e, "_f12"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f13"))
	_S.define(_e, "flight", _S.function_value(_e, "_f14"))
	_S.define(_e, "spark", _S.function_value(_e, "_f15"))
	_S.define(_e, "puff", _S.function_value(_e, "_f16"))
	_S.define(_e, "VOLT", ["#120a33", "#2a1b78", "#4630c0", "#5a62f0", "#58a6ff", "#9ed8ff", "#e4f6ff", "#ffffff"])
	_exports["VOLT"] = _S.read(_e, "VOLT")
	_S.define(_e, "PLASMA", ["#ffffff", "#c8f8ff", "#7ff3ff", "#1ab8e6"])
	_exports["PLASMA"] = _S.read(_e, "PLASMA")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#110c16"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#1c1522"]))
	_exports["SOOT"] = _S.read(_e, "SOOT")
	_exports["SOOT2"] = _S.read(_e, "SOOT2")
	_exports["zigzag"] = _S.read(_e, "zigzag")
	_exports["bowed"] = _S.read(_e, "bowed")
	_exports["bend"] = _S.read(_e, "bend")
	_S.define(_e, "N", 1024)
	_S.define(_e, "HALF", 512)
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "N"), _S.read(_e, "N"))]))
	_S.define(_e, "HIT", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f17"))
	_exports["stroke"] = _S.read(_e, "stroke")
	_exports["crackle"] = _S.read(_e, "crackle")
	_S.define(_e, "CROSS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_exports["trace"] = _S.read(_e, "trace")
	_exports["scorch"] = _S.read(_e, "scorch")
	_S.define(_e, "heat", _S.function_value(_e, "_f18"))
	_exports["heat"] = _S.read(_e, "heat")
	_exports["flight"] = _S.read(_e, "flight")
	_exports["spark"] = _S.read(_e, "spark")
	_exports["puff"] = _S.read(_e, "puff")
	_S.define(_e, "frameRng", _S.function_value(_e, "_f19"))
	_exports["frameRng"] = _S.read(_e, "frameRng")
	_exports["rand"] = _S.read(_e, "rand")
	_exports["rng"] = _S.read(_e, "rng")
	_exports["hash"] = _S.read(_e, "hash")
	_exports["Rng"] = _S.read(_e, "Rng")
	_exports["clamp"] = _S.read(_e, "clamp")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "jag", _S.coalesce(_S.arg(_args, 5), func(): return 0.32))
	_S.define(_e, "forks", _S.coalesce(_S.arg(_args, 6), func(): return 0.35))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "depth", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "out", _S.merge([{"paths": []}]))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	_S.define(_e, "pts", [[_S.read(_e, "x0"), _S.read(_e, "y0")], [_S.read(_e, "x1"), _S.read(_e, "y1")]])
	_S.define(_e, "off", _S.binary("*", _S.read(_e, "L"), _S.read(_e, "jag")))
	while _S.truth(_S.binary("<", _S.prop(_S.read(_e, "pts"), "length"), _S.binary("+", 2, _S.binary("/", _S.read(_e, "L"), 3)))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "nxt", [_S.prop(_S.read(_v0, "pts"), 0)])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.binary("-", _S.prop(_S.read(_v1, "pts"), "length"), 1))):
			var _v2 = _S.scope(_v1)
			var _v3 = _S.prop(_S.read(_v2, "pts"), _S.read(_v2, "i"))
			_S.define(_v2, "ax", _S.prop(_v3, 0))
			_S.define(_v2, "ay", _S.prop(_v3, 1))
			var _v4 = _S.prop(_S.read(_v2, "pts"), _S.binary("+", _S.read(_v2, "i"), 1))
			_S.define(_v2, "bx", _S.prop(_v4, 0))
			_S.define(_v2, "by", _S.prop(_v4, 1))
			_S.define(_v2, "l", _S.logical("||", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.binary("-", _S.read(_v2, "bx"), _S.read(_v2, "ax")), _S.binary("-", _S.read(_v2, "by"), _S.read(_v2, "ay"))]), func(): return 1))
			_S.define(_v2, "o", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", _S.read(_v2, "off")), _S.read(_v2, "off")]))
			_S.invoke(_S.read(_v2, "nxt"), "push", [[_S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v2, "ax"), _S.read(_v2, "bx")), 2), _S.binary("*", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_v2, "by"), _S.read(_v2, "ay"))), _S.read(_v2, "l")), _S.read(_v2, "o"))), _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v2, "ay"), _S.read(_v2, "by")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v2, "bx"), _S.read(_v2, "ax")), _S.read(_v2, "l")), _S.read(_v2, "o")))], [_S.read(_v2, "bx"), _S.read(_v2, "by")]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_S.write(_v0, "pts", _S.read(_v0, "nxt"), "=", false)
		_S.write(_v0, "off", 0.52, "*=", false)
	_S.invoke(_S.prop(_S.read(_e, "out"), "paths"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": _S.read(_e, "w")}])])
	if _S.truth(_S.binary("<", _S.read(_e, "depth"), 2)):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "i", 2)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.binary("-", _S.prop(_S.read(_v5, "pts"), "length"), 3))):
			if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [_S.binary("/", _S.binary("/", _S.read(_v5, "forks"), _S.binary("+", 1, _S.read(_v5, "depth"))), _S.invoke(_S.read(_v5, "Math"), "max", [4, _S.binary("/", _S.prop(_S.read(_v5, "pts"), "length"), 6)]))])):
				var _v6 = _S.scope(_v5)
				var _v7 = _S.prop(_S.read(_v6, "pts"), _S.read(_v6, "i"))
				_S.define(_v6, "ax", _S.prop(_v7, 0))
				_S.define(_v6, "ay", _S.prop(_v7, 1))
				var _v8 = _S.prop(_S.read(_v6, "pts"), _S.invoke(_S.read(_v6, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v6, "pts"), "length"), 1), _S.binary("+", _S.read(_v6, "i"), 3)]))
				_S.define(_v6, "bx", _S.prop(_v8, 0))
				_S.define(_v6, "by", _S.prop(_v8, 1))
				_S.define(_v6, "a", _S.binary("+", _S.invoke(_S.read(_v6, "Math"), "atan2", [_S.binary("-", _S.read(_v6, "by"), _S.read(_v6, "ay")), _S.binary("-", _S.read(_v6, "bx"), _S.read(_v6, "ax"))]), _S.binary("*", _S.invoke(_S.read(_v6, "R"), "sign", []), _S.invoke(_S.read(_v6, "R"), "range", [0.35, 0.9]))))
				_S.define(_v6, "l", _S.binary("*", _S.binary("-", _S.read(_v6, "L"), _S.binary("*", _S.binary("/", _S.read(_v6, "i"), _S.prop(_S.read(_v6, "pts"), "length")), _S.read(_v6, "L"))), _S.invoke(_S.read(_v6, "R"), "range", [0.25, 0.55])))
				_S.invoke(_S.prop(_S.read(_v6, "out"), "paths"), "push", _S.concat([_S.array(_S.prop(_S.call_value(_S.read(_v6, "zigzag"), [_S.read(_v6, "R"), _S.read(_v6, "ax"), _S.read(_v6, "ay"), _S.binary("+", _S.read(_v6, "ax"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "l"))), _S.binary("+", _S.read(_v6, "ay"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "l"))), _S.binary("*", _S.read(_v6, "jag"), 1.1), _S.read(_v6, "forks"), _S.binary("*", _S.read(_v6, "w"), 0.55), _S.binary("+", _S.read(_v6, "depth"), 1)]), "paths"))]))
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "bow", _S.arg(_args, 5))
	_S.define(_e, "jag", _S.coalesce(_S.arg(_args, 6), func(): return 0.22))
	_S.define(_e, "forks", _S.coalesce(_S.arg(_args, 7), func(): return 0.4))
	_S.define(_e, "L", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]), func(): return 1))
	_S.define(_e, "nx", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))), _S.read(_e, "L")))
	_S.define(_e, "ny", _S.binary("/", _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.read(_e, "L")))
	_S.define(_e, "mx", _S.binary("+", _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_e, "x0"), _S.read(_e, "x1")), 2), _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "bow"))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 2), 2])))
	_S.define(_e, "my", _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "y1")), 2), _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "bow"))))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "zigzag"), [_S.read(_e, "R"), _S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "mx"), _S.read(_e, "my"), _S.read(_e, "jag"), _S.read(_e, "forks")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "zigzag"), [_S.read(_e, "R"), _S.read(_e, "mx"), _S.read(_e, "my"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.read(_e, "jag"), _S.read(_e, "forks")]))
	return _S.merge([{"paths": _S.concat([[_S.merge([{"pts": _S.concat([_S.array(_S.prop(_S.prop(_S.prop(_S.read(_e, "a"), "paths"), 0), "pts")), _S.array(_S.invoke(_S.prop(_S.prop(_S.prop(_S.read(_e, "b"), "paths"), 0), "pts"), "slice", [1]))])}, {"w": 1}])], _S.array(_S.invoke(_S.prop(_S.read(_e, "a"), "paths"), "slice", [1])), _S.array(_S.invoke(_S.prop(_S.read(_e, "b"), "paths"), "slice", [1]))])}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "fn", _S.arg(_args, 1))
	return _S.merge([{"paths": _S.invoke(_S.prop(_S.read(_e, "b"), "paths"), "map", [_S.function_value(_e, "_f3")])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.merge([{"w": _S.prop(_S.read(_e, "q"), "w")}, {"pts": _S.invoke(_S.prop(_S.read(_e, "q"), "pts"), "map", [_S.function_value(_e, "_f4")])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v9, 0))
	_S.define(_e, "y", _S.prop(_v9, 1))
	return _S.call_value(_S.read(_e, "fn"), [_S.read(_e, "x"), _S.read(_e, "y")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "lvl", _S.arg(_args, 2))
	_S.define(_e, "X", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.read(_e, "HALF")))
	_S.define(_e, "Y", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), _S.read(_e, "HALF")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "X"), 0), func(): return _S.binary("<", _S.read(_e, "Y"), 0)), func(): return _S.binary(">=", _S.read(_e, "X"), _S.read(_e, "N"))), func(): return _S.binary(">=", _S.read(_e, "Y"), _S.read(_e, "N")))):
		return null
	_S.define(_e, "i", _S.binary("+", _S.binary("*", _S.read(_e, "Y"), _S.read(_e, "N")), _S.read(_e, "X")))
	_S.define(_e, "v", _S.prop(_S.read(_e, "GRID"), _S.read(_e, "i")))
	if _S.truth(_S.unary("!", _S.read(_e, "v"))):
		_S.invoke(_S.read(_e, "HIT"), "push", [_S.read(_e, "i")])
	if _S.truth(_S.binary(">", _S.read(_e, "lvl"), _S.read(_e, "v"))):
		_S.set_prop(_S.read(_e, "GRID"), _S.read(_e, "i"), _S.read(_e, "lvl"), "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "lvl", _S.arg(_args, 3))
	if _S.truth(_S.binary("<=", _S.read(_e, "r"), 0.5)):
		return _S.call_value(_S.read(_e, "mark"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]), _S.read(_e, "lvl")])
	_S.define(_e, "r2", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "r")))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "py", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("-", _S.read(_v10, "y"), _S.read(_v10, "r"))]))
	while _S.truth(_S.binary("<=", _S.read(_v10, "py"), _S.invoke(_S.read(_v10, "Math"), "ceil", [_S.binary("+", _S.read(_v10, "y"), _S.read(_v10, "r"))]))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "dy", _S.binary("-", _S.binary("+", _S.read(_v11, "py"), 0.5), _S.read(_v11, "y")))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "px", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("-", _S.read(_v12, "x"), _S.read(_v12, "r"))]))
		while _S.truth(_S.binary("<=", _S.read(_v12, "px"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.binary("+", _S.read(_v12, "x"), _S.read(_v12, "r"))]))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "dx", _S.binary("-", _S.binary("+", _S.read(_v13, "px"), 0.5), _S.read(_v13, "x")))
			if _S.truth(_S.binary("<=", _S.binary("+", _S.binary("*", _S.read(_v13, "dx"), _S.read(_v13, "dx")), _S.binary("*", _S.read(_v13, "dy"), _S.read(_v13, "dy"))), _S.read(_v13, "r2"))):
				_S.call_value(_S.read(_v13, "mark"), [_S.read(_v13, "px"), _S.read(_v13, "py"), _S.read(_v13, "lvl")])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "px", 1, "+=", true)
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "py", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cols", _S.arg(_args, 1))
	_S.define(_e, "alphas", _S.arg(_args, 2))
	for _v14 in _S.array(_S.read(_e, "HIT")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "i", _v14)
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "v", _S.prop(_S.read(_v16, "GRID"), _S.read(_v16, "i")))
		_S.set_prop(_S.read(_v16, "GRID"), _S.read(_v16, "i"), 0, "=", false)
		_S.define(_v16, "x", _S.binary("-", _S.binary("%", _S.read(_v16, "i"), _S.read(_v16, "N")), _S.read(_v16, "HALF")))
		_S.define(_v16, "y", _S.binary("-", _S.binary("|", _S.binary("/", _S.read(_v16, "i"), _S.read(_v16, "N")), 0), _S.read(_v16, "HALF")))
		_S.define(_v16, "a", (_S.prop(_S.read(_v16, "alphas"), _S.binary("-", _S.read(_v16, "v"), 1)) if _S.truth(_S.read(_v16, "alphas")) else 1))
		if _S.truth(_S.binary(">=", _S.read(_v16, "a"), 1)):
			_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "cols"), _S.binary("-", _S.read(_v16, "v"), 1))])
		else:
			if _S.truth(_S.binary(">", _S.read(_v16, "a"), 0)):
				_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.prop(_S.read(_v16, "cols"), _S.binary("-", _S.read(_v16, "v"), 1)), _S.read(_v16, "a")])
	_S.set_prop(_S.read(_e, "HIT"), "length", 0, "=", false)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "s", _S.coalesce(_S.arg(_args, 4), func(): return 1))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([])))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.02)):
		return null
	_S.define(_e, "lk", _S.logical("??", _S.prop(_S.read(_e, "o"), "light"), func(): return 0.5))
	for _v17 in _S.array(_S.prop(_S.read(_e, "b"), "paths")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "q", _v17)
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "trunk", _S.binary(">=", _S.prop(_S.read(_v19, "q"), "w"), 1))
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v19, "trunk")), func(): return _S.binary("<", _S.read(_v19, "k"), 0.5))):
			continue
		_S.define(_v19, "rh", _S.binary("*", ((2.1 if _S.truth(_S.binary(">", _S.read(_v19, "k"), 0.6)) else 1.6) if _S.truth(_S.read(_v19, "trunk")) else 1.1), _S.read(_v19, "s")))
		_S.define(_v19, "rb", _S.binary("*", ((1.3 if _S.truth(_S.binary(">", _S.read(_v19, "k"), 0.6)) else 0.8) if _S.truth(_S.read(_v19, "trunk")) else 0.5), _S.read(_v19, "s")))
		_S.define(_v19, "pts", (_S.invoke(_S.prop(_S.read(_v19, "q"), "pts"), "slice", [0, _S.invoke(_S.read(_v19, "Math"), "max", [2, _S.invoke(_S.read(_v19, "Math"), "ceil", [_S.binary("*", _S.prop(_S.prop(_S.read(_v19, "q"), "pts"), "length"), _S.prop(_S.read(_v19, "o"), "upTo"))])])]) if _S.truth(_S.logical("&&", _S.binary("!==", _S.prop(_S.read(_v19, "o"), "upTo"), null), func(): return _S.read(_v19, "trunk"))) else _S.prop(_S.read(_v19, "q"), "pts")))
		_S.call_value(_S.read(_v19, "walk"), [_S.read(_v19, "pts"), _S.function_value(_v19, "_f9")])
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.binary("-", _S.prop(_S.read(_v20, "pts"), "length"), 1))):
			if _S.truth(_S.logical("||", _S.binary("===", _S.prop(_S.read(_v20, "o"), "minY"), null), func(): return _S.binary(">", _S.prop(_S.prop(_S.read(_v20, "pts"), _S.read(_v20, "i")), 1), _S.prop(_S.read(_v20, "o"), "minY")))):
				_S.invoke(_S.read(_v20, "p"), "glow", [_S.prop(_S.prop(_S.read(_v20, "pts"), _S.read(_v20, "i")), 0), _S.prop(_S.prop(_S.read(_v20, "pts"), _S.read(_v20, "i")), 1), _S.binary("*", (14 if _S.truth(_S.read(_v20, "trunk")) else 7), _S.read(_v20, "s")), _S.prop(_S.read(_v20, "C"), 4), _S.binary("*", _S.binary("*", _S.read(_v20, "lk"), _S.read(_v20, "k")), _S.prop(_S.read(_v20, "q"), "w"))])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 3, "+=", false)
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "o"), "a"), func(): return 1))
	_S.call_value(_S.read(_e, "flush"), [_S.read(_e, "p"), ([_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 7)] if _S.truth(_S.prop(_S.read(_e, "o"), "hero")) else [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 7)]), [_S.read(_e, "a"), _S.read(_e, "a"), _S.read(_e, "a"), _S.read(_e, "a")]])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.call_value(_S.read(_e, "stamp"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rh"), 1])
	_S.call_value(_S.read(_e, "stamp"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "rb"), (3 if _S.truth(_S.read(_e, "trunk")) else 2)])
	if _S.truth(_S.logical("&&", _S.read(_e, "trunk"), func(): return _S.binary(">", _S.read(_e, "k"), 0.3))):
		(_S.call_value(_S.read(_e, "stamp"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "o"), "core"), 4]) if _S.truth(_S.prop(_S.read(_e, "o"), "core")) else _S.call_value(_S.read(_e, "mark"), [_S.read(_e, "x"), _S.read(_e, "y"), 4]))
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "glowK", _S.coalesce(_S.arg(_args, 4), func(): return 0.5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.02)):
		return null
	for _v21 in _S.array(_S.prop(_S.read(_e, "b"), "paths")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "q", _v21)
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "thick", _S.binary(">=", _S.prop(_S.read(_v23, "q"), "w"), 1))
		_S.call_value(_S.read(_v23, "walk"), [_S.prop(_S.read(_v23, "q"), "pts"), _S.function_value(_v23, "_f11")])
		var _v27 = _S.scope(_v23)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v27, "q"), "pts"), "length"), 1))):
			_S.invoke(_S.read(_v27, "p"), "glow", [_S.prop(_S.prop(_S.prop(_S.read(_v27, "q"), "pts"), _S.read(_v27, "i")), 0), _S.prop(_S.prop(_S.prop(_S.read(_v27, "q"), "pts"), _S.read(_v27, "i")), 1), _S.binary("*", (9 if _S.truth(_S.read(_v27, "thick")) else 5), _S.binary("+", 0.5, _S.binary("*", _S.read(_v27, "k"), 0.5))), _S.prop(_S.read(_v27, "C"), 4), _S.binary("*", _S.binary("*", _S.read(_v27, "glowK"), _S.read(_v27, "k")), _S.prop(_S.read(_v27, "q"), "w"))])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 3, "+=", false)
	_S.call_value(_S.read(_e, "flush"), [_S.read(_e, "p"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 7)], [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", _S.read(_e, "k"), 0.45), 1.6)]), _S.read(_e, "a")), _S.read(_e, "a"), _S.read(_e, "a"), _S.read(_e, "a")]])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.45), func(): return _S.read(_e, "thick"))):
		for _v24 in _S.array(_S.read(_e, "CROSS")):
			var _v25 = _S.scope(_e)
			var _v26 = _v24
			_S.define(_v25, "dx", _S.prop(_v26, 0))
			_S.define(_v25, "dy", _S.prop(_v26, 1))
			_S.call_value(_S.read(_v25, "mark"), [_S.binary("+", _S.read(_v25, "x"), _S.binary("*", _S.read(_v25, "dx"), 1.5)), _S.binary("+", _S.read(_v25, "y"), _S.binary("*", _S.read(_v25, "dy"), 1.5)), 1])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.25), func(): return _S.logical("||", _S.read(_e, "thick"), func(): return _S.binary(">", _S.prop(_S.read(_e, "q"), "w"), 0.4)))):
		_S.last([_S.call_value(_S.read(_e, "mark"), [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), 2]), _S.call_value(_S.read(_e, "mark"), [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), 2])])
	_S.call_value(_S.read(_e, "mark"), [_S.read(_e, "x"), _S.read(_e, "y"), (4 if _S.truth(_S.logical("&&", _S.read(_e, "thick"), func(): return _S.binary(">", _S.read(_e, "k"), 0.3))) else 3)])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 3), func(): return 1))
	_S.define(_e, "from", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	_S.define(_e, "to", _S.coalesce(_S.arg(_args, 5), func(): return _S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1)))
	var _v28 = _S.scope(_e)
	_S.define(_v28, "i", _S.invoke(_S.read(_v28, "Math"), "max", [0, _S.read(_v28, "from")]))
	while _S.truth(_S.binary("<", _S.read(_v28, "i"), _S.invoke(_S.read(_v28, "Math"), "min", [_S.read(_v28, "to"), _S.binary("-", _S.prop(_S.read(_v28, "pts"), "length"), 1)]))):
		_S.invoke(_S.read(_v28, "p"), "line", [_S.prop(_S.prop(_S.read(_v28, "pts"), _S.read(_v28, "i")), 0), _S.prop(_S.prop(_S.read(_v28, "pts"), _S.read(_v28, "i")), 1), _S.prop(_S.prop(_S.read(_v28, "pts"), _S.binary("+", _S.read(_v28, "i"), 1)), 0), _S.prop(_S.prop(_S.read(_v28, "pts"), _S.binary("+", _S.read(_v28, "i"), 1)), 1), _S.read(_v28, "c"), _S.read(_v28, "a")])
		_v28 = _S.iteration(_v28)
		_S.write(_v28, "i", 1, "+=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "T0", _S.arg(_args, 4))
	_S.define(_e, "fade", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	_S.define(_e, "ry", _S.coalesce(_S.arg(_args, 6), func(): return _S.invoke(_S.read(_e, "Math"), "max", [2.5, _S.binary("*", _S.read(_e, "rx"), 0.12)])))
	if _S.truth(_S.binary("<=", _S.read(_e, "fade"), 0)):
		return null
	var _v29 = _S.scope(_e)
	_S.define(_v29, "y", _S.invoke(_S.read(_v29, "Math"), "floor", [_S.read(_v29, "cy")]))
	while _S.truth(_S.binary("<=", _S.read(_v29, "y"), _S.binary("+", _S.read(_v29, "cy"), _S.read(_v29, "ry")))):
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "x", _S.invoke(_S.read(_v30, "Math"), "floor", [_S.binary("-", _S.read(_v30, "cx"), _S.read(_v30, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v30, "x"), _S.invoke(_S.read(_v30, "Math"), "ceil", [_S.binary("+", _S.read(_v30, "cx"), _S.read(_v30, "rx"))]))):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v31, "x"), 0.5), _S.read(_v31, "cx")), _S.read(_v31, "rx")))
			_S.define(_v31, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v31, "y"), 0.5), _S.read(_v31, "cy")), _S.read(_v31, "ry")))
			_S.define(_v31, "d", _S.invoke(_S.read(_v31, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v31, "dx"), _S.read(_v31, "dx")), _S.binary("*", _S.read(_v31, "dy"), _S.read(_v31, "dy")))]))
			if _S.truth(_S.binary(">", _S.read(_v31, "d"), 1)):
				_v30 = _S.iteration(_v30)
				_S.write(_v30, "x", 1, "+=", true)
				continue
			_S.define(_v31, "n", _S.call_value(_S.read(_v31, "rand"), [_S.read(_v31, "x"), _S.read(_v31, "y"), 41]))
			_S.define(_v31, "T", _S.binary("-", _S.binary("*", _S.read(_v31, "T0"), _S.binary("-", 1.25, _S.read(_v31, "d"))), _S.binary("*", _S.read(_v31, "n"), 0.35)))
			if _S.truth(_S.binary(">", _S.read(_v31, "T"), 0.06)):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "c", _S.prop(_S.read(_v32, "FIRE_RAMP"), _S.invoke(_S.read(_v32, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v32, "FIRE_RAMP"), "length"), 1), _S.invoke(_S.read(_v32, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v32, "Math"), "min", [1, _S.read(_v32, "T")])), _S.binary("-", _S.prop(_S.read(_v32, "FIRE_RAMP"), "length"), 1))])])))
				_S.invoke(_S.read(_v32, "p"), "dot", [_S.read(_v32, "x"), _S.read(_v32, "y"), _S.read(_v32, "c"), _S.read(_v32, "fade")])
				if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v32, "x"), 3), 0)):
					_S.invoke(_S.read(_v32, "p"), "glow", [_S.binary("+", _S.read(_v32, "x"), 0.5), _S.read(_v32, "y"), 6, _S.read(_v32, "c"), _S.binary("*", _S.binary("*", 0.18, _S.read(_v32, "T")), _S.read(_v32, "fade"))])
			else:
				_S.invoke(_S.read(_v31, "p"), "dot", [_S.read(_v31, "x"), _S.read(_v31, "y"), (_S.read(_v31, "SOOT") if _S.truth(_S.binary("<", _S.read(_v31, "d"), 0.5)) else _S.read(_v31, "SOOT2")), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v31, "d"), _S.binary("-", 0.95, _S.binary("*", _S.read(_v31, "n"), 0.3)))) else _S.binary("-", 1, _S.read(_v31, "d"))), _S.read(_v31, "fade"))])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "x", 1, "+=", true)
		_v29 = _S.iteration(_v29)
		_S.write(_v29, "y", 1, "+=", true)
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "age", _S.arg(_args, 4))
	var _v33 = _S.coalesce(_S.arg(_args, 5), func(): return _S.merge([]))
	_S.define(_e, "g", _S.coalesce(_S.prop(_v33, "g"), func(): return 0.45))
	_S.define(_e, "drag", _S.coalesce(_S.prop(_v33, "drag"), func(): return 2.2))
	_S.define(_e, "floor", _S.coalesce(_S.prop(_v33, "floor"), func(): return INF))
	_S.define(_e, "bounce", _S.coalesce(_S.prop(_v33, "bounce"), func(): return 0.45))
	_S.define(_e, "dt", _S.binary("/", 1, 120))
	var _v34 = _S.scope(_e)
	_S.define(_v34, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v34, "s"), _S.read(_v34, "age"))):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "h", _S.invoke(_S.read(_v35, "Math"), "min", [_S.read(_v35, "dt"), _S.binary("-", _S.read(_v35, "age"), _S.read(_v35, "s"))]))
		_S.write(_v35, "vy", _S.binary("*", _S.binary("*", _S.read(_v35, "GRAVITY"), _S.read(_v35, "g")), _S.read(_v35, "h")), "+=", false)
		_S.write(_v35, "vx", _S.binary("*", _S.binary("*", _S.read(_v35, "vx"), _S.read(_v35, "drag")), _S.read(_v35, "h")), "-=", false)
		_S.write(_v35, "vy", _S.binary("*", _S.binary("*", _S.read(_v35, "vy"), _S.read(_v35, "drag")), _S.read(_v35, "h")), "-=", false)
		_S.define(_v35, "ny", _S.binary("+", _S.read(_v35, "y"), _S.binary("*", _S.read(_v35, "vy"), _S.read(_v35, "h"))))
		_S.write(_v35, "x", _S.binary("*", _S.read(_v35, "vx"), _S.read(_v35, "h")), "+=", false)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v35, "vy"), 0), func(): return _S.binary("<=", _S.read(_v35, "y"), _S.read(_v35, "floor"))), func(): return _S.binary(">=", _S.read(_v35, "ny"), _S.read(_v35, "floor")))):
			_S.last([_S.write(_v35, "vy", _S.binary("*", _S.unary("-", _S.read(_v35, "vy")), _S.read(_v35, "bounce")), "=", false), _S.write(_v35, "vx", 0.7, "*=", false), _S.write(_v35, "y", _S.binary("-", _S.read(_v35, "floor"), 0.25), "=", false)])
		else:
			_S.write(_v35, "y", _S.read(_v35, "ny"), "=", false)
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "s", _S.read(_v34, "dt"), "+=", false)
	return [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy")]

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "k", _S.arg(_args, 5))
	_S.define(_e, "S", _S.arg(_args, 6))
	_S.define(_e, "sp", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]), func(): return 1))
	_S.define(_e, "ux", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")))
	_S.define(_e, "uy", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")))
	_S.define(_e, "head", (_S.prop(_S.read(_e, "S"), 0) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)) else (_S.prop(_S.read(_e, "S"), 1) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.3)) else _S.prop(_S.read(_e, "S"), 2))))
	_S.define(_e, "len", _S.invoke(_S.read(_e, "Math"), "min", [9, _S.binary("+", 1, _S.binary("*", _S.read(_e, "sp"), 0.022))]))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len"))), _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.4)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.4)), (_S.read(_e, "head") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "S"), _S.binary("-", _S.prop(_S.read(_e, "S"), "length"), 1)))])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("*", _S.read(_e, "ux"), _S.read(_e, "len")), 0.45)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.read(_e, "uy"), _S.read(_e, "len")), 0.45)), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "head")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "head"), _S.binary("*", 0.45, _S.read(_e, "k"))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "size", _S.arg(_args, 3))
	_S.define(_e, "u", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.binary("-", 1, _S.read(_e, "u")))
	_S.define(_e, "r", _S.binary("*", _S.read(_e, "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 2.5)]), 0.45)), _S.binary("*", _S.read(_e, "u"), 0.4))))
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "u"), 12)]), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 2.4)])), 0.58))
	if _S.truth(_S.binary("<=", _S.read(_e, "a"), 0.01)):
		return null
	_S.define(_e, "col", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "SMOKE_RAMP"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "SMOKE_RAMP"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "SMOKE_RAMP"), "length"))])])), _S.read(_e, "u")]))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "col"), _S.binary("*", _S.read(_e, "a"), 0.45)])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.05)), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.06)), _S.binary("*", _S.read(_e, "r"), 0.74), _S.read(_e, "col"), _S.binary("*", _S.read(_e, "a"), 0.62)])
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.3)), _S.binary("*", _S.read(_e, "r"), 0.5), _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "col"), _S.call_value(_S.read(_e, "hex"), ["#ffffff"]), 0.12]), _S.binary("*", _S.binary("*", _S.read(_e, "a"), 0.4), _S.binary("-", 1, _S.binary("*", _S.read(_e, "u"), 2)))])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "fn", _S.arg(_args, 1))
	var _v36 = _S.scope(_e)
	_S.define(_v36, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v36, "i"), _S.binary("-", _S.prop(_S.read(_v36, "pts"), "length"), 1))):
		var _v37 = _S.scope(_v36)
		var _v38 = _S.prop(_S.read(_v37, "pts"), _S.read(_v37, "i"))
		_S.define(_v37, "ax", _S.prop(_v38, 0))
		_S.define(_v37, "ay", _S.prop(_v38, 1))
		var _v39 = _S.prop(_S.read(_v37, "pts"), _S.binary("+", _S.read(_v37, "i"), 1))
		_S.define(_v37, "bx", _S.prop(_v39, 0))
		_S.define(_v37, "by", _S.prop(_v39, 1))
		_S.define(_v37, "l", _S.invoke(_S.read(_v37, "Math"), "max", [1, _S.invoke(_S.read(_v37, "Math"), "hypot", [_S.binary("-", _S.read(_v37, "bx"), _S.read(_v37, "ax")), _S.binary("-", _S.read(_v37, "by"), _S.read(_v37, "ay"))])]))
		var _v40 = _S.scope(_v37)
		_S.define(_v40, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v40, "d"), _S.read(_v40, "l"))):
			_S.call_value(_S.read(_v40, "fn"), [_S.binary("+", _S.read(_v40, "ax"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v40, "bx"), _S.read(_v40, "ax")), _S.read(_v40, "d")), _S.read(_v40, "l"))), _S.binary("+", _S.read(_v40, "ay"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v40, "by"), _S.read(_v40, "ay")), _S.read(_v40, "d")), _S.read(_v40, "l"))), _S.read(_v40, "i")])
			_v40 = _S.iteration(_v40)
			_S.write(_v40, "d", 0.5, "+=", false)
		_v36 = _S.iteration(_v36)
		_S.write(_v36, "i", 1, "+=", true)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "T", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "FIRE_RAMP"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "FIRE_RAMP"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "T")])), _S.binary("-", _S.prop(_S.read(_e, "FIRE_RAMP"), "length"), 1))])])) if _S.truth(_S.binary(">", _S.read(_e, "T"), 0.06)) else 0)

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "f", _S.arg(_args, 1))
	_S.define(_e, "salt", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "seed"), _S.read(_e, "salt"), _S.read(_e, "f")])
