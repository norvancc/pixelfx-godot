@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/blessing.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "landings", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Blessing"}, {"desc": "A soft cone of light rests on the character from above; sparkles drift down through it, twinkling, and wink out where they land on the head and shoulders."}, {"tags": ["holy", "blessing", "buff", "light", "sparkle", "character", "loop"]}, {"size": [80, 128]}, {"origin": [40, 108]}, {"duration": 3}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OPEN", _S.merge([{"turn": 1.15}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 31)}, {"bx": 14}, {"by": _S.unary("-", 31)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "OPEN")], [0.75, _S.merge([_S.read(_e, "OPEN"), {"fy": _S.unary("-", 33)}, {"by": _S.unary("-", 33)}])], [1.5, _S.merge([_S.read(_e, "OPEN"), {"crouch": _S.unary("-", 1)}, {"fy": _S.unary("-", 35)}, {"by": _S.unary("-", 35)}])], [2.25, _S.merge([_S.read(_e, "OPEN"), {"fy": _S.unary("-", 33)}, {"by": _S.unary("-", 33)}])], [3, _S.read(_e, "OPEN")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "TOP", _S.unary("-", 108))
	_S.define(_e, "T", 3)
	_S.define(_e, "halfW", _S.function_value(_e, "_f8"))
	_S.define(_e, "RAYS", [[_S.unary("-", 0.62), 0.16, 1, 0.3], [_S.unary("-", 0.2), 0.2, 2, 1.7], [0.22, 0.14, 1, 4.1], [0.6, 0.18, 2, 2.6]])
	_S.define(_e, "ray", _S.function_value(_e, "_f9"))
	_S.define(_e, "LANDS", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "S", _S.arg(_args, 1))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.prop(_S.read(_e, "S"), "x")) + ":" + _S.string(_S.prop(_S.read(_e, "S"), "y")) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "LANDS"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "LANDS"), "get", [_S.read(_e, "key")])
	_S.define(_e, "out", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 20)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "R", _S.call_value(_S.read(_v1, "rng"), [_S.prop(_S.read(_v1, "o"), "seed"), _S.read(_v1, "i")]))
		_S.define(_v1, "q", _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.9), 0.9]))
		_S.define(_v1, "v", _S.invoke(_S.read(_v1, "R"), "range", [22, 34]))
		_S.define(_v1, "sway", _S.invoke(_S.read(_v1, "R"), "range", [1, 3]))
		_S.define(_v1, "ph", _S.invoke(_S.read(_v1, "R"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "size", _S.invoke(_S.read(_v1, "R"), "range", [0.8, 2.4]))
		_S.define(_v1, "land", INF)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "a"), 6)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "y", _S.binary("+", _S.binary("+", _S.read(_v3, "TOP"), 6), _S.binary("*", _S.read(_v3, "v"), _S.read(_v3, "a"))))
			_S.define(_v3, "x", _S.binary("+", _S.binary("*", _S.read(_v3, "q"), _S.call_value(_S.read(_v3, "halfW"), [_S.read(_v3, "y")])), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v3, "a"), 2.2), _S.read(_v3, "ph"))]), _S.read(_v3, "sway"))))
			if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v3, "y"), _S.unary("-", 1)), func(): return _S.invoke(_S.read(_v3, "S"), "at", [_S.read(_v3, "x"), _S.read(_v3, "y")]))):
				var _v4 = _S.scope(_v3)
				_S.write(_v4, "land", _S.read(_v4, "a"), "=", false)
				break
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "a", 0.02, "+=", false)
		_S.invoke(_S.read(_v1, "out"), "push", [_S.merge([{"q": _S.read(_v1, "q")}, {"v": _S.read(_v1, "v")}, {"sway": _S.read(_v1, "sway")}, {"ph": _S.read(_v1, "ph")}, {"size": _S.read(_v1, "size")}, {"land": _S.read(_v1, "land")}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "LANDS"), "set", [_S.read(_e, "key"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.invoke(_S.read(_e, "p"), "each", [_S.unary("-", 24), _S.read(_e, "TOP"), 24, 0.5, _S.function_value(_e, "_f2")])
	for _v5 in _S.array([_S.prop(_S.read(_e, "RAYS"), 1), _S.prop(_S.read(_e, "RAYS"), 2)]):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "o2", _S.prop(_v7, 0))
		_S.define(_v6, "k", _S.prop(_v7, 2))
		_S.define(_v6, "ph", _S.prop(_v7, 3))
		var _v8 = _S.scope(_v6)
		_S.define(_v8, "y", _S.read(_v8, "TOP"))
		while _S.truth(_S.binary("<", _S.read(_v8, "y"), _S.unary("-", 1))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "pulse", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v9, "y"), 0.11), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v9, "t"), _S.read(_v9, "T")), _S.read(_v9, "TAU")), 3)), _S.read(_v9, "ph"))]))))
			_S.invoke(_S.read(_v9, "p"), "dot", [_S.binary("*", _S.read(_v9, "o2"), _S.call_value(_S.read(_v9, "halfW"), [_S.read(_v9, "y")])), _S.read(_v9, "y"), (_S.read(_v9, "WHITE") if _S.truth(_S.binary(">", _S.read(_v9, "pulse"), 0.85)) else _S.prop(_S.read(_v9, "C"), 6)), _S.binary("*", _S.binary("*", _S.binary("+", 0.1, _S.binary("*", 0.45, _S.read(_v9, "pulse"))), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v9, "t"), _S.read(_v9, "T")), _S.read(_v9, "TAU")), _S.read(_v9, "k")), _S.read(_v9, "ph"))])))), _S.call_value(_S.read(_v9, "smooth"), [_S.read(_v9, "TOP"), _S.binary("+", _S.read(_v9, "TOP"), 20), _S.read(_v9, "y")]))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 4), 30, _S.prop(_S.read(_e, "C"), 4), 0.22])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "I", _S.binary("*", _S.call_value(_S.read(_e, "ray"), [_S.binary("/", _S.read(_e, "x"), _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "y")])), _S.read(_e, "t")]), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "TOP"), 0, _S.read(_e, "y")])))))
	if _S.truth(_S.binary("<", _S.read(_e, "I"), 0.02)):
		return null
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", _S.read(_e, "I"), 0.13)])
	_S.invoke(_S.read(_e, "p"), "add", [_S.read(_e, "sx"), _S.read(_e, "sy"), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "I"), 0.22)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", (_S.call_value(_S.read(_e, "shapeOf"), [_S.read(_e, "A")]) if _S.truth(_S.read(_e, "A")) else null))
	if _S.truth(_S.read(_e, "A")):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "m", _S.prop(_S.read(_v10, "A"), "mask"))
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), _S.prop(_S.read(_v11, "m"), "w"))):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "j"), _S.prop(_S.read(_v12, "m"), "h"))):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "c", _S.prop(_S.prop(_S.read(_v13, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v13, "j"), _S.prop(_S.read(_v13, "m"), "w")), _S.read(_v13, "i"))))
				if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v13, "c")), func(): return _S.binary("<", _S.call_value(_S.read(_v13, "luma"), [_S.read(_v13, "c")]), 0.15))):
					_v12 = _S.iteration(_v12)
					_S.write(_v12, "j", 1, "+=", true)
					continue
				_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v13, "A"), "x"), _S.read(_v13, "i")), _S.binary("+", _S.prop(_S.read(_v13, "A"), "y"), _S.read(_v13, "j")), _S.call_value(_S.read(_v13, "mix"), [_S.read(_v13, "c"), _S.prop(_S.read(_v13, "C"), 6), 0.35])])
				break
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "j", 1, "+=", true)
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		_S.invoke(_S.read(_v10, "p"), "glow", [0, _S.unary("-", 30), 20, _S.prop(_S.read(_v10, "C"), 5), 0.22])
	var _v14 = _S.scope(_e)
	_S.define(_v14, "y", 0)
	while _S.truth(_S.binary("<=", _S.read(_v14, "y"), 3)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "x", _S.unary("-", 24))
		while _S.truth(_S.binary("<=", _S.read(_v15, "x"), 24)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "u", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.binary("/", _S.read(_v16, "x"), 24), _S.binary("/", _S.read(_v16, "y"), 4)]))
			if _S.truth(_S.binary(">=", _S.read(_v16, "u"), 1)):
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "x"), _S.read(_v16, "y"), ((_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.read(_v16, "y")) else _S.read(_v16, "WHITE")) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.3)) else (_S.prop(_S.read(_v16, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.6)) else (_S.prop(_S.read(_v16, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v16, "u"), 0.85)) else _S.prop(_S.read(_v16, "C"), 3)))), (_S.invoke(_S.read(_v16, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v16, "u"))]) if _S.truth(_S.binary("===", _S.read(_v16, "y"), 0)) else _S.binary("*", _S.binary("-", 1, _S.read(_v16, "u")), 0.7))])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "x", 1, "+=", true)
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "y", 1, "+=", true)
	if _S.truth(_S.read(_e, "S")):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "L", _S.call_value(_S.read(_v17, "landings"), [_S.read(_v17, "o"), _S.read(_v17, "S")]))
		_S.call_value(_S.read(_v17, "cycle"), [_S.read(_v17, "t"), _S.read(_v17, "T"), _S.prop(_S.read(_v17, "L"), "length"), _S.prop(_S.read(_v17, "o"), "seed"), _S.function_value(_v17, "_f4"), _S.function_value(_v17, "_f5")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 16, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 9), _S.function_value(_e, "_f6"), _S.function_value(_e, "_f7")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return 3

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "i", _S.arg(_args, 3))
	_S.define(_e, "s", _S.prop(_S.read(_e, "L"), _S.read(_e, "i")))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.read(_e, "TOP"), 6), _S.binary("*", _S.prop(_S.read(_e, "s"), "v"), _S.read(_e, "age"))))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "s"), "q"), _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "y")])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.2), _S.prop(_S.read(_e, "s"), "ph"))]), _S.prop(_S.read(_e, "s"), "sway"))))
	_S.define(_e, "fade", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "age"), 0.3)]))
	if _S.truth(_S.binary(">", _S.read(_e, "age"), _S.prop(_S.read(_e, "s"), "land"))):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "w", _S.binary("/", _S.binary("-", _S.read(_v18, "age"), _S.prop(_S.read(_v18, "s"), "land")), 0.14))
		if _S.truth(_S.binary("<", _S.read(_v18, "w"), 1)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "ly", _S.binary("+", _S.binary("+", _S.read(_v19, "TOP"), 6), _S.binary("*", _S.prop(_S.read(_v19, "s"), "v"), _S.prop(_S.read(_v19, "s"), "land"))))
			_S.define(_v19, "lx", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v19, "s"), "q"), _S.call_value(_S.read(_v19, "halfW"), [_S.read(_v19, "ly")])), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.prop(_S.read(_v19, "s"), "land"), 2.2), _S.prop(_S.read(_v19, "s"), "ph"))]), _S.prop(_S.read(_v19, "s"), "sway"))))
			_S.call_value(_S.read(_v19, "sparkle"), [_S.read(_v19, "p"), _S.read(_v19, "lx"), _S.read(_v19, "ly"), _S.binary("+", _S.binary("*", 3, _S.binary("-", 1, _S.read(_v19, "w"))), 1), _S.read(_v19, "WHITE"), _S.prop(_S.read(_v19, "C"), 6), _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v19, "w")))])
		return null
	_S.define(_e, "tw", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), _S.binary("+", 7, _S.binary("%", _S.read(_e, "i"), 4))), _S.prop(_S.read(_e, "s"), "ph"))]))))
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "s"), "size"), 1.2)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "s"), "size"), _S.read(_e, "tw")), _S.read(_e, "fade")), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "tw"), 0.85)) else _S.prop(_S.read(_e, "C"), 6)), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.35, _S.read(_e, "fade"))])
	else:
		var _v20 = _S.scope(_e)
		_S.invoke(_S.read(_v20, "p"), "dot", [_S.read(_v20, "x"), _S.read(_v20, "y"), (_S.read(_v20, "WHITE") if _S.truth(_S.binary(">", _S.read(_v20, "tw"), 0.8)) else _S.prop(_S.read(_v20, "C"), 6)), _S.read(_v20, "fade")])
		_S.invoke(_S.read(_v20, "p"), "glow", [_S.read(_v20, "x"), _S.read(_v20, "y"), 3, _S.prop(_S.read(_v20, "C"), 5), _S.binary("*", 0.35, _S.read(_v20, "fade"))])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.2, 2.4])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "TOP"), 10), _S.invoke(_S.read(_e, "R"), "range", [0, 90])), _S.binary("*", _S.read(_e, "u"), _S.invoke(_S.read(_e, "R"), "range", [6, 14]))))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]))
	_S.define(_e, "x", _S.binary("+", _S.binary("*", _S.read(_e, "q"), _S.call_value(_S.read(_e, "halfW"), [_S.read(_e, "y")])), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 1.7), _S.binary("*", _S.read(_e, "q"), 5))]), 1.5)))
	_S.define(_e, "k", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI"))]), _S.call_value(_S.read(_e, "ray"), [_S.read(_e, "q"), _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.12)):
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.45)) else _S.prop(_S.read(_e, "C"), 6)), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "k"), 2.2)])])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [5, 20, _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "TOP")), _S.unary("-", _S.read(_e, "TOP")))])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "I", _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_e, "q"), _S.read(_e, "q")))])))
	for _v21 in _S.array(_S.read(_e, "RAYS")):
		var _v22 = _S.scope(_e)
		var _v23 = _v21
		_S.define(_v22, "o", _S.prop(_v23, 0))
		_S.define(_v22, "w", _S.prop(_v23, 1))
		_S.define(_v22, "k", _S.prop(_v23, 2))
		_S.define(_v22, "ph", _S.prop(_v23, 3))
		_S.write(_v22, "I", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v22, "q"), _S.read(_v22, "o")), _S.read(_v22, "w")), 2))]), _S.binary("+", 0.55, _S.binary("*", 0.45, _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v22, "t"), _S.read(_v22, "T")), _S.read(_v22, "TAU")), _S.read(_v22, "k")), _S.read(_v22, "ph"))])))), 0.6), "+=", false)
	return _S.binary("*", _S.read(_e, "I"), _S.call_value(_S.read(_e, "smooth"), [1.25, 0.75, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "q")])]))
