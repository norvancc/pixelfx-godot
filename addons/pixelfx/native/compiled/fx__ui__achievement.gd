@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/achievement.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "star", _S.import_value("core/index.js", "star"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "panel", _S.import_value("fx/ui/_lib.js", "panel"))
	_S.define(_e, "medal", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Achievement"}, {"desc": "A toast slides in on speed lines and settles; a gold medal pops onto it in a burst of sparkles, a shine sweeps the whole toast, then it slides away."}, {"tags": ["ui", "achievement", "toast", "medal", "reward", "text", "one-shot"]}, {"size": [220, 72]}, {"origin": [110, 36]}, {"duration": 2.4}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a1405", "#5c3008", "#9a5a0e", "#d48e18", "#f5b92c", "#ffde5e", "#fff4bc", "#ffffff"]}, {"ribbon": ["#0c1430", "#1f3a7a", "#2f66c4", "#5aa0f0", "#a6d4ff"]}, {"title": "ACHIEVEMENT"}, {"text": "UNLOCKED"}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "PW", 130)
	_S.define(_e, "PH", 34)
	_S.define(_e, "PX", _S.binary("/", _S.unary("-", _S.read(_e, "PW")), 2))
	_S.define(_e, "PY", _S.binary("/", _S.unary("-", _S.read(_e, "PH")), 2))
	_S.define(_e, "IN", 0.2)
	_S.define(_e, "MEDAL", 0.26)
	_S.define(_e, "SHINE", 0.95)
	_S.define(_e, "OUT", 1.92)
	_S.define(_e, "MX", _S.binary("+", _S.read(_e, "PX"), 17))
	_S.define(_e, "MY", 2)
	_S.define(_e, "INK", _S.merge([{"outline": _S.call_value(_S.read(_e, "hex"), ["#0d0a14"])}, {"rim": _S.call_value(_S.read(_e, "hex"), ["#5a4f74"])}, {"top": _S.call_value(_S.read(_e, "hex"), ["#2a2338"])}, {"body": _S.call_value(_S.read(_e, "hex"), ["#211b2d"])}, {"low": _S.call_value(_S.read(_e, "hex"), ["#15111c"])}]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "G", _S.arg(_args, 1))
	_S.define(_e, "B", _S.arg(_args, 2))
	_S.define(_e, "x", _S.arg(_args, 3))
	_S.define(_e, "y", _S.arg(_args, 4))
	_S.define(_e, "s", _S.arg(_args, 5))
	_S.define(_e, "white", _S.arg(_args, 6))
	_S.define(_e, "shine", _S.arg(_args, 7))
	_S.define(_e, "r", _S.binary("*", 10, _S.read(_e, "s")))
	for _v0 in _S.array([_S.unary("-", 1), 1]):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "sd", _v0)
		var _v2 = _S.scope(_v1)
		_S.invoke(_S.read(_v2, "p"), "poly", [[[_S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 2), _S.read(_v2, "s"))), _S.binary("+", _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "r")), 2)], [_S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 7), _S.read(_v2, "s"))), _S.binary("+", _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "r")), 2)], [_S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 9), _S.read(_v2, "s"))), _S.binary("+", _S.read(_v2, "PY"), 1)], [_S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 4), _S.read(_v2, "s"))), _S.binary("+", _S.read(_v2, "PY"), 1)]], _S.function_value(_v2, "_f1")])
		_S.invoke(_S.read(_v2, "p"), "line", [_S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 2), _S.read(_v2, "s"))), _S.binary("+", _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "r")), 2), _S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 4), _S.read(_v2, "s"))), _S.binary("+", _S.read(_v2, "PY"), 1), _S.prop(_S.read(_v2, "B"), 0)])
		_S.invoke(_S.read(_v2, "p"), "line", [_S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 7), _S.read(_v2, "s"))), _S.binary("+", _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "r")), 2), _S.binary("+", _S.read(_v2, "x"), _S.binary("*", _S.binary("*", _S.read(_v2, "sd"), 9), _S.read(_v2, "s"))), _S.binary("+", _S.read(_v2, "PY"), 1), _S.prop(_S.read(_v2, "B"), 0)])
	_S.define(_e, "st", _S.call_value(_S.read(_e, "star"), [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 0.5), _S.binary("*", 2.8, _S.read(_e, "s")), _S.binary("*", 6.5, _S.read(_e, "s")), 5]))
	_S.define(_e, "inStar", _S.function_value(_e, "_f2"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "r")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "r")), 1), _S.binary("+", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "r")), 1), _S.function_value(_e, "_f3")])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "B"), 2) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "px"), _S.read(_e, "x"))]), _S.binary("*", 4.5, _S.read(_e, "s")))) else _S.prop(_S.read(_e, "B"), 3))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "inside", false)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	_S.define(_v3, "j", _S.binary("-", _S.prop(_S.read(_v3, "st"), "length"), 1))
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), _S.prop(_S.read(_v3, "st"), "length"))):
		var _v4 = _S.scope(_v3)
		var _v5 = _S.prop(_S.read(_v4, "st"), _S.read(_v4, "i"))
		_S.define(_v4, "xi", _S.prop(_v5, 0))
		_S.define(_v4, "yi", _S.prop(_v5, 1))
		var _v6 = _S.prop(_S.read(_v4, "st"), _S.read(_v4, "j"))
		_S.define(_v4, "xj", _S.prop(_v6, 0))
		_S.define(_v4, "yj", _S.prop(_v6, 1))
		if _S.truth(_S.logical("&&", _S.binary("!==", _S.binary(">", _S.read(_v4, "yi"), _S.read(_v4, "py")), _S.binary(">", _S.read(_v4, "yj"), _S.read(_v4, "py"))), func(): return _S.binary("<", _S.read(_v4, "px"), _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v4, "xj"), _S.read(_v4, "xi")), _S.binary("-", _S.read(_v4, "py"), _S.read(_v4, "yi"))), _S.binary("-", _S.read(_v4, "yj"), _S.read(_v4, "yi"))), _S.read(_v4, "xi"))))):
			_S.write(_v4, "inside", _S.unary("!", _S.read(_v4, "inside")), "=", false)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "j", _S.write(_v3, "i", 1, "+=", true), "=", false)
	return _S.read(_e, "inside")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "r"))):
		return null
	if _S.truth(_S.read(_e, "white")):
		return (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "d")), 1)) else _S.read(_e, "WHITE"))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "d")), 1)):
		return _S.prop(_S.read(_e, "G"), 0)
	_S.define(_e, "l", _S.binary("/", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), 0.6), _S.binary("*", _S.read(_e, "dy"), 0.8))), _S.read(_e, "r")))
	if _S.truth(_S.logical("&&", _S.binary("!==", _S.read(_e, "shine"), null), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("-", _S.read(_e, "dx"), _S.binary("*", _S.read(_e, "dy"), 0.6)), _S.read(_e, "shine"))]), 1.2))):
		return _S.read(_e, "WHITE")
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "r"), _S.read(_e, "d")), 2.5)):
		return (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.2)) else (_S.prop(_S.read(_e, "G"), 4) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.3))) else _S.prop(_S.read(_e, "G"), 3)))
	if _S.truth(_S.call_value(_S.read(_e, "inStar"), [_S.read(_e, "px"), _S.read(_e, "py")])):
		return (_S.prop(_S.read(_e, "G"), 2) if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_e, "inStar"), [_S.binary("+", _S.read(_e, "px"), 1), _S.read(_e, "py")])), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inStar"), [_S.binary("-", _S.read(_e, "px"), 1), _S.read(_e, "py")]))), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inStar"), [_S.read(_e, "px"), _S.binary("+", _S.read(_e, "py"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inStar"), [_S.read(_e, "px"), _S.binary("-", _S.read(_e, "py"), 1)])))) else (_S.prop(_S.read(_e, "G"), 7) if _S.truth(_S.binary("<", _S.binary("+", _S.read(_e, "dx"), _S.read(_e, "dy")), 0)) else _S.prop(_S.read(_e, "G"), 6)))
	return (_S.prop(_S.read(_e, "G"), 5) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.4)) else (_S.prop(_S.read(_e, "G"), 4) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.2))) else _S.prop(_S.read(_e, "G"), 3)))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ribbon"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "G"), 7), _S.prop(_S.read(_e, "G"), 6), _S.prop(_S.read(_e, "G"), 5), _S.prop(_S.read(_e, "G"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "title", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "title"), "mini"]))
	_S.define(_e, "sub", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text"), "mini"]))
	_S.define(_e, "TX", _S.binary("+", _S.read(_e, "PX"), 34))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "xAt", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("*", 30, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "t"), _S.read(_e, "IN"))), 3])) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "IN"))) else (_S.binary("*", _S.binary("*", _S.unary("-", 3), _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN"))), 12)])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "IN")), 30)])) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))) else (_S.binary("*", _S.unary("-", 3), _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "OUT"), _S.binary("+", _S.read(_e, "OUT"), 0.06)])) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "OUT"), _S.binary("+", _S.read(_e, "OUT"), 0.06)]), 1)) else _S.binary("+", _S.unary("-", 3), _S.binary("*", 33, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.06), _S.binary("+", _S.read(_e, "OUT"), 0.24)])]))))))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "MEDAL"), 0.06)))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "popped", true, "=", false)
		_S.invoke(_S.read(_v7, "lights"), "add", [_S.read(_v7, "MX"), _S.read(_v7, "MY"), 36, _S.prop(_S.read(_v7, "G"), 5), 0.7, 0.4])
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 12)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v9, "i"), 12), _S.read(_v9, "TAU")), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.2), 0.2])))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [40, 90]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.read(_v9, "MX"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), 9)), _S.binary("+", _S.read(_v9, "MY"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), 9)), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), 0.6), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.prop(_S.read(_v9, "G"), 7), _S.prop(_S.read(_v9, "G"), 6), _S.prop(_S.read(_v9, "G"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v9, "i"), 3)) else _S.invoke(_S.read(_v9, "R"), "range", [1.2, 1.8]))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.5), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("+", _S.read(_e, "MX"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 11), 11])), _S.binary("+", _S.read(_e, "MY"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 11), 9])), 0, _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 10])), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.3, 0.5]), _S.binary("-", _S.read(_e, "end"), _S.read(_e, "t"))]), _S.prop(_S.read(_e, "G"), 6), (1.4 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 0.6)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.call_value(_S.read(_e, "xAt"), [_S.read(_e, "t")]))
	_S.define(_e, "out", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.06)))
	_S.define(_e, "a", (0.5 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.05)) else (_S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.12), _S.binary("+", _S.read(_e, "OUT"), 0.24)])) if _S.truth(_S.read(_e, "out")) else 1)))
	if _S.truth(_S.binary("<=", _S.read(_e, "a"), 0)):
		return null
	_S.define(_e, "moving", _S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.binary("*", _S.read(_e, "IN"), 0.8)), func(): return _S.read(_e, "out")))
	if _S.truth(_S.read(_e, "moving")):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 8)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "y", _S.binary("+", _S.binary("+", _S.read(_v11, "PY"), 3), _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.read(_v11, "t"), 30)]), _S.read(_v11, "i"), 1]), _S.binary("-", _S.read(_v11, "PH"), 6))))
			_S.define(_v11, "L", _S.binary("+", 10, _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.read(_v11, "t"), 30)]), _S.read(_v11, "i"), 2]), 26)))
			_S.define(_v11, "x0", _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_v11, "x"), _S.binary("/", _S.read(_v11, "PW"), 2)), 2), _S.binary("*", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "i"), 3]), 6)))
			_S.invoke(_S.read(_v11, "p"), "line", [_S.read(_v11, "x0"), _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "Math"), "min", [106, _S.binary("+", _S.read(_v11, "x0"), _S.read(_v11, "L"))]), _S.read(_v11, "y"), _S.function_value(_v11, "_f8"), _S.function_value(_v11, "_f9")])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "SHINE"), _S.binary("+", _S.read(_e, "SHINE"), 0.36)]))
	_S.define(_e, "shine", (_S.binary("+", _S.binary("-", _S.read(_e, "PX"), 12), _S.binary("*", _S.binary("+", _S.read(_e, "PW"), 30), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.read(_e, "sh")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "sh"), 0), func(): return _S.binary("<", _S.read(_e, "sh"), 1))) else null))
	_S.call_value(_S.read(_e, "panel"), [_S.read(_e, "p"), _S.binary("+", _S.read(_e, "PX"), _S.read(_e, "x")), _S.read(_e, "PY"), _S.read(_e, "PW"), _S.read(_e, "PH"), _S.read(_e, "INK"), _S.merge([{"r": 4}, {"a": _S.read(_e, "a")}, {"shine": (null if _S.truth(_S.binary("===", _S.read(_e, "shine"), null)) else _S.binary("+", _S.read(_e, "shine"), _S.read(_e, "x")))}])])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.binary("+", _S.read(_e, "PX"), _S.read(_e, "x")), 4), _S.binary("+", _S.read(_e, "PY"), 1), _S.binary("-", _S.binary("+", _S.binary("+", _S.read(_e, "PX"), _S.read(_e, "x")), _S.read(_e, "PW")), 5), _S.binary("+", _S.read(_e, "PY"), 1), _S.prop(_S.read(_e, "G"), 4), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_e, "PX"), _S.read(_e, "x")), 3), _S.binary("+", _S.read(_e, "PY"), 1), _S.prop(_S.read(_e, "G"), 2)])
	_S.define(_e, "ti", _S.invoke(_S.invoke(_S.prop(_S.read(_e, "title"), "letters"), "filter", [_S.function_value(_e, "_f10")]), "map", [_S.function_value(_e, "_f11")]))
	_S.call_value(_S.read(_e, "drawWord"), [_S.read(_e, "p"), _S.read(_e, "ti"), _S.merge([{"fill": [_S.prop(_S.read(_e, "G"), 4), _S.prop(_S.read(_e, "G"), 5), _S.prop(_S.read(_e, "G"), 6)]}, {"edge": _S.prop(_S.read(_e, "G"), 7)}, {"under": _S.prop(_S.read(_e, "G"), 3)}, {"outline": _S.prop(_S.read(_e, "INK"), "outline")}, {"shadow": 0}, {"shine": (null if _S.truth(_S.binary("===", _S.read(_e, "shine"), null)) else _S.binary("+", _S.read(_e, "shine"), _S.read(_e, "x")))}, {"shineY": _S.read(_e, "PY")}, {"glint": _S.prop(_S.read(_e, "G"), 7)}])])
	_S.define(_e, "si", _S.invoke(_S.invoke(_S.prop(_S.read(_e, "sub"), "letters"), "filter", [_S.function_value(_e, "_f12")]), "map", [_S.function_value(_e, "_f13")]))
	_S.call_value(_S.read(_e, "drawWord"), [_S.read(_e, "p"), _S.read(_e, "si"), _S.merge([{"fill": [_S.call_value(_S.read(_e, "hex"), ["#9a94b0"]), _S.call_value(_S.read(_e, "hex"), ["#d8d4e6"]), _S.read(_e, "WHITE")]}, {"edge": _S.read(_e, "WHITE")}, {"under": _S.call_value(_S.read(_e, "hex"), ["#6e6886"])}, {"outline": _S.prop(_S.read(_e, "INK"), "outline")}, {"shadow": 0}, {"shine": (null if _S.truth(_S.binary("===", _S.read(_e, "shine"), null)) else _S.binary("+", _S.read(_e, "shine"), _S.read(_e, "x")))}, {"shineY": _S.read(_e, "PY")}])])
	_S.define(_e, "mk", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "MEDAL")))
	if _S.truth(_S.binary(">", _S.read(_e, "mk"), 0)):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "s", (1.5 if _S.truth(_S.binary("<", _S.read(_v12, "mk"), 0.035)) else _S.binary("+", 1, _S.binary("*", _S.binary("*", 0.35, _S.invoke(_S.read(_v12, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v12, "mk")), 16)])), _S.invoke(_S.read(_v12, "Math"), "cos", [_S.binary("*", _S.read(_v12, "mk"), 28)])))))
		_S.call_value(_S.read(_v12, "medal"), [_S.read(_v12, "p"), _S.read(_v12, "G"), _S.read(_v12, "B"), _S.binary("+", _S.read(_v12, "MX"), _S.read(_v12, "x")), _S.read(_v12, "MY"), _S.read(_v12, "s"), _S.binary("<", _S.read(_v12, "mk"), 0.07), (null if _S.truth(_S.binary("===", _S.read(_v12, "shine"), null)) else _S.binary("+", _S.binary("-", _S.read(_v12, "shine"), _S.read(_v12, "MX")), 4))])
		_S.invoke(_S.read(_v12, "p"), "glow", [_S.binary("+", _S.read(_v12, "MX"), _S.read(_v12, "x")), _S.read(_v12, "MY"), 20, _S.prop(_S.read(_v12, "G"), 5), _S.binary("+", _S.binary("*", 0.3, _S.read(_v12, "a")), (_S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v12, "mk"), 0.15))) if _S.truth(_S.binary("<", _S.read(_v12, "mk"), 0.15)) else 0))])
		_S.define(_v12, "g", _S.binary("/", _S.binary("%", _S.binary("-", _S.read(_v12, "t"), 1.5), 0.9), 0.9))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v12, "t"), 1.5), func(): return _S.binary("<", _S.read(_v12, "g"), 0.25))):
			_S.call_value(_S.read(_v12, "sparkle"), [_S.read(_v12, "p"), _S.binary("-", _S.binary("+", _S.read(_v12, "MX"), _S.read(_v12, "x")), 4), _S.binary("-", _S.read(_v12, "MY"), 4), _S.binary("*", 4, _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v12, "g"), 0.25), _S.prop(_S.read(_v12, "Math"), "PI"))])), _S.prop(_S.read(_v12, "G"), 7), _S.prop(_S.read(_v12, "G"), 6), 0.5])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "G"), 4)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "a"), _S.binary("-", 1.1, _S.read(_e, "u")))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.binary("+", _S.read(_e, "TX"), _S.read(_e, "x")), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), 2))}, {"y": _S.binary("+", _S.read(_e, "PY"), 5)}, {"sx": 2}, {"sy": 2}, {"a": _S.read(_e, "a")}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"x": _S.binary("+", _S.binary("+", _S.read(_e, "TX"), _S.read(_e, "x")), _S.binary("*", _S.prop(_S.read(_e, "L"), "x"), 2))}, {"y": _S.binary("+", _S.read(_e, "PY"), 19)}, {"sx": 2}, {"sy": 2}, {"a": _S.read(_e, "a")}])
