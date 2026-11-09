@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/blink-in.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "LINE", 0.26)
	_S.define(_e, "GROW", 0.1)
	_S.define(_e, "OPEN", 0.12)
	_S.define(_e, "ARRIVE", _S.binary("+", _S.binary("+", _S.read(_e, "LINE"), _S.read(_e, "GROW")), _S.read(_e, "OPEN")))
	_S.define(_e, "meta", _S.merge([{"name": "Blink in"}, {"desc": "Glittering bits spiral in to a point of light that opens into a line, then into a white silhouette that cools into the caster."}, {"tags": ["arcane", "blink", "teleport", "appear", "movement", "magic", "one-shot"]}, {"size": [136, 96]}, {"origin": [68, 80]}, {"duration": 1.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "LANDED", _S.merge([{"crouch": 7}, {"lean": 3}, {"fx": 9}, {"fy": _S.unary("-", 12)}, {"bx": 12}, {"by": _S.unary("-", 12)}, {"ffx": 8}, {"fbx": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "LANDED")], [0.48, _S.read(_e, "LANDED")], [0.56, _S.merge([_S.read(_e, "LANDED"), {"crouch": 6}]), "snap"], [0.95, _S.read(_e, "READY")], [1.4, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.48}, {"stop": 0.03}, {"shake": 0.1}, {"amp": 1}])]}, {"dust": [_S.merge([{"t": 0.48}, {"x": 0}, {"n": 7}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f10"))
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
	_S.define(_e, "bits", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 230}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "arrived", false)
	_S.define(_e, "at", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

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
	_S.define(_e, "a", _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")]))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "R"), "range", [16, 46]))
	_S.define(_e, "ty", _S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.invoke(_S.read(_e, "R"), "range", [3, _S.binary("-", _S.prop(_S.read(_e, "A"), "h"), 2)])))
	_S.define(_e, "oy", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "d")), 0.8), 6))
	if _S.truth(_S.binary(">", _S.binary("+", _S.read(_e, "ty"), _S.read(_e, "oy")), _S.unary("-", 2))):
		_S.write(_e, "oy", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "oy")])), 2), "=", false)
	return _S.merge([{"tx": _S.binary("+", _S.read(_e, "mx"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1]))}, {"ty": _S.read(_e, "ty")}, {"ox": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "d"))}, {"oy": _S.read(_e, "oy")}, {"t0": _S.invoke(_S.read(_e, "R"), "range", [0, 0.1])}, {"t1": _S.binary("+", _S.read(_e, "LINE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.02), _S.read(_e, "GROW")]))}, {"spin": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [0.8, 1.8]), _S.invoke(_S.read(_e, "R"), "sign", []))}, {"c": _S.invoke(_S.read(_e, "R"), "pick", [_S.read(_e, "COLS")])}])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "tt", _S.arg(_args, 1))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tt"), _S.prop(_S.read(_e, "b"), "t0")), _S.binary("-", _S.prop(_S.read(_e, "b"), "t1"), _S.prop(_S.read(_e, "b"), "t0")))]))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))
	_S.define(_e, "r", _S.binary("-", 1, _S.read(_e, "e")))
	_S.define(_e, "sp", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "b"), "spin"), _S.read(_e, "r")), 1.2))
	_S.define(_e, "ox", _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "b"), "ox"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sp")])), _S.binary("*", _S.prop(_S.read(_e, "b"), "oy"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sp")]))))
	_S.define(_e, "oy", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "b"), "ox"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "sp")])), _S.binary("*", _S.prop(_S.read(_e, "b"), "oy"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "sp")]))))
	return [_S.binary("+", _S.prop(_S.read(_e, "b"), "tx"), _S.binary("*", _S.read(_e, "ox"), _S.read(_e, "r"))), _S.invoke(_S.read(_e, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.prop(_S.read(_e, "b"), "ty"), _S.binary("*", _S.read(_e, "oy"), _S.read(_e, "r")))]), _S.read(_e, "k")]

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LINE")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")]))
		_S.define(_v0, "D", _S.invoke(_S.read(_v0, "R"), "range", [22, 44]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.12, 0.18]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.define(_v0, "x", _S.binary("+", _S.read(_v0, "mx"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")]), _S.read(_v0, "D"))))
		_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v0, "my"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), _S.read(_v0, "D")))]))
		_S.define(_v0, "l", _S.logical("||", _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.binary("-", _S.read(_v0, "x"), _S.read(_v0, "mx")), _S.binary("-", _S.read(_v0, "y"), _S.read(_v0, "my"))]), func(): return 1))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.read(_v0, "x"), _S.read(_v0, "y"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "mx"), _S.read(_v0, "x")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "my"), _S.read(_v0, "y")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "arrived")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "ARRIVE")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "arrived", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.binary("-", _S.read(_v1, "my"), 6), 56, _S.prop(_S.read(_v1, "C"), 5), 0.9, 0.35])
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.read(_v1, "my"), 24, _S.read(_v1, "WHITE"), 0.8, 0.1])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 30)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [35, 110]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [(_S.prop(_S.read(_v3, "P"), "STAR") if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.6])) else _S.prop(_S.read(_v3, "P"), "MOTE")), _S.read(_v3, "mx"), _S.read(_v3, "my"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), 0.7), 30), _S.invoke(_S.read(_v3, "R"), "range", [0.4, 0.85]), _S.invoke(_S.read(_v3, "R"), "pick", [_S.read(_v3, "COLS")]), _S.invoke(_S.read(_v3, "R"), "range", [0.6, 1.6])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 12)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "s", _S.invoke(_S.read(_v5, "R"), "sign", []))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.binary("+", _S.read(_v5, "mx"), _S.binary("*", _S.read(_v5, "s"), _S.invoke(_S.read(_v5, "R"), "range", [2, 8]))), _S.unary("-", 1), _S.binary("*", _S.read(_v5, "s"), _S.invoke(_S.read(_v5, "R"), "range", [60, 180])), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [20, 110])), _S.invoke(_S.read(_v5, "R"), "range", [0.2, 0.45])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ARRIVE")), 0.03), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.2, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.function_value(_e, "_f7"), _S.binary("<", _S.read(_e, "k"), 0.25)])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 26, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.3, (_S.binary("/", _S.read(_e, "t"), _S.read(_e, "ARRIVE")) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ARRIVE"))) else _S.binary("-", 1, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ARRIVE")), 0.5)]))))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	for _v6 in _S.array(_S.read(_e, "bits")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "b", _v6)
		var _v8 = _S.scope(_v7)
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v8, "t"), _S.prop(_S.read(_v8, "b"), "t0")), func(): return _S.binary(">", _S.read(_v8, "t"), _S.binary("+", _S.prop(_S.read(_v8, "b"), "t1"), 0.02)))):
			continue
		var _v9 = _S.call_value(_S.read(_v8, "at"), [_S.read(_v8, "b"), _S.read(_v8, "t")])
		_S.define(_v8, "x", _S.prop(_v9, 0))
		_S.define(_v8, "y", _S.prop(_v9, 1))
		_S.define(_v8, "k", _S.prop(_v9, 2))
		_S.invoke(_S.read(_v8, "p"), "dot", [_S.read(_v8, "x"), _S.read(_v8, "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.75)) else _S.prop(_S.read(_v8, "b"), "c")), _S.invoke(_S.read(_v8, "Math"), "min", [1, _S.binary("+", 0.35, _S.binary("*", _S.read(_v8, "k"), 2))])])
		if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.55)):
			var _v10 = _S.scope(_v8)
			var _v11 = _S.call_value(_S.read(_v10, "at"), [_S.read(_v10, "b"), _S.binary("-", _S.read(_v10, "t"), 0.015)])
			_S.define(_v10, "px", _S.prop(_v11, 0))
			_S.define(_v10, "py", _S.prop(_v11, 1))
			_S.invoke(_S.read(_v10, "p"), "dot", [_S.binary("/", _S.binary("+", _S.read(_v10, "x"), _S.read(_v10, "px")), 2), _S.binary("/", _S.binary("+", _S.read(_v10, "y"), _S.read(_v10, "py")), 2), _S.prop(_S.read(_v10, "C"), 5), 0.8])
		if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.8)):
			_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "x"), _S.read(_v8, "y"), 3, _S.prop(_S.read(_v8, "C"), 6), 0.3])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "LINE"), 0.04)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LINE")))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "q", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v12, "t"), _S.read(_v12, "LINE")), 0.04), 0.04))
		_S.call_value(_S.read(_v12, "sparkle"), [_S.read(_v12, "p"), _S.read(_v12, "mx"), _S.read(_v12, "my"), _S.binary("+", 2, _S.binary("*", 3, _S.read(_v12, "q"))), _S.prop(_S.read(_v12, "C"), 6), _S.prop(_S.read(_v12, "C"), 5), 0.6])
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LINE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LINE"), _S.read(_e, "GROW"))))):
			var _v13 = _S.scope(_e)
			_S.define(_v13, "q", _S.invoke(_S.read(_v13, "ease"), "outCubic", [_S.binary("/", _S.binary("-", _S.read(_v13, "t"), _S.read(_v13, "LINE")), _S.read(_v13, "GROW"))]))
			_S.define(_v13, "hh", _S.binary("*", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v13, "A"), "h"), 2), 3), _S.read(_v13, "q")))
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "y", _S.binary("-", _S.unary("-", _S.read(_v14, "hh")), 2))
			while _S.truth(_S.binary("<=", _S.read(_v14, "y"), _S.binary("+", _S.read(_v14, "hh"), 2))):
				_S.invoke(_S.read(_v14, "p"), "dot", [_S.read(_v14, "mx"), _S.binary("+", _S.read(_v14, "my"), _S.read(_v14, "y")), (_S.read(_v14, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.read(_v14, "y")]), _S.read(_v14, "hh"))) else _S.prop(_S.read(_v14, "C"), 6)), (1 if _S.truth(_S.binary("<", _S.invoke(_S.read(_v14, "Math"), "abs", [_S.read(_v14, "y")]), _S.read(_v14, "hh"))) else 0.7)])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "y", 1, "+=", true)
			var _v15 = _S.scope(_v13)
			_S.define(_v15, "y", _S.binary("*", _S.unary("-", _S.read(_v15, "hh")), 0.7))
			while _S.truth(_S.binary("<=", _S.read(_v15, "y"), _S.binary("*", _S.read(_v15, "hh"), 0.7))):
				_S.last([_S.invoke(_S.read(_v15, "p"), "dot", [_S.binary("-", _S.read(_v15, "mx"), 1), _S.binary("+", _S.read(_v15, "my"), _S.read(_v15, "y")), _S.prop(_S.read(_v15, "C"), 5), 0.6]), _S.invoke(_S.read(_v15, "p"), "dot", [_S.binary("+", _S.read(_v15, "mx"), 1), _S.binary("+", _S.read(_v15, "my"), _S.read(_v15, "y")), _S.prop(_S.read(_v15, "C"), 5), 0.6])])
				_v15 = _S.iteration(_v15)
				_S.write(_v15, "y", 1, "+=", true)
			_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "mx"), _S.read(_v13, "my"), 30, _S.prop(_S.read(_v13, "C"), 5), 0.9])
			_S.invoke(_S.read(_v13, "p"), "glow", [_S.read(_v13, "mx"), _S.read(_v13, "my"), 8, _S.read(_v13, "WHITE"), 0.5])
		else:
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LINE"), _S.read(_e, "GROW"))), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "ARRIVE")))):
				var _v16 = _S.scope(_e)
				_S.define(_v16, "q", _S.invoke(_S.read(_v16, "ease"), "outCubic", [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v16, "t"), _S.read(_v16, "LINE")), _S.read(_v16, "GROW")), _S.read(_v16, "OPEN"))]))
				_S.call_value(_S.read(_v16, "squeezed"), [_S.read(_v16, "p"), _S.read(_v16, "A"), _S.read(_v16, "sh"), _S.read(_v16, "q"), _S.read(_v16, "WHITE"), _S.prop(_S.read(_v16, "C"), 6)])
				_S.invoke(_S.read(_v16, "p"), "glow", [_S.read(_v16, "mx"), _S.read(_v16, "my"), 36, _S.prop(_S.read(_v16, "C"), 5), 0.8])
			else:
				if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "ARRIVE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "ARRIVE"), 0.42)))):
					var _v17 = _S.scope(_e)
					_S.define(_v17, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v17, "t"), _S.read(_v17, "ARRIVE")), 0.42)))
					_S.define(_v17, "f", _S.invoke(_S.read(_v17, "Math"), "floor", [_S.binary("*", _S.read(_v17, "t"), 30)]))
					if _S.truth(_S.binary(">", _S.read(_v17, "k"), 0.86)):
						_S.call_value(_S.read(_v17, "squeezed"), [_S.read(_v17, "p"), _S.read(_v17, "A"), _S.read(_v17, "sh"), 1, _S.read(_v17, "WHITE"), _S.prop(_S.read(_v17, "C"), 6)])
					var _v18 = _S.scope(_v17)
					_S.define(_v18, "y", 0)
					while _S.truth(_S.binary("<", _S.read(_v18, "y"), _S.prop(_S.read(_v18, "A"), "h"))):
						var _v19 = _S.scope(_v18)
						_S.define(_v19, "x", 0)
						while _S.truth(_S.binary("<", _S.read(_v19, "x"), _S.prop(_S.read(_v19, "A"), "w"))):
							if _S.truth(_S.call_value(_S.read(_v19, "inside"), [_S.read(_v19, "x"), _S.read(_v19, "y")])):
								_S.invoke(_S.read(_v19, "p"), "light", [_S.binary("+", _S.prop(_S.read(_v19, "A"), "x"), _S.read(_v19, "x")), _S.binary("+", _S.prop(_S.read(_v19, "A"), "y"), _S.read(_v19, "y")), _S.prop(_S.read(_v19, "C"), 6), _S.binary("*", _S.binary("*", _S.read(_v19, "k"), _S.read(_v19, "k")), (0.3 if _S.truth(_S.binary("===", _S.prop(_S.read(_v19, "sh"), _S.binary("+", _S.binary("*", _S.read(_v19, "y"), _S.prop(_S.read(_v19, "A"), "w")), _S.read(_v19, "x"))), 1)) else 0.8))])
							else:
								if _S.truth(_S.logical("&&", _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v19, "inside"), [_S.binary("-", _S.read(_v19, "x"), 1), _S.read(_v19, "y")]), func(): return _S.call_value(_S.read(_v19, "inside"), [_S.binary("+", _S.read(_v19, "x"), 1), _S.read(_v19, "y")])), func(): return _S.call_value(_S.read(_v19, "inside"), [_S.read(_v19, "x"), _S.binary("-", _S.read(_v19, "y"), 1)])), func(): return _S.call_value(_S.read(_v19, "inside"), [_S.read(_v19, "x"), _S.binary("+", _S.read(_v19, "y"), 1)])), func(): return _S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.read(_v19, "f")]), _S.binary("*", 0.85, _S.read(_v19, "k"))))):
									_S.invoke(_S.read(_v19, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v19, "A"), "x"), _S.read(_v19, "x")), _S.binary("+", _S.prop(_S.read(_v19, "A"), "y"), _S.read(_v19, "y")), (_S.read(_v19, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v19, "k"), 0.5), func(): return _S.binary("<", _S.call_value(_S.read(_v19, "rand"), [_S.read(_v19, "x"), _S.read(_v19, "y"), 7]), 0.5))) else _S.prop(_S.read(_v19, "C"), 6))])
							_v19 = _S.iteration(_v19)
							_S.write(_v19, "x", 1, "+=", true)
						_v18 = _S.iteration(_v18)
						_S.write(_v18, "y", 1, "+=", true)
					_S.invoke(_S.read(_v17, "p"), "glow", [_S.read(_v17, "mx"), _S.read(_v17, "my"), 34, _S.prop(_S.read(_v17, "C"), 5), _S.binary("*", 0.6, _S.read(_v17, "k"))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "ARRIVE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "ARRIVE"), 0.2)))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "q", _S.binary("/", _S.binary("-", _S.read(_v20, "t"), _S.read(_v20, "ARRIVE")), 0.2))
		_S.call_value(_S.read(_v20, "flare"), [_S.read(_v20, "p"), _S.read(_v20, "mx"), _S.binary("-", _S.read(_v20, "my"), 4), _S.binary("+", _S.binary("*", 18, _S.invoke(_S.read(_v20, "Math"), "pow", [_S.binary("-", 1, _S.read(_v20, "q")), 1.5])), 2), _S.binary("-", 1, _S.read(_v20, "q")), _S.read(_v20, "C")])
	_S.define(_e, "k", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "ARRIVE")), 0.03), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.2, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6), _S.read(_e, "WHITE")], _S.function_value(_e, "_f9"), _S.binary("<", _S.read(_e, "k"), 0.25)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ARRIVE"))) else 1)
