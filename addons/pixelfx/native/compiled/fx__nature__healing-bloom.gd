@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/healing-bloom.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "drawLeaf", _S.import_value("fx/nature/_lib.js", "drawLeaf"))
	_S.define(_e, "cross", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Healing bloom"}, {"desc": "A sprout pushes up and unfurls, a bud swells and opens round a glowing golden heart in a flare of healing light; its petals lift away one by one as motes."}, {"tags": ["nature", "heal", "flower", "plant", "buff", "ground", "one-shot"]}, {"size": [124, 120]}, {"origin": [62, 108]}, {"duration": 3.3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0c1a10", "#173a1a", "#24582a", "#357a34", "#52a03e", "#86c84e", "#c4ec7a", "#f4ffd0"]}, {"petal": ["#4a1a3a", "#a8406e", "#ec8ab0", "#ffd8e8"]}, {"heart": ["#a8641a", "#f0b42e", "#ffe680", "#fffbe0"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STEM", 0.42)
	_S.define(_e, "BUD", 0.75)
	_S.define(_e, "OPEN", 1.05)
	_S.define(_e, "LIFT", 1.7)
	_S.define(_e, "WILT", 2.4)
	_S.define(_e, "H", 36)
	_S.define(_e, "NPET", 6)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "L", _S.arg(_args, 3))
	_S.define(_e, "C", _S.arg(_args, 4))
	_S.define(_e, "a", _S.arg(_args, 5))
	_S.define(_e, "glint", _S.arg(_args, 6))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]))
	_S.define(_e, "ins", _S.function_value(_e, "_f1"))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "dy", _S.binary("-", _S.unary("-", _S.read(_v0, "L")), 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "dy"), _S.binary("+", _S.read(_v0, "L"), 1))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "dx", _S.binary("-", _S.unary("-", _S.read(_v1, "L")), 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "dx"), _S.binary("+", _S.read(_v1, "L"), 1))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.call_value(_S.read(_v2, "ins"), [_S.read(_v2, "dx"), _S.read(_v2, "dy")])):
				_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("+", _S.read(_v2, "X"), _S.read(_v2, "dx")), _S.binary("+", _S.read(_v2, "Y"), _S.read(_v2, "dy")), (_S.read(_v2, "WHITE") if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v2, "glint"), func(): return _S.unary("!", _S.read(_v2, "dx"))), func(): return _S.unary("!", _S.read(_v2, "dy")))) else (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v2, "dy"), 0), func(): return _S.binary("<", _S.read(_v2, "dx"), 0))) else _S.prop(_S.read(_v2, "C"), 5))), _S.read(_v2, "a")])
			else:
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v2, "L"), 1), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v2, "ins"), [_S.binary("-", _S.read(_v2, "dx"), 1), _S.read(_v2, "dy")]), func(): return _S.call_value(_S.read(_v2, "ins"), [_S.binary("+", _S.read(_v2, "dx"), 1), _S.read(_v2, "dy")])), func(): return _S.call_value(_S.read(_v2, "ins"), [_S.read(_v2, "dx"), _S.binary("-", _S.read(_v2, "dy"), 1)])), func(): return _S.call_value(_S.read(_v2, "ins"), [_S.read(_v2, "dx"), _S.binary("+", _S.read(_v2, "dy"), 1)])))):
					_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("+", _S.read(_v2, "X"), _S.read(_v2, "dx")), _S.binary("+", _S.read(_v2, "Y"), _S.read(_v2, "dy")), _S.prop(_S.read(_v2, "C"), 2), _S.binary("*", _S.read(_v2, "a"), 0.8)])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "dx", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "dy", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", 5, _S.binary("*", _S.read(_e, "L"), 2)), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.35, _S.read(_e, "a"))])
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	_S.define(_e, "dy", _S.arg(_args, 1))
	return _S.logical("||", _S.logical("&&", _S.binary("===", _S.read(_e, "dx"), 0), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dy")]), _S.read(_e, "L"))), func(): return _S.logical("&&", _S.binary("===", _S.read(_e, "dy"), 0), func(): return _S.binary("<=", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dx")]), _S.read(_e, "L"))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "petal", _S.function_value(_e, "_f3"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Pt", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "petal"), 4]))
	_S.define(_e, "Ht", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "heart"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f4"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "Ht"), 3), _S.prop(_S.read(_e, "Ht"), 2), _S.prop(_S.read(_e, "Ht"), 1), _S.prop(_S.read(_e, "Ht"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "flying", [])
	_S.define(_e, "glyphs", [])
	_S.define(_e, "petals", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "NPET")}]), _S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "sprouted", false)
	_S.define(_e, "grow", _S.function_value(_e, "_f6"))
	_S.define(_e, "sway", _S.function_value(_e, "_f7"))
	_S.define(_e, "stem", _S.function_value(_e, "_f8"))
	_S.define(_e, "open", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f10")}, {"drawBack": _S.function_value(_e, "_f11")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "top", _S.arg(_args, 2))
	_S.define(_e, "op", _S.call_value(_S.read(_e, "open"), []))
	_S.define(_e, "e", _S.call_value(_S.read(_e, "lerp"), [0.15, _S.binary("-", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), 0.2), _S.read(_e, "op")]))
	_S.define(_e, "dx", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "e")]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "q"), "az")])))
	_S.define(_e, "dz", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "e")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "q"), "az")])))
	_S.define(_e, "dy", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "e")])))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "lerp"), [8, 12, _S.read(_e, "op")]))
	_S.define(_e, "len", _S.binary("*", _S.read(_e, "L"), _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")])))
	_S.define(_e, "ang", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	_S.define(_e, "back", _S.binary("<", _S.read(_e, "dz"), 0))
	_S.define(_e, "cy", _S.binary("-", _S.prop(_S.read(_e, "top"), 1), 3))
	if _S.truth(_S.binary("<", _S.read(_e, "len"), 1.5)):
		return null
	_S.call_value(_S.read(_e, "drawLeaf"), [_S.read(_e, "p"), _S.binary("+", _S.prop(_S.read(_e, "top"), 0), _S.binary("*", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "L")), 0.5)), _S.binary("+", _S.read(_e, "cy"), _S.binary("*", _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "L")), 0.5)), _S.binary("+", _S.read(_e, "len"), 1), _S.binary("+", 3, _S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dz")])), 0.8)), _S.read(_e, "ang"), (0.9 if _S.truth(_S.read(_e, "back")) else 0.2), ([_S.prop(_S.read(_e, "Pt"), 0), _S.prop(_S.read(_e, "Pt"), 0), _S.prop(_S.read(_e, "Pt"), 1), _S.prop(_S.read(_e, "Pt"), 2)] if _S.truth(_S.read(_e, "back")) else [_S.prop(_S.read(_e, "Pt"), 0), _S.prop(_S.read(_e, "Pt"), 1), _S.prop(_S.read(_e, "Pt"), 2), _S.prop(_S.read(_e, "Pt"), 3)])])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"az": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), _S.read(_e, "NPET")), _S.read(_e, "TAU")), 0.3)}, {"off": _S.binary("%", _S.binary("*", _S.read(_e, "i"), 0.7), 1)}, {"gone": false}, {"at": _S.binary("+", _S.read(_e, "LIFT"), _S.binary("*", _S.binary("%", _S.binary("*", _S.read(_e, "i"), 0.37), 1), 0.55))}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "STEM"))])]), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "WILT")), 0.6)])])))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 2.6)]), 1.4), _S.call_value(_S.read(_e, "smooth"), [0.2, 0.6, _S.read(_e, "t")]))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.call_value(_S.read(_e, "grow"), []))
	_S.define(_e, "pts", [])
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v3, "i"), 12)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "s", _S.binary("/", _S.read(_v4, "i"), 12))
		_S.invoke(_S.read(_v4, "pts"), "push", [[_S.binary("+", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.binary("*", _S.read(_v4, "s"), 3.2)]), 2.2), _S.read(_v4, "s")), _S.binary("*", _S.binary("*", _S.call_value(_S.read(_v4, "sway"), []), _S.read(_v4, "s")), _S.read(_v4, "s"))), _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_v4, "g")), _S.read(_v4, "H")), 1.1), _S.binary("*", _S.read(_v4, "s"), _S.read(_v4, "H")))]])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BUD")), _S.binary("-", _S.read(_e, "OPEN"), _S.read(_e, "BUD")))]), 1.4])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	_S.define(_e, "top", _S.prop(_S.call_value(_S.read(_e, "stem"), []), 12))
	if _S.truth(_S.unary("!", _S.read(_e, "sprouted"))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "sprouted", true, "=", false)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 8)):
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "GRIT"), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v6, "R"), "range", [40, 100])), _S.invoke(_S.read(_v6, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v6, "R"), "pick", [[_S.prop(_S.read(_v6, "C"), 2), _S.prop(_S.read(_v6, "C"), 3)]]), 1])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v7 = _S.scope(_v5)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 3)):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "DUST"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v7, "R"), "sign", []), _S.invoke(_S.read(_v7, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v7, "R"), "range", [4, 10])), _S.invoke(_S.read(_v7, "R"), "range", [0.4, 0.6]), _S.prop(_S.read(_v7, "C"), 3), _S.invoke(_S.read(_v7, "R"), "range", [1.5, 2.5])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "STEM")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BUD"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.3, _S.read(_e, "f"))]))):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
		_S.define(_v8, "d", _S.invoke(_S.read(_v8, "R"), "range", [14, 26]))
		_S.define(_v8, "x", _S.binary("+", _S.prop(_S.read(_v8, "top"), 0), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "d"))))
		_S.define(_v8, "y", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v8, "top"), 1), 3), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "d")), 0.8)))
		_S.invoke(_S.read(_v8, "ps"), "spawn", [_S.prop(_S.read(_v8, "P"), "STREAK"), _S.read(_v8, "x"), _S.read(_v8, "y"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v8, "top"), 0), _S.read(_v8, "x")), 3.4), _S.binary("*", _S.binary("-", _S.binary("-", _S.prop(_S.read(_v8, "top"), 1), 3), _S.read(_v8, "y")), 3.4), _S.invoke(_S.read(_v8, "R"), "range", [0.18, 0.26]), (_S.prop(_S.read(_v8, "Ht"), 2) if _S.truth(_S.invoke(_S.read(_v8, "R"), "chance", [0.5])) else _S.prop(_S.read(_v8, "C"), 6))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.12)))):
		var _v9 = _S.scope(_e)
		_S.write(_v9, "popped", true, "=", false)
		_S.invoke(_S.read(_v9, "lights"), "add", [_S.prop(_S.read(_v9, "top"), 0), _S.binary("-", _S.prop(_S.read(_v9, "top"), 1), 3), 22, _S.read(_v9, "WHITE"), 0.45, 0.08])
		_S.invoke(_S.read(_v9, "lights"), "add", [_S.prop(_S.read(_v9, "top"), 0), _S.binary("-", _S.prop(_S.read(_v9, "top"), 1), 3), 70, _S.prop(_S.read(_v9, "Ht"), 2), 0.5, 0.8])
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 16)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "a", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.read(_v11, "TAU")]))
			_S.define(_v11, "sp", _S.invoke(_S.read(_v11, "R"), "range", [40, 120]))
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "MOTE"), _S.prop(_S.read(_v11, "top"), 0), _S.binary("-", _S.prop(_S.read(_v11, "top"), 1), 3), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "sp")), 20), _S.invoke(_S.read(_v11, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_v11, "Ht"), 3) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "C"), 7)), 0.7])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		var _v12 = _S.scope(_v9)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), 5)):
			_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v12, "top"), 0), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 10), 10])), _S.binary("-", _S.prop(_S.read(_v12, "top"), 1), _S.invoke(_S.read(_v12, "R"), "range", [0, 14])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v12, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v12, "Ht"), 3), _S.invoke(_S.read(_v12, "R"), "range", [1, 2.4]), _S.invoke(_S.read(_v12, "R"), "range", [0, 0.3])])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WILT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.13, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "glyphs"), "push", [_S.merge([{"x": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 22), 22])}, {"y": _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 36]))}, {"t0": _S.read(_e, "t")}, {"life": _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.7, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))])}, {"L": (3 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.35])) else 2)}, {"seed": _S.binary("*", _S.invoke(_S.read(_e, "R"), "next", []), 9)}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.1)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WILT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.35, _S.read(_e, "f"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "EMBER"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 8])), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [25, 55])), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.6, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))]), (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.6])) else _S.prop(_S.read(_e, "Ht"), 2)), (2 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 1)])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", _S.binary("-", _S.prop(_S.read(_v13, "glyphs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v13, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v13, "t"), _S.prop(_S.prop(_S.read(_v13, "glyphs"), _S.read(_v13, "i")), "t0")), _S.prop(_S.prop(_S.read(_v13, "glyphs"), _S.read(_v13, "i")), "life"))):
			_S.invoke(_S.read(_v13, "glyphs"), "splice", [_S.read(_v13, "i"), 1])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "-=", true)
	for _v14 in _S.array(_S.read(_e, "petals")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "q", _v14)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v15, "q"), "gone")), func(): return _S.binary(">=", _S.read(_v15, "t"), _S.prop(_S.read(_v15, "q"), "at")))):
			var _v16 = _S.scope(_v15)
			_S.set_prop(_S.read(_v16, "q"), "gone", true, "=", false)
			_S.define(_v16, "e", _S.binary("-", _S.binary("/", _S.prop(_S.read(_v16, "Math"), "PI"), 2), 0.15))
			_S.define(_v16, "dx", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "e")]), _S.invoke(_S.read(_v16, "Math"), "cos", [_S.prop(_S.read(_v16, "q"), "az")])))
			_S.define(_v16, "L", 10)
			_S.invoke(_S.read(_v16, "flying"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v16, "top"), 0), _S.binary("*", _S.binary("*", _S.read(_v16, "dx"), _S.read(_v16, "L")), 0.6))}, {"y": _S.binary("-", _S.binary("-", _S.prop(_S.read(_v16, "top"), 1), 3), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "e")]), _S.read(_v16, "L")), 0.6))}, {"vx": _S.binary("+", _S.binary("*", _S.read(_v16, "dx"), 30), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 10), 10]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [25, 45]))}, {"a": _S.invoke(_S.read(_v16, "Math"), "atan2", [_S.unary("-", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "e")])), _S.read(_v16, "dx")])}, {"va": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 5), 5])}, {"fl": 0}, {"vf": _S.invoke(_S.read(_v16, "R"), "range", [5, 9])}, {"life": _S.invoke(_S.read(_v16, "Math"), "min", [_S.invoke(_S.read(_v16, "R"), "range", [0.75, 1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v16, "meta"), "duration"), 0.45), _S.read(_v16, "t"))])}, {"max": 0}])])
			_S.set_prop(_S.prop(_S.read(_v16, "flying"), _S.binary("-", _S.prop(_S.read(_v16, "flying"), "length"), 1)), "max", _S.prop(_S.prop(_S.read(_v16, "flying"), _S.binary("-", _S.prop(_S.read(_v16, "flying"), "length"), 1)), "life"), "=", false)
	var _v17 = _S.scope(_e)
	_S.define(_v17, "i", _S.binary("-", _S.prop(_S.read(_v17, "flying"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v17, "i"), 0)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "q", _S.prop(_S.read(_v18, "flying"), _S.read(_v18, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v18, "q"), "life", _S.read(_v18, "dt"), "-=", false), 0)):
			var _v19 = _S.scope(_v18)
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "STAR"), _S.prop(_S.read(_v19, "q"), "x"), _S.prop(_S.read(_v19, "q"), "y"), 0, _S.unary("-", 8), _S.invoke(_S.read(_v19, "Math"), "min", [0.35, _S.binary("-", _S.binary("-", _S.prop(_S.read(_v19, "meta"), "duration"), 0.05), _S.read(_v19, "t"))]), _S.prop(_S.read(_v19, "Pt"), 3), 1.8])
			_S.invoke(_S.read(_v19, "flying"), "splice", [_S.read(_v19, "i"), 1])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v18, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vx"), 1.5), _S.read(_v18, "dt")), "-=", false)
		_S.set_prop(_S.read(_v18, "q"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vy"), 0.8), _S.read(_v18, "dt")), _S.binary("*", 10, _S.read(_v18, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v18, "q"), "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vx"), _S.read(_v18, "dt")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.prop(_S.read(_v18, "q"), "fl")]), 12), _S.read(_v18, "dt"))), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "y", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vy"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "a", _S.binary("*", _S.prop(_S.read(_v18, "q"), "va"), _S.read(_v18, "dt")), "+=", false)
		_S.set_prop(_S.read(_v18, "q"), "fl", _S.binary("*", _S.prop(_S.read(_v18, "q"), "vf"), _S.read(_v18, "dt")), "+=", false)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "bloom", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "OPEN"), 0.15), _S.binary("+", _S.read(_e, "OPEN"), 0.2), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "WILT"), 0.2), _S.binary("+", _S.read(_e, "WILT"), 0.5), _S.read(_e, "t")]))))
	_S.define(_e, "top", _S.prop(_S.call_value(_S.read(_e, "stem"), []), 12))
	var _v20 = _S.scope(_e)
	_S.define(_v20, "h", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "h"), 70)):
		_S.invoke(_S.read(_v20, "p"), "glow", [0, _S.unary("-", _S.read(_v20, "h")), 22, _S.prop(_S.read(_v20, "C"), 5), _S.binary("*", _S.binary("*", 0.12, _S.read(_v20, "bloom")), _S.binary("-", 1, _S.binary("/", _S.read(_v20, "h"), 80)))])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "h", 7, "+=", false)
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OPEN")), 0.12), 0.6)]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0.5, _S.binary("+", 6, _S.binary("*", 30, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.1, _S.read(_e, "k")), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "Ht"), 2), _S.prop(_S.read(_e, "Ht"), 3)], _S.function_value(_e, "_f12")])
	_S.define(_e, "fw", _S.binary("+", 6, _S.binary("*", 16, _S.call_value(_S.read(_e, "smooth"), [0, 0.8, _S.read(_e, "t")]))))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "x", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.unary("-", _S.read(_v21, "fw"))]))
	while _S.truth(_S.binary("<=", _S.read(_v21, "x"), _S.read(_v21, "fw"))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "u", _S.binary("/", _S.invoke(_S.read(_v22, "Math"), "abs", [_S.read(_v22, "x")]), _S.read(_v22, "fw")))
		_S.define(_v22, "a", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v22, "u"))]), _S.call_value(_S.read(_v22, "smooth"), [0, 0.4, _S.read(_v22, "t")])), _S.binary("-", 1, _S.call_value(_S.read(_v22, "smooth"), [_S.read(_v22, "WILT"), _S.binary("+", _S.read(_v22, "WILT"), 0.6), _S.read(_v22, "t")]))))
		_S.invoke(_S.read(_v22, "p"), "dot", [_S.read(_v22, "x"), 0, (_S.prop(_S.read(_v22, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v22, "u"), 0.3)) else (_S.prop(_S.read(_v22, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v22, "u"), 0.65)) else _S.prop(_S.read(_v22, "C"), 4))), _S.read(_v22, "a")])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v22, "x"), 5), 0)):
			_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "x"), 0, 8, _S.prop(_S.read(_v22, "C"), 5), _S.binary("*", _S.binary("*", 0.2, _S.read(_v22, "a")), _S.binary("-", 1, _S.read(_v22, "u")))])
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "x", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "BUD"), 0.05))):
		for _v23 in _S.array(_S.read(_e, "petals")):
			var _v24 = _S.scope(_e)
			_S.define(_v24, "q", _v23)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.prop(_S.read(_v24, "q"), "az")]), 0), func(): return _S.unary("!", _S.prop(_S.read(_v24, "q"), "gone")))):
				_S.call_value(_S.read(_v24, "petal"), [_S.read(_v24, "p"), _S.read(_v24, "q"), _S.read(_v24, "top")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.call_value(_S.read(_e, "stem"), []))
	_S.define(_e, "top", _S.prop(_S.read(_e, "pts"), 12))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "grow"), []))
	if _S.truth(_S.binary(">", _S.read(_e, "g"), 0.02)):
		var _v25 = _S.scope(_e)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", 1)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), _S.prop(_S.read(_v26, "pts"), "length"))):
			var _v27 = _S.scope(_v26)
			var _v28 = _S.prop(_S.read(_v27, "pts"), _S.binary("-", _S.read(_v27, "i"), 1))
			_S.define(_v27, "x0", _S.prop(_v28, 0))
			_S.define(_v27, "y0", _S.prop(_v28, 1))
			var _v29 = _S.prop(_S.read(_v27, "pts"), _S.read(_v27, "i"))
			_S.define(_v27, "x1", _S.prop(_v29, 0))
			_S.define(_v27, "y1", _S.prop(_v29, 1))
			if _S.truth(_S.binary(">", _S.read(_v27, "y1"), 0)):
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v27, "p"), "line", [_S.read(_v27, "x0"), _S.read(_v27, "y0"), _S.read(_v27, "x1"), _S.read(_v27, "y1"), _S.prop(_S.read(_v27, "C"), 5)])
			_S.invoke(_S.read(_v27, "p"), "line", [_S.binary("+", _S.read(_v27, "x0"), 1), _S.read(_v27, "y0"), _S.binary("+", _S.read(_v27, "x1"), 1), _S.read(_v27, "y1"), _S.prop(_S.read(_v27, "C"), 3)])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
		for _v30 in _S.array([[4, _S.unary("-", 1), 0.1], [7, 1, 0.22]]):
			var _v31 = _S.scope(_v25)
			var _v32 = _v30
			_S.define(_v31, "i", _S.prop(_v32, 0))
			_S.define(_v31, "sd", _S.prop(_v32, 1))
			_S.define(_v31, "d", _S.prop(_v32, 2))
			var _v33 = _S.scope(_v31)
			_S.define(_v33, "lk", _S.binary("*", _S.invoke(_S.read(_v33, "ease"), "outBack", [_S.call_value(_S.read(_v33, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v33, "t"), _S.read(_v33, "d")), 0.12), 0.3)]), 1.6]), _S.binary("-", 1, _S.binary("*", _S.call_value(_S.read(_v33, "smooth"), [_S.read(_v33, "WILT"), _S.binary("+", _S.read(_v33, "WILT"), 0.5), _S.read(_v33, "t")]), 0.4))))
			var _v34 = _S.prop(_S.read(_v33, "pts"), _S.read(_v33, "i"))
			_S.define(_v33, "x", _S.prop(_v34, 0))
			_S.define(_v33, "y", _S.prop(_v34, 1))
			if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v33, "lk"), 0), func(): return _S.binary(">", _S.read(_v33, "y"), _S.unary("-", 1)))):
				continue
			_S.define(_v33, "la", (_S.binary("+", _S.unary("-", 2.6), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v33, "lk")))) if _S.truth(_S.binary("<", _S.read(_v33, "sd"), 0)) else _S.binary("-", _S.unary("-", 0.55), _S.binary("*", 0.4, _S.binary("-", 1, _S.read(_v33, "lk"))))))
			_S.call_value(_S.read(_v33, "drawLeaf"), [_S.read(_v33, "p"), _S.binary("+", _S.read(_v33, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "la")]), 6), _S.read(_v33, "lk"))), _S.binary("+", _S.read(_v33, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "la")]), 6), _S.read(_v33, "lk"))), _S.binary("*", 12, _S.read(_v33, "lk")), 3.4, _S.read(_v33, "la"), 0.25, [_S.prop(_S.read(_v33, "C"), 1), _S.prop(_S.read(_v33, "C"), 3), _S.prop(_S.read(_v33, "C"), 5), _S.prop(_S.read(_v33, "C"), 6)]])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v25, "t"), _S.binary("-", _S.read(_v25, "STEM"), 0.1)), func(): return _S.binary("<", _S.read(_v25, "t"), _S.binary("-", _S.read(_v25, "OPEN"), 0.1)))):
			var _v35 = _S.scope(_v25)
			_S.define(_v35, "b", _S.call_value(_S.read(_v35, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v35, "t"), _S.read(_v35, "STEM")), 0.1), _S.binary("-", _S.read(_v35, "BUD"), _S.read(_v35, "STEM")))]))
			_S.define(_v35, "w", _S.binary("+", 2, _S.binary("*", 2.5, _S.read(_v35, "b"))))
			_S.define(_v35, "h", _S.binary("+", 3.5, _S.binary("*", 5, _S.read(_v35, "b"))))
			_S.invoke(_S.read(_v35, "p"), "ellipse", [_S.prop(_S.read(_v35, "top"), 0), _S.binary("-", _S.prop(_S.read(_v35, "top"), 1), _S.binary("*", _S.read(_v35, "h"), 0.6)), _S.read(_v35, "w"), _S.read(_v35, "h"), _S.function_value(_v35, "_f14")])
			_S.invoke(_S.read(_v35, "p"), "glow", [_S.prop(_S.read(_v35, "top"), 0), _S.binary("-", _S.prop(_S.read(_v35, "top"), 1), _S.binary("*", _S.read(_v35, "h"), 0.6)), _S.binary("+", 8, _S.binary("*", 8, _S.read(_v35, "b"))), _S.prop(_S.read(_v35, "Ht"), 2), _S.binary("*", 0.25, _S.read(_v35, "b"))])
	for _v36 in _S.array(_S.read(_e, "petals")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "q", _v36)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.prop(_S.read(_v37, "q"), "az")]), 0), func(): return _S.unary("!", _S.prop(_S.read(_v37, "q"), "gone"))), func(): return _S.binary(">", _S.read(_v37, "t"), _S.binary("-", _S.read(_v37, "BUD"), 0.05)))):
			_S.call_value(_S.read(_v37, "petal"), [_S.read(_v37, "p"), _S.read(_v37, "q"), _S.read(_v37, "top")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OPEN"), 0.12)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "WILT"), 0.3)))):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "pulse", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_v38, "Math"), "sin", [_S.binary("*", _S.read(_v38, "t"), 9)]))))
		_S.define(_v38, "k", _S.binary("-", 1, _S.call_value(_S.read(_v38, "smooth"), [_S.binary("-", _S.read(_v38, "WILT"), 0.3), _S.binary("+", _S.read(_v38, "WILT"), 0.3), _S.read(_v38, "t")])))
		_S.define(_v38, "cy", _S.binary("-", _S.prop(_S.read(_v38, "top"), 1), 4))
		_S.invoke(_S.read(_v38, "p"), "circle", [_S.prop(_S.read(_v38, "top"), 0), _S.read(_v38, "cy"), _S.binary("*", 3.3, _S.read(_v38, "k")), _S.prop(_S.read(_v38, "Ht"), 1)])
		_S.invoke(_S.read(_v38, "p"), "circle", [_S.binary("-", _S.prop(_S.read(_v38, "top"), 0), 0.5), _S.binary("-", _S.read(_v38, "cy"), 0.5), _S.binary("*", 2.2, _S.read(_v38, "k")), _S.prop(_S.read(_v38, "Ht"), 2)])
		_S.invoke(_S.read(_v38, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v38, "top"), 0), 1), _S.binary("-", _S.read(_v38, "cy"), 1), _S.prop(_S.read(_v38, "Ht"), 3)])
		_S.invoke(_S.read(_v38, "p"), "glow", [_S.prop(_S.read(_v38, "top"), 0), _S.read(_v38, "cy"), _S.binary("*", 16, _S.read(_v38, "pulse")), _S.prop(_S.read(_v38, "Ht"), 2), _S.binary("*", 0.5, _S.read(_v38, "k"))])
		_S.invoke(_S.read(_v38, "p"), "glow", [_S.prop(_S.read(_v38, "top"), 0), _S.read(_v38, "cy"), 34, _S.prop(_S.read(_v38, "C"), 5), _S.binary("*", 0.2, _S.read(_v38, "k"))])
	_S.define(_e, "e", _S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OPEN")), 0.12))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "e"), 0), func(): return _S.binary("<", _S.read(_e, "e"), 0.16))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "top"), 0), _S.binary("-", _S.prop(_S.read(_e, "top"), 1), 3), _S.binary("*", 10, _S.binary("-", 1, _S.binary("/", _S.read(_e, "e"), 0.16))), _S.prop(_S.read(_e, "Ht"), 3), _S.prop(_S.read(_e, "Ht"), 2), 0.6])
	for _v39 in _S.array(_S.read(_e, "flying")):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "q", _v39)
		_S.call_value(_S.read(_v40, "drawLeaf"), [_S.read(_v40, "p"), _S.prop(_S.read(_v40, "q"), "x"), _S.prop(_S.read(_v40, "q"), "y"), 6, 2.2, _S.prop(_S.read(_v40, "q"), "a"), _S.prop(_S.read(_v40, "q"), "fl"), [_S.prop(_S.read(_v40, "Pt"), 0), _S.prop(_S.read(_v40, "Pt"), 1), _S.prop(_S.read(_v40, "Pt"), 2), _S.prop(_S.read(_v40, "Pt"), 3)], _S.invoke(_S.read(_v40, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v40, "q"), "life"), 0.3)])])
	for _v41 in _S.array(_S.read(_e, "glyphs")):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "q", _v41)
		var _v43 = _S.scope(_v42)
		_S.define(_v43, "k", _S.binary("/", _S.binary("-", _S.read(_v43, "t"), _S.prop(_S.read(_v43, "q"), "t0")), _S.prop(_S.read(_v43, "q"), "life")))
		_S.call_value(_S.read(_v43, "cross"), [_S.read(_v43, "p"), _S.binary("+", _S.prop(_S.read(_v43, "q"), "x"), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v43, "k"), 5), _S.prop(_S.read(_v43, "q"), "seed"))]), 2)), _S.binary("-", _S.prop(_S.read(_v43, "q"), "y"), _S.binary("*", _S.read(_v43, "k"), 24)), _S.prop(_S.read(_v43, "q"), "L"), _S.read(_v43, "C"), _S.invoke(_S.read(_v43, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v43, "Math"), "PI"), _S.read(_v43, "k"))]), _S.binary(">", _S.invoke(_S.read(_v43, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v43, "k"), 14), _S.prop(_S.read(_v43, "q"), "seed"))]), 0.8)])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	_S.define(_e, "a", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "Pt"), 2) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.unary("-", 0.2))) else (_S.prop(_S.read(_e, "Pt"), 0) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.7)) else _S.prop(_S.read(_e, "Pt"), 1)))
