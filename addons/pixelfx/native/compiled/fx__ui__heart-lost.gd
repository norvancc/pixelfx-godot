@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/heart-lost.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "shadeAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawPart", _S.function_value(_e, "_f1"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Heart lost"}, {"desc": "A HUD heart is hit: it flashes white and jolts, a crack runs down it, it splits into two halves that tumble away, leaving an empty socket that fades."}, {"tags": ["ui", "health", "heart", "hud", "damage", "one-shot"]}, {"size": [96, 88]}, {"origin": [48, 34]}, {"duration": 1.5}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#1a0508", "#4a0b12", "#8c1420", "#d42a2e", "#ff5a4a", "#ff9a86", "#ffd8cc", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.14)
	_S.define(_e, "CRACK", 0.24)
	_S.define(_e, "SPLIT", 0.5)
	_S.define(_e, "MASK", ["....xxxx...xxxx....", "..xxxxxxx.xxxxxxx..", ".xxxxxxxxxxxxxxxxx.", "xxxxxxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxxxxx", "xxxxxxxxxxxxxxxxxxx", ".xxxxxxxxxxxxxxxxx.", "..xxxxxxxxxxxxxxx..", "...xxxxxxxxxxxxx...", "....xxxxxxxxxxx....", ".....xxxxxxxxx.....", "......xxxxxxx......", ".......xxxxx.......", "........xxx........", ".........x........."])
	_S.define(_e, "MW", 19)
	_S.define(_e, "MH", 16)
	_S.define(_e, "OX", _S.unary("-", 9.5))
	_S.define(_e, "OY", _S.unary("-", 8))
	_S.define(_e, "inMask", _S.function_value(_e, "_f9"))
	_S.define(_e, "CRACK_X", [9, 9, 10, 9, 8, 8, 9, 10, 10, 9, 8, 9, 9, 10, 9, 9])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "j", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "i"), 9), 9.5))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "j"), 7), 8))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("||", _S.binary("===", _S.read(_e, "i"), 3), func(): return _S.binary("===", _S.read(_e, "i"), 4)), func(): return _S.logical("||", _S.binary("===", _S.read(_e, "j"), 2), func(): return _S.binary("===", _S.read(_e, "j"), 3))), func(): return _S.unary("!", _S.logical("&&", _S.binary("===", _S.read(_e, "i"), 4), func(): return _S.binary("===", _S.read(_e, "j"), 3))))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 2), func(): return _S.binary("<=", _S.read(_e, "i"), 5)), func(): return _S.binary(">=", _S.read(_e, "j"), 2)), func(): return _S.binary("<=", _S.read(_e, "j"), 5)), func(): return _S.binary("<", _S.binary("+", _S.read(_e, "u"), _S.read(_e, "v")), _S.unary("-", 0.75)))):
		return _S.prop(_S.read(_e, "C"), 5)
	_S.define(_e, "l", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_e, "u"), 0.55), _S.binary("*", _S.read(_e, "v"), 0.65))))
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.25)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.3))) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.6))) else _S.prop(_S.read(_e, "C"), 1))))

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "side", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "y", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	_S.define(_e, "white", _S.arg(_args, 6))
	_S.define(_e, "crackK", _S.arg(_args, 7))
	_S.define(_e, "alpha", _S.arg(_args, 8))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))
	_S.define(_e, "px0", (_S.unary("-", 4.5) if _S.truth(_S.binary("<", _S.read(_e, "side"), 0)) else (4.5 if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else 0)))
	_S.define(_e, "py0", 0)
	_S.define(_e, "own", _S.function_value(_e, "_f2"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), 13), _S.binary("-", _S.read(_e, "y"), 13), _S.binary("+", _S.read(_e, "x"), 13), _S.binary("+", _S.read(_e, "y"), 13), _S.function_value(_e, "_f3")])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.call_value(_S.read(_e, "inMask"), [_S.read(_e, "i"), _S.read(_e, "j")]), func(): return _S.logical("||", _S.binary("===", _S.read(_e, "side"), 0), func(): return (_S.binary("<", _S.read(_e, "i"), _S.prop(_S.read(_e, "CRACK_X"), _S.read(_e, "j"))) if _S.truth(_S.binary("<", _S.read(_e, "side"), 0)) else _S.binary(">=", _S.read(_e, "i"), _S.prop(_S.read(_e, "CRACK_X"), _S.read(_e, "j"))))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "sx"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "sy"), _S.read(_e, "y")))
	_S.define(_e, "lx", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sa"))), _S.read(_e, "px0")))
	_S.define(_e, "ly", _S.binary("+", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))), _S.read(_e, "py0")))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "lx"), _S.read(_e, "OX"))]))
	_S.define(_e, "j", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "ly"), _S.read(_e, "OY"))]))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "own"), [_S.read(_e, "i"), _S.read(_e, "j")]))):
		return null
	_S.set_prop(_S.read(_e, "o"), "a", _S.read(_e, "alpha"), "=", false)
	_S.define(_e, "edge", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_e, "own"), [_S.binary("-", _S.read(_e, "i"), 1), _S.read(_e, "j")])), func(): return _S.unary("!", _S.call_value(_S.read(_e, "own"), [_S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "j")]))), func(): return _S.unary("!", _S.call_value(_S.read(_e, "own"), [_S.read(_e, "i"), _S.binary("-", _S.read(_e, "j"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_e, "own"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "j"), 1)]))))
	if _S.truth(_S.read(_e, "white")):
		return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.read(_e, "edge")) else _S.read(_e, "WHITE"))
	if _S.truth(_S.read(_e, "edge")):
		return _S.prop(_S.read(_e, "C"), 0)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "side"), 0), func(): return _S.binary("<", _S.binary("/", _S.read(_e, "j"), _S.read(_e, "MH")), _S.read(_e, "crackK")))):
		var _v0 = _S.scope(_e)
		if _S.truth(_S.binary("===", _S.read(_v0, "i"), _S.prop(_S.read(_v0, "CRACK_X"), _S.read(_v0, "j")))):
			return _S.prop(_S.read(_v0, "C"), 0)
		if _S.truth(_S.binary("===", _S.read(_v0, "i"), _S.binary("-", _S.prop(_S.read(_v0, "CRACK_X"), _S.read(_v0, "j")), 1))):
			return _S.prop(_S.read(_v0, "C"), 6)
	return _S.call_value(_S.read(_e, "shadeAt"), [_S.read(_e, "C"), _S.read(_e, "i"), _S.read(_e, "j")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), []))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "SOCKET", [_S.call_value(_S.read(_e, "hex"), ["#0d0a14"]), _S.call_value(_S.read(_e, "hex"), ["#2a2338"]), _S.call_value(_S.read(_e, "hex"), ["#3c3350"])])
	_S.define(_e, "halves", _S.invoke([_S.unary("-", 1), 1], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "split", false)
	_S.define(_e, "gone", false)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.merge([{"s": _S.read(_e, "s")}, {"x": _S.binary("*", _S.read(_e, "s"), 4.5)}, {"y": 0}, {"vx": _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "R"), "range", [55, 70]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [60, 80]))}, {"a": 0}, {"va": _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "R"), "range", [2.2, 3.2]))}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "hit", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, 0, 40, _S.prop(_S.read(_v1, "C"), 5), 0.6, 0.3])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 8)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "an", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [80, 170]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "an")]), 9), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "an")]), 7), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "an")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "an")]), _S.read(_v3, "sp")), 30), _S.invoke(_S.read(_v3, "R"), "range", [0.1, 0.22])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "split")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SPLIT")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "split", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 44, _S.read(_v4, "WHITE"), 0.6, 0.12])
		_S.invoke(_S.read(_v4, "lights"), "add", [0, 0, 50, _S.prop(_S.read(_v4, "C"), 5), 0.5, 0.4])
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 12)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "j", _S.invoke(_S.read(_v6, "R"), "int", [1, 14]))
			_S.define(_v6, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v6, "Math"), "PI")), 2), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [40, 100]))
			_S.invoke(_S.read(_v6, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v6, "B"), "SHARD")}, {"x": _S.binary("+", _S.prop(_S.read(_v6, "CRACK_X"), _S.read(_v6, "j")), _S.read(_v6, "OX"))}, {"y": _S.binary("+", _S.read(_v6, "j"), _S.read(_v6, "OY"))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "an")]), _S.read(_v6, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "an")]), _S.read(_v6, "sp"))}, {"g": 0.5}, {"drag": 1}, {"life": _S.invoke(_S.read(_v6, "R"), "range", [0.35, 0.55])}, {"a": _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")])}, {"va": _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v6, "R"), "range", [1.5, 3])}, {"c": _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 6), _S.prop(_S.read(_v6, "C"), 5), _S.prop(_S.read(_v6, "C"), 4), _S.prop(_S.read(_v6, "C"), 3)]])}])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v4)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 5)):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "DUST"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 2), 2]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 25), 25]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 20), 5]), _S.invoke(_S.read(_v7, "R"), "range", [0.35, 0.6]), _S.prop(_S.read(_v7, "C"), 2), _S.invoke(_S.read(_v7, "R"), "range", [2, 3.5])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
		var _v8 = _S.scope(_v4)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 6)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "an", _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")]))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [30, 70]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), 4), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), 4), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.prop(_S.read(_v9, "C"), 7), _S.prop(_S.read(_v9, "C"), 6)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v9, "i"), 2)) else 1.4)])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "split"), func(): return _S.unary("!", _S.read(_e, "gone"))), func(): return _S.binary(">=", _S.read(_e, "t"), 0.95))):
		var _v10 = _S.scope(_e)
		_S.write(_v10, "gone", true, "=", false)
		for _v11 in _S.array(_S.read(_v10, "halves")):
			var _v12 = _S.scope(_v10)
			_S.define(_v12, "h", _v11)
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "i"), 5)):
				var _v14 = _S.scope(_v13)
				_S.define(_v14, "an", _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")]))
				_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [20, 50]))
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v14, "h"), "x"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), 4)), _S.binary("+", _S.prop(_S.read(_v14, "h"), "y"), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), 4)), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "an")]), _S.read(_v14, "sp")), 10), _S.invoke(_S.read(_v14, "Math"), "min", [_S.invoke(_S.read(_v14, "R"), "range", [0.2, 0.35]), _S.binary("-", _S.read(_v14, "end"), _S.read(_v14, "t"))]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "C"), 7), _S.prop(_S.read(_v14, "C"), 6), _S.prop(_S.read(_v14, "C"), 5)]]), (0.6 if _S.truth(_S.read(_v14, "i")) else 1.3)])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "split")):
		for _v15 in _S.array(_S.read(_e, "halves")):
			var _v16 = _S.scope(_e)
			_S.define(_v16, "h", _v15)
			var _v17 = _S.scope(_v16)
			_S.set_prop(_S.read(_v17, "h"), "vy", _S.binary("*", 520, _S.read(_v17, "dt")), "+=", false)
			_S.set_prop(_S.read(_v17, "h"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v17, "h"), "vx"), 0.6), _S.read(_v17, "dt")), "-=", false)
			_S.set_prop(_S.read(_v17, "h"), "x", _S.binary("*", _S.prop(_S.read(_v17, "h"), "vx"), _S.read(_v17, "dt")), "+=", false)
			_S.set_prop(_S.read(_v17, "h"), "y", _S.binary("*", _S.prop(_S.read(_v17, "h"), "vy"), _S.read(_v17, "dt")), "+=", false)
			_S.set_prop(_S.read(_v17, "h"), "a", _S.binary("*", _S.prop(_S.read(_v17, "h"), "va"), _S.read(_v17, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v17, "t"), 0.92), func(): return _S.invoke(_S.read(_v17, "R"), "chance", [0.05]))):
				_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "EMBER"), _S.prop(_S.read(_v17, "h"), "x"), _S.prop(_S.read(_v17, "h"), "y"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 10), 5]), _S.invoke(_S.read(_v17, "Math"), "min", [_S.invoke(_S.read(_v17, "R"), "range", [0.3, 0.5]), _S.binary("-", _S.read(_v17, "end"), _S.read(_v17, "t"))]), _S.prop(_S.read(_v17, "C"), 4), 1])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	var _v18 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 3, _S.read(_e, "HIT"), 0.25, _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "jx", _S.prop(_v18, 0))
	_S.define(_e, "jy", _S.prop(_v18, 1))
	_S.define(_e, "tremble", (_S.invoke(_S.read(_e, "Math"), "round", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 90)])]) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CRACK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SPLIT")))) else 0))
	_S.define(_e, "sk", _S.binary("*", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "SPLIT"), 0.05), _S.binary("+", _S.read(_e, "SPLIT"), 0.1)]), _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 1.15, 1.4]))))
	if _S.truth(_S.binary(">", _S.read(_e, "sk"), 0)):
		_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 12), _S.unary("-", 10), 12, 10, _S.function_value(_e, "_f8")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SPLIT"))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "beat", (_S.binary("+", 1, _S.binary("*", 0.08, _S.invoke(_S.read(_v19, "Math"), "max", [0, _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.read(_v19, "t"), 22)])]))) if _S.truth(_S.binary("<", _S.read(_v19, "t"), _S.read(_v19, "HIT"))) else 1))
		_S.define(_v19, "white", _S.logical("&&", _S.binary(">=", _S.read(_v19, "t"), _S.read(_v19, "HIT")), func(): return _S.binary("<", _S.read(_v19, "t"), _S.binary("+", _S.read(_v19, "HIT"), 0.07))))
		_S.call_value(_S.read(_v19, "drawPart"), [_S.read(_v19, "p"), _S.read(_v19, "C"), 0, _S.binary("+", _S.read(_v19, "jx"), _S.read(_v19, "tremble")), _S.read(_v19, "jy"), 0, _S.read(_v19, "white"), _S.call_value(_S.read(_v19, "seg"), [_S.read(_v19, "t"), _S.read(_v19, "CRACK"), _S.binary("-", _S.read(_v19, "SPLIT"), 0.06)]), 1])
		_S.invoke(_S.read(_v19, "p"), "glow", [0, 0, _S.binary("*", 18, _S.read(_v19, "beat")), _S.prop(_S.read(_v19, "C"), 4), _S.binary("+", 0.3, (0.5 if _S.truth(_S.read(_v19, "white")) else 0))])
		if _S.truth(_S.binary("<", _S.read(_v19, "t"), _S.read(_v19, "HIT"))):
			_S.call_value(_S.read(_v19, "sparkle"), [_S.read(_v19, "p"), _S.unary("-", 6), _S.unary("-", 5), _S.binary("*", 2.5, _S.invoke(_S.read(_v19, "Math"), "max", [0, _S.invoke(_S.read(_v19, "Math"), "sin", [_S.binary("*", _S.read(_v19, "t"), 22)])])), _S.prop(_S.read(_v19, "C"), 7), _S.prop(_S.read(_v19, "C"), 6), 0.3])
	else:
		var _v20 = _S.scope(_e)
		_S.define(_v20, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v20, "seg"), [_S.read(_v20, "t"), 0.9, 1])))
		_S.define(_v20, "white", _S.binary("<", _S.read(_v20, "t"), _S.binary("+", _S.read(_v20, "SPLIT"), 0.05)))
		if _S.truth(_S.binary(">", _S.read(_v20, "fade"), 0)):
			for _v21 in _S.array(_S.read(_v20, "halves")):
				var _v22 = _S.scope(_v20)
				_S.define(_v22, "h", _v21)
				_S.call_value(_S.read(_v22, "drawPart"), [_S.read(_v22, "p"), _S.read(_v22, "C"), _S.prop(_S.read(_v22, "h"), "s"), _S.prop(_S.read(_v22, "h"), "x"), _S.prop(_S.read(_v22, "h"), "y"), _S.prop(_S.read(_v22, "h"), "a"), _S.read(_v22, "white"), 0, _S.read(_v22, "fade")])
		_S.define(_v20, "rk", _S.binary("/", _S.binary("-", _S.read(_v20, "t"), _S.read(_v20, "SPLIT")), 0.3))
		if _S.truth(_S.binary("<", _S.read(_v20, "rk"), 1)):
			_S.invoke(_S.read(_v20, "p"), "ring", [0, 0, _S.binary("+", 8, _S.binary("*", 16, _S.invoke(_S.read(_v20, "ease"), "outCubic", [_S.read(_v20, "rk")]))), _S.invoke(_S.read(_v20, "Math"), "max", [1, _S.binary("*", 2, _S.binary("-", 1, _S.read(_v20, "rk")))]), (_S.read(_v20, "WHITE") if _S.truth(_S.binary("<", _S.read(_v20, "rk"), 0.3)) else _S.prop(_S.read(_v20, "C"), 5)), _S.binary("-", 1.2, _S.read(_v20, "rk"))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "sx"), _S.read(_e, "OX"))]))
	_S.define(_e, "j", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.read(_e, "sy"), _S.read(_e, "OY"))]))
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inMask"), [_S.read(_e, "i"), _S.read(_e, "j")]))):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "sk"), "=", false)
	_S.define(_e, "edge", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_e, "inMask"), [_S.binary("-", _S.read(_e, "i"), 1), _S.read(_e, "j")])), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inMask"), [_S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "j")]))), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inMask"), [_S.read(_e, "i"), _S.binary("-", _S.read(_e, "j"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inMask"), [_S.read(_e, "i"), _S.binary("+", _S.read(_e, "j"), 1)]))))
	return (_S.prop(_S.read(_e, "SOCKET"), 2) if _S.truth(_S.read(_e, "edge")) else (_S.prop(_S.read(_e, "SOCKET"), 1) if _S.truth(_S.binary("<", _S.read(_e, "j"), 3)) else _S.prop(_S.read(_e, "SOCKET"), 0)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "j", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "i"), 0), func(): return _S.binary(">=", _S.read(_e, "j"), 0)), func(): return _S.binary("<", _S.read(_e, "i"), _S.read(_e, "MW"))), func(): return _S.binary("<", _S.read(_e, "j"), _S.read(_e, "MH"))), func(): return _S.binary("===", _S.prop(_S.prop(_S.read(_e, "MASK"), _S.read(_e, "j")), _S.read(_e, "i")), "x"))
