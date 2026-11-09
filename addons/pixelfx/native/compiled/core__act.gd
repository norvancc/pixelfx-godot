@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/act.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Rng", _S.import_value("core/math.js", "Rng"))
	_S.define(_e, "clamp", _S.import_value("core/math.js", "clamp"))
	_S.define(_e, "hex", _S.import_value("core/color.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/color.js", "mix"))
	_S.define(_e, "createFrame", _S.import_value("core/fx.js", "createFrame"))
	_S.define(_e, "clearFrame", _S.import_value("core/fx.js", "clearFrame"))
	_S.define(_e, "createFx", _S.import_value("core/fx.js", "createFx"))
	_S.define(_e, "painterFor", _S.import_value("core/fx.js", "painterFor"))
	_S.define(_e, "stockActor", _S.import_value("core/actor.js", "stockActor"))
	_S.define(_e, "drawActor", _S.import_value("core/actor.js", "drawActor"))
	_S.define(_e, "actorAlphaOf", _S.import_value("core/actor.js", "actorAlphaOf"))
	_S.define(_e, "HERO2", _S.import_value("core/actor.js", "HERO2"))
	_S.define(_e, "DUMMY_PAL", _S.import_value("core/actor.js", "DUMMY_PAL"))
	_S.define(_e, "posed", _S.import_value("core/rig.js", "posed"))
	_S.define(_e, "STAND", _S.import_value("core/rig.js", "STAND"))
	_S.define(_e, "lerpPose", _S.function_value(_e, "_f0"))
	_S.define(_e, "poseAt", _S.function_value(_e, "_f1"))
	_S.define(_e, "isHeld", _S.function_value(_e, "_f3"))
	_S.define(_e, "carry", _S.function_value(_e, "_f5"))
	_S.define(_e, "actSpan", _S.function_value(_e, "_f7"))
	_S.define(_e, "createAct", _S.function_value(_e, "_f8"))
	_S.define(_e, "actTiming", _S.function_value(_e, "_f36"))
	_S.define(_e, "actBounds", _S.function_value(_e, "_f40"))
	_exports["STAND"] = _S.read(_e, "STAND")
	_exports["posed"] = _S.read(_e, "posed")
	_S.define(_e, "lerp", _S.function_value(_e, "_f42"))
	_exports["lerpPose"] = _S.read(_e, "lerpPose")
	_S.define(_e, "eases", _S.merge([{"out": _S.function_value(_e, "_f43")}, {"in": _S.function_value(_e, "_f44")}, {"line": _S.function_value(_e, "_f45")}]))
	_exports["poseAt"] = _S.read(_e, "poseAt")
	_S.define(_e, "TW", 38)
	_S.define(_e, "TH", 52)
	_S.define(_e, "TP", _S.invoke(_S.read(_e, "Object"), "fromEntries", [_S.invoke(_S.invoke(_S.read(_e, "Object"), "entries", [_S.merge([{"ink": "#0b0a1a"}, {"wood": "#724c2e"}, {"woodL": "#a0703a"}, {"woodD": "#4e331f"}, {"straw": "#d2aa55"}, {"strawL": "#f0d98a"}, {"burlapD": "#86643a"}, {"burlap": "#b38b57"}, {"burlapL": "#c9a26c"}, {"red": "#9a2f3c"}, {"redL": "#c4434f"}, {"white": "#ffffff"}])]), "map", [_S.function_value(_e, "_f46")])]))
	_S.define(_e, "DUST", _S.invoke(["#efe7dc", "#c9bfb8", "#8f8693", "#5a5468"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "DUMMY", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "TW"), _S.read(_e, "TH"))]))
	_S.call_value(_S.function_value(_e, "_f47"), [])
	_S.define(_e, "SKINS", _S.merge([{"flash": [_S.prop(_S.read(_e, "TP"), "white"), 1]}, {"char": [_S.call_value(_S.read(_e, "hex"), ["#1a0c0e"]), 0.72]}, {"ice": [_S.call_value(_S.read(_e, "hex"), ["#a8e8ff"]), 0.72]}, {"shadow": [_S.call_value(_S.read(_e, "hex"), ["#3a1a70"]), 0.5]}, {"holy": [_S.call_value(_S.read(_e, "hex"), ["#fff4c0"]), 0.5]}, {"red": [_S.call_value(_S.read(_e, "hex"), ["#ff2040"]), 0.45]}, {"shock": [_S.call_value(_S.read(_e, "hex"), ["#8fd6ff"]), 0.6]}, {"poison": [_S.call_value(_S.read(_e, "hex"), ["#58c43a"]), 0.5]}]))
	_exports["SKINS"] = _S.read(_e, "SKINS")
	_S.define(_e, "STRAW", [_S.prop(_S.read(_e, "TP"), "strawL"), _S.prop(_S.read(_e, "TP"), "straw"), _S.prop(_S.read(_e, "TP"), "straw"), _S.prop(_S.read(_e, "TP"), "burlapD"), _S.prop(_S.read(_e, "TP"), "burlapD")])
	_S.define(_e, "Target", _S.class_value("Target", _S.function_value(_e, "_f51"), {"hit": _S.function_value(_e, "_f52"), "step": _S.function_value(_e, "_f53"), "draw": _S.function_value(_e, "_f55"), "drawStraw": _S.function_value(_e, "_f56")}, {}, {}, null))
	_exports["Target"] = _S.read(_e, "Target")
	_S.define(_e, "GHOST_LIFE", 0.16)
	_S.define(_e, "REST_MASK", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", 24, 38)]))
	_S.define(_e, "REST_PX", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", 24, 38)]))
	_S.invoke(_S.read(_e, "HERO2"), "forEach", [_S.function_value(_e, "_f57")])
	_S.define(_e, "NEAREST", _S.invoke(_S.construct(_S.read(_e, "Int16Array"), [_S.binary("*", 24, 38)]), "fill", [_S.unary("-", 1)]))
	var _v122 = _S.scope(_e)
	_S.define(_v122, "r", 0)
	while _S.truth(_S.binary("<", _S.read(_v122, "r"), 38)):
		var _v123 = _S.scope(_v122)
		_S.define(_v123, "c", 0)
		while _S.truth(_S.binary("<", _S.read(_v123, "c"), 24)):
			var _v124 = _S.scope(_v123)
			_S.define(_v124, "best", _S.unary("-", 1))
			_S.define(_v124, "bd", 1000000000)
			var _v125 = _S.scope(_v124)
			_S.define(_v125, "y", _S.invoke(_S.read(_v125, "Math"), "max", [0, _S.binary("-", _S.read(_v125, "r"), 7)]))
			while _S.truth(_S.binary("<", _S.read(_v125, "y"), _S.invoke(_S.read(_v125, "Math"), "min", [38, _S.binary("+", _S.read(_v125, "r"), 8)]))):
				var _v126 = _S.scope(_v125)
				_S.define(_v126, "x", _S.invoke(_S.read(_v126, "Math"), "max", [0, _S.binary("-", _S.read(_v126, "c"), 7)]))
				while _S.truth(_S.binary("<", _S.read(_v126, "x"), _S.invoke(_S.read(_v126, "Math"), "min", [24, _S.binary("+", _S.read(_v126, "c"), 8)]))):
					var _v127 = _S.scope(_v126)
					_S.define(_v127, "d", _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v127, "x"), _S.read(_v127, "c")), _S.binary("-", _S.read(_v127, "x"), _S.read(_v127, "c"))), _S.binary("*", _S.binary("-", _S.read(_v127, "y"), _S.read(_v127, "r")), _S.binary("-", _S.read(_v127, "y"), _S.read(_v127, "r")))))
					if _S.truth(_S.logical("&&", _S.prop(_S.read(_v127, "REST_MASK"), _S.binary("+", _S.binary("*", _S.read(_v127, "y"), 24), _S.read(_v127, "x"))), func(): return _S.binary("<", _S.read(_v127, "d"), _S.read(_v127, "bd")))):
						var _v128 = _S.scope(_v127)
						_S.write(_v128, "bd", _S.read(_v128, "d"), "=", false)
						_S.write(_v128, "best", _S.binary("+", _S.binary("*", _S.read(_v128, "y"), 24), _S.read(_v128, "x")), "=", false)
					_v126 = _S.iteration(_v126)
					_S.write(_v126, "x", 1, "+=", true)
				_v125 = _S.iteration(_v125)
				_S.write(_v125, "y", 1, "+=", true)
			_S.set_prop(_S.read(_v124, "NEAREST"), _S.binary("+", _S.binary("*", _S.read(_v124, "r"), 24), _S.read(_v124, "c")), _S.read(_v124, "best"), "=", false)
			_v123 = _S.iteration(_v123)
			_S.write(_v123, "c", 1, "+=", true)
		_v122 = _S.iteration(_v122)
		_S.write(_v122, "r", 1, "+=", true)
	_S.define(_e, "lum", _S.function_value(_e, "_f59"))
	_exports["actSpan"] = _S.read(_e, "actSpan")
	_exports["createAct"] = _S.read(_e, "createAct")
	_exports["actTiming"] = _S.read(_e, "actTiming")
	_exports["actBounds"] = _S.read(_e, "actBounds")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "u", _S.arg(_args, 2))
	_S.define(_e, "out", _S.merge([_S.read(_e, "STAND"), _S.read(_e, "a")]))
	_S.define(_e, "B", _S.merge([_S.read(_e, "STAND"), _S.read(_e, "b")]))
	for _v0 in _S.array(_S.invoke(_S.read(_e, "Object"), "keys", [_S.read(_e, "B")])):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "k", _v0)
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "v", _S.prop(_S.read(_v2, "B"), _S.read(_v2, "k")))
		if _S.truth(_S.logical("&&", _S.binary("===", _S.unary("typeof", _S.read(_v2, "v")), "number"), func(): return _S.binary("===", _S.unary("typeof", _S.prop(_S.read(_v2, "out"), _S.read(_v2, "k"))), "number"))):
			_S.set_prop(_S.read(_v2, "out"), _S.read(_v2, "k"), _S.call_value(_S.read(_v2, "lerp"), [_S.prop(_S.read(_v2, "out"), _S.read(_v2, "k")), _S.read(_v2, "v"), _S.read(_v2, "u")]), "=", false)
		else:
			if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v2, "out"), _S.read(_v2, "k")), null), func(): return _S.binary("===", _S.unary("typeof", _S.read(_v2, "v")), "number"))):
				_S.set_prop(_S.read(_v2, "out"), _S.read(_v2, "k"), _S.read(_v2, "v"), "=", false)
	for _v3 in _S.array(["hx", "hy", "lean", "crouch"]):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "k", _v3)
		if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_v4, "B"), _S.read(_v4, "k")), null), func(): return _S.binary("===", _S.unary("typeof", _S.prop(_S.read(_v4, "out"), _S.read(_v4, "k"))), "number"))):
			_S.set_prop(_S.read(_v4, "out"), _S.read(_v4, "k"), _S.call_value(_S.read(_v4, "lerp"), [_S.prop(_S.read(_v4, "out"), _S.read(_v4, "k")), 0, _S.read(_v4, "u")]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "B"), "wl"), null), func(): return _S.binary("===", _S.unary("typeof", _S.prop(_S.read(_e, "out"), "wl")), "number"))):
		_S.set_prop(_S.read(_e, "out"), "wl", _S.call_value(_S.read(_e, "lerp"), [_S.prop(_S.read(_e, "out"), "wl"), 1, _S.read(_e, "u")]), "=", false)
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "track", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	if _S.truth(_S.binary("<=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "track"), 0), 0))):
		return _S.prop(_S.prop(_S.read(_e, "track"), 0), 1)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.binary("-", _S.prop(_S.read(_v5, "track"), "length"), 1))):
		var _v6 = _S.scope(_v5)
		var _v7 = _S.prop(_S.read(_v6, "track"), _S.read(_v6, "i"))
		_S.define(_v6, "t0", _S.prop(_v7, 0))
		_S.define(_v6, "a", _S.prop(_v7, 1))
		var _v8 = _S.prop(_S.read(_v6, "track"), _S.binary("+", _S.read(_v6, "i"), 1))
		_S.define(_v6, "t1", _S.prop(_v8, 0))
		_S.define(_v6, "b", _S.prop(_v8, 1))
		_S.define(_v6, "how", _S.prop(_v8, 2))
		if _S.truth(_S.binary(">=", _S.read(_v6, "t"), _S.read(_v6, "t1"))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
			continue
		if _S.truth(_S.binary("===", _S.read(_v6, "how"), "snap")):
			return _S.read(_v6, "a")
		_S.define(_v6, "e", _S.logical("??", _S.prop(_S.read(_v6, "eases"), _S.read(_v6, "how")), func(): return _S.function_value(_v6, "_f2")))
		_S.define(_v6, "stepped", _S.binary("+", _S.read(_v6, "t0"), _S.binary("/", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v6, "t"), _S.read(_v6, "t0")), 12), 0.000001)]), 12)))
		_S.define(_v6, "out", _S.call_value(_S.read(_v6, "lerpPose"), [_S.read(_v6, "a"), _S.read(_v6, "b"), _S.call_value(_S.read(_v6, "e"), [_S.binary("/", _S.binary("-", _S.read(_v6, "stepped"), _S.read(_v6, "t0")), _S.binary("-", _S.read(_v6, "t1"), _S.read(_v6, "t0")))])]))
		_S.define(_v6, "u", _S.call_value(_S.read(_v6, "e"), [_S.binary("/", _S.binary("-", _S.read(_v6, "t"), _S.read(_v6, "t0")), _S.binary("-", _S.read(_v6, "t1"), _S.read(_v6, "t0")))]))
		_S.set_prop(_S.read(_v6, "out"), "x", _S.call_value(_S.read(_v6, "lerp"), [_S.logical("??", _S.prop(_S.read(_v6, "a"), "x"), func(): return 0), _S.logical("??", _S.prop(_S.read(_v6, "b"), "x"), func(): return 0), _S.read(_v6, "u")]), "=", false)
		_S.set_prop(_S.read(_v6, "out"), "y", _S.call_value(_S.read(_v6, "lerp"), [_S.logical("??", _S.prop(_S.read(_v6, "a"), "y"), func(): return 0), _S.logical("??", _S.prop(_S.read(_v6, "b"), "y"), func(): return 0), _S.read(_v6, "u")]), "=", false)
		return _S.read(_v6, "out")
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "i", 1, "+=", true)
	return _S.prop(_S.prop(_S.read(_e, "track"), _S.binary("-", _S.prop(_S.read(_e, "track"), "length"), 1)), 1)

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "u"))))

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "track", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "track"), _S.binary("-", _S.prop(_S.read(_e, "track"), "length"), 1)), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "track"), 0), 0)))):
		return true
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.binary("-", _S.prop(_S.read(_v9, "track"), "length"), 1))):
		var _v10 = _S.scope(_v9)
		if _S.truth(_S.binary(">=", _S.read(_v10, "t"), _S.prop(_S.prop(_S.read(_v10, "track"), _S.binary("+", _S.read(_v10, "i"), 1)), 0))):
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
			continue
		_S.define(_v10, "a", _S.merge([_S.read(_v10, "STAND"), _S.prop(_S.prop(_S.read(_v10, "track"), _S.read(_v10, "i")), 1)]))
		_S.define(_v10, "b", _S.merge([_S.read(_v10, "STAND"), _S.prop(_S.prop(_S.read(_v10, "track"), _S.binary("+", _S.read(_v10, "i"), 1)), 1)]))
		return _S.logical("&&", _S.binary(">", _S.binary("-", _S.prop(_S.prop(_S.read(_v10, "track"), _S.binary("+", _S.read(_v10, "i"), 1)), 0), _S.prop(_S.prop(_S.read(_v10, "track"), _S.read(_v10, "i")), 0)), 0.4), func(): return _S.invoke(["fx", "fy", "bx", "by", "crouch", "lean", "x", "y"], "every", [_S.function_value(_v10, "_f4")]))
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	return true

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.logical("??", _S.prop(_S.read(_e, "a"), _S.read(_e, "k")), func(): return 0), _S.logical("??", _S.prop(_S.read(_e, "b"), _S.read(_e, "k")), func(): return 0))]), 1.5)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "v", _S.arg(_args, 0))
	_S.define(_e, "rest", _S.arg(_args, 1))
	_S.define(_e, "own", _S.arg(_args, 2))
	_S.define(_e, "lv", _S.call_value(_S.read(_e, "lum"), [_S.read(_e, "v")]))
	if _S.truth(_S.logical("||", _S.binary(">", _S.read(_e, "lv"), 0.9), func(): return _S.binary("<", _S.binary(">>>", _S.read(_e, "v"), 24), 255))):
		return _S.read(_e, "v")
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "max", [0.45, _S.invoke(_S.read(_e, "Math"), "min", [1.5, _S.binary("/", _S.call_value(_S.read(_e, "lum"), [_S.read(_e, "own")]), _S.invoke(_S.read(_e, "Math"), "max", [0.08, _S.call_value(_S.read(_e, "lum"), [_S.read(_e, "rest")])]))])]))
	_S.define(_e, "ch", _S.function_value(_e, "_f6"))
	return _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.call_value(_S.read(_e, "ch"), [16]), 16)), _S.binary("<<", _S.call_value(_S.read(_e, "ch"), [8]), 8)), _S.call_value(_S.read(_e, "ch"), [0]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "min", [255, _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_e, "v"), _S.read(_e, "n")), 255), _S.read(_e, "k"))])])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "a", _S.prop(_S.read(_e, "mod"), "act"))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "duration"), func(): return 1))
	_S.define(_e, "k", _S.prop(_S.read(_e, "a"), "poses"))
	return _S.merge([{"from": _S.invoke(_S.read(_e, "Math"), "min", [0, _S.logical("??", _S.prop(_S.prop(_S.read(_e, "k"), 0), 0), func(): return 0)])}, {"to": (INF if _S.truth(_S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "loop")) else _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "D"), _S.logical("??", _S.prop(_S.prop(_S.read(_e, "k"), _S.binary("-", _S.prop(_S.read(_e, "k"), "length"), 1)), 0), func(): return 0)]))}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "o", _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([])))
	_S.define(_e, "a", _S.logical("??", _S.prop(_S.read(_e, "mod"), "act"), func(): return _S.merge([])))
	_S.define(_e, "meta", _S.logical("??", _S.prop(_S.read(_e, "mod"), "meta"), func(): return _S.merge([])))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.read(_e, "meta"), "duration"), func(): return 1))
	_S.define(_e, "flip", _S.unary("!", _S.unary("!", _S.prop(_S.read(_e, "o"), "flip"))))
	_S.define(_e, "seed", _S.logical("??", _S.logical("??", _S.prop(_S.read(_e, "o"), "seed"), func(): return _S.prop(_S.prop(_S.read(_e, "meta"), "options"), "seed")), func(): return 1))
	_S.define(_e, "fx", _S.call_value(_S.read(_e, "createFx"), [_S.read(_e, "mod"), _S.read(_e, "o")]))
	_S.define(_e, "track", _S.logical("??", _S.prop(_S.read(_e, "a"), "poses"), func(): return [[0, _S.merge([_S.read(_e, "STAND")])]]))
	_S.define(_e, "span", _S.call_value(_S.read(_e, "actSpan"), [_S.read(_e, "mod")]))
	_S.define(_e, "X", _S.logical("??", _S.prop(_S.read(_e, "o"), "x"), func(): return 0))
	_S.define(_e, "Y", _S.logical("??", _S.prop(_S.read(_e, "o"), "y"), func(): return 0))
	_S.define(_e, "targets", _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "targets"), func(): return ([_S.prop(_S.read(_e, "a"), "target")] if _S.truth(_S.prop(_S.read(_e, "a"), "target")) else [])), "map", [_S.function_value(_e, "_f9")]))
	_S.define(_e, "hits", _S.invoke(_S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "hits"), func(): return []), "map", [_S.function_value(_e, "_f10")]), "sort", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "dust", _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "dust"), func(): return []), "slice", []))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.read(_e, "seed"), 9)]))
	_S.define(_e, "specks", [])
	_S.define(_e, "ramp", _S.logical("??", _S.prop(_S.read(_e, "o"), "palette"), func(): return _S.prop(_S.prop(_S.read(_e, "meta"), "options"), "palette")))
	_S.define(_e, "ghosts", [])
	_S.define(_e, "gc", _S.call_value(_S.read(_e, "hex"), [_S.logical("??", _S.logical("??", _S.prop(_S.read(_e, "a"), "ghost"), func(): return _S.prop(_S.read(_e, "ramp"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "ramp"), "length"), 0.7)]))), func(): return "#8fb4ff")]))
	_S.define(_e, "t", _S.prop(_S.read(_e, "span"), "from"))
	_S.define(_e, "stop", 0)
	_S.define(_e, "stopped", false)
	_S.define(_e, "shakeT", 0)
	_S.define(_e, "shake0", 0)
	_S.define(_e, "amp", 0)
	_S.define(_e, "nh", 0)
	_S.define(_e, "nd", 0)
	_S.define(_e, "loopN", 0)
	_S.define(_e, "gAcc", 0)
	_S.define(_e, "last", null)
	_S.define(_e, "poseNow", _S.function_value(_e, "_f12"))
	_S.define(_e, "scratch", null)
	_S.define(_e, "scratchFor", _S.function_value(_e, "_f13"))
	_S.define(_e, "out", _S.merge([{"fx": _S.read(_e, "fx")}, {"meta": _S.read(_e, "meta")}, {"act": _S.read(_e, "a")}, {"targets": _S.read(_e, "targets")}, {"__getters": {"t": _S.function_value(_e, "_f14")}}, {"__getters": {"shake": _S.function_value(_e, "_f15")}}, {"__getters": {"frozen": _S.function_value(_e, "_f16")}}, {"__getters": {"pose": _S.function_value(_e, "_f17")}}, {"update": _S.function_value(_e, "_f18")}, {"draw": _S.function_value(_e, "_f20")}, {"stop": _S.function_value(_e, "_f34")}, {"done": _S.function_value(_e, "_f35")}]))
	_S.call_value(_S.read(_e, "poseNow"), [])
	return _S.read(_e, "out")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.construct(_S.read(_e, "Target"), [_S.logical("??", _S.prop(_S.read(_e, "g"), "x"), func(): return 66), _S.binary("+", _S.binary("+", _S.read(_e, "seed"), 4), _S.read(_e, "i"))])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "h")])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "p"), "t"), _S.prop(_S.read(_e, "q"), "t"))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "tt", _S.read(_e, "t"))
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "loop"), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D")))):
		_S.write(_e, "tt", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "D")), "=", false)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "poseAt"), [_S.read(_e, "track"), _S.read(_e, "tt")]))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "meta"), "loop")), func(): return _S.call_value(_S.read(_e, "isHeld"), [_S.read(_e, "track"), _S.read(_e, "tt")]))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "up", _S.binary("&", _S.invoke(_S.read(_v11, "Math"), "floor", [_S.binary("*", _S.read(_v11, "tt"), 3)]), 1))
		_S.write(_v11, "q", _S.merge([_S.read(_v11, "STAND"), _S.read(_v11, "q"), {"crouch": _S.binary("+", _S.logical("??", _S.prop(_S.read(_v11, "q"), "crouch"), func(): return 0), _S.read(_v11, "up"))}, {"fy": _S.binary("+", _S.logical("??", _S.prop(_S.read(_v11, "q"), "fy"), func(): return _S.prop(_S.read(_v11, "STAND"), "fy")), _S.read(_v11, "up"))}, {"by": _S.binary("+", _S.logical("??", _S.prop(_S.read(_v11, "q"), "by"), func(): return _S.prop(_S.read(_v11, "STAND"), "by")), _S.read(_v11, "up"))}]), "=", false)
	_S.write(_e, "last", _S.read(_e, "q"), "=", false)
	return _S.read(_e, "q")

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	if _S.truth(_S.logical("||", _S.logical("||", _S.unary("!", _S.read(_e, "scratch")), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "scratch"), "a"), "w"), _S.prop(_S.read(_e, "f"), "w"))), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_e, "scratch"), "a"), "h"), _S.prop(_S.read(_e, "f"), "h")))):
		_S.write(_e, "scratch", _S.merge([{"a": _S.call_value(_S.read(_e, "createFrame"), [_S.prop(_S.read(_e, "f"), "w"), _S.prop(_S.read(_e, "f"), "h"), _S.prop(_S.read(_e, "f"), "ox"), _S.prop(_S.read(_e, "f"), "oy")])}, {"b": _S.call_value(_S.read(_e, "createFrame"), [_S.prop(_S.read(_e, "f"), "w"), _S.prop(_S.read(_e, "f"), "h"), _S.prop(_S.read(_e, "f"), "ox"), _S.prop(_S.read(_e, "f"), "oy")])}]), "=", false)
	return _S.read(_e, "scratch")

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.read(_e, "t")

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	if _S.truth(_S.binary("<=", _S.read(_e, "shakeT"), 0)):
		return [0, 0]
	_S.define(_e, "k", _S.binary("*", _S.read(_e, "amp"), _S.binary("/", _S.read(_e, "shakeT"), _S.read(_e, "shake0"))))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "shakeT"), 60)]))
	return [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "f"), 2.4)]), _S.read(_e, "k"))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "f"), 3.7)]), _S.read(_e, "k")), 0.7)])]

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.binary(">", _S.read(_e, "stop"), 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.read(_e, "last")

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	if _S.truth(_S.binary(">", _S.read(_e, "shakeT"), 0)):
		_S.write(_e, "shakeT", _S.read(_e, "dt"), "-=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "stop"), 0)):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "stop", _S.read(_v12, "dt"), "-=", false)
		return null
	_S.define(_e, "t0", _S.read(_e, "t"))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), 0)):
		_S.invoke(_S.read(_e, "fx"), "update", [(_S.read(_e, "t") if _S.truth(_S.binary("<", _S.read(_e, "t0"), 0)) else _S.read(_e, "dt"))])
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "loop"), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D")))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "n", _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("/", _S.read(_v13, "t"), _S.read(_v13, "D"))]))
		if _S.truth(_S.binary("!==", _S.read(_v13, "n"), _S.read(_v13, "loopN"))):
			var _v14 = _S.scope(_v13)
			_S.write(_v14, "loopN", _S.read(_v14, "n"), "=", false)
			_S.write(_v14, "nh", 0, "=", false)
			_S.write(_v14, "nd", 0, "=", false)
	_S.define(_e, "tt", (_S.binary("%", _S.read(_e, "t"), _S.read(_e, "D")) if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "meta"), "loop"), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "D")))) else _S.read(_e, "t")))
	var _v15 = _S.scope(_e)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v15, "nh"), _S.prop(_S.read(_v15, "hits"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v15, "hits"), _S.read(_v15, "nh")), "t"), _S.read(_v15, "tt")))):
		var _v16 = _S.scope(_v15)
		_S.define(_v16, "h", _S.prop(_S.read(_v16, "hits"), _S.read(_v16, "nh")))
		if _S.truth(_S.prop(_S.read(_v16, "h"), "stop")):
			_S.write(_v16, "stop", _S.invoke(_S.read(_v16, "Math"), "max", [_S.read(_v16, "stop"), _S.prop(_S.read(_v16, "h"), "stop")]), "=", false)
		if _S.truth(_S.prop(_S.read(_v16, "h"), "shake")):
			var _v17 = _S.scope(_v16)
			_S.write(_v17, "shakeT", _S.write(_v17, "shake0", _S.prop(_S.read(_v17, "h"), "shake"), "=", false), "=", false)
			_S.write(_v17, "amp", _S.logical("??", _S.prop(_S.read(_v17, "h"), "amp"), func(): return 2), "=", false)
		if _S.truth(_S.binary("!==", _S.prop(_S.read(_v16, "h"), "target"), false)):
			_S.invoke(_S.read(_v16, "targets"), "forEach", [_S.function_value(_v16, "_f19")])
		_S.optional_call(_S.prop(_S.read(_v16, "out"), "onHit"), [_S.read(_v16, "h")])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "nh", 1, "+=", true)
	var _v18 = _S.scope(_e)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v18, "nd"), _S.prop(_S.read(_v18, "dust"), "length")), func(): return _S.binary("<=", _S.prop(_S.prop(_S.read(_v18, "dust"), _S.read(_v18, "nd")), "t"), _S.read(_v18, "tt")))):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "d", _S.prop(_S.read(_v19, "dust"), _S.read(_v19, "nd")))
		_S.define(_v19, "n", _S.logical("??", _S.prop(_S.read(_v19, "d"), "n"), func(): return 6))
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), _S.read(_v20, "n"))):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "dir", _S.logical("??", _S.prop(_S.read(_v21, "d"), "dir"), func(): return (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v21, "R"), "next", []), 0.5)) else 1)))
			_S.invoke(_S.read(_v21, "specks"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v21, "d"), "x"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.binary("-", _S.unary("-", 1), _S.invoke(_S.read(_v21, "R"), "range", [0, 2]))}, {"vx": _S.binary("*", _S.read(_v21, "dir"), _S.invoke(_S.read(_v21, "R"), "range", [22, 90]))}, {"vy": _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 34), _S.unary("-", 6)])}, {"age": 0}, {"life": _S.invoke(_S.read(_v21, "R"), "range", [0.16, 0.4])}, {"big": _S.binary("<", _S.invoke(_S.read(_v21, "R"), "next", []), 0.45)}, {"c": (_S.call_value(_S.read(_v21, "hex"), [_S.prop(_S.read(_v21, "d"), "c")]) if _S.truth(_S.prop(_S.read(_v21, "d"), "c")) else 0)}])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "nd", 1, "+=", true)
	for _v22 in _S.array(_S.read(_e, "specks")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "k", _v22)
		var _v24 = _S.scope(_v23)
		_S.set_prop(_S.read(_v24, "k"), "age", _S.read(_v24, "dt"), "+=", false)
		_S.set_prop(_S.read(_v24, "k"), "vx", _S.binary("-", 1, _S.binary("*", 5, _S.read(_v24, "dt"))), "*=", false)
		_S.set_prop(_S.read(_v24, "k"), "vy", _S.binary("*", 110, _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "k"), "x", _S.binary("*", _S.prop(_S.read(_v24, "k"), "vx"), _S.read(_v24, "dt")), "+=", false)
		_S.set_prop(_S.read(_v24, "k"), "y", _S.invoke(_S.read(_v24, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.prop(_S.read(_v24, "k"), "y"), _S.binary("*", _S.prop(_S.read(_v24, "k"), "vy"), _S.read(_v24, "dt")))]), "=", false)
	var _v25 = _S.scope(_e)
	_S.define(_v25, "i", _S.binary("-", _S.prop(_S.read(_v25, "specks"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v25, "i"), 0)):
		if _S.truth(_S.binary(">=", _S.prop(_S.prop(_S.read(_v25, "specks"), _S.read(_v25, "i")), "age"), _S.prop(_S.prop(_S.read(_v25, "specks"), _S.read(_v25, "i")), "life"))):
			_S.invoke(_S.read(_v25, "specks"), "splice", [_S.read(_v25, "i"), 1])
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "i", 1, "-=", true)
	_S.define(_e, "q", _S.call_value(_S.read(_e, "poseNow"), []))
	for _v26 in _S.array(_S.read(_e, "targets")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "g", _v26)
		_S.invoke(_S.read(_v27, "g"), "step", [_S.read(_v27, "dt")])
	_S.write(_e, "gAcc", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "q"), "ghost"), func(): return _S.binary(">=", _S.read(_e, "gAcc"), _S.binary("/", 1, 30)))):
		var _v28 = _S.scope(_e)
		_S.write(_v28, "gAcc", 0, "=", false)
		_S.invoke(_S.read(_v28, "ghosts"), "push", [_S.merge([{"q": _S.read(_v28, "q")}, {"age": 0}])])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v28, "ghosts"), "length"), 7)):
			_S.invoke(_S.read(_v28, "ghosts"), "shift", [])
	for _v29 in _S.array(_S.read(_e, "ghosts")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "g", _v29)
		_S.set_prop(_S.read(_v30, "g"), "age", _S.read(_v30, "dt"), "+=", false)
	while _S.truth(_S.logical("&&", _S.prop(_S.read(_e, "ghosts"), "length"), func(): return _S.binary(">", _S.prop(_S.prop(_S.read(_e, "ghosts"), 0), "age"), _S.read(_e, "GHOST_LIFE")))):
		_S.invoke(_S.read(_e, "ghosts"), "shift", [])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("||", _S.binary("===", _S.prop(_S.read(_e, "h"), "at"), null), func(): return _S.binary("===", _S.prop(_S.read(_e, "h"), "at"), _S.read(_e, "i"))), func(): return _S.invoke(_S.read(_e, "g"), "hit", [_S.read(_e, "h")]))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "frame", _S.arg(_args, 0))
	var _v31 = _S.coalesce(_S.arg(_args, 1), func(): return _S.merge([]))
	_S.define(_e, "body", _S.coalesce(_S.prop(_v31, "body"), func(): return true))
	_S.define(_e, "showTarget", _S.coalesce(_S.prop(_v31, "target"), func(): return true))
	_S.define(_e, "W", _S.prop(_S.read(_e, "frame"), "w"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "frame"), "h"))
	_S.define(_e, "q", _S.logical("??", _S.read(_e, "last"), func(): return _S.call_value(_S.read(_e, "poseNow"), [])))
	_S.define(_e, "active", _S.binary(">=", _S.read(_e, "t"), 0))
	_S.define(_e, "tgt", (_S.read(_e, "targets") if _S.truth(_S.read(_e, "showTarget")) else []))
	_S.define(_e, "drawTargets", _S.function_value(_e, "_f21"))
	_S.define(_e, "drawStraw", _S.function_value(_e, "_f23"))
	_S.define(_e, "drawDust", _S.function_value(_e, "_f25"))
	_S.define(_e, "FX", _S.binary("-", _S.read(_e, "X"), _S.binary("|", _S.prop(_S.read(_e, "frame"), "ox"), 0)))
	_S.define(_e, "FY", _S.binary("-", _S.read(_e, "Y"), _S.binary("|", _S.prop(_S.read(_e, "frame"), "oy"), 0)))
	if _S.truth(_S.unary("!", _S.read(_e, "body"))):
		var _v37 = _S.scope(_e)
		if _S.truth(_S.read(_v37, "active")):
			_S.invoke(_S.read(_v37, "fx"), "draw", [_S.read(_v37, "frame"), "back"])
		_S.call_value(_S.read(_v37, "drawTargets"), [])
		if _S.truth(_S.read(_v37, "active")):
			_S.invoke(_S.read(_v37, "fx"), "draw", [_S.read(_v37, "frame"), "front"])
		_S.call_value(_S.read(_v37, "drawStraw"), [])
		return null
	_S.define(_e, "rx", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "q"), "x"), func(): return 0)]))
	_S.define(_e, "ry", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "q"), "y"), func(): return 0)]))
	_S.define(_e, "BX", _S.binary("+", _S.read(_e, "FX"), (_S.unary("-", _S.read(_e, "rx")) if _S.truth(_S.read(_e, "flip")) else _S.read(_e, "rx"))))
	_S.define(_e, "BY", _S.binary("+", _S.read(_e, "FY"), _S.read(_e, "ry")))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "posed"), [_S.read(_e, "q")]))
	_S.define(_e, "mirror", _S.read(_e, "flip"))
	_S.define(_e, "paint", _S.function_value(_e, "_f26"))
	_S.define(_e, "drawGhosts", _S.function_value(_e, "_f27"))
	_S.define(_e, "shadow", _S.function_value(_e, "_f28"))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "a"), "onBody"))):
		var _v46 = _S.scope(_e)
		if _S.truth(_S.read(_v46, "active")):
			_S.invoke(_S.read(_v46, "fx"), "draw", [_S.read(_v46, "frame"), "back"])
		_S.call_value(_S.read(_v46, "drawTargets"), [])
		_S.call_value(_S.read(_v46, "shadow"), [])
		_S.call_value(_S.read(_v46, "drawGhosts"), [])
		var _v47 = _S.scope(_v46)
		_S.define(_v47, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v47, "i"), _S.prop(_S.read(_v47, "r"), "n"))):
			_S.call_value(_S.read(_v47, "paint"), [_S.read(_v47, "i"), _S.prop(_S.prop(_S.read(_v47, "r"), "color"), _S.read(_v47, "i"))])
			_v47 = _S.iteration(_v47)
			_S.write(_v47, "i", 1, "+=", true)
		if _S.truth(_S.read(_v46, "active")):
			_S.invoke(_S.read(_v46, "fx"), "draw", [_S.read(_v46, "frame"), "front"])
		_S.call_value(_S.read(_v46, "drawStraw"), [])
		_S.call_value(_S.read(_v46, "drawDust"), [])
		return null
	var _v48 = _S.call_value(_S.read(_e, "scratchFor"), [_S.read(_e, "frame")])
	_S.define(_e, "A", _S.prop(_v48, "a"))
	_S.define(_e, "B", _S.prop(_v48, "b"))
	_S.call_value(_S.read(_e, "clearFrame"), [_S.read(_e, "A")])
	_S.call_value(_S.read(_e, "clearFrame"), [_S.read(_e, "B")])
	if _S.truth(_S.read(_e, "active")):
		_S.invoke(_S.read(_e, "fx"), "draw", [_S.read(_e, "A"), "back"])
	_S.invoke(_S.prop(_S.read(_e, "B"), "color"), "set", [_S.prop(_S.read(_e, "A"), "color")])
	_S.invoke(_S.prop(_S.read(_e, "B"), "light"), "set", [_S.prop(_S.read(_e, "A"), "light")])
	_S.define(_e, "tt", ((0 if _S.truth(_S.binary("<", _S.read(_e, "t"), 0)) else _S.binary("%", _S.read(_e, "t"), _S.read(_e, "D"))) if _S.truth(_S.prop(_S.read(_e, "meta"), "loop")) else _S.call_value(_S.read(_e, "clamp"), [_S.read(_e, "t"), 0, _S.read(_e, "D")])))
	_S.define(_e, "alpha", (_S.call_value(_S.read(_e, "actorAlphaOf"), [_S.read(_e, "mod"), _S.read(_e, "tt"), _S.prop(_S.read(_e, "fx"), "options")]) if _S.truth(_S.read(_e, "active")) else 1))
	_S.call_value(_S.read(_e, "drawActor"), [_S.invoke(_S.call_value(_S.read(_e, "painterFor"), [_S.read(_e, "B")]), "place", [_S.read(_e, "FX"), _S.read(_e, "FY"), _S.read(_e, "flip")]), _S.logical("??", _S.prop(_S.prop(_S.read(_e, "fx"), "options"), "actor"), func(): return _S.call_value(_S.read(_e, "stockActor"), [2])), _S.read(_e, "alpha")])
	if _S.truth(_S.read(_e, "active")):
		_S.invoke(_S.read(_e, "fx"), "draw", [_S.read(_e, "B"), "front"])
	_S.define(_e, "follow", _S.logical("??", _S.prop(_S.read(_e, "a"), "follow"), func(): return 1))
	_S.define(_e, "lean", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "lean"), func(): return 0), _S.read(_e, "follow")))
	_S.define(_e, "cr", _S.binary("*", _S.logical("??", _S.prop(_S.read(_e, "q"), "crouch"), func(): return 0), _S.read(_e, "follow")))
	_S.define(_e, "shiftOf", _S.function_value(_e, "_f29"))
	_S.define(_e, "rest", _S.function_value(_e, "_f30"))
	_S.define(_e, "C", _S.prop(_S.read(_e, "frame"), "color"))
	_S.define(_e, "Ls", _S.prop(_S.read(_e, "frame"), "light"))
	_S.define(_e, "copy", _S.function_value(_e, "_f31"))
	_S.call_value(_S.read(_e, "drawTargets"), [])
	_S.call_value(_S.read(_e, "shadow"), [])
	var _v52 = _S.scope(_e)
	_S.define(_v52, "sy", 0)
	while _S.truth(_S.binary("<", _S.read(_v52, "sy"), _S.read(_v52, "H"))):
		var _v53 = _S.scope(_v52)
		_S.define(_v53, "sx", 0)
		while _S.truth(_S.binary("<", _S.read(_v53, "sx"), _S.read(_v53, "W"))):
			var _v54 = _S.scope(_v53)
			_S.define(_v54, "c", _S.prop(_S.prop(_S.read(_v54, "A"), "color"), _S.binary("+", _S.binary("*", _S.read(_v54, "sy"), _S.read(_v54, "W")), _S.read(_v54, "sx"))))
			if _S.truth(_S.read(_v54, "c")):
				_S.call_value(_S.read(_v54, "copy"), [_S.read(_v54, "C"), _S.read(_v54, "sx"), _S.read(_v54, "sy"), _S.read(_v54, "c")])
			_v53 = _S.iteration(_v53)
			_S.write(_v53, "sx", 1, "+=", true)
		_v52 = _S.iteration(_v52)
		_S.write(_v52, "sy", 1, "+=", true)
	_S.call_value(_S.read(_e, "drawGhosts"), [])
	_S.define(_e, "restIndex", _S.function_value(_e, "_f33"))
	var _v55 = _S.scope(_e)
	_S.define(_v55, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v55, "i"), _S.prop(_S.read(_v55, "r"), "n"))):
		var _v56 = _S.scope(_v55)
		_S.define(_v56, "s", (_S.prop(_S.read(_v56, "NEAREST"), _S.prop(_S.prop(_S.read(_v56, "r"), "src"), _S.read(_v56, "i"))) if _S.truth(_S.binary(">=", _S.prop(_S.prop(_S.read(_v56, "r"), "src"), _S.read(_v56, "i")), 0)) else _S.unary("-", 1)))
		if _S.truth(_S.binary("<", _S.read(_v56, "s"), 0)):
			var _v57 = _S.scope(_v56)
			if _S.truth(_S.binary(">", _S.read(_v57, "alpha"), 0.5)):
				_S.call_value(_S.read(_v57, "paint"), [_S.read(_v57, "i"), _S.prop(_S.prop(_S.read(_v57, "r"), "color"), _S.read(_v57, "i"))])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
			continue
		_S.define(_v56, "j", _S.call_value(_S.read(_v56, "restIndex"), [_S.read(_v56, "s")]))
		_S.define(_v56, "v", (_S.prop(_S.prop(_S.read(_v56, "B"), "color"), _S.read(_v56, "j")) if _S.truth(_S.binary(">=", _S.read(_v56, "j"), 0)) else _S.prop(_S.read(_v56, "REST_PX"), _S.read(_v56, "s"))))
		if _S.truth(_S.unary("!", _S.read(_v56, "v"))):
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
			continue
		_S.call_value(_S.read(_v56, "paint"), [_S.read(_v56, "i"), (_S.prop(_S.prop(_S.read(_v56, "r"), "color"), _S.read(_v56, "i")) if _S.truth(_S.binary("===", _S.read(_v56, "v"), _S.prop(_S.read(_v56, "REST_PX"), _S.read(_v56, "s")))) else _S.call_value(_S.read(_v56, "carry"), [_S.read(_v56, "v"), _S.prop(_S.read(_v56, "REST_PX"), _S.read(_v56, "s")), _S.prop(_S.prop(_S.read(_v56, "r"), "color"), _S.read(_v56, "i"))]))])
		_v55 = _S.iteration(_v55)
		_S.write(_v55, "i", 1, "+=", true)
	var _v58 = _S.scope(_e)
	_S.define(_v58, "sy", 0)
	while _S.truth(_S.binary("<", _S.read(_v58, "sy"), _S.read(_v58, "H"))):
		var _v59 = _S.scope(_v58)
		_S.define(_v59, "sx", 0)
		while _S.truth(_S.binary("<", _S.read(_v59, "sx"), _S.read(_v59, "W"))):
			var _v60 = _S.scope(_v59)
			_S.define(_v60, "j", _S.binary("+", _S.binary("*", _S.read(_v60, "sy"), _S.read(_v60, "W")), _S.read(_v60, "sx")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.prop(_S.read(_v60, "B"), "color"), _S.read(_v60, "j")), func(): return _S.binary("!==", _S.prop(_S.prop(_S.read(_v60, "B"), "color"), _S.read(_v60, "j")), _S.prop(_S.prop(_S.read(_v60, "A"), "color"), _S.read(_v60, "j")))), func(): return _S.unary("!", _S.call_value(_S.read(_v60, "rest"), [_S.read(_v60, "sx"), _S.read(_v60, "sy")])))):
				_S.call_value(_S.read(_v60, "copy"), [_S.read(_v60, "C"), _S.read(_v60, "sx"), _S.read(_v60, "sy"), _S.prop(_S.prop(_S.read(_v60, "B"), "color"), _S.read(_v60, "j"))])
			if _S.truth(_S.binary("&", _S.prop(_S.prop(_S.read(_v60, "B"), "light"), _S.read(_v60, "j")), 16777215)):
				_S.call_value(_S.read(_v60, "copy"), [_S.read(_v60, "Ls"), _S.read(_v60, "sx"), _S.read(_v60, "sy"), _S.prop(_S.prop(_S.read(_v60, "B"), "light"), _S.read(_v60, "j"))])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "sx", 1, "+=", true)
		_v58 = _S.iteration(_v58)
		_S.write(_v58, "sy", 1, "+=", true)
	_S.call_value(_S.read(_e, "drawStraw"), [])
	_S.call_value(_S.read(_e, "drawDust"), [])
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "tgt"), "forEach", [_S.function_value(_e, "_f22")])

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "draw", [_S.prop(_S.read(_e, "frame"), "color"), _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "FX"), _S.read(_e, "FY"), _S.read(_e, "flip")])

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.invoke(_S.read(_e, "tgt"), "forEach", [_S.function_value(_e, "_f24")])

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "drawStraw", [_S.prop(_S.read(_e, "frame"), "color"), _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "FX"), _S.read(_e, "FY"), _S.read(_e, "flip")])

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	for _v32 in _S.array(_S.read(_e, "specks")):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "k", _v32)
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "c", _S.logical("||", _S.prop(_S.read(_v34, "k"), "c"), func(): return _S.prop(_S.read(_v34, "DUST"), _S.invoke(_S.read(_v34, "Math"), "min", [3, _S.invoke(_S.read(_v34, "Math"), "floor", [_S.binary("*", _S.binary("/", _S.prop(_S.read(_v34, "k"), "age"), _S.prop(_S.read(_v34, "k"), "life")), 4)])]))))
		_S.define(_v34, "lx", _S.invoke(_S.read(_v34, "Math"), "round", [_S.prop(_S.read(_v34, "k"), "x")]))
		_S.define(_v34, "py", _S.binary("+", _S.read(_v34, "FY"), _S.invoke(_S.read(_v34, "Math"), "round", [_S.prop(_S.read(_v34, "k"), "y")])))
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "i"), (2 if _S.truth(_S.prop(_S.read(_v35, "k"), "big")) else 1))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "px", (_S.binary("-", _S.binary("-", _S.binary("-", _S.read(_v36, "FX"), _S.read(_v36, "lx")), _S.read(_v36, "i")), 1) if _S.truth(_S.read(_v36, "flip")) else _S.binary("+", _S.binary("+", _S.read(_v36, "FX"), _S.read(_v36, "lx")), _S.read(_v36, "i"))))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v36, "px"), 0), func(): return _S.binary(">=", _S.read(_v36, "py"), 0)), func(): return _S.binary("<", _S.read(_v36, "px"), _S.read(_v36, "W"))), func(): return _S.binary("<", _S.read(_v36, "py"), _S.read(_v36, "H")))):
				_S.set_prop(_S.prop(_S.read(_v36, "frame"), "color"), _S.binary("+", _S.binary("*", _S.read(_v36, "py"), _S.read(_v36, "W")), _S.read(_v36, "px")), _S.read(_v36, "c"), "=", false)
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "+=", true)
	return null

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	_S.define(_e, "color", _S.arg(_args, 1))
	_S.define(_e, "px", (_S.binary("-", _S.binary("-", _S.read(_e, "BX"), _S.prop(_S.prop(_S.read(_e, "r"), "xs"), _S.read(_e, "i"))), 1) if _S.truth(_S.read(_e, "mirror")) else _S.binary("+", _S.read(_e, "BX"), _S.prop(_S.prop(_S.read(_e, "r"), "xs"), _S.read(_e, "i")))))
	_S.define(_e, "py", _S.binary("+", _S.read(_e, "BY"), _S.prop(_S.prop(_S.read(_e, "r"), "ys"), _S.read(_e, "i"))))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "px"), 0), func(): return _S.binary("<", _S.read(_e, "py"), 0)), func(): return _S.binary(">=", _S.read(_e, "px"), _S.read(_e, "W"))), func(): return _S.binary(">=", _S.read(_e, "py"), _S.read(_e, "H")))):
		return null
	_S.set_prop(_S.prop(_S.read(_e, "frame"), "color"), _S.binary("+", _S.binary("*", _S.read(_e, "py"), _S.read(_e, "W")), _S.read(_e, "px")), _S.read(_e, "color"), "=", false)
	if _S.truth(_S.prop(_S.read(_e, "ghosts"), "length")):
		_S.set_prop(_S.prop(_S.read(_e, "frame"), "light"), _S.binary("+", _S.binary("*", _S.read(_e, "py"), _S.read(_e, "W")), _S.read(_e, "px")), 0, "=", false)
	return null

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	for _v38 in _S.array(_S.read(_e, "ghosts")):
		var _v39 = _S.scope(_e)
		_S.define(_v39, "g", _v38)
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "gr", _S.call_value(_S.read(_v40, "posed"), [_S.prop(_S.read(_v40, "g"), "q")]))
		_S.define(_v40, "gx", _S.binary("+", _S.read(_v40, "FX"), (_S.unary("-", _S.invoke(_S.read(_v40, "Math"), "round", [_S.logical("??", _S.prop(_S.prop(_S.read(_v40, "g"), "q"), "x"), func(): return 0)])) if _S.truth(_S.read(_v40, "flip")) else _S.invoke(_S.read(_v40, "Math"), "round", [_S.logical("??", _S.prop(_S.prop(_S.read(_v40, "g"), "q"), "x"), func(): return 0)]))))
		_S.define(_v40, "gy", _S.binary("+", _S.read(_v40, "FY"), _S.invoke(_S.read(_v40, "Math"), "round", [_S.logical("??", _S.prop(_S.prop(_S.read(_v40, "g"), "q"), "y"), func(): return 0)])))
		_S.define(_v40, "k", _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v40, "g"), "age"), _S.read(_v40, "GHOST_LIFE")))))
		_S.define(_v40, "gm", _S.read(_v40, "flip"))
		_S.define(_v40, "r0", _S.binary("*", _S.binary("&", _S.read(_v40, "gc"), 255), _S.read(_v40, "k")))
		_S.define(_v40, "g0", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v40, "gc"), 8), 255), _S.read(_v40, "k")))
		_S.define(_v40, "b0", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_v40, "gc"), 16), 255), _S.read(_v40, "k")))
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v41, "i"), _S.prop(_S.read(_v41, "gr"), "n"))):
			var _v42 = _S.scope(_v41)
			_S.define(_v42, "px", (_S.binary("-", _S.binary("-", _S.read(_v42, "gx"), _S.prop(_S.prop(_S.read(_v42, "gr"), "xs"), _S.read(_v42, "i"))), 1) if _S.truth(_S.read(_v42, "gm")) else _S.binary("+", _S.read(_v42, "gx"), _S.prop(_S.prop(_S.read(_v42, "gr"), "xs"), _S.read(_v42, "i")))))
			_S.define(_v42, "py", _S.binary("+", _S.read(_v42, "gy"), _S.prop(_S.prop(_S.read(_v42, "gr"), "ys"), _S.read(_v42, "i"))))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v42, "px"), 0), func(): return _S.binary("<", _S.read(_v42, "py"), 0)), func(): return _S.binary(">=", _S.read(_v42, "px"), _S.read(_v42, "W"))), func(): return _S.binary(">=", _S.read(_v42, "py"), _S.read(_v42, "H")))):
				_v41 = _S.iteration(_v41)
				_S.write(_v41, "i", 1, "+=", true)
				continue
			_S.define(_v42, "j", _S.binary("+", _S.binary("*", _S.read(_v42, "py"), _S.read(_v42, "W")), _S.read(_v42, "px")))
			_S.define(_v42, "d", _S.prop(_S.prop(_S.read(_v42, "frame"), "light"), _S.read(_v42, "j")))
			_S.set_prop(_S.prop(_S.read(_v42, "frame"), "light"), _S.read(_v42, "j"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.invoke(_S.read(_v42, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v42, "d"), 16), 255), _S.read(_v42, "b0"))]), 16)), _S.binary("<<", _S.invoke(_S.read(_v42, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v42, "d"), 8), 255), _S.read(_v42, "g0"))]), 8)), _S.invoke(_S.read(_v42, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.read(_v42, "d"), 255), _S.read(_v42, "r0"))])), "=", false)
			_v41 = _S.iteration(_v41)
			_S.write(_v41, "i", 1, "+=", true)
	return null

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sy", _S.read(_e, "FY"))
	_S.define(_e, "cx", _S.binary("+", _S.read(_e, "FX"), (_S.unary("-", _S.read(_e, "rx")) if _S.truth(_S.read(_e, "flip")) else _S.read(_e, "rx"))))
	_S.define(_e, "hw", _S.binary("-", _S.binary("+", 10, _S.binary(">>", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_e, "q"), "ffx"), _S.prop(_S.read(_e, "q"), "fbx"))]), 1)), _S.invoke(_S.read(_e, "Math"), "min", [8, _S.binary(">>", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "ry")]), 1)])))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "sy"), 0), func(): return _S.binary(">=", _S.read(_e, "sy"), _S.read(_e, "H")))):
		return null
	var _v43 = _S.scope(_e)
	_S.define(_v43, "dy", 0)
	while _S.truth(_S.binary("<", _S.read(_v43, "dy"), 2)):
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "x", _S.binary("+", _S.unary("-", _S.read(_v44, "hw")), _S.binary("*", _S.read(_v44, "dy"), 2)))
		while _S.truth(_S.binary("<=", _S.read(_v44, "x"), _S.binary("-", _S.read(_v44, "hw"), _S.binary("*", _S.read(_v44, "dy"), 2)))):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "px", _S.binary("+", _S.read(_v45, "cx"), _S.read(_v45, "x")))
			_S.define(_v45, "i", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v45, "sy"), _S.read(_v45, "dy")), _S.read(_v45, "W")), _S.read(_v45, "px")))
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v45, "px"), 0), func(): return _S.binary(">=", _S.read(_v45, "px"), _S.read(_v45, "W"))), func(): return _S.binary(">=", _S.binary("+", _S.read(_v45, "sy"), _S.read(_v45, "dy")), _S.read(_v45, "H")))):
				_v44 = _S.iteration(_v44)
				_S.write(_v44, "x", 1, "+=", true)
				continue
			_S.set_prop(_S.prop(_S.read(_v45, "frame"), "color"), _S.read(_v45, "i"), _S.binary("|", _S.binary("&", _S.prop(_S.prop(_S.read(_v45, "frame"), "color"), _S.read(_v45, "i")), 16777215), _S.binary("<<", _S.invoke(_S.read(_v45, "Math"), "max", [_S.binary(">>>", _S.prop(_S.prop(_S.read(_v45, "frame"), "color"), _S.read(_v45, "i")), 24), 110]), 24)), "=", false)
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "x", 1, "+=", true)
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "dy", 1, "+=", true)
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ly", _S.arg(_args, 0))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.unary("-", 11), _S.read(_e, "ly")), 7), 0, 1]))
	_S.define(_e, "f", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.unary("-", 1), _S.read(_e, "ly")), 6), 0, 1]))
	return [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("*", _S.read(_e, "lean"), _S.read(_e, "k")), _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "f")))]), _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("*", _S.read(_e, "cr"), _S.read(_e, "k")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "f")))])]

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "sx", _S.arg(_args, 0))
	_S.define(_e, "sy", _S.arg(_args, 1))
	_S.define(_e, "c", _S.binary("+", (_S.binary("-", _S.binary("-", _S.read(_e, "FX"), _S.read(_e, "sx")), 1) if _S.truth(_S.read(_e, "flip")) else _S.binary("-", _S.read(_e, "sx"), _S.read(_e, "FX"))), 12))
	_S.define(_e, "r0", _S.binary("+", _S.binary("-", _S.read(_e, "sy"), _S.read(_e, "FY")), 38))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "c"), 0), func(): return _S.binary(">=", _S.read(_e, "r0"), 0)), func(): return _S.binary("<", _S.read(_e, "c"), 24)), func(): return _S.binary("<", _S.read(_e, "r0"), 38)), func(): return _S.binary("===", _S.prop(_S.read(_e, "REST_MASK"), _S.binary("+", _S.binary("*", _S.read(_e, "r0"), 24), _S.read(_e, "c"))), 1))

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "buf", _S.arg(_args, 0))
	_S.define(_e, "sx", _S.arg(_args, 1))
	_S.define(_e, "sy", _S.arg(_args, 2))
	_S.define(_e, "s", _S.arg(_args, 3))
	var _v49 = _S.call_value(_S.read(_e, "shiftOf"), [_S.binary("-", _S.read(_e, "sy"), _S.read(_e, "FY"))])
	_S.define(_e, "dx", _S.prop(_v49, 0))
	_S.define(_e, "dy", _S.prop(_v49, 1))
	_S.define(_e, "px", _S.binary("+", _S.read(_e, "sx"), (_S.unary("-", _S.read(_e, "dx")) if _S.truth(_S.read(_e, "flip")) else _S.read(_e, "dx"))))
	_S.define(_e, "py", _S.binary("+", _S.read(_e, "sy"), _S.read(_e, "dy")))
	if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "px"), 0), func(): return _S.binary("<", _S.read(_e, "py"), 0)), func(): return _S.binary(">=", _S.read(_e, "px"), _S.read(_e, "W"))), func(): return _S.binary(">=", _S.read(_e, "py"), _S.read(_e, "H")))):
		return null
	_S.define(_e, "i", _S.binary("+", _S.binary("*", _S.read(_e, "py"), _S.read(_e, "W")), _S.read(_e, "px")))
	if _S.truth(_S.binary("===", _S.read(_e, "buf"), _S.read(_e, "Ls"))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "d", _S.prop(_S.read(_v50, "Ls"), _S.read(_v50, "i")))
		_S.set_prop(_S.read(_v50, "Ls"), _S.read(_v50, "i"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", 255, 24), _S.binary("<<", _S.invoke(_S.read(_v50, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v50, "d"), 16), 255), _S.binary("&", _S.binary(">>>", _S.read(_v50, "s"), 16), 255))]), 16)), _S.binary("<<", _S.invoke(_S.read(_v50, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.binary(">>>", _S.read(_v50, "d"), 8), 255), _S.binary("&", _S.binary(">>>", _S.read(_v50, "s"), 8), 255))]), 8)), _S.invoke(_S.read(_v50, "Math"), "min", [255, _S.binary("+", _S.binary("&", _S.read(_v50, "d"), 255), _S.binary("&", _S.read(_v50, "s"), 255))])), "=", false)
	else:
		if _S.truth(_S.logical("||", _S.binary("===", _S.binary(">>>", _S.read(_e, "s"), 24), 255), func(): return _S.unary("!", _S.prop(_S.read(_e, "C"), _S.read(_e, "i"))))):
			_S.set_prop(_S.read(_e, "C"), _S.read(_e, "i"), _S.read(_e, "s"), "=", false)
		else:
			var _v51 = _S.scope(_e)
			_S.define(_v51, "k", _S.binary("/", _S.binary(">>>", _S.read(_v51, "s"), 24), 255))
			_S.define(_v51, "d", _S.prop(_S.read(_v51, "C"), _S.read(_v51, "i")))
			_S.define(_v51, "ch", _S.function_value(_v51, "_f32"))
			_S.set_prop(_S.read(_v51, "C"), _S.read(_v51, "i"), _S.binary("|", _S.binary("|", _S.binary("|", _S.binary("<<", _S.invoke(_S.read(_v51, "Math"), "max", [_S.binary(">>>", _S.read(_v51, "s"), 24), _S.binary(">>>", _S.read(_v51, "d"), 24)]), 24), _S.binary("<<", _S.call_value(_S.read(_v51, "ch"), [16]), 16)), _S.binary("<<", _S.call_value(_S.read(_v51, "ch"), [8]), 8)), _S.call_value(_S.read(_v51, "ch"), [0])), "=", false)
	return null

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_e, "s"), _S.read(_e, "n")), 255), _S.read(_e, "k")), _S.binary("*", _S.binary("&", _S.binary(">>>", _S.read(_e, "d"), _S.read(_e, "n")), 255), _S.binary("-", 1, _S.read(_e, "k"))))])

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "c", _S.binary("%", _S.read(_e, "s"), 24))
	_S.define(_e, "r0", _S.binary("|", _S.binary("/", _S.read(_e, "s"), 24), 0))
	_S.define(_e, "sx", (_S.binary("-", _S.binary("-", _S.read(_e, "FX"), _S.binary("-", _S.read(_e, "c"), 12)), 1) if _S.truth(_S.read(_e, "flip")) else _S.binary("-", _S.binary("+", _S.read(_e, "FX"), _S.read(_e, "c")), 12)))
	_S.define(_e, "sy", _S.binary("-", _S.binary("+", _S.read(_e, "FY"), _S.read(_e, "r0")), 38))
	return (_S.binary("+", _S.binary("*", _S.read(_e, "sy"), _S.read(_e, "W")), _S.read(_e, "sx")) if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "sx"), 0), func(): return _S.binary(">=", _S.read(_e, "sy"), 0)), func(): return _S.binary("<", _S.read(_e, "sx"), _S.read(_e, "W"))), func(): return _S.binary("<", _S.read(_e, "sy"), _S.read(_e, "H")))) else _S.unary("-", 1))

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.invoke(_S.read(_e, "fx"), "stop", [])
	_S.write(_e, "stopped", true, "=", false)
	return null

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return (_S.invoke(_S.read(_e, "fx"), "done", []) if _S.truth(_S.read(_e, "stopped")) else _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "span"), "to")), func(): return _S.binary("<=", _S.read(_e, "stop"), 0)))

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "a", _S.prop(_S.read(_e, "mod"), "act"))
	if _S.truth(_S.unary("!", _S.read(_e, "a"))):
		return null
	var _v61 = _S.call_value(_S.read(_e, "actSpan"), [_S.read(_e, "mod")])
	_S.define(_e, "from", _S.prop(_v61, "from"))
	_S.define(_e, "to", _S.prop(_v61, "to"))
	_S.define(_e, "D", _S.logical("??", _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "duration"), func(): return 1))
	return _S.merge([{"windup": _S.unary("-", _S.read(_e, "from"))}, {"recovery": (0 if _S.truth(_S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "loop")) else _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "to"), _S.read(_e, "D"))]))}, {"onBody": _S.unary("!", _S.unary("!", _S.prop(_S.read(_e, "a"), "onBody")))}, {"targets": _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "targets"), func(): return ([_S.prop(_S.read(_e, "a"), "target")] if _S.truth(_S.prop(_S.read(_e, "a"), "target")) else [])), "map", [_S.function_value(_e, "_f37")])}, {"hits": _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "hits"), func(): return []), "map", [_S.function_value(_e, "_f38")])}, {"poses": _S.invoke(_S.logical("??", _S.prop(_S.read(_e, "a"), "poses"), func(): return []), "map", [_S.function_value(_e, "_f39")])}])

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.logical("??", _S.prop(_S.read(_e, "g"), "x"), func(): return 66)

static func _f38(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "h", _S.arg(_args, 0))
	return _S.merge([{"t": _S.prop(_S.read(_e, "h"), "t")}, {"freeze": _S.logical("??", _S.prop(_S.read(_e, "h"), "stop"), func(): return 0)}, {"shake": _S.logical("??", _S.prop(_S.read(_e, "h"), "shake"), func(): return 0)}, {"amp": _S.logical("??", _S.prop(_S.read(_e, "h"), "amp"), func(): return 0)}, {"push": (0 if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "h"), "target"), false)) else _S.logical("??", _S.prop(_S.read(_e, "h"), "push"), func(): return 1.2))}, {"skin": _S.prop(_S.read(_e, "h"), "skin")}, {"at": _S.prop(_S.read(_e, "h"), "at")}])

static func _f39(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v62 = _S.arg(_args, 0)
	_S.define(_e, "t", _S.prop(_v62, 0))
	_S.define(_e, "pose", _S.prop(_v62, 1))
	_S.define(_e, "how", _S.prop(_v62, 2))
	return _S.merge([{"t": _S.read(_e, "t")}, {"how": _S.logical("??", _S.read(_e, "how"), func(): return "smooth")}, {"pose": _S.read(_e, "pose")}])

static func _f40(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "mod", _S.arg(_args, 0))
	_S.define(_e, "a", _S.prop(_S.read(_e, "mod"), "act"))
	var _v63 = _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "size")
	_S.define(_e, "w", _S.prop(_v63, 0))
	_S.define(_e, "h", _S.prop(_v63, 1))
	var _v64 = _S.prop(_S.prop(_S.read(_e, "mod"), "meta"), "origin")
	_S.define(_e, "ox", _S.prop(_v64, 0))
	_S.define(_e, "oy", _S.prop(_v64, 1))
	_S.define(_e, "x0", _S.unary("-", _S.read(_e, "ox")))
	_S.define(_e, "y0", _S.unary("-", _S.read(_e, "oy")))
	_S.define(_e, "x1", _S.binary("-", _S.read(_e, "w"), _S.read(_e, "ox")))
	_S.define(_e, "y1", _S.binary("-", _S.read(_e, "h"), _S.read(_e, "oy")))
	_S.define(_e, "see", _S.function_value(_e, "_f41"))
	_S.define(_e, "k", _S.prop(_S.read(_e, "a"), "poses"))
	if _S.truth(_S.read(_e, "k")):
		var _v65 = _S.scope(_e)
		var _v66 = _S.scope(_v65)
		_S.define(_v66, "t", _S.prop(_S.prop(_S.read(_v66, "k"), 0), 0))
		while _S.truth(_S.binary("<=", _S.read(_v66, "t"), _S.prop(_S.prop(_S.read(_v66, "k"), _S.binary("-", _S.prop(_S.read(_v66, "k"), "length"), 1)), 0))):
			_S.call_value(_S.read(_v66, "see"), [_S.call_value(_S.read(_v66, "poseAt"), [_S.read(_v66, "k"), _S.read(_v66, "t")])])
			_v66 = _S.iteration(_v66)
			_S.write(_v66, "t", _S.binary("/", 1, 12), "+=", false)
		for _v67 in _S.array(_S.read(_v65, "k")):
			var _v68 = _S.scope(_v65)
			_S.define(_v68, "key", _v67)
			_S.call_value(_S.read(_v68, "see"), [_S.prop(_S.read(_v68, "key"), 1)])
	else:
		_S.call_value(_S.read(_e, "see"), [_S.read(_e, "STAND")])
	for _v69 in _S.array(_S.logical("??", _S.prop(_S.read(_e, "a"), "targets"), func(): return ([_S.prop(_S.read(_e, "a"), "target")] if _S.truth(_S.prop(_S.read(_e, "a"), "target")) else []))):
		var _v70 = _S.scope(_e)
		_S.define(_v70, "g", _v69)
		var _v71 = _S.scope(_v70)
		_S.define(_v71, "tx", _S.logical("??", _S.prop(_S.read(_v71, "g"), "x"), func(): return 66))
		_S.write(_v71, "x0", _S.invoke(_S.read(_v71, "Math"), "min", [_S.read(_v71, "x0"), _S.binary("-", _S.read(_v71, "tx"), 30)]), "=", false)
		_S.write(_v71, "x1", _S.invoke(_S.read(_v71, "Math"), "max", [_S.read(_v71, "x1"), _S.binary("+", _S.read(_v71, "tx"), 36)]), "=", false)
		_S.write(_v71, "y0", _S.invoke(_S.read(_v71, "Math"), "min", [_S.read(_v71, "y0"), _S.unary("-", 56)]), "=", false)
	return _S.merge([{"x0": _S.read(_e, "x0")}, {"y0": _S.read(_e, "y0")}, {"x1": _S.read(_e, "x1")}, {"y1": _S.read(_e, "y1")}])

static func _f41(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "posed"), [_S.read(_e, "p")]))
	_S.define(_e, "X", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "p"), "x"), func(): return 0)]))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "round", [_S.logical("??", _S.prop(_S.read(_e, "p"), "y"), func(): return 0)]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "r"), "x0"))
	_S.define(_e, "b", _S.prop(_S.read(_e, "r"), "x1"))
	_S.write(_e, "x0", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "x0"), _S.binary("-", _S.binary("+", _S.read(_e, "a"), _S.read(_e, "X")), 1)]), "=", false)
	_S.write(_e, "x1", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "x1"), _S.binary("+", _S.binary("+", _S.read(_e, "b"), _S.read(_e, "X")), 1)]), "=", false)
	_S.write(_e, "y0", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "y0"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "r"), "y0"), _S.read(_e, "Y")), 1)]), "=", false)
	_S.write(_e, "y1", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "y1"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "r"), "y1"), _S.read(_e, "Y")), 1)]), "=", false)
	return null

static func _f42(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "u", _S.arg(_args, 2))
	return _S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a")), _S.read(_e, "u")))

static func _f43(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), _S.binary("-", 1, _S.read(_e, "u"))))

static func _f44(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u"))

static func _f45(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.read(_e, "u")

static func _f46(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v72 = _S.arg(_args, 0)
	_S.define(_e, "k", _S.prop(_v72, 0))
	_S.define(_e, "v", _S.prop(_v72, 1))
	return [_S.read(_e, "k"), _S.call_value(_S.read(_e, "hex"), [_S.read(_e, "v")])]

static func _f47(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "px", _S.function_value(_e, "_f48"))
	_S.define(_e, "R", _S.function_value(_e, "_f49"))
	_S.call_value(_S.read(_e, "R"), [15, 38, 8, 14, _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [16, 34, 6, 18, _S.prop(_S.read(_e, "TP"), "wood")])
	_S.call_value(_S.read(_e, "R"), [16, 34, 2, 18, _S.prop(_S.read(_e, "TP"), "woodL")])
	_S.call_value(_S.read(_e, "R"), [20, 34, 2, 18, _S.prop(_S.read(_e, "TP"), "woodD")])
	_S.call_value(_S.read(_e, "R"), [1, 18, 36, 1, _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [1, 23, 36, 1, _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [1, 19, 36, 4, _S.prop(_S.read(_e, "TP"), "wood")])
	_S.call_value(_S.read(_e, "R"), [1, 19, 36, 1, _S.prop(_S.read(_e, "TP"), "woodL")])
	_S.call_value(_S.read(_e, "R"), [1, 22, 36, 1, _S.prop(_S.read(_e, "TP"), "woodD")])
	for _v75 in _S.array([[0, _S.unary("-", 1)], [33, 1]]):
		var _v76 = _S.scope(_e)
		var _v77 = _v75
		_S.define(_v76, "bx", _S.prop(_v77, 0))
		_S.define(_v76, "s", _S.prop(_v77, 1))
		var _v78 = _S.scope(_v76)
		_S.call_value(_S.read(_v78, "R"), [_S.read(_v78, "bx"), 17, 5, 8, _S.prop(_S.read(_v78, "TP"), "straw")])
		for _v79 in _S.array([[2, 16, _S.prop(_S.read(_v78, "TP"), "straw")], [3, 15, _S.prop(_S.read(_v78, "TP"), "strawL")], [1, 17, _S.prop(_S.read(_v78, "TP"), "strawL")], [2, 25, _S.prop(_S.read(_v78, "TP"), "straw")], [1, 26, _S.prop(_S.read(_v78, "TP"), "strawL")], [3, 25, _S.prop(_S.read(_v78, "TP"), "burlapD")], [2, 19, _S.prop(_S.read(_v78, "TP"), "strawL")], [3, 21, _S.prop(_S.read(_v78, "TP"), "strawL")], [1, 22, _S.prop(_S.read(_v78, "TP"), "burlapD")], [2, 23, _S.prop(_S.read(_v78, "TP"), "strawL")]]):
			var _v80 = _S.scope(_v78)
			var _v81 = _v79
			_S.define(_v80, "dx", _S.prop(_v81, 0))
			_S.define(_v80, "dy", _S.prop(_v81, 1))
			_S.define(_v80, "c", _S.prop(_v81, 2))
			_S.call_value(_S.read(_v80, "px"), [_S.binary("+", _S.read(_v80, "bx"), _S.read(_v80, "dx")), _S.read(_v80, "dy"), _S.read(_v80, "c")])
		_S.call_value(_S.read(_v78, "px"), [(_S.binary("-", _S.read(_v78, "bx"), 1) if _S.truth(_S.binary("<", _S.read(_v78, "s"), 0)) else _S.binary("+", _S.read(_v78, "bx"), 5)), 19, _S.prop(_S.read(_v78, "TP"), "straw")])
		_S.call_value(_S.read(_v78, "px"), [(_S.binary("-", _S.read(_v78, "bx"), 1) if _S.truth(_S.binary("<", _S.read(_v78, "s"), 0)) else _S.binary("+", _S.read(_v78, "bx"), 5)), 22, _S.prop(_S.read(_v78, "TP"), "strawL")])
	_S.define(_e, "sack", _S.function_value(_e, "_f50"))
	_S.call_value(_S.read(_e, "sack"), [9, 17, 20, 24])
	var _v84 = _S.scope(_e)
	_S.define(_v84, "y", 19)
	while _S.truth(_S.binary("<", _S.read(_v84, "y"), 36)):
		var _v85 = _S.scope(_v84)
		_S.define(_v85, "x", 11)
		while _S.truth(_S.binary("<", _S.read(_v85, "x"), 27)):
			var _v86 = _S.scope(_v85)
			_S.define(_v86, "d", _S.invoke(_S.read(_v86, "Math"), "hypot", [_S.binary("-", _S.read(_v86, "x"), 18.5), _S.binary("-", _S.read(_v86, "y"), 27)]))
			if _S.truth(_S.logical("||", _S.logical("&&", _S.binary(">", _S.read(_v86, "d"), 4), func(): return _S.binary("<", _S.read(_v86, "d"), 5.4)), func(): return _S.binary("<", _S.read(_v86, "d"), 1.9))):
				_S.call_value(_S.read(_v86, "px"), [_S.read(_v86, "x"), _S.read(_v86, "y"), (_S.prop(_S.read(_v86, "TP"), "redL") if _S.truth(_S.binary("<", _S.binary("+", _S.read(_v86, "x"), _S.read(_v86, "y")), 45)) else _S.prop(_S.read(_v86, "TP"), "red"))])
			_v85 = _S.iteration(_v85)
			_S.write(_v85, "x", 1, "+=", true)
		_v84 = _S.iteration(_v84)
		_S.write(_v84, "y", 1, "+=", true)
	var _v87 = _S.scope(_e)
	_S.define(_v87, "x", 10)
	while _S.truth(_S.binary("<", _S.read(_v87, "x"), 28)):
		var _v88 = _S.scope(_v87)
		_S.call_value(_S.read(_v88, "px"), [_S.read(_v88, "x"), 36, (_S.prop(_S.read(_v88, "TP"), "woodL") if _S.truth(_S.binary("&", _S.read(_v88, "x"), 1)) else _S.prop(_S.read(_v88, "TP"), "straw"))])
		_S.call_value(_S.read(_v88, "px"), [_S.read(_v88, "x"), 37, (_S.prop(_S.read(_v88, "TP"), "woodD") if _S.truth(_S.binary("&", _S.read(_v88, "x"), 1)) else _S.prop(_S.read(_v88, "TP"), "wood"))])
		_v87 = _S.iteration(_v87)
		_S.write(_v87, "x", 1, "+=", true)
	for _v89 in _S.array([[11, 41, _S.prop(_S.read(_e, "TP"), "straw")], [12, 42, _S.prop(_S.read(_e, "TP"), "strawL")], [14, 41, _S.prop(_S.read(_e, "TP"), "strawL")], [15, 42, _S.prop(_S.read(_e, "TP"), "straw")], [23, 41, _S.prop(_S.read(_e, "TP"), "straw")], [24, 42, _S.prop(_S.read(_e, "TP"), "strawL")], [26, 41, _S.prop(_S.read(_e, "TP"), "straw")], [13, 43, _S.prop(_S.read(_e, "TP"), "straw")], [25, 43, _S.prop(_S.read(_e, "TP"), "straw")]]):
		var _v90 = _S.scope(_e)
		var _v91 = _v89
		_S.define(_v90, "x", _S.prop(_v91, 0))
		_S.define(_v90, "y", _S.prop(_v91, 1))
		_S.define(_v90, "c", _S.prop(_v91, 2))
		_S.call_value(_S.read(_v90, "px"), [_S.read(_v90, "x"), _S.read(_v90, "y"), _S.read(_v90, "c")])
	_S.call_value(_S.read(_e, "sack"), [10, 1, 18, 16])
	for _v92 in _S.array([14, 23]):
		var _v93 = _S.scope(_e)
		_S.define(_v93, "ex", _v92)
		var _v94 = _S.scope(_v93)
		_S.define(_v94, "d", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v94, "d"), 2)):
			var _v95 = _S.scope(_v94)
			_S.call_value(_S.read(_v95, "px"), [_S.binary("+", _S.read(_v95, "ex"), _S.read(_v95, "d")), _S.binary("+", 7, _S.read(_v95, "d")), _S.prop(_S.read(_v95, "TP"), "ink")])
			_S.call_value(_S.read(_v95, "px"), [_S.binary("-", _S.read(_v95, "ex"), _S.read(_v95, "d")), _S.binary("+", 7, _S.read(_v95, "d")), _S.prop(_S.read(_v95, "TP"), "ink")])
			_v94 = _S.iteration(_v94)
			_S.write(_v94, "d", 1, "+=", true)
	var _v96 = _S.scope(_e)
	_S.define(_v96, "x", 14)
	while _S.truth(_S.binary("<", _S.read(_v96, "x"), 24)):
		_S.call_value(_S.read(_v96, "px"), [_S.read(_v96, "x"), 12, (_S.prop(_S.read(_v96, "TP"), "ink") if _S.truth(_S.binary("&", _S.read(_v96, "x"), 1)) else _S.prop(_S.read(_v96, "TP"), "burlapD"))])
		_v96 = _S.iteration(_v96)
		_S.write(_v96, "x", 1, "+=", true)
	for _v97 in _S.array([15, 18, 21]):
		var _v98 = _S.scope(_e)
		_S.define(_v98, "x", _v97)
		var _v99 = _S.scope(_v98)
		_S.call_value(_S.read(_v99, "px"), [_S.read(_v99, "x"), 11, _S.prop(_S.read(_v99, "TP"), "ink")])
		_S.call_value(_S.read(_v99, "px"), [_S.read(_v99, "x"), 13, _S.prop(_S.read(_v99, "TP"), "ink")])
	var _v100 = _S.scope(_e)
	_S.define(_v100, "x", 12)
	while _S.truth(_S.binary("<", _S.read(_v100, "x"), 26)):
		var _v101 = _S.scope(_v100)
		_S.call_value(_S.read(_v101, "px"), [_S.read(_v101, "x"), 16, (_S.prop(_S.read(_v101, "TP"), "woodL") if _S.truth(_S.binary("&", _S.read(_v101, "x"), 1)) else _S.prop(_S.read(_v101, "TP"), "straw"))])
		_S.call_value(_S.read(_v101, "px"), [_S.read(_v101, "x"), 17, (_S.prop(_S.read(_v101, "TP"), "wood") if _S.truth(_S.binary("&", _S.read(_v101, "x"), 1)) else _S.prop(_S.read(_v101, "TP"), "woodD"))])
		_v100 = _S.iteration(_v100)
		_S.write(_v100, "x", 1, "+=", true)
	for _v102 in _S.array([[13, 0, _S.prop(_S.read(_e, "TP"), "straw")], [15, 0, _S.prop(_S.read(_e, "TP"), "strawL")], [18, 0, _S.prop(_S.read(_e, "TP"), "straw")], [21, 0, _S.prop(_S.read(_e, "TP"), "strawL")], [24, 0, _S.prop(_S.read(_e, "TP"), "straw")], [9, 4, _S.prop(_S.read(_e, "TP"), "straw")], [28, 6, _S.prop(_S.read(_e, "TP"), "straw")], [8, 7, _S.prop(_S.read(_e, "TP"), "strawL")], [29, 3, _S.prop(_S.read(_e, "TP"), "strawL")]]):
		var _v103 = _S.scope(_e)
		var _v104 = _v102
		_S.define(_v103, "x", _S.prop(_v104, 0))
		_S.define(_v103, "y", _S.prop(_v104, 1))
		_S.define(_v103, "c", _S.prop(_v104, 2))
		_S.call_value(_S.read(_v103, "px"), [_S.read(_v103, "x"), _S.read(_v103, "y"), _S.read(_v103, "c")])
	return null

static func _f48(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.read(_e, "TW"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "TH")))):
		_S.set_prop(_S.read(_e, "DUMMY"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "TW")), _S.read(_e, "x")), _S.read(_e, "c"), "=", false)
	return null

static func _f49(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "w", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.define(_e, "c", _S.arg(_args, 4))
	var _v73 = _S.scope(_e)
	_S.define(_v73, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v73, "j"), _S.read(_v73, "h"))):
		var _v74 = _S.scope(_v73)
		_S.define(_v74, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v74, "i"), _S.read(_v74, "w"))):
			_S.call_value(_S.read(_v74, "px"), [_S.binary("+", _S.read(_v74, "x"), _S.read(_v74, "i")), _S.binary("+", _S.read(_v74, "y"), _S.read(_v74, "j")), _S.read(_v74, "c")])
			_v74 = _S.iteration(_v74)
			_S.write(_v74, "i", 1, "+=", true)
		_v73 = _S.iteration(_v73)
		_S.write(_v73, "j", 1, "+=", true)
	return null

static func _f50(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "w", _S.arg(_args, 2))
	_S.define(_e, "h", _S.arg(_args, 3))
	_S.call_value(_S.read(_e, "R"), [_S.binary("+", _S.read(_e, "x"), 1), _S.read(_e, "y"), _S.binary("-", _S.read(_e, "w"), 2), 1, _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")), 1), _S.binary("-", _S.read(_e, "w"), 2), 1, _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 1), 1, _S.binary("-", _S.read(_e, "h"), 2), _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("-", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "w")), 1), _S.binary("+", _S.read(_e, "y"), 1), 1, _S.binary("-", _S.read(_e, "h"), 2), _S.prop(_S.read(_e, "TP"), "ink")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), _S.binary("-", _S.read(_e, "w"), 2), _S.binary("-", _S.read(_e, "h"), 2), _S.prop(_S.read(_e, "TP"), "burlap")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("-", _S.binary("+", _S.read(_e, "x"), _S.read(_e, "w")), 4), _S.binary("+", _S.read(_e, "y"), 1), 3, _S.binary("-", _S.read(_e, "h"), 2), _S.prop(_S.read(_e, "TP"), "burlapD")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("-", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "h")), 3), _S.binary("-", _S.read(_e, "w"), 2), 2, _S.prop(_S.read(_e, "TP"), "burlapD")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), 1, _S.binary("-", _S.read(_e, "h"), 4), _S.prop(_S.read(_e, "TP"), "burlapL")])
	_S.call_value(_S.read(_e, "R"), [_S.binary("+", _S.read(_e, "x"), 1), _S.binary("+", _S.read(_e, "y"), 1), _S.binary("-", _S.read(_e, "w"), 6), 1, _S.prop(_S.read(_e, "TP"), "burlapL")])
	var _v82 = _S.scope(_e)
	_S.define(_v82, "j", _S.binary("+", _S.read(_v82, "y"), 2))
	while _S.truth(_S.binary("<", _S.read(_v82, "j"), _S.binary("-", _S.binary("+", _S.read(_v82, "y"), _S.read(_v82, "h")), 2))):
		var _v83 = _S.scope(_v82)
		_S.define(_v83, "i", _S.binary("+", _S.binary("+", _S.read(_v83, "x"), 3), _S.binary("%", _S.read(_v83, "j"), 2)))
		while _S.truth(_S.binary("<", _S.read(_v83, "i"), _S.binary("-", _S.binary("+", _S.read(_v83, "x"), _S.read(_v83, "w")), 4))):
			_S.call_value(_S.read(_v83, "px"), [_S.read(_v83, "i"), _S.read(_v83, "j"), _S.prop(_S.read(_v83, "TP"), "burlapD")])
			_v83 = _S.iteration(_v83)
			_S.write(_v83, "i", 4, "+=", false)
		_v82 = _S.iteration(_v82)
		_S.write(_v82, "j", 3, "+=", false)
	return null

static func _f51(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 5))
	_S.invoke(_S.read(_e, "Object"), "assign", [_S.read(_e, "this"), _S.merge([{"x": _S.read(_e, "x")}, {"theta": 0}, {"omega": 0}, {"flashT": 0}, {"skin": null}, {"skinFade": 0}, {"shiver": 0}, {"clock": 0}, {"R": _S.construct(_S.read(_e, "Rng"), [_S.read(_e, "seed")])}, {"straw": []}])])
	return null

static func _f52(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	var _v105 = _S.coalesce(_S.arg(_args, 0), func(): return _S.merge([]))
	_S.define(_e, "push", _S.coalesce(_S.prop(_v105, "push"), func(): return 1.2))
	_S.define(_e, "straw", _S.coalesce(_S.prop(_v105, "straw"), func(): return 8))
	_S.define(_e, "flash", _S.coalesce(_S.prop(_v105, "flash"), func(): return 0.05))
	_S.define(_e, "skin", _S.prop(_v105, "skin"))
	_S.define(_e, "shiver", _S.coalesce(_S.prop(_v105, "shiver"), func(): return 0))
	_S.define(_e, "y", _S.coalesce(_S.prop(_v105, "y"), func(): return _S.unary("-", 26)))
	_S.set_prop(_S.read(_e, "this"), "omega", _S.read(_e, "push"), "+=", false)
	_S.set_prop(_S.read(_e, "this"), "flashT", _S.invoke(_S.read(_e, "Math"), "max", [_S.prop(_S.read(_e, "this"), "flashT"), _S.read(_e, "flash")]), "=", false)
	if _S.truth(_S.binary("!==", _S.read(_e, "skin"), null)):
		_S.set_prop(_S.read(_e, "this"), "skin", _S.read(_e, "skin"), "=", false)
	if _S.truth(_S.read(_e, "shiver")):
		_S.set_prop(_S.read(_e, "this"), "shiver", _S.read(_e, "shiver"), "=", false)
	_S.define(_e, "R", _S.prop(_S.read(_e, "this"), "R"))
	var _v106 = _S.scope(_e)
	_S.define(_v106, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v106, "k"), _S.read(_v106, "straw"))):
		var _v107 = _S.scope(_v106)
		_S.define(_v107, "back", _S.binary("<", _S.invoke(_S.read(_v107, "R"), "next", []), 0.3))
		_S.invoke(_S.prop(_S.read(_v107, "this"), "straw"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v107, "this"), "x"), _S.invoke(_S.read(_v107, "R"), "range", [_S.unary("-", 3), 3]))}, {"y": _S.binary("+", _S.read(_v107, "y"), _S.invoke(_S.read(_v107, "R"), "range", [_S.unary("-", 3), 3]))}, {"vx": (_S.invoke(_S.read(_v107, "R"), "range", [_S.unary("-", 60), _S.unary("-", 5)]) if _S.truth(_S.read(_v107, "back")) else _S.invoke(_S.read(_v107, "R"), "range", [10, 130]))}, {"vy": _S.invoke(_S.read(_v107, "R"), "range", [_S.unary("-", 120), _S.unary("-", 5)])}, {"age": 0}, {"life": _S.invoke(_S.read(_v107, "R"), "range", [1.2, 2.2])}, {"big": _S.binary("<", _S.invoke(_S.read(_v107, "R"), "next", []), 0.5)}])])
		_v106 = _S.iteration(_v106)
		_S.write(_v106, "k", 1, "+=", true)
	return null

static func _f53(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.set_prop(_S.read(_e, "this"), "clock", _S.read(_e, "dt"), "+=", false)
	_S.set_prop(_S.read(_e, "this"), "omega", _S.binary("*", _S.binary("-", _S.binary("*", _S.unary("-", 60), _S.prop(_S.read(_e, "this"), "theta")), _S.binary("*", 3.4, _S.prop(_S.read(_e, "this"), "omega"))), _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "this"), "theta", _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.prop(_S.read(_e, "this"), "theta"), _S.binary("*", _S.prop(_S.read(_e, "this"), "omega"), _S.read(_e, "dt"))), _S.unary("-", 0.4), 0.42]), "=", false)
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "this"), "flashT"), 0)):
		_S.set_prop(_S.read(_e, "this"), "flashT", _S.read(_e, "dt"), "-=", false)
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "this"), "shiver"), 0)):
		_S.set_prop(_S.read(_e, "this"), "shiver", _S.read(_e, "dt"), "-=", false)
	for _v108 in _S.array(_S.prop(_S.read(_e, "this"), "straw")):
		var _v109 = _S.scope(_e)
		_S.define(_v109, "s", _v108)
		var _v110 = _S.scope(_v109)
		_S.set_prop(_S.read(_v110, "s"), "age", _S.read(_v110, "dt"), "+=", false)
		_S.set_prop(_S.read(_v110, "s"), "vy", _S.binary("*", 210, _S.read(_v110, "dt")), "+=", false)
		_S.set_prop(_S.read(_v110, "s"), "x", _S.binary("*", _S.prop(_S.read(_v110, "s"), "vx"), _S.read(_v110, "dt")), "+=", false)
		_S.set_prop(_S.read(_v110, "s"), "y", _S.binary("*", _S.prop(_S.read(_v110, "s"), "vy"), _S.read(_v110, "dt")), "+=", false)
		if _S.truth(_S.binary(">=", _S.prop(_S.read(_v110, "s"), "y"), 0)):
			var _v111 = _S.scope(_v110)
			_S.set_prop(_S.read(_v111, "s"), "y", 0, "=", false)
			_S.set_prop(_S.read(_v111, "s"), "vx", 0.2, "*=", false)
			_S.set_prop(_S.read(_v111, "s"), "vy", 0, "=", false)
	_S.set_prop(_S.read(_e, "this"), "straw", _S.invoke(_S.prop(_S.read(_e, "this"), "straw"), "filter", [_S.function_value(_e, "_f54")]), "=", false)
	return null

static func _f54(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.binary("<", _S.prop(_S.read(_e, "s"), "age"), _S.prop(_S.read(_e, "s"), "life"))

static func _f55(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "X", _S.arg(_args, 3))
	_S.define(_e, "Y", _S.arg(_args, 4))
	_S.define(_e, "flip", _S.arg(_args, 5))
	_S.define(_e, "tan", _S.invoke(_S.read(_e, "Math"), "tan", [_S.prop(_S.read(_e, "this"), "theta")]))
	_S.define(_e, "sv", ((1 if _S.truth(_S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_e, "this"), "clock"), 30)]), 1)) else _S.unary("-", 1)) if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "this"), "shiver"), 0)) else 0))
	_S.define(_e, "name", ("flash" if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "this"), "flashT"), 0)) else _S.prop(_S.read(_e, "this"), "skin")))
	_S.define(_e, "sk", (_S.prop(_S.read(_e, "SKINS"), _S.read(_e, "name")) if _S.truth(_S.read(_e, "name")) else null))
	_S.define(_e, "base", _S.binary("+", _S.read(_e, "X"), (_S.binary("-", _S.unary("-", _S.prop(_S.read(_e, "this"), "x")), 1) if _S.truth(_S.read(_e, "flip")) else _S.prop(_S.read(_e, "this"), "x"))))
	var _v112 = _S.scope(_e)
	_S.define(_v112, "r", 0)
	while _S.truth(_S.binary("<", _S.read(_v112, "r"), _S.read(_v112, "TH"))):
		var _v113 = _S.scope(_v112)
		_S.define(_v113, "o", _S.binary("+", _S.invoke(_S.read(_v113, "Math"), "round", [_S.binary("*", _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_v113, "TH"), 1), _S.read(_v113, "r")), _S.read(_v113, "tan")), 0.8)]), _S.read(_v113, "sv")))
		var _v114 = _S.scope(_v113)
		_S.define(_v114, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v114, "x"), _S.read(_v114, "TW"))):
			var _v115 = _S.scope(_v114)
			_S.define(_v115, "c", _S.prop(_S.read(_v115, "DUMMY"), _S.binary("+", _S.binary("*", _S.read(_v115, "r"), _S.read(_v115, "TW")), _S.read(_v115, "x"))))
			if _S.truth(_S.unary("!", _S.read(_v115, "c"))):
				_v114 = _S.iteration(_v114)
				_S.write(_v114, "x", 1, "+=", true)
				continue
			_S.define(_v115, "px", _S.binary("+", _S.read(_v115, "base"), (_S.binary("-", _S.unary("-", _S.binary("+", _S.binary("-", _S.read(_v115, "x"), 19), _S.read(_v115, "o"))), 1) if _S.truth(_S.read(_v115, "flip")) else _S.binary("+", _S.binary("-", _S.read(_v115, "x"), 19), _S.read(_v115, "o")))))
			_S.define(_v115, "py", _S.binary("+", _S.binary("-", _S.read(_v115, "Y"), _S.read(_v115, "TH")), _S.read(_v115, "r")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v115, "px"), 0), func(): return _S.binary(">=", _S.read(_v115, "py"), 0)), func(): return _S.binary("<", _S.read(_v115, "px"), _S.read(_v115, "W"))), func(): return _S.binary("<", _S.read(_v115, "py"), _S.read(_v115, "H")))):
				_S.set_prop(_S.read(_v115, "C"), _S.binary("+", _S.binary("*", _S.read(_v115, "py"), _S.read(_v115, "W")), _S.read(_v115, "px")), (_S.call_value(_S.read(_v115, "mix"), [_S.read(_v115, "c"), _S.prop(_S.read(_v115, "sk"), 0), _S.prop(_S.read(_v115, "sk"), 1)]) if _S.truth(_S.read(_v115, "sk")) else _S.read(_v115, "c")), "=", false)
			_v114 = _S.iteration(_v114)
			_S.write(_v114, "x", 1, "+=", true)
		_v112 = _S.iteration(_v112)
		_S.write(_v112, "r", 1, "+=", true)
	return null

static func _f56(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "H", _S.arg(_args, 2))
	_S.define(_e, "X", _S.arg(_args, 3))
	_S.define(_e, "Y", _S.arg(_args, 4))
	_S.define(_e, "flip", _S.arg(_args, 5))
	for _v116 in _S.array(_S.prop(_S.read(_e, "this"), "straw")):
		var _v117 = _S.scope(_e)
		_S.define(_v117, "s", _v116)
		var _v118 = _S.scope(_v117)
		_S.define(_v118, "c", _S.prop(_S.read(_v118, "STRAW"), _S.invoke(_S.read(_v118, "Math"), "min", [4, _S.invoke(_S.read(_v118, "Math"), "floor", [_S.binary("*", _S.binary("/", _S.prop(_S.read(_v118, "s"), "age"), _S.prop(_S.read(_v118, "s"), "life")), 5)])])))
		_S.define(_v118, "lx", _S.invoke(_S.read(_v118, "Math"), "round", [_S.prop(_S.read(_v118, "s"), "x")]))
		_S.define(_v118, "ly", _S.binary("-", _S.invoke(_S.read(_v118, "Math"), "round", [_S.prop(_S.read(_v118, "s"), "y")]), 1))
		var _v119 = _S.scope(_v118)
		_S.define(_v119, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v119, "i"), (2 if _S.truth(_S.prop(_S.read(_v119, "s"), "big")) else 1))):
			var _v120 = _S.scope(_v119)
			_S.define(_v120, "px", _S.binary("+", _S.read(_v120, "X"), (_S.binary("-", _S.unary("-", _S.binary("+", _S.read(_v120, "lx"), _S.read(_v120, "i"))), 1) if _S.truth(_S.read(_v120, "flip")) else _S.binary("+", _S.read(_v120, "lx"), _S.read(_v120, "i")))))
			_S.define(_v120, "py", _S.binary("+", _S.read(_v120, "Y"), _S.read(_v120, "ly")))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_v120, "px"), 0), func(): return _S.binary(">=", _S.read(_v120, "py"), 0)), func(): return _S.binary("<", _S.read(_v120, "px"), _S.read(_v120, "W"))), func(): return _S.binary("<", _S.read(_v120, "py"), _S.read(_v120, "H")))):
				_S.set_prop(_S.read(_v120, "C"), _S.binary("+", _S.binary("*", _S.read(_v120, "py"), _S.read(_v120, "W")), _S.read(_v120, "px")), _S.read(_v120, "c"), "=", false)
			_v119 = _S.iteration(_v119)
			_S.write(_v119, "i", 1, "+=", true)
	return null

static func _f57(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "row", _S.arg(_args, 0))
	_S.define(_e, "r", _S.arg(_args, 1))
	return _S.invoke(_S.concat([_S.array(_S.read(_e, "row"))]), "forEach", [_S.function_value(_e, "_f58")])

static func _f58(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ch", _S.arg(_args, 0))
	_S.define(_e, "c", _S.arg(_args, 1))
	if _S.truth(_S.binary("!==", _S.read(_e, "ch"), ".")):
		var _v121 = _S.scope(_e)
		_S.set_prop(_S.read(_v121, "REST_MASK"), _S.binary("+", _S.binary("*", _S.read(_v121, "r"), 24), _S.read(_v121, "c")), 1, "=", false)
		_S.set_prop(_S.read(_v121, "REST_PX"), _S.binary("+", _S.binary("*", _S.read(_v121, "r"), 24), _S.read(_v121, "c")), _S.call_value(_S.read(_v121, "hex"), [_S.prop(_S.read(_v121, "DUMMY_PAL"), _S.read(_v121, "ch"))]), "=", false)
	return null

static func _f59(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	return _S.binary("/", _S.binary("+", _S.binary("+", _S.binary("*", 0.3, _S.binary("&", _S.read(_e, "c"), 255)), _S.binary("*", 0.59, _S.binary("&", _S.binary(">>>", _S.read(_e, "c"), 8), 255))), _S.binary("*", 0.11, _S.binary("&", _S.binary(">>>", _S.read(_e, "c"), 16), 255))), 255)
