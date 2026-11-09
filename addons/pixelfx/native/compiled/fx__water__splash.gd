@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/splash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "Drops", _S.import_value("fx/water/_lib.js", "Drops"))
	_S.define(_e, "Ripples", _S.import_value("fx/water/_lib.js", "Ripples"))
	_S.define(_e, "Mist", _S.import_value("fx/water/_lib.js", "Mist"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "lace", _S.import_value("fx/water/_lib.js", "lace"))
	_S.define(_e, "pebble", _S.import_value("fx/water/_lib.js", "pebble"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Splash"}, {"desc": "A stone drops into still water: a white hit, a crown that tears into droplets arcing out to plink down with rings, a jet that bounces back, foam and drifting mist."}, {"tags": ["water", "splash", "impact", "drop", "liquid", "one-shot"]}, {"size": [176, 100]}, {"origin": [88, 78]}, {"duration": 2.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"stone": true}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "HIT", 0.16)
	_S.define(_e, "G", 820)
	_S.define(_e, "FINGERS", 12)
	_S.define(_e, "JET", 0.3)
	_S.define(_e, "TEAR", 0.11)
	_S.define(_e, "height", _S.function_value(_e, "_f16"))
	_S.define(_e, "foot", _S.function_value(_e, "_f17"))
	_S.define(_e, "lip", _S.function_value(_e, "_f18"))
	_S.define(_e, "jetH", _S.function_value(_e, "_f19"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "crown", _S.function_value(_e, "_f1"))
	_S.define(_e, "jet", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "rock"), []))
	_S.define(_e, "phi", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "mist", _S.construct(_S.read(_e, "Mist"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rings", _S.construct(_S.read(_e, "Ripples"), [_S.merge([{"sy": _S.read(_e, "SY")}])]))
	_S.define(_e, "plinks", [])
	_S.define(_e, "bubbles", [])
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "FINGERS")}]), _S.function_value(_e, "_f6")]))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"sy": _S.read(_e, "SY")}, {"g": _S.read(_e, "G")}, {"onLand": _S.function_value(_e, "_f7")}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "done", _S.construct(_S.read(_e, "Set"), []))
	_S.define(_e, "once", _S.function_value(_e, "_f8"))
	_S.define(_e, "scallop", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "u")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "h"), 0.7))):
		return null
	_S.define(_e, "r0", _S.call_value(_S.read(_e, "foot"), [_S.read(_e, "u")]))
	_S.define(_e, "rt", _S.call_value(_S.read(_e, "lip"), [_S.read(_e, "u")]))
	_S.define(_e, "white", _S.binary("<", _S.read(_e, "u"), 0.045))
	_S.define(_e, "cells", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "put", _S.function_value(_e, "_f2"))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_e, "rt"), _S.read(_e, "TAU")), 1.6)]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("*", _S.binary("/", _S.read(_v1, "i"), _S.read(_v1, "n")), _S.read(_v1, "TAU")))
		_S.define(_v1, "s", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]))
		_S.define(_v1, "c", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v1, "s"), 0), _S.read(_v1, "back"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "i", 1, "+=", true)
			continue
		_S.define(_v1, "lane", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("/", _S.binary("*", _S.binary("+", _S.read(_v1, "a"), _S.read(_v1, "phi")), _S.read(_v1, "rt")), 2.2)]))
		_S.define(_v1, "streak", _S.binary("<", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "lane"), 31]), 0.3))
		_S.define(_v1, "H", _S.call_value(_S.read(_v1, "scallop"), [_S.read(_v1, "a"), _S.read(_v1, "h")]))
		_S.define(_v1, "keep", _S.binary("-", 1, _S.call_value(_S.read(_v1, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v1, "u"), 0.13), _S.binary("*", 0.14, _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "lane"), 7]))), 0.1)])))
		_S.define(_v1, "steps", _S.binary("+", _S.invoke(_S.read(_v1, "Math"), "ceil", [_S.binary("*", _S.read(_v1, "H"), 1.4)]), 2))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "k", 0)
		while _S.truth(_S.binary("<=", _S.read(_v2, "k"), _S.binary("*", _S.read(_v2, "steps"), _S.read(_v2, "keep")))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "v", _S.binary("/", _S.read(_v3, "k"), _S.read(_v3, "steps")))
			_S.define(_v3, "r", _S.binary("+", _S.read(_v3, "r0"), _S.binary("*", _S.binary("-", _S.read(_v3, "rt"), _S.read(_v3, "r0")), _S.invoke(_S.read(_v3, "Math"), "pow", [_S.read(_v3, "v"), 2.2]))))
			_S.define(_v3, "x", _S.binary("*", _S.read(_v3, "c"), _S.read(_v3, "r")))
			_S.define(_v3, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "r")), _S.read(_v3, "SY")), _S.binary("*", _S.read(_v3, "H"), _S.read(_v3, "v"))))
			if _S.truth(_S.read(_v3, "white")):
				_S.call_value(_S.read(_v3, "put"), [_S.read(_v3, "x"), _S.read(_v3, "y"), _S.read(_v3, "WHITE"), 1, 3])
			else:
				if _S.truth(_S.read(_v3, "back")):
					_S.call_value(_S.read(_v3, "put"), [_S.read(_v3, "x"), _S.read(_v3, "y"), ((_S.prop(_S.read(_v3, "C"), 5) if _S.truth(_S.read(_v3, "streak")) else _S.prop(_S.read(_v3, "C"), 4)) if _S.truth(_S.binary(">", _S.read(_v3, "v"), 0.72)) else (_S.prop(_S.read(_v3, "C"), 3) if _S.truth(_S.read(_v3, "streak")) else _S.prop(_S.read(_v3, "C"), 2))), 1, 1])
				else:
					if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "c")]), 0.9)):
						_S.call_value(_S.read(_v3, "put"), [_S.read(_v3, "x"), _S.read(_v3, "y"), ((_S.read(_v3, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.read(_v3, "c")]), 0.97)) else _S.prop(_S.read(_v3, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_v3, "c"), 0)) else _S.prop(_S.read(_v3, "C"), 4)), 1, 2])
					else:
						if _S.truth(_S.binary("<", _S.read(_v3, "v"), 0.1)):
							_S.call_value(_S.read(_v3, "put"), [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.read(_v3, "WHITE") if _S.truth(_S.binary("<", _S.read(_v3, "v"), 0.05)) else _S.prop(_S.read(_v3, "C"), 6)), 1, 2])
						else:
							if _S.truth(_S.read(_v3, "streak")):
								_S.call_value(_S.read(_v3, "put"), [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v3, "c"), _S.unary("-", 0.2))) else _S.prop(_S.read(_v3, "C"), 5)), 1, 1])
							else:
								_S.call_value(_S.read(_v3, "put"), [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.prop(_S.read(_v3, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v3, "c"), 0)) else _S.prop(_S.read(_v3, "C"), 4)), 0.22, 0])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "k", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v1, "white")), func(): return _S.binary(">=", _S.read(_v1, "keep"), 1))):
			var _v4 = _S.scope(_v1)
			_S.define(_v4, "x", _S.binary("*", _S.read(_v4, "c"), _S.read(_v4, "rt")))
			_S.define(_v4, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "rt")), _S.read(_v4, "SY")), _S.read(_v4, "H")))
			_S.call_value(_S.read(_v4, "put"), [_S.read(_v4, "x"), _S.read(_v4, "y"), (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.read(_v4, "back")) else (_S.read(_v4, "WHITE") if _S.truth(_S.binary("<", _S.read(_v4, "c"), 0.45)) else _S.prop(_S.read(_v4, "C"), 6))), 1, 3])
			if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v4, "back")), func(): return _S.binary("<", _S.read(_v4, "c"), 0.2))):
				_S.call_value(_S.read(_v4, "put"), [_S.read(_v4, "x"), _S.binary("+", _S.read(_v4, "y"), 1), _S.prop(_S.read(_v4, "C"), 6), 1, 2])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	for _v5 in _S.array(_S.invoke(_S.read(_e, "cells"), "values", [])):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "q", _v5)
		var _v7 = _S.scope(_v6)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v7, "q"), "r"), 0)):
			_S.invoke(_S.read(_v7, "p"), "blend", [_S.prop(_S.read(_v7, "q"), "x"), _S.prop(_S.read(_v7, "q"), "y"), _S.prop(_S.read(_v7, "q"), "c"), _S.prop(_S.read(_v7, "q"), "a")])
		else:
			_S.invoke(_S.read(_v7, "p"), "px", [_S.prop(_S.read(_v7, "q"), "x"), _S.prop(_S.read(_v7, "q"), "y"), _S.prop(_S.read(_v7, "q"), "c")])
	_S.define(_e, "reach", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "TEAR"), _S.binary("+", _S.read(_e, "TEAR"), 0.1), _S.read(_e, "u")])))
	for _v8 in _S.array(_S.read(_e, "spikes")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "f", _v8)
		var _v10 = _S.scope(_v9)
		if _S.truth(_S.logical("||", _S.binary("!==", _S.binary("<", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.prop(_S.read(_v10, "f"), "a")]), 0), _S.read(_v10, "back")), func(): return _S.binary("<=", _S.read(_v10, "reach"), 0))):
			continue
		_S.define(_v10, "H", _S.call_value(_S.read(_v10, "scallop"), [_S.prop(_S.read(_v10, "f"), "a"), _S.read(_v10, "h")]))
		_S.define(_v10, "L", _S.binary("*", _S.binary("*", _S.read(_v10, "h"), _S.prop(_S.read(_v10, "f"), "L")), _S.read(_v10, "reach")))
		_S.define(_v10, "x0", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.prop(_S.read(_v10, "f"), "a")]), _S.read(_v10, "rt")))
		_S.define(_v10, "y0", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.prop(_S.read(_v10, "f"), "a")]), _S.read(_v10, "rt")), _S.read(_v10, "SY")), _S.read(_v10, "H")))
		_S.define(_v10, "x1", _S.binary("+", _S.read(_v10, "x0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.prop(_S.read(_v10, "f"), "a")]), _S.read(_v10, "L")), 0.45)))
		_S.define(_v10, "y1", _S.binary("-", _S.read(_v10, "y0"), _S.read(_v10, "L")))
		if _S.truth(_S.binary(">=", _S.read(_v10, "L"), 1)):
			_S.invoke(_S.read(_v10, "p"), "line", [_S.read(_v10, "x0"), _S.read(_v10, "y0"), _S.read(_v10, "x1"), _S.read(_v10, "y1"), (_S.read(_v10, "WHITE") if _S.truth(_S.read(_v10, "white")) else (_S.prop(_S.read(_v10, "C"), 4) if _S.truth(_S.read(_v10, "back")) else _S.prop(_S.read(_v10, "C"), 6)))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v10, "u"), 0.04), func(): return _S.binary("<", _S.read(_v10, "u"), _S.read(_v10, "TEAR")))):
			_S.call_value(_S.read(_v10, "bead"), [_S.read(_v10, "p"), _S.binary("-", _S.read(_v10, "x1"), (0 if _S.truth(_S.read(_v10, "back")) else 0.5)), _S.binary("-", _S.read(_v10, "y1"), 1), 0, _S.unary("-", 1), (1 if _S.truth(_S.read(_v10, "back")) else 2), _S.read(_v10, "C")])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v10, "back")), func(): return _S.binary(">", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.prop(_S.read(_v10, "f"), "a")]), 0.3))):
			_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "x0"), _S.read(_v10, "y0"), 6, _S.prop(_S.read(_v10, "C"), 5), _S.binary("*", 0.22, _S.read(_v10, "reach"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	_S.define(_e, "rank", _S.arg(_args, 4))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	_S.define(_e, "key", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_e, "Y"), 4096), 8192), _S.read(_e, "X")), 4096))
	_S.define(_e, "cur", _S.invoke(_S.read(_e, "cells"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "cur")), func(): return _S.binary(">", _S.read(_e, "rank"), _S.prop(_S.read(_e, "cur"), "r")))):
		_S.invoke(_S.read(_e, "cells"), "set", [_S.read(_e, "key"), _S.merge([{"x": _S.read(_e, "X")}, {"y": _S.read(_e, "Y")}, {"c": _S.read(_e, "c")}, {"a": _S.read(_e, "a")}, {"r": _S.read(_e, "rank")}])])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")), _S.read(_e, "JET")))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "jetH"), [_S.read(_e, "u")]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "h"), 0.8))):
		return null
	_S.define(_e, "top", _S.unary("-", _S.read(_e, "h")))
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, 0, 5, 2.4, _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 3), _S.binary("-", _S.read(_e, "top"), 2), 3, 0, _S.function_value(_e, "_f5")])
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.12)):
		var _v11 = _S.scope(_e)
		_S.invoke(_S.read(_v11, "p"), "circle", [0, _S.binary("-", _S.read(_v11, "top"), 1), 1.7, _S.prop(_S.read(_v11, "C"), 5)])
		_S.invoke(_S.read(_v11, "p"), "circle", [_S.unary("-", 0.3), _S.binary("-", _S.read(_v11, "top"), 1.3), 1.1, _S.prop(_S.read(_v11, "C"), 6)])
		_S.invoke(_S.read(_v11, "p"), "px", [_S.unary("-", 1), _S.binary("-", _S.read(_v11, "top"), 2), _S.read(_v11, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.unary("-", 1), 0, _S.read(_e, "top"), 7, _S.prop(_S.read(_e, "C"), 5), 0.3])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (null if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)) else (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.5)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 0)) else _S.prop(_S.read(_e, "C"), 5))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "v", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), _S.read(_e, "h"))]))
	_S.define(_e, "w", _S.binary("+", 1.15, _S.binary("*", _S.binary("*", _S.binary("*", 1.5, _S.read(_e, "v")), _S.read(_e, "v")), _S.read(_e, "v"))))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "w")))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "q")]), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.unary("-", 0.5))) else (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.3)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.72)) else _S.prop(_S.read(_e, "C"), 4)))), "=", false)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("%", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "TAU")), _S.read(_e, "FINGERS")), _S.read(_e, "phi")), _S.read(_e, "TAU"))}, {"L": _S.invoke(_S.read(_e, "R"), "range", [0.2, 0.36])}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "rings"), "add", [_S.prop(_S.read(_e, "d"), "x"), _S.prop(_S.read(_e, "d"), "z"), 0.6, _S.binary("+", 2, _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 1.8)), _S.binary("+", 0.34, _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 0.1)), _S.merge([{"n": 1}, {"k": 0.95}, {"hot": 0.06}])])
	_S.invoke(_S.read(_e, "plinks"), "push", [_S.merge([{"x": _S.prop(_S.read(_e, "d"), "x")}, {"y": _S.binary("*", _S.prop(_S.read(_e, "d"), "z"), _S.read(_e, "SY"))}, {"s": _S.prop(_S.read(_e, "d"), "s")}, {"age": 0}])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "d"), "s"), 1), func(): return _S.unary("!", _S.prop(_S.read(_e, "d"), "small")))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.prop(_S.read(_v12, "d"), "s"))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
			_S.define(_v13, "v", _S.invoke(_S.read(_v13, "R"), "range", [10, 34]))
			_S.invoke(_S.read(_v13, "drops"), "add", [_S.merge([{"x": _S.prop(_S.read(_v13, "d"), "x")}, {"z": _S.prop(_S.read(_v13, "d"), "z")}, {"h": 0.5}, {"vx": _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "v"))}, {"vh": _S.invoke(_S.read(_v13, "R"), "range", [55, 110])}, {"s": 1}, {"small": true}, {"life": 1}])])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "key", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.invoke(_S.read(_e, "done"), "has", [_S.read(_e, "key")])), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "at"))), func(): return _S.invoke(_S.read(_e, "done"), "add", [_S.read(_e, "key")]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "h", _S.arg(_args, 1))
	return _S.binary("*", _S.read(_e, "h"), _S.binary("+", 0.86, _S.binary("*", 0.14, _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 2.2), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 1.3)), _S.binary("*", _S.read(_e, "phi"), 3)), _S.prop(_S.read(_e, "o"), "seed")]))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["hit", _S.read(_e, "HIT")])):
		var _v14 = _S.scope(_e)
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.unary("-", 6), 52, _S.prop(_S.read(_v14, "C"), 5), 0.6, 0.45])
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.unary("-", 4), 16, _S.read(_v14, "WHITE"), 0.5, 0.08])
		_S.invoke(_S.read(_v14, "rings"), "add", [0, 0, 8, 56, 2, _S.merge([{"n": 2}, {"gap": 3.4}, {"k": 1.35}, {"hot": 0.16}, {"glint": 1}])])
		_S.invoke(_S.read(_v14, "rings"), "add", [0, 0, 5, 38, 1.7, _S.merge([{"n": 1}, {"k": 0.9}, {"delay": 0.14}])])
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 20)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")]))
			_S.define(_v16, "v", _S.invoke(_S.read(_v16, "R"), "range", [50, 125]))
			_S.invoke(_S.read(_v16, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), 3)}, {"z": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), 3)}, {"h": _S.invoke(_S.read(_v16, "R"), "range", [1, 6])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "v"))}, {"vh": _S.invoke(_S.read(_v16, "R"), "range", [160, 270])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.25])) else 1)}, {"delay": _S.invoke(_S.read(_v16, "R"), "range", [0, 0.04])}])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v14)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 9)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "s", (1 if _S.truth(_S.binary("%", _S.read(_v18, "i"), 2)) else _S.unary("-", 1)))
			_S.define(_v18, "x", _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [4, 12])))
			_S.invoke(_S.read(_v18, "mist"), "add", [_S.read(_v18, "x"), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [1, 7])), _S.binary("*", _S.read(_v18, "s"), _S.invoke(_S.read(_v18, "R"), "range", [25, 70])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [4, 16])), _S.invoke(_S.read(_v18, "R"), "range", [2.5, 4]), _S.invoke(_S.read(_v18, "R"), "range", [7, 11]), _S.invoke(_S.read(_v18, "R"), "range", [0.9, 1.5]), (_S.prop(_S.read(_v18, "C"), 6) if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.5])) else _S.prop(_S.read(_v18, "C"), 5)), _S.invoke(_S.read(_v18, "R"), "range", [0.3, 0.42]), _S.invoke(_S.read(_v18, "R"), "range", [0, 0.1])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["spray", _S.binary("+", _S.read(_e, "HIT"), 0.04)])):
		var _v19 = _S.scope(_e)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 20)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")]))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "FLAKE"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), 9), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), 9), _S.read(_v21, "SY")), _S.invoke(_S.read(_v21, "R"), "range", [6, 15])), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.invoke(_S.read(_v21, "R"), "range", [25, 90])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 100])), _S.invoke(_S.read(_v21, "R"), "range", [0.7, 1.3]), (_S.read(_v21, "WHITE") if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.5])) else _S.prop(_S.read(_v21, "C"), 6)), _S.invoke(_S.read(_v21, "R"), "range", [0.6, 1.5])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v19)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 5)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 13), 13]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [6, 20])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v22, "R"), "range", [0.25, 0.55]), _S.prop(_S.read(_v22, "C"), 6), _S.invoke(_S.read(_v22, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v22, "R"), "range", [0, 0.15])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["tear", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "TEAR"))])):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "h", _S.call_value(_S.read(_v23, "height"), [_S.read(_v23, "TEAR")]))
		_S.define(_v23, "rt", _S.call_value(_S.read(_v23, "lip"), [_S.read(_v23, "TEAR")]))
		for _v24 in _S.array(_S.read(_v23, "spikes")):
			var _v25 = _S.scope(_v23)
			_S.define(_v25, "f", _v24)
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.binary("+", _S.prop(_S.read(_v26, "f"), "a"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.08), 0.08])))
			_S.define(_v26, "v", _S.invoke(_S.read(_v26, "R"), "range", [32, 88]))
			_S.define(_v26, "L", _S.binary("*", _S.read(_v26, "h"), _S.prop(_S.read(_v26, "f"), "L")))
			_S.invoke(_S.read(_v26, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.prop(_S.read(_v26, "f"), "a")]), _S.binary("+", _S.read(_v26, "rt"), _S.binary("*", _S.read(_v26, "L"), 0.45)))}, {"z": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.prop(_S.read(_v26, "f"), "a")]), _S.read(_v26, "rt"))}, {"h": _S.binary("+", _S.binary("+", _S.read(_v26, "h"), _S.read(_v26, "L")), 1)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "v"))}, {"vh": _S.invoke(_S.read(_v26, "R"), "range", [90, 190])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.3])) else 2)}])])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0.13), func(): return _S.binary("<", _S.read(_e, "u"), 0.3)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.3]))):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
		_S.define(_v27, "rt", _S.call_value(_S.read(_v27, "lip"), [_S.read(_v27, "u")]))
		_S.define(_v27, "v", _S.invoke(_S.read(_v27, "R"), "range", [15, 45]))
		_S.invoke(_S.read(_v27, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "rt"))}, {"z": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "rt"))}, {"h": _S.binary("*", _S.call_value(_S.read(_v27, "scallop"), [_S.read(_v27, "a"), _S.call_value(_S.read(_v27, "height"), [_S.read(_v27, "u")])]), _S.invoke(_S.read(_v27, "R"), "range", [0.6, 1]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vh": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 10), 45])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.3])) else 1)}])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["fall", _S.binary("+", _S.read(_e, "HIT"), 0.3)])):
		var _v28 = _S.scope(_e)
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 8)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")]))
			_S.define(_v30, "r", _S.call_value(_S.read(_v30, "lip"), [0.3]))
			_S.define(_v30, "v", _S.invoke(_S.read(_v30, "R"), "range", [15, 40]))
			_S.invoke(_S.read(_v30, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "r"))}, {"z": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "r"))}, {"h": _S.invoke(_S.read(_v30, "R"), "range", [3, 7])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "v"))}, {"vh": _S.invoke(_S.read(_v30, "R"), "range", [30, 80])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.4])) else 1)}])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["bead", _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "JET")), 0.12)])):
		var _v31 = _S.scope(_e)
		_S.invoke(_S.read(_v31, "drops"), "add", [_S.merge([{"x": 0}, {"z": 0.2}, {"h": _S.binary("+", _S.call_value(_S.read(_v31, "jetH"), [0.12]), 1)}, {"vx": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 6), 6])}, {"vz": 0}, {"vh": 55}, {"s": 3}])])
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), 3)):
			_S.invoke(_S.read(_v32, "mist"), "add", [_S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("+", _S.unary("-", _S.call_value(_S.read(_v32, "jetH"), [0.12])), _S.invoke(_S.read(_v32, "R"), "range", [2, 8])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [4, 12])), 2, _S.invoke(_S.read(_v32, "R"), "range", [4, 6]), _S.invoke(_S.read(_v32, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v32, "C"), 6), 0.3])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["slump", _S.binary("+", _S.binary("+", _S.read(_e, "HIT"), _S.read(_e, "JET")), 0.38)])):
		var _v33 = _S.scope(_e)
		_S.invoke(_S.read(_v33, "rings"), "add", [0, 0, 3, 30, 1.5, _S.merge([{"n": 2}, {"gap": 2.6}, {"k": 0.9}])])
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v34, "i"), 4)):
			_S.invoke(_S.read(_v34, "mist"), "add", [_S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [1, 4])), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [3, 10])), 2.5, _S.invoke(_S.read(_v34, "R"), "range", [6, 9]), _S.invoke(_S.read(_v34, "R"), "range", [0.8, 1.2]), _S.prop(_S.read(_v34, "C"), 5), 0.28])
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "+=", true)
	for _v35 in _S.array([[0, 0.95], [1, 1.2], [2, 1.5]]):
		var _v36 = _S.scope(_e)
		var _v37 = _v35
		_S.define(_v36, "i", _S.prop(_v37, 0))
		_S.define(_v36, "at", _S.prop(_v37, 1))
		if _S.truth(_S.call_value(_S.read(_v36, "once"), [_S.binary("+", "glug", _S.read(_v36, "i")), _S.binary("+", _S.read(_v36, "HIT"), _S.read(_v36, "at"))])):
			_S.invoke(_S.read(_v36, "bubbles"), "push", [_S.merge([{"x": _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 5), 5])}, {"z": _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 6), 6])}, {"t0": _S.read(_v36, "t")}, {"r": _S.invoke(_S.read(_v36, "R"), "range", [1.3, 2.3])}, {"popped": false}])])
	for _v38 in _S.array(_S.read(_e, "bubbles")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "b", _v38)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v39, "b"), "popped")), func(): return _S.binary(">", _S.binary("-", _S.read(_v39, "t"), _S.prop(_S.read(_v39, "b"), "t0")), 0.2))):
			var _v40 = _S.scope(_v39)
			_S.set_prop(_S.read(_v40, "b"), "popped", true, "=", false)
			_S.invoke(_S.read(_v40, "rings"), "add", [_S.prop(_S.read(_v40, "b"), "x"), _S.prop(_S.read(_v40, "b"), "z"), 1, 7, 0.6, _S.merge([{"n": 1}, {"k": 0.9}])])
			_S.invoke(_S.read(_v40, "plinks"), "push", [_S.merge([{"x": _S.prop(_S.read(_v40, "b"), "x")}, {"y": _S.binary("*", _S.prop(_S.read(_v40, "b"), "z"), _S.read(_v40, "SY"))}, {"s": 1}, {"age": 0}])])
			var _v41 = _S.scope(_v40)
			_S.define(_v41, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v41, "i"), 2)):
				_S.invoke(_S.read(_v41, "drops"), "add", [_S.merge([{"x": _S.prop(_S.read(_v41, "b"), "x")}, {"z": _S.prop(_S.read(_v41, "b"), "z")}, {"h": 1}, {"vx": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 20), 20])}, {"vz": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 10), 10])}, {"vh": _S.invoke(_S.read(_v41, "R"), "range", [50, 90])}, {"s": 1}, {"small": true}, {"life": 1}])])
				_v41 = _S.iteration(_v41)
				_S.write(_v41, "i", 1, "+=", true)
	var _v42 = _S.scope(_e)
	_S.define(_v42, "i", _S.binary("-", _S.prop(_S.read(_v42, "plinks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v42, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v42, "plinks"), _S.read(_v42, "i")), "age", _S.read(_v42, "dt"), "+=", false), 0.14)):
			_S.invoke(_S.read(_v42, "plinks"), "splice", [_S.read(_v42, "i"), 1])
		_v42 = _S.iteration(_v42)
		_S.write(_v42, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rings"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "mist"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.26))):
		var _v43 = _S.scope(_e)
		_S.define(_v43, "r", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v43, "foot"), [_S.read(_v43, "u")]), 0.85), _S.binary("-", 1, _S.call_value(_S.read(_v43, "smooth"), [0.12, 0.26, _S.read(_v43, "u")]))))
		_S.invoke(_S.read(_v43, "p"), "ellipse", [0, 0, _S.read(_v43, "r"), _S.binary("+", _S.binary("*", _S.read(_v43, "r"), _S.read(_v43, "SY")), 0.6), _S.function_value(_v43, "_f12")])
	_S.invoke(_S.read(_e, "rings"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), _S.unary("-", 1)])
	_S.call_value(_S.read(_e, "crown"), [_S.read(_e, "p"), true])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), "back"])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0)) else _S.prop(_S.read(_e, "C"), 2))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "HIT")))
	_S.invoke(_S.read(_e, "rings"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), 1])
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.2)):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "rx", _S.binary("+", 4, _S.binary("*", 11, _S.invoke(_S.read(_v44, "ease"), "outCubic", [_S.call_value(_S.read(_v44, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v44, "u"), 0.2), 0.7)])]))))
		_S.define(_v44, "k", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v44, "smooth"), [0.2, 0.32, _S.read(_v44, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_v44, "smooth"), [0.5, 2, _S.read(_v44, "u")]))), 0.9))
		_S.call_value(_S.read(_v44, "lace"), [_S.read(_v44, "p"), 0, 0, _S.read(_v44, "rx"), _S.binary("+", _S.binary("*", _S.read(_v44, "rx"), _S.read(_v44, "SY")), 0.5), _S.read(_v44, "k"), _S.read(_v44, "C"), _S.read(_v44, "t"), _S.prop(_S.read(_v44, "o"), "seed")])
	_S.call_value(_S.read(_e, "crown"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "jet"), [_S.read(_e, "p")])
	for _v45 in _S.array(_S.read(_e, "bubbles")):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "b", _v45)
		var _v47 = _S.scope(_v46)
		_S.define(_v47, "g", _S.binary("/", _S.binary("-", _S.read(_v47, "t"), _S.prop(_S.read(_v47, "b"), "t0")), 0.2))
		if _S.truth(_S.binary(">", _S.read(_v47, "g"), 1)):
			continue
		_S.define(_v47, "r", _S.binary("*", _S.prop(_S.read(_v47, "b"), "r"), _S.invoke(_S.read(_v47, "ease"), "outBack", [_S.read(_v47, "g")])))
		_S.define(_v47, "x", _S.prop(_S.read(_v47, "b"), "x"))
		_S.define(_v47, "y", _S.binary("*", _S.prop(_S.read(_v47, "b"), "z"), _S.read(_v47, "SY")))
		var _v48 = _S.scope(_v47)
		_S.define(_v48, "a", _S.prop(_S.read(_v48, "Math"), "PI"))
		while _S.truth(_S.binary("<=", _S.read(_v48, "a"), _S.binary("+", _S.read(_v48, "TAU"), 0.01))):
			_S.invoke(_S.read(_v48, "p"), "dot", [_S.binary("+", _S.read(_v48, "x"), _S.binary("*", _S.invoke(_S.read(_v48, "Math"), "cos", [_S.read(_v48, "a")]), _S.read(_v48, "r"))), _S.binary("+", _S.read(_v48, "y"), _S.binary("*", _S.invoke(_S.read(_v48, "Math"), "sin", [_S.read(_v48, "a")]), _S.read(_v48, "r"))), _S.prop(_S.read(_v48, "C"), 6)])
			_v48 = _S.iteration(_v48)
			_S.write(_v48, "a", _S.binary("/", 0.5, _S.invoke(_S.read(_v48, "Math"), "max", [1, _S.read(_v48, "r")])), "+=", false)
		_S.invoke(_S.read(_v47, "p"), "px", [_S.binary("-", _S.read(_v47, "x"), _S.binary("*", _S.read(_v47, "r"), 0.4)), _S.binary("-", _S.read(_v47, "y"), _S.binary("*", _S.read(_v47, "r"), 0.6)), _S.read(_v47, "WHITE")])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.read(_v47, "x"), _S.binary("-", _S.read(_v47, "y"), 1), 4, _S.prop(_S.read(_v47, "C"), 5), 0.25])
	for _v49 in _S.array(_S.read(_e, "plinks")):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "q", _v49)
		var _v51 = _S.scope(_v50)
		_S.define(_v51, "k", _S.binary("/", _S.prop(_S.read(_v51, "q"), "age"), 0.14))
		if _S.truth(_S.binary("<", _S.read(_v51, "k"), 0.5)):
			_S.invoke(_S.read(_v51, "p"), "px", [_S.prop(_S.read(_v51, "q"), "x"), _S.prop(_S.read(_v51, "q"), "y"), _S.read(_v51, "WHITE")])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v51, "q"), "s"), 1)):
			_S.invoke(_S.read(_v51, "p"), "line", [_S.prop(_S.read(_v51, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v51, "q"), "y"), 1), _S.prop(_S.read(_v51, "q"), "x"), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v51, "q"), "y"), 1), _S.binary("*", 3, _S.binary("-", 1, _S.read(_v51, "k")))), (_S.read(_v51, "WHITE") if _S.truth(_S.binary("<", _S.read(_v51, "k"), 0.4)) else _S.prop(_S.read(_v51, "C"), 6))])
		_S.invoke(_S.read(_v51, "p"), "glow", [_S.prop(_S.read(_v51, "q"), "x"), _S.prop(_S.read(_v51, "q"), "y"), 4, _S.prop(_S.read(_v51, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v51, "k")))])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), "front"])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.07))):
		var _v52 = _S.scope(_e)
		_S.invoke(_S.read(_v52, "p"), "ellipse", [0, 0, 10, 2.4, _S.function_value(_v52, "_f14")])
		_S.call_value(_S.read(_v52, "sparkle"), [_S.read(_v52, "p"), 0, _S.unary("-", 3), _S.binary("*", 5, _S.binary("-", 1, _S.binary("/", _S.read(_v52, "u"), 0.07))), _S.prop(_S.read(_v52, "C"), 6), _S.prop(_S.read(_v52, "C"), 5), 0.5])
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "o"), "stone"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v53 = _S.scope(_e)
		_S.define(_v53, "v", _S.binary("/", _S.read(_v53, "t"), _S.read(_v53, "HIT")))
		_S.define(_v53, "y", _S.binary("+", _S.unary("-", 70), _S.binary("*", 70, _S.binary("+", _S.binary("*", 0.4, _S.read(_v53, "v")), _S.binary("*", _S.binary("*", 0.6, _S.read(_v53, "v")), _S.read(_v53, "v"))))))
		_S.invoke(_S.read(_v53, "p"), "line", [0, _S.binary("-", _S.read(_v53, "y"), 12), 0, _S.binary("-", _S.read(_v53, "y"), 3), _S.prop(_S.read(_v53, "ST"), 4), _S.function_value(_v53, "_f15")])
		_S.call_value(_S.read(_v53, "pebble"), [_S.read(_v53, "p"), 0, _S.read(_v53, "y"), 2.6, _S.read(_v53, "ST")])
	_S.invoke(_S.read(_e, "mist"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0)):
		var _v54 = _S.scope(_e)
		_S.invoke(_S.read(_v54, "p"), "glow", [0, _S.unary("-", 2), 34, _S.prop(_S.read(_v54, "C"), 4), _S.binary("*", 0.2, _S.binary("-", 1, _S.call_value(_S.read(_v54, "smooth"), [0, 1.6, _S.read(_v54, "u")])))])
		_S.invoke(_S.read(_v54, "p"), "glow", [0, 2, 64, _S.prop(_S.read(_v54, "C"), 3), _S.binary("*", 0.16, _S.binary("-", 1, _S.call_value(_S.read(_v54, "smooth"), [0.1, 2.1, _S.read(_v54, "u")])))])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "C"), 6))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "w", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "w"), 0.8)

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", 19, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 0.09)])])), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.12), 0.3)])])))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", 3, _S.binary("*", 7.5, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 0.45)])])))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.call_value(_S.read(_e, "foot"), [_S.read(_e, "u")]), _S.binary("*", _S.call_value(_S.read(_e, "height"), [_S.read(_e, "u")]), 0.42)), _S.binary("*", 3, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 0.25)])])))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", 26, _S.binary("-", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 0.12)])]), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "u"), 0.15), 0.28)])])))
