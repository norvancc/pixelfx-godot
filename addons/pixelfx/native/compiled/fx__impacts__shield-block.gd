@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/shield-block.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Shield block"}, {"desc": "A blow is caught on a half-dome of energy in front of the character: its diamond lattice flashes, a ripple runs over it, sparks glance off, then it blinks out cell by cell."}, {"tags": ["impact", "block", "shield", "barrier", "energy", "ripple", "actor", "one-shot"]}, {"size": [148, 104]}, {"origin": [40, 88]}, {"duration": 1.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BRACE", _S.merge([_S.read(_e, "READY"), {"crouch": 4}, {"lean": 2}, {"fx": 13}, {"fy": _S.unary("-", 28)}, {"bx": 6}, {"by": _S.unary("-", 21)}, {"ffx": 9}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.36), _S.read(_e, "READY")], [_S.unary("-", 0.1), _S.read(_e, "BRACE")], [0, _S.merge([_S.read(_e, "BRACE"), {"x": _S.unary("-", 3)}, {"crouch": 6}, {"lean": _S.unary("-", 2)}, {"fx": 10}, {"fy": _S.unary("-", 26)}]), "snap"], [0.18, _S.merge([_S.read(_e, "BRACE"), {"x": _S.unary("-", 4)}, {"crouch": 5}, {"lean": 0}])], [0.65, _S.merge([_S.read(_e, "BRACE"), {"x": _S.unary("-", 3)}])], [1.1, _S.merge([_S.read(_e, "READY"), {"x": 0}])]]}, {"hits": [_S.merge([{"t": 0.005}, {"stop": 0.09}, {"shake": 0.2}, {"amp": 2}])]}, {"dust": [_S.merge([{"t": 0.01}, {"x": _S.unary("-", 10)}, {"n": 6}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CX", 3)
	_S.define(_e, "RX", 28)
	_S.define(_e, "RY", 44)
	_S.define(_e, "GRID", 3.4)
	_S.define(_e, "HIT", _S.merge([{"lon": 1.18}, {"lat": 0.5}]))
	_S.define(_e, "GONE", 0.5)
	_S.define(_e, "onDome", _S.function_value(_e, "_f6"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "sparks"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.read(_e, "S")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	var _v0 = _S.call_value(_S.read(_e, "onDome"), [_S.prop(_S.read(_e, "HIT"), "lon"), _S.prop(_S.read(_e, "HIT"), "lat")])
	_S.define(_e, "hx", _S.prop(_v0, 0))
	_S.define(_e, "hy", _S.prop(_v0, 1))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 8, 0.2, _S.merge([{"len": [5, 8]}, {"w": [1.4, 1.9]}, {"fwd": 1.2}, {"back": 0.3}])]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "hx"), _S.read(_e, "hy"), 40, _S.prop(_S.read(_e, "S"), 1), 0.7, 0.2])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "hx"), _S.read(_e, "hy"), 12, _S.read(_e, "WHITE"), 0.7, 0.06])
	_S.define(_e, "nA", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("/", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "HIT"), "lat")])), _S.read(_e, "RY")), _S.binary("/", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "HIT"), "lat")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "HIT"), "lon")])), _S.read(_e, "RX"))]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), 14)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "a", _S.binary("+", _S.read(_v2, "nA"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 1.2), 0.9])))
		_S.define(_v2, "v", _S.invoke(_S.read(_v2, "R"), "range", [130, 300]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.binary("+", _S.read(_v2, "hx"), 1), _S.read(_v2, "hy"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "v")), 30), _S.invoke(_S.read(_v2, "R"), "range", [0.15, 0.42]), _S.read(_v2, "WHITE"), 1, (_S.invoke(_S.read(_v2, "R"), "range", [0.01, 0.04]) if _S.truth(_S.binary(">", _S.read(_v2, "i"), 10)) else 0)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "dome", _S.function_value(_e, "_f2"))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "GONE"), 0.35), _S.binary("+", _S.read(_e, "GONE"), 0.55), _S.read(_e, "t")])))
	if _S.truth(_S.binary("<=", _S.read(_e, "fade"), 0)):
		return null
	var _v3 = _S.scope(_e)
	_S.define(_v3, "y", _S.binary("-", _S.unary("-", _S.read(_v3, "RY")), 1))
	while _S.truth(_S.binary("<", _S.read(_v3, "y"), 0)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "x", _S.read(_v4, "CX"))
		while _S.truth(_S.binary("<=", _S.read(_v4, "x"), _S.binary("+", _S.binary("+", _S.read(_v4, "CX"), _S.read(_v4, "RX")), 1))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "u", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v5, "x"), 0.5), _S.read(_v5, "CX")), _S.read(_v5, "RX")))
			_S.define(_v5, "v", _S.binary("/", _S.unary("-", _S.binary("+", _S.read(_v5, "y"), 0.5)), _S.read(_v5, "RY")))
			_S.define(_v5, "q", _S.binary("+", _S.binary("*", _S.read(_v5, "u"), _S.read(_v5, "u")), _S.binary("*", _S.read(_v5, "v"), _S.read(_v5, "v"))))
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_v5, "q"), 1), func(): return _S.binary("<", _S.read(_v5, "u"), 0)), func(): return _S.binary("<", _S.read(_v5, "v"), 0))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "x", 1, "+=", true)
				continue
			_S.define(_v5, "z", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v5, "q"))]), (_S.unary("-", 1) if _S.truth(_S.read(_v5, "back")) else 1)))
			_S.define(_v5, "lon", _S.invoke(_S.read(_v5, "Math"), "atan2", [_S.read(_v5, "u"), _S.read(_v5, "z")]))
			_S.define(_v5, "lat", _S.invoke(_S.read(_v5, "Math"), "asin", [_S.call_value(_S.read(_v5, "clamp"), [_S.read(_v5, "v")])]))
			_S.define(_v5, "a", _S.binary("*", _S.binary("+", _S.read(_v5, "lon"), _S.read(_v5, "lat")), _S.read(_v5, "GRID")))
			_S.define(_v5, "b", _S.binary("*", _S.binary("-", _S.read(_v5, "lon"), _S.read(_v5, "lat")), _S.read(_v5, "GRID")))
			_S.define(_v5, "fa", _S.binary("-", _S.read(_v5, "a"), _S.invoke(_S.read(_v5, "Math"), "floor", [_S.read(_v5, "a")])))
			_S.define(_v5, "fb", _S.binary("-", _S.read(_v5, "b"), _S.invoke(_S.read(_v5, "Math"), "floor", [_S.read(_v5, "b")])))
			_S.define(_v5, "cell", _S.call_value(_S.read(_v5, "rand"), [_S.invoke(_S.read(_v5, "Math"), "floor", [_S.read(_v5, "a")]), _S.invoke(_S.read(_v5, "Math"), "floor", [_S.read(_v5, "b")]), 31]))
			_S.define(_v5, "line", _S.binary("<", _S.invoke(_S.read(_v5, "Math"), "min", [_S.read(_v5, "fa"), _S.binary("-", 1, _S.read(_v5, "fa")), _S.read(_v5, "fb"), _S.binary("-", 1, _S.read(_v5, "fb"))]), 0.13))
			_S.define(_v5, "gone", _S.binary("+", _S.read(_v5, "GONE"), _S.binary("*", _S.read(_v5, "cell"), 0.35)))
			if _S.truth(_S.binary(">", _S.read(_v5, "t"), _S.read(_v5, "gone"))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "x", 1, "+=", true)
				continue
			_S.define(_v5, "d", _S.invoke(_S.read(_v5, "Math"), "acos", [_S.call_value(_S.read(_v5, "clamp"), [_S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "lat")]), _S.invoke(_S.read(_v5, "Math"), "cos", [_S.prop(_S.read(_v5, "HIT"), "lat")])), _S.invoke(_S.read(_v5, "Math"), "cos", [_S.binary("-", _S.read(_v5, "lon"), _S.prop(_S.read(_v5, "HIT"), "lon"))])), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "lat")]), _S.invoke(_S.read(_v5, "Math"), "sin", [_S.prop(_S.read(_v5, "HIT"), "lat")]))), _S.unary("-", 1), 1])]))
			_S.define(_v5, "hit", 0)
			for _v6 in _S.array([[0, 1], [0.12, 0.55]]):
				var _v7 = _S.scope(_v5)
				var _v8 = _v6
				_S.define(_v7, "t0", _S.prop(_v8, 0))
				_S.define(_v7, "k0", _S.prop(_v8, 1))
				var _v9 = _S.scope(_v7)
				_S.define(_v9, "k", _S.binary("-", _S.read(_v9, "t"), _S.read(_v9, "t0")))
				_S.define(_v9, "front", _S.binary("*", _S.read(_v9, "k"), 3.6))
				if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v9, "k"), 0), func(): return _S.binary(">", _S.read(_v9, "k"), 0.55))):
					continue
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.read(_v9, "d"), _S.read(_v9, "front"))]), 0.2)):
					_S.write(_v9, "hit", _S.invoke(_S.read(_v9, "Math"), "max", [_S.read(_v9, "hit"), _S.binary("*", _S.read(_v9, "k0"), _S.binary("-", 1, _S.binary("/", _S.read(_v9, "k"), 0.55)))]), "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v9, "d"), _S.read(_v9, "front"))):
						_S.write(_v9, "hit", _S.invoke(_S.read(_v9, "Math"), "max", [_S.read(_v9, "hit"), _S.binary("*", _S.binary("*", 0.3, _S.read(_v9, "k0")), _S.binary("-", 1, _S.binary("/", _S.read(_v9, "k"), 0.55)))]), "=", false)
			_S.define(_v5, "rim", _S.binary("-", 1, _S.invoke(_S.read(_v5, "Math"), "abs", [_S.read(_v5, "z")])))
			_S.define(_v5, "flash", _S.binary("<", _S.read(_v5, "t"), 0.05))
			_S.define(_v5, "blink", _S.binary(">", _S.read(_v5, "t"), _S.binary("-", _S.read(_v5, "gone"), 0.06)))
			_S.define(_v5, "sheen", _S.binary("<", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("-", _S.binary("*", _S.read(_v5, "lat"), 0.8), _S.binary("*", _S.read(_v5, "lon"), 0.3)), _S.binary("*", _S.read(_v5, "t"), 1.6)), 1), 1), 1), 0.5)]), 0.05))
			if _S.truth(_S.read(_v5, "back")):
				var _v10 = _S.scope(_v5)
				if _S.truth(_S.read(_v10, "line")):
					_S.invoke(_S.read(_v10, "p"), "dot", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.prop(_S.read(_v10, "C"), 3), _S.binary("*", 0.5, _S.read(_v10, "fade"))])
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">", _S.read(_v5, "q"), 0.9)):
				_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.read(_v5, "WHITE") if _S.truth(_S.logical("||", _S.read(_v5, "flash"), func(): return _S.binary(">", _S.read(_v5, "hit"), 0.5))) else _S.prop(_S.read(_v5, "C"), 6)), _S.read(_v5, "fade")])
			else:
				if _S.truth(_S.read(_v5, "line")):
					_S.invoke(_S.read(_v5, "p"), "dot", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.read(_v5, "WHITE") if _S.truth(_S.logical("||", _S.logical("||", _S.read(_v5, "flash"), func(): return _S.read(_v5, "blink")), func(): return _S.binary(">", _S.read(_v5, "hit"), 0.5))) else (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v5, "hit"), 0.2), func(): return _S.read(_v5, "sheen"))) else (_S.prop(_S.read(_v5, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v5, "rim"), 0.7)) else (_S.prop(_S.read(_v5, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v5, "rim"), 0.35)) else _S.prop(_S.read(_v5, "C"), 3))))), _S.read(_v5, "fade")])
				else:
					_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.logical("||", _S.read(_v5, "flash"), func(): return _S.binary(">", _S.read(_v5, "hit"), 0.35))) else _S.prop(_S.read(_v5, "C"), 3)), _S.binary("*", _S.read(_v5, "fade"), _S.invoke(_S.read(_v5, "Math"), "min", [0.85, _S.binary("+", (0.35 if _S.truth(_S.read(_v5, "flash")) else _S.binary("+", 0.1, _S.binary("*", _S.binary("*", 0.25, _S.read(_v5, "rim")), _S.read(_v5, "rim")))), _S.binary("*", _S.read(_v5, "hit"), 0.65))]))])
			if _S.truth(_S.binary("===", _S.binary("&", _S.binary("+", _S.binary("*", _S.read(_v5, "x"), 7), _S.binary("*", _S.read(_v5, "y"), 3)), 15), 0)):
				_S.invoke(_S.read(_v5, "p"), "light", [_S.read(_v5, "x"), _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 4), _S.binary("+", 0.15, _S.binary("*", 0.5, _S.read(_v5, "hit")))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "x", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "y", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "GONE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "GONE"), 0.38))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "lon", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.binary("/", _S.prop(_S.read(_v11, "Math"), "PI"), 2)]))
		_S.define(_v11, "lat", _S.invoke(_S.read(_v11, "R"), "range", [0.05, 1.4]))
		var _v12 = _S.call_value(_S.read(_v11, "onDome"), [_S.read(_v11, "lon"), _S.read(_v11, "lat")])
		_S.define(_v11, "x", _S.prop(_v12, 0))
		_S.define(_v11, "y", _S.prop(_v12, 1))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "STAR"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [10, 40])), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.36]), (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "C"), 5)), _S.invoke(_S.read(_v11, "R"), "range", [0.6, 1.4])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "dome"), [_S.read(_e, "p"), true])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "dome"), [_S.read(_e, "p"), false])
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "GONE"), 0.3), _S.binary("+", _S.read(_e, "GONE"), 0.55), _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "fade"), 0)):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "x", _S.read(_v13, "CX"))
		while _S.truth(_S.binary("<=", _S.read(_v13, "x"), _S.binary("+", _S.read(_v13, "CX"), _S.read(_v13, "RX")))):
			_S.invoke(_S.read(_v13, "p"), "dot", [_S.read(_v13, "x"), 0, (_S.read(_v13, "WHITE") if _S.truth(_S.binary("<", _S.read(_v13, "t"), 0.05)) else _S.prop(_S.read(_v13, "C"), 5)), _S.binary("*", _S.read(_v13, "fade"), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.binary("/", _S.binary("-", _S.read(_v13, "x"), _S.read(_v13, "CX")), _S.read(_v13, "RX")))))])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "x", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.03)):
		_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "hx"), _S.read(_e, "hy"), _S.read(_e, "sp"), 1, 1, [_S.prop(_S.read(_e, "S"), 3), _S.prop(_S.read(_e, "S"), 0), _S.prop(_S.read(_e, "S"), 1), _S.read(_e, "WHITE")], 1, 2])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.06)):
			_S.call_value(_S.read(_e, "star"), [_S.read(_e, "p"), _S.read(_e, "hx"), _S.read(_e, "hy"), _S.read(_e, "sp"), 1.25, 0.55, [_S.prop(_S.read(_e, "S"), 3), _S.prop(_S.read(_e, "S"), 1), _S.prop(_S.read(_e, "S"), 2), _S.prop(_S.read(_e, "S"), 0)], 1, 2])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("+", _S.read(_e, "CX"), _S.binary("*", _S.read(_e, "RX"), 0.5)), _S.binary("*", _S.unary("-", _S.read(_e, "RY")), 0.45), _S.binary("*", _S.read(_e, "RY"), 0.9), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", _S.binary("*", 0.2, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "GONE"), _S.binary("+", _S.read(_e, "GONE"), 0.55), _S.read(_e, "t")]))), _S.binary("*", 0.35, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.08)])))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lon", _S.arg(_args, 0))
	_S.define(_e, "lat", _S.arg(_args, 1))
	return [_S.binary("+", _S.read(_e, "CX"), _S.binary("*", _S.binary("*", _S.read(_e, "RX"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lat")])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "lon")]))), _S.binary("*", _S.unary("-", _S.read(_e, "RY")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "lat")]))]
