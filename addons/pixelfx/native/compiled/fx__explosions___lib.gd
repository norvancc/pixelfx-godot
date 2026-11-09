@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "stone", _S.function_value(_e, "_f0"))
	_S.define(_e, "fireBall", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawPs", _S.function_value(_e, "_f2"))
	_S.define(_e, "draft", _S.function_value(_e, "_f3"))
	_S.define(_e, "cull", _S.function_value(_e, "_f4"))
	_S.define(_e, "fadeEdges", _S.function_value(_e, "_f5"))
	_S.define(_e, "pool", _S.function_value(_e, "_f6"))
	_S.define(_e, "haze", _S.function_value(_e, "_f8"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f10"))
	_S.define(_e, "rock", _S.function_value(_e, "_f11"))
	_S.define(_e, "glowDome", _S.function_value(_e, "_f13"))
	_S.define(_e, "trail", _S.function_value(_e, "_f15"))
	_S.define(_e, "drawDirt", _S.function_value(_e, "_f16"))
	_S.define(_e, "crater", _S.function_value(_e, "_f18"))
	_S.define(_e, "dome", _S.function_value(_e, "_f19"))
	_S.define(_e, "lobe", _S.function_value(_e, "_f21"))
	_S.define(_e, "OUTLINE", _S.call_value(_S.read(_e, "hex"), ["#1a1422"]))
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#17121d"]))
	_exports["OUTLINE"] = _S.read(_e, "OUTLINE")
	_exports["SOOT"] = _S.read(_e, "SOOT")
	_exports["SOOT2"] = _S.read(_e, "SOOT2")
	_exports["stone"] = _S.read(_e, "stone")
	_S.define(_e, "fireRamp", _S.function_value(_e, "_f24"))
	_exports["fireRamp"] = _S.read(_e, "fireRamp")
	_exports["fireBall"] = _S.read(_e, "fireBall")
	_exports["drawPs"] = _S.read(_e, "drawPs")
	_S.define(_e, "LIFTS", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "SMOKE"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "FIRE"), _S.prop(_S.read(_e, "P"), "EMBER"), _S.prop(_S.read(_e, "P"), "VAPOUR")]]))
	_exports["draft"] = _S.read(_e, "draft")
	_exports["cull"] = _S.read(_e, "cull")
	_S.define(_e, "SOFT", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "SMOKE"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "VAPOUR")]]))
	_exports["fadeEdges"] = _S.read(_e, "fadeEdges")
	_exports["pool"] = _S.read(_e, "pool")
	_exports["haze"] = _S.read(_e, "haze")
	_S.define(_e, "heatRamp", _S.function_value(_e, "_f25"))
	_exports["heatRamp"] = _S.read(_e, "heatRamp")
	_exports["scorch"] = _S.read(_e, "scorch")
	_exports["rock"] = _S.read(_e, "rock")
	_exports["glowDome"] = _S.read(_e, "glowDome")
	_exports["trail"] = _S.read(_e, "trail")
	_exports["drawDirt"] = _S.read(_e, "drawDirt")
	_exports["crater"] = _S.read(_e, "crater")
	_exports["dome"] = _S.read(_e, "dome")
	_exports["lobe"] = _S.read(_e, "lobe")
	_S.define(_e, "Plume", _S.class_value("Plume", _S.function_value(_e, "_f26"), {"shape": _S.function_value(_e, "_f28"), "hot": _S.function_value(_e, "_f29"), "ember": _S.function_value(_e, "_f30"), "lobesAt": _S.function_value(_e, "_f31"), "update": _S.function_value(_e, "_f33"), "draw": _S.function_value(_e, "_f34")}, {}, {}, null))
	_exports["Plume"] = _S.read(_e, "Plume")
	_S.define(_e, "Column", _S.class_value("Column", _S.function_value(_e, "_f35"), {"spawn": _S.function_value(_e, "_f36"), "update": _S.function_value(_e, "_f37"), "draw": _S.function_value(_e, "_f38")}, {}, {}, null))
	_exports["Column"] = _S.read(_e, "Column")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.write(_e, "c", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")]), "=", false)
	return _S.merge([{"light": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.35]), _S.read(_e, "WHITE"), 0.08])}, {"body": _S.read(_e, "c")}, {"shade": _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 0.64])}, {"dust": _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "scale"), [_S.read(_e, "c"), 1.2]), _S.call_value(_S.read(_e, "rgb"), [150, 140, 150]), 0.3])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "FR", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.prop(_S.read(_e, "q"), "life"), _S.prop(_S.read(_e, "q"), "max")))
	_S.define(_e, "age", _S.binary("-", 1, _S.read(_e, "k")))
	_S.define(_e, "n", _S.prop(_S.read(_e, "FR"), "length"))
	_S.define(_e, "x", _S.prop(_S.read(_e, "q"), "x"))
	_S.define(_e, "y", _S.prop(_S.read(_e, "q"), "y"))
	_S.define(_e, "heat", _S.invoke(_S.read(_e, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "age"), 0.62]), _S.binary("*", _S.binary("%", _S.prop(_S.read(_e, "q"), "seed"), 1), 0.1))]))
	_S.define(_e, "idx", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 2), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "heat"), _S.binary("-", _S.read(_e, "n"), 1))])]))
	_S.define(_e, "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_e, "age"), 0.55))))
	_S.define(_e, "c", _S.prop(_S.read(_e, "FR"), _S.read(_e, "idx")))
	if _S.truth(_S.binary(">=", _S.read(_e, "idx"), _S.binary("-", _S.read(_e, "n"), 2))):
		return _S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.read(_e, "c"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 3)]), 0.85)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r"), _S.prop(_S.read(_e, "FR"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "n"), 1), _S.binary("+", _S.read(_e, "idx"), (3 if _S.truth(_S.binary("<=", _S.read(_e, "idx"), 2)) else 2))]))])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.16)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.22)), _S.binary("*", _S.read(_e, "r"), 0.78), _S.read(_e, "c")])
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 1.6)):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.9)), _S.binary("*", _S.read(_e, "r"), 0.42), _S.read(_e, "c")])
	if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_e, "idx"), 3), func(): return _S.binary(">", _S.read(_e, "r"), 1.8))):
		_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "r"), 0.28)), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "r"), 0.34)), _S.binary("*", _S.read(_e, "r"), 0.36), _S.prop(_S.read(_e, "FR"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "idx"), 1)]))])
	if _S.truth(_S.binary("<", _S.read(_e, "idx"), 6)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2.4), 2), _S.read(_e, "c"), _S.binary("*", 0.18, _S.read(_e, "k"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "ps", _S.arg(_args, 1))
	_S.define(_e, "layer", _S.arg(_args, 2))
	_S.define(_e, "FR", _S.arg(_args, 3))
	_S.define(_e, "all", _S.prop(_S.read(_e, "ps"), "list"))
	_S.define(_e, "fires", [])
	_S.define(_e, "rest", [])
	for _v0 in _S.array(_S.read(_e, "all")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "q", _v0)
		_S.invoke((_S.read(_v1, "fires") if _S.truth(_S.binary("===", _S.prop(_S.read(_v1, "q"), "k"), _S.prop(_S.read(_v1, "P"), "FIRE"))) else _S.read(_v1, "rest")), "push", [_S.read(_v1, "q")])
	_S.define(_e, "back", _S.binary("===", _S.read(_e, "layer"), "back"))
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		for _v2 in _S.array(_S.read(_e, "fires")):
			var _v3 = _S.scope(_e)
			_S.define(_v3, "q", _v2)
			if _S.truth(_S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v3, "q"), "delay"), 0), func(): return _S.unary("!", _S.binary("&", _S.prop(_S.read(_v3, "q"), "flag"), _S.prop(_S.read(_v3, "PF"), "BACK"))))):
				_S.call_value(_S.read(_v3, "fireBall"), [_S.read(_v3, "p"), _S.read(_v3, "q"), _S.read(_v3, "FR")])
	_S.set_prop(_S.read(_e, "ps"), "list", _S.read(_e, "rest"), "=", false)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), _S.read(_e, "layer")])
	_S.set_prop(_S.read(_e, "ps"), "list", _S.read(_e, "all"), "=", false)
	if _S.truth(_S.read(_e, "back")):
		for _v4 in _S.array(_S.read(_e, "fires")):
			var _v5 = _S.scope(_e)
			_S.define(_v5, "q", _v4)
			if _S.truth(_S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v5, "q"), "delay"), 0), func(): return _S.binary("&", _S.prop(_S.read(_v5, "q"), "flag"), _S.prop(_S.read(_v5, "PF"), "BACK")))):
				_S.call_value(_S.read(_v5, "fireBall"), [_S.read(_v5, "p"), _S.read(_v5, "q"), _S.read(_v5, "FR")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ps", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	var _v6 = _S.arg(_args, 2)
	_S.define(_e, "x", _S.coalesce(_S.prop(_v6, "x"), func(): return 0))
	_S.define(_e, "top", _S.coalesce(_S.prop(_v6, "top"), func(): return _S.unary("-", INF)))
	_S.define(_e, "w", _S.coalesce(_S.prop(_v6, "w"), func(): return 12))
	_S.define(_e, "up", _S.coalesce(_S.prop(_v6, "up"), func(): return 150))
	_S.define(_e, "squeeze", _S.coalesce(_S.prop(_v6, "squeeze"), func(): return 4))
	_S.define(_e, "pull", _S.coalesce(_S.prop(_v6, "pull"), func(): return 0))
	_S.define(_e, "low", _S.coalesce(_S.prop(_v6, "low"), func(): return 10))
	_S.define(_e, "reach", _S.coalesce(_S.prop(_v6, "reach"), func(): return 100))
	_S.define(_e, "k", _S.coalesce(_S.prop(_v6, "k"), func(): return 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	for _v7 in _S.array(_S.prop(_S.read(_e, "ps"), "list")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		var _v9 = _S.scope(_v8)
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.prop(_S.read(_v9, "q"), "delay"), 0), func(): return _S.unary("!", _S.invoke(_S.read(_v9, "LIFTS"), "has", [_S.prop(_S.read(_v9, "q"), "k")]))), func(): return _S.binary("<", _S.prop(_S.read(_v9, "q"), "y"), _S.read(_v9, "top")))):
			continue
		_S.define(_v9, "dx", _S.binary("-", _S.prop(_S.read(_v9, "q"), "x"), _S.read(_v9, "x")))
		_S.define(_v9, "ax", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.read(_v9, "dx")]))
		_S.define(_v9, "u", _S.binary("/", _S.read(_v9, "ax"), _S.read(_v9, "w")))
		if _S.truth(_S.binary("<", _S.read(_v9, "u"), 1)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "f", _S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_v10, "u"), _S.read(_v10, "u"))), _S.read(_v10, "k")))
			_S.set_prop(_S.read(_v10, "q"), "vy", _S.binary("*", _S.binary("*", _S.read(_v10, "up"), _S.read(_v10, "f")), _S.read(_v10, "dt")), "-=", false)
			_S.set_prop(_S.read(_v10, "q"), "vx", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v10, "dx"), _S.read(_v10, "squeeze")), _S.read(_v10, "f")), _S.read(_v10, "dt")), "-=", false)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_v9, "pull"), func(): return _S.binary(">", _S.prop(_S.read(_v9, "q"), "y"), _S.unary("-", _S.read(_v9, "low")))), func(): return _S.binary(">", _S.read(_v9, "ax"), _S.binary("*", _S.read(_v9, "w"), 0.4))), func(): return _S.binary("<", _S.read(_v9, "ax"), _S.read(_v9, "reach")))):
			_S.set_prop(_S.read(_v9, "q"), "vx", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sign", [_S.read(_v9, "dx")]), _S.read(_v9, "pull")), _S.read(_v9, "k")), _S.binary("-", 1, _S.binary("/", _S.read(_v9, "ax"), _S.read(_v9, "reach")))), _S.read(_v9, "dt")), "-=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ps", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "L", _S.prop(_S.read(_e, "ps"), "list"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", _S.binary("-", _S.prop(_S.read(_v11, "L"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v11, "i"), 0)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "q", _S.prop(_S.read(_v12, "L"), _S.read(_v12, "i")))
		if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.prop(_S.read(_v12, "q"), "x"), _S.read(_v12, "x0")), func(): return _S.binary(">", _S.prop(_S.read(_v12, "q"), "x"), _S.read(_v12, "x1"))), func(): return _S.binary("<", _S.prop(_S.read(_v12, "q"), "y"), _S.read(_v12, "y0"))), func(): return _S.binary(">", _S.prop(_S.read(_v12, "q"), "y"), _S.read(_v12, "y1")))):
			_S.invoke(_S.read(_v12, "L"), "splice", [_S.read(_v12, "i"), 1])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "-=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ps", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 3), func(): return 30))
	_S.define(_e, "y1", _S.coalesce(_S.arg(_args, 4), func(): return INF))
	_S.define(_e, "L", _S.prop(_S.read(_e, "ps"), "list"))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", _S.binary("-", _S.prop(_S.read(_v13, "L"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v13, "i"), 0)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "q", _S.prop(_S.read(_v14, "L"), _S.read(_v14, "i")))
		if _S.truth(_S.unary("!", _S.invoke(_S.read(_v14, "SOFT"), "has", [_S.prop(_S.read(_v14, "q"), "k")]))):
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "-=", true)
			continue
		_S.define(_v14, "r", _S.binary("*", _S.prop(_S.read(_v14, "q"), "size"), 1.65))
		_S.define(_v14, "e", _S.invoke(_S.read(_v14, "Math"), "min", [_S.binary("/", _S.binary("-", _S.invoke(_S.read(_v14, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v14, "q"), "x"), _S.read(_v14, "x0")), _S.binary("-", _S.read(_v14, "x1"), _S.prop(_S.read(_v14, "q"), "x"))]), _S.read(_v14, "r")), _S.read(_v14, "w")), _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v14, "y1"), _S.prop(_S.read(_v14, "q"), "y")), _S.read(_v14, "r")), 6)]))
		if _S.truth(_S.binary("<=", _S.read(_v14, "e"), 0)):
			_S.invoke(_S.read(_v14, "L"), "splice", [_S.read(_v14, "i"), 1])
		else:
			if _S.truth(_S.binary("<", _S.read(_v14, "e"), 1)):
				_S.set_prop(_S.read(_v14, "q"), "life", _S.invoke(_S.read(_v14, "Math"), "min", [_S.prop(_S.read(_v14, "q"), "life"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v14, "q"), "max"), 0.42), _S.read(_v14, "e"))]), "=", false)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "-=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.004), func(): return _S.binary("<", _S.read(_e, "rx"), 1)), func(): return _S.binary("<", _S.read(_e, "ry"), 0.5))):
		return null
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ry")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ry")), _S.function_value(_e, "_f7")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "f", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "d")])))
	_S.set_prop(_S.read(_e, "out"), "l", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.read(_e, "k")), "=", false)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.arg(_args, 3))
	_S.define(_e, "ry", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "rx"), 0.5), func(): return _S.binary("<", _S.read(_e, "ry"), 0.5))):
		return null
	_S.define(_e, "fc", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function"))
	_S.define(_e, "fa", _S.binary("===", _S.unary("typeof", _S.read(_e, "a")), "function"))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "ry")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "rx")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "ry")), _S.function_value(_e, "_f9")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lx", _S.arg(_args, 0))
	_S.define(_e, "ly", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "lx"), _S.read(_e, "x")), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "ly"), _S.read(_e, "y")), _S.read(_e, "ry")))
	_S.define(_e, "d2", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">", _S.read(_e, "d2"), 1)):
		return null
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "d2")]))
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.call_value(_S.read(_e, "c"), [_S.read(_e, "d")]) if _S.truth(_S.read(_e, "fc")) else _S.read(_e, "c")), (_S.call_value(_S.read(_e, "a"), [_S.read(_e, "d")]) if _S.truth(_S.read(_e, "fa")) else _S.read(_e, "a"))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "HR", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "rx0", _S.arg(_args, 3))
	_S.define(_e, "cool", _S.arg(_args, 4))
	_S.define(_e, "fade", _S.arg(_args, 5))
	_S.define(_e, "rows", _S.coalesce(_S.arg(_args, 6), func(): return 3))
	if _S.truth(_S.binary("<=", _S.read(_e, "fade"), 0)):
		return null
	_S.define(_e, "rx", _S.binary("*", _S.read(_e, "rx0"), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "t"), 0.08)])))
	_S.define(_e, "ry", _S.binary("+", _S.read(_e, "rows"), 1.5))
	_S.define(_e, "n", _S.prop(_S.read(_e, "HR"), "length"))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "y"), _S.read(_v15, "rows"))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "x", _S.invoke(_S.read(_v16, "Math"), "floor", [_S.unary("-", _S.read(_v16, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v16, "x"), _S.invoke(_S.read(_v16, "Math"), "ceil", [_S.read(_v16, "rx")]))):
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "dx", _S.binary("/", _S.binary("+", _S.read(_v17, "x"), 0.5), _S.read(_v17, "rx")))
			_S.define(_v17, "dy", _S.binary("/", _S.binary("+", _S.read(_v17, "y"), 0.5), _S.read(_v17, "ry")))
			_S.define(_v17, "d", _S.invoke(_S.read(_v17, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v17, "dx"), _S.read(_v17, "dx")), _S.binary("*", _S.read(_v17, "dy"), _S.read(_v17, "dy")))]))
			if _S.truth(_S.binary(">", _S.read(_v17, "d"), 1)):
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "x", 1, "+=", true)
				continue
			_S.define(_v17, "k", _S.call_value(_S.read(_v17, "rand"), [_S.binary("+", _S.binary("*", _S.read(_v17, "x"), 31), _S.read(_v17, "y")), 3]))
			_S.define(_v17, "T", _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "pow", [_S.call_value(_S.read(_v17, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v17, "t"), _S.read(_v17, "cool")))]), 1.4]), _S.binary("-", 1.25, _S.read(_v17, "d"))), _S.binary("*", _S.read(_v17, "k"), 0.35)))
			_S.define(_v17, "crack", (_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "pow", [_S.call_value(_S.read(_v17, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v17, "t"), _S.binary("*", _S.read(_v17, "cool"), 2)))]), 1.2]), _S.binary("-", 1.15, _S.read(_v17, "d"))), 0.8) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v17, "k"), 0.88), func(): return _S.binary("<", _S.read(_v17, "d"), 0.85))) else 0))
			_S.define(_v17, "H", _S.invoke(_S.read(_v17, "Math"), "max", [_S.read(_v17, "T"), _S.read(_v17, "crack")]))
			if _S.truth(_S.binary(">", _S.read(_v17, "H"), 0.06)):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "c", _S.prop(_S.read(_v18, "HR"), _S.invoke(_S.read(_v18, "Math"), "min", [_S.binary("-", _S.read(_v18, "n"), 1), _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v18, "Math"), "min", [1, _S.read(_v18, "H")])), _S.binary("-", _S.read(_v18, "n"), 1))])])))
				_S.invoke(_S.read(_v18, "p"), "dot", [_S.read(_v18, "x"), _S.read(_v18, "y"), _S.read(_v18, "c"), _S.read(_v18, "fade")])
				if _S.truth(_S.logical("||", _S.binary("===", _S.binary("&", _S.read(_v18, "x"), 3), 0), func(): return _S.binary(">", _S.read(_v18, "crack"), _S.read(_v18, "T")))):
					_S.invoke(_S.read(_v18, "p"), "glow", [_S.binary("+", _S.read(_v18, "x"), 0.5), _S.read(_v18, "y"), 6, _S.read(_v18, "c"), _S.binary("*", _S.binary("*", 0.18, _S.read(_v18, "H")), _S.read(_v18, "fade"))])
			else:
				_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "x"), _S.read(_v17, "y"), (_S.read(_v17, "SOOT") if _S.truth(_S.binary("<", _S.read(_v17, "d"), 0.5)) else _S.read(_v17, "SOOT2")), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v17, "d"), _S.binary("-", 0.95, _S.binary("*", _S.read(_v17, "k"), 0.3)))) else _S.binary("-", 1, _S.read(_v17, "d"))), _S.read(_v17, "fade"))])
			_v16 = _S.iteration(_v16)
			_S.write(_v16, "x", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "y", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "st", _S.arg(_args, 2))
	_S.define(_e, "FR", _S.arg(_args, 3))
	_S.define(_e, "r", _S.binary("+", 0.6, _S.binary("*", _S.prop(_S.read(_e, "b"), "s"), 0.75)))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.5)]))
	_S.define(_e, "lx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]), _S.read(_e, "r")), 0.4))
	_S.define(_e, "heat", _S.logical("??", _S.prop(_S.read(_e, "b"), "heat"), func(): return 0))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f12")])
	if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.05)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", _S.binary("*", _S.read(_e, "r"), 2), 3), _S.prop(_S.read(_e, "FR"), 3), _S.binary("*", _S.binary("*", 0.32, _S.read(_e, "heat")), _S.read(_e, "fade"))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("*", _S.read(_e, "dx"), 1.15), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "r"), 0.9))):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fade"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))):
		return _S.read(_e, "OUTLINE")
	_S.define(_e, "lit", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "lx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ly"))))
	if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.08)):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "g", _S.binary("+", _S.binary("*", _S.read(_v19, "heat"), _S.binary("-", 1.1, _S.binary("/", _S.read(_v19, "d"), _S.binary("+", _S.read(_v19, "r"), 0.5)))), (_S.binary("*", _S.read(_v19, "heat"), 0.45) if _S.truth(_S.binary(">", _S.read(_v19, "lit"), 0.3)) else 0)))
		if _S.truth(_S.binary(">", _S.read(_v19, "g"), 0.5)):
			return _S.prop(_S.read(_v19, "FR"), (1 if _S.truth(_S.binary(">", _S.read(_v19, "g"), 1)) else (2 if _S.truth(_S.binary(">", _S.read(_v19, "g"), 0.8)) else (3 if _S.truth(_S.binary(">", _S.read(_v19, "g"), 0.62)) else 4))))
		if _S.truth(_S.binary(">", _S.read(_v19, "g"), 0.32)):
			return _S.prop(_S.read(_v19, "FR"), 5)
	return (_S.prop(_S.read(_e, "st"), "light") if _S.truth(_S.binary("<", _S.read(_e, "lit"), _S.unary("-", 0.4))) else (_S.prop(_S.read(_e, "st"), "shade") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.6)) else _S.prop(_S.read(_e, "st"), "body")))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "R", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	_S.define(_e, "box", _S.coalesce(_S.arg(_args, 7), func(): return [_S.unary("-", INF), _S.unary("-", INF), INF, INF]))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.004), func(): return _S.binary("<", _S.read(_e, "w"), 1))):
		return null
	_S.invoke(_S.read(_e, "p"), "shade", [_S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "box"), 0), _S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "R")), _S.read(_e, "w"))]), _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "box"), 1), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "R")), _S.read(_e, "w"))]), _S.invoke(_S.read(_e, "Math"), "min", [_S.prop(_S.read(_e, "box"), 2), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "R")), _S.read(_e, "w"))]), _S.invoke(_S.read(_e, "Math"), "min", [_S.prop(_S.read(_e, "box"), 3), _S.binary("+", _S.read(_e, "y"), 0.5)]), _S.function_value(_e, "_f14")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y"))]), _S.read(_e, "R"))]), _S.read(_e, "w")))
	if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "l", _S.read(_e, "c"), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_e, "d")), _S.binary("-", 1, _S.read(_e, "d"))), _S.read(_e, "k")), "=", false)
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "FR", _S.arg(_args, 3))
	_S.define(_e, "SM", _S.arg(_args, 4))
	_S.define(_e, "life", _S.coalesce(_S.arg(_args, 5), func(): return 0.5))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	_S.define(_e, "heat", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "lx", NAN)
	_S.define(_e, "ly", NAN)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", _S.binary("-", _S.prop(_S.read(_v20, "pts"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v20, "i"), 0)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "q", _S.prop(_S.read(_v21, "pts"), _S.read(_v21, "i")))
		_S.define(_v21, "age", _S.binary("/", _S.binary("-", _S.read(_v21, "t"), _S.prop(_S.read(_v21, "q"), "t")), _S.read(_v21, "life")))
		if _S.truth(_S.binary(">=", _S.read(_v21, "age"), 1)):
			break
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v21, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_v21, "q"), "x"), _S.read(_v21, "lx")), _S.binary("-", _S.prop(_S.read(_v21, "q"), "y"), _S.read(_v21, "ly"))]), 1.6)):
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "-=", true)
			continue
		_S.write(_v21, "lx", _S.prop(_S.read(_v21, "q"), "x"), "=", false)
		_S.write(_v21, "ly", _S.prop(_S.read(_v21, "q"), "y"), "=", false)
		_S.define(_v21, "r", _S.binary("*", _S.read(_v21, "w"), _S.binary("+", 0.7, _S.binary("*", _S.read(_v21, "age"), 2.6))))
		if _S.truth(_S.binary("<", _S.read(_v21, "age"), _S.binary("*", 0.12, _S.read(_v21, "heat")))):
			_S.invoke(_S.read(_v21, "p"), "circle", [_S.prop(_S.read(_v21, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v21, "q"), "y"), _S.binary("*", _S.read(_v21, "age"), 6)), _S.binary("*", _S.read(_v21, "r"), 0.8), _S.prop(_S.read(_v21, "FR"), (3 if _S.truth(_S.binary("<", _S.read(_v21, "age"), 0.05)) else 5))])
		else:
			_S.invoke(_S.read(_v21, "p"), "disc", [_S.prop(_S.read(_v21, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v21, "q"), "y"), _S.binary("*", _S.read(_v21, "age"), 6)), _S.read(_v21, "r"), _S.prop(_S.read(_v21, "SM"), _S.invoke(_S.read(_v21, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v21, "SM"), "length"), 1), _S.binary("+", 1, _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("*", _S.read(_v21, "age"), 3)]))])), _S.binary("*", 0.55, _S.binary("-", 1, _S.read(_v21, "age")))])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "-=", true)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "ps", _S.arg(_args, 1))
	_S.define(_e, "layer", _S.arg(_args, 2))
	_S.define(_e, "all", _S.prop(_S.read(_e, "ps"), "list"))
	_S.define(_e, "grit", [])
	_S.define(_e, "rest", [])
	for _v22 in _S.array(_S.read(_e, "all")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "q", _v22)
		_S.invoke((_S.read(_v23, "grit") if _S.truth(_S.binary("===", _S.prop(_S.read(_v23, "q"), "k"), _S.prop(_S.read(_v23, "P"), "GRIT"))) else _S.read(_v23, "rest")), "push", [_S.read(_v23, "q")])
	_S.set_prop(_S.read(_e, "ps"), "list", _S.read(_e, "rest"), "=", false)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), _S.read(_e, "layer")])
	_S.set_prop(_S.read(_e, "ps"), "list", _S.read(_e, "all"), "=", false)
	if _S.truth(_S.binary("===", _S.read(_e, "layer"), "back")):
		return null
	for _v24 in _S.array(_S.read(_e, "grit")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "q", _v24)
		var _v26 = _S.scope(_v25)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v26, "q"), "delay"), 0)):
			continue
		_S.define(_v26, "k", _S.binary("/", _S.prop(_S.read(_v26, "q"), "life"), _S.prop(_S.read(_v26, "q"), "max")))
		_S.define(_v26, "sp", _S.invoke(_S.read(_v26, "Math"), "hypot", [_S.prop(_S.read(_v26, "q"), "vx"), _S.prop(_S.read(_v26, "q"), "vy")]))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v26, "k"), 0.25), func(): return _S.binary("<", _S.binary("*", _S.read(_v26, "k"), 4), 0.5))):
			continue
		if _S.truth(_S.binary(">", _S.read(_v26, "sp"), 140)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "L", _S.invoke(_S.read(_v27, "Math"), "min", [5, _S.binary("*", _S.read(_v27, "sp"), 0.012)]))
			_S.define(_v27, "ux", _S.binary("/", _S.prop(_S.read(_v27, "q"), "vx"), _S.read(_v27, "sp")))
			_S.define(_v27, "uy", _S.binary("/", _S.prop(_S.read(_v27, "q"), "vy"), _S.read(_v27, "sp")))
			_S.invoke(_S.read(_v27, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v27, "q"), "x"), _S.binary("*", _S.read(_v27, "ux"), _S.read(_v27, "L"))), _S.binary("-", _S.prop(_S.read(_v27, "q"), "y"), _S.binary("*", _S.read(_v27, "uy"), _S.read(_v27, "L"))), _S.prop(_S.read(_v27, "q"), "x"), _S.prop(_S.read(_v27, "q"), "y"), _S.function_value(_v27, "_f17")])
		else:
			var _v28 = _S.scope(_v26)
			_S.invoke(_S.read(_v28, "p"), "px", [_S.prop(_S.read(_v28, "q"), "x"), _S.prop(_S.read(_v28, "q"), "y"), _S.prop(_S.read(_v28, "q"), "col")])
			if _S.truth(_S.binary(">=", _S.prop(_S.read(_v28, "q"), "size"), 2)):
				_S.last([_S.invoke(_S.read(_v28, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v28, "q"), "x"), 1), _S.prop(_S.read(_v28, "q"), "y"), _S.prop(_S.read(_v28, "q"), "col")]), _S.invoke(_S.read(_v28, "p"), "px", [_S.prop(_S.read(_v28, "q"), "x"), _S.binary("+", _S.prop(_S.read(_v28, "q"), "y"), 1), _S.call_value(_S.read(_v28, "scale"), [_S.prop(_S.read(_v28, "q"), "col"), 0.8])]), _S.invoke(_S.read(_v28, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v28, "q"), "x"), 1), _S.binary("+", _S.prop(_S.read(_v28, "q"), "y"), 1), _S.call_value(_S.read(_v28, "scale"), [_S.prop(_S.read(_v28, "q"), "col"), 0.7])])])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "q"), "col"), 0.7]) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "q"), "col"))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "E", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 5), func(): return 1))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0), func(): return _S.binary("<=", _S.read(_e, "a"), 0))):
		return null
	_S.define(_e, "n", _S.prop(_S.read(_e, "E"), "length"))
	_S.define(_e, "rx", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "k")))
	_S.define(_e, "ry", _S.invoke(_S.read(_e, "Math"), "max", [1.5, _S.binary("*", _S.binary("*", _S.read(_e, "r"), 0.17), _S.read(_e, "k"))]))
	var _v29 = _S.scope(_e)
	_S.define(_v29, "py", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v29, "py"), _S.binary("+", _S.invoke(_S.read(_v29, "Math"), "ceil", [_S.read(_v29, "ry")]), 1))):
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "px", _S.invoke(_S.read(_v30, "Math"), "floor", [_S.binary("-", _S.unary("-", _S.read(_v30, "rx")), 1)]))
		while _S.truth(_S.binary("<=", _S.read(_v30, "px"), _S.invoke(_S.read(_v30, "Math"), "ceil", [_S.binary("+", _S.read(_v30, "rx"), 1)]))):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "dx", _S.binary("/", _S.binary("+", _S.read(_v31, "px"), 0.5), _S.read(_v31, "rx")))
			_S.define(_v31, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v31, "py"), 0.5), _S.binary("*", _S.read(_v31, "ry"), 0.35)), _S.read(_v31, "ry")))
			_S.define(_v31, "d", _S.invoke(_S.read(_v31, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v31, "dx"), _S.read(_v31, "dx")), _S.binary("*", _S.read(_v31, "dy"), _S.read(_v31, "dy")))]))
			if _S.truth(_S.binary(">", _S.read(_v31, "d"), 1.08)):
				_v30 = _S.iteration(_v30)
				_S.write(_v30, "px", 1, "+=", true)
				continue
			_S.define(_v31, "c", ((_S.prop(_S.read(_v31, "E"), _S.binary("-", _S.read(_v31, "n"), 2)) if _S.truth(_S.binary("<", _S.read(_v31, "dy"), 0)) else _S.prop(_S.read(_v31, "E"), 2)) if _S.truth(_S.binary(">", _S.read(_v31, "d"), 0.92)) else (_S.prop(_S.read(_v31, "E"), 0) if _S.truth(_S.binary("<", _S.read(_v31, "dy"), _S.unary("-", 0.2))) else (_S.prop(_S.read(_v31, "E"), 1) if _S.truth(_S.binary("<", _S.read(_v31, "dy"), 0.35)) else _S.prop(_S.read(_v31, "E"), 2)))))
			_S.invoke(_S.read(_v31, "p"), "dot", [_S.binary("+", _S.read(_v31, "x"), _S.read(_v31, "px")), _S.read(_v31, "py"), _S.read(_v31, "c"), _S.read(_v31, "a")])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "px", 1, "+=", true)
		_v29 = _S.iteration(_v29)
		_S.write(_v29, "py", 1, "+=", true)
	for _v32 in _S.array([_S.unary("-", 1), 1]):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "s", _v32)
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v34, "i"), 9)):
			var _v35 = _S.scope(_v34)
			_S.define(_v35, "u", _S.binary("/", _S.read(_v35, "i"), 8))
			_S.define(_v35, "h", _S.invoke(_S.read(_v35, "Math"), "round", [_S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v35, "Math"), "PI"), _S.read(_v35, "u"))]), 2.2), _S.read(_v35, "k")), _S.binary("*", (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v35, "rand"), [_S.read(_v35, "i"), (3 if _S.truth(_S.binary(">", _S.read(_v35, "s"), 0)) else 4)]), 0.4)) else 0), _S.read(_v35, "k")))]))
			_S.define(_v35, "hx", _S.binary("+", _S.read(_v35, "x"), _S.binary("*", _S.read(_v35, "s"), _S.binary("+", _S.binary("*", _S.read(_v35, "rx"), 0.82), _S.binary("*", _S.binary("*", _S.read(_v35, "u"), _S.read(_v35, "r")), 0.55)))))
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "j", 0)
			while _S.truth(_S.binary("<=", _S.read(_v36, "j"), _S.read(_v36, "h"))):
				_S.invoke(_S.read(_v36, "p"), "dot", [_S.read(_v36, "hx"), _S.unary("-", _S.read(_v36, "j")), (_S.prop(_S.read(_v36, "E"), _S.binary("-", _S.read(_v36, "n"), 2)) if _S.truth(_S.binary("===", _S.read(_v36, "j"), _S.read(_v36, "h"))) else (_S.prop(_S.read(_v36, "E"), 3) if _S.truth(_S.binary("===", _S.read(_v36, "j"), _S.binary("-", _S.read(_v36, "h"), 1))) else _S.prop(_S.read(_v36, "E"), 2))), _S.read(_v36, "a")])
				_v36 = _S.iteration(_v36)
				_S.write(_v36, "j", 1, "+=", true)
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "+=", true)
	var _v37 = _S.scope(_e)
	_S.define(_v37, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v37, "i"), 26)):
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "s", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v38, "rand"), [_S.read(_v38, "i"), 7]), 0.5)) else 1))
		_S.define(_v38, "d", _S.binary("*", _S.read(_v38, "rx"), _S.binary("+", 1.05, _S.binary("*", _S.call_value(_S.read(_v38, "rand"), [_S.read(_v38, "i"), 8]), 1.4))))
		_S.define(_v38, "y", _S.binary("-", _S.invoke(_S.read(_v38, "Math"), "round", [_S.binary("*", _S.call_value(_S.read(_v38, "rand"), [_S.read(_v38, "i"), 9]), 3)]), 1))
		if _S.truth(_S.binary("<", _S.call_value(_S.read(_v38, "rand"), [_S.read(_v38, "i"), 10]), _S.read(_v38, "k"))):
			_S.invoke(_S.read(_v38, "p"), "dot", [_S.binary("+", _S.read(_v38, "x"), _S.binary("*", _S.read(_v38, "s"), _S.read(_v38, "d"))), _S.read(_v38, "y"), (_S.prop(_S.read(_v38, "E"), 3) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v38, "rand"), [_S.read(_v38, "i"), 11]), 0.5)) else _S.prop(_S.read(_v38, "E"), 2)), _S.read(_v38, "a")])
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "i", 1, "+=", true)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "F", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "k", _S.arg(_args, 4))
	_S.define(_e, "e", _S.binary("/", 1.4, _S.read(_e, "r")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "r")), 1.5), _S.binary("-", _S.unary("-", _S.read(_e, "r")), 1.5), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "r")), 1.5), 0.5, _S.function_value(_e, "_f20")])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "py")]), _S.read(_e, "r")))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", 1, _S.read(_e, "e")))):
		return null
	return (_S.prop(_S.read(_e, "F"), 2) if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)) else ((_S.prop(_S.read(_e, "F"), 6) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.45)) else _S.prop(_S.read(_e, "F"), 5)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.8)) else ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.45)) else _S.prop(_S.read(_e, "F"), 6)) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.5)) else (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.2)) else _S.prop(_S.read(_e, "F"), 6)))))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "FR", _S.arg(_args, 4))
	_S.define(_e, "SM", _S.arg(_args, 5))
	_S.define(_e, "fire", _S.arg(_args, 6))
	_S.define(_e, "glow", _S.arg(_args, 7))
	_S.define(_e, "a", _S.arg(_args, 8))
	_S.define(_e, "z", _S.coalesce(_S.arg(_args, 9), func(): return 0))
	_S.define(_e, "dark", _S.coalesce(_S.arg(_args, 10), func(): return 0))
	_S.define(_e, "style", _S.coalesce(_S.arg(_args, 11), func(): return 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "r"), 0.7), func(): return _S.binary("<=", _S.read(_e, "a"), 0.01))):
		return null
	_S.define(_e, "n", _S.prop(_S.read(_e, "FR"), "length"))
	_S.define(_e, "m", _S.prop(_S.read(_e, "SM"), "length"))
	_S.define(_e, "back", (1 if _S.truth(_S.binary("<", _S.read(_e, "z"), _S.unary("-", 0.35))) else 0))
	_S.define(_e, "rim", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [0.35, _S.binary("/", 1.6, _S.read(_e, "r"))])))
	_S.define(_e, "seam", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [0.3, _S.binary("/", 1.3, _S.read(_e, "r"))])))
	_S.define(_e, "D", _S.function_value(_e, "_f22"))
	_S.define(_e, "soft", _S.binary("+", 0.55, _S.binary("*", 0.4, _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "a")])))))
	_S.define(_e, "px", _S.function_value(_e, "_f23"))
	if _S.truth(_S.logical("||", _S.binary("!==", _S.prop(_S.read(_e, "p"), "sn"), 0), func(): return _S.binary("!==", _S.prop(_S.read(_e, "p"), "cs"), 1))):
		return _S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.read(_e, "x"), _S.read(_e, "r")), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "r")), _S.binary("+", _S.read(_e, "x"), _S.read(_e, "r")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "r")), _S.read(_e, "px")])
	_S.define(_e, "ax", _S.binary("+", _S.prop(_S.read(_e, "p"), "tx"), _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "r")), _S.prop(_S.read(_e, "p"), "fx"))))
	_S.define(_e, "bx", _S.binary("+", _S.prop(_S.read(_e, "p"), "tx"), _S.binary("*", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "r")), _S.prop(_S.read(_e, "p"), "fx"))))
	_S.define(_e, "sx0", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "p"), "ox"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "ax"), _S.read(_e, "bx")])])]))
	_S.define(_e, "sx1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "p"), "ox"), _S.prop(_S.read(_e, "p"), "w")), 1), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "ax"), _S.read(_e, "bx")])])]))
	_S.define(_e, "sy0", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "p"), "oy"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "p"), "ty"), _S.read(_e, "y")), _S.read(_e, "r"))])]))
	_S.define(_e, "sy1", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "p"), "oy"), _S.prop(_S.read(_e, "p"), "h")), 1), _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "p"), "ty"), _S.read(_e, "y")), _S.read(_e, "r"))])]))
	var _v44 = _S.scope(_e)
	_S.define(_v44, "sy", _S.read(_v44, "sy0"))
	while _S.truth(_S.binary("<=", _S.read(_v44, "sy"), _S.read(_v44, "sy1"))):
		var _v45 = _S.scope(_v44)
		_S.define(_v45, "ly", _S.binary("-", _S.binary("+", _S.read(_v45, "sy"), 0.5), _S.prop(_S.read(_v45, "p"), "ty")))
		_S.define(_v45, "q", _S.binary("/", _S.binary("-", _S.read(_v45, "ly"), _S.read(_v45, "y")), _S.read(_v45, "r")))
		if _S.truth(_S.binary(">=", _S.binary("*", _S.read(_v45, "q"), _S.read(_v45, "q")), 1)):
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "sy", 1, "+=", true)
			continue
		_S.define(_v45, "hw", _S.binary("*", _S.read(_v45, "r"), _S.invoke(_S.read(_v45, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_v45, "q"), _S.read(_v45, "q")))])))
		_S.define(_v45, "cx", _S.binary("+", _S.prop(_S.read(_v45, "p"), "tx"), _S.binary("*", _S.read(_v45, "x"), _S.prop(_S.read(_v45, "p"), "fx"))))
		var _v46 = _S.scope(_v45)
		_S.define(_v46, "sx", _S.invoke(_S.read(_v46, "Math"), "max", [_S.read(_v46, "sx0"), _S.invoke(_S.read(_v46, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v46, "cx"), _S.read(_v46, "hw")), 0.5)])]))
		_S.define(_v46, "e", _S.invoke(_S.read(_v46, "Math"), "min", [_S.read(_v46, "sx1"), _S.invoke(_S.read(_v46, "Math"), "ceil", [_S.binary("+", _S.read(_v46, "cx"), _S.read(_v46, "hw"))])]))
		while _S.truth(_S.binary("<=", _S.read(_v46, "sx"), _S.read(_v46, "e"))):
			_S.call_value(_S.read(_v46, "px"), [_S.binary("*", _S.binary("-", _S.binary("+", _S.read(_v46, "sx"), 0.5), _S.prop(_S.read(_v46, "p"), "tx")), _S.prop(_S.read(_v46, "p"), "fx")), _S.read(_v46, "ly"), _S.read(_v46, "sx"), _S.read(_v46, "sy")])
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "sx", 1, "+=", true)
		_v44 = _S.iteration(_v44)
		_S.write(_v44, "sy", 1, "+=", true)
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "SM"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "m"), 1), _S.binary("+", _S.binary("+", _S.read(_e, "i"), _S.read(_e, "back")), _S.read(_e, "dark"))]))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lx", _S.arg(_args, 0))
	_S.define(_e, "ly", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "lx"), _S.read(_e, "x")), _S.read(_e, "r")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "ly"), _S.read(_e, "y")), _S.read(_e, "r")))
	_S.define(_e, "d2", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.binary(">", _S.read(_e, "d2"), 1)):
		return null
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "d2")]))
	_S.define(_e, "nz", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_e, "d2"))]))
	_S.define(_e, "sky", _S.binary("+", _S.binary("-", _S.binary("*", _S.unary("-", 0.5), _S.read(_e, "dx")), _S.binary("*", 0.66, _S.read(_e, "dy"))), _S.binary("*", 0.56, _S.read(_e, "nz"))))
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.read(_e, "fire"), _S.binary("-", 1.32, _S.binary("*", 0.78, _S.read(_e, "d")))), _S.binary("*", _S.binary("*", 0.14, _S.read(_e, "sky")), _S.read(_e, "fire"))))
	_S.define(_e, "c", null)
	_S.define(_e, "k", 0)
	_S.define(_e, "solid", false)
	if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.44)):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "i", _S.invoke(_S.read(_v39, "Math"), "min", [_S.binary("-", _S.read(_v39, "n"), 3), _S.invoke(_S.read(_v39, "Math"), "max", [0, _S.invoke(_S.read(_v39, "Math"), "floor", [_S.binary("*", _S.binary("*", _S.binary("-", 1.3, _S.read(_v39, "v")), _S.binary("-", _S.read(_v39, "n"), 1)), 0.78)])])]))
		if _S.truth(_S.binary(">", _S.read(_v39, "d"), _S.read(_v39, "seam"))):
			_S.write(_v39, "i", _S.invoke(_S.read(_v39, "Math"), "min", [6, _S.invoke(_S.read(_v39, "Math"), "max", [4, _S.binary("+", _S.read(_v39, "i"), 2)])]), "=", false)
		else:
			if _S.truth(_S.binary(">", _S.read(_v39, "d"), _S.binary("-", _S.read(_v39, "seam"), 0.22))):
				_S.write(_v39, "i", _S.invoke(_S.read(_v39, "Math"), "min", [_S.binary("-", _S.read(_v39, "n"), 3), _S.binary("+", _S.read(_v39, "i"), 1)]), "=", false)
		_S.write(_v39, "c", _S.prop(_S.read(_v39, "FR"), _S.read(_v39, "i")), "=", false)
		_S.write(_v39, "k", _S.binary("*", 0.05, _S.read(_v39, "fire")), "=", false)
		_S.write(_v39, "solid", true, "=", false)
	else:
		if _S.truth(_S.read(_e, "style")):
			var _v40 = _S.scope(_e)
			_S.define(_v40, "lam", _S.binary("+", _S.binary("-", _S.binary("*", _S.unary("-", 0.42), _S.read(_v40, "dx")), _S.binary("*", 0.78, _S.read(_v40, "dy"))), _S.binary("*", 0.46, _S.read(_v40, "nz"))))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v40, "lam"), 0.66), func(): return _S.binary(">", _S.read(_v40, "d"), 0.4))):
				_S.write(_v40, "c", _S.call_value(_S.read(_v40, "D"), [0]), "=", false)
			else:
				if _S.truth(_S.binary(">", _S.read(_v40, "lam"), 0.16)):
					_S.write(_v40, "c", _S.call_value(_S.read(_v40, "D"), [1]), "=", false)
				else:
					if _S.truth(_S.binary(">", _S.read(_v40, "lam"), _S.unary("-", 0.3))):
						_S.write(_v40, "c", _S.call_value(_S.read(_v40, "D"), [2]), "=", false)
					else:
						var _v41 = _S.scope(_v40)
						_S.write(_v41, "c", _S.call_value(_S.read(_v41, "D"), [(4 if _S.truth(_S.binary("<", _S.read(_v41, "lam"), _S.unary("-", 0.64))) else 3)]), "=", false)
						_S.define(_v41, "g", _S.binary("*", _S.read(_v41, "glow"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v41, "dy")))))
						if _S.truth(_S.binary(">", _S.read(_v41, "g"), 0.55)):
							_S.last([_S.write(_v41, "c", _S.prop(_S.read(_v41, "FR"), (5 if _S.truth(_S.binary(">", _S.read(_v41, "g"), 0.8)) else 6)), "=", false), _S.write(_v41, "k", _S.binary("*", 0.08, _S.read(_v41, "g")), "=", false)])
						else:
							if _S.truth(_S.binary(">", _S.read(_v41, "g"), 0.34)):
								_S.write(_v41, "c", _S.call_value(_S.read(_v41, "mix"), [_S.read(_v41, "c"), _S.prop(_S.read(_v41, "FR"), 6), 0.6]), "=", false)
							else:
								if _S.truth(_S.binary(">", _S.read(_v41, "g"), 0.16)):
									_S.write(_v41, "c", _S.call_value(_S.read(_v41, "mix"), [_S.read(_v41, "c"), _S.prop(_S.read(_v41, "FR"), 7), 0.45]), "=", false)
		else:
			var _v42 = _S.scope(_e)
			_S.define(_v42, "g", _S.binary("*", _S.read(_v42, "glow"), _S.binary("+", _S.binary("*", 0.82, _S.read(_v42, "dy")), _S.binary("*", 0.3, _S.read(_v42, "nz")))))
			if _S.truth(_S.binary(">", _S.read(_v42, "g"), 0.45)):
				_S.last([_S.write(_v42, "c", _S.prop(_S.read(_v42, "FR"), (4 if _S.truth(_S.binary(">", _S.read(_v42, "g"), 0.66)) else 5)), "=", false), _S.write(_v42, "k", _S.binary("*", 0.1, _S.read(_v42, "glow")), "=", false)])
			else:
				if _S.truth(_S.binary(">", _S.read(_v42, "g"), 0.3)):
					_S.write(_v42, "c", _S.prop(_S.read(_v42, "FR"), 6), "=", false)
				else:
					if _S.truth(_S.binary(">", _S.read(_v42, "g"), 0.2)):
						_S.write(_v42, "c", _S.prop(_S.read(_v42, "FR"), 7), "=", false)
					else:
						var _v43 = _S.scope(_v42)
						_S.define(_v43, "s", _S.binary("+", _S.binary("*", _S.read(_v43, "sky"), 0.5), 0.5))
						_S.write(_v43, "c", _S.call_value(_S.read(_v43, "D"), [(0 if _S.truth(_S.binary(">", _S.read(_v43, "s"), 0.8)) else (1 if _S.truth(_S.binary(">", _S.read(_v43, "s"), 0.62)) else (2 if _S.truth(_S.binary(">", _S.read(_v43, "s"), 0.42)) else (3 if _S.truth(_S.binary(">", _S.read(_v43, "s"), 0.22)) else 4))))]), "=", false)
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), (_S.read(_e, "a") if _S.truth(_S.logical("||", _S.read(_e, "solid"), func(): return _S.binary("<=", _S.read(_e, "d"), _S.read(_e, "rim")))) else _S.binary("*", _S.read(_e, "a"), _S.read(_e, "soft")))])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "c"), _S.read(_e, "k")])
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "F", _S.arg(_args, 0))
	return [_S.prop(_S.read(_e, "F"), 7), _S.prop(_S.read(_e, "F"), 6), _S.prop(_S.read(_e, "F"), 5), _S.prop(_S.read(_e, "F"), 4), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 2), _S.prop(_S.read(_e, "F"), 1), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "F"), 0), 0.5]), _S.prop(_S.read(_e, "F"), 0)]

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "FR", _S.arg(_args, 0))
	return _S.concat([_S.array(_S.invoke(_S.read(_e, "FR"), "slice", [0, 8])), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "FR"), 8), _S.read(_e, "SOOT"), 0.3])], [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "FR"), 8), _S.read(_e, "SOOT"), 0.65])]])

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "o", _S.write(_e, "o", _S.merge([{"x": 0}, {"y": _S.unary("-", 20)}, {"rise": 100}, {"tau": 1.2}, {"drift": 4}, {"tube": [8, 20]}, {"ring": [1, 18]}, {"grow": 0.9}, {"n": 40}, {"size": [5, 10]}, {"swell": 0.5}, {"spin": 2.4}, {"spinTau": 1.6}, {"heat": 1.15}, {"cool": 0.45}, {"under": 0.5}, {"tilt": 0.2}, {"squash": 0.7}, {"fade": [4, 6]}, {"glow": 1}, {"spread": 10}, {"style": 0}, {"inner": false}, {"hollow": false}, {"fray": null}, _S.read(_e, "o")]), "=", false), "=", false)
	_S.set_prop(_S.read(_e, "this"), "R", _S.read(_e, "R"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "roll", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "onFray", null, "=", false)
	_S.set_prop(_S.read(_e, "this"), "lobes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.prop(_S.read(_e, "o"), "n")}]), _S.function_value(_e, "_f27")]), "=", false)
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"th": _S.binary("*", _S.read(_e, "TAU"), _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_e, "i"), 0.618034), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.08), 0.08])), 1))}, {"ph": _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), _S.binary("+", _S.read(_e, "i"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.35), 0.35]))), _S.prop(_S.read(_e, "o"), "n"))}, {"j": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.55), 0.12])}, {"s": _S.invoke(_S.read(_e, "R"), "range", [_S.prop(_S.prop(_S.read(_e, "o"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "o"), "size"), 1)])}, {"h": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.22), 0.08])}, {"dx": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])}, {"dy": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 0.4])}, {"f": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.9), 0.5])}, {"gv": _S.invoke(_S.read(_e, "R"), "range", [0.55, 1.15])}])

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.coalesce(_S.arg(_args, 0), func(): return _S.prop(_S.read(_e, "this"), "t")))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "t")]))
	_S.define(_e, "g", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "u")), _S.prop(_S.read(_e, "o"), "grow"))])))
	return _S.merge([{"x": _S.prop(_S.read(_e, "o"), "x")}, {"y": _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "o"), "y"), _S.binary("*", _S.prop(_S.read(_e, "o"), "rise"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "u")), _S.prop(_S.read(_e, "o"), "tau"))])))), _S.binary("*", _S.prop(_S.read(_e, "o"), "drift"), _S.read(_e, "u")))}, {"tube": _S.binary("+", _S.prop(_S.prop(_S.read(_e, "o"), "tube"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "o"), "tube"), 1), _S.prop(_S.prop(_S.read(_e, "o"), "tube"), 0)), _S.read(_e, "g")))}, {"ring": _S.binary("+", _S.prop(_S.prop(_S.read(_e, "o"), "ring"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "o"), "ring"), 1), _S.prop(_S.prop(_S.read(_e, "o"), "ring"), 0)), _S.read(_e, "g")))}, {"g": _S.read(_e, "g")}])

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.coalesce(_S.arg(_args, 0), func(): return _S.prop(_S.read(_e, "this"), "t")))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "this"), "o"), "heat"), _S.binary("*", _S.prop(_S.prop(_S.read(_e, "this"), "o"), "cool"), _S.read(_e, "t"))), 0.3)])

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.coalesce(_S.arg(_args, 0), func(): return _S.prop(_S.read(_e, "this"), "t")))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "this"), "o"), "heat"), _S.binary("*", _S.prop(_S.prop(_S.read(_e, "this"), "o"), "cool"), _S.read(_e, "t"))), 1), 1.1)])

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.define(_e, "S", _S.invoke(_S.read(_e, "this"), "shape", [_S.read(_e, "t")]))
	_S.define(_e, "base", _S.binary("-", _S.prop(_S.read(_e, "o"), "heat"), _S.binary("*", _S.prop(_S.read(_e, "o"), "cool"), _S.read(_e, "t"))))
	_S.define(_e, "span", _S.logical("||", _S.binary("+", _S.prop(_S.read(_e, "S"), "ring"), _S.prop(_S.read(_e, "S"), "tube")), func(): return 1))
	_S.define(_e, "list", [])
	for _v47 in _S.array(_S.prop(_S.read(_e, "this"), "lobes")):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "q", _v47)
		var _v49 = _S.scope(_v48)
		_S.define(_v49, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v49, "smooth"), [_S.binary("+", _S.prop(_S.prop(_S.read(_v49, "o"), "fade"), 0), _S.prop(_S.read(_v49, "q"), "f")), _S.binary("+", _S.prop(_S.prop(_S.read(_v49, "o"), "fade"), 1), _S.binary("*", _S.prop(_S.read(_v49, "q"), "f"), 0.5)), _S.read(_v49, "t")])))
		_S.define(_v49, "loose", _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "pow", [_S.call_value(_S.read(_v49, "smooth"), [_S.binary("+", _S.binary("-", _S.prop(_S.prop(_S.read(_v49, "o"), "fade"), 0), 1.8), _S.prop(_S.read(_v49, "q"), "f")), _S.prop(_S.prop(_S.read(_v49, "o"), "fade"), 1), _S.read(_v49, "t")]), 1.5]), _S.prop(_S.read(_v49, "o"), "spread")))
		if _S.truth(_S.binary("<=", _S.read(_v49, "fade"), 0)):
			continue
		_S.define(_v49, "th", _S.binary("-", _S.prop(_S.read(_v49, "q"), "th"), _S.prop(_S.read(_v49, "this"), "roll")))
		_S.define(_v49, "rt", _S.binary("*", _S.prop(_S.read(_v49, "S"), "tube"), _S.binary("+", 1, _S.prop(_S.read(_v49, "q"), "j"))))
		_S.define(_v49, "rho", _S.binary("+", _S.prop(_S.read(_v49, "S"), "ring"), _S.binary("*", _S.read(_v49, "rt"), _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "th")]))))
		_S.define(_v49, "up", _S.invoke(_S.read(_v49, "Math"), "sin", [_S.read(_v49, "th")]))
		_S.define(_v49, "X", _S.binary("*", _S.read(_v49, "rho"), _S.invoke(_S.read(_v49, "Math"), "cos", [_S.prop(_S.read(_v49, "q"), "ph")])))
		_S.define(_v49, "Z", _S.binary("*", _S.read(_v49, "rho"), _S.invoke(_S.read(_v49, "Math"), "sin", [_S.prop(_S.read(_v49, "q"), "ph")])))
		_S.define(_v49, "heat", _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_v49, "base"), _S.prop(_S.read(_v49, "q"), "h")), _S.binary("*", _S.binary("*", 0.18, _S.invoke(_S.read(_v49, "Math"), "max", [0, _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "th")])])), _S.call_value(_S.read(_v49, "clamp"), [_S.binary("*", _S.read(_v49, "t"), 2)]))), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v49, "o"), "under"), _S.invoke(_S.read(_v49, "Math"), "max", [0, _S.unary("-", _S.read(_v49, "up"))])), _S.call_value(_S.read(_v49, "clamp"), [_S.binary("+", _S.read(_v49, "base"), 0.6)]))))
		_S.define(_v49, "r", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v49, "q"), "s"), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.prop(_S.read(_v49, "S"), "g")))), _S.binary("+", 1, _S.binary("*", _S.prop(_S.read(_v49, "o"), "swell"), _S.call_value(_S.read(_v49, "clamp"), [_S.binary("-", 1, _S.read(_v49, "heat"))])))), _S.binary("+", 1, _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v49, "fade"))))))
		_S.invoke(_S.read(_v49, "list"), "push", [_S.merge([{"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_v49, "S"), "x"), _S.read(_v49, "X")), _S.binary("*", _S.prop(_S.read(_v49, "q"), "dx"), _S.read(_v49, "loose")))}, {"y": _S.binary("+", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v49, "S"), "y"), _S.binary("*", _S.binary("*", _S.read(_v49, "rt"), _S.read(_v49, "up")), _S.prop(_S.read(_v49, "o"), "squash"))), _S.binary("*", _S.read(_v49, "Z"), _S.prop(_S.read(_v49, "o"), "tilt"))), _S.binary("*", _S.prop(_S.read(_v49, "q"), "dy"), _S.read(_v49, "loose")))}, {"z": _S.binary("/", _S.read(_v49, "Z"), _S.read(_v49, "span"))}, {"up": _S.read(_v49, "up")}, {"out": _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "th")])}, {"heat": _S.read(_v49, "heat")}, {"q": _S.read(_v49, "q")}, {"fade": _S.read(_v49, "fade")}, {"r": _S.read(_v49, "r")}, {"d": _S.binary("/", _S.invoke(_S.read(_v49, "Math"), "hypot", [_S.read(_v49, "X"), _S.read(_v49, "Z")]), _S.read(_v49, "span"))}, {"c": _S.binary("-", 1, _S.invoke(_S.read(_v49, "Math"), "min", [1, _S.binary("/", _S.invoke(_S.read(_v49, "Math"), "abs", [_S.read(_v49, "X")]), _S.read(_v49, "span"))]))}])])
	return _S.invoke(_S.read(_e, "list"), "sort", [_S.function_value(_e, "_f32")])

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "a"), "z"), _S.prop(_S.read(_e, "b"), "z"))

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	_S.set_prop(_S.read(_e, "this"), "roll", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "o"), "spin"), _S.binary("+", 0.12, _S.binary("*", 0.88, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "this"), "t")), _S.prop(_S.read(_e, "o"), "spinTau"))])))), _S.read(_e, "dt")), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_e, "o"), "fray"), func(): return _S.prop(_S.read(_e, "this"), "onFray")), func(): return _S.binary(">", _S.prop(_S.read(_e, "this"), "t"), _S.prop(_S.prop(_S.read(_e, "o"), "fray"), 0))), func(): return _S.binary("<", _S.prop(_S.read(_e, "this"), "t"), _S.logical("??", _S.prop(_S.prop(_S.read(_e, "o"), "fray"), 2), func(): return INF)))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "S", _S.invoke(_S.read(_v50, "this"), "shape", []))
		_S.define(_v50, "k", _S.binary("*", _S.binary("*", _S.prop(_S.prop(_S.read(_v50, "o"), "fray"), 1), _S.read(_v50, "dt")), _S.call_value(_S.read(_v50, "smooth"), [_S.prop(_S.prop(_S.read(_v50, "o"), "fray"), 0), _S.binary("+", _S.prop(_S.prop(_S.read(_v50, "o"), "fray"), 0), 1), _S.prop(_S.read(_v50, "this"), "t")])))
		for _v51 in _S.array(_S.invoke(_S.read(_v50, "this"), "lobesAt", [_S.prop(_S.read(_v50, "this"), "t")])):
			var _v52 = _S.scope(_v50)
			_S.define(_v52, "e", _v51)
			var _v53 = _S.scope(_v52)
			if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v53, "e"), "out"), 0.2), func(): return _S.unary("!", _S.invoke(_S.prop(_S.read(_v53, "this"), "R"), "chance", [_S.binary("*", _S.read(_v53, "k"), _S.prop(_S.read(_v53, "e"), "fade"))])))):
				continue
			_S.define(_v53, "ux", _S.binary("-", _S.prop(_S.read(_v53, "e"), "x"), _S.prop(_S.read(_v53, "S"), "x")))
			_S.define(_v53, "uy", _S.binary("-", _S.prop(_S.read(_v53, "e"), "y"), _S.prop(_S.read(_v53, "S"), "y")))
			_S.define(_v53, "l", _S.logical("||", _S.invoke(_S.read(_v53, "Math"), "hypot", [_S.read(_v53, "ux"), _S.read(_v53, "uy")]), func(): return 1))
			_S.invoke(_S.read(_v53, "this"), "onFray", [_S.binary("+", _S.prop(_S.read(_v53, "e"), "x"), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v53, "ux"), _S.read(_v53, "l")), _S.prop(_S.read(_v53, "e"), "r")), 0.6)), _S.binary("+", _S.prop(_S.read(_v53, "e"), "y"), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v53, "uy"), _S.read(_v53, "l")), _S.prop(_S.read(_v53, "e"), "r")), 0.6)), _S.prop(_S.read(_v53, "e"), "r"), _S.binary("/", _S.read(_v53, "ux"), _S.read(_v53, "l")), _S.binary("/", _S.read(_v53, "uy"), _S.read(_v53, "l"))])
	return null

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "FR", _S.arg(_args, 1))
	_S.define(_e, "SM", _S.arg(_args, 2))
	var _v54 = _S.coalesce(_S.arg(_args, 3), func(): return _S.merge([]))
	_S.define(_e, "mid", _S.prop(_v54, "mid"))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.define(_e, "t", _S.prop(_S.read(_e, "this"), "t"))
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.prop(_S.prop(_S.read(_e, "o"), "fade"), 1), 0.5))):
		return null
	_S.define(_e, "S", _S.invoke(_S.read(_e, "this"), "shape", [_S.read(_e, "t")]))
	_S.define(_e, "base", _S.binary("-", _S.prop(_S.read(_e, "o"), "heat"), _S.binary("*", _S.prop(_S.read(_e, "o"), "cool"), _S.read(_e, "t"))))
	_S.define(_e, "span", _S.logical("||", _S.binary("+", _S.prop(_S.read(_e, "S"), "ring"), _S.prop(_S.read(_e, "S"), "tube")), func(): return 1))
	_S.define(_e, "list", _S.invoke(_S.read(_e, "this"), "lobesAt", [_S.read(_e, "t")]))
	_S.define(_e, "age", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "o"), "fade"), 1))]))
	_S.define(_e, "E", _S.invoke(_S.read(_e, "this"), "ember", [_S.read(_e, "t")]))
	_S.define(_e, "reach", _S.binary("+", 0.3, _S.binary("*", 1.15, _S.read(_e, "E"))))
	_S.define(_e, "drawn", false)
	for _v55 in _S.array(_S.read(_e, "list")):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "e", _v55)
		var _v57 = _S.scope(_v56)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.unary("!", _S.read(_v57, "drawn")), func(): return _S.binary(">=", _S.prop(_S.read(_v57, "e"), "z"), 0)), func(): return _S.read(_v57, "mid"))):
			_S.last([_S.write(_v57, "drawn", true, "=", false), _S.call_value(_S.read(_v57, "mid"), [])])
		_S.define(_v57, "h", _S.prop(_S.read(_v57, "e"), "heat"))
		_S.define(_v57, "fade", _S.prop(_S.read(_v57, "e"), "fade"))
		_S.define(_v57, "fire", _S.call_value(_S.read(_v57, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v57, "h"), 0.2), 0.75)]))
		_S.define(_v57, "glow", (_S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v57, "E"), _S.call_value(_S.read(_v57, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v57, "reach"), _S.prop(_S.read(_v57, "e"), "d")), 0.45)])), _S.binary("+", 0.45, _S.binary("*", 0.55, _S.invoke(_S.read(_v57, "Math"), "max", [0, _S.unary("-", _S.prop(_S.read(_v57, "e"), "up"))])))), _S.prop(_S.prop(_S.read(_v57, "e"), "q"), "gv")), _S.prop(_S.read(_v57, "o"), "glow")) if _S.truth(_S.prop(_S.read(_v57, "o"), "inner")) else _S.binary("*", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v57, "clamp"), [_S.binary("/", _S.binary("+", _S.read(_v57, "base"), 0.45), 0.85)]), _S.prop(_S.read(_v57, "o"), "glow")), _S.binary("+", _S.binary("+", 0.4, _S.binary("*", 0.35, _S.invoke(_S.read(_v57, "Math"), "max", [0, _S.unary("-", _S.prop(_S.read(_v57, "e"), "up"))]))), _S.binary("*", 0.4, _S.prop(_S.read(_v57, "e"), "c")))), _S.prop(_S.prop(_S.read(_v57, "e"), "q"), "gv"))))
		_S.call_value(_S.read(_v57, "lobe"), [_S.read(_v57, "p"), _S.prop(_S.read(_v57, "e"), "x"), _S.prop(_S.read(_v57, "e"), "y"), _S.prop(_S.read(_v57, "e"), "r"), _S.read(_v57, "FR"), _S.read(_v57, "SM"), _S.read(_v57, "fire"), _S.read(_v57, "glow"), _S.binary("*", _S.read(_v57, "fade"), _S.binary("+", 0.82, _S.binary("*", 0.18, _S.read(_v57, "fire")))), _S.prop(_S.read(_v57, "e"), "z"), _S.binary("+", (1 if _S.truth(_S.binary(">", _S.read(_v57, "age"), 0.72)) else 0), (1 if _S.truth(_S.logical("&&", _S.prop(_S.read(_v57, "o"), "hollow"), func(): return _S.binary("<", _S.prop(_S.read(_v57, "e"), "up"), _S.unary("-", 0.35)))) else 0)), _S.prop(_S.read(_v57, "o"), "style")])
		if _S.truth(_S.binary(">", _S.read(_v57, "fire"), 0.25)):
			_S.invoke(_S.read(_v57, "p"), "glow", [_S.prop(_S.read(_v57, "e"), "x"), _S.prop(_S.read(_v57, "e"), "y"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v57, "e"), "r"), 1.25), 2), _S.prop(_S.read(_v57, "FR"), 2), _S.binary("*", 0.07, _S.read(_v57, "fire"))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "drawn")), func(): return _S.read(_e, "mid"))):
		_S.call_value(_S.read(_e, "mid"), [])
	_S.define(_e, "hot", _S.invoke(_S.read(_e, "this"), "hot", [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "hot"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.prop(_S.read(_e, "S"), "y"), _S.binary("+", _S.binary("*", _S.read(_e, "span"), 1.8), 14), _S.prop(_S.read(_e, "FR"), 3), _S.binary("*", _S.binary("*", 0.32, _S.read(_e, "hot")), _S.prop(_S.read(_e, "o"), "glow"))])
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "o"), "inner"), func(): return _S.binary(">", _S.read(_e, "E"), 0.05))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "S"), "x"), _S.binary("+", _S.prop(_S.read(_e, "S"), "y"), _S.binary("*", _S.prop(_S.read(_e, "S"), "tube"), 0.3)), _S.binary("+", _S.binary("*", _S.read(_e, "span"), _S.binary("+", 0.5, _S.binary("*", 0.7, _S.read(_e, "E")))), 8), _S.prop(_S.read(_e, "FR"), 4), _S.binary("*", _S.binary("*", 0.22, _S.read(_e, "E")), _S.read(_e, "E"))])
	return null

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "R", _S.read(_e, "R"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "o", _S.write(_e, "o", _S.merge([{"w": 7}, {"foot": 16}, {"speed": 70}, {"size": [5, 8]}, {"n": 18}, {"sway": 2.5}, {"fade": 0.5}, {"style": 0}, _S.read(_e, "o")]), "=", false), "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "lobes", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "acc", 0, "=", false)
	return null

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "R", _S.prop(_S.read(_e, "this"), "R"))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.invoke(_S.prop(_S.read(_e, "this"), "lobes"), "push", [_S.merge([{"y": _S.read(_e, "y")}, {"x": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])}, {"s": _S.invoke(_S.read(_e, "R"), "range", [_S.prop(_S.prop(_S.read(_e, "o"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "o"), "size"), 1)])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"a": 0}, {"v": _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.2])}])])
	return null

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.define(_e, "top", _S.arg(_args, 1))
	_S.define(_e, "feed", _S.arg(_args, 2))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "max", [10, _S.unary("-", _S.read(_e, "top"))]))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "feed"), 0)):
		var _v58 = _S.scope(_e)
		_S.set_prop(_S.read(_v58, "this"), "acc", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v58, "dt"), _S.read(_v58, "feed")), _S.prop(_S.read(_v58, "o"), "n")), _S.binary("/", _S.prop(_S.read(_v58, "o"), "speed"), _S.read(_v58, "L"))), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v58, "this"), "acc"), 1)):
			_S.invoke(_S.read(_v58, "this"), "spawn", [_S.unary("-", 1)])
			_v58 = _S.iteration(_v58)
			_S.set_prop(_S.read(_v58, "this"), "acc", 1, "-=", true)
	var _v59 = _S.scope(_e)
	_S.define(_v59, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v59, "this"), "lobes"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v59, "i"), 0)):
		var _v60 = _S.scope(_v59)
		_S.define(_v60, "b", _S.prop(_S.prop(_S.read(_v60, "this"), "lobes"), _S.read(_v60, "i")))
		_S.define(_v60, "u", _S.call_value(_S.read(_v60, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v60, "b"), "y")), _S.read(_v60, "L"))]))
		_S.set_prop(_S.read(_v60, "b"), "y", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v60, "o"), "speed"), _S.prop(_S.read(_v60, "b"), "v")), _S.binary("+", 0.45, _S.binary("*", 0.55, _S.invoke(_S.read(_v60, "Math"), "min", [1, _S.binary("/", _S.unary("-", _S.prop(_S.read(_v60, "b"), "y")), 24)])))), _S.read(_v60, "dt")), "-=", false)
		_S.set_prop(_S.read(_v60, "b"), "a", _S.invoke(_S.read(_v60, "Math"), "min", [1, _S.binary("+", _S.prop(_S.read(_v60, "b"), "a"), _S.binary("*", _S.read(_v60, "dt"), 4))]), "=", false)
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v60, "b"), "y"), _S.read(_v60, "top")), func(): return _S.logical("&&", _S.binary("<=", _S.read(_v60, "feed"), 0), func(): return _S.binary("<=", _S.set_prop(_S.read(_v60, "b"), "a", _S.binary("*", _S.read(_v60, "dt"), _S.binary("-", 2, _S.read(_v60, "u"))), "-=", false), 0)))):
			_S.invoke(_S.prop(_S.read(_v60, "this"), "lobes"), "splice", [_S.read(_v60, "i"), 1])
		_v59 = _S.iteration(_v59)
		_S.write(_v59, "i", 1, "-=", true)
	return null

static func _f38(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "top", _S.arg(_args, 1))
	_S.define(_e, "FR", _S.arg(_args, 2))
	_S.define(_e, "SM", _S.arg(_args, 3))
	_S.define(_e, "fire", _S.arg(_args, 4))
	_S.define(_e, "glow", _S.arg(_args, 5))
	_S.define(_e, "o", _S.prop(_S.read(_e, "this"), "o"))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "max", [10, _S.unary("-", _S.read(_e, "top"))]))
	_S.define(_e, "list", _S.invoke(_S.concat([_S.array(_S.prop(_S.read(_e, "this"), "lobes"))]), "sort", [_S.function_value(_e, "_f39")]))
	for _v61 in _S.array(_S.read(_e, "list")):
		var _v62 = _S.scope(_e)
		_S.define(_v62, "b", _v61)
		var _v63 = _S.scope(_v62)
		_S.define(_v63, "u", _S.call_value(_S.read(_v63, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v63, "b"), "y")), _S.read(_v63, "L"))]))
		_S.define(_v63, "foot", _S.invoke(_S.read(_v63, "Math"), "pow", [_S.binary("-", 1, _S.read(_v63, "u")), 4]))
		_S.define(_v63, "w", _S.binary("+", _S.prop(_S.read(_v63, "o"), "w"), _S.binary("*", _S.prop(_S.read(_v63, "o"), "foot"), _S.read(_v63, "foot"))))
		_S.define(_v63, "x", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "b"), "x"), _S.read(_v63, "w")), 0.45), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v63, "Math"), "sin", [_S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v63, "this"), "t"), 1.7), _S.prop(_S.read(_v63, "b"), "ph")), _S.binary("*", _S.read(_v63, "u"), 3))]), _S.prop(_S.read(_v63, "o"), "sway")), _S.read(_v63, "u"))))
		_S.define(_v63, "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v63, "b"), "s"), _S.binary("+", _S.binary("+", 0.75, _S.binary("*", 0.5, _S.read(_v63, "foot"))), _S.binary("*", 0.35, _S.read(_v63, "u")))), _S.invoke(_S.read(_v63, "Math"), "min", [1, _S.binary("*", _S.prop(_S.read(_v63, "b"), "a"), 1.5)])))
		_S.define(_v63, "end", _S.binary("-", 1, _S.call_value(_S.read(_v63, "smooth"), [0.85, 1, _S.read(_v63, "u")])))
		_S.call_value(_S.read(_v63, "lobe"), [_S.read(_v63, "p"), _S.read(_v63, "x"), _S.binary("-", _S.prop(_S.read(_v63, "b"), "y"), _S.binary("*", _S.binary("*", _S.read(_v63, "r"), 0.3), _S.read(_v63, "foot"))), _S.read(_v63, "r"), _S.read(_v63, "FR"), _S.read(_v63, "SM"), _S.call_value(_S.read(_v63, "clamp"), [_S.binary("*", _S.read(_v63, "fire"), _S.binary("-", 1.1, _S.binary("*", _S.read(_v63, "u"), 0.9)))]), _S.binary("*", _S.read(_v63, "glow"), _S.call_value(_S.read(_v63, "smooth"), [0.55, 1, _S.read(_v63, "u")])), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v63, "Math"), "min", [1, _S.prop(_S.read(_v63, "b"), "a")]), _S.read(_v63, "end")), 0.9), 0, (0 if _S.truth(_S.binary(">", _S.read(_v63, "u"), 0.5)) else 1), _S.prop(_S.read(_v63, "o"), "style")])
	return null

static func _f39(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "a"), "y"), _S.prop(_S.read(_e, "b"), "y"))
