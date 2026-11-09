@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/poisoned.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "colorAt", _S.import_value("fx/status/_lib.js", "colorAt"))
	_S.define(_e, "eyes", _S.import_value("fx/status/_lib.js", "eyes"))
	_S.define(_e, "body", _S.function_value(_e, "_f0"))
	_S.define(_e, "offsets", _S.function_value(_e, "_f9"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f11"))
	_S.define(_e, "draw", _S.function_value(_e, "_f14"))
	_S.define(_e, "meta", _S.merge([{"name": "Poisoned"}, {"desc": "Sick to the bone: green rolls up the body in waves, dark veins creep from a wound, toxic sweat drips and hisses; every 0.8 s it wobbles, blisters pop and a ring pulses out."}, {"tags": ["status", "poison", "toxic", "dot", "debuff", "sick", "loop"]}, {"size": [72, 64]}, {"origin": [36, 54]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0e1d14", "#173320", "#23552e", "#318232", "#55b92f", "#8eea3f", "#cfff63", "#f6ffc2"]}, {"veins": "#2c1a3a"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SICK", _S.merge([{"turn": 0.8}, {"crouch": 4}, {"lean": 4}, {"hy": 1}, {"fx": 2}, {"fy": _S.unary("-", 20)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": 3}, {"fbx": _S.unary("-", 3)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([_S.read(_e, "SICK"), {"x": _S.unary("-", 1)}, {"crouch": 5}, {"lean": 5}])], [0.2, _S.merge([_S.read(_e, "SICK"), {"x": 0}])], [0.5, _S.merge([_S.read(_e, "SICK"), {"x": 1}])], [0.8, _S.merge([_S.read(_e, "SICK"), {"x": 1}, {"crouch": 5}, {"lean": 5}])], [1, _S.merge([_S.read(_e, "SICK"), {"x": 0}])], [1.3, _S.merge([_S.read(_e, "SICK"), {"x": _S.unary("-", 1)}])], [1.6, _S.merge([_S.read(_e, "SICK"), {"x": _S.unary("-", 1)}, {"crouch": 5}, {"lean": 5}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "TICK", 0.8)
	_S.define(_e, "G", 760)
	_S.define(_e, "since", _S.function_value(_e, "_f17"))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f18"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "BODIES", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "m", _S.invoke(_S.read(_e, "BODIES"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.unary("!", _S.read(_e, "m"))):
		_S.invoke(_S.read(_e, "BODIES"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.write(_e, "m", _S.construct(_S.read(_e, "Map"), []), "=", false)])
	if _S.truth(_S.invoke(_S.read(_e, "m"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "m"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 7), 3)]))
	var _v0 = _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), 0.6)]))
	_S.define(_e, "l", _S.prop(_v0, 0))
	_S.define(_e, "r", _S.prop(_v0, 1))
	_S.define(_e, "wx", _S.binary("-", _S.read(_e, "r"), 1))
	_S.define(_e, "wy", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), 0.6)]))
	_S.define(_e, "veins", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f1"))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 4)):
		_S.call_value(_S.read(_v3, "walk"), [_S.read(_v3, "wx"), _S.read(_v3, "wy"), _S.binary("+", _S.prop(_S.read(_v3, "Math"), "PI"), _S.binary("*", _S.binary("-", _S.binary("/", _S.read(_v3, "i"), 4), 0.45), 2.2)), 11, 0])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	_S.define(_e, "lum", _S.function_value(_e, "_f2"))
	_S.define(_e, "skin", _S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "pick", _S.function_value(_e, "_f4"))
	_S.define(_e, "blisters", _S.invoke([0, 1], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "E", _S.call_value(_S.read(_e, "eyes"), [_S.read(_e, "a")]))
	_S.define(_e, "sweat", [])
	for _v7 in _S.array(_S.read(_e, "E")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "e", _v7)
		_S.invoke(_S.read(_v8, "sweat"), "push", [[(_S.binary("-", _S.prop(_S.read(_v8, "e"), "x0"), 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_v8, "e"), "x0"), _S.binary("/", _S.read(_v8, "W"), 2))) else _S.binary("+", _S.prop(_S.read(_v8, "e"), "x1"), 1)), _S.binary("-", _S.prop(_S.read(_v8, "e"), "y0"), 1)]])
	for _v9 in _S.array([_S.unary("-", 1), 1]):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "side", _v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "hand", _S.invoke(_S.prop(_S.read(_v11, "S"), "body"), "filter", [_S.function_value(_v11, "_f8")]))
		if _S.truth(_S.prop(_S.read(_v11, "hand"), "length")):
			_S.invoke(_S.read(_v11, "sweat"), "push", [_S.prop(_S.read(_v11, "hand"), 0)])
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "sweat"), "length"))):
		_S.invoke(_S.read(_e, "sweat"), "push", [_S.call_value(_S.read(_e, "pick"), [(_S.read(_e, "skin") if _S.truth(_S.prop(_S.read(_e, "skin"), "length")) else _S.prop(_S.read(_e, "S"), "body"))])])
	_S.define(_e, "out", _S.merge([{"veins": _S.read(_e, "veins")}, {"wound": [_S.read(_e, "wx"), _S.read(_e, "wy")]}, {"blisters": _S.read(_e, "blisters")}, {"sweat": _S.read(_e, "sweat")}]))
	_S.invoke(_S.read(_e, "m"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ang", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "depth", _S.arg(_args, 4))
	_S.define(_e, "pts", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "s"), _S.read(_v1, "len"))):
		var _v2 = _S.scope(_v1)
		_S.write(_v2, "ang", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.5), 0.5]), "+=", false)
		_S.write(_v2, "x", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "ang")]), "+=", false)
		_S.write(_v2, "y", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "ang")]), "+=", false)
		if _S.truth(_S.unary("!", _S.invoke(_S.read(_v2, "S"), "on", [_S.invoke(_S.read(_v2, "Math"), "round", [_S.read(_v2, "x")]), _S.invoke(_S.read(_v2, "Math"), "round", [_S.read(_v2, "y")])]))):
			break
		_S.invoke(_S.read(_v2, "pts"), "push", [[_S.invoke(_S.read(_v2, "Math"), "round", [_S.read(_v2, "x")]), _S.invoke(_S.read(_v2, "Math"), "round", [_S.read(_v2, "y")]), _S.binary("/", _S.read(_v2, "s"), _S.read(_v2, "len"))]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v2, "depth"), 2), func(): return _S.binary(">", _S.read(_v2, "s"), 2)), func(): return _S.invoke(_S.read(_v2, "R"), "chance", [0.16]))):
			_S.call_value(_S.read(_v2, "walk"), [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.binary("+", _S.read(_v2, "ang"), _S.binary("*", _S.invoke(_S.read(_v2, "R"), "sign", []), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1.1]))), _S.binary("*", _S.read(_v2, "len"), 0.55), _S.binary("+", _S.read(_v2, "depth"), 1)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "s", 1, "+=", true)
	_S.invoke(_S.read(_e, "veins"), "push", [_S.read(_e, "pts")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "luma"), [_S.call_value(_S.read(_e, "colorAt"), [_S.read(_e, "a"), _S.read(_e, "x"), _S.read(_e, "y")])])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v4 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v4, 0))
	_S.define(_e, "y", _S.prop(_v4, 1))
	return _S.logical("&&", _S.logical("&&", _S.binary(">", _S.call_value(_S.read(_e, "lum"), [_S.read(_e, "x"), _S.read(_e, "y")]), 0.55), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y")]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "list", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "list"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "R"), "next", []), _S.prop(_S.read(_e, "list"), "length"))]))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke([0, 1, 2], "map", [_S.function_value(_e, "_f6")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v6 = _S.call_value(_S.read(_e, "pick"), [_S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f7")])])
	_S.define(_e, "x", _S.prop(_v6, 0))
	_S.define(_e, "y", _S.prop(_v6, 1))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"r": _S.invoke(_S.read(_e, "R"), "range", [1.1, 1.8])}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v5 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v5, 0))
	_S.define(_e, "y", _S.prop(_v5, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "y"), 4), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.binary("-", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y")])), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1)]))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v12 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v12, 0))
	_S.define(_e, "y", _S.prop(_v12, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.5)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.7))), func(): return (_S.binary("<=", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "l"), 1)) if _S.truth(_S.binary("<", _S.read(_e, "side"), 0)) else _S.binary(">=", _S.read(_e, "x"), _S.binary("-", _S.read(_e, "r"), 1)))), func(): return _S.unary("!", _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1)])))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "H", _S.arg(_args, 1))
	_S.define(_e, "lean", _S.binary("*", 1.3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU"))])))
	_S.define(_e, "ph", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]))
	_S.define(_e, "wob", _S.binary("<", _S.read(_e, "ph"), 0.12))
	_S.define(_e, "w", (_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "ph"), 0.12), _S.prop(_S.read(_e, "Math"), "PI"))]) if _S.truth(_S.read(_e, "wob")) else 0))
	return _S.function_value(_e, "_f10")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "my", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("*", _S.read(_e, "lean"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "my"), _S.read(_e, "H")))), _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "my"), 0.42), _S.binary("*", _S.read(_e, "ph"), 40))])))])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "ph"), 0.55))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 1)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 5, _S.binary("*", 22, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "k")]))), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1, _S.read(_e, "k")), [_S.prop(_S.read(_e, "P"), 3), _S.prop(_S.read(_e, "P"), 4), _S.prop(_S.read(_e, "P"), 5), _S.prop(_S.read(_e, "P"), 6)], _S.function_value(_e, "_f12")])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 28), _S.unary("-", 3), 28, 6, _S.function_value(_e, "_f13")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "x"), 24), _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.5), 4)]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), 1)):
		_S.last([_S.set_prop(_S.read(_e, "out"), "l", _S.prop(_S.read(_e, "P"), 4), "=", false), _S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("+", 0.14, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "ph")), 0.2)]))), _S.binary("-", 1, _S.read(_e, "d"))), _S.binary("-", 1, _S.read(_e, "d"))), "=", false)])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "P", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "body"), [_S.read(_e, "a"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "off", _S.call_value(_S.read(_e, "offsets"), [_S.read(_e, "t"), _S.read(_e, "H")]))
	_S.define(_e, "ph", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t")]))
	_S.define(_e, "tick", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "TICK"))]), 2))
	_S.define(_e, "vein", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "veins")]))
	for _v13 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
		var _v14 = _S.scope(_e)
		var _v15 = _v13
		_S.define(_v14, "mx", _S.prop(_v15, 0))
		_S.define(_v14, "my", _S.prop(_v15, 1))
		var _v16 = _S.scope(_v14)
		_S.define(_v16, "c", _S.call_value(_S.read(_v16, "colorAt"), [_S.read(_v16, "a"), _S.read(_v16, "mx"), _S.read(_v16, "my")]))
		_S.define(_v16, "l", _S.call_value(_S.read(_v16, "luma"), [_S.read(_v16, "c")]))
		_S.define(_v16, "wave", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v16, "Math"), "sin", [_S.binary("*", _S.read(_v16, "TAU"), _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v16, "my"), _S.read(_v16, "H")), 1.6), _S.binary("*", _S.binary("/", _S.read(_v16, "t"), _S.read(_v16, "D")), 2)))]))))
		_S.define(_v16, "sick", _S.prop(_S.read(_v16, "P"), _S.call_value(_S.read(_v16, "clamp"), [_S.binary("+", 1, _S.invoke(_S.read(_v16, "Math"), "round", [_S.binary("*", _S.read(_v16, "l"), 6.2)])), 1, 7])))
		_S.define(_v16, "k", _S.binary("+", 0.22, _S.binary("*", _S.binary("*", 0.4, _S.read(_v16, "wave")), _S.read(_v16, "wave"))))
		_S.invoke(_S.read(_v16, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v16, "a"), "x"), _S.read(_v16, "mx")), _S.call_value(_S.read(_v16, "off"), [_S.read(_v16, "my")])), _S.binary("+", _S.prop(_S.read(_v16, "a"), "y"), _S.read(_v16, "my")), _S.call_value(_S.read(_v16, "mix"), [_S.read(_v16, "c"), (_S.call_value(_S.read(_v16, "mix"), [_S.read(_v16, "sick"), _S.prop(_S.read(_v16, "P"), 6), 0.3]) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v16, "wave"), 0.85), func(): return _S.binary(">", _S.read(_v16, "l"), 0.4))) else _S.read(_v16, "sick")), _S.read(_v16, "k")])])
	_S.define(_e, "grow", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.binary("*", _S.read(_e, "D"), 0.55), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("*", _S.read(_e, "D"), 0.62), _S.read(_e, "D"), _S.read(_e, "t")]))), 1.15))
	for _v17 in _S.array(_S.prop(_S.read(_e, "B"), "veins")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "pts", _v17)
		for _v19 in _S.array(_S.read(_v18, "pts")):
			var _v20 = _S.scope(_v18)
			var _v21 = _v19
			_S.define(_v20, "x", _S.prop(_v21, 0))
			_S.define(_v20, "y", _S.prop(_v21, 1))
			_S.define(_v20, "u", _S.prop(_v21, 2))
			if _S.truth(_S.binary("<", _S.read(_v20, "u"), _S.read(_v20, "grow"))):
				_S.invoke(_S.read(_v20, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v20, "a"), "x"), _S.read(_v20, "x")), _S.call_value(_S.read(_v20, "off"), [_S.read(_v20, "y")])), _S.binary("+", _S.prop(_S.read(_v20, "a"), "y"), _S.read(_v20, "y")), (_S.prop(_S.read(_v20, "P"), 2) if _S.truth(_S.binary(">", _S.read(_v20, "u"), _S.binary("-", _S.read(_v20, "grow"), 0.12))) else _S.read(_v20, "vein"))])
	var _v22 = _S.prop(_S.read(_e, "B"), "wound")
	_S.define(_e, "wx", _S.prop(_v22, 0))
	_S.define(_e, "wy", _S.prop(_v22, 1))
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "wx")), _S.call_value(_S.read(_e, "off"), [_S.read(_e, "wy")])), _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "wy")), _S.prop(_S.read(_e, "P"), 6)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "wx")), _S.call_value(_S.read(_e, "off"), [_S.read(_e, "wy")])), 1), _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "wy")), _S.prop(_S.read(_e, "P"), 3)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "wx")), _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "wy")), 6, _S.prop(_S.read(_e, "P"), 5), 0.3])
	for _v23 in _S.array(_S.prop(_S.prop(_S.read(_e, "B"), "blisters"), _S.read(_e, "tick"))):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "bl", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "x", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v25, "a"), "x"), _S.prop(_S.read(_v25, "bl"), "x")), _S.call_value(_S.read(_v25, "off"), [_S.prop(_S.read(_v25, "bl"), "y")])))
		_S.define(_v25, "y", _S.binary("+", _S.prop(_S.read(_v25, "a"), "y"), _S.prop(_S.read(_v25, "bl"), "y")))
		_S.define(_v25, "grow2", _S.call_value(_S.read(_v25, "clamp"), [_S.binary("/", _S.read(_v25, "ph"), 0.16)]))
		_S.define(_v25, "pop", _S.binary(">", _S.read(_v25, "ph"), 0.38))
		if _S.truth(_S.unary("!", _S.read(_v25, "pop"))):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "r", _S.binary("*", _S.prop(_S.read(_v26, "bl"), "r"), _S.read(_v26, "grow2")))
			_S.invoke(_S.read(_v26, "p"), "circle", [_S.read(_v26, "x"), _S.read(_v26, "y"), _S.binary("+", _S.read(_v26, "r"), 0.6), _S.prop(_S.read(_v26, "P"), 3)])
			_S.invoke(_S.read(_v26, "p"), "circle", [_S.binary("-", _S.read(_v26, "x"), 0.2), _S.binary("-", _S.read(_v26, "y"), 0.2), _S.read(_v26, "r"), _S.prop(_S.read(_v26, "P"), 5)])
			if _S.truth(_S.binary(">", _S.read(_v26, "r"), 0.8)):
				_S.invoke(_S.read(_v26, "p"), "px", [_S.binary("-", _S.read(_v26, "x"), 0.5), _S.binary("-", _S.read(_v26, "y"), 0.8), _S.read(_v26, "WHITE")])
			_S.invoke(_S.read(_v26, "p"), "glow", [_S.read(_v26, "x"), _S.read(_v26, "y"), 4, _S.prop(_S.read(_v26, "P"), 5), _S.binary("*", 0.3, _S.read(_v26, "grow2"))])
		else:
			if _S.truth(_S.binary("<", _S.read(_v25, "ph"), 0.56)):
				var _v27 = _S.scope(_v25)
				_S.define(_v27, "k", _S.binary("/", _S.binary("-", _S.read(_v27, "ph"), 0.38), 0.18))
				var _v28 = _S.scope(_v27)
				_S.define(_v28, "j", 0)
				while _S.truth(_S.binary("<", _S.read(_v28, "j"), 6)):
					var _v29 = _S.scope(_v28)
					_S.define(_v29, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v29, "j"), 6), _S.read(_v29, "TAU")), _S.prop(_S.read(_v29, "bl"), "x")))
					_S.define(_v29, "d", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v29, "bl"), "r"), 0.5), _S.binary("*", _S.read(_v29, "k"), 3.5)))
					_S.invoke(_S.read(_v29, "p"), "dot", [_S.binary("+", _S.read(_v29, "x"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "an")]), _S.read(_v29, "d"))), _S.binary("-", _S.binary("+", _S.read(_v29, "y"), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "an")]), _S.read(_v29, "d"))), _S.binary("*", _S.read(_v29, "k"), 2)), (_S.prop(_S.read(_v29, "P"), 6) if _S.truth(_S.binary("%", _S.read(_v29, "j"), 2)) else _S.prop(_S.read(_v29, "P"), 5)), _S.binary("-", 1.2, _S.read(_v29, "k"))])
					_v28 = _S.iteration(_v28)
					_S.write(_v28, "j", 1, "+=", true)
				_S.invoke(_S.read(_v27, "p"), "glow", [_S.read(_v27, "x"), _S.read(_v27, "y"), 6, _S.prop(_S.read(_v27, "P"), 6), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v27, "k")))])
	_S.invoke(_S.prop(_S.read(_e, "B"), "sweat"), "forEach", [_S.function_value(_e, "_f15")])
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "ph"), 0.55))
	if _S.truth(_S.binary("<", _S.read(_e, "k"), 1)):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 5, _S.binary("*", 22, _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.read(_e, "k")]))), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 2.5, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1, _S.read(_e, "k")), [_S.prop(_S.read(_e, "P"), 3), _S.prop(_S.read(_e, "P"), 4), _S.prop(_S.read(_e, "P"), 5), _S.prop(_S.read(_e, "P"), 6)], _S.function_value(_e, "_f16")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.binary("*", _S.read(_e, "H"), 0.45)), 26, _S.prop(_S.read(_e, "P"), 4), _S.binary("+", 0.14, _S.binary("*", 0.2, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "ph")), 0.18)])))])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v30 = _S.arg(_args, 0)
	_S.define(_e, "sx", _S.prop(_v30, 0))
	_S.define(_e, "sy", _S.prop(_v30, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "per", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "i"), 0.37)), _S.read(_e, "per")), _S.read(_e, "per")), _S.read(_e, "per")))
	_S.define(_e, "gather", 0.35)
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "sx")), 0.5), _S.call_value(_S.read(_e, "off"), [_S.read(_e, "sy")])))
	_S.define(_e, "y0", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "sy")))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), _S.read(_e, "gather"))):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "k", _S.binary("/", _S.read(_v31, "age"), _S.read(_v31, "gather")))
		_S.define(_v31, "run", _S.invoke(_S.read(_v31, "Math"), "round", [_S.binary("*", _S.read(_v31, "k"), 2)]))
		_S.invoke(_S.read(_v31, "p"), "px", [_S.read(_v31, "x"), _S.binary("+", _S.read(_v31, "y0"), _S.read(_v31, "run")), (_S.prop(_S.read(_v31, "P"), 6) if _S.truth(_S.binary(">", _S.read(_v31, "k"), 0.5)) else _S.prop(_S.read(_v31, "P"), 5))])
		if _S.truth(_S.binary(">", _S.read(_v31, "k"), 0.5)):
			_S.invoke(_S.read(_v31, "p"), "px", [_S.read(_v31, "x"), _S.binary("-", _S.binary("+", _S.read(_v31, "y0"), _S.read(_v31, "run")), 1), _S.prop(_S.read(_v31, "P"), 4)])
		return null
	_S.define(_e, "f", _S.binary("-", _S.read(_e, "age"), _S.read(_e, "gather")))
	_S.define(_e, "fallH", _S.binary("-", _S.unary("-", 1), _S.binary("+", _S.read(_e, "y0"), 2)))
	_S.define(_e, "tf", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("/", _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.read(_e, "fallH")])), _S.read(_e, "G"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "f"), _S.read(_e, "tf"))):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "y", _S.binary("+", _S.binary("+", _S.read(_v32, "y0"), 2), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v32, "G")), _S.read(_v32, "f")), _S.read(_v32, "f"))))
		_S.invoke(_S.read(_v32, "p"), "line", [_S.read(_v32, "x"), _S.binary("-", _S.read(_v32, "y"), _S.invoke(_S.read(_v32, "Math"), "min", [3, _S.binary("*", _S.binary("*", _S.read(_v32, "G"), _S.read(_v32, "f")), 0.012)])), _S.read(_v32, "x"), _S.read(_v32, "y"), _S.prop(_S.read(_v32, "P"), 4)])
		_S.invoke(_S.read(_v32, "p"), "px", [_S.read(_v32, "x"), _S.read(_v32, "y"), _S.prop(_S.read(_v32, "P"), 6)])
		return null
	_S.define(_e, "h", _S.binary("-", _S.read(_e, "f"), _S.read(_e, "tf")))
	if _S.truth(_S.binary(">", _S.read(_e, "h"), 0.4)):
		return null
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "h"), 0.4))
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), 1), _S.binary("*", _S.read(_e, "k"), 2)), _S.unary("-", 1), _S.binary("+", _S.binary("+", _S.read(_e, "x"), 1), _S.binary("*", _S.read(_e, "k"), 2)), _S.unary("-", 1), _S.prop(_S.read(_e, "P"), (6 if _S.truth(_S.binary("<", _S.read(_e, "k"), 0.4)) else 4)), _S.binary("-", 1.2, _S.read(_e, "k"))])
	var _v33 = _S.scope(_e)
	_S.define(_v33, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "j"), 3)):
		_S.invoke(_S.read(_v33, "p"), "dot", [_S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.binary("-", _S.read(_v33, "j"), 1), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v33, "k"))))), _S.binary("-", _S.binary("-", _S.unary("-", 2), _S.binary("%", _S.read(_v33, "j"), 2)), _S.binary("*", _S.binary("*", 5, _S.read(_v33, "k")), _S.binary("-", 1, _S.read(_v33, "k")))), _S.prop(_S.read(_v33, "P"), 6), _S.binary("-", 1, _S.read(_v33, "k"))])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "disc", [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "k"), 6)]), 1.5)), _S.binary("-", _S.unary("-", 3), _S.binary("*", _S.read(_e, "k"), 6)), _S.binary("+", 1, _S.binary("*", 1.5, _S.read(_e, "k"))), _S.prop(_S.read(_e, "P"), 5), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_e, "k")))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.unary("-", 1.5), 5, _S.prop(_S.read(_e, "P"), 5), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_e, "k")))])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "TICK")), _S.read(_e, "TICK")), _S.read(_e, "TICK"))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0
