@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/tesla-coil.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "puff", _S.import_value("fx/lightning/_lib.js", "puff"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "plan", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawCoil", _S.function_value(_e, "_f1"))
	_S.define(_e, "torusMap", _S.function_value(_e, "_f5"))
	_S.define(_e, "drawTorus", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Tesla coil"}, {"desc": "A copper coil under a steel torus throws branching arcs that lash out in volleys and now and then strike the floor in a spray of sparks, lighting the metal and the ground."}, {"tags": ["lightning", "electric", "tesla", "machine", "prop", "loop"]}, {"size": [224, 136]}, {"origin": [112, 120]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"copper": ["#2a120c", "#5a2814", "#8e4a1e", "#c4772f", "#eaa65a", "#ffd9a0"]}, {"steel": ["#0f121c", "#1f2433", "#353d52", "#556078", "#7f8ba3", "#b8c3d6", "#f2f6ff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 72)
	_S.define(_e, "P", _S.binary("/", _S.read(_e, "N"), _S.read(_e, "FPS")))
	_S.define(_e, "TY", _S.unary("-", 57))
	_S.define(_e, "RR", 12)
	_S.define(_e, "TR", 3.6)
	_S.define(_e, "SY", 0.45)
	_S.define(_e, "CTOP", _S.unary("-", 50))
	_S.define(_e, "CBOT", _S.unary("-", 12))
	_S.define(_e, "IRON", _S.invoke(["#120f18", "#1e1a27", "#2c2637", "#3f374d", "#5a5068"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "FL", [1, 0.7, 0.95, 0.55, 0.85, 0.45, 0.7, 0.35])
	_S.define(_e, "ageOf", _S.function_value(_e, "_f11"))
	_S.define(_e, "root", _S.function_value(_e, "_f12"))
	_S.define(_e, "TORUS", null)
	_S.define(_e, "norm", _S.function_value(_e, "_f13"))
	_S.define(_e, "KEY", _S.call_value(_S.read(_e, "norm"), [_S.unary("-", 0.55), 0.75, 0.45]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.read(_e, "seed"), 1]))
	_S.define(_e, "arcs", [])
	_S.define(_e, "strikes", [])
	for _v0 in _S.array([[2, 3], [20, 3], [30, 1], [38, 3], [56, 3], [66, 1]]):
		var _v1 = _S.scope(_e)
		var _v2 = _v0
		_S.define(_v1, "v", _S.prop(_v2, 0))
		_S.define(_v1, "n", _S.prop(_v2, 1))
		var _v3 = _S.scope(_v1)
		_S.define(_v3, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "j"), _S.binary("+", _S.read(_v3, "n"), _S.invoke(_S.read(_v3, "r"), "int", [0, 1])))):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "side", (1 if _S.truth(_S.invoke(_S.read(_v4, "r"), "chance", [0.5])) else _S.unary("-", 1)))
			_S.define(_v4, "front", _S.invoke(_S.read(_v4, "r"), "chance", [0.55]))
			_S.define(_v4, "a", _S.invoke(_S.read(_v4, "r"), "range", [0.15, 1.1]))
			_S.define(_v4, "phi", ((_S.read(_v4, "a") if _S.truth(_S.read(_v4, "front")) else _S.unary("-", _S.read(_v4, "a"))) if _S.truth(_S.binary(">", _S.read(_v4, "side"), 0)) else (_S.binary("-", _S.prop(_S.read(_v4, "Math"), "PI"), _S.read(_v4, "a")) if _S.truth(_S.read(_v4, "front")) else _S.binary("+", _S.prop(_S.read(_v4, "Math"), "PI"), _S.read(_v4, "a")))))
			_S.define(_v4, "th0", _S.invoke(_S.read(_v4, "r"), "range", [_S.unary("-", 1.15), 0.35]))
			_S.invoke(_S.read(_v4, "arcs"), "push", [_S.merge([{"f0": _S.binary("%", _S.binary("+", _S.read(_v4, "v"), _S.binary("*", _S.read(_v4, "j"), _S.invoke(_S.read(_v4, "r"), "int", [2, 4]))), _S.read(_v4, "N"))}, {"len": _S.invoke(_S.read(_v4, "r"), "int", [3, 7])}, {"side": _S.read(_v4, "side")}, {"phi": _S.read(_v4, "phi")}, {"front": _S.read(_v4, "front")}, {"th0": _S.read(_v4, "th0")}, {"th1": _S.binary("+", _S.read(_v4, "th0"), _S.invoke(_S.read(_v4, "r"), "range", [_S.unary("-", 0.6), 0.6]))}, {"L": _S.invoke(_S.read(_v4, "r"), "range", [24, 52])}])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "j", 1, "+=", true)
	for _v5 in _S.array([[14, 1], [47, _S.unary("-", 1)]]):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "f0", _S.prop(_v7, 0))
		_S.define(_v6, "side", _S.prop(_v7, 1))
		_S.invoke(_S.read(_v6, "strikes"), "push", [_S.merge([{"f0": _S.read(_v6, "f0")}, {"side": _S.read(_v6, "side")}, {"x": _S.binary("*", _S.read(_v6, "side"), _S.invoke(_S.read(_v6, "r"), "range", [38, 56]))}, {"phi": (0.4 if _S.truth(_S.binary(">", _S.read(_v6, "side"), 0)) else _S.binary("-", _S.prop(_S.read(_v6, "Math"), "PI"), 0.4))}])])
	return _S.merge([{"arcs": _S.read(_e, "arcs")}, {"strikes": _S.read(_e, "strikes")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "Cu", _S.arg(_args, 1))
	_S.define(_e, "lit", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "n", _S.prop(_S.read(_e, "Cu"), "length"))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 14), _S.unary("-", 8), 14, 0, _S.function_value(_e, "_f2")])
	for _v8 in _S.array([_S.unary("-", 10), 10]):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "rx", _v8)
		_S.last([_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "rx"), _S.unary("-", 4), _S.prop(_S.read(_v9, "IRON"), 4)]), _S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "rx"), _S.unary("-", 3), _S.prop(_S.read(_v9, "IRON"), 0)])])
	_S.define(_e, "turn", _S.function_value(_e, "_f3"))
	_S.call_value(_S.read(_e, "turn"), [_S.unary("-", 10.5), false])
	_S.call_value(_S.read(_e, "turn"), [_S.unary("-", 13.5), false])
	_S.invoke(_S.read(_e, "p"), "shade", [_S.unary("-", 6), _S.read(_e, "CTOP"), 6, _S.read(_e, "CBOT"), _S.function_value(_e, "_f4")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.unary("-", 5), _S.binary("-", _S.read(_e, "CTOP"), 1), 5, _S.binary("-", _S.read(_e, "CTOP"), 1), _S.prop(_S.read(_e, "IRON"), 3)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.unary("-", 4), _S.binary("-", _S.read(_e, "CTOP"), 2), 4, _S.binary("-", _S.read(_e, "CTOP"), 2), _S.prop(_S.read(_e, "IRON"), 2)])
	_S.call_value(_S.read(_e, "turn"), [_S.unary("-", 10.5), true])
	_S.call_value(_S.read(_e, "turn"), [_S.unary("-", 13.5), true])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_e, "x"), _S.unary("-", 13)), func(): return _S.binary(">", _S.read(_e, "x"), 13)), func(): return _S.binary("<", _S.read(_e, "y"), _S.unary("-", 7)))):
		return null
	_S.define(_e, "edge", (2 if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.unary("-", 12))) else (0 if _S.truth(_S.binary(">", _S.read(_e, "x"), 12)) else 1)))
	_S.set_prop(_S.read(_e, "o"), "c", (_S.prop(_S.read(_e, "IRON"), 4) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 6))) else (_S.prop(_S.read(_e, "IRON"), 3) if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 5))) else (_S.prop(_S.read(_e, "IRON"), 0) if _S.truth(_S.binary(">", _S.read(_e, "y"), _S.unary("-", 1))) else _S.prop(_S.read(_e, "IRON"), (2 if _S.truth(_S.binary(">", _S.binary("+", _S.read(_e, "edge"), 1), 2)) else _S.binary("+", _S.read(_e, "edge"), (1 if _S.truth(_S.binary("<", _S.read(_e, "y"), _S.unary("-", 3))) else 0))))))), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "front", _S.arg(_args, 1))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "a", 0)
	while _S.truth(_S.binary("<", _S.read(_v10, "a"), _S.read(_v10, "TAU"))):
		var _v11 = _S.scope(_v10)
		if _S.truth(_S.binary("!==", _S.binary(">=", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), 0), _S.read(_v11, "front"))):
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "a", 0.04, "+=", false)
			continue
		_S.define(_v11, "x", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), 10))
		_S.define(_v11, "yy", _S.binary("+", _S.read(_v11, "y"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), 2.2)))
		_S.define(_v11, "l", _S.binary("+", _S.binary("-", 0.5, _S.binary("*", 0.4, _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]))), (0.25 if _S.truth(_S.read(_v11, "front")) else _S.unary("-", 0.2))))
		_S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "x"), _S.read(_v11, "yy"), _S.prop(_S.read(_v11, "Cu"), _S.call_value(_S.read(_v11, "clamp"), [_S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("*", _S.read(_v11, "l"), _S.binary("-", _S.read(_v11, "n"), 1))]), 0, _S.binary("-", _S.read(_v11, "n"), 1)]))])
		_S.invoke(_S.read(_v11, "p"), "px", [_S.read(_v11, "x"), _S.binary("+", _S.read(_v11, "yy"), 1), _S.prop(_S.read(_v11, "Cu"), _S.call_value(_S.read(_v11, "clamp"), [_S.binary("-", _S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("*", _S.read(_v11, "l"), _S.binary("-", _S.read(_v11, "n"), 1))]), 2), 0, _S.binary("-", _S.read(_v11, "n"), 1)]))])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "a", 0.04, "+=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "x"), _S.unary("-", 5)), func(): return _S.binary(">", _S.read(_e, "x"), 5))):
		return null
	_S.define(_e, "u", _S.binary("/", _S.binary("+", _S.read(_e, "x"), 5.5), 11))
	_S.define(_e, "nx", _S.binary("-", _S.binary("*", _S.read(_e, "u"), 2), 1))
	_S.define(_e, "wire", _S.binary("===", _S.binary("&", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]), 1), 0))
	_S.define(_e, "l", _S.binary("+", _S.binary("-", _S.binary("-", 0.62, _S.binary("*", 0.55, _S.read(_e, "nx"))), _S.binary("*", _S.binary("*", 0.35, _S.read(_e, "nx")), _S.read(_e, "nx"))), (0.3 if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.read(_e, "nx"), 0.35)]), 0.12)) else 0)))
	if _S.truth(_S.unary("!", _S.read(_e, "wire"))):
		_S.write(_e, "l", 0.32, "-=", false)
	_S.set_prop(_S.read(_e, "o"), "c", _S.prop(_S.read(_e, "Cu"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "l"), _S.binary("-", _S.read(_e, "n"), 1))]), 0, _S.binary("-", _S.read(_e, "n"), 1)])), "=", false)
	if _S.truth(_S.logical("&&", _S.read(_e, "wire"), func(): return _S.logical("||", _S.logical("&&", _S.binary("<", _S.read(_e, "nx"), _S.unary("-", 0.75)), func(): return _S.binary(">", _S.prop(_S.read(_e, "lit"), 0), 0.25)), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "nx"), 0.75), func(): return _S.binary(">", _S.prop(_S.read(_e, "lit"), 1), 0.25))))):
		_S.set_prop(_S.read(_e, "o"), "c", ((_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "lit"), 0), 0.6)) else _S.prop(_S.read(_e, "C"), 4)) if _S.truth(_S.binary("<", _S.read(_e, "nx"), 0)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "lit"), 1), 0.6)) else _S.prop(_S.read(_e, "C"), 4))), "=", false)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	if _S.truth(_S.read(_e, "TORUS")):
		return _S.read(_e, "TORUS")
	_S.define(_e, "sa", _S.read(_e, "SY"))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "SY"), _S.read(_e, "SY")))]))
	_S.define(_e, "X0", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "RR"), _S.read(_e, "TR"))])), 1))
	_S.define(_e, "Y0", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_e, "TY"), _S.binary("*", _S.read(_e, "RR"), _S.read(_e, "SY"))), _S.read(_e, "TR"))]), 2))
	_S.define(_e, "W", _S.binary("+", _S.binary("*", 2, _S.unary("-", _S.read(_e, "X0"))), 2))
	_S.define(_e, "H", _S.binary("-", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_e, "TY"), _S.binary("*", _S.read(_e, "RR"), _S.read(_e, "SY"))), _S.read(_e, "TR"))]), 3), _S.read(_e, "Y0")))
	_S.define(_e, "z", _S.invoke(_S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]), "fill", [_S.unary("-", 1000000000)]))
	_S.define(_e, "n", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")), 3)]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 480)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "phi", _S.binary("*", _S.binary("/", _S.read(_v13, "i"), 480), _S.read(_v13, "TAU")))
		_S.define(_v13, "cp", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "phi")]))
		_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "phi")]))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "j"), 96)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "psi", _S.binary("*", _S.binary("/", _S.read(_v15, "j"), 96), _S.read(_v15, "TAU")))
			_S.define(_v15, "cs", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "psi")]))
			_S.define(_v15, "ss", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "psi")]))
			_S.define(_v15, "rr", _S.binary("+", _S.read(_v15, "RR"), _S.binary("*", _S.read(_v15, "TR"), _S.read(_v15, "cs"))))
			_S.define(_v15, "X", _S.binary("*", _S.read(_v15, "rr"), _S.read(_v15, "cp")))
			_S.define(_v15, "Y", _S.binary("*", _S.read(_v15, "TR"), _S.read(_v15, "ss")))
			_S.define(_v15, "Z", _S.binary("*", _S.read(_v15, "rr"), _S.read(_v15, "sp")))
			_S.define(_v15, "px", _S.binary("-", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.read(_v15, "X")]), _S.read(_v15, "X0")))
			_S.define(_v15, "py", _S.binary("-", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("+", _S.binary("-", _S.read(_v15, "TY"), _S.binary("*", _S.read(_v15, "Y"), _S.read(_v15, "ca"))), _S.binary("*", _S.read(_v15, "Z"), _S.read(_v15, "sa")))]), _S.read(_v15, "Y0")))
			_S.define(_v15, "d", _S.binary("+", _S.binary("*", _S.read(_v15, "Z"), _S.read(_v15, "ca")), _S.binary("*", _S.read(_v15, "Y"), _S.read(_v15, "sa"))))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v15, "px"), 0), func(): return _S.binary("<", _S.read(_v15, "py"), 0)), func(): return _S.binary(">=", _S.read(_v15, "px"), _S.read(_v15, "W"))), func(): return _S.binary(">=", _S.read(_v15, "py"), _S.read(_v15, "H")))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "j", 1, "+=", true)
				continue
			_S.define(_v15, "k", _S.binary("+", _S.binary("*", _S.read(_v15, "py"), _S.read(_v15, "W")), _S.read(_v15, "px")))
			if _S.truth(_S.binary(">", _S.read(_v15, "d"), _S.prop(_S.read(_v15, "z"), _S.read(_v15, "k")))):
				_S.last([_S.set_prop(_S.read(_v15, "z"), _S.read(_v15, "k"), _S.read(_v15, "d"), "=", false), _S.set_prop(_S.read(_v15, "n"), _S.binary("*", _S.read(_v15, "k"), 3), _S.binary("*", _S.read(_v15, "cs"), _S.read(_v15, "cp")), "=", false), _S.set_prop(_S.read(_v15, "n"), _S.binary("+", _S.binary("*", _S.read(_v15, "k"), 3), 1), _S.read(_v15, "ss"), "=", false), _S.set_prop(_S.read(_v15, "n"), _S.binary("+", _S.binary("*", _S.read(_v15, "k"), 3), 2), _S.binary("*", _S.read(_v15, "cs"), _S.read(_v15, "sp")), "=", false)])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "j", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	return _S.write(_e, "TORUS", _S.merge([{"X0": _S.read(_e, "X0")}, {"Y0": _S.read(_e, "Y0")}, {"W": _S.read(_e, "W")}, {"H": _S.read(_e, "H")}, {"z": _S.read(_e, "z")}, {"n": _S.read(_e, "n")}, {"ca": _S.read(_e, "ca")}, {"sa": _S.read(_e, "sa")}]), "=", false)

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "St", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "lit", _S.arg(_args, 3))
	_S.define(_e, "T", _S.call_value(_S.read(_e, "torusMap"), []))
	_S.define(_e, "m", _S.prop(_S.read(_e, "St"), "length"))
	_S.define(_e, "HALF", _S.call_value(_S.read(_e, "norm"), [_S.prop(_S.read(_e, "KEY"), 0), _S.binary("+", _S.prop(_S.read(_e, "KEY"), 1), _S.prop(_S.read(_e, "T"), "sa")), _S.binary("+", _S.prop(_S.read(_e, "KEY"), 2), _S.prop(_S.read(_e, "T"), "ca"))]))
	_S.define(_e, "on", _S.function_value(_e, "_f7"))
	var _v16 = _S.scope(_e)
	_S.define(_v16, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "y"), _S.prop(_S.read(_v16, "T"), "H"))):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "x"), _S.prop(_S.read(_v17, "T"), "W"))):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "k", _S.binary("+", _S.binary("*", _S.read(_v18, "y"), _S.prop(_S.read(_v18, "T"), "W")), _S.read(_v18, "x")))
			if _S.truth(_S.binary("<", _S.prop(_S.prop(_S.read(_v18, "T"), "z"), _S.read(_v18, "k")), _S.unary("-", 100000000))):
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "x", 1, "+=", true)
				continue
			_S.define(_v18, "nx", _S.prop(_S.prop(_S.read(_v18, "T"), "n"), _S.binary("*", _S.read(_v18, "k"), 3)))
			_S.define(_v18, "ny", _S.prop(_S.prop(_S.read(_v18, "T"), "n"), _S.binary("+", _S.binary("*", _S.read(_v18, "k"), 3), 1)))
			_S.define(_v18, "nz", _S.prop(_S.prop(_S.read(_v18, "T"), "n"), _S.binary("+", _S.binary("*", _S.read(_v18, "k"), 3), 2)))
			_S.define(_v18, "dif", _S.invoke(_S.read(_v18, "Math"), "max", [0, _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v18, "nx"), _S.prop(_S.read(_v18, "KEY"), 0)), _S.binary("*", _S.read(_v18, "ny"), _S.prop(_S.read(_v18, "KEY"), 1))), _S.binary("*", _S.read(_v18, "nz"), _S.prop(_S.read(_v18, "KEY"), 2)))]))
			_S.define(_v18, "spec", _S.invoke(_S.read(_v18, "Math"), "pow", [_S.invoke(_S.read(_v18, "Math"), "max", [0, _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v18, "nx"), _S.prop(_S.read(_v18, "HALF"), 0)), _S.binary("*", _S.read(_v18, "ny"), _S.prop(_S.read(_v18, "HALF"), 1))), _S.binary("*", _S.read(_v18, "nz"), _S.prop(_S.read(_v18, "HALF"), 2)))]), 28]))
			_S.define(_v18, "inner", (0.75 if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v18, "nx"), _S.binary("+", _S.binary("+", _S.read(_v18, "x"), _S.prop(_S.read(_v18, "T"), "X0")), 0.5)), _S.binary("*", _S.read(_v18, "nz"), 0)), 0), func(): return _S.binary("<", _S.invoke(_S.read(_v18, "Math"), "abs", [_S.binary("+", _S.binary("+", _S.read(_v18, "x"), _S.prop(_S.read(_v18, "T"), "X0")), 0.5)]), _S.read(_v18, "RR")))) else 1))
			_S.define(_v18, "c", (_S.prop(_S.read(_v18, "St"), _S.binary("-", _S.read(_v18, "m"), 1)) if _S.truth(_S.binary(">", _S.read(_v18, "spec"), 0.55)) else _S.prop(_S.read(_v18, "St"), _S.call_value(_S.read(_v18, "clamp"), [_S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.binary("+", _S.binary("+", 0.12, _S.binary("*", _S.binary("*", 0.8, _S.read(_v18, "dif")), _S.read(_v18, "inner"))), _S.read(_v18, "spec")), _S.binary("-", _S.read(_v18, "m"), 1.01))]), 0, _S.binary("-", _S.read(_v18, "m"), 2)]))))
			for _v19 in _S.array([[_S.unary("-", 1), _S.prop(_S.read(_v18, "lit"), 0)], [1, _S.prop(_S.read(_v18, "lit"), 1)]]):
				var _v20 = _S.scope(_v18)
				var _v21 = _v19
				_S.define(_v20, "s", _S.prop(_v21, 0))
				_S.define(_v20, "l", _S.prop(_v21, 1))
				var _v22 = _S.scope(_v20)
				_S.define(_v22, "r", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "max", [0, _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v22, "s"), _S.read(_v22, "nx")), 0.85), _S.binary("*", _S.read(_v22, "ny"), 0.25)), _S.binary("*", _S.read(_v22, "nz"), 0.45))]), _S.invoke(_S.read(_v22, "Math"), "min", [1, _S.read(_v22, "l")])))
				if _S.truth(_S.binary(">", _S.read(_v22, "r"), 0.88)):
					_S.write(_v22, "c", _S.prop(_S.read(_v22, "C"), 6), "=", false)
				else:
					if _S.truth(_S.binary(">", _S.read(_v22, "r"), 0.62)):
						_S.write(_v22, "c", _S.call_value(_S.read(_v22, "mix"), [_S.read(_v22, "c"), _S.prop(_S.read(_v22, "C"), 5), 0.6]), "=", false)
					else:
						if _S.truth(_S.binary(">", _S.read(_v22, "r"), 0.38)):
							_S.write(_v22, "c", _S.call_value(_S.read(_v22, "mix"), [_S.read(_v22, "c"), _S.prop(_S.read(_v22, "C"), 4), 0.3]), "=", false)
			if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_v18, "on"), [_S.read(_v18, "x"), _S.binary("+", _S.read(_v18, "y"), 1)])), func(): return _S.binary("<", _S.read(_v18, "ny"), 0.3))):
				_S.write(_v18, "c", _S.prop(_S.read(_v18, "St"), 0), "=", false)
			_S.invoke(_S.read(_v18, "p"), "px", [_S.binary("+", _S.read(_v18, "x"), _S.prop(_S.read(_v18, "T"), "X0")), _S.binary("+", _S.read(_v18, "y"), _S.prop(_S.read(_v18, "T"), "Y0")), _S.read(_v18, "c")])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "x", 1, "+=", true)
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "y", 1, "+=", true)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "T"), "W"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "T"), "H"))), func(): return _S.binary(">", _S.prop(_S.prop(_S.read(_e, "T"), "z"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "T"), "W")), _S.read(_e, "x"))), _S.unary("-", 100000000)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "Cu", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "copper"), 6]))
	_S.define(_e, "St", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "steel"), 7]))
	_S.define(_e, "S", _S.invoke(_S.prop(_S.read(_e, "o"), "sparks"), "map", [_S.read(_e, "hex")]))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "N")))
	var _v23 = _S.call_value(_S.read(_e, "plan"), [_S.prop(_S.read(_e, "o"), "seed")])
	_S.define(_e, "arcs", _S.prop(_v23, "arcs"))
	_S.define(_e, "strikes", _S.prop(_v23, "strikes"))
	_S.define(_e, "lit", [0, 0])
	_S.define(_e, "live", _S.invoke(_S.read(_e, "arcs"), "filter", [_S.function_value(_e, "_f9")]))
	for _v24 in _S.array(_S.read(_e, "live")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "a", _v24)
		_S.set_prop(_S.read(_v25, "lit"), (1 if _S.truth(_S.binary(">", _S.prop(_S.read(_v25, "a"), "side"), 0)) else 0), _S.binary("*", _S.prop(_S.read(_v25, "FL"), _S.call_value(_S.read(_v25, "ageOf"), [_S.read(_v25, "f"), _S.prop(_S.read(_v25, "a"), "f0")])), 0.6), "+=", false)
	for _v26 in _S.array(_S.read(_e, "strikes")):
		var _v27 = _S.scope(_e)
		_S.define(_v27, "s", _v26)
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "a", _S.call_value(_S.read(_v28, "ageOf"), [_S.read(_v28, "f"), _S.prop(_S.read(_v28, "s"), "f0")]))
		if _S.truth(_S.binary("<", _S.read(_v28, "a"), 6)):
			_S.set_prop(_S.read(_v28, "lit"), (1 if _S.truth(_S.binary(">", _S.prop(_S.read(_v28, "s"), "side"), 0)) else 0), 1, "+=", false)
	_S.define(_e, "act", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.binary("+", _S.prop(_S.read(_e, "lit"), 0), _S.prop(_S.read(_e, "lit"), 1)), 0.5)]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 10), 58, _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.14, _S.binary("*", 0.25, _S.read(_e, "act")))])
	_S.invoke(_S.read(_e, "p"), "ellipse", [0, 0.5, 15, 1.6, _S.prop(_S.read(_e, "IRON"), 0)])
	for _v29 in _S.array(_S.read(_e, "strikes")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "s", _v29)
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v31, "t"), _S.binary("/", _S.prop(_S.read(_v31, "s"), "f0"), _S.read(_v31, "FPS"))), _S.read(_v31, "P")), _S.read(_v31, "P")), _S.read(_v31, "P")))
		_S.call_value(_S.read(_v31, "scorch"), [_S.read(_v31, "p"), _S.prop(_S.read(_v31, "s"), "x"), 0, 7, _S.invoke(_S.read(_v31, "Math"), "pow", [_S.call_value(_S.read(_v31, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.read(_v31, "age"), 1.1))]), 1.3]), _S.binary("-", 1, _S.call_value(_S.read(_v31, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v31, "age"), 1.4), 0.6)]))])
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "j"), 2)):
			var _v33 = _S.scope(_v32)
			_S.define(_v33, "u", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v33, "age"), 0.12), _S.binary("*", _S.read(_v33, "j"), 0.18)), 1.2))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v33, "u"), 0), func(): return _S.binary("<", _S.read(_v33, "u"), 1))):
				_S.call_value(_S.read(_v33, "puff"), [_S.read(_v33, "p"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v33, "s"), "x"), (3 if _S.truth(_S.read(_v33, "j")) else _S.unary("-", 2))), _S.binary("*", _S.binary("*", _S.read(_v33, "u"), 5), _S.prop(_S.read(_v33, "s"), "side"))), _S.binary("-", _S.binary("-", _S.unary("-", 3), _S.binary("*", _S.read(_v33, "u"), 16)), _S.binary("*", _S.read(_v33, "j"), 2)), _S.binary("+", 2.6, _S.read(_v33, "j")), _S.read(_v33, "u"), _S.call_value(_S.read(_v33, "mix"), [_S.read(_v33, "ASH"), _S.prop(_S.read(_v33, "C"), 2), 0.3])])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "j", 1, "+=", true)
	_S.define(_e, "drawArc", _S.function_value(_e, "_f10"))
	for _v35 in _S.array(_S.read(_e, "live")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "a", _v35)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v36, "a"), "front"))):
			_S.call_value(_S.read(_v36, "drawArc"), [_S.read(_v36, "a")])
	_S.call_value(_S.read(_e, "drawCoil"), [_S.read(_e, "p"), _S.read(_e, "Cu"), _S.read(_e, "lit"), _S.read(_e, "C")])
	_S.call_value(_S.read(_e, "drawTorus"), [_S.read(_e, "p"), _S.read(_e, "St"), _S.read(_e, "C"), _S.read(_e, "lit")])
	_S.define(_e, "rc", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 9, _S.read(_e, "f")]))
	var _v37 = _S.scope(_e)
	_S.define(_v37, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v37, "i"), 6)):
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "phi", _S.invoke(_S.read(_v38, "rc"), "range", [0, _S.read(_v38, "TAU")]))
		_S.define(_v38, "d", _S.invoke(_S.read(_v38, "rc"), "range", [1, 3]))
		_S.define(_v38, "x", _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "phi")]), _S.binary("+", _S.binary("+", _S.read(_v38, "RR"), _S.read(_v38, "TR")), _S.read(_v38, "d"))))
		_S.define(_v38, "y", _S.binary("+", _S.read(_v38, "TY"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "phi")]), _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v38, "RR"), _S.read(_v38, "SY")), _S.read(_v38, "TR")), _S.binary("*", _S.read(_v38, "d"), 0.7)))))
		_S.invoke(_S.read(_v38, "p"), "px", [_S.read(_v38, "x"), _S.read(_v38, "y"), (_S.prop(_S.read(_v38, "C"), 5) if _S.truth(_S.invoke(_S.read(_v38, "rc"), "chance", [0.3])) else _S.prop(_S.read(_v38, "C"), 3))])
		if _S.truth(_S.invoke(_S.read(_v38, "rc"), "chance", [0.4])):
			_S.invoke(_S.read(_v38, "p"), "px", [_S.binary("+", _S.read(_v38, "x"), _S.invoke(_S.read(_v38, "Math"), "cos", [_S.read(_v38, "phi")])), _S.binary("+", _S.read(_v38, "y"), _S.binary("*", _S.invoke(_S.read(_v38, "Math"), "sin", [_S.read(_v38, "phi")]), 0.6)), _S.prop(_S.read(_v38, "C"), 2)])
		_S.invoke(_S.read(_v38, "p"), "glow", [_S.read(_v38, "x"), _S.read(_v38, "y"), 4, _S.prop(_S.read(_v38, "C"), 3), 0.3])
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "i", 1, "+=", true)
	var _v39 = _S.scope(_e)
	_S.define(_v39, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v39, "i"), 2)):
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "phi", _S.invoke(_S.read(_v40, "rc"), "range", [0, _S.read(_v40, "TAU")]))
		_S.define(_v40, "x0", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "phi")]), _S.binary("+", _S.read(_v40, "RR"), _S.binary("*", _S.read(_v40, "TR"), 0.8))))
		_S.define(_v40, "y0", _S.binary("+", _S.read(_v40, "TY"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "phi")]), _S.binary("+", _S.binary("*", _S.read(_v40, "RR"), _S.read(_v40, "SY")), _S.binary("*", _S.read(_v40, "TR"), 0.6)))))
		_S.define(_v40, "a", _S.binary("+", _S.invoke(_S.read(_v40, "Math"), "atan2", [_S.binary("-", _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "phi")]), 0.6), 0.5), _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "phi")])]), _S.invoke(_S.read(_v40, "rc"), "range", [_S.unary("-", 0.5), 0.5])))
		_S.define(_v40, "l", _S.invoke(_S.read(_v40, "rc"), "range", [4, 10]))
		_S.call_value(_S.read(_v40, "crackle"), [_S.read(_v40, "p"), _S.call_value(_S.read(_v40, "zigzag"), [_S.read(_v40, "rc"), _S.read(_v40, "x0"), _S.read(_v40, "y0"), _S.binary("+", _S.read(_v40, "x0"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "cos", [_S.read(_v40, "a")]), _S.read(_v40, "l"))), _S.binary("+", _S.read(_v40, "y0"), _S.binary("*", _S.invoke(_S.read(_v40, "Math"), "sin", [_S.read(_v40, "a")]), _S.read(_v40, "l"))), 0.4, 0.4]), _S.invoke(_S.read(_v40, "rc"), "range", [0.35, 0.65]), _S.read(_v40, "C"), 0.3])
		_v39 = _S.iteration(_v39)
		_S.write(_v39, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "TY"), 34, _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.18, _S.binary("*", 0.3, _S.read(_e, "act")))])
	for _v41 in _S.array(_S.read(_e, "live")):
		var _v42 = _S.scope(_e)
		_S.define(_v42, "a", _v41)
		if _S.truth(_S.prop(_S.read(_v42, "a"), "front")):
			_S.call_value(_S.read(_v42, "drawArc"), [_S.read(_v42, "a")])
	for _v43 in _S.array(_S.read(_e, "strikes")):
		var _v44 = _S.scope(_e)
		_S.define(_v44, "s", _v43)
		var _v45 = _S.scope(_v44)
		_S.define(_v45, "age", _S.call_value(_S.read(_v45, "ageOf"), [_S.read(_v45, "f"), _S.prop(_S.read(_v45, "s"), "f0")]))
		if _S.truth(_S.binary("<", _S.read(_v45, "age"), 6)):
			var _v46 = _S.scope(_v45)
			_S.define(_v46, "k", _S.prop([1, 0.75, 1, 0.6, 0.85, 0.4], _S.read(_v46, "age")))
			var _v47 = _S.call_value(_S.read(_v46, "root"), [_S.prop(_S.read(_v46, "s"), "phi"), _S.unary("-", 2)])
			_S.define(_v46, "x0", _S.prop(_v47, 0))
			_S.define(_v46, "y0", _S.prop(_v47, 1))
			_S.define(_v46, "r", _S.call_value(_S.read(_v46, "rng"), [_S.prop(_S.read(_v46, "o"), "seed"), 41, _S.prop(_S.read(_v46, "s"), "f0"), _S.read(_v46, "f")]))
			_S.call_value(_S.read(_v46, "stroke"), [_S.read(_v46, "p"), _S.call_value(_S.read(_v46, "zigzag"), [_S.read(_v46, "r"), _S.read(_v46, "x0"), _S.read(_v46, "y0"), _S.prop(_S.read(_v46, "s"), "x"), 0, 0.22, 0.55]), _S.read(_v46, "k"), _S.read(_v46, "C"), (0.95 if _S.truth(_S.binary("===", _S.read(_v46, "age"), 0)) else 0.8), _S.merge([{"hero": _S.binary("===", _S.read(_v46, "age"), 0)}])])
			_S.invoke(_S.read(_v46, "p"), "circle", [_S.prop(_S.read(_v46, "s"), "x"), _S.unary("-", 1), _S.binary("+", _S.binary("*", 3, _S.read(_v46, "k")), 1.5), _S.prop(_S.read(_v46, "C"), 2)])
			_S.invoke(_S.read(_v46, "p"), "circle", [_S.prop(_S.read(_v46, "s"), "x"), _S.unary("-", 1), _S.binary("+", _S.binary("*", 3, _S.read(_v46, "k")), 0.5), _S.prop(_S.read(_v46, "C"), 5)])
			_S.invoke(_S.read(_v46, "p"), "circle", [_S.prop(_S.read(_v46, "s"), "x"), _S.unary("-", 1), _S.binary("*", 2, _S.read(_v46, "k")), _S.read(_v46, "WHITE")])
			_S.invoke(_S.read(_v46, "p"), "glow", [_S.prop(_S.read(_v46, "s"), "x"), _S.unary("-", 10), 40, _S.prop(_S.read(_v46, "C"), 4), _S.binary("*", 0.55, _S.read(_v46, "k"))])
			_S.invoke(_S.read(_v46, "p"), "glow", [_S.prop(_S.read(_v46, "s"), "x"), _S.unary("-", 3), 12, _S.prop(_S.read(_v46, "C"), 6), _S.binary("*", 0.5, _S.read(_v46, "k"))])
			if _S.truth(_S.binary("<", _S.read(_v46, "age"), 2)):
				_S.invoke(_S.read(_v46, "p"), "glow", [0, _S.unary("-", 50), 120, _S.prop(_S.read(_v46, "C"), 3), _S.binary("*", 0.25, _S.read(_v46, "k"))])
		_S.define(_v45, "st", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v45, "t"), _S.binary("/", _S.prop(_S.read(_v45, "s"), "f0"), _S.read(_v45, "FPS"))), _S.read(_v45, "P")), _S.read(_v45, "P")), _S.read(_v45, "P")))
		var _v48 = _S.scope(_v45)
		_S.define(_v48, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v48, "j"), 18)):
			var _v49 = _S.scope(_v48)
			_S.define(_v49, "r", _S.call_value(_S.read(_v49, "rng"), [_S.prop(_S.read(_v49, "o"), "seed"), 51, _S.prop(_S.read(_v49, "s"), "f0"), _S.read(_v49, "j")]))
			_S.define(_v49, "life", _S.invoke(_S.read(_v49, "r"), "range", [0.3, 0.65]))
			if _S.truth(_S.binary(">=", _S.read(_v49, "st"), _S.read(_v49, "life"))):
				_v48 = _S.iteration(_v48)
				_S.write(_v48, "j", 1, "+=", true)
				continue
			_S.define(_v49, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v49, "Math"), "PI")), 2), _S.invoke(_S.read(_v49, "r"), "range", [_S.unary("-", 1.3), 1.3])))
			_S.define(_v49, "sp", _S.invoke(_S.read(_v49, "r"), "range", [50, 190]))
			var _v50 = _S.call_value(_S.read(_v49, "flight"), [_S.prop(_S.read(_v49, "s"), "x"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "a")]), _S.read(_v49, "sp")), _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "sin", [_S.read(_v49, "a")]), _S.read(_v49, "sp")), _S.read(_v49, "st"), _S.merge([{"floor": 0}])])
			_S.define(_v49, "x", _S.prop(_v50, 0))
			_S.define(_v49, "y", _S.prop(_v50, 1))
			_S.define(_v49, "vx", _S.prop(_v50, 2))
			_S.define(_v49, "vy", _S.prop(_v50, 3))
			_S.call_value(_S.read(_v49, "spark"), [_S.read(_v49, "p"), _S.read(_v49, "x"), _S.read(_v49, "y"), _S.read(_v49, "vx"), _S.read(_v49, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v49, "st"), _S.read(_v49, "life"))), _S.read(_v49, "S")])
			_v48 = _S.iteration(_v48)
			_S.write(_v48, "j", 1, "+=", true)
	for _v51 in _S.array(_S.read(_e, "arcs")):
		var _v52 = _S.scope(_e)
		_S.define(_v52, "a", _v51)
		var _v53 = _S.scope(_v52)
		_S.define(_v53, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v53, "t"), _S.binary("/", _S.prop(_S.read(_v53, "a"), "f0"), _S.read(_v53, "FPS"))), _S.read(_v53, "P")), _S.read(_v53, "P")), _S.read(_v53, "P")))
		_S.define(_v53, "ang", (_S.prop(_S.read(_v53, "a"), "th0") if _S.truth(_S.binary(">", _S.prop(_S.read(_v53, "a"), "side"), 0)) else _S.binary("-", _S.prop(_S.read(_v53, "Math"), "PI"), _S.prop(_S.read(_v53, "a"), "th0"))))
		var _v54 = _S.call_value(_S.read(_v53, "root"), [_S.prop(_S.read(_v53, "a"), "phi")])
		_S.define(_v53, "x0", _S.prop(_v54, 0))
		_S.define(_v53, "y0", _S.prop(_v54, 1))
		var _v55 = _S.scope(_v53)
		_S.define(_v55, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v55, "j"), 3)):
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "r", _S.call_value(_S.read(_v56, "rng"), [_S.prop(_S.read(_v56, "o"), "seed"), 61, _S.prop(_S.read(_v56, "a"), "f0"), _S.read(_v56, "j")]))
			_S.define(_v56, "life", _S.invoke(_S.read(_v56, "r"), "range", [0.15, 0.35]))
			if _S.truth(_S.binary(">=", _S.read(_v56, "age"), _S.read(_v56, "life"))):
				_v55 = _S.iteration(_v55)
				_S.write(_v55, "j", 1, "+=", true)
				continue
			_S.define(_v56, "tx", _S.binary("+", _S.read(_v56, "x0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "cos", [_S.read(_v56, "ang")]), _S.prop(_S.read(_v56, "a"), "L")), 0.75)))
			_S.define(_v56, "ty", _S.binary("+", _S.read(_v56, "y0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "sin", [_S.read(_v56, "ang")]), _S.prop(_S.read(_v56, "a"), "L")), 0.75)))
			_S.define(_v56, "b", _S.binary("+", _S.read(_v56, "ang"), _S.invoke(_S.read(_v56, "r"), "range", [_S.unary("-", 0.9), 0.9])))
			_S.define(_v56, "sp", _S.invoke(_S.read(_v56, "r"), "range", [50, 150]))
			var _v57 = _S.call_value(_S.read(_v56, "flight"), [_S.read(_v56, "tx"), _S.read(_v56, "ty"), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "cos", [_S.read(_v56, "b")]), _S.read(_v56, "sp")), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "sin", [_S.read(_v56, "b")]), _S.read(_v56, "sp")), _S.read(_v56, "age"), _S.merge([{"floor": 0}])])
			_S.define(_v56, "x", _S.prop(_v57, 0))
			_S.define(_v56, "y", _S.prop(_v57, 1))
			_S.define(_v56, "vx", _S.prop(_v57, 2))
			_S.define(_v56, "vy", _S.prop(_v57, 3))
			_S.call_value(_S.read(_v56, "spark"), [_S.read(_v56, "p"), _S.read(_v56, "x"), _S.read(_v56, "y"), _S.read(_v56, "vx"), _S.read(_v56, "vy"), _S.binary("-", 1, _S.binary("/", _S.read(_v56, "age"), _S.read(_v56, "life"))), _S.read(_v56, "S")])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "j", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("<", _S.call_value(_S.read(_e, "ageOf"), [_S.read(_e, "f"), _S.prop(_S.read(_e, "a"), "f0")]), _S.prop(_S.read(_e, "a"), "len"))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "age", _S.call_value(_S.read(_e, "ageOf"), [_S.read(_e, "f"), _S.prop(_S.read(_e, "a"), "f0")]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.invoke(_S.read(_e, "Math"), "max", [1, _S.binary("-", _S.prop(_S.read(_e, "a"), "len"), 1)])))
	_S.define(_e, "th", _S.binary("+", _S.prop(_S.read(_e, "a"), "th0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "a"), "th1"), _S.prop(_S.read(_e, "a"), "th0")), _S.invoke(_S.read(_e, "ease"), "outQuad", [_S.read(_e, "u")]))))
	_S.define(_e, "ang", (_S.read(_e, "th") if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "a"), "side"), 0)) else _S.binary("-", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "th"))))
	var _v34 = _S.call_value(_S.read(_e, "root"), [_S.prop(_S.read(_e, "a"), "phi")])
	_S.define(_e, "x0", _S.prop(_v34, 0))
	_S.define(_e, "y0", _S.prop(_v34, 1))
	_S.define(_e, "L", _S.binary("*", _S.prop(_S.read(_e, "a"), "L"), (0.75 if _S.truth(_S.binary("===", _S.read(_e, "age"), 0)) else 1)))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rng"), [_S.prop(_S.read(_e, "o"), "seed"), 21, _S.prop(_S.read(_e, "a"), "f0"), _S.read(_e, "f")]))
	_S.call_value(_S.read(_e, "stroke"), [_S.read(_e, "p"), _S.call_value(_S.read(_e, "zigzag"), [_S.read(_e, "r"), _S.read(_e, "x0"), _S.read(_e, "y0"), _S.binary("+", _S.read(_e, "x0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "L"))), _S.binary("+", _S.read(_e, "y0"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")]), _S.read(_e, "L"))), 0.32, 0.75]), _S.prop(_S.read(_e, "FL"), _S.read(_e, "age")), _S.read(_e, "C"), 0.6, _S.merge([{"light": 0.4}])])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x0"), _S.read(_e, "y0"), 10, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.5, _S.prop(_S.read(_e, "FL"), _S.read(_e, "age")))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "f", _S.arg(_args, 0))
	_S.define(_e, "f0", _S.arg(_args, 1))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "f"), _S.read(_e, "f0")), _S.read(_e, "N")), _S.read(_e, "N")), _S.read(_e, "N"))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "phi", _S.arg(_args, 0))
	_S.define(_e, "up", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "phi")]), _S.binary("+", _S.read(_e, "RR"), _S.binary("*", _S.read(_e, "TR"), 0.6))), _S.binary("-", _S.binary("+", _S.read(_e, "TY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "phi")]), _S.read(_e, "RR")), _S.read(_e, "SY"))), _S.read(_e, "up"))]

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "z", _S.arg(_args, 2))
	_S.define(_e, "l", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "z")]))
	return [_S.binary("/", _S.read(_e, "x"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "y"), _S.read(_e, "l")), _S.binary("/", _S.read(_e, "z"), _S.read(_e, "l"))]
