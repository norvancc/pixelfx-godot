@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/arcane-orb.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mote", _S.import_value("fx/arcane/_lib.js", "mote"))
	_S.define(_e, "setup", _S.function_value(_e, "_f0"))
	_S.define(_e, "ring", _S.function_value(_e, "_f1"))
	_S.define(_e, "orb", _S.function_value(_e, "_f3"))
	_S.define(_e, "motes", _S.function_value(_e, "_f6"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f9"))
	_S.define(_e, "draw", _S.function_value(_e, "_f10"))
	_S.define(_e, "D", 2.4)
	_S.define(_e, "RAD", 17)
	_S.define(_e, "Y0", _S.unary("-", 52))
	_S.define(_e, "meta", _S.merge([{"name": "Arcane orb"}, {"desc": "A floating orb of smoky violet glass with a swirl turning round a white-hot heart, two tilted rings of light orbiting behind and in front."}, {"tags": ["arcane", "orb", "sphere", "magic", "floating", "loop"]}, {"size": [136, 112]}, {"origin": [68, 104]}, {"duration": _S.read(_e, "D")}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "RINGS", [_S.merge([{"r": 31}, {"sy": 0.24}, {"rot": 0.36}, {"beads": 3}, {"turn": 2}, {"c": 0}]), _S.merge([{"r": 27}, {"sy": 0.3}, {"rot": _S.unary("-", 0.55)}, {"beads": 2}, {"turn": _S.unary("-", 3)}, {"c": 1}])])
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	return _S.merge([{"ph": _S.read(_e, "ph")}, {"cx": 0}, {"cy": _S.binary("+", _S.read(_e, "Y0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]), 2))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "R", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	var _v0 = _S.read(_e, "s")
	_S.define(_e, "ph", _S.prop(_v0, "ph"))
	_S.define(_e, "cx", _S.prop(_v0, "cx"))
	_S.define(_e, "cy", _S.prop(_v0, "cy"))
	_S.define(_e, "rot", _S.binary("+", _S.prop(_S.read(_e, "R"), "rot"), _S.binary("*", 0.12, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), _S.prop(_S.read(_e, "R"), "c"))]))))
	_S.define(_e, "cr", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "rot")]))
	_S.define(_e, "sr", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "rot")]))
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "R"), "r"), _S.read(_e, "TAU")), 1.5)]))
	_S.define(_e, "pos", _S.function_value(_e, "_f2"))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "j"), _S.read(_v1, "n"))):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "g", _S.binary("*", _S.binary("/", _S.read(_v2, "j"), _S.read(_v2, "n")), _S.read(_v2, "TAU")))
		_S.define(_v2, "z", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "g")]))
		if _S.truth(_S.binary("!==", _S.binary(">", _S.read(_v2, "z"), 0), _S.read(_v2, "near"))):
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "j", 1, "+=", true)
			continue
		var _v3 = _S.call_value(_S.read(_v2, "pos"), [_S.read(_v2, "g")])
		_S.define(_v2, "x", _S.prop(_v3, 0))
		_S.define(_v2, "y", _S.prop(_v3, 1))
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.prop(_S.read(_v2, "C"), 5) if _S.truth(_S.read(_v2, "near")) else _S.prop(_S.read(_v2, "C"), 4)), (0.7 if _S.truth(_S.read(_v2, "near")) else 0.4)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "j", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "b", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "b"), _S.prop(_S.read(_v4, "R"), "beads"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "g", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v5, "ph"), _S.read(_v5, "TAU")), _S.prop(_S.read(_v5, "R"), "turn")), _S.binary("/", _S.binary("*", _S.read(_v5, "b"), _S.read(_v5, "TAU")), _S.prop(_S.read(_v5, "R"), "beads"))))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "k"), 7)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "gg", _S.binary("-", _S.read(_v7, "g"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sign", [_S.prop(_S.read(_v7, "R"), "turn")]), _S.read(_v7, "k")), 0.07)))
			_S.define(_v7, "z", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "gg")]))
			if _S.truth(_S.binary("!==", _S.binary(">", _S.read(_v7, "z"), 0), _S.read(_v7, "near"))):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "k", 1, "+=", true)
				continue
			var _v8 = _S.call_value(_S.read(_v7, "pos"), [_S.read(_v7, "gg")])
			_S.define(_v7, "x", _S.prop(_v8, 0))
			_S.define(_v7, "y", _S.prop(_v8, 1))
			_S.invoke(_S.read(_v7, "p"), "dot", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.read(_v7, "WHITE") if _S.truth(_S.binary("===", _S.read(_v7, "k"), 0)) else (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "k"), 3)) else _S.prop(_S.read(_v7, "C"), 5))), (1 if _S.truth(_S.binary("<", _S.read(_v7, "k"), 4)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v7, "k"), 3), 4)))])
			if _S.truth(_S.binary("===", _S.read(_v7, "k"), 0)):
				_S.invoke(_S.read(_v7, "p"), "glow", [_S.read(_v7, "x"), _S.read(_v7, "y"), (7 if _S.truth(_S.read(_v7, "near")) else 5), _S.prop(_S.read(_v7, "C"), 6), (0.5 if _S.truth(_S.read(_v7, "near")) else 0.25)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "k", 1, "+=", true)
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "b", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "lx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "g")]), _S.prop(_S.read(_e, "R"), "r")))
	_S.define(_e, "ly", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), _S.prop(_S.read(_e, "R"), "r")), _S.prop(_S.read(_e, "R"), "sy")))
	return [_S.binary("-", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "cr"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "sr"))), _S.binary("+", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "lx"), _S.read(_e, "sr"))), _S.binary("*", _S.read(_e, "ly"), _S.read(_e, "cr")))]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	var _v9 = _S.read(_e, "s")
	_S.define(_e, "ph", _S.prop(_v9, "ph"))
	_S.define(_e, "cx", _S.prop(_v9, "cx"))
	_S.define(_e, "cy", _S.prop(_v9, "cy"))
	_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "RAD"), _S.function_value(_e, "_f4"), _S.function_value(_e, "_f5")])
	for _v10 in _S.array([[0, 1], [_S.prop(_S.read(_e, "Math"), "PI"), 1], [_S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), 0], [_S.binary("/", _S.binary("*", 3, _S.prop(_S.read(_e, "Math"), "PI")), 2), 0]]):
		var _v11 = _S.scope(_e)
		var _v12 = _v10
		_S.define(_v11, "s0", _S.prop(_v12, 0))
		_S.define(_v11, "main", _S.prop(_v12, 1))
		var _v13 = _S.scope(_v11)
		_S.define(_v13, "u", 0.08)
		while _S.truth(_S.binary("<=", _S.read(_v13, "u"), 0.85)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v14, "ph"), _S.read(_v14, "TAU")), 2), _S.read(_v14, "s0")), _S.binary("*", _S.read(_v14, "u"), 3.4)))
			_S.define(_v14, "r", _S.binary("*", _S.binary("*", _S.read(_v14, "u"), _S.read(_v14, "RAD")), 0.92))
			_S.define(_v14, "x", _S.binary("+", _S.read(_v14, "cx"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "r"))))
			_S.define(_v14, "y", _S.binary("+", _S.read(_v14, "cy"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "r"))))
			_S.define(_v14, "fade", (1 if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.6)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v14, "u"), 0.6), 0.25))))
			if _S.truth(_S.unary("!", _S.read(_v14, "main"))):
				var _v15 = _S.scope(_v14)
				_S.invoke(_S.read(_v15, "p"), "dot", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.prop(_S.read(_v15, "C"), 4), _S.binary("*", _S.read(_v15, "fade"), 0.8)])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "u", 0.012, "+=", false)
				continue
			_S.define(_v14, "b", _S.binary("-", _S.read(_v14, "a"), 0.16))
			_S.define(_v14, "xb", _S.binary("+", _S.read(_v14, "cx"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "b")]), _S.read(_v14, "r"))))
			_S.define(_v14, "yb", _S.binary("+", _S.read(_v14, "cy"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "b")]), _S.read(_v14, "r"))))
			_S.invoke(_S.read(_v14, "p"), "dot", [_S.read(_v14, "xb"), _S.read(_v14, "yb"), (_S.prop(_S.read(_v14, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.4)) else _S.prop(_S.read(_v14, "C"), 5)), _S.read(_v14, "fade")])
			_S.invoke(_S.read(_v14, "p"), "dot", [_S.read(_v14, "x"), _S.read(_v14, "y"), (_S.read(_v14, "WHITE") if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.3)) else (_S.prop(_S.read(_v14, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v14, "u"), 0.55)) else _S.prop(_S.read(_v14, "C"), 5))), _S.read(_v14, "fade")])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "u", 0.012, "+=", false)
	_S.define(_e, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")), 3)]))))
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.binary("*", 3.6, _S.read(_e, "pulse")), 1), _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", 2.8, _S.read(_e, "pulse")), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "circle", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("*", 1.7, _S.read(_e, "pulse")), _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "RAD"), 0.4), 1, _S.prop(_S.read(_e, "C"), 5)])
	_S.invoke(_S.read(_e, "p"), "ring", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "RAD"), 1.3), 1, _S.prop(_S.read(_e, "C"), 2), 0.8])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "a", 3.5)
	while _S.truth(_S.binary("<", _S.read(_v16, "a"), 4.7)):
		_S.invoke(_S.read(_v16, "p"), "dot", [_S.binary("+", _S.read(_v16, "cx"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.binary("-", _S.read(_v16, "RAD"), 2.4))), _S.binary("+", _S.read(_v16, "cy"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.binary("-", _S.read(_v16, "RAD"), 2.4))), (_S.read(_v16, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v16, "a"), 3.85), func(): return _S.binary("<", _S.read(_v16, "a"), 4.35))) else _S.prop(_S.read(_v16, "C"), 6))])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "a", 0.03, "+=", false)
	_S.invoke(_S.read(_e, "p"), "circle", [_S.binary("-", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "RAD"), 0.42)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 0.5)), 1.3, _S.read(_e, "WHITE")])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "RAD"), 0.52)), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "RAD"), 0.55)), _S.prop(_S.read(_e, "C"), 6)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), 20, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.26, _S.read(_e, "pulse"))])
	_S.invoke(_S.read(_e, "p"), "glowRing", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.read(_e, "RAD"), 6, _S.prop(_S.read(_e, "C"), 5), 0.25])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.82)) else _S.prop(_S.read(_e, "C"), 1))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", 0.32, _S.binary("*", _S.binary("*", 0.5, _S.read(_e, "d")), _S.read(_e, "d")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "S", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	var _v17 = _S.read(_e, "s")
	_S.define(_e, "ph", _S.prop(_v17, "ph"))
	_S.define(_e, "cx", _S.prop(_v17, "cx"))
	_S.define(_e, "cy", _S.prop(_v17, "cy"))
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 8)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "a", _S.binary("+", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v19, "i"), 2.4), _S.read(_v19, "S")), _S.read(_v19, "TAU")), _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_v19, "ph"), _S.read(_v19, "TAU")), (1 if _S.truth(_S.binary("%", _S.read(_v19, "i"), 2)) else _S.unary("-", 1))), _S.binary("+", 1, _S.binary("%", _S.read(_v19, "i"), 3)))))
		_S.define(_v19, "rr", _S.binary("+", _S.binary("+", _S.read(_v19, "RAD"), 5), _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_v19, "i"), 0.37), 1), 12)))
		_S.define(_v19, "tilt", _S.binary("*", _S.binary("-", _S.binary("%", _S.binary("*", _S.read(_v19, "i"), 0.71), 1), 0.5), 1.4))
		_S.define(_v19, "x0", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "rr")))
		_S.define(_v19, "z", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]))
		if _S.truth(_S.binary("!==", _S.binary(">", _S.read(_v19, "z"), 0), _S.read(_v19, "near"))):
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
			continue
		_S.define(_v19, "x", _S.binary("+", _S.read(_v19, "cx"), _S.binary("*", _S.read(_v19, "x0"), _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "tilt")]))))
		_S.define(_v19, "y", _S.binary("+", _S.binary("+", _S.read(_v19, "cy"), _S.binary("*", _S.read(_v19, "x0"), _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "tilt")]))), _S.binary("*", _S.binary("*", _S.read(_v19, "z"), _S.read(_v19, "rr")), 0.28)))
		_S.define(_v19, "dir", (1 if _S.truth(_S.binary("%", _S.read(_v19, "i"), 2)) else _S.unary("-", 1)))
		_S.invoke(_S.read(_v19, "p"), "dot", [_S.read(_v19, "x"), _S.read(_v19, "y"), (_S.read(_v19, "WHITE") if _S.truth(_S.read(_v19, "near")) else _S.prop(_S.read(_v19, "C"), 5))])
		_S.invoke(_S.read(_v19, "p"), "dot", [_S.binary("-", _S.read(_v19, "x"), _S.read(_v19, "dir")), _S.read(_v19, "y"), (_S.prop(_S.read(_v19, "C"), 6) if _S.truth(_S.read(_v19, "near")) else _S.prop(_S.read(_v19, "C"), 4)), (1 if _S.truth(_S.read(_v19, "near")) else 0.6)])
		if _S.truth(_S.read(_v19, "near")):
			_S.last([_S.invoke(_S.read(_v19, "p"), "dot", [_S.binary("-", _S.read(_v19, "x"), _S.binary("*", 2, _S.read(_v19, "dir"))), _S.read(_v19, "y"), _S.prop(_S.read(_v19, "C"), 4), 0.6]), _S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "x"), _S.read(_v19, "y"), 5, _S.prop(_S.read(_v19, "C"), 6), 0.35])])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	if _S.truth(_S.unary("!", _S.read(_e, "near"))):
		return null
	_S.call_value(_S.read(_e, "cycle"), [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "D")), _S.read(_e, "D"), 10, _S.binary("+", _S.binary("*", _S.read(_e, "S"), 3), 1), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "range", [0.6, 1])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "q", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "d", _S.binary("+", _S.binary("+", _S.read(_e, "RAD"), 1), _S.binary("*", _S.read(_e, "q"), _S.invoke(_S.read(_e, "r"), "range", [8, 18]))))
	_S.define(_e, "x", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d"))))
	_S.define(_e, "y", _S.binary("-", _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d"))), _S.binary("*", _S.read(_e, "q"), 10)))
	_S.call_value(_S.read(_e, "mote"), [_S.read(_e, "p"), _S.read(_e, "x"), _S.read(_e, "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), 25), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 25), 12), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "r"), "chance", [0.5])) else _S.prop(_S.read(_e, "C"), 5)), 0.6, _S.binary("-", 1, _S.read(_e, "q")), 0.3])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "t")]))
	_S.define(_e, "lift", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "cy"), _S.read(_e, "Y0")), 2))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 36, _S.prop(_S.read(_e, "C"), 4), _S.binary("-", 0.26, _S.binary("*", 0.04, _S.read(_e, "lift")))])
	var _v20 = _S.scope(_e)
	_S.define(_v20, "x", _S.unary("-", 20))
	while _S.truth(_S.binary("<=", _S.read(_v20, "x"), 20)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "u", _S.binary("/", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.binary("+", _S.read(_v21, "x"), 0.5)]), 20))
		_S.invoke(_S.read(_v21, "p"), "dot", [_S.read(_v21, "x"), 0, (_S.prop(_S.read(_v21, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v21, "u"), 0.3)) else _S.prop(_S.read(_v21, "C"), 5)), _S.binary("*", _S.binary("-", 1.1, _S.read(_v21, "u")), _S.binary("-", 0.9, _S.binary("*", 0.15, _S.read(_v21, "lift"))))])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "s"), "cx"), _S.prop(_S.read(_e, "s"), "cy"), 60, _S.prop(_S.read(_e, "C"), 4), 0.36])
	for _v22 in _S.array(_S.read(_e, "RINGS")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "R", _v22)
		_S.call_value(_S.read(_v23, "ring"), [_S.read(_v23, "p"), _S.read(_v23, "C"), _S.read(_v23, "s"), _S.read(_v23, "R"), false])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "s"), _S.prop(_S.read(_e, "o"), "seed"), false])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "setup"), [_S.read(_e, "t")]))
	_S.call_value(_S.read(_e, "orb"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "s")])
	for _v24 in _S.array(_S.read(_e, "RINGS")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "R", _v24)
		_S.call_value(_S.read(_v25, "ring"), [_S.read(_v25, "p"), _S.read(_v25, "C"), _S.read(_v25, "s"), _S.read(_v25, "R"), true])
	_S.call_value(_S.read(_e, "motes"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "s"), _S.prop(_S.read(_e, "o"), "seed"), true])
	_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("-", _S.prop(_S.read(_e, "s"), "cx"), _S.binary("*", _S.read(_e, "RAD"), 0.42)), _S.binary("-", _S.prop(_S.read(_e, "s"), "cy"), _S.binary("*", _S.read(_e, "RAD"), 0.5)), _S.binary("+", 1.5, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "s"), "ph"), _S.read(_e, "TAU")), 2)])]), 2)), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.3])
	return null
