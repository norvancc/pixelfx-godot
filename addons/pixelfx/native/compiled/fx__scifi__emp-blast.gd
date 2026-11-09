@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/emp-blast.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "strokeArc", _S.import_value("fx/scifi/_lib.js", "strokeArc"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "EMP blast"}, {"desc": "A disc charge ticks, pops white, and a bubble of rolling scanlines swells out with arcs crawling its skin; it strobes, tears and shorts out into falling dead pixels."}, {"tags": ["scifi", "emp", "pulse", "shockwave", "electric", "grenade", "glitch", "one-shot"]}, {"size": [152, 116]}, {"origin": [76, 84]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0d0820", "#1c1658", "#2d2aa0", "#3f55e8", "#5a8eff", "#9cc4ff", "#dceaff", "#ffffff"]}, {"fringe": "#ff5ad8"}, {"radius": 56}, {"seed": 33}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POP", 0.42)
	_S.define(_e, "GROW", 0.32)
	_S.define(_e, "STROBE", 1.25)
	_S.define(_e, "BREAK", 1.58)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "fringe")]))
	_S.define(_e, "RM", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "arcs", [])
	_S.define(_e, "dead", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "nextArc", 0)
	_S.define(_e, "star", [])
	_S.define(_e, "starAt", _S.unary("-", 1))
	_S.define(_e, "radius", _S.function_value(_e, "_f2"))
	_S.define(_e, "off", _S.function_value(_e, "_f3"))
	_S.define(_e, "charge", _S.function_value(_e, "_f4"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))) else _S.binary("*", _S.binary("*", _S.read(_e, "RM"), _S.binary("+", 0.12, _S.binary("*", 0.88, _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), _S.read(_e, "GROW"))])])))), _S.binary("+", 1, _S.binary("*", 0.04, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), _S.read(_e, "GROW")), 0.8)])))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "STROBE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "o"), "seed"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)])]), _S.binary("+", 0.2, _S.binary("*", 0.5, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "STROBE")), _S.binary("-", _S.read(_e, "BREAK"), _S.read(_e, "STROBE")))))))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP"))):
		return null
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "POP")))
	_S.define(_e, "r", _S.binary("+", 1, _S.binary("*", _S.binary("*", 3.2, _S.read(_e, "k")), _S.read(_e, "k"))))
	_S.define(_e, "tick", _S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "TAU"), _S.binary("+", _S.binary("*", 2, _S.read(_e, "t")), _S.binary("*", _S.binary("*", 10, _S.read(_e, "t")), _S.read(_e, "t"))))]), 0))
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.unary("-", 7), _S.binary("+", _S.read(_e, "r"), 1), _S.prop(_S.read(_e, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "circle", [0, _S.unary("-", 7), _S.read(_e, "r"), (_S.read(_e, "WHITE") if _S.truth(_S.read(_e, "tick")) else _S.prop(_S.read(_e, "C"), 6))])
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	_S.define(_e, "rr", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 97), _S.read(_e, "f"))]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.binary("+", 1, _S.invoke(_S.read(_v0, "Math"), "floor", [_S.binary("*", _S.read(_v0, "k"), 3)])))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "rr"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "l", _S.binary("+", _S.binary("+", _S.read(_v1, "r"), 2), _S.binary("*", _S.invoke(_S.read(_v1, "rr"), "range", [2, 6]), _S.read(_v1, "k"))))
		_S.call_value(_S.read(_v1, "strokeArc"), [_S.read(_v1, "p"), _S.call_value(_S.read(_v1, "bolt"), [_S.read(_v1, "rr"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "r")), _S.binary("+", _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "r"))), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "l")), _S.binary("+", _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "l"))), _S.merge([{"jag": 0.4}, {"depth": 2}])]), [_S.prop(_S.read(_v1, "C"), 2), _S.prop(_S.read(_v1, "C"), 5), _S.prop(_S.read(_v1, "C"), 4)], 0.7, 0.5])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 7), _S.binary("+", 8, _S.binary("*", 16, _S.read(_e, "k"))), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.4, _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "k")), (1 if _S.truth(_S.read(_e, "tick")) else 0.6)))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "near", _S.arg(_args, 1))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "radius"), []))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<=", _S.read(_e, "r"), 1), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.call_value(_S.read(_e, "off"), []))):
		return null
	_S.define(_e, "age", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	_S.define(_e, "slot", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	_S.define(_e, "roll", _S.binary("*", _S.read(_e, "age"), 40))
	_S.define(_e, "ry", _S.binary("*", _S.read(_e, "r"), 0.16))
	_S.define(_e, "tears", _S.construct(_S.read(_e, "Map"), []))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), _S.binary("+", 2, (4 if _S.truth(_S.binary(">", _S.read(_v2, "t"), _S.read(_v2, "STROBE"))) else 0)))):
		_S.invoke(_S.read(_v2, "tears"), "set", [_S.invoke(_S.read(_v2, "Math"), "floor", [_S.binary("*", _S.unary("-", _S.call_value(_S.read(_v2, "rand"), [_S.prop(_S.read(_v2, "o"), "seed"), _S.read(_v2, "slot"), _S.read(_v2, "i")])), _S.read(_v2, "r"))]), _S.binary("*", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v2, "rand"), [_S.prop(_S.read(_v2, "o"), "seed"), _S.read(_v2, "slot"), _S.read(_v2, "i"), 1]), 0.5)) else 1), _S.binary("+", 2, _S.invoke(_S.read(_v2, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v2, "rand"), [_S.prop(_S.read(_v2, "o"), "seed"), _S.read(_v2, "slot"), _S.read(_v2, "i"), 2]), 4)])))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "y", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.unary("-", _S.read(_v3, "r"))]))
	while _S.truth(_S.binary("<=", _S.read(_v3, "y"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.read(_v3, "ry")]))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "shift", _S.logical("??", _S.invoke(_S.read(_v4, "tears"), "get", [_S.read(_v4, "y")]), func(): return 0))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.unary("-", _S.read(_v5, "r"))]))
		while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.read(_v5, "r")]))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "sx", _S.binary("-", _S.read(_v6, "x"), _S.read(_v6, "shift")))
			_S.define(_v6, "d", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "hypot", [_S.binary("+", _S.read(_v6, "sx"), 0.5), (_S.binary("+", _S.read(_v6, "y"), 0.5) if _S.truth(_S.binary("<", _S.read(_v6, "y"), 0)) else 0)]), _S.read(_v6, "r")))
			if _S.truth(_S.binary(">", _S.read(_v6, "d"), 1)):
				var _v7 = _S.scope(_v6)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_v7, "near"), func(): return _S.binary("<", _S.read(_v7, "y"), 0)), func(): return _S.binary("<", _S.read(_v7, "d"), _S.binary("+", 1, _S.binary("/", 1.4, _S.read(_v7, "r"))))), func(): return _S.binary("===", _S.binary("%", _S.binary("+", _S.read(_v7, "x"), _S.read(_v7, "y")), 2), 0))):
					_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.read(_v7, "F")])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">=", _S.read(_v6, "y"), 0)):
				var _v8 = _S.scope(_v6)
				_S.define(_v8, "e", _S.invoke(_S.read(_v8, "Math"), "hypot", [_S.binary("/", _S.binary("+", _S.read(_v8, "sx"), 0.5), _S.read(_v8, "r")), _S.binary("/", _S.binary("+", _S.read(_v8, "y"), 0.5), _S.read(_v8, "ry"))]))
				if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_v8, "e"), 1), func(): return _S.binary("<", _S.read(_v8, "e"), 0.92)), func(): return _S.binary("!==", _S.binary(">", _S.read(_v8, "y"), 0), _S.read(_v8, "near")))):
					_v5 = _S.iteration(_v5)
					_S.write(_v5, "x", 1, "+=", true)
					continue
				_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "x"), _S.read(_v8, "y"), (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v8, "e"), 0.97)) else _S.prop(_S.read(_v8, "C"), 4))])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			if _S.truth(_S.unary("!", _S.read(_v6, "near"))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			_S.define(_v6, "rim", _S.binary("**", _S.read(_v6, "d"), 6))
			_S.define(_v6, "line", _S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v6, "y"), _S.read(_v6, "roll")), 4), 4), 4), 1))
			_S.define(_v6, "band", _S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v6, "y"), _S.binary("*", _S.read(_v6, "roll"), 0.5)), 22), 22), 22), 4))
			if _S.truth(_S.binary(">", _S.read(_v6, "d"), 0.965)):
				_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.read(_v6, "WHITE") if _S.truth(_S.read(_v6, "shift")) else (_S.read(_v6, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.unary("-", _S.read(_v6, "y")), _S.binary("*", _S.read(_v6, "r"), 0.55)), func(): return _S.binary("<", _S.read(_v6, "sx"), 0))) else _S.prop(_S.read(_v6, "C"), 6)))])
			else:
				if _S.truth(_S.binary(">", _S.read(_v6, "d"), 0.93)):
					_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 4)])
				else:
					if _S.truth(_S.read(_v6, "shift")):
						_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.read(_v6, "F") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "sx")]), _S.binary("*", _S.read(_v6, "r"), 0.8))) else (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("&", _S.read(_v6, "x"), 1)) else _S.prop(_S.read(_v6, "C"), 5)))])
					else:
						_S.invoke(_S.read(_v6, "p"), "blend", [_S.binary("+", _S.read(_v6, "x"), 0.5), _S.binary("+", _S.read(_v6, "y"), 0.5), (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.logical("&&", _S.read(_v6, "line"), func(): return _S.read(_v6, "band"))) else (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.read(_v6, "line")) else (_S.prop(_S.read(_v6, "C"), 4) if _S.truth(_S.read(_v6, "band")) else _S.prop(_S.read(_v6, "C"), 3)))), _S.binary("+", _S.binary("+", _S.binary("+", 0.06, _S.binary("*", 0.42, _S.read(_v6, "rim"))), (_S.binary("+", 0.14, _S.binary("*", 0.24, _S.read(_v6, "rim"))) if _S.truth(_S.read(_v6, "line")) else 0)), (0.16 if _S.truth(_S.read(_v6, "band")) else 0))])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.read(_v4, "shift"), func(): return _S.read(_v4, "near"))):
			_S.invoke(_S.read(_v4, "p"), "glowLine", [_S.unary("-", _S.read(_v4, "r")), _S.read(_v4, "y"), _S.read(_v4, "r"), _S.read(_v4, "y"), 4, _S.prop(_S.read(_v4, "C"), 5), 0.3])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "y", 1, "+=", true)
	if _S.truth(_S.read(_e, "near")):
		var _v9 = _S.scope(_e)
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "a", 0.15)
		while _S.truth(_S.binary("<", _S.read(_v10, "a"), _S.binary("-", _S.prop(_S.read(_v10, "Math"), "PI"), 0.1))):
			_S.invoke(_S.read(_v10, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "r")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")])), _S.read(_v10, "r")), 8, _S.prop(_S.read(_v10, "C"), 4), 0.12])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "a", 0.35, "+=", false)
		var _v11 = _S.scope(_v9)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 3)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "k", _S.call_value(_S.read(_v12, "rand"), [_S.prop(_S.read(_v12, "o"), "seed"), _S.read(_v12, "slot"), _S.read(_v12, "i"), 7]))
			if _S.truth(_S.binary(">", _S.read(_v12, "k"), 0.5)):
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
				continue
			_S.define(_v12, "a", _S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.prop(_S.read(_v12, "o"), "seed"), _S.read(_v12, "slot"), _S.read(_v12, "i"), 8]), _S.prop(_S.read(_v12, "Math"), "PI")))
			_S.define(_v12, "d", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.prop(_S.read(_v12, "o"), "seed"), _S.read(_v12, "slot"), _S.read(_v12, "i"), 9]), _S.read(_v12, "r")), 0.85))
			_S.define(_v12, "bx", _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "d"))]))
			_S.define(_v12, "by", _S.invoke(_S.read(_v12, "Math"), "round", [_S.binary("*", _S.unary("-", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")])), _S.read(_v12, "d"))]))
			_S.invoke(_S.read(_v12, "p"), "rect", [_S.read(_v12, "bx"), _S.read(_v12, "by"), _S.binary("+", 2, _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.read(_v12, "k"), 8)])), _S.binary("+", 1, _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.read(_v12, "k"), 4)])), (_S.read(_v12, "WHITE") if _S.truth(_S.binary("<", _S.read(_v12, "k"), 0.2)) else _S.prop(_S.read(_v12, "C"), 5))])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "POP"), 0.05)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 0]))
		_S.define(_v13, "D", _S.invoke(_S.read(_v13, "R"), "range", [16, 40]))
		_S.define(_v13, "T", _S.invoke(_S.read(_v13, "R"), "range", [0.14, 0.22]))
		_S.define(_v13, "v", _S.binary("/", _S.binary("*", _S.read(_v13, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v13, "Math"), "exp", [_S.binary("*", 3, _S.read(_v13, "T"))]), 1)))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "D")), _S.binary("+", _S.unary("-", 5), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "D")), 0.7)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")])), _S.read(_v13, "v")), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")])), _S.read(_v13, "v")), 0.7), _S.read(_v13, "T"), (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.5])) else _S.prop(_S.read(_v13, "C"), 5))])
	_S.define(_e, "sa", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	_S.define(_e, "sf", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "sa"), 0), func(): return _S.binary("<", _S.read(_e, "sa"), 0.26)), func(): return _S.binary("!==", _S.read(_e, "sf"), _S.read(_e, "starAt")))):
		var _v14 = _S.scope(_e)
		_S.write(_v14, "starAt", _S.read(_v14, "sf"), "=", false)
		_S.define(_v14, "len", (_S.invoke(_S.read(_v14, "ease"), "outBack", [_S.binary("/", _S.read(_v14, "sa"), 0.05), 2]) if _S.truth(_S.binary("<", _S.read(_v14, "sa"), 0.05)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v14, "sa"), 0.05), 0.26))))
		_S.write(_v14, "star", [], "=", false)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 7)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", _S.unary("-", _S.prop(_S.read(_v16, "Math"), "PI")), _S.binary("*", _S.binary("/", _S.read(_v16, "i"), 6), _S.prop(_S.read(_v16, "Math"), "PI"))), _S.binary("*", _S.call_value(_S.read(_v16, "rand"), [_S.prop(_S.read(_v16, "o"), "seed"), _S.read(_v16, "i"), 3]), 0.3)), 0.15), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 0.1), 0.1])))
			_S.define(_v16, "L", _S.binary("*", _S.binary("+", 20, _S.binary("*", 16, _S.call_value(_S.read(_v16, "rand"), [_S.prop(_S.read(_v16, "o"), "seed"), _S.read(_v16, "i"), 5]))), _S.invoke(_S.read(_v16, "Math"), "max", [0.15, _S.read(_v16, "len")])))
			_S.invoke(_S.read(_v16, "star"), "push", [_S.call_value(_S.read(_v16, "bolt"), [_S.read(_v16, "R"), 0, _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "L")), _S.invoke(_S.read(_v16, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "L")))]), _S.merge([{"jag": 0.28}, {"depth": 4}])])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "sa"), 0.26)):
		_S.write(_e, "star", [], "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.unary("!", _S.read(_e, "popped")))):
		var _v17 = _S.scope(_e)
		_S.write(_v17, "popped", true, "=", false)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 16)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 0]))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [50, 150]))
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "MOTE"), 0, _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v19, "R"), "pick", [[_S.read(_v19, "WHITE"), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 5)]]), 0.8])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 20), 72, _S.prop(_S.read(_v17, "C"), 4), 0.9, 0.5])
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 7), 30, _S.read(_v17, "WHITE"), 0.9, 0.12])
		var _v20 = _S.scope(_v17)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 60)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 0]))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [90, 220]))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "SPARK"), 0, _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.invoke(_S.read(_v21, "R"), "range", [0.2, 0.6])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v17)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 6)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 4), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [10, 24])), _S.invoke(_S.read(_v22, "R"), "range", [1, 1.6]), _S.call_value(_S.read(_v22, "hex"), ["#3c3a52"]), _S.invoke(_S.read(_v22, "R"), "range", [2.5, 4]), _S.invoke(_S.read(_v22, "R"), "range", [0.05, 0.3])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "popped"), func(): return _S.unary("!", _S.read(_e, "broke"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "nextArc")))):
		var _v23 = _S.scope(_e)
		_S.write(_v23, "nextArc", _S.binary("+", _S.read(_v23, "t"), (_S.invoke(_S.read(_v23, "R"), "range", [0.02, 0.05]) if _S.truth(_S.binary(">", _S.read(_v23, "t"), _S.read(_v23, "STROBE"))) else _S.invoke(_S.read(_v23, "R"), "range", [0.05, 0.11]))), "=", false)
		_S.define(_v23, "r", _S.call_value(_S.read(_v23, "radius"), []))
		_S.define(_v23, "a0", _S.invoke(_S.read(_v23, "R"), "range", [0.1, _S.binary("-", _S.prop(_S.read(_v23, "Math"), "PI"), 0.1)]))
		_S.define(_v23, "a1", _S.binary("+", _S.read(_v23, "a0"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.6]))))
		_S.define(_v23, "rr", _S.binary("*", _S.read(_v23, "r"), _S.invoke(_S.read(_v23, "R"), "range", [0.92, 1])))
		_S.invoke(_S.read(_v23, "arcs"), "push", [_S.merge([{"t": _S.read(_v23, "t")}, {"pts": _S.call_value(_S.read(_v23, "bolt"), [_S.read(_v23, "R"), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a0")]), _S.read(_v23, "rr")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a0")])), _S.read(_v23, "rr")), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a1")]), _S.read(_v23, "rr")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "Math"), "max", [0.05, _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a1")])])), _S.read(_v23, "rr")), _S.merge([{"jag": 0.3}, {"depth": 4}])])}, {"life": _S.invoke(_S.read(_v23, "R"), "range", [0.05, 0.1])}])])
		if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.35])):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a1")]), _S.read(_v23, "rr")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "Math"), "max", [0.05, _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a1")])])), _S.read(_v23, "rr")), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 80), 80]), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 90), 10]), _S.invoke(_S.read(_v23, "R"), "range", [0.15, 0.3])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.unary("!", _S.read(_e, "broke")))):
		var _v24 = _S.scope(_e)
		_S.write(_v24, "broke", true, "=", false)
		_S.define(_v24, "r", _S.call_value(_S.read(_v24, "radius"), []))
		_S.invoke(_S.read(_v24, "lights"), "add", [0, _S.binary("*", _S.unary("-", _S.read(_v24, "r")), 0.4), _S.binary("*", _S.read(_v24, "r"), 1.3), _S.prop(_S.read(_v24, "C"), 5), 0.8, 0.3])
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 70)):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.invoke(_S.read(_v26, "R"), "range", [0.05, _S.binary("-", _S.prop(_S.read(_v26, "Math"), "PI"), 0.05)]))
			_S.define(_v26, "d", _S.binary("*", _S.read(_v26, "r"), _S.invoke(_S.read(_v26, "R"), "range", [0.6, 1])))
			_S.invoke(_S.read(_v26, "dead"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "d"))}, {"y": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")])), _S.read(_v26, "d"))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.invoke(_S.read(_v26, "R"), "range", [5, 25]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [0, 20]))}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [0.4, 1])}, {"max": 1}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.3])) else 1)}, {"c": _S.invoke(_S.read(_v26, "R"), "pick", [[_S.read(_v26, "WHITE"), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 5), _S.prop(_S.read(_v26, "C"), 4)]])}, {"ph": _S.invoke(_S.read(_v26, "R"), "range", [0, 9])}])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		var _v27 = _S.scope(_v24)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 6)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "a0", _S.invoke(_S.read(_v28, "R"), "range", [0.1, _S.binary("-", _S.prop(_S.read(_v28, "Math"), "PI"), 0.1)]))
			_S.define(_v28, "a1", _S.binary("+", _S.read(_v28, "a0"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.invoke(_S.read(_v28, "arcs"), "push", [_S.merge([{"t": _S.read(_v28, "t")}, {"pts": _S.call_value(_S.read(_v28, "bolt"), [_S.read(_v28, "R"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a0")]), _S.read(_v28, "r")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a0")])), _S.read(_v28, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a1")]), _S.read(_v28, "r")), 0.6), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v28, "Math"), "max", [0.05, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a1")])])), _S.read(_v28, "r")), 0.6), _S.merge([{"jag": 0.35}, {"depth": 4}])])}, {"life": 0.1}])])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v29 = _S.scope(_v24)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 8)):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "SMOKE"), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 4), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [8, 18])), _S.invoke(_S.read(_v29, "R"), "range", [0.8, 1.2]), _S.call_value(_S.read(_v29, "hex"), ["#2f2c3c"]), _S.invoke(_S.read(_v29, "R"), "range", [2, 3.4]), _S.invoke(_S.read(_v29, "R"), "range", [0, 0.35])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "broke"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.8))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "SPARK"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 3), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [40, 120])), _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3])])
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", _S.binary("-", _S.prop(_S.read(_v30, "arcs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v30, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v30, "t"), _S.prop(_S.prop(_S.read(_v30, "arcs"), _S.read(_v30, "i")), "t")), _S.prop(_S.prop(_S.read(_v30, "arcs"), _S.read(_v30, "i")), "life"))):
			_S.invoke(_S.read(_v30, "arcs"), "splice", [_S.read(_v30, "i"), 1])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "-=", true)
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", _S.binary("-", _S.prop(_S.read(_v31, "dead"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v31, "i"), 0)):
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "d", _S.prop(_S.read(_v32, "dead"), _S.read(_v32, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v32, "d"), "life", _S.read(_v32, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v32, "dead"), "splice", [_S.read(_v32, "i"), 1])
		_S.set_prop(_S.read(_v32, "d"), "vy", _S.binary("*", 60, _S.read(_v32, "dt")), "+=", false)
		_S.set_prop(_S.read(_v32, "d"), "x", _S.binary("*", _S.prop(_S.read(_v32, "d"), "vx"), _S.read(_v32, "dt")), "+=", false)
		_S.set_prop(_S.read(_v32, "d"), "y", _S.invoke(_S.read(_v32, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.prop(_S.read(_v32, "d"), "y"), _S.binary("*", _S.prop(_S.read(_v32, "d"), "vy"), _S.read(_v32, "dt")))]), "=", false)
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "bubble"), [_S.read(_e, "p"), false])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "charge"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "bubble"), [_S.read(_e, "p"), true])
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "a"), 0), func(): return _S.binary("<", _S.read(_e, "a"), 0.06))):
		var _v33 = _S.scope(_e)
		_S.invoke(_S.read(_v33, "p"), "circle", [0, _S.unary("-", 7), _S.binary("+", _S.binary("*", 12, _S.binary("-", 1, _S.binary("/", _S.read(_v33, "a"), 0.06))), 3), _S.prop(_S.read(_v33, "C"), 6)])
		_S.invoke(_S.read(_v33, "p"), "circle", [0, _S.unary("-", 7), _S.binary("+", _S.binary("*", 9, _S.binary("-", 1, _S.binary("/", _S.read(_v33, "a"), 0.06))), 1), _S.read(_v33, "WHITE")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "a"), 0), func(): return _S.binary("<", _S.read(_e, "a"), 0.4))):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "k", _S.binary("/", _S.read(_v34, "a"), 0.4))
		_S.define(_v34, "rr", _S.binary("+", 6, _S.binary("*", _S.binary("+", _S.read(_v34, "RM"), 14), _S.invoke(_S.read(_v34, "ease"), "outCubic", [_S.read(_v34, "k")]))))
		_S.call_value(_S.read(_v34, "band"), [_S.read(_v34, "p"), 0, 0, _S.read(_v34, "rr"), 0.16, _S.invoke(_S.read(_v34, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v34, "k")))]), _S.binary("-", 1.2, _S.read(_v34, "k")), [_S.prop(_S.read(_v34, "C"), 3), _S.prop(_S.read(_v34, "C"), 5), _S.prop(_S.read(_v34, "C"), 6), _S.read(_v34, "WHITE")], _S.function_value(_v34, "_f9"), _S.binary("<", _S.read(_v34, "k"), 0.3)])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "a"), 0), func(): return _S.binary("<", _S.read(_e, "a"), 0.16))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 7), _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.read(_e, "a"), 0.16))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.6])
	for _v35 in _S.array(_S.read(_e, "star")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "b", _v35)
		_S.call_value(_S.read(_v36, "strokeArc"), [_S.read(_v36, "p"), _S.read(_v36, "b"), [_S.prop(_S.read(_v36, "C"), 3), _S.prop(_S.read(_v36, "C"), 6), _S.prop(_S.read(_v36, "C"), 5)], _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v36, "t"), _S.read(_v36, "POP")), 0.3)), 1.3])
	for _v37 in _S.array(_S.read(_e, "arcs")):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "c", _v37)
		_S.call_value(_S.read(_v38, "strokeArc"), [_S.read(_v38, "p"), _S.prop(_S.read(_v38, "c"), "pts"), [_S.prop(_S.read(_v38, "C"), 2), _S.prop(_S.read(_v38, "C"), 5), _S.prop(_S.read(_v38, "C"), 4)], _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v38, "t"), _S.prop(_S.read(_v38, "c"), "t")), _S.binary("+", _S.prop(_S.read(_v38, "c"), "life"), 0.03))), 0.8])
	for _v39 in _S.array(_S.read(_e, "dead")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "d", _v39)
		var _v41 = _S.scope(_v40)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v41, "t"), 40), _S.prop(_S.read(_v41, "d"), "ph"))]), _S.unary("-", 0.3)), func(): return _S.binary("<", _S.prop(_S.read(_v41, "d"), "life"), 0.6))):
			continue
		_S.invoke(_S.read(_v41, "p"), "rect", [_S.prop(_S.read(_v41, "d"), "x"), _S.prop(_S.read(_v41, "d"), "y"), _S.prop(_S.read(_v41, "d"), "s"), _S.prop(_S.read(_v41, "d"), "s"), (_S.prop(_S.read(_v41, "d"), "c") if _S.truth(_S.binary(">", _S.prop(_S.read(_v41, "d"), "life"), 0.5)) else _S.prop(_S.read(_v41, "C"), 3))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return true
