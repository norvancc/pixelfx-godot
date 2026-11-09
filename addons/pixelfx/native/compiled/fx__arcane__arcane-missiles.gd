@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/arcane-missiles.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "HX", 15)
	_S.define(_e, "HY", _S.unary("-", 24))
	_S.define(_e, "TX", 152)
	_S.define(_e, "TY", _S.unary("-", 22))
	_S.define(_e, "N", 5)
	_S.define(_e, "TRAIL", 18)
	_S.define(_e, "meta", _S.merge([{"name": "Arcane missiles"}, {"desc": "A volley of violet bolts fans out of the hand, curls round on twisting ribbons and pops on the target one after another."}, {"tags": ["arcane", "missile", "projectile", "homing", "volley", "magic", "directional", "one-shot"]}, {"size": [240, 116]}, {"origin": [26, 88]}, {"duration": 1.75}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "OPEN", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": 4}, {"fx": 18}, {"fy": _S.unary("-", 24)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 22)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "KICK", _S.merge([_S.read(_e, "OPEN"), {"fx": 15}, {"fy": _S.unary("-", 26)}, {"lean": 2}]))
	_S.define(_e, "GATHER", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}, {"crouch": 4}, {"lean": _S.unary("-", 2)}, {"fx": 6}, {"fy": _S.unary("-", 24)}, {"bx": 8}, {"by": _S.unary("-", 24)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 152}])}, {"poses": [[_S.unary("-", 0.52), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.24), _S.read(_e, "GATHER")], [0, _S.merge([_S.read(_e, "GATHER"), {"crouch": 5}])], [0.05, _S.read(_e, "KICK"), "snap"], [0.1, _S.read(_e, "OPEN"), "snap"], [0.15, _S.read(_e, "KICK"), "snap"], [0.2, _S.read(_e, "OPEN"), "snap"], [0.25, _S.read(_e, "KICK"), "snap"], [0.29, _S.read(_e, "OPEN"), "snap"], [0.33, _S.read(_e, "KICK"), "snap"], [0.38, _S.read(_e, "OPEN"), "snap"], [0.43, _S.read(_e, "KICK"), "snap"], [0.48, _S.read(_e, "OPEN"), "snap"], [1.2, _S.merge([_S.read(_e, "OPEN"), {"crouch": 3}])], [1.7, _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 3)}])]]}, {"hits": [_S.merge([{"t": 0.77}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 0.85}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 0.95}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 1.08}, {"stop": 0.02}, {"push": 0.7}, {"straw": 4}, {"y": _S.unary("-", 24)}, {"flash": 0.03}]), _S.merge([{"t": 1.2}, {"stop": 0.07}, {"shake": 0.14}, {"amp": 1}, {"push": 1.4}, {"straw": 9}, {"y": _S.unary("-", 24)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "ribbon", _S.function_value(_e, "_f1"))
	_S.define(_e, "head", _S.function_value(_e, "_f2"))
	_S.define(_e, "pop", _S.function_value(_e, "_f3"))
	_S.define(_e, "lock", _S.function_value(_e, "_f4"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f5")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "fan", [_S.unary("-", 1.05), 0.7, _S.unary("-", 0.5), 1.1, _S.unary("-", 1.4)])
	_S.define(_e, "bolts", _S.invoke(_S.read(_e, "fan"), "map", [_S.function_value(_e, "_f6")]))
	_S.define(_e, "pops", [])
	_S.define(_e, "t", 0)
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "pts", _S.prop(_S.read(_e, "b"), "trail"))
	_S.define(_e, "n", _S.prop(_S.read(_e, "pts"), "length"))
	_S.define(_e, "fade", (1 if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "b"), "hit"), 0)) else _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "b"), "hit")), 0.16)]))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "n"), 2), func(): return _S.binary("<=", _S.read(_e, "fade"), 0))):
		return null
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), _S.binary("-", _S.read(_v0, "n"), 1))):
		var _v1 = _S.scope(_v0)
		var _v2 = _S.prop(_S.read(_v1, "pts"), _S.read(_v1, "i"))
		_S.define(_v1, "x0", _S.prop(_v2, 0))
		_S.define(_v1, "y0", _S.prop(_v2, 1))
		var _v3 = _S.prop(_S.read(_v1, "pts"), _S.binary("+", _S.read(_v1, "i"), 1))
		_S.define(_v1, "x1", _S.prop(_v3, 0))
		_S.define(_v1, "y1", _S.prop(_v3, 1))
		_S.define(_v1, "L", _S.logical("||", _S.invoke(_S.read(_v1, "Math"), "hypot", [_S.binary("-", _S.read(_v1, "x1"), _S.read(_v1, "x0")), _S.binary("-", _S.read(_v1, "y1"), _S.read(_v1, "y0"))]), func(): return 1))
		_S.define(_v1, "nx", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_v1, "y1"), _S.read(_v1, "y0"))), _S.read(_v1, "L")))
		_S.define(_v1, "ny", _S.binary("/", _S.binary("-", _S.read(_v1, "x1"), _S.read(_v1, "x0")), _S.read(_v1, "L")))
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "d", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "d"), _S.read(_v4, "L"))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "u", _S.binary("/", _S.binary("+", _S.read(_v5, "i"), _S.binary("/", _S.read(_v5, "d"), _S.read(_v5, "L"))), _S.binary("-", _S.read(_v5, "n"), 1)))
			_S.define(_v5, "x", _S.binary("+", _S.read(_v5, "x0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v5, "x1"), _S.read(_v5, "x0")), _S.read(_v5, "d")), _S.read(_v5, "L"))))
			_S.define(_v5, "y", _S.binary("+", _S.read(_v5, "y0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v5, "y1"), _S.read(_v5, "y0")), _S.read(_v5, "d")), _S.read(_v5, "L"))))
			_S.define(_v5, "a", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v5, "u")), 1.7), _S.read(_v5, "fade")))
			_S.define(_v5, "w", _S.binary("+", _S.binary("*", 2.6, _S.invoke(_S.read(_v5, "Math"), "pow", [_S.binary("-", 1, _S.read(_v5, "u")), 0.8])), 0.3))
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "q", _S.unary("-", _S.read(_v6, "w")))
			while _S.truth(_S.binary("<=", _S.read(_v6, "q"), _S.read(_v6, "w"))):
				var _v7 = _S.scope(_v6)
				_S.define(_v7, "v", _S.binary("/", _S.invoke(_S.read(_v7, "Math"), "abs", [_S.read(_v7, "q")]), _S.read(_v7, "w")))
				_S.invoke(_S.read(_v7, "p"), "dot", [_S.binary("+", _S.read(_v7, "x"), _S.binary("*", _S.read(_v7, "nx"), _S.read(_v7, "q"))), _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "ny"), _S.read(_v7, "q"))), ((_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.25)) else _S.prop(_S.read(_v7, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_v7, "v"), 0.35)) else ((_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.4)) else _S.prop(_S.read(_v7, "C"), 5)) if _S.truth(_S.binary("<", _S.read(_v7, "v"), 0.7)) else (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v7, "u"), 0.5)) else _S.prop(_S.read(_v7, "C"), 4)))), _S.binary("*", _S.read(_v7, "a"), (1 if _S.truth(_S.binary("<", _S.read(_v7, "v"), 0.7)) else 0.75))])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "q", 0.5, "+=", false)
			for _v8 in _S.array([0, _S.prop(_S.read(_v5, "Math"), "PI")]):
				var _v9 = _S.scope(_v5)
				_S.define(_v9, "s", _v8)
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "ph", _S.binary("+", _S.binary("+", _S.binary("-", _S.binary("*", _S.read(_v10, "u"), 10), _S.binary("*", _S.read(_v10, "t"), 26)), _S.prop(_S.read(_v10, "b"), "tw")), _S.read(_v10, "s")))
				_S.define(_v10, "off", _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "ph")]), _S.binary("+", _S.read(_v10, "w"), 1.4)))
				if _S.truth(_S.binary(">", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "ph")]), _S.unary("-", 0.2))):
					_S.invoke(_S.read(_v10, "p"), "dot", [_S.binary("+", _S.read(_v10, "x"), _S.binary("*", _S.read(_v10, "nx"), _S.read(_v10, "off"))), _S.binary("+", _S.read(_v10, "y"), _S.binary("*", _S.read(_v10, "ny"), _S.read(_v10, "off"))), ((_S.read(_v10, "WHITE") if _S.truth(_S.binary("<", _S.read(_v10, "u"), 0.35)) else _S.prop(_S.read(_v10, "C"), 6)) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "ph")]), 0.4)) else _S.prop(_S.read(_v10, "C"), 4)), _S.read(_v10, "a")])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "d", 0.5, "+=", false)
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v1, "i"), 3), 0)):
			_S.invoke(_S.read(_v1, "p"), "glow", [_S.read(_v1, "x0"), _S.read(_v1, "y0"), _S.binary("+", _S.binary("*", 9, _S.binary("-", 1, _S.binary("/", _S.read(_v1, "i"), _S.read(_v1, "n")))), 3), _S.prop(_S.read(_v1, "C"), 5), _S.binary("*", _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.read(_v1, "i"), _S.read(_v1, "n")))), _S.read(_v1, "fade"))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "x", _S.prop(_S.read(_e, "b"), "x"))
	_S.define(_e, "y", _S.prop(_S.read(_e, "b"), "y"))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 4)):
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v12, "t"), 24), _S.binary("/", _S.binary("*", _S.read(_v12, "i"), _S.read(_v12, "TAU")), 4)), _S.prop(_S.read(_v12, "b"), "tw")))
		_S.define(_v12, "l", _S.binary("+", 5.5, _S.binary("*", 1.5, _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v12, "t"), 50), _S.read(_v12, "i"))]))))
		_S.invoke(_S.read(_v12, "p"), "line", [_S.binary("+", _S.read(_v12, "x"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), 3.2)), _S.binary("+", _S.read(_v12, "y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), 3.2)), _S.binary("+", _S.read(_v12, "x"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "l"))), _S.binary("+", _S.read(_v12, "y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "l"))), _S.prop(_S.read(_v12, "C"), 6)])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), 3.8, _S.prop(_S.read(_e, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), 2.1, _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "x"), _S.read(_e, "y"), 1.2, _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 24, _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 7, _S.read(_e, "WHITE"), 0.4])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.16)):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "r", _S.binary("+", _S.binary("*", 9, _S.binary("-", 1, _S.binary("/", _S.read(_v13, "q"), 0.16))), 1.5))
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.binary("+", _S.read(_v13, "r"), 1.5), _S.prop(_S.read(_v13, "C"), 5)])
		_S.invoke(_S.read(_v13, "p"), "circle", [_S.read(_v13, "x"), _S.read(_v13, "y"), _S.read(_v13, "r"), _S.read(_v13, "WHITE")])
	if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.4)):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "l", _S.binary("+", _S.binary("*", 15, _S.binary("-", 1, _S.binary("/", _S.read(_v14, "q"), 0.4))), 3))
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "d", _S.unary("-", _S.read(_v15, "l")))
		while _S.truth(_S.binary("<=", _S.read(_v15, "d"), _S.read(_v15, "l"))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.binary("/", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.read(_v16, "d")]), _S.read(_v16, "l")))
			_S.define(_v16, "c", (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "a"), 0.3)) else (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v16, "a"), 0.65)) else _S.prop(_S.read(_v16, "C"), 5))))
			_S.invoke(_S.read(_v16, "p"), "dot", [_S.binary("+", _S.read(_v16, "x"), _S.read(_v16, "d")), _S.read(_v16, "y"), _S.read(_v16, "c"), _S.binary("-", 1.15, _S.read(_v16, "a"))])
			_S.invoke(_S.read(_v16, "p"), "dot", [_S.read(_v16, "x"), _S.binary("+", _S.read(_v16, "y"), _S.binary("*", _S.read(_v16, "d"), 0.7)), _S.read(_v16, "c"), _S.binary("-", 1.15, _S.read(_v16, "a"))])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "d", 1, "+=", true)
	_S.define(_e, "rr", _S.binary("+", 3, _S.binary("*", 18, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "q")]))))
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "rr"), 0.5), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "q")))]), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "q"), 0.3)) else _S.prop(_S.read(_e, "C"), 6)), _S.binary("-", 1.2, _S.read(_e, "q"))])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, 0.22, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [1.15, 1.45, _S.read(_e, "t")]))))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0)):
		return null
	_S.define(_e, "kick", 0)
	for _v17 in _S.array(_S.read(_e, "pops")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "q", _v17)
		_S.write(_v18, "kick", _S.invoke(_S.read(_v18, "Math"), "max", [_S.read(_v18, "kick"), _S.invoke(_S.read(_v18, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v18, "t"), _S.prop(_S.read(_v18, "q"), "t")), 0.06), 2))])]), "=", false)
	_S.define(_e, "r", _S.binary("+", _S.binary("+", 9, _S.binary("*", 10, _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "smooth"), [0, 0.22, _S.read(_e, "t")])])))), _S.binary("*", 3, _S.read(_e, "kick"))))
	_S.define(_e, "spin", _S.binary("*", _S.read(_e, "t"), 1.5))
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v19, "i"), 4)):
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "a0", _S.binary("-", _S.binary("+", _S.read(_v20, "spin"), _S.binary("/", _S.binary("*", _S.read(_v20, "i"), _S.read(_v20, "TAU")), 4)), 0.38))
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "a", _S.read(_v21, "a0"))
		while _S.truth(_S.binary("<=", _S.read(_v21, "a"), _S.binary("+", _S.read(_v21, "a0"), 0.76))):
			_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("+", _S.read(_v21, "TX"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "r"))), _S.binary("+", _S.read(_v21, "TY"), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "r"))), (_S.read(_v21, "WHITE") if _S.truth(_S.binary(">", _S.read(_v21, "kick"), 0.4)) else _S.prop(_S.read(_v21, "C"), 5)), _S.read(_v21, "k")])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "a", 0.06, "+=", false)
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "TX"), _S.read(_e, "TY"), 12, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.2, _S.read(_e, "k"))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.write(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.12), 0.12]), "+=", false)
	_S.define(_e, "sp", _S.invoke(_S.read(_e, "R"), "range", [130, 165]))
	return _S.merge([{"t0": _S.binary("+", 0.05, _S.binary("*", _S.read(_e, "i"), 0.1))}, {"x": _S.read(_e, "HX")}, {"y": _S.read(_e, "HY")}, {"vx": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "sp"))}, {"trail": []}, {"hit": _S.unary("-", 1)}, {"on": false}, {"tx": _S.binary("+", _S.read(_e, "TX"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]))}, {"ty": _S.binary("+", _S.read(_e, "TY"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]))}, {"tw": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"acc": 0}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v22 in _S.array(_S.read(_e, "bolts")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _v22)
		var _v24 = _S.scope(_v23)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v24, "t"), _S.prop(_S.read(_v24, "b"), "t0")), func(): return _S.binary(">=", _S.prop(_S.read(_v24, "b"), "hit"), 0))):
			continue
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v24, "b"), "on"))):
			var _v25 = _S.scope(_v24)
			_S.set_prop(_S.read(_v25, "b"), "on", true, "=", false)
			_S.invoke(_S.read(_v25, "lights"), "add", [_S.read(_v25, "HX"), _S.read(_v25, "HY"), 28, _S.prop(_S.read(_v25, "C"), 5), 0.7, 0.14])
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v26, "i"), 4)):
				_S.invoke(_S.read(_v26, "ps"), "spawn", [_S.prop(_S.read(_v26, "P"), "MOTE"), _S.read(_v26, "HX"), _S.read(_v26, "HY"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.binary("+", _S.invoke(_S.read(_v26, "Math"), "atan2", [_S.prop(_S.read(_v26, "b"), "vy"), _S.prop(_S.read(_v26, "b"), "vx")]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.6), 0.6]))]), _S.invoke(_S.read(_v26, "R"), "range", [60, 140])), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.invoke(_S.read(_v26, "Math"), "atan2", [_S.prop(_S.read(_v26, "b"), "vy"), _S.prop(_S.read(_v26, "b"), "vx")]), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.6), 0.6]))]), _S.invoke(_S.read(_v26, "R"), "range", [60, 140])), _S.invoke(_S.read(_v26, "R"), "range", [0.12, 0.25]), _S.prop(_S.read(_v26, "C"), 6), 0.6])
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
		_S.define(_v24, "age", _S.binary("-", _S.read(_v24, "t"), _S.prop(_S.read(_v24, "b"), "t0")))
		_S.define(_v24, "dx", _S.binary("-", _S.prop(_S.read(_v24, "b"), "tx"), _S.prop(_S.read(_v24, "b"), "x")))
		_S.define(_v24, "dy", _S.binary("-", _S.prop(_S.read(_v24, "b"), "ty"), _S.prop(_S.read(_v24, "b"), "y")))
		_S.define(_v24, "d", _S.logical("||", _S.invoke(_S.read(_v24, "Math"), "hypot", [_S.read(_v24, "dx"), _S.read(_v24, "dy")]), func(): return 1))
		_S.define(_v24, "sp", _S.binary("+", 150, _S.binary("*", _S.binary("*", 560, _S.read(_v24, "age")), _S.read(_v24, "age"))))
		_S.define(_v24, "steer", _S.invoke(_S.read(_v24, "Math"), "min", [1, _S.binary("*", _S.binary("+", 1.4, _S.binary("*", 15, _S.read(_v24, "age"))), _S.read(_v24, "dt"))]))
		_S.set_prop(_S.read(_v24, "b"), "vx", _S.binary("*", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v24, "dx"), _S.read(_v24, "d")), _S.read(_v24, "sp")), _S.prop(_S.read(_v24, "b"), "vx")), _S.read(_v24, "steer")), "+=", false)
		_S.set_prop(_S.read(_v24, "b"), "vy", _S.binary("*", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_v24, "dy"), _S.read(_v24, "d")), _S.read(_v24, "sp")), _S.prop(_S.read(_v24, "b"), "vy")), _S.read(_v24, "steer")), "+=", false)
		_S.set_prop(_S.read(_v24, "b"), "x", _S.binary("*", _S.prop(_S.read(_v24, "b"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "b"), "y", _S.binary("*", _S.prop(_S.read(_v24, "b"), "vy"), _S.read(_v24, "dt")), "+=", false)
		_S.invoke(_S.prop(_S.read(_v24, "b"), "trail"), "unshift", [[_S.prop(_S.read(_v24, "b"), "x"), _S.prop(_S.read(_v24, "b"), "y")]])
		if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v24, "b"), "trail"), "length"), _S.read(_v24, "TRAIL"))):
			_S.invoke(_S.prop(_S.read(_v24, "b"), "trail"), "pop", [])
		if _S.truth(_S.binary(">", _S.set_prop(_S.read(_v24, "b"), "acc", _S.read(_v24, "dt"), "+=", false), 0.012)):
			var _v27 = _S.scope(_v24)
			_S.set_prop(_S.read(_v27, "b"), "acc", 0, "=", false)
			if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.6])):
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "MOTE"), _S.prop(_S.read(_v27, "b"), "x"), _S.prop(_S.read(_v27, "b"), "y"), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v27, "b"), "vx")), 0.08), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 25), 25])), _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v27, "b"), "vy")), 0.08), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 25), 25])), _S.invoke(_S.read(_v27, "R"), "range", [0.2, 0.4]), (_S.prop(_S.read(_v27, "C"), 6) if _S.truth(_S.invoke(_S.read(_v27, "R"), "chance", [0.5])) else _S.prop(_S.read(_v27, "C"), 5)), 0.55])
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v24, "d"), 3), func(): return _S.binary(">", _S.read(_v24, "age"), 1.3))):
			var _v28 = _S.scope(_v24)
			_S.set_prop(_S.read(_v28, "b"), "hit", _S.read(_v28, "t"), "=", false)
			_S.invoke(_S.read(_v28, "pops"), "push", [_S.merge([{"t": _S.read(_v28, "t")}, {"x": _S.prop(_S.read(_v28, "b"), "x")}, {"y": _S.prop(_S.read(_v28, "b"), "y")}])])
			_S.invoke(_S.read(_v28, "lights"), "add", [_S.prop(_S.read(_v28, "b"), "x"), _S.prop(_S.read(_v28, "b"), "y"), 70, _S.prop(_S.read(_v28, "C"), 5), 0.9, 0.3])
			_S.invoke(_S.read(_v28, "lights"), "add", [_S.prop(_S.read(_v28, "b"), "x"), _S.prop(_S.read(_v28, "b"), "y"), 24, _S.read(_v28, "WHITE"), 0.85, 0.09])
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v29, "i"), 16)):
				var _v30 = _S.scope(_v29)
				_S.define(_v30, "a", _S.invoke(_S.read(_v30, "R"), "range", [0, _S.read(_v30, "TAU")]))
				_S.define(_v30, "v", _S.invoke(_S.read(_v30, "R"), "range", [80, 230]))
				_S.invoke(_S.read(_v30, "ps"), "spawn", [_S.prop(_S.read(_v30, "P"), "SPARK"), _S.prop(_S.read(_v30, "b"), "x"), _S.prop(_S.read(_v30, "b"), "y"), _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "cos", [_S.read(_v30, "a")]), _S.read(_v30, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v30, "Math"), "sin", [_S.read(_v30, "a")]), _S.read(_v30, "v")), 40), _S.invoke(_S.read(_v30, "R"), "range", [0.15, 0.45])])
				_v29 = _S.iteration(_v29)
				_S.write(_v29, "i", 1, "+=", true)
			var _v31 = _S.scope(_v28)
			_S.define(_v31, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v31, "i"), 7)):
				var _v32 = _S.scope(_v31)
				_S.define(_v32, "a", _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v32, "Math"), "PI")), 0.3]))
				_S.define(_v32, "v", _S.invoke(_S.read(_v32, "R"), "range", [40, 140]))
				_S.invoke(_S.read(_v32, "ps"), "spawn", [(_S.prop(_S.read(_v32, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v32, "i"), 2)) else _S.prop(_S.read(_v32, "P"), "MOTE")), _S.prop(_S.read(_v32, "b"), "x"), _S.prop(_S.read(_v32, "b"), "y"), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "cos", [_S.read(_v32, "a")]), _S.read(_v32, "v")), _S.binary("*", _S.invoke(_S.read(_v32, "Math"), "sin", [_S.read(_v32, "a")]), _S.read(_v32, "v")), _S.invoke(_S.read(_v32, "R"), "range", [0.25, 0.48]), _S.invoke(_S.read(_v32, "R"), "pick", [[_S.read(_v32, "WHITE"), _S.prop(_S.read(_v32, "C"), 6), _S.prop(_S.read(_v32, "C"), 5)]]), _S.invoke(_S.read(_v32, "R"), "range", [0.8, 1.6])])
				_v31 = _S.iteration(_v31)
				_S.write(_v31, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v33 in _S.array(_S.read(_e, "pops")):
		var _v34 = _S.scope(_e)
		_S.define(_v34, "q", _v33)
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "k", _S.binary("-", 1, _S.call_value(_S.read(_v35, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v35, "t"), _S.prop(_S.read(_v35, "q"), "t")), 0.5)])))
		if _S.truth(_S.binary(">", _S.read(_v35, "k"), 0)):
			_S.invoke(_S.read(_v35, "p"), "glow", [_S.prop(_S.read(_v35, "q"), "x"), _S.unary("-", 1), 22, _S.prop(_S.read(_v35, "C"), 5), _S.binary("*", _S.binary("*", 0.25, _S.read(_v35, "k")), _S.read(_v35, "k"))])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "lock"), [_S.read(_e, "p")])
	for _v36 in _S.array(_S.read(_e, "bolts")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "b", _v36)
		if _S.truth(_S.prop(_S.read(_v37, "b"), "on")):
			_S.call_value(_S.read(_v37, "ribbon"), [_S.read(_v37, "p"), _S.read(_v37, "b")])
	for _v38 in _S.array(_S.read(_e, "bolts")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "b", _v38)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v39, "b"), "on"), func(): return _S.binary("<", _S.prop(_S.read(_v39, "b"), "hit"), 0))):
			_S.call_value(_S.read(_v39, "head"), [_S.read(_v39, "p"), _S.read(_v39, "b")])
	for _v40 in _S.array(_S.read(_e, "pops")):
		var _v41 = _S.scope(_e)
		_S.define(_v41, "q", _v40)
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "k", _S.binary("/", _S.binary("-", _S.read(_v42, "t"), _S.prop(_S.read(_v42, "q"), "t")), 0.35))
		if _S.truth(_S.binary("<", _S.read(_v42, "k"), 1)):
			_S.call_value(_S.read(_v42, "pop"), [_S.read(_v42, "p"), _S.read(_v42, "k"), _S.prop(_S.read(_v42, "q"), "x"), _S.prop(_S.read(_v42, "q"), "y")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.55)):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "HX"), _S.read(_e, "HY"), _S.binary("+", 3, _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 40)]))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), 0.55)))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null
