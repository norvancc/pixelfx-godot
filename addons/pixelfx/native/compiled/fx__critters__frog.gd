@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/frog.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "toss", _S.import_value("fx/critters/_lib.js", "toss"))
	_S.define(_e, "spring", _S.import_value("fx/critters/_lib.js", "spring"))
	_S.define(_e, "pose", _S.function_value(_e, "_f0"))
	_S.define(_e, "fly", _S.function_value(_e, "_f1"))
	_S.define(_e, "frog", _S.function_value(_e, "_f2"))
	_S.define(_e, "draw", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f13"))
	_S.define(_e, "meta", _S.merge([{"name": "Frog"}, {"desc": "A frog puffs its throat, blinks, crouches and leaps to snap a buzzing fly out of the air, then lands with a squash and a puff of dust, gulps and settles."}, {"tags": ["critter", "frog", "animal", "hop", "ground", "loop"]}, {"size": [112, 88]}, {"origin": [56, 80]}, {"duration": 2.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0a160c", "#173a18", "#256024", "#3a8a2e", "#62b440", "#a8e070", "#e8ffc0"]}, {"belly": ["#5e5a24", "#bdb45a", "#efe9a8"]}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 22), _S.unary("-", 40), 44, 44]))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_S.define(_e, "T_CROUCH", 0.95)
	_S.define(_e, "T_UP", 1.2)
	_S.define(_e, "T_LAND", 1.62)
	_S.define(_e, "T_SNAP", 1.4)
	_S.define(_e, "T_BACK", 1.95)
	_S.define(_e, "G", 1000)
	_S.define(_e, "HOP", _S.binary("/", _S.binary("*", _S.read(_e, "G"), _S.binary("**", _S.binary("-", _S.read(_e, "T_LAND"), _S.read(_e, "T_UP")), 2)), 8))
	_S.define(_e, "EYE", _S.invoke(["#3a2a08", "#c89420", "#ffd860"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "TONGUE", _S.call_value(_S.read(_e, "hex"), ["#e8607a"]))
	_S.define(_e, "FLY", _S.call_value(_S.read(_e, "hex"), ["#141018"]))
	_S.define(_e, "WINGS", _S.call_value(_S.read(_e, "hex"), ["#c8d0e0"]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#8a7f92"]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "by", 0)
	_S.define(_e, "rot", 0)
	_S.define(_e, "sq", 0)
	_S.define(_e, "leg", 0)
	_S.define(_e, "throat", 0)
	_S.define(_e, "shut", 0)
	_S.define(_e, "age", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_LAND")), _S.read(_e, "D")]))
	for _v0 in _S.array([[0.05, 0.45], [0.5, 0.85], [1.75, 1.95]]):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "a", _S.prop(_v2, 0))
		_S.define(_v1, "b", _S.prop(_v2, 1))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v1, "t"), _S.read(_v1, "a")), func(): return _S.binary("<", _S.read(_v1, "t"), _S.read(_v1, "b")))):
			_S.write(_v1, "throat", _S.binary("*", _S.binary("**", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v1, "Math"), "PI"), _S.binary("/", _S.binary("-", _S.read(_v1, "t"), _S.read(_v1, "a")), _S.binary("-", _S.read(_v1, "b"), _S.read(_v1, "a"))))]), 0.7), (0.6 if _S.truth(_S.binary(">", _S.read(_v1, "a"), 1)) else 1)), "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.88), func(): return _S.binary("<", _S.read(_e, "t"), 0.95))):
		_S.write(_e, "shut", 1, "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_CROUCH")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_UP")))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "u", _S.invoke(_S.read(_v3, "ease"), "inOutSine", [_S.call_value(_S.read(_v3, "seg"), [_S.read(_v3, "t"), _S.read(_v3, "T_CROUCH"), _S.read(_v3, "T_UP")])]))
		_S.write(_v3, "sq", _S.binary("*", _S.unary("-", 0.18), _S.read(_v3, "u")), "=", false)
		_S.write(_v3, "rot", _S.binary("*", _S.unary("-", 0.12), _S.read(_v3, "u")), "=", false)
	else:
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_UP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_LAND")))):
			var _v4 = _S.scope(_e)
			_S.define(_v4, "q", _S.binary("/", _S.binary("-", _S.read(_v4, "t"), _S.read(_v4, "T_UP")), _S.binary("-", _S.read(_v4, "T_LAND"), _S.read(_v4, "T_UP"))))
			_S.write(_v4, "by", _S.binary("*", _S.binary("*", _S.binary("*", _S.unary("-", _S.read(_v4, "HOP")), 4), _S.read(_v4, "q")), _S.binary("-", 1, _S.read(_v4, "q"))), "=", false)
			_S.write(_v4, "rot", _S.call_value(_S.read(_v4, "lerp"), [0.42, _S.unary("-", 0.25), _S.read(_v4, "q")]), "=", false)
			_S.write(_v4, "sq", _S.call_value(_S.read(_v4, "lerp"), [0.18, 0.02, _S.invoke(_S.read(_v4, "Math"), "min", [1, _S.binary("*", _S.read(_v4, "q"), 2)])]), "=", false)
			_S.write(_v4, "leg", (1 if _S.truth(_S.binary("<", _S.read(_v4, "q"), 0.75)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v4, "q"), 0.75), 0.25))), "=", false)
		else:
			var _v5 = _S.scope(_e)
			_S.write(_v5, "sq", _S.binary("*", _S.unary("-", 0.24), _S.call_value(_S.read(_v5, "spring"), [_S.read(_v5, "age"), 2.4, 6.5])), "=", false)
			_S.write(_v5, "rot", _S.binary("*", _S.unary("-", 0.08), _S.invoke(_S.read(_v5, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v5, "age")), 6)])), "=", false)
	return _S.merge([{"by": _S.read(_e, "by")}, {"rot": _S.read(_e, "rot")}, {"sq": _S.read(_e, "sq")}, {"leg": _S.read(_e, "leg")}, {"throat": _S.read(_e, "throat")}, {"shut": _S.read(_e, "shut")}, {"air": _S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_UP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_LAND")))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "T_SNAP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_BACK")))):
		return null
	_S.define(_e, "a", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "TAU")), 3))
	_S.define(_e, "home", [_S.binary("+", 16, _S.binary("*", 6, _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]))), _S.binary("+", _S.unary("-", 40), _S.binary("*", 3, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", 2, _S.read(_e, "a"))])))])
	_S.define(_e, "inn", _S.call_value(_S.read(_e, "wrap"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_BACK")), _S.read(_e, "D")]))
	if _S.truth(_S.binary("<", _S.read(_e, "inn"), 0.45)):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "u", _S.invoke(_S.read(_v6, "ease"), "outCubic", [_S.binary("/", _S.read(_v6, "inn"), 0.45)]))
		return [_S.call_value(_S.read(_v6, "lerp"), [_S.unary("-", 52), _S.prop(_S.read(_v6, "home"), 0), _S.read(_v6, "u")]), _S.binary("+", _S.call_value(_S.read(_v6, "lerp"), [_S.unary("-", 46), _S.prop(_S.read(_v6, "home"), 1), _S.read(_v6, "u")]), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("*", _S.read(_v6, "inn"), 30)]), 1.5))]
	return _S.read(_e, "home")

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "g", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "Bl", _S.arg(_args, 2))
	_S.define(_e, "Pz", _S.arg(_args, 3))
	_S.define(_e, "t", _S.arg(_args, 4))
	_S.invoke(_S.read(_e, "g"), "clear", [])
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "Pz"), "rot")]))
	_S.define(_e, "sn", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "Pz"), "rot")]))
	_S.define(_e, "sx", _S.binary("+", 1, _S.binary("*", _S.prop(_S.read(_e, "Pz"), "sq"), _S.unary("-", 0.6))))
	_S.define(_e, "sy", _S.binary("+", 1, _S.prop(_S.read(_e, "Pz"), "sq")))
	_S.define(_e, "local", _S.function_value(_e, "_f3"))
	_S.define(_e, "inBody", _S.function_value(_e, "_f4"))
	_S.define(_e, "inEye", _S.function_value(_e, "_f5"))
	_S.define(_e, "lit", _S.function_value(_e, "_f6"))
	_S.invoke(_S.read(_e, "g"), "shade", [_S.unary("-", 15), _S.unary("-", 22), 15, 1, _S.function_value(_e, "_f7")])
	_S.define(_e, "legs", [])
	if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "Pz"), "leg"), 0.5)):
		var _v12 = _S.scope(_e)
		_S.invoke(_S.read(_v12, "g"), "ellipse", [_S.unary("-", 7.5), _S.binary("+", _S.unary("-", 4.5), _S.binary("*", _S.binary("-", 1, _S.read(_v12, "sy")), 3)), 5, 3.6, _S.function_value(_v12, "_f8")])
		_S.invoke(_S.read(_v12, "legs"), "push", [[[_S.unary("-", 4), _S.unary("-", 1.5)], [_S.unary("-", 9), _S.unary("-", 1)], [_S.unary("-", 3), _S.unary("-", 0.5)], [4, _S.unary("-", 0.5)]]])
	else:
		var _v13 = _S.scope(_e)
		_S.define(_v13, "ex", _S.binary("-", _S.unary("-", 8), _S.binary("*", 10, _S.prop(_S.read(_v13, "Pz"), "leg"))))
		_S.define(_v13, "ey", _S.binary("+", 4, _S.binary("*", 6, _S.prop(_S.read(_v13, "Pz"), "leg"))))
		_S.invoke(_S.read(_v13, "legs"), "push", [[[_S.unary("-", 6), _S.unary("-", 5)], [_S.unary("-", 10), 0], [_S.read(_v13, "ex"), _S.read(_v13, "ey")], [_S.binary("-", _S.read(_v13, "ex"), 5), _S.binary("+", _S.read(_v13, "ey"), 2)]]])
	for _v14 in _S.array(_S.read(_e, "legs")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "L", _v14)
		var _v16 = _S.scope(_v15)
		_S.invoke(_S.read(_v16, "g"), "tube", [_S.read(_v16, "L"), _S.function_value(_v16, "_f9"), _S.function_value(_v16, "_f10")])
		var _v17 = _S.prop(_S.read(_v16, "L"), _S.binary("-", _S.prop(_S.read(_v16, "L"), "length"), 1))
		_S.define(_v16, "fx", _S.prop(_v17, 0))
		_S.define(_v16, "fy", _S.prop(_v17, 1))
		var _v18 = _S.prop(_S.read(_v16, "L"), _S.binary("-", _S.prop(_S.read(_v16, "L"), "length"), 2))
		_S.define(_v16, "px", _S.prop(_v18, 0))
		_S.define(_v16, "py", _S.prop(_v18, 1))
		_S.define(_v16, "dx", _S.binary("-", _S.read(_v16, "fx"), _S.read(_v16, "px")))
		_S.define(_v16, "dy", _S.binary("-", _S.read(_v16, "fy"), _S.read(_v16, "py")))
		_S.define(_v16, "l", _S.logical("||", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.read(_v16, "dx"), _S.read(_v16, "dy")]), func(): return 1))
		for _v19 in _S.array([_S.unary("-", 1), 0, 1]):
			var _v20 = _S.scope(_v16)
			_S.define(_v20, "k", _v19)
			_S.invoke(_S.read(_v20, "g"), "line", [_S.read(_v20, "fx"), _S.read(_v20, "fy"), _S.binary("-", _S.binary("+", _S.read(_v20, "fx"), _S.binary("*", _S.binary("/", _S.read(_v20, "dx"), _S.read(_v20, "l")), 2)), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v20, "dy"), _S.read(_v20, "l")), _S.read(_v20, "k")), 1.6)), _S.binary("+", _S.binary("+", _S.read(_v20, "fy"), _S.binary("*", _S.binary("/", _S.read(_v20, "dy"), _S.read(_v20, "l")), 2)), _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v20, "dx"), _S.read(_v20, "l")), _S.read(_v20, "k")), 1.6)), _S.prop(_S.read(_v20, "C"), 3)])
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "Pz"), "shut"))):
		var _v21 = _S.scope(_e)
		var _v22 = [4.6, _S.unary("-", 14.4)]
		_S.define(_v21, "gx", _S.prop(_v22, 0))
		_S.define(_v21, "gy", _S.prop(_v22, 1))
		_S.define(_v21, "X", _S.binary("-", _S.binary("*", _S.read(_v21, "gx"), _S.read(_v21, "cs")), _S.binary("*", _S.binary("*", _S.binary("+", _S.read(_v21, "gy"), 7), _S.read(_v21, "sn")), 1)))
		_S.define(_v21, "Y", _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_v21, "gx"), _S.read(_v21, "sn")), _S.binary("*", _S.binary("+", _S.read(_v21, "gy"), 7), _S.read(_v21, "cs"))), 7))
		_S.invoke(_S.read(_v21, "g"), "set", [_S.read(_v21, "X"), _S.read(_v21, "Y"), _S.prop(_S.read(_v21, "C"), 6)])
	var _v23 = _S.scope(_e)
	_S.define(_v23, "u", 3)
	while _S.truth(_S.binary("<=", _S.read(_v23, "u"), 11)):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "v", _S.binary("+", _S.unary("-", 7.8), _S.binary("*", _S.binary("-", _S.read(_v24, "u"), 3), 0.05)))
		_S.define(_v24, "X", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v24, "u"), _S.read(_v24, "sx")), _S.read(_v24, "cs")), _S.binary("*", _S.binary("*", _S.binary("+", _S.read(_v24, "v"), 7), _S.read(_v24, "sy")), _S.read(_v24, "sn"))))
		_S.define(_v24, "Y", _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v24, "u"), _S.read(_v24, "sx")), _S.read(_v24, "sn")), _S.binary("*", _S.binary("*", _S.binary("+", _S.read(_v24, "v"), 7), _S.read(_v24, "sy")), _S.read(_v24, "cs"))), 7))
		_S.invoke(_S.read(_v24, "g"), "set", [_S.read(_v24, "X"), _S.read(_v24, "Y"), _S.prop(_S.read(_v24, "C"), 1)])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "u", 1, "+=", true)
	_S.define(_e, "fl", ([[7, _S.unary("-", 4)], [9, _S.unary("-", 1)]] if _S.truth(_S.prop(_S.read(_e, "Pz"), "air")) else [[7, _S.unary("-", 4)], [8, _S.unary("-", 0.5)]]))
	_S.invoke(_S.read(_e, "g"), "line", [_S.prop(_S.prop(_S.read(_e, "fl"), 0), 0), _S.prop(_S.prop(_S.read(_e, "fl"), 0), 1), _S.prop(_S.prop(_S.read(_e, "fl"), 1), 0), _S.prop(_S.prop(_S.read(_e, "fl"), 1), 1), _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("+", _S.prop(_S.prop(_S.read(_e, "fl"), 1), 0), 1), _S.prop(_S.prop(_S.read(_e, "fl"), 1), 1), _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "g"), "set", [_S.binary("-", _S.prop(_S.prop(_S.read(_e, "fl"), 1), 0), 1), _S.prop(_S.prop(_S.read(_e, "fl"), 1), 1), _S.prop(_S.read(_e, "C"), 3)])
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "Pz"), "throat"), 0.05)):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "r", _S.binary("+", 0.8, _S.binary("*", 2.8, _S.prop(_S.read(_v25, "Pz"), "throat"))))
		_S.define(_v25, "cx", 7)
		_S.define(_v25, "cy", _S.binary("+", _S.unary("-", 5.2), _S.binary("*", _S.read(_v25, "r"), 0.25)))
		_S.invoke(_S.read(_v25, "g"), "ellipse", [_S.read(_v25, "cx"), _S.read(_v25, "cy"), _S.binary("*", _S.read(_v25, "r"), 1.1), _S.read(_v25, "r"), _S.function_value(_v25, "_f11"), 0.9])
		_S.invoke(_S.read(_v25, "g"), "set", [_S.binary("-", _S.read(_v25, "cx"), _S.binary("*", _S.read(_v25, "r"), 0.4)), _S.binary("-", _S.read(_v25, "cy"), _S.binary("*", _S.read(_v25, "r"), 0.45)), _S.prop(_S.read(_v25, "C"), 6)])
	_S.invoke(_S.read(_e, "g"), "outline", [_S.prop(_S.read(_e, "C"), 0)])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.read(_e, "x"))
	_S.define(_e, "dy", _S.binary("+", _S.read(_e, "y"), 7))
	return [_S.binary("/", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "cs")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "sn"))), _S.read(_e, "sx")), _S.binary("-", _S.binary("/", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sn")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "cs"))), _S.read(_e, "sy")), 7)]

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("||", _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "x"), 1), 10.5), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 7), 6), 2)), 1), func(): return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_e, "x"), 6), 6.2), 2), _S.binary("**", _S.binary("/", _S.binary("+", _S.read(_e, "y"), 8.6), 4.8), 2)), 1))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<=", _S.binary("+", _S.binary("**", _S.binary("-", _S.read(_e, "x"), 5.5), 2), _S.binary("**", _S.binary("+", _S.read(_e, "y"), 13.2), 2)), _S.binary("**", 3.2, 2))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "k", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "inBody"), [_S.binary("+", _S.unary("-", 4), _S.binary("/", _S.binary("+", _S.read(_e, "x"), 4), _S.read(_e, "k"))), _S.binary("+", _S.unary("-", 13), _S.binary("/", _S.binary("+", _S.read(_e, "y"), 13), _S.read(_e, "k")))])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	var _v7 = _S.call_value(_S.read(_e, "local"), [_S.read(_e, "x"), _S.read(_e, "y")])
	_S.define(_e, "u", _S.prop(_v7, 0))
	_S.define(_e, "v", _S.prop(_v7, 1))
	if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_e, "inBody"), [_S.read(_e, "u"), _S.read(_e, "v")])), func(): return _S.unary("!", _S.call_value(_S.read(_e, "inEye"), [_S.read(_e, "u"), _S.read(_e, "v")])))):
		return 0
	if _S.truth(_S.call_value(_S.read(_e, "inEye"), [_S.read(_e, "u"), _S.read(_e, "v")])):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "d", _S.invoke(_S.read(_v8, "Math"), "hypot", [_S.binary("-", _S.read(_v8, "u"), 5.5), _S.binary("-", _S.read(_v8, "v"), _S.binary("*", 13.2, _S.unary("-", 1)))]))
		if _S.truth(_S.prop(_S.read(_v8, "Pz"), "shut")):
			return (_S.prop(_S.read(_v8, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v8, "v"), _S.unary("-", 13.2))) else _S.prop(_S.read(_v8, "C"), 3))
		if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.binary("+", _S.read(_v8, "v"), 13)]), 0.7), func(): return _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.binary("-", _S.read(_v8, "u"), 6)]), 1.8))):
			return _S.prop(_S.read(_v8, "C"), 0)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v8, "u"), 4.7), func(): return _S.binary("<", _S.read(_v8, "v"), _S.unary("-", 14)))):
			return _S.prop(_S.read(_v8, "EYE"), 2)
		return (_S.prop(_S.read(_v8, "EYE"), 1) if _S.truth(_S.binary("<", _S.read(_v8, "d"), 2.4)) else _S.prop(_S.read(_v8, "EYE"), 0))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "v"), _S.unary("-", 5)), func(): return _S.binary(">", _S.read(_e, "u"), _S.unary("-", 6)))):
		return (_S.prop(_S.read(_e, "Bl"), 1) if _S.truth(_S.binary(">", _S.read(_e, "v"), _S.unary("-", 3))) else _S.prop(_S.read(_e, "Bl"), 2))
	for _v9 in _S.array([[_S.unary("-", 5), _S.unary("-", 10), 1.6], [0, _S.unary("-", 11.5), 1.3], [_S.unary("-", 8), _S.unary("-", 7), 1.2], [3, _S.unary("-", 12.5), 0.9]]):
		var _v10 = _S.scope(_e)
		var _v11 = _v9
		_S.define(_v10, "px", _S.prop(_v11, 0))
		_S.define(_v10, "py", _S.prop(_v11, 1))
		_S.define(_v10, "r", _S.prop(_v11, 2))
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v10, "Math"), "hypot", [_S.binary("-", _S.read(_v10, "u"), _S.read(_v10, "px")), _S.binary("-", _S.read(_v10, "v"), _S.read(_v10, "py"))]), _S.read(_v10, "r"))):
			return _S.prop(_S.read(_v10, "C"), 2)
	if _S.truth(_S.unary("!", _S.call_value(_S.read(_e, "inBody"), [_S.binary("+", _S.read(_e, "u"), 2), _S.binary("+", _S.read(_e, "v"), 2.4)]))):
		return _S.prop(_S.read(_e, "C"), 2)
	return (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "u"), _S.read(_e, "v"), 0.5])) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.call_value(_S.read(_e, "lit"), [_S.read(_e, "u"), _S.read(_e, "v"), 0.8])) else _S.prop(_S.read(_e, "C"), 3)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "nx", _S.arg(_args, 0))
	_S.define(_e, "ny", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.unary("-", 0.6)), _S.binary("*", _S.read(_e, "ny"), _S.unary("-", 0.8))), 0.35)) else (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "ny"), 0.4)) else _S.prop(_S.read(_e, "C"), 3)))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "lerp"), [2, 0.7, _S.read(_e, "u")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	_S.define(_e, "v", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "C"), 2) if _S.truth(_S.binary(">", _S.read(_e, "v"), 0.55)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.66)) else _S.prop(_S.read(_e, "C"), 4)))

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "nx", _S.arg(_args, 0))
	_S.define(_e, "ny", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "Bl"), 2) if _S.truth(_S.binary(">", _S.binary("+", _S.binary("*", _S.read(_e, "nx"), _S.unary("-", 0.6)), _S.binary("*", _S.read(_e, "ny"), _S.unary("-", 0.8))), 0.55)) else (_S.prop(_S.read(_e, "Bl"), 1) if _S.truth(_S.binary(">", _S.read(_e, "ny"), 0.5)) else _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "Bl"), 2), _S.prop(_S.read(_e, "C"), 5), 0.4])))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Bl", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "belly"), 3]))
	_S.define(_e, "Pz", _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "t")]))
	_S.define(_e, "g", _S.read(_e, "GRID"))
	_S.call_value(_S.read(_e, "frog"), [_S.read(_e, "g"), _S.read(_e, "C"), _S.read(_e, "Bl"), _S.read(_e, "Pz"), _S.read(_e, "t")])
	_S.invoke(_S.read(_e, "g"), "draw", [_S.read(_e, "p"), 1, 0, _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "Pz"), "by")])])
	_S.define(_e, "ts", _S.binary("/", _S.binary("+", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_SNAP")), 0.06), 0.14))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "ts"), 0), func(): return _S.binary("<", _S.read(_e, "ts"), 1))):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "f", _S.call_value(_S.read(_v26, "fly"), [_S.binary("-", _S.read(_v26, "T_SNAP"), 0.001)]))
		_S.define(_v26, "e", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v26, "Math"), "PI"), _S.read(_v26, "ts"))]))
		_S.define(_v26, "mx", 11)
		_S.define(_v26, "my", _S.binary("-", _S.prop(_S.read(_v26, "Pz"), "by"), 8))
		_S.define(_v26, "x1", _S.call_value(_S.read(_v26, "lerp"), [_S.read(_v26, "mx"), _S.prop(_S.read(_v26, "f"), 0), _S.read(_v26, "e")]))
		_S.define(_v26, "y1", _S.call_value(_S.read(_v26, "lerp"), [_S.read(_v26, "my"), _S.prop(_S.read(_v26, "f"), 1), _S.read(_v26, "e")]))
		_S.invoke(_S.read(_v26, "p"), "line", [_S.read(_v26, "mx"), _S.read(_v26, "my"), _S.read(_v26, "x1"), _S.read(_v26, "y1"), _S.read(_v26, "TONGUE")])
		_S.invoke(_S.read(_v26, "p"), "line", [_S.read(_v26, "mx"), _S.binary("+", _S.read(_v26, "my"), 1), _S.read(_v26, "x1"), _S.binary("+", _S.read(_v26, "y1"), 1), _S.call_value(_S.read(_v26, "mix"), [_S.read(_v26, "TONGUE"), _S.prop(_S.read(_v26, "C"), 0), 0.4])])
		_S.invoke(_S.read(_v26, "p"), "circle", [_S.read(_v26, "x1"), _S.read(_v26, "y1"), 1.4, _S.read(_v26, "TONGUE")])
	_S.define(_e, "f", _S.call_value(_S.read(_e, "fly"), [_S.read(_e, "t")]))
	if _S.truth(_S.read(_e, "f")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "flap", _S.binary(">", _S.invoke(_S.read(_v27, "Math"), "sin", [_S.binary("*", _S.read(_v27, "t"), 90)]), 0))
		_S.invoke(_S.read(_v27, "p"), "px", [_S.prop(_S.read(_v27, "f"), 0), _S.prop(_S.read(_v27, "f"), 1), _S.read(_v27, "FLY")])
		_S.invoke(_S.read(_v27, "p"), "px", [_S.binary("+", _S.prop(_S.read(_v27, "f"), 0), 1), _S.prop(_S.read(_v27, "f"), 1), _S.read(_v27, "FLY")])
		_S.invoke(_S.read(_v27, "p"), "dot", [_S.prop(_S.read(_v27, "f"), 0), _S.binary("-", _S.prop(_S.read(_v27, "f"), 1), (1 if _S.truth(_S.read(_v27, "flap")) else 0)), _S.read(_v27, "WINGS"), 0.8])
		_S.invoke(_S.read(_v27, "p"), "dot", [_S.binary("+", _S.prop(_S.read(_v27, "f"), 0), 1), _S.binary("-", _S.prop(_S.read(_v27, "f"), 1), (0 if _S.truth(_S.read(_v27, "flap")) else 1)), _S.read(_v27, "WINGS"), 0.8])
		_S.invoke(_S.read(_v27, "p"), "glow", [_S.prop(_S.read(_v27, "f"), 0), _S.prop(_S.read(_v27, "f"), 1), 3, _S.read(_v27, "WINGS"), 0.15])
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "SWARM"), "begin", [_S.read(_e, "t")]))
	for _v28 in _S.array([[_S.read(_e, "T_UP"), 7, 0.6], [_S.read(_e, "T_LAND"), 18, 1]]):
		var _v29 = _S.scope(_e)
		var _v30 = _v28
		_S.define(_v29, "t0", _S.prop(_v30, 0))
		_S.define(_v29, "n", _S.prop(_v30, 1))
		_S.define(_v29, "pow", _S.prop(_v30, 2))
		var _v31 = _S.scope(_v29)
		_S.define(_v31, "age", _S.call_value(_S.read(_v31, "wrap"), [_S.binary("-", _S.read(_v31, "t"), _S.read(_v31, "t0")), _S.read(_v31, "D")]))
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "i"), _S.read(_v32, "n"))):
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "r", _S.call_value(_S.read(_v33, "rng"), [_S.prop(_S.read(_v33, "o"), "seed"), _S.read(_v33, "i"), _S.binary("*", _S.read(_v33, "t0"), 100)]))
			_S.define(_v33, "L", _S.binary("*", _S.invoke(_S.read(_v33, "r"), "range", [0.6, 1.1]), _S.read(_v33, "pow")))
			if _S.truth(_S.binary(">", _S.read(_v33, "age"), _S.read(_v33, "L"))):
				_v32 = _S.iteration(_v32)
				_S.write(_v32, "i", 1, "+=", true)
				continue
			_S.define(_v33, "s", _S.invoke(_S.read(_v33, "r"), "sign", []))
			_S.define(_v33, "v", _S.binary("*", _S.invoke(_S.read(_v33, "r"), "range", [24, 70]), _S.read(_v33, "pow")))
			_S.define(_v33, "x", _S.binary("*", _S.read(_v33, "s"), _S.binary("+", 7, _S.binary("*", _S.binary("/", _S.read(_v33, "v"), 3.5), _S.binary("-", 1, _S.invoke(_S.read(_v33, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.read(_v33, "age")), 3.5)]))))))
			_S.define(_v33, "y", _S.binary("-", _S.unary("-", 1.5), _S.binary("*", _S.invoke(_S.read(_v33, "r"), "range", [1, 5]), _S.read(_v33, "age"))))
			_S.invoke(_S.read(_v33, "sw"), "add", [_S.prop(_S.read(_v33, "P"), "SMOKE"), _S.read(_v33, "x"), _S.read(_v33, "y"), 0, 0, _S.read(_v33, "age"), _S.read(_v33, "L"), _S.read(_v33, "DUST"), _S.binary("*", _S.invoke(_S.read(_v33, "r"), "range", [2.2, 4.2]), _S.binary("+", 0.65, _S.binary("*", 0.35, _S.read(_v33, "pow")))), 2])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "i", 1, "+=", true)
		if _S.truth(_S.binary("===", _S.read(_v31, "pow"), 1)):
			var _v34 = _S.scope(_v31)
			_S.define(_v34, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v34, "i"), 8)):
				var _v35 = _S.scope(_v34)
				_S.define(_v35, "r", _S.call_value(_S.read(_v35, "rng"), [_S.prop(_S.read(_v35, "o"), "seed"), _S.read(_v35, "i"), 909]))
				_S.define(_v35, "b", _S.call_value(_S.read(_v35, "toss"), [_S.invoke(_S.read(_v35, "r"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 1), _S.invoke(_S.read(_v35, "r"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v35, "r"), "range", [30, 70])), _S.read(_v35, "age"), 700, _S.unary("-", 0.5)]))
				if _S.truth(_S.binary("<", _S.read(_v35, "age"), 0.7)):
					_S.invoke(_S.read(_v35, "p"), "dot", [_S.prop(_S.read(_v35, "b"), "x"), _S.prop(_S.read(_v35, "b"), "y"), (_S.call_value(_S.read(_v35, "hex"), ["#6a6074"]) if _S.truth(_S.binary("%", _S.read(_v35, "i"), 2)) else _S.call_value(_S.read(_v35, "hex"), ["#9a90a4"])), (_S.binary("-", 1.4, _S.binary("*", _S.read(_v35, "age"), 2)) if _S.truth(_S.prop(_S.read(_v35, "b"), "landed")) else 1)])
				_v34 = _S.iteration(_v34)
				_S.write(_v34, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "sw"), "draw", [_S.read(_e, "p")])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "time", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "shift"), [_S.read(_e, "time"), _S.read(_e, "D"), _S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "Pz", _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "t")]))
	_S.define(_e, "hgt", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Pz"), "by")), _S.read(_e, "HOP"))]))
	_S.call_value(_S.read(_e, "shadow"), [_S.read(_e, "p"), 0, _S.unary("-", 0.2), _S.binary("*", 13, _S.binary("-", 1, _S.binary("*", 0.35, _S.read(_e, "hgt")))), 1.6, _S.prop(_S.read(_e, "C"), 0), _S.binary("-", 0.6, _S.binary("*", 0.3, _S.read(_e, "hgt")))])
	return null
