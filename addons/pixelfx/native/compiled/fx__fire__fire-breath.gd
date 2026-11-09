@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/fire/fire-breath.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "noiseFor", _S.import_value("fx/fire/_lib.js", "noiseFor"))
	_S.define(_e, "hotFirst", _S.import_value("fx/fire/_lib.js", "hotFirst"))
	_S.define(_e, "flameBlade", _S.import_value("fx/fire/_lib.js", "flameBlade"))
	_S.define(_e, "flameTongue", _S.import_value("fx/fire/_lib.js", "flameTongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/fire/_lib.js", "firePuff"))
	_S.define(_e, "smokePuff", _S.import_value("fx/fire/_lib.js", "smokePuff"))
	_S.define(_e, "spark", _S.import_value("fx/fire/_lib.js", "spark"))
	_S.define(_e, "ember", _S.import_value("fx/fire/_lib.js", "ember"))
	_S.define(_e, "drift", _S.import_value("fx/fire/_lib.js", "drift"))
	_S.define(_e, "looped", _S.import_value("fx/fire/_lib.js", "looped"))
	_S.define(_e, "LAYERS", _S.import_value("fx/fire/_lib.js", "LAYERS"))
	_S.define(_e, "BACK_LAYERS", _S.import_value("fx/fire/_lib.js", "BACK_LAYERS"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Fire breath"}, {"desc": "A roaring cone of fire streaming right from the mouth: white-hot at the lips, billowing out and cooling to red and smoke at its edges, sparks thrown out ahead."}, {"tags": ["fire", "breath", "dragon", "stream", "cone", "directional", "loop"]}, {"size": [160, 116]}, {"origin": [12, 72]}, {"duration": 1.5}, {"loop": true}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"spread": 0.24}, {"speed": 320}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "NL", _S.call_value(_S.read(_e, "noiseFor"), [_S.read(_e, "D")]))
	_S.define(_e, "SMOKE1", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "COOL_LAYERS", [[1, 1, 7], [0.72, 0.82, 6], [0.44, 0.58, 5]])
	_S.define(_e, "JET", [[42, 4.2, 0], [32, 3.8, _S.unary("-", 0.08)], [30, 3.8, 0.08], [20, 4.6, 0]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "hotFirst"), [_S.read(_e, "F")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "spread"))
	_S.define(_e, "V", _S.prop(_S.read(_e, "o"), "speed"))
	_S.define(_e, "N", _S.function_value(_e, "_f1"))
	_S.define(_e, "GLOW", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "H"), 3), _S.prop(_S.read(_e, "H"), 4), 0.5]), _S.read(_e, "WHITE"), 0.25]))
	_S.define(_e, "SMOKE", _S.call_value(_S.read(_e, "mix"), [_S.read(_e, "SMOKE1"), _S.prop(_S.read(_e, "H"), 6), 0.3]))
	_S.define(_e, "SPARKS", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 5)])
	_S.define(_e, "EMB", [_S.prop(_S.read(_e, "H"), 1), _S.prop(_S.read(_e, "H"), 2), _S.prop(_S.read(_e, "H"), 4), _S.prop(_S.read(_e, "H"), 6)])
	_S.define(_e, "roar", _S.function_value(_e, "_f2"))
	_S.define(_e, "sway", _S.function_value(_e, "_f3"))
	_S.define(_e, "fire", [])
	_S.define(_e, "smoke", [])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 260, _S.binary("+", _S.read(_e, "S"), 100), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	for _v2 in _S.array(_S.read(_e, "smoke")):
		var _v3 = _S.scope(_e)
		var _v4 = _v2
		_S.define(_v3, "sa", _S.prop(_v4, 0))
		_S.define(_v3, "x", _S.prop(_v4, 1))
		_S.define(_v3, "y", _S.prop(_v4, 2))
		_S.define(_v3, "q", _S.prop(_v4, 3))
		_S.call_value(_S.read(_v3, "smokePuff"), [_S.read(_v3, "p"), _S.read(_v3, "x"), _S.read(_v3, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_v3, "sa"), _S.prop(_S.read(_v3, "q"), "sl"))), _S.binary("*", _S.prop(_S.read(_v3, "q"), "s"), 1.1), _S.read(_v3, "SMOKE"), true, 0.7])
	_S.invoke(_S.read(_e, "fire"), "sort", [_S.function_value(_e, "_f6")])
	for _v5 in _S.array(_S.read(_e, "fire")):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "age", _S.prop(_v7, 0))
		_S.define(_v6, "x", _S.prop(_v7, 1))
		_S.define(_v6, "y", _S.prop(_v7, 2))
		_S.define(_v6, "q", _S.prop(_v7, 3))
		var _v8 = _S.scope(_v6)
		_S.define(_v8, "u", _S.binary("/", _S.read(_v8, "age"), _S.prop(_S.read(_v8, "q"), "fl")))
		_S.define(_v8, "edge", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.prop(_S.read(_v8, "q"), "e")]))
		_S.define(_v8, "size", _S.binary("*", _S.prop(_S.read(_v8, "q"), "s"), _S.binary("+", 0.75, _S.binary("*", 1.6, _S.read(_v8, "u")))))
		_S.define(_v8, "heat", _S.invoke(_S.read(_v8, "Math"), "min", [0.999, _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "pow", [_S.read(_v8, "u"), 1.5]), _S.binary("+", 0.85, _S.binary("*", 0.2, _S.read(_v8, "edge")))), _S.binary("*", _S.binary("*", 0.3, _S.read(_v8, "edge")), _S.read(_v8, "edge")))]))
		_S.define(_v8, "tear", _S.call_value(_S.read(_v8, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v8, "u"), 0.32), 0.2)]))
		_S.call_value(_S.read(_v8, "firePuff"), [_S.read(_v8, "p"), _S.read(_v8, "x"), _S.read(_v8, "y"), _S.binary("-", 1, _S.read(_v8, "heat")), _S.binary("*", _S.read(_v8, "size"), _S.binary("-", 1, _S.binary("*", 0.55, _S.read(_v8, "tear")))), _S.prop(_S.read(_v8, "q"), "f"), _S.read(_v8, "H"), 0.1, _S.unary("-", 0.5), _S.unary("-", 0.86)])
		if _S.truth(_S.binary(">", _S.read(_v8, "tear"), 0)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "n", _S.invoke(_S.read(_v9, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_v9, "q"), "f"), 100000)]))
			_S.define(_v9, "h", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v9, "size"), _S.binary("+", 1.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v9, "N"), [4, _S.read(_v9, "n")])))), _S.binary("-", 1.2, _S.binary("*", _S.read(_v9, "heat"), 0.6))), _S.read(_v9, "tear")))
			_S.call_value(_S.read(_v9, "flameTongue"), [_S.read(_v9, "p"), _S.read(_v9, "x"), _S.binary("+", _S.read(_v9, "y"), _S.binary("*", _S.read(_v9, "size"), 0.3)), _S.read(_v9, "h"), _S.binary("*", _S.binary("*", _S.read(_v9, "size"), 0.5), _S.binary("-", 1.1, _S.binary("*", _S.read(_v9, "heat"), 0.5))), _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v9, "h")), 0.4), _S.binary("*", _S.call_value(_S.read(_v9, "N"), [2.5, _S.binary("+", _S.read(_v9, "n"), 1)]), 2)), _S.read(_v9, "N"), _S.read(_v9, "n"), _S.read(_v9, "H"), (_S.read(_v9, "LAYERS") if _S.truth(_S.binary("<", _S.read(_v9, "heat"), 0.45)) else (_S.read(_v9, "BACK_LAYERS") if _S.truth(_S.binary("<", _S.read(_v9, "heat"), 0.72)) else _S.read(_v9, "COOL_LAYERS")))])
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "i"), 6)):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "n", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_v11, "S"), 3), _S.read(_v11, "i")), 19))
		_S.define(_v11, "side", (1 if _S.truth(_S.binary("%", _S.read(_v11, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v11, "d", _S.binary("+", _S.binary("+", 18, _S.binary("*", _S.binary(">>", _S.read(_v11, "i"), 1), 16)), _S.binary("*", _S.call_value(_S.read(_v11, "N"), [2, _S.read(_v11, "n")]), 4)))
		_S.define(_v11, "L", _S.binary("*", _S.binary("+", 9, _S.binary("*", 5, _S.binary("+", 0.5, _S.binary("*", 0.5, _S.call_value(_S.read(_v11, "N"), [5, _S.binary("+", _S.read(_v11, "n"), 1)]))))), _S.binary("-", 1, _S.binary("/", _S.read(_v11, "d"), 120))))
		_S.define(_v11, "ex", _S.read(_v11, "d"))
		_S.define(_v11, "ey", _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v11, "side"), _S.read(_v11, "d")), _S.read(_v11, "A")), 0.85), _S.binary("*", _S.read(_v11, "d"), 0.06)))
		_S.call_value(_S.read(_v11, "flameBlade"), [_S.read(_v11, "p"), _S.read(_v11, "ex"), _S.read(_v11, "ey"), 0.75, _S.binary("-", _S.binary("*", _S.read(_v11, "side"), 0.45), 0.48), _S.read(_v11, "L"), _S.binary("+", 1.6, _S.binary("*", _S.read(_v11, "L"), 0.08)), _S.binary("*", _S.unary("-", _S.read(_v11, "side")), 3), _S.read(_v11, "N"), _S.read(_v11, "n"), _S.read(_v11, "H"), _S.read(_v11, "LAYERS")])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 70, _S.binary("+", _S.read(_e, "S"), 250), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "JET"), "forEach", [_S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 40, _S.binary("+", _S.read(_e, "S"), 300), _S.function_value(_e, "_f11"), _S.function_value(_e, "_f12")])
	_S.call_value(_S.read(_e, "looped"), [_S.read(_e, "t"), _S.read(_e, "D"), 18, _S.binary("+", _S.read(_e, "S"), 400), _S.function_value(_e, "_f13"), _S.function_value(_e, "_f14")])
	_S.define(_e, "k", _S.call_value(_S.read(_e, "roar"), [_S.read(_e, "t")]))
	_S.invoke(_S.read(_e, "p"), "glow", [3, 0, _S.binary("*", 34, _S.read(_e, "k")), _S.read(_e, "GLOW"), _S.binary("*", 0.75, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [3, 0, 10, _S.prop(_S.read(_e, "H"), 0), 0.55])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "d", 10)
	while _S.truth(_S.binary("<", _S.read(_v16, "d"), 126)):
		_S.invoke(_S.read(_v16, "p"), "glow", [_S.read(_v16, "d"), _S.binary("*", _S.unary("-", _S.read(_v16, "d")), 0.1), _S.binary("+", 10, _S.binary("*", _S.read(_v16, "d"), 0.2)), _S.read(_v16, "GLOW"), _S.binary("*", _S.binary("*", 0.32, _S.read(_v16, "k")), _S.binary("-", 1, _S.binary("/", _S.read(_v16, "d"), 150)))])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "d", 8, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glow", [64, _S.unary("-", 12), 96, _S.read(_e, "GLOW"), _S.binary("*", 0.16, _S.read(_e, "k"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "rate", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "off", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	return _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "t"), _S.read(_e, "rate"), _S.read(_e, "seed"), _S.read(_e, "off")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 3, _S.binary("+", _S.read(_e, "S"), 1)])))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.arg(_args, 0))
	return _S.binary("*", _S.call_value(_S.read(_e, "NL"), [_S.read(_e, "tt"), 1.3, _S.binary("+", _S.read(_e, "S"), 2)]), 0.05)

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1]))
	_S.define(_e, "fl", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [0.42, 0.8]), _S.binary("-", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "e")])))))
	_S.define(_e, "sm", _S.invoke(_S.read(_e, "r"), "chance", [_S.binary("+", 0.2, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "e")])))]))
	return _S.merge([{"e": _S.read(_e, "e")}, {"sp": _S.invoke(_S.read(_e, "r"), "range", [0.75, 1.1])}, {"fl": _S.read(_e, "fl")}, {"sm": _S.read(_e, "sm")}, {"sl": _S.invoke(_S.read(_e, "r"), "range", [0.5, 0.85])}, {"s": _S.invoke(_S.read(_e, "r"), "range", [3, 5.2])}, {"f": _S.invoke(_S.read(_e, "r"), "next", [])}, {"ox": _S.invoke(_S.read(_e, "r"), "range", [4, 10])}, {"life": _S.binary("+", _S.read(_e, "fl"), (0.85 if _S.truth(_S.read(_e, "sm")) else 0))}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "tb", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "age")))
	_S.define(_e, "a", _S.binary("-", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "q"), "e"), _S.read(_e, "A")), _S.call_value(_S.read(_e, "sway"), [_S.read(_e, "tb")])), 0.04))
	_S.define(_e, "v", _S.binary("*", _S.binary("*", _S.read(_e, "V"), _S.prop(_S.read(_e, "q"), "sp")), _S.call_value(_S.read(_e, "roar"), [_S.read(_e, "tb")])))
	_S.define(_e, "ta", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")]))
	var _v0 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "ox"), _S.binary("*", _S.prop(_S.read(_e, "q"), "e"), 1.5), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "v")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "v")), _S.read(_e, "ta"), 0, _S.unary("-", 100), 2, 2.4])
	_S.define(_e, "x", _S.prop(_v0, 0))
	_S.define(_e, "y", _S.prop(_v0, 1))
	_S.define(_e, "vx", _S.prop(_v0, 2))
	_S.define(_e, "vy", _S.prop(_v0, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl"))):
		return _S.invoke(_S.read(_e, "fire"), "push", [[_S.read(_e, "age"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "q")]])
	if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_e, "q"), "sm")), func(): return _S.binary(">", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")), _S.prop(_S.read(_e, "q"), "sl")))):
		return null
	_S.define(_e, "sa", _S.binary("-", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "fl")))
	var _v1 = _S.call_value(_S.read(_e, "drift"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.read(_e, "vx"), 0.5), _S.binary("-", _S.binary("*", _S.read(_e, "vy"), 0.6), 8), _S.read(_e, "sa"), 0, _S.unary("-", 26), 1.8, 1.2])
	_S.define(_e, "sx", _S.prop(_v1, 0))
	_S.define(_e, "sy", _S.prop(_v1, 1))
	_S.invoke(_S.read(_e, "smoke"), "push", [[_S.read(_e, "sa"), _S.read(_e, "sx"), _S.read(_e, "sy"), _S.read(_e, "q")]])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "b"), 0), _S.prop(_S.read(_e, "a"), 0))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"e": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.6), 0.6])}, {"v": _S.invoke(_S.read(_e, "r"), "range", [330, 470])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.12, 0.26])}, {"l": _S.invoke(_S.read(_e, "r"), "range", [4, 9])}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "q"), "e"), _S.read(_e, "A")), 0.03))
	var _v12 = _S.call_value(_S.read(_e, "drift"), [6, _S.binary("*", _S.prop(_S.read(_e, "q"), "e"), 2), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.prop(_S.read(_e, "q"), "v")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.prop(_S.read(_e, "q"), "v")), _S.read(_e, "age"), 0, _S.unary("-", 60), 2, 2])
	_S.define(_e, "x", _S.prop(_v12, 0))
	_S.define(_e, "y", _S.prop(_v12, 1))
	_S.define(_e, "vx", _S.prop(_v12, 2))
	_S.define(_e, "vy", _S.prop(_v12, 3))
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "vx"), _S.read(_e, "vy")]))
	_S.define(_e, "k", _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))))
	_S.define(_e, "L", _S.binary("*", _S.prop(_S.read(_e, "q"), "l"), _S.binary("/", _S.read(_e, "sp"), 400)))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.binary("/", _S.read(_e, "vx"), _S.read(_e, "sp")), _S.read(_e, "L"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.binary("/", _S.read(_e, "vy"), _S.read(_e, "sp")), _S.read(_e, "L"))), _S.read(_e, "x"), _S.read(_e, "y"), _S.function_value(_e, "_f9")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return ((_S.prop(_S.read(_e, "H"), 0) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "H"), 1)) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else (_S.prop(_S.read(_e, "H"), 2) if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.5)) else _S.prop(_S.read(_e, "H"), 3)))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v13 = _S.arg(_args, 0)
	_S.define(_e, "len", _S.prop(_v13, 0))
	_S.define(_e, "w", _S.prop(_v13, 1))
	_S.define(_e, "a", _S.prop(_v13, 2))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "n", _S.binary("*", _S.binary("+", _S.binary("*", _S.read(_e, "S"), 5), _S.read(_e, "i")), 17))
	_S.define(_e, "L", _S.binary("*", _S.binary("*", _S.read(_e, "len"), _S.call_value(_S.read(_e, "roar"), [_S.read(_e, "t")])), _S.binary("+", 0.85, _S.binary("*", 0.2, _S.call_value(_S.read(_e, "N"), [5, _S.read(_e, "n")])))))
	_S.define(_e, "aa", _S.binary("+", _S.read(_e, "a"), _S.call_value(_S.read(_e, "sway"), [_S.read(_e, "t")])))
	_S.call_value(_S.read(_e, "flameBlade"), [_S.read(_e, "p"), 0, 0, _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "aa")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "aa")]), _S.read(_e, "L"), _S.read(_e, "w"), _S.binary("*", _S.call_value(_S.read(_e, "N"), [3, _S.binary("+", _S.read(_e, "n"), 3)]), 3), _S.read(_e, "N"), _S.read(_e, "n"), _S.read(_e, "H"), _S.read(_e, "LAYERS"), 0.5, 1.5])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"d": _S.invoke(_S.read(_e, "r"), "range", [4, 60])}, {"e": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1), 1])}, {"v": _S.invoke(_S.read(_e, "r"), "range", [140, 280])}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.55])}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "e"), _S.read(_e, "A")), 1.8), 0.12))
	var _v14 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "d"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "e"), _S.prop(_S.read(_e, "q"), "d")), _S.read(_e, "A")), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.prop(_S.read(_e, "q"), "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.prop(_S.read(_e, "q"), "v")), 30), _S.read(_e, "age"), 0, 190, 2, 2])
	_S.define(_e, "x", _S.prop(_v14, 0))
	_S.define(_e, "y", _S.prop(_v14, 1))
	_S.define(_e, "vx", _S.prop(_v14, 2))
	_S.define(_e, "vy", _S.prop(_v14, 3))
	_S.call_value(_S.read(_e, "spark"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "vx"), _S.read(_e, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.read(_e, "SPARKS")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.merge([{"x": _S.invoke(_S.read(_e, "r"), "range", [50, 100])}, {"y": _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 14), 6])}, {"vx": _S.invoke(_S.read(_e, "r"), "range", [10, 40])}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [20, 50]))}, {"life": _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.4])}, {"s": (2 if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.2])) else 1)}, {"ph": _S.invoke(_S.read(_e, "r"), "range", [0, 6.3])}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "age", _S.arg(_args, 1))
	var _v15 = _S.call_value(_S.read(_e, "drift"), [_S.prop(_S.read(_e, "q"), "x"), _S.prop(_S.read(_e, "q"), "y"), _S.prop(_S.read(_e, "q"), "vx"), _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "age"), 0, _S.unary("-", 30), 1.6, 1.6])
	_S.define(_e, "x", _S.prop(_v15, 0))
	_S.define(_e, "y", _S.prop(_v15, 1))
	_S.call_value(_S.read(_e, "ember"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", 5, _S.binary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.prop(_S.read(_e, "q"), "ph"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "ph")])))), _S.read(_e, "y"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), _S.prop(_S.read(_e, "q"), "life"))), _S.prop(_S.read(_e, "q"), "s"), _S.read(_e, "EMB"), _S.binary("+", _S.binary("*", _S.read(_e, "age"), 40), _S.prop(_S.read(_e, "q"), "ph"))])
	return null
