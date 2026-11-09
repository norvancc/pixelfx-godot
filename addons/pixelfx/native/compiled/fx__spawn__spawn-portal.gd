@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/spawn-portal.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "radius", _S.function_value(_e, "_f0"))
	_S.define(_e, "hole", _S.function_value(_e, "_f1"))
	_S.define(_e, "lip", _S.function_value(_e, "_f3"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "ring", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Spawn portal"}, {"desc": "A rift tears open on the floor and swirls, belches violet smoke and sparks, spits a fountain of wisps up out of itself, then twists shut with a pop."}, {"tags": ["spawn", "portal", "summon", "rift", "arcane", "smoke", "ground", "one-shot"]}, {"size": [208, 150]}, {"origin": [104, 122]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#12081f", "#2a0f4d", "#481b8c", "#7330d0", "#a35cff", "#cf9bff", "#f1dcff", "#ffffff"]}, {"width": 28}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OPEN", 0.3)
	_S.define(_e, "BELCH", [0.52, 0.76])
	_S.define(_e, "BURST", 1)
	_S.define(_e, "SHUT", 1.9)
	_S.define(_e, "POP", 2.22)
	_S.define(_e, "SY", 0.34)
	_S.define(_e, "VOID", _S.call_value(_S.read(_e, "hex"), ["#06030b"]))
	_S.define(_e, "FUME", _S.call_value(_S.read(_e, "hex"), ["#3a3046"]))
	_S.define(_e, "STONE", _S.invoke(["#1a1424", "#2b2639", "#4a4263", "#6c6488", "#9a91b4"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#5a5070"]))
	_S.define(_e, "spinAt", _S.function_value(_e, "_f19"))
	_S.define(_e, "lipAt", _S.function_value(_e, "_f20"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "RX", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OPEN"))):
		return _S.binary("*", _S.read(_e, "RX"), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "OPEN"))]), 2.2]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHUT"))):
		return _S.binary("*", _S.read(_e, "RX"), _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.035, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 9)]))), _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BURST")), 0.05), 2)), 0.006)]))))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SHUT")), _S.binary("-", _S.read(_e, "POP"), _S.read(_e, "SHUT")))]))
	return _S.binary("*", _S.read(_e, "RX"), (_S.binary("+", 1, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "k"), 0.35), _S.prop(_S.read(_e, "Math"), "PI")), 0.5)]))) if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.35)) else _S.binary("*", 1.1, _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.binary("-", _S.read(_e, "k"), 0.35), 0.65), 1.6])))))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "spin", _S.arg(_args, 3))
	_S.define(_e, "heat", _S.arg(_args, 4))
	_S.define(_e, "wind", _S.coalesce(_S.arg(_args, 5), func(): return 2.3))
	if _S.truth(_S.binary("<", _S.read(_e, "rx"), 1)):
		return null
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "SY")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "rx")), 2), _S.binary("-", _S.unary("-", _S.read(_e, "ry")), 2), _S.binary("+", _S.read(_e, "rx"), 2), _S.binary("+", _S.read(_e, "ry"), 2), _S.function_value(_e, "_f2")])
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [40, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "rx"), 5)])]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 3)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "j", 0)
		while _S.truth(_S.binary("<=", _S.read(_v1, "j"), _S.read(_v1, "n"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "q", _S.binary("+", 0.14, _S.binary("*", 0.82, _S.binary("/", _S.read(_v2, "j"), _S.read(_v2, "n")))))
			_S.define(_v2, "th", _S.binary("-", _S.binary("+", _S.read(_v2, "spin"), _S.binary("/", _S.binary("*", _S.read(_v2, "i"), _S.read(_v2, "TAU")), 3)), _S.binary("*", _S.read(_v2, "wind"), _S.invoke(_S.read(_v2, "Math"), "log", [_S.read(_v2, "q")]))))
			_S.define(_v2, "lip", _S.call_value(_S.read(_v2, "lipAt"), [_S.read(_v2, "th"), _S.read(_v2, "spin")]))
			_S.define(_v2, "x", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "th")]), _S.read(_v2, "q")), _S.read(_v2, "lip")), _S.read(_v2, "rx")))
			_S.define(_v2, "y", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "th")]), _S.read(_v2, "q")), _S.read(_v2, "lip")), _S.read(_v2, "ry")))
			_S.define(_v2, "c", ((_S.read(_v2, "WHITE") if _S.truth(_S.binary(">", _S.read(_v2, "heat"), 1.1)) else _S.prop(_S.read(_v2, "C"), 6)) if _S.truth(_S.binary(">", _S.read(_v2, "q"), 0.8)) else (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v2, "q"), 0.55)) else (_S.prop(_S.read(_v2, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v2, "q"), 0.32)) else _S.prop(_S.read(_v2, "C"), 3)))))
			_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.read(_v2, "c"), (1 if _S.truth(_S.binary(">", _S.read(_v2, "q"), 0.3)) else _S.binary("/", _S.read(_v2, "q"), 0.3))])
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v2, "q"), 0.4), func(): return _S.binary("===", _S.binary("%", _S.read(_v2, "j"), 2), 0))):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "t2", _S.binary("-", _S.read(_v3, "th"), 0.32))
				_S.define(_v3, "x2", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "t2")]), _S.read(_v3, "q")), 0.94), _S.read(_v3, "lip")), _S.read(_v3, "rx")))
				_S.define(_v3, "y2", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "t2")]), _S.read(_v3, "q")), 0.94), _S.read(_v3, "lip")), _S.read(_v3, "ry")))
				_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "x2"), _S.read(_v3, "y2"), (_S.prop(_S.read(_v3, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v3, "q"), 0.7)) else _S.prop(_S.read(_v3, "C"), 3)), 0.85])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "j", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, _S.binary("*", _S.read(_e, "rx"), 0.45), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.35, _S.read(_e, "heat"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rx")))
	_S.define(_e, "v", _S.binary("/", _S.read(_e, "y"), _S.read(_e, "ry")))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "u"), _S.read(_e, "v")]))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "v"), _S.read(_e, "u")]))
	_S.define(_e, "lip", _S.call_value(_S.read(_e, "lipAt"), [_S.read(_e, "th"), _S.read(_e, "spin")]))
	if _S.truth(_S.binary(">", _S.read(_e, "q"), _S.read(_e, "lip"))):
		return null
	_S.define(_e, "w", _S.binary("/", _S.read(_e, "q"), _S.read(_e, "lip")))
	_S.set_prop(_S.read(_e, "out"), "c", ((_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "w"), 0.86)) else _S.prop(_S.read(_e, "C"), 1)) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "v"), 0), func(): return _S.binary(">", _S.read(_e, "w"), 0.72))) else (_S.prop(_S.read(_e, "C"), 0) if _S.truth(_S.binary(">", _S.read(_e, "w"), 0.55)) else _S.read(_e, "VOID"))), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "spin", _S.arg(_args, 3))
	_S.define(_e, "heat", _S.arg(_args, 4))
	_S.define(_e, "near", _S.arg(_args, 5))
	if _S.truth(_S.binary("<", _S.read(_e, "rx"), 1)):
		return null
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "SY")))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.read(_e, "rx"), 7)]))
	var _v4 = _S.scope(_e)
	_S.define(_v4, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "j"), _S.read(_v4, "n"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "th", _S.binary("*", _S.binary("/", _S.read(_v5, "j"), _S.read(_v5, "n")), _S.read(_v5, "TAU")))
		_S.define(_v5, "s", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "th")]))
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v5, "s"), 0), _S.read(_v5, "near"))):
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "j", 1, "+=", true)
			continue
		_S.define(_v5, "l", _S.call_value(_S.read(_v5, "lipAt"), [_S.read(_v5, "th"), _S.read(_v5, "spin")]))
		_S.define(_v5, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "th")]), _S.read(_v5, "rx")), _S.read(_v5, "l")))
		_S.define(_v5, "y", _S.binary("*", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "ry")), _S.read(_v5, "l")))
		_S.define(_v5, "f", _S.call_value(_S.read(_v5, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v5, "th"), 9), _S.binary("*", _S.read(_v5, "spin"), 3)), 13]))
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "th")]), _S.binary("+", _S.binary("*", _S.read(_v5, "rx"), _S.read(_v5, "l")), 1.2)), _S.binary("*", _S.read(_v5, "s"), _S.binary("+", _S.binary("*", _S.read(_v5, "ry"), _S.read(_v5, "l")), 1)), _S.prop(_S.read(_v5, "C"), 1)])
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), _S.read(_v5, "y"), ((_S.read(_v5, "WHITE") if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v5, "f"), _S.unary("-", 0.3)), func(): return _S.binary(">", _S.read(_v5, "heat"), 1.1))) else _S.prop(_S.read(_v5, "C"), 6)) if _S.truth(_S.read(_v5, "near")) else (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v5, "f"), 0.2)) else _S.prop(_S.read(_v5, "C"), 5)))])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v5, "j"), 6), 0)):
			_S.invoke(_S.read(_v5, "p"), "glow", [_S.read(_v5, "x"), _S.read(_v5, "y"), 7, _S.prop(_S.read(_v5, "C"), 5), _S.binary("*", (0.3 if _S.truth(_S.read(_v5, "near")) else 0.2), _S.invoke(_S.read(_v5, "Math"), "min", [1.4, _S.read(_v5, "heat")]))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "j", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "drawSwirl", _S.function_value(_e, "_f5"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "RX", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f6"))
	_S.define(_e, "SM", [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 4), _S.read(_e, "FUME"), 0.4]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 3), _S.read(_e, "FUME"), 0.3]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "C"), 5), _S.read(_e, "FUME"), 0.55])])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "swirl", [])
	_S.define(_e, "wisps", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "done", _S.merge([]))
	_S.define(_e, "t", 0)
	_S.define(_e, "addSwirl", _S.function_value(_e, "_f7"))
	_S.define(_e, "pull", _S.function_value(_e, "_f8"))
	_S.define(_e, "puff", _S.function_value(_e, "_f9"))
	_S.define(_e, "sparks", _S.function_value(_e, "_f10"))
	_S.define(_e, "once", _S.function_value(_e, "_f11"))
	return _S.merge([{"update": _S.function_value(_e, "_f12")}, {"drawBack": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f15")}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "near", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "t"), _S.read(_e, "RX")]))
	for _v6 in _S.array(_S.read(_e, "swirl")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "s", _v6)
		var _v8 = _S.scope(_v7)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "j"), 3)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "a", _S.binary("-", _S.prop(_S.read(_v10, "s"), "a"), _S.binary("*", _S.binary("*", _S.read(_v10, "j"), 0.08), _S.binary("/", 1.4, _S.invoke(_S.read(_v10, "Math"), "max", [0.3, _S.prop(_S.read(_v10, "s"), "r")])))))
			_S.define(_v10, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.prop(_S.read(_v10, "s"), "r")), _S.read(_v10, "rx")))
			_S.define(_v10, "y", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.prop(_S.read(_v10, "s"), "r")), _S.read(_v10, "rx")), _S.read(_v10, "SY")))
			if _S.truth(_S.binary("!==", _S.binary(">=", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), 0), _S.read(_v10, "near"))):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "j", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), _S.binary("-", _S.read(_v10, "y"), 0.5), (_S.prop(_S.read(_v10, "C"), 5) if _S.truth(_S.read(_v10, "j")) else _S.prop(_S.read(_v10, "s"), "c")), (_S.binary("-", 0.9, _S.binary("*", _S.read(_v10, "j"), 0.3)) if _S.truth(_S.read(_v10, "j")) else 1)])
			if _S.truth(_S.unary("!", _S.read(_v10, "j"))):
				_S.invoke(_S.read(_v10, "p"), "glow", [_S.read(_v10, "x"), _S.read(_v10, "y"), 3, _S.prop(_S.read(_v10, "C"), 5), 0.35])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "j", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r0", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "swirl"), "push", [_S.merge([{"a": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"r": _S.read(_e, "r0")}, {"w": _S.invoke(_S.read(_e, "R"), "range", [2.2, 4])}, {"in": _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.7])}, {"c": _S.invoke(_S.read(_e, "R"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]])}])])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 1.03), _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 1.97)]))
	_S.define(_e, "D", _S.invoke(_S.read(_e, "R"), "range", [40, 86]))
	_S.define(_e, "T", _S.invoke(_S.read(_e, "R"), "range", [0.24, 0.42]))
	_S.define(_e, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "D")), 1.08))
	_S.define(_e, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "D")), 0.85))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y")]))
	_S.define(_e, "v", _S.binary("/", _S.binary("*", 0.6, _S.read(_e, "l")), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", 0.6), _S.read(_e, "T"))]))))
	_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "MOTE"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "l")), _S.read(_e, "v")), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_e, "y")), _S.read(_e, "l")), _S.read(_e, "v")), _S.read(_e, "T"), _S.invoke(_S.read(_e, "R"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]]), _S.invoke(_S.read(_e, "R"), "range", [1, 1.7])])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	_S.define(_e, "big", _S.arg(_args, 1))
	_S.define(_e, "sp", _S.arg(_args, 2))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.read(_v11, "n"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")]))
		_S.define(_v12, "d", _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [0, 0.55]), _S.read(_v12, "RX")))
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SMOKE"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "d")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "d")), _S.read(_v12, "SY")), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v12, "sp")), 0.6), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [0.4, 1])), _S.read(_v12, "sp")), _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [1.2, 2.2]), (1.15 if _S.truth(_S.read(_v12, "big")) else 0.8)), _S.invoke(_S.read(_v12, "R"), "pick", [_S.read(_v12, "SM")]), _S.binary("*", _S.invoke(_S.read(_v12, "R"), "range", [2.8, 4.6]), (1.15 if _S.truth(_S.read(_v12, "big")) else 0.9)), (_S.invoke(_S.read(_v12, "R"), "range", [0, 0.3]) if _S.truth(_S.read(_v12, "big")) else _S.invoke(_S.read(_v12, "R"), "range", [0, 0.1])), (_S.prop(_S.read(_v12, "PF"), "BIG") if _S.truth(_S.read(_v12, "big")) else 0)])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	_S.define(_e, "up", _S.arg(_args, 1))
	_S.define(_e, "spread", _S.arg(_args, 2))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), _S.read(_v13, "n"))):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", _S.read(_v14, "spread")), _S.read(_v14, "spread")])))
		_S.define(_v14, "sp", _S.binary("*", _S.invoke(_S.read(_v14, "R"), "range", [0.5, 1]), _S.read(_v14, "up")))
		_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 0.5), 0.5]), _S.read(_v14, "RX")), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.invoke(_S.read(_v14, "R"), "range", [0.35, 0.8])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "done"), _S.read(_e, "k"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "at"))), func(): return _S.set_prop(_S.read(_e, "done"), _S.read(_e, "k"), true, "=", false))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "shutting", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SHUT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))))
	if _S.truth(_S.logical("&&", _S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OPEN"), 0.15)), func(): return _S.read(_e, "shutting")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.55]))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "s", _S.invoke(_S.read(_v15, "R"), "sign", []))
		_S.define(_v15, "D", _S.invoke(_S.read(_v15, "R"), "range", [_S.binary("*", _S.read(_v15, "RX"), 1.3), _S.binary("*", _S.read(_v15, "RX"), 2.4)]))
		_S.define(_v15, "T", _S.invoke(_S.read(_v15, "R"), "range", [0.18, 0.3]))
		_S.define(_v15, "v", _S.binary("/", _S.binary("*", _S.read(_v15, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v15, "Math"), "exp", [_S.binary("*", 3, _S.read(_v15, "T"))]), 1)))
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "STREAK"), _S.binary("*", _S.read(_v15, "s"), _S.read(_v15, "D")), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [0, 3])), _S.binary("*", _S.unary("-", _S.read(_v15, "s")), _S.read(_v15, "v")), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 2), 2]), _S.read(_v15, "T"), (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.5])) else _S.prop(_S.read(_v15, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.1), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "POP"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [(0.85 if _S.truth(_S.read(_e, "shutting")) else (0.55 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURST"))) else 0.1))]))):
		_S.call_value(_S.read(_e, "pull"), [])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary(">", _S.read(_e, "t"), 0.12)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [(0.5 if _S.truth(_S.read(_e, "shutting")) else 0.25)]))):
		_S.call_value(_S.read(_e, "addSwirl"), [_S.invoke(_S.read(_e, "R"), "range", [1.1, 1.5])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["open", _S.binary("*", _S.read(_e, "OPEN"), 0.7)])):
		var _v16 = _S.scope(_e)
		_S.invoke(_S.read(_v16, "lights"), "add", [0, _S.unary("-", 8), 50, _S.prop(_S.read(_v16, "C"), 4), 0.75, 0.45])
		_S.invoke(_S.read(_v16, "rings"), "push", [_S.merge([{"t0": _S.read(_v16, "t")}, {"life": 0.42}, {"r0": _S.binary("*", _S.read(_v16, "RX"), 0.8)}, {"r1": _S.binary("*", _S.read(_v16, "RX"), 1.9)}, {"th": 2.5}, {"hot": true}])])
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 8)):
			_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "DUST"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v17, "R"), "sign", []), _S.invoke(_S.read(_v17, "R"), "range", [0.7, 1.1])), _S.read(_v17, "RX")), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v17, "R"), "sign", []), _S.invoke(_S.read(_v17, "R"), "range", [10, 45])), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [4, 14])), _S.invoke(_S.read(_v17, "R"), "range", [0.4, 0.7]), _S.read(_v17, "DUST"), _S.invoke(_S.read(_v17, "R"), "range", [1.5, 3])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["b0", _S.prop(_S.read(_e, "BELCH"), 0)])):
		_S.last([_S.call_value(_S.read(_e, "puff"), [6, false, 34]), _S.call_value(_S.read(_e, "sparks"), [8, 210, 0.55]), _S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 6), 44, _S.prop(_S.read(_e, "C"), 4), 0.6, 0.3])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["b1", _S.prop(_S.read(_e, "BELCH"), 1)])):
		_S.last([_S.call_value(_S.read(_e, "puff"), [8, false, 40]), _S.call_value(_S.read(_e, "sparks"), [12, 240, 0.6]), _S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 6), 48, _S.prop(_S.read(_e, "C"), 4), 0.65, 0.3])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["burst", _S.read(_e, "BURST")])):
		var _v18 = _S.scope(_e)
		_S.invoke(_S.read(_v18, "lights"), "add", [0, _S.unary("-", 26), 74, _S.prop(_S.read(_v18, "C"), 4), 1, 0.75])
		_S.invoke(_S.read(_v18, "lights"), "add", [0, _S.unary("-", 10), 40, _S.read(_v18, "WHITE"), 0.85, 0.14])
		_S.invoke(_S.read(_v18, "rings"), "push", [_S.merge([{"t0": _S.read(_v18, "t")}, {"life": 0.55}, {"r0": _S.binary("*", _S.read(_v18, "RX"), 1)}, {"r1": _S.binary("*", _S.read(_v18, "RX"), 2.5)}, {"th": 3.5}, {"hot": true}]), _S.merge([{"t0": _S.binary("+", _S.read(_v18, "t"), 0.06)}, {"life": 0.45}, {"r0": _S.binary("*", _S.read(_v18, "RX"), 0.8)}, {"r1": _S.binary("*", _S.read(_v18, "RX"), 1.8)}, {"th": 2}, {"hot": false}])])
		_S.call_value(_S.read(_v18, "puff"), [18, true, 70])
		_S.call_value(_S.read(_v18, "sparks"), [34, 400, 0.8])
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 5)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "Math"), "PI")), 2), _S.binary("*", _S.binary("-", _S.read(_v20, "i"), 2), 0.27)), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 0.08), 0.08])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [185, 235]))
			_S.invoke(_S.read(_v20, "wisps"), "push", [_S.merge([{"x": _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 4), 4])}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp"))}, {"life": _S.invoke(_S.read(_v20, "R"), "range", [0.75, 1])}, {"max": 1}, {"tr": []}, {"acc": 0}, {"ph": _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")])}])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v18)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 12)):
			_S.invoke(_S.read(_v21, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v21, "B"), "CHUNK")}, {"x": _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v21, "R"), "sign", []), _S.invoke(_S.read(_v21, "R"), "range", [0.75, 1.05])), _S.read(_v21, "RX"))}, {"y": _S.unary("-", 1)}, {"vx": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 100), 100])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [150, 280]))}, {"g": 1}, {"drag": 0.4}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [1.3, 1.9])}, {"a": _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "TAU")])}, {"va": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v21, "R"), "range", [1, 2.4])}, {"ramp": _S.read(_v21, "STONE")}])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v22 = _S.scope(_v18)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 14)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v22, "RX")), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [4, 34])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [10, 60])), _S.invoke(_S.read(_v22, "R"), "range", [0.5, 1.1]), _S.invoke(_S.read(_v22, "R"), "pick", [[_S.read(_v22, "WHITE"), _S.prop(_S.read(_v22, "C"), 6), _S.prop(_S.read(_v22, "C"), 5)]]), _S.invoke(_S.read(_v22, "R"), "range", [0.8, 2])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SHUT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.16]))):
		_S.call_value(_S.read(_e, "puff"), [1, false, 22])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SHUT"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.06]))):
		_S.call_value(_S.read(_e, "sparks"), [1, 160, 0.4])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["pop", _S.read(_e, "POP")])):
		var _v23 = _S.scope(_e)
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 4), 50, _S.prop(_S.read(_v23, "C"), 4), 0.95, 0.5])
		_S.invoke(_S.read(_v23, "lights"), "add", [0, _S.unary("-", 2), 28, _S.read(_v23, "WHITE"), 0.9, 0.12])
		_S.invoke(_S.read(_v23, "rings"), "push", [_S.merge([{"t0": _S.read(_v23, "t")}, {"life": 0.35}, {"r0": 2}, {"r1": _S.binary("*", _S.read(_v23, "RX"), 1.9)}, {"th": 2.5}, {"hot": true}])])
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 18)):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "a", _S.invoke(_S.read(_v25, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v25, "Math"), "PI")), 0]))
			_S.define(_v25, "sp", _S.invoke(_S.read(_v25, "R"), "range", [90, 270]))
			_S.invoke(_S.read(_v25, "ps"), "spawn", [_S.prop(_S.read(_v25, "P"), "SPARK"), 0, _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "cos", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.read(_v25, "a")]), _S.read(_v25, "sp")), 0.8), _S.invoke(_S.read(_v25, "R"), "range", [0.25, 0.6])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
		var _v26 = _S.scope(_v23)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), 9)):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "a", _S.invoke(_S.read(_v27, "R"), "range", [0, _S.read(_v27, "TAU")]))
			_S.define(_v27, "sp", _S.invoke(_S.read(_v27, "R"), "range", [30, 95]))
			_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "STAR"), 0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "cos", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.read(_v27, "a")]), _S.read(_v27, "sp")), 0.5), 20), _S.invoke(_S.read(_v27, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v27, "R"), "pick", [[_S.read(_v27, "WHITE"), _S.prop(_S.read(_v27, "C"), 6)]]), _S.invoke(_S.read(_v27, "R"), "range", [0.8, 1.8])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		var _v28 = _S.scope(_v23)
		_S.define(_v28, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "i"), 6)):
			_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "SMOKE"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [1, 4])), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 34), 34]), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [10, 30])), _S.invoke(_S.read(_v28, "R"), "range", [0.8, 1.3]), _S.prop(_S.read(_v28, "SM"), 2), _S.invoke(_S.read(_v28, "R"), "range", [2.5, 4.5])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "i", 1, "+=", true)
		var _v29 = _S.scope(_v23)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 14)):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 1), 1]), _S.read(_v29, "RX")), 0.9), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [0.5, 2])), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [0, 4])), _S.invoke(_S.read(_v29, "R"), "range", [0.6, 1.4]), _S.invoke(_S.read(_v29, "R"), "pick", [[_S.prop(_S.read(_v29, "C"), 6), _S.prop(_S.read(_v29, "C"), 5), _S.prop(_S.read(_v29, "C"), 5)]]), _S.invoke(_S.read(_v29, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v29, "R"), "range", [0, 0.25])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", _S.binary("-", _S.prop(_S.read(_v30, "swirl"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v30, "i"), 0)):
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "s", _S.prop(_S.read(_v31, "swirl"), _S.read(_v31, "i")))
		_S.define(_v31, "k", (2.4 if _S.truth(_S.read(_v31, "shutting")) else 1))
		_S.set_prop(_S.read(_v31, "s"), "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v31, "s"), "w"), _S.read(_v31, "k")), _S.read(_v31, "dt")), _S.binary("/", 1.4, _S.invoke(_S.read(_v31, "Math"), "max", [0.3, _S.prop(_S.read(_v31, "s"), "r")]))), "+=", false)
		_S.set_prop(_S.read(_v31, "s"), "r", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v31, "s"), "in"), _S.read(_v31, "k")), _S.read(_v31, "dt")), "-=", false)
		if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v31, "s"), "r"), 0.25), func(): return _S.binary(">", _S.read(_v31, "t"), _S.read(_v31, "POP")))):
			_S.invoke(_S.read(_v31, "swirl"), "splice", [_S.read(_v31, "i"), 1])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "-=", true)
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", _S.binary("-", _S.prop(_S.read(_v32, "wisps"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v32, "i"), 0)):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "w", _S.prop(_S.read(_v33, "wisps"), _S.read(_v33, "i")))
		_S.invoke(_S.prop(_S.read(_v33, "w"), "tr"), "unshift", [[_S.prop(_S.read(_v33, "w"), "x"), _S.prop(_S.read(_v33, "w"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v33, "w"), "tr"), "length"), 12)):
			_S.invoke(_S.prop(_S.read(_v33, "w"), "tr"), "pop", [])
		if _S.truth(_S.logical("||", _S.binary("<=", _S.set_prop(_S.read(_v33, "w"), "life", _S.read(_v33, "dt"), "-=", false), 0), func(): return _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v33, "w"), "vy"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v33, "w"), "y"), _S.unary("-", 2))))):
			var _v34 = _S.scope(_v33)
			var _v35 = _S.scope(_v34)
			_S.define(_v35, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v35, "j"), 8)):
				var _v36 = _S.scope(_v35)
				_S.define(_v36, "a", _S.invoke(_S.read(_v36, "R"), "range", [0, _S.read(_v36, "TAU")]))
				_S.define(_v36, "sp", _S.invoke(_S.read(_v36, "R"), "range", [30, 120]))
				_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "SPARK"), _S.prop(_S.read(_v36, "w"), "x"), _S.prop(_S.read(_v36, "w"), "y"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v36, "Math"), "cos", [_S.read(_v36, "a")]), _S.read(_v36, "sp")), _S.binary("*", _S.prop(_S.read(_v36, "w"), "vx"), 0.2)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v36, "Math"), "sin", [_S.read(_v36, "a")]), _S.read(_v36, "sp")), _S.binary("*", _S.prop(_S.read(_v36, "w"), "vy"), 0.2)), _S.invoke(_S.read(_v36, "R"), "range", [0.2, 0.5])])
				_v35 = _S.iteration(_v35)
				_S.write(_v35, "j", 1, "+=", true)
			_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "STAR"), _S.prop(_S.read(_v34, "w"), "x"), _S.prop(_S.read(_v34, "w"), "y"), 0, _S.unary("-", 6), 0.45, _S.read(_v34, "WHITE"), 2.4])
			_S.invoke(_S.read(_v34, "lights"), "add", [_S.prop(_S.read(_v34, "w"), "x"), _S.prop(_S.read(_v34, "w"), "y"), 24, _S.prop(_S.read(_v34, "C"), 5), 0.65, 0.25])
			_S.invoke(_S.read(_v34, "wisps"), "splice", [_S.read(_v34, "i"), 1])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v33, "w"), "vy", _S.binary("*", 360, _S.read(_v33, "dt")), "+=", false)
		_S.set_prop(_S.read(_v33, "w"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("-", _S.prop(_S.read(_v33, "w"), "max"), _S.prop(_S.read(_v33, "w"), "life")), 16), _S.prop(_S.read(_v33, "w"), "ph"))]), 160), _S.read(_v33, "dt")), "+=", false)
		_S.set_prop(_S.read(_v33, "w"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vx"), 1.1), _S.read(_v33, "dt")), "-=", false)
		_S.set_prop(_S.read(_v33, "w"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vy"), 1.1), _S.read(_v33, "dt")), "-=", false)
		_S.set_prop(_S.read(_v33, "w"), "x", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vx"), _S.read(_v33, "dt")), "+=", false)
		_S.set_prop(_S.read(_v33, "w"), "y", _S.binary("*", _S.prop(_S.read(_v33, "w"), "vy"), _S.read(_v33, "dt")), "+=", false)
		var _v37 = _S.scope(_v33)
		_S.set_prop(_S.read(_v37, "w"), "acc", _S.read(_v37, "dt"), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v37, "w"), "acc"), 0.03)):
			_S.invoke(_S.read(_v37, "ps"), "spawn", [_S.prop(_S.read(_v37, "P"), "SMOKE"), _S.prop(_S.read(_v37, "w"), "x"), _S.prop(_S.read(_v37, "w"), "y"), _S.binary("*", _S.prop(_S.read(_v37, "w"), "vx"), 0.05), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v37, "w"), "vy"), 0.05), 4), _S.invoke(_S.read(_v37, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v37, "SM"), 0), _S.invoke(_S.read(_v37, "R"), "range", [1.5, 2.4])])
			_v37 = _S.iteration(_v37)
			_S.set_prop(_S.read(_v37, "w"), "acc", 0.03, "-=", false)
		if _S.truth(_S.invoke(_S.read(_v33, "R"), "chance", [0.3])):
			_S.invoke(_S.read(_v33, "ps"), "spawn", [_S.prop(_S.read(_v33, "P"), "MOTE"), _S.prop(_S.read(_v33, "w"), "x"), _S.prop(_S.read(_v33, "w"), "y"), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v33, "w"), "vx")), 0.2), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 15), 15])), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v33, "w"), "vy")), 0.2), _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 15), 15])), _S.invoke(_S.read(_v33, "R"), "range", [0.2, 0.4]), _S.prop(_S.read(_v33, "C"), 6), 0.6])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "-=", true)
	var _v38 = _S.scope(_e)
	_S.define(_v38, "i", _S.binary("-", _S.prop(_S.read(_v38, "rings"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v38, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v38, "t"), _S.prop(_S.prop(_S.read(_v38, "rings"), _S.read(_v38, "i")), "t0")), _S.prop(_S.prop(_S.read(_v38, "rings"), _S.read(_v38, "i")), "life"))):
			_S.invoke(_S.read(_v38, "rings"), "splice", [_S.read(_v38, "i"), 1])
		_v38 = _S.iteration(_v38)
		_S.write(_v38, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	for _v39 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "b", _v39)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v40, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v40, "b"), "dusted")))):
			var _v41 = _S.scope(_v40)
			_S.set_prop(_S.read(_v41, "b"), "dusted", true, "=", false)
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v42, "i"), 2)):
				_S.invoke(_S.read(_v42, "ps"), "spawn", [_S.prop(_S.read(_v42, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v42, "b"), "x"), _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v42, "R"), "sign", []), _S.invoke(_S.read(_v42, "R"), "range", [6, 30])), _S.unary("-", _S.invoke(_S.read(_v42, "R"), "range", [2, 12])), _S.invoke(_S.read(_v42, "R"), "range", [0.3, 0.6]), _S.read(_v42, "DUST"), _S.invoke(_S.read(_v42, "R"), "range", [1.2, 2.4])])
				_v42 = _S.iteration(_v42)
				_S.write(_v42, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "rx", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "t"), _S.read(_e, "RX")]))
	_S.define(_e, "spin", _S.call_value(_S.read(_e, "spinAt"), [_S.read(_e, "t")]))
	_S.define(_e, "heat", _S.binary("+", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 7)]))), _S.binary("*", 0.6, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BURST")), 2)), 0.01)]))))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
		var _v43 = _S.scope(_e)
		_S.invoke(_S.read(_v43, "p"), "glow", [0, _S.unary("-", 4), _S.binary("+", _S.binary("*", _S.read(_v43, "rx"), 1.8), 10), _S.prop(_S.read(_v43, "C"), 4), _S.binary("*", 0.32, _S.call_value(_S.read(_v43, "clamp"), [_S.binary("/", _S.read(_v43, "rx"), _S.read(_v43, "RX"))]))])
		_S.invoke(_S.read(_v43, "p"), "glowLine", [0, _S.unary("-", 2), 0, _S.unary("-", 44), _S.binary("+", _S.binary("*", _S.read(_v43, "rx"), 0.7), 6), _S.prop(_S.read(_v43, "C"), 4), _S.binary("*", 0.16, _S.call_value(_S.read(_v43, "clamp"), [_S.binary("/", _S.read(_v43, "rx"), _S.read(_v43, "RX"))]))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "OPEN"), 0.6))):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "k", _S.binary("/", _S.read(_v44, "t"), _S.binary("*", _S.read(_v44, "OPEN"), 0.6)))
		_S.define(_v44, "L", _S.binary("*", _S.binary("*", _S.read(_v44, "RX"), 1.1), _S.invoke(_S.read(_v44, "ease"), "outCubic", [_S.read(_v44, "k")])))
		_S.invoke(_S.read(_v44, "p"), "line", [_S.unary("-", _S.read(_v44, "L")), 0, _S.read(_v44, "L"), 0, _S.function_value(_v44, "_f14")])
		_S.invoke(_S.read(_v44, "p"), "glowLine", [_S.unary("-", _S.read(_v44, "L")), 0, _S.read(_v44, "L"), 0, 7, _S.prop(_S.read(_v44, "C"), 5), 0.6])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "OPEN"), 0.35)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v45 = _S.scope(_e)
		_S.call_value(_S.read(_v45, "hole"), [_S.read(_v45, "p"), _S.read(_v45, "C"), _S.read(_v45, "rx"), _S.read(_v45, "spin"), _S.binary("+", _S.read(_v45, "heat"), _S.binary("*", 0.4, _S.call_value(_S.read(_v45, "smooth"), [_S.read(_v45, "SHUT"), _S.read(_v45, "POP"), _S.read(_v45, "t")]))), _S.binary("+", 2.3, _S.binary("*", 2.6, _S.call_value(_S.read(_v45, "smooth"), [_S.read(_v45, "SHUT"), _S.binary("-", _S.read(_v45, "POP"), 0.05), _S.read(_v45, "t")])))])
		_S.call_value(_S.read(_v45, "lip"), [_S.read(_v45, "p"), _S.read(_v45, "C"), _S.read(_v45, "rx"), _S.read(_v45, "spin"), _S.read(_v45, "heat"), false])
	for _v46 in _S.array(_S.read(_e, "rings")):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "r", _v46)
		_S.call_value(_S.read(_v47, "ring"), [_S.read(_v47, "p"), _S.read(_v47, "C"), _S.read(_v47, "r"), _S.read(_v47, "t"), false])
	_S.call_value(_S.read(_e, "drawSwirl"), [_S.read(_e, "p"), false])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), 0.5)]), 0.3)) else _S.prop(_S.read(_e, "C"), 6))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "rx", _S.call_value(_S.read(_e, "radius"), [_S.read(_e, "t"), _S.read(_e, "RX")]))
	_S.define(_e, "spin", _S.call_value(_S.read(_e, "spinAt"), [_S.read(_e, "t")]))
	_S.define(_e, "heat", _S.binary("+", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 7)]))), _S.binary("*", 0.6, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BURST")), 2)), 0.01)]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "OPEN"), 0.35)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP")))):
		_S.call_value(_S.read(_e, "lip"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "rx"), _S.read(_e, "spin"), _S.read(_e, "heat"), true])
	for _v48 in _S.array(_S.read(_e, "rings")):
		var _v49 = _S.scope(_e)
		_S.define(_v49, "r", _v48)
		_S.call_value(_S.read(_v49, "ring"), [_S.read(_v49, "p"), _S.read(_v49, "C"), _S.read(_v49, "r"), _S.read(_v49, "t"), true])
	_S.call_value(_S.read(_e, "drawSwirl"), [_S.read(_e, "p"), true])
	_S.define(_e, "b", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BURST")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "b"), 0), func(): return _S.binary("<", _S.read(_e, "b"), 0.45))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "k", _S.binary("/", _S.read(_v50, "b"), 0.45))
		_S.define(_v50, "top", _S.binary("*", _S.unary("-", 84), _S.invoke(_S.read(_v50, "ease"), "outExpo", [_S.call_value(_S.read(_v50, "clamp"), [_S.binary("/", _S.read(_v50, "b"), 0.14)])])))
		_S.define(_v50, "bot", _S.binary("-", _S.unary("-", 1), _S.binary("*", 60, _S.invoke(_S.read(_v50, "ease"), "inQuad", [_S.read(_v50, "k")]))))
		_S.define(_v50, "w0", _S.binary("*", _S.binary("*", _S.read(_v50, "RX"), 0.55), _S.binary("-", 1, _S.binary("*", _S.read(_v50, "k"), 0.8))))
		_S.invoke(_S.read(_v50, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_v50, "w0")), 1), _S.read(_v50, "top"), _S.binary("+", _S.read(_v50, "w0"), 1), _S.read(_v50, "bot"), _S.function_value(_v50, "_f16")])
		_S.invoke(_S.read(_v50, "p"), "glowLine", [0, _S.read(_v50, "bot"), 0, _S.read(_v50, "top"), _S.binary("+", _S.read(_v50, "w0"), 12), _S.prop(_S.read(_v50, "C"), 5), _S.binary("*", 0.55, _S.binary("-", 1, _S.read(_v50, "k")))])
		if _S.truth(_S.binary("<", _S.read(_v50, "b"), 0.14)):
			_S.call_value(_S.read(_v50, "flare"), [_S.read(_v50, "p"), 0, _S.unary("-", 4), _S.binary("*", 36, _S.binary("-", 1, _S.binary("/", _S.read(_v50, "b"), 0.14))), _S.binary("-", 1, _S.binary("/", _S.read(_v50, "b"), 0.14)), _S.read(_v50, "C")])
	_S.define(_e, "q", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "q"), _S.unary("-", 0.08)), func(): return _S.binary("<", _S.read(_e, "q"), 0.25))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 1), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", (4 if _S.truth(_S.binary("<", _S.read(_e, "q"), 0)) else 12), _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "q"), 0.25)])))]), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.7, _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "q"), 0.25)])))])
	_S.invoke(_S.read(_e, "rocks"), "draw", [_S.read(_e, "p")])
	for _v51 in _S.array(_S.read(_e, "wisps")):
		var _v52 = _S.scope(_e)
		_S.define(_v52, "w", _v51)
		var _v53 = _S.scope(_v52)
		_S.define(_v53, "k", _S.binary("/", _S.prop(_S.read(_v53, "w"), "life"), _S.prop(_S.read(_v53, "w"), "max")))
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v54, "i"), _S.prop(_S.prop(_S.read(_v54, "w"), "tr"), "length"))):
			var _v55 = _S.scope(_v54)
			var _v56 = _S.prop(_S.prop(_S.read(_v55, "w"), "tr"), _S.binary("-", _S.read(_v55, "i"), 1))
			_S.define(_v55, "x0", _S.prop(_v56, 0))
			_S.define(_v55, "y0", _S.prop(_v56, 1))
			var _v57 = _S.prop(_S.prop(_S.read(_v55, "w"), "tr"), _S.read(_v55, "i"))
			_S.define(_v55, "x1", _S.prop(_v57, 0))
			_S.define(_v55, "y1", _S.prop(_v57, 1))
			_S.define(_v55, "u", _S.binary("/", _S.read(_v55, "i"), _S.prop(_S.prop(_S.read(_v55, "w"), "tr"), "length")))
			_S.invoke(_S.read(_v55, "p"), "line", [_S.read(_v55, "x0"), _S.read(_v55, "y0"), _S.read(_v55, "x1"), _S.read(_v55, "y1"), (_S.read(_v55, "WHITE") if _S.truth(_S.binary("<", _S.read(_v55, "u"), 0.25)) else (_S.prop(_S.read(_v55, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v55, "u"), 0.55)) else _S.prop(_S.read(_v55, "C"), 4))), _S.binary("-", 1.15, _S.read(_v55, "u"))])
			if _S.truth(_S.binary("<", _S.read(_v55, "u"), 0.35)):
				_S.invoke(_S.read(_v55, "p"), "line", [_S.binary("+", _S.read(_v55, "x0"), 1), _S.read(_v55, "y0"), _S.binary("+", _S.read(_v55, "x1"), 1), _S.read(_v55, "y1"), _S.prop(_S.read(_v55, "C"), 5), 1])
			_v54 = _S.iteration(_v54)
			_S.write(_v54, "i", 1, "+=", true)
		_S.invoke(_S.read(_v53, "p"), "circle", [_S.prop(_S.read(_v53, "w"), "x"), _S.prop(_S.read(_v53, "w"), "y"), 2, _S.prop(_S.read(_v53, "C"), 5)])
		_S.invoke(_S.read(_v53, "p"), "circle", [_S.prop(_S.read(_v53, "w"), "x"), _S.prop(_S.read(_v53, "w"), "y"), 1.2, _S.prop(_S.read(_v53, "C"), 6)])
		_S.invoke(_S.read(_v53, "p"), "px", [_S.prop(_S.read(_v53, "w"), "x"), _S.prop(_S.read(_v53, "w"), "y"), _S.read(_v53, "WHITE")])
		_S.invoke(_S.read(_v53, "p"), "glow", [_S.prop(_S.read(_v53, "w"), "x"), _S.prop(_S.read(_v53, "w"), "y"), 12, _S.prop(_S.read(_v53, "C"), 5), _S.binary("+", _S.binary("*", 0.5, _S.read(_v53, "k")), 0.2)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "bot")), _S.binary("-", _S.read(_e, "top"), _S.read(_e, "bot"))))
	_S.define(_e, "half", _S.binary("*", _S.binary("*", _S.read(_e, "w0"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.8])), _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "y"), 0.7), _S.binary("*", _S.read(_e, "t"), 40))])))))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), _S.invoke(_S.read(_e, "Math"), "max", [0.5, _S.read(_e, "half")])))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.35)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.7)) else _S.prop(_S.read(_e, "C"), 5))), "=", false)
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "t0")), _S.prop(_S.read(_e, "r"), "life")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "k"), 0), func(): return _S.binary(">=", _S.read(_e, "k"), 1))):
		return null
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", _S.prop(_S.read(_e, "r"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "r"), "r1"), _S.prop(_S.read(_e, "r"), "r0")), _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), _S.binary("*", _S.read(_e, "SY"), 0.62), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", _S.prop(_S.read(_e, "r"), "th"), _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.read(_e, "C"), _S.function_value(_e, "_f18"), _S.logical("&&", _S.prop(_S.read(_e, "r"), "hot"), func(): return _S.binary("<", _S.read(_e, "k"), 0.15))])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "near"))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "t"), 2.4), _S.binary("*", 1.5, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "BURST"), 0.1), _S.binary("+", _S.read(_e, "BURST"), 0.3), _S.read(_e, "t")]))), _S.binary("*", 10, _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SHUT")), _S.binary("-", _S.read(_e, "POP"), _S.read(_e, "SHUT")))]), 2.2])))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "th", _S.arg(_args, 0))
	_S.define(_e, "spin", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.05, _S.call_value(_S.read(_e, "noise"), [_S.binary("+", _S.binary("*", _S.read(_e, "th"), 3), _S.binary("*", _S.read(_e, "spin"), 0.6)), 5]))), _S.binary("*", 0.035, _S.call_value(_S.read(_e, "noise"), [_S.binary("-", _S.binary("*", _S.read(_e, "th"), 8), _S.binary("*", _S.read(_e, "spin"), 1.3)), 9])))
