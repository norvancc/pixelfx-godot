@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/magic-circle-cast.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "fract", _S.import_value("core/index.js", "fract"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "floorRing", _S.import_value("fx/arcane/_lib.js", "floorRing"))
	_S.define(_e, "bayer", _S.import_value("fx/arcane/_lib.js", "bayer"))
	_S.define(_e, "glyph", _S.import_value("fx/arcane/_lib.js", "glyph"))
	_S.define(_e, "level", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "R", 40)
	_S.define(_e, "R2", 35)
	_S.define(_e, "RI", 24)
	_S.define(_e, "RR", 30)
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "TOP", 192)
	_S.define(_e, "W", 11)
	_S.define(_e, "NRUNE", 8)
	_S.define(_e, "PEN", [0.04, 0.42])
	_S.define(_e, "PEN2", [0.1, 0.48])
	_S.define(_e, "INNER", [0.3, 0.6])
	_S.define(_e, "STAR", [0.52, 0.88])
	_S.define(_e, "RUNES", [0.9, 1.3])
	_S.define(_e, "FLASH", 1.52)
	_S.define(_e, "BREAK", 2.42)
	_S.define(_e, "GONE", 3.45)
	_S.define(_e, "END", 3.9)
	_S.define(_e, "meta", _S.merge([{"name": "Magic circle cast"}, {"desc": "A circle draws itself on the floor, runes ignite one by one, it flashes, and a column of light fires up and breaks apart into glints."}, {"tags": ["arcane", "magic", "circle", "rune", "cast", "column", "summon", "ground", "one-shot"]}, {"size": [200, 220]}, {"origin": [100, 192]}, {"duration": _S.read(_e, "END")}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "wrap", _S.function_value(_e, "_f31"))
	_S.define(_e, "fromFront", _S.function_value(_e, "_f32"))
	_S.define(_e, "outerAt", _S.function_value(_e, "_f33"))
	_S.define(_e, "innerAt", _S.function_value(_e, "_f34"))
	_S.define(_e, "runeAngle", _S.function_value(_e, "_f35"))
	_S.define(_e, "runeLit", _S.function_value(_e, "_f36"))
	_S.define(_e, "runeOut", _S.function_value(_e, "_f37"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "RUNES"), 0))):
		return 0.55
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))):
		return _S.binary("+", 0.55, _S.binary("*", 0.4, _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.read(_e, "RUNES"), 0), _S.read(_e, "FLASH"), _S.read(_e, "t")])))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FLASH"), 0.07))):
		return 1.2
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))):
		return 0.92
	return _S.binary("*", 0.92, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "BREAK"), _S.read(_e, "GONE"), _S.read(_e, "t")])))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "planeLine", _S.function_value(_e, "_f2"))
	_S.define(_e, "circle", _S.function_value(_e, "_f5"))
	_S.define(_e, "runes", _S.function_value(_e, "_f15"))
	_S.define(_e, "column", _S.function_value(_e, "_f16"))
	_S.define(_e, "shock", _S.function_value(_e, "_f17"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "Rg", _S.construct(_S.read(_e, "Rng"), [_S.read(_e, "S")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "Rg")}, {"ground": _S.function_value(_e, "_f19")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "COL", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)])
	_S.define(_e, "strands", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f20")]))
	_S.define(_e, "tri", _S.function_value(_e, "_f21"))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "tri"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2)]))
	_S.define(_e, "Bt", _S.call_value(_S.read(_e, "tri"), [_S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)]))
	_S.define(_e, "edges", [])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "k"), 3)):
		for _v27 in _S.array([_S.read(_v26, "A"), _S.read(_v26, "Bt")]):
			var _v28 = _S.scope(_v26)
			_S.define(_v28, "T", _v27)
			_S.invoke(_S.read(_v28, "edges"), "push", [_S.merge([{"p0": _S.prop(_S.read(_v28, "T"), _S.read(_v28, "k"))}, {"p1": _S.prop(_S.read(_v28, "T"), _S.binary("%", _S.binary("+", _S.read(_v28, "k"), 1), 3))}, {"t0": _S.binary("+", _S.prop(_S.read(_v28, "STAR"), 0), _S.binary("/", _S.binary("*", _S.read(_v28, "k"), _S.binary("-", _S.prop(_S.read(_v28, "STAR"), 1), _S.prop(_S.read(_v28, "STAR"), 0))), 3))}, {"dur": _S.binary("/", _S.binary("-", _S.prop(_S.read(_v28, "STAR"), 1), _S.prop(_S.read(_v28, "STAR"), 0)), 3)}])])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "k", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "flashed", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "out", _S.invoke(_S.construct(_S.read(_e, "Array"), [_S.read(_e, "NRUNE")]), "fill", [false]))
	_S.define(_e, "lineCol", _S.function_value(_e, "_f24"))
	_S.define(_e, "lineA", _S.function_value(_e, "_f25"))
	return _S.merge([{"update": _S.function_value(_e, "_f26")}, {"drawBack": _S.function_value(_e, "_f28")}, {"draw": _S.function_value(_e, "_f29")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "p0", _S.arg(_args, 1))
	_S.define(_e, "p1", _S.arg(_args, 2))
	_S.define(_e, "t0", _S.arg(_args, 3))
	_S.define(_e, "dur", _S.arg(_args, 4))
	_S.define(_e, "lvl", _S.arg(_args, 5))
	_S.define(_e, "far", _S.arg(_args, 6))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.read(_e, "dur"))]))
	if _S.truth(_S.binary("<=", _S.read(_e, "s"), 0)):
		return null
	_S.define(_e, "u0", 0)
	_S.define(_e, "u1", _S.read(_e, "s"))
	_S.define(_e, "v0", _S.prop(_S.read(_e, "p0"), 1))
	_S.define(_e, "v1", _S.prop(_S.read(_e, "p1"), 1))
	if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_e, "v0"), 0), _S.binary("<", _S.read(_e, "v1"), 0))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "uc", _S.binary("/", _S.read(_v0, "v0"), _S.binary("-", _S.read(_v0, "v0"), _S.read(_v0, "v1"))))
		if _S.truth(_S.binary("===", _S.binary("<", _S.read(_v0, "v0"), 0), _S.read(_v0, "far"))):
			_S.write(_v0, "u1", _S.invoke(_S.read(_v0, "Math"), "min", [_S.read(_v0, "u1"), _S.read(_v0, "uc")]), "=", false)
		else:
			_S.write(_v0, "u0", _S.read(_v0, "uc"), "=", false)
	else:
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_e, "v0"), 0), _S.read(_e, "far"))):
			return null
	if _S.truth(_S.binary("<=", _S.read(_e, "u1"), _S.read(_e, "u0"))):
		return null
	_S.define(_e, "P", _S.function_value(_e, "_f3"))
	var _v1 = _S.call_value(_S.read(_e, "P"), [_S.read(_e, "u0")])
	_S.define(_e, "xa", _S.prop(_v1, 0))
	_S.define(_e, "ya", _S.prop(_v1, 1))
	var _v2 = _S.call_value(_S.read(_e, "P"), [_S.read(_e, "u1")])
	_S.define(_e, "xb", _S.prop(_v2, 0))
	_S.define(_e, "yb", _S.prop(_v2, 1))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "xa"), _S.read(_e, "ya"), _S.read(_e, "xb"), _S.read(_e, "yb"), _S.function_value(_e, "_f4"), _S.call_value(_S.read(_e, "lineA"), [_S.read(_e, "lvl")])])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return [_S.binary("+", _S.prop(_S.read(_e, "p0"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "p1"), 0), _S.prop(_S.read(_e, "p0"), 0)), _S.read(_e, "u"))), _S.binary("*", _S.binary("+", _S.read(_e, "v0"), _S.binary("*", _S.binary("-", _S.read(_e, "v1"), _S.read(_e, "v0")), _S.read(_e, "u"))), _S.read(_e, "SY"))]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lineCol"), [_S.read(_e, "lvl"), _S.binary("-", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "t0"), _S.binary("*", _S.binary("+", _S.read(_e, "u0"), _S.binary("*", _S.binary("-", _S.read(_e, "u1"), _S.read(_e, "u0")), _S.read(_e, "q"))), _S.read(_e, "dur"))))])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "far", _S.arg(_args, 1))
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "GONE"))):
		return null
	_S.define(_e, "lvl", _S.call_value(_S.read(_e, "level"), [_S.read(_e, "t")]))
	_S.define(_e, "keep", (_S.function_value(_e, "_f6") if _S.truth(_S.read(_e, "far")) else _S.function_value(_e, "_f7")))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "lineA"), [_S.read(_e, "lvl")]))
	_S.define(_e, "ring", _S.function_value(_e, "_f8"))
	_S.define(_e, "run", (_S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "RUNES"), 0)), 5), _S.binary("*", _S.binary("**", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "RUNES"), 0)), 2), 4)) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "RUNES"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK")))) else null))
	_S.define(_e, "chase", (null if _S.truth(_S.binary("===", _S.read(_e, "run"), null)) else _S.function_value(_e, "_f11")))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "R"), _S.function_value(_e, "_f13"), _S.read(_e, "chase")])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "R2"), _S.function_value(_e, "_f14")])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "RI"), _S.read(_e, "innerAt")])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "j"), 32)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "g", _S.binary("/", _S.binary("*", _S.binary("+", _S.read(_v4, "j"), 0.5), _S.read(_v4, "TAU")), 32))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "g")]), 0), _S.read(_v4, "far"))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "j", 1, "+=", true)
			continue
		_S.define(_v4, "when", _S.binary("+", _S.call_value(_S.read(_v4, "outerAt"), [_S.read(_v4, "g"), _S.read(_v4, "PEN2")]), 0.03))
		if _S.truth(_S.binary("<", _S.read(_v4, "t"), _S.read(_v4, "when"))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "j", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v4, "p"), "line", [_S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "g")]), _S.read(_v4, "R2")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "g")]), _S.read(_v4, "R2")), _S.read(_v4, "SY")), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "g")]), _S.read(_v4, "R")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "g")]), _S.read(_v4, "R")), _S.read(_v4, "SY")), _S.call_value(_S.read(_v4, "lineCol"), [_S.read(_v4, "lvl"), _S.binary("-", _S.read(_v4, "t"), _S.read(_v4, "when"))]), _S.binary("*", _S.read(_v4, "a"), (0.6 if _S.truth(_S.binary("%", _S.read(_v4, "j"), 2)) else 1))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "j", 1, "+=", true)
	for _v5 in _S.array(_S.read(_e, "edges")):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "e", _v5)
		_S.call_value(_S.read(_v6, "planeLine"), [_S.read(_v6, "p"), _S.prop(_S.read(_v6, "e"), "p0"), _S.prop(_S.read(_v6, "e"), "p1"), _S.prop(_S.read(_v6, "e"), "t0"), _S.prop(_S.read(_v6, "e"), "dur"), _S.read(_v6, "lvl"), _S.read(_v6, "far")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "when", _S.arg(_args, 1))
	_S.define(_e, "chase", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "floorRing"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "r"), _S.read(_e, "SY"), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10"), _S.read(_e, "keep")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.read(_e, "chase"), func(): return _S.call_value(_S.read(_e, "chase"), [_S.read(_e, "g")]))) else _S.call_value(_S.read(_e, "lineCol"), [_S.read(_e, "lvl"), _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "when"), [_S.read(_e, "g")]))]))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.call_value(_S.read(_e, "when"), [_S.read(_e, "g")]))) else _S.read(_e, "a"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke([0, _S.prop(_S.read(_e, "Math"), "PI")], "some", [_S.function_value(_e, "_f12")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "atan2", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("-", _S.read(_e, "g"), _S.read(_e, "run")), _S.read(_e, "o"))]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.binary("-", _S.read(_e, "g"), _S.read(_e, "run")), _S.read(_e, "o"))])])]), 0.22)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "outerAt"), [_S.read(_e, "g"), _S.read(_e, "PEN")])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "outerAt"), [_S.read(_e, "g"), _S.read(_e, "PEN2")])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "far", _S.arg(_args, 1))
	var _v7 = _S.scope(_e)
	_S.define(_v7, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v7, "k"), _S.read(_v7, "NRUNE"))):
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "g", _S.call_value(_S.read(_v8, "runeAngle"), [_S.read(_v8, "k")]))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "g")]), 0), _S.read(_v8, "far"))):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "k", 1, "+=", true)
			continue
		_S.define(_v8, "x", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "g")]), _S.read(_v8, "RR")))
		_S.define(_v8, "y0", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "g")]), _S.read(_v8, "RR")), _S.read(_v8, "SY")))
		_S.define(_v8, "lit", _S.binary("-", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "runeLit"), [_S.read(_v8, "k")])))
		_S.define(_v8, "gone", _S.call_value(_S.read(_v8, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "runeOut"), [_S.read(_v8, "k")])), 0.25)]))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "innerAt"), [_S.read(_v8, "g")])), func(): return _S.binary(">=", _S.read(_v8, "gone"), 1))):
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "k", 1, "+=", true)
			continue
		if _S.truth(_S.binary("<", _S.read(_v8, "lit"), 0)):
			var _v9 = _S.scope(_v8)
			_S.call_value(_S.read(_v9, "glyph"), [_S.read(_v9, "p"), _S.read(_v9, "k"), _S.read(_v9, "x"), _S.binary("-", _S.read(_v9, "y0"), 1), _S.prop(_S.read(_v9, "C"), 3)])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "k", 1, "+=", true)
			continue
		_S.define(_v8, "rise", _S.binary("*", 3, _S.invoke(_S.read(_v8, "ease"), "outBack", [_S.call_value(_S.read(_v8, "clamp"), [_S.binary("/", _S.read(_v8, "lit"), 0.2)]), 2.4])))
		_S.define(_v8, "bob", (_S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v8, "t"), 5), _S.read(_v8, "k"))]), 0.5) if _S.truth(_S.binary(">", _S.read(_v8, "lit"), 0.2)) else 0))
		_S.define(_v8, "y", _S.binary("+", _S.binary("-", _S.binary("-", _S.read(_v8, "y0"), 1), _S.read(_v8, "rise")), _S.read(_v8, "bob")))
		_S.define(_v8, "hot", _S.logical("||", _S.binary("<", _S.read(_v8, "lit"), 0.07), func(): return _S.logical("&&", _S.binary(">", _S.read(_v8, "t"), _S.read(_v8, "FLASH")), func(): return _S.binary("<", _S.read(_v8, "t"), _S.binary("+", _S.read(_v8, "FLASH"), 0.07)))))
		_S.define(_v8, "lvl", _S.call_value(_S.read(_v8, "level"), [_S.read(_v8, "t")]))
		_S.call_value(_S.read(_v8, "glyph"), [_S.read(_v8, "p"), _S.read(_v8, "k"), _S.read(_v8, "x"), _S.read(_v8, "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.read(_v8, "hot")) else (_S.read(_v8, "WHITE") if _S.truth(_S.binary(">", _S.read(_v8, "lvl"), 0.8)) else _S.prop(_S.read(_v8, "C"), 6))), _S.binary("-", 1, _S.read(_v8, "gone")), (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.read(_v8, "hot")) else _S.prop(_S.read(_v8, "C"), 4))])
		if _S.truth(_S.binary("<", _S.read(_v8, "lit"), 0.1)):
			_S.call_value(_S.read(_v8, "sparkle"), [_S.read(_v8, "p"), _S.read(_v8, "x"), _S.binary("-", _S.read(_v8, "y"), 2), _S.binary("+", _S.binary("*", 4, _S.binary("-", 1, _S.binary("/", _S.read(_v8, "lit"), 0.1))), 1), _S.prop(_S.read(_v8, "C"), 6), _S.prop(_S.read(_v8, "C"), 5), 0.5])
		_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "x"), _S.binary("-", _S.read(_v8, "y"), 2), 8, _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", _S.binary("+", 0.3, _S.binary("*", 0.3, _S.read(_v8, "lvl"))), _S.binary("-", 1, _S.read(_v8, "gone")))])
		_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "x"), _S.read(_v8, "y0"), 6, _S.prop(_S.read(_v8, "C"), 4), _S.binary("*", 0.2, _S.binary("-", 1, _S.read(_v8, "gone")))])
		_v7 = _S.iteration(_v7)
		_S.write(_v7, "k", 1, "+=", true)
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.22)), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 0.6)))):
		return null
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLASH"))):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "a", _S.call_value(_S.read(_v10, "smooth"), [_S.binary("-", _S.read(_v10, "FLASH"), 0.22), _S.binary("-", _S.read(_v10, "FLASH"), 0.04), _S.read(_v10, "t")]))
		_S.define(_v10, "top", _S.binary("*", _S.unary("-", _S.binary("-", _S.read(_v10, "TOP"), 10)), _S.invoke(_S.read(_v10, "ease"), "outCubic", [_S.read(_v10, "a")])))
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "y", _S.unary("-", 1))
		while _S.truth(_S.binary(">=", _S.read(_v11, "y"), _S.read(_v11, "top"))):
			_S.invoke(_S.read(_v11, "p"), "dot", [0, _S.read(_v11, "y"), (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v11, "y"), _S.binary("+", _S.read(_v11, "top"), 6))) else _S.read(_v11, "WHITE")), _S.binary("*", _S.read(_v11, "a"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.binary("+", 1, _S.binary("/", _S.read(_v11, "y"), _S.read(_v11, "TOP"))))))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "y", 1, "-=", true)
		_S.invoke(_S.read(_v10, "p"), "glow", [0, _S.read(_v10, "top"), 9, _S.prop(_S.read(_v10, "C"), 6), _S.binary("*", 0.5, _S.read(_v10, "a"))])
		_S.invoke(_S.read(_v10, "p"), "glow", [0, _S.unary("-", 6), 24, _S.prop(_S.read(_v10, "C"), 5), _S.binary("*", 0.4, _S.read(_v10, "a"))])
		return null
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "FLASH")))
	_S.define(_e, "brk", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BREAK")), 0.45)]))
	_S.define(_e, "top", _S.binary("*", _S.unary("-", _S.read(_e, "TOP")), _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 0.09)])])))
	_S.define(_e, "w", (_S.binary("*", _S.read(_e, "W"), _S.binary("+", 1, _S.binary("*", 0.38, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "u")), 9)])))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))) else _S.binary("*", _S.read(_e, "W"), _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "brk")]), 0.85)))))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "BREAK"), 0.25), _S.binary("+", _S.read(_e, "BREAK"), 0.55), _S.read(_e, "t")])))
	_S.define(_e, "white", _S.binary("<", _S.read(_e, "u"), 0.067))
	if _S.truth(_S.binary("<=", _S.read(_e, "fade"), 0)):
		return null
	var _v12 = _S.scope(_e)
	_S.define(_v12, "y", 3)
	while _S.truth(_S.binary(">=", _S.read(_v12, "y"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.read(_v12, "top")]))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "h", _S.unary("-", _S.read(_v13, "y")))
		_S.define(_v13, "ww", _S.binary("*", _S.read(_v13, "w"), _S.binary("+", 1, _S.binary("*", 0.5, _S.invoke(_S.read(_v13, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.invoke(_S.read(_v13, "Math"), "max", [0, _S.read(_v13, "h")])), 6)])))))
		_S.define(_v13, "pulse", (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v13, "fract"), [_S.binary("-", _S.binary("*", _S.read(_v13, "h"), 0.022), _S.binary("*", _S.read(_v13, "u"), 2.6))]), 0.07)) else 0))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "x", _S.invoke(_S.read(_v14, "Math"), "floor", [_S.binary("*", _S.unary("-", _S.read(_v14, "ww")), 1.3)]))
		while _S.truth(_S.binary("<=", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "Math"), "ceil", [_S.binary("*", _S.read(_v14, "ww"), 1.3)]))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "q", _S.binary("/", _S.invoke(_S.read(_v15, "Math"), "abs", [_S.binary("+", _S.read(_v15, "x"), 0.5)]), _S.read(_v15, "ww")))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v15, "brk"), 0), func(): return _S.binary("<", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v15, "noise2"), [_S.binary("*", _S.read(_v15, "x"), 0.32), _S.binary("-", _S.binary("*", _S.read(_v15, "h"), 0.11), _S.binary("*", _S.binary("-", _S.read(_v15, "t"), _S.read(_v15, "BREAK")), 6)), _S.read(_v15, "S")]), 0.5), 0.5), _S.binary("-", _S.binary("*", _S.read(_v15, "brk"), 1.25), 0.1)))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "x", 1, "+=", true)
				continue
			_S.define(_v15, "lv", (0 if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.2)) else (1 if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.42)) else (2 if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.66)) else (3 if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.88)) else 4)))))
			for _v16 in _S.array(_S.read(_v15, "strands")):
				var _v17 = _S.scope(_v15)
				_S.define(_v17, "s", _v16)
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v17, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v17, "x"), 0.5), _S.read(_v17, "ww")), _S.prop(_S.read(_v17, "s"), "o")), _S.binary("*", 0.05, _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "s"), "f")), _S.binary("*", _S.prop(_S.read(_v17, "s"), "o"), 9))])))]), _S.prop(_S.read(_v17, "s"), "w"))):
					_S.write(_v17, "lv", _S.invoke(_S.read(_v17, "Math"), "max", [0, _S.binary("-", _S.read(_v17, "lv"), 1)]), "=", false)
			_S.write(_v15, "lv", (0 if _S.truth(_S.read(_v15, "white")) else _S.invoke(_S.read(_v15, "Math"), "max", [0, _S.binary("-", _S.read(_v15, "lv"), _S.read(_v15, "pulse"))])), "=", false)
			_S.define(_v15, "a", _S.binary("*", (1 if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.88)) else _S.binary("/", _S.binary("-", 1.3, _S.read(_v15, "q")), 0.42)), _S.read(_v15, "fade")))
			if _S.truth(_S.binary("<=", _S.read(_v15, "a"), _S.binary("*", _S.call_value(_S.read(_v15, "bayer"), [_S.read(_v15, "x"), _S.read(_v15, "y")]), (0.2 if _S.truth(_S.binary("<", _S.read(_v15, "q"), 0.66)) else 1)))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v15, "p"), "px", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.prop(_S.read(_v15, "COL"), _S.read(_v15, "lv"))])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "x", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary("===", _S.binary("&", _S.read(_v13, "h"), 7), 0), func(): return _S.binary("<", _S.read(_v13, "h"), _S.binary("-", _S.binary("-", _S.read(_v13, "TOP"), _S.binary("*", _S.read(_v13, "ww"), 2.4)), 8)))):
			_S.invoke(_S.read(_v13, "p"), "glow", [0, _S.read(_v13, "y"), _S.binary("+", _S.binary("*", _S.read(_v13, "ww"), 2.4), 6), _S.prop(_S.read(_v13, "C"), 5), _S.binary("*", 0.3, _S.read(_v13, "fade"))])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "y", 1, "-=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 6)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "k", _S.binary("/", _S.binary("-", _S.read(_v19, "t"), _S.binary("+", _S.binary("+", _S.read(_v19, "FLASH"), 0.08), _S.binary("*", _S.read(_v19, "i"), 0.16))), 0.8))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v19, "k"), 0), func(): return _S.binary(">", _S.read(_v19, "k"), 1))):
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
			continue
		_S.define(_v19, "rx", _S.binary("*", _S.binary("*", _S.read(_v19, "w"), 1.4), _S.binary("+", 1, _S.binary("*", _S.read(_v19, "k"), 0.35))))
		_S.define(_v19, "ry", _S.binary("*", _S.read(_v19, "rx"), 0.3))
		_S.define(_v19, "yc", _S.binary("-", _S.unary("-", 3), _S.binary("*", _S.invoke(_S.read(_v19, "ease"), "outQuad", [_S.read(_v19, "k")]), 120)))
		_S.define(_v19, "n", _S.invoke(_S.read(_v19, "Math"), "ceil", [_S.binary("*", _S.read(_v19, "rx"), 7)]))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "j"), _S.read(_v20, "n"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "g", _S.binary("*", _S.binary("/", _S.read(_v21, "j"), _S.read(_v21, "n")), _S.read(_v21, "TAU")))
			_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "g")]), _S.read(_v21, "rx")), _S.binary("+", _S.read(_v21, "yc"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "g")]), _S.read(_v21, "ry"))), (_S.read(_v21, "WHITE") if _S.truth(_S.binary("<", _S.read(_v21, "k"), 0.3)) else _S.prop(_S.read(_v21, "C"), 6)), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v21, "k")), _S.read(_v21, "fade")), (0.6 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "g")]), 0)) else 1))])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "j", 1, "+=", true)
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 4), 34, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.45, _S.read(_e, "fade"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 60), 70, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.25, _S.read(_e, "fade"))])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "far", _S.arg(_args, 1))
	for _v22 in _S.array([[0, _S.binary("*", _S.read(_e, "R"), 0.6), _S.binary("*", _S.read(_e, "R"), 2), 6, 0.5], [0.08, _S.binary("*", _S.read(_e, "R"), 0.4), _S.binary("*", _S.read(_e, "R"), 1.4), 3, 0.4]]):
		var _v23 = _S.scope(_e)
		var _v24 = _v22
		_S.define(_v23, "d", _S.prop(_v24, 0))
		_S.define(_v23, "r0", _S.prop(_v24, 1))
		_S.define(_v23, "r1", _S.prop(_v24, 2))
		_S.define(_v23, "th", _S.prop(_v24, 3))
		_S.define(_v23, "dur", _S.prop(_v24, 4))
		var _v25 = _S.scope(_v23)
		_S.define(_v25, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v25, "t"), _S.read(_v25, "FLASH")), _S.read(_v25, "d")), _S.read(_v25, "dur")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v25, "k"), 0), func(): return _S.binary(">=", _S.read(_v25, "k"), 1))):
			continue
		_S.call_value(_S.read(_v25, "band"), [_S.read(_v25, "p"), 0, 0, _S.binary("+", _S.read(_v25, "r0"), _S.binary("*", _S.binary("-", _S.read(_v25, "r1"), _S.read(_v25, "r0")), _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")]))), _S.read(_v25, "SY"), _S.invoke(_S.read(_v25, "Math"), "max", [1, _S.binary("*", _S.read(_v25, "th"), _S.binary("-", 1, _S.read(_v25, "k")))]), _S.binary("-", 1.15, _S.read(_v25, "k")), [_S.prop(_S.read(_v25, "C"), 3), _S.prop(_S.read(_v25, "C"), 5), _S.prop(_S.read(_v25, "C"), 6), _S.read(_v25, "WHITE")], _S.function_value(_v25, "_f18"), _S.binary("<", _S.read(_v25, "k"), 0.2)])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "far"))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.merge([{"o": _S.invoke(_S.read(_e, "Rg"), "range", [_S.unary("-", 0.85), 0.85])}, {"w": _S.invoke(_S.read(_e, "Rg"), "range", [0.04, 0.1])}, {"f": _S.invoke(_S.read(_e, "Rg"), "range", [1, 3])}])

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a0", _S.arg(_args, 0))
	return _S.invoke(_S.invoke([0, 1, 2], "map", [_S.function_value(_e, "_f22")]), "map", [_S.function_value(_e, "_f23")])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "a0"), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "TAU")), 3))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "RI")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "RI"))]

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lvl", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.05)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.16)) else (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 1)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 0.8)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 0.45)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "lvl"), 0.28)) else _S.prop(_S.read(_e, "C"), 3)))))))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lvl", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "lvl"), 0.3)])

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "PEN"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "STAR"), 1))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.5]))):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "x", null)
		_S.define(_v29, "y", null)
		if _S.truth(_S.binary("<", _S.read(_v29, "t"), _S.prop(_S.read(_v29, "PEN"), 1))):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "g", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v30, "Math"), "PI"), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v30, "Rg"), "sign", []), _S.binary("/", _S.binary("-", _S.read(_v30, "t"), _S.prop(_S.read(_v30, "PEN"), 0)), _S.binary("-", _S.prop(_S.read(_v30, "PEN"), 1), _S.prop(_S.read(_v30, "PEN"), 0)))), _S.prop(_S.read(_v30, "Math"), "PI"))))
			_S.last([_S.write(_v30, "x", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "g")]), _S.read(_v30, "R")), "=", false), _S.write(_v30, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "g")]), _S.read(_v30, "R")), _S.read(_v30, "SY")), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v29, "t"), _S.prop(_S.read(_v29, "INNER"), 1))):
				var _v31 = _S.scope(_v29)
				_S.define(_v31, "g", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v31, "Math"), "PI")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v31, "t"), _S.prop(_S.read(_v31, "INNER"), 0)), _S.binary("-", _S.prop(_S.read(_v31, "INNER"), 1), _S.prop(_S.read(_v31, "INNER"), 0))), _S.read(_v31, "TAU"))))
				_S.last([_S.write(_v31, "x", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "g")]), _S.read(_v31, "RI")), "=", false), _S.write(_v31, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "g")]), _S.read(_v31, "RI")), _S.read(_v31, "SY")), "=", false)])
			else:
				var _v32 = _S.scope(_v29)
				_S.define(_v32, "e", _S.logical("??", _S.invoke(_S.read(_v32, "Rg"), "pick", [_S.invoke(_S.read(_v32, "edges"), "filter", [_S.function_value(_v32, "_f27")])]), func(): return _S.prop(_S.read(_v32, "edges"), 0)))
				_S.define(_v32, "s", _S.call_value(_S.read(_v32, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v32, "t"), _S.prop(_S.read(_v32, "e"), "t0")), _S.prop(_S.read(_v32, "e"), "dur"))]))
				_S.last([_S.write(_v32, "x", _S.binary("+", _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v32, "e"), "p1"), 0), _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 0)), _S.read(_v32, "s"))), "=", false), _S.write(_v32, "y", _S.binary("*", _S.binary("+", _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v32, "e"), "p1"), 1), _S.prop(_S.prop(_S.read(_v32, "e"), "p0"), 1)), _S.read(_v32, "s"))), _S.read(_v32, "SY")), "=", false)])
		_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "EMBER"), _S.read(_v29, "x"), _S.binary("-", _S.read(_v29, "y"), 1), _S.invoke(_S.read(_v29, "Rg"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v29, "Rg"), "range", [_S.unary("-", 30), _S.unary("-", 8)]), _S.invoke(_S.read(_v29, "Rg"), "range", [0.25, 0.55]), _S.prop(_S.read(_v29, "C"), 6), 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "RUNES"), 1), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "FLASH"), 0.05))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.7]))):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "g", _S.invoke(_S.read(_v33, "Rg"), "range", [0, _S.read(_v33, "TAU")]))
		_S.define(_v33, "D", _S.invoke(_S.read(_v33, "Rg"), "range", [_S.binary("*", _S.read(_v33, "R"), 0.7), _S.binary("*", _S.read(_v33, "R"), 1.1)]))
		_S.define(_v33, "T", _S.invoke(_S.read(_v33, "Rg"), "range", [0.16, 0.24]))
		_S.define(_v33, "v", _S.binary("/", _S.binary("*", _S.read(_v33, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v33, "Math"), "exp", [_S.binary("*", 3, _S.read(_v33, "T"))]), 1)))
		_S.define(_v33, "x", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "g")]), _S.read(_v33, "D")))
		_S.define(_v33, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "g")]), _S.read(_v33, "D")), _S.read(_v33, "SY")), 1))
		_S.define(_v33, "l", _S.logical("||", _S.invoke(_S.read(_v33, "Math"), "hypot", [_S.read(_v33, "x"), _S.binary("+", _S.read(_v33, "y"), 2)]), func(): return 1))
		_S.invoke(_S.read(_v33, "ps"), "spawn", [_S.prop(_S.read(_v33, "P"), "STREAK"), _S.read(_v33, "x"), _S.read(_v33, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v33, "x")), _S.read(_v33, "l")), _S.read(_v33, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.unary("-", 2), _S.read(_v33, "y")), _S.read(_v33, "l")), _S.read(_v33, "v")), _S.read(_v33, "T"), (_S.prop(_S.read(_v33, "C"), 6) if _S.truth(_S.invoke(_S.read(_v33, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v33, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "flashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))):
		var _v34 = _S.scope(_e)
		_S.write(_v34, "flashed", true, "=", false)
		_S.invoke(_S.read(_v34, "lights"), "add", [0, _S.unary("-", 56), 104, _S.prop(_S.read(_v34, "C"), 5), 0.9, 0.6])
		_S.invoke(_S.read(_v34, "lights"), "add", [0, _S.unary("-", 5), 36, _S.read(_v34, "WHITE"), 0.8, 0.14])
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "i"), 36)):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "s", _S.invoke(_S.read(_v36, "Rg"), "sign", []))
			_S.define(_v36, "sp", _S.invoke(_S.read(_v36, "Rg"), "range", [80, 175]))
			_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "SPARK"), _S.binary("*", _S.read(_v36, "s"), _S.invoke(_S.read(_v36, "Rg"), "range", [0, _S.binary("*", _S.read(_v36, "R"), 0.5)])), _S.unary("-", 1), _S.binary("*", _S.read(_v36, "s"), _S.read(_v36, "sp")), _S.unary("-", _S.invoke(_S.read(_v36, "Rg"), "range", [30, 180])), _S.invoke(_S.read(_v36, "Rg"), "range", [0.25, 0.7])])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "+=", true)
		var _v37 = _S.scope(_v34)
		_S.define(_v37, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "i"), 26)):
			_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "STAR"), _S.invoke(_S.read(_v37, "Rg"), "range", [_S.unary("-", _S.read(_v37, "R")), _S.read(_v37, "R")]), _S.unary("-", _S.invoke(_S.read(_v37, "Rg"), "range", [1, 6])), _S.invoke(_S.read(_v37, "Rg"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v37, "Rg"), "range", [40, 130])), _S.invoke(_S.read(_v37, "Rg"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v37, "Rg"), "pick", [[_S.read(_v37, "WHITE"), _S.prop(_S.read(_v37, "C"), 6), _S.prop(_S.read(_v37, "C"), 5)]]), _S.invoke(_S.read(_v37, "Rg"), "range", [0.8, 2.3])])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "i", 1, "+=", true)
		var _v38 = _S.scope(_v34)
		_S.define(_v38, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v38, "i"), 34)):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "s", _S.invoke(_S.read(_v39, "Rg"), "sign", []))
			_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "STAR"), _S.binary("*", _S.read(_v39, "s"), _S.invoke(_S.read(_v39, "Rg"), "range", [0, 14])), _S.unary("-", _S.invoke(_S.read(_v39, "Rg"), "range", [1, 4])), _S.binary("*", _S.read(_v39, "s"), _S.invoke(_S.read(_v39, "Rg"), "range", [50, 140])), _S.unary("-", _S.invoke(_S.read(_v39, "Rg"), "range", [10, 90])), _S.invoke(_S.read(_v39, "Rg"), "range", [0.4, 0.95]), _S.invoke(_S.read(_v39, "Rg"), "pick", [[_S.read(_v39, "WHITE"), _S.prop(_S.read(_v39, "C"), 6), _S.prop(_S.read(_v39, "C"), 6), _S.prop(_S.read(_v39, "C"), 5)]]), _S.invoke(_S.read(_v39, "Rg"), "range", [0.7, 2.2])])
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "RUNES"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 0.2))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.12]))):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "g", _S.invoke(_S.read(_v40, "Rg"), "range", [0, _S.read(_v40, "TAU")]))
		_S.define(_v40, "r", _S.invoke(_S.read(_v40, "Rg"), "pick", [[_S.read(_v40, "R"), _S.read(_v40, "R2"), _S.read(_v40, "RI")]]))
		_S.invoke(_S.read(_v40, "ps"), "spawn", [_S.prop(_S.read(_v40, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "g")]), _S.read(_v40, "r")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "g")]), _S.read(_v40, "r")), _S.read(_v40, "SY")), 0.5), 0, _S.unary("-", _S.invoke(_S.read(_v40, "Rg"), "range", [2, 8])), _S.invoke(_S.read(_v40, "Rg"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v40, "Rg"), "pick", [[_S.read(_v40, "WHITE"), _S.prop(_S.read(_v40, "C"), 6)]]), _S.invoke(_S.read(_v40, "Rg"), "range", [0.8, 2])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "FLASH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v41 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v41, "Rg"), "chance", [0.5])):
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v41, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v41, "W")), 1.5), _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [0, 120])), _S.invoke(_S.read(_v41, "Rg"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [30, 85])), _S.invoke(_S.read(_v41, "Rg"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v41, "Rg"), "pick", [[_S.read(_v41, "WHITE"), _S.prop(_S.read(_v41, "C"), 6), _S.prop(_S.read(_v41, "C"), 5)]]), _S.invoke(_S.read(_v41, "Rg"), "range", [0.7, 2])])
		if _S.truth(_S.invoke(_S.read(_v41, "Rg"), "chance", [0.35])):
			_S.invoke(_S.read(_v41, "ps"), "spawn", [_S.prop(_S.read(_v41, "P"), "MOTE"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v41, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v41, "W")), 0.8), _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [0, 50])), 0, _S.unary("-", _S.invoke(_S.read(_v41, "Rg"), "range", [160, 300])), _S.invoke(_S.read(_v41, "Rg"), "range", [0.2, 0.35]), (_S.read(_v41, "WHITE") if _S.truth(_S.invoke(_S.read(_v41, "Rg"), "chance", [0.5])) else _S.prop(_S.read(_v41, "C"), 6)), 0.8])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "broke")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")))):
		var _v42 = _S.scope(_e)
		_S.write(_v42, "broke", true, "=", false)
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v43, "i"), 46)):
			_S.invoke(_S.read(_v43, "ps"), "spawn", [_S.prop(_S.read(_v43, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v43, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v43, "W")), 0.9), _S.unary("-", _S.invoke(_S.read(_v43, "Rg"), "range", [2, _S.binary("*", _S.read(_v43, "TOP"), 0.8)])), _S.invoke(_S.read(_v43, "Rg"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v43, "Rg"), "range", [8, 40])), _S.invoke(_S.read(_v43, "Rg"), "range", [0.5, 1.15]), _S.invoke(_S.read(_v43, "Rg"), "pick", [[_S.read(_v43, "WHITE"), _S.read(_v43, "WHITE"), _S.prop(_S.read(_v43, "C"), 6), _S.prop(_S.read(_v43, "C"), 5)]]), _S.invoke(_S.read(_v43, "Rg"), "range", [0.6, 2.4])])
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 0.4))), func(): return _S.invoke(_S.read(_e, "Rg"), "chance", [0.8]))):
		var _v44 = _S.scope(_e)
		_S.invoke(_S.read(_v44, "ps"), "spawn", [_S.prop(_S.read(_v44, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v44, "W")), 0.7), _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [2, _S.binary("*", _S.read(_v44, "TOP"), 0.78)])), _S.invoke(_S.read(_v44, "Rg"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [10, 50])), _S.invoke(_S.read(_v44, "Rg"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v44, "Rg"), "pick", [[_S.read(_v44, "WHITE"), _S.prop(_S.read(_v44, "C"), 6), _S.prop(_S.read(_v44, "C"), 5)]]), _S.invoke(_S.read(_v44, "Rg"), "range", [0.6, 1.8])])
		if _S.truth(_S.invoke(_S.read(_v44, "Rg"), "chance", [0.4])):
			_S.invoke(_S.read(_v44, "ps"), "spawn", [_S.prop(_S.read(_v44, "P"), "MOTE"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "Rg"), "range", [_S.unary("-", 1), 1]), _S.read(_v44, "W")), 0.5), _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [2, _S.binary("*", _S.read(_v44, "TOP"), 0.7)])), 0, _S.unary("-", _S.invoke(_S.read(_v44, "Rg"), "range", [60, 140])), _S.invoke(_S.read(_v44, "Rg"), "range", [0.2, 0.4]), _S.prop(_S.read(_v44, "C"), 6), 0.7])
	var _v45 = _S.scope(_e)
	_S.define(_v45, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v45, "k"), _S.read(_v45, "NRUNE"))):
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v45, "out"), _S.read(_v45, "k"))), func(): return _S.binary(">=", _S.read(_v45, "t"), _S.call_value(_S.read(_v45, "runeOut"), [_S.read(_v45, "k")])))):
			var _v46 = _S.scope(_v45)
			_S.set_prop(_S.read(_v46, "out"), _S.read(_v46, "k"), true, "=", false)
			_S.define(_v46, "g", _S.call_value(_S.read(_v46, "runeAngle"), [_S.read(_v46, "k")]))
			_S.define(_v46, "x", _S.binary("*", _S.invoke(_S.read(_v46, "Math"), "cos", [_S.read(_v46, "g")]), _S.read(_v46, "RR")))
			_S.define(_v46, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v46, "Math"), "sin", [_S.read(_v46, "g")]), _S.read(_v46, "RR")), _S.read(_v46, "SY")), 5))
			var _v47 = _S.scope(_v46)
			_S.define(_v47, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v47, "i"), 4)):
				_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STAR"), _S.binary("+", _S.read(_v47, "x"), _S.invoke(_S.read(_v47, "Rg"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v47, "y"), _S.invoke(_S.read(_v47, "Rg"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v47, "Rg"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v47, "Rg"), "range", [10, 40])), _S.invoke(_S.read(_v47, "Rg"), "range", [0.3, 0.55]), _S.invoke(_S.read(_v47, "Rg"), "pick", [[_S.read(_v47, "WHITE"), _S.prop(_S.read(_v47, "C"), 6)]]), _S.invoke(_S.read(_v47, "Rg"), "range", [0.6, 1.6])])
				_v47 = _S.iteration(_v47)
				_S.write(_v47, "i", 1, "+=", true)
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "k", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "e", _S.arg(_args, 0))
	return _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "e"), "t0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.prop(_S.read(_e, "e"), "t0"), _S.prop(_S.read(_e, "e"), "dur"))))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "lvl", _S.call_value(_S.read(_e, "level"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "k", _S.binary("*", _S.read(_v48, "lvl"), _S.call_value(_S.read(_v48, "smooth"), [_S.prop(_S.read(_v48, "PEN"), 0), _S.binary("+", _S.prop(_S.read(_v48, "PEN"), 1), 0.2), _S.read(_v48, "t")])))
		_S.invoke(_S.read(_v48, "p"), "glow", [0, 0, _S.binary("*", _S.read(_v48, "R"), 1.3), _S.prop(_S.read(_v48, "C"), 4), _S.binary("*", 0.28, _S.read(_v48, "k"))])
		for _v49 in _S.array([_S.unary("-", 1), 1]):
			var _v50 = _S.scope(_v48)
			_S.define(_v50, "s", _v49)
			_S.invoke(_S.read(_v50, "p"), "glow", [_S.binary("*", _S.binary("*", _S.read(_v50, "s"), _S.read(_v50, "R")), 0.6), 1, _S.binary("*", _S.read(_v50, "R"), 0.7), _S.prop(_S.read(_v50, "C"), 5), _S.binary("*", 0.12, _S.read(_v50, "k"))])
	_S.call_value(_S.read(_e, "shock"), [_S.read(_e, "p"), true])
	_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "p"), true])
	_S.call_value(_S.read(_e, "runes"), [_S.read(_e, "p"), true])
	_S.call_value(_S.read(_e, "column"), [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "shock"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "circle"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "runes"), [_S.read(_e, "p"), false])
	_S.define(_e, "pen", _S.function_value(_e, "_f30"))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "PEN"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "PEN"), 1)))):
		for _v51 in _S.array([_S.unary("-", 1), 1]):
			var _v52 = _S.scope(_e)
			_S.define(_v52, "s", _v51)
			var _v53 = _S.scope(_v52)
			_S.define(_v53, "g", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v53, "Math"), "PI"), 2), _S.binary("*", _S.binary("*", _S.read(_v53, "s"), _S.binary("/", _S.binary("-", _S.read(_v53, "t"), _S.prop(_S.read(_v53, "PEN"), 0)), _S.binary("-", _S.prop(_S.read(_v53, "PEN"), 1), _S.prop(_S.read(_v53, "PEN"), 0)))), _S.prop(_S.read(_v53, "Math"), "PI"))))
			_S.call_value(_S.read(_v53, "pen"), [_S.binary("*", _S.invoke(_S.read(_v53, "Math"), "cos", [_S.read(_v53, "g")]), _S.read(_v53, "R")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v53, "Math"), "sin", [_S.read(_v53, "g")]), _S.read(_v53, "R")), _S.read(_v53, "SY"))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "INNER"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "INNER"), 1)))):
		var _v54 = _S.scope(_e)
		_S.define(_v54, "g", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v54, "Math"), "PI")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v54, "t"), _S.prop(_S.read(_v54, "INNER"), 0)), _S.binary("-", _S.prop(_S.read(_v54, "INNER"), 1), _S.prop(_S.read(_v54, "INNER"), 0))), _S.read(_v54, "TAU"))))
		_S.call_value(_S.read(_v54, "pen"), [_S.binary("*", _S.invoke(_S.read(_v54, "Math"), "cos", [_S.read(_v54, "g")]), _S.read(_v54, "RI")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "sin", [_S.read(_v54, "g")]), _S.read(_v54, "RI")), _S.read(_v54, "SY"))])
	for _v55 in _S.array(_S.read(_e, "edges")):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "e", _v55)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v56, "t"), _S.prop(_S.read(_v56, "e"), "t0")), func(): return _S.binary("<", _S.read(_v56, "t"), _S.binary("+", _S.prop(_S.read(_v56, "e"), "t0"), _S.prop(_S.read(_v56, "e"), "dur"))))):
			var _v57 = _S.scope(_v56)
			_S.define(_v57, "s", _S.binary("/", _S.binary("-", _S.read(_v57, "t"), _S.prop(_S.read(_v57, "e"), "t0")), _S.prop(_S.read(_v57, "e"), "dur")))
			_S.call_value(_S.read(_v57, "pen"), [_S.binary("+", _S.prop(_S.prop(_S.read(_v57, "e"), "p0"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v57, "e"), "p1"), 0), _S.prop(_S.prop(_S.read(_v57, "e"), "p0"), 0)), _S.read(_v57, "s"))), _S.binary("*", _S.binary("+", _S.prop(_S.prop(_S.read(_v57, "e"), "p0"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v57, "e"), "p1"), 1), _S.prop(_S.prop(_S.read(_v57, "e"), "p0"), 1)), _S.read(_v57, "s"))), _S.read(_v57, "SY"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FLASH"), 0.24)))):
		var _v58 = _S.scope(_e)
		_S.define(_v58, "a", _S.binary("/", _S.binary("-", _S.read(_v58, "t"), _S.read(_v58, "FLASH")), 0.24))
		_S.call_value(_S.read(_v58, "flare"), [_S.read(_v58, "p"), 0, _S.unary("-", 8), _S.binary("*", 34, _S.invoke(_S.read(_v58, "Math"), "pow", [_S.binary("-", 1, _S.read(_v58, "a")), 1.5])), _S.binary("-", 1, _S.read(_v58, "a")), _S.read(_v58, "C")])
		_S.invoke(_S.read(_v58, "p"), "glow", [0, _S.unary("-", 26), 56, _S.read(_v58, "WHITE"), _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v58, "a")))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), 2, _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.5])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 7, _S.prop(_S.read(_e, "C"), 6), 0.45])
	return null

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "a"), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.read(_e, "TAU"))

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "atan2", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.read(_e, "g"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2))]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "g"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2))])])])

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "w", _S.arg(_args, 1))
	return _S.binary("+", _S.prop(_S.read(_e, "w"), 0), _S.binary("*", _S.binary("/", _S.call_value(_S.read(_e, "fromFront"), [_S.read(_e, "g")]), _S.prop(_S.read(_e, "Math"), "PI")), _S.binary("-", _S.prop(_S.read(_e, "w"), 1), _S.prop(_S.read(_e, "w"), 0))))

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("+", _S.prop(_S.read(_e, "INNER"), 0), _S.binary("*", _S.binary("/", _S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.read(_e, "g"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2))]), _S.read(_e, "TAU")), _S.binary("-", _S.prop(_S.read(_e, "INNER"), 1), _S.prop(_S.read(_e, "INNER"), 0))))

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("/", _S.binary("*", _S.binary("+", _S.read(_e, "k"), 0.5), _S.read(_e, "TAU")), _S.read(_e, "NRUNE")))

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.binary("+", _S.prop(_S.read(_e, "RUNES"), 0), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.binary("-", _S.prop(_S.read(_e, "RUNES"), 1), _S.prop(_S.read(_e, "RUNES"), 0))), _S.binary("-", _S.read(_e, "NRUNE"), 1)))

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.read(_e, "BREAK"), 0.2), _S.binary("*", _S.read(_e, "k"), 0.08))
