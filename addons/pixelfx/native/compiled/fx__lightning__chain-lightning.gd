@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/chain-lightning.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "bowed", _S.import_value("fx/lightning/_lib.js", "bowed"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "trace", _S.import_value("fx/lightning/_lib.js", "trace"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "level", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Chain lightning"}, {"desc": "A bolt leaps from the caster's hand through three targets in turn; each flashes, sparks and grounds itself to the floor while the arcs between them flicker, then the chain snaps."}, {"tags": ["lightning", "electric", "chain", "spell", "combat", "directional", "one-shot"]}, {"size": [248, 104]}, {"origin": [40, 82]}, {"duration": 1.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "AIM", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}, {"crouch": 4}, {"lean": 4}, {"fx": 16}, {"fy": _S.unary("-", 16)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 23)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "BACK", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}, {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 5)}, {"fy": _S.unary("-", 32)}, {"bx": 8}, {"by": _S.unary("-", 24)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "zap", _S.function_value(_e, "_f10"))
	_S.define(_e, "act", _S.merge([{"targets": [_S.merge([{"x": 58}]), _S.merge([{"x": 104}]), _S.merge([{"x": 150}])]}, {"poses": [[_S.unary("-", 0.46), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}])], [_S.unary("-", 0.22), _S.read(_e, "BACK")], [0, _S.merge([_S.read(_e, "BACK"), {"crouch": 5}])], [0.04, _S.read(_e, "AIM"), "snap"], [0.7, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}])], [1.35, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}, {"fy": _S.unary("-", 18)}])], [1.8, _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}])]]}, {"hits": [_S.call_value(_S.read(_e, "zap"), [0, 0.05]), _S.call_value(_S.read(_e, "zap"), [1, 0.14]), _S.merge([_S.call_value(_S.read(_e, "zap"), [2, 0.23, 0.07]), {"shake": 0.14}, {"amp": 1}]), _S.merge([{"t": 1.35}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "HAND", [10, _S.unary("-", 16)])
	_S.define(_e, "HOPS", [[58, _S.unary("-", 22)], [104, _S.unary("-", 30)], [150, _S.unary("-", 19)]])
	_S.define(_e, "WIND", 0.12)
	_S.define(_e, "LEAP", 0.05)
	_S.define(_e, "GAP", 0.075)
	_S.define(_e, "HOLD", 0.78)
	_S.define(_e, "BREAK", 0.16)
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "on", _S.function_value(_e, "_f11"))
	_S.define(_e, "off", _S.function_value(_e, "_f12"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "on"), [_S.read(_e, "i")])))
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 0)):
		return 0
	_S.define(_e, "hum", (_S.logical("??", _S.prop([1, 0.55, 1], _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "a"), 30)])), func(): return 1) if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.1)) else _S.binary("+", 0.78, _S.binary("*", _S.binary("*", 0.22, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 61), _S.read(_e, "i"))])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 23), _S.binary("*", _S.read(_e, "i"), 2))])))))
	_S.define(_e, "b", _S.binary("-", _S.read(_e, "t"), _S.call_value(_S.read(_e, "off"), [_S.read(_e, "i")])))
	return (_S.read(_e, "hum") if _S.truth(_S.binary("<", _S.read(_e, "b"), 0)) else (_S.binary("*", _S.binary("*", _S.read(_e, "hum"), _S.binary("-", 1, _S.binary("/", _S.read(_e, "b"), _S.read(_e, "BREAK")))), (0.5 if _S.truth(_S.binary("===", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "b"), 60)]), 3), 1)) else 1)) if _S.truth(_S.binary("<", _S.read(_e, "b"), _S.read(_e, "BREAK"))) else 0))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "hot", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pts", _S.concat([[_S.read(_e, "HAND")], _S.array(_S.read(_e, "HOPS"))]))
	_S.define(_e, "hit", _S.invoke(_S.read(_e, "HOPS"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "popped", _S.invoke(_S.read(_e, "HOPS"), "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "ground", _S.invoke(_S.read(_e, "HOPS"), "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "shape", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return false

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return false

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v0 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v0, 0))
	return _S.binary("+", _S.read(_e, "x"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 5), 5]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "f", _S.arg(_args, 1))
	_S.define(_e, "salt", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), _S.binary("+", 31, _S.read(_e, "salt")), _S.read(_e, "i"), _S.read(_e, "f")]))
	var _v1 = _S.prop(_S.read(_e, "pts"), _S.read(_e, "i"))
	_S.define(_e, "x0", _S.prop(_v1, 0))
	_S.define(_e, "y0", _S.prop(_v1, 1))
	var _v2 = _S.prop(_S.read(_e, "pts"), _S.binary("+", _S.read(_e, "i"), 1))
	_S.define(_e, "x1", _S.prop(_v2, 0))
	_S.define(_e, "y1", _S.prop(_v2, 1))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	return _S.call_value(_S.read(_e, "bowed"), [_S.read(_e, "r"), _S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "x1"), _S.read(_e, "y1"), _S.binary("*", _S.unary("-", _S.read(_e, "L")), _S.invoke(_S.read(_e, "r"), "range", [0.05, 0.15])), 0.2, 0.08])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WIND")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 70, _S.read(_e, "dt"))]))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "d", _S.invoke(_S.read(_v3, "R"), "range", [10, 24]))
		_S.define(_v3, "T", _S.invoke(_S.read(_v3, "R"), "range", [0.06, 0.1]))
		_S.define(_v3, "v", _S.binary("/", _S.binary("*", _S.read(_v3, "d"), 3), _S.binary("-", _S.invoke(_S.read(_v3, "Math"), "exp", [_S.binary("*", 3, _S.read(_v3, "T"))]), 1)))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "STREAK"), _S.binary("+", _S.prop(_S.read(_v3, "HAND"), 0), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "d"))), _S.binary("+", _S.prop(_S.read(_v3, "HAND"), 1), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "d"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")])), _S.read(_v3, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")])), _S.read(_v3, "v")), _S.read(_v3, "T"), (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.5])) else _S.prop(_S.read(_v3, "C"), 5))])
	for _v4 in _S.array(_S.invoke(_S.read(_e, "HOPS"), "entries", [])):
		var _v5 = _S.scope(_e)
		var _v6 = _v4
		_S.define(_v5, "i", _S.prop(_v6, 0))
		var _v7 = _S.prop(_v6, 1)
		_S.define(_v5, "x", _S.prop(_v7, 0))
		_S.define(_v5, "y", _S.prop(_v7, 1))
		var _v8 = _S.scope(_v5)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v8, "hit"), _S.read(_v8, "i"))), func(): return _S.binary(">=", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "on"), [_S.read(_v8, "i")])))):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "hit"), _S.read(_v9, "i"), true, "=", false)
			var _v10 = _S.prop(_S.read(_v9, "pts"), _S.read(_v9, "i"))
			_S.define(_v9, "px", _S.prop(_v10, 0))
			_S.define(_v9, "py", _S.prop(_v10, 1))
			_S.define(_v9, "dir", _S.invoke(_S.read(_v9, "Math"), "atan2", [_S.binary("-", _S.read(_v9, "y"), _S.read(_v9, "py")), _S.binary("-", _S.read(_v9, "x"), _S.read(_v9, "px"))]))
			_S.invoke(_S.read(_v9, "lights"), "add", [_S.read(_v9, "x"), _S.read(_v9, "y"), 56, _S.prop(_S.read(_v9, "C"), 4), 0.85, 0.22])
			_S.invoke(_S.read(_v9, "lights"), "add", [_S.read(_v9, "x"), _S.read(_v9, "y"), 16, _S.read(_v9, "WHITE"), 0.7, 0.08])
			if _S.truth(_S.binary("===", _S.read(_v9, "i"), 0)):
				_S.invoke(_S.read(_v9, "lights"), "add", [_S.prop(_S.read(_v9, "HAND"), 0), _S.prop(_S.read(_v9, "HAND"), 1), 40, _S.prop(_S.read(_v9, "C"), 4), 0.6, 0.15])
			var _v11 = _S.scope(_v9)
			_S.define(_v11, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "j"), 18)):
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "a", (_S.binary("+", _S.read(_v12, "dir"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.1), 1.1])) if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.6])) else _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")])))
				_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [70, 230]))
				_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SPARK"), _S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), 40), _S.invoke(_S.read(_v12, "R"), "range", [0.15, 0.4])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "j", 1, "+=", true)
			var _v13 = _S.scope(_v9)
			_S.define(_v13, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "j"), 5)):
				_S.invoke(_S.read(_v13, "hot"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.binary("+", _S.read(_v13, "x"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v13, "y"), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 50), 50]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 60), 20]), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 0.9])])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "j", 1, "+=", true)
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.read(_v9, "x"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("-", _S.read(_v9, "y"), _S.invoke(_S.read(_v9, "R"), "range", [3, 7])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.4]), _S.prop(_S.read(_v9, "C"), 6), _S.invoke(_S.read(_v9, "R"), "range", [1.5, 2.5])])
			var _v14 = _S.scope(_v9)
			_S.define(_v14, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "j"), 2)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SMOKE"), _S.binary("+", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("+", _S.read(_v14, "y"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 2), 3])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [8, 16])), _S.invoke(_S.read(_v14, "R"), "range", [0.7, 1]), _S.call_value(_S.read(_v14, "mix"), [_S.read(_v14, "ASH"), _S.prop(_S.read(_v14, "C"), 2), 0.35]), _S.invoke(_S.read(_v14, "R"), "range", [2, 3.5]), _S.invoke(_S.read(_v14, "R"), "range", [0.1, 0.25])])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "j", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v8, "hit"), _S.read(_v8, "i")), func(): return _S.binary("<", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "off"), [_S.read(_v8, "i")])))):
			var _v15 = _S.scope(_v8)
			if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [_S.binary("*", 9, _S.read(_v15, "dt"))])):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "u", _S.invoke(_S.read(_v16, "R"), "next", []))
				var _v17 = _S.prop(_S.read(_v16, "pts"), _S.read(_v16, "i"))
				_S.define(_v16, "x0", _S.prop(_v17, 0))
				_S.define(_v16, "y0", _S.prop(_v17, 1))
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SPARK"), _S.call_value(_S.read(_v16, "lerp"), [_S.read(_v16, "x0"), _S.read(_v16, "x"), _S.read(_v16, "u")]), _S.binary("-", _S.call_value(_S.read(_v16, "lerp"), [_S.read(_v16, "y0"), _S.read(_v16, "y"), _S.read(_v16, "u")]), 2), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 60), 60]), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 90), 20]), _S.invoke(_S.read(_v16, "R"), "range", [0.1, 0.25])])
			if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [_S.binary("*", 7, _S.read(_v15, "dt"))])):
				_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.prop(_S.read(_v15, "ground"), _S.read(_v15, "i")), _S.unary("-", 1), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [40, 140])), _S.invoke(_S.read(_v15, "R"), "range", [0.12, 0.3])])
			if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [_S.binary("*", 2, _S.read(_v15, "dt"))])):
				_S.invoke(_S.read(_v15, "hot"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.binary("+", _S.read(_v15, "x"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.read(_v15, "y"), 3), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 30), 30]), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 30), 10]), _S.invoke(_S.read(_v15, "R"), "range", [0.5, 0.8])])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v8, "popped"), _S.read(_v8, "i"))), func(): return _S.binary(">=", _S.read(_v8, "t"), _S.binary("+", _S.call_value(_S.read(_v8, "off"), [_S.read(_v8, "i")]), _S.read(_v8, "BREAK"))))):
			var _v18 = _S.scope(_v8)
			_S.set_prop(_S.read(_v18, "popped"), _S.read(_v18, "i"), true, "=", false)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "j"), 7)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
				_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [40, 140]))
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), 30), _S.invoke(_S.read(_v20, "R"), "range", [0.12, 0.3])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "j", 1, "+=", true)
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SMOKE"), _S.read(_v18, "x"), _S.read(_v18, "y"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [10, 16])), _S.invoke(_S.read(_v18, "R"), "range", [0.55, 0.7]), _S.call_value(_S.read(_v18, "mix"), [_S.read(_v18, "ASH"), _S.prop(_S.read(_v18, "C"), 2), 0.35]), _S.invoke(_S.read(_v18, "R"), "range", [2.5, 3.5])])
			_S.invoke(_S.read(_v18, "lights"), "add", [_S.read(_v18, "x"), _S.read(_v18, "y"), 30, _S.prop(_S.read(_v18, "C"), 4), 0.5, 0.12])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "hot"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v21 in _S.array(_S.invoke(_S.read(_e, "HOPS"), "entries", [])):
		var _v22 = _S.scope(_e)
		var _v23 = _v21
		_S.define(_v22, "i", _S.prop(_v23, 0))
		var _v24 = _S.scope(_v22)
		_S.define(_v24, "a", _S.binary("-", _S.read(_v24, "t"), _S.call_value(_S.read(_v24, "on"), [_S.read(_v24, "i")])))
		if _S.truth(_S.binary("<", _S.read(_v24, "a"), 0)):
			continue
		_S.define(_v24, "T0", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "min", [1, _S.binary("/", _S.read(_v24, "a"), 0.2)]), _S.invoke(_S.read(_v24, "Math"), "pow", [_S.call_value(_S.read(_v24, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v24, "t"), _S.call_value(_S.read(_v24, "off"), [_S.read(_v24, "i")])), 0.7))]), 1.3])), 0.9))
		_S.call_value(_S.read(_v24, "scorch"), [_S.read(_v24, "p"), _S.prop(_S.read(_v24, "ground"), _S.read(_v24, "i")), 0, 7, _S.read(_v24, "T0"), _S.binary("-", 1, _S.call_value(_S.read(_v24, "smooth"), [1.35, 1.75, _S.read(_v24, "t")]))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.invoke(_S.read(_e, "hot"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.0001)]))
	_S.define(_e, "f2", _S.binary(">>", _S.read(_e, "f"), 1))
	_S.define(_e, "kh", (_S.binary("/", _S.read(_e, "t"), _S.read(_e, "WIND")) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "WIND"))) else _S.call_value(_S.read(_e, "level"), [0, _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "kh"), 0.02)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "r", _S.binary("*", _S.binary("+", _S.binary("+", 1.2, _S.binary("*", 1.6, _S.read(_v25, "kh"))), _S.binary("*", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.read(_v25, "t"), 53)]), 0.4)), _S.invoke(_S.read(_v25, "Math"), "min", [1, _S.binary("*", _S.read(_v25, "kh"), 1.5)])))
		_S.invoke(_S.read(_v25, "p"), "circle", [_S.prop(_S.read(_v25, "HAND"), 0), _S.prop(_S.read(_v25, "HAND"), 1), _S.binary("+", _S.read(_v25, "r"), 1.2), _S.prop(_S.read(_v25, "C"), 4)])
		_S.invoke(_S.read(_v25, "p"), "circle", [_S.prop(_S.read(_v25, "HAND"), 0), _S.prop(_S.read(_v25, "HAND"), 1), _S.read(_v25, "r"), _S.prop(_S.read(_v25, "C"), 6)])
		_S.invoke(_S.read(_v25, "p"), "circle", [_S.prop(_S.read(_v25, "HAND"), 0), _S.prop(_S.read(_v25, "HAND"), 1), _S.binary("*", _S.read(_v25, "r"), 0.5), _S.read(_v25, "WHITE")])
		_S.invoke(_S.read(_v25, "p"), "glow", [_S.prop(_S.read(_v25, "HAND"), 0), _S.prop(_S.read(_v25, "HAND"), 1), 18, _S.prop(_S.read(_v25, "C"), 4), _S.binary("*", 0.6, _S.read(_v25, "kh"))])
		if _S.truth(_S.binary(">", _S.read(_v25, "t"), _S.binary("*", _S.read(_v25, "WIND"), 0.5))):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "r2", _S.call_value(_S.read(_v26, "rng"), [_S.prop(_S.read(_v26, "o"), "seed"), 5, _S.read(_v26, "f")]))
			_S.define(_v26, "a", _S.invoke(_S.read(_v26, "r2"), "range", [0, _S.read(_v26, "TAU")]))
			_S.define(_v26, "d", _S.invoke(_S.read(_v26, "r2"), "range", [4, 8]))
			_S.call_value(_S.read(_v26, "crackle"), [_S.read(_v26, "p"), _S.call_value(_S.read(_v26, "zigzag"), [_S.read(_v26, "r2"), _S.prop(_S.read(_v26, "HAND"), 0), _S.prop(_S.read(_v26, "HAND"), 1), _S.binary("+", _S.prop(_S.read(_v26, "HAND"), 0), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "d"))), _S.binary("+", _S.prop(_S.read(_v26, "HAND"), 1), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")]), _S.read(_v26, "d"))), 0.4, 0.3]), _S.binary("*", 0.6, _S.read(_v26, "kh")), _S.read(_v26, "C"), 0.3])
	for _v27 in _S.array(_S.invoke(_S.read(_e, "HOPS"), "entries", [])):
		var _v28 = _S.scope(_e)
		var _v29 = _v27
		_S.define(_v28, "i", _S.prop(_v29, 0))
		var _v30 = _S.prop(_v29, 1)
		_S.define(_v28, "x", _S.prop(_v30, 0))
		_S.define(_v28, "y", _S.prop(_v30, 1))
		var _v31 = _S.scope(_v28)
		_S.define(_v31, "t0", _S.binary("+", _S.read(_v31, "WIND"), _S.binary("*", _S.read(_v31, "i"), _S.read(_v31, "GAP"))))
		var _v32 = _S.prop(_S.read(_v31, "pts"), _S.read(_v31, "i"))
		_S.define(_v31, "x0", _S.prop(_v32, 0))
		_S.define(_v31, "y0", _S.prop(_v32, 1))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v31, "t"), _S.read(_v31, "t0")), func(): return _S.binary("<", _S.read(_v31, "t"), _S.call_value(_S.read(_v31, "on"), [_S.read(_v31, "i")])))):
			var _v33 = _S.scope(_v31)
			_S.define(_v33, "u", _S.invoke(_S.read(_v33, "ease"), "outQuad", [_S.binary("/", _S.binary("-", _S.read(_v33, "t"), _S.read(_v33, "t0")), _S.read(_v33, "LEAP"))]))
			_S.define(_v33, "b", _S.call_value(_S.read(_v33, "shape"), [_S.read(_v33, "i"), _S.unary("-", 1)]))
			_S.define(_v33, "trunk", _S.merge([{"paths": [_S.prop(_S.prop(_S.read(_v33, "b"), "paths"), 0)]}]))
			_S.call_value(_S.read(_v33, "stroke"), [_S.read(_v33, "p"), _S.read(_v33, "trunk"), 1, _S.read(_v33, "C"), 0.75, _S.merge([{"upTo": _S.read(_v33, "u")}])])
			_S.define(_v33, "tp", _S.prop(_S.prop(_S.prop(_S.read(_v33, "b"), "paths"), 0), "pts"))
			var _v34 = _S.prop(_S.read(_v33, "tp"), _S.invoke(_S.read(_v33, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v33, "tp"), "length"), 1), _S.invoke(_S.read(_v33, "Math"), "floor", [_S.binary("*", _S.read(_v33, "u"), _S.binary("-", _S.prop(_S.read(_v33, "tp"), "length"), 1))])]))
			_S.define(_v33, "hx", _S.prop(_v34, 0))
			_S.define(_v33, "hy", _S.prop(_v34, 1))
			_S.invoke(_S.read(_v33, "p"), "circle", [_S.read(_v33, "hx"), _S.read(_v33, "hy"), 2, _S.read(_v33, "WHITE")])
			_S.invoke(_S.read(_v33, "p"), "glow", [_S.read(_v33, "hx"), _S.read(_v33, "hy"), 16, _S.prop(_S.read(_v33, "C"), 5), 0.7])
		_S.define(_v31, "k", _S.call_value(_S.read(_v31, "level"), [_S.read(_v31, "i"), _S.read(_v31, "t")]))
		if _S.truth(_S.binary(">", _S.read(_v31, "k"), 0)):
			var _v35 = _S.scope(_v31)
			_S.call_value(_S.read(_v35, "stroke"), [_S.read(_v35, "p"), _S.call_value(_S.read(_v35, "shape"), [_S.read(_v35, "i"), _S.read(_v35, "f2")]), _S.read(_v35, "k"), _S.read(_v35, "C"), 0.75])
		else:
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v31, "t"), _S.binary("+", _S.call_value(_S.read(_v31, "off"), [_S.read(_v31, "i")]), _S.read(_v31, "BREAK"))), func(): return _S.binary("<", _S.read(_v31, "t"), _S.binary("+", _S.binary("+", _S.call_value(_S.read(_v31, "off"), [_S.read(_v31, "i")]), _S.read(_v31, "BREAK")), 0.35)))):
				var _v36 = _S.scope(_v31)
				_S.define(_v36, "g", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v36, "t"), _S.call_value(_S.read(_v36, "off"), [_S.read(_v36, "i")])), _S.read(_v36, "BREAK")), 0.35)))
				_S.define(_v36, "b", _S.call_value(_S.read(_v36, "shape"), [_S.read(_v36, "i"), _S.invoke(_S.read(_v36, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.call_value(_S.read(_v36, "off"), [_S.read(_v36, "i")]), _S.read(_v36, "BREAK")), 15)])]))
				_S.call_value(_S.read(_v36, "trace"), [_S.read(_v36, "p"), _S.prop(_S.prop(_S.prop(_S.read(_v36, "b"), "paths"), 0), "pts"), (_S.prop(_S.read(_v36, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v36, "g"), 0.5)) else _S.prop(_S.read(_v36, "C"), 2)), _S.binary("*", _S.read(_v36, "g"), 0.9)])
		_S.define(_v31, "a", _S.binary("-", _S.read(_v31, "t"), _S.call_value(_S.read(_v31, "on"), [_S.read(_v31, "i")])))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v31, "a"), 0), func(): return _S.binary("<", _S.read(_v31, "a"), 0.09))):
			var _v37 = _S.scope(_v31)
			_S.define(_v37, "q", _S.binary("/", _S.read(_v37, "a"), 0.09))
			_S.invoke(_S.read(_v37, "p"), "circle", [_S.read(_v37, "x"), _S.read(_v37, "y"), _S.binary("+", _S.binary("*", 6, _S.binary("-", 1, _S.read(_v37, "q"))), 1.5), _S.prop(_S.read(_v37, "C"), 5)])
			_S.invoke(_S.read(_v37, "p"), "circle", [_S.read(_v37, "x"), _S.read(_v37, "y"), _S.binary("*", 5, _S.binary("-", 1, _S.read(_v37, "q"))), _S.read(_v37, "WHITE")])
			_S.call_value(_S.read(_v37, "sparkle"), [_S.read(_v37, "p"), _S.read(_v37, "x"), _S.read(_v37, "y"), _S.invoke(_S.read(_v37, "Math"), "round", [_S.binary("*", 10, _S.binary("-", 1, _S.read(_v37, "q")))]), _S.prop(_S.read(_v37, "C"), 6), _S.prop(_S.read(_v37, "C"), 4), 0.6])
		if _S.truth(_S.binary(">", _S.read(_v31, "k"), 0.05)):
			var _v38 = _S.scope(_v31)
			_S.define(_v38, "r", _S.binary("*", _S.binary("+", 2.6, _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v38, "t"), 47), _S.read(_v38, "i"))]), 0.7)), _S.read(_v38, "k")))
			_S.invoke(_S.read(_v38, "p"), "circle", [_S.read(_v38, "x"), _S.read(_v38, "y"), _S.binary("+", _S.read(_v38, "r"), 1.5), _S.prop(_S.read(_v38, "C"), 2)])
			_S.invoke(_S.read(_v38, "p"), "circle", [_S.read(_v38, "x"), _S.read(_v38, "y"), _S.binary("+", _S.read(_v38, "r"), 0.7), _S.prop(_S.read(_v38, "C"), 5)])
			_S.invoke(_S.read(_v38, "p"), "circle", [_S.read(_v38, "x"), _S.read(_v38, "y"), _S.binary("*", _S.read(_v38, "r"), 0.6), _S.read(_v38, "WHITE")])
			_S.invoke(_S.read(_v38, "p"), "glow", [_S.read(_v38, "x"), _S.read(_v38, "y"), 26, _S.prop(_S.read(_v38, "C"), 4), _S.binary("*", 0.6, _S.read(_v38, "k"))])
			_S.invoke(_S.read(_v38, "p"), "glow", [_S.read(_v38, "x"), _S.read(_v38, "y"), 8, _S.prop(_S.read(_v38, "C"), 6), _S.binary("*", 0.5, _S.read(_v38, "k"))])
			_S.define(_v38, "r2", _S.call_value(_S.read(_v38, "rng"), [_S.prop(_S.read(_v38, "o"), "seed"), 11, _S.read(_v38, "i"), _S.read(_v38, "f")]))
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v39, "j"), (2 if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v39, "t"), _S.call_value(_S.read(_v39, "on"), [_S.read(_v39, "i")])), 0.12)) else 1))):
				var _v40 = _S.scope(_v39)
				_S.define(_v40, "a0", _S.invoke(_S.read(_v40, "r2"), "range", [0, _S.read(_v40, "TAU")]))
				_S.define(_v40, "a1", _S.binary("+", _S.read(_v40, "a0"), _S.binary("*", _S.invoke(_S.read(_v40, "r2"), "sign", []), _S.invoke(_S.read(_v40, "r2"), "range", [0.5, 1]))))
				_S.define(_v40, "d0", _S.invoke(_S.read(_v40, "r2"), "range", [4, 6]))
				_S.define(_v40, "d1", _S.invoke(_S.read(_v40, "r2"), "range", [5, 8]))
				_S.call_value(_S.read(_v40, "crackle"), [_S.read(_v40, "p"), _S.call_value(_S.read(_v40, "zigzag"), [_S.read(_v40, "r2"), _S.binary("+", _S.read(_v40, "x"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a0")]), _S.read(_v40, "d0"))), _S.binary("+", _S.read(_v40, "y"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a0")]), _S.read(_v40, "d0"))), _S.binary("+", _S.read(_v40, "x"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a1")]), _S.read(_v40, "d1"))), _S.binary("+", _S.read(_v40, "y"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a1")]), _S.read(_v40, "d1"))), 0.35, 0]), _S.binary("*", _S.invoke(_S.read(_v40, "r2"), "range", [0.45, 0.7]), _S.read(_v40, "k")), _S.read(_v40, "C"), 0.25])
				_v39 = _S.iteration(_v39)
				_S.write(_v39, "j", 1, "+=", true)
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v38, "r2"), "next", []), _S.binary("*", 0.3, _S.read(_v38, "k")))):
				var _v41 = _S.scope(_v38)
				_S.define(_v41, "gx", _S.binary("+", _S.prop(_S.read(_v41, "ground"), _S.read(_v41, "i")), _S.invoke(_S.read(_v41, "r2"), "range", [_S.unary("-", 3), 3])))
				_S.call_value(_S.read(_v41, "crackle"), [_S.read(_v41, "p"), _S.call_value(_S.read(_v41, "zigzag"), [_S.read(_v41, "r2"), _S.binary("+", _S.read(_v41, "x"), _S.invoke(_S.read(_v41, "r2"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v41, "y"), 3), _S.read(_v41, "gx"), _S.unary("-", 0.5), 0.3, 0.35]), _S.binary("*", 0.75, _S.read(_v41, "k")), _S.read(_v41, "C"), 0.35])
				_S.invoke(_S.read(_v41, "p"), "glow", [_S.read(_v41, "gx"), _S.unary("-", 1), 12, _S.prop(_S.read(_v41, "C"), 5), _S.binary("*", 0.5, _S.read(_v41, "k"))])
				_S.invoke(_S.read(_v41, "p"), "px", [_S.read(_v41, "gx"), _S.unary("-", 1), _S.read(_v41, "WHITE")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "hot"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "at", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "stop", _S.coalesce(_S.arg(_args, 2), func(): return 0.03))
	return _S.merge([{"t": _S.read(_e, "t")}, {"at": _S.read(_e, "at")}, {"stop": _S.read(_e, "stop")}, {"push": 1.2}, {"straw": 6}, {"skin": "shock"}, {"shiver": 0.7}, {"y": _S.unary("-", 22)}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.binary("+", _S.binary("+", _S.read(_e, "WIND"), _S.binary("*", _S.read(_e, "i"), _S.read(_e, "GAP"))), _S.read(_e, "LEAP"))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "HOLD"), _S.binary("*", _S.read(_e, "i"), 0.05))
