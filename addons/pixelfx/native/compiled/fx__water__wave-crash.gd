@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/wave-crash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "Drops", _S.import_value("fx/water/_lib.js", "Drops"))
	_S.define(_e, "Ripples", _S.import_value("fx/water/_lib.js", "Ripples"))
	_S.define(_e, "Mist", _S.import_value("fx/water/_lib.js", "Mist"))
	_S.define(_e, "billow", _S.import_value("fx/water/_lib.js", "billow"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Wave crash"}, {"desc": "A swell rolls in and steepens, its lip throws forward and curls over a dark barrel, then crashes into a burst of white foam and spray that surges on and fades to lace."}, {"tags": ["water", "wave", "crash", "surf", "foam", "spray", "one-shot"]}, {"size": [224, 104]}, {"origin": [112, 86]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "G", 820)
	_S.define(_e, "CRASH", 1.2)
	_S.define(_e, "LIP0", 0.62)
	_S.define(_e, "EDGE", 110)
	_S.define(_e, "crestX", _S.function_value(_e, "_f12"))
	_S.define(_e, "crestH", _S.function_value(_e, "_f13"))
	_S.define(_e, "faceW", _S.function_value(_e, "_f14"))
	_S.define(_e, "lipK", _S.function_value(_e, "_f15"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "body", _S.function_value(_e, "_f1"))
	_S.define(_e, "curl", _S.function_value(_e, "_f2"))
	_S.define(_e, "sea", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "mist", _S.construct(_S.read(_e, "Mist"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rings", _S.construct(_S.read(_e, "Ripples"), [_S.merge([{"sy": _S.read(_e, "SY")}])]))
	_S.define(_e, "puffs", [])
	_S.define(_e, "plinks", [])
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"sy": _S.read(_e, "SY")}, {"g": _S.read(_e, "G")}, {"onLand": _S.function_value(_e, "_f4")}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "crashed", false)
	_S.define(_e, "height", _S.function_value(_e, "_f5"))
	_S.define(_e, "lip", _S.function_value(_e, "_f6"))
	_S.define(_e, "puff", _S.function_value(_e, "_f7"))
	return _S.merge([{"update": _S.function_value(_e, "_f8")}, {"drawBack": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.arg(_args, 1))
	_S.define(_e, "xc", _S.call_value(_S.read(_e, "crestX"), [_S.read(_e, "t")]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "crestH"), [_S.read(_e, "t")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "X", _S.unary("-", _S.read(_v0, "EDGE")))
	while _S.truth(_S.binary("<", _S.read(_v0, "X"), _S.read(_v0, "EDGE"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.binary("+", _S.read(_v1, "X"), 0.5))
		_S.define(_v1, "h", _S.call_value(_S.read(_v1, "height"), [_S.read(_v1, "x"), _S.read(_v1, "t")]))
		_S.define(_v1, "edge", _S.binary("-", 1, _S.call_value(_S.read(_v1, "smooth"), [_S.binary("-", _S.read(_v1, "EDGE"), 24), _S.read(_v1, "EDGE"), _S.invoke(_S.read(_v1, "Math"), "abs", [_S.read(_v1, "x")])])))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v1, "h"), 0.6), func(): return _S.binary("<=", _S.read(_v1, "edge"), 0))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "X", 1, "+=", true)
			continue
		_S.define(_v1, "face", _S.binary(">", _S.read(_v1, "x"), _S.read(_v1, "xc")))
		_S.define(_v1, "near", _S.invoke(_S.read(_v1, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v1, "x"), _S.read(_v1, "xc")), 9), 2))]))
		_S.define(_v1, "a", _S.binary("*", _S.binary("*", _S.read(_v1, "fade"), _S.read(_v1, "edge")), 1.4))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "Y", _S.invoke(_S.read(_v2, "Math"), "floor", [_S.unary("-", _S.read(_v2, "h"))]))
		while _S.truth(_S.binary("<", _S.read(_v2, "Y"), 0)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "y", _S.binary("+", _S.read(_v3, "Y"), 0.5))
			_S.define(_v3, "u", _S.binary("/", _S.binary("+", _S.read(_v3, "y"), _S.read(_v3, "h")), _S.read(_v3, "h")))
			_S.define(_v3, "depth", _S.binary("+", _S.read(_v3, "y"), _S.read(_v3, "h")))
			_S.define(_v3, "c", null)
			if _S.truth(_S.binary("<", _S.read(_v3, "depth"), 1)):
				_S.write(_v3, "c", (_S.read(_v3, "WHITE") if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v3, "near"), 0.5), func(): return _S.binary(">", _S.read(_v3, "A"), 14)), func(): return _S.binary(">", _S.call_value(_S.read(_v3, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v3, "x"), 0.6), _S.binary("*", _S.read(_v3, "t"), 9)), _S.read(_v3, "S")]), _S.unary("-", 0.35)))) else (_S.prop(_S.read(_v3, "C"), 5) if _S.truth(_S.read(_v3, "face")) else _S.prop(_S.read(_v3, "C"), 6))), "=", false)
			else:
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v3, "depth"), 2.4), func(): return _S.binary(">", _S.read(_v3, "near"), 0.35)), func(): return _S.binary(">", _S.read(_v3, "A"), 14))):
					_S.write(_v3, "c", (_S.read(_v3, "WHITE") if _S.truth(_S.binary(">", _S.call_value(_S.read(_v3, "noise2"), [_S.binary("*", _S.read(_v3, "x"), 0.5), _S.binary("+", _S.binary("*", _S.read(_v3, "y"), 0.5), _S.binary("*", _S.read(_v3, "t"), 6)), _S.binary("+", _S.read(_v3, "S"), 1)]), _S.unary("-", 0.1))) else _S.prop(_S.read(_v3, "C"), 6)), "=", false)
				else:
					var _v4 = _S.scope(_v3)
					_S.define(_v4, "win", _S.binary("*", _S.binary("*", _S.read(_v4, "near"), _S.binary("-", 1, _S.read(_v4, "u"))), 1.6))
					_S.define(_v4, "up", _S.call_value(_S.read(_v4, "noise2"), [_S.binary("*", _S.binary("-", _S.binary("*", _S.read(_v4, "x"), 0.9), _S.binary("*", _S.read(_v4, "y"), 0.35)), 0.8), _S.binary("+", _S.binary("*", _S.read(_v4, "y"), 0.12), _S.binary("*", _S.read(_v4, "t"), 5)), _S.binary("+", _S.read(_v4, "S"), 2)]))
					_S.define(_v4, "wind", _S.call_value(_S.read(_v4, "noise2"), [_S.binary("-", _S.binary("*", _S.read(_v4, "x"), 0.18), _S.binary("*", _S.read(_v4, "t"), 2)), _S.binary("*", _S.read(_v4, "y"), 0.9), _S.binary("+", _S.read(_v4, "S"), 3)]))
					_S.define(_v4, "fi", (6 if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v4, "up"), 0.55), func(): return _S.binary("<", _S.read(_v4, "u"), 0.85))) else (5 if _S.truth(_S.binary(">", _S.read(_v4, "win"), 0.8)) else (4 if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v4, "win"), 0.45), func(): return _S.binary(">", _S.read(_v4, "up"), 0.3))) else (3 if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v4, "win"), 0.2), func(): return _S.binary(">", _S.read(_v4, "up"), 0.05))) else (2 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.6)) else 1))))))
					_S.define(_v4, "bi", (4 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.14)) else (4 if _S.truth(_S.binary(">", _S.read(_v4, "wind"), 0.55)) else (3 if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v4, "wind"), 0.25), func(): return _S.binary("<", _S.read(_v4, "u"), 0.32))) else (2 if _S.truth(_S.binary("<", _S.read(_v4, "u"), 0.7)) else 1)))))
					_S.write(_v4, "c", _S.prop(_S.read(_v4, "C"), _S.invoke(_S.read(_v4, "Math"), "round", [_S.binary("+", _S.read(_v4, "bi"), _S.binary("*", _S.binary("-", _S.read(_v4, "fi"), _S.read(_v4, "bi")), _S.call_value(_S.read(_v4, "smooth"), [_S.binary("-", _S.read(_v4, "xc"), 5), _S.binary("+", _S.read(_v4, "xc"), 5), _S.read(_v4, "x")])))])), "=", false)
			_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "X"), _S.read(_v3, "Y"), _S.read(_v3, "c"), _S.read(_v3, "a")])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "Y", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "X", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "lipK"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRASH")))):
		return null
	_S.define(_e, "cells", _S.construct(_S.read(_e, "Map"), []))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "s", 0)
	while _S.truth(_S.binary("<=", _S.read(_v5, "s"), 1)):
		var _v6 = _S.scope(_v5)
		var _v7 = _S.call_value(_S.read(_v6, "lip"), [_S.read(_v6, "s"), _S.read(_v6, "t")])
		_S.define(_v6, "x", _S.prop(_v7, 0))
		_S.define(_v6, "y", _S.prop(_v7, 1))
		_S.define(_v6, "w", _S.prop(_v7, 2))
		var _v8 = _S.call_value(_S.read(_v6, "lip"), [_S.invoke(_S.read(_v6, "Math"), "min", [1, _S.binary("+", _S.read(_v6, "s"), 0.012)]), _S.read(_v6, "t")])
		_S.define(_v6, "x2", _S.prop(_v8, 0))
		_S.define(_v6, "y2", _S.prop(_v8, 1))
		_S.define(_v6, "tx", _S.binary("-", _S.read(_v6, "x2"), _S.read(_v6, "x")))
		_S.define(_v6, "ty", _S.binary("-", _S.read(_v6, "y2"), _S.read(_v6, "y")))
		_S.define(_v6, "l", _S.logical("||", _S.invoke(_S.read(_v6, "Math"), "hypot", [_S.read(_v6, "tx"), _S.read(_v6, "ty")]), func(): return 1))
		_S.define(_v6, "nx", _S.binary("/", _S.read(_v6, "ty"), _S.read(_v6, "l")))
		_S.define(_v6, "ny", _S.binary("/", _S.unary("-", _S.read(_v6, "tx")), _S.read(_v6, "l")))
		var _v9 = _S.scope(_v6)
		_S.define(_v9, "q", 0)
		while _S.truth(_S.binary("<=", _S.read(_v9, "q"), 1)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "px", _S.binary("+", _S.read(_v10, "x"), _S.binary("*", _S.binary("*", _S.read(_v10, "nx"), _S.binary("-", _S.read(_v10, "q"), 0.5)), _S.read(_v10, "w"))))
			_S.define(_v10, "py", _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.binary("*", _S.read(_v10, "ny"), _S.binary("-", _S.read(_v10, "q"), 0.5)), _S.read(_v10, "w"))))
			_S.define(_v10, "key", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.read(_v10, "py")]), 1024), _S.invoke(_S.read(_v10, "Math"), "floor", [_S.read(_v10, "px")])))
			_S.define(_v10, "c", (_S.read(_v10, "WHITE") if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.18)) else ((_S.read(_v10, "WHITE") if _S.truth(_S.binary(">", _S.read(_v10, "s"), 0.8)) else _S.prop(_S.read(_v10, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.36)) else (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.56)) else (_S.prop(_S.read(_v10, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.76)) else _S.prop(_S.read(_v10, "C"), 3))))))
			_S.define(_v10, "cur", _S.invoke(_S.read(_v10, "cells"), "get", [_S.read(_v10, "key")]))
			if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v10, "cur")), func(): return _S.binary("<", _S.read(_v10, "q"), _S.prop(_S.read(_v10, "cur"), "q")))):
				_S.invoke(_S.read(_v10, "cells"), "set", [_S.read(_v10, "key"), _S.merge([{"x": _S.read(_v10, "px")}, {"y": _S.read(_v10, "py")}, {"c": _S.read(_v10, "c")}, {"q": _S.read(_v10, "q")}])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "q", _S.binary("/", 0.5, _S.invoke(_S.read(_v9, "Math"), "max", [1, _S.read(_v9, "w")])), "+=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "s", 0.012, "+=", false)
	for _v11 in _S.array(_S.invoke(_S.read(_e, "cells"), "values", [])):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "c", _v11)
		_S.invoke(_S.read(_v12, "p"), "px", [_S.prop(_S.read(_v12, "c"), "x"), _S.prop(_S.read(_v12, "c"), "y"), _S.prop(_S.read(_v12, "c"), "c")])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "s", 0)
	while _S.truth(_S.binary("<=", _S.read(_v13, "s"), 1)):
		var _v14 = _S.scope(_v13)
		var _v15 = _S.call_value(_S.read(_v14, "lip"), [_S.read(_v14, "s"), _S.read(_v14, "t")])
		_S.define(_v14, "x", _S.prop(_v15, 0))
		_S.define(_v14, "y", _S.prop(_v15, 1))
		_S.define(_v14, "w", _S.prop(_v15, 2))
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.binary("+", 6, _S.read(_v14, "w")), _S.prop(_S.read(_v14, "C"), 5), _S.binary("*", 0.24, _S.read(_v14, "k"))])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "s", 0.125, "+=", false)
	var _v16 = _S.call_value(_S.read(_e, "lip"), [1, _S.read(_e, "t")])
	_S.define(_e, "tx", _S.prop(_v16, 0))
	_S.define(_e, "ty", _S.prop(_v16, 1))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "k"), 0.55), 0.45)]))]))
	if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.05)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "tx"), _S.read(_e, "ty"), _S.binary("*", 6, _S.read(_e, "g")), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.5, _S.read(_e, "g"))])
	var _v17 = _S.call_value(_S.read(_e, "lip"), [0.6, _S.read(_e, "t")])
	_S.define(_e, "bx", _S.prop(_v17, 0))
	_S.define(_e, "by", _S.prop(_v17, 1))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("-", _S.read(_e, "bx"), 3), _S.binary("+", _S.read(_e, "by"), 8), 16, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.25, _S.read(_e, "k"))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.arg(_args, 1))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "X", _S.unary("-", _S.read(_v18, "EDGE")))
	while _S.truth(_S.binary("<", _S.read(_v18, "X"), _S.read(_v18, "EDGE"))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "x", _S.binary("+", _S.read(_v19, "X"), 0.5))
		_S.define(_v19, "edge", _S.binary("-", 1, _S.call_value(_S.read(_v19, "smooth"), [_S.binary("-", _S.read(_v19, "EDGE"), 30), _S.read(_v19, "EDGE"), _S.invoke(_S.read(_v19, "Math"), "abs", [_S.read(_v19, "x")])])))
		_S.define(_v19, "a", _S.binary("*", _S.read(_v19, "fade"), _S.read(_v19, "edge")))
		if _S.truth(_S.binary("<=", _S.read(_v19, "a"), 0.02)):
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "X", 1, "+=", true)
			continue
		_S.define(_v19, "g", _S.call_value(_S.read(_v19, "noise"), [_S.binary("-", _S.binary("*", _S.read(_v19, "x"), 0.3), _S.binary("*", _S.read(_v19, "t"), 3)), _S.binary("+", _S.read(_v19, "S"), 4)]))
		_S.invoke(_S.read(_v19, "p"), "dot", [_S.read(_v19, "X"), 0, (_S.prop(_S.read(_v19, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v19, "g"), 0.55)) else _S.prop(_S.read(_v19, "C"), 4)), _S.binary("*", _S.read(_v19, "a"), 1.2)])
		_S.invoke(_S.read(_v19, "p"), "blend", [_S.read(_v19, "x"), 1.5, _S.prop(_S.read(_v19, "C"), 2), _S.binary("*", 0.6, _S.read(_v19, "a"))])
		_S.invoke(_S.read(_v19, "p"), "blend", [_S.read(_v19, "x"), 2.5, _S.prop(_S.read(_v19, "C"), 1), _S.binary("*", 0.45, _S.read(_v19, "a"))])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "X", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "rings"), "add", [_S.prop(_S.read(_e, "d"), "x"), _S.prop(_S.read(_e, "d"), "z"), 0.6, _S.binary("+", 2, _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 1.8)), _S.binary("+", 0.3, _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 0.1)), _S.merge([{"n": 1}, {"k": 0.9}, {"hot": 0.05}])])
	_S.invoke(_S.read(_e, "plinks"), "push", [_S.merge([{"x": _S.prop(_S.read(_e, "d"), "x")}, {"y": _S.binary("*", _S.prop(_S.read(_e, "d"), "z"), _S.read(_e, "SY"))}, {"age": 0}])])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "xc", _S.call_value(_S.read(_e, "crestX"), [_S.read(_e, "tt")]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "crestH"), [_S.read(_e, "tt")]))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "xc")))
	return _S.binary("*", _S.read(_e, "A"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.read(_e, "dx"), (30 if _S.truth(_S.binary("<", _S.read(_e, "dx"), 0)) else _S.call_value(_S.read(_e, "faceW"), [_S.read(_e, "tt")]))), 2))]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "lipK"), [_S.read(_e, "tt")]))
	_S.define(_e, "xc", _S.call_value(_S.read(_e, "crestX"), [_S.read(_e, "tt")]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "crestH"), [_S.read(_e, "tt")]))
	return [_S.binary("+", _S.binary("+", _S.read(_e, "xc"), 1), _S.binary("*", _S.binary("*", _S.read(_e, "s"), 30), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "k"), 0.8]))), _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "A")), _S.binary("*", _S.binary("*", _S.binary("*", 4, _S.read(_e, "s")), _S.binary("-", 1, _S.read(_e, "s"))), _S.binary("+", 1, _S.binary("*", 4, _S.read(_e, "k"))))), _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "s")), _S.read(_e, "A")), _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.read(_e, "k")])), 0.98)), _S.binary("*", _S.binary("-", 11, _S.binary("*", 8.5, _S.read(_e, "s"))), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_e, "k"))))]

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "vx", _S.arg(_args, 2))
	_S.define(_e, "vy", _S.arg(_args, 3))
	_S.define(_e, "r0", _S.arg(_args, 4))
	_S.define(_e, "r1", _S.arg(_args, 5))
	_S.define(_e, "life", _S.arg(_args, 6))
	_S.define(_e, "delay", _S.coalesce(_S.arg(_args, 7), func(): return 0))
	return _S.invoke(_S.read(_e, "puffs"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"vx": _S.read(_e, "vx")}, {"vy": _S.read(_e, "vy")}, {"r0": _S.read(_e, "r0")}, {"r1": _S.read(_e, "r1")}, {"life": _S.read(_e, "life")}, {"max": _S.read(_e, "life")}, {"delay": _S.read(_e, "delay")}])])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "k", _S.call_value(_S.read(_e, "lipK"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH")), func(): return _S.binary(">", _S.call_value(_S.read(_e, "crestH"), [_S.read(_e, "t")]), 14)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "xc", _S.call_value(_S.read(_v20, "crestX"), [_S.read(_v20, "t")]))
		_S.define(_v20, "A", _S.call_value(_S.read(_v20, "crestH"), [_S.read(_v20, "t")]))
		_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "FLAKE"), _S.binary("+", _S.read(_v20, "xc"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 4), 3])), _S.binary("-", _S.unary("-", _S.read(_v20, "A")), _S.invoke(_S.read(_v20, "R"), "range", [0, 2])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [20, 60])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [10, 40])), _S.invoke(_S.read(_v20, "R"), "range", [0.5, 0.9]), (_S.read(_v20, "WHITE") if _S.truth(_S.invoke(_S.read(_v20, "R"), "chance", [0.5])) else _S.prop(_S.read(_v20, "C"), 6)), _S.invoke(_S.read(_v20, "R"), "range", [0.6, 1.3])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		var _v21 = _S.scope(_e)
		var _v22 = _S.call_value(_S.read(_v21, "lip"), [1, _S.read(_v21, "t")])
		_S.define(_v21, "x", _S.prop(_v22, 0))
		_S.define(_v21, "y", _S.prop(_v22, 1))
		_S.invoke(_S.read(_v21, "drops"), "add", [_S.merge([{"x": _S.read(_v21, "x")}, {"z": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 3), 3])}, {"h": _S.unary("-", _S.read(_v21, "y"))}, {"vx": _S.invoke(_S.read(_v21, "R"), "range", [30, 90])}, {"vz": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 10), 10])}, {"vh": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 20), 40])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v21, "R"), "chance", [0.3])) else 1)}])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "crashed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRASH")))):
		var _v23 = _S.scope(_e)
		_S.write(_v23, "crashed", true, "=", false)
		var _v24 = _S.call_value(_S.read(_v23, "lip"), [1, _S.binary("-", _S.read(_v23, "CRASH"), 0.001)])
		_S.define(_v23, "X0", _S.prop(_v24, 0))
		_S.invoke(_S.read(_v23, "lights"), "add", [_S.read(_v23, "X0"), _S.unary("-", 20), 56, _S.prop(_S.read(_v23, "C"), 5), 0.8, 0.55])
		_S.invoke(_S.read(_v23, "lights"), "add", [_S.read(_v23, "X0"), _S.unary("-", 4), 22, _S.read(_v23, "WHITE"), 0.6, 0.1])
		var _v25 = _S.scope(_v23)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 46)):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.binary("*", _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.9), 0.6]), _S.prop(_S.read(_v26, "Math"), "PI")))
			_S.define(_v26, "v", _S.invoke(_S.read(_v26, "R"), "range", [30, 120]))
			_S.invoke(_S.read(_v26, "drops"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v26, "X0"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 6]))}, {"z": _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 4), 4])}, {"h": _S.invoke(_S.read(_v26, "R"), "range", [2, 8])}, {"vx": _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "v")), 0.85), 18)}, {"vz": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "v")), 0.5)}, {"vh": _S.invoke(_S.read(_v26, "R"), "range", [120, 320])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.15])) else (2 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.35])) else 1))}, {"delay": _S.invoke(_S.read(_v26, "R"), "range", [0, 0.1])}])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		var _v27 = _S.scope(_v23)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 14)):
			_S.invoke(_S.read(_v27, "drops"), "add", [_S.merge([{"x": _S.binary("+", _S.read(_v27, "X0"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 3), 3]))}, {"z": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 2), 2])}, {"h": _S.invoke(_S.read(_v27, "R"), "range", [2, 6])}, {"vx": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 15), 25])}, {"vz": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 8), 8])}, {"vh": _S.invoke(_S.read(_v27, "R"), "range", [220, 300])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.3])) else 1)}, {"delay": _S.invoke(_S.read(_v27, "R"), "range", [0.04, 0.16])}])])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v28 = _S.scope(_v23)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 34)):
			_S.call_value(_S.read(_v28, "puff"), [_S.binary("+", _S.read(_v28, "X0"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 12), 10])), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [2, 12])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 40), 130]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [30, 150])), _S.invoke(_S.read(_v28, "R"), "range", [1, 2]), _S.invoke(_S.read(_v28, "R"), "range", [1.8, 4.2]), _S.invoke(_S.read(_v28, "R"), "range", [0.4, 0.95]), _S.invoke(_S.read(_v28, "R"), "range", [0, 0.14])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
		var _v29 = _S.scope(_v23)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 34)):
			var _v30 = _S.scope(_v29)
			_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 0.95), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v30, "Math"), "PI")), 0.05)]))
			_S.define(_v30, "v", _S.invoke(_S.read(_v30, "R"), "range", [40, 160]))
			_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "FLAKE"), _S.binary("+", _S.read(_v30, "X0"), _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 8), 8])), _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [4, 14])), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "v")), 25), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "v")), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1.3]), (_S.read(_v30, "WHITE") if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else _S.prop(_S.read(_v30, "C"), 6)), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1.4]), _S.invoke(_S.read(_v30, "R"), "range", [0, 0.1])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		var _v31 = _S.scope(_v23)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), 12)):
			_S.invoke(_S.read(_v31, "mist"), "add", [_S.binary("+", _S.read(_v31, "X0"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 10), 14])), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [3, 16])), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 20), 70]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [6, 24])), 3, _S.invoke(_S.read(_v31, "R"), "range", [9, 15]), _S.invoke(_S.read(_v31, "R"), "range", [1.1, 1.7]), (_S.prop(_S.read(_v31, "C"), 6) if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.5])) else _S.read(_v31, "WHITE")), 0.26, _S.invoke(_S.read(_v31, "R"), "range", [0, 0.2])])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
		var _v32 = _S.scope(_v23)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), 10)):
			_S.invoke(_S.read(_v32, "ps"), "spawn", [_S.prop(_S.read(_v32, "P"), "STAR"), _S.binary("+", _S.read(_v32, "X0"), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 20), 24])), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [6, 40])), 0, _S.unary("-", 5), _S.invoke(_S.read(_v32, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v32, "C"), 6), _S.invoke(_S.read(_v32, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v32, "R"), "range", [0.05, 0.4])])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
		_S.invoke(_S.read(_v23, "rings"), "add", [_S.read(_v23, "X0"), 0, 6, 40, 1.2, _S.merge([{"n": 2}, {"gap": 3}, {"k": 1.1}, {"hot": 0.12}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "crashed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CRASH"), 1.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRASH")), 1.1)))]))):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "x", _S.binary("+", _S.call_value(_S.read(_v33, "crestX"), [_S.read(_v33, "t")]), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 6), 14])))
		_S.call_value(_S.read(_v33, "puff"), [_S.read(_v33, "x"), _S.unary("-", _S.invoke(_S.read(_v33, "R"), "range", [1, 4])), _S.invoke(_S.read(_v33, "R"), "range", [10, 40]), _S.unary("-", _S.invoke(_S.read(_v33, "R"), "range", [10, 40])), _S.invoke(_S.read(_v33, "R"), "range", [0.9, 1.8]), _S.invoke(_S.read(_v33, "R"), "range", [1.8, 3.6]), _S.invoke(_S.read(_v33, "R"), "range", [0.4, 0.8])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "crashed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CRASH"), 0.8))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		_S.invoke(_S.read(_e, "mist"), "add", [_S.binary("+", _S.call_value(_S.read(_e, "crestX"), [_S.read(_e, "t")]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8])), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 6])), _S.invoke(_S.read(_e, "R"), "range", [10, 40]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [3, 10])), 3, _S.invoke(_S.read(_e, "R"), "range", [7, 11]), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.1]), _S.prop(_S.read(_e, "C"), 6), 0.2])
	var _v34 = _S.scope(_e)
	_S.define(_v34, "i", _S.binary("-", _S.prop(_S.read(_v34, "puffs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v34, "i"), 0)):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "f", _S.prop(_S.read(_v35, "puffs"), _S.read(_v35, "i")))
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v35, "f"), "delay"), 0)):
			var _v36 = _S.scope(_v35)
			_S.set_prop(_S.read(_v36, "f"), "delay", _S.read(_v36, "dt"), "-=", false)
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "-=", true)
			continue
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v35, "f"), "life", _S.read(_v35, "dt"), "-=", false), 0)):
			var _v37 = _S.scope(_v35)
			_S.invoke(_S.read(_v37, "puffs"), "splice", [_S.read(_v37, "i"), 1])
			_v34 = _S.iteration(_v34)
			_S.write(_v34, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v35, "f"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v35, "f"), "vx"), 2.5), _S.read(_v35, "dt")), "-=", false)
		_S.set_prop(_S.read(_v35, "f"), "vy", _S.binary("*", _S.binary("-", 160, _S.binary("*", _S.prop(_S.read(_v35, "f"), "vy"), 2.5)), _S.read(_v35, "dt")), "+=", false)
		_S.set_prop(_S.read(_v35, "f"), "x", _S.binary("*", _S.prop(_S.read(_v35, "f"), "vx"), _S.read(_v35, "dt")), "+=", false)
		_S.set_prop(_S.read(_v35, "f"), "y", _S.invoke(_S.read(_v35, "Math"), "min", [_S.binary("+", _S.prop(_S.read(_v35, "f"), "y"), _S.binary("*", _S.prop(_S.read(_v35, "f"), "vy"), _S.read(_v35, "dt"))), _S.unary("-", 1)]), "=", false)
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "i", 1, "-=", true)
	var _v38 = _S.scope(_e)
	_S.define(_v38, "i", _S.binary("-", _S.prop(_S.read(_v38, "plinks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v38, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v38, "plinks"), _S.read(_v38, "i")), "age", _S.read(_v38, "dt"), "+=", false), 0.12)):
			_S.invoke(_S.read(_v38, "plinks"), "splice", [_S.read(_v38, "i"), 1])
		_v38 = _S.iteration(_v38)
		_S.write(_v38, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rings"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "mist"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.25, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.7), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.1), _S.read(_e, "t")]))))
	_S.call_value(_S.read(_e, "sea"), [_S.read(_e, "p"), _S.read(_e, "fade")])
	_S.invoke(_S.read(_e, "rings"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), _S.unary("-", 1)])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), "back"])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.25, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.7), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.1), _S.read(_e, "t")]))))
	_S.call_value(_S.read(_e, "body"), [_S.read(_e, "p"), _S.read(_e, "fade")])
	_S.call_value(_S.read(_e, "curl"), [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "rings"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), 1])
	if _S.truth(_S.read(_e, "crashed")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "k", _S.binary("-", 1, _S.call_value(_S.read(_v39, "smooth"), [_S.binary("+", _S.read(_v39, "CRASH"), 0.4), _S.binary("-", _S.prop(_S.read(_v39, "meta"), "duration"), 0.15), _S.read(_v39, "t")])))
		_S.define(_v39, "x0", _S.unary("-", 20))
		_S.define(_v39, "x1", _S.binary("+", _S.call_value(_S.read(_v39, "crestX"), [_S.read(_v39, "t")]), 10))
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "X", _S.invoke(_S.read(_v40, "Math"), "floor", [_S.read(_v40, "x0")]))
		while _S.truth(_S.binary("<", _S.read(_v40, "X"), _S.read(_v40, "x1"))):
			var _v41 = _S.scope(_v40)
			_S.define(_v41, "x", _S.binary("+", _S.read(_v41, "X"), 0.5))
			_S.define(_v41, "n", _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "abs", [_S.call_value(_S.read(_v41, "noise2"), [_S.binary("*", _S.read(_v41, "x"), 0.35), _S.binary("*", _S.read(_v41, "t"), 0.8), _S.binary("+", _S.read(_v41, "S"), 7)])]), 4)))
			if _S.truth(_S.binary(">", _S.read(_v41, "n"), _S.binary("-", 1.15, _S.binary("*", _S.read(_v41, "k"), 1.1)))):
				_S.invoke(_S.read(_v41, "p"), "px", [_S.read(_v41, "X"), 0, (_S.read(_v41, "WHITE") if _S.truth(_S.binary(">", _S.read(_v41, "n"), _S.binary("-", 1.4, _S.read(_v41, "k")))) else _S.prop(_S.read(_v41, "C"), 6))])
			if _S.truth(_S.binary(">", _S.read(_v41, "n"), _S.binary("-", 1.4, _S.binary("*", _S.read(_v41, "k"), 0.9)))):
				_S.invoke(_S.read(_v41, "p"), "px", [_S.read(_v41, "X"), 1, _S.prop(_S.read(_v41, "C"), 5)])
			_v40 = _S.iteration(_v40)
			_S.write(_v40, "X", 1, "+=", true)
	for _v42 in _S.array(_S.read(_e, "puffs")):
		var _v43 = _S.scope(_e)
		_S.define(_v43, "f", _v42)
		var _v44 = _S.scope(_v43)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v44, "f"), "delay"), 0)):
			continue
		_S.define(_v44, "g", _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v44, "f"), "life"), _S.prop(_S.read(_v44, "f"), "max"))))
		_S.define(_v44, "r", _S.binary("*", _S.binary("+", _S.prop(_S.read(_v44, "f"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v44, "f"), "r1"), _S.prop(_S.read(_v44, "f"), "r0")), _S.invoke(_S.read(_v44, "ease"), "outCubic", [_S.read(_v44, "g")]))), _S.binary("-", 1, _S.call_value(_S.read(_v44, "smooth"), [0.7, 1, _S.read(_v44, "g")]))))
		if _S.truth(_S.binary(">", _S.read(_v44, "r"), 0.6)):
			_S.call_value(_S.read(_v44, "billow"), [_S.read(_v44, "p"), _S.prop(_S.read(_v44, "f"), "x"), _S.prop(_S.read(_v44, "f"), "y"), _S.read(_v44, "r"), _S.read(_v44, "C")])
	for _v45 in _S.array(_S.read(_e, "plinks")):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "q", _v45)
		var _v47 = _S.scope(_v46)
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v47, "q"), "age"), 0.06)):
			_S.invoke(_S.read(_v47, "p"), "px", [_S.prop(_S.read(_v47, "q"), "x"), _S.prop(_S.read(_v47, "q"), "y"), _S.read(_v47, "WHITE")])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.prop(_S.read(_v47, "q"), "x"), _S.prop(_S.read(_v47, "q"), "y"), 4, _S.prop(_S.read(_v47, "C"), 5), _S.binary("*", 0.25, _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v47, "q"), "age"), 0.12)))])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), "front"])
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRASH")), 0.08))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1))):
		var _v48 = _S.scope(_e)
		var _v49 = _S.call_value(_S.read(_v48, "lip"), [1, _S.binary("-", _S.read(_v48, "CRASH"), 0.001)])
		_S.define(_v48, "X0", _S.prop(_v49, 0))
		_S.invoke(_S.read(_v48, "p"), "circle", [_S.read(_v48, "X0"), _S.unary("-", 3), _S.binary("*", 8, _S.binary("-", 1, _S.binary("*", _S.read(_v48, "f"), 0.4))), _S.read(_v48, "WHITE")])
		_S.invoke(_S.read(_v48, "p"), "ellipse", [_S.read(_v48, "X0"), 0, 14, 2.6, _S.function_value(_v48, "_f11")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "mist"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH"))):
		var _v50 = _S.scope(_e)
		_S.invoke(_S.read(_v50, "p"), "glow", [_S.binary("+", _S.call_value(_S.read(_v50, "crestX"), [_S.read(_v50, "t")]), 4), _S.binary("+", _S.unary("-", _S.call_value(_S.read(_v50, "crestH"), [_S.read(_v50, "t")])), 2), 26, _S.prop(_S.read(_v50, "C"), 4), _S.binary("*", 0.22, _S.call_value(_S.read(_v50, "smooth"), [0.2, _S.read(_v50, "CRASH"), _S.read(_v50, "t")]))])
		_S.invoke(_S.read(_v50, "p"), "glowLine", [_S.binary("-", _S.call_value(_S.read(_v50, "crestX"), [_S.read(_v50, "t")]), 26), _S.binary("*", _S.unary("-", _S.call_value(_S.read(_v50, "crestH"), [_S.read(_v50, "t")])), 0.45), _S.call_value(_S.read(_v50, "crestX"), [_S.read(_v50, "t")]), _S.unary("-", _S.call_value(_S.read(_v50, "crestH"), [_S.read(_v50, "t")])), 10, _S.prop(_S.read(_v50, "C"), 5), _S.binary("*", 0.14, _S.call_value(_S.read(_v50, "smooth"), [0.2, _S.read(_v50, "CRASH"), _S.read(_v50, "t")]))])
	else:
		_S.invoke(_S.read(_e, "p"), "glow", [_S.call_value(_S.read(_e, "crestX"), [_S.read(_e, "t")]), _S.unary("-", 10), 34, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.26, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "CRASH"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.3), _S.read(_e, "t")])))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "C"), 6))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("+", _S.unary("-", 80), _S.binary("*", 72, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "CRASH"))]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH"))) else _S.binary("+", _S.unary("-", 8), _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRASH")), 1.4)])]))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("+", 5, _S.binary("*", 33, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "CRASH"), 0.92))])]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH"))) else _S.binary("+", _S.binary("*", 38, _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CRASH")), 0.45)])]))), _S.binary("*", 5, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "CRASH"), _S.binary("+", _S.read(_e, "CRASH"), 1.6), _S.read(_e, "t")])))))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("-", 24, _S.binary("*", 16, _S.call_value(_S.read(_e, "smooth"), [0.3, _S.read(_e, "CRASH"), _S.read(_e, "t")]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRASH"))) else _S.binary("+", 8, _S.binary("*", 14, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "CRASH"), _S.binary("+", _S.read(_e, "CRASH"), 0.6), _S.read(_e, "t")]))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIP0")), _S.binary("-", _S.read(_e, "CRASH"), _S.read(_e, "LIP0")))])
