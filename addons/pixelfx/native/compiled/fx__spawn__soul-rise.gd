@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/soul-rise.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "rimOf", _S.import_value("fx/spawn/_lib.js", "rimOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Soul rise"}, {"desc": "The body's outline flares and dims, then a pale glowing copy of it lifts out, stretching as its legs melt into a rippling wisp, shedding motes until it thins into light."}, {"tags": ["spawn", "death", "soul", "ghost", "spirit", "rise", "light", "one-shot"]}, {"size": [96, 140]}, {"origin": [48, 126]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#101a33", "#1f3563", "#35609e", "#5c96d4", "#94c8f0", "#d2f0ff", "#ffffff"]}, {"height": 50}, {"seed": 27}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SLUMP", _S.merge([{"crouch": 8}, {"lean": 6}, {"hy": 2}, {"fx": 7}, {"fy": _S.unary("-", 9)}, {"bx": 11}, {"by": _S.unary("-", 9)}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[_S.unary("-", 0.2), _S.read(_e, "READY")], [0.3, _S.merge([{"turn": 1}, {"crouch": 2}, {"hy": _S.unary("-", 1)}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 24)}, {"bx": 11}, {"by": _S.unary("-", 24)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [0.7, _S.merge([{"turn": 0.7}, {"crouch": 4}, {"lean": 3}, {"hy": 1}, {"fx": 2}, {"fy": _S.unary("-", 14)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": 4}, {"fbx": _S.unary("-", 3)}])], [1.1, _S.read(_e, "SLUMP")], [2.7, _S.read(_e, "SLUMP")], [3.2, _S.merge([_S.read(_e, "SLUMP"), {"crouch": 7}])]]}, {"dust": [_S.merge([{"t": 1.1}, {"x": 0}, {"n": 5}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "LEAVE", 0.35)
	_S.define(_e, "TOP", 2.05)
	_S.define(_e, "GONE", 2.55)
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "hex"), ["#0c0f1e"]))
	_exports["create"] = _S.read(_e, "create")
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f14"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "rim", _S.call_value(_S.read(_e, "rimOf"), [_S.read(_e, "body")]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "body"), "w"))
	_S.define(_e, "Hh", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "waist", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "Hh"), 0.6)]))
	_S.define(_e, "tone", _S.invoke(_S.prop(_S.read(_e, "body"), "list"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "toneAt", _S.invoke(_S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "Hh"))]), "fill", [_S.unary("-", 1)]))
	_S.invoke(_S.prop(_S.read(_e, "body"), "list"), "forEach", [_S.function_value(_e, "_f3")])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "left", false)
	_S.define(_e, "lift", _S.function_value(_e, "_f4"))
	_S.define(_e, "stretch", _S.function_value(_e, "_f5"))
	_S.define(_e, "sway", _S.function_value(_e, "_f6"))
	_S.define(_e, "melt", _S.function_value(_e, "_f7"))
	_S.define(_e, "thin", _S.function_value(_e, "_f8"))
	_S.define(_e, "ring", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f12")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return (6 if _S.truth(_S.prop(_S.read(_e, "b"), "edge")) else _S.binary("+", 3, _S.invoke(_S.read(_e, "Math"), "min", [2, _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "luma"), [_S.prop(_S.read(_e, "b"), "c")]), 3.6)])])))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.set_prop(_S.read(_e, "toneAt"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "b"), "my"), _S.read(_e, "W")), _S.prop(_S.read(_e, "b"), "mx")), _S.prop(_S.read(_e, "tone"), _S.read(_e, "i")), "=", false)

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("*", _S.prop(_S.read(_e, "o"), "height"), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LEAVE")), _S.binary("-", _S.read(_e, "TOP"), _S.read(_e, "LEAVE")))])]))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("+", 1, _S.binary("*", 0.22, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LEAVE")), _S.binary("-", _S.read(_e, "TOP"), _S.read(_e, "LEAVE")))])])))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "row", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_e, "t"), 3), _S.binary("*", _S.read(_e, "row"), 0.12))]), 2.2), _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "LEAVE"), _S.binary("+", _S.read(_e, "LEAVE"), 0.5), _S.read(_e, "t")]))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "LEAVE"), 0.1), _S.binary("+", _S.read(_e, "LEAVE"), 0.9), _S.read(_e, "t")])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "TOP"), 0.25), _S.read(_e, "GONE"), _S.read(_e, "t")])

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "near", _S.arg(_args, 1))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LEAVE")), 0.5))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "k"), 0), func(): return _S.binary("<", _S.read(_e, "k"), 1))):
		_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 6, _S.binary("*", 26, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.read(_e, "k")]))), 0.18, _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("*", 3, _S.binary("-", 1, _S.read(_e, "k")))]), _S.binary("-", 1.15, _S.read(_e, "k")), _S.read(_e, "C"), _S.function_value(_e, "_f10"), _S.binary("<", _S.read(_e, "k"), 0.12)])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "near"))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "left")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LEAVE")))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "left", true, "=", false)
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.unary("-", 20), 50, _S.prop(_S.read(_v0, "C"), 4), 0.85, 0.55])
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.unary("-", 20), 24, _S.read(_v0, "WHITE"), 0.8, 0.12])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 10)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "c", _S.invoke(_S.read(_v2, "R"), "pick", [_S.read(_v2, "rim")]))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STAR"), _S.prop(_S.read(_v2, "c"), "x"), _S.prop(_S.read(_v2, "c"), "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v2, "R"), "range", [20, 60])), _S.invoke(_S.read(_v2, "R"), "range", [0.4, 0.8]), _S.invoke(_S.read(_v2, "R"), "pick", [[_S.read(_v2, "WHITE"), _S.prop(_S.read(_v2, "C"), 5)]]), _S.invoke(_S.read(_v2, "R"), "range", [0.8, 1.8])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "LEAVE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE")))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "s", _S.call_value(_S.read(_v3, "stretch"), []))
		_S.define(_v3, "y0", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v3, "body"), "y"), _S.read(_v3, "s")), _S.call_value(_S.read(_v3, "lift"), [])))
		_S.define(_v3, "th", _S.call_value(_S.read(_v3, "thin"), []))
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "n"), (3 if _S.truth(_S.binary(">", _S.read(_v4, "th"), 0)) else 1))):
			var _v5 = _S.scope(_v4)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v5, "R"), "chance", [(0.9 if _S.truth(_S.binary(">", _S.read(_v5, "th"), 0)) else 0.5)]))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "n", 1, "+=", true)
				continue
			_S.define(_v5, "c", _S.invoke(_S.read(_v5, "R"), "pick", [_S.read(_v5, "rim")]))
			_S.define(_v5, "row", _S.prop(_S.read(_v5, "c"), "my"))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("/", _S.read(_v5, "row"), _S.read(_v5, "Hh")), _S.binary("-", _S.binary("-", 1, _S.binary("*", _S.read(_v5, "th"), 1.1)), 0.05)), func(): return _S.binary(">", _S.read(_v5, "th"), 0))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "n", 1, "+=", true)
				continue
			_S.define(_v5, "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "c"), "x"), _S.binary("-", 1, _S.binary("*", _S.binary("*", 0.12, _S.binary("-", _S.read(_v5, "s"), 1)), 4))), _S.call_value(_S.read(_v5, "sway"), [_S.read(_v5, "row")])))
			_S.define(_v5, "y", _S.binary("+", _S.read(_v5, "y0"), _S.binary("*", _S.prop(_S.read(_v5, "c"), "my"), _S.read(_v5, "s"))))
			_S.define(_v5, "life", _S.invoke(_S.read(_v5, "Math"), "min", [_S.invoke(_S.read(_v5, "R"), "range", [0.5, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v5, "meta"), "duration"), 0.1), _S.read(_v5, "t")), _S.binary("/", _S.binary("+", _S.read(_v5, "y"), 120), 60)]))
			if _S.truth(_S.binary(">", _S.read(_v5, "life"), 0.1)):
				_S.invoke(_S.read(_v5, "ps"), "spawn", [(_S.prop(_S.read(_v5, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.7])) else _S.prop(_S.read(_v5, "P"), "STAR")), _S.read(_v5, "x"), _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [25, 60])), _S.read(_v5, "life"), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.read(_v5, "WHITE"), _S.prop(_S.read(_v5, "C"), 5), _S.prop(_S.read(_v5, "C"), 5), _S.prop(_S.read(_v5, "C"), 4)]]), _S.invoke(_S.read(_v5, "R"), "range", [0.5, 1])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "n", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "LEAVE"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "LEAVE"), 0.4), _S.read(_e, "TOP"), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 26, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.3, _S.read(_e, "k"))])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), false])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LEAVE"), 0.3))):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "k", (_S.binary("/", _S.read(_v6, "t"), _S.read(_v6, "LEAVE")) if _S.truth(_S.binary("<", _S.read(_v6, "t"), _S.read(_v6, "LEAVE"))) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v6, "t"), _S.read(_v6, "LEAVE")), 0.3))))
		for _v7 in _S.array(_S.read(_v6, "rim")):
			var _v8 = _S.scope(_v6)
			_S.define(_v8, "c", _v7)
			if _S.truth(_S.binary("<", _S.call_value(_S.read(_v8, "rand"), [_S.prop(_S.read(_v8, "c"), "mx"), _S.prop(_S.read(_v8, "c"), "my"), _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("*", _S.read(_v8, "t"), 30)])]), _S.binary("+", 0.25, _S.binary("*", 0.7, _S.read(_v8, "k"))))):
				_S.invoke(_S.read(_v8, "p"), "px", [_S.prop(_S.read(_v8, "c"), "x"), _S.prop(_S.read(_v8, "c"), "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.7)) else _S.prop(_S.read(_v8, "C"), 5))])
		_S.invoke(_S.read(_v6, "p"), "glow", [0, _S.unary("-", 19), 26, _S.prop(_S.read(_v6, "C"), 4), _S.binary("*", 0.45, _S.read(_v6, "k"))])
	_S.define(_e, "dim", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "LEAVE"), _S.binary("+", _S.read(_e, "LEAVE"), 0.6), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "GONE"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.1), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "dim"), 0)):
		for _v9 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
			var _v10 = _S.scope(_e)
			_S.define(_v10, "b", _v9)
			_S.invoke(_S.read(_v10, "p"), "blend", [_S.prop(_S.read(_v10, "b"), "x"), _S.prop(_S.read(_v10, "b"), "y"), _S.read(_v10, "SHADOW"), _S.binary("*", 0.45, _S.read(_v10, "dim"))])
	_S.call_value(_S.read(_e, "ring"), [_S.read(_e, "p"), true])
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LEAVE")), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "GONE"), 0.1)))):
		var _v11 = _S.scope(_e)
		_S.invoke(_S.read(_v11, "ps"), "draw", [_S.read(_v11, "p")])
		_S.invoke(_S.read(_v11, "lights"), "draw", [_S.read(_v11, "p")])
		return null
	_S.define(_e, "s", _S.call_value(_S.read(_e, "stretch"), []))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "lift"), []))
	_S.define(_e, "m", _S.call_value(_S.read(_e, "melt"), []))
	_S.define(_e, "th", _S.call_value(_S.read(_e, "thin"), []))
	_S.define(_e, "top", _S.binary("-", _S.binary("*", _S.prop(_S.read(_e, "body"), "y"), _S.read(_e, "s")), _S.read(_e, "L")))
	_S.define(_e, "sx", _S.binary("-", 1, _S.binary("*", _S.binary("*", 0.12, _S.binary("-", _S.read(_e, "s"), 1)), 4)))
	_S.define(_e, "tail", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", 10, _S.read(_e, "m"))]))
	_S.define(_e, "y1", _S.binary("+", _S.read(_e, "top"), _S.binary("*", _S.binary("+", _S.read(_e, "Hh"), _S.read(_e, "tail")), _S.read(_e, "s"))))
	_S.define(_e, "fadeIn", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LEAVE")), 0.15)]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "y", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.read(_v12, "top")]))
	while _S.truth(_S.binary("<=", _S.read(_v12, "y"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.read(_v12, "y1")]))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "my", _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v13, "y"), 0.5), _S.read(_v13, "top")), _S.read(_v13, "s"))]))
		if _S.truth(_S.binary("<", _S.read(_v13, "my"), 0)):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "y", 1, "+=", true)
			continue
		_S.define(_v13, "k", (_S.binary("/", _S.binary("+", _S.binary("-", _S.read(_v13, "my"), _S.read(_v13, "waist")), 1), _S.binary("+", _S.binary("-", _S.read(_v13, "Hh"), _S.read(_v13, "waist")), _S.read(_v13, "tail"))) if _S.truth(_S.binary(">=", _S.read(_v13, "my"), _S.read(_v13, "waist"))) else 0))
		_S.define(_v13, "narrow", _S.binary("-", 1, _S.binary("*", _S.binary("*", _S.read(_v13, "k"), _S.read(_v13, "m")), 0.95)))
		if _S.truth(_S.binary("<=", _S.read(_v13, "narrow"), 0.05)):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "y", 1, "+=", true)
			continue
		_S.define(_v13, "cx", _S.binary("+", _S.call_value(_S.read(_v13, "sway"), [_S.read(_v13, "my")]), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("-", _S.binary("*", _S.read(_v13, "my"), 0.7), _S.binary("*", _S.read(_v13, "t"), 8))]), 2), _S.read(_v13, "k")), _S.read(_v13, "m"))))
		_S.define(_v13, "a", _S.binary("*", (_S.binary("-", 1, _S.binary("*", _S.read(_v13, "k"), 0.45)) if _S.truth(_S.binary(">=", _S.read(_v13, "my"), _S.read(_v13, "waist"))) else 1), _S.read(_v13, "fadeIn")))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "x", _S.invoke(_S.read(_v14, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v14, "cx"), _S.binary("/", _S.read(_v14, "W"), 2)), 4)]))
		while _S.truth(_S.binary("<=", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_v14, "cx"), _S.binary("/", _S.read(_v14, "W"), 2)), 4)]))):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "mx", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("-", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v15, "x"), 0.5), _S.read(_v15, "cx")), _S.binary("*", _S.read(_v15, "sx"), _S.read(_v15, "narrow"))), _S.prop(_S.read(_v15, "body"), "x"))]))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v15, "th"), 0), func(): return _S.binary(">", _S.binary("/", _S.read(_v15, "my"), _S.binary("+", _S.read(_v15, "Hh"), _S.read(_v15, "tail"))), _S.binary("-", _S.binary("+", _S.binary("-", 1, _S.binary("*", _S.read(_v15, "th"), 1.25)), _S.binary("*", 0.25, _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "mx"), _S.read(_v15, "my"), 5]))), 0.1)))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "x", 1, "+=", true)
				continue
			_S.define(_v15, "ti", null)
			if _S.truth(_S.binary("<", _S.read(_v15, "my"), _S.read(_v15, "Hh"))):
				var _v16 = _S.scope(_v15)
				if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v16, "mx"), 0), func(): return _S.binary(">=", _S.read(_v16, "mx"), _S.read(_v16, "W")))):
					_v14 = _S.iteration(_v14)
					_S.write(_v14, "x", 1, "+=", true)
					continue
				_S.write(_v16, "ti", _S.prop(_S.read(_v16, "toneAt"), _S.binary("+", _S.binary("*", _S.read(_v16, "my"), _S.read(_v16, "W")), _S.read(_v16, "mx"))), "=", false)
				if _S.truth(_S.binary("<", _S.read(_v16, "ti"), 0)):
					_v14 = _S.iteration(_v14)
					_S.write(_v14, "x", 1, "+=", true)
					continue
			else:
				var _v17 = _S.scope(_v15)
				_S.define(_v17, "w", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v17, "my"), _S.read(_v17, "Hh")), _S.invoke(_S.read(_v17, "Math"), "max", [1, _S.read(_v17, "tail")]))), 3.2), _S.read(_v17, "m")))
				_S.define(_v17, "d", _S.invoke(_S.read(_v17, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v17, "x"), 0.5), _S.read(_v17, "cx"))]))
				if _S.truth(_S.binary(">", _S.read(_v17, "d"), _S.read(_v17, "w"))):
					_v14 = _S.iteration(_v14)
					_S.write(_v14, "x", 1, "+=", true)
					continue
				_S.write(_v17, "ti", (5 if _S.truth(_S.binary(">", _S.read(_v17, "d"), _S.binary("-", _S.read(_v17, "w"), 1))) else 4), "=", false)
			if _S.truth(_S.binary("<", _S.read(_v15, "t"), _S.binary("+", _S.read(_v15, "LEAVE"), 0.07))):
				_S.invoke(_S.read(_v15, "p"), "px", [_S.read(_v15, "x"), _S.read(_v15, "y"), (_S.prop(_S.read(_v15, "C"), 5) if _S.truth(_S.binary(">=", _S.read(_v15, "ti"), 6)) else _S.read(_v15, "WHITE"))])
			else:
				if _S.truth(_S.binary(">=", _S.read(_v15, "ti"), 5)):
					_S.invoke(_S.read(_v15, "p"), "dot", [_S.read(_v15, "x"), _S.read(_v15, "y"), (_S.read(_v15, "WHITE") if _S.truth(_S.binary(">=", _S.read(_v15, "ti"), 6)) else _S.prop(_S.read(_v15, "C"), 5)), _S.invoke(_S.read(_v15, "Math"), "min", [1, _S.binary("*", _S.read(_v15, "a"), 1.3)])])
				else:
					_S.invoke(_S.read(_v15, "p"), "blend", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.prop(_S.read(_v15, "C"), _S.read(_v15, "ti")), _S.binary("*", _S.read(_v15, "a"), 0.7)])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "x", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "y", 1, "+=", true)
	_S.define(_e, "cy", _S.binary("+", _S.read(_e, "top"), _S.binary("*", _S.binary("*", _S.read(_e, "Hh"), _S.read(_e, "s")), 0.45)))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.call_value(_S.read(_e, "sway"), [10]), _S.read(_e, "cy"), 30, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("*", 0.42, _S.read(_e, "fadeIn")), _S.binary("-", 1, _S.read(_e, "th")))])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.call_value(_S.read(_e, "sway"), [10]), _S.binary("-", _S.read(_e, "cy"), 6), 14, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", _S.binary("*", 0.3, _S.read(_e, "fadeIn")), _S.binary("-", 1, _S.read(_e, "th")))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 1
