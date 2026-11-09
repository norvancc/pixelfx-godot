@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/grasping-hands.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "Drops", _S.import_value("fx/shadow/_lib.js", "Drops"))
	_S.define(_e, "floorPool", _S.import_value("fx/shadow/_lib.js", "floorPool"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "arm", _S.function_value(_e, "_f0"))
	_S.define(_e, "gripOf", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawArm", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawHand", _S.function_value(_e, "_f4"))
	_S.define(_e, "create", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Grasping hands"}, {"desc": "Shadow arms burst up out of a dark pool with a splash, clench their hands into claws, strain, and are dragged back under, fingers clawing at the air."}, {"tags": ["shadow", "hands", "arms", "grab", "ground", "dark", "magic", "one-shot"]}, {"size": [200, 116]}, {"origin": [100, 100]}, {"duration": 3.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RX", 42)
	_S.define(_e, "OPEN", 0.32)
	_S.define(_e, "SHUT", 2.35)
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "t0")), 0.22)]))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "td")), 0.34)]))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "e"), 0), func(): return _S.binary(">=", _S.read(_e, "d"), 1))):
		return null
	_S.define(_e, "rise", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.read(_e, "e"), 1.6]), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.read(_e, "d")]))))
	_S.define(_e, "hidden", _S.binary("*", _S.binary("-", 1, _S.read(_e, "rise")), _S.prop(_S.read(_e, "A"), "L")))
	_S.define(_e, "grip", _S.call_value(_S.read(_e, "gripOf"), [_S.read(_e, "A"), _S.read(_e, "t")]))
	_S.define(_e, "strain", (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 47), _S.prop(_S.read(_e, "A"), "ph"))]), 0.03) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.prop(_S.read(_e, "A"), "t0"), 0.5)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "td")))) else 0))
	_S.define(_e, "elbow", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "A"), "bend"), _S.binary("+", 0.3, _S.binary("*", 0.7, _S.read(_e, "grip")))), _S.binary("-", 1, _S.read(_e, "d"))), _S.read(_e, "strain")))
	_S.define(_e, "lean", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "A"), "lean"), _S.binary("*", 0.06, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 2.2), _S.prop(_S.read(_e, "A"), "ph"))]))), _S.binary("*", _S.binary("*", _S.read(_e, "d"), _S.prop(_S.read(_e, "A"), "lean")), 0.6)))
	_S.define(_e, "th", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.read(_e, "lean")))
	_S.define(_e, "x", _S.binary("-", _S.prop(_S.read(_e, "A"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "hidden"))))
	_S.define(_e, "y", _S.binary("-", _S.prop(_S.read(_e, "A"), "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "hidden"))))
	_S.define(_e, "pts", [])
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("/", _S.prop(_S.read(_e, "A"), "L"), 0.5)]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "s", _S.binary("*", _S.read(_v1, "i"), 0.5))
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "s"), _S.prop(_S.read(_v1, "A"), "L")))
		_S.invoke(_S.read(_v1, "pts"), "push", [_S.merge([{"x": _S.read(_v1, "x")}, {"y": _S.read(_v1, "y")}, {"th": _S.read(_v1, "th")}, {"w": _S.binary("+", _S.binary("*", _S.prop(_S.read(_v1, "A"), "W"), _S.binary("-", 1, _S.binary("*", 0.5, _S.read(_v1, "u")))), 0.4)}, {"u": _S.read(_v1, "u")}])])
		_S.write(_v1, "th", _S.binary("*", 0.5, _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v1, "elbow"), _S.invoke(_S.read(_v1, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v1, "u"), 0.52), 0.07), 2))])), _S.binary("*", _S.binary("*", 0.07, _S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.prop(_S.read(_v1, "Math"), "PI")])), _S.prop(_S.read(_v1, "A"), "L"))), _S.binary("/", _S.prop(_S.read(_v1, "A"), "curve"), _S.prop(_S.read(_v1, "A"), "L")))), "+=", false)
		_S.write(_v1, "x", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "th")]), 0.5), "+=", false)
		_S.write(_v1, "y", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "th")]), 0.5), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "shut", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "t0")), 0.3), 0.12)]), 2.2]))
	_S.define(_e, "splay", _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.read(_e, "A"), "td"), _S.binary("+", _S.prop(_S.read(_e, "A"), "td"), 0.12), _S.read(_e, "t")]))
	return _S.binary("-", _S.binary("*", _S.read(_e, "shut"), _S.binary("-", 1, _S.read(_e, "splay"))), _S.binary("*", 0.35, _S.read(_e, "splay")))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "pts", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "surf", _S.prop(_S.read(_e, "A"), "y"))
	for _v2 in _S.array(_S.read(_e, "pts")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "q", _v2)
		var _v4 = _S.scope(_v3)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v4, "q"), "y"), _S.read(_v4, "surf"))):
			continue
		_S.define(_v4, "nx", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.prop(_S.read(_v4, "q"), "th")])))
		_S.define(_v4, "ny", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.prop(_S.read(_v4, "q"), "th")]))
		_S.define(_v4, "ks", (1 if _S.truth(_S.binary(">=", _S.binary("+", _S.binary("*", _S.read(_v4, "nx"), _S.read(_v4, "LX")), _S.binary("*", _S.read(_v4, "ny"), _S.read(_v4, "LY"))), 0)) else _S.unary("-", 1)))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "v", _S.unary("-", _S.prop(_S.read(_v5, "q"), "w")))
		while _S.truth(_S.binary("<=", _S.read(_v5, "v"), _S.prop(_S.read(_v5, "q"), "w"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "x", _S.binary("+", _S.prop(_S.read(_v6, "q"), "x"), _S.binary("*", _S.read(_v6, "nx"), _S.read(_v6, "v"))))
			_S.define(_v6, "y", _S.binary("+", _S.prop(_S.read(_v6, "q"), "y"), _S.binary("*", _S.read(_v6, "ny"), _S.read(_v6, "v"))))
			_S.define(_v6, "u", _S.binary("*", _S.binary("/", _S.read(_v6, "v"), _S.prop(_S.read(_v6, "q"), "w")), _S.read(_v6, "ks")))
			if _S.truth(_S.binary("<=", _S.read(_v6, "y"), _S.read(_v6, "surf"))):
				_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.prop(_S.read(_v6, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v6, "u"), 0.55)) else (_S.prop(_S.read(_v6, "C"), 1) if _S.truth(_S.binary(">", _S.read(_v6, "u"), _S.unary("-", 0.45))) else _S.prop(_S.read(_v6, "C"), 0)))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "v", 0.5, "+=", false)
	for _v7 in _S.array(_S.read(_e, "pts")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "q", _v7)
		var _v9 = _S.scope(_v8)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v9, "q"), "y"), _S.read(_v9, "surf"))):
			continue
		_S.define(_v9, "nx", _S.unary("-", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.prop(_S.read(_v9, "q"), "th")])))
		_S.define(_v9, "ny", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.prop(_S.read(_v9, "q"), "th")]))
		_S.define(_v9, "f", _S.binary("+", _S.binary("*", _S.read(_v9, "nx"), _S.read(_v9, "LX")), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "LY"))))
		_S.define(_v9, "ks", (1 if _S.truth(_S.binary(">=", _S.read(_v9, "f"), 0)) else _S.unary("-", 1)))
		_S.define(_v9, "l", _S.binary("*", _S.read(_v9, "ks"), _S.prop(_S.read(_v9, "q"), "w")))
		if _S.truth(_S.binary("<=", _S.binary("-", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "l"))), _S.read(_v9, "surf"))):
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v9, "q"), "x"), _S.binary("*", _S.read(_v9, "nx"), _S.read(_v9, "l"))), _S.binary("-", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "l"))), _S.prop(_S.read(_v9, "C"), 3)])
		if _S.truth(_S.binary("<=", _S.binary("+", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "l"))), _S.read(_v9, "surf"))):
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v9, "q"), "x"), _S.binary("*", _S.read(_v9, "nx"), _S.read(_v9, "l"))), _S.binary("+", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "l"))), (_S.prop(_S.read(_v9, "C"), 7) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.read(_v9, "f")]), 0.8)) else _S.prop(_S.read(_v9, "C"), 6))])
	_S.define(_e, "base", _S.invoke(_S.read(_e, "pts"), "find", [_S.function_value(_e, "_f3")]))
	if _S.truth(_S.read(_e, "base")):
		_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "base"), "x"), _S.prop(_S.read(_e, "base"), "w")), 1.5), _S.read(_e, "surf"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "base"), "x"), _S.prop(_S.read(_e, "base"), "w")), 1.5), _S.read(_e, "surf"), _S.prop(_S.read(_e, "C"), 5)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary("<=", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "surf"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "pts", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "tip", _S.prop(_S.read(_e, "pts"), _S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1)))
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "tip"), "y"), _S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 2))):
		return null
	_S.define(_e, "th", _S.prop(_S.read(_e, "tip"), "th"))
	_S.define(_e, "dx", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))
	_S.define(_e, "dy", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	_S.define(_e, "nx", _S.unary("-", _S.read(_e, "dy")))
	_S.define(_e, "ny", _S.read(_e, "dx"))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "gripOf"), [_S.read(_e, "A"), _S.read(_e, "t")]))
	_S.define(_e, "side", _S.prop(_S.read(_e, "A"), "curl"))
	_S.define(_e, "cx", _S.binary("+", _S.prop(_S.read(_e, "tip"), "x"), _S.binary("*", _S.read(_e, "dx"), 2.6)))
	_S.define(_e, "cy", _S.binary("+", _S.prop(_S.read(_e, "tip"), "y"), _S.binary("*", _S.read(_e, "dy"), 2.6)))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "cx"), 5), _S.binary("-", _S.read(_e, "cy"), 5), _S.binary("+", _S.read(_e, "cx"), 5), _S.binary("+", _S.read(_e, "cy"), 5), _S.function_value(_e, "_f5")])
	_S.define(_e, "bone", _S.function_value(_e, "_f6"))
	_S.define(_e, "spread", _S.binary("-", 1, _S.binary("*", 0.65, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "g")]))))
	_S.define(_e, "curl", _S.binary("*", _S.read(_e, "g"), 1.2))
	_S.invoke([_S.unary("-", 2.2), _S.unary("-", 0.75), 0.75, 2.2], "forEach", [_S.function_value(_e, "_f7")])
	var _v11 = _S.call_value(_S.read(_e, "bone"), [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "side")), 2.4)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "side")), 2.4)), _S.binary("-", _S.read(_e, "th"), _S.binary("*", _S.read(_e, "side"), _S.binary("-", 1, _S.binary("*", 0.6, _S.read(_e, "g"))))), 2.4, false])
	_S.define(_e, "jx", _S.prop(_v11, 0))
	_S.define(_e, "jy", _S.prop(_v11, 1))
	_S.call_value(_S.read(_e, "bone"), [_S.read(_e, "jx"), _S.read(_e, "jy"), _S.binary("-", _S.read(_e, "th"), _S.binary("*", _S.read(_e, "side"), _S.binary("-", 0.6, _S.binary("*", 1.4, _S.read(_e, "g"))))), 2, true])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), 8, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.18, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "g")])))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "dx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "dy"))))
	_S.define(_e, "b", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "cx")), _S.read(_e, "nx")), _S.binary("*", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.read(_e, "ny"))))
	_S.define(_e, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "a"), 3), 2), _S.binary("**", _S.binary("/", _S.read(_e, "b"), 2.7), 2)))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1.25)):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.binary("*", _S.read(_e, "b"), _S.read(_e, "side")), 0)) else _S.prop(_S.read(_e, "C"), 3))
	return (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.binary("*", _S.read(_e, "b"), _S.read(_e, "side")), _S.unary("-", 1))) else _S.prop(_S.read(_e, "C"), 1))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "ang", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "last", _S.arg(_args, 4))
	_S.define(_e, "x1", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "len"))))
	_S.define(_e, "y1", _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "len"))))
	_S.define(_e, "ox", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")])), _S.read(_e, "side")), _S.unary("-", 1))]))
	_S.define(_e, "oy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "side")), _S.unary("-", 1))]))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.read(_e, "x0"), _S.read(_e, "ox")), _S.binary("+", _S.read(_e, "y0"), _S.read(_e, "oy")), _S.binary("+", _S.read(_e, "x1"), _S.read(_e, "ox")), _S.binary("+", _S.read(_e, "y1"), _S.read(_e, "oy")), _S.prop(_S.read(_e, "C"), 5)])
	if _S.truth(_S.read(_e, "last")):
		_S.last([_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x1"), _S.read(_e, "y1"), _S.read(_e, "WHITE")]), _S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "x1"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")])), _S.binary("+", _S.read(_e, "y1"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")])), _S.prop(_S.read(_e, "C"), 7)])])
	return [_S.read(_e, "x1"), _S.read(_e, "y1")]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "bx", _S.binary("+", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "dx"), 2.6)), _S.binary("*", _S.binary("*", _S.read(_e, "nx"), _S.read(_e, "o")), 0.9)))
	_S.define(_e, "by", _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "dy"), 2.6)), _S.binary("*", _S.binary("*", _S.read(_e, "ny"), _S.read(_e, "o")), 0.9)))
	_S.define(_e, "len", (2.6 if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "i"), 0), func(): return _S.binary("===", _S.read(_e, "i"), 3))) else 3.2))
	_S.define(_e, "a0", _S.binary("+", _S.read(_e, "th"), _S.binary("*", _S.binary("*", _S.read(_e, "o"), 0.2), _S.read(_e, "spread"))))
	var _v10 = _S.call_value(_S.read(_e, "bone"), [_S.read(_e, "bx"), _S.read(_e, "by"), _S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("*", _S.read(_e, "curl"), _S.read(_e, "side")), 0.6)), _S.read(_e, "len"), false])
	_S.define(_e, "jx", _S.prop(_v10, 0))
	_S.define(_e, "jy", _S.prop(_v10, 1))
	_S.call_value(_S.read(_e, "bone"), [_S.read(_e, "jx"), _S.read(_e, "jy"), _S.binary("+", _S.read(_e, "a0"), _S.binary("*", _S.binary("*", _S.read(_e, "curl"), _S.read(_e, "side")), 1.5)), _S.binary("*", _S.read(_e, "len"), 0.85), true])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "splash", _S.function_value(_e, "_f9"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f10"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.55]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), 0.5])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "ripples", [])
	_S.define(_e, "splats", [])
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", 0)
	_S.define(_e, "rx", _S.function_value(_e, "_f11"))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"onLand": _S.function_value(_e, "_f12")}])]))
	_S.define(_e, "LAY", [[_S.unary("-", 20), _S.unary("-", 2.5), 1], [17, _S.unary("-", 2.5), _S.unary("-", 1)], [_S.unary("-", 30), 2.5, 1], [28, 2.5, _S.unary("-", 1)]])
	_S.define(_e, "arms", _S.invoke(_S.read(_e, "LAY"), "map", [_S.function_value(_e, "_f13")]))
	return _S.merge([{"update": _S.function_value(_e, "_f14")}, {"drawBack": _S.function_value(_e, "_f15")}, {"draw": _S.function_value(_e, "_f16")}])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "n"))):
		_S.invoke(_S.read(_v12, "drops"), "add", [_S.binary("+", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("-", _S.read(_v12, "y"), 1), _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 70), 70]), _S.read(_v12, "k")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [90, 220])), _S.read(_v12, "k")), (2 if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.4])) else 1)])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ripples"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"t0": _S.read(_e, "t")}, {"life": 0.7}, {"w": 1}])])
	_S.invoke(_S.read(_e, "lights"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.binary("-", _S.read(_e, "y"), 7)}, {"r": 30}, {"k": _S.binary("*", 0.55, _S.read(_e, "k"))}, {"life": 0.25}, {"max": 0.25}])])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "RX"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "OPEN"))])])), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "SHUT")), 0.45)])])))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "v", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	return (_S.invoke(_S.read(_e, "ripples"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"t0": _S.read(_e, "t")}, {"life": 0.5}, {"w": 0.6}])]) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("*", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]), 0.95))) else _S.invoke(_S.read(_e, "splats"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"t0": _S.read(_e, "t")}, {"s": _S.read(_e, "s")}])]))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v13 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v13, 0))
	_S.define(_e, "y", _S.prop(_v13, 1))
	_S.define(_e, "toward", _S.prop(_v13, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"x": _S.binary("+", _S.read(_e, "x"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.read(_e, "y")}, {"back": _S.binary("<", _S.read(_e, "y"), 0)}, {"L": (_S.invoke(_S.read(_e, "R"), "range", [44, 52]) if _S.truth(_S.binary("<", _S.read(_e, "y"), 0)) else _S.invoke(_S.read(_e, "R"), "range", [36, 44]))}, {"W": (_S.invoke(_S.read(_e, "R"), "range", [3.2, 3.8]) if _S.truth(_S.binary("<", _S.read(_e, "y"), 0)) else _S.invoke(_S.read(_e, "R"), "range", [3.6, 4.2]))}, {"lean": _S.binary("*", _S.unary("-", _S.read(_e, "toward")), _S.invoke(_S.read(_e, "R"), "range", [0.16, 0.3]))}, {"bend": _S.binary("*", _S.read(_e, "toward"), _S.invoke(_S.read(_e, "R"), "range", [0.35, 0.6]))}, {"curve": _S.binary("*", _S.read(_e, "toward"), _S.invoke(_S.read(_e, "R"), "range", [0.05, 0.15]))}, {"curl": _S.read(_e, "toward")}, {"t0": _S.binary("+", _S.binary("+", 0.3, _S.binary("*", _S.prop([1, 3, 0, 2], _S.read(_e, "i")), 0.06)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.03]))}, {"td": _S.binary("+", _S.binary("+", 1.45, _S.binary("*", _S.prop([2, 0, 3, 1], _S.read(_e, "i")), 0.09)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.05]))}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"up": false}, {"shut": false}, {"down": false}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v14 in _S.array(_S.read(_e, "arms")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "A", _v14)
		var _v16 = _S.scope(_v15)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v16, "A"), "up")), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.prop(_S.read(_v16, "A"), "t0")))):
			_S.last([_S.set_prop(_S.read(_v16, "A"), "up", true, "=", false), _S.call_value(_S.read(_v16, "splash"), [_S.prop(_S.read(_v16, "A"), "x"), _S.prop(_S.read(_v16, "A"), "y"), 12, 1])])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v16, "A"), "shut")), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.binary("+", _S.prop(_S.read(_v16, "A"), "t0"), 0.36)))):
			var _v17 = _S.scope(_v16)
			_S.set_prop(_S.read(_v17, "A"), "shut", true, "=", false)
			_S.define(_v17, "pts", _S.call_value(_S.read(_v17, "arm"), [_S.read(_v17, "A"), _S.read(_v17, "t")]))
			if _S.truth(_S.read(_v17, "pts")):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "q", _S.prop(_S.read(_v18, "pts"), _S.binary("-", _S.prop(_S.read(_v18, "pts"), "length"), 1)))
				_S.invoke(_S.read(_v18, "lights"), "push", [_S.merge([{"x": _S.prop(_S.read(_v18, "q"), "x")}, {"y": _S.prop(_S.read(_v18, "q"), "y")}, {"r": 22}, {"k": 0.7}, {"life": 0.2}, {"max": 0.2}])])
				_S.set_prop(_S.read(_v18, "A"), "snap", _S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v18, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.prop(_S.read(_v18, "q"), "th")]), 4))}, {"y": _S.binary("+", _S.prop(_S.read(_v18, "q"), "y"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.prop(_S.read(_v18, "q"), "th")]), 4))}, {"t0": _S.read(_v18, "t")}]), "=", false)
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v19, "i"), 6)):
					var _v20 = _S.scope(_v19)
					_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
					_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [60, 130]))
					_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.prop(_S.prop(_S.read(_v20, "A"), "snap"), "x"), _S.prop(_S.prop(_S.read(_v20, "A"), "snap"), "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), 20), _S.invoke(_S.read(_v20, "R"), "range", [0.12, 0.3])])
					_v19 = _S.iteration(_v19)
					_S.write(_v19, "i", 1, "+=", true)
				_S.invoke(_S.read(_v18, "puffs"), "spawn", [_S.prop(_S.read(_v18, "PK"), "SOOT"), _S.prop(_S.prop(_S.read(_v18, "A"), "snap"), "x"), _S.prop(_S.prop(_S.read(_v18, "A"), "snap"), "y"), 0, _S.unary("-", 12), 0.6, 3.5])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v16, "A"), "down")), func(): return _S.binary(">=", _S.read(_v16, "t"), _S.binary("+", _S.prop(_S.read(_v16, "A"), "td"), 0.28)))):
			_S.last([_S.set_prop(_S.read(_v16, "A"), "down", true, "=", false), _S.call_value(_S.read(_v16, "splash"), [_S.prop(_S.read(_v16, "A"), "x"), _S.prop(_S.read(_v16, "A"), "y"), 8, 0.7])])
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "r"), 8), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SHUT"), 0.4)))):
		var _v21 = _S.scope(_e)
		var _v22 = _S.scope(_v21)
		_S.write(_v22, "acc", _S.binary("*", _S.read(_v22, "dt"), 8), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v22, "acc"), 1)):
			_S.invoke(_S.read(_v22, "puffs"), "spawn", [_S.prop(_S.read(_v22, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "r")), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [1, 4])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [14, 28])), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 0.85]), _S.invoke(_S.read(_v22, "R"), "range", [3, 6])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [_S.binary("*", _S.read(_v21, "dt"), 12)])):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v21, "r")), _S.unary("-", 2), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 70])), _S.invoke(_S.read(_v21, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_v21, "R"), "pick", [[_S.prop(_S.read(_v21, "C"), 7), _S.prop(_S.read(_v21, "C"), 6), _S.prop(_S.read(_v21, "C"), 5)]]), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1])])
		if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [_S.binary("*", _S.read(_v21, "dt"), 6)])):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v21, "r")), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [2, 8])), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [10, 22])), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 0.9]), (_S.prop(_S.read(_v21, "C"), 3) if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])) else _S.prop(_S.read(_v21, "C"), 4)), _S.invoke(_S.read(_v21, "R"), "range", [3, 6])])
		if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [_S.binary("*", _S.read(_v21, "dt"), 3)])):
			_S.invoke(_S.read(_v21, "ripples"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v21, "r"))}, {"t0": _S.read(_v21, "t")}, {"life": 0.6}, {"w": 0.5}])])
	for _v23 in _S.array([_S.read(_e, "ripples"), _S.read(_e, "splats")]):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "a", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "i", _S.binary("-", _S.prop(_S.read(_v25, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v25, "i"), 0)):
			if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.prop(_S.read(_v25, "a"), _S.read(_v25, "i")), "t0")), _S.logical("??", _S.prop(_S.prop(_S.read(_v25, "a"), _S.read(_v25, "i")), "life"), func(): return 0.6))):
				_S.invoke(_S.read(_v25, "a"), "splice", [_S.read(_v25, "i"), 1])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "-=", true)
	var _v26 = _S.scope(_e)
	_S.define(_v26, "i", _S.binary("-", _S.prop(_S.read(_v26, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v26, "lights"), _S.read(_v26, "i")), "life", _S.read(_v26, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v26, "lights"), "splice", [_S.read(_v26, "i"), 1])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "r"), _S.read(_e, "RX")))
	_S.call_value(_S.read(_e, "floorPool"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "r"), _S.read(_e, "t"), _S.read(_e, "ripples")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v27 = _S.scope(_e)
		_S.invoke(_S.read(_v27, "p"), "glow", [0, _S.unary("-", 16), 80, _S.prop(_S.read(_v27, "C"), 4), _S.binary("*", 0.2, _S.read(_v27, "k"))])
		_S.invoke(_S.read(_v27, "p"), "glow", [0, _S.unary("-", 8), _S.binary("+", _S.binary("*", _S.read(_v27, "r"), 1.7), 12), _S.prop(_S.read(_v27, "C"), 4), _S.binary("*", 0.3, _S.read(_v27, "k"))])
		_S.invoke(_S.read(_v27, "p"), "glow", [0, 0, _S.binary("*", _S.read(_v27, "r"), 1.15), _S.prop(_S.read(_v27, "C"), 5), _S.binary("*", 0.16, _S.read(_v27, "k"))])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "SOOT"), _S.merge([{"x": 0}, {"y": 6}, {"k": _S.read(_e, "k")}, {"reach": 70}])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	for _v28 in _S.array(_S.read(_e, "arms")):
		var _v29 = _S.scope(_e)
		_S.define(_v29, "A", _v28)
		if _S.truth(_S.prop(_S.read(_v29, "A"), "back")):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "pts", _S.call_value(_S.read(_v30, "arm"), [_S.read(_v30, "A"), _S.read(_v30, "t")]))
			if _S.truth(_S.read(_v30, "pts")):
				_S.last([_S.call_value(_S.read(_v30, "drawArm"), [_S.read(_v30, "p"), _S.read(_v30, "A"), _S.read(_v30, "pts"), _S.read(_v30, "DIM")]), _S.call_value(_S.read(_v30, "drawHand"), [_S.read(_v30, "p"), _S.read(_v30, "A"), _S.read(_v30, "pts"), _S.read(_v30, "DIM"), _S.read(_v30, "t")])])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v31 in _S.array(_S.read(_e, "arms")):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "A", _v31)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v32, "A"), "back"))):
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "pts", _S.call_value(_S.read(_v33, "arm"), [_S.read(_v33, "A"), _S.read(_v33, "t")]))
			if _S.truth(_S.read(_v33, "pts")):
				_S.last([_S.call_value(_S.read(_v33, "drawArm"), [_S.read(_v33, "p"), _S.read(_v33, "A"), _S.read(_v33, "pts"), _S.read(_v33, "C")]), _S.call_value(_S.read(_v33, "drawHand"), [_S.read(_v33, "p"), _S.read(_v33, "A"), _S.read(_v33, "pts"), _S.read(_v33, "C"), _S.read(_v33, "t")])])
	for _v34 in _S.array(_S.read(_e, "arms")):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "A", _v34)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v35, "A"), "snap"), func(): return _S.binary("<", _S.binary("-", _S.read(_v35, "t"), _S.prop(_S.prop(_S.read(_v35, "A"), "snap"), "t0")), 0.22))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "u", _S.binary("/", _S.binary("-", _S.read(_v36, "t"), _S.prop(_S.prop(_S.read(_v36, "A"), "snap"), "t0")), 0.22))
			_S.call_value(_S.read(_v36, "ringFast"), [_S.read(_v36, "p"), _S.prop(_S.prop(_S.read(_v36, "A"), "snap"), "x"), _S.prop(_S.prop(_S.read(_v36, "A"), "snap"), "y"), _S.binary("+", 2, _S.binary("*", 5, _S.invoke(_S.read(_v36, "ease"), "outCubic", [_S.read(_v36, "u")]))), 1, (_S.prop(_S.read(_v36, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 0.4)) else (_S.prop(_S.read(_v36, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v36, "u"), 0.7)) else _S.prop(_S.read(_v36, "C"), 3)))])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 5)])
	for _v37 in _S.array(_S.read(_e, "splats")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "s", _v37)
		var _v39 = _S.scope(_v38)
		_S.define(_v39, "a", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v39, "t"), _S.prop(_S.read(_v39, "s"), "t0")), 0.6)))
		_S.invoke(_S.read(_v39, "p"), "dot", [_S.prop(_S.read(_v39, "s"), "x"), _S.unary("-", 0.5), _S.prop(_S.read(_v39, "C"), 1), _S.binary("*", _S.read(_v39, "a"), 1.5)])
		_S.invoke(_S.read(_v39, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v39, "s"), "x"), 1), _S.unary("-", 0.5), _S.prop(_S.read(_v39, "C"), 2), _S.read(_v39, "a")])
		_S.invoke(_S.read(_v39, "p"), "dot", [_S.prop(_S.read(_v39, "s"), "x"), _S.unary("-", 1.5), _S.prop(_S.read(_v39, "C"), 5), _S.read(_v39, "a")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	for _v40 in _S.array(_S.read(_e, "lights")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "l", _v40)
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "q", _S.binary("/", _S.prop(_S.read(_v42, "l"), "life"), _S.prop(_S.read(_v42, "l"), "max")))
		_S.invoke(_S.read(_v42, "p"), "glow", [_S.prop(_S.read(_v42, "l"), "x"), _S.prop(_S.read(_v42, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v42, "l"), "r"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v42, "q")))), _S.prop(_S.read(_v42, "C"), 5), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v42, "l"), "k"), _S.read(_v42, "q")), _S.read(_v42, "q"))])
	return null
