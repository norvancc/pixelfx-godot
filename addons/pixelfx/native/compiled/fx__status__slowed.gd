@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/slowed.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "hand", _S.function_value(_e, "_f0"))
	_S.define(_e, "dial", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Slowed"}, {"desc": "Dragged through time: a glassy clock dial behind the head ticks round in heavy steps, flashing with each, while drops sink in slow motion and spread slow rings."}, {"tags": ["status", "slow", "time", "clock", "debuff", "loop"]}, {"size": [64, 76]}, {"origin": [32, 68]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#081a24", "#0e3446", "#165a6e", "#2a8a9a", "#52bcc4", "#9ee6e0", "#e2fff8", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "S1", _S.merge([{"turn": 0.3}, {"lean": 3}, {"crouch": 3}, {"ffx": 11}, {"ffy": _S.unary("-", 5)}, {"fbx": _S.unary("-", 9)}, {"fby": _S.unary("-", 5)}, {"toeB": true}, {"fx": _S.unary("-", 5)}, {"fy": _S.unary("-", 19)}, {"bx": 11}, {"by": _S.unary("-", 26)}]))
	_S.define(_e, "S2", _S.merge([{"turn": 0.3}, {"lean": 3}, {"crouch": 3}, {"ffx": _S.unary("-", 9)}, {"ffy": _S.unary("-", 5)}, {"toeF": true}, {"fbx": 11}, {"fby": _S.unary("-", 5)}, {"fx": 13}, {"fy": _S.unary("-", 26)}, {"bx": _S.unary("-", 4)}, {"by": _S.unary("-", 19)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "S1")], [1.2, _S.read(_e, "S2")], [2.4, _S.read(_e, "S1")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TICKS", 4)
	_S.define(_e, "STEP", _S.binary("/", _S.read(_e, "D"), _S.read(_e, "TICKS")))
	_S.define(_e, "R", 18)
	_S.define(_e, "afterglow", _S.function_value(_e, "_f9"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "STEP"))]))
	_S.define(_e, "ph", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "k"), _S.read(_e, "STEP"))), _S.read(_e, "STEP")))
	_S.define(_e, "base", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "TAU")), _S.read(_e, "TICKS"))))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "TAU"), _S.read(_e, "TICKS")))
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.62)):
		return _S.merge([{"ang": _S.read(_e, "base")}, {"flash": 0}, {"ph": _S.read(_e, "ph")}])
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.72)):
		return _S.merge([{"ang": _S.binary("-", _S.read(_e, "base"), _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.62), 0.1), _S.prop(_S.read(_e, "Math"), "PI")), 0.5)])))}, {"flash": 0}, {"ph": _S.read(_e, "ph")}])
	_S.define(_e, "s", _S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.72), 0.28))
	_S.define(_e, "snap", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "s"), 0.35)]), 2.2]))
	_S.define(_e, "wob", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "s")), 6)]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "s"), 22)])), 0.05))
	return _S.merge([{"ang": _S.binary("+", _S.binary("+", _S.binary("-", _S.read(_e, "base"), _S.binary("*", 0.1, _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "s"), 0.2)])))), _S.binary("*", _S.read(_e, "q"), _S.read(_e, "snap"))), _S.read(_e, "wob"))}, {"flash": _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "s")), 5)])}, {"ph": _S.read(_e, "ph")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "cx", _S.arg(_args, 2))
	_S.define(_e, "cy", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "hand"), [_S.read(_e, "t")]))
	_S.define(_e, "fl", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "h"), "flash"), _S.call_value(_S.read(_e, "afterglow"), [_S.read(_e, "t")])]))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("-", _S.read(_e, "R"), 1), _S.prop(_S.read(_e, "C"), 2), 0.2])
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "R"), 0.25)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "R"), 0.3)), _S.binary("*", _S.read(_e, "R"), 0.5), _S.prop(_S.read(_e, "C"), 4), 0.08])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "R"), 1), 1, _S.prop(_S.read(_e, "C"), 0)])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "R"), 2, _S.function_value(_e, "_f2")])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("-", _S.read(_e, "R"), 3.5), 1, _S.prop(_S.read(_e, "C"), 3), 0.6])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 60)):
		var _v1 = _S.scope(_v0)
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v1, "i"), 5), 0)):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "i", 1, "+=", true)
			continue
		_S.define(_v1, "a", _S.binary("*", _S.binary("/", _S.read(_v1, "i"), 60), _S.read(_v1, "TAU")))
		_S.invoke(_S.read(_v1, "p"), "dot", [_S.binary("+", _S.read(_v1, "cx"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.binary("-", _S.read(_v1, "R"), 2.6))), _S.binary("+", _S.read(_v1, "cy"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.binary("-", _S.read(_v1, "R"), 2.6))), _S.prop(_S.read(_v1, "C"), 4), 0.8])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 12)):
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "a", _S.binary("*", _S.binary("/", _S.read(_v3, "i"), 12), _S.read(_v3, "TAU")))
		_S.define(_v3, "big", _S.binary("===", _S.binary("%", _S.read(_v3, "i"), 3), 0))
		_S.define(_v3, "r0", _S.binary("-", _S.read(_v3, "R"), 2.5))
		_S.define(_v3, "r1", _S.binary("-", _S.read(_v3, "R"), (6 if _S.truth(_S.read(_v3, "big")) else 4.5)))
		_S.define(_v3, "c", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]))
		_S.define(_v3, "s", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]))
		_S.invoke(_S.read(_v3, "p"), "line", [_S.binary("+", _S.read(_v3, "cx"), _S.binary("*", _S.read(_v3, "c"), _S.read(_v3, "r0"))), _S.binary("+", _S.read(_v3, "cy"), _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "r0"))), _S.binary("+", _S.read(_v3, "cx"), _S.binary("*", _S.read(_v3, "c"), _S.read(_v3, "r1"))), _S.binary("+", _S.read(_v3, "cy"), _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "r1"))), (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.read(_v3, "big")) else _S.prop(_S.read(_v3, "C"), 5))])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	_S.define(_e, "shud", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "h"), "flash"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 60)])), 0.06))
	_S.define(_e, "ha", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), 2.2), _S.read(_e, "shud")))
	_S.invoke(_S.read(_e, "p"), "beam", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ha")]), _S.read(_e, "R")), 0.5)), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ha")]), _S.read(_e, "R")), 0.5)), 2.2, _S.prop(_S.read(_e, "C"), 5)])
	_S.define(_e, "tx", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "h"), "ang")]), _S.binary("-", _S.read(_e, "R"), 4))))
	_S.define(_e, "ty", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "h"), "ang")]), _S.binary("-", _S.read(_e, "R"), 4))))
	_S.invoke(_S.read(_e, "p"), "beam", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "tx"), _S.read(_e, "ty"), 2.4, _S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "cx"), _S.read(_e, "cy"), 2, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.prop(_S.read(_e, "C"), 1)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "R"), 8), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.14, _S.binary("*", 0.2, _S.read(_e, "fl")))])
	_S.invoke(_S.read(_e, "p"), "glowRing", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "R"), 3, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", 0.12, _S.binary("*", 0.35, _S.read(_e, "fl")))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "tx"), _S.read(_e, "ty"), 5, _S.prop(_S.read(_e, "C"), 6), _S.binary("+", 0.3, _S.binary("*", 0.3, _S.prop(_S.read(_e, "h"), "flash")))])
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "h"), "flash"), 0.02)):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "s", _S.binary("-", 1, _S.prop(_S.read(_v4, "h"), "flash")))
		_S.invoke(_S.read(_v4, "p"), "ring", [_S.read(_v4, "cx"), _S.read(_v4, "cy"), _S.binary("+", _S.binary("+", _S.read(_v4, "R"), 2), _S.binary("*", 10, _S.read(_v4, "s"))), 1, _S.prop(_S.read(_v4, "C"), 5), _S.prop(_S.read(_v4, "h"), "flash")])
		_S.invoke(_S.read(_v4, "p"), "glowRing", [_S.read(_v4, "cx"), _S.read(_v4, "cy"), _S.binary("+", _S.binary("+", _S.read(_v4, "R"), 2), _S.binary("*", 10, _S.read(_v4, "s"))), 3, _S.prop(_S.read(_v4, "C"), 4), _S.binary("*", 0.3, _S.prop(_S.read(_v4, "h"), "flash"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "ang", _S.arg(_args, 1))
	return ((_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "fl"), 0.4)) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.read(_e, "ang"), 0.8)]), _S.unary("-", 0.3))) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.5)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.8)) else _S.prop(_S.read(_e, "C"), 6))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.call_value(_S.read(_e, "dial"), [_S.read(_e, "p"), _S.read(_e, "C"), 0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), 3), _S.read(_e, "t")])
	_S.define(_e, "lag", _S.call_value(_S.read(_e, "afterglow"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "lag"), 0.05)):
		_S.invoke(_S.read(_e, "p"), "outline", [_S.prop(_S.read(_e, "a"), "mask"), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "a"), "x"), 1), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 2, _S.read(_e, "lag"))])), _S.prop(_S.read(_e, "a"), "y"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.55, _S.read(_e, "lag"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "fl", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.call_value(_S.read(_e, "hand"), [_S.read(_e, "t")]), "flash"), _S.call_value(_S.read(_e, "afterglow"), [_S.read(_e, "t")])]))
	for _v5 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "mx", _S.prop(_v7, 0))
		_S.define(_v6, "my", _S.prop(_v7, 1))
		_S.invoke(_S.read(_v6, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v6, "a"), "x"), _S.read(_v6, "mx")), _S.binary("+", _S.prop(_S.read(_v6, "a"), "y"), _S.read(_v6, "my")), _S.prop(_S.read(_v6, "C"), 5), _S.binary("+", 0.08, _S.binary("*", 0.12, _S.read(_v6, "fl")))])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 6, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.2])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "r"), "next", []), 0.5)) else 1))
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [10, 17])))
	_S.define(_e, "y0", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.invoke(_S.read(_e, "r"), "range", [6, 22])))
	_S.define(_e, "v0", _S.invoke(_S.read(_e, "r"), "range", [18, 30]))
	_S.define(_e, "k", 1.1)
	_S.define(_e, "yAt", _S.function_value(_e, "_f8"))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "yAt"), [_S.read(_e, "age")]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 1))):
		var _v8 = _S.scope(_e)
		for _v9 in _S.array([[0.22, 0.35], [0.11, 0.6]]):
			var _v10 = _S.scope(_v8)
			var _v11 = _v9
			_S.define(_v10, "lag", _S.prop(_v11, 0))
			_S.define(_v10, "al", _S.prop(_v11, 1))
			if _S.truth(_S.binary(">", _S.read(_v10, "age"), _S.read(_v10, "lag"))):
				_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), _S.call_value(_S.read(_v10, "yAt"), [_S.binary("-", _S.read(_v10, "age"), _S.read(_v10, "lag"))]), _S.prop(_S.read(_v10, "C"), 4), _S.read(_v10, "al")])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "x"), _S.binary("-", _S.read(_v8, "y"), 1), _S.prop(_S.read(_v8, "C"), 5)])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 6)])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "x"), _S.binary("+", _S.read(_v8, "y"), 1), _S.prop(_S.read(_v8, "C"), 5)])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("-", _S.read(_v8, "x"), 1), _S.binary("+", _S.read(_v8, "y"), 1), _S.prop(_S.read(_v8, "C"), 4)])
		_S.invoke(_S.read(_v8, "p"), "px", [_S.binary("-", _S.read(_v8, "x"), 1), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 7)])
		_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "x"), _S.read(_v8, "y"), 4, _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v8, "u")))])
	else:
		var _v12 = _S.scope(_e)
		_S.define(_v12, "g", _S.read(_v12, "age"))
		while _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v12, "g"), 0), func(): return _S.binary(">=", _S.call_value(_S.read(_v12, "yAt"), [_S.read(_v12, "g")]), _S.unary("-", 1)))):
			_S.write(_v12, "g", 0.02, "-=", false)
		_S.define(_v12, "s", _S.call_value(_S.read(_v12, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v12, "age"), _S.read(_v12, "g")), 0.9)]))
		if _S.truth(_S.binary("<", _S.read(_v12, "s"), 1)):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "rx", _S.binary("+", 1, _S.binary("*", 7, _S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.read(_v13, "s")]))))
			_S.define(_v13, "c", (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v13, "s"), 0.3)) else _S.prop(_S.read(_v13, "C"), 5)))
			for _v14 in _S.array([_S.unary("-", 1), 1]):
				var _v15 = _S.scope(_v13)
				_S.define(_v15, "sd", _v14)
				_S.invoke(_S.read(_v15, "p"), "line", [_S.binary("+", _S.read(_v15, "x"), _S.binary("*", _S.read(_v15, "sd"), _S.read(_v15, "rx"))), _S.unary("-", 0.5), _S.binary("+", _S.read(_v15, "x"), _S.binary("*", _S.read(_v15, "sd"), _S.binary("-", _S.read(_v15, "rx"), 1.5))), _S.unary("-", 0.5), _S.read(_v15, "c"), _S.binary("*", _S.binary("-", 1, _S.read(_v15, "s")), 1.2)])
			var _v16 = _S.scope(_v13)
			_S.define(_v16, "dx", _S.binary("+", _S.unary("-", _S.read(_v16, "rx")), 2))
			while _S.truth(_S.binary("<=", _S.read(_v16, "dx"), _S.binary("-", _S.read(_v16, "rx"), 2))):
				_S.invoke(_S.read(_v16, "p"), "dot", [_S.binary("+", _S.read(_v16, "x"), _S.read(_v16, "dx")), _S.unary("-", 1.5), _S.prop(_S.read(_v16, "C"), 4), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v16, "s")), 0.5), _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "dx")]), _S.read(_v16, "rx"))))])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "dx", 1, "+=", false)
			_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "x"), _S.unary("-", 1), _S.binary("+", 4, _S.read(_v13, "rx")), _S.prop(_S.read(_v13, "C"), 4), _S.binary("*", 0.12, _S.binary("-", 1, _S.read(_v13, "s")))])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.read(_e, "y0"), _S.binary("/", _S.binary("*", _S.read(_e, "v0"), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "k")), _S.read(_e, "g"))]))), _S.read(_e, "k"))), _S.binary("*", 4, _S.read(_e, "g")))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "s", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "STEP"), 0.72)), _S.read(_e, "STEP")), _S.read(_e, "STEP")), _S.read(_e, "STEP")))
	return _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_e, "s")), 4)])
