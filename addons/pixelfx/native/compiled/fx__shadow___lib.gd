@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "ramp", _S.import_value("core/index.js", "ramp"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "unlight", _S.function_value(_e, "_f0"))
	_S.define(_e, "annulus", _S.function_value(_e, "_f2"))
	_S.define(_e, "ringFast", _S.function_value(_e, "_f3"))
	_S.define(_e, "ringLight", _S.function_value(_e, "_f5"))
	_S.define(_e, "halo", _S.function_value(_e, "_f7"))
	_S.define(_e, "blackStar", _S.function_value(_e, "_f9"))
	_S.define(_e, "inStar", _S.function_value(_e, "_f13"))
	_S.define(_e, "attract", _S.function_value(_e, "_f14"))
	_S.define(_e, "shard", _S.function_value(_e, "_f16"))
	_S.define(_e, "floorPool", _S.function_value(_e, "_f18"))
	_S.define(_e, "VOID", ["#06040b", "#150c26", "#2a1150", "#461a84", "#6f2cc0", "#9d5cec", "#cfa6ff", "#f6eaff"])
	_exports["VOID"] = _S.read(_e, "VOID")
	_exports["unlight"] = _S.read(_e, "unlight")
	_exports["ringFast"] = _S.read(_e, "ringFast")
	_exports["ringLight"] = _S.read(_e, "ringLight")
	_exports["halo"] = _S.read(_e, "halo")
	_exports["blackStar"] = _S.read(_e, "blackStar")
	_exports["inStar"] = _S.read(_e, "inStar")
	_exports["attract"] = _S.read(_e, "attract")
	_S.define(_e, "PK", _S.merge([{"FLAME": 0}, {"SOOT": 1}]))
	_exports["PK"] = _S.read(_e, "PK")
	_S.define(_e, "Puffs", _S.class_value("Puffs", _S.function_value(_e, "_f20"), {"spawn": _S.function_value(_e, "_f21"), "update": _S.function_value(_e, "_f23"), "draw": _S.function_value(_e, "_f24")}, {"count": _S.function_value(_e, "_f22")}, {}, null))
	_exports["Puffs"] = _S.read(_e, "Puffs")
	_exports["shard"] = _S.read(_e, "shard")
	_S.define(_e, "Drops", _S.class_value("Drops", _S.function_value(_e, "_f26"), {"add": _S.function_value(_e, "_f28"), "update": _S.function_value(_e, "_f29"), "draw": _S.function_value(_e, "_f30")}, {}, {}, null))
	_exports["Drops"] = _S.read(_e, "Drops")
	_exports["floorPool"] = _S.read(_e, "floorPool")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "dark", _S.arg(_args, 5))
	_S.define(_e, "keep", _S.coalesce(_S.arg(_args, 6), func(): return 0))
	_S.define(_e, "L", _S.prop(_S.read(_e, "p"), "L"))
	_S.define(_e, "w", _S.prop(_S.read(_e, "p"), "w"))
	_S.define(_e, "ox", _S.prop(_S.read(_e, "p"), "ox"))
	_S.define(_e, "oy", _S.prop(_S.read(_e, "p"), "oy"))
	_S.invoke(_S.read(_e, "p"), "each", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "dark"), [_S.read(_e, "x"), _S.read(_e, "y")]))):
		return null
	_S.define(_e, "i", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "sy"), _S.read(_e, "oy")), _S.read(_e, "w")), _S.binary("-", _S.read(_e, "sx"), _S.read(_e, "ox"))))
	_S.define(_e, "d", _S.prop(_S.read(_e, "L"), _S.read(_e, "i")))
	if _S.truth(_S.unary("!", _S.read(_e, "d"))):
		return null
	if _S.truth(_S.binary("<=", _S.read(_e, "keep"), 0)):
		_S.set_prop(_S.read(_e, "L"), _S.read(_e, "i"), 0, "=", false)
	else:
		_S.set_prop(_S.read(_e, "L"), _S.read(_e, "i"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_e, "d"), 16), 255), _S.read(_e, "keep")), 16)), _S.binary("<<", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_e, "d"), 8), 255), _S.read(_e, "keep")), 8)), _S.binary("*", _S.binary("&", _S.read(_e, "d"), 255), _S.read(_e, "keep"))), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "r0", _S.arg(_args, 2))
	_S.define(_e, "r1", _S.arg(_args, 3))
	_S.define(_e, "fn", _S.arg(_args, 4))
	_S.define(_e, "r02", (_S.binary("*", _S.read(_e, "r0"), _S.read(_e, "r0")) if _S.truth(_S.binary(">", _S.read(_e, "r0"), 0)) else _S.unary("-", 1)))
	_S.define(_e, "r12", _S.binary("*", _S.read(_e, "r1"), _S.read(_e, "r1")))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "py", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.binary("-", _S.read(_v0, "y"), _S.read(_v0, "r1"))]))
	while _S.truth(_S.binary("<=", _S.read(_v0, "py"), _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("+", _S.read(_v0, "y"), _S.read(_v0, "r1"))]))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "cy", _S.binary("+", _S.read(_v1, "py"), 0.5))
		_S.define(_v1, "dy", _S.binary("-", _S.read(_v1, "cy"), _S.read(_v1, "y")))
		_S.define(_v1, "dy2", _S.binary("*", _S.read(_v1, "dy"), _S.read(_v1, "dy")))
		if _S.truth(_S.binary(">=", _S.read(_v1, "dy2"), _S.read(_v1, "r12"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "py", 1, "+=", true)
			continue
		_S.define(_v1, "xo", _S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.binary("-", _S.read(_v1, "r12"), _S.read(_v1, "dy2"))]))
		_S.define(_v1, "xi", (_S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.binary("-", _S.read(_v1, "r02"), _S.read(_v1, "dy2"))]) if _S.truth(_S.binary("<", _S.read(_v1, "dy2"), _S.read(_v1, "r02"))) else 0))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "px", _S.invoke(_S.read(_v2, "Math"), "floor", [_S.binary("-", _S.read(_v2, "x"), _S.read(_v2, "xo"))]))
		_S.define(_v2, "x1", _S.invoke(_S.read(_v2, "Math"), "ceil", [_S.binary("+", _S.read(_v2, "x"), _S.read(_v2, "xo"))]))
		while _S.truth(_S.binary("<=", _S.read(_v2, "px"), _S.read(_v2, "x1"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "cx", _S.binary("+", _S.read(_v3, "px"), 0.5))
			_S.define(_v3, "dx", _S.binary("-", _S.read(_v3, "cx"), _S.read(_v3, "x")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v3, "xi"), 0), func(): return _S.binary(">", _S.read(_v3, "dx"), _S.unary("-", _S.read(_v3, "xi")))), func(): return _S.binary("<", _S.read(_v3, "dx"), _S.read(_v3, "xi")))):
				var _v4 = _S.scope(_v3)
				_S.write(_v4, "px", _S.invoke(_S.read(_v4, "Math"), "max", [_S.read(_v4, "px"), _S.binary("-", _S.invoke(_S.read(_v4, "Math"), "floor", [_S.binary("+", _S.read(_v4, "x"), _S.read(_v4, "xi"))]), 1)]), "=", false)
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "px", 1, "+=", true)
				continue
			_S.define(_v3, "d2", _S.binary("+", _S.binary("*", _S.read(_v3, "dx"), _S.read(_v3, "dx")), _S.read(_v3, "dy2")))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v3, "d2"), _S.read(_v3, "r12")), func(): return _S.binary(">=", _S.read(_v3, "d2"), _S.read(_v3, "r02")))):
				_S.call_value(_S.read(_v3, "fn"), [_S.read(_v3, "cx"), _S.read(_v3, "cy"), _S.invoke(_S.read(_v3, "Math"), "sqrt", [_S.read(_v3, "d2")])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "px", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "py", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 6), func(): return 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "r"), 0)):
		return null
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "r"), _S.read(_e, "w"))]))
	_S.define(_e, "fc", _S.binary("===", _S.unary("typeof", _S.read(_e, "c")), "function"))
	_S.define(_e, "fa", _S.binary("===", _S.unary("typeof", _S.read(_e, "a")), "function"))
	_S.call_value(_S.read(_e, "annulus"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "r0"), _S.read(_e, "r"), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "cx", _S.arg(_args, 0))
	_S.define(_e, "cy", _S.arg(_args, 1))
	_S.define(_e, "d", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "d"), _S.read(_e, "r0")), _S.logical("||", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "r0")), func(): return 1)))
	_S.define(_e, "ang", (_S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("-", _S.read(_e, "cy"), _S.read(_e, "y")), _S.binary("-", _S.read(_e, "cx"), _S.read(_e, "x"))]) if _S.truth(_S.logical("||", _S.read(_e, "fc"), func(): return _S.read(_e, "fa"))) else 0))
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "cx"), _S.read(_e, "cy"), (_S.call_value(_S.read(_e, "c"), [_S.read(_e, "v"), _S.read(_e, "ang")]) if _S.truth(_S.read(_e, "fc")) else _S.read(_e, "c")), (_S.call_value(_S.read(_e, "a"), [_S.read(_e, "v"), _S.read(_e, "ang")]) if _S.truth(_S.read(_e, "fa")) else _S.read(_e, "a"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "R", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	_S.define(_e, "keep", _S.coalesce(_S.arg(_args, 7), func(): return null))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "w"), 1), func(): return _S.binary("<=", _S.read(_e, "k"), 0.004))):
		return null
	_S.define(_e, "col", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")]))
	_S.call_value(_S.read(_e, "annulus"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "R"), _S.read(_e, "w"))]), _S.binary("+", _S.read(_e, "R"), _S.read(_e, "w")), _S.function_value(_e, "_f6")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "cx", _S.arg(_args, 0))
	_S.define(_e, "cy", _S.arg(_args, 1))
	_S.define(_e, "d", _S.arg(_args, 2))
	if _S.truth(_S.logical("&&", _S.read(_e, "keep"), func(): return _S.unary("!", _S.call_value(_S.read(_e, "keep"), [_S.read(_e, "cx"), _S.read(_e, "cy")])))):
		return null
	_S.define(_e, "f", _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "d"), _S.read(_e, "R"))]), _S.read(_e, "w"))))
	_S.invoke(_S.read(_e, "p"), "light", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "col"), _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.read(_e, "k"))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "r0", _S.arg(_args, 3))
	_S.define(_e, "r1", _S.arg(_args, 4))
	_S.define(_e, "c", _S.arg(_args, 5))
	_S.define(_e, "k", _S.arg(_args, 6))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "r1"), _S.read(_e, "r0")), func(): return _S.binary("<=", _S.read(_e, "k"), 0.004))):
		return null
	_S.define(_e, "col", _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "c")]))
	_S.define(_e, "w", _S.binary("-", _S.read(_e, "r1"), _S.read(_e, "r0")))
	_S.call_value(_S.read(_e, "annulus"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "r0")]), _S.read(_e, "r1"), _S.function_value(_e, "_f8")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "cx", _S.arg(_args, 0))
	_S.define(_e, "cy", _S.arg(_args, 1))
	_S.define(_e, "d", _S.arg(_args, 2))
	_S.define(_e, "f", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "d"), _S.read(_e, "r0")), _S.read(_e, "w"))))
	_S.invoke(_S.read(_e, "p"), "light", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "col"), _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.read(_e, "k"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "cy", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "rot", _S.arg(_args, 2))
	_S.define(_e, "short", _S.coalesce(_S.arg(_args, 3), func(): return 0.46))
	_S.define(_e, "q", _S.coalesce(_S.arg(_args, 4), func(): return 0.32))
	_S.define(_e, "R0", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "L")]), 2))
	_S.define(_e, "n", _S.binary("+", _S.binary("*", _S.read(_e, "R0"), 2), 1))
	_S.define(_e, "data", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "n"), _S.read(_e, "n"))]))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "j"), _S.read(_v5, "n"))):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), _S.read(_v6, "n"))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "x", _S.binary("+", _S.binary("-", _S.read(_v7, "i"), _S.read(_v7, "R0")), 0.5))
			_S.define(_v7, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_v7, "cy"), _S.read(_v7, "j")), _S.read(_v7, "R0")), 0.5))
			if _S.truth(_S.logical("||", _S.call_value(_S.read(_v7, "inStar"), [_S.read(_v7, "x"), _S.read(_v7, "y"), 0, _S.read(_v7, "cy"), _S.read(_v7, "L"), _S.read(_v7, "rot"), _S.read(_v7, "q")]), func(): return _S.call_value(_S.read(_v7, "inStar"), [_S.read(_v7, "x"), _S.read(_v7, "y"), 0, _S.read(_v7, "cy"), _S.binary("*", _S.read(_v7, "L"), _S.read(_v7, "short")), _S.binary("+", _S.read(_v7, "rot"), _S.binary("/", _S.prop(_S.read(_v7, "Math"), "PI"), 4)), _S.read(_v7, "q")]))):
				_S.set_prop(_S.read(_v7, "data"), _S.binary("+", _S.binary("*", _S.read(_v7, "j"), _S.read(_v7, "n")), _S.read(_v7, "i")), 1, "=", false)
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "j", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "a", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "a"), 4)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "d", 0)
		_S.define(_v9, "ca", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.binary("+", _S.read(_v9, "rot"), _S.binary("/", _S.binary("*", _S.read(_v9, "a"), _S.prop(_S.read(_v9, "Math"), "PI")), 2))]))
		_S.define(_v9, "sa", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.read(_v9, "rot"), _S.binary("/", _S.binary("*", _S.read(_v9, "a"), _S.prop(_S.read(_v9, "Math"), "PI")), 2))]))
		while _S.truth(_S.binary("<", _S.read(_v9, "d"), _S.binary("-", _S.read(_v9, "L"), 1))):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "i", _S.binary("+", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.read(_v10, "ca"), _S.read(_v10, "d"))]), _S.read(_v10, "R0")))
			_S.define(_v10, "j", _S.binary("+", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.read(_v10, "sa"), _S.read(_v10, "d"))]), _S.read(_v10, "R0")))
			_S.set_prop(_S.read(_v10, "data"), _S.binary("+", _S.binary("*", _S.read(_v10, "j"), _S.read(_v10, "n")), _S.read(_v10, "i")), 1, "=", false)
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "d", 0.5, "+=", false)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "a", 1, "+=", true)
	_S.define(_e, "at", _S.function_value(_e, "_f10"))
	return _S.merge([{"R0": _S.read(_e, "R0")}, {"at": _S.read(_e, "at")}, {"unlight": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "i", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), _S.read(_e, "R0")))
	_S.define(_e, "j", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy"))]), _S.read(_e, "R0")))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.read(_e, "n"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.read(_e, "n"))), func(): return _S.binary("===", _S.prop(_S.read(_e, "data"), _S.binary("+", _S.binary("*", _S.read(_e, "j"), _S.read(_e, "n")), _S.read(_e, "i"))), 1))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "Lb", _S.prop(_S.read(_e, "p"), "L"))
	_S.define(_e, "w", _S.prop(_S.read(_e, "p"), "w"))
	_S.define(_e, "h", _S.prop(_S.read(_e, "p"), "h"))
	_S.define(_e, "ox", _S.prop(_S.read(_e, "p"), "ox"))
	_S.define(_e, "oy", _S.prop(_S.read(_e, "p"), "oy"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "j"), _S.read(_v11, "n"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "n"))):
			var _v13 = _S.scope(_v12)
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v13, "data"), _S.binary("+", _S.binary("*", _S.read(_v13, "j"), _S.read(_v13, "n")), _S.read(_v13, "i"))))):
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
				continue
			_S.define(_v13, "x", _S.binary("+", _S.binary("-", _S.read(_v13, "i"), _S.read(_v13, "R0")), 0.5))
			_S.define(_v13, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_v13, "cy"), _S.read(_v13, "j")), _S.read(_v13, "R0")), 0.5))
			_S.define(_v13, "sx", _S.binary("-", _S.invoke(_S.read(_v13, "p"), "cellX", [_S.read(_v13, "x"), _S.read(_v13, "y")]), _S.read(_v13, "ox")))
			_S.define(_v13, "sy", _S.binary("-", _S.invoke(_S.read(_v13, "p"), "cellY", [_S.read(_v13, "x"), _S.read(_v13, "y")]), _S.read(_v13, "oy")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v13, "sx"), 0), func(): return _S.binary(">=", _S.read(_v13, "sy"), 0)), func(): return _S.binary("<", _S.read(_v13, "sx"), _S.read(_v13, "w"))), func(): return _S.binary("<", _S.read(_v13, "sy"), _S.read(_v13, "h")))):
				_S.set_prop(_S.read(_v13, "Lb"), _S.binary("+", _S.binary("*", _S.read(_v13, "sy"), _S.read(_v13, "w")), _S.read(_v13, "sx")), 0, "=", false)
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "j", 1, "+=", true)
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	_S.define(_e, "rim", _S.arg(_args, 2))
	_S.define(_e, "skip", _S.arg(_args, 3))
	var _v14 = _S.scope(_e)
	_S.define(_v14, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "j"), _S.read(_v14, "n"))):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), _S.read(_v15, "n"))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "x", _S.binary("+", _S.binary("-", _S.read(_v16, "i"), _S.read(_v16, "R0")), 0.5))
			_S.define(_v16, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_v16, "cy"), _S.read(_v16, "j")), _S.read(_v16, "R0")), 0.5))
			if _S.truth(_S.prop(_S.read(_v16, "data"), _S.binary("+", _S.binary("*", _S.read(_v16, "j"), _S.read(_v16, "n")), _S.read(_v16, "i")))):
				_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.read(_v16, "c")])
			else:
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v16, "rim"), func(): return _S.unary("!", _S.call_value(_S.read(_v16, "skip"), [_S.read(_v16, "x"), _S.read(_v16, "y")]))), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v16, "at"), [_S.binary("-", _S.read(_v16, "x"), 1), _S.read(_v16, "y")]), func(): return _S.call_value(_S.read(_v16, "at"), [_S.binary("+", _S.read(_v16, "x"), 1), _S.read(_v16, "y")])), func(): return _S.call_value(_S.read(_v16, "at"), [_S.read(_v16, "x"), _S.binary("-", _S.read(_v16, "y"), 1)])), func(): return _S.call_value(_S.read(_v16, "at"), [_S.read(_v16, "x"), _S.binary("+", _S.read(_v16, "y"), 1)])))):
					_S.invoke(_S.read(_v16, "p"), "px", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.read(_v16, "rim")])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "j", 1, "+=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "L", _S.arg(_args, 4))
	_S.define(_e, "rot", _S.arg(_args, 5))
	_S.define(_e, "q", _S.coalesce(_S.arg(_args, 6), func(): return 0.42))
	if _S.truth(_S.binary("<=", _S.read(_e, "L"), 0)):
		return false
	_S.define(_e, "c", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "rot")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "rot")]))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")))
	_S.define(_e, "u", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "c")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "s")))]), _S.read(_e, "L")))
	_S.define(_e, "v", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "s")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "c")))]), _S.read(_e, "L")))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "u"), 1), func(): return _S.binary("<", _S.read(_e, "v"), 1)), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "u"), _S.read(_e, "v")]), _S.invoke(_S.read(_e, "Math"), "pow", [0.5, _S.binary("/", 1, _S.read(_e, "q"))]))), func(): return _S.binary("<=", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), _S.read(_e, "q")]), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "v"), _S.read(_e, "q")])), 1))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "list", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "G", _S.arg(_args, 3))
	_S.define(_e, "reach", _S.arg(_args, 4))
	_S.define(_e, "swirl", _S.arg(_args, 5))
	_S.define(_e, "r0", _S.arg(_args, 6))
	_S.define(_e, "dt", _S.arg(_args, 7))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 8), func(): return _S.function_value(_e, "_f15")))
	_S.define(_e, "vmax", _S.coalesce(_S.arg(_args, 9), func(): return INF))
	_S.define(_e, "eaten", 0)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", _S.binary("-", _S.prop(_S.read(_v17, "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v17, "i"), 0)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "q", _S.prop(_S.read(_v18, "list"), _S.read(_v18, "i")))
		_S.define(_v18, "wt", _S.call_value(_S.read(_v18, "w"), [_S.read(_v18, "q")]))
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v18, "wt")), func(): return _S.binary(">", _S.prop(_S.read(_v18, "q"), "delay"), 0))):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		_S.define(_v18, "dx", _S.binary("-", _S.read(_v18, "x"), _S.prop(_S.read(_v18, "q"), "x")))
		_S.define(_v18, "dy", _S.binary("-", _S.read(_v18, "y"), _S.prop(_S.read(_v18, "q"), "y")))
		_S.define(_v18, "d2", _S.binary("+", _S.binary("*", _S.read(_v18, "dx"), _S.read(_v18, "dx")), _S.binary("*", _S.read(_v18, "dy"), _S.read(_v18, "dy"))))
		if _S.truth(_S.binary(">", _S.read(_v18, "d2"), _S.binary("*", _S.read(_v18, "reach"), _S.read(_v18, "reach")))):
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		_S.define(_v18, "d", _S.logical("||", _S.invoke(_S.read(_v18, "Math"), "sqrt", [_S.read(_v18, "d2")]), func(): return 1))
		if _S.truth(_S.binary("<", _S.read(_v18, "d"), _S.read(_v18, "r0"))):
			var _v19 = _S.scope(_v18)
			_S.invoke(_S.read(_v19, "list"), "splice", [_S.read(_v19, "i"), 1])
			_S.write(_v19, "eaten", 1, "+=", true)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		_S.define(_v18, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v18, "G"), _S.binary("+", _S.read(_v18, "d2"), _S.binary("*", _S.read(_v18, "r0"), _S.read(_v18, "r0")))), _S.invoke(_S.read(_v18, "Math"), "min", [1, _S.binary("/", _S.binary("-", _S.read(_v18, "reach"), _S.read(_v18, "d")), _S.binary("*", _S.read(_v18, "reach"), 0.25))])), _S.read(_v18, "wt")), _S.read(_v18, "dt")))
		_S.define(_v18, "ux", _S.binary("/", _S.read(_v18, "dx"), _S.read(_v18, "d")))
		_S.define(_v18, "uy", _S.binary("/", _S.read(_v18, "dy"), _S.read(_v18, "d")))
		_S.set_prop(_S.read(_v18, "q"), "vx", _S.binary("*", _S.binary("-", _S.read(_v18, "ux"), _S.binary("*", _S.read(_v18, "uy"), _S.read(_v18, "swirl"))), _S.read(_v18, "a")), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "vy", _S.binary("*", _S.binary("+", _S.read(_v18, "uy"), _S.binary("*", _S.read(_v18, "ux"), _S.read(_v18, "swirl"))), _S.read(_v18, "a")), "+=", false)
		_S.define(_v18, "drag", _S.invoke(_S.read(_v18, "Math"), "min", [0.2, _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.read(_v18, "d"), _S.read(_v18, "reach"))), 1.6), _S.read(_v18, "dt"))]))
		_S.set_prop(_S.read(_v18, "q"), "vx", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vx"), _S.read(_v18, "drag")), "-=", false)
		_S.set_prop(_S.read(_v18, "q"), "vy", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vy"), _S.read(_v18, "drag")), "-=", false)
		_S.define(_v18, "v", _S.invoke(_S.read(_v18, "Math"), "hypot", [_S.prop(_S.read(_v18, "q"), "vx"), _S.prop(_S.read(_v18, "q"), "vy")]))
		if _S.truth(_S.binary(">", _S.read(_v18, "v"), _S.read(_v18, "vmax"))):
			_S.last([_S.set_prop(_S.read(_v18, "q"), "vx", _S.binary("/", _S.read(_v18, "vmax"), _S.read(_v18, "v")), "*=", false), _S.set_prop(_S.read(_v18, "q"), "vy", _S.binary("/", _S.read(_v18, "vmax"), _S.read(_v18, "v")), "*=", false)])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "-=", true)
	return _S.read(_e, "eaten")

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 1

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "lx", _S.arg(_args, 3))
	_S.define(_e, "ly", _S.arg(_args, 4))
	_S.define(_e, "lk", _S.arg(_args, 5))
	_S.define(_e, "fa", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_e, "b"), "life"), 0.4)]))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "b"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "b"), "a")]))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.prop(_S.read(_e, "b"), "s")]))
	_S.define(_e, "W", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.binary("*", _S.read(_e, "L"), 0.55)]))
	_S.define(_e, "side", (1 if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "sa")), _S.binary("-", _S.read(_e, "lx"), _S.prop(_S.read(_e, "b"), "x"))), _S.binary("*", _S.read(_e, "ca"), _S.binary("-", _S.read(_e, "ly"), _S.prop(_S.read(_e, "b"), "y")))), 0)) else _S.unary("-", 1)))
	_S.define(_e, "rim", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "lk"), 0.6)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "lk"), 0.3)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "lk"), 0.08)) else _S.prop(_S.read(_e, "C"), 3)))))
	_S.define(_e, "E", _S.binary("+", _S.binary("/", _S.read(_e, "L"), 2), 1.5))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "E")), _S.binary("-", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "E")), _S.binary("+", _S.prop(_S.read(_e, "b"), "x"), _S.read(_e, "E")), _S.binary("+", _S.prop(_S.read(_e, "b"), "y"), _S.read(_e, "E")), _S.function_value(_e, "_f17")])
	if _S.truth(_S.binary(">", _S.read(_e, "lk"), 0.04)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "b"), "x"), _S.prop(_S.read(_e, "b"), "y"), _S.binary("+", 3, _S.binary("*", _S.read(_e, "L"), 0.6)), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.binary("*", 0.2, _S.read(_e, "lk")), _S.read(_e, "fa"))])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.prop(_S.read(_e, "b"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.prop(_S.read(_e, "b"), "y")))
	_S.define(_e, "u", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))))
	_S.define(_e, "v", _S.binary("*", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))), _S.read(_e, "side")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), _S.binary("-", _S.binary("/", _S.unary("-", _S.read(_e, "L")), 2), 0.4)), func(): return _S.binary(">", _S.read(_e, "u"), _S.binary("+", _S.binary("/", _S.read(_e, "L"), 2), 0.4)))):
		return null
	_S.define(_e, "half", _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("/", _S.read(_e, "W"), 2), _S.binary("-", _S.binary("/", _S.read(_e, "L"), 2), _S.read(_e, "u"))), _S.read(_e, "L")), 0.4))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.read(_e, "half"))):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "fa"), "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), _S.binary("-", _S.binary("/", _S.read(_e, "L"), 2), 1.3)), func(): return _S.binary(">", _S.read(_e, "lk"), 0.3))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.binary(">", _S.read(_e, "v"), _S.binary("-", _S.read(_e, "half"), 1))):
		return (_S.read(_e, "rim") if _S.truth(_S.binary(">", _S.read(_e, "u"), _S.binary("/", _S.unary("-", _S.read(_e, "L")), 4))) else _S.prop(_S.read(_e, "C"), _S.invoke(_S.read(_e, "Math"), "max", [3, _S.binary("-", _S.invoke(_S.read(_e, "C"), "indexOf", [_S.read(_e, "rim")]), 1)])))
	return (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.binary("+", _S.unary("-", _S.read(_e, "half")), 1))) else _S.prop(_S.read(_e, "C"), 2))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "ripples", _S.arg(_args, 4))
	if _S.truth(_S.binary("<", _S.read(_e, "rx"), 1)):
		return null
	_S.define(_e, "ry", _S.binary("+", _S.binary("*", _S.read(_e, "rx"), 0.17), 0.6))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "rx")), 3), _S.binary("-", _S.unary("-", _S.read(_e, "ry")), 2), _S.binary("+", _S.read(_e, "rx"), 3), _S.binary("+", _S.read(_e, "ry"), 2), _S.function_value(_e, "_f19")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.5), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy")))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1.18)):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		var _v20 = _S.scope(_e)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v20, "dy"), 0), func(): return _S.binary("<", _S.read(_v20, "d"), 1.09))):
			return (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "dx")]), 0.55)) else (_S.prop(_S.read(_v20, "C"), 5) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "dx")]), 0.85)) else _S.prop(_S.read(_v20, "C"), 4)))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v20, "dy"), 0), func(): return _S.binary("<", _S.read(_v20, "d"), 1.09))):
			return _S.prop(_S.read(_v20, "C"), 2)
		return (_S.prop(_S.read(_v20, "C"), 1) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v20, "y"), _S.unary("-", 0.5)), func(): return _S.binary(">", _S.call_value(_S.read(_v20, "noise"), [_S.binary("*", _S.read(_v20, "x"), 0.7), 9]), 0.15))) else null)
	for _v21 in _S.array(_S.read(_e, "ripples")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "r", _v21)
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "age", _S.binary("-", _S.read(_v23, "t"), _S.prop(_S.read(_v23, "r"), "t0")))
		_S.define(_v23, "rr", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v23, "age"), 46), _S.prop(_S.read(_v23, "r"), "w")), 1))
		_S.define(_v23, "ex", _S.binary("-", _S.read(_v23, "x"), _S.prop(_S.read(_v23, "r"), "x")))
		_S.define(_v23, "ey", _S.binary("/", _S.binary("-", _S.read(_v23, "y"), 0.5), 0.17))
		_S.define(_v23, "e", _S.logical("||", _S.invoke(_S.read(_v23, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v23, "ex"), _S.read(_v23, "ex")), _S.binary("*", _S.read(_v23, "ey"), _S.read(_v23, "ey")))]), func(): return 1))
		_S.define(_v23, "g", _S.binary("/", _S.invoke(_S.read(_v23, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v23, "ex"), _S.read(_v23, "ex")), _S.binary("**", _S.binary("/", _S.read(_v23, "ey"), 0.17), 2))]), _S.read(_v23, "e")))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v23, "Math"), "abs", [_S.binary("-", _S.read(_v23, "e"), _S.read(_v23, "rr"))]), _S.binary("*", 0.55, _S.read(_v23, "g"))), func(): return _S.binary("<", _S.read(_v23, "age"), _S.prop(_S.read(_v23, "r"), "life")))):
			return (_S.prop(_S.read(_v23, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v23, "age"), _S.binary("*", _S.prop(_S.read(_v23, "r"), "life"), 0.5))) else _S.prop(_S.read(_v23, "C"), 3))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "dy"), _S.unary("-", 0.55)), func(): return _S.binary(">", _S.read(_e, "dy"), _S.unary("-", 0.85))), func(): return _S.binary(">", _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "x"), 0.25), _S.binary("*", _S.read(_e, "t"), 1.3)), 4]), 0.2))):
		return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.call_value(_S.read(_e, "noise"), [_S.binary("-", _S.binary("*", _S.read(_e, "x"), 0.6), _S.binary("*", _S.read(_e, "t"), 2)), 6]), 0.55)) else _S.prop(_S.read(_e, "C"), 2))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dy"), _S.unary("-", 0.35)), func(): return _S.binary(">", _S.read(_e, "d"), 0.72))):
		return (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.9)) else _S.prop(_S.read(_e, "C"), 2))
	return (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.86)) else _S.prop(_S.read(_e, "C"), 0))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "R", _S.prop(_S.read(_e, "o"), "rng"), "=", false)
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "t", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "F", _S.call_value(_S.read(_e, "ramp"), [_S.prop(_S.read(_e, "o"), "flame")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "soot", _S.call_value(_S.read(_e, "ramp"), [_S.prop(_S.read(_e, "o"), "soot")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "cap", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "cap")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "rim", _S.call_value(_S.read(_e, "ramp"), [_S.prop(_S.read(_e, "o"), "rim")]), "=", false)
	_S.set_prop(_S.read(_e, "this"), "floor", _S.logical("??", _S.prop(_S.read(_e, "o"), "floor"), func(): return null), "=", false)
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	_S.define(_e, "size", _S.arg(_args, 6))
	_S.define(_e, "delay", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	_S.define(_e, "smokes", _S.coalesce(_S.arg(_args, 8), func(): return false))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"k": _S.read(_e, "k")}, {"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}, {"size": _S.read(_e, "size")}, {"delay": _S.read(_e, "delay")}, {"smokes": _S.read(_e, "smokes")}, {"seed": _S.binary("*", _S.invoke(_S.prop(_S.read(_e, "this"), "R"), "next", []), 100)}])])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.prop(_S.prop(_S.read(_e, "this"), "list"), "length")

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "t", _S.prop(_S.read(_e, "this"), "t"))
	var _v24 = _S.scope(_e)
	_S.define(_v24, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v24, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v24, "i"), 0)):
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "q", _S.prop(_S.prop(_S.read(_v25, "this"), "list"), _S.read(_v25, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v25, "q"), "delay"), 0)):
			var _v26 = _S.scope(_v25)
			_S.set_prop(_S.read(_v26, "q"), "delay", _S.read(_v26, "dt"), "-=", false)
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v25, "q"), "life", _S.read(_v25, "dt"), "-=", false), 0)):
			var _v27 = _S.scope(_v25)
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v27, "q"), "k"), _S.prop(_S.read(_v27, "PK"), "FLAME")), func(): return _S.prop(_S.read(_v27, "q"), "smokes"))):
				_S.invoke(_S.read(_v27, "this"), "spawn", [_S.prop(_S.read(_v27, "PK"), "SOOT"), _S.prop(_S.read(_v27, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v27, "q"), "y"), 1), _S.binary("*", _S.prop(_S.read(_v27, "q"), "vx"), 0.5), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v27, "q"), "vy"), 0.5), 6), _S.invoke(_S.prop(_S.read(_v27, "this"), "R"), "range", [0.9, 1.6]), _S.binary("*", _S.prop(_S.read(_v27, "q"), "size"), 1.25)])
			_S.invoke(_S.prop(_S.read(_v27, "this"), "list"), "splice", [_S.read(_v27, "i"), 1])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v25, "q"), "k"), _S.prop(_S.read(_v25, "PK"), "FLAME"))):
			var _v28 = _S.scope(_v25)
			_S.set_prop(_S.read(_v28, "q"), "vy", _S.binary("*", 95, _S.read(_v28, "dt")), "-=", false)
			_S.set_prop(_S.read(_v28, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v28, "t"), 17), _S.prop(_S.read(_v28, "q"), "seed"))]), 30), _S.read(_v28, "dt")), "+=", false)
			_S.set_prop(_S.read(_v28, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v28, "q"), "vx"), 5), _S.read(_v28, "dt")), "-=", false)
			_S.set_prop(_S.read(_v28, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v28, "q"), "vy"), 3.2), _S.read(_v28, "dt")), "-=", false)
		else:
			var _v29 = _S.scope(_v25)
			_S.set_prop(_S.read(_v29, "q"), "vy", _S.binary("*", 18, _S.read(_v29, "dt")), "-=", false)
			_S.set_prop(_S.read(_v29, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v29, "t"), 1.3), _S.prop(_S.read(_v29, "q"), "seed"))]), 8), _S.read(_v29, "dt")), "+=", false)
			_S.set_prop(_S.read(_v29, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v29, "q"), "vx"), 1.6), _S.read(_v29, "dt")), "-=", false)
			_S.set_prop(_S.read(_v29, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v29, "q"), "vy"), 1.3), _S.read(_v29, "dt")), "-=", false)
		_S.set_prop(_S.read(_v25, "q"), "x", _S.binary("*", _S.prop(_S.read(_v25, "q"), "vx"), _S.read(_v25, "dt")), "+=", false)
		_S.set_prop(_S.read(_v25, "q"), "y", _S.binary("*", _S.prop(_S.read(_v25, "q"), "vy"), _S.read(_v25, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v25, "this"), "floor"), func(): return _S.binary("===", _S.prop(_S.read(_v25, "q"), "k"), _S.prop(_S.read(_v25, "PK"), "SOOT")))):
			var _v30 = _S.scope(_v25)
			_S.define(_v30, "f", _S.binary("-", _S.invoke(_S.read(_v30, "this"), "floor", [_S.prop(_S.read(_v30, "q"), "x")]), _S.binary("*", _S.prop(_S.read(_v30, "q"), "size"), 0.6)))
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v30, "q"), "y"), _S.read(_v30, "f"))):
				_S.last([_S.set_prop(_S.read(_v30, "q"), "y", _S.read(_v30, "f"), "=", false), _S.set_prop(_S.read(_v30, "q"), "vy", _S.invoke(_S.read(_v30, "Math"), "min", [0, _S.prop(_S.read(_v30, "q"), "vy")]), "=", false), _S.set_prop(_S.read(_v30, "q"), "vx", _S.binary("-", 1, _S.binary("*", 2, _S.read(_v30, "dt"))), "*=", false)])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "i", 1, "-=", true)
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "kind", _S.arg(_args, 1))
	_S.define(_e, "light", _S.coalesce(_S.arg(_args, 2), func(): return null))
	_S.define(_e, "F", _S.prop(_S.read(_e, "this"), "F"))
	_S.define(_e, "n", _S.prop(_S.read(_e, "F"), "length"))
	for _v31 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "q", _v31)
		var _v33 = _S.scope(_v32)
		if _S.truth(_S.logical("||", _S.binary(">", _S.prop(_S.read(_v33, "q"), "delay"), 0), func(): return _S.binary("!==", _S.prop(_S.read(_v33, "q"), "k"), _S.read(_v33, "kind")))):
			continue
		_S.define(_v33, "k", _S.binary("/", _S.prop(_S.read(_v33, "q"), "life"), _S.prop(_S.read(_v33, "q"), "max")))
		_S.define(_v33, "age", _S.binary("-", 1, _S.read(_v33, "k")))
		_S.define(_v33, "x", _S.prop(_S.read(_v33, "q"), "x"))
		_S.define(_v33, "y", _S.prop(_S.read(_v33, "q"), "y"))
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v33, "q"), "k"), _S.prop(_S.read(_v33, "PK"), "FLAME"))):
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "heat", _S.invoke(_S.read(_v34, "Math"), "min", [0.999, _S.binary("+", _S.invoke(_S.read(_v34, "Math"), "pow", [_S.read(_v34, "age"), 0.62]), _S.binary("*", _S.binary("%", _S.prop(_S.read(_v34, "q"), "seed"), 1), 0.1))]))
			_S.define(_v34, "idx", _S.invoke(_S.read(_v34, "Math"), "min", [_S.binary("-", _S.read(_v34, "n"), 2), _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("*", _S.read(_v34, "heat"), _S.binary("-", _S.read(_v34, "n"), 1))])]))
			_S.define(_v34, "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v34, "q"), "size"), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_v34, "Math"), "min", [1, _S.binary("*", _S.read(_v34, "age"), 7)])))), _S.binary("-", 1, _S.binary("*", _S.read(_v34, "age"), 0.55))))
			_S.define(_v34, "c", _S.prop(_S.read(_v34, "F"), _S.read(_v34, "idx")))
			if _S.truth(_S.binary(">=", _S.read(_v34, "idx"), _S.binary("-", _S.read(_v34, "n"), 3))):
				_S.invoke(_S.read(_v34, "p"), "disc", [_S.read(_v34, "x"), _S.read(_v34, "y"), _S.read(_v34, "r"), _S.read(_v34, "c"), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "min", [1, _S.binary("*", _S.read(_v34, "k"), 3)]), 0.8)])
			else:
				var _v35 = _S.scope(_v34)
				_S.invoke(_S.read(_v35, "p"), "circle", [_S.read(_v35, "x"), _S.read(_v35, "y"), _S.read(_v35, "r"), _S.prop(_S.read(_v35, "F"), _S.invoke(_S.read(_v35, "Math"), "min", [_S.binary("-", _S.read(_v35, "n"), 1), _S.binary("+", _S.read(_v35, "idx"), 2)]))])
				_S.invoke(_S.read(_v35, "p"), "circle", [_S.binary("-", _S.read(_v35, "x"), _S.binary("*", _S.read(_v35, "r"), 0.16)), _S.binary("-", _S.read(_v35, "y"), _S.binary("*", _S.read(_v35, "r"), 0.22)), _S.binary("*", _S.read(_v35, "r"), 0.78), _S.read(_v35, "c")])
				if _S.truth(_S.binary(">", _S.read(_v35, "r"), 1.6)):
					_S.invoke(_S.read(_v35, "p"), "circle", [_S.read(_v35, "x"), _S.binary("-", _S.read(_v35, "y"), _S.binary("*", _S.read(_v35, "r"), 0.9)), _S.binary("*", _S.read(_v35, "r"), 0.42), _S.read(_v35, "c")])
				if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v35, "idx"), 3), func(): return _S.binary(">", _S.read(_v35, "r"), 1.8))):
					_S.invoke(_S.read(_v35, "p"), "circle", [_S.binary("-", _S.read(_v35, "x"), _S.binary("*", _S.read(_v35, "r"), 0.28)), _S.binary("-", _S.read(_v35, "y"), _S.binary("*", _S.read(_v35, "r"), 0.34)), _S.binary("*", _S.read(_v35, "r"), 0.36), _S.prop(_S.read(_v35, "F"), _S.invoke(_S.read(_v35, "Math"), "max", [0, _S.binary("-", _S.read(_v35, "idx"), 1)]))])
				if _S.truth(_S.binary("<", _S.read(_v35, "idx"), 6)):
					_S.invoke(_S.read(_v35, "p"), "glow", [_S.read(_v35, "x"), _S.read(_v35, "y"), _S.binary("+", _S.binary("*", _S.read(_v35, "r"), 2.4), 2), _S.read(_v35, "c"), _S.binary("*", 0.2, _S.read(_v35, "k"))])
			continue
		_S.define(_v33, "r", _S.binary("*", _S.prop(_S.read(_v33, "q"), "size"), _S.binary("+", _S.binary("+", 0.65, _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "min", [1, _S.binary("*", _S.read(_v33, "age"), 2.5)]), 0.45)), _S.binary("*", _S.read(_v33, "age"), 0.45))))
		_S.define(_v33, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "min", [1, _S.binary("*", _S.read(_v33, "age"), 10)]), _S.invoke(_S.read(_v33, "Math"), "min", [1, _S.binary("*", _S.read(_v33, "k"), 2.2)])), 0.72))
		_S.define(_v33, "body", _S.call_value(_S.read(_v33, "mix"), [_S.prop(_S.prop(_S.read(_v33, "this"), "soot"), 0), _S.prop(_S.prop(_S.read(_v33, "this"), "soot"), 1), _S.read(_v33, "age")]))
		_S.define(_v33, "edge", _S.binary("*", _S.read(_v33, "a"), 0.5))
		_S.define(_v33, "core", _S.binary("-", 1, _S.binary("*", _S.binary("-", 1, _S.binary("*", _S.read(_v33, "a"), 0.5)), _S.binary("-", 1, _S.binary("*", _S.read(_v33, "a"), 0.62)))))
		_S.invoke(_S.read(_v33, "p"), "disc", [_S.read(_v33, "x"), _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.read(_v33, "r"), 0.06)), _S.read(_v33, "r"), _S.read(_v33, "body"), _S.function_value(_v33, "_f25")])
		_S.define(_v33, "lk", (_S.prop(_S.read(_v33, "light"), "k") if _S.truth(_S.read(_v33, "light")) else 0))
		if _S.truth(_S.binary("<", _S.read(_v33, "lk"), 0.5)):
			_S.invoke(_S.read(_v33, "p"), "disc", [_S.binary("-", _S.read(_v33, "x"), _S.binary("*", _S.read(_v33, "r"), 0.2)), _S.binary("-", _S.read(_v33, "y"), _S.binary("*", _S.read(_v33, "r"), 0.32)), _S.binary("*", _S.read(_v33, "r"), 0.48), _S.prop(_S.read(_v33, "this"), "cap"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v33, "a"), 0.32), _S.binary("-", 1, _S.binary("*", _S.read(_v33, "age"), 0.7))), _S.binary("-", 1, _S.binary("*", _S.read(_v33, "lk"), 2)))])
		if _S.truth(_S.binary("<=", _S.read(_v33, "lk"), 0.02)):
			continue
		_S.define(_v33, "lx", _S.binary("-", _S.prop(_S.read(_v33, "light"), "x"), _S.read(_v33, "x")))
		_S.define(_v33, "ly", _S.binary("-", _S.prop(_S.read(_v33, "light"), "y"), _S.read(_v33, "y")))
		_S.define(_v33, "dl", _S.logical("||", _S.invoke(_S.read(_v33, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v33, "lx"), _S.read(_v33, "lx")), _S.binary("*", _S.read(_v33, "ly"), _S.read(_v33, "ly")))]), func(): return 1))
		_S.define(_v33, "ux", _S.binary("/", _S.read(_v33, "lx"), _S.read(_v33, "dl")))
		_S.define(_v33, "uy", _S.binary("/", _S.read(_v33, "ly"), _S.read(_v33, "dl")))
		_S.define(_v33, "lit", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "min", [1, _S.binary("*", _S.prop(_S.read(_v33, "light"), "k"), _S.call_value(_S.read(_v33, "clamp"), [_S.binary("-", 1.3, _S.binary("/", _S.read(_v33, "dl"), _S.prop(_S.read(_v33, "light"), "reach")))]))]), _S.read(_v33, "a")))
		if _S.truth(_S.binary("<=", _S.read(_v33, "lit"), 0.02)):
			continue
		var _v36 = _S.prop(_S.read(_v33, "this"), "rim")
		_S.define(_v33, "hot", _S.prop(_v36, 0))
		_S.define(_v33, "warm", _S.prop(_v36, 1))
		_S.define(_v33, "dim", _S.prop(_v36, 2))
		_S.invoke(_S.read(_v33, "p"), "disc", [_S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.binary("*", _S.read(_v33, "ux"), _S.read(_v33, "r")), 0.26)), _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.binary("*", _S.read(_v33, "uy"), _S.read(_v33, "r")), 0.26)), _S.binary("*", _S.read(_v33, "r"), 0.72), _S.read(_v33, "dim"), _S.binary("*", _S.read(_v33, "lit"), 0.55)])
		_S.invoke(_S.read(_v33, "p"), "disc", [_S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.binary("*", _S.read(_v33, "ux"), _S.read(_v33, "r")), 0.5)), _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.binary("*", _S.read(_v33, "uy"), _S.read(_v33, "r")), 0.5)), _S.binary("*", _S.read(_v33, "r"), 0.46), _S.read(_v33, "warm"), _S.binary("*", _S.read(_v33, "lit"), 0.5)])
		if _S.truth(_S.binary(">", _S.read(_v33, "r"), 3)):
			_S.invoke(_S.read(_v33, "p"), "disc", [_S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.binary("*", _S.read(_v33, "ux"), _S.read(_v33, "r")), 0.68)), _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.binary("*", _S.read(_v33, "uy"), _S.read(_v33, "r")), 0.68)), _S.binary("*", _S.read(_v33, "r"), 0.24), _S.read(_v33, "hot"), _S.binary("*", _S.read(_v33, "lit"), 0.4)])
	return null

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "core") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.72)) else _S.read(_e, "edge"))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([])))
	_S.set_prop(_S.read(_e, "this"), "list", [], "=", false)
	_S.set_prop(_S.read(_e, "this"), "floor", _S.logical("??", _S.prop(_S.read(_e, "o"), "floor"), func(): return _S.function_value(_e, "_f27")), "=", false)
	_S.set_prop(_S.read(_e, "this"), "onLand", _S.logical("??", _S.prop(_S.read(_e, "o"), "onLand"), func(): return null), "=", false)
	_S.set_prop(_S.read(_e, "this"), "g", _S.logical("??", _S.prop(_S.read(_e, "o"), "g"), func(): return 0.8), "=", false)
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "size", _S.coalesce(_S.arg(_args, 4), func(): return 1))
	_S.invoke(_S.prop(_S.read(_e, "this"), "list"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"size": _S.read(_e, "size")}])])
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	var _v37 = _S.scope(_e)
	_S.define(_v37, "i", _S.binary("-", _S.prop(_S.prop(_S.read(_v37, "this"), "list"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v37, "i"), 0)):
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "d", _S.prop(_S.prop(_S.read(_v38, "this"), "list"), _S.read(_v38, "i")))
		_S.set_prop(_S.read(_v38, "d"), "vy", _S.binary("*", _S.binary("*", _S.read(_v38, "GRAVITY"), _S.prop(_S.read(_v38, "this"), "g")), _S.read(_v38, "dt")), "+=", false)
		_S.set_prop(_S.read(_v38, "d"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v38, "d"), "vx"), 0.4), _S.read(_v38, "dt")), "-=", false)
		_S.set_prop(_S.read(_v38, "d"), "x", _S.binary("*", _S.prop(_S.read(_v38, "d"), "vx"), _S.read(_v38, "dt")), "+=", false)
		_S.set_prop(_S.read(_v38, "d"), "y", _S.binary("*", _S.prop(_S.read(_v38, "d"), "vy"), _S.read(_v38, "dt")), "+=", false)
		_S.define(_v38, "f", _S.invoke(_S.read(_v38, "this"), "floor", [_S.prop(_S.read(_v38, "d"), "x")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v38, "d"), "vy"), 0), func(): return _S.binary(">=", _S.prop(_S.read(_v38, "d"), "y"), _S.read(_v38, "f")))):
			var _v39 = _S.scope(_v38)
			_S.optional_call(_S.prop(_S.read(_v39, "this"), "onLand"), [_S.prop(_S.read(_v39, "d"), "x"), _S.read(_v39, "f"), _S.prop(_S.read(_v39, "d"), "vy"), _S.prop(_S.read(_v39, "d"), "size")])
			_S.invoke(_S.prop(_S.read(_v39, "this"), "list"), "splice", [_S.read(_v39, "i"), 1])
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "i", 1, "-=", true)
	return null

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "body", _S.arg(_args, 1))
	_S.define(_e, "shine", _S.arg(_args, 2))
	for _v40 in _S.array(_S.prop(_S.read(_e, "this"), "list")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "d", _v40)
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "up", _S.binary("<", _S.prop(_S.read(_v42, "d"), "vy"), 0))
		_S.invoke(_S.read(_v42, "p"), "px", [_S.prop(_S.read(_v42, "d"), "x"), _S.prop(_S.read(_v42, "d"), "y"), _S.read(_v42, "body")])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v42, "d"), "size"), 1.4)):
			_S.invoke(_S.read(_v42, "p"), "px", [_S.prop(_S.read(_v42, "d"), "x"), _S.binary("+", _S.prop(_S.read(_v42, "d"), "y"), (1 if _S.truth(_S.read(_v42, "up")) else _S.unary("-", 1))), _S.read(_v42, "body")])
		_S.invoke(_S.read(_v42, "p"), "px", [_S.prop(_S.read(_v42, "d"), "x"), _S.binary("-", _S.prop(_S.read(_v42, "d"), "y"), (1 if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v42, "d"), "size"), 1.4), func(): return _S.unary("!", _S.read(_v42, "up")))) else 0)), _S.read(_v42, "shine")])
	return null
