@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/blink-out.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "shades", _S.import_value("fx/arcane/_lib.js", "shades"))
	_S.define(_e, "squeezed", _S.import_value("fx/arcane/_lib.js", "squeezed"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "OUT", 0.32)
	_S.define(_e, "SQUEEZE", 0.12)
	_S.define(_e, "COLLAPSE", 0.08)
	_S.define(_e, "POP", _S.binary("+", _S.binary("+", _S.read(_e, "OUT"), _S.read(_e, "SQUEEZE")), _S.read(_e, "COLLAPSE")))
	_S.define(_e, "meta", _S.merge([{"name": "Blink out"}, {"desc": "The caster crackles with gathering light, flashes white, squeezes into a line of light that collapses and pops away in sparks."}, {"tags": ["arcane", "blink", "teleport", "vanish", "movement", "magic", "one-shot"]}, {"size": [136, 96]}, {"origin": [68, 80]}, {"duration": 1.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "IN", _S.merge([{"turn": 1}, {"crouch": 4}, {"fx": _S.unary("-", 2)}, {"fy": _S.unary("-", 25)}, {"bx": 2}, {"by": _S.unary("-", 25)}, {"armsFront": true}, {"ffx": 0}, {"fbx": 2}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.36), _S.read(_e, "READY")], [_S.unary("-", 0.1), _S.read(_e, "IN")], [0.2, _S.merge([_S.read(_e, "IN"), {"crouch": 5}])], [0.32, _S.merge([_S.read(_e, "IN"), {"crouch": 0}]), "snap"], [1.6, _S.merge([_S.read(_e, "IN"), {"crouch": 0}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f8"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "shades"), [_S.read(_e, "A")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "mx", _S.binary("+", _S.prop(_S.read(_e, "A"), "x"), _S.binary("/", _S.prop(_S.read(_e, "A"), "w"), 2)))
	_S.define(_e, "my", _S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.binary("*", _S.prop(_S.read(_e, "A"), "h"), 0.55)))
	_S.define(_e, "COLS", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)])
	_S.define(_e, "inside", _S.function_value(_e, "_f2"))
	_S.define(_e, "t", 0)
	_S.define(_e, "out", false)
	_S.define(_e, "popped", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "A"), "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "A"), "h"))), func(): return _S.prop(_S.prop(_S.prop(_S.read(_e, "A"), "mask"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "A"), "w")), _S.read(_e, "x"))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OUT"), 0.04)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")]))
		_S.define(_v0, "D", _S.invoke(_S.read(_v0, "R"), "range", [22, 44]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.12, 0.18]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.define(_v0, "x", _S.binary("+", _S.read(_v0, "mx"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")]), _S.read(_v0, "D"))))
		_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v0, "my"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), _S.read(_v0, "D")))]))
		_S.define(_v0, "l", _S.logical("||", _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.binary("-", _S.read(_v0, "x"), _S.read(_v0, "mx")), _S.binary("-", _S.read(_v0, "y"), _S.read(_v0, "my"))]), func(): return 1))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.read(_v0, "x"), _S.read(_v0, "y"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "mx"), _S.read(_v0, "x")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "my"), _S.read(_v0, "y")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "out")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OUT")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "out", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.binary("-", _S.read(_v1, "my"), 6), 54, _S.prop(_S.read(_v1, "C"), 5), 0.9, 0.3])
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.read(_v1, "my"), 26, _S.read(_v1, "WHITE"), 0.8, 0.1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "popped", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "mx"), _S.binary("-", _S.read(_v2, "my"), 6), 58, _S.prop(_S.read(_v2, "C"), 5), 0.9, 0.35])
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "mx"), _S.read(_v2, "my"), 24, _S.read(_v2, "WHITE"), 0.9, 0.08])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 110)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "y", _S.binary("+", _S.prop(_S.read(_v4, "A"), "y"), _S.invoke(_S.read(_v4, "R"), "range", [2, _S.binary("-", _S.prop(_S.read(_v4, "A"), "h"), 2)])))
			_S.define(_v4, "s", _S.invoke(_S.read(_v4, "R"), "sign", []))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "EMBER"), _S.binary("+", _S.read(_v4, "mx"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 1), 1])), _S.read(_v4, "y"), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [25, 105])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 70), 10]), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 0.95]), _S.invoke(_S.read(_v4, "R"), "pick", [_S.read(_v4, "COLS")]), (2 if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.3])) else 1)])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v5 = _S.scope(_v2)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 18)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [80, 240]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.read(_v6, "mx"), _S.read(_v6, "my"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 40), _S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.5])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v2)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 14)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
			_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [20, 110]))
			_S.invoke(_S.read(_v8, "ps"), "spawn", [(_S.prop(_S.read(_v8, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v8, "i"), 2)) else _S.prop(_S.read(_v8, "P"), "MOTE")), _S.read(_v8, "mx"), _S.read(_v8, "my"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 0.8), 20), _S.invoke(_S.read(_v8, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v8, "R"), "pick", [[_S.read(_v8, "WHITE"), _S.prop(_S.read(_v8, "C"), 6), _S.prop(_S.read(_v8, "C"), 5)]]), _S.invoke(_S.read(_v8, "R"), "range", [0.8, 1.8])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.6)))):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "k", _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v9, "t"), _S.read(_v9, "POP")), 0.6))))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "y"), _S.prop(_S.read(_v10, "A"), "h"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "x"), _S.prop(_S.read(_v11, "A"), "w"))):
				if _S.truth(_S.prop(_S.read(_v11, "sh"), _S.binary("+", _S.binary("*", _S.read(_v11, "y"), _S.prop(_S.read(_v11, "A"), "w")), _S.read(_v11, "x")))):
					_S.invoke(_S.read(_v11, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v11, "A"), "x"), _S.read(_v11, "x")), _S.binary("+", _S.prop(_S.read(_v11, "A"), "y"), _S.read(_v11, "y")), (_S.prop(_S.read(_v11, "C"), 3) if _S.truth(_S.binary("===", _S.prop(_S.read(_v11, "sh"), _S.binary("+", _S.binary("*", _S.read(_v11, "y"), _S.prop(_S.read(_v11, "A"), "w")), _S.read(_v11, "x"))), 1)) else _S.prop(_S.read(_v11, "C"), 4)), _S.read(_v11, "k")])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "x", 1, "+=", true)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "y", 1, "+=", true)
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.2, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.function_value(_e, "_f5"), _S.binary("<", _S.read(_e, "k"), 0.25)])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.3))):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 26, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, (_S.binary("/", _S.read(_e, "t"), _S.read(_e, "OUT")) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))) else _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.3)]))))])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "k", _S.binary("/", _S.read(_v12, "t"), _S.read(_v12, "OUT")))
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "y"), _S.prop(_S.read(_v13, "A"), "h"))):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "x"), _S.prop(_S.read(_v14, "A"), "w"))):
				var _v15 = _S.scope(_v14)
				if _S.truth(_S.call_value(_S.read(_v15, "inside"), [_S.read(_v15, "x"), _S.read(_v15, "y")])):
					var _v16 = _S.scope(_v15)
					_S.invoke(_S.read(_v16, "p"), "light", [_S.binary("+", _S.prop(_S.read(_v16, "A"), "x"), _S.read(_v16, "x")), _S.binary("+", _S.prop(_S.read(_v16, "A"), "y"), _S.read(_v16, "y")), _S.prop(_S.read(_v16, "C"), 6), _S.binary("*", _S.binary("*", _S.read(_v16, "k"), _S.read(_v16, "k")), (0.3 if _S.truth(_S.binary("===", _S.prop(_S.read(_v16, "sh"), _S.binary("+", _S.binary("*", _S.read(_v16, "y"), _S.prop(_S.read(_v16, "A"), "w")), _S.read(_v16, "x"))), 1)) else 0.75))])
				else:
					if _S.truth(_S.logical("&&", _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v15, "inside"), [_S.binary("-", _S.read(_v15, "x"), 1), _S.read(_v15, "y")]), func(): return _S.call_value(_S.read(_v15, "inside"), [_S.binary("+", _S.read(_v15, "x"), 1), _S.read(_v15, "y")])), func(): return _S.call_value(_S.read(_v15, "inside"), [_S.read(_v15, "x"), _S.binary("-", _S.read(_v15, "y"), 1)])), func(): return _S.call_value(_S.read(_v15, "inside"), [_S.read(_v15, "x"), _S.binary("+", _S.read(_v15, "y"), 1)])), func(): return _S.binary("<", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.read(_v15, "f")]), _S.binary("+", 0.25, _S.binary("*", 0.65, _S.read(_v15, "k")))))):
						_S.invoke(_S.read(_v15, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v15, "A"), "x"), _S.read(_v15, "x")), _S.binary("+", _S.prop(_S.read(_v15, "A"), "y"), _S.read(_v15, "y")), (_S.read(_v15, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v15, "k"), 0.6), func(): return _S.binary("<", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "x"), _S.read(_v15, "y"), 7]), 0.5))) else _S.prop(_S.read(_v15, "C"), 6))])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "x", 1, "+=", true)
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "y", 1, "+=", true)
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.read(_v12, "mx"), _S.read(_v12, "my"), 30, _S.prop(_S.read(_v12, "C"), 5), _S.binary("*", 0.5, _S.read(_v12, "k"))])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.05))):
			var _v17 = _S.scope(_e)
			_S.call_value(_S.read(_v17, "squeezed"), [_S.read(_v17, "p"), _S.read(_v17, "A"), _S.read(_v17, "sh"), 1, _S.read(_v17, "WHITE"), _S.prop(_S.read(_v17, "C"), 6)])
			_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "mx"), _S.read(_v17, "my"), 40, _S.prop(_S.read(_v17, "C"), 5), 0.8])
		else:
			if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), _S.read(_e, "SQUEEZE")))):
				var _v18 = _S.scope(_e)
				_S.define(_v18, "q", _S.invoke(_S.read(_v18, "ease"), "inCubic", [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v18, "t"), _S.read(_v18, "OUT")), 0.05), _S.binary("-", _S.read(_v18, "SQUEEZE"), 0.05))]))
				_S.call_value(_S.read(_v18, "squeezed"), [_S.read(_v18, "p"), _S.read(_v18, "A"), _S.read(_v18, "sh"), _S.binary("-", 1, _S.read(_v18, "q")), _S.read(_v18, "WHITE"), _S.prop(_S.read(_v18, "C"), 6)])
				_S.invoke(_S.read(_v18, "p"), "glow", [_S.read(_v18, "mx"), _S.read(_v18, "my"), 34, _S.prop(_S.read(_v18, "C"), 5), 0.8])
			else:
				if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
					var _v19 = _S.scope(_e)
					_S.define(_v19, "q", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v19, "t"), _S.read(_v19, "OUT")), _S.read(_v19, "SQUEEZE")), _S.read(_v19, "COLLAPSE")))
					_S.define(_v19, "hh", _S.binary("*", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v19, "A"), "h"), 2), 2), _S.binary("-", 1, _S.invoke(_S.read(_v19, "ease"), "inQuad", [_S.read(_v19, "q")]))))
					var _v20 = _S.scope(_v19)
					_S.define(_v20, "y", _S.binary("-", _S.unary("-", _S.read(_v20, "hh")), 3))
					while _S.truth(_S.binary("<=", _S.read(_v20, "y"), _S.binary("+", _S.read(_v20, "hh"), 3))):
						_S.invoke(_S.read(_v20, "p"), "dot", [_S.read(_v20, "mx"), _S.binary("+", _S.read(_v20, "my"), _S.read(_v20, "y")), (_S.read(_v20, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "y")]), _S.read(_v20, "hh"))) else _S.prop(_S.read(_v20, "C"), 6)), (1 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.read(_v20, "y")]), _S.read(_v20, "hh"))) else 0.7)])
						_v20 = _S.iteration(_v20)
						_S.write(_v20, "y", 1, "+=", true)
					if _S.truth(_S.binary(">", _S.read(_v19, "hh"), 4)):
						var _v21 = _S.scope(_v19)
						_S.define(_v21, "y", _S.binary("*", _S.unary("-", _S.read(_v21, "hh")), 0.7))
						while _S.truth(_S.binary("<=", _S.read(_v21, "y"), _S.binary("*", _S.read(_v21, "hh"), 0.7))):
							_S.last([_S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("-", _S.read(_v21, "mx"), 1), _S.binary("+", _S.read(_v21, "my"), _S.read(_v21, "y")), _S.prop(_S.read(_v21, "C"), 5), 0.6]), _S.invoke(_S.read(_v21, "p"), "dot", [_S.binary("+", _S.read(_v21, "mx"), 1), _S.binary("+", _S.read(_v21, "my"), _S.read(_v21, "y")), _S.prop(_S.read(_v21, "C"), 5), 0.6])])
							_v21 = _S.iteration(_v21)
							_S.write(_v21, "y", 1, "+=", true)
					_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "mx"), _S.read(_v19, "my"), 30, _S.prop(_S.read(_v19, "C"), 5), 0.9])
					_S.invoke(_S.read(_v19, "p"), "glow", [_S.read(_v19, "mx"), _S.read(_v19, "my"), 8, _S.read(_v19, "WHITE"), 0.5])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.22)))):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "q", _S.binary("/", _S.binary("-", _S.read(_v22, "t"), _S.read(_v22, "POP")), 0.22))
		_S.call_value(_S.read(_v22, "flare"), [_S.read(_v22, "p"), _S.read(_v22, "mx"), _S.read(_v22, "my"), _S.binary("+", _S.binary("*", 22, _S.invoke(_S.read(_v22, "Math"), "pow", [_S.binary("-", 1, _S.read(_v22, "q")), 1.5])), 2), _S.binary("-", 1, _S.read(_v22, "q")), _S.read(_v22, "C")])
		if _S.truth(_S.binary("<", _S.read(_v22, "q"), 0.3)):
			_S.invoke(_S.read(_v22, "p"), "circle", [_S.read(_v22, "mx"), _S.read(_v22, "my"), _S.binary("+", _S.binary("*", 4, _S.binary("-", 1, _S.binary("/", _S.read(_v22, "q"), 0.3))), 1), _S.read(_v22, "WHITE")])
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.2, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.function_value(_e, "_f7"), _S.binary("<", _S.read(_e, "k"), 0.25)])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.3)))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.read(_e, "mx"), _S.binary("-", _S.read(_e, "my"), 1), 3, _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")), 0.3)))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))) else 0)
