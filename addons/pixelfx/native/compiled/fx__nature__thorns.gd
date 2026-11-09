@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/thorns.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "thorn", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Thorns"}, {"desc": "A seam races along the floor and hooked thorns punch up out of it one after another, each bigger than the last, in bursts of dirt and green light; they hold, then sink."}, {"tags": ["nature", "thorns", "plant", "spikes", "ground", "attack", "one-shot"]}, {"size": [232, 92]}, {"origin": [48, 78]}, {"duration": 2.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#160c0e", "#2e1418", "#4e2224", "#743a30", "#9a5a3e", "#c08458", "#e2b484", "#fbe8c8"]}, {"glow": ["#123818", "#2f7a2a", "#6cb83a", "#c8f070"]}, {"soil": ["#120c0c", "#251917", "#3b2a24", "#553d31", "#715440", "#8f6e52", "#b8966e", "#e6d0a8"]}, {"count": 6}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RISE", 0.11)
	_S.define(_e, "SINK", 0.36)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.arg(_args, 1))
	_S.define(_e, "h", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "opts", _S.arg(_args, 4))
	if _S.truth(_S.binary("<", _S.read(_e, "h"), 1.5)):
		return null
	var _v0 = _S.read(_e, "s")
	_S.define(_e, "x", _S.prop(_v0, "x"))
	_S.define(_e, "w", _S.prop(_v0, "w"))
	_S.define(_e, "hook", _S.prop(_v0, "hook"))
	_S.define(_e, "lean", _S.prop(_v0, "lean"))
	_S.define(_e, "base", _S.logical("??", _S.prop(_S.read(_e, "opts"), "base"), func(): return 0))
	_S.define(_e, "white", _S.prop(_S.read(_e, "opts"), "white"))
	_S.define(_e, "cx", _S.function_value(_e, "_f1"))
	_S.define(_e, "hw", _S.function_value(_e, "_f2"))
	_S.define(_e, "inside", _S.function_value(_e, "_f3"))
	_S.define(_e, "X0", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "w")), 6)]))
	_S.define(_e, "X1", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "w"), 2)), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "lean")])), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "hook")])), 2)]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "py", _S.binary("-", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("-", _S.read(_v1, "base"), _S.read(_v1, "h"))]), 1))
	while _S.truth(_S.binary("<=", _S.read(_v1, "py"), _S.invoke(_S.read(_v1, "Math"), "min", [0, _S.invoke(_S.read(_v1, "Math"), "ceil", [_S.read(_v1, "base")])]))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "px", _S.read(_v2, "X0"))
		while _S.truth(_S.binary("<=", _S.read(_v2, "px"), _S.read(_v2, "X1"))):
			var _v3 = _S.scope(_v2)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v3, "inside"), [_S.read(_v3, "px"), _S.read(_v3, "py")]))):
				var _v4 = _S.scope(_v3)
				if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v4, "py"), 0), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v4, "inside"), [_S.binary("-", _S.read(_v4, "px"), 1), _S.read(_v4, "py")]), func(): return _S.call_value(_S.read(_v4, "inside"), [_S.binary("+", _S.read(_v4, "px"), 1), _S.read(_v4, "py")])), func(): return _S.call_value(_S.read(_v4, "inside"), [_S.read(_v4, "px"), _S.binary("+", _S.read(_v4, "py"), 1)])), func(): return _S.call_value(_S.read(_v4, "inside"), [_S.read(_v4, "px"), _S.binary("-", _S.read(_v4, "py"), 1)])))):
					_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "px"), _S.read(_v4, "py"), _S.prop(_S.read(_v4, "C"), 0), _S.logical("??", _S.prop(_S.read(_v4, "opts"), "a"), func(): return 1)])
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "px", 1, "+=", true)
				continue
			if _S.truth(_S.read(_v3, "white")):
				var _v5 = _S.scope(_v3)
				_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "px"), _S.read(_v5, "py"), _S.read(_v5, "WHITE")])
				_v2 = _S.iteration(_v2)
				_S.write(_v2, "px", 1, "+=", true)
				continue
			_S.define(_v3, "u", _S.binary("/", _S.binary("-", _S.read(_v3, "base"), _S.binary("+", _S.read(_v3, "py"), 0.5)), _S.read(_v3, "h")))
			_S.define(_v3, "c", _S.call_value(_S.read(_v3, "cx"), [_S.read(_v3, "u")]))
			_S.define(_v3, "r", _S.call_value(_S.read(_v3, "hw"), [_S.read(_v3, "u")]))
			_S.define(_v3, "q", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v3, "px"), 0.5), _S.binary("-", _S.read(_v3, "c"), _S.read(_v3, "r"))), _S.binary("*", 2, _S.read(_v3, "r"))))
			_S.define(_v3, "i", (4 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0)) else (6 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.16)) else (5 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.36)) else (7 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.46)) else (4 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.7)) else (3 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.86)) else 2)))))))
			if _S.truth(_S.binary(">", _S.read(_v3, "u"), 0.86)):
				_S.write(_v3, "i", (7 if _S.truth(_S.binary("<", _S.read(_v3, "q"), 0.6)) else 5), "=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v3, "i"), 7), func(): return _S.binary(">", _S.read(_v3, "i"), 2)), func(): return _S.binary("<", _S.call_value(_S.read(_v3, "rand"), [_S.read(_v3, "px"), _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v3, "py"), 0.5), _S.read(_v3, "base")), 3)]), _S.prop(_S.read(_v3, "s"), "seed")]), 0.12))):
				_S.write(_v3, "i", 1, "-=", false)
			_S.invoke(_S.read(_v3, "p"), "px", [_S.read(_v3, "px"), _S.read(_v3, "py"), _S.prop(_S.read(_v3, "C"), _S.read(_v3, "i"))])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "px", 1, "+=", true)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "py", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "white")), func(): return _S.binary(">", _S.read(_e, "h"), 14))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "u0", 0.34)
		_S.define(_v6, "u1", 0.46)
		_S.define(_v6, "y0", _S.binary("-", _S.read(_v6, "base"), _S.binary("*", _S.read(_v6, "u0"), _S.read(_v6, "h"))))
		_S.define(_v6, "y1", _S.binary("-", _S.read(_v6, "base"), _S.binary("*", _S.read(_v6, "u1"), _S.read(_v6, "h"))))
		_S.define(_v6, "e0", _S.binary("-", _S.call_value(_S.read(_v6, "cx"), [_S.read(_v6, "u0")]), _S.call_value(_S.read(_v6, "hw"), [_S.read(_v6, "u0")])))
		_S.define(_v6, "e1", _S.binary("-", _S.call_value(_S.read(_v6, "cx"), [_S.read(_v6, "u1")]), _S.call_value(_S.read(_v6, "hw"), [_S.read(_v6, "u1")])))
		_S.define(_v6, "L", _S.binary("*", _S.read(_v6, "w"), 0.45))
		if _S.truth(_S.binary("<=", _S.read(_v6, "y0"), 0)):
			var _v7 = _S.scope(_v6)
			_S.invoke(_S.read(_v7, "p"), "tri", [_S.binary("+", _S.read(_v7, "e0"), 0.5), _S.read(_v7, "y0"), _S.binary("+", _S.read(_v7, "e1"), 0.5), _S.read(_v7, "y1"), _S.binary("-", _S.read(_v7, "e1"), _S.read(_v7, "L")), _S.binary("-", _S.read(_v7, "y1"), _S.binary("*", _S.read(_v7, "L"), 0.7)), _S.prop(_S.read(_v7, "C"), 3)])
			_S.invoke(_S.read(_v7, "p"), "line", [_S.read(_v7, "e1"), _S.read(_v7, "y1"), _S.binary("-", _S.read(_v7, "e1"), _S.read(_v7, "L")), _S.binary("-", _S.read(_v7, "y1"), _S.binary("*", _S.read(_v7, "L"), 0.7)), _S.prop(_S.read(_v7, "C"), 6)])
			_S.invoke(_S.read(_v7, "p"), "px", [_S.binary("-", _S.read(_v7, "e1"), _S.read(_v7, "L")), _S.binary("-", _S.read(_v7, "y1"), _S.binary("*", _S.read(_v7, "L"), 0.7)), _S.prop(_S.read(_v7, "C"), 7)])
			_S.invoke(_S.read(_v7, "p"), "line", [_S.read(_v7, "e0"), _S.binary("+", _S.read(_v7, "y0"), 1), _S.binary("+", _S.binary("-", _S.read(_v7, "e1"), _S.read(_v7, "L")), 1), _S.binary("+", _S.binary("-", _S.read(_v7, "y1"), _S.binary("*", _S.read(_v7, "L"), 0.7)), 1), _S.prop(_S.read(_v7, "C"), 0)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "lean"), _S.read(_e, "u"))), _S.binary("*", _S.read(_e, "hook"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), 2.4])))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "w"), 2), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "u")), 0.9])), 0.25)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "base"), _S.binary("+", _S.read(_e, "py"), 0.5)), _S.read(_e, "h")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1)), func(): return _S.binary(">", _S.binary("+", _S.read(_e, "py"), 0.5), 0))):
		return false
	_S.define(_e, "c", _S.call_value(_S.read(_e, "cx"), [_S.read(_e, "u")]))
	_S.define(_e, "fx", _S.binary("+", _S.read(_e, "px"), 0.5))
	return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "fx"), _S.read(_e, "c"))]), _S.call_value(_S.read(_e, "hw"), [_S.read(_e, "u")]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 4]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "soil"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f5"))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "max", [2, _S.prop(_S.read(_e, "o"), "count")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1), _S.prop(_S.read(_e, "G"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "chips", [])
	_S.define(_e, "list", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f6")]))
	_S.define(_e, "reach", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "list"), _S.binary("-", _S.read(_e, "n"), 1)), "x"), 8))
	_S.define(_e, "t", 0)
	_S.define(_e, "chip", _S.function_value(_e, "_f7"))
	_S.define(_e, "grown", _S.function_value(_e, "_f8"))
	_S.define(_e, "sunk", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f12")}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "i"), _S.binary("-", _S.read(_e, "n"), 1)))
	_S.define(_e, "h", _S.binary("+", _S.binary("+", 12, _S.binary("*", 36, _S.read(_e, "k"))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1.5), 1.5])))
	return _S.merge([{"x": _S.binary("+", _S.binary("+", 10, _S.binary("*", _S.read(_e, "i"), _S.binary("/", 104, _S.binary("-", _S.read(_e, "n"), 1)))), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]))}, {"h": _S.read(_e, "h")}, {"w": _S.binary("+", 6, _S.binary("*", 9, _S.read(_e, "k")))}, {"lean": _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1.5]), _S.binary("*", _S.read(_e, "k"), 2))}, {"hook": _S.binary("*", _S.read(_e, "h"), _S.invoke(_S.read(_e, "R"), "range", [0.14, 0.22]))}, {"at": _S.binary("+", 0.12, _S.binary("*", _S.read(_e, "i"), 0.075))}, {"sink": _S.binary("+", 1.45, _S.binary("*", _S.read(_e, "i"), 0.06))}, {"seed": _S.invoke(_S.read(_e, "R"), "int", [1, 999])}, {"up": false}, {"down": false}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "sp", _S.arg(_args, 1))
	_S.define(_e, "nn", _S.arg(_args, 2))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.read(_v8, "nn"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v9, "Math"), "PI")), 2), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 1.1), 1.1])))
		_S.define(_v9, "v", _S.binary("*", _S.invoke(_S.read(_v9, "R"), "range", [60, 210]), _S.read(_v9, "sp")))
		_S.invoke(_S.read(_v9, "chips"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v9, "x"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.unary("-", 1)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "v"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "v"))}, {"a": _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")])}, {"va": _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 15), 15])}, {"s": _S.binary("*", _S.invoke(_S.read(_v9, "R"), "range", [1.3, 2.6]), _S.invoke(_S.read(_v9, "Math"), "sqrt", [_S.read(_v9, "sp")]))}, {"pts": _S.call_value(_S.read(_v9, "stoneShape"), [_S.read(_v9, "R")])}, {"life": _S.invoke(_S.read(_v9, "Math"), "min", [_S.invoke(_S.read(_v9, "R"), "range", [0.7, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v9, "meta"), "duration"), 0.05), _S.read(_v9, "t"))])}])])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "i", 1, "+=", true)
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "at"))) else _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "at")), _S.read(_e, "RISE"))]), 2.4]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "smooth"), [_S.prop(_S.read(_e, "s"), "sink"), _S.binary("+", _S.prop(_S.read(_e, "s"), "sink"), _S.read(_e, "SINK")), _S.read(_e, "t")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	for _v10 in _S.array(_S.read(_e, "list")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "s", _v10)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "k", _S.binary("/", _S.prop(_S.read(_v12, "s"), "h"), 48))
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "s"), "up")), func(): return _S.binary(">=", _S.read(_v12, "t"), _S.prop(_S.read(_v12, "s"), "at")))):
			var _v13 = _S.scope(_v12)
			_S.set_prop(_S.read(_v13, "s"), "up", true, "=", false)
			_S.invoke(_S.read(_v13, "lights"), "add", [_S.prop(_S.read(_v13, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "s"), "h")), 0.5), _S.binary("+", 18, _S.binary("*", 18, _S.read(_v13, "k"))), _S.read(_v13, "WHITE"), 0.45, 0.08])
			_S.invoke(_S.read(_v13, "lights"), "add", [_S.prop(_S.read(_v13, "s"), "x"), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v13, "s"), "h")), 0.4), _S.binary("+", 26, _S.binary("*", 26, _S.read(_v13, "k"))), _S.prop(_S.read(_v13, "G"), 2), 0.45, 0.4])
			_S.call_value(_S.read(_v13, "chip"), [_S.prop(_S.read(_v13, "s"), "x"), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v13, "k"))), _S.binary("+", 3, _S.invoke(_S.read(_v13, "Math"), "round", [_S.binary("*", 5, _S.read(_v13, "k"))]))])
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "i"), _S.binary("+", 10, _S.binary("*", 18, _S.read(_v14, "k"))))):
				var _v15 = _S.scope(_v14)
				_S.define(_v15, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "Math"), "PI")), 2), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 1), 1])))
				_S.define(_v15, "v", _S.binary("*", _S.invoke(_S.read(_v15, "R"), "range", [60, 230]), _S.binary("+", 0.6, _S.binary("*", 0.6, _S.read(_v15, "k")))))
				_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "GRIT"), _S.binary("+", _S.prop(_S.read(_v15, "s"), "x"), _S.invoke(_S.read(_v15, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "s"), "w")), 3), _S.binary("/", _S.prop(_S.read(_v15, "s"), "w"), 3)])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "v")), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "v")), _S.invoke(_S.read(_v15, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "S"), 5), _S.prop(_S.read(_v15, "S"), 4), _S.prop(_S.read(_v15, "S"), 3)]]), (2 if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.3])) else 1)])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "i", 1, "+=", true)
			var _v16 = _S.scope(_v13)
			_S.define(_v16, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.binary("+", 3, _S.binary("*", 5, _S.read(_v16, "k"))))):
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.binary("+", _S.prop(_S.read(_v16, "s"), "x"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [1, 4])), _S.binary("*", _S.invoke(_S.read(_v16, "R"), "sign", []), _S.invoke(_S.read(_v16, "R"), "range", [20, 80])), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [5, 25])), _S.invoke(_S.read(_v16, "R"), "range", [0.7, 1.2]), _S.prop(_S.read(_v16, "S"), 5), _S.binary("*", _S.invoke(_S.read(_v16, "R"), "range", [3, 5.5]), _S.binary("+", 0.6, _S.binary("*", 0.5, _S.read(_v16, "k")))), 0, 0])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "i", 1, "+=", true)
			var _v17 = _S.scope(_v13)
			_S.define(_v17, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v17, "i"), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v17, "k"))))):
				_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "STAR"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v17, "s"), "hook"), 0.8)), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v17, "s"), "h")), _S.invoke(_S.read(_v17, "R"), "range", [0.5, 1])), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v17, "R"), "range", [5, 20])), _S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v17, "G"), 3), _S.invoke(_S.read(_v17, "R"), "range", [0.8, 2]), _S.invoke(_S.read(_v17, "R"), "range", [0, 0.12])])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "i", 1, "+=", true)
			var _v18 = _S.scope(_v13)
			_S.define(_v18, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "i"), 4)):
				_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "MOTE"), _S.binary("+", _S.prop(_S.read(_v18, "s"), "x"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [2, _S.binary("*", _S.prop(_S.read(_v18, "s"), "h"), 0.6)])), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [30, 70])), _S.invoke(_S.read(_v18, "R"), "range", [0.4, 0.8]), _S.prop(_S.read(_v18, "G"), 3), 0.7])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v12, "s"), "down")), func(): return _S.binary(">=", _S.read(_v12, "t"), _S.prop(_S.read(_v12, "s"), "sink")))):
			var _v19 = _S.scope(_v12)
			_S.set_prop(_S.read(_v19, "s"), "down", true, "=", false)
			_S.call_value(_S.read(_v19, "chip"), [_S.prop(_S.read(_v19, "s"), "x"), 0.35, _S.binary("+", 2, _S.invoke(_S.read(_v19, "Math"), "round", [_S.binary("*", 2, _S.read(_v19, "k"))]))])
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.binary("+", 3, _S.binary("*", 3, _S.read(_v20, "k"))))):
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v20, "s"), "x"), _S.invoke(_S.read(_v20, "R"), "range", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "s"), "w")), 2), _S.binary("/", _S.prop(_S.read(_v20, "s"), "w"), 2)])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [0, 3])), _S.binary("*", _S.invoke(_S.read(_v20, "R"), "sign", []), _S.invoke(_S.read(_v20, "R"), "range", [15, 50])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 10])), _S.invoke(_S.read(_v20, "Math"), "min", [_S.invoke(_S.read(_v20, "R"), "range", [0.4, 0.7]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v20, "meta"), "duration"), 0.05), _S.read(_v20, "t"))]), _S.prop(_S.read(_v20, "S"), 5), _S.invoke(_S.read(_v20, "R"), "range", [2, 4])])
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "i", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v12, "s"), "up"), func(): return _S.unary("!", _S.prop(_S.read(_v12, "s"), "down"))), func(): return _S.binary(">", _S.read(_v12, "t"), _S.binary("+", _S.prop(_S.read(_v12, "s"), "at"), 0.2))), func(): return _S.invoke(_S.read(_v12, "R"), "chance", [_S.binary("*", 0.05, _S.read(_v12, "f"))]))):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "STAR"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_v12, "s"), "x"), _S.binary("*", _S.prop(_S.read(_v12, "s"), "lean"), 0.5)), _S.binary("*", _S.prop(_S.read(_v12, "s"), "w"), 0.15)), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v12, "s"), "h")), _S.invoke(_S.read(_v12, "R"), "range", [0.3, 0.8])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v12, "R"), "range", [0.25, 0.45]), _S.prop(_S.read(_v12, "C"), 7), _S.invoke(_S.read(_v12, "R"), "range", [0.8, 1.8])])
	var _v21 = _S.scope(_e)
	_S.define(_v21, "i", _S.binary("-", _S.prop(_S.read(_v21, "chips"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v21, "i"), 0)):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "c", _S.prop(_S.read(_v22, "chips"), _S.read(_v22, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v22, "c"), "life", _S.read(_v22, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v22, "chips"), "splice", [_S.read(_v22, "i"), 1])
		_S.set_prop(_S.read(_v22, "c"), "vy", _S.binary("*", 950, _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "c"), "x", _S.binary("*", _S.prop(_S.read(_v22, "c"), "vx"), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "c"), "y", _S.binary("*", _S.prop(_S.read(_v22, "c"), "vy"), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "c"), "a", _S.binary("*", _S.prop(_S.read(_v22, "c"), "va"), _S.read(_v22, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v22, "c"), "y"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v22, "c"), "vy"), 0))):
			(_S.last([_S.set_prop(_S.read(_v22, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v22, "c"), "vy", _S.unary("-", 0.3), "*=", false), _S.set_prop(_S.read(_v22, "c"), "vx", 0.6, "*=", false), _S.set_prop(_S.read(_v22, "c"), "va", 0.5, "*=", false)]) if _S.truth(_S.binary(">", _S.prop(_S.read(_v22, "c"), "vy"), 120)) else _S.last([_S.set_prop(_S.read(_v22, "c"), "y", 0, "=", false), _S.set_prop(_S.read(_v22, "c"), "vy", _S.set_prop(_S.read(_v22, "c"), "vx", _S.set_prop(_S.read(_v22, "c"), "va", 0, "=", false), "=", false), "=", false)]))
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "run", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), 0.04), 0.5)])]), _S.read(_e, "reach")))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [1.9, 2.3, _S.read(_e, "t")])))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "x", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v23, "x"), _S.read(_v23, "run"))):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "hot", _S.binary("*", _S.call_value(_S.read(_v24, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v24, "run"), _S.read(_v24, "x")), 18))]), _S.binary("-", 1, _S.call_value(_S.read(_v24, "smooth"), [0.6, 1.2, _S.read(_v24, "t")]))))
		_S.define(_v24, "h", _S.call_value(_S.read(_v24, "rand"), [_S.read(_v24, "x"), 31]))
		_S.invoke(_S.read(_v24, "p"), "dot", [_S.read(_v24, "x"), 0, (_S.prop(_S.read(_v24, "G"), 3) if _S.truth(_S.binary(">", _S.read(_v24, "hot"), 0.4)) else (_S.prop(_S.read(_v24, "G"), 2) if _S.truth(_S.binary(">", _S.read(_v24, "hot"), 0.1)) else _S.prop(_S.read(_v24, "S"), 0))), _S.read(_v24, "fade")])
		if _S.truth(_S.binary("<", _S.read(_v24, "h"), 0.5)):
			_S.invoke(_S.read(_v24, "p"), "dot", [_S.read(_v24, "x"), 1, _S.prop(_S.read(_v24, "S"), 1), _S.binary("*", _S.read(_v24, "fade"), 0.8)])
		if _S.truth(_S.binary("<", _S.read(_v24, "h"), 0.15)):
			_S.invoke(_S.read(_v24, "p"), "dot", [_S.read(_v24, "x"), _S.unary("-", 1), _S.prop(_S.read(_v24, "S"), 4), _S.read(_v24, "fade")])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v24, "hot"), 0.3), func(): return _S.binary("===", _S.binary("&", _S.read(_v24, "x"), 3), 0))):
			_S.invoke(_S.read(_v24, "p"), "glow", [_S.read(_v24, "x"), 0, 6, _S.prop(_S.read(_v24, "G"), 2), _S.binary("*", 0.3, _S.read(_v24, "hot"))])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v25 in _S.array(_S.read(_e, "list")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "s", _v25)
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "g", _S.call_value(_S.read(_v27, "grown"), [_S.read(_v27, "s")]))
		_S.define(_v27, "k", _S.call_value(_S.read(_v27, "sunk"), [_S.read(_v27, "s")]))
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v27, "g"), 0), func(): return _S.binary(">=", _S.read(_v27, "k"), 1))):
			continue
		_S.call_value(_S.read(_v27, "thorn"), [_S.read(_v27, "p"), _S.read(_v27, "s"), _S.binary("*", _S.prop(_S.read(_v27, "s"), "h"), _S.read(_v27, "g")), _S.read(_v27, "C"), _S.merge([{"white": _S.binary("<", _S.binary("-", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "at")), 0.035)}, {"base": _S.binary("*", _S.binary("*", _S.read(_v27, "k"), _S.prop(_S.read(_v27, "s"), "h")), 1.05)}])])
		if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "at")), 0.3)):
			_S.invoke(_S.read(_v27, "p"), "glow", [_S.prop(_S.read(_v27, "s"), "x"), _S.binary("*", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v27, "s"), "h")), 0.5), _S.read(_v27, "g")), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v27, "s"), "h"), 0.6), 6), _S.prop(_S.read(_v27, "G"), 2), _S.binary("*", 0.35, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "at")), 0.3)))])
		_S.define(_v27, "lk", _S.binary("*", _S.call_value(_S.read(_v27, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "at")), 0.04), 0.18)]), _S.binary("-", 1, _S.read(_v27, "k"))))
		_S.define(_v27, "lw", _S.binary("*", _S.prop(_S.read(_v27, "s"), "w"), 0.5))
		if _S.truth(_S.binary(">", _S.read(_v27, "lk"), 0.05)):
			for _v28 in _S.array([[_S.unary("-", 1), _S.unary("-", 2.5), 1], [1, _S.unary("-", 0.55), 0.9], [_S.unary("-", 1), _S.unary("-", 1.9), 0.7]]):
				var _v29 = _S.scope(_v27)
				var _v30 = _v28
				_S.define(_v29, "sd", _S.prop(_v30, 0))
				_S.define(_v29, "a0", _S.prop(_v30, 1))
				_S.define(_v29, "sz", _S.prop(_v30, 2))
				var _v31 = _S.scope(_v29)
				_S.define(_v31, "la", _S.binary("+", _S.binary("+", _S.read(_v31, "a0"), _S.binary("*", _S.binary("*", _S.read(_v31, "sd"), 0.25), _S.binary("-", 1, _S.read(_v31, "lk")))), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v31, "t"), 4), _S.prop(_S.read(_v31, "s"), "x"))]), 0.06)))
				_S.define(_v31, "L", _S.binary("*", _S.binary("*", _S.binary("+", 5, _S.binary("*", _S.prop(_S.read(_v31, "s"), "w"), 0.45)), _S.read(_v31, "sz")), _S.read(_v31, "lk")))
				_S.call_value(_S.read(_v31, "drawLeaf"), [_S.read(_v31, "p"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v31, "s"), "x"), _S.binary("*", _S.read(_v31, "sd"), _S.read(_v31, "lw"))), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "la")]), _S.read(_v31, "L")), 0.5)), _S.binary("+", _S.unary("-", 1), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "la")]), _S.read(_v31, "L")), 0.5)), _S.read(_v31, "L"), _S.binary("+", 1.4, _S.binary("*", _S.binary("*", _S.prop(_S.read(_v31, "s"), "w"), 0.1), _S.read(_v31, "sz"))), _S.read(_v31, "la"), 0.35, [_S.prop(_S.read(_v31, "G"), 0), _S.prop(_S.read(_v31, "G"), 1), _S.prop(_S.read(_v31, "G"), 2), _S.prop(_S.read(_v31, "G"), 3)]])
		_S.invoke(_S.read(_v27, "p"), "glow", [_S.prop(_S.read(_v27, "s"), "x"), _S.unary("-", 2), _S.binary("+", _S.prop(_S.read(_v27, "s"), "w"), 6), _S.prop(_S.read(_v27, "G"), 2), _S.binary("*", 0.18, _S.read(_v27, "lk"))])
	for _v32 in _S.array(_S.read(_e, "chips")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "c", _v32)
		_S.call_value(_S.read(_v33, "drawRock"), [_S.read(_v33, "p"), _S.prop(_S.read(_v33, "c"), "x"), _S.prop(_S.read(_v33, "c"), "y"), _S.prop(_S.read(_v33, "c"), "s"), _S.prop(_S.read(_v33, "c"), "a"), _S.prop(_S.read(_v33, "c"), "pts"), _S.read(_v33, "S"), _S.invoke(_S.read(_v33, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v33, "c"), "life"), 0.25)])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
