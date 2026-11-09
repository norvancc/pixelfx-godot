@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/geyser.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "Drops", _S.import_value("fx/water/_lib.js", "Drops"))
	_S.define(_e, "Ripples", _S.import_value("fx/water/_lib.js", "Ripples"))
	_S.define(_e, "Mist", _S.import_value("fx/water/_lib.js", "Mist"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "lace", _S.import_value("fx/water/_lib.js", "lace"))
	_S.define(_e, "billow", _S.import_value("fx/water/_lib.js", "billow"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Geyser"}, {"desc": "A pool heaves and burbles faster and faster, then blasts a white column of water skyward with a churning foam head; it rains back down in drops and steam, slumps and sputters out."}, {"tags": ["water", "geyser", "eruption", "steam", "column", "nature", "one-shot"]}, {"size": [184, 168]}, {"origin": [92, 146]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"height": 100}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "G", 820)
	_S.define(_e, "ERUPT", 1.15)
	_S.define(_e, "FALL", 2.6)
	_S.define(_e, "GONE", 3.3)
	_S.define(_e, "SPURTS", [[0.46, 7], [0.72, 12], [0.92, 9], [1.04, 15], [_S.binary("+", _S.read(_e, "GONE"), 0.15), 15], [_S.binary("+", _S.read(_e, "GONE"), 0.55), 8]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "column", _S.function_value(_e, "_f1"))
	_S.define(_e, "foamHead", _S.function_value(_e, "_f4"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "HMAX", _S.prop(_S.read(_e, "o"), "height"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}])]))
	_S.define(_e, "mist", _S.construct(_S.read(_e, "Mist"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rings", _S.construct(_S.read(_e, "Ripples"), [_S.merge([{"sy": _S.read(_e, "SY")}])]))
	_S.define(_e, "plinks", [])
	_S.define(_e, "pops", [])
	_S.define(_e, "V0", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("*", _S.binary("*", 2, _S.read(_e, "G")), _S.read(_e, "HMAX"))]))
	_S.define(_e, "t", 0)
	_S.define(_e, "poolR", _S.function_value(_e, "_f5"))
	_S.define(_e, "poolK", _S.function_value(_e, "_f6"))
	_S.define(_e, "drops", _S.construct(_S.read(_e, "Drops"), [_S.merge([{"sy": _S.read(_e, "SY")}, {"g": _S.read(_e, "G")}, {"onLand": _S.function_value(_e, "_f7")}])]))
	_S.define(_e, "top", _S.function_value(_e, "_f8"))
	_S.define(_e, "head", _S.function_value(_e, "_f9"))
	_S.define(_e, "spurt", _S.function_value(_e, "_f10"))
	_S.define(_e, "done", _S.construct(_S.read(_e, "Set"), []))
	_S.define(_e, "once", _S.function_value(_e, "_f11"))
	_S.define(_e, "emit", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f16")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "thin", _S.arg(_args, 2))
	if _S.truth(_S.binary("<", _S.read(_e, "H"), 1)):
		return null
	_S.define(_e, "tau", _S.function_value(_e, "_f2"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 22), _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), 22, 0, _S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, 0, 0, _S.unary("-", _S.read(_e, "H")), _S.binary("+", 16, _S.binary("*", 8, _S.read(_e, "thin"))), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.12, _S.read(_e, "thin"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("-", _S.read(_e, "V0"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.binary("*", _S.read(_e, "V0"), _S.read(_e, "V0")), _S.binary("*", _S.binary("*", 2, _S.read(_e, "G")), _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "h"), _S.binary("*", _S.read(_e, "HMAX"), 0.96)])))])])), _S.read(_e, "G"))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "h", _S.unary("-", _S.read(_e, "y")))
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "h"), _S.read(_e, "H")))
	_S.define(_e, "sway", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 1.6), _S.binary("*", _S.read(_e, "h"), 0.025)), _S.binary("+", _S.read(_e, "S"), 5)]), 2.5), _S.read(_e, "v")))
	_S.define(_e, "rag", _S.binary("*", _S.call_value(_S.read(_e, "noise2"), [_S.binary("-", _S.binary("*", _S.read(_e, "h"), 0.2), _S.binary("*", _S.read(_e, "t"), 11)), (3 if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.read(_e, "sway"))) else 7), _S.binary("+", _S.read(_e, "S"), 6)]), _S.binary("+", 0.5, _S.binary("*", 1.8, _S.read(_e, "v")))))
	_S.define(_e, "w", _S.binary("+", _S.binary("*", _S.binary("+", 3.6, _S.binary("*", 7.5, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "v"), 1.8]))), _S.read(_e, "thin")), _S.read(_e, "rag")))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "sway")), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.read(_e, "w")])))
	_S.define(_e, "aq", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "q")]))
	if _S.truth(_S.binary(">", _S.read(_e, "aq"), 1)):
		return null
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "streak", _S.call_value(_S.read(_e, "noise2"), [_S.binary("+", _S.binary("*", _S.read(_e, "X"), 1.618), 0.3), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "tau"), [_S.read(_e, "h")]), _S.read(_e, "t")), 14), _S.read(_e, "S")]))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "noise2"), [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "x"), 40), 2)]), 2.3), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "tau"), [_S.read(_e, "h")]), _S.read(_e, "t")), 5), _S.binary("+", _S.read(_e, "S"), 1)]))
	_S.define(_e, "lvl", (0 if _S.truth(_S.binary("<", _S.read(_e, "aq"), 0.42)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "aq"), 0.7)) else (2 if _S.truth(_S.binary("<", _S.read(_e, "aq"), 0.9)) else 3))))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), 0.38)):
		_S.write(_e, "lvl", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "streak"), 0.28)):
		_S.write(_e, "lvl", 1, "-=", true)
	if _S.truth(_S.binary("<", _S.read(_e, "body"), _S.unary("-", 0.4))):
		_S.write(_e, "lvl", 1, "+=", true)
	_S.set_prop(_S.read(_e, "out"), "c", _S.prop([_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)], _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "lvl"), 0, 4])), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "k"), 0.01), func(): return _S.binary("<", _S.read(_e, "H"), 4))):
		return null
	if _S.truth(_S.read(_e, "back")):
		var _v0 = _S.scope(_e)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 16)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "side", (1 if _S.truth(_S.binary("%", _S.read(_v2, "i"), 2)) else _S.unary("-", 1)))
			_S.define(_v2, "x0", _S.binary("*", _S.binary("*", _S.read(_v2, "side"), _S.binary("+", 5, _S.binary("*", 9, _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "i"), _S.binary("+", _S.read(_v2, "S"), 20)])))), _S.read(_v2, "k")))
			_S.define(_v2, "len", _S.binary("*", _S.binary("+", 14, _S.binary("*", 26, _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "i"), _S.binary("+", _S.read(_v2, "S"), 21)]))), _S.read(_v2, "k")))
			_S.define(_v2, "speed", _S.binary("+", 70, _S.binary("*", 50, _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "i"), _S.binary("+", _S.read(_v2, "S"), 22)]))))
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v3, "j"), 3)):
				var _v4 = _S.scope(_v3)
				_S.define(_v4, "f", _S.binary("%", _S.binary("+", _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_v4, "t"), _S.read(_v4, "speed")), _S.read(_v4, "len")), _S.binary("/", _S.read(_v4, "j"), 3)), _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "i"), _S.binary("+", _S.read(_v4, "S"), 23)])), 1))
				_S.define(_v4, "y0", _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_v4, "H")), 2), _S.binary("*", _S.read(_v4, "f"), _S.read(_v4, "len"))))
				_S.define(_v4, "x", _S.binary("+", _S.read(_v4, "x0"), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v4, "side"), _S.read(_v4, "f")), _S.read(_v4, "f")), 6)))
				_S.define(_v4, "L", _S.binary("+", 1, _S.binary("*", _S.binary("*", _S.binary("*", 4, _S.read(_v4, "f")), _S.binary("-", 1, _S.read(_v4, "f"))), 2)))
				if _S.truth(_S.binary("<", _S.read(_v4, "f"), 0.85)):
					_S.invoke(_S.read(_v4, "p"), "line", [_S.read(_v4, "x"), _S.read(_v4, "y0"), _S.binary("+", _S.read(_v4, "x"), _S.binary("*", _S.read(_v4, "side"), 0.6)), _S.binary("+", _S.read(_v4, "y0"), _S.read(_v4, "L")), (_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v4, "f"), 0.4)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "f"), 0.7)) else _S.prop(_S.read(_v4, "C"), 4)))])
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "j", 1, "+=", true)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), 12)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v6, "i"), 12), _S.read(_v6, "TAU")), _S.binary("*", _S.read(_v6, "t"), (1.3 if _S.truth(_S.binary("%", _S.read(_v6, "i"), 2)) else _S.unary("-", 1.1)))))
		_S.define(_v6, "z", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]))
		if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_v6, "z"), 0), _S.read(_v6, "back"))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
			continue
		_S.define(_v6, "rho", _S.binary("*", _S.binary("+", 3, _S.binary("*", 7, _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "i"), _S.read(_v6, "S")]))), _S.read(_v6, "k")))
		_S.define(_v6, "x", _S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "rho")), 1.25), _S.binary("*", _S.call_value(_S.read(_v6, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v6, "t"), 3), _S.read(_v6, "i")), _S.binary("+", _S.read(_v6, "S"), 8)]), 2.5)))
		_S.define(_v6, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", _S.unary("-", _S.read(_v6, "H")), _S.binary("*", _S.binary("*", _S.read(_v6, "z"), _S.read(_v6, "rho")), 0.45)), _S.binary("*", _S.binary("/", _S.read(_v6, "rho"), 10), 4)), _S.binary("*", 4, _S.binary("-", 1, _S.binary("/", _S.read(_v6, "rho"), _S.binary("*", 10, _S.read(_v6, "k")))))), _S.binary("*", _S.call_value(_S.read(_v6, "noise"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v6, "t"), 3), _S.read(_v6, "i")), 50), _S.binary("+", _S.read(_v6, "S"), 9)]), 2.5)))
		_S.define(_v6, "r", _S.binary("*", _S.binary("+", _S.binary("+", 2, _S.binary("*", 2.6, _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "i"), _S.binary("+", _S.read(_v6, "S"), 2)]))), _S.binary("*", 0.7, _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v6, "t"), 7), _S.read(_v6, "i"))]))), _S.read(_v6, "k")))
		if _S.truth(_S.read(_v6, "back")):
			_S.call_value(_S.read(_v6, "billow"), [_S.read(_v6, "p"), _S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "r"), [_S.prop(_S.read(_v6, "C"), 0), _S.prop(_S.read(_v6, "C"), 1), _S.prop(_S.read(_v6, "C"), 2), _S.prop(_S.read(_v6, "C"), 3), _S.prop(_S.read(_v6, "C"), 3), _S.prop(_S.read(_v6, "C"), 4), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 5)]])
		else:
			var _v7 = _S.scope(_v6)
			_S.invoke(_S.read(_v7, "p"), "circle", [_S.binary("+", _S.read(_v7, "x"), _S.binary("*", _S.read(_v7, "r"), 0.15)), _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "r"), 0.25)), _S.read(_v7, "r"), _S.prop(_S.read(_v7, "C"), 4)])
			_S.invoke(_S.read(_v7, "p"), "circle", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "r"), 0.82), (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v7, "rho"), _S.binary("*", 6, _S.read(_v7, "k")))) else _S.prop(_S.read(_v7, "C"), 6))])
			_S.invoke(_S.read(_v7, "p"), "circle", [_S.binary("-", _S.read(_v7, "x"), _S.binary("*", _S.read(_v7, "r"), 0.25)), _S.binary("-", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "r"), 0.3)), _S.binary("*", _S.read(_v7, "r"), 0.5), _S.read(_v7, "WHITE")])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	if _S.truth(_S.unary("!", _S.read(_e, "back"))):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("-", _S.unary("-", _S.read(_e, "H")), 2), 38, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.34, _S.read(_e, "k"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("+", _S.binary("+", 12, _S.binary("*", 7, _S.call_value(_S.read(_e, "smooth"), [0, 1, _S.read(_e, "tt")]))), _S.binary("*", 15, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "ERUPT")), 1.2)])]))), _S.binary("-", 1, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "GONE"), 4.6, _S.read(_e, "tt")]))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.2, _S.read(_e, "tt")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [4, 4.85, _S.read(_e, "tt")])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "inPool", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.prop(_S.read(_e, "d"), "x"), _S.prop(_S.read(_e, "d"), "z")]), _S.call_value(_S.read(_e, "poolR"), [_S.read(_e, "t")])))
	_S.invoke(_S.read(_e, "rings"), "add", [_S.prop(_S.read(_e, "d"), "x"), _S.prop(_S.read(_e, "d"), "z"), 0.6, _S.binary("+", (2.5 if _S.truth(_S.read(_e, "inPool")) else 1.5), _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 1.6)), _S.binary("+", 0.32, _S.binary("*", _S.prop(_S.read(_e, "d"), "s"), 0.1)), _S.merge([{"n": 1}, {"k": (0.95 if _S.truth(_S.read(_e, "inPool")) else 0.7)}, {"hot": 0.05}])])
	_S.invoke(_S.read(_e, "plinks"), "push", [_S.merge([{"x": _S.prop(_S.read(_e, "d"), "x")}, {"y": _S.binary("*", _S.prop(_S.read(_e, "d"), "z"), _S.read(_e, "SY"))}, {"s": _S.prop(_S.read(_e, "d"), "s")}, {"age": 0}])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_e, "d"), "s"), 1), func(): return _S.unary("!", _S.prop(_S.read(_e, "d"), "small")))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 2)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "a", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "v", _S.invoke(_S.read(_v9, "R"), "range", [8, 28]))
			_S.invoke(_S.read(_v9, "drops"), "add", [_S.merge([{"x": _S.prop(_S.read(_v9, "d"), "x")}, {"z": _S.prop(_S.read(_v9, "d"), "z")}, {"h": 0.5}, {"vx": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "v"))}, {"vh": _S.invoke(_S.read(_v9, "R"), "range", [45, 95])}, {"s": 1}, {"small": true}, {"life": 1}])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "tt"), _S.read(_e, "ERUPT")), func(): return _S.binary(">", _S.read(_e, "tt"), _S.read(_e, "GONE")))):
		return 0
	return _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "HMAX"), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "ERUPT")), 0.3)])])), _S.binary("+", 0.93, _S.binary("*", 0.07, _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "tt"), 2.2), _S.read(_e, "S")])))), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.read(_e, "FALL")), _S.binary("-", _S.read(_e, "GONE"), _S.read(_e, "FALL")))])])))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "ERUPT"), 0.08), _S.binary("+", _S.read(_e, "ERUPT"), 0.3), _S.read(_e, "tt")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "FALL"), 0.1), _S.binary("+", _S.read(_e, "FALL"), 0.45), _S.read(_e, "tt")])))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	_S.define(_e, "h", 0)
	for _v10 in _S.array(_S.read(_e, "SPURTS")):
		var _v11 = _S.scope(_e)
		var _v12 = _v10
		_S.define(_v11, "s0", _S.prop(_v12, 0))
		_S.define(_v11, "hs", _S.prop(_v12, 1))
		_S.write(_v11, "h", _S.invoke(_S.read(_v11, "Math"), "max", [_S.read(_v11, "h"), _S.binary("*", _S.read(_v11, "hs"), _S.invoke(_S.read(_v11, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v11, "Math"), "PI"), _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v11, "tt"), _S.read(_v11, "s0")), 0.2)]))]))]), "=", false)
	return _S.read(_e, "h")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "key", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.invoke(_S.read(_e, "done"), "has", [_S.read(_e, "key")])), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "at"))), func(): return _S.invoke(_S.read(_e, "done"), "add", [_S.read(_e, "key")]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "R"), "chance", [_S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "rate"), _S.read(_e, "dt"))])])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "H", _S.call_value(_S.read(_e, "top"), [_S.read(_e, "t")]))
	_S.define(_e, "hk", _S.call_value(_S.read(_e, "head"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "ERUPT")))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.call_value(_S.read(_e, "emit"), [_S.binary("+", 1.5, _S.binary("*", _S.binary("*", 9, _S.read(_e, "k")), _S.read(_e, "k"))), _S.read(_e, "dt")]))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
		_S.define(_v13, "r", _S.invoke(_S.read(_v13, "R"), "range", [0, 7]))
		_S.define(_v13, "x", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "r")))
		_S.define(_v13, "z", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "r")))
		_S.invoke(_S.read(_v13, "pops"), "push", [_S.merge([{"x": _S.read(_v13, "x")}, {"y": _S.binary("-", _S.binary("*", _S.read(_v13, "z"), _S.read(_v13, "SY")), _S.invoke(_S.read(_v13, "R"), "range", [1, 3]))}, {"age": 0}, {"r": _S.invoke(_S.read(_v13, "R"), "range", [1, 2])}])])
		_S.invoke(_S.read(_v13, "rings"), "add", [_S.read(_v13, "x"), _S.read(_v13, "z"), 1, _S.invoke(_S.read(_v13, "R"), "range", [5, 9]), 0.55, _S.merge([{"n": 1}, {"k": 0.85}])])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.invoke(_S.read(_v14, "R"), "int", [1, 3]))):
			_S.invoke(_S.read(_v14, "drops"), "add", [_S.merge([{"x": _S.read(_v14, "x")}, {"z": _S.read(_v14, "z")}, {"h": 2}, {"vx": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 25), 25])}, {"vz": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 15), 15])}, {"vh": _S.invoke(_S.read(_v14, "R"), "range", [50, 120])}, {"s": 1}, {"small": true}, {"life": 1}])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT")), func(): return _S.call_value(_S.read(_e, "emit"), [_S.binary("+", 3, _S.binary("*", 7, _S.read(_e, "k"))), _S.read(_e, "dt")]))):
		_S.invoke(_S.read(_e, "mist"), "add", [_S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [1, 5])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [6, 18])), 2, _S.invoke(_S.read(_e, "R"), "range", [5, 9]), _S.invoke(_S.read(_e, "R"), "range", [0.9, 1.5]), _S.prop(_S.read(_e, "C"), 6), 0.22])
	for _v15 in _S.array(_S.read(_e, "SPURTS")):
		var _v16 = _S.scope(_e)
		var _v17 = _v15
		_S.define(_v16, "s0", _S.prop(_v17, 0))
		_S.define(_v16, "hs", _S.prop(_v17, 1))
		if _S.truth(_S.call_value(_S.read(_v16, "once"), [_S.binary("+", "spurt", _S.read(_v16, "s0")), _S.binary("+", _S.read(_v16, "s0"), 0.08)])):
			var _v18 = _S.scope(_v16)
			_S.define(_v18, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.binary("+", 3, _S.invoke(_S.read(_v18, "Math"), "round", [_S.binary("/", _S.read(_v18, "hs"), 4)])))):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "a", _S.invoke(_S.read(_v19, "R"), "range", [0, _S.read(_v19, "TAU")]))
				_S.define(_v19, "v", _S.invoke(_S.read(_v19, "R"), "range", [10, 40]))
				_S.invoke(_S.read(_v19, "drops"), "add", [_S.merge([{"x": 0}, {"z": 0}, {"h": _S.binary("*", _S.read(_v19, "hs"), 0.8)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "v"))}, {"vh": _S.invoke(_S.read(_v19, "R"), "range", [20, 90])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.3])) else 1)}])])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["erupt", _S.read(_e, "ERUPT")])):
		var _v20 = _S.scope(_e)
		_S.invoke(_S.read(_v20, "lights"), "add", [0, _S.unary("-", 26), 64, _S.prop(_S.read(_v20, "C"), 5), 0.85, 0.6])
		_S.invoke(_S.read(_v20, "lights"), "add", [0, _S.unary("-", 4), 28, _S.read(_v20, "WHITE"), 0.75, 0.1])
		_S.invoke(_S.read(_v20, "rings"), "add", [0, 0, 6, 40, 1.2, _S.merge([{"n": 2}, {"gap": 3}, {"k": 1.2}, {"hot": 0.12}, {"glint": 1}])])
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 44)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "a", _S.invoke(_S.read(_v22, "R"), "range", [0, _S.read(_v22, "TAU")]))
			_S.define(_v22, "v", _S.invoke(_S.read(_v22, "R"), "range", [30, 120]))
			_S.invoke(_S.read(_v22, "drops"), "add", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), 3)}, {"z": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), 3)}, {"h": _S.invoke(_S.read(_v22, "R"), "range", [2, 10])}, {"vx": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "v"))}, {"vh": _S.invoke(_S.read(_v22, "R"), "range", [180, 400])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.15])) else (2 if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.35])) else 1))}, {"delay": _S.invoke(_S.read(_v22, "R"), "range", [0, 0.12])}])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v23 = _S.scope(_v20)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 12)):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "s", (1 if _S.truth(_S.binary("%", _S.read(_v24, "i"), 2)) else _S.unary("-", 1)))
			_S.invoke(_S.read(_v24, "mist"), "add", [_S.binary("*", _S.read(_v24, "s"), _S.invoke(_S.read(_v24, "R"), "range", [3, 9])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [1, 6])), _S.binary("*", _S.read(_v24, "s"), _S.invoke(_S.read(_v24, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [4, 18])), 3, _S.invoke(_S.read(_v24, "R"), "range", [9, 14]), _S.invoke(_S.read(_v24, "R"), "range", [1.2, 1.9]), (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.invoke(_S.read(_v24, "R"), "chance", [0.5])) else _S.read(_v24, "WHITE")), 0.3, _S.invoke(_S.read(_v24, "R"), "range", [0, 0.15])])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
		var _v25 = _S.scope(_v20)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 14)):
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "STAR"), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 16), 16]), _S.unary("-", _S.invoke(_S.read(_v25, "R"), "range", [8, 80])), _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", 6), _S.invoke(_S.read(_v25, "R"), "range", [0.3, 0.7]), (_S.read(_v25, "WHITE") if _S.truth(_S.invoke(_S.read(_v25, "R"), "chance", [0.5])) else _S.prop(_S.read(_v25, "C"), 6)), _S.invoke(_S.read(_v25, "R"), "range", [1, 2.6]), _S.invoke(_S.read(_v25, "R"), "range", [0.05, 0.5])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "hk"), 0)):
		var _v26 = _S.scope(_e)
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 60, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "v", _S.invoke(_S.read(_v27, "R"), "range", [10, 60]))
			_S.invoke(_S.read(_v27, "drops"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 9), 9])}, {"z": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 4), 4])}, {"h": _S.binary("+", _S.read(_v27, "H"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 8), 3]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "v"))}, {"vh": _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 40), 60])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.08])) else (2 if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.3])) else 1))}])])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 9, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "mist"), "add", [_S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.unary("-", _S.read(_v26, "H")), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 2])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [14, 34])), 3, _S.invoke(_S.read(_v26, "R"), "range", [8, 13]), _S.invoke(_S.read(_v26, "R"), "range", [0.9, 1.4]), (_S.prop(_S.read(_v26, "C"), 6) if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.6])) else _S.read(_v26, "WHITE")), 0.2])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 5, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "mist"), "add", [_S.binary("*", _S.invoke(_S.read(_v26, "R"), "sign", []), _S.invoke(_S.read(_v26, "R"), "range", [3, 9])), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [1, 6])), _S.binary("*", _S.invoke(_S.read(_v26, "R"), "sign", []), _S.invoke(_S.read(_v26, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [2, 10])), 3, _S.invoke(_S.read(_v26, "R"), "range", [8, 12]), _S.invoke(_S.read(_v26, "R"), "range", [1, 1.6]), _S.prop(_S.read(_v26, "C"), 6), 0.22])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 40, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			var _v28 = _S.scope(_v26)
			_S.define(_v28, "s", _S.invoke(_S.read(_v28, "R"), "sign", []))
			_S.define(_v28, "hh", _S.invoke(_S.read(_v28, "R"), "range", [8, _S.binary("*", _S.read(_v28, "H"), 0.95)]))
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "FLAKE"), _S.binary("*", _S.read(_v28, "s"), _S.binary("+", 3, _S.binary("*", 6, _S.invoke(_S.read(_v28, "Math"), "pow", [_S.binary("/", _S.read(_v28, "hh"), _S.read(_v28, "H")), 1.8])))), _S.unary("-", _S.read(_v28, "hh")), _S.binary("*", _S.read(_v28, "s"), _S.invoke(_S.read(_v28, "R"), "range", [10, 45])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 20), 10]), _S.invoke(_S.read(_v28, "R"), "range", [0.6, 1.2]), (_S.read(_v28, "WHITE") if _S.truth(_S.invoke(_S.read(_v28, "R"), "chance", [0.5])) else _S.prop(_S.read(_v28, "C"), 6)), _S.invoke(_S.read(_v28, "R"), "range", [0.6, 1.3])])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 4, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "rings"), "add", [_S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 2), 2]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 2), 2]), 4, _S.binary("*", _S.call_value(_S.read(_v26, "poolR"), [_S.read(_v26, "t")]), _S.invoke(_S.read(_v26, "R"), "range", [0.7, 1])), 0.9, _S.merge([{"n": 1}, {"k": 0.8}])])
		if _S.truth(_S.call_value(_S.read(_v26, "emit"), [_S.binary("*", 7, _S.read(_v26, "hk")), _S.read(_v26, "dt")])):
			_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "STAR"), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [10, _S.binary("+", _S.read(_v26, "H"), 8)])), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 4), _S.invoke(_S.read(_v26, "R"), "range", [0.25, 0.55]), (_S.read(_v26, "WHITE") if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.4])) else _S.prop(_S.read(_v26, "C"), 6)), _S.invoke(_S.read(_v26, "R"), "range", [0.8, 2.2]), 0])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["collapse", _S.binary("+", _S.read(_e, "FALL"), 0.12)])):
		var _v29 = _S.scope(_e)
		var _v30 = _S.scope(_v29)
		_S.define(_v30, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "i"), 40)):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "a", _S.invoke(_S.read(_v31, "R"), "range", [0, _S.read(_v31, "TAU")]))
			_S.define(_v31, "v", _S.invoke(_S.read(_v31, "R"), "range", [15, 80]))
			_S.invoke(_S.read(_v31, "drops"), "add", [_S.merge([{"x": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 6), 6])}, {"z": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 3), 3])}, {"h": _S.binary("+", _S.call_value(_S.read(_v31, "top"), [_S.read(_v31, "t")]), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 8), 4]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "v"))}, {"vz": _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "v"))}, {"vh": _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 40), 60])}, {"s": (3 if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.12])) else (2 if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.35])) else 1))}, {"delay": _S.invoke(_S.read(_v31, "R"), "range", [0, 0.25])}])])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "i", 1, "+=", true)
		var _v32 = _S.scope(_v29)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), 6)):
			_S.invoke(_S.read(_v32, "mist"), "add", [_S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.unary("-", _S.call_value(_S.read(_v32, "top"), [_S.read(_v32, "t")])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 6), 6])), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [10, 26])), 4, _S.invoke(_S.read(_v32, "R"), "range", [9, 13]), _S.invoke(_S.read(_v32, "R"), "range", [0.8, 1.2]), _S.prop(_S.read(_v32, "C"), 6), 0.18])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", _S.binary("-", _S.prop(_S.read(_v33, "pops"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v33, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v33, "pops"), _S.read(_v33, "i")), "age", _S.read(_v33, "dt"), "+=", false), 0.12)):
			_S.invoke(_S.read(_v33, "pops"), "splice", [_S.read(_v33, "i"), 1])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "-=", true)
	var _v34 = _S.scope(_e)
	_S.define(_v34, "i", _S.binary("-", _S.prop(_S.read(_v34, "plinks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v34, "i"), 0)):
		if _S.truth(_S.binary(">", _S.set_prop(_S.prop(_S.read(_v34, "plinks"), _S.read(_v34, "i")), "age", _S.read(_v34, "dt"), "+=", false), 0.14)):
			_S.invoke(_S.read(_v34, "plinks"), "splice", [_S.read(_v34, "i"), 1])
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "drops"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "rings"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "mist"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pr", _S.call_value(_S.read(_e, "poolR"), [_S.read(_e, "t")]))
	_S.define(_e, "pk", _S.call_value(_S.read(_e, "poolK"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "pk"), 0)):
		_S.invoke(_S.read(_e, "p"), "each", [_S.unary("-", _S.read(_e, "pr")), _S.binary("*", _S.unary("-", _S.read(_e, "pr")), _S.read(_e, "SY")), _S.read(_e, "pr"), _S.binary("*", _S.read(_e, "pr"), _S.read(_e, "SY")), _S.function_value(_e, "_f15")])
	_S.invoke(_S.read(_e, "rings"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), _S.unary("-", 1)])
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ERUPT")), 0.4))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), 0, 0.5, _S.binary("+", 6, _S.binary("*", 42, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "u")]))), _S.read(_e, "SY"), _S.binary("*", 1.5, _S.binary("-", 1, _S.read(_e, "u"))), _S.read(_e, "C"), _S.merge([{"n": 3}, {"gap": _S.binary("+", 1.6, _S.binary("*", 2, _S.read(_e, "u")))}, {"half": _S.unary("-", 1)}, {"hot": _S.binary("<", _S.read(_e, "u"), 0.3)}, {"seed": 9}])])
	_S.call_value(_S.read(_e, "foamHead"), [_S.read(_e, "p"), _S.call_value(_S.read(_e, "top"), [_S.read(_e, "t")]), _S.call_value(_S.read(_e, "head"), [_S.read(_e, "t")]), true])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), "back"])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "d", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "pr")), 2), _S.binary("**", _S.binary("/", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "pr"), _S.read(_e, "SY"))), 2)))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.15)) else _S.prop(_S.read(_e, "C"), 1)), _S.binary("*", _S.binary("*", 0.6, _S.read(_e, "pk")), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "d")), 4)]))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "y"), 0), func(): return _S.binary(">", _S.read(_e, "d"), 0.78)), func(): return _S.binary("<", _S.read(_e, "d"), 0.95))):
		_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.7, _S.read(_e, "pk"))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "top"), [_S.read(_e, "t")]))
	_S.define(_e, "hk", _S.call_value(_S.read(_e, "head"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "ERUPT"))]))
	_S.define(_e, "thin", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "ERUPT"), _S.binary("+", _S.read(_e, "ERUPT"), 0.12), _S.read(_e, "t")]), _S.binary("-", 1, _S.binary("*", 0.55, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "FALL"), _S.read(_e, "GONE"), _S.read(_e, "t")])))))
	_S.invoke(_S.read(_e, "rings"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), 1])
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ERUPT")), 0.4))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 1))):
		_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), 0, 0.5, _S.binary("+", 6, _S.binary("*", 42, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "u")]))), _S.read(_e, "SY"), _S.binary("*", 1.5, _S.binary("-", 1, _S.read(_e, "u"))), _S.read(_e, "C"), _S.merge([{"n": 3}, {"gap": _S.binary("+", 1.6, _S.binary("*", 2, _S.read(_e, "u")))}, {"half": 1}, {"hot": _S.binary("<", _S.read(_e, "u"), 0.3)}, {"seed": 9}])])
	_S.define(_e, "fk", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "ERUPT"), _S.binary("+", _S.read(_e, "ERUPT"), 0.3), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "GONE"), 0.3), 4.4, _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "fk"), 0)):
		_S.call_value(_S.read(_e, "lace"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 8, _S.binary("*", 10, _S.read(_e, "fk"))), _S.binary("+", _S.binary("*", _S.binary("+", 8, _S.binary("*", 10, _S.read(_e, "fk"))), _S.read(_e, "SY")), 0.5), _S.read(_e, "fk"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "S")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "ERUPT"), 0.05))):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "beat", _S.invoke(_S.read(_v35, "Math"), "pow", [_S.invoke(_S.read(_v35, "Math"), "max", [0, _S.invoke(_S.read(_v35, "Math"), "sin", [_S.binary("*", _S.read(_v35, "t"), _S.binary("+", 8, _S.binary("*", _S.binary("*", 18, _S.read(_v35, "k")), _S.read(_v35, "k"))))])]), 3]))
		_S.define(_v35, "rd", _S.binary("+", _S.binary("+", 4, _S.binary("*", 3.5, _S.read(_v35, "k"))), _S.binary("*", 1.5, _S.read(_v35, "beat"))))
		_S.define(_v35, "hd", _S.binary("+", _S.binary("+", 1.5, _S.binary("*", 3, _S.read(_v35, "k"))), _S.binary("*", 3, _S.read(_v35, "beat"))))
		_S.invoke(_S.read(_v35, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_v35, "rd")), 1), _S.binary("-", _S.unary("-", _S.read(_v35, "hd")), 1), _S.binary("+", _S.read(_v35, "rd"), 1), 0.5, _S.function_value(_v35, "_f17")])
		_S.invoke(_S.read(_v35, "p"), "px", [_S.binary("*", _S.unary("-", _S.read(_v35, "rd")), 0.35), _S.binary("*", _S.unary("-", _S.read(_v35, "hd")), 0.6), _S.read(_v35, "WHITE")])
		_S.invoke(_S.read(_v35, "p"), "glow", [0, _S.unary("-", 5), _S.binary("+", _S.binary("+", 16, _S.binary("*", 16, _S.read(_v35, "k"))), _S.binary("*", 8, _S.read(_v35, "beat"))), _S.prop(_S.read(_v35, "C"), 5), _S.binary("+", _S.binary("+", 0.06, _S.binary("*", 0.12, _S.read(_v35, "k"))), _S.binary("*", 0.12, _S.read(_v35, "beat")))])
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spurt"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "sp"), 1), func(): return _S.binary("<", _S.read(_e, "H"), 1))):
		var _v36 = _S.scope(_e)
		_S.invoke(_S.read(_v36, "p"), "shade", [_S.unary("-", 2), _S.binary("-", _S.unary("-", _S.read(_v36, "sp")), 1), 2, 0, _S.function_value(_v36, "_f18")])
		_S.invoke(_S.read(_v36, "p"), "circle", [0, _S.unary("-", _S.read(_v36, "sp")), 1.3, _S.prop(_S.read(_v36, "C"), 6)])
		_S.invoke(_S.read(_v36, "p"), "px", [0, _S.binary("-", _S.unary("-", _S.read(_v36, "sp")), 1), _S.read(_v36, "WHITE")])
		_S.invoke(_S.read(_v36, "p"), "glowLine", [0, 0, 0, _S.unary("-", _S.read(_v36, "sp")), 8, _S.prop(_S.read(_v36, "C"), 5), 0.3])
	_S.call_value(_S.read(_e, "column"), [_S.read(_e, "p"), _S.read(_e, "H"), _S.read(_e, "thin")])
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "hk"), 0), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "H"), 1), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE"))))):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v37, "i"), 7)):
			var _v38 = _S.scope(_v37)
			_S.define(_v38, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v38, "i"), 7), _S.read(_v38, "TAU")), _S.binary("*", _S.read(_v38, "t"), 2.1)))
			_S.define(_v38, "r", _S.binary("+", 4, _S.binary("*", 2, _S.invoke(_S.read(_v38, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v38, "t"), 5), _S.binary("*", _S.read(_v38, "i"), 1.7))]))))
			_S.define(_v38, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "a")]), _S.read(_v38, "r")), 1.3))
			_S.define(_v38, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "a")]), _S.read(_v38, "r")), _S.read(_v38, "SY")), 2))
			_S.call_value(_S.read(_v38, "billow"), [_S.read(_v38, "p"), _S.read(_v38, "x"), _S.read(_v38, "y"), _S.binary("*", _S.binary("+", 1.6, _S.binary("*", 1.2, _S.call_value(_S.read(_v38, "rand"), [_S.read(_v38, "i"), _S.binary("+", _S.read(_v38, "S"), 4)]))), _S.invoke(_S.read(_v38, "Math"), "max", [_S.read(_v38, "hk"), _S.binary("*", _S.read(_v38, "thin"), 0.6)])), _S.read(_v38, "C")])
			_v37 = _S.iteration(_v37)
			_S.write(_v37, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "foamHead"), [_S.read(_e, "p"), _S.read(_e, "H"), _S.read(_e, "hk"), false])
	for _v39 in _S.array(_S.read(_e, "pops")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "q", _v39)
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "g", _S.binary("/", _S.prop(_S.read(_v41, "q"), "age"), 0.12))
		for _v42 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0.7, _S.unary("-", 0.7)], [_S.unary("-", 0.7), _S.unary("-", 0.7)], [0, _S.unary("-", 1)]]):
			var _v43 = _S.scope(_v41)
			var _v44 = _v42
			_S.define(_v43, "dx", _S.prop(_v44, 0))
			_S.define(_v43, "dy", _S.prop(_v44, 1))
			_S.invoke(_S.read(_v43, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v43, "q"), "x"), _S.binary("*", _S.read(_v43, "dx"), _S.binary("+", _S.prop(_S.read(_v43, "q"), "r"), _S.binary("*", 3, _S.read(_v43, "g"))))), _S.binary("+", _S.prop(_S.read(_v43, "q"), "y"), _S.binary("*", _S.read(_v43, "dy"), _S.binary("+", _S.prop(_S.read(_v43, "q"), "r"), _S.binary("*", 3, _S.read(_v43, "g"))))), _S.prop(_S.read(_v43, "C"), 6), _S.binary("-", 1, _S.read(_v43, "g"))])
	for _v45 in _S.array(_S.read(_e, "plinks")):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "q", _v45)
		var _v47 = _S.scope(_v46)
		_S.define(_v47, "g", _S.binary("/", _S.prop(_S.read(_v47, "q"), "age"), 0.14))
		if _S.truth(_S.binary("<", _S.read(_v47, "g"), 0.5)):
			_S.invoke(_S.read(_v47, "p"), "px", [_S.prop(_S.read(_v47, "q"), "x"), _S.prop(_S.read(_v47, "q"), "y"), _S.read(_v47, "WHITE")])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v47, "q"), "s"), 1)):
			_S.invoke(_S.read(_v47, "p"), "line", [_S.prop(_S.read(_v47, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v47, "q"), "y"), 1), _S.prop(_S.read(_v47, "q"), "x"), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v47, "q"), "y"), 1), _S.binary("*", 3, _S.binary("-", 1, _S.read(_v47, "g")))), (_S.read(_v47, "WHITE") if _S.truth(_S.binary("<", _S.read(_v47, "g"), 0.4)) else _S.prop(_S.read(_v47, "C"), 6))])
		_S.invoke(_S.read(_v47, "p"), "glow", [_S.prop(_S.read(_v47, "q"), "x"), _S.prop(_S.read(_v47, "q"), "y"), 4, _S.prop(_S.read(_v47, "C"), 5), _S.binary("*", 0.25, _S.binary("-", 1, _S.read(_v47, "g")))])
	_S.invoke(_S.read(_e, "drops"), "draw", [_S.read(_e, "p"), _S.read(_e, "C"), "front"])
	_S.define(_e, "f", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ERUPT")), 0.07))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1))):
		var _v48 = _S.scope(_e)
		_S.invoke(_S.read(_v48, "p"), "circle", [0, _S.unary("-", 4), _S.binary("*", 7, _S.binary("-", 1, _S.binary("*", _S.read(_v48, "f"), 0.4))), _S.read(_v48, "WHITE")])
		_S.invoke(_S.read(_v48, "p"), "ellipse", [0, 0, 12, 2.6, _S.function_value(_v48, "_f19")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "mist"), "draw", [_S.read(_e, "p"), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	if _S.truth(_S.binary(">", _S.read(_e, "H"), 1)):
		_S.invoke(_S.read(_e, "p"), "glowLine", [0, 0, 0, _S.unary("-", _S.read(_e, "H")), 26, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.2, _S.read(_e, "thin"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 46, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.24, _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "hk"), _S.binary("*", _S.binary("*", 0.3, _S.read(_e, "k")), (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ERUPT"))) else 0))]))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 2, 60, _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.12, _S.call_value(_S.read(_e, "poolK"), [_S.read(_e, "t")]))])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rd")))
	_S.define(_e, "dy", _S.binary("/", _S.read(_e, "y"), _S.read(_e, "hd")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "d"), 1), func(): return _S.binary(">", _S.read(_e, "y"), 0.5))):
		return null
	_S.define(_e, "lit", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), 0.7), _S.binary("*", _S.read(_e, "dy"), 0.7)))
	_S.define(_e, "rim", _S.binary(">", _S.read(_e, "d"), 0.68))
	_S.set_prop(_S.read(_e, "out"), "c", ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.3)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.15))) else _S.prop(_S.read(_e, "C"), 4))) if _S.truth(_S.read(_e, "rim")) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.55)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.12)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.3))) else _S.prop(_S.read(_e, "C"), 3))))), "=", false)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "x"), _S.binary("+", 1, _S.binary("*", 0.8, _S.binary("+", 1, _S.binary("/", _S.read(_e, "y"), _S.read(_e, "sp")))))))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "q")]), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.unary("-", 0.3))) else (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.35)) else _S.prop(_S.read(_e, "C"), 5))), "=", false)
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.6)) else _S.prop(_S.read(_e, "C"), 6))
