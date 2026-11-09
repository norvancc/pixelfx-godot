@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/sim.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/math.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "TAU", _S.import_value("core/math.js", "TAU"))
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "scale", _S.import_value("core/color.js", "scale"))
	_S.define(_e, "mix", _S.import_value("core/color.js", "mix"))
	_S.define(_e, "rgb", _S.import_value("core/color.js", "rgb"))
	_S.define(_e, "WHITE", _S.import_value("core/color.js", "WHITE"))
	_S.define(_e, "sparkle", _S.function_value(_e, "_f0"))
	_S.define(_e, "flare", _S.function_value(_e, "_f1"))
	_S.define(_e, "band", _S.function_value(_e, "_f2"))
	_S.define(_e, "crystal", _S.function_value(_e, "_f4"))
	_S.define(_e, "GRAVITY", 950)
	_exports["GRAVITY"] = _S.read(_e, "GRAVITY")
	_S.define(_e, "CROSS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_S.define(_e, "DIAG", [[1, 1], [1, _S.unary("-", 1)], [_S.unary("-", 1), 1], [_S.unary("-", 1), _S.unary("-", 1)]])
	_S.define(_e, "HOT", _S.invoke(["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "FIRE_RAMP", _S.invoke(["#ffffff", "#fff3a6", "#ffe26b", "#ffc23d", "#ff8a2a", "#f2561d", "#c9281f", "#8a1f17", "#4a1712"], "map", [_S.read(_e, "hex")]))
	_exports["FIRE_RAMP"] = _S.read(_e, "FIRE_RAMP")
	_S.define(_e, "SMOKE_RAMP", _S.invoke(["#7b6f72", "#5d5660", "#433d48", "#2b2630", "#1a171e"], "map", [_S.read(_e, "hex")]))
	_exports["SMOKE_RAMP"] = _S.read(_e, "SMOKE_RAMP")
	_S.define(_e, "rampAt", _S.function_value(_e, "_f7"))
	_S.define(_e, "P", _S.merge([{"SPARK": 0}, {"MOTE": 1}, {"STREAK": 2}, {"FLAKE": 3}, {"VAPOUR": 4}, {"DUST": 5}, {"STAR": 6}, {"EMBER": 7}, {"SMOKE": 8}, {"FIRE": 9}, {"BRAND": 10}, {"GRIT": 11}]))
	_exports["P"] = _S.read(_e, "P")
	_S.define(_e, "PF", _S.merge([{"SMOKES": 1}, {"BIG": 2}, {"BACK": 4}]))
	_exports["PF"] = _S.read(_e, "PF")
	_S.define(_e, "SOFT", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "SMOKE")]]))
	_S.define(_e, "Particles", _S.class_value("Particles", _S.function_value(_e, "_f8"), {"spawn": _S.function_value(_e, "_f10"), "update": _S.function_value(_e, "_f12"), "draw": _S.function_value(_e, "_f13")}, {"count": _S.function_value(_e, "_f11")}, {}, null))
	_exports["Particles"] = _S.read(_e, "Particles")
	_S.define(_e, "Blazes", _S.class_value("Blazes", _S.function_value(_e, "_f14"), {"add": _S.function_value(_e, "_f15"), "update": _S.function_value(_e, "_f17"), "drawBack": _S.function_value(_e, "_f18")}, {"count": _S.function_value(_e, "_f16")}, {}, null))
	_exports["Blazes"] = _S.read(_e, "Blazes")
	_S.define(_e, "B", _S.merge([{"SHARD": 0}, {"CHUNK": 1}, {"DRIP": 2}]))
	_exports["B"] = _S.read(_e, "B")
	_S.define(_e, "Bits", _S.class_value("Bits", _S.function_value(_e, "_f19"), {"add": _S.function_value(_e, "_f21"), "update": _S.function_value(_e, "_f23"), "draw": _S.function_value(_e, "_f24")}, {"count": _S.function_value(_e, "_f22")}, {}, null))
	_exports["Bits"] = _S.read(_e, "Bits")
	_S.define(_e, "Lights", _S.class_value("Lights", _S.function_value(_e, "_f25"), {"add": _S.function_value(_e, "_f26"), "update": _S.function_value(_e, "_f27"), "draw": _S.function_value(_e, "_f28")}, {}, {}, null))
	_exports["Lights"] = _S.read(_e, "Lights")
	_exports["sparkle"] = _S.read(_e, "sparkle")
	_exports["flare"] = _S.read(_e, "flare")
	_exports["band"] = _S.read(_e, "band")
	_exports["crystal"] = _S.read(_e, "crystal")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "arm", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	_S.define(_e, "tip", _S.coalesce(_S.arg(_args, 5), func(): return _S.read(_e, "c")))
	_S.define(_e, "k", _S.coalesce(_S.arg(_args, 6), func(): return 0.6))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "arm")]))
	if _S.truth(_S.binary("<", _S.read(_e, "n"), 1)):
		return null
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "d", 1)
	while _S.truth(_S.binary("<=", _S.read(_v0, "d"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "cc", (_S.read(_v1, "tip") if _S.truth(_S.binary(">", _S.read(_v1, "d"), _S.binary("*", _S.read(_v1, "n"), 0.6))) else _S.read(_v1, "c")))
		for _v2 in _S.array(_S.read(_v1, "CROSS")):
			var _v3 = _S.scope(_v1)
			var _v4 = _v2
			_S.define(_v3, "dx", _S.prop(_v4, 0))
			_S.define(_v3, "dy", _S.prop(_v4, 1))
			_S.invoke(_S.read(_v3, "p"), "px", [_S.binary("+", _S.read(_v3, "X"), _S.binary("*", _S.read(_v3, "dx"), _S.read(_v3, "d"))), _S.binary("+", _S.read(_v3, "Y"), _S.binary("*", _S.read(_v3, "dy"), _S.read(_v3, "d"))), _S.read(_v3, "cc")])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "d", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "n"), 3)):
		for _v5 in _S.array(_S.read(_e, "DIAG")):
			var _v6 = _S.scope(_e)
			var _v7 = _v5
			_S.define(_v6, "dx", _S.prop(_v7, 0))
			_S.define(_v6, "dy", _S.prop(_v7, 1))
			_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.read(_v6, "X"), _S.read(_v6, "dx")), _S.binary("+", _S.read(_v6, "Y"), _S.read(_v6, "dy")), _S.read(_v6, "c")])
	if _S.truth(_S.binary(">=", _S.read(_e, "n"), 6)):
		for _v8 in _S.array(_S.read(_e, "DIAG")):
			var _v9 = _S.scope(_e)
			var _v10 = _v8
			_S.define(_v9, "dx", _S.prop(_v10, 0))
			_S.define(_v9, "dy", _S.prop(_v10, 1))
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.read(_v9, "X"), _S.binary("*", _S.read(_v9, "dx"), 2)), _S.binary("+", _S.read(_v9, "Y"), _S.binary("*", _S.read(_v9, "dy"), 2)), _S.read(_v9, "tip")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "X"), _S.read(_e, "Y"), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 4, _S.binary("*", _S.read(_e, "n"), 2)), _S.read(_e, "c"), _S.read(_e, "k")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "ramp", _S.arg(_args, 5))
	if _S.truth(_S.binary("<", _S.read(_e, "L"), 1)):
		return null
	_S.define(_e, "R", _S.invoke(_S.read(_e, "ramp"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 8)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "an", _S.binary("/", _S.binary("*", _S.read(_v12, "i"), _S.prop(_S.read(_v12, "Math"), "PI")), 4))
		_S.define(_v12, "len", (_S.read(_v12, "L") if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v12, "i"), 4), 0)) else (_S.binary("*", _S.read(_v12, "L"), 0.6) if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v12, "i"), 2), 0)) else _S.binary("*", _S.read(_v12, "L"), 0.3))))
		_S.define(_v12, "ca", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "an")]))
		_S.define(_v12, "sa", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "an")]))
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "d", 0)
		while _S.truth(_S.binary("<=", _S.read(_v13, "d"), _S.read(_v13, "len"))):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "u", _S.binary("/", _S.read(_v14, "d"), _S.read(_v14, "len")))
			_S.invoke(_S.read(_v14, "p"), "dot", [_S.binary("+", _S.read(_v14, "x"), _S.binary("*", _S.read(_v14, "ca"), _S.read(_v14, "d"))), _S.binary("+", _S.read(_v14, "y"), _S.binary("*", _S.read(_v14, "sa"), _S.read(_v14, "d"))), (_S.read(_v14, "WHITE") if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.35)) else (_S.prop(_S.read(_v14, "R"), _S.binary("-", _S.read(_v14, "n"), 2)) if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.7)) else _S.prop(_S.read(_v14, "R"), _S.binary("-", _S.read(_v14, "n"), 3)))), (1 if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.6)) else _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v14, "k"), 1.5), _S.binary("-", 1, _S.read(_v14, "u"))), 0.2))])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "d", 0.5, "+=", false)
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "cx", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "sy", _S.arg(_args, 4))
	_S.define(_e, "th", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	_S.define(_e, "ramp", _S.arg(_args, 7))
	_S.define(_e, "keep", _S.coalesce(_S.arg(_args, 8), func(): return _S.function_value(_e, "_f3")))
	_S.define(_e, "hot", _S.coalesce(_S.arg(_args, 9), func(): return false))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "r"), 0), func(): return _S.binary("<=", _S.read(_e, "k"), 0))):
		return null
	_S.define(_e, "R", _S.invoke(_S.read(_e, "ramp"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "j", 0)
	_S.define(_v15, "m", _S.invoke(_S.read(_v15, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_v15, "r"), _S.read(_v15, "TAU")), 1.2)]))
	while _S.truth(_S.binary("<", _S.read(_v15, "j"), _S.read(_v15, "m"))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "ang", _S.binary("*", _S.binary("/", _S.read(_v16, "j"), _S.read(_v16, "m")), _S.read(_v16, "TAU")))
		_S.define(_v16, "ca", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "ang")]))
		_S.define(_v16, "sa", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "ang")]))
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v16, "keep"), [_S.read(_v16, "ang")]))):
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "j", 1, "+=", true)
			continue
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "o", _S.read(_v17, "th"))
		while _S.truth(_S.binary(">=", _S.read(_v17, "o"), 0)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "u", _S.binary("/", _S.read(_v18, "o"), _S.read(_v18, "th")))
			_S.define(_v18, "c", ((_S.read(_v18, "WHITE") if _S.truth(_S.read(_v18, "hot")) else _S.prop(_S.read(_v18, "R"), _S.binary("-", _S.read(_v18, "n"), 1))) if _S.truth(_S.binary("<", _S.read(_v18, "u"), 0.15)) else (_S.prop(_S.read(_v18, "R"), _S.binary("-", _S.read(_v18, "n"), 2)) if _S.truth(_S.binary("<", _S.read(_v18, "u"), 0.4)) else (_S.prop(_S.read(_v18, "R"), _S.binary("-", _S.read(_v18, "n"), 3)) if _S.truth(_S.binary("<", _S.read(_v18, "u"), 0.7)) else _S.prop(_S.read(_v18, "R"), _S.binary("-", _S.read(_v18, "n"), 4))))))
			_S.invoke(_S.read(_v18, "p"), "dot", [_S.binary("+", _S.read(_v18, "cx"), _S.binary("*", _S.read(_v18, "ca"), _S.binary("-", _S.read(_v18, "r"), _S.read(_v18, "o")))), _S.binary("+", _S.read(_v18, "cy"), _S.binary("*", _S.binary("*", _S.read(_v18, "sa"), _S.binary("-", _S.read(_v18, "r"), _S.read(_v18, "o"))), _S.read(_v18, "sy"))), _S.read(_v18, "c"), _S.binary("*", _S.read(_v18, "k"), (1.2 if _S.truth(_S.binary("<", _S.read(_v18, "u"), 0.4)) else _S.binary("-", 1.15, _S.read(_v18, "u"))))])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "o", 0.5, "-=", false)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "j", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return true

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "base", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "lean", _S.arg(_args, 5))
	_S.define(_e, "ramp", _S.arg(_args, 6))
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 7), func(): return _S.merge([])))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1.5)):
		return null
	_S.define(_e, "R", _S.invoke(_S.read(_e, "ramp"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "R"), "length"))
	_S.define(_e, "C", _S.function_value(_e, "_f5"))
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "opts"), "a"), func(): return 1))
	_S.define(_e, "top", _S.binary("-", _S.read(_e, "base"), _S.read(_e, "h")))
	_S.define(_e, "ridge0", _S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "w"), 0.14)))
	_S.define(_e, "glint", _S.logical("??", _S.prop(_S.read(_e, "opts"), "glint"), func(): return _S.unary("-", 1)))
	_S.define(_e, "inside", _S.function_value(_e, "_f6"))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "py", _S.binary("-", _S.invoke(_S.read(_v19, "Math"), "floor", [_S.read(_v19, "top")]), 1))
	while _S.truth(_S.binary("<", _S.read(_v19, "py"), _S.invoke(_S.read(_v19, "Math"), "ceil", [_S.read(_v19, "base")]))):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "px", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v20, "x"), _S.binary("/", _S.read(_v20, "w"), 2)), _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "lean")])), 2)]))
		while _S.truth(_S.binary("<=", _S.read(_v20, "px"), _S.invoke(_S.read(_v20, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v20, "x"), _S.binary("/", _S.read(_v20, "w"), 2)), _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "lean")])), 2)]))):
			var _v21 = _S.scope(_v20)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v21, "inside"), [_S.read(_v21, "px"), _S.read(_v21, "py")]))):
				var _v22 = _S.scope(_v21)
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v22, "inside"), [_S.binary("-", _S.read(_v22, "px"), 1), _S.read(_v22, "py")]), func(): return _S.call_value(_S.read(_v22, "inside"), [_S.binary("+", _S.read(_v22, "px"), 1), _S.read(_v22, "py")])), func(): return _S.call_value(_S.read(_v22, "inside"), [_S.read(_v22, "px"), _S.binary("+", _S.read(_v22, "py"), 1)])), func(): return _S.logical("&&", _S.call_value(_S.read(_v22, "inside"), [_S.read(_v22, "px"), _S.binary("-", _S.read(_v22, "py"), 1)]), func(): return _S.binary("<", _S.read(_v22, "py"), _S.binary("-", _S.read(_v22, "base"), 1))))):
					_S.invoke(_S.read(_v22, "p"), "dot", [_S.read(_v22, "px"), _S.read(_v22, "py"), _S.prop(_S.read(_v22, "R"), 0), _S.read(_v22, "a")])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "px", 1, "+=", true)
				continue
			if _S.truth(_S.prop(_S.read(_v21, "opts"), "white")):
				var _v23 = _S.scope(_v21)
				_S.invoke(_S.read(_v23, "p"), "dot", [_S.read(_v23, "px"), _S.read(_v23, "py"), _S.read(_v23, "WHITE"), _S.read(_v23, "a")])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "px", 1, "+=", true)
				continue
			_S.define(_v21, "u", _S.binary("/", _S.binary("-", _S.read(_v21, "base"), _S.binary("+", _S.read(_v21, "py"), 0.5)), _S.read(_v21, "h")))
			_S.define(_v21, "rx", _S.binary("+", _S.read(_v21, "ridge0"), _S.binary("*", _S.binary("-", _S.binary("+", _S.read(_v21, "x"), _S.read(_v21, "lean")), _S.read(_v21, "ridge0")), _S.read(_v21, "u"))))
			_S.define(_v21, "c", _S.binary("+", _S.read(_v21, "x"), _S.binary("*", _S.read(_v21, "lean"), _S.read(_v21, "u"))))
			_S.define(_v21, "hw", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v21, "w"), 2), _S.binary("-", 1, _S.read(_v21, "u"))), 0.35))
			_S.define(_v21, "fx", _S.binary("+", _S.read(_v21, "px"), 0.5))
			_S.define(_v21, "col", (_S.read(_v21, "WHITE") if _S.truth(_S.binary(">", _S.read(_v21, "u"), 0.9)) else (_S.call_value(_S.read(_v21, "C"), [1]) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.binary("-", _S.read(_v21, "fx"), _S.read(_v21, "rx"))]), 0.55)) else ((_S.call_value(_S.read(_v21, "C"), [1]) if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v21, "fx"), _S.binary("-", _S.read(_v21, "c"), _S.read(_v21, "hw"))), 1)) else (_S.call_value(_S.read(_v21, "C"), [2]) if _S.truth(_S.binary(">", _S.binary("/", _S.binary("-", _S.read(_v21, "fx"), _S.binary("-", _S.read(_v21, "c"), _S.read(_v21, "hw"))), _S.invoke(_S.read(_v21, "Math"), "max", [1, _S.binary("-", _S.read(_v21, "rx"), _S.binary("-", _S.read(_v21, "c"), _S.read(_v21, "hw")))])), 0.55)) else _S.call_value(_S.read(_v21, "C"), [3]))) if _S.truth(_S.binary("<", _S.read(_v21, "fx"), _S.read(_v21, "rx"))) else (_S.call_value(_S.read(_v21, "C"), [_S.invoke(_S.read(_v21, "Math"), "min", [_S.binary("-", _S.read(_v21, "n"), 2), 6])]) if _S.truth(_S.binary("<", _S.binary("-", _S.binary("+", _S.read(_v21, "c"), _S.read(_v21, "hw")), _S.read(_v21, "fx")), 1.2)) else (_S.call_value(_S.read(_v21, "C"), [5]) if _S.truth(_S.binary(">", _S.binary("/", _S.binary("-", _S.read(_v21, "fx"), _S.read(_v21, "rx")), _S.invoke(_S.read(_v21, "Math"), "max", [1, _S.binary("-", _S.binary("+", _S.read(_v21, "c"), _S.read(_v21, "hw")), _S.read(_v21, "rx"))])), 0.5)) else _S.call_value(_S.read(_v21, "C"), [4])))))))
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v21, "glint"), 0), func(): return _S.binary("<=", _S.read(_v21, "fx"), _S.binary("+", _S.read(_v21, "rx"), 0.6)))):
				var _v24 = _S.scope(_v21)
				_S.define(_v24, "g", _S.invoke(_S.read(_v24, "Math"), "abs", [_S.binary("-", _S.read(_v24, "u"), _S.read(_v24, "glint"))]))
				if _S.truth(_S.binary("<", _S.read(_v24, "g"), 0.05)):
					_S.write(_v24, "col", _S.read(_v24, "WHITE"), "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v24, "g"), 0.1)):
						_S.write(_v24, "col", _S.call_value(_S.read(_v24, "C"), [1]), "=", false)
			_S.invoke(_S.read(_v21, "p"), "dot", [_S.read(_v21, "px"), _S.read(_v21, "py"), _S.read(_v21, "col"), _S.read(_v21, "a")])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "px", 1, "+=", true)
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "py", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "R"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.binary("-", _S.read(_e, "n"), 1), _S.read(_e, "i"))]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "base"), _S.binary("+", _S.read(_e, "py"), 0.5)), _S.read(_e, "h")))
	return _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<=", _S.read(_e, "u"), 1)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_e, "px"), 0.5), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "lean"), _S.read(_e, "u"))))]), _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "w"), 2), _S.binary("-", 1, _S.read(_e, "u"))), 0.35)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	return _S.prop(_S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "r"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "length"))])])]))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "R", _S.logical("??", _S.prop(_S.read(_e, "opts"), "rng"), func(): return _S.construct(_S.read(_e, "Rng"), [_S.logical("??", _S.prop(_S.read(_e, "opts"), "seed"), func(): return 1)])), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "ground", _S.logical("??", _S.prop(_S.read(_e, "opts"), "ground"), func(): return _S.function_value(_e, "_f9")), "=", false)
	_S.set_prop(_S.read(_e, "this"), "sparks", _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "opts"), "sparks"), func(): return _S.read(_e, "HOT")), "map", [_S.read(_e, "hex")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "haze", (null if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "opts"), "haze"), null)) else _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "opts"), "haze")])), "=", false)
	_S.set_prop(_S.read(_e, "this"), "onLand", _S.logical("??", _S.prop(_S.read(_e, "opts"), "onLand"), func(): return null), "=", false)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return INF

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	_S.define(_e, "col", _S.coalesce(_S.arg(_args, 6), func(): return _S.read(_e, "WHITE")))
	_S.define(_e, "size", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "delay", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "flag", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"k": _S.read(_e, "k")}, {"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}, {"col": (_S.call_value(_S.read(_e, "hex"), [_S.read(_e, "col")]) if _S.truth(_S.read(_e, "col")) else 0)}, {"size": _S.read(_e, "size")}, {"seed": _S.binary("*", _S.invoke(_S.prop(_S.read(_e, "this"), "R"), "next", []), 100)}, {"delay": _S.read(_e, "delay")}, {"flag": _S.read(_e, "flag")}])])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "R", _S.prop(_S.read(_e, "this"), "R"))
	_S.define(_e, "t", _S.prop(_S.read(_e, "this"), "t"))
	var _v25 = _S.scope(_e)
	_S.define(_v25, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v25, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v25, "i"), 0)):
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "p", _S.prop(_S.prop(_S.read(_v26, "this"), "list"), _S.read(_v26, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v26, "p"), "delay"), 0)):
			var _v27 = _S.scope(_v26)
			_S.set_prop(_S.read(_v27, "p"), "delay", _S.read(_v27, "dt"), "-=", false)
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v26, "p"), "life", _S.read(_v26, "dt"), "-=", false), 0)):
			var _v28 = _S.scope(_v26)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v28, "p"), "k"), _S.prop(_S.read(_v28, "P"), "FIRE")), func(): return _S.binary("&", _S.prop(_S.read(_v28, "p"), "flag"), _S.prop(_S.read(_v28, "PF"), "SMOKES")))):
				var _v29 = _S.scope(_v28)
				_S.define(_v29, "big", _S.binary("&", _S.prop(_S.read(_v29, "p"), "flag"), _S.prop(_S.read(_v29, "PF"), "BIG")))
				_S.invoke(_S.read(_v29, "this"), "spawn", [_S.prop(_S.read(_v29, "P"), "SMOKE"), _S.prop(_S.read(_v29, "p"), "x"), _S.prop(_S.read(_v29, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v29, "p"), "vx"), 0.6), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v29, "p"), "vy"), 0.6), 6), (_S.invoke(_S.read(_v29, "R"), "range", [1.3, 2.3]) if _S.truth(_S.read(_v29, "big")) else _S.invoke(_S.read(_v29, "R"), "range", [0.8, 1.4])), 0, _S.binary("*", _S.prop(_S.read(_v29, "p"), "size"), (0.85 if _S.truth(_S.read(_v29, "big")) else 0.7)), 0, (_S.prop(_S.read(_v29, "PF"), "BIG") if _S.truth(_S.read(_v29, "big")) else 0)])
			_S.invoke(_S.prop(_S.read(_v28, "this"), "list"), "splice", [_S.read(_v28, "i"), 1])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
			continue
		var _v30 = _S.prop(_S.read(_v26, "p"), "k")
		var _v31 = false
		while true:
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "FIRE")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", 95, _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 17), _S.prop(_S.read(_v26, "p"), "seed"))]), 30), _S.read(_v26, "dt")), "+=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 5), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 3.2), _S.read(_v26, "dt")), "-=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "GRIT")):
				_v31 = true
				var _v32 = _S.scope(_v26)
				_S.set_prop(_S.read(_v32, "p"), "vy", _S.binary("*", _S.read(_v32, "GRAVITY"), _S.read(_v32, "dt")), "+=", false)
				_S.set_prop(_S.read(_v32, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v32, "p"), "vx"), 0.8), _S.read(_v32, "dt")), "-=", false)
				_S.define(_v32, "g", _S.invoke(_S.read(_v32, "this"), "ground", [_S.prop(_S.read(_v32, "p"), "x")]))
				_S.define(_v32, "ny", _S.binary("+", _S.prop(_S.read(_v32, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v32, "p"), "vy"), _S.read(_v32, "dt"))))
				_S.set_prop(_S.read(_v32, "p"), "x", _S.binary("*", _S.prop(_S.read(_v32, "p"), "vx"), _S.read(_v32, "dt")), "+=", false)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v32, "p"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v32, "p"), "y"), _S.read(_v32, "g"))), func(): return _S.binary(">=", _S.read(_v32, "ny"), _S.read(_v32, "g")))):
					var _v33 = _S.scope(_v32)
					_S.set_prop(_S.read(_v33, "p"), "y", _S.binary("-", _S.read(_v33, "g"), 0.25), "=", false)
					if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v33, "p"), "vy"), 130), func(): return _S.invoke(_S.read(_v33, "R"), "chance", [0.4]))):
						_S.last([_S.set_prop(_S.read(_v33, "p"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v33, "p"), "vy")), 0.25), "=", false), _S.set_prop(_S.read(_v33, "p"), "vx", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v33, "p"), "vx"), 0.5), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 10), 10])), "=", false)])
					else:
						_S.last([_S.set_prop(_S.read(_v33, "p"), "vx", _S.set_prop(_S.read(_v33, "p"), "vy", 0, "=", false), "=", false), _S.set_prop(_S.read(_v33, "p"), "life", _S.invoke(_S.read(_v33, "Math"), "min", [_S.prop(_S.read(_v33, "p"), "life"), 0.5]), "=", false)])
				else:
					_S.set_prop(_S.read(_v32, "p"), "y", _S.read(_v32, "ny"), "=", false)
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "-=", true)
				continue
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "BRAND")):
				_v31 = true
				var _v34 = _S.scope(_v26)
				_S.set_prop(_S.read(_v34, "p"), "vy", _S.binary("*", _S.binary("*", _S.read(_v34, "GRAVITY"), 0.8), _S.read(_v34, "dt")), "+=", false)
				_S.set_prop(_S.read(_v34, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v34, "p"), "vx"), 0.9), _S.read(_v34, "dt")), "-=", false)
				if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [_S.binary("*", 0.9, _S.invoke(_S.read(_v34, "Math"), "min", [1, _S.binary("*", _S.read(_v34, "dt"), 60)]))])):
					_S.invoke(_S.read(_v34, "this"), "spawn", [_S.prop(_S.read(_v34, "P"), "FIRE"), _S.prop(_S.read(_v34, "p"), "x"), _S.prop(_S.read(_v34, "p"), "y"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v34, "p"), "vx"), 0.1), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 7), 7])), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v34, "p"), "vy"), 0.1), 10), _S.invoke(_S.read(_v34, "R"), "range", [0.16, 0.32]), 0, _S.binary("*", _S.invoke(_S.read(_v34, "R"), "range", [0.9, 1.7]), _S.binary("+", 0.5, _S.binary("*", _S.binary("/", _S.prop(_S.read(_v34, "p"), "life"), _S.prop(_S.read(_v34, "p"), "max")), 0.6))), 0, (_S.prop(_S.read(_v34, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.4])) else 0)])
				_S.define(_v34, "g", _S.invoke(_S.read(_v34, "this"), "ground", [_S.prop(_S.read(_v34, "p"), "x")]))
				_S.define(_v34, "ny", _S.binary("+", _S.prop(_S.read(_v34, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v34, "p"), "vy"), _S.read(_v34, "dt"))))
				_S.set_prop(_S.read(_v34, "p"), "x", _S.binary("*", _S.prop(_S.read(_v34, "p"), "vx"), _S.read(_v34, "dt")), "+=", false)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v34, "p"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v34, "p"), "y"), _S.read(_v34, "g"))), func(): return _S.binary(">=", _S.read(_v34, "ny"), _S.read(_v34, "g")))):
					var _v35 = _S.scope(_v34)
					_S.optional_call(_S.prop(_S.read(_v35, "this"), "onLand"), [_S.prop(_S.read(_v35, "p"), "x"), _S.read(_v35, "g")])
					_S.invoke(_S.prop(_S.read(_v35, "this"), "list"), "splice", [_S.read(_v35, "i"), 1])
				else:
					_S.set_prop(_S.read(_v34, "p"), "y", _S.read(_v34, "ny"), "=", false)
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "-=", true)
				continue
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "SPARK")):
				_v31 = true
				var _v36 = _S.scope(_v26)
				_S.set_prop(_S.read(_v36, "p"), "vy", _S.binary("*", _S.binary("*", _S.read(_v36, "GRAVITY"), 0.45), _S.read(_v36, "dt")), "+=", false)
				_S.set_prop(_S.read(_v36, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v36, "p"), "vx"), 2.2), _S.read(_v36, "dt")), "-=", false)
				_S.set_prop(_S.read(_v36, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v36, "p"), "vy"), 2.2), _S.read(_v36, "dt")), "-=", false)
				_S.define(_v36, "g", _S.invoke(_S.read(_v36, "this"), "ground", [_S.prop(_S.read(_v36, "p"), "x")]))
				_S.define(_v36, "ny", _S.binary("+", _S.prop(_S.read(_v36, "p"), "y"), _S.binary("*", _S.prop(_S.read(_v36, "p"), "vy"), _S.read(_v36, "dt"))))
				_S.set_prop(_S.read(_v36, "p"), "x", _S.binary("*", _S.prop(_S.read(_v36, "p"), "vx"), _S.read(_v36, "dt")), "+=", false)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v36, "p"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v36, "p"), "y"), _S.read(_v36, "g"))), func(): return _S.binary(">=", _S.read(_v36, "ny"), _S.read(_v36, "g")))):
					_S.last([_S.set_prop(_S.read(_v36, "p"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v36, "p"), "vy")), 0.45), "=", false), _S.set_prop(_S.read(_v36, "p"), "vx", 0.7, "*=", false), _S.set_prop(_S.read(_v36, "p"), "y", _S.binary("-", _S.read(_v36, "g"), 0.25), "=", false)])
				else:
					_S.set_prop(_S.read(_v36, "p"), "y", _S.read(_v36, "ny"), "=", false)
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 1, "-=", true)
				continue
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "STREAK")):
				_v31 = true
				_S.last([_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 3), _S.read(_v26, "dt")), "+=", false), _S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 3), _S.read(_v26, "dt")), "+=", false)])
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "FLAKE")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 2.2), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 2.2), _S.read(_v26, "dt")), _S.binary("*", 35, _S.read(_v26, "dt"))), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v26, "this"), "t"), 2.5), _S.prop(_S.read(_v26, "p"), "seed"))]), 7), _S.read(_v26, "dt")), "+=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "EMBER")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("+", _S.unary("-", 30), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 3), _S.prop(_S.read(_v26, "p"), "seed"))]), 20)), _S.read(_v26, "dt")), "+=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 2.3), _S.prop(_S.read(_v26, "p"), "seed"))]), 45), _S.read(_v26, "dt")), "+=", false)
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 1.6), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 1.6), _S.read(_v26, "dt")), "-=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "SMOKE")):
				_v31 = true
				var _v37 = _S.scope(_v26)
				_S.define(_v37, "big", _S.binary("&", _S.prop(_S.read(_v37, "p"), "flag"), _S.prop(_S.read(_v37, "PF"), "BIG")))
				_S.set_prop(_S.read(_v37, "p"), "vy", _S.binary("*", (23 if _S.truth(_S.read(_v37, "big")) else 16), _S.read(_v37, "dt")), "-=", false)
				_S.set_prop(_S.read(_v37, "p"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v37, "t"), 1.3), _S.prop(_S.read(_v37, "p"), "seed"))]), 8), _S.read(_v37, "dt")), "+=", false)
				_S.set_prop(_S.read(_v37, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v37, "p"), "vx"), 1.6), _S.read(_v37, "dt")), "-=", false)
				_S.set_prop(_S.read(_v37, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v37, "p"), "vy"), 1.2), _S.read(_v37, "dt")), "-=", false)
				break
			if _v31 or _S.binary("===", _v30, _S.prop(_S.read(_v26, "P"), "MOTE")):
				_v31 = true
				_S.set_prop(_S.read(_v26, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), 0.6), _S.read(_v26, "dt")), "-=", false)
				_S.set_prop(_S.read(_v26, "p"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), 0.6), _S.read(_v26, "dt")), "-=", false)
				break
			if _v31 or true:
				_v31 = true
				var _v38 = _S.scope(_v26)
				_S.define(_v38, "drag", (4 if _S.truth(_S.invoke(_S.read(_v38, "SOFT"), "has", [_S.prop(_S.read(_v38, "p"), "k")])) else 1.6))
				_S.set_prop(_S.read(_v38, "p"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v38, "p"), "vx"), _S.read(_v38, "drag")), _S.read(_v38, "dt")), "-=", false)
				_S.set_prop(_S.read(_v38, "p"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v38, "p"), "vy"), _S.read(_v38, "drag")), _S.read(_v38, "dt")), _S.binary("*", 5, _S.read(_v38, "dt"))), "-=", false)
			break
		_S.set_prop(_S.read(_v26, "p"), "x", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vx"), _S.read(_v26, "dt")), "+=", false)
		_S.set_prop(_S.read(_v26, "p"), "y", _S.binary("*", _S.prop(_S.read(_v26, "p"), "vy"), _S.read(_v26, "dt")), "+=", false)
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "i", 1, "-=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "layer", _S.arg(_args, 1))
	for _v39 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "q", _v39)
		var _v41 = _S.scope(_v40)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v41, "q"), "delay"), 0)):
			continue
		if _S.truth(_S.logical("&&", _S.read(_v41, "layer"), func(): return _S.binary("!==", ("back" if _S.truth(_S.logical("||", _S.invoke(_S.read(_v41, "SOFT"), "has", [_S.prop(_S.read(_v41, "q"), "k")]), func(): return _S.binary("&", _S.prop(_S.read(_v41, "q"), "flag"), _S.prop(_S.read(_v41, "PF"), "BACK")))) else "front"), _S.read(_v41, "layer")))):
			continue
		_S.define(_v41, "k", _S.binary("/", _S.prop(_S.read(_v41, "q"), "life"), _S.prop(_S.read(_v41, "q"), "max")))
		_S.define(_v41, "x", _S.prop(_S.read(_v41, "q"), "x"))
		_S.define(_v41, "y", _S.prop(_S.read(_v41, "q"), "y"))
		_S.define(_v41, "sp", _S.logical("||", _S.invoke(_S.read(_v41, "Math"), "hypot", [_S.prop(_S.read(_v41, "q"), "vx"), _S.prop(_S.read(_v41, "q"), "vy")]), func(): return 1))
		_S.define(_v41, "ux", _S.binary("/", _S.prop(_S.read(_v41, "q"), "vx"), _S.read(_v41, "sp")))
		_S.define(_v41, "uy", _S.binary("/", _S.prop(_S.read(_v41, "q"), "vy"), _S.read(_v41, "sp")))
		var _v42 = _S.prop(_S.read(_v41, "q"), "k")
		var _v43 = false
		while true:
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "SPARK")):
				_v43 = true
				var _v44 = _S.scope(_v41)
				_S.define(_v44, "S", _S.prop(_S.read(_v44, "this"), "sparks"))
				_S.define(_v44, "head", (_S.prop(_S.read(_v44, "S"), 0) if _S.truth(_S.binary(">", _S.read(_v44, "k"), 0.6)) else (_S.prop(_S.read(_v44, "S"), 1) if _S.truth(_S.binary(">", _S.read(_v44, "k"), 0.3)) else _S.prop(_S.read(_v44, "S"), 2))))
				_S.define(_v44, "len", _S.invoke(_S.read(_v44, "Math"), "min", [9, _S.binary("+", 1, _S.binary("*", _S.read(_v44, "sp"), 0.022))]))
				_S.invoke(_S.read(_v44, "p"), "line", [_S.binary("-", _S.read(_v44, "x"), _S.binary("*", _S.read(_v44, "ux"), _S.read(_v44, "len"))), _S.binary("-", _S.read(_v44, "y"), _S.binary("*", _S.read(_v44, "uy"), _S.read(_v44, "len"))), _S.binary("-", _S.read(_v44, "x"), _S.binary("*", _S.binary("*", _S.read(_v44, "ux"), _S.read(_v44, "len")), 0.4)), _S.binary("-", _S.read(_v44, "y"), _S.binary("*", _S.binary("*", _S.read(_v44, "uy"), _S.read(_v44, "len")), 0.4)), (_S.read(_v44, "head") if _S.truth(_S.binary(">", _S.read(_v44, "k"), 0.5)) else _S.prop(_S.read(_v44, "S"), _S.binary("-", _S.prop(_S.read(_v44, "S"), "length"), 1)))])
				_S.invoke(_S.read(_v44, "p"), "line", [_S.binary("-", _S.read(_v44, "x"), _S.binary("*", _S.binary("*", _S.read(_v44, "ux"), _S.read(_v44, "len")), 0.45)), _S.binary("-", _S.read(_v44, "y"), _S.binary("*", _S.binary("*", _S.read(_v44, "uy"), _S.read(_v44, "len")), 0.45)), _S.read(_v44, "x"), _S.read(_v44, "y"), _S.read(_v44, "head")])
				_S.invoke(_S.read(_v44, "p"), "glow", [_S.read(_v44, "x"), _S.read(_v44, "y"), 3, _S.read(_v44, "head"), _S.binary("*", 0.45, _S.read(_v44, "k"))])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "MOTE")):
				_v43 = true
				var _v45 = _S.scope(_v41)
				_S.define(_v45, "len", _S.binary("*", _S.invoke(_S.read(_v45, "Math"), "min", [16, _S.binary("+", 0.5, _S.binary("*", _S.read(_v45, "sp"), 0.026))]), _S.prop(_S.read(_v45, "q"), "size")))
				_S.define(_v45, "a", (_S.binary("/", _S.read(_v45, "k"), 0.35) if _S.truth(_S.binary("<", _S.read(_v45, "k"), 0.35)) else 1))
				_S.invoke(_S.read(_v45, "p"), "line", [_S.binary("-", _S.read(_v45, "x"), _S.binary("*", _S.read(_v45, "ux"), _S.read(_v45, "len"))), _S.binary("-", _S.read(_v45, "y"), _S.binary("*", _S.read(_v45, "uy"), _S.read(_v45, "len"))), _S.binary("-", _S.read(_v45, "x"), _S.binary("*", _S.binary("*", _S.read(_v45, "ux"), _S.read(_v45, "len")), 0.35)), _S.binary("-", _S.read(_v45, "y"), _S.binary("*", _S.binary("*", _S.read(_v45, "uy"), _S.read(_v45, "len")), 0.35)), _S.call_value(_S.read(_v45, "scale"), [_S.prop(_S.read(_v45, "q"), "col"), 0.55]), _S.read(_v45, "a")])
				_S.invoke(_S.read(_v45, "p"), "line", [_S.binary("-", _S.read(_v45, "x"), _S.binary("*", _S.binary("*", _S.read(_v45, "ux"), _S.read(_v45, "len")), 0.4)), _S.binary("-", _S.read(_v45, "y"), _S.binary("*", _S.binary("*", _S.read(_v45, "uy"), _S.read(_v45, "len")), 0.4)), _S.read(_v45, "x"), _S.read(_v45, "y"), _S.prop(_S.read(_v45, "q"), "col"), _S.read(_v45, "a")])
				_S.invoke(_S.read(_v45, "p"), "glow", [_S.read(_v45, "x"), _S.read(_v45, "y"), _S.binary("+", 2.5, _S.prop(_S.read(_v45, "q"), "size")), _S.prop(_S.read(_v45, "q"), "col"), _S.binary("*", 0.4, _S.read(_v45, "k"))])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "STREAK")):
				_v43 = true
				var _v46 = _S.scope(_v41)
				_S.define(_v46, "L", _S.call_value(_S.read(_v46, "clamp"), [_S.binary("/", _S.read(_v46, "sp"), 30), 1, 7]))
				var _v47 = _S.scope(_v46)
				_S.define(_v47, "d", _S.read(_v47, "L"))
				while _S.truth(_S.binary(">=", _S.read(_v47, "d"), 0)):
					_S.invoke(_S.read(_v47, "p"), "dot", [_S.binary("-", _S.read(_v47, "x"), _S.binary("*", _S.read(_v47, "ux"), _S.read(_v47, "d"))), _S.binary("-", _S.read(_v47, "y"), _S.binary("*", _S.read(_v47, "uy"), _S.read(_v47, "d"))), (_S.read(_v47, "WHITE") if _S.truth(_S.binary("<", _S.read(_v47, "d"), 1)) else (_S.prop(_S.read(_v47, "q"), "col") if _S.truth(_S.binary("<", _S.read(_v47, "d"), _S.binary("*", _S.read(_v47, "L"), 0.5))) else _S.call_value(_S.read(_v47, "scale"), [_S.prop(_S.read(_v47, "q"), "col"), 0.6]))), (1 if _S.truth(_S.binary("<", _S.read(_v47, "d"), _S.binary("*", _S.read(_v47, "L"), 0.5))) else _S.binary("-", 1.2, _S.binary("/", _S.read(_v47, "d"), _S.read(_v47, "L"))))])
					_v47 = _S.iteration(_v47)
					_S.write(_v47, "d", 0.5, "-=", false)
				_S.invoke(_S.read(_v46, "p"), "glow", [_S.read(_v46, "x"), _S.read(_v46, "y"), 4, _S.prop(_S.read(_v46, "q"), "col"), 0.4])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "FLAKE")):
				_v43 = true
				var _v48 = _S.scope(_v41)
				_S.define(_v48, "a", _S.invoke(_S.read(_v48, "Math"), "min", [1, _S.binary("*", _S.read(_v48, "k"), 3)]))
				_S.invoke(_S.read(_v48, "p"), "dot", [_S.read(_v48, "x"), _S.read(_v48, "y"), _S.prop(_S.read(_v48, "q"), "col"), _S.read(_v48, "a")])
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v48, "q"), "size"), 1.3)):
					for _v49 in _S.array(_S.read(_v48, "CROSS")):
						var _v50 = _S.scope(_v48)
						var _v51 = _v49
						_S.define(_v50, "dx", _S.prop(_v51, 0))
						_S.define(_v50, "dy", _S.prop(_v51, 1))
						_S.invoke(_S.read(_v50, "p"), "dot", [_S.binary("+", _S.read(_v50, "x"), _S.read(_v50, "dx")), _S.binary("+", _S.read(_v50, "y"), _S.read(_v50, "dy")), _S.call_value(_S.read(_v50, "scale"), [_S.prop(_S.read(_v50, "q"), "col"), 0.8]), _S.binary("*", _S.read(_v50, "a"), 0.8)])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "VAPOUR")):
				_v43 = true
				var _v52 = _S.scope(_v41)
				_S.define(_v52, "r", _S.binary("*", _S.prop(_S.read(_v52, "q"), "size"), _S.binary("+", 0.6, _S.binary("*", _S.binary("-", 1, _S.read(_v52, "k")), 0.9))))
				_S.invoke(_S.read(_v52, "p"), "disc", [_S.read(_v52, "x"), _S.read(_v52, "y"), _S.read(_v52, "r"), _S.prop(_S.read(_v52, "q"), "col"), _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "pow", [_S.read(_v52, "k"), 1.3]), 0.45)])
				if _S.truth(_S.prop(_S.read(_v52, "this"), "haze")):
					_S.invoke(_S.read(_v52, "p"), "glow", [_S.read(_v52, "x"), _S.read(_v52, "y"), _S.binary("*", _S.read(_v52, "r"), 1.8), _S.prop(_S.read(_v52, "this"), "haze"), _S.binary("*", 0.16, _S.read(_v52, "k"))])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "DUST")):
				_v43 = true
				_S.invoke(_S.read(_v41, "p"), "disc", [_S.read(_v41, "x"), _S.read(_v41, "y"), _S.binary("*", _S.prop(_S.read(_v41, "q"), "size"), _S.binary("+", 0.6, _S.binary("*", _S.binary("-", 1, _S.read(_v41, "k")), 0.9))), _S.prop(_S.read(_v41, "q"), "col"), _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "pow", [_S.read(_v41, "k"), 1.3]), 0.7)])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "SMOKE")):
				_v43 = true
				var _v53 = _S.scope(_v41)
				_S.define(_v53, "age", _S.binary("-", 1, _S.read(_v53, "k")))
				_S.define(_v53, "big", _S.binary("&", _S.prop(_S.read(_v53, "q"), "flag"), _S.prop(_S.read(_v53, "PF"), "BIG")))
				_S.define(_v53, "r", _S.binary("*", _S.prop(_S.read(_v53, "q"), "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_v53, "Math"), "min", [1, _S.binary("*", _S.read(_v53, "age"), 2.5)]), 0.45)), _S.binary("*", _S.read(_v53, "age"), (0.5 if _S.truth(_S.read(_v53, "big")) else 0.4)))))
				_S.define(_v53, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v53, "Math"), "min", [1, _S.binary("*", _S.read(_v53, "age"), 12)]), _S.invoke(_S.read(_v53, "Math"), "min", [1, _S.binary("*", _S.read(_v53, "k"), 2.4)])), (0.7 if _S.truth(_S.read(_v53, "big")) else 0.58)))
				_S.define(_v53, "c", (_S.call_value(_S.read(_v53, "mix"), [_S.prop(_S.read(_v53, "q"), "col"), _S.call_value(_S.read(_v53, "rampAt"), [_S.read(_v53, "SMOKE_RAMP"), _S.read(_v53, "age")]), _S.read(_v53, "age")]) if _S.truth(_S.prop(_S.read(_v53, "q"), "col")) else _S.call_value(_S.read(_v53, "rampAt"), [_S.read(_v53, "SMOKE_RAMP"), _S.binary("*", _S.read(_v53, "age"), 1.05)])))
				_S.invoke(_S.read(_v53, "p"), "disc", [_S.read(_v53, "x"), _S.read(_v53, "y"), _S.read(_v53, "r"), _S.read(_v53, "c"), _S.binary("*", _S.read(_v53, "a"), 0.45)])
				_S.invoke(_S.read(_v53, "p"), "disc", [_S.binary("+", _S.read(_v53, "x"), _S.binary("*", _S.read(_v53, "r"), 0.05)), _S.binary("+", _S.read(_v53, "y"), _S.binary("*", _S.read(_v53, "r"), 0.06)), _S.binary("*", _S.read(_v53, "r"), 0.74), _S.read(_v53, "c"), _S.binary("*", _S.read(_v53, "a"), 0.62)])
				if _S.truth(_S.binary("<", _S.read(_v53, "age"), 0.5)):
					_S.invoke(_S.read(_v53, "p"), "disc", [_S.binary("-", _S.read(_v53, "x"), _S.binary("*", _S.read(_v53, "r"), 0.22)), _S.binary("-", _S.read(_v53, "y"), _S.binary("*", _S.read(_v53, "r"), 0.3)), _S.binary("*", _S.read(_v53, "r"), 0.5), _S.call_value(_S.read(_v53, "mix"), [_S.read(_v53, "c"), _S.read(_v53, "WHITE"), 0.12]), _S.binary("*", _S.binary("*", _S.read(_v53, "a"), 0.4), _S.binary("-", 1, _S.binary("*", _S.read(_v53, "age"), 2)))])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "FIRE")):
				_v43 = true
				var _v54 = _S.scope(_v41)
				_S.define(_v54, "age", _S.binary("-", 1, _S.read(_v54, "k")))
				_S.define(_v54, "heat", _S.invoke(_S.read(_v54, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_v54, "Math"), "pow", [_S.read(_v54, "age"), 0.62]), _S.binary("*", _S.binary("%", _S.prop(_S.read(_v54, "q"), "seed"), 1), 0.1))]))
				_S.define(_v54, "F", _S.read(_v54, "FIRE_RAMP"))
				_S.define(_v54, "n", _S.prop(_S.read(_v54, "F"), "length"))
				_S.define(_v54, "idx", _S.invoke(_S.read(_v54, "Math"), "min", [_S.binary("-", _S.read(_v54, "n"), 2), _S.invoke(_S.read(_v54, "Math"), "floor", [_S.binary("*", _S.read(_v54, "heat"), _S.binary("-", _S.read(_v54, "n"), 1))])]))
				_S.define(_v54, "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v54, "q"), "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_v54, "Math"), "min", [1, _S.binary("*", _S.read(_v54, "age"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_v54, "age"), 0.55))))
				_S.define(_v54, "c", _S.prop(_S.read(_v54, "F"), _S.read(_v54, "idx")))
				if _S.truth(_S.binary(">=", _S.read(_v54, "idx"), _S.binary("-", _S.read(_v54, "n"), 2))):
					_S.invoke(_S.read(_v54, "p"), "disc", [_S.read(_v54, "x"), _S.read(_v54, "y"), _S.read(_v54, "r"), _S.read(_v54, "c"), _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "min", [1, _S.binary("*", _S.read(_v54, "k"), 3)]), 0.85)])
				else:
					var _v55 = _S.scope(_v54)
					_S.invoke(_S.read(_v55, "p"), "circle", [_S.read(_v55, "x"), _S.read(_v55, "y"), _S.read(_v55, "r"), _S.prop(_S.read(_v55, "F"), _S.invoke(_S.read(_v55, "Math"), "min", [_S.binary("-", _S.read(_v55, "n"), 1), _S.binary("+", _S.read(_v55, "idx"), 2)]))])
					_S.invoke(_S.read(_v55, "p"), "circle", [_S.binary("-", _S.read(_v55, "x"), _S.binary("*", _S.read(_v55, "r"), 0.16)), _S.binary("-", _S.read(_v55, "y"), _S.binary("*", _S.read(_v55, "r"), 0.22)), _S.binary("*", _S.read(_v55, "r"), 0.78), _S.read(_v55, "c")])
					if _S.truth(_S.binary(">", _S.read(_v55, "r"), 1.6)):
						_S.invoke(_S.read(_v55, "p"), "circle", [_S.read(_v55, "x"), _S.binary("-", _S.read(_v55, "y"), _S.binary("*", _S.read(_v55, "r"), 0.9)), _S.binary("*", _S.read(_v55, "r"), 0.42), _S.read(_v55, "c")])
					if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v55, "idx"), 3), func(): return _S.binary(">", _S.read(_v55, "r"), 1.8))):
						_S.invoke(_S.read(_v55, "p"), "circle", [_S.binary("-", _S.read(_v55, "x"), _S.binary("*", _S.read(_v55, "r"), 0.28)), _S.binary("-", _S.read(_v55, "y"), _S.binary("*", _S.read(_v55, "r"), 0.34)), _S.binary("*", _S.read(_v55, "r"), 0.36), _S.prop(_S.read(_v55, "F"), _S.invoke(_S.read(_v55, "Math"), "max", [0, _S.binary("-", _S.read(_v55, "idx"), 1)]))])
					if _S.truth(_S.binary("<", _S.read(_v55, "idx"), 6)):
						_S.invoke(_S.read(_v55, "p"), "glow", [_S.read(_v55, "x"), _S.read(_v55, "y"), _S.binary("+", _S.binary("*", _S.read(_v55, "r"), 2.4), 2), _S.read(_v55, "c"), _S.binary("*", 0.18, _S.read(_v55, "k"))])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "BRAND")):
				_v43 = true
				_S.invoke(_S.read(_v41, "p"), "circle", [_S.read(_v41, "x"), _S.read(_v41, "y"), 1.6, _S.prop(_S.read(_v41, "HOT"), 3)])
				_S.invoke(_S.read(_v41, "p"), "px", [_S.read(_v41, "x"), _S.read(_v41, "y"), (_S.prop(_S.read(_v41, "HOT"), 0) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v41, "this"), "t"), 40), _S.prop(_S.read(_v41, "q"), "seed"))]), 0)) else _S.prop(_S.read(_v41, "HOT"), 1))])
				_S.invoke(_S.read(_v41, "p"), "px", [_S.binary("+", _S.read(_v41, "x"), 1), _S.read(_v41, "y"), _S.prop(_S.read(_v41, "HOT"), 1)])
				_S.invoke(_S.read(_v41, "p"), "glow", [_S.read(_v41, "x"), _S.read(_v41, "y"), 7, _S.prop(_S.read(_v41, "HOT"), 2), 0.45])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "GRIT")):
				_v43 = true
				if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v41, "k"), 0.25), func(): return _S.binary(">", _S.binary("*", _S.read(_v41, "k"), 4), 0.5))):
					var _v56 = _S.scope(_v41)
					_S.invoke(_S.read(_v56, "p"), "px", [_S.read(_v56, "x"), _S.read(_v56, "y"), _S.prop(_S.read(_v56, "q"), "col")])
					if _S.truth(_S.binary(">=", _S.prop(_S.read(_v56, "q"), "size"), 2)):
						_S.last([_S.invoke(_S.read(_v56, "p"), "px", [_S.binary("+", _S.read(_v56, "x"), 1), _S.read(_v56, "y"), _S.prop(_S.read(_v56, "q"), "col")]), _S.invoke(_S.read(_v56, "p"), "px", [_S.read(_v56, "x"), _S.binary("+", _S.read(_v56, "y"), 1), _S.call_value(_S.read(_v56, "scale"), [_S.prop(_S.read(_v56, "q"), "col"), 0.8])]), _S.invoke(_S.read(_v56, "p"), "px", [_S.binary("+", _S.read(_v56, "x"), 1), _S.binary("+", _S.read(_v56, "y"), 1), _S.call_value(_S.read(_v56, "scale"), [_S.prop(_S.read(_v56, "q"), "col"), 0.7])])])
				break
			if _v43 or _S.binary("===", _v42, _S.prop(_S.read(_v41, "P"), "EMBER")):
				_v43 = true
				var _v57 = _S.scope(_v41)
				_S.define(_v57, "c", (_S.prop(_S.prop(_S.read(_v57, "this"), "sparks"), 0) if _S.truth(_S.binary(">", _S.read(_v57, "k"), 0.6)) else (_S.prop(_S.prop(_S.read(_v57, "this"), "sparks"), 1) if _S.truth(_S.binary(">", _S.read(_v57, "k"), 0.3)) else _S.prop(_S.prop(_S.read(_v57, "this"), "sparks"), 2))))
				if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v57, "k"), 0.25), func(): return _S.binary("<", _S.invoke(_S.read(_v57, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v57, "this"), "t"), 40), _S.prop(_S.read(_v57, "q"), "seed"))]), 0))):
					break
				_S.invoke(_S.read(_v57, "p"), "px", [_S.read(_v57, "x"), _S.read(_v57, "y"), _S.read(_v57, "c")])
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v57, "q"), "size"), 1.5)):
					_S.invoke(_S.read(_v57, "p"), "px", [_S.read(_v57, "x"), _S.binary("+", _S.read(_v57, "y"), 1), _S.prop(_S.prop(_S.read(_v57, "this"), "sparks"), _S.binary("-", _S.prop(_S.prop(_S.read(_v57, "this"), "sparks"), "length"), 1))])
				_S.invoke(_S.read(_v57, "p"), "glow", [_S.read(_v57, "x"), _S.read(_v57, "y"), _S.binary("+", 3, _S.prop(_S.read(_v57, "q"), "size")), _S.read(_v57, "c"), _S.binary("*", 0.35, _S.read(_v57, "k"))])
				break
			if _v43 or true:
				_v43 = true
				var _v58 = _S.scope(_v41)
				_S.define(_v58, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v58, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v58, "this"), "t"), _S.binary("+", 8, _S.binary("%", _S.prop(_S.read(_v58, "q"), "seed"), 5))), _S.prop(_S.read(_v58, "q"), "seed"))]))))
				if _S.truth(_S.binary("<", _S.prop(_S.read(_v58, "q"), "size"), 1)):
					var _v59 = _S.scope(_v58)
					if _S.truth(_S.binary(">", _S.binary("*", _S.read(_v59, "tw"), _S.read(_v59, "k")), 0.25)):
						_S.invoke(_S.read(_v59, "p"), "px", [_S.read(_v59, "x"), _S.read(_v59, "y"), (_S.read(_v59, "WHITE") if _S.truth(_S.binary(">", _S.read(_v59, "tw"), 0.8)) else _S.prop(_S.read(_v59, "q"), "col"))])
					_S.invoke(_S.read(_v59, "p"), "glow", [_S.read(_v59, "x"), _S.read(_v59, "y"), 3, _S.prop(_S.read(_v59, "q"), "col"), _S.binary("*", _S.binary("*", 0.4, _S.read(_v59, "k")), _S.read(_v59, "tw"))])
					break
				_S.call_value(_S.read(_v58, "sparkle"), [_S.read(_v58, "p"), _S.read(_v58, "x"), _S.read(_v58, "y"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v58, "q"), "size"), _S.read(_v58, "tw")), _S.invoke(_S.read(_v58, "Math"), "min", [1, _S.binary("*", _S.read(_v58, "k"), 3)])), _S.prop(_S.read(_v58, "q"), "col"), _S.call_value(_S.read(_v58, "scale"), [_S.prop(_S.read(_v58, "q"), "col"), 0.75]), _S.binary("*", _S.binary("*", 0.5, _S.read(_v58, "k")), _S.read(_v58, "tw"))])
			break
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ps", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "ps", _S.read(_e, "ps"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "life", _S.arg(_args, 2))
	_S.define(_e, "power", _S.arg(_args, 3))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}, {"acc": _S.invoke(_S.prop(_S.prop(_S.read(_e, "this"), "ps"), "R"), "next", [])}, {"power": _S.read(_e, "power")}])])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "ps", _S.prop(_S.read(_e, "this"), "ps"))
	_S.define(_e, "R", _S.prop(_S.read(_e, "ps"), "R"))
	var _v60 = _S.scope(_e)
	_S.define(_v60, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v60, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v60, "i"), 0)):
		var _v61 = _S.scope(_v60)
		_S.define(_v61, "b", _S.prop(_S.prop(_S.read(_v61, "this"), "list"), _S.read(_v61, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v61, "b"), "life", _S.read(_v61, "dt"), "-=", false), 0)):
			var _v62 = _S.scope(_v61)
			_S.invoke(_S.prop(_S.read(_v62, "this"), "list"), "splice", [_S.read(_v62, "i"), 1])
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "-=", true)
			continue
		_S.define(_v61, "k", _S.binary("/", _S.prop(_S.read(_v61, "b"), "life"), _S.prop(_S.read(_v61, "b"), "max")))
		_S.define(_v61, "intensity", _S.binary("*", _S.prop(_S.read(_v61, "b"), "power"), (1 if _S.truth(_S.binary(">", _S.read(_v61, "k"), 0.7)) else _S.binary("+", 0.35, _S.binary("*", _S.binary("/", _S.read(_v61, "k"), 0.7), 0.65)))))
		var _v63 = _S.scope(_v61)
		_S.set_prop(_S.read(_v63, "b"), "acc", _S.binary("*", _S.read(_v63, "dt"), _S.binary("+", 6, _S.binary("*", 16, _S.read(_v63, "intensity")))), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v63, "b"), "acc"), 1)):
			var _v64 = _S.scope(_v63)
			_S.define(_v64, "s", _S.binary("*", _S.invoke(_S.read(_v64, "R"), "range", [1.2, 2.8]), _S.read(_v64, "intensity")))
			_S.invoke(_S.read(_v64, "ps"), "spawn", [_S.prop(_S.read(_v64, "P"), "FIRE"), _S.binary("+", _S.prop(_S.read(_v64, "b"), "x"), _S.invoke(_S.read(_v64, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("-", _S.prop(_S.read(_v64, "b"), "y"), _S.binary("*", _S.read(_v64, "s"), 0.6)), _S.invoke(_S.read(_v64, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v64, "R"), "range", [_S.unary("-", 30), _S.unary("-", 12)]), _S.invoke(_S.read(_v64, "R"), "range", [0.28, 0.6]), 0, _S.read(_v64, "s"), 0, _S.binary("|", _S.prop(_S.read(_v64, "PF"), "BACK"), (_S.prop(_S.read(_v64, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v64, "R"), "chance", [0.3])) else 0))])
			if _S.truth(_S.invoke(_S.read(_v64, "R"), "chance", [0.06])):
				_S.invoke(_S.read(_v64, "ps"), "spawn", [_S.prop(_S.read(_v64, "P"), "EMBER"), _S.prop(_S.read(_v64, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v64, "b"), "y"), 1.5), _S.invoke(_S.read(_v64, "R"), "range", [_S.unary("-", 15), 15]), _S.invoke(_S.read(_v64, "R"), "range", [_S.unary("-", 45), _S.unary("-", 15)]), _S.invoke(_S.read(_v64, "R"), "range", [0.6, 1.4]), _S.prop(_S.read(_v64, "HOT"), 2), 1, 0, _S.prop(_S.read(_v64, "PF"), "BACK")])
			_v63 = _S.iteration(_v63)
			_S.set_prop(_S.read(_v63, "b"), "acc", 1, "-=", true)
		_v60 = _S.iteration(_v60)
		_S.write(_v60, "i", 1, "-=", true)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v65 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v66 = _S.scope(_e)
		_S.define(_v66, "b", _v65)
		var _v67 = _S.scope(_v66)
		_S.define(_v67, "k", _S.binary("/", _S.prop(_S.read(_v67, "b"), "life"), _S.prop(_S.read(_v67, "b"), "max")))
		_S.invoke(_S.read(_v67, "p"), "px", [_S.prop(_S.read(_v67, "b"), "x"), _S.prop(_S.read(_v67, "b"), "y"), ((_S.prop(_S.read(_v67, "HOT"), 1) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v67, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v67, "b"), "life"), 31), _S.prop(_S.read(_v67, "b"), "x"))]), 0)) else _S.prop(_S.read(_v67, "HOT"), 2)) if _S.truth(_S.binary(">", _S.read(_v67, "k"), 0.4)) else _S.prop(_S.read(_v67, "HOT"), 3))])
		_S.invoke(_S.read(_v67, "p"), "glow", [_S.prop(_S.read(_v67, "b"), "x"), _S.prop(_S.read(_v67, "b"), "y"), _S.binary("+", 6, _S.binary("*", _S.binary("*", 5, _S.read(_v67, "k")), _S.prop(_S.read(_v67, "b"), "power"))), _S.prop(_S.read(_v67, "HOT"), 2), _S.binary("*", _S.binary("*", 0.3, _S.read(_v67, "k")), _S.prop(_S.read(_v67, "b"), "power"))])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "opts", _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "ground", _S.logical("??", _S.prop(_S.read(_e, "opts"), "ground"), func(): return _S.function_value(_e, "_f20")), "=", false)
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return INF

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "life", _S.logical("??", _S.prop(_S.read(_e, "b"), "life"), func(): return 1))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"kind": _S.prop(_S.read(_e, "B"), "SHARD")}, {"vx": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"s": 1}, {"c": _S.read(_e, "WHITE")}, {"g": 1}, {"drag": 0}, {"bounce": 0}, {"rest": false}, _S.read(_e, "b"), {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v68 = _S.scope(_e)
	_S.define(_v68, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v68, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v68, "i"), 0)):
		var _v69 = _S.scope(_v68)
		_S.define(_v69, "b", _S.prop(_S.prop(_S.read(_v69, "this"), "list"), _S.read(_v69, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v69, "b"), "life", _S.read(_v69, "dt"), "-=", false), 0)):
			var _v70 = _S.scope(_v69)
			_S.invoke(_S.prop(_S.read(_v70, "this"), "list"), "splice", [_S.read(_v70, "i"), 1])
			_v68 = _S.iteration(_v68)
			_S.write(_v68, "i", 1, "-=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v69, "b"), "rest")):
			_v68 = _S.iteration(_v68)
			_S.write(_v68, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v69, "b"), "vy", _S.binary("*", _S.binary("*", _S.read(_v69, "GRAVITY"), _S.prop(_S.read(_v69, "b"), "g")), _S.read(_v69, "dt")), "+=", false)
		_S.set_prop(_S.read(_v69, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v69, "b"), "vx"), _S.prop(_S.read(_v69, "b"), "drag")), _S.read(_v69, "dt")), "-=", false)
		_S.set_prop(_S.read(_v69, "b"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v69, "b"), "vy"), _S.prop(_S.read(_v69, "b"), "drag")), _S.read(_v69, "dt")), "-=", false)
		_S.set_prop(_S.read(_v69, "b"), "x", _S.binary("*", _S.prop(_S.read(_v69, "b"), "vx"), _S.read(_v69, "dt")), "+=", false)
		_S.set_prop(_S.read(_v69, "b"), "y", _S.binary("*", _S.prop(_S.read(_v69, "b"), "vy"), _S.read(_v69, "dt")), "+=", false)
		_S.set_prop(_S.read(_v69, "b"), "a", _S.binary("*", _S.prop(_S.read(_v69, "b"), "va"), _S.read(_v69, "dt")), "+=", false)
		_S.define(_v69, "floor", _S.invoke(_S.read(_v69, "this"), "ground", [_S.prop(_S.read(_v69, "b"), "x")]))
		_S.define(_v69, "sp", _S.prop(_S.read(_v69, "b"), "vy"))
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.prop(_S.read(_v69, "b"), "g"), 0), func(): return _S.binary("<", _S.prop(_S.read(_v69, "b"), "y"), _S.read(_v69, "floor"))), func(): return _S.binary("<=", _S.read(_v69, "sp"), 0))):
			_v68 = _S.iteration(_v68)
			_S.write(_v68, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v69, "b"), "y", _S.binary("-", _S.read(_v69, "floor"), 0.01), "=", false)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v69, "b"), "kind"), _S.prop(_S.read(_v69, "B"), "DRIP"))):
			_S.set_prop(_S.read(_v69, "b"), "life", 0, "=", false)
		else:
			if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v69, "b"), "bounce"), 0), func(): return _S.binary(">", _S.read(_v69, "sp"), 70))):
				_S.last([_S.set_prop(_S.read(_v69, "b"), "vy", _S.binary("*", _S.unary("-", _S.read(_v69, "sp")), _S.prop(_S.read(_v69, "b"), "bounce")), "=", false), _S.set_prop(_S.read(_v69, "b"), "vx", 0.7, "*=", false), _S.set_prop(_S.read(_v69, "b"), "va", 0.6, "*=", false)])
			else:
				_S.last([_S.set_prop(_S.read(_v69, "b"), "rest", true, "=", false), _S.set_prop(_S.read(_v69, "b"), "vx", _S.set_prop(_S.read(_v69, "b"), "vy", 0, "=", false), "=", false)])
		_v68 = _S.iteration(_v68)
		_S.write(_v68, "i", 1, "-=", true)
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v71 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v72 = _S.scope(_e)
		_S.define(_v72, "b", _v71)
		var _v73 = _S.scope(_v72)
		_S.define(_v73, "a", _S.invoke(_S.read(_v73, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v73, "b"), "life"), 0.4)]))
		_S.define(_v73, "ca", _S.invoke(_S.read(_v73, "Math"), "cos", [_S.prop(_S.read(_v73, "b"), "a")]))
		_S.define(_v73, "sa", _S.invoke(_S.read(_v73, "Math"), "sin", [_S.prop(_S.read(_v73, "b"), "a")]))
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v73, "b"), "kind"), _S.prop(_S.read(_v73, "B"), "SHARD"))):
			var _v74 = _S.scope(_v73)
			var _v75 = _S.scope(_v74)
			_S.define(_v75, "d", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v75, "b"), "s")), 2))
			while _S.truth(_S.binary("<=", _S.read(_v75, "d"), _S.binary("/", _S.prop(_S.read(_v75, "b"), "s"), 2))):
				_S.invoke(_S.read(_v75, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v75, "b"), "x"), _S.binary("*", _S.read(_v75, "ca"), _S.read(_v75, "d"))), _S.binary("+", _S.prop(_S.read(_v75, "b"), "y"), _S.binary("*", _S.read(_v75, "sa"), _S.read(_v75, "d"))), (_S.read(_v75, "WHITE") if _S.truth(_S.binary(">", _S.read(_v75, "d"), _S.binary("-", _S.binary("/", _S.prop(_S.read(_v75, "b"), "s"), 2), 0.6))) else _S.call_value(_S.read(_v75, "hex"), [_S.prop(_S.read(_v75, "b"), "c")])), _S.read(_v75, "a")])
				_v75 = _S.iteration(_v75)
				_S.write(_v75, "d", 0.5, "+=", false)
		else:
			if _S.truth(_S.binary("===", _S.prop(_S.read(_v73, "b"), "kind"), _S.prop(_S.read(_v73, "B"), "DRIP"))):
				var _v76 = _S.scope(_v73)
				_S.invoke(_S.read(_v76, "p"), "dot", [_S.prop(_S.read(_v76, "b"), "x"), _S.prop(_S.read(_v76, "b"), "y"), _S.call_value(_S.read(_v76, "hex"), [_S.prop(_S.read(_v76, "b"), "c")]), _S.read(_v76, "a")])
				_S.invoke(_S.read(_v76, "p"), "dot", [_S.prop(_S.read(_v76, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v76, "b"), "y"), 1), _S.call_value(_S.read(_v76, "hex"), [_S.prop(_S.read(_v76, "b"), "c")]), _S.binary("*", _S.read(_v76, "a"), 0.5)])
			else:
				var _v77 = _S.scope(_v73)
				_S.define(_v77, "R", _S.invoke(_S.logical("??", _S.prop(_S.read(_v77, "b"), "ramp"), func(): return ["#1c2030", "#3a4a66", "#6e86a8", "#a8c0dc", "#e8f2ff"]), "map", [_S.read(_v77, "hex")]))
				_S.define(_v77, "n", _S.prop(_S.read(_v77, "R"), "length"))
				_S.define(_v77, "x", _S.invoke(_S.read(_v77, "Math"), "round", [_S.prop(_S.read(_v77, "b"), "x")]))
				_S.define(_v77, "y", _S.invoke(_S.read(_v77, "Math"), "round", [_S.prop(_S.read(_v77, "b"), "y")]))
				_S.define(_v77, "r", _S.binary("+", _S.invoke(_S.read(_v77, "Math"), "ceil", [_S.prop(_S.read(_v77, "b"), "s")]), 1))
				var _v78 = _S.scope(_v77)
				_S.define(_v78, "py", _S.unary("-", _S.read(_v78, "r")))
				while _S.truth(_S.binary("<=", _S.read(_v78, "py"), _S.read(_v78, "r"))):
					var _v79 = _S.scope(_v78)
					_S.define(_v79, "px", _S.unary("-", _S.read(_v79, "r")))
					while _S.truth(_S.binary("<=", _S.read(_v79, "px"), _S.read(_v79, "r"))):
						var _v80 = _S.scope(_v79)
						_S.define(_v80, "u", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v80, "px"), 0.5), _S.read(_v80, "ca")), _S.binary("*", _S.binary("+", _S.read(_v80, "py"), 0.5), _S.read(_v80, "sa"))))
						_S.define(_v80, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.binary("+", _S.read(_v80, "px"), 0.5)), _S.read(_v80, "sa")), _S.binary("*", _S.binary("+", _S.read(_v80, "py"), 0.5), _S.read(_v80, "ca"))))
						_S.define(_v80, "d", _S.binary("+", _S.binary("/", _S.invoke(_S.read(_v80, "Math"), "abs", [_S.read(_v80, "u")]), _S.prop(_S.read(_v80, "b"), "s")), _S.binary("/", _S.invoke(_S.read(_v80, "Math"), "abs", [_S.read(_v80, "v")]), _S.binary("*", _S.prop(_S.read(_v80, "b"), "s"), 0.62))))
						if _S.truth(_S.binary(">", _S.read(_v80, "d"), 1.3)):
							_v79 = _S.iteration(_v79)
							_S.write(_v79, "px", 1, "+=", true)
							continue
						_S.invoke(_S.read(_v80, "p"), "dot", [_S.binary("+", _S.read(_v80, "x"), _S.read(_v80, "px")), _S.binary("+", _S.read(_v80, "y"), _S.read(_v80, "py")), (_S.prop(_S.read(_v80, "R"), 0) if _S.truth(_S.binary(">", _S.read(_v80, "d"), 1)) else ((_S.prop(_S.read(_v80, "R"), _S.binary("-", _S.read(_v80, "n"), 1)) if _S.truth(_S.binary("<", _S.read(_v80, "u"), 0)) else _S.prop(_S.read(_v80, "R"), _S.binary("-", _S.read(_v80, "n"), 2))) if _S.truth(_S.binary("<", _S.read(_v80, "v"), 0)) else (_S.prop(_S.read(_v80, "R"), _S.binary("-", _S.read(_v80, "n"), 3)) if _S.truth(_S.binary("<", _S.read(_v80, "u"), 0)) else _S.prop(_S.read(_v80, "R"), _S.invoke(_S.read(_v80, "Math"), "max", [1, _S.binary("-", _S.read(_v80, "n"), 4)]))))), _S.read(_v80, "a")])
						_v79 = _S.iteration(_v79)
						_S.write(_v79, "px", 1, "+=", true)
					_v78 = _S.iteration(_v78)
					_S.write(_v78, "py", 1, "+=", true)
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "color", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.read(_e, "r")}, {"color": _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "color")])}, {"k": _S.read(_e, "k")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}])])
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v81 = _S.scope(_e)
	_S.define(_v81, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v81, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v81, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.prop(_S.read(_v81, "this"), "list"), _S.read(_v81, "i")), "life", _S.read(_v81, "dt"), "-=", false), 0)):
			_S.invoke(_S.prop(_S.read(_v81, "this"), "list"), "splice", [_S.read(_v81, "i"), 1])
		_v81 = _S.iteration(_v81)
		_S.write(_v81, "i", 1, "-=", true)
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v82 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v83 = _S.scope(_e)
		_S.define(_v83, "l", _v82)
		var _v84 = _S.scope(_v83)
		_S.define(_v84, "k", _S.binary("/", _S.prop(_S.read(_v84, "l"), "life"), _S.prop(_S.read(_v84, "l"), "max")))
		_S.invoke(_S.read(_v84, "p"), "glow", [_S.prop(_S.read(_v84, "l"), "x"), _S.prop(_S.read(_v84, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v84, "l"), "r"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.read(_v84, "k")))), _S.prop(_S.read(_v84, "l"), "color"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v84, "l"), "k"), _S.read(_v84, "k")), _S.read(_v84, "k"))])
	return null
