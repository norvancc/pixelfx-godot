@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/shadow-tendrils.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "Puffs", _S.import_value("fx/shadow/_lib.js", "Puffs"))
	_S.define(_e, "PK", _S.import_value("fx/shadow/_lib.js", "PK"))
	_S.define(_e, "Drops", _S.import_value("fx/shadow/_lib.js", "Drops"))
	_S.define(_e, "floorPool", _S.import_value("fx/shadow/_lib.js", "floorPool"))
	_S.define(_e, "spine", _S.function_value(_e, "_f0"))
	_S.define(_e, "tentacle", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Shadow tendrils"}, {"desc": "A dark pool opens on the floor; tentacles with lit rims and hooked tips lash up out of it with a splash, writhe, and sink back as it closes."}, {"tags": ["shadow", "tentacle", "tendril", "ground", "dark", "magic", "one-shot"]}, {"size": [208, 130]}, {"origin": [104, 106]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RX", 40)
	_S.define(_e, "OPEN", 0.34)
	_S.define(_e, "SHUT", 2.5)
	_S.define(_e, "SINK", 0.5)
	_S.define(_e, "LX", _S.unary("-", 0.6))
	_S.define(_e, "LY", _S.unary("-", 0.8))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "T", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "T"), "t0")), 0.2)]))
	_S.define(_e, "s1", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "T"), "t1")), _S.read(_e, "SINK"))]))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "e"), 0), func(): return _S.binary(">=", _S.read(_e, "s1"), 1))):
		return null
	_S.define(_e, "lift", _S.binary("*", 0.07, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "s1"), 0.3)]))])))
	_S.define(_e, "down", _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "s1"), 0.12), 0.88)])]))
	_S.define(_e, "rise", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.read(_e, "e"), 1.8]), _S.binary("+", 1, _S.read(_e, "lift"))), _S.binary("-", 1, _S.read(_e, "down"))))
	_S.define(_e, "hidden", _S.binary("*", _S.binary("-", 1, _S.read(_e, "rise")), _S.prop(_S.read(_e, "T"), "L")))
	_S.define(_e, "writhe", _S.binary("*", _S.prop(_S.read(_e, "T"), "A"), _S.binary("+", 0.25, _S.binary("*", 0.75, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.prop(_S.read(_e, "T"), "t0"), 0.08), _S.binary("+", _S.prop(_S.read(_e, "T"), "t0"), 0.5), _S.read(_e, "t")])))))
	_S.define(_e, "hook", _S.binary("*", _S.binary("*", _S.binary("+", 0.04, _S.binary("*", _S.prop(_S.read(_e, "T"), "H"), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "T"), "t0")), 0.1), 0.32)]), 2.5]))), _S.binary("+", 1, _S.binary("*", 0.5, _S.read(_e, "s1")))), _S.binary("+", 1, _S.binary("*", 0.18, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 2.3), _S.prop(_S.read(_e, "T"), "ph"))])))))
	_S.define(_e, "lean", _S.binary("+", _S.prop(_S.read(_e, "T"), "lean"), _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 1.6), _S.prop(_S.read(_e, "T"), "ph"))]))))
	if _S.truth(_S.prop(_S.read(_e, "T"), "whip")):
		_S.write(_e, "lean", _S.binary("*", _S.prop(_S.prop(_S.read(_e, "T"), "whip"), "a"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "T"), "whip"), "t")), 0.14), 2))])), "+=", false)
	_S.define(_e, "th", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.read(_e, "lean")))
	_S.define(_e, "x", _S.binary("-", _S.prop(_S.read(_e, "T"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "hidden"))))
	_S.define(_e, "y", _S.binary("-", _S.prop(_S.read(_e, "T"), "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "hidden"))))
	_S.define(_e, "pts", [])
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("/", _S.prop(_S.read(_e, "T"), "L"), 0.5)]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "s", _S.binary("*", _S.read(_v1, "i"), 0.5))
		_S.define(_v1, "u", _S.binary("/", _S.read(_v1, "s"), _S.prop(_S.read(_v1, "T"), "L")))
		_S.invoke(_S.read(_v1, "pts"), "push", [_S.merge([{"x": _S.read(_v1, "x")}, {"y": _S.read(_v1, "y")}, {"th": _S.read(_v1, "th")}, {"w": _S.binary("+", _S.binary("*", _S.prop(_S.read(_v1, "T"), "W"), _S.invoke(_S.read(_v1, "Math"), "pow", [_S.binary("-", 1, _S.read(_v1, "u")), 0.75])), 0.45)}, {"u": _S.read(_v1, "u")}, {"s": _S.read(_v1, "s")}])])
		_S.write(_v1, "th", _S.binary("*", 0.5, _S.binary("+", _S.binary("*", _S.read(_v1, "writhe"), _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v1, "s"), _S.prop(_S.read(_v1, "T"), "lam")), _S.read(_v1, "TAU")), _S.binary("*", _S.prop(_S.read(_v1, "T"), "om"), _S.read(_v1, "t"))), _S.prop(_S.read(_v1, "T"), "ph"))])), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v1, "T"), "curl"), _S.read(_v1, "hook")), _S.call_value(_S.read(_v1, "smooth"), [0.58, 1, _S.read(_v1, "u")])))), "+=", false)
		_S.write(_v1, "x", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "th")]), 0.5), "+=", false)
		_S.write(_v1, "y", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "th")]), 0.5), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "T", _S.arg(_args, 1))
	_S.define(_e, "pts", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "surf", _S.prop(_S.read(_e, "T"), "y"))
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
	_S.define(_e, "pulse", _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "T"), "t0")), 150))
	_S.define(_e, "slow", _S.binary("-", _S.binary("%", _S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "T"), "t0")), 55), _S.binary("*", _S.prop(_S.read(_e, "T"), "L"), 1.8)), 4))
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
		_S.define(_v9, "lit", _S.binary("*", _S.read(_v9, "ks"), _S.prop(_S.read(_v9, "q"), "w")))
		_S.define(_v9, "x0", _S.binary("+", _S.prop(_S.read(_v9, "q"), "x"), _S.binary("*", _S.read(_v9, "nx"), _S.read(_v9, "lit"))))
		_S.define(_v9, "y0", _S.binary("+", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "lit"))))
		_S.define(_v9, "x1", _S.binary("-", _S.prop(_S.read(_v9, "q"), "x"), _S.binary("*", _S.read(_v9, "nx"), _S.read(_v9, "lit"))))
		_S.define(_v9, "y1", _S.binary("-", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.read(_v9, "ny"), _S.read(_v9, "lit"))))
		if _S.truth(_S.binary("<=", _S.read(_v9, "y1"), _S.read(_v9, "surf"))):
			_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x1"), _S.read(_v9, "y1"), _S.prop(_S.read(_v9, "C"), 3)])
		if _S.truth(_S.binary("<=", _S.read(_v9, "y0"), _S.read(_v9, "surf"))):
			_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x0"), _S.read(_v9, "y0"), (_S.prop(_S.read(_v9, "C"), 7) if _S.truth(_S.logical("&&", _S.binary(">", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.read(_v9, "f")]), 0.8), func(): return _S.binary(">", _S.prop(_S.read(_v9, "q"), "u"), 0.15))) else (_S.prop(_S.read(_v9, "C"), 6) if _S.truth(_S.binary(">", _S.prop(_S.read(_v9, "q"), "u"), 0.85)) else (_S.prop(_S.read(_v9, "C"), 6) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.read(_v9, "f")]), 0.3)) else _S.prop(_S.read(_v9, "C"), 5))))])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v9, "q"), "u"), 0.62), func(): return _S.binary("<", _S.prop(_S.read(_v9, "q"), "u"), 0.93)), func(): return _S.binary("<", _S.binary("%", _S.prop(_S.read(_v9, "q"), "s"), 3), 0.5))):
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v9, "q"), "x"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "nx"), _S.prop(_S.read(_v9, "T"), "curl")), _S.prop(_S.read(_v9, "q"), "w")), 0.45)), _S.binary("+", _S.prop(_S.read(_v9, "q"), "y"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "ny"), _S.prop(_S.read(_v9, "T"), "curl")), _S.prop(_S.read(_v9, "q"), "w")), 0.45)), _S.prop(_S.read(_v9, "C"), 4)])
		_S.define(_v9, "dp", _S.invoke(_S.read(_v9, "Math"), "min", [_S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v9, "q"), "s"), _S.read(_v9, "pulse"))]), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v9, "q"), "s"), _S.read(_v9, "slow"))]), 1.6)]))
		if _S.truth(_S.binary("<", _S.read(_v9, "dp"), 2.5)):
			_S.invoke(_S.read(_v9, "p"), "px", [_S.prop(_S.read(_v9, "q"), "x"), _S.prop(_S.read(_v9, "q"), "y"), (_S.prop(_S.read(_v9, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v9, "dp"), 1)) else _S.prop(_S.read(_v9, "C"), 5))])
	_S.define(_e, "tip", _S.prop(_S.read(_e, "pts"), _S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1)))
	if _S.truth(_S.binary("<=", _S.prop(_S.read(_e, "tip"), "y"), _S.read(_e, "surf"))):
		var _v10 = _S.scope(_e)
		_S.invoke(_S.read(_v10, "p"), "px", [_S.prop(_S.read(_v10, "tip"), "x"), _S.prop(_S.read(_v10, "tip"), "y"), _S.read(_v10, "WHITE")])
		_S.invoke(_S.read(_v10, "p"), "glow", [_S.prop(_S.read(_v10, "tip"), "x"), _S.prop(_S.read(_v10, "tip"), "y"), 6, _S.prop(_S.read(_v10, "C"), 6), 0.25])
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.prop(_S.read(_v11, "pts"), "length"))):
		if _S.truth(_S.binary("<", _S.prop(_S.prop(_S.read(_v11, "pts"), _S.read(_v11, "i")), "y"), _S.read(_v11, "surf"))):
			_S.invoke(_S.read(_v11, "p"), "glow", [_S.prop(_S.prop(_S.read(_v11, "pts"), _S.read(_v11, "i")), "x"), _S.prop(_S.prop(_S.read(_v11, "pts"), _S.read(_v11, "i")), "y"), 9, _S.prop(_S.read(_v11, "C"), 4), 0.1])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 8, "+=", false)
	_S.define(_e, "pq", _S.prop(_S.read(_e, "pts"), _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_e, "pts"), "length"), 1), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "pulse"), 2)])])])))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "pulse"), _S.prop(_S.read(_e, "T"), "L")), func(): return _S.binary("<", _S.prop(_S.read(_e, "pq"), "y"), _S.read(_e, "surf")))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "pq"), "x"), _S.prop(_S.read(_e, "pq"), "y"), 10, _S.prop(_S.read(_e, "C"), 6), 0.45])
	_S.define(_e, "base", _S.invoke(_S.read(_e, "pts"), "find", [_S.function_value(_e, "_f2")]))
	if _S.truth(_S.read(_e, "base")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "w", _S.binary("+", _S.prop(_S.read(_v12, "base"), "w"), 1.5))
		_S.invoke(_S.read(_v12, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v12, "base"), "x"), _S.read(_v12, "w")), _S.read(_v12, "surf"), _S.binary("+", _S.prop(_S.read(_v12, "base"), "x"), _S.read(_v12, "w")), _S.read(_v12, "surf"), _S.prop(_S.read(_v12, "C"), 5)])
		_S.invoke(_S.read(_v12, "p"), "px", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v12, "base"), "x"), _S.read(_v12, "w")), 1), _S.binary("+", _S.read(_v12, "surf"), 0.5), _S.prop(_S.read(_v12, "C"), 3)])
		_S.invoke(_S.read(_v12, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v12, "base"), "x"), _S.read(_v12, "w")), 1), _S.binary("+", _S.read(_v12, "surf"), 0.5), _S.prop(_S.read(_v12, "C"), 3)])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary("<=", _S.prop(_S.read(_e, "q"), "y"), _S.read(_e, "surf"))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "splash", _S.function_value(_e, "_f4"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "DIM", [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "puffs", _S.construct(_S.read(_e, "Puffs"), [_S.merge([{"rng": _S.read(_e, "R")}, {"flame": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)]}, {"soot": [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), 0.55]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), 0.5])]}, {"cap": _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 2), 0.5])}, {"rim": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"floor": _S.read(_e, "floor")}])]))
	_S.define(_e, "ripples", [])
	_S.define(_e, "splats", [])
	_S.define(_e, "lights", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "acc", 0)
	_S.define(_e, "rx", _S.function_value(_e, "_f6"))
	_S.define(_e, "inPool", _S.function_value(_e, "_f7"))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"onLand": _S.function_value(_e, "_f8")}])]))
	_S.define(_e, "rows", [[_S.unary("-", 22), _S.unary("-", 2.5)], [_S.unary("-", 8), _S.unary("-", 3)], [7, _S.unary("-", 3)], [21, _S.unary("-", 2.5)], [_S.unary("-", 28), 2.5], [_S.unary("-", 1), 3], [27, 2.5]])
	_S.define(_e, "order", [3, 0, 5, 2, 4, 1, 6])
	_S.define(_e, "last", [1, 5, 0, 6, 3, 2, 4])
	_S.define(_e, "tents", _S.invoke(_S.read(_e, "rows"), "map", [_S.function_value(_e, "_f9")]))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "n", _S.arg(_args, 2))
	_S.define(_e, "power", _S.arg(_args, 3))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.read(_v13, "n"))):
		_S.invoke(_S.read(_v13, "drops"), "add", [_S.binary("+", _S.read(_v13, "x"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("-", _S.read(_v13, "y"), 1), _S.binary("*", _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 70), 70]), _S.read(_v13, "power")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [90, 230])), _S.read(_v13, "power")), (2 if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.4])) else 1)])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ripples"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"t0": _S.read(_e, "t")}, {"life": 0.7}, {"w": 1}])])
	_S.invoke(_S.read(_e, "lights"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.binary("-", _S.read(_e, "y"), 7)}, {"r": 30}, {"k": _S.binary("*", 0.6, _S.read(_e, "power"))}, {"life": 0.25}, {"max": 0.25}])])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "RX"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "tt"), _S.read(_e, "OPEN"))])])), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "SHUT")), 0.45)])])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("*", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "tt")]), 0.95))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "v", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	if _S.truth(_S.call_value(_S.read(_e, "inPool"), [_S.read(_e, "x"), _S.read(_e, "t")])):
		_S.invoke(_S.read(_e, "ripples"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"t0": _S.read(_e, "t")}, {"life": 0.5}, {"w": 0.6}])])
	else:
		_S.invoke(_S.read(_e, "splats"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"t0": _S.read(_e, "t")}, {"s": _S.read(_e, "s")}])])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v14 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "y", _S.prop(_v14, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "back", _S.binary("<", _S.read(_e, "y"), 0))
	_S.define(_e, "sx", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "sign", [_S.read(_e, "x")]), func(): return 1))
	return _S.merge([{"x": _S.binary("+", _S.read(_e, "x"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.read(_e, "y")}, {"back": _S.read(_e, "back")}, {"L": (_S.invoke(_S.read(_e, "R"), "range", [46, 62]) if _S.truth(_S.read(_e, "back")) else _S.invoke(_S.read(_e, "R"), "range", [32, 46]))}, {"W": (_S.invoke(_S.read(_e, "R"), "range", [3.2, 4]) if _S.truth(_S.read(_e, "back")) else _S.invoke(_S.read(_e, "R"), "range", [3.8, 4.6]))}, {"lean": _S.binary("+", _S.binary("*", _S.read(_e, "sx"), _S.binary("+", 0.06, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 120))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.06), 0.06]))}, {"curl": (_S.unary("-", _S.read(_e, "sx")) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.75])) else _S.read(_e, "sx"))}, {"lam": _S.invoke(_S.read(_e, "R"), "range", [36, 50])}, {"om": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [4.5, 7]), _S.invoke(_S.read(_e, "R"), "sign", []))}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"A": _S.invoke(_S.read(_e, "R"), "range", [0.06, 0.085])}, {"H": _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.32])}, {"t0": _S.binary("+", _S.binary("+", 0.3, _S.binary("*", _S.prop(_S.read(_e, "order"), _S.read(_e, "i")), 0.045)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.03]))}, {"t1": _S.binary("+", _S.binary("+", 1.5, _S.binary("*", _S.prop(_S.read(_e, "last"), _S.read(_e, "i")), 0.1)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.05]))}, {"whip": (_S.merge([{"t": _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.5])}, {"a": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [0.28, 0.45]), _S.invoke(_S.read(_e, "R"), "sign", []))}]) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.45])) else null)}, {"up": false}, {"down": false}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v15 in _S.array(_S.read(_e, "tents")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "T", _v15)
		var _v17 = _S.scope(_v16)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v17, "T"), "up")), func(): return _S.binary(">=", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "T"), "t0")))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "T"), "up", true, "=", false)
			_S.call_value(_S.read(_v18, "splash"), [_S.prop(_S.read(_v18, "T"), "x"), _S.prop(_S.read(_v18, "T"), "y"), 12, 1])
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "i"), 4)):
				_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SPARK"), _S.prop(_S.read(_v19, "T"), "x"), _S.binary("-", _S.prop(_S.read(_v19, "T"), "y"), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 80), 80]), _S.unary("-", _S.invoke(_S.read(_v19, "R"), "range", [120, 260])), _S.invoke(_S.read(_v19, "R"), "range", [0.2, 0.45])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "i", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v17, "T"), "down")), func(): return _S.binary(">=", _S.read(_v17, "t"), _S.binary("+", _S.prop(_S.read(_v17, "T"), "t1"), _S.binary("*", _S.read(_v17, "SINK"), 0.8))))):
			var _v20 = _S.scope(_v17)
			_S.set_prop(_S.read(_v20, "T"), "down", true, "=", false)
			_S.call_value(_S.read(_v20, "splash"), [_S.prop(_S.read(_v20, "T"), "x"), _S.prop(_S.read(_v20, "T"), "y"), 6, 0.6])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v17, "t"), _S.binary("+", _S.prop(_S.read(_v17, "T"), "t0"), 0.2)), func(): return _S.binary("<", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "T"), "t1"))), func(): return _S.invoke(_S.read(_v17, "R"), "chance", [_S.binary("*", _S.read(_v17, "dt"), 1.6)]))):
			var _v21 = _S.scope(_v17)
			_S.define(_v21, "pts", _S.call_value(_S.read(_v21, "spine"), [_S.read(_v21, "T"), _S.read(_v21, "t")]))
			_S.define(_v21, "q", _S.logical("&&", _S.read(_v21, "pts"), func(): return _S.prop(_S.read(_v21, "pts"), _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v21, "R"), "range", [0.3, 0.95]), _S.prop(_S.read(_v21, "pts"), "length"))]))))
			if _S.truth(_S.logical("&&", _S.read(_v21, "q"), func(): return _S.binary("<", _S.prop(_S.read(_v21, "q"), "y"), _S.prop(_S.read(_v21, "T"), "y")))):
				_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "STAR"), _S.binary("-", _S.prop(_S.read(_v21, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.prop(_S.read(_v21, "q"), "th")]), _S.prop(_S.read(_v21, "q"), "w"))), _S.binary("+", _S.prop(_S.read(_v21, "q"), "y"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.prop(_S.read(_v21, "q"), "th")]), _S.prop(_S.read(_v21, "q"), "w"))), 0, _S.unary("-", 4), _S.invoke(_S.read(_v21, "R"), "range", [0.25, 0.5]), _S.prop(_S.read(_v21, "C"), 6), _S.invoke(_S.read(_v21, "R"), "range", [1, 2.2])])
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "r"), 8), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SHUT"), 0.4)))):
		var _v22 = _S.scope(_e)
		var _v23 = _S.scope(_v22)
		_S.write(_v23, "acc", _S.binary("*", _S.read(_v23, "dt"), 9), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v23, "acc"), 1)):
			_S.invoke(_S.read(_v23, "puffs"), "spawn", [_S.prop(_S.read(_v23, "PK"), "SOOT"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v23, "r")), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [1, 4])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [14, 30])), _S.invoke(_S.read(_v23, "R"), "range", [0.6, 0.85]), _S.invoke(_S.read(_v23, "R"), "range", [3, 6])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "acc", 1, "-=", true)
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 16)])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "r")), _S.unary("-", 2), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [30, 80])), _S.invoke(_S.read(_v22, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.prop(_S.read(_v22, "C"), 7), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 5)]]), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 1.1])])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 5)])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "r")), _S.unary("-", 3), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [20, 45])), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v22, "C"), 6)])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 3)])):
			_S.invoke(_S.read(_v22, "ripples"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v22, "r"))}, {"t0": _S.read(_v22, "t")}, {"life": 0.6}, {"w": 0.5}])])
		if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", _S.read(_v22, "dt"), 7)])):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "VAPOUR"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_v22, "r")), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [2, 8])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [10, 22])), _S.invoke(_S.read(_v22, "R"), "range", [0.6, 0.9]), (_S.prop(_S.read(_v22, "C"), 3) if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.5])) else _S.prop(_S.read(_v22, "C"), 4)), _S.invoke(_S.read(_v22, "R"), "range", [3, 6])])
	for _v24 in _S.array([_S.read(_e, "ripples"), _S.read(_e, "splats")]):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", _S.binary("-", _S.prop(_S.read(_v26, "a"), "length"), 1))
		while _S.truth(_S.binary(">=", _S.read(_v26, "i"), 0)):
			if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v26, "t"), _S.prop(_S.prop(_S.read(_v26, "a"), _S.read(_v26, "i")), "t0")), _S.logical("??", _S.prop(_S.prop(_S.read(_v26, "a"), _S.read(_v26, "i")), "life"), func(): return 0.6))):
				_S.invoke(_S.read(_v26, "a"), "splice", [_S.read(_v26, "i"), 1])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "-=", true)
	var _v27 = _S.scope(_e)
	_S.define(_v27, "i", _S.binary("-", _S.prop(_S.read(_v27, "lights"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v27, "i"), 0)):
		if _S.truth(_S.binary("<=", _S.set_prop(_S.prop(_S.read(_v27, "lights"), _S.read(_v27, "i")), "life", _S.read(_v27, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v27, "lights"), "splice", [_S.read(_v27, "i"), 1])
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "puffs"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rx"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "r"), _S.read(_e, "RX")))
	_S.call_value(_S.read(_e, "floorPool"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "r"), _S.read(_e, "t"), _S.read(_e, "ripples")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v28 = _S.scope(_e)
		_S.invoke(_S.read(_v28, "p"), "glow", [0, _S.unary("-", 16), 86, _S.prop(_S.read(_v28, "C"), 4), _S.binary("*", 0.22, _S.read(_v28, "k"))])
		_S.invoke(_S.read(_v28, "p"), "glow", [0, _S.unary("-", 8), _S.binary("+", _S.binary("*", _S.read(_v28, "r"), 1.7), 12), _S.prop(_S.read(_v28, "C"), 4), _S.binary("*", _S.binary("*", 0.32, _S.read(_v28, "k")), _S.binary("+", 0.9, _S.binary("*", 0.1, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.binary("*", _S.read(_v28, "t"), 5)]))))])
		_S.invoke(_S.read(_v28, "p"), "glow", [0, 0, _S.binary("*", _S.read(_v28, "r"), 1.15), _S.prop(_S.read(_v28, "C"), 5), _S.binary("*", 0.18, _S.read(_v28, "k"))])
	_S.invoke(_S.read(_e, "puffs"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "PK"), "SOOT"), _S.merge([{"x": 0}, {"y": 6}, {"k": _S.read(_e, "k")}, {"reach": 70}])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	for _v29 in _S.array(_S.read(_e, "tents")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "T", _v29)
		if _S.truth(_S.prop(_S.read(_v30, "T"), "back")):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "pts", _S.call_value(_S.read(_v31, "spine"), [_S.read(_v31, "T"), _S.read(_v31, "t")]))
			if _S.truth(_S.read(_v31, "pts")):
				_S.call_value(_S.read(_v31, "tentacle"), [_S.read(_v31, "p"), _S.read(_v31, "T"), _S.read(_v31, "pts"), _S.read(_v31, "DIM"), _S.read(_v31, "t")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v32 in _S.array(_S.read(_e, "tents")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "T", _v32)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v33, "T"), "back"))):
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "pts", _S.call_value(_S.read(_v34, "spine"), [_S.read(_v34, "T"), _S.read(_v34, "t")]))
			if _S.truth(_S.read(_v34, "pts")):
				_S.call_value(_S.read(_v34, "tentacle"), [_S.read(_v34, "p"), _S.read(_v34, "T"), _S.read(_v34, "pts"), _S.read(_v34, "C"), _S.read(_v34, "t")])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 5)])
	for _v35 in _S.array(_S.read(_e, "splats")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "s", _v35)
		var _v37 = _S.scope(_v36)
		_S.define(_v37, "a", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v37, "t"), _S.prop(_S.read(_v37, "s"), "t0")), 0.6)))
		_S.invoke(_S.read(_v37, "p"), "dot", [_S.prop(_S.read(_v37, "s"), "x"), _S.unary("-", 0.5), _S.prop(_S.read(_v37, "C"), 1), _S.binary("*", _S.read(_v37, "a"), 1.5)])
		_S.invoke(_S.read(_v37, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v37, "s"), "x"), 1), _S.unary("-", 0.5), _S.prop(_S.read(_v37, "C"), 2), _S.read(_v37, "a")])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v37, "s"), "s"), 1)):
			_S.invoke(_S.read(_v37, "p"), "dot", [_S.binary("-", _S.prop(_S.read(_v37, "s"), "x"), 1), _S.unary("-", 0.5), _S.prop(_S.read(_v37, "C"), 2), _S.read(_v37, "a")])
		_S.invoke(_S.read(_v37, "p"), "dot", [_S.prop(_S.read(_v37, "s"), "x"), _S.unary("-", 1.5), _S.prop(_S.read(_v37, "C"), 5), _S.read(_v37, "a")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	for _v38 in _S.array(_S.read(_e, "lights")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "l", _v38)
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "q", _S.binary("/", _S.prop(_S.read(_v40, "l"), "life"), _S.prop(_S.read(_v40, "l"), "max")))
		_S.invoke(_S.read(_v40, "p"), "glow", [_S.prop(_S.read(_v40, "l"), "x"), _S.prop(_S.read(_v40, "l"), "y"), _S.binary("*", _S.prop(_S.read(_v40, "l"), "r"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.read(_v40, "q")))), _S.prop(_S.read(_v40, "C"), 5), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v40, "l"), "k"), _S.read(_v40, "q")), _S.read(_v40, "q"))])
	return null
