@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/stunned.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "icon", _S.import_value("fx/status/_lib.js", "icon"))
	_S.define(_e, "bitmap", _S.import_value("fx/status/_lib.js", "bitmap"))
	_S.define(_e, "shaped", _S.import_value("fx/status/_lib.js", "shaped"))
	_S.define(_e, "starShape", _S.import_value("fx/status/_lib.js", "starShape"))
	_S.define(_e, "ring", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw1", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Stunned"}, {"desc": "Seeing stars: three spinning stars and two little birds circle the head on a tilted ring, ducking behind it and sweeping round in front, trailing glitter."}, {"tags": ["status", "stun", "dizzy", "daze", "stars", "birds", "debuff", "loop"]}, {"size": [60, 64]}, {"origin": [30, 56]}, {"duration": 2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#3a1e0c", "#8a4a12", "#d88a1c", "#f5c030", "#ffe36e", "#fff6c8", "#ffffff"]}, {"birds": ["#1a1422", "#6a7fae", "#b8c8e8", "#f4f8ff"]}, {"beak": "#ffae35"}, {"seed": 2}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "DAZE", _S.merge([{"turn": 1}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 15)}, {"bx": 8}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "DAZE"), {"x": _S.unary("-", 1)}, {"lean": _S.unary("-", 3)}, {"hx": _S.unary("-", 1)}])], [0.5, _S.merge([_S.read(_e, "DAZE"), {"x": 0}, {"lean": 0}, {"crouch": 2}, {"hy": 1}, {"ffx": _S.unary("-", 2)}])], [1, _S.merge([_S.read(_e, "DAZE"), {"x": 1}, {"lean": 3}, {"hx": 1}])], [1.5, _S.merge([_S.read(_e, "DAZE"), {"x": 0}, {"lean": 0}, {"crouch": 2}, {"hy": 1}, {"fbx": 3}])], [2, _S.merge([_S.read(_e, "DAZE"), {"x": _S.unary("-", 1)}, {"lean": _S.unary("-", 3)}, {"hx": _S.unary("-", 1)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TURNS", 2)
	_S.define(_e, "N", 5)
	_S.define(_e, "STAR7", ["...#...", "..###..", "#######", ".#####.", "..###..", ".##.##.", ".#...#."])
	_S.define(_e, "BIRD", _S.invoke([true, false], "map", [_S.function_value(_e, "_f9")]))
	_S.define(_e, "STAR", _S.invoke(_S.read(_e, "shaped"), "bind", [null, _S.call_value(_S.read(_e, "starShape"), [0.44])]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	_S.define(_e, "cy", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 2))
	_S.define(_e, "rx", _S.binary("*", _S.prop(_S.read(_e, "a"), "w"), 0.62))
	_S.define(_e, "ry", 4.5)
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f1")])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "th", _S.binary("*", _S.read(_e, "TAU"), _S.binary("+", _S.binary("/", _S.binary("*", _S.read(_e, "TURNS"), _S.read(_e, "t")), _S.read(_e, "D")), _S.binary("/", _S.read(_e, "i"), _S.read(_e, "N")))))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	return _S.merge([{"i": _S.read(_e, "i")}, {"th": _S.read(_e, "th")}, {"x": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rx"))}, {"y": _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "s"), _S.read(_e, "ry")))}, {"near": _S.binary(">=", _S.read(_e, "s"), 0)}, {"depth": _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_e, "s")))}, {"bird": _S.binary("===", _S.binary("%", _S.read(_e, "i"), 2), 1)}, {"rx": _S.read(_e, "rx")}, {"ry": _S.read(_e, "ry")}, {"cy": _S.read(_e, "cy")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "layer", _S.arg(_args, 3))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Bd", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "birds"), 4]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "far", _S.binary("===", _S.read(_e, "layer"), "back"))
	_S.define(_e, "dim", _S.function_value(_e, "_f3"))
	for _v0 in _S.array(_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "t"), _S.read(_e, "a")])):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "it", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.binary("===", _S.prop(_S.read(_v2, "it"), "near"), _S.read(_v2, "far"))):
			continue
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v2, "it"), "bird"))):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "k", 1)
			while _S.truth(_S.binary("<=", _S.read(_v3, "k"), 12)):
				var _v4 = _S.scope(_v3)
				_S.define(_v4, "th", _S.binary("-", _S.prop(_S.read(_v4, "it"), "th"), _S.binary("*", _S.read(_v4, "k"), 0.085)))
				_S.define(_v4, "x", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "th")]), _S.prop(_S.read(_v4, "it"), "rx")))
				_S.define(_v4, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v4, "it"), "cy"), 1), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "th")]), _S.prop(_S.read(_v4, "it"), "ry"))))
				if _S.truth(_S.logical("||", _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "th")]), 0), _S.read(_v4, "far")), func(): return _S.binary("<", _S.call_value(_S.read(_v4, "rand"), [_S.prop(_S.read(_v4, "it"), "i"), _S.read(_v4, "k"), _S.invoke(_S.read(_v4, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v4, "t"), _S.read(_v4, "D")), _S.read(_v4, "TURNS")), _S.binary("*", _S.read(_v4, "k"), 0.37)), 9)])]), 0.25))):
					_v3 = _S.iteration(_v3)
					_S.write(_v3, "k", 1, "+=", true)
					continue
				_S.invoke(_S.read(_v4, "p"), "dot", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.call_value(_S.read(_v4, "dim"), [(_S.prop(_S.read(_v4, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v4, "k"), 4)) else (_S.prop(_S.read(_v4, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v4, "k"), 8)) else _S.prop(_S.read(_v4, "C"), 4)))]), _S.binary("-", 1.1, _S.binary("/", _S.read(_v4, "k"), 13))])
				if _S.truth(_S.binary("<", _S.read(_v4, "k"), 6)):
					_S.invoke(_S.read(_v4, "p"), "light", [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.prop(_S.read(_v4, "C"), 4), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v4, "k"), 6)))])
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "k", 1, "+=", true)
		if _S.truth(_S.prop(_S.read(_v2, "it"), "bird")):
			var _v5 = _S.scope(_v2)
			_S.define(_v5, "up", _S.binary("===", _S.binary("%", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_v5, "t"), 8), _S.binary("*", _S.prop(_S.read(_v5, "it"), "i"), 0.5))]), 2), 0))
			_S.define(_v5, "bob", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v5, "t"), _S.read(_v5, "D")), _S.read(_v5, "TAU")), 4), _S.prop(_S.read(_v5, "it"), "i"))]), 0.7))
			_S.define(_v5, "flip", _S.prop(_S.read(_v5, "it"), "near"))
			_S.define(_v5, "f", _S.prop(_S.read(_v5, "BIRD"), (0 if _S.truth(_S.read(_v5, "up")) else 1)))
			_S.define(_v5, "ins", (_S.function_value(_v5, "_f4") if _S.truth(_S.read(_v5, "flip")) else _S.read(_v5, "f")))
			_S.call_value(_S.read(_v5, "icon"), [_S.read(_v5, "p"), _S.prop(_S.read(_v5, "it"), "x"), _S.binary("+", _S.binary("-", _S.prop(_S.read(_v5, "it"), "y"), 3), _S.read(_v5, "bob")), 7, _S.read(_v5, "ins"), [_S.prop(_S.read(_v5, "Bd"), 0), _S.call_value(_S.read(_v5, "dim"), [_S.prop(_S.read(_v5, "Bd"), 1)]), _S.call_value(_S.read(_v5, "dim"), [_S.prop(_S.read(_v5, "Bd"), 2)]), _S.call_value(_S.read(_v5, "dim"), [_S.prop(_S.read(_v5, "Bd"), 3)])], 1, _S.merge([{"e": _S.prop(_S.read(_v5, "Bd"), 0)}, {"b": _S.call_value(_S.read(_v5, "dim"), [_S.call_value(_S.read(_v5, "hex"), [_S.prop(_S.read(_v5, "o"), "beak")])])}, {"w": _S.call_value(_S.read(_v5, "dim"), [_S.prop(_S.read(_v5, "Bd"), 1)])}])])
		else:
			var _v6 = _S.scope(_v2)
			_S.define(_v6, "spin", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v6, "t"), _S.read(_v6, "D")), _S.read(_v6, "TAU")), 3), _S.prop(_S.read(_v6, "it"), "i")))
			_S.define(_v6, "R", [_S.prop(_S.read(_v6, "C"), 0), _S.call_value(_S.read(_v6, "dim"), [_S.prop(_S.read(_v6, "C"), 3)]), _S.call_value(_S.read(_v6, "dim"), [_S.prop(_S.read(_v6, "C"), 4)]), _S.call_value(_S.read(_v6, "dim"), [_S.prop(_S.read(_v6, "C"), 5)])])
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v6, "it"), "depth"), 0.55)):
				_S.call_value(_S.read(_v6, "icon"), [_S.read(_v6, "p"), _S.prop(_S.read(_v6, "it"), "x"), _S.binary("-", _S.prop(_S.read(_v6, "it"), "y"), 1), 7, _S.call_value(_S.read(_v6, "STAR"), [_S.binary("+", 4, _S.binary("*", 0.8, _S.prop(_S.read(_v6, "it"), "depth"))), _S.read(_v6, "spin")]), _S.read(_v6, "R")])
			else:
				_S.call_value(_S.read(_v6, "icon"), [_S.read(_v6, "p"), _S.prop(_S.read(_v6, "it"), "x"), _S.binary("-", _S.prop(_S.read(_v6, "it"), "y"), 1), 5, _S.call_value(_S.read(_v6, "bitmap"), [_S.read(_v6, "STAR7")]), _S.read(_v6, "R")])
			_S.invoke(_S.read(_v6, "p"), "px", [_S.prop(_S.read(_v6, "it"), "x"), _S.binary("-", _S.prop(_S.read(_v6, "it"), "y"), 1), (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.read(_v6, "far")) else _S.prop(_S.read(_v6, "C"), 6))])
			_S.invoke(_S.read(_v6, "p"), "glow", [_S.prop(_S.read(_v6, "it"), "x"), _S.binary("-", _S.prop(_S.read(_v6, "it"), "y"), 1), 11, _S.prop(_S.read(_v6, "C"), 4), _S.binary("+", 0.24, _S.binary("*", 0.3, _S.prop(_S.read(_v6, "it"), "depth")))])
			_S.invoke(_S.read(_v6, "p"), "glow", [_S.prop(_S.read(_v6, "it"), "x"), _S.binary("-", _S.prop(_S.read(_v6, "it"), "y"), 1), 4, _S.prop(_S.read(_v6, "C"), 6), _S.binary("*", 0.3, _S.prop(_S.read(_v6, "it"), "depth"))])
			_S.define(_v6, "fr", _S.invoke(_S.read(_v6, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "atan2", [_S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("-", _S.prop(_S.read(_v6, "it"), "th"), _S.binary("/", _S.prop(_S.read(_v6, "Math"), "PI"), 2))]), _S.invoke(_S.read(_v6, "Math"), "cos", [_S.binary("-", _S.prop(_S.read(_v6, "it"), "th"), _S.binary("/", _S.prop(_S.read(_v6, "Math"), "PI"), 2))])]), 0.32), 2))]))
			if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v6, "far")), func(): return _S.binary(">", _S.read(_v6, "fr"), 0.08))):
				_S.call_value(_S.read(_v6, "flare"), [_S.read(_v6, "p"), _S.prop(_S.read(_v6, "it"), "x"), _S.binary("-", _S.prop(_S.read(_v6, "it"), "y"), 1), _S.binary("*", 9, _S.read(_v6, "fr")), _S.read(_v6, "fr"), [_S.prop(_S.read(_v6, "C"), 3), _S.prop(_S.read(_v6, "C"), 4), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 6)]])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "c"), _S.prop(_S.read(_e, "Bd"), 0), 0.3]) if _S.truth(_S.read(_e, "far")) else _S.read(_e, "c"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "f"), [_S.unary("-", _S.read(_e, "dx")), _S.read(_e, "dy")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.call_value(_S.read(_e, "draw1"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), "back"])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.call_value(_S.read(_e, "draw1"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), "front"])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 1), 26, _S.prop(_S.read(_e, "C"), 4), 0.13])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.25, 0.5])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.prop(_S.read(_e, "a"), "w")), _S.invoke(_S.read(_e, "r"), "range", [0.45, 0.95])))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 1), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), 7)), _S.invoke(_S.read(_e, "r"), "range", [0, 9])))
	_S.define(_e, "arm", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [1, 2.6]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]))]))
	if _S.truth(_S.binary("<", _S.read(_e, "arm"), 1)):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]), 1.4)])
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "arm"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))]))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "up", _S.arg(_args, 0))
	return _S.function_value(_e, "_f10")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "dx"), 0.5))
	_S.define(_e, "y", _S.binary("+", _S.read(_e, "dy"), 0.5))
	if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "dx"), 3), func(): return _S.binary("===", _S.read(_e, "dy"), _S.unary("-", 2)))):
		return "e"
	if _S.truth(_S.logical("&&", _S.logical("||", _S.binary("===", _S.read(_e, "dx"), 5), func(): return _S.binary("===", _S.read(_e, "dx"), 4)), func(): return _S.binary("===", _S.read(_e, "dy"), _S.unary("-", 1)))):
		return ("b" if _S.truth(_S.binary("===", _S.read(_e, "dx"), 5)) else "#")
	_S.define(_e, "wing", ([[_S.unary("-", 1), _S.unary("-", 1)], [_S.unary("-", 1), _S.unary("-", 2)], [_S.unary("-", 2), _S.unary("-", 2)], [_S.unary("-", 2), _S.unary("-", 3)], [_S.unary("-", 3), _S.unary("-", 3)], [_S.unary("-", 3), _S.unary("-", 4)]] if _S.truth(_S.read(_e, "up")) else [[_S.unary("-", 1), 1], [_S.unary("-", 1), 2], [_S.unary("-", 2), 2], [_S.unary("-", 2), 3], [0, 1]]))
	if _S.truth(_S.invoke(_S.read(_e, "wing"), "some", [_S.function_value(_e, "_f11")])):
		return "w"
	if _S.truth(_S.logical("||", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.read(_e, "x"), 3.3), 2), _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.6), 1.9), 2)), 1), func(): return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("-", _S.read(_e, "x"), 2.8), 2), _S.binary("**", _S.binary("+", _S.read(_e, "y"), 1.2), 2)), _S.binary("**", 1.7, 2)))):
		return "#"
	if _S.truth(_S.logical("||", _S.logical("&&", _S.binary("===", _S.read(_e, "dx"), _S.unary("-", 4)), func(): return _S.logical("||", _S.binary("===", _S.read(_e, "dy"), _S.unary("-", 1)), func(): return _S.binary("===", _S.read(_e, "dy"), 0))), func(): return _S.logical("&&", _S.binary("===", _S.read(_e, "dx"), _S.unary("-", 5)), func(): return _S.binary("===", _S.read(_e, "dy"), _S.unary("-", 1))))):
		return "#"
	return ""

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v7 = _S.arg(_args, 0)
	_S.define(_e, "a", _S.prop(_v7, 0))
	_S.define(_e, "b", _S.prop(_v7, 1))
	return _S.logical("&&", _S.binary("===", _S.read(_e, "a"), _S.read(_e, "dx")), func(): return _S.binary("===", _S.read(_e, "b"), _S.read(_e, "dy")))
