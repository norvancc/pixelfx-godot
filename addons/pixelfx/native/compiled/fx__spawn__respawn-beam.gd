@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/respawn-beam.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "rimOf", _S.import_value("fx/spawn/_lib.js", "rimOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Respawn beam"}, {"desc": "A guide line drops, a pillar of light slams onto the spot, and a scan bar climbs from the feet writing the character back in row by row, white-hot lines cooling to its colors."}, {"tags": ["spawn", "respawn", "beam", "teleport", "scanline", "light", "one-shot"]}, {"size": [128, 150]}, {"origin": [64, 136]}, {"duration": 2.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#061e1b", "#0c3e36", "#136a5a", "#1f9c80", "#45d1a8", "#a8f5d8", "#ffffff"]}, {"width": 15}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SET", _S.merge([{"turn": 1}, {"crouch": 4}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 14)}, {"bx": 10}, {"by": _S.unary("-", 14)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[0, _S.read(_e, "SET")], [1.4, _S.read(_e, "SET")], [1.72, _S.merge([{"turn": 1.15}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 36)}, {"bx": 14}, {"by": _S.unary("-", 36)}, {"hy": _S.unary("-", 1)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [2.1, _S.read(_e, "READY")], [2.5, _S.read(_e, "READY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SLAM", 0.32)
	_S.define(_e, "WRITE0", _S.binary("+", _S.read(_e, "SLAM"), 0.08))
	_S.define(_e, "WRITE", 0.95)
	_S.define(_e, "DONE", _S.binary("+", _S.read(_e, "WRITE0"), _S.read(_e, "WRITE")))
	_S.define(_e, "LIFT", _S.binary("+", _S.read(_e, "DONE"), 0.12))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f15"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "BW", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "rim", _S.call_value(_S.read(_e, "rimOf"), [_S.read(_e, "body")]))
	_S.define(_e, "top", _S.prop(_S.read(_e, "body"), "y"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "TOPY", _S.unary("-", 136))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "strands", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "scanY", _S.function_value(_e, "_f3"))
	_S.define(_e, "rowT", _S.function_value(_e, "_f4"))
	_S.define(_e, "t", 0)
	_S.define(_e, "slammed", false)
	_S.define(_e, "finished", false)
	_S.define(_e, "DROP", 0.07)
	_S.define(_e, "width", _S.function_value(_e, "_f5"))
	_S.define(_e, "bottom", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"o": _S.binary("-", _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 1]), 1.6), 0.8)}, {"f": _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 2]), 3))}, {"w": _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 3])}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "WRITE0")), _S.read(_e, "WRITE"))])])), _S.binary("+", _S.read(_e, "H"), 2))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "my", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "WRITE0"), _S.binary("/", _S.binary("*", _S.read(_e, "WRITE"), _S.invoke(_S.read(_e, "Math"), "acos", [_S.binary("-", 1, _S.binary("*", 2, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "my")), _S.binary("+", _S.read(_e, "H"), 2))])))])), _S.prop(_S.read(_e, "Math"), "PI")))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SLAM"), _S.read(_e, "DROP")))) else (_S.binary("*", _S.read(_e, "BW"), 0.6) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM"))) else (_S.binary("*", _S.binary("*", _S.read(_e, "BW"), _S.binary("+", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM"))), 10)])))), _S.binary("+", 0.92, _S.binary("*", 0.08, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 40)])))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT"))) else _S.binary("*", _S.read(_e, "BW"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), 0.3)])]))))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LIFT"))) else _S.binary("*", _S.unary("-", 150), _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LIFT")), 0.4)])])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "s", _S.invoke(_S.read(_v0, "R"), "sign", []))
		_S.define(_v0, "D", _S.invoke(_S.read(_v0, "R"), "range", [18, 40]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.15, 0.25]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.binary("*", _S.read(_v0, "s"), _S.read(_v0, "D")), _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [0, 3])), _S.binary("*", _S.unary("-", _S.read(_v0, "s")), _S.read(_v0, "v")), 0, _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 5) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 4))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "slammed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SLAM")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "slammed", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.unary("-", 28), 64, _S.prop(_S.read(_v1, "C"), 4), 1, 0.5])
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.unary("-", 52), 80, _S.prop(_S.read(_v1, "C"), 5), 1.1, 0.4])
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.unary("-", 9), 24, _S.read(_v1, "WHITE"), 0.9, 0.12])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 40)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "s", _S.invoke(_S.read(_v3, "R"), "sign", []))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [60, 135]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), _S.binary("*", _S.read(_v3, "s"), _S.invoke(_S.read(_v3, "R"), "range", [0, 6])), _S.unary("-", 1), _S.binary("*", _S.read(_v3, "s"), _S.read(_v3, "sp")), _S.unary("-", _S.invoke(_S.read(_v3, "R"), "range", [20, 140])), _S.invoke(_S.read(_v3, "R"), "range", [0.25, 0.7])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 12)):
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "STAR"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", _S.read(_v4, "BW")), _S.read(_v4, "BW")]), _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [2, 40])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [20, 70])), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 1]), _S.invoke(_S.read(_v4, "R"), "pick", [[_S.read(_v4, "WHITE"), _S.prop(_S.read(_v4, "C"), 5)]]), _S.invoke(_S.read(_v4, "R"), "range", [0.8, 1.8])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v5 = _S.scope(_v1)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 8)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "s", _S.invoke(_S.read(_v6, "R"), "sign", []))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "DUST"), _S.binary("*", _S.read(_v6, "s"), _S.invoke(_S.read(_v6, "R"), "range", [4, 10])), _S.unary("-", 1), _S.binary("*", _S.read(_v6, "s"), _S.invoke(_S.read(_v6, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [3, 10])), _S.invoke(_S.read(_v6, "R"), "range", [0.4, 0.7]), _S.prop(_S.read(_v6, "C"), 2), _S.invoke(_S.read(_v6, "R"), "range", [1.5, 3])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "WRITE0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "DONE"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.45]))):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "y", _S.call_value(_S.read(_v7, "scanY"), [_S.read(_v7, "t")]))
		_S.define(_v7, "s", _S.invoke(_S.read(_v7, "R"), "sign", []))
		_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.binary("*", _S.read(_v7, "s"), _S.invoke(_S.read(_v7, "R"), "range", [6, 11])), _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "s"), _S.invoke(_S.read(_v7, "R"), "range", [40, 140])), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 60), 10]), _S.invoke(_S.read(_v7, "R"), "range", [0.15, 0.35])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LIFT"), 0.2))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1.3), 1.3]), _S.read(_e, "BW")), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 90])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [30, 90])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]]), (_S.invoke(_S.read(_e, "R"), "range", [1, 1.8]) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 0.6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "finished")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "finished", true, "=", false)
		_S.invoke(_S.read(_v8, "lights"), "add", [0, _S.binary("+", _S.read(_v8, "top"), _S.binary("/", _S.read(_v8, "H"), 2)), 40, _S.prop(_S.read(_v8, "C"), 5), 0.7, 0.3])
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 14)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "c", _S.invoke(_S.read(_v10, "R"), "pick", [_S.read(_v10, "rim")]))
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.prop(_S.read(_v10, "c"), "x"), _S.prop(_S.read(_v10, "c"), "y"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [10, 50])), _S.invoke(_S.read(_v10, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v10, "R"), "pick", [[_S.read(_v10, "WHITE"), _S.prop(_S.read(_v10, "C"), 5)]]), _S.invoke(_S.read(_v10, "R"), "range", [0.8, 1.8])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), [_S.read(_e, "t")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "bottom"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM"))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "k", _S.binary("*", _S.call_value(_S.read(_v11, "smooth"), [0, _S.binary("*", _S.read(_v11, "SLAM"), 0.7), _S.read(_v11, "t")]), _S.binary("-", 1, _S.binary("*", _S.call_value(_S.read(_v11, "smooth"), [_S.binary("-", _S.read(_v11, "SLAM"), _S.read(_v11, "DROP")), _S.read(_v11, "SLAM"), _S.read(_v11, "t")]), 0.5))))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "y", _S.read(_v12, "TOPY"))
		while _S.truth(_S.binary("<", _S.read(_v12, "y"), _S.unary("-", 1))):
			_S.invoke(_S.read(_v12, "p"), "dot", [0, _S.binary("+", _S.read(_v12, "y"), _S.binary("%", _S.binary("|", _S.binary("*", _S.read(_v12, "t"), 60), 0), 2)), _S.prop(_S.read(_v12, "C"), 5), _S.binary("*", _S.read(_v12, "k"), _S.binary("+", 0.35, _S.binary("*", 0.65, _S.binary("/", _S.binary("-", _S.read(_v12, "y"), _S.read(_v12, "TOPY")), _S.unary("-", _S.read(_v12, "TOPY"))))))])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "y", 2, "+=", false)
		_S.call_value(_S.read(_v11, "band"), [_S.read(_v11, "p"), 0, 0, _S.binary("-", 10, _S.binary("*", 4, _S.read(_v11, "k"))), 0.2, 1, _S.read(_v11, "k"), _S.read(_v11, "C"), _S.function_value(_v11, "_f9")])
		_S.invoke(_S.read(_v11, "p"), "glow", [0, _S.unary("-", 2), 16, _S.prop(_S.read(_v11, "C"), 4), _S.binary("*", 0.4, _S.read(_v11, "k"))])
	if _S.truth(_S.binary("<=", _S.read(_e, "w"), 0.2)):
		return null
	_S.define(_e, "yEnd", (_S.binary("+", _S.read(_e, "TOPY"), _S.binary("*", _S.binary("-", _S.unary("-", 1), _S.read(_e, "TOPY")), _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM")), _S.read(_e, "DROP")), _S.read(_e, "DROP"))])]))) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SLAM"))) else _S.binary("+", _S.unary("-", 1), _S.read(_e, "b"))))
	_S.define(_e, "writing", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "WRITE0"), 0.05), _S.binary("+", _S.read(_e, "WRITE0"), 0.1), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "DONE"), _S.read(_e, "LIFT"), _S.read(_e, "t")]))))
	_S.define(_e, "fill", _S.binary("-", 0.2, _S.binary("*", 0.1, _S.read(_e, "writing"))))
	var _v13 = _S.scope(_e)
	_S.define(_v13, "y", _S.read(_v13, "TOPY"))
	while _S.truth(_S.binary("<=", _S.read(_v13, "y"), _S.read(_v13, "yEnd"))):
		var _v14 = _S.scope(_v13)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "x", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.unary("-", _S.read(_v15, "w"))]))
		while _S.truth(_S.binary("<=", _S.read(_v15, "x"), _S.invoke(_S.read(_v15, "Math"), "ceil", [_S.read(_v15, "w")]))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "q", _S.invoke(_S.read(_v16, "Math"), "abs", [_S.binary("/", _S.binary("+", _S.read(_v16, "x"), 0.5), _S.read(_v16, "w"))]))
			if _S.truth(_S.binary(">", _S.read(_v16, "q"), 1)):
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
				continue
			if _S.truth(_S.binary(">", _S.read(_v16, "q"), 0.86)):
				var _v17 = _S.scope(_v16)
				_S.invoke(_S.read(_v17, "p"), "dot", [_S.read(_v17, "x"), _S.read(_v17, "y"), (_S.read(_v17, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v17, "q"), 0.94), func(): return _S.binary("<", _S.call_value(_S.read(_v17, "rand"), [_S.read(_v17, "x"), _S.read(_v17, "y"), _S.binary("|", _S.binary("*", _S.read(_v17, "t"), 30), 0)]), 0.7))) else _S.prop(_S.read(_v17, "C"), 5)), 1])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
				continue
			_S.define(_v16, "core", _S.binary("-", 1, _S.call_value(_S.read(_v16, "smooth"), [_S.binary("+", _S.read(_v16, "SLAM"), 0.06), _S.binary("+", _S.read(_v16, "WRITE0"), 0.08), _S.read(_v16, "t")])))
			if _S.truth(_S.binary("<", _S.read(_v16, "q"), _S.binary("*", 0.7, _S.read(_v16, "core")))):
				var _v18 = _S.scope(_v16)
				_S.define(_v18, "hot", _S.binary("<", _S.read(_v18, "q"), _S.binary("*", 0.35, _S.read(_v18, "core"))))
				for _v19 in _S.array(_S.read(_v18, "strands")):
					var _v20 = _S.scope(_v18)
					_S.define(_v20, "s", _v19)
					if _S.truth(_S.binary("<", _S.invoke(_S.read(_v20, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v20, "x"), 0.5), _S.read(_v20, "w")), _S.binary("*", _S.prop(_S.read(_v20, "s"), "o"), 0.6)), _S.binary("*", 0.05, _S.invoke(_S.read(_v20, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v20, "t"), _S.prop(_S.read(_v20, "s"), "f")), 3), _S.binary("*", _S.read(_v20, "y"), 0.05))])))]), 0.04)):
						_S.write(_v20, "hot", false, "=", false)
				_S.invoke(_S.read(_v18, "p"), "px", [_S.read(_v18, "x"), _S.read(_v18, "y"), (_S.read(_v18, "WHITE") if _S.truth(_S.read(_v18, "hot")) else (_S.prop(_S.read(_v18, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v18, "q"), _S.binary("*", 0.5, _S.read(_v18, "core")))) else _S.prop(_S.read(_v18, "C"), 5)))])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "x", 1, "+=", true)
				continue
			_S.define(_v16, "a", _S.binary("*", _S.read(_v16, "fill"), _S.binary("-", 1.2, _S.read(_v16, "q"))))
			_S.define(_v16, "c", _S.prop(_S.read(_v16, "C"), 4))
			for _v21 in _S.array(_S.read(_v16, "strands")):
				var _v22 = _S.scope(_v16)
				_S.define(_v22, "s", _v21)
				if _S.truth(_S.binary("<", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v22, "x"), 0.5), _S.read(_v22, "w")), _S.prop(_S.read(_v22, "s"), "o")), _S.binary("*", 0.06, _S.invoke(_S.read(_v22, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v22, "t"), _S.prop(_S.read(_v22, "s"), "f")), _S.binary("*", _S.prop(_S.read(_v22, "s"), "o"), 7))])))]), _S.binary("+", 0.045, _S.binary("*", 0.03, _S.prop(_S.read(_v22, "s"), "w"))))):
					_S.last([_S.write(_v22, "a", _S.binary("-", 0.55, _S.binary("*", 0.25, _S.read(_v22, "writing"))), "=", false), _S.write(_v22, "c", _S.prop(_S.read(_v22, "C"), 5), "=", false)])
			_S.invoke(_S.read(_v16, "p"), "blend", [_S.read(_v16, "x"), _S.read(_v16, "y"), _S.read(_v16, "c"), _S.read(_v16, "a")])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "x", 1, "+=", true)
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "y", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "yEnd"), _S.binary("+", _S.read(_e, "TOPY"), 24))):
		for _v23 in _S.array([_S.unary("-", 1), 1]):
			var _v24 = _S.scope(_e)
			_S.define(_v24, "s", _v23)
			_S.invoke(_S.read(_v24, "p"), "glowLine", [_S.binary("*", _S.read(_v24, "s"), _S.read(_v24, "w")), _S.binary("+", _S.read(_v24, "TOPY"), 24), _S.binary("*", _S.read(_v24, "s"), _S.read(_v24, "w")), _S.read(_v24, "yEnd"), 6, _S.prop(_S.read(_v24, "C"), 4), 0.3])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 5), _S.binary("+", _S.binary("*", _S.read(_e, "w"), 1.5), 6), _S.prop(_S.read(_e, "C"), 5), 0.45])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "w", _S.call_value(_S.read(_e, "width"), [_S.read(_e, "t")]))
	_S.define(_e, "sk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SLAM")), 0.45))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "sk"), 0), func(): return _S.binary("<", _S.read(_e, "sk"), 1))):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "rx", _S.binary("+", 14, _S.binary("*", 18, _S.invoke(_S.read(_v25, "ease"), "outCubic", [_S.read(_v25, "sk")]))))
		_S.define(_v25, "ry", _S.binary("+", 3, _S.binary("*", 1.5, _S.read(_v25, "sk"))))
		_S.invoke(_S.read(_v25, "p"), "ellipse", [0, 0.5, _S.read(_v25, "rx"), _S.read(_v25, "ry"), _S.function_value(_v25, "_f11"), _S.function_value(_v25, "_f12")])
		_S.invoke(_S.read(_v25, "p"), "glow", [0, _S.unary("-", 2), _S.binary("*", _S.read(_v25, "rx"), 1.3), _S.prop(_S.read(_v25, "C"), 5), _S.binary("*", 0.5, _S.binary("-", 1, _S.read(_v25, "sk")))])
	var _v26 = _S.scope(_e)
	_S.define(_v26, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v26, "i"), 2)):
		var _v27 = _S.scope(_v26)
		_S.define(_v27, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v27, "t"), _S.read(_v27, "SLAM")), _S.binary("*", 0.08, _S.read(_v27, "i"))), 0.5))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v27, "k"), 0), func(): return _S.binary("<", _S.read(_v27, "k"), 1))):
			_S.call_value(_S.read(_v27, "band"), [_S.read(_v27, "p"), 0, 0, _S.binary("+", 8, _S.binary("*", (22 if _S.truth(_S.read(_v27, "i")) else 34), _S.invoke(_S.read(_v27, "ease"), "outCubic", [_S.read(_v27, "k")]))), 0.2, _S.invoke(_S.read(_v27, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_v27, "k")))]), _S.binary("-", 1.15, _S.read(_v27, "k")), _S.read(_v27, "C"), _S.function_value(_v27, "_f13"), _S.binary("<", _S.read(_v27, "k"), 0.15)])
		_v26 = _S.iteration(_v26)
		_S.write(_v26, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "WRITE0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DONE"), 0.05)))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "sy", _S.call_value(_S.read(_v28, "scanY"), [_S.read(_v28, "t")]))
		_S.define(_v28, "fr", _S.invoke(_S.read(_v28, "Math"), "floor", [_S.binary("*", _S.read(_v28, "t"), 30)]))
		for _v29 in _S.array(_S.prop(_S.read(_v28, "body"), "list")):
			var _v30 = _S.scope(_v28)
			_S.define(_v30, "b", _v29)
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "t0", _S.call_value(_S.read(_v31, "rowT"), [_S.prop(_S.read(_v31, "b"), "my")]))
			_S.define(_v31, "age", _S.binary("-", _S.read(_v31, "t"), _S.read(_v31, "t0")))
			if _S.truth(_S.binary("<", _S.read(_v31, "age"), 0)):
				continue
			_S.define(_v31, "glitch", ((_S.unary("-", 2) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v31, "rand"), [_S.prop(_S.read(_v31, "b"), "my"), _S.read(_v31, "fr"), 4]), 0.5)) else 2) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v31, "age"), 0.12), func(): return _S.binary("<", _S.call_value(_S.read(_v31, "rand"), [_S.prop(_S.read(_v31, "b"), "my"), _S.read(_v31, "fr"), 9]), 0.3))) else 0))
			_S.define(_v31, "c", (_S.read(_v31, "WHITE") if _S.truth(_S.binary("<", _S.read(_v31, "age"), 0.05)) else (_S.prop(_S.read(_v31, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v31, "age"), 0.14)) else (_S.call_value(_S.read(_v31, "mix"), [_S.prop(_S.read(_v31, "b"), "c"), _S.prop(_S.read(_v31, "C"), 5), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v31, "age"), 0.14), 0.16)))]) if _S.truth(_S.binary("<", _S.read(_v31, "age"), 0.3)) else _S.prop(_S.read(_v31, "b"), "c")))))
			_S.invoke(_S.read(_v31, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v31, "b"), "x"), _S.read(_v31, "glitch")), _S.prop(_S.read(_v31, "b"), "y"), (_S.prop(_S.read(_v31, "C"), 6) if _S.truth(_S.logical("&&", _S.prop(_S.read(_v31, "b"), "edge"), func(): return _S.binary("<", _S.read(_v31, "age"), 0.3))) else _S.read(_v31, "c"))])
		if _S.truth(_S.binary("<", _S.read(_v28, "t"), _S.read(_v28, "DONE"))):
			var _v32 = _S.scope(_v28)
			_S.invoke(_S.read(_v32, "p"), "line", [_S.binary("-", _S.unary("-", _S.read(_v32, "w")), 2), _S.read(_v32, "sy"), _S.binary("+", _S.read(_v32, "w"), 2), _S.read(_v32, "sy"), _S.function_value(_v32, "_f14")])
			_S.invoke(_S.read(_v32, "p"), "line", [_S.unary("-", _S.read(_v32, "w")), _S.binary("+", _S.read(_v32, "sy"), 1), _S.read(_v32, "w"), _S.binary("+", _S.read(_v32, "sy"), 1), _S.prop(_S.read(_v32, "C"), 4), 0.6])
			_S.invoke(_S.read(_v32, "p"), "glowLine", [_S.unary("-", _S.read(_v32, "w")), _S.read(_v32, "sy"), _S.read(_v32, "w"), _S.read(_v32, "sy"), 6, _S.prop(_S.read(_v32, "C"), 5), 0.6])
	_S.define(_e, "fk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "DONE")), 0.25))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "fk"), 0), func(): return _S.binary("<", _S.read(_e, "fk"), 1))):
		var _v33 = _S.scope(_e)
		for _v34 in _S.array(_S.read(_v33, "rim")):
			var _v35 = _S.scope(_v33)
			_S.define(_v35, "c", _v34)
			_S.invoke(_S.read(_v35, "p"), "dot", [_S.prop(_S.read(_v35, "c"), "x"), _S.prop(_S.read(_v35, "c"), "y"), (_S.read(_v35, "WHITE") if _S.truth(_S.binary("<", _S.read(_v35, "fk"), 0.4)) else _S.prop(_S.read(_v35, "C"), 5)), _S.binary("-", 1.2, _S.read(_v35, "fk"))])
		_S.call_value(_S.read(_v33, "sparkle"), [_S.read(_v33, "p"), 6, _S.binary("+", _S.read(_v33, "top"), 6), _S.invoke(_S.read(_v33, "Math"), "round", [_S.binary("*", 6, _S.binary("-", 1, _S.read(_v33, "fk")))]), _S.read(_v33, "WHITE"), _S.prop(_S.read(_v33, "C"), 5), 0.5])
	if _S.truth(_S.binary(">", _S.read(_e, "w"), 0.2)):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "yEnd", (_S.binary("+", _S.read(_v36, "TOPY"), _S.binary("*", _S.binary("-", _S.unary("-", 1), _S.read(_v36, "TOPY")), _S.invoke(_S.read(_v36, "ease"), "inCubic", [_S.call_value(_S.read(_v36, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v36, "t"), _S.read(_v36, "SLAM")), _S.read(_v36, "DROP")), _S.read(_v36, "DROP"))])]))) if _S.truth(_S.binary("<", _S.read(_v36, "t"), _S.read(_v36, "SLAM"))) else _S.binary("+", _S.unary("-", 1), _S.call_value(_S.read(_v36, "bottom"), [_S.read(_v36, "t")]))))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v36, "t"), _S.read(_v36, "SLAM")), func(): return _S.binary("<", _S.binary("-", _S.read(_v36, "t"), _S.read(_v36, "SLAM")), 0.1))):
			_S.invoke(_S.read(_v36, "p"), "glow", [0, _S.unary("-", 30), 56, _S.read(_v36, "WHITE"), _S.binary("*", 0.6, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v36, "t"), _S.read(_v36, "SLAM")), 0.1)))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.4)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "d"), 0.7)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_e, "sk")), 1.4), _S.binary("-", 1, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "d"))))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return true

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), 0.5)]), 0.35)) else _S.prop(_S.read(_e, "C"), 5))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DONE"), 0.04))) else 1)
