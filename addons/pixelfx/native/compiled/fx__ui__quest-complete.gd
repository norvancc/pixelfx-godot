@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/quest-complete.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "ribbon", _S.function_value(_e, "_f0"))
	_S.define(_e, "seal", _S.function_value(_e, "_f3"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Quest complete"}, {"desc": "A stitched ribbon unrolls from the middle, QUEST COMPLETE types on letter by letter, a gold seal stamps down and ticks, stars pop; then it all rolls away."}, {"tags": ["ui", "quest", "banner", "reward", "text", "one-shot"]}, {"size": [204, 92]}, {"origin": [102, 46]}, {"duration": 2.6}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a1405", "#5c3008", "#9a5a0e", "#d48e18", "#f5b92c", "#ffde5e", "#fff4bc", "#ffffff"]}, {"ribbon": ["#1e0608", "#45101a", "#7a1a26", "#ad2632", "#d8433f", "#f27a5e", "#ffb79a"]}, {"text": "QUEST COMPLETE"}, {"seed": 8}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", 66)
	_S.define(_e, "BH", 8)
	_S.define(_e, "OPEN", 0.32)
	_S.define(_e, "TYPE", 0.2)
	_S.define(_e, "STEP", 0.036)
	_S.define(_e, "STAMP", 0.95)
	_S.define(_e, "SX", 64)
	_S.define(_e, "SY", 4)
	_S.define(_e, "POPSEAL", 2)
	_S.define(_e, "ROLL", 2.08)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "Rb", _S.arg(_args, 1))
	_S.define(_e, "G", _S.arg(_args, 2))
	_S.define(_e, "l", _S.arg(_args, 3))
	_S.define(_e, "tails", _S.arg(_args, 4))
	_S.define(_e, "t", _S.arg(_args, 5))
	if _S.truth(_S.binary("<", _S.read(_e, "l"), 1)):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "tails"), 0.02)):
		for _v0 in _S.array([_S.unary("-", 1), 1]):
			var _v1 = _S.scope(_e)
			_S.define(_v1, "s", _v0)
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "drop", _S.binary("*", 6, _S.read(_v2, "tails")))
			_S.define(_v2, "x0", _S.binary("*", _S.read(_v2, "s"), _S.binary("-", _S.read(_v2, "l"), 8)))
			_S.define(_v2, "x1", _S.binary("*", _S.read(_v2, "s"), _S.binary("+", _S.read(_v2, "l"), _S.binary("*", 16, _S.read(_v2, "tails")))))
			_S.invoke(_S.read(_v2, "p"), "shade", [_S.binary("-", _S.invoke(_S.read(_v2, "Math"), "min", [_S.read(_v2, "x0"), _S.read(_v2, "x1")]), 1), _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_v2, "BH")), _S.read(_v2, "drop")), 1), _S.binary("+", _S.invoke(_S.read(_v2, "Math"), "max", [_S.read(_v2, "x0"), _S.read(_v2, "x1")]), 1), _S.binary("+", _S.binary("+", _S.read(_v2, "BH"), _S.read(_v2, "drop")), 1), _S.function_value(_v2, "_f1")])
			_S.invoke(_S.read(_v2, "p"), "tri", [_S.binary("*", _S.read(_v2, "s"), _S.binary("-", _S.read(_v2, "l"), 8)), _S.read(_v2, "BH"), _S.binary("*", _S.read(_v2, "s"), _S.binary("-", _S.read(_v2, "l"), 1)), _S.read(_v2, "BH"), _S.binary("*", _S.read(_v2, "s"), _S.binary("-", _S.read(_v2, "l"), 8)), _S.binary("+", _S.read(_v2, "BH"), _S.read(_v2, "drop")), _S.prop(_S.read(_v2, "Rb"), 0)])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "l")), 1), _S.binary("-", _S.unary("-", _S.read(_e, "BH")), 1), _S.binary("+", _S.read(_e, "l"), 1), _S.binary("+", _S.read(_e, "BH"), 1), _S.function_value(_e, "_f2")])
	if _S.truth(_S.binary("<", _S.read(_e, "tails"), 0.02)):
		for _v3 in _S.array([_S.unary("-", 1), 1]):
			var _v4 = _S.scope(_e)
			_S.define(_v4, "s", _v3)
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "x", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "l")))
			_S.invoke(_S.read(_v5, "p"), "rect", [_S.binary("-", _S.invoke(_S.read(_v5, "Math"), "round", [_S.read(_v5, "x")]), 2), _S.binary("-", _S.unary("-", _S.read(_v5, "BH")), 2), 4, _S.binary("+", _S.binary("*", _S.read(_v5, "BH"), 2), 4), _S.prop(_S.read(_v5, "Rb"), 0)])
			_S.invoke(_S.read(_v5, "p"), "rect", [_S.binary("-", _S.invoke(_S.read(_v5, "Math"), "round", [_S.read(_v5, "x")]), 1), _S.binary("-", _S.unary("-", _S.read(_v5, "BH")), 1), 1, _S.binary("+", _S.binary("*", _S.read(_v5, "BH"), 2), 2), _S.prop(_S.read(_v5, "Rb"), 4)])
			_S.invoke(_S.read(_v5, "p"), "rect", [_S.invoke(_S.read(_v5, "Math"), "round", [_S.read(_v5, "x")]), _S.binary("-", _S.unary("-", _S.read(_v5, "BH")), 1), 1, _S.binary("+", _S.binary("*", _S.read(_v5, "BH"), 2), 2), _S.prop(_S.read(_v5, "Rb"), 2)])
			_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("-", _S.invoke(_S.read(_v5, "Math"), "round", [_S.read(_v5, "x")]), 1), _S.binary("-", _S.unary("-", _S.read(_v5, "BH")), 1), _S.prop(_S.read(_v5, "Rb"), 6)])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0"))))
	_S.define(_e, "v", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "drop")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.read(_e, "u"), 1)), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.read(_e, "BH")))):
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "u"), _S.binary("-", 1, _S.binary("/", _S.binary("*", 0.3, _S.binary("-", _S.read(_e, "BH"), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]))), _S.read(_e, "BH"))))):
		return null
	_S.define(_e, "e", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "BH"), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")])), _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0"))), _S.read(_e, "s"))]))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "e"), 1), func(): return _S.binary("<", _S.read(_e, "u"), 0.02))):
		return _S.prop(_S.read(_e, "Rb"), 0)
	return (_S.prop(_S.read(_e, "Rb"), 3) if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.binary("+", _S.unary("-", _S.read(_e, "BH")), 2))) else (_S.prop(_S.read(_e, "Rb"), 2) if _S.truth(_S.binary("<", _S.read(_e, "v"), 0)) else _S.prop(_S.read(_e, "Rb"), 1)))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "ax", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]))
	_S.define(_e, "v", _S.read(_e, "y"))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "ax"), _S.read(_e, "l")), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), _S.read(_e, "BH")))):
		return null
	_S.define(_e, "e", _S.invoke(_S.read(_e, "Math"), "min", [_S.binary("-", _S.read(_e, "l"), _S.read(_e, "ax")), _S.binary("-", _S.read(_e, "BH"), _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]))]))
	if _S.truth(_S.binary("<", _S.read(_e, "e"), 1)):
		return _S.prop(_S.read(_e, "Rb"), 0)
	if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.binary("+", _S.unary("-", _S.read(_e, "BH")), 2))):
		return _S.prop(_S.read(_e, "Rb"), 5)
	if _S.truth(_S.binary(">", _S.read(_e, "v"), _S.binary("-", _S.read(_e, "BH"), 2))):
		return _S.prop(_S.read(_e, "Rb"), 1)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("||", _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_e, "v"), _S.read(_e, "BH")), 2.5)]), 0.5), func(): return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.binary("-", _S.read(_e, "v"), _S.read(_e, "BH")), 3.5)]), 0.5)), func(): return _S.binary("!==", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.read(_e, "x"), 0.5)]), 3), 0)), func(): return _S.binary("<", _S.read(_e, "ax"), _S.binary("-", _S.read(_e, "l"), 3)))):
		return _S.prop(_S.read(_e, "G"), 3)
	return (_S.prop(_S.read(_e, "Rb"), 4) if _S.truth(_S.binary("<", _S.read(_e, "v"), _S.unary("-", 1))) else _S.prop(_S.read(_e, "Rb"), 3))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "G", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "r", _S.arg(_args, 4))
	_S.define(_e, "sx", _S.arg(_args, 5))
	_S.define(_e, "sy", _S.arg(_args, 6))
	_S.define(_e, "white", _S.arg(_args, 7))
	_S.define(_e, "k", _S.arg(_args, 8))
	_S.define(_e, "M", _S.binary("+", _S.binary("*", _S.read(_e, "r"), 1.25), 2))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "M"), _S.read(_e, "sx"))), _S.binary("-", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "M"), _S.read(_e, "sy"))), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "M"), _S.read(_e, "sx"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "M"), _S.read(_e, "sy"))), _S.function_value(_e, "_f4")])
	if _S.truth(_S.logical("||", _S.read(_e, "white"), func(): return _S.binary("<=", _S.read(_e, "k"), 0))):
		return null
	_S.define(_e, "pts", _S.invoke([[_S.unary("-", 5), 0], [_S.unary("-", 1.5), 3.5], [5.5, _S.unary("-", 4.5)]], "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "len1", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.prop(_S.prop(_S.read(_e, "pts"), 1), 0), _S.prop(_S.prop(_S.read(_e, "pts"), 0), 0)), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "pts"), 1), 1), _S.prop(_S.prop(_S.read(_e, "pts"), 0), 1))]))
	_S.define(_e, "len2", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.prop(_S.prop(_S.read(_e, "pts"), 2), 0), _S.prop(_S.prop(_S.read(_e, "pts"), 1), 0)), _S.binary("-", _S.prop(_S.prop(_S.read(_e, "pts"), 2), 1), _S.prop(_S.prop(_S.read(_e, "pts"), 1), 1))]))
	_S.define(_e, "done", _S.binary("*", _S.read(_e, "k"), _S.binary("+", _S.read(_e, "len1"), _S.read(_e, "len2"))))
	_S.define(_e, "segs", [[_S.prop(_S.read(_e, "pts"), 0), _S.prop(_S.read(_e, "pts"), 1), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("/", _S.read(_e, "done"), _S.read(_e, "len1"))])], [_S.prop(_S.read(_e, "pts"), 1), _S.prop(_S.read(_e, "pts"), 2), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "done"), _S.read(_e, "len1")), _S.read(_e, "len2"))])]])
	for _v7 in _S.array([[4.2, _S.prop(_S.read(_e, "G"), 0)], [2.4, _S.read(_e, "WHITE")]]):
		var _v8 = _S.scope(_e)
		var _v9 = _v7
		_S.define(_v8, "w", _S.prop(_v9, 0))
		_S.define(_v8, "c", _S.prop(_v9, 1))
		for _v10 in _S.array(_S.read(_v8, "segs")):
			var _v11 = _S.scope(_v8)
			var _v12 = _v10
			_S.define(_v11, "a", _S.prop(_v12, 0))
			_S.define(_v11, "b", _S.prop(_v12, 1))
			_S.define(_v11, "u", _S.prop(_v12, 2))
			if _S.truth(_S.binary(">", _S.read(_v11, "u"), 0)):
				_S.invoke(_S.read(_v11, "p"), "beam", [_S.prop(_S.read(_v11, "a"), 0), _S.prop(_S.read(_v11, "a"), 1), _S.binary("+", _S.prop(_S.read(_v11, "a"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v11, "b"), 0), _S.prop(_S.read(_v11, "a"), 0)), _S.read(_v11, "u"))), _S.binary("+", _S.prop(_S.read(_v11, "a"), 1), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v11, "b"), 1), _S.prop(_S.read(_v11, "a"), 1)), _S.read(_v11, "u"))), _S.read(_v11, "w"), _S.read(_v11, "c")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.binary("/", _S.binary("-", _S.read(_e, "px"), _S.read(_e, "x")), _S.read(_e, "sx")))
	_S.define(_e, "dy", _S.binary("/", _S.binary("-", _S.read(_e, "py"), _S.read(_e, "y")), _S.read(_e, "sy")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	_S.define(_e, "an", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "edge", _S.binary("*", _S.read(_e, "r"), _S.binary("+", 1, _S.binary("*", 0.09, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "an"), 14)])))))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "edge"))):
		return null
	if _S.truth(_S.read(_e, "white")):
		return (_S.prop(_S.read(_e, "G"), 5) if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "edge"), _S.read(_e, "d")), 1)) else _S.read(_e, "WHITE"))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "edge"), _S.read(_e, "d")), 1)):
		return _S.prop(_S.read(_e, "G"), 0)
	_S.define(_e, "l", _S.binary("/", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), 0.6), _S.binary("*", _S.read(_e, "dy"), 0.8))), _S.read(_e, "r")))
	if _S.truth(_S.binary("<", _S.binary("-", _S.read(_e, "edge"), _S.read(_e, "d")), 3)):
		return (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.3)) else (_S.prop(_S.read(_e, "G"), 5) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.3))) else _S.prop(_S.read(_e, "G"), 3)))
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "d"), _S.binary("*", _S.read(_e, "r"), 0.66))]), 0.5)):
		return (_S.prop(_S.read(_e, "G"), 3) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0)) else _S.prop(_S.read(_e, "G"), 2))
	return (_S.prop(_S.read(_e, "G"), 7) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.45)) else (_S.prop(_S.read(_e, "G"), 6) if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.1)) else (_S.prop(_S.read(_e, "G"), 5) if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.35))) else _S.prop(_S.read(_e, "G"), 4))))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v6 = _S.arg(_args, 0)
	_S.define(_e, "a", _S.prop(_v6, 0))
	_S.define(_e, "b", _S.prop(_v6, 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "a"), _S.read(_e, "sx"))), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "b"), _S.read(_e, "sy")))]

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Rb", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ribbon"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "G"), 7), _S.prop(_S.read(_e, "G"), 6), _S.prop(_S.read(_e, "G"), 5), _S.prop(_S.read(_e, "G"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "word", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text"), "mini"]))
	_S.define(_e, "TS", 2)
	_S.define(_e, "TW", _S.binary("*", _S.prop(_S.read(_e, "word"), "w"), _S.read(_e, "TS")))
	_S.define(_e, "TX", _S.binary("-", _S.binary("/", _S.unary("-", _S.read(_e, "TW")), 2), 4))
	_S.define(_e, "TY", _S.unary("-", 5))
	_S.define(_e, "glyphs", _S.invoke(_S.prop(_S.read(_e, "word"), "letters"), "filter", [_S.function_value(_e, "_f7")]))
	_S.define(_e, "sats", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 7}]), _S.function_value(_e, "_f8")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "stamped", false)
	_S.define(_e, "popped", false)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"draw": _S.function_value(_e, "_f10")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "Lt", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "Lt"), "g")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"x": _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("/", _S.read(_e, "i"), 6), 0.5), 140), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]))}, {"y": _S.binary("*", (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)), _S.invoke(_S.read(_e, "R"), "range", [15, 22]))}, {"t0": _S.binary("+", _S.binary("+", _S.binary("+", _S.read(_e, "STAMP"), 0.12), _S.binary("*", _S.read(_e, "i"), 0.12)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.04]))}, {"dur": _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.45])}, {"L": _S.invoke(_S.read(_e, "R"), "range", [3, 6])}])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "stamped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "STAMP")))):
		var _v13 = _S.scope(_e)
		_S.write(_v13, "stamped", true, "=", false)
		_S.invoke(_S.read(_v13, "lights"), "add", [_S.read(_v13, "SX"), _S.read(_v13, "SY"), 40, _S.prop(_S.read(_v13, "G"), 5), 0.7, 0.35])
		_S.invoke(_S.read(_v13, "lights"), "add", [_S.read(_v13, "SX"), _S.read(_v13, "SY"), 18, _S.read(_v13, "WHITE"), 0.7, 0.1])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "i"), 12)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v15, "i"), 12), _S.read(_v15, "TAU")), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 0.2), 0.2])))
			_S.define(_v15, "sp", _S.binary("*", _S.invoke(_S.read(_v15, "R"), "range", [40, 80]), (0.6 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "an")]), 0)) else 1)))
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "STAR"), _S.binary("+", _S.read(_v15, "SX"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "an")]), 11)), _S.binary("+", _S.read(_v15, "SY"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "an")]), 11)), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "an")]), _S.read(_v15, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "an")]), _S.read(_v15, "sp")), 0.7), _S.invoke(_S.read(_v15, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "G"), 7), _S.prop(_S.read(_v15, "G"), 6), _S.prop(_S.read(_v15, "G"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v15, "i"), 3)) else _S.invoke(_S.read(_v15, "R"), "range", [1.2, 1.8]))])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "STAMP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POPSEAL"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "L")), _S.read(_e, "L")]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "BH")), _S.read(_e, "BH")]), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [8, 20])), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.4, 0.8]), _S.binary("-", _S.read(_e, "end"), _S.read(_e, "t"))]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "G"), 6), _S.prop(_S.read(_e, "G"), 5)]]), 0.6])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POPSEAL"), 0.05)))):
		var _v16 = _S.scope(_e)
		_S.write(_v16, "popped", true, "=", false)
		_S.invoke(_S.read(_v16, "lights"), "add", [_S.read(_v16, "SX"), _S.read(_v16, "SY"), 30, _S.prop(_S.read(_v16, "G"), 6), 0.6, 0.2])
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 8)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "an", _S.invoke(_S.read(_v18, "R"), "range", [0, _S.read(_v18, "TAU")]))
			_S.define(_v18, "sp", _S.invoke(_S.read(_v18, "R"), "range", [40, 90]))
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "STAR"), _S.binary("+", _S.read(_v18, "SX"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "an")]), 6)), _S.binary("+", _S.read(_v18, "SY"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "an")]), 6)), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "an")]), _S.read(_v18, "sp")), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "an")]), _S.read(_v18, "sp")), _S.invoke(_S.read(_v18, "Math"), "min", [_S.invoke(_S.read(_v18, "R"), "range", [0.25, 0.4]), _S.binary("-", _S.read(_v18, "end"), _S.read(_v18, "t"))]), _S.invoke(_S.read(_v18, "R"), "pick", [[_S.prop(_S.read(_v18, "G"), 7), _S.prop(_S.read(_v18, "G"), 6)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v18, "i"), 2)) else 1.5)])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	var _v19 = _S.call_value(_S.read(_e, "shake"), [_S.read(_e, "t"), 2, _S.read(_e, "STAMP"), 0.18, _S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "jx", _S.prop(_v19, 0))
	_S.define(_e, "jy", _S.prop(_v19, 1))
	_S.define(_e, "l", _S.binary("*", _S.read(_e, "L"), (_S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0, _S.read(_e, "OPEN")])]) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ROLL"))) else _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "ROLL"), _S.binary("+", _S.read(_e, "ROLL"), 0.26)])])))))
	_S.define(_e, "tails", _S.binary("*", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.02), _S.binary("+", _S.read(_e, "OPEN"), 0.12)]), (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "ROLL"))) else 0)))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 1.2, 1.5]))
	_S.define(_e, "shine", (_S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "L")), 10), _S.binary("*", _S.binary("+", _S.binary("*", 2, _S.read(_e, "L")), 20), _S.read(_e, "sh"))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "sh"), 0), func(): return _S.binary("<", _S.read(_e, "sh"), 1))) else null))
	_S.call_value(_S.read(_e, "ribbon"), [_S.read(_e, "p"), _S.read(_e, "Rb"), _S.read(_e, "G"), _S.read(_e, "l"), _S.invoke(_S.read(_e, "ease"), "outBack", [_S.read(_e, "tails"), 2]), _S.read(_e, "t")])
	if _S.truth(_S.binary("!==", _S.read(_e, "shine"), null)):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "y", _S.binary("+", _S.unary("-", _S.read(_v20, "BH")), 1))
		while _S.truth(_S.binary("<", _S.read(_v20, "y"), _S.read(_v20, "BH"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "x", _S.binary("+", _S.read(_v21, "shine"), _S.binary("*", _S.binary("+", _S.read(_v21, "y"), _S.read(_v21, "BH")), 0.6)))
			if _S.truth(_S.binary("<", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.read(_v21, "x")]), _S.binary("-", _S.read(_v21, "l"), 2))):
				_S.last([_S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "x"), _S.read(_v21, "y"), _S.prop(_S.read(_v21, "Rb"), 6)]), _S.invoke(_S.read(_v21, "p"), "px", [_S.binary("+", _S.read(_v21, "x"), 1), _S.read(_v21, "y"), _S.prop(_S.read(_v21, "Rb"), 5)])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "y", 1, "+=", true)
	_S.define(_e, "items", [])
	_S.invoke(_S.read(_e, "glyphs"), "forEach", [_S.function_value(_e, "_f11")])
	_S.call_value(_S.read(_e, "drawWord"), [_S.read(_e, "p"), _S.read(_e, "items"), _S.merge([{"fill": [_S.prop(_S.read(_e, "G"), 4), _S.prop(_S.read(_e, "G"), 5), _S.prop(_S.read(_e, "G"), 6), _S.prop(_S.read(_e, "G"), 7)]}, {"edge": _S.read(_e, "WHITE")}, {"under": _S.prop(_S.read(_e, "G"), 3)}, {"outline": _S.prop(_S.read(_e, "Rb"), 0)}, {"shadow": _S.prop(_S.read(_e, "Rb"), 1)}])])
	_S.define(_e, "dk", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "STAMP"), 0.12), _S.read(_e, "STAMP")]))
	_S.define(_e, "pk", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POPSEAL")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "dk"), 0), func(): return _S.binary("<", _S.read(_e, "pk"), 0.08))):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "fall", _S.binary("-", 1, _S.invoke(_S.read(_v22, "ease"), "inQuad", [_S.read(_v22, "dk")])))
		_S.define(_v22, "sq", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_v22, "t"), _S.read(_v22, "STAMP"))), 30)]), (1 if _S.truth(_S.binary(">=", _S.read(_v22, "t"), _S.read(_v22, "STAMP"))) else 0)))
		_S.define(_v22, "s", _S.binary("+", 1, _S.binary("*", 0.8, _S.read(_v22, "fall"))))
		_S.define(_v22, "sx", _S.binary("*", _S.read(_v22, "s"), _S.binary("+", 1, _S.binary("*", 0.2, _S.read(_v22, "sq")))))
		_S.define(_v22, "sy", _S.binary("*", _S.read(_v22, "s"), _S.binary("-", 1, _S.binary("*", 0.2, _S.read(_v22, "sq")))))
		if _S.truth(_S.binary(">", _S.read(_v22, "pk"), 0)):
			_S.write(_v22, "sx", _S.write(_v22, "sy", _S.binary("+", 1, _S.binary("*", 0.3, _S.binary("/", _S.read(_v22, "pk"), 0.08))), "=", false), "=", false)
		_S.define(_v22, "white", _S.logical("||", _S.logical("&&", _S.binary(">=", _S.read(_v22, "t"), _S.read(_v22, "STAMP")), func(): return _S.binary("<", _S.read(_v22, "t"), _S.binary("+", _S.read(_v22, "STAMP"), 0.05))), func(): return _S.binary(">", _S.read(_v22, "pk"), 0)))
		if _S.truth(_S.binary("<", _S.read(_v22, "dk"), 1)):
			_S.invoke(_S.read(_v22, "p"), "ellipse", [_S.read(_v22, "SX"), _S.binary("+", _S.read(_v22, "SY"), 12), _S.binary("*", 10, _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v22, "fall")))), 2, _S.prop(_S.read(_v22, "Rb"), 0), _S.binary("*", 0.5, _S.read(_v22, "dk"))])
		_S.call_value(_S.read(_v22, "seal"), [_S.read(_v22, "p"), _S.read(_v22, "G"), _S.binary("+", _S.read(_v22, "SX"), _S.read(_v22, "jx")), _S.binary("+", _S.binary("-", _S.read(_v22, "SY"), _S.binary("*", 14, _S.read(_v22, "fall"))), _S.read(_v22, "jy")), 11, _S.read(_v22, "sx"), _S.read(_v22, "sy"), _S.read(_v22, "white"), _S.call_value(_S.read(_v22, "seg"), [_S.read(_v22, "t"), _S.binary("+", _S.read(_v22, "STAMP"), 0.08), _S.binary("+", _S.read(_v22, "STAMP"), 0.24)])])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "SX"), _S.read(_v22, "SY"), 22, _S.prop(_S.read(_v22, "G"), 5), _S.binary("+", 0.3, (0.4 if _S.truth(_S.read(_v22, "white")) else 0))])
	_S.define(_e, "rk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "STAMP")), 0.3))
	_S.define(_e, "rr", _S.binary("+", 12, _S.binary("*", 13, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "rk")]))))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "rk"), 0), func(): return _S.binary("<", _S.read(_e, "rk"), 1))):
		_S.invoke(_S.read(_e, "p"), "ellipse", [_S.read(_e, "SX"), _S.read(_e, "SY"), _S.binary("*", _S.read(_e, "rr"), 1.15), _S.read(_e, "rr"), (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "rk"), 0.3)) else _S.prop(_S.read(_e, "G"), 5)), _S.function_value(_e, "_f12")])
	for _v23 in _S.array(_S.read(_e, "sats")):
		var _v24 = _S.scope(_e)
		_S.define(_v24, "s", _v23)
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "u", _S.binary("/", _S.binary("-", _S.read(_v25, "t"), _S.prop(_S.read(_v25, "s"), "t0")), _S.prop(_S.read(_v25, "s"), "dur")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v25, "u"), 0), func(): return _S.binary("<", _S.read(_v25, "u"), 1))):
			_S.call_value(_S.read(_v25, "sparkle"), [_S.read(_v25, "p"), _S.prop(_S.read(_v25, "s"), "x"), _S.prop(_S.read(_v25, "s"), "y"), _S.binary("*", _S.prop(_S.read(_v25, "s"), "L"), _S.invoke(_S.read(_v25, "Math"), "pow", [_S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.read(_v25, "u"), _S.prop(_S.read(_v25, "Math"), "PI"))]), 0.7])), _S.prop(_S.read(_v25, "G"), 6), _S.prop(_S.read(_v25, "G"), 5), 0.5])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, 0, 76, _S.prop(_S.read(_e, "G"), 4), _S.binary("*", _S.binary("*", 0.2, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0.2, 0.5])), _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "ROLL"), _S.binary("+", _S.read(_e, "ROLL"), 0.2)])))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "Lt", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "TYPE"), _S.binary("*", _S.read(_e, "i"), _S.read(_e, "STEP")))))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.read(_e, "TX"), _S.binary("*", _S.prop(_S.read(_e, "Lt"), "x"), _S.read(_e, "TS"))), _S.read(_e, "jx")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "u"), 0), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "x"), _S.prop(_S.read(_e, "Lt"), "w"))]), _S.binary("-", _S.read(_e, "l"), 3)))):
		return null
	_S.define(_e, "s", (2.6 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.035)) else _S.read(_e, "TS")))
	_S.invoke(_S.read(_e, "items"), "push", [_S.merge([{"g": _S.prop(_S.read(_e, "Lt"), "g")}, {"x": _S.binary("-", _S.read(_e, "x"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "s"), _S.read(_e, "TS")), _S.prop(_S.read(_e, "Lt"), "w")), 2))}, {"y": _S.binary("-", _S.binary("+", _S.read(_e, "TY"), _S.read(_e, "jy")), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "s"), _S.read(_e, "TS")), 5), 2))}, {"sx": _S.read(_e, "s")}, {"sy": _S.read(_e, "s")}, {"flash": (1 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.07)) else 0)}])])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return (_S.binary("-", 1.2, _S.read(_e, "rk")) if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", 1, _S.binary("/", 1.4, _S.read(_e, "rr"))))) else 0)
