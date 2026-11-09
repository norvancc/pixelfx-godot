@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/smoke-bomb.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "lobe", _S.import_value("fx/explosions/_lib.js", "lobe"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "fadeEdges", _S.import_value("fx/explosions/_lib.js", "fadeEdges"))
	_S.define(_e, "pool", _S.import_value("fx/explosions/_lib.js", "pool"))
	_S.define(_e, "OUTLINE", _S.import_value("fx/explosions/_lib.js", "OUTLINE"))
	_S.define(_e, "step", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "drawCanister", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Smoke bomb"}, {"desc": "A round canister clinks down, fuse sparking, and pops: thick grey-violet smoke gushes out, rolls along the floor, billows into a cloud that hides all, then thins to wisps."}, {"tags": ["smoke", "smoke-bomb", "ninja", "vanish", "escape", "ground", "one-shot"]}, {"size": [260, 176]}, {"origin": [130, 156]}, {"duration": 5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e0b14", "#1e1828", "#30283e", "#463c58", "#62567a", "#867a9e", "#aea4c4"]}, {"canister": ["#16121e", "#2a2434", "#443c52", "#686078", "#9c94ac"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POP", 0.95)
	_S.define(_e, "R0", 4)
	_S.define(_e, "BAND", [_S.call_value(_S.read(_e, "hex"), ["#3a1418"]), _S.call_value(_S.read(_e, "hex"), ["#7a2a24"]), _S.call_value(_S.read(_e, "hex"), ["#b84a34"])])
	_S.define(_e, "GRIT", [_S.call_value(_S.read(_e, "hex"), ["#5a4f6b"]), _S.call_value(_S.read(_e, "hex"), ["#3e3650"]), _S.call_value(_S.read(_e, "hex"), ["#776c88"])])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	_S.define(_e, "hit", _S.arg(_args, 2))
	if _S.truth(_S.prop(_S.read(_e, "c"), "rest")):
		return null
	_S.set_prop(_S.read(_e, "c"), "vy", _S.binary("*", 900, _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "c"), "x", _S.binary("*", _S.prop(_S.read(_e, "c"), "vx"), _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "c"), "y", _S.binary("*", _S.prop(_S.read(_e, "c"), "vy"), _S.read(_e, "dt")), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_e, "c"), "y"), _S.unary("-", _S.read(_e, "R0"))), func(): return _S.binary(">", _S.prop(_S.read(_e, "c"), "vy"), 0))):
		var _v0 = _S.scope(_e)
		_S.set_prop(_S.read(_v0, "c"), "y", _S.unary("-", _S.read(_v0, "R0")), "=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v0, "c"), "vy"), 80)):
			var _v1 = _S.scope(_v0)
			_S.optional_call(_S.read(_v1, "hit"), [_S.prop(_S.read(_v1, "c"), "x"), _S.prop(_S.read(_v1, "c"), "vy")])
			_S.set_prop(_S.read(_v1, "c"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v1, "c"), "vy")), 0.38), "=", false)
			_S.set_prop(_S.read(_v1, "c"), "vx", 0.78, "*=", false)
		else:
			_S.set_prop(_S.read(_v0, "c"), "vy", 0, "=", false)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "c"), "vy"), 0), func(): return _S.binary(">=", _S.prop(_S.read(_e, "c"), "y"), _S.binary("-", _S.unary("-", _S.read(_e, "R0")), 0.01)))):
		var _v2 = _S.scope(_e)
		_S.set_prop(_S.read(_v2, "c"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v2, "c"), "vx"), 3), _S.read(_v2, "dt")), "-=", false)
		if _S.truth(_S.binary("<", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.prop(_S.read(_v2, "c"), "vx")]), 2)):
			_S.last([_S.set_prop(_S.read(_v2, "c"), "vx", 0, "=", false), _S.set_prop(_S.read(_v2, "c"), "rest", true, "=", false)])
	_S.set_prop(_S.read(_e, "c"), "a", _S.binary("*", (_S.binary("/", _S.prop(_S.read(_e, "c"), "vx"), _S.read(_e, "R0")) if _S.truth(_S.binary("===", _S.prop(_S.read(_e, "c"), "vy"), 0)) else _S.prop(_S.read(_e, "c"), "va")), _S.read(_e, "dt")), "+=", false)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "clouds", _S.function_value(_e, "_f2"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "K", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "canister"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f6"))
	_S.define(_e, "SM", [_S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1)])
	var _v8 = _S.prop(_S.read(_e, "meta"), "size")
	_S.define(_e, "W", _S.prop(_v8, 0))
	_S.define(_e, "H", _S.prop(_v8, 1))
	var _v9 = _S.prop(_S.read(_e, "meta"), "origin")
	_S.define(_e, "OX", _S.prop(_v9, 0))
	_S.define(_e, "OY", _S.prop(_v9, 1))
	_S.define(_e, "X0", _S.binary("+", _S.unary("-", _S.read(_e, "OX")), 3))
	_S.define(_e, "X1", _S.binary("-", _S.binary("-", _S.read(_e, "W"), _S.read(_e, "OX")), 3))
	_S.define(_e, "Y0", _S.binary("+", _S.unary("-", _S.read(_e, "OY")), 3))
	_S.define(_e, "Y1", _S.binary("-", _S.binary("-", _S.read(_e, "H"), _S.read(_e, "OY")), 3))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "start", _S.merge([{"x": _S.unary("-", 70)}, {"y": _S.unary("-", 60)}, {"vx": 125}, {"vy": _S.unary("-", 80)}, {"va": 7}, {"a": 0}, {"rest": false}]))
	_S.define(_e, "sim", _S.merge([_S.read(_e, "start")]))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "i", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v10, "i"), 2400), func(): return _S.unary("!", _S.prop(_S.read(_v10, "sim"), "rest")))):
		_S.call_value(_S.read(_v10, "step"), [_S.read(_v10, "sim"), _S.binary("/", 1, 240)])
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "i", 1, "+=", true)
	_S.define(_e, "can", _S.merge([_S.read(_e, "start"), {"x": _S.binary("-", _S.prop(_S.read(_e, "start"), "x"), _S.prop(_S.read(_e, "sim"), "x"))}]))
	_S.define(_e, "N", 52)
	_S.define(_e, "lobes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f7")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "fuseTip", _S.function_value(_e, "_f8"))
	_S.define(_e, "radius", _S.function_value(_e, "_f9"))
	_S.define(_e, "thin", _S.function_value(_e, "_f10"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f13")}, {"draw": _S.function_value(_e, "_f14")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "back", _S.arg(_args, 1))
	_S.define(_e, "on", _S.invoke(_S.read(_e, "lobes"), "filter", [_S.function_value(_e, "_f3")]))
	if _S.truth(_S.unary("!", _S.prop(_S.read(_e, "on"), "length"))):
		return null
	_S.define(_e, "top", 0)
	for _v3 in _S.array(_S.read(_e, "on")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "b", _v3)
		_S.write(_v4, "top", _S.invoke(_S.read(_v4, "Math"), "min", [_S.read(_v4, "top"), _S.unary("-", _S.binary("+", _S.prop(_S.read(_v4, "b"), "h"), _S.binary("*", _S.call_value(_S.read(_v4, "radius"), [_S.read(_v4, "b")]), 1.92)))]), "=", false)
	for _v5 in _S.array(_S.invoke(_S.invoke(_S.read(_e, "on"), "filter", [_S.function_value(_e, "_f4")]), "sort", [_S.function_value(_e, "_f5")])):
		var _v6 = _S.scope(_e)
		_S.define(_v6, "b", _v5)
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "r", _S.call_value(_S.read(_v7, "radius"), [_S.read(_v7, "b")]))
		_S.define(_v7, "y", _S.binary("+", _S.unary("-", _S.binary("+", _S.prop(_S.read(_v7, "b"), "h"), _S.binary("*", _S.read(_v7, "r"), 0.92))), _S.binary("*", _S.prop(_S.read(_v7, "b"), "d"), 2.5)))
		_S.define(_v7, "k", _S.call_value(_S.read(_v7, "thin"), [_S.read(_v7, "b")]))
		_S.define(_v7, "a", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v7, "b"), "age"), 0.05)]), _S.invoke(_S.read(_v7, "Math"), "pow", [_S.binary("-", 1, _S.read(_v7, "k")), 1.4])), 0.97), _S.binary("-", 1, _S.call_value(_S.read(_v7, "smooth"), [_S.binary("+", _S.unary("-", _S.read(_v7, "OY")), 34), _S.binary("+", _S.unary("-", _S.read(_v7, "OY")), 6), _S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "r"))]))))
		if _S.truth(_S.binary("<=", _S.read(_v7, "a"), 0.01)):
			continue
		_S.define(_v7, "shade", (1 if _S.truth(_S.binary(">", _S.binary("/", _S.binary("-", _S.read(_v7, "y"), _S.read(_v7, "top")), _S.invoke(_S.read(_v7, "Math"), "max", [20, _S.unary("-", _S.read(_v7, "top"))])), 0.55)) else 0))
		_S.call_value(_S.read(_v7, "lobe"), [_S.read(_v7, "p"), _S.prop(_S.read(_v7, "b"), "x"), _S.read(_v7, "y"), _S.read(_v7, "r"), _S.read(_v7, "SM"), _S.read(_v7, "SM"), 0, 0, _S.read(_v7, "a"), _S.prop(_S.read(_v7, "b"), "d"), _S.invoke(_S.read(_v7, "Math"), "min", [2, _S.binary("+", _S.read(_v7, "shade"), (1 if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.6)) else 0))]), 1])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "b"), "on")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.binary("===", _S.binary("<", _S.prop(_S.read(_e, "b"), "d"), _S.unary("-", 0.35)), _S.read(_e, "back"))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "a"), "d"), _S.prop(_S.read(_e, "b"), "d"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "kind", _S.prop([0, 0, 1, 1, 2, 3], _S.binary("%", _S.read(_e, "i"), 6)))
	_S.define(_e, "side", _S.invoke(_S.read(_e, "R"), "sign", []))
	_S.define(_e, "ang", ((_S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [0, 0.25])) if _S.truth(_S.binary(">", _S.read(_e, "side"), 0)) else _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), _S.invoke(_S.read(_e, "R"), "range", [0, 0.25]))) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "kind"), 0), func(): return _S.binary("===", _S.read(_e, "kind"), 3))) else _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.6), 0.6]))))
	_S.define(_e, "sp", _S.prop([_S.invoke(_S.read(_e, "R"), "range", [70, 170]), _S.invoke(_S.read(_e, "R"), "range", [0, 25]), _S.invoke(_S.read(_e, "R"), "range", [45, 95]), _S.invoke(_S.read(_e, "R"), "range", [20, 60])], _S.read(_e, "kind")))
	_S.define(_e, "r1", _S.prop([_S.invoke(_S.read(_e, "R"), "range", [12, 17]), _S.invoke(_S.read(_e, "R"), "range", [16, 22]), _S.invoke(_S.read(_e, "R"), "range", [13, 18]), _S.invoke(_S.read(_e, "R"), "range", [14, 19])], _S.read(_e, "kind")))
	_S.define(_e, "t0", (_S.binary("+", _S.read(_e, "POP"), _S.invoke(_S.read(_e, "R"), "range", [0.45, 1.5])) if _S.truth(_S.binary("===", _S.read(_e, "kind"), 3)) else _S.binary("+", _S.binary("+", _S.read(_e, "POP"), _S.binary("*", 0.6, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "i"), _S.binary("-", _S.read(_e, "N"), 1)), 1.6]))), _S.invoke(_S.read(_e, "R"), "range", [0, 0.03]))))
	return _S.merge([{"kind": _S.read(_e, "kind")}, {"t0": _S.read(_e, "t0")}, {"vx": _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ang")]), _S.read(_e, "sp"))}, {"vh": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ang")])), _S.read(_e, "sp"))}, {"d": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 1), 1])}, {"r0": _S.invoke(_S.read(_e, "R"), "range", [5, 8])}, {"r1": _S.read(_e, "r1")}, {"f": _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.45), 0.4])}, {"wob": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}, {"on": false}, {"x": 0}, {"h": 0}, {"age": 0}])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return [_S.binary("+", _S.prop(_S.read(_e, "can"), "x"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "can"), "a")]), _S.binary("+", _S.read(_e, "R0"), 2.5))), _S.binary("-", _S.prop(_S.read(_e, "can"), "y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "can"), "a")]), _S.binary("+", _S.read(_e, "R0"), 2.5)))]

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("+", _S.prop(_S.read(_e, "b"), "r0"), _S.binary("*", _S.binary("-", _S.prop(_S.read(_e, "b"), "r1"), _S.prop(_S.read(_e, "b"), "r0")), _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "b"), "age")), 0.28)])))), _S.binary("+", 1, _S.binary("*", 0.05, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 3), _S.prop(_S.read(_e, "b"), "wob"))])))), _S.binary("+", 1, _S.binary("*", 0.35, _S.call_value(_S.read(_e, "thin"), [_S.read(_e, "b")]))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", 2.5, _S.prop(_S.read(_e, "b"), "f")), _S.binary("+", 3.9, _S.binary("*", _S.prop(_S.read(_e, "b"), "f"), 0.6)), _S.read(_e, "t")])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.call_value(_S.read(_e, "step"), [_S.read(_e, "can"), _S.read(_e, "dt"), _S.function_value(_e, "_f12")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
		var _v13 = _S.scope(_e)
		var _v14 = _S.call_value(_S.read(_v13, "fuseTip"), [])
		_S.define(_v13, "fx", _S.prop(_v14, 0))
		_S.define(_v13, "fy", _S.prop(_v14, 1))
		_S.define(_v13, "hurry", _S.call_value(_S.read(_v13, "smooth"), [_S.binary("-", _S.read(_v13, "POP"), 0.4), _S.read(_v13, "POP"), _S.read(_v13, "t")]))
		if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [_S.binary("*", _S.binary("+", 26, _S.binary("*", 50, _S.read(_v13, "hurry"))), _S.read(_v13, "dt"))])):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.read(_v13, "fx"), _S.read(_v13, "fy"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 50), 50]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [30, 100])), _S.invoke(_S.read(_v13, "R"), "range", [0.08, 0.18])])
		if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [_S.binary("*", 8, _S.read(_v13, "dt"))])):
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "VAPOUR"), _S.read(_v13, "fx"), _S.binary("-", _S.read(_v13, "fy"), 1), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v13, "R"), "range", [10, 18])), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v13, "C"), 5), _S.invoke(_S.read(_v13, "R"), "range", [1, 1.8])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "popped"))):
			var _v15 = _S.scope(_e)
			_S.write(_v15, "popped", true, "=", false)
			_S.invoke(_S.read(_v15, "lights"), "add", [_S.prop(_S.read(_v15, "can"), "x"), _S.unary("-", 9), 64, _S.prop(_S.read(_v15, "C"), 6), 0.75, 0.22])
			_S.invoke(_S.read(_v15, "lights"), "add", [_S.prop(_S.read(_v15, "can"), "x"), _S.unary("-", 5), 22, _S.read(_v15, "WHITE"), 0.7, 0.06])
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v16, "i"), 30)):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "a", _S.invoke(_S.read(_v17, "R"), "range", [_S.binary("-", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 0.35), 0.35]))
				_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [120, 300]))
				_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "SPARK"), _S.prop(_S.read(_v17, "can"), "x"), _S.unary("-", 5), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), 40), _S.invoke(_S.read(_v17, "R"), "range", [0.15, 0.4])])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "i", 1, "+=", true)
			var _v18 = _S.scope(_v15)
			_S.define(_v18, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "i"), 26)):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "u", _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1]))
				_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.binary("*", _S.read(_v19, "u"), 0.9)))
				_S.define(_v19, "sp", _S.binary("*", _S.invoke(_S.read(_v19, "R"), "range", [80, 220]), _S.binary("-", 1, _S.binary("*", 0.35, _S.invoke(_S.read(_v19, "Math"), "abs", [_S.read(_v19, "u")])))))
				_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "GRIT"), _S.binary("+", _S.prop(_S.read(_v19, "can"), "x"), _S.binary("*", _S.read(_v19, "u"), 4)), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.9, 1.6]), _S.invoke(_S.read(_v19, "R"), "pick", [_S.read(_v19, "GRIT")]), (2 if _S.truth(_S.invoke(_S.read(_v19, "R"), "chance", [0.35])) else 1)])
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "i", 1, "+=", true)
			_S.invoke(_S.read(_v15, "Object"), "assign", [_S.read(_v15, "can"), _S.merge([{"vy": _S.unary("-", 95)}, {"vx": _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 25), 25])}, {"va": _S.binary("*", _S.invoke(_S.read(_v15, "R"), "sign", []), 9)}, {"rest": false}])])
	_S.define(_e, "wind", _S.binary("*", 6, _S.call_value(_S.read(_e, "smooth"), [1.8, 3.2, _S.read(_e, "t")])))
	for _v20 in _S.array(_S.read(_e, "lobes")):
		var _v21 = _S.scope(_e)
		_S.define(_v21, "b", _v20)
		var _v22 = _S.scope(_v21)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v22, "b"), "on"))):
			var _v23 = _S.scope(_v22)
			if _S.truth(_S.binary("<", _S.read(_v23, "t"), _S.prop(_S.read(_v23, "b"), "t0"))):
				continue
			_S.last([_S.set_prop(_S.read(_v23, "b"), "on", true, "=", false), _S.set_prop(_S.read(_v23, "b"), "x", _S.binary("+", _S.prop(_S.read(_v23, "can"), "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 2), 2])), "=", false), _S.set_prop(_S.read(_v23, "b"), "h", 1, "=", false)])
		_S.set_prop(_S.read(_v22, "b"), "age", _S.read(_v22, "dt"), "+=", false)
		_S.set_prop(_S.read(_v22, "b"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v22, "b"), "vx"), 2.4), _S.read(_v22, "dt")), "-=", false)
		_S.set_prop(_S.read(_v22, "b"), "vh", _S.binary("*", _S.prop([_S.binary("*", 14, _S.call_value(_S.read(_v22, "smooth"), [0.7, 1.6, _S.prop(_S.read(_v22, "b"), "age")])), _S.binary("+", 3, _S.binary("*", 9, _S.call_value(_S.read(_v22, "smooth"), [0.8, 1.8, _S.prop(_S.read(_v22, "b"), "age")]))), _S.binary("+", 6, _S.binary("*", 12, _S.call_value(_S.read(_v22, "smooth"), [0.3, 1.4, _S.prop(_S.read(_v22, "b"), "age")]))), _S.binary("*", 10, _S.call_value(_S.read(_v22, "smooth"), [0.8, 1.6, _S.prop(_S.read(_v22, "b"), "age")]))], _S.prop(_S.read(_v22, "b"), "kind")), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "b"), "vh", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v22, "b"), "vh"), 1.6), _S.read(_v22, "dt")), "-=", false)
		_S.set_prop(_S.read(_v22, "b"), "x", _S.binary("*", _S.binary("+", _S.prop(_S.read(_v22, "b"), "vx"), _S.read(_v22, "wind")), _S.read(_v22, "dt")), "+=", false)
		_S.set_prop(_S.read(_v22, "b"), "h", _S.invoke(_S.read(_v22, "Math"), "max", [0, _S.binary("+", _S.prop(_S.read(_v22, "b"), "h"), _S.binary("*", _S.prop(_S.read(_v22, "b"), "vh"), _S.read(_v22, "dt")))]), "=", false)
		_S.define(_v22, "k", _S.call_value(_S.read(_v22, "thin"), [_S.read(_v22, "b")]))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v22, "k"), 0.12), func(): return _S.binary("<", _S.read(_v22, "k"), 0.85)), func(): return _S.invoke(_S.read(_v22, "R"), "chance", [_S.binary("*", 1.8, _S.read(_v22, "dt"))]))):
			var _v24 = _S.scope(_v22)
			_S.define(_v24, "r", _S.call_value(_S.read(_v24, "radius"), [_S.read(_v24, "b")]))
			_S.define(_v24, "life", _S.invoke(_S.read(_v24, "Math"), "min", [_S.invoke(_S.read(_v24, "R"), "range", [1, 1.6]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v24, "meta"), "duration"), 0.15), _S.read(_v24, "t"))]))
			if _S.truth(_S.binary(">", _S.read(_v24, "life"), 0.3)):
				_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "VAPOUR"), _S.binary("+", _S.prop(_S.read(_v24, "b"), "x"), _S.binary("*", _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", _S.read(_v24, "r")), _S.read(_v24, "r")]), 0.5)), _S.unary("-", _S.binary("+", _S.prop(_S.read(_v24, "b"), "h"), _S.binary("*", _S.read(_v24, "r"), 1.4))), _S.binary("+", _S.read(_v24, "wind"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 6), 10])), _S.unary("-", _S.invoke(_S.read(_v24, "R"), "range", [8, 20])), _S.read(_v24, "life"), _S.prop(_S.read(_v24, "C"), 4), _S.binary("*", _S.read(_v24, "r"), _S.invoke(_S.read(_v24, "R"), "range", [0.3, 0.45]))])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.5)), func(): return _S.binary("<", _S.read(_e, "t"), 4.1)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 4, _S.read(_e, "dt"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "can"), "x"), _S.binary("-", _S.prop(_S.read(_e, "can"), "y"), 3), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [8, 16])), _S.invoke(_S.read(_e, "R"), "range", [0.6, 0.9]), _S.prop(_S.read(_e, "C"), 4), _S.invoke(_S.read(_e, "R"), "range", [1.5, 2.5])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "Y0"), _S.read(_e, "X1"), _S.read(_e, "Y1")])
	_S.call_value(_S.read(_e, "fadeEdges"), [_S.read(_e, "ps"), _S.read(_e, "X0"), _S.read(_e, "X1"), 20, _S.read(_e, "Y1")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "sp", _S.arg(_args, 1))
	var _v11 = _S.scope(_e)
	_S.define(_v11, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v11, "i"), 3)):
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.read(_v11, "x"), _S.unary("-", 1), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [40, 110])), _S.invoke(_S.read(_v11, "R"), "range", [0.06, 0.14])])
		_v11 = _S.iteration(_v11)
		_S.write(_v11, "i", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 3)):
		_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "DUST"), _S.binary("+", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v12, "R"), "sign", []), _S.invoke(_S.read(_v12, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [4, 14])), _S.invoke(_S.read(_v12, "R"), "range", [0.3, 0.55]), _S.prop(_S.read(_v12, "GRIT"), 2), _S.invoke(_S.read(_v12, "R"), "range", [1.4, 2.4])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.call_value(_S.read(_e, "clouds"), [_S.read(_e, "p"), true])
	return null

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [4.3, 4.8, _S.read(_e, "t")])))
	if _S.truth(_S.binary(">", _S.read(_e, "fade"), 0)):
		_S.call_value(_S.read(_e, "drawCanister"), [_S.read(_e, "p"), _S.read(_e, "K"), _S.read(_e, "can"), _S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP")), _S.read(_e, "fade")])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "POP"))):
		var _v25 = _S.scope(_e)
		var _v26 = _S.call_value(_S.read(_v25, "fuseTip"), [])
		_S.define(_v25, "fx", _S.prop(_v26, 0))
		_S.define(_v25, "fy", _S.prop(_v26, 1))
		_S.invoke(_S.read(_v25, "p"), "px", [_S.read(_v25, "fx"), _S.read(_v25, "fy"), (_S.read(_v25, "WHITE") if _S.truth(_S.binary(">", _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.read(_v25, "t"), 50)]), 0)) else _S.call_value(_S.read(_v25, "hex"), [_S.prop(_S.prop(_S.read(_v25, "o"), "sparks"), 1)]))])
		_S.invoke(_S.read(_v25, "p"), "glow", [_S.read(_v25, "fx"), _S.read(_v25, "fy"), 6, _S.call_value(_S.read(_v25, "hex"), [_S.prop(_S.prop(_S.read(_v25, "o"), "sparks"), 2)]), _S.binary("+", 0.45, _S.binary("*", 0.2, _S.invoke(_S.read(_v25, "Math"), "sin", [_S.binary("*", _S.read(_v25, "t"), 37)])))])
	_S.call_value(_S.read(_e, "clouds"), [_S.read(_e, "p"), false])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.067))):
		var _v27 = _S.scope(_e)
		_S.invoke(_S.read(_v27, "p"), "circle", [_S.prop(_S.read(_v27, "can"), "x"), _S.unary("-", 5), 6.5, _S.prop(_S.read(_v27, "C"), 5)])
		_S.invoke(_S.read(_v27, "p"), "circle", [_S.prop(_S.read(_v27, "can"), "x"), _S.unary("-", 5), 4.5, _S.read(_v27, "WHITE")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.16))):
		_S.call_value(_S.read(_e, "flare"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "can"), "x"), _S.unary("-", 5), _S.binary("*", 22, _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.16))), _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.16)), [_S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)]])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "u"), 0), func(): return _S.binary("<", _S.read(_e, "u"), 0.35))):
		_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), _S.prop(_S.read(_e, "can"), "x"), 1, 50, 8, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_e, "u"), 0.35)))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "K", _S.arg(_args, 1))
	_S.define(_e, "c", _S.arg(_args, 2))
	_S.define(_e, "live", _S.arg(_args, 3))
	_S.define(_e, "a", _S.arg(_args, 4))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "c"), "a")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "c"), "a")]))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "c"), "x"), _S.read(_e, "R0")), 2), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "c"), "y"), _S.read(_e, "R0")), 2), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "c"), "x"), _S.read(_e, "R0")), 2), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "c"), "y"), _S.read(_e, "R0")), 2), _S.function_value(_e, "_f16")])
	_S.define(_e, "cx", _S.binary("+", _S.prop(_S.read(_e, "c"), "x"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "R0"))))
	_S.define(_e, "cy", _S.binary("-", _S.prop(_S.read(_e, "c"), "y"), _S.binary("*", _S.read(_e, "ca"), _S.read(_e, "R0"))))
	if _S.truth(_S.read(_e, "live")):
		_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "sa"), 2.5)), _S.binary("-", _S.read(_e, "cy"), _S.binary("*", _S.read(_e, "ca"), 2.5)), _S.call_value(_S.read(_e, "hex"), ["#8a6a48"]), _S.read(_e, "a")])
	else:
		_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "cx"), _S.read(_e, "cy"), _S.prop(_S.read(_e, "K"), 0), _S.read(_e, "a")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "px", _S.arg(_args, 0))
	_S.define(_e, "py", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "px"), _S.prop(_S.read(_e, "c"), "x")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "py"), _S.prop(_S.read(_e, "c"), "y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.read(_e, "dx"), _S.read(_e, "dy")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "R0"), 1))):
		return null
	_S.set_prop(_S.read(_e, "out"), "a", _S.read(_e, "a"), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "R0"))):
		return _S.read(_e, "OUTLINE")
	_S.define(_e, "v", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "dx")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "ca"))))
	_S.define(_e, "lit", _S.binary("/", _S.unary("-", _S.binary("+", _S.binary("*", _S.read(_e, "dx"), 0.6), _S.binary("*", _S.read(_e, "dy"), 0.8))), _S.read(_e, "R0")))
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "v")]), 0.9)):
		return _S.prop(_S.read(_e, "BAND"), (2 if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.3)) else (1 if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.4))) else 0)))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "d"), _S.binary("*", _S.read(_e, "R0"), 0.5)), func(): return _S.binary(">", _S.read(_e, "lit"), 0.45))):
		return _S.prop(_S.read(_e, "K"), 4)
	return _S.prop(_S.read(_e, "K"), (3 if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0.5)) else (2 if _S.truth(_S.binary(">", _S.read(_e, "lit"), 0)) else (1 if _S.truth(_S.binary(">", _S.read(_e, "lit"), _S.unary("-", 0.5))) else 0))))
