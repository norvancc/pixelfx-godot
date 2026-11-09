@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/level-up.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise2", _S.import_value("core/index.js", "noise2"))
	_S.define(_e, "fract", _S.import_value("core/index.js", "fract"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "tintActor", _S.import_value("fx/ui/_lib.js", "tintActor"))
	_S.define(_e, "lightActor", _S.import_value("fx/ui/_lib.js", "lightActor"))
	_S.define(_e, "haloActor", _S.import_value("fx/ui/_lib.js", "haloActor"))
	_S.define(_e, "column", _S.function_value(_e, "_f0"))
	_S.define(_e, "plate", _S.function_value(_e, "_f1"))
	_S.define(_e, "rays", _S.function_value(_e, "_f3"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Level up"}, {"desc": "Gold gathers at the feet and bursts up as a pillar of light round the hero; rings climb it, LEVEL UP! drops in letter by letter, a shine sweeps it, sparkles twinkle."}, {"tags": ["ui", "level", "reward", "text", "light", "one-shot"]}, {"size": [176, 138]}, {"origin": [88, 114]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a1405", "#5c3008", "#9a5a0e", "#d48e18", "#f5b92c", "#ffde5e", "#fff4bc", "#ffffff"]}, {"text": "LEVEL UP!"}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "COIL", _S.merge([{"turn": 0.9}, {"crouch": 7}, {"lean": 2}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 13)}, {"bx": 7}, {"by": _S.unary("-", 13)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "LEAP", _S.merge([{"turn": 1.1}, {"y": _S.unary("-", 16)}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 45)}, {"bx": 7}, {"by": _S.unary("-", 44)}, {"ffx": _S.unary("-", 2)}, {"ffy": _S.unary("-", 8)}, {"fbx": 5}, {"fby": _S.unary("-", 3)}, {"toeB": true}]))
	_S.define(_e, "PUMP", _S.merge([{"turn": 0.9}, {"crouch": 0}, {"fx": _S.unary("-", 6)}, {"fy": _S.unary("-", 45)}, {"bx": 9}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[_S.unary("-", 0.3), _S.read(_e, "READY")], [0.28, _S.read(_e, "COIL")], [0.3, _S.read(_e, "LEAP"), "snap"], [0.46, _S.merge([_S.read(_e, "LEAP"), {"y": _S.unary("-", 19)}])], [0.72, _S.merge([_S.read(_e, "LEAP"), {"y": 0}, {"ffy": _S.unary("-", 4)}, {"fby": _S.unary("-", 4)}]), "in"], [0.74, _S.merge([_S.read(_e, "COIL"), {"crouch": 5}]), "snap"], [0.95, _S.read(_e, "PUMP"), "out"], [1.2, _S.merge([_S.read(_e, "PUMP"), {"crouch": 1}, {"fy": _S.unary("-", 43)}])], [1.45, _S.read(_e, "PUMP")], [2.3, _S.merge([_S.read(_e, "PUMP"), {"fy": _S.unary("-", 41)}])], [2.8, _S.read(_e, "READY")], [3.2, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.28}, {"stop": 0.05}, {"shake": 0.14}, {"amp": 2}])]}, {"dust": [_S.merge([{"t": 0.3}, {"x": 0}, {"n": 7}]), _S.merge([{"t": 0.74}, {"x": 0}, {"n": 6}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "REL", 0.28)
	_S.define(_e, "RET", 1.02)
	_S.define(_e, "GONE", 1.34)
	_S.define(_e, "TOP", 100)
	_S.define(_e, "TY", _S.unary("-", 68))
	_S.define(_e, "DROP", 0.5)
	_S.define(_e, "STAG", 0.05)
	_S.define(_e, "LANDED", 1.06)
	_S.define(_e, "SHINE", 1.24)
	_S.define(_e, "EXIT", 2.3)
	_S.define(_e, "STRANDS", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f22")]))
	_S.define(_e, "widthAt", _S.function_value(_e, "_f23"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "a", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "REL")))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "a"), 0), func(): return _S.binary(">", _S.read(_e, "t"), _S.read(_e, "GONE")))):
		return null
	_S.define(_e, "top", _S.binary("*", _S.unary("-", _S.read(_e, "TOP")), _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "a"), 0.12)])])))
	_S.define(_e, "bot", _S.binary("*", _S.unary("-", _S.read(_e, "TOP")), _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "RET"), _S.read(_e, "GONE")])])))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "widthAt"), [_S.read(_e, "t")]))
	_S.define(_e, "k", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "RET"), _S.read(_e, "GONE"), _S.read(_e, "t")])))
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.read(_e, "top"), 0, _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "bot"), _S.unary("-", 34)]), _S.binary("+", _S.binary("*", _S.read(_e, "W"), 1.6), 6), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", _S.binary("*", 0.2, _S.read(_e, "k")), 0.06)])
	_S.invoke(_S.read(_e, "p"), "glowLine", [0, _S.read(_e, "top"), 0, _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "bot"), _S.unary("-", 40)]), 5, _S.read(_e, "WHITE"), _S.binary("*", 0.18, _S.read(_e, "k"))])
	if _S.truth(_S.binary("<", _S.read(_e, "a"), 0.04)):
		var _v0 = _S.scope(_e)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "y", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.read(_v1, "top")]))
		while _S.truth(_S.binary("<", _S.read(_v1, "y"), _S.read(_v1, "bot"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "wr", _S.binary("*", _S.binary("*", _S.read(_v2, "W"), 0.55), _S.binary("-", 1, _S.binary("*", 0.3, _S.binary("/", _S.unary("-", _S.read(_v2, "y")), _S.read(_v2, "TOP"))))))
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "x", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.unary("-", _S.read(_v3, "wr"))]))
			while _S.truth(_S.binary("<=", _S.read(_v3, "x"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.read(_v3, "wr")]))):
				_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "x"), _S.read(_v3, "y"), (_S.read(_v3, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.binary("+", _S.read(_v3, "x"), 0.5)]), _S.binary("-", _S.read(_v3, "wr"), 1.5))) else _S.prop(_S.read(_v3, "C"), 6)), _S.binary("*", _S.call_value(_S.read(_v3, "clamp"), [_S.binary("/", _S.binary("+", _S.read(_v3, "y"), _S.read(_v3, "TOP")), 20)]), 1.5)])
				_v3 = _S.iteration(_v3)
				_S.write(_v3, "x", 1, "+=", true)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "y", 1, "+=", true)
		return null
	var _v4 = _S.scope(_e)
	_S.define(_v4, "y", _S.invoke(_S.read(_v4, "Math"), "ceil", [_S.read(_v4, "top")]))
	while _S.truth(_S.binary("<", _S.read(_v4, "y"), _S.invoke(_S.read(_v4, "Math"), "ceil", [_S.read(_v4, "bot")]))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "h", _S.binary("/", _S.unary("-", _S.read(_v5, "y")), _S.read(_v5, "TOP")))
		_S.define(_v5, "fade", _S.binary("*", _S.call_value(_S.read(_v5, "clamp"), [_S.binary("/", _S.binary("+", _S.read(_v5, "y"), _S.read(_v5, "TOP")), 16)]), (1 if _S.truth(_S.binary("<", _S.read(_v5, "t"), _S.read(_v5, "RET"))) else _S.call_value(_S.read(_v5, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v5, "bot"), _S.read(_v5, "y")), 10)]))))
		_S.define(_v5, "head", _S.logical("&&", _S.binary("<", _S.binary("-", _S.read(_v5, "y"), _S.read(_v5, "top")), 3), func(): return _S.binary("<", _S.read(_v5, "a"), 0.16)))
		_S.define(_v5, "wr", _S.binary("+", _S.binary("*", _S.read(_v5, "W"), _S.binary("-", 1, _S.binary("*", 0.3, _S.read(_v5, "h")))), _S.binary("*", 0.9, _S.call_value(_S.read(_v5, "noise2"), [_S.binary("*", _S.read(_v5, "y"), 0.2), _S.binary("*", _S.read(_v5, "t"), 12), 3]))))
		for _v6 in _S.array([_S.unary("-", 1), 1]):
			var _v7 = _S.scope(_v5)
			_S.define(_v7, "s", _v6)
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "run", _S.binary("<", _S.call_value(_S.read(_v8, "fract"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v8, "y"), 0.06), _S.binary("*", _S.read(_v8, "t"), 3.4)), (0.5 if _S.truth(_S.binary(">", _S.read(_v8, "s"), 0)) else 0))]), 0.78))
			_S.define(_v8, "xw", _S.binary("*", _S.read(_v8, "s"), _S.read(_v8, "wr")))
			_S.invoke(_S.read(_v8, "p"), "dot", [_S.read(_v8, "xw"), _S.read(_v8, "y"), (_S.read(_v8, "WHITE") if _S.truth(_S.read(_v8, "head")) else (_S.prop(_S.read(_v8, "C"), 6) if _S.truth(_S.read(_v8, "run")) else _S.prop(_S.read(_v8, "C"), 5))), _S.binary("*", _S.read(_v8, "fade"), 1.4)])
			_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("+", _S.read(_v8, "xw"), _S.read(_v8, "s")), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 4), _S.binary("*", _S.read(_v8, "fade"), (0.5 if _S.truth(_S.read(_v8, "run")) else 0.25))])
			if _S.truth(_S.read(_v8, "run")):
				_S.invoke(_S.read(_v8, "p"), "dot", [_S.binary("-", _S.read(_v8, "xw"), _S.read(_v8, "s")), _S.read(_v8, "y"), _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", _S.read(_v8, "fade"), 1.2)])
		_S.invoke(_S.read(_v5, "p"), "dot", [0, _S.read(_v5, "y"), _S.read(_v5, "WHITE"), _S.binary("*", _S.read(_v5, "fade"), 1.6)])
		_S.invoke(_S.read(_v5, "p"), "dot", [_S.unary("-", 1), _S.read(_v5, "y"), (_S.read(_v5, "WHITE") if _S.truth(_S.binary(">", _S.call_value(_S.read(_v5, "noise2"), [_S.binary("*", _S.read(_v5, "y"), 0.3), _S.binary("*", _S.read(_v5, "t"), 14), 5]), _S.unary("-", 0.2))) else _S.prop(_S.read(_v5, "C"), 6)), _S.binary("*", _S.read(_v5, "fade"), 1.3)])
		if _S.truth(_S.binary(">", _S.call_value(_S.read(_v5, "noise2"), [_S.binary("*", _S.read(_v5, "y"), 0.25), _S.binary("*", _S.read(_v5, "t"), 9), 8]), 0.25)):
			_S.invoke(_S.read(_v5, "p"), "dot", [1, _S.read(_v5, "y"), _S.prop(_S.read(_v5, "C"), 6), _S.binary("*", _S.read(_v5, "fade"), 1.2)])
		for _v9 in _S.array(_S.read(_v5, "STRANDS")):
			var _v10 = _S.scope(_v5)
			_S.define(_v10, "S", _v9)
			var _v11 = _S.scope(_v10)
			if _S.truth(_S.binary(">", _S.read(_v11, "h"), _S.prop(_S.read(_v11, "S"), "end"))):
				continue
			_S.define(_v11, "ph", _S.call_value(_S.read(_v11, "fract"), [_S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v11, "y"), _S.binary("*", _S.read(_v11, "t"), _S.prop(_S.read(_v11, "S"), "sp"))), _S.prop(_S.read(_v11, "S"), "per")), _S.prop(_S.read(_v11, "S"), "ph"))]))
			if _S.truth(_S.binary(">", _S.read(_v11, "ph"), _S.prop(_S.read(_v11, "S"), "duty"))):
				continue
			_S.define(_v11, "u", _S.binary("/", _S.read(_v11, "ph"), _S.prop(_S.read(_v11, "S"), "duty")))
			_S.invoke(_S.read(_v11, "p"), "px", [_S.binary("*", _S.prop(_S.read(_v11, "S"), "x"), _S.read(_v11, "wr")), _S.read(_v11, "y"), (_S.read(_v11, "WHITE") if _S.truth(_S.logical("||", _S.read(_v11, "head"), func(): return _S.binary("<", _S.read(_v11, "u"), 0.2))) else (_S.prop(_S.read(_v11, "C"), _S.binary("-", 7, _S.prop(_S.read(_v11, "S"), "lvl"))) if _S.truth(_S.binary("<", _S.read(_v11, "u"), 0.65)) else _S.prop(_S.read(_v11, "C"), _S.binary("-", 6, _S.prop(_S.read(_v11, "S"), "lvl")))))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "y", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.02)):
		return null
	_S.define(_e, "rx", _S.binary("+", _S.binary("+", 9, _S.binary("*", 9, _S.read(_e, "k"))), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 9)])))
	_S.define(_e, "ry", 2.2)
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", _S.read(_e, "rx")), _S.unary("-", _S.read(_e, "ry")), _S.read(_e, "rx"), _S.read(_e, "ry"), _S.function_value(_e, "_f2")])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), _S.binary("*", _S.read(_e, "rx"), 2.2), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.35, _S.read(_e, "k"))])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "rx")))
	_S.define(_e, "dy", _S.binary("/", _S.read(_e, "y"), _S.read(_e, "ry")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy")))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "d"), _S.invoke(_S.read(_e, "Math"), "max", [0.05, _S.read(_e, "k")])))
	_S.set_prop(_S.read(_e, "o"), "c", (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.55)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.8)) else _S.prop(_S.read(_e, "C"), 4)))), "=", false)
	_S.set_prop(_S.read(_e, "o"), "a", (1 if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.binary("*", 0.6, _S.read(_e, "k")))) else _S.binary("*", _S.binary("*", _S.read(_e, "k"), _S.binary("-", 1, _S.read(_e, "d"))), 2.2)), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "cx", _S.arg(_args, 4))
	_S.define(_e, "cy", _S.arg(_args, 5))
	if _S.truth(_S.binary("<=", _S.read(_e, "k"), 0.02)):
		return null
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 20)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v13, "i"), 20), _S.read(_v13, "TAU")), 0.08))
		_S.define(_v13, "ca", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "an")]))
		_S.define(_v13, "sa", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "an")]))
		_S.define(_v13, "long", _S.binary("===", _S.binary("%", _S.read(_v13, "i"), 2), 0))
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.read(_v13, "sa")]), 0.4)):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
			continue
		_S.define(_v13, "r0", _S.binary("+", _S.binary("/", 1, _S.invoke(_S.read(_v13, "Math"), "sqrt", [_S.binary("+", _S.binary("**", _S.binary("/", _S.read(_v13, "ca"), 52), 2), _S.binary("**", _S.binary("/", _S.read(_v13, "sa"), 12), 2))])), _S.binary("*", 2, _S.read(_v13, "k"))))
		_S.define(_v13, "len", _S.binary("*", (_S.binary("+", 15, _S.binary("*", 7, _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "i"), 9]))) if _S.truth(_S.read(_v13, "long")) else _S.binary("+", 7, _S.binary("*", 4, _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "i"), 8])))), _S.read(_v13, "k")))
		if _S.truth(_S.binary("<", _S.read(_v13, "len"), 1)):
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
			continue
		_S.define(_v13, "sh", _S.binary("+", 0.75, _S.binary("*", 0.25, _S.invoke(_S.read(_v13, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v13, "t"), 7), _S.binary("*", _S.read(_v13, "i"), 2.1))]))))
		_S.define(_v13, "x0", _S.binary("+", _S.read(_v13, "cx"), _S.binary("*", _S.read(_v13, "ca"), _S.read(_v13, "r0"))))
		_S.define(_v13, "y0", _S.binary("+", _S.read(_v13, "cy"), _S.binary("*", _S.read(_v13, "sa"), _S.read(_v13, "r0"))))
		_S.invoke(_S.read(_v13, "p"), "line", [_S.read(_v13, "x0"), _S.read(_v13, "y0"), _S.binary("+", _S.read(_v13, "x0"), _S.binary("*", _S.read(_v13, "ca"), _S.read(_v13, "len"))), _S.binary("+", _S.read(_v13, "y0"), _S.binary("*", _S.read(_v13, "sa"), _S.read(_v13, "len"))), _S.function_value(_v13, "_f4"), _S.function_value(_v13, "_f5")])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "sh"), (1.3 if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.55)) else _S.binary("/", _S.binary("*", 1.3, _S.binary("-", 1, _S.read(_e, "u"))), 0.45)))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "C"), 0), 0.5]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f7")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "spawn", _S.function_value(_e, "_f8"))
	_S.define(_e, "word", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text")]))
	_S.define(_e, "BASE", _S.binary("+", _S.read(_e, "TY"), 14))
	_S.define(_e, "X0", _S.unary("-", _S.prop(_S.read(_e, "word"), "w")))
	_S.define(_e, "lets", _S.invoke(_S.invoke(_S.prop(_S.read(_e, "word"), "letters"), "filter", [_S.function_value(_e, "_f9")]), "map", [_S.function_value(_e, "_f10")]))
	_S.define(_e, "right", _S.binary("+", _S.read(_e, "X0"), _S.binary("*", _S.prop(_S.read(_e, "word"), "w"), 2)))
	_S.define(_e, "sats", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f11")]))
	_S.define(_e, "halos", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "nextHalo", _S.binary("+", _S.read(_e, "REL"), 0.03))
	_S.define(_e, "gather", 0)
	_S.define(_e, "rush", [])
	_S.define(_e, "drawRush", _S.function_value(_e, "_f12"))
	return _S.merge([{"update": _S.function_value(_e, "_f13")}, {"drawBack": _S.function_value(_e, "_f14")}, {"draw": _S.function_value(_e, "_f18")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "vx", _S.arg(_args, 3))
	_S.define(_e, "vy", _S.arg(_args, 4))
	_S.define(_e, "life", _S.arg(_args, 5))
	_S.define(_e, "rest", _args.slice(6))
	return _S.invoke(_S.read(_e, "ps"), "spawn", _S.concat([[_S.read(_e, "k")], [_S.read(_e, "x")], [_S.read(_e, "y")], [_S.read(_e, "vx")], [_S.read(_e, "vy")], [_S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "life"), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05), _S.read(_e, "t"))])], _S.array(_S.read(_e, "rest"))]))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "L"), "g")

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "L", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"g": _S.prop(_S.read(_e, "L"), "g")}, {"w": _S.prop(_S.read(_e, "L"), "w")}, {"cx": _S.binary("+", _S.read(_e, "X0"), _S.binary("*", _S.binary("+", _S.prop(_S.read(_e, "L"), "x"), _S.binary("/", _S.prop(_S.read(_e, "L"), "w"), 2)), 2))}, {"born": _S.binary("+", _S.read(_e, "DROP"), _S.binary("*", _S.read(_e, "i"), _S.read(_e, "STAG")))}, {"pop": _S.binary("+", _S.read(_e, "EXIT"), _S.binary("*", _S.read(_e, "i"), 0.04))}, {"off": _S.unary("-", 18)}, {"v": 60}, {"sq": 0}, {"flash": 0}, {"on": false}, {"landed": false}, {"rest": false}, {"burst": false}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "s", (1 if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.unary("-", 1)))
	_S.define(_e, "x", _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "R"), "range", [20, 60])))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.read(_e, "TY"), 7), (_S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), _S.invoke(_S.read(_e, "R"), "range", [11, 18])) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "x")]), 50)) else _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 14), 14]))))
	return _S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"t0": _S.binary("+", _S.binary("+", _S.binary("-", _S.read(_e, "SHINE"), 0.1), _S.binary("*", _S.read(_e, "i"), 0.13)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.05]))}, {"dur": _S.invoke(_S.read(_e, "R"), "range", [0.32, 0.5])}, {"L": _S.invoke(_S.read(_e, "R"), "range", [3, 6])}])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	for _v14 in _S.array(_S.read(_e, "rush")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "m", _v14)
		var _v16 = _S.scope(_v15)
		if _S.truth(_S.binary("!==", _S.prop(_S.read(_v16, "m"), "back"), _S.read(_v16, "back"))):
			continue
		_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "Math"), "hypot", [_S.prop(_S.read(_v16, "m"), "vx"), _S.prop(_S.read(_v16, "m"), "vy")]))
		_S.define(_v16, "ux", _S.binary("/", _S.prop(_S.read(_v16, "m"), "vx"), _S.read(_v16, "sp")))
		_S.define(_v16, "uy", _S.binary("/", _S.prop(_S.read(_v16, "m"), "vy"), _S.read(_v16, "sp")))
		_S.define(_v16, "L", _S.prop(_S.read(_v16, "m"), "len"))
		_S.invoke(_S.read(_v16, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v16, "m"), "x"), _S.binary("*", _S.read(_v16, "ux"), _S.read(_v16, "L"))), _S.binary("-", _S.prop(_S.read(_v16, "m"), "y"), _S.binary("*", _S.read(_v16, "uy"), _S.read(_v16, "L"))), _S.binary("-", _S.prop(_S.read(_v16, "m"), "x"), _S.binary("*", _S.binary("*", _S.read(_v16, "ux"), _S.read(_v16, "L")), 0.4)), _S.binary("-", _S.prop(_S.read(_v16, "m"), "y"), _S.binary("*", _S.binary("*", _S.read(_v16, "uy"), _S.read(_v16, "L")), 0.4)), _S.prop(_S.read(_v16, "m"), "c")])
		_S.invoke(_S.read(_v16, "p"), "line", [_S.binary("-", _S.prop(_S.read(_v16, "m"), "x"), _S.binary("*", _S.binary("*", _S.read(_v16, "ux"), _S.read(_v16, "L")), 0.35)), _S.binary("-", _S.prop(_S.read(_v16, "m"), "y"), _S.binary("*", _S.binary("*", _S.read(_v16, "uy"), _S.read(_v16, "L")), 0.35)), _S.prop(_S.read(_v16, "m"), "x"), _S.prop(_S.read(_v16, "m"), "y"), _S.read(_v16, "WHITE")])
		_S.invoke(_S.read(_v16, "p"), "glow", [_S.prop(_S.read(_v16, "m"), "x"), _S.prop(_S.read(_v16, "m"), "y"), 4, _S.prop(_S.read(_v16, "C"), 5), 0.25])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	var _v17 = _S.scope(_e)
	_S.write(_v17, "gather", (_S.binary("*", _S.read(_v17, "dt"), 420) if _S.truth(_S.binary("<", _S.read(_v17, "t"), _S.read(_v17, "REL"))) else 0), "+=", false)
	while _S.truth(_S.binary(">=", _S.read(_v17, "gather"), 1)):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "kind", _S.invoke(_S.read(_v18, "R"), "next", []))
		_S.define(_v18, "sp", _S.binary("*", _S.invoke(_S.read(_v18, "R"), "range", [140, 250]), _S.binary("+", 1, _S.binary("*", _S.read(_v18, "t"), 2))))
		_S.define(_v18, "x", null)
		_S.define(_v18, "y", null)
		_S.define(_v18, "tx", null)
		_S.define(_v18, "ty", null)
		if _S.truth(_S.binary("<", _S.read(_v18, "kind"), 0.42)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "an", _S.invoke(_S.read(_v19, "R"), "range", [0, _S.read(_v19, "TAU")]))
			_S.define(_v19, "D", _S.invoke(_S.read(_v19, "R"), "range", [22, 70]))
			_S.last([_S.write(_v19, "x", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "an")]), _S.read(_v19, "D")), "=", false), _S.write(_v19, "y", _S.binary("-", _S.unary("-", 1), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "abs", [_S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "an")])]), _S.read(_v19, "D")), 0.1)), "=", false), _S.write(_v19, "tx", _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "an")]), 3), "=", false), _S.write(_v19, "ty", _S.unary("-", 1), "=", false)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v18, "kind"), 0.84)):
				var _v20 = _S.scope(_v18)
				_S.define(_v20, "an", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
				_S.define(_v20, "D", _S.invoke(_S.read(_v20, "R"), "range", [34, 64]))
				_S.last([_S.write(_v20, "x", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), _S.read(_v20, "D")), "=", false), _S.write(_v20, "y", _S.invoke(_S.read(_v20, "Math"), "min", [_S.unary("-", 3), _S.binary("+", _S.unary("-", 20), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), _S.read(_v20, "D")), 0.85))]), "=", false), _S.write(_v20, "tx", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "an")]), 11), "=", false), _S.write(_v20, "ty", _S.binary("+", _S.unary("-", 20), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "an")]), 14)), "=", false)])
			else:
				var _v21 = _S.scope(_v18)
				if _S.truth(_S.binary("<", _S.read(_v21, "t"), _S.binary("*", _S.read(_v21, "REL"), 0.4))):
					_v17 = _S.iteration(_v17)
					_S.write(_v17, "gather", 1, "-=", true)
					continue
				_S.last([_S.write(_v21, "x", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 9), 9]), "=", false), _S.write(_v21, "y", _S.unary("-", 1), "=", false), _S.write(_v21, "tx", _S.binary("*", _S.read(_v21, "x"), 0.7), "=", false), _S.write(_v21, "ty", _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [26, 44])), "=", false)])
		_S.define(_v18, "dx", _S.binary("-", _S.read(_v18, "tx"), _S.read(_v18, "x")))
		_S.define(_v18, "dy", _S.binary("-", _S.read(_v18, "ty"), _S.read(_v18, "y")))
		_S.define(_v18, "l", _S.logical("||", _S.invoke(_S.read(_v18, "Math"), "hypot", [_S.read(_v18, "dx"), _S.read(_v18, "dy")]), func(): return 1))
		_S.invoke(_S.read(_v18, "rush"), "push", [_S.merge([{"x": _S.read(_v18, "x")}, {"y": _S.read(_v18, "y")}, {"vx": _S.binary("*", _S.binary("/", _S.read(_v18, "dx"), _S.read(_v18, "l")), _S.read(_v18, "sp"))}, {"vy": _S.binary("*", _S.binary("/", _S.read(_v18, "dy"), _S.read(_v18, "l")), _S.read(_v18, "sp"))}, {"life": _S.invoke(_S.read(_v18, "Math"), "min", [_S.binary("/", _S.read(_v18, "l"), _S.read(_v18, "sp")), _S.binary("-", _S.binary("+", _S.read(_v18, "REL"), 0.06), _S.read(_v18, "t"))])}, {"len": _S.invoke(_S.read(_v18, "R"), "range", [5, 9])}, {"c": (_S.prop(_S.read(_v18, "C"), 6) if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.45])) else _S.prop(_S.read(_v18, "C"), 5))}, {"back": _S.logical("&&", _S.binary(">", _S.read(_v18, "kind"), 0.84), func(): return _S.invoke(_S.read(_v18, "R"), "chance", [0.5]))}])])
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "gather", 1, "-=", true)
	var _v22 = _S.scope(_e)
	_S.define(_v22, "i", _S.binary("-", _S.prop(_S.read(_v22, "rush"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v22, "i"), 0)):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "m", _S.prop(_S.read(_v23, "rush"), _S.read(_v23, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v23, "m"), "life", _S.read(_v23, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v23, "rush"), "splice", [_S.read(_v23, "i"), 1])
		else:
			_S.last([_S.set_prop(_S.read(_v23, "m"), "x", _S.binary("*", _S.prop(_S.read(_v23, "m"), "vx"), _S.read(_v23, "dt")), "+=", false), _S.set_prop(_S.read(_v23, "m"), "y", _S.binary("*", _S.prop(_S.read(_v23, "m"), "vy"), _S.read(_v23, "dt")), "+=", false)])
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "i", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		_S.call_value(_S.read(_e, "spawn"), [_S.prop(_S.read(_e, "P"), "STAR"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 3])), 0, _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [10, 30])), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.5]), _S.prop(_S.read(_e, "C"), 6), 0.6])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "released")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "REL")))):
		var _v24 = _S.scope(_e)
		_S.write(_v24, "released", true, "=", false)
		_S.invoke(_S.read(_v24, "lights"), "add", [0, _S.unary("-", 24), 90, _S.prop(_S.read(_v24, "C"), 5), 0.6, 0.7])
		_S.invoke(_S.read(_v24, "lights"), "add", [0, _S.unary("-", 8), 40, _S.read(_v24, "WHITE"), 0.6, 0.12])
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 22)):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v26, "i"), 22), _S.read(_v26, "TAU")), _S.invoke(_S.read(_v26, "R"), "range", [_S.unary("-", 0.12), 0.12])))
			_S.define(_v26, "sp", _S.invoke(_S.read(_v26, "R"), "range", [260, 460]))
			_S.define(_v26, "y0", _S.binary("+", _S.unary("-", 18), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "an")]), 8)))
			_S.define(_v26, "vy", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "an")]), _S.read(_v26, "sp")), 0.8))
			_S.define(_v26, "life", _S.invoke(_S.read(_v26, "Math"), "min", [_S.invoke(_S.read(_v26, "R"), "range", [0.1, 0.2]), (_S.binary("/", _S.unary("-", _S.read(_v26, "y0")), _S.read(_v26, "vy")) if _S.truth(_S.binary(">", _S.read(_v26, "vy"), 0)) else (_S.binary("/", _S.binary("+", _S.read(_v26, "y0"), 104), _S.unary("-", _S.read(_v26, "vy"))) if _S.truth(_S.binary("<", _S.read(_v26, "vy"), 0)) else 1)), _S.binary("/", 78, _S.invoke(_S.read(_v26, "Math"), "abs", [_S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "an")]), _S.read(_v26, "sp"))]))]))
			_S.call_value(_S.read(_v26, "spawn"), [_S.prop(_S.read(_v26, "P"), "MOTE"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "an")]), 6), _S.read(_v26, "y0"), _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "an")]), _S.read(_v26, "sp")), _S.read(_v26, "vy"), _S.read(_v26, "life"), (_S.prop(_S.read(_v26, "C"), 7) if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.4])) else _S.prop(_S.read(_v26, "C"), 6)), 1, 0, (_S.prop(_S.read(_v26, "PF"), "BACK") if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v26, "an"), 0.3), func(): return _S.binary("<", _S.read(_v26, "an"), _S.binary("-", _S.prop(_S.read(_v26, "Math"), "PI"), 0.3)))) else 0)])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		var _v27 = _S.scope(_v24)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 26)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "an", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v28, "Math"), "PI")), 2), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 1.3), 1.3])))
			_S.define(_v28, "sp", _S.invoke(_S.read(_v28, "R"), "range", [120, 290]))
			_S.call_value(_S.read(_v28, "spawn"), [_S.prop(_S.read(_v28, "P"), "SPARK"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "an")]), _S.read(_v28, "sp")), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "an")]), _S.read(_v28, "sp")), _S.invoke(_S.read(_v28, "R"), "range", [0.35, 0.8])])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v29 = _S.scope(_v24)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 16)):
			_S.call_value(_S.read(_v29, "spawn"), [_S.prop(_S.read(_v29, "P"), "STAR"), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 36), _S.unary("-", 4)]), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [15, 60])), _S.invoke(_S.read(_v29, "R"), "range", [0.6, 1.3]), _S.invoke(_S.read(_v29, "R"), "pick", [[_S.prop(_S.read(_v29, "C"), 7), _S.prop(_S.read(_v29, "C"), 6), _S.prop(_S.read(_v29, "C"), 5)]]), (_S.invoke(_S.read(_v29, "R"), "range", [1.5, 2.6]) if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.35])) else _S.invoke(_S.read(_v29, "R"), "range", [0.4, 0.9])), 0, (_S.prop(_S.read(_v29, "PF"), "BACK") if _S.truth(_S.invoke(_S.read(_v29, "R"), "chance", [0.4])) else 0)])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	_S.define(_e, "W", _S.call_value(_S.read(_e, "widthAt"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "nextHalo")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "RET"), 0.1)))):
		_S.last([_S.invoke(_S.read(_e, "halos"), "push", [_S.read(_e, "t")]), _S.write(_e, "nextHalo", 0.16, "+=", false)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "REL")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "RET"), 0.1))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "s", _S.invoke(_S.read(_v30, "R"), "sign", []))
		_S.define(_v30, "y", _S.invoke(_S.read(_v30, "R"), "range", [_S.unary("-", 4), _S.unary("-", 60)]))
		_S.define(_v30, "vy", _S.unary("-", _S.invoke(_S.read(_v30, "R"), "range", [140, 260])))
		_S.call_value(_S.read(_v30, "spawn"), [_S.prop(_S.read(_v30, "P"), "MOTE"), _S.binary("*", _S.binary("*", _S.read(_v30, "s"), _S.invoke(_S.read(_v30, "R"), "range", [0.75, 1.6])), _S.read(_v30, "W")), _S.read(_v30, "y"), 0, _S.read(_v30, "vy"), _S.invoke(_S.read(_v30, "Math"), "min", [_S.invoke(_S.read(_v30, "R"), "range", [0.16, 0.32]), _S.binary("/", _S.binary("+", _S.read(_v30, "y"), 96), _S.unary("-", _S.read(_v30, "vy")))]), (_S.prop(_S.read(_v30, "C"), 7) if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else _S.prop(_S.read(_v30, "C"), 6)), _S.invoke(_S.read(_v30, "R"), "range", [0.6, 1]), 0, (_S.prop(_S.read(_v30, "PF"), "BACK") if _S.truth(_S.invoke(_S.read(_v30, "R"), "chance", [0.5])) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "REL")), func(): return _S.binary("<", _S.read(_e, "t"), 2.4)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.14, _S.binary("-", 1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 1.6, 2.4])))]))):
		var _v31 = _S.scope(_e)
		_S.call_value(_S.read(_v31, "spawn"), [_S.prop(_S.read(_v31, "P"), "EMBER"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [1, 30])), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v31, "R"), "range", [20, 55])), _S.invoke(_S.read(_v31, "R"), "range", [0.8, 1.6]), _S.prop(_S.read(_v31, "C"), 5), _S.invoke(_S.read(_v31, "R"), "range", [1, 2]), 0, (_S.prop(_S.read(_v31, "PF"), "BACK") if _S.truth(_S.invoke(_S.read(_v31, "R"), "chance", [0.4])) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "A"), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "REL"), 0.1))), func(): return _S.binary("<", _S.read(_e, "t"), 2.2)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.09]))):
		var _v32 = _S.scope(_e)
		_S.define(_v32, "m", _S.prop(_S.read(_v32, "A"), "mask"))
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "n"), 12)):
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "i", _S.invoke(_S.read(_v34, "R"), "int", [0, _S.binary("-", _S.prop(_S.read(_v34, "m"), "w"), 1)]))
			_S.define(_v34, "j", _S.invoke(_S.read(_v34, "R"), "int", [0, _S.binary("-", _S.prop(_S.read(_v34, "m"), "h"), 1)]))
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.read(_v34, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_v34, "j"), _S.prop(_S.read(_v34, "m"), "w")), _S.read(_v34, "i"))))):
				_v33 = _S.iteration(_v33)
				_S.write(_v33, "n", 1, "+=", true)
				continue
			_S.call_value(_S.read(_v34, "spawn"), [_S.prop(_S.read(_v34, "P"), "STAR"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v34, "A"), "x"), _S.read(_v34, "i")), 0.5), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v34, "A"), "y"), _S.read(_v34, "j")), 0.5), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v34, "R"), "range", [14, 34])), _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.1]), _S.invoke(_S.read(_v34, "R"), "pick", [[_S.prop(_S.read(_v34, "C"), 7), _S.prop(_S.read(_v34, "C"), 6), _S.prop(_S.read(_v34, "C"), 5)]]), (1.5 if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.2])) else 0.6), 0, (_S.prop(_S.read(_v34, "PF"), "BACK") if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.5])) else 0)])
			break
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "n", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 1), func(): return _S.binary("<", _S.read(_e, "t"), 2.5)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.13]))):
		var _v35 = _S.scope(_e)
		_S.define(_v35, "up", _S.invoke(_S.read(_v35, "R"), "chance", [0.6]))
		_S.define(_v35, "x", (_S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 58), 58]) if _S.truth(_S.read(_v35, "up")) else _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 20), 20])))
		_S.define(_v35, "y", (_S.binary("+", _S.binary("+", _S.read(_v35, "TY"), 7), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 16), 16])) if _S.truth(_S.read(_v35, "up")) else _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 44), _S.unary("-", 6)])))
		_S.call_value(_S.read(_v35, "spawn"), [_S.prop(_S.read(_v35, "P"), "STAR"), _S.read(_v35, "x"), _S.read(_v35, "y"), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 14])), _S.invoke(_S.read(_v35, "R"), "range", [0.4, 0.8]), _S.invoke(_S.read(_v35, "R"), "pick", [[_S.prop(_S.read(_v35, "C"), 7), _S.prop(_S.read(_v35, "C"), 6), _S.prop(_S.read(_v35, "C"), 6), _S.prop(_S.read(_v35, "C"), 5)]]), (_S.invoke(_S.read(_v35, "R"), "range", [1.5, 2.4]) if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.3])) else 0.6), 0, (_S.prop(_S.read(_v35, "PF"), "BACK") if _S.truth(_S.invoke(_S.read(_v35, "R"), "chance", [0.3])) else 0)])
	for _v36 in _S.array(_S.read(_e, "lets")):
		var _v37 = _S.scope(_e)
		_S.define(_v37, "L", _v36)
		var _v38 = _S.scope(_v37)
		if _S.truth(_S.binary("<", _S.read(_v38, "t"), _S.prop(_S.read(_v38, "L"), "born"))):
			continue
		_S.set_prop(_S.read(_v38, "L"), "on", true, "=", false)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v38, "L"), "rest"))):
			var _v39 = _S.scope(_v38)
			_S.set_prop(_S.read(_v39, "L"), "v", _S.binary("*", 1700, _S.read(_v39, "dt")), "+=", false)
			_S.set_prop(_S.read(_v39, "L"), "off", _S.binary("*", _S.prop(_S.read(_v39, "L"), "v"), _S.read(_v39, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v39, "L"), "off"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v39, "L"), "v"), 0))):
				var _v40 = _S.scope(_v39)
				_S.set_prop(_S.read(_v40, "L"), "off", 0, "=", false)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v40, "L"), "v"), 110)):
					var _v41 = _S.scope(_v40)
					_S.set_prop(_S.read(_v41, "L"), "sq", 1, "=", false)
					if _S.truth(_S.unary("!", _S.prop(_S.read(_v41, "L"), "landed"))):
						var _v42 = _S.scope(_v41)
						_S.set_prop(_S.read(_v42, "L"), "landed", true, "=", false)
						_S.set_prop(_S.read(_v42, "L"), "flash", 1, "=", false)
						_S.invoke(_S.read(_v42, "lights"), "add", [_S.prop(_S.read(_v42, "L"), "cx"), _S.binary("-", _S.read(_v42, "BASE"), 7), 18, _S.prop(_S.read(_v42, "C"), 5), 0.55, 0.25])
						for _v43 in _S.array([_S.unary("-", 1), 1]):
							var _v44 = _S.scope(_v42)
							_S.define(_v44, "s", _v43)
							_S.call_value(_S.read(_v44, "spawn"), [_S.prop(_S.read(_v44, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v44, "L"), "cx"), _S.binary("*", _S.read(_v44, "s"), _S.prop(_S.read(_v44, "L"), "w"))), _S.binary("-", _S.read(_v44, "BASE"), _S.invoke(_S.read(_v44, "R"), "range", [0, 3])), _S.binary("*", _S.read(_v44, "s"), _S.invoke(_S.read(_v44, "R"), "range", [15, 40])), _S.unary("-", _S.invoke(_S.read(_v44, "R"), "range", [5, 25])), _S.invoke(_S.read(_v44, "R"), "range", [0.25, 0.45]), _S.prop(_S.read(_v44, "C"), 6), _S.invoke(_S.read(_v44, "R"), "range", [0.5, 1.2])])
					_S.set_prop(_S.read(_v41, "L"), "v", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v41, "L"), "v")), 0.3), "=", false)
				else:
					_S.last([_S.set_prop(_S.read(_v40, "L"), "v", 0, "=", false), _S.set_prop(_S.read(_v40, "L"), "rest", true, "=", false)])
		_S.set_prop(_S.read(_v38, "L"), "sq", _S.invoke(_S.read(_v38, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_v38, "L"), "sq"), _S.binary("/", _S.read(_v38, "dt"), 0.1))]), "=", false)
		_S.set_prop(_S.read(_v38, "L"), "flash", _S.invoke(_S.read(_v38, "Math"), "max", [0, _S.binary("-", _S.prop(_S.read(_v38, "L"), "flash"), _S.binary("/", _S.read(_v38, "dt"), 0.12))]), "=", false)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v38, "L"), "burst")), func(): return _S.binary(">=", _S.read(_v38, "t"), _S.binary("+", _S.prop(_S.read(_v38, "L"), "pop"), 0.06)))):
			var _v45 = _S.scope(_v38)
			_S.set_prop(_S.read(_v45, "L"), "burst", true, "=", false)
			var _v46 = _S.scope(_v45)
			_S.define(_v46, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v46, "i"), 3)):
				var _v47 = _S.scope(_v46)
				_S.define(_v47, "an", _S.invoke(_S.read(_v47, "R"), "range", [0, _S.read(_v47, "TAU")]))
				_S.define(_v47, "sp", _S.invoke(_S.read(_v47, "R"), "range", [20, 55]))
				_S.call_value(_S.read(_v47, "spawn"), [_S.prop(_S.read(_v47, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v47, "L"), "cx"), _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.binary("-", _S.read(_v47, "BASE"), 7), _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "cos", [_S.read(_v47, "an")]), _S.read(_v47, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v47, "Math"), "sin", [_S.read(_v47, "an")]), _S.read(_v47, "sp")), 15), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v47, "R"), "pick", [[_S.prop(_S.read(_v47, "C"), 7), _S.prop(_S.read(_v47, "C"), 6)]]), (0.6 if _S.truth(_S.read(_v47, "i")) else _S.invoke(_S.read(_v47, "R"), "range", [1.2, 2]))])
				_v46 = _S.iteration(_v46)
				_S.write(_v46, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.call_value(_S.read(_e, "rays"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outExpo", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "LANDED"), _S.binary("+", _S.read(_e, "LANDED"), 0.2)])]), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inQuad", [_S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.binary("-", _S.read(_e, "EXIT"), 0.15), _S.binary("+", _S.read(_e, "EXIT"), 0.1)])]))), 0, _S.binary("+", _S.read(_e, "TY"), 7)])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v48 = _S.scope(_e)
		_S.define(_v48, "k", _S.call_value(_S.read(_v48, "seg"), [_S.read(_v48, "t"), 0.02, _S.read(_v48, "REL")]))
		_S.call_value(_S.read(_v48, "band"), [_S.read(_v48, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 52, _S.binary("-", 1, _S.invoke(_S.read(_v48, "ease"), "inQuad", [_S.read(_v48, "k")])))), 0.2, 1.5, _S.binary("*", _S.read(_v48, "k"), 1.1), _S.read(_v48, "C"), _S.function_value(_v48, "_f15")])
	for _v49 in _S.array([[0, 72, 4], [0.08, 46, 2.5]]):
		var _v50 = _S.scope(_e)
		var _v51 = _v49
		_S.define(_v50, "d", _S.prop(_v51, 0))
		_S.define(_v50, "r1", _S.prop(_v51, 1))
		_S.define(_v50, "th", _S.prop(_v51, 2))
		var _v52 = _S.scope(_v50)
		_S.define(_v52, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v52, "t"), _S.read(_v52, "REL")), _S.read(_v52, "d")), 0.55))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v52, "k"), 0), func(): return _S.binary("<", _S.read(_v52, "k"), 1))):
			_S.call_value(_S.read(_v52, "band"), [_S.read(_v52, "p"), 0, 0, _S.binary("+", 5, _S.binary("*", _S.read(_v52, "r1"), _S.invoke(_S.read(_v52, "ease"), "outCubic", [_S.read(_v52, "k")]))), 0.2, _S.invoke(_S.read(_v52, "Math"), "max", [1, _S.binary("*", _S.read(_v52, "th"), _S.binary("-", 1, _S.read(_v52, "k")))]), _S.binary("-", 1.15, _S.read(_v52, "k")), _S.read(_v52, "C"), _S.function_value(_v52, "_f16"), _S.binary("<", _S.read(_v52, "k"), 0.15)])
	for _v53 in _S.array(_S.read(_e, "halos")):
		var _v54 = _S.scope(_e)
		_S.define(_v54, "h0", _v53)
		var _v55 = _S.scope(_v54)
		_S.define(_v55, "k", _S.binary("/", _S.binary("-", _S.read(_v55, "t"), _S.read(_v55, "h0")), 0.6))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v55, "k"), 0), func(): return _S.binary("<", _S.read(_v55, "k"), 1))):
			_S.call_value(_S.read(_v55, "band"), [_S.read(_v55, "p"), 0, _S.binary("-", _S.unary("-", 2), _S.binary("*", 72, _S.invoke(_S.read(_v55, "ease"), "outQuad", [_S.read(_v55, "k")]))), _S.binary("*", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v55, "widthAt"), [_S.read(_v55, "t")]), 1.45), 4), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v55, "k")))), 0.3, 1.5, _S.binary("*", _S.binary("-", 1, _S.read(_v55, "k")), 1.4), _S.read(_v55, "C"), _S.function_value(_v55, "_f17"), _S.binary("<", _S.read(_v55, "k"), 0.12)])
	_S.call_value(_S.read(_e, "column"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "plate"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), (_S.binary("*", 0.55, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0.05, _S.read(_e, "REL")])) if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))) else _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "RET"), 0.1), _S.binary("+", _S.read(_e, "GONE"), 0.2), _S.read(_e, "t")])))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.call_value(_S.read(_e, "drawRush"), [_S.read(_e, "p"), true])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "k", _S.call_value(_S.read(_v56, "seg"), [_S.read(_v56, "t"), 0.02, _S.read(_v56, "REL")]))
		_S.call_value(_S.read(_v56, "band"), [_S.read(_v56, "p"), 0, 0, _S.binary("+", 4, _S.binary("*", 52, _S.binary("-", 1, _S.invoke(_S.read(_v56, "ease"), "inQuad", [_S.read(_v56, "k")])))), 0.2, 1.5, _S.binary("*", _S.read(_v56, "k"), 1.1), _S.read(_v56, "C"), _S.function_value(_v56, "_f19")])
	for _v57 in _S.array([[0, 72, 4], [0.08, 46, 2.5]]):
		var _v58 = _S.scope(_e)
		var _v59 = _v57
		_S.define(_v58, "d", _S.prop(_v59, 0))
		_S.define(_v58, "r1", _S.prop(_v59, 1))
		_S.define(_v58, "th", _S.prop(_v59, 2))
		var _v60 = _S.scope(_v58)
		_S.define(_v60, "k", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v60, "t"), _S.read(_v60, "REL")), _S.read(_v60, "d")), 0.55))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v60, "k"), 0), func(): return _S.binary("<", _S.read(_v60, "k"), 1))):
			_S.call_value(_S.read(_v60, "band"), [_S.read(_v60, "p"), 0, 0, _S.binary("+", 5, _S.binary("*", _S.read(_v60, "r1"), _S.invoke(_S.read(_v60, "ease"), "outCubic", [_S.read(_v60, "k")]))), 0.2, _S.invoke(_S.read(_v60, "Math"), "max", [1, _S.binary("*", _S.read(_v60, "th"), _S.binary("-", 1, _S.read(_v60, "k")))]), _S.binary("-", 1.15, _S.read(_v60, "k")), _S.read(_v60, "C"), _S.function_value(_v60, "_f20"), _S.binary("<", _S.read(_v60, "k"), 0.15)])
	for _v61 in _S.array(_S.read(_e, "halos")):
		var _v62 = _S.scope(_e)
		_S.define(_v62, "h0", _v61)
		var _v63 = _S.scope(_v62)
		_S.define(_v63, "k", _S.binary("/", _S.binary("-", _S.read(_v63, "t"), _S.read(_v63, "h0")), 0.6))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v63, "k"), 0), func(): return _S.binary("<", _S.read(_v63, "k"), 1))):
			_S.call_value(_S.read(_v63, "band"), [_S.read(_v63, "p"), 0, _S.binary("-", _S.unary("-", 2), _S.binary("*", 72, _S.invoke(_S.read(_v63, "ease"), "outQuad", [_S.read(_v63, "k")]))), _S.binary("*", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v63, "widthAt"), [_S.read(_v63, "t")]), 1.45), 4), _S.binary("-", 1, _S.binary("*", 0.4, _S.read(_v63, "k")))), 0.3, 1.5, _S.binary("*", _S.binary("-", 1, _S.read(_v63, "k")), 1.4), _S.read(_v63, "C"), _S.function_value(_v63, "_f21"), _S.binary("<", _S.read(_v63, "k"), 0.12)])
	_S.define(_e, "lit", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "REL"), 0.02), _S.binary("+", _S.read(_e, "REL"), 0.04), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "RET"), 2.5, _S.read(_e, "t")]))))
	_S.call_value(_S.read(_e, "tintActor"), [_S.read(_e, "p"), _S.read(_e, "A"), (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))) else (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "REL"), 0.06))) else _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "REL")), 0.06)), 0.07)]))), [_S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)]])
	_S.call_value(_S.read(_e, "lightActor"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", _S.binary("*", _S.binary("*", 0.1, _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), 0.05, _S.read(_e, "REL")])), _S.binary("-", 1, _S.read(_e, "lit"))), _S.binary("*", 0.06, _S.read(_e, "lit"))), _S.binary("*", 0.6, _S.read(_e, "lit")), _S.read(_e, "t")])
	_S.call_value(_S.read(_e, "haloActor"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.prop(_S.read(_e, "C"), 5), _S.binary("+", _S.binary("*", _S.binary("*", 0.85, _S.read(_e, "lit")), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "RET"), _S.binary("+", _S.read(_e, "GONE"), 0.3), _S.read(_e, "t")]))), _S.binary("*", 0.3, _S.read(_e, "lit"))), _S.read(_e, "t")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v64 = _S.scope(_e)
		_S.define(_v64, "k", _S.call_value(_S.read(_v64, "seg"), [_S.read(_v64, "t"), 0.05, _S.read(_v64, "REL")]))
		_S.define(_v64, "beat", _S.binary("+", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v64, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_v64, "t"), _S.binary("*", _S.read(_v64, "REL"), 0.6)), 2)), 0.001)]))))
		_S.call_value(_S.read(_v64, "sparkle"), [_S.read(_v64, "p"), 0, _S.unary("-", 2), _S.binary("*", _S.binary("+", 1, _S.binary("*", _S.binary("*", 4, _S.read(_v64, "k")), _S.read(_v64, "k"))), _S.read(_v64, "beat")), _S.prop(_S.read(_v64, "C"), 6), _S.prop(_S.read(_v64, "C"), 5), _S.binary("+", 0.3, _S.binary("*", 0.4, _S.read(_v64, "k")))])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "REL"), 0.22))):
			var _v65 = _S.scope(_e)
			_S.define(_v65, "a", _S.binary("/", _S.binary("-", _S.read(_v65, "t"), _S.read(_v65, "REL")), 0.22))
			_S.call_value(_S.read(_v65, "flare"), [_S.read(_v65, "p"), 0, _S.unary("-", 4), _S.binary("*", 28, _S.invoke(_S.read(_v65, "Math"), "pow", [_S.binary("-", 1, _S.read(_v65, "a")), 1.5])), _S.binary("-", 1, _S.read(_v65, "a")), _S.read(_v65, "C")])
			_S.invoke(_S.read(_v65, "p"), "glow", [0, _S.unary("-", 16), 48, _S.read(_v65, "WHITE"), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v65, "a")))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.call_value(_S.read(_e, "drawRush"), [_S.read(_e, "p"), false])
	_S.define(_e, "items", [])
	_S.define(_e, "done", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LANDED")), 0.12))
	for _v66 in _S.array(_S.read(_e, "lets")):
		var _v67 = _S.scope(_e)
		_S.define(_v67, "L", _v66)
		var _v68 = _S.scope(_v67)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v68, "L"), "on"))):
			continue
		_S.define(_v68, "sx", 2)
		_S.define(_v68, "sy", 2)
		_S.define(_v68, "flash", _S.prop(_S.read(_v68, "L"), "flash"))
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v68, "L"), "landed")), func(): return _S.binary(">", _S.prop(_S.read(_v68, "L"), "v"), 150))):
			_S.last([_S.write(_v68, "sx", 1.8, "=", false), _S.write(_v68, "sy", 2.3, "=", false)])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v68, "L"), "sq"), 0)):
			_S.last([_S.write(_v68, "sx", _S.binary("*", 2, _S.binary("+", 1, _S.binary("*", 0.22, _S.prop(_S.read(_v68, "L"), "sq")))), "=", false), _S.write(_v68, "sy", _S.binary("*", 2, _S.binary("-", 1, _S.binary("*", 0.22, _S.prop(_S.read(_v68, "L"), "sq")))), "=", false)])
		_S.define(_v68, "pu", _S.binary("/", _S.binary("-", _S.read(_v68, "t"), _S.prop(_S.read(_v68, "L"), "pop")), 0.07))
		_S.define(_v68, "hop", _S.call_value(_S.read(_v68, "seg"), [_S.read(_v68, "t"), _S.binary("-", _S.prop(_S.read(_v68, "L"), "pop"), 0.1), _S.prop(_S.read(_v68, "L"), "pop")]))
		if _S.truth(_S.binary(">=", _S.read(_v68, "pu"), 1)):
			continue
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v68, "hop"), 0), func(): return _S.binary("<=", _S.read(_v68, "pu"), 0))):
			_S.last([_S.write(_v68, "sx", _S.binary("*", 2, _S.binary("-", 1, _S.binary("*", 0.1, _S.read(_v68, "hop")))), "=", false), _S.write(_v68, "sy", _S.binary("*", 2, _S.binary("+", 1, _S.binary("*", 0.15, _S.read(_v68, "hop")))), "=", false)])
		if _S.truth(_S.binary(">", _S.read(_v68, "pu"), 0)):
			_S.last([_S.write(_v68, "sx", _S.write(_v68, "sy", _S.binary("*", 2, _S.binary("+", 1, _S.binary("*", 0.3, _S.read(_v68, "pu")))), "=", false), "=", false), _S.write(_v68, "flash", 1, "=", false)])
		_S.write(_v68, "flash", _S.invoke(_S.read(_v68, "Math"), "max", [_S.read(_v68, "flash"), (_S.binary("-", 1, _S.read(_v68, "done")) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v68, "done"), 0), func(): return _S.binary("<", _S.read(_v68, "done"), 1))) else 0)]), "=", false)
		_S.define(_v68, "h", _S.binary("*", 7, _S.read(_v68, "sy")))
		_S.define(_v68, "w", _S.binary("*", _S.prop(_S.read(_v68, "L"), "w"), _S.read(_v68, "sx")))
		_S.invoke(_S.read(_v68, "items"), "push", [_S.merge([{"g": _S.prop(_S.read(_v68, "L"), "g")}, {"x": _S.binary("-", _S.prop(_S.read(_v68, "L"), "cx"), _S.binary("/", _S.read(_v68, "w"), 2))}, {"y": _S.binary("-", _S.binary("-", _S.binary("+", _S.read(_v68, "BASE"), _S.prop(_S.read(_v68, "L"), "off")), _S.read(_v68, "h")), _S.binary("*", 3, _S.invoke(_S.read(_v68, "ease"), "outQuad", [_S.read(_v68, "hop")])))}, {"sx": _S.read(_v68, "sx")}, {"sy": _S.read(_v68, "sy")}, {"a": _S.call_value(_S.read(_v68, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v68, "t"), _S.prop(_S.read(_v68, "L"), "born")), 0.05)])}, {"flash": _S.read(_v68, "flash")}])])
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "SHINE"), _S.binary("+", _S.read(_e, "SHINE"), 0.34)]))
	_S.define(_e, "shine", (_S.binary("+", _S.binary("-", _S.read(_e, "X0"), 14), _S.binary("*", _S.binary("+", _S.binary("-", _S.read(_e, "right"), _S.read(_e, "X0")), 30), _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.read(_e, "sh")]))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "sh"), 0), func(): return _S.binary("<", _S.read(_e, "sh"), 1))) else null))
	_S.call_value(_S.read(_e, "drawWord"), [_S.read(_e, "p"), _S.read(_e, "items"), _S.merge([{"fill": [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)]}, {"edge": _S.read(_e, "WHITE")}, {"under": _S.prop(_S.read(_e, "C"), 2)}, {"outline": _S.prop(_S.read(_e, "C"), 0)}, {"shadow": _S.read(_e, "SHADOW")}, {"shine": _S.read(_e, "shine")}, {"shineY": _S.read(_e, "TY")}, {"glint": _S.prop(_S.read(_e, "C"), 6)}])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("!==", _S.read(_e, "shine"), null), func(): return _S.binary(">", _S.read(_e, "shine"), _S.read(_e, "X0"))), func(): return _S.binary("<", _S.read(_e, "shine"), _S.read(_e, "right")))):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.read(_e, "shine"), _S.read(_e, "TY"), _S.binary("+", _S.read(_e, "shine"), 8.4), _S.read(_e, "BASE"), 9, _S.prop(_S.read(_e, "C"), 6), 0.3])
	_S.define(_e, "hold", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0.9, 1.2, _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "EXIT"), _S.binary("+", _S.read(_e, "EXIT"), 0.4), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "hold"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("+", _S.read(_e, "TY"), 7), 50, _S.prop(_S.read(_e, "C"), 5), _S.binary("+", _S.binary("*", 0.22, _S.read(_e, "hold")), (_S.binary("*", 0.3, _S.binary("-", 1, _S.read(_e, "done"))) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "done"), 0), func(): return _S.binary("<", _S.read(_e, "done"), 1))) else 0))])
	for _v69 in _S.array(_S.read(_e, "lets")):
		var _v70 = _S.scope(_e)
		_S.define(_v70, "L", _v69)
		var _v71 = _S.scope(_v70)
		_S.define(_v71, "u", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v71, "t"), _S.prop(_S.read(_v71, "L"), "pop")), 0.07), 0.16))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v71, "u"), 0), func(): return _S.binary("<", _S.read(_v71, "u"), 1))):
			_S.call_value(_S.read(_v71, "sparkle"), [_S.read(_v71, "p"), _S.prop(_S.read(_v71, "L"), "cx"), _S.binary("-", _S.read(_v71, "BASE"), 7), _S.binary("*", _S.binary("*", 6, _S.binary("-", 1, _S.read(_v71, "u"))), _S.binary("-", 1, _S.read(_v71, "u"))), _S.prop(_S.read(_v71, "C"), 6), _S.prop(_S.read(_v71, "C"), 5), 0.5])
	_S.define(_e, "g", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SHINE")), 0.3), 0.26))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "g"), 0), func(): return _S.binary("<", _S.read(_e, "g"), 1))):
		_S.call_value(_S.read(_e, "sparkle"), [_S.read(_e, "p"), _S.binary("-", _S.read(_e, "right"), 2), _S.binary("+", _S.read(_e, "TY"), 1), _S.binary("*", 7, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "g"), _S.prop(_S.read(_e, "Math"), "PI"))])), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), 0.6])
	for _v72 in _S.array(_S.read(_e, "sats")):
		var _v73 = _S.scope(_e)
		_S.define(_v73, "s", _v72)
		var _v74 = _S.scope(_v73)
		_S.define(_v74, "u", _S.binary("/", _S.binary("-", _S.read(_v74, "t"), _S.prop(_S.read(_v74, "s"), "t0")), _S.prop(_S.read(_v74, "s"), "dur")))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v74, "u"), 0), func(): return _S.binary("<", _S.read(_v74, "u"), 1))):
			_S.call_value(_S.read(_v74, "sparkle"), [_S.read(_v74, "p"), _S.prop(_S.read(_v74, "s"), "x"), _S.prop(_S.read(_v74, "s"), "y"), _S.binary("*", _S.prop(_S.read(_v74, "s"), "L"), _S.invoke(_S.read(_v74, "Math"), "pow", [_S.invoke(_S.read(_v74, "Math"), "sin", [_S.binary("*", _S.read(_v74, "u"), _S.prop(_S.read(_v74, "Math"), "PI"))]), 0.7])), _S.prop(_S.read(_v74, "C"), 6), _S.prop(_S.read(_v74, "C"), 5), 0.5])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0)

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"x": _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("/", _S.read(_e, "i"), 8), 0.5), 1.5), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 1]), 0.5), 0.16))}, {"sp": _S.binary("+", 170, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 2]), 170))}, {"per": _S.binary("+", 10, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 3]), 16))}, {"duty": _S.binary("+", 0.3, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 4]), 0.35))}, {"ph": _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 5])}, {"lvl": (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 6]), 0.35)) else 2)}, {"end": _S.binary("+", 0.5, _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), 7]), 0.42))}])

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))) else _S.binary("*", _S.binary("*", 12, _S.binary("+", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "REL"))), 10)])))), _S.binary("-", 1, _S.binary("*", 0.82, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "RET"), 0.12), _S.binary("+", _S.read(_e, "RET"), 0.16), _S.read(_e, "t")])))))
