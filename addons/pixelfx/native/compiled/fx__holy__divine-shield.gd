@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/holy/divine-shield.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "GOLD", _S.import_value("fx/holy/_lib.js", "GOLD"))
	_S.define(_e, "oval", _S.import_value("fx/holy/_lib.js", "oval"))
	_S.define(_e, "shapeOf", _S.import_value("fx/holy/_lib.js", "shapeOf"))
	_S.define(_e, "onSphere", _S.function_value(_e, "_f0"))
	_S.define(_e, "lattice", _S.function_value(_e, "_f1"))
	_S.define(_e, "film", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Divine shield"}, {"desc": "A bubble of gold light round the character: a bright rim and a thin gold film, meridians turning like a slow globe, a sheen sweeping across and sparkles winking on it."}, {"tags": ["holy", "shield", "bubble", "barrier", "buff", "character", "loop"]}, {"size": [88, 84]}, {"origin": [44, 68]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "GOLD")}, {"radius": 29}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BRACE", _S.merge([{"turn": 0.7}, {"crouch": 3}, {"lean": 1}, {"fx": 5}, {"fy": _S.unary("-", 33)}, {"bx": 10}, {"by": _S.unary("-", 20)}, {"ffx": 4}, {"fbx": _S.unary("-", 2)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "BRACE")], [0.6, _S.merge([_S.read(_e, "BRACE"), {"crouch": 4}])], [1.2, _S.merge([_S.read(_e, "BRACE"), {"fy": _S.unary("-", 35)}, {"crouch": 3}])], [1.8, _S.merge([_S.read(_e, "BRACE"), {"crouch": 4}])], [2.4, _S.read(_e, "BRACE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CY", _S.unary("-", 22))
	_S.define(_e, "TILT", 0.34)
	_S.define(_e, "N", 4)
	_S.define(_e, "FLOOR_SY", 0.26)
	_S.define(_e, "sheen", _S.function_value(_e, "_f14"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "lat", _S.arg(_args, 1))
	_S.define(_e, "lon", _S.arg(_args, 2))
	_S.define(_e, "X", _S.binary("*", _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lat")])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "lon")])))
	_S.define(_e, "Y", _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "lat")])))
	_S.define(_e, "Z", _S.binary("*", _S.binary("*", _S.read(_e, "r"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lat")])), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lon")])))
	return [_S.read(_e, "X"), _S.binary("-", _S.read(_e, "CY"), _S.binary("-", _S.binary("*", _S.read(_e, "Y"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")])), _S.binary("*", _S.read(_e, "Z"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")])))), _S.binary("+", _S.binary("*", _S.read(_e, "Y"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "TILT")])), _S.binary("*", _S.read(_e, "Z"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "TILT")])))]

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "r", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "phi", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "N"))))
	_S.define(_e, "sw", _S.call_value(_S.read(_e, "sheen"), [_S.read(_e, "t"), _S.read(_e, "T")]))
	_S.define(_e, "seen", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "dot", _S.function_value(_e, "_f2"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "k"), _S.binary("*", 2, _S.read(_v0, "N")))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "lon", _S.binary("+", _S.read(_v1, "phi"), _S.binary("/", _S.binary("*", _S.read(_v1, "k"), _S.prop(_S.read(_v1, "Math"), "PI")), _S.read(_v1, "N"))))
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "lat", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v2, "Math"), "PI")), 2))
		while _S.truth(_S.binary("<=", _S.read(_v2, "lat"), _S.binary("/", _S.prop(_S.read(_v2, "Math"), "PI"), 2))):
			_S.call_value(_S.read(_v2, "dot"), _S.concat([_S.array(_S.call_value(_S.read(_v2, "onSphere"), [_S.read(_v2, "r"), _S.read(_v2, "lat"), _S.read(_v2, "lon")]))]))
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "lat", _S.binary("/", 0.7, _S.read(_v2, "r")), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "k", 1, "+=", true)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "lon", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "lon"), _S.read(_v3, "TAU"))):
		_S.call_value(_S.read(_v3, "dot"), _S.concat([_S.array(_S.call_value(_S.read(_v3, "onSphere"), [_S.read(_v3, "r"), 0, _S.read(_v3, "lon")]))]))
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "lon", _S.binary("/", 0.7, _S.read(_v3, "r")), "+=", false)
	for _v4 in _S.array(_S.invoke(_S.read(_e, "seen"), "values", [])):
		var _v5 = _S.scope(_e)
		var _v6 = _v4
		_S.define(_v5, "x", _S.prop(_v6, 0))
		_S.define(_v5, "y", _S.prop(_v6, 1))
		_S.define(_v5, "f", _S.prop(_v6, 2))
		_S.define(_v5, "hot", _S.prop(_v6, 3))
		var _v7 = _S.scope(_v5)
		if _S.truth(_S.read(_v7, "back")):
			_S.invoke(_S.read(_v7, "p"), "blend", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.prop(_S.read(_v7, "C"), 4), 0.32])
		else:
			if _S.truth(_S.read(_v7, "hot")):
				_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.read(_v7, "WHITE")])
			else:
				if _S.truth(_S.binary("<", _S.read(_v7, "f"), 0.4)):
					_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), _S.prop(_S.read(_v7, "C"), 6)])
				else:
					_S.invoke(_S.read(_v7, "p"), "blend", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "f"), 0.7)) else _S.prop(_S.read(_v7, "C"), 5)), (0.8 if _S.truth(_S.binary("<", _S.read(_v7, "f"), 0.7)) else 0.55)])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "z", _S.arg(_args, 2))
	if _S.truth(_S.binary("!==", _S.binary("<", _S.read(_e, "z"), 0), _S.read(_e, "back"))):
		return null
	_S.define(_e, "key", _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]), 1000), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")])))
	_S.define(_e, "f", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "z")]), _S.read(_e, "r")))
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "CY"))), _S.binary("*", _S.read(_e, "r"), 1.414)))
	_S.define(_e, "hot", (1 if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "q"), _S.read(_e, "sw"))]), 0.12)) else 0))
	_S.define(_e, "v", _S.invoke(_S.read(_e, "seen"), "get", [_S.read(_e, "key")]))
	if _S.truth(_S.logical("||", _S.unary("!", _S.read(_e, "v")), func(): return _S.binary("<", _S.read(_e, "f"), _S.prop(_S.read(_e, "v"), 2)))):
		_S.invoke(_S.read(_e, "seen"), "set", [_S.read(_e, "key"), [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "f"), _S.logical("||", _S.read(_e, "hot"), func(): return (_S.prop(_S.read(_e, "v"), 3) if _S.truth(_S.read(_e, "v")) else 0))]])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "back", _S.arg(_args, 3))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "r", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "sw", _S.call_value(_S.read(_e, "sheen"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")]))
	_S.invoke(_S.read(_e, "p"), "each", [_S.binary("-", _S.unary("-", _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "CY"), _S.read(_e, "r")), 1), _S.binary("+", _S.read(_e, "r"), 1), _S.binary("+", _S.binary("+", _S.read(_e, "CY"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "sx", _S.arg(_args, 2))
	_S.define(_e, "sy", _S.arg(_args, 3))
	_S.define(_e, "d", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "CY"))]), _S.read(_e, "r")))
	if _S.truth(_S.binary(">=", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "q", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "CY"))), _S.binary("*", _S.read(_e, "r"), 1.414)))
	_S.define(_e, "hot", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "q"), _S.read(_e, "sw"))]), 0.22))]))
	_S.define(_e, "a", _S.binary("+", _S.binary("+", (0.07 if _S.truth(_S.read(_e, "back")) else 0.03), _S.binary("*", 0.26, _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "d"), 6]))), _S.binary("*", _S.binary("*", 0.2, _S.read(_e, "hot")), (0.3 if _S.truth(_S.read(_e, "back")) else 1))))
	_S.invoke(_S.read(_e, "p"), "blendPx", [_S.read(_e, "sx"), _S.read(_e, "sy"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "hot"), 0.5), func(): return _S.unary("!", _S.read(_e, "back")))) else _S.prop(_S.read(_e, "C"), 5)), _S.read(_e, "a")])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "r", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "rf", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "r")), _S.binary("*", _S.read(_e, "CY"), _S.read(_e, "CY")))]))
	_S.call_value(_S.read(_e, "film"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), true])
	_S.call_value(_S.read(_e, "lattice"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), true])
	_S.call_value(_S.read(_e, "oval"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "rf"), _S.binary("*", _S.read(_e, "rf"), _S.read(_e, "FLOOR_SY")), _S.prop(_S.read(_e, "C"), 5), 0.8, _S.function_value(_e, "_f6")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "r"), 1.1), _S.prop(_S.read(_e, "C"), 4), 0.14])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "r", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "rf", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_e, "r"), _S.read(_e, "r")), _S.binary("*", _S.read(_e, "CY"), _S.read(_e, "CY")))]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	if _S.truth(_S.read(_e, "A")):
		for _v8 in _S.array(_S.prop(_S.call_value(_S.read(_e, "shapeOf"), [_S.read(_e, "A")]), "out")):
			var _v9 = _S.scope(_e)
			var _v10 = _v8
			_S.define(_v9, "x", _S.prop(_v10, 0))
			_S.define(_v9, "y", _S.prop(_v10, 1))
			_S.invoke(_S.read(_v9, "p"), "light", [_S.read(_v9, "x"), _S.read(_v9, "y"), _S.prop(_S.read(_v9, "C"), 5), 0.3])
	_S.call_value(_S.read(_e, "film"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), false])
	_S.call_value(_S.read(_e, "lattice"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), false])
	_S.define(_e, "sw", _S.call_value(_S.read(_e, "sheen"), [_S.read(_e, "t"), _S.read(_e, "T")]))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "j", 0)
	_S.define(_v11, "n", _S.invoke(_S.read(_v11, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.read(_v11, "r"), _S.read(_v11, "TAU")), 1.4)]))
	while _S.truth(_S.binary("<", _S.read(_v11, "j"), _S.read(_v11, "n"))):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "g", _S.binary("*", _S.binary("/", _S.read(_v12, "j"), _S.read(_v12, "n")), _S.read(_v12, "TAU")))
		_S.define(_v12, "x", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "g")]), _S.read(_v12, "r")))
		_S.define(_v12, "y", _S.binary("+", _S.read(_v12, "CY"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "g")]), _S.read(_v12, "r"))))
		_S.define(_v12, "q", _S.binary("/", _S.binary("-", _S.read(_v12, "x"), _S.binary("-", _S.read(_v12, "y"), _S.read(_v12, "CY"))), _S.binary("*", _S.read(_v12, "r"), 1.414)))
		_S.define(_v12, "lit", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.binary("+", _S.read(_v12, "g"), 2.36)]))
		_S.define(_v12, "hot", _S.binary("<", _S.invoke(_S.read(_v12, "Math"), "abs", [_S.binary("-", _S.read(_v12, "q"), _S.read(_v12, "sw"))]), 0.15))
		_S.invoke(_S.read(_v12, "p"), "dot", [_S.read(_v12, "x"), _S.read(_v12, "y"), (_S.read(_v12, "WHITE") if _S.truth(_S.logical("||", _S.read(_v12, "hot"), func(): return _S.binary(">", _S.read(_v12, "lit"), 0.75))) else (_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v12, "lit"), _S.unary("-", 0.2))) else _S.prop(_S.read(_v12, "C"), 5))), 1])
		_S.invoke(_S.read(_v12, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "g")]), _S.binary("-", _S.read(_v12, "r"), 1)), _S.binary("+", _S.read(_v12, "CY"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "g")]), _S.binary("-", _S.read(_v12, "r"), 1))), _S.prop(_S.read(_v12, "C"), 4), _S.binary("+", 0.35, _S.binary("*", 0.3, _S.read(_v12, "lit")))])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glowRing", [0, _S.read(_e, "CY"), _S.read(_e, "r"), 6, _S.prop(_S.read(_e, "C"), 4), 0.32])
	_S.define(_e, "phi", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "N"))))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "k"), _S.binary("*", 2, _S.read(_v13, "N")))):
		var _v14 = _S.scope(_v13)
		var _v15 = _S.call_value(_S.read(_v14, "onSphere"), [_S.read(_v14, "r"), 0, _S.binary("+", _S.read(_v14, "phi"), _S.binary("/", _S.binary("*", _S.read(_v14, "k"), _S.prop(_S.read(_v14, "Math"), "PI")), _S.read(_v14, "N")))])
		_S.define(_v14, "x", _S.prop(_v15, 0))
		_S.define(_v14, "y", _S.prop(_v15, 1))
		_S.define(_v14, "z", _S.prop(_v15, 2))
		if _S.truth(_S.binary("<", _S.read(_v14, "z"), _S.binary("*", _S.read(_v14, "r"), 0.15))):
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "k", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.read(_v14, "WHITE")])
		if _S.truth(_S.binary(">", _S.read(_v14, "z"), _S.binary("*", _S.read(_v14, "r"), 0.45))):
			for _v16 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v17 = _S.scope(_v14)
				var _v18 = _v16
				_S.define(_v17, "dx", _S.prop(_v18, 0))
				_S.define(_v17, "dy", _S.prop(_v18, 1))
				_S.invoke(_S.read(_v17, "p"), "blend", [_S.binary("+", _S.read(_v17, "x"), _S.read(_v17, "dx")), _S.binary("+", _S.read(_v17, "y"), _S.read(_v17, "dy")), _S.prop(_S.read(_v17, "C"), 6), 0.7])
		_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "y"), 4, _S.prop(_S.read(_v14, "C"), 5), 0.3])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "k", 1, "+=", true)
	var _v19 = _S.call_value(_S.read(_e, "onSphere"), [_S.read(_e, "r"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), 0])
	_S.define(_e, "px0", _S.prop(_v19, 0))
	_S.define(_e, "py0", _S.prop(_v19, 1))
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "px0"), _S.read(_e, "py0"), _S.binary("+", 2, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 1.5, _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.read(_e, "TAU")), 2)])))])), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), 0.45])
	for _v20 in _S.array([0, _S.prop(_S.read(_e, "Math"), "PI")]):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "off", _v20)
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "g", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v22, "t"), _S.read(_v22, "T")), _S.read(_v22, "TAU")), _S.read(_v22, "off")), 0.8))
		_S.call_value(_S.read(_v22, "sparkle"), [_S.read(_v22, "p"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "g")]), _S.read(_v22, "r")), _S.binary("+", _S.read(_v22, "CY"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "g")]), _S.read(_v22, "r"))), 2, _S.read(_v22, "WHITE"), _S.prop(_S.read(_v22, "C"), 6), 0.4])
	var _v23 = _S.scope(_e)
	_S.define(_v23, "g", 3.55)
	while _S.truth(_S.binary("<", _S.read(_v23, "g"), 4.2)):
		_S.invoke(_S.read(_v23, "p"), "px", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "g")]), _S.read(_v23, "r")), 0.74), _S.binary("+", _S.read(_v23, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "g")]), _S.read(_v23, "r")), 0.74)), (_S.read(_v23, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v23, "g"), 3.7), func(): return _S.binary("<", _S.read(_v23, "g"), 4.05))) else _S.prop(_S.read(_v23, "C"), 6))])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "g", 0.04, "+=", false)
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [3.4]), _S.read(_e, "r")), 0.62), _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [3.4]), _S.read(_e, "r")), 0.62)), _S.read(_e, "WHITE")])
	var _v24 = _S.scope(_e)
	_S.define(_v24, "g", 0.45)
	while _S.truth(_S.binary("<", _S.read(_v24, "g"), 0.8)):
		_S.invoke(_S.read(_v24, "p"), "dot", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "g")]), _S.read(_v24, "r")), 0.8), _S.binary("+", _S.read(_v24, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "g")]), _S.read(_v24, "r")), 0.8)), _S.prop(_S.read(_v24, "C"), 5), 0.6])
		_v24 = _S.iteration(_v24)
		_S.write(_v24, "g", 0.05, "+=", false)
	_S.call_value(_S.read(_e, "oval"), [_S.read(_e, "p"), 0, 0, _S.read(_e, "rf"), _S.binary("*", _S.read(_e, "rf"), _S.read(_e, "FLOOR_SY")), _S.function_value(_e, "_f8"), 1, _S.function_value(_e, "_f9")])
	var _v25 = _S.scope(_e)
	_S.define(_v25, "i", _S.unary("-", 2))
	while _S.truth(_S.binary("<=", _S.read(_v25, "i"), 2)):
		_S.invoke(_S.read(_v25, "p"), "glow", [_S.binary("*", _S.binary("*", _S.read(_v25, "i"), _S.read(_v25, "rf")), 0.5), 0, 12, _S.prop(_S.read(_v25, "C"), 4), 0.18])
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "i", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 9, _S.prop(_S.read(_e, "o"), "seed"), _S.function_value(_e, "_f10"), _S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "T"), 12, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 1), _S.function_value(_e, "_f12"), _S.function_value(_e, "_f13")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0.6)) else _S.prop(_S.read(_e, "C"), 6))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.35, 0.6])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	var _v26 = _S.call_value(_S.read(_e, "onSphere"), [_S.read(_e, "r"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1.2), 1.3]), _S.binary("+", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]), _S.read(_e, "phi"))])
	_S.define(_e, "x", _S.prop(_v26, 0))
	_S.define(_e, "y", _S.prop(_v26, 1))
	_S.define(_e, "z", _S.prop(_v26, 2))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")), _S.prop(_S.read(_e, "Math"), "PI"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "z"), 0)):
		return null
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 1, _S.binary("*", _S.binary("*", 2.5, _S.read(_e, "k")), _S.invoke(_S.read(_e, "R"), "range", [0.6, 1]))), _S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.45, _S.read(_e, "k"))])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [1.2, 2.2])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.7), 0.7]), _S.read(_e, "r")))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), 6), _S.invoke(_S.read(_e, "R"), "range", [0, 6]))]), 2)))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.read(_e, "CY"), _S.binary("*", _S.read(_e, "r"), 0.75)), _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "r")), 1.4)))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "CY"))]), _S.binary("-", _S.read(_e, "r"), 2))):
		return null
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.5)) else _S.prop(_S.read(_e, "C"), 5)), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI"))])])
	_S.invoke(_S.read(_e, "p"), "light", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "u"), _S.prop(_S.read(_e, "Math"), "PI"))]))])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "T", _S.arg(_args, 1))
	return _S.binary("+", _S.unary("-", 1.7), _S.binary("*", 3.4, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("%", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), 1), 0.55)])))
