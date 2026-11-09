@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/fountain.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "tileNoise", _S.import_value("core/index.js", "tileNoise"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "basin", _S.function_value(_e, "_f0"))
	_S.define(_e, "pool", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "arc", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Fountain"}, {"desc": "A stone basin; a jet rises from its spout and blooms into glassy arcs that break into beads, fall back and plink into the water with rings."}, {"tags": ["water", "fountain", "jet", "basin", "prop", "ambient", "loop"]}, {"size": [120, 104]}, {"origin": [60, 96]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.34)
	_S.define(_e, "G", 600)
	_S.define(_e, "RIM", 10)
	_S.define(_e, "RX", 36)
	_S.define(_e, "IN", 29.5)
	_S.define(_e, "JET", 54)
	_S.define(_e, "ARCS", 12)
	_S.define(_e, "BY", _S.binary("*", _S.unary("-", _S.read(_e, "RX")), _S.read(_e, "SY")))
	_S.define(_e, "LEVEL", _S.binary("-", _S.read(_e, "RIM"), 1.2))
	_S.define(_e, "arcs", _S.function_value(_e, "_f13"))
	_S.define(_e, "along", _S.function_value(_e, "_f15"))
	_S.define(_e, "inEll", _S.function_value(_e, "_f16"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "ST", _S.arg(_args, 1))
	_S.define(_e, "half", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "RIM")))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "RX"), _S.read(_e, "SY")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "RX")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "cy"), _S.read(_e, "ry")), 1), _S.binary("+", _S.read(_e, "RX"), 1), 1, _S.function_value(_e, "_f1")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	if _S.truth(_S.call_value(_S.read(_e, "inEll"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "RX"), _S.read(_e, "cy")])):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.call_value(_S.read(_v0, "inEll"), [_S.read(_v0, "x"), _S.read(_v0, "y"), _S.read(_v0, "IN"), _S.read(_v0, "cy")])):
			return null
		_S.define(_v0, "near", _S.binary(">", _S.read(_v0, "y"), _S.read(_v0, "cy")))
		if _S.truth(_S.binary("!==", _S.read(_v0, "near"), _S.binary(">", _S.read(_v0, "half"), 0))):
			return null
		_S.define(_v0, "outer", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v0, "inEll"), [_S.read(_v0, "x"), _S.binary("-", _S.read(_v0, "y"), 1), _S.read(_v0, "RX"), _S.read(_v0, "cy")])), func(): return _S.unary("!", _S.call_value(_S.read(_v0, "inEll"), [_S.read(_v0, "x"), _S.binary("+", _S.read(_v0, "y"), 1), _S.read(_v0, "RX"), _S.read(_v0, "cy")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v0, "inEll"), [_S.binary("-", _S.read(_v0, "x"), 1), _S.read(_v0, "y"), _S.read(_v0, "RX"), _S.read(_v0, "cy")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v0, "inEll"), [_S.binary("+", _S.read(_v0, "x"), 1), _S.read(_v0, "y"), _S.read(_v0, "RX"), _S.read(_v0, "cy")]))))
		_S.define(_v0, "inner", _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v0, "inEll"), [_S.read(_v0, "x"), _S.binary("-", _S.read(_v0, "y"), 1), _S.read(_v0, "IN"), _S.read(_v0, "cy")]), func(): return _S.call_value(_S.read(_v0, "inEll"), [_S.read(_v0, "x"), _S.binary("+", _S.read(_v0, "y"), 1), _S.read(_v0, "IN"), _S.read(_v0, "cy")])), func(): return _S.call_value(_S.read(_v0, "inEll"), [_S.binary("-", _S.read(_v0, "x"), 1), _S.read(_v0, "y"), _S.read(_v0, "IN"), _S.read(_v0, "cy")])), func(): return _S.call_value(_S.read(_v0, "inEll"), [_S.binary("+", _S.read(_v0, "x"), 1), _S.read(_v0, "y"), _S.read(_v0, "IN"), _S.read(_v0, "cy")])))
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "Math"), "atan2", [_S.binary("/", _S.binary("-", _S.read(_v0, "y"), _S.read(_v0, "cy")), _S.read(_v0, "ry")), _S.binary("/", _S.read(_v0, "x"), _S.read(_v0, "RX"))]))
		_S.define(_v0, "lit", _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")])), 0.65), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), 0.45)))
		_S.set_prop(_S.read(_v0, "out"), "c", (_S.prop(_S.read(_v0, "ST"), 0) if _S.truth(_S.read(_v0, "outer")) else ((_S.prop(_S.read(_v0, "ST"), 2) if _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.read(_v0, "cy"))) else _S.prop(_S.read(_v0, "ST"), 1)) if _S.truth(_S.read(_v0, "inner")) else (_S.prop(_S.read(_v0, "ST"), 5) if _S.truth(_S.binary(">", _S.read(_v0, "lit"), 0.4)) else (_S.prop(_S.read(_v0, "ST"), 4) if _S.truth(_S.binary(">", _S.read(_v0, "lit"), _S.unary("-", 0.05))) else (_S.prop(_S.read(_v0, "ST"), 3) if _S.truth(_S.binary(">", _S.read(_v0, "lit"), _S.unary("-", 0.45))) else _S.prop(_S.read(_v0, "ST"), 2)))))), "=", false)
		return null
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "half"), 0), func(): return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "RX")))):
		return null
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "RX")))
	_S.define(_e, "top", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")))]), _S.read(_e, "ry"))))
	_S.define(_e, "base", _S.binary("+", _S.read(_e, "top"), _S.read(_e, "RIM")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "y"), _S.read(_e, "top")), func(): return _S.binary(">", _S.read(_e, "y"), _S.read(_e, "base")))):
		return null
	_S.define(_e, "u", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "asin", [_S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "dx")])]), _S.read(_e, "RX")), 0.62))
	_S.define(_e, "block", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("/", _S.binary("+", _S.read(_e, "u"), 40), 9), 1), 1), 1))
	_S.define(_e, "row", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")))
	_S.define(_e, "course", (1 if _S.truth(_S.binary(">", _S.read(_e, "row"), _S.binary("*", _S.read(_e, "RIM"), 0.5))) else 0))
	_S.define(_e, "joint", _S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("/", _S.binary("+", _S.binary("+", _S.read(_e, "u"), 40), _S.binary("*", _S.read(_e, "course"), 4.5)), 9), 1), 1), 1), 0.1))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "ST"), 0) if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "base"), 1)), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "RX"), 1))), func(): return _S.binary("<", _S.read(_e, "row"), 1))) else (_S.prop(_S.read(_e, "ST"), 1) if _S.truth(_S.logical("||", _S.read(_e, "joint"), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "row"), _S.binary("*", _S.read(_e, "RIM"), 0.5))]), 0.5))) else (_S.prop(_S.read(_e, "ST"), 4) if _S.truth(_S.binary("<", _S.read(_e, "dx"), _S.unary("-", 0.4))) else (_S.prop(_S.read(_e, "ST"), 3) if _S.truth(_S.binary("<", _S.read(_e, "dx"), 0.3)) else _S.prop(_S.read(_e, "ST"), 2))))), "=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "row"), 1), func(): return _S.binary("<", _S.read(_e, "row"), 2)), func(): return _S.unary("!", _S.read(_e, "joint")))):
		_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "ST"), 2) if _S.truth(_S.binary("<", _S.read(_e, "dx"), 0)) else _S.prop(_S.read(_e, "ST"), 1)), "=", false)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "ph", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.read(_e, "IN"))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "SY")))
	_S.define(_e, "cy", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "LEVEL")))
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "Y", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("-", _S.read(_v1, "cy"), _S.read(_v1, "ry"))]))
	while _S.truth(_S.binary("<", _S.read(_v1, "Y"), _S.binary("+", _S.read(_v1, "cy"), _S.read(_v1, "ry")))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "X", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "ceil", [_S.read(_v2, "rx")])))
		while _S.truth(_S.binary("<", _S.read(_v2, "X"), _S.read(_v2, "rx"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "x", _S.binary("+", _S.read(_v3, "X"), 0.5))
			_S.define(_v3, "y", _S.binary("+", _S.read(_v3, "Y"), 0.5))
			_S.define(_v3, "dx", _S.binary("/", _S.read(_v3, "x"), _S.read(_v3, "rx")))
			_S.define(_v3, "dy", _S.binary("/", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "cy")), _S.read(_v3, "ry")))
			_S.define(_v3, "d", _S.binary("+", _S.binary("*", _S.read(_v3, "dx"), _S.read(_v3, "dx")), _S.binary("*", _S.read(_v3, "dy"), _S.read(_v3, "dy"))))
			if _S.truth(_S.binary(">", _S.read(_v3, "d"), 1)):
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "X", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v3, "p"), "blend", [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.prop(_S.read(_v3, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v3, "dy"), _S.unary("-", 0.55))) else _S.prop(_S.read(_v3, "C"), 1)), (0.8 if _S.truth(_S.binary("<", _S.read(_v3, "dy"), _S.unary("-", 0.55))) else 0.85)])
			_S.define(_v3, "u", _S.binary("+", _S.binary("*", _S.read(_v3, "x"), 0.25), _S.binary("*", 1.6, _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v3, "y"), 0.6), _S.read(_v3, "T"))]))))
			_S.define(_v3, "w", _S.binary("+", _S.binary("*", _S.read(_v3, "y"), 0.7), _S.binary("*", 1.6, _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v3, "x"), 0.14), _S.binary("*", _S.read(_v3, "T"), 2))]))))
			_S.define(_v3, "f", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.binary("+", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "u")]), _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "w")]))]), 2.6))]), _S.binary("-", 1, _S.read(_v3, "d"))))
			if _S.truth(_S.binary(">", _S.read(_v3, "f"), 0.35)):
				_S.invoke(_S.read(_v3, "p"), "light", [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.prop(_S.read(_v3, "C"), 5), _S.binary("*", 0.3, _S.read(_v3, "f"))])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "X", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "Y", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "Q", _S.call_value(_S.read(_e, "arcs"), [_S.read(_e, "S")]))
	_S.call_value(_S.read(_e, "basin"), [_S.read(_e, "p"), _S.read(_e, "ST"), _S.unary("-", 1)])
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "ph")])
	for _v4 in _S.array(_S.read(_e, "Q")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "q", _v4)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v5, "q"), "sa"), 0)):
			_S.call_value(_S.read(_v5, "arc"), [_S.read(_v5, "p"), _S.read(_v5, "C"), _S.read(_v5, "q"), _S.read(_v5, "ph"), true])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "q", _S.arg(_args, 2))
	_S.define(_e, "ph", _S.arg(_args, 3))
	_S.define(_e, "back", _S.arg(_args, 4))
	_S.define(_e, "prev", null)
	var _v6 = _S.scope(_e)
	_S.define(_v6, "tau", 0)
	while _S.truth(_S.binary("<=", _S.read(_v6, "tau"), _S.prop(_S.read(_v6, "q"), "tl"))):
		var _v7 = _S.scope(_v6)
		var _v8 = _S.call_value(_S.read(_v7, "along"), [_S.read(_v7, "q"), _S.read(_v7, "tau")])
		_S.define(_v7, "x", _S.prop(_v8, 0))
		_S.define(_v7, "y", _S.prop(_v8, 1))
		_S.define(_v7, "u", _S.binary("/", _S.read(_v7, "tau"), _S.prop(_S.read(_v7, "q"), "tl")))
		if _S.truth(_S.logical("&&", _S.read(_v7, "prev"), func(): return _S.binary("<", _S.read(_v7, "u"), 0.66))):
			_S.invoke(_S.read(_v7, "p"), "line", [_S.prop(_S.read(_v7, "prev"), 0), _S.prop(_S.read(_v7, "prev"), 1), _S.read(_v7, "x"), _S.read(_v7, "y"), ((_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.25)) else _S.prop(_S.read(_v7, "C"), 4)) if _S.truth(_S.read(_v7, "back")) else (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.2)) else (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.45)) else _S.prop(_S.read(_v7, "C"), 5))))])
		_S.write(_v7, "prev", [_S.read(_v7, "x"), _S.read(_v7, "y")], "=", false)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "tau", 0.012, "+=", false)
	var _v9 = _S.scope(_e)
	_S.define(_v9, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "k"), 6)):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "u", _S.binary("+", _S.binary("*", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v10, "ph"), 2), _S.binary("/", _S.read(_v10, "k"), 6)), 1), 0.42), 0.58))
		_S.define(_v10, "tau", _S.binary("*", _S.read(_v10, "u"), _S.prop(_S.read(_v10, "q"), "tl")))
		var _v11 = _S.call_value(_S.read(_v10, "along"), [_S.read(_v10, "q"), _S.read(_v10, "tau")])
		_S.define(_v10, "x", _S.prop(_v11, 0))
		_S.define(_v10, "y", _S.prop(_v11, 1))
		_S.define(_v10, "vy", _S.binary("+", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v10, "q"), "vh"), _S.binary("*", _S.read(_v10, "G"), _S.read(_v10, "tau"))), _S.unary("-", 1)), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "q"), "sa"), _S.prop(_S.read(_v10, "q"), "vr")), _S.read(_v10, "SY"))))
		_S.call_value(_S.read(_v10, "bead"), [_S.read(_v10, "p"), _S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("*", _S.prop(_S.read(_v10, "q"), "ca"), _S.prop(_S.read(_v10, "q"), "vr")), _S.read(_v10, "vy"), (1 if _S.truth(_S.read(_v10, "back")) else (2 if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v10, "k"), 3), 0)) else 1)), ([_S.prop(_S.read(_v10, "C"), 0), _S.prop(_S.read(_v10, "C"), 1), _S.prop(_S.read(_v10, "C"), 2), _S.prop(_S.read(_v10, "C"), 2), _S.prop(_S.read(_v10, "C"), 3), _S.prop(_S.read(_v10, "C"), 4), _S.prop(_S.read(_v10, "C"), 5), _S.prop(_S.read(_v10, "C"), 5)] if _S.truth(_S.read(_v10, "back")) else _S.read(_v10, "C"))])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "k", 1, "+=", true)
	_S.define(_e, "g", _S.binary("*", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_e, "ph"), 4), _S.prop(_S.read(_e, "q"), "a")), 1), 0.6))
	var _v12 = _S.call_value(_S.read(_e, "along"), [_S.read(_e, "q"), _S.binary("*", _S.read(_e, "g"), _S.prop(_S.read(_e, "q"), "tl"))])
	_S.define(_e, "gx", _S.prop(_v12, 0))
	_S.define(_e, "gy", _S.prop(_v12, 1))
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "gx"), _S.read(_e, "gy"), _S.read(_e, "WHITE")])
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "gx"), _S.read(_e, "gy"), 3, _S.prop(_S.read(_e, "C"), 5), 0.3])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "Q", _S.call_value(_S.read(_e, "arcs"), [_S.read(_e, "S")]))
	_S.define(_e, "T", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 3.5), _S.binary("-", _S.read(_e, "BY"), 16), 3.5, _S.binary("+", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "LEVEL")), 0.5), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 3), _S.binary("-", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), 1), 3, _S.binary("-", _S.read(_e, "BY"), 16), _S.function_value(_e, "_f7")])
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.binary("-", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), 1), 2.4, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.unary("-", 0.4), _S.binary("-", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), 1.5), 1.4, _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), 22, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.46, _S.binary("*", 0.06, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "T"), 4)])))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), 1), 8, _S.read(_e, "WHITE"), 0.3])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 10, _S.binary("+", _S.read(_e, "S"), 30), _S.function_value(_e, "_f8"), _S.function_value(_e, "_f9")])
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "i"), 4)):
		_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v17, "T"), 3), _S.binary("*", _S.read(_v17, "i"), 1.7))]), 2.5), _S.binary("-", _S.binary("-", _S.read(_v17, "BY"), 16), _S.binary("%", _S.read(_v17, "i"), 2)), (_S.prop(_S.read(_v17, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v17, "i"), 2)) else _S.read(_v17, "WHITE"))])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "+=", true)
	for _v18 in _S.array(_S.read(_e, "Q")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "q", _v18)
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v19, "q"), "sa"), 0)):
			_S.call_value(_S.read(_v19, "arc"), [_S.read(_v19, "p"), _S.read(_v19, "C"), _S.read(_v19, "q"), _S.read(_v19, "ph"), false])
	_S.invoke(_S.read(_e, "Q"), "forEach", [_S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "basin"), [_S.read(_e, "p"), _S.read(_e, "ST"), 1])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.read(_e, "S"), 20), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.binary("-", _S.read(_e, "BY"), 16), 0, _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), 10, _S.prop(_S.read(_e, "C"), 5), 0.18])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "LEVEL")), 2), 46, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.26, _S.binary("*", 0.03, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "T"), 2)])))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "LEVEL")), 20), 30, _S.prop(_S.read(_e, "C"), 5), 0.12])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "w", (3.4 if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "BY"), 14))) else 2.2))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.read(_e, "w"))):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "ST"), 0) if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.binary("-", _S.read(_e, "w"), 0.8)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("-", _S.read(_e, "BY"), 15.5)))) else (_S.prop(_S.read(_e, "ST"), 4) if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.unary("-", 0.6))) else (_S.prop(_S.read(_e, "ST"), 3) if _S.truth(_S.binary("<", _S.read(_e, "x"), 0.8)) else _S.prop(_S.read(_e, "ST"), 2)))), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "BY"), 16), _S.read(_e, "y")), _S.binary("-", _S.read(_e, "JET"), 16)))
	_S.define(_e, "sway", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "T"), 2), _S.binary("*", _S.read(_e, "v"), 5))]), 0.5), _S.read(_e, "v")))
	_S.define(_e, "w", _S.binary("+", _S.binary("+", 1.3, _S.binary("*", 0.5, _S.read(_e, "v"))), _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "T"), 3), _S.binary("*", _S.read(_e, "y"), 0.4))]))))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "sway")), _S.read(_e, "w")))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "q")]), 1)):
		return null
	_S.define(_e, "n", _S.call_value(_S.read(_e, "tileNoise"), [_S.binary("*", _S.read(_e, "x"), 0.9), _S.binary("+", _S.binary("*", _S.read(_e, "y"), 0.15), _S.binary("*", _S.read(_e, "ph"), 16)), 0, 16, _S.read(_e, "S")]))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.unary("-", 0.4))) else ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "n"), _S.unary("-", 0.3))) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.35)) else _S.prop(_S.read(_e, "C"), 5))), "=", false)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.2, 0.35])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "q", _S.prop(_S.read(_e, "Q"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "r"), "next", []), _S.read(_e, "ARCS"))])))
	var _v13 = _S.call_value(_S.read(_e, "along"), [_S.read(_e, "q"), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.1, 0.7]), _S.prop(_S.read(_e, "q"), "tl"))])
	_S.define(_e, "x", _S.prop(_v13, 0))
	_S.define(_e, "y", _S.prop(_v13, 1))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "age")), _S.read(_e, "life"))]))
	if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "q"), "sa"), _S.unary("-", 0.3))):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "WHITE")])
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.6)):
		for _v14 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
			var _v15 = _S.scope(_e)
			var _v16 = _v14
			_S.define(_v15, "dx", _S.prop(_v16, 0))
			_S.define(_v15, "dy", _S.prop(_v16, 1))
			_S.invoke(_S.read(_v15, "p"), "px", [_S.binary("+", _S.read(_v15, "x"), _S.read(_v15, "dx")), _S.binary("+", _S.read(_v15, "y"), _S.read(_v15, "dy")), _S.prop(_S.read(_v15, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 5, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.read(_e, "k"))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "f", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_e, "ph"), 2), _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 9)])), 1))
	var _v20 = _S.call_value(_S.read(_e, "along"), [_S.read(_e, "q"), _S.prop(_S.read(_e, "q"), "tl")])
	_S.define(_e, "x", _S.prop(_v20, 0))
	_S.define(_e, "y", _S.prop(_v20, 1))
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 2, _S.binary("*", _S.read(_e, "f"), 8)), _S.read(_e, "SY"), _S.binary("*", 0.8, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "f")), 1.3])), _S.read(_e, "C"), _S.merge([{"n": 1}, {"half": 1}, {"seed": _S.read(_e, "i")}])])
	_S.define(_e, "g", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_e, "ph"), 6), _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 10)])), 1))
	if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.15)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1), _S.read(_e, "WHITE")])
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "g"), 0.3), func(): return _S.binary(">", _S.prop(_S.read(_e, "q"), "sa"), _S.unary("-", 0.2)))):
		_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 11)]), 0.5), 2)), _S.binary("-", _S.binary("-", _S.read(_e, "y"), 1), _S.binary("*", 3, _S.binary("-", 1, _S.binary("/", _S.read(_e, "g"), 0.3)))), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 6, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.18, _S.binary("-", 1, _S.read(_e, "g")))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.8, 1.4])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "rr", _S.binary("+", _S.invoke(_S.read(_e, "r"), "range", [4, 20]), _S.binary("*", _S.read(_e, "k"), 6)))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "rr")))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("-", _S.read(_e, "BY"), _S.read(_e, "JET")), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 4), 16])), _S.binary("*", _S.read(_e, "k"), 10)))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.75), func(): return _S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), _S.binary("*", _S.binary("-", _S.read(_e, "k"), 0.75), 4)))):
		return null
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.4)) else _S.prop(_S.read(_e, "C"), 6))])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "S", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "ARCS")}]), _S.function_value(_e, "_f14")])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), 0.5), _S.read(_e, "ARCS")), _S.read(_e, "TAU")), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.read(_e, "S")]), 0.25)))
	_S.define(_e, "vr", _S.binary("+", 38, _S.binary("*", 14, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 1)]))))
	_S.define(_e, "vh", _S.binary("+", 30, _S.binary("*", 26, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "S"), 2)]))))
	_S.define(_e, "tl", _S.binary("/", _S.binary("+", _S.read(_e, "vh"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "vh"), _S.read(_e, "vh")), _S.binary("*", _S.binary("*", 2, _S.read(_e, "G")), _S.binary("-", _S.read(_e, "JET"), _S.read(_e, "LEVEL"))))])), _S.read(_e, "G")))
	return _S.merge([{"a": _S.read(_e, "a")}, {"vr": _S.read(_e, "vr")}, {"vh": _S.read(_e, "vh")}, {"tl": _S.read(_e, "tl")}, {"ca": _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")])}, {"sa": _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")])}])

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "tau", _S.arg(_args, 1))
	_S.define(_e, "r", _S.binary("*", _S.prop(_S.read(_e, "q"), "vr"), _S.read(_e, "tau")))
	_S.define(_e, "h", _S.binary("-", _S.binary("+", _S.read(_e, "JET"), _S.binary("*", _S.prop(_S.read(_e, "q"), "vh"), _S.read(_e, "tau"))), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "G")), _S.read(_e, "tau")), _S.read(_e, "tau"))))
	return [_S.binary("*", _S.prop(_S.read(_e, "q"), "ca"), _S.read(_e, "r")), _S.binary("-", _S.binary("+", _S.read(_e, "BY"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "sa"), _S.read(_e, "r")), _S.read(_e, "SY"))), _S.read(_e, "h")), _S.read(_e, "h")]

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rx")), 2), _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "cy")), _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "SY"))), 2)), 1)
