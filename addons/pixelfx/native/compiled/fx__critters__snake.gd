@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/snake.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "lift", _S.function_value(_e, "_f0"))
	_S.define(_e, "tongue", _S.function_value(_e, "_f1"))
	_S.define(_e, "snake", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Snake"}, {"desc": "A snake slithers along the floor, head raised: humps rise and roll back down its patterned body to the tail, dust puffs where it touches down, its forked tongue flicks."}, {"tags": ["critter", "snake", "reptile", "ground", "loop"]}, {"size": [136, 56]}, {"origin": [68, 48]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#081410", "#123a1e", "#1d5e2a", "#2f8a36", "#5cb848", "#a8e070", "#e8ffc0"]}, {"belly": ["#4a3a14", "#b08a34", "#f0d878"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "HEAD", 30)
	_S.define(_e, "LEN", 70)
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 44), _S.unary("-", 24), 88, 26]))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_S.define(_e, "TONGUE", _S.call_value(_S.read(_e, "hex"), ["#e8304a"]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#8a7f92"]))
	_S.define(_e, "K", _S.binary("/", _S.read(_e, "TAU"), 30))
	_S.define(_e, "W", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "D")))
	_S.define(_e, "radius", _S.function_value(_e, "_f8"))
	_S.define(_e, "bob", _S.function_value(_e, "_f9"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "wave", _S.binary("**", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "K"), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "W"), _S.read(_e, "t")))])]), 0.85))
	_S.define(_e, "env", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [8, 18, _S.read(_e, "u")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "LEN"), 14), _S.binary("-", _S.read(_e, "LEN"), 2), _S.read(_e, "u")]))))
	_S.define(_e, "neck", (_S.binary("*", 6, _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 12)), 2)) if _S.truth(_S.binary("<", _S.read(_e, "u"), 12)) else 0))
	return _S.binary("+", _S.binary("*", _S.binary("*", 7, _S.read(_e, "wave")), _S.read(_e, "env")), _S.read(_e, "neck"))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	for _v0 in _S.array([0.3, 1.5]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "t0", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "k", _S.binary("/", _S.binary("-", _S.read(_v2, "t"), _S.read(_v2, "t0")), 0.5))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v2, "k"), 0), func(): return _S.binary("<", _S.read(_v2, "k"), 1))):
			return _S.binary("**", _S.invoke(_S.read(_v2, "Math"), "max", [0, _S.invoke(_S.read(_v2, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_v2, "k"), _S.prop(_S.read(_v2, "Math"), "PI")), 3)])]), 0.6)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "B", _S.arg(_args, 2))
	_S.define(_e, "t", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.define(_e, "hb", _S.call_value(_S.read(_e, "bob"), [_S.read(_e, "t")]))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "u", _S.read(_v3, "LEN"))
	while _S.truth(_S.binary(">=", _S.read(_v3, "u"), 2)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "x", _S.binary("-", _S.read(_v4, "HEAD"), _S.read(_v4, "u")))
		_S.define(_v4, "r0", _S.call_value(_S.read(_v4, "radius"), [_S.read(_v4, "u")]))
		_S.define(_v4, "cy", _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_v4, "r0")), _S.call_value(_S.read(_v4, "lift"), [_S.read(_v4, "u"), _S.read(_v4, "t")])), (_S.binary("*", _S.read(_v4, "hb"), _S.binary("-", 1, _S.binary("/", _S.read(_v4, "u"), 12))) if _S.truth(_S.binary("<", _S.read(_v4, "u"), 12)) else 0)))
		_S.define(_v4, "hump", _S.call_value(_S.read(_v4, "lift"), [_S.read(_v4, "u"), _S.read(_v4, "t")]))
		_S.define(_v4, "slope", _S.binary("-", _S.call_value(_S.read(_v4, "lift"), [_S.binary("+", _S.read(_v4, "u"), 0.5), _S.read(_v4, "t")]), _S.call_value(_S.read(_v4, "lift"), [_S.binary("-", _S.read(_v4, "u"), 0.5), _S.read(_v4, "t")])))
		_S.define(_v4, "r", _S.binary("*", _S.read(_v4, "r0"), _S.invoke(_S.read(_v4, "Math"), "sqrt", [_S.binary("+", 1, _S.binary("*", _S.read(_v4, "slope"), _S.read(_v4, "slope")))])))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "y", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.read(_v5, "cy"), _S.read(_v5, "r"))]))
		while _S.truth(_S.binary("<=", _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("+", _S.read(_v5, "cy"), _S.read(_v5, "r"))]))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "v", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v6, "y"), 0.5), _S.read(_v6, "cy")), _S.read(_v6, "r")))
			if _S.truth(_S.binary(">", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.read(_v6, "v")]), 1)):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "y", 1, "+=", true)
				continue
			_S.define(_v6, "c", (_S.prop(_S.read(_v6, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v6, "v"), _S.unary("-", 0.5))) else (_S.prop(_S.read(_v6, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v6, "v"), 0.1)) else (_S.prop(_S.read(_v6, "C"), 2) if _S.truth(_S.binary("<", _S.read(_v6, "v"), 0.45)) else (_S.prop(_S.read(_v6, "B"), 1) if _S.truth(_S.binary("<", _S.read(_v6, "v"), 0.8)) else _S.prop(_S.read(_v6, "B"), 0))))))
			_S.define(_v6, "dm", _S.binary("+", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.read(_v6, "u"), 2), 7), 3.5)]), 3.5), _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("+", _S.read(_v6, "v"), 0.25)]), 0.55)))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v6, "dm"), 0.85), func(): return _S.binary("<", _S.read(_v6, "v"), 0.35)), func(): return _S.binary(">", _S.read(_v6, "u"), 4))):
				_S.write(_v6, "c", (_S.prop(_S.read(_v6, "C"), 1) if _S.truth(_S.binary("<", _S.read(_v6, "dm"), 0.5)) else _S.prop(_S.read(_v6, "C"), 2)), "=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v6, "v"), _S.unary("-", 0.62)), func(): return _S.binary(">", _S.read(_v6, "hump"), 4.5)), func(): return _S.binary(">=", _S.read(_v6, "dm"), 0.85))):
				_S.write(_v6, "c", (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v6, "hump"), 6)) else _S.prop(_S.read(_v6, "C"), 5)), "=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v6, "v"), 0.45), func(): return _S.binary("<", _S.read(_v6, "v"), 0.8)), func(): return _S.binary("===", _S.binary("%", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.read(_v6, "u")]), 3), 0))):
				_S.write(_v6, "c", _S.prop(_S.read(_v6, "B"), 2), "=", false)
			_S.invoke(_S.read(_v6, "g"), "set", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "c")])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "y", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "u", 0.5, "-=", false)
	_S.define(_e, "hx", _S.binary("+", _S.read(_e, "HEAD"), 2))
	_S.define(_e, "hy", _S.binary("+", _S.unary("-", 9.5), _S.read(_e, "hb")))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.binary("-", _S.read(_e, "hx"), 5), _S.binary("-", _S.read(_e, "hy"), 4), _S.binary("+", _S.read(_e, "hx"), 6), _S.binary("+", _S.read(_e, "hy"), 4), _S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "g"), "line", [_S.binary("-", _S.read(_e, "hx"), 1), _S.binary("+", _S.read(_e, "hy"), 1.5), _S.binary("+", _S.read(_e, "hx"), 5), _S.binary("+", _S.read(_e, "hy"), 1.2), _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "hx"), 1), _S.binary("-", _S.read(_e, "hy"), 2), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "hx"), 2), _S.binary("-", _S.read(_e, "hy"), 2), _S.prop(_S.read(_e, "B"), 2)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "hx"), 1), _S.binary("-", _S.read(_e, "hy"), 1), _S.prop(_S.read(_e, "B"), 2)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "hx"), 2), _S.binary("-", _S.read(_e, "hy"), 1), _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "hx"), 1), _S.binary("-", _S.read(_e, "hy"), 3), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.read(_e, "hx"), 5), _S.binary("-", _S.read(_e, "hy"), 1), _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.prop(_S.read(_e, "C"), 0)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "hx")), (5.6 if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.read(_e, "hx"))) else 4.6)))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "hy")), _S.binary("-", 3.6, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "x"), _S.read(_e, "hx"))]), 0.18))))
	if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy"))), 1)):
		return 0
	if _S.truth(_S.binary(">", _S.read(_e, "dy"), 0.55)):
		return _S.prop(_S.read(_e, "B"), 1)
	return ((_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "dx"), 0.3)) else _S.prop(_S.read(_e, "C"), 4)) if _S.truth(_S.binary("<", _S.read(_e, "dy"), _S.unary("-", 0.3))) else _S.prop(_S.read(_e, "C"), 3))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "belly"), 3]))
	_S.define(_e, "hb", _S.call_value(_S.read(_e, "bob"), [_S.read(_e, "t")]))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "tongue"), [_S.read(_e, "t")]))
	_S.define(_e, "tx", _S.binary("+", _S.read(_e, "HEAD"), 7.5))
	_S.define(_e, "ty", _S.binary("+", _S.unary("-", 8.2), _S.read(_e, "hb")))
	if _S.truth(_S.binary(">", _S.read(_e, "e"), 0.05)):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "L", _S.binary("*", 7, _S.read(_v7, "e")))
		_S.define(_v7, "wig", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("*", _S.read(_v7, "t"), 60)]), 0.6), _S.read(_v7, "e")))
		_S.invoke(_S.read(_v7, "p"), "line", [_S.read(_v7, "tx"), _S.read(_v7, "ty"), _S.binary("+", _S.read(_v7, "tx"), _S.read(_v7, "L")), _S.binary("+", _S.read(_v7, "ty"), _S.read(_v7, "wig")), _S.read(_v7, "TONGUE")])
		if _S.truth(_S.binary(">", _S.read(_v7, "L"), 3)):
			_S.last([_S.invoke(_S.read(_v7, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v7, "tx"), _S.read(_v7, "L")), 1), _S.binary("-", _S.binary("+", _S.read(_v7, "ty"), _S.read(_v7, "wig")), 1), _S.read(_v7, "TONGUE")]), _S.invoke(_S.read(_v7, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v7, "tx"), _S.read(_v7, "L")), 1), _S.binary("+", _S.binary("+", _S.read(_v7, "ty"), _S.read(_v7, "wig")), 1), _S.read(_v7, "TONGUE")])])
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "snake"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "B"), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p")])
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "SWARM"), "begin", [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 26, _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "o"), "seed"), 7), 1), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "sw"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "HEAD"), 3.5), _S.binary("+", _S.unary("-", 11), _S.read(_e, "hb")), 4, _S.prop(_S.read(_e, "B"), 2), 0.35])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.6, 1.1])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "born", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")), _S.read(_e, "D")]))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "r"), "int", [0, 2]))
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), _S.binary("*", _S.read(_e, "W"), _S.read(_e, "born"))), _S.binary("*", _S.read(_e, "m"), _S.read(_e, "TAU"))), _S.read(_e, "K")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 18), func(): return _S.binary(">", _S.read(_e, "u"), _S.binary("-", _S.read(_e, "LEN"), 10)))):
		return null
	_S.define(_e, "x", _S.binary("-", _S.binary("+", _S.binary("-", _S.read(_e, "HEAD"), _S.read(_e, "u")), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 2), 2])), _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [6, 16]), _S.read(_e, "age"))))
	_S.invoke(_S.read(_e, "sw"), "add", [_S.prop(_S.read(_e, "P"), "SMOKE"), _S.read(_e, "x"), _S.binary("-", _S.unary("-", 0.5), _S.binary("*", _S.read(_e, "age"), _S.invoke(_S.read(_e, "r"), "range", [3, 8]))), 0, 0, _S.read(_e, "age"), _S.read(_e, "L"), _S.read(_e, "DUST"), _S.invoke(_S.read(_e, "r"), "range", [1.8, 3.4])])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "u", 2)
	while _S.truth(_S.binary("<=", _S.read(_v8, "u"), _S.read(_v8, "LEN"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "h", _S.call_value(_S.read(_v9, "lift"), [_S.read(_v9, "u"), _S.read(_v9, "t")]))
		_S.define(_v9, "r", _S.call_value(_S.read(_v9, "radius"), [_S.read(_v9, "u")]))
		_S.call_value(_S.read(_v9, "shadow"), [_S.read(_v9, "p"), _S.binary("-", _S.read(_v9, "HEAD"), _S.read(_v9, "u")), _S.unary("-", 0.2), _S.binary("+", 2.2, _S.binary("*", _S.read(_v9, "r"), 0.4)), 1.2, _S.prop(_S.read(_v9, "C"), 0), _S.binary("+", _S.binary("*", 0.5, _S.binary("-", 1, _S.call_value(_S.read(_v9, "clamp"), [_S.binary("/", _S.read(_v9, "h"), 10)]))), 0.1)])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "u", 2, "+=", false)
	_S.call_value(_S.read(_e, "shadow"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "HEAD"), 2), _S.unary("-", 0.2), 5, 1.2, _S.prop(_S.read(_e, "C"), 0), 0.35])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (3.3 if _S.truth(_S.binary("<", _S.read(_e, "u"), 6)) else _S.call_value(_S.read(_e, "lerp"), [3.4, 0.6, _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "u"), 6), _S.binary("-", _S.read(_e, "LEN"), 6)), 1.3)]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", 0.8, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "t"))]))
