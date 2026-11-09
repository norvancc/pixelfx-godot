@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/burning.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "tnoise", _S.import_value("fx/status/_lib.js", "tnoise"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "tongue", _S.import_value("fx/status/_lib.js", "tongue"))
	_S.define(_e, "smoke", _S.import_value("fx/status/_lib.js", "smoke"))
	_S.define(_e, "ember", _S.import_value("fx/status/_lib.js", "ember"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "spots", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "draw", _S.function_value(_e, "_f17"))
	_S.define(_e, "meta", _S.merge([{"name": "Burning"}, {"desc": "Burning over time: small flames lick from four hot spots, trailing sparks and thin smoke; every 0.6 s they flare, the body flashes white then orange, scorch marks spread."}, {"tags": ["status", "fire", "burn", "dot", "debuff", "loop"]}, {"size": [72, 80]}, {"origin": [36, 70]}, {"duration": 1.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"char": ["#120c0a", "#2a1a14", "#4a2c1c"]}, {"smoke": "#5b5566"}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "A_", _S.merge([{"turn": 1}, {"crouch": 2}, {"lean": 2}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 38)}, {"bx": 12}, {"by": _S.unary("-", 17)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 7)}, {"fbx": 5}]))
	_S.define(_e, "B_", _S.merge([{"turn": 0.9}, {"crouch": 3}, {"lean": _S.unary("-", 2)}, {"fx": _S.unary("-", 12)}, {"fy": _S.unary("-", 17)}, {"bx": 13}, {"by": _S.unary("-", 38)}, {"ffx": _S.unary("-", 4)}, {"fbx": 4}, {"fby": _S.unary("-", 7)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "A_")], [0.15, _S.read(_e, "B_"), "snap"], [0.3, _S.read(_e, "A_"), "snap"], [0.45, _S.read(_e, "B_"), "snap"], [0.6, _S.read(_e, "A_"), "snap"], [0.75, _S.read(_e, "B_"), "snap"], [0.9, _S.read(_e, "A_"), "snap"], [1.05, _S.read(_e, "B_"), "snap"], [1.2, _S.read(_e, "A_"), "snap"]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TICK", 0.6)
	_S.define(_e, "WIND", _S.unary("-", 14))
	_S.define(_e, "since", _S.function_value(_e, "_f20"))
	_S.define(_e, "flare", _S.function_value(_e, "_f21"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f22"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "SPOTS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "SPOTS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.unary("!", _S.read(_e, "s"))):
		_S.invoke(_S.read(_e, "SPOTS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.write(_e, "s", _S.construct(_S.read(_e, "Map"), []), "=", false)])
	if _S.truth(_S.invoke(_S.read(_e, "s"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "s"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 13), 5)]))
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	_S.define(_e, "hair", _S.prop(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "up"), "filter", [_S.function_value(_e, "_f2")]), "sort", [_S.function_value(_e, "_f3")]), 0))
	_S.define(_e, "shoulder", _S.logical("??", _S.prop(_S.invoke(_S.invoke(_S.prop(_S.read(_e, "S"), "up"), "filter", [_S.function_value(_e, "_f4")]), "sort", [_S.function_value(_e, "_f5")]), 0), func(): return _S.call_value(_S.read(_e, "at"), [0.5, 1])))
	_S.define(_e, "list", _S.invoke([_S.merge([{"at": _S.read(_e, "hair")}, {"side": _S.unary("-", 1)}, {"n": 3}, {"h": 4.5}]), _S.merge([{"at": _S.read(_e, "shoulder")}, {"side": 1}, {"n": 2}, {"h": 4}]), _S.merge([{"at": _S.call_value(_S.read(_e, "at"), [0.62, _S.unary("-", 1)])}, {"side": _S.unary("-", 1)}, {"n": 2}, {"h": 3.5}]), _S.merge([{"at": _S.call_value(_S.read(_e, "at"), [0.6, 1])}, {"side": 1}, {"n": 2}, {"h": 3.5}])], "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "scorch", _S.invoke([0, 1], "map", [_S.function_value(_e, "_f8")]))
	_S.define(_e, "out", _S.merge([{"list": _S.read(_e, "list")}, {"scorch": _S.read(_e, "scorch")}]))
	_S.invoke(_S.read(_e, "s"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	_S.define(_e, "my", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), _S.read(_e, "q"))]))
	var _v0 = _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.read(_e, "my"))
	_S.define(_e, "l", _S.prop(_v0, 0))
	_S.define(_e, "r", _S.prop(_v0, 1))
	return [(_S.read(_e, "l") if _S.truth(_S.binary("<", _S.read(_e, "side"), 0)) else _S.read(_e, "r")), _S.read(_e, "my")]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v1 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v1, 0))
	return _S.binary("<", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "W"), 0.42))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.logical("||", _S.binary("-", _S.prop(_S.read(_e, "p"), 1), _S.prop(_S.read(_e, "q"), 1)), func(): return _S.binary("-", _S.prop(_S.read(_e, "p"), 0), _S.prop(_S.read(_e, "q"), 0)))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v2 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v2, 0))
	_S.define(_e, "y", _S.prop(_v2, 1))
	return _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "x"), _S.binary("/", _S.read(_e, "W"), 2)), func(): return _S.binary(">", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.4))), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.62)))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p"), 1), _S.prop(_S.read(_e, "q"), 1))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sp", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([_S.read(_e, "sp"), {"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.prop(_S.prop(_S.read(_e, "sp"), "at"), 0)), 0.5)}, {"y": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.prop(_S.prop(_S.read(_e, "sp"), "at"), 1)), 1.5)}, {"tongues": _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.prop(_S.read(_e, "sp"), "n")}]), _S.function_value(_e, "_f7")])}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.merge([{"dx": _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_e, "j"), _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "sp"), "n"), 1), 2)), 1.6), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.4), 0.4]))}, {"h": _S.binary("*", _S.prop(_S.read(_e, "sp"), "h"), _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.2]))}, {"n": _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "i"), 17), _S.binary("*", _S.read(_e, "j"), 5)), _S.read(_e, "seed"))}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tick", _S.arg(_args, 0))
	return _S.invoke([0, 1], "map", [_S.function_value(_e, "_f9")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "sp", _S.prop(_S.read(_e, "list"), _S.binary("%", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "tick"), 2), _S.read(_e, "k")), 1), _S.prop(_S.read(_e, "list"), "length"))))
	_S.define(_e, "lum", _S.function_value(_e, "_f10"))
	_S.define(_e, "cand", _S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f11")]))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "cand"), "length"))):
		_S.write(_e, "cand", _S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f12")]), "=", false)
	var _v5 = _S.prop(_S.read(_e, "cand"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "R"), "next", []), _S.prop(_S.read(_e, "cand"), "length"))]))
	_S.define(_e, "x", _S.prop(_v5, 0))
	_S.define(_e, "y", _S.prop(_v5, 1))
	return _S.merge([{"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "x")), 0.5)}, {"y": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "y")), 0.5)}, {"r": _S.invoke(_S.read(_e, "R"), "range", [3.2, 4.4])}])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "luma"), [_S.call_value(_S.read(_e, "colorAt"), [_S.read(_e, "a"), _S.read(_e, "x"), _S.read(_e, "y")])])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v3 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v3, 0))
	_S.define(_e, "y", _S.prop(_v3, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "x")), 0.5), _S.prop(_S.read(_e, "sp"), "x")), _S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "y")), 0.5), _S.prop(_S.read(_e, "sp"), "y"))]), 9), func(): return _S.binary(">", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.42))), func(): return _S.binary(">", _S.call_value(_S.read(_e, "lum"), [_S.read(_e, "x"), _S.read(_e, "y")]), 0.3)), func(): return _S.binary("<", _S.call_value(_S.read(_e, "lum"), [_S.read(_e, "x"), _S.read(_e, "y")]), 0.6))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v4 = _S.arg(_args, 0)
	_S.define(_e, "y", _S.prop(_v4, 1))
	return _S.binary(">", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.45))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.invoke(_S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]), "reverse", []))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "fl", _S.call_value(_S.read(_e, "flare"), [_S.read(_e, "t")]))
	_S.define(_e, "flick", _S.binary("+", 0.8, _S.binary("*", 0.2, _S.call_value(_S.read(_e, "tnoise"), [_S.read(_e, "t"), _S.read(_e, "D"), 7.5, 3]))))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 30), _S.unary("-", 3), 30, 7, _S.function_value(_e, "_f14")])
	_S.define(_e, "smokeC", _S.call_value(_S.read(_e, "mix"), [_S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "smoke")]), _S.prop(_S.read(_e, "F"), 6), 0.2]))
	var _v6 = _S.call_value(_S.read(_e, "spots"), [_S.read(_e, "a"), _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "list", _S.prop(_v6, "list"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 16, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 4), _S.function_value(_e, "_f15"), _S.function_value(_e, "_f16")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "x"), 26), _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.5), 4.5)]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 4), 0.5]), "=", false), _S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", 0.16, _S.binary("*", 0.22, _S.read(_e, "fl"))), _S.read(_e, "flick")), _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d"))), "=", false)])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.8, 1.2])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "sp", _S.prop(_S.read(_e, "list"), _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "list"), "length"))))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "sp"), "x"), _S.call_value(_S.read(_e, "travel"), [_S.binary("*", _S.read(_e, "WIND"), 0.6), _S.binary("*", _S.read(_e, "WIND"), 0.5), 0.8, _S.read(_e, "age")])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 4), _S.read(_e, "i"))]), 1.2)))
	_S.define(_e, "y", _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "sp"), "y"), 3), _S.call_value(_S.read(_e, "travel"), [18, 6, 1, _S.read(_e, "age")])))
	_S.call_value(_S.read(_e, "smoke"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.invoke(_S.read(_e, "r"), "range", [1.1, 1.9]), _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.read(_e, "smokeC"), 0.9])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "F", _S.invoke(_S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 9]), "reverse", []))
	_S.define(_e, "CH", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "char"), 3]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	var _v7 = _S.call_value(_S.read(_e, "spots"), [_S.read(_e, "a"), _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "list", _S.prop(_v7, "list"))
	_S.define(_e, "scorch", _S.prop(_v7, "scorch"))
	_S.define(_e, "ph", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]))
	_S.define(_e, "tick", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "TICK"))]), 2))
	_S.define(_e, "fl", _S.call_value(_S.read(_e, "flare"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.034)):
		for _v8 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
			var _v9 = _S.scope(_e)
			var _v10 = _v8
			_S.define(_v9, "mx", _S.prop(_v10, 0))
			_S.define(_v9, "my", _S.prop(_v10, 1))
			_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v9, "a"), "x"), _S.read(_v9, "mx")), _S.binary("+", _S.prop(_S.read(_v9, "a"), "y"), _S.read(_v9, "my")), _S.read(_v9, "WHITE")])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.22)):
			var _v11 = _S.scope(_e)
			_S.define(_v11, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v11, "ph"), 0.034), 0.186)))
			for _v12 in _S.array(_S.prop(_S.read(_v11, "S"), "body")):
				var _v13 = _S.scope(_v11)
				var _v14 = _v12
				_S.define(_v13, "mx", _S.prop(_v14, 0))
				_S.define(_v13, "my", _S.prop(_v14, 1))
				_S.invoke(_S.read(_v13, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v13, "a"), "x"), _S.read(_v13, "mx")), _S.binary("+", _S.prop(_S.read(_v13, "a"), "y"), _S.read(_v13, "my")), _S.prop(_S.read(_v13, "F"), 4), _S.binary("*", 0.55, _S.read(_v13, "k"))])
	for _v15 in _S.array(_S.prop(_S.read(_e, "scorch"), _S.read(_e, "tick"))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "sc", _v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "grow", _S.call_value(_S.read(_v17, "clamp"), [_S.binary("/", _S.read(_v17, "ph"), 0.14)]))
		_S.define(_v17, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v17, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v17, "ph"), 0.25), 0.33)])))
		_S.define(_v17, "r", _S.binary("*", _S.prop(_S.read(_v17, "sc"), "r"), _S.binary("+", 0.4, _S.binary("*", 0.6, _S.read(_v17, "grow")))))
		if _S.truth(_S.binary("<=", _S.read(_v17, "fade"), 0)):
			continue
		for _v18 in _S.array(_S.prop(_S.read(_v17, "S"), "body")):
			var _v19 = _S.scope(_v17)
			var _v20 = _v18
			_S.define(_v19, "mx", _S.prop(_v20, 0))
			_S.define(_v19, "my", _S.prop(_v20, 1))
			var _v21 = _S.scope(_v19)
			_S.define(_v21, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v21, "a"), "x"), _S.read(_v21, "mx")), 0.5))
			_S.define(_v21, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v21, "a"), "y"), _S.read(_v21, "my")), 0.5))
			_S.define(_v21, "d", _S.binary("+", _S.invoke(_S.read(_v21, "Math"), "hypot", [_S.binary("-", _S.read(_v21, "x"), _S.prop(_S.read(_v21, "sc"), "x")), _S.binary("*", _S.binary("-", _S.read(_v21, "y"), _S.prop(_S.read(_v21, "sc"), "y")), 1.2)]), _S.binary("*", _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "mx"), _S.read(_v21, "my"), 7]), 0.9)))
			if _S.truth(_S.binary(">", _S.read(_v21, "d"), _S.read(_v21, "r"))):
				continue
			_S.define(_v21, "edge", _S.binary(">", _S.read(_v21, "d"), _S.binary("-", _S.read(_v21, "r"), 1)))
			if _S.truth(_S.read(_v21, "edge")):
				_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("-", _S.read(_v21, "x"), 0.5), _S.binary("-", _S.read(_v21, "y"), 0.5), (_S.prop(_S.read(_v21, "F"), 3) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "mx"), _S.read(_v21, "my"), _S.invoke(_S.read(_v21, "Math"), "floor", [_S.binary("*", _S.read(_v21, "t"), 20)])]), 0.5)) else _S.prop(_S.read(_v21, "F"), 4)), _S.binary("*", _S.read(_v21, "fade"), 1.2)])
			else:
				_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("-", _S.read(_v21, "x"), 0.5), _S.binary("-", _S.read(_v21, "y"), 0.5), (_S.prop(_S.read(_v21, "CH"), 0) if _S.truth(_S.binary("<", _S.read(_v21, "d"), _S.binary("*", _S.read(_v21, "r"), 0.5))) else _S.prop(_S.read(_v21, "CH"), 1)), _S.binary("*", _S.read(_v21, "fade"), 1.1)])
		_S.invoke(_S.read(_v17, "p"), "glow", [_S.prop(_S.read(_v17, "sc"), "x"), _S.prop(_S.read(_v17, "sc"), "y"), 6, _S.prop(_S.read(_v17, "F"), 4), _S.binary("*", 0.3, _S.read(_v17, "fade"))])
	for _v22 in _S.array(_S.read(_e, "list")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "sp", _v22)
		var _v24 = _S.scope(_v23)
		for _v25 in _S.array(_S.prop(_S.read(_v24, "sp"), "tongues")):
			var _v26 = _S.scope(_v24)
			_S.define(_v26, "tg", _v25)
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "h", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v27, "tg"), "h"), _S.binary("+", 0.85, _S.binary("*", 0.25, _S.call_value(_S.read(_v27, "tnoise"), [_S.read(_v27, "t"), _S.read(_v27, "D"), 5, _S.prop(_S.read(_v27, "tg"), "n")])))), _S.binary("+", 1, _S.binary("*", 1.6, _S.read(_v27, "fl")))))
			_S.call_value(_S.read(_v27, "tongue"), [_S.read(_v27, "p"), _S.binary("+", _S.prop(_S.read(_v27, "sp"), "x"), _S.prop(_S.read(_v27, "tg"), "dx")), _S.prop(_S.read(_v27, "sp"), "y"), _S.read(_v27, "h"), _S.binary("+", 1.1, _S.binary("*", 0.3, _S.read(_v27, "fl"))), _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v27, "WIND"), 0.08), _S.read(_v27, "h")), 4), _S.binary("*", _S.call_value(_S.read(_v27, "tnoise"), [_S.read(_v27, "t"), _S.read(_v27, "D"), 3, _S.binary("+", _S.prop(_S.read(_v27, "tg"), "n"), 9)]), 0.8)), _S.read(_v27, "F"), _S.read(_v27, "t"), _S.read(_v27, "D"), _S.prop(_S.read(_v27, "tg"), "n")])
		_S.invoke(_S.read(_v24, "p"), "glow", [_S.prop(_S.read(_v24, "sp"), "x"), _S.binary("-", _S.prop(_S.read(_v24, "sp"), "y"), 2), _S.binary("+", 9, _S.binary("*", 6, _S.read(_v24, "fl"))), _S.prop(_S.read(_v24, "F"), 4), _S.binary("+", 0.22, _S.binary("*", 0.35, _S.read(_v24, "fl")))])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 20, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 6), _S.function_value(_e, "_f18"), _S.function_value(_e, "_f19")])
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.3)):
		for _v28 in _S.array(_S.invoke(_S.read(_e, "list"), "entries", [])):
			var _v29 = _S.scope(_e)
			var _v30 = _v28
			_S.define(_v29, "k", _S.prop(_v30, 0))
			_S.define(_v29, "sp", _S.prop(_v30, 1))
			var _v31 = _S.scope(_v29)
			_S.define(_v31, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "j"), 4)):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v32, "Math"), "PI")), 2), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v32, "rand"), [_S.read(_v32, "k"), _S.read(_v32, "j"), _S.read(_v32, "tick")]), 0.5), 2.2)))
				_S.define(_v32, "v", _S.binary("+", 50, _S.binary("*", 50, _S.call_value(_S.read(_v32, "rand"), [_S.read(_v32, "k"), _S.read(_v32, "j"), 2]))))
				_S.define(_v32, "x", _S.binary("+", _S.prop(_S.read(_v32, "sp"), "x"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "an")]), _S.call_value(_S.read(_v32, "travel"), [_S.read(_v32, "v"), 0, 3, _S.read(_v32, "ph")]))))
				_S.define(_v32, "y", _S.binary("+", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v32, "sp"), "y"), 2), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "an")]), _S.call_value(_S.read(_v32, "travel"), [_S.read(_v32, "v"), 0, 3, _S.read(_v32, "ph")]))), _S.binary("*", _S.binary("*", 60, _S.read(_v32, "ph")), _S.read(_v32, "ph"))))
				_S.invoke(_S.read(_v32, "p"), "px", [_S.read(_v32, "x"), _S.read(_v32, "y"), (_S.prop(_S.read(_v32, "F"), 1) if _S.truth(_S.binary("<", _S.read(_v32, "ph"), 0.12)) else _S.prop(_S.read(_v32, "F"), 3))])
				_S.invoke(_S.read(_v32, "p"), "light", [_S.read(_v32, "x"), _S.read(_v32, "y"), _S.prop(_S.read(_v32, "F"), 3), _S.binary("*", 0.4, _S.binary("-", 1, _S.binary("/", _S.read(_v32, "ph"), 0.3)))])
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "j", 1, "+=", true)
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.5, 0.9])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "sp", _S.prop(_S.read(_e, "list"), _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "list"), "length"))))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "sp"), "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 1.5), 1.5])), _S.call_value(_S.read(_e, "travel"), [_S.binary("+", _S.read(_e, "WIND"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 10), 6])), _S.binary("*", _S.read(_e, "WIND"), 0.6), 1.2, _S.read(_e, "age")])), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 9), _S.read(_e, "i"))]), 1.2), _S.read(_e, "age"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_e, "sp"), "y"), 2), _S.call_value(_S.read(_e, "travel"), [_S.unary("-", _S.invoke(_S.read(_e, "r"), "range", [25, 55])), _S.unary("-", 18), 1.4, _S.read(_e, "age")])))
	_S.call_value(_S.read(_e, "ember"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), [_S.prop(_S.read(_e, "F"), 1), _S.prop(_S.read(_e, "F"), 3), _S.prop(_S.read(_e, "F"), 5)], _S.binary("+", _S.read(_e, "age"), _S.read(_e, "i"))])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "TICK")), _S.read(_e, "TICK")), _S.read(_e, "TICK"))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")])), 0.12)])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]), 0.034)) else 1)
