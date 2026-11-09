@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/warp-in.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "widthAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Warp in"}, {"desc": "A beam slams down, rings run down it and a scanline paints the hero in from head to toe, white-hot pixels cooling to their own colors; the beam pinches shut in sparks."}, {"tags": ["scifi", "teleport", "warp", "beam", "spawn", "arrive", "one-shot"]}, {"size": [192, 168]}, {"origin": [96, 128]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0b1030", "#152a63", "#1d4f9e", "#2582d2", "#36b9ee", "#8ae8ff", "#d4fbff", "#ffffff"]}, {"width": 15}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "IN", _S.merge([{"crouch": 7}, {"lean": 3}, {"fx": 9}, {"fy": _S.unary("-", 12)}, {"bx": 12}, {"by": _S.unary("-", 12)}, {"ffx": 8}, {"fbx": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[0, _S.read(_e, "IN")], [1.82, _S.read(_e, "IN")], [2.05, _S.merge([{"crouch": 3}, {"fx": 8}, {"fy": _S.unary("-", 19)}, {"bx": 8}, {"by": _S.unary("-", 18)}, {"ffx": 4}, {"fbx": _S.unary("-", 3)}])], [2.5, _S.read(_e, "READY")], [3, _S.read(_e, "READY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SLAM", 0.34)
	_S.define(_e, "OPEN", 0.52)
	_S.define(_e, "SCAN0", 0.62)
	_S.define(_e, "SCAN1", 1.4)
	_S.define(_e, "COOL", 0.42)
	_S.define(_e, "DONE", _S.binary("+", _S.read(_e, "SCAN1"), _S.read(_e, "COOL")))
	_S.define(_e, "CLOSE", 1.9)
	_S.define(_e, "SNAP", 2.16)
	_S.define(_e, "TOP", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f14"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "scanY", _S.function_value(_e, "_f15"))
	_S.define(_e, "scanT", _S.function_value(_e, "_f16"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM"))):
		return 0
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLOSE"))):
		return _S.binary("*", _S.read(_e, "W"), _S.binary("+", _S.binary("+", 1, _S.binary("*", 0.45, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM"))), 14)]))), _S.binary("*", 0.03, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 31)]))))
	return _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "W"), 0.7, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLOSE")), _S.binary("-", _S.read(_e, "SNAP"), _S.read(_e, "CLOSE")))])])])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f2")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "body", [])
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "my", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "my"), _S.prop(_S.read(_v0, "A"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "mx", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "mx"), _S.prop(_S.read(_v1, "A"), "w"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "i", _S.binary("+", _S.binary("*", _S.read(_v2, "my"), _S.prop(_S.read(_v2, "A"), "w")), _S.read(_v2, "mx")))
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.prop(_S.read(_v2, "A"), "mask"), "data"), _S.read(_v2, "i")))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "mx", 1, "+=", true)
				continue
			_S.define(_v2, "on", _S.function_value(_v2, "_f3"))
			_S.define(_v2, "x", _S.binary("+", _S.prop(_S.read(_v2, "A"), "x"), _S.read(_v2, "mx")))
			_S.define(_v2, "y", _S.binary("+", _S.prop(_S.read(_v2, "A"), "y"), _S.read(_v2, "my")))
			_S.define(_v2, "edge", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.binary("-", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")])), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.binary("+", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("-", _S.read(_v2, "my"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("+", _S.read(_v2, "my"), 1)]))))
			_S.invoke(_S.read(_v2, "body"), "push", [_S.merge([{"x": _S.read(_v2, "x")}, {"y": _S.read(_v2, "y")}, {"c": _S.logical("||", _S.prop(_S.prop(_S.read(_v2, "A"), "pixels"), _S.read(_v2, "i")), func(): return _S.prop(_S.read(_v2, "C"), 2))}, {"edge": _S.read(_v2, "edge")}, {"ts": _S.call_value(_S.read(_v2, "scanT"), [_S.read(_v2, "y"), _S.prop(_S.read(_v2, "A"), "y")])}, {"j": _S.call_value(_S.read(_v2, "rand"), [_S.prop(_S.read(_v2, "o"), "seed"), _S.read(_v2, "mx"), _S.read(_v2, "my")])}])])
			_S.define(_v2, "r", _S.logical("??", _S.invoke(_S.read(_v2, "rows"), "get", [_S.read(_v2, "y")]), func(): return [_S.read(_v2, "x"), _S.read(_v2, "x")]))
			_S.invoke(_S.read(_v2, "rows"), "set", [_S.read(_v2, "y"), [_S.invoke(_S.read(_v2, "Math"), "min", [_S.prop(_S.read(_v2, "r"), 0), _S.read(_v2, "x")]), _S.invoke(_S.read(_v2, "Math"), "max", [_S.prop(_S.read(_v2, "r"), 1), _S.read(_v2, "x")])]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "mx", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "my", 1, "+=", true)
	_S.define(_e, "rings", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "slammed", false)
	_S.define(_e, "snapped", false)
	_S.define(_e, "nextRing", _S.binary("+", _S.read(_e, "SLAM"), 0.08))
	_S.define(_e, "lastRow", _S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 3))
	_S.define(_e, "column", _S.function_value(_e, "_f4"))
	_S.define(_e, "ring", _S.function_value(_e, "_f5"))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "hero", _S.function_value(_e, "_f9"))
	_S.define(_e, "scanline", _S.function_value(_e, "_f10"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f12")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "A"), "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "A"), "h"))), func(): return _S.prop(_S.prop(_S.prop(_S.read(_e, "A"), "mask"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "A"), "w")), _S.read(_e, "x"))))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "widthAt"), [_S.read(_e, "t"), _S.read(_e, "W")]))
	if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "w"), 0.05), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SNAP"), 0.14)))):
		return null
	_S.define(_e, "bottom", (_S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "TOP"), 0, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.binary("+", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM")), 0.06)]), 0.5), 0.5)])]) if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM")), 0.06)) else (_S.call_value(_S.read(_e, "lerp"), [0, _S.read(_e, "TOP"), _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SNAP")), 0.14)])]) if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "SNAP"))) else 0)))
	_S.define(_e, "hero", _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM")), 0.07))
	_S.define(_e, "hollow", _S.binary("*", 0.78, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "OPEN"), 0.16), _S.read(_e, "OPEN"), _S.read(_e, "t")])))
	_S.define(_e, "thin", _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "w"), 1.5), _S.binary("-", _S.read(_e, "W"), 1.5))])))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "y", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.read(_v3, "TOP")]))
	while _S.truth(_S.binary("<", _S.read(_v3, "y"), _S.read(_v3, "bottom"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "pulse", (1 if _S.truth(_S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.binary("-", _S.read(_v4, "y"), _S.read(_v4, "TOP")), 0.028), _S.binary("*", _S.read(_v4, "t"), 2.6)), 1), 1), 1), 0.09)) else 0))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "x", _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("*", _S.unary("-", _S.read(_v5, "w")), 1.35)]))
		while _S.truth(_S.binary("<=", _S.read(_v5, "x"), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("*", _S.read(_v5, "w"), 1.35)]))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "q", _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("+", _S.read(_v6, "x"), 0.5)]), _S.read(_v6, "w")))
			if _S.truth(_S.binary(">", _S.read(_v6, "q"), 1.35)):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			if _S.truth(_S.read(_v6, "hero")):
				var _v7 = _S.scope(_v6)
				_S.invoke(_S.read(_v7, "p"), "dot", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "q"), 0.55)) else (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "q"), 0.8)) else (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v7, "q"), 1)) else _S.prop(_S.read(_v7, "C"), 4)))), (1 if _S.truth(_S.binary("<", _S.read(_v7, "q"), 1)) else _S.binary("/", _S.binary("-", 1.35, _S.read(_v7, "q")), 0.35))])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary("<", _S.read(_v6, "w"), 2.4)):
				var _v8 = _S.scope(_v6)
				_S.invoke(_S.read(_v8, "p"), "dot", [_S.read(_v8, "x"), _S.read(_v8, "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.binary("<", _S.read(_v8, "q"), 0.7)) else _S.prop(_S.read(_v8, "C"), 6)), (1 if _S.truth(_S.binary("<", _S.read(_v8, "q"), 1)) else _S.binary("/", _S.binary("-", 1.35, _S.read(_v8, "q")), 0.35))])
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "x", 1, "+=", true)
				continue
			_S.define(_v6, "strand", 0)
			var _v9 = _S.scope(_v6)
			_S.define(_v9, "s", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "s"), 5)):
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v9, "x"), 0.5), _S.read(_v9, "w")), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v9, "rand"), [_S.prop(_S.read(_v9, "o"), "seed"), _S.read(_v9, "s")]), 0.5), 1.3)), _S.binary("*", 0.06, _S.invoke(_S.read(_v9, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v9, "t"), _S.binary("+", 1.5, _S.read(_v9, "s"))), _S.binary("*", _S.read(_v9, "s"), 2))])))]), 0.05)):
					_S.write(_v9, "strand", 1, "=", false)
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "s", 1, "+=", true)
			if _S.truth(_S.binary("<", _S.read(_v6, "q"), _S.read(_v6, "hollow"))):
				_S.invoke(_S.read(_v6, "p"), "blend", [_S.binary("+", _S.read(_v6, "x"), 0.5), _S.binary("+", _S.read(_v6, "y"), 0.5), (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.logical("||", _S.read(_v6, "strand"), func(): return _S.read(_v6, "pulse"))) else _S.prop(_S.read(_v6, "C"), 5)), _S.call_value(_S.read(_v6, "clamp"), [_S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", 0.12, _S.binary("*", _S.binary("*", 0.3, _S.read(_v6, "q")), _S.read(_v6, "q"))), _S.binary("*", 0.3, _S.read(_v6, "strand"))), _S.binary("*", 0.25, _S.read(_v6, "pulse"))), _S.binary("*", 0.7, _S.read(_v6, "thin")))])])
			else:
				if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.78)):
					var _v10 = _S.scope(_v6)
					_S.define(_v10, "lvl", _S.invoke(_S.read(_v10, "Math"), "max", [0, _S.binary("-", _S.binary("-", (0 if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.22)) else (1 if _S.truth(_S.binary("<", _S.read(_v10, "q"), 0.45)) else 2)), _S.read(_v10, "pulse")), _S.read(_v10, "strand"))]))
					_S.invoke(_S.read(_v10, "p"), "px", [_S.read(_v10, "x"), _S.read(_v10, "y"), (_S.read(_v10, "WHITE") if _S.truth(_S.binary("===", _S.read(_v10, "lvl"), 0)) else _S.prop(_S.read(_v10, "C"), _S.binary("-", 7, _S.read(_v10, "lvl"))))])
				else:
					if _S.truth(_S.binary("<", _S.read(_v6, "q"), 0.96)):
						_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.read(_v6, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v6, "q"), 0.86), func(): return _S.binary("<", _S.read(_v6, "q"), 0.93))) else _S.prop(_S.read(_v6, "C"), 6))])
					else:
						_S.invoke(_S.read(_v6, "p"), "dot", [_S.read(_v6, "x"), _S.read(_v6, "y"), (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v6, "q"), 1.1)) else _S.prop(_S.read(_v6, "C"), 4)), _S.binary("/", _S.binary("-", 1.35, _S.read(_v6, "q")), 0.39)])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "x", 1, "+=", true)
		if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v4, "y"), 7), 0)):
			var _v11 = _S.scope(_v4)
			_S.define(_v11, "r", _S.invoke(_S.read(_v11, "Math"), "min", [_S.binary("+", _S.read(_v11, "w"), 8), _S.binary("+", _S.binary("-", _S.read(_v11, "y"), _S.read(_v11, "TOP")), 2)]))
			if _S.truth(_S.binary("<", _S.read(_v11, "hollow"), 0.4)):
				_S.invoke(_S.read(_v11, "p"), "glow", [0, _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "Math"), "min", [_S.binary("+", _S.binary("*", _S.read(_v11, "w"), 2.6), 6), _S.binary("+", _S.binary("-", _S.read(_v11, "y"), _S.read(_v11, "TOP")), 2)]), _S.prop(_S.read(_v11, "C"), 4), (0.55 if _S.truth(_S.read(_v11, "hero")) else 0.32)])
			else:
				for _v12 in _S.array([_S.unary("-", 1), 1]):
					var _v13 = _S.scope(_v11)
					_S.define(_v13, "s", _v12)
					_S.invoke(_S.read(_v13, "p"), "glow", [_S.binary("*", _S.read(_v13, "s"), _S.binary("+", _S.read(_v13, "w"), 3)), _S.read(_v13, "y"), _S.read(_v13, "r"), _S.prop(_S.read(_v13, "C"), 4), 0.24])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "y", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "near", _S.arg(_args, 1))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "widthAt"), [_S.read(_e, "t"), _S.read(_e, "W")]))
	for _v14 in _S.array(_S.read(_e, "rings")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "r", _v14)
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "k", _S.binary("/", _S.binary("-", _S.read(_v16, "t"), _S.prop(_S.read(_v16, "r"), "t0")), 0.5))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v16, "k"), 0), func(): return _S.binary(">=", _S.read(_v16, "k"), 1))):
			continue
		_S.define(_v16, "y", _S.call_value(_S.read(_v16, "lerp"), [_S.binary("+", _S.read(_v16, "TOP"), 6), _S.unary("-", 1), _S.invoke(_S.read(_v16, "ease"), "inQuad", [_S.read(_v16, "k")])]))
		_S.define(_v16, "rx", _S.binary("+", _S.binary("*", _S.read(_v16, "w"), 1.18), 1))
		_S.define(_v16, "c", (_S.read(_v16, "WHITE") if _S.truth(_S.binary("<", _S.read(_v16, "k"), 0.25)) else _S.prop(_S.read(_v16, "C"), 6)))
		_S.call_value(_S.read(_v16, "band"), [_S.read(_v16, "p"), 0, _S.read(_v16, "y"), _S.read(_v16, "rx"), _S.binary("/", 2.6, _S.read(_v16, "rx")), 1.5, 1, [_S.prop(_S.read(_v16, "C"), 3), _S.prop(_S.read(_v16, "C"), 5), _S.read(_v16, "c"), _S.read(_v16, "WHITE")], _S.function_value(_v16, "_f6")])
		if _S.truth(_S.read(_v16, "near")):
			_S.invoke(_S.read(_v16, "p"), "glow", [0, _S.read(_v16, "y"), _S.binary("+", _S.read(_v16, "rx"), 6), _S.prop(_S.read(_v16, "C"), 5), 0.25])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "near"))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "near", _S.arg(_args, 1))
	_S.define(_e, "on", (_S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "SLAM"), _S.read(_e, "t")]), 0.5) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM"))) else _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "SNAP"), _S.binary("+", _S.read(_e, "SNAP"), 0.5), _S.read(_e, "t")]))))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "near")), func(): return _S.binary(">", _S.read(_e, "on"), 0.01))):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "rx", _S.binary("+", _S.binary("*", _S.read(_v17, "W"), 1.9), (0 if _S.truth(_S.binary("<", _S.read(_v17, "t"), _S.read(_v17, "SLAM"))) else _S.binary("*", 2, _S.invoke(_S.read(_v17, "Math"), "sin", [_S.binary("*", _S.read(_v17, "t"), 6)])))))
		_S.define(_v17, "ry", 4)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "y", _S.unary("-", 4))
		while _S.truth(_S.binary("<=", _S.read(_v18, "y"), 4)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "x", _S.invoke(_S.read(_v19, "Math"), "floor", [_S.unary("-", _S.read(_v19, "rx"))]))
			while _S.truth(_S.binary("<=", _S.read(_v19, "x"), _S.invoke(_S.read(_v19, "Math"), "ceil", [_S.read(_v19, "rx")]))):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "d", _S.invoke(_S.read(_v20, "Math"), "hypot", [_S.binary("/", _S.binary("+", _S.read(_v20, "x"), 0.5), _S.read(_v20, "rx")), _S.binary("/", _S.binary("+", _S.read(_v20, "y"), 0.5), _S.read(_v20, "ry"))]))
				if _S.truth(_S.binary(">", _S.read(_v20, "d"), 1)):
					_v19 = _S.iteration(_v19)
					_S.write(_v19, "x", 1, "+=", true)
					continue
				_S.invoke(_S.read(_v20, "p"), "dot", [_S.read(_v20, "x"), _S.read(_v20, "y"), (_S.prop(_S.read(_v20, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v20, "d"), 0.35)) else (_S.prop(_S.read(_v20, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v20, "d"), 0.6)) else (_S.prop(_S.read(_v20, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v20, "d"), 0.85)) else _S.prop(_S.read(_v20, "C"), 4)))), _S.binary("*", _S.read(_v20, "on"), _S.call_value(_S.read(_v20, "clamp"), [_S.binary("*", _S.binary("-", 1.05, _S.read(_v20, "d")), 2.4)]))])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "x", 1, "+=", true)
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "y", 1, "+=", true)
		for _v21 in _S.array([_S.binary("*", _S.unary("-", _S.read(_v17, "rx")), 0.6), 0, _S.binary("*", _S.read(_v17, "rx"), 0.6)]):
			var _v22 = _S.scope(_v17)
			_S.define(_v22, "x", _v21)
			_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "x"), _S.unary("-", 1), _S.binary("*", _S.read(_v22, "rx"), 1.3), _S.prop(_S.read(_v22, "C"), 4), _S.binary("*", 0.3, _S.read(_v22, "on"))])
	_S.define(_e, "keep", _S.function_value(_e, "_f8"))
	for _v23 in _S.array(_S.read(_e, "rings")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "r", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "r"), "t0")), 0.5), 0.35))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v25, "k"), 0), func(): return _S.binary("<", _S.read(_v25, "k"), 1))):
			_S.call_value(_S.read(_v25, "band"), [_S.read(_v25, "p"), 0, 0, _S.binary("*", _S.read(_v25, "W"), _S.binary("+", 1.2, _S.binary("*", 1.3, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "k")])))), 0.16, 1.5, _S.binary("-", 1, _S.read(_v25, "k")), [_S.prop(_S.read(_v25, "C"), 3), _S.prop(_S.read(_v25, "C"), 4), _S.prop(_S.read(_v25, "C"), 5), _S.prop(_S.read(_v25, "C"), 6)], _S.read(_v25, "keep")])
	for _v26 in _S.array([[0, 1], [0.08, 0.65]]):
		var _v27 = _S.scope(_e)
		var _v28 = _v26
		_S.define(_v27, "d", _S.prop(_v28, 0))
		_S.define(_v27, "s", _S.prop(_v28, 1))
		var _v29 = _S.scope(_v27)
		_S.define(_v29, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v29, "t"), _S.read(_v29, "SLAM")), _S.read(_v29, "d")), 0.55))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v29, "k"), 0), func(): return _S.binary("<", _S.read(_v29, "k"), 1))):
			_S.call_value(_S.read(_v29, "band"), [_S.read(_v29, "p"), 0, 0.5, _S.binary("*", _S.binary("*", 92, _S.read(_v29, "s")), _S.invoke(_S.read(_v29, "ease"), "outCubic", [_S.read(_v29, "k")])), 0.16, _S.invoke(_S.read(_v29, "Math"), "max", [1, _S.binary("*", 5, _S.binary("-", 1, _S.read(_v29, "k")))]), _S.binary("-", 1.15, _S.read(_v29, "k")), [_S.prop(_S.read(_v29, "C"), 3), _S.prop(_S.read(_v29, "C"), 5), _S.prop(_S.read(_v29, "C"), 6), _S.read(_v29, "WHITE")], _S.read(_v29, "keep"), _S.binary("<", _S.read(_v29, "k"), 0.25)])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SNAP")), 0.45))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 10, _S.binary("*", 26, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.16, _S.binary("+", _S.binary("*", 2, _S.binary("-", 1, _S.read(_e, "k"))), 0.5), _S.binary("-", 1.1, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.read(_e, "keep"), _S.binary("<", _S.read(_e, "k"), 0.3)])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "near"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SCAN0"), 0.2)))):
		return null
	_S.define(_e, "blink", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 24)]))
	for _v30 in _S.array(_S.read(_e, "body")):
		var _v31 = _S.scope(_e)
		_S.define(_v31, "b", _v30)
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "a", _S.binary("-", _S.read(_v32, "t"), _S.prop(_S.read(_v32, "b"), "ts")))
		if _S.truth(_S.binary("<", _S.read(_v32, "a"), 0)):
			var _v33 = _S.scope(_v32)
			if _S.truth(_S.logical("&&", _S.prop(_S.read(_v33, "b"), "edge"), func(): return _S.binary("<", _S.call_value(_S.read(_v33, "rand"), [_S.prop(_S.read(_v33, "b"), "x"), _S.prop(_S.read(_v33, "b"), "y"), _S.read(_v33, "blink")]), 0.6))):
				_S.invoke(_S.read(_v33, "p"), "dot", [_S.prop(_S.read(_v33, "b"), "x"), _S.prop(_S.read(_v33, "b"), "y"), _S.prop(_S.read(_v33, "C"), 1), _S.binary("*", 0.8, _S.call_value(_S.read(_v33, "smooth"), [_S.binary("-", _S.read(_v33, "SCAN0"), 0.25), _S.binary("-", _S.read(_v33, "SCAN0"), 0.05), _S.read(_v33, "t")]))])
			continue
		_S.define(_v32, "k", _S.binary("/", _S.read(_v32, "a"), _S.read(_v32, "COOL")))
		_S.define(_v32, "dx", ((_S.unary("-", 1) if _S.truth(_S.binary("<", _S.prop(_S.read(_v32, "b"), "j"), 0.15)) else 1) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v32, "a"), 0.06), func(): return _S.binary("<", _S.prop(_S.read(_v32, "b"), "j"), 0.3))) else 0))
		_S.invoke(_S.read(_v32, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v32, "b"), "x"), _S.read(_v32, "dx")), _S.prop(_S.read(_v32, "b"), "y"), (_S.read(_v32, "WHITE") if _S.truth(_S.binary("<", _S.read(_v32, "k"), 0.18)) else (_S.call_value(_S.read(_v32, "mix"), [_S.prop(_S.read(_v32, "b"), "c"), _S.prop(_S.read(_v32, "C"), 6), 0.72]) if _S.truth(_S.binary("<", _S.read(_v32, "k"), 0.45)) else (_S.call_value(_S.read(_v32, "mix"), [_S.prop(_S.read(_v32, "b"), "c"), _S.prop(_S.read(_v32, "C"), 5), 0.38]) if _S.truth(_S.binary("<", _S.read(_v32, "k"), 0.75)) else _S.prop(_S.read(_v32, "b"), "c"))))])
		if _S.truth(_S.binary("<", _S.read(_v32, "k"), 0.5)):
			_S.invoke(_S.read(_v32, "p"), "light", [_S.binary("+", _S.prop(_S.read(_v32, "b"), "x"), _S.read(_v32, "dx")), _S.prop(_S.read(_v32, "b"), "y"), _S.prop(_S.read(_v32, "C"), 5), _S.binary("*", 0.22, _S.binary("-", 1, _S.binary("/", _S.read(_v32, "k"), 0.5)))])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SCAN0")), func(): return _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SCAN1")))):
		return null
	_S.define(_e, "y", _S.invoke(_S.read(_e, "Math"), "floor", [_S.call_value(_S.read(_e, "scanY"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "A"), "y")])]))
	_S.define(_e, "w", _S.binary("*", _S.call_value(_S.read(_e, "widthAt"), [_S.read(_e, "t"), _S.read(_e, "W")]), 1.5))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "rows"), "get", [_S.read(_e, "y")]))
	var _v34 = _S.scope(_e)
	_S.define(_v34, "x", _S.invoke(_S.read(_v34, "Math"), "floor", [_S.unary("-", _S.read(_v34, "w"))]))
	while _S.truth(_S.binary("<=", _S.read(_v34, "x"), _S.invoke(_S.read(_v34, "Math"), "ceil", [_S.read(_v34, "w")]))):
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "inside", _S.logical("&&", _S.logical("&&", _S.read(_v35, "r"), func(): return _S.binary(">=", _S.read(_v35, "x"), _S.prop(_S.read(_v35, "r"), 0))), func(): return _S.binary("<=", _S.read(_v35, "x"), _S.prop(_S.read(_v35, "r"), 1))))
		_S.invoke(_S.read(_v35, "p"), "dot", [_S.read(_v35, "x"), _S.read(_v35, "y"), (_S.read(_v35, "WHITE") if _S.truth(_S.read(_v35, "inside")) else _S.prop(_S.read(_v35, "C"), 6)), (1 if _S.truth(_S.read(_v35, "inside")) else _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v35, "Math"), "abs", [_S.binary("+", _S.read(_v35, "x"), 0.5)]), _S.binary("+", _S.read(_v35, "w"), 1))))])
		_v34 = _S.iteration(_v34)
		_S.write(_v34, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glowLine", [_S.unary("-", _S.read(_e, "w")), _S.read(_e, "y"), _S.read(_e, "w"), _S.read(_e, "y"), 5, _S.prop(_S.read(_e, "C"), 5), 0.5])
	if _S.truth(_S.read(_e, "r")):
		for _v36 in _S.array(_S.read(_e, "r")):
			var _v37 = _S.scope(_e)
			_S.define(_v37, "x", _v36)
			_S.call_value(_S.read(_v37, "sparkle"), [_S.read(_v37, "p"), _S.binary("+", _S.read(_v37, "x"), 0.5), _S.read(_v37, "y"), 2, _S.prop(_S.read(_v37, "C"), 6), _S.prop(_S.read(_v37, "C"), 5), 0.3])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SLAM"), 0.04))):
		var _v38 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.8])):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "a", _S.invoke(_S.read(_v39, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v39, "Math"), "PI")), 0.95), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v39, "Math"), "PI")), 0.05)]))
			_S.define(_v39, "D", _S.invoke(_S.read(_v39, "R"), "range", [30, 64]))
			_S.define(_v39, "T", _S.invoke(_S.read(_v39, "R"), "range", [0.18, 0.28]))
			_S.define(_v39, "v", _S.binary("/", _S.binary("*", _S.read(_v39, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v39, "Math"), "exp", [_S.binary("*", 3, _S.read(_v39, "T"))]), 1)))
			_S.define(_v39, "x", _S.binary("*", _S.invoke(_S.read(_v39, "Math"), "cos", [_S.read(_v39, "a")]), _S.read(_v39, "D")))
			_S.define(_v39, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v39, "Math"), "sin", [_S.read(_v39, "a")]), _S.read(_v39, "D")), 0.8), 2))
			_S.define(_v39, "l", _S.logical("||", _S.invoke(_S.read(_v39, "Math"), "hypot", [_S.read(_v39, "x"), _S.binary("+", _S.read(_v39, "y"), 2)]), func(): return 1))
			_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "STREAK"), _S.read(_v39, "x"), _S.read(_v39, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v39, "x")), _S.read(_v39, "l")), _S.read(_v39, "v")), _S.binary("*", _S.binary("/", _S.unary("-", _S.binary("+", _S.read(_v39, "y"), 2)), _S.read(_v39, "l")), _S.read(_v39, "v")), _S.read(_v39, "T"), (_S.prop(_S.read(_v39, "C"), 6) if _S.truth(_S.invoke(_S.read(_v39, "R"), "chance", [0.5])) else _S.prop(_S.read(_v39, "C"), 5))])
		if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.12])):
			var _v40 = _S.scope(_v38)
			_S.define(_v40, "s", _S.invoke(_S.read(_v40, "R"), "sign", []))
			_S.invoke(_S.read(_v40, "ps"), "spawn", [_S.prop(_S.read(_v40, "P"), "VAPOUR"), _S.binary("*", _S.read(_v40, "s"), _S.invoke(_S.read(_v40, "R"), "range", [30, 56])), _S.unary("-", _S.invoke(_S.read(_v40, "R"), "range", [0, 2])), _S.binary("*", _S.unary("-", _S.read(_v40, "s")), _S.invoke(_S.read(_v40, "R"), "range", [40, 70])), _S.unary("-", _S.invoke(_S.read(_v40, "R"), "range", [0, 4])), _S.invoke(_S.read(_v40, "R"), "range", [0.3, 0.45]), _S.prop(_S.read(_v40, "C"), 5), _S.invoke(_S.read(_v40, "R"), "range", [2, 3])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.unary("!", _S.read(_e, "slammed")))):
		var _v41 = _S.scope(_e)
		_S.write(_v41, "slammed", true, "=", false)
		_S.invoke(_S.read(_v41, "lights"), "add", [0, _S.unary("-", 40), 120, _S.prop(_S.read(_v41, "C"), 4), 1, 0.55])
		_S.invoke(_S.read(_v41, "lights"), "add", [0, _S.unary("-", 10), 44, _S.read(_v41, "WHITE"), 0.9, 0.14])
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v42, "i"), 34)):
			var _v43 = _S.scope(_v42)
			_S.define(_v43, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v43, "Math"), "PI")), 2), _S.binary("*", _S.invoke(_S.read(_v43, "R"), "sign", []), _S.invoke(_S.read(_v43, "R"), "range", [0.35, 1.45]))))
			_S.define(_v43, "sp", _S.invoke(_S.read(_v43, "R"), "range", [110, 270]))
			_S.invoke(_S.read(_v43, "ps"), "spawn", [_S.prop(_S.read(_v43, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", _S.read(_v43, "W")), _S.read(_v43, "W")]), 0.6), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "cos", [_S.read(_v43, "a")]), _S.read(_v43, "sp")), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "sin", [_S.read(_v43, "a")]), _S.read(_v43, "sp")), _S.invoke(_S.read(_v43, "R"), "range", [0.25, 0.75])])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
		var _v44 = _S.scope(_v41)
		_S.define(_v44, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v44, "i"), 18)):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "s", _S.invoke(_S.read(_v45, "R"), "sign", []))
			_S.invoke(_S.read(_v45, "ps"), "spawn", [_S.prop(_S.read(_v45, "P"), "VAPOUR"), _S.binary("*", _S.read(_v45, "s"), _S.invoke(_S.read(_v45, "R"), "range", [4, 18])), _S.unary("-", _S.invoke(_S.read(_v45, "R"), "range", [0, 4])), _S.binary("*", _S.read(_v45, "s"), _S.invoke(_S.read(_v45, "R"), "range", [40, 150])), _S.unary("-", _S.invoke(_S.read(_v45, "R"), "range", [2, 18])), _S.invoke(_S.read(_v45, "R"), "range", [0.5, 0.95]), (_S.prop(_S.read(_v45, "C"), 6) if _S.truth(_S.invoke(_S.read(_v45, "R"), "chance", [0.6])) else _S.prop(_S.read(_v45, "C"), 5)), _S.invoke(_S.read(_v45, "R"), "range", [3, 6])])
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "i", 1, "+=", true)
		var _v46 = _S.scope(_v41)
		_S.define(_v46, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v46, "i"), 10)):
			_S.invoke(_S.read(_v46, "ps"), "spawn", [_S.prop(_S.read(_v46, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", _S.read(_v46, "W")), _S.read(_v46, "W")]), 1.3), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [2, 40])), _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [10, 40])), _S.invoke(_S.read(_v46, "R"), "range", [0.4, 0.8]), (_S.read(_v46, "WHITE") if _S.truth(_S.invoke(_S.read(_v46, "R"), "chance", [0.5])) else _S.prop(_S.read(_v46, "C"), 6)), _S.invoke(_S.read(_v46, "R"), "range", [1, 2.2])])
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "slammed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLOSE")))):
		var _v47 = _S.scope(_e)
		if _S.truth(_S.binary(">=", _S.read(_v47, "t"), _S.read(_v47, "nextRing"))):
			_S.last([_S.invoke(_S.read(_v47, "rings"), "push", [_S.merge([{"t0": _S.read(_v47, "nextRing")}])]), _S.write(_v47, "nextRing", 0.17, "+=", false)])
		_S.define(_v47, "w", _S.call_value(_S.read(_v47, "widthAt"), [_S.read(_v47, "t"), _S.read(_v47, "W")]))
		if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])):
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v47, "w")), _S.binary("+", _S.read(_v47, "TOP"), _S.invoke(_S.read(_v47, "R"), "range", [9, 36])), 0, _S.invoke(_S.read(_v47, "R"), "range", [60, 110]), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.45]), (_S.read(_v47, "WHITE") if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])) else _S.prop(_S.read(_v47, "C"), 6))])
		if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.18])):
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v47, "R"), "sign", []), _S.read(_v47, "w")), _S.invoke(_S.read(_v47, "R"), "range", [0.8, 1.3])), _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [4, 70])), 0, _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [5, 20])), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v47, "C"), 6), _S.invoke(_S.read(_v47, "R"), "range", [0.6, 1.8])])
		if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.1])):
			var _v48 = _S.scope(_v47)
			_S.define(_v48, "s", _S.invoke(_S.read(_v48, "R"), "sign", []))
			_S.invoke(_S.read(_v48, "ps"), "spawn", [_S.prop(_S.read(_v48, "P"), "VAPOUR"), _S.binary("*", _S.read(_v48, "s"), _S.invoke(_S.read(_v48, "R"), "range", [8, 16])), _S.unary("-", _S.invoke(_S.read(_v48, "R"), "range", [0, 3])), _S.binary("*", _S.read(_v48, "s"), _S.invoke(_S.read(_v48, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v48, "R"), "range", [2, 8])), _S.invoke(_S.read(_v48, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v48, "C"), 5), _S.invoke(_S.read(_v48, "R"), "range", [2.5, 4])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SCAN0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SCAN1")))):
		var _v49 = _S.scope(_e)
		_S.define(_v49, "y", _S.invoke(_S.read(_v49, "Math"), "floor", [_S.call_value(_S.read(_v49, "scanY"), [_S.read(_v49, "t"), _S.prop(_S.read(_v49, "A"), "y")])]))
		if _S.truth(_S.binary("!==", _S.read(_v49, "y"), _S.read(_v49, "lastRow"))):
			var _v50 = _S.scope(_v49)
			_S.write(_v50, "lastRow", _S.read(_v50, "y"), "=", false)
			_S.define(_v50, "r", _S.invoke(_S.read(_v50, "rows"), "get", [_S.read(_v50, "y")]))
			if _S.truth(_S.logical("&&", _S.read(_v50, "r"), func(): return _S.invoke(_S.read(_v50, "R"), "chance", [0.7]))):
				for _v51 in _S.array([[_S.prop(_S.read(_v50, "r"), 0), _S.unary("-", 1)], [_S.binary("+", _S.prop(_S.read(_v50, "r"), 1), 1), 1]]):
					var _v52 = _S.scope(_v50)
					var _v53 = _v51
					_S.define(_v52, "x", _S.prop(_v53, 0))
					_S.define(_v52, "s", _S.prop(_v53, 1))
					if _S.truth(_S.invoke(_S.read(_v52, "R"), "chance", [0.6])):
						_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "MOTE"), _S.read(_v52, "x"), _S.read(_v52, "y"), _S.binary("*", _S.read(_v52, "s"), _S.invoke(_S.read(_v52, "R"), "range", [40, 90])), _S.invoke(_S.read(_v52, "R"), "range", [_S.unary("-", 20), 10]), _S.invoke(_S.read(_v52, "R"), "range", [0.15, 0.3]), (_S.read(_v52, "WHITE") if _S.truth(_S.invoke(_S.read(_v52, "R"), "chance", [0.5])) else _S.prop(_S.read(_v52, "C"), 6)), 0.6])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE")), func(): return _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt")), _S.read(_e, "DONE")))):
		var _v54 = _S.scope(_e)
		var _v55 = _S.scope(_v54)
		_S.define(_v55, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v55, "i"), 6)):
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "b", _S.prop(_S.read(_v56, "body"), _S.invoke(_S.read(_v56, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v56, "R"), "next", []), _S.prop(_S.read(_v56, "body"), "length"))])))
			_S.invoke(_S.read(_v56, "ps"), "spawn", [_S.prop(_S.read(_v56, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v56, "b"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v56, "b"), "y"), 0.5), _S.invoke(_S.read(_v56, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v56, "R"), "range", [6, 20])), _S.invoke(_S.read(_v56, "R"), "range", [0.4, 0.8]), (_S.read(_v56, "WHITE") if _S.truth(_S.invoke(_S.read(_v56, "R"), "chance", [0.5])) else _S.prop(_S.read(_v56, "C"), 6)), _S.invoke(_S.read(_v56, "R"), "range", [1, 2])])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")), func(): return _S.unary("!", _S.read(_e, "snapped")))):
		var _v57 = _S.scope(_e)
		_S.write(_v57, "snapped", true, "=", false)
		_S.invoke(_S.read(_v57, "lights"), "add", [0, _S.unary("-", 1), 32, _S.prop(_S.read(_v57, "C"), 4), 0.5, 0.25])
		_S.invoke(_S.read(_v57, "lights"), "add", [0, _S.unary("-", 1), 10, _S.read(_v57, "WHITE"), 0.5, 0.08])
		var _v58 = _S.scope(_v57)
		_S.define(_v58, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v58, "i"), 22)):
			var _v59 = _S.scope(_v58)
			_S.define(_v59, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v59, "Math"), "PI")), 2), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v59, "sp", _S.invoke(_S.read(_v59, "R"), "range", [90, 260]))
			_S.invoke(_S.read(_v59, "ps"), "spawn", [_S.prop(_S.read(_v59, "P"), "SPARK"), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 2), 2]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v59, "Math"), "cos", [_S.read(_v59, "a")]), _S.read(_v59, "sp")), _S.binary("*", _S.invoke(_S.read(_v59, "Math"), "sin", [_S.read(_v59, "a")]), _S.read(_v59, "sp")), _S.invoke(_S.read(_v59, "R"), "range", [0.2, 0.6])])
			_v58 = _S.iteration(_v58)
			_S.write(_v58, "i", 1, "+=", true)
		var _v60 = _S.scope(_v57)
		_S.define(_v60, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v60, "i"), 12)):
			_S.invoke(_S.read(_v60, "ps"), "spawn", [_S.prop(_S.read(_v60, "P"), "STAR"), _S.invoke(_S.read(_v60, "R"), "range", [_S.unary("-", 16), 16]), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [0, 46])), _S.invoke(_S.read(_v60, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [8, 26])), _S.invoke(_S.read(_v60, "R"), "range", [0.5, 0.9]), (_S.read(_v60, "WHITE") if _S.truth(_S.invoke(_S.read(_v60, "R"), "chance", [0.5])) else _S.prop(_S.read(_v60, "C"), 6)), _S.invoke(_S.read(_v60, "R"), "range", [0.6, 1.8])])
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "+=", true)
		var _v61 = _S.scope(_v57)
		_S.define(_v61, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v61, "i"), 18)):
			_S.invoke(_S.read(_v61, "ps"), "spawn", [(_S.prop(_S.read(_v61, "P"), "STAR") if _S.truth(_S.invoke(_S.read(_v61, "R"), "chance", [0.6])) else _S.prop(_S.read(_v61, "P"), "MOTE")), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v61, "R"), "range", [10, 100])), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v61, "R"), "range", [14, 40])), _S.invoke(_S.read(_v61, "R"), "range", [0.5, 0.75]), (_S.read(_v61, "WHITE") if _S.truth(_S.invoke(_S.read(_v61, "R"), "chance", [0.4])) else (_S.prop(_S.read(_v61, "C"), 6) if _S.truth(_S.invoke(_S.read(_v61, "R"), "chance", [0.5])) else _S.prop(_S.read(_v61, "C"), 5))), _S.invoke(_S.read(_v61, "R"), "range", [0.5, 1.4]), _S.invoke(_S.read(_v61, "R"), "range", [0, 0.25])])
			_v61 = _S.iteration(_v61)
			_S.write(_v61, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "floor"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), false])
	_S.call_value(_S.read(_e, "column"), [_S.read(_e, "p")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM"))):
		var _v62 = _S.scope(_e)
		_S.define(_v62, "a", _S.binary("*", _S.call_value(_S.read(_v62, "smooth"), [0, _S.binary("*", _S.read(_v62, "SLAM"), 0.8), _S.read(_v62, "t")]), 0.8))
		_S.define(_v62, "head", _S.call_value(_S.read(_v62, "lerp"), [_S.read(_v62, "TOP"), 0, _S.invoke(_S.read(_v62, "ease"), "outCubic", [_S.call_value(_S.read(_v62, "clamp"), [_S.binary("/", _S.read(_v62, "t"), _S.binary("*", _S.read(_v62, "SLAM"), 0.6))])])]))
		var _v63 = _S.scope(_v62)
		_S.define(_v63, "y", _S.read(_v63, "TOP"))
		while _S.truth(_S.binary("<", _S.read(_v63, "y"), _S.read(_v63, "head"))):
			_S.invoke(_S.read(_v63, "p"), "dot", [0, _S.read(_v63, "y"), (_S.prop(_S.read(_v63, "C"), 6) if _S.truth(_S.binary("===", _S.binary("&", _S.read(_v63, "y"), 1), 0)) else _S.prop(_S.read(_v63, "C"), 5)), _S.binary("*", _S.read(_v63, "a"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.binary("/", _S.binary("-", _S.read(_v63, "y"), _S.read(_v63, "TOP")), _S.unary("-", _S.read(_v63, "TOP"))))))])
			_v63 = _S.iteration(_v63)
			_S.write(_v63, "y", 1, "+=", true)
		_S.invoke(_S.read(_v62, "p"), "glow", [0, _S.read(_v62, "head"), 10, _S.prop(_S.read(_v62, "C"), 5), _S.binary("*", 0.5, _S.read(_v62, "a"))])
		_S.define(_v62, "rx", _S.call_value(_S.read(_v62, "lerp"), [34, 12, _S.invoke(_S.read(_v62, "ease"), "outCubic", [_S.binary("/", _S.read(_v62, "t"), _S.read(_v62, "SLAM"))])]))
		_S.define(_v62, "k", _S.call_value(_S.read(_v62, "smooth"), [0, 0.15, _S.read(_v62, "t")]))
		var _v64 = _S.scope(_v62)
		_S.define(_v64, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v64, "i"), 48)):
			var _v65 = _S.scope(_v64)
			_S.define(_v65, "g", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v65, "i"), 48), _S.read(_v65, "TAU")), _S.binary("*", _S.read(_v65, "t"), 3)))
			if _S.truth(_S.binary("%", _S.invoke(_S.read(_v65, "Math"), "floor", [_S.binary("/", _S.read(_v65, "i"), 4)]), 2)):
				_v64 = _S.iteration(_v64)
				_S.write(_v64, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v65, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v65, "Math"), "cos", [_S.read(_v65, "g")]), _S.read(_v65, "rx")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v65, "Math"), "sin", [_S.read(_v65, "g")]), _S.read(_v65, "rx")), 0.16), (_S.read(_v65, "WHITE") if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v65, "i"), 4), 0)) else _S.prop(_S.read(_v65, "C"), 5)), _S.read(_v65, "k")])
			_v64 = _S.iteration(_v64)
			_S.write(_v64, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "hero"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "scanline"), [_S.read(_e, "p")])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), true])
	_S.call_value(_S.read(_e, "floor"), [_S.read(_e, "p"), true])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DONE"), 0.3)))):
		_S.invoke(_S.read(_e, "p"), "outline", [_S.prop(_S.read(_e, "A"), "mask"), _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "y"), _S.prop(_S.read(_e, "C"), 6), _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "DONE")), 0.3))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "SLAM"), 0.16)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), 0, _S.unary("-", 2), _S.binary("*", 12, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM")), 0.16))), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.6])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE"))) else 0)

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.read(_e, "y0"), 2), 1, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SCAN0")), _S.binary("-", _S.read(_e, "SCAN1"), _S.read(_e, "SCAN0")))])])])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "SCAN0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "SCAN1"), _S.read(_e, "SCAN0")), _S.invoke(_S.read(_e, "Math"), "acos", [_S.binary("-", 1, _S.binary("*", 2, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("+", _S.read(_e, "y"), 0.5), _S.binary("-", _S.read(_e, "y0"), 2)), _S.binary("-", 3, _S.read(_e, "y0")))])))])), _S.prop(_S.read(_e, "Math"), "PI")))
