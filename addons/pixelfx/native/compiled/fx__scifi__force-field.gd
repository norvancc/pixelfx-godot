@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/force-field.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "forks", _S.import_value("core/index.js", "forks"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "flash", _S.import_value("fx/scifi/_lib.js", "flash"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "cell", _S.function_value(_e, "_f0"))
	_S.define(_e, "project", _S.function_value(_e, "_f1"))
	_S.define(_e, "shell", _S.function_value(_e, "_f2"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f5"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f8"))
	_S.define(_e, "drawShell", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawFoot", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Force field"}, {"desc": "A glassy dome of hex plates over the hero: plates glint, tracers from the right slam into it, a ripple and cracks of light race across, sparks glance off."}, {"tags": ["scifi", "shield", "barrier", "dome", "hex", "hit", "defense", "loop"]}, {"size": [184, 104]}, {"origin": [76, 84]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0b1030", "#152a63", "#1d4f9e", "#2582d2", "#36b9ee", "#8ae8ff", "#d4fbff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"radius": 44}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([{"turn": 1}, {"crouch": 3}, {"lean": 1}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 38)}, {"bx": 10}, {"by": _S.unary("-", 38)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "HIT_", _S.merge([_S.read(_e, "HOLD"), {"x": _S.unary("-", 2)}, {"crouch": 5}, {"lean": _S.unary("-", 3)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[0, _S.read(_e, "HOLD")], [0.42, _S.read(_e, "HOLD")], [0.42, _S.read(_e, "HIT_"), "snap"], [0.7, _S.merge([_S.read(_e, "HOLD"), {"x": _S.unary("-", 1)}])], [1.1, _S.read(_e, "HOLD")], [1.5, _S.read(_e, "HOLD")], [1.5, _S.merge([_S.read(_e, "HIT_"), {"crouch": 4}, {"lean": _S.unary("-", 2)}]), "snap"], [1.75, _S.read(_e, "HOLD")], [2.4, _S.read(_e, "HOLD")]]}, {"hits": [_S.merge([{"t": 0.42}, {"stop": 0.07}, {"shake": 0.16}, {"amp": 2}]), _S.merge([{"t": 1.5}, {"stop": 0.03}, {"shake": 0.08}, {"amp": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "S3", _S.invoke(_S.read(_e, "Math"), "sqrt", [3]))
	_S.define(_e, "SA", 0.13)
	_S.define(_e, "CA", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "SA"), _S.read(_e, "SA")))]))
	_S.define(_e, "G", 6.3)
	_S.define(_e, "KY", 1.12)
	_S.define(_e, "SHOTS", _S.invoke([_S.merge([{"t": 0.42}, {"lon": 0.66}, {"lat": 0.62}, {"big": true}]), _S.merge([{"t": 1.5}, {"lon": 0.95}, {"lat": 0.26}, {"big": false}])], "map", [_S.function_value(_e, "_f17")]))
	_S.define(_e, "shells", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "crackCache", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "ghostCache", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "glints", _S.function_value(_e, "_f18"))
	_S.define(_e, "glintAt", _S.function_value(_e, "_f19"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "gx", _S.arg(_args, 0))
	_S.define(_e, "gy", _S.arg(_args, 1))
	_S.define(_e, "fq", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_e, "S3"), 3), _S.read(_e, "gx")), _S.binary("/", _S.read(_e, "gy"), 3)))
	_S.define(_e, "fr", _S.binary("*", _S.binary("/", 2, 3), _S.read(_e, "gy")))
	_S.define(_e, "fs", _S.binary("-", _S.unary("-", _S.read(_e, "fq")), _S.read(_e, "fr")))
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "fq")]))
	_S.define(_e, "r", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "fr")]))
	_S.define(_e, "s", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "fs")]))
	_S.define(_e, "dq", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "q"), _S.read(_e, "fq"))]))
	_S.define(_e, "dr", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "r"), _S.read(_e, "fr"))]))
	_S.define(_e, "ds", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "s"), _S.read(_e, "fs"))]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "dq"), _S.read(_e, "dr")), func(): return _S.binary(">", _S.read(_e, "dq"), _S.read(_e, "ds")))):
		_S.write(_e, "q", _S.binary("-", _S.unary("-", _S.read(_e, "r")), _S.read(_e, "s")), "=", false)
	else:
		if _S.truth(_S.binary(">", _S.read(_e, "dr"), _S.read(_e, "ds"))):
			_S.write(_e, "r", _S.binary("-", _S.unary("-", _S.read(_e, "q")), _S.read(_e, "s")), "=", false)
	_S.define(_e, "hx", _S.binary("*", _S.read(_e, "S3"), _S.binary("+", _S.read(_e, "q"), _S.binary("/", _S.read(_e, "r"), 2))))
	_S.define(_e, "hy", _S.binary("*", 1.5, _S.read(_e, "r")))
	_S.define(_e, "dx", _S.binary("-", _S.read(_e, "gx"), _S.read(_e, "hx")))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "gy"), _S.read(_e, "hy")))
	_S.define(_e, "ax", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "dx")]))
	_S.define(_e, "e", _S.binary("/", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "ax"), _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("+", _S.binary("/", _S.read(_e, "ax"), 2), _S.binary("/", _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "S3")), 2))]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("/", _S.read(_e, "ax"), 2), _S.binary("/", _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "S3")), 2))])]), _S.binary("/", _S.read(_e, "S3"), 2)))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 6)), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 3))]))
	_S.define(_e, "ca", _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 6), _S.binary("/", _S.binary("*", _S.read(_e, "k"), _S.prop(_S.read(_e, "Math"), "PI")), 3)))
	return _S.merge([{"q": _S.read(_e, "q")}, {"r": _S.read(_e, "r")}, {"hx": _S.read(_e, "hx")}, {"hy": _S.read(_e, "hy")}, {"e": _S.read(_e, "e")}, {"corner": _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ca")])), _S.binary("-", _S.read(_e, "dy"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ca")]))])}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "lon", _S.arg(_args, 1))
	_S.define(_e, "lat", _S.arg(_args, 2))
	_S.define(_e, "X", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lat")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "lon")])))
	_S.define(_e, "Y", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "lat")]))
	_S.define(_e, "Z", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lat")]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "lon")])))
	return [_S.binary("*", _S.read(_e, "R"), _S.read(_e, "X")), _S.binary("*", _S.unary("-", _S.read(_e, "R")), _S.binary("-", _S.binary("*", _S.read(_e, "Y"), _S.read(_e, "CA")), _S.binary("*", _S.read(_e, "Z"), _S.read(_e, "SA")))), _S.binary("+", _S.binary("*", _S.read(_e, "Y"), _S.read(_e, "SA")), _S.binary("*", _S.read(_e, "Z"), _S.read(_e, "CA")))]

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "shells"), "get", [_S.read(_e, "R")]))
	if _S.truth(_S.read(_e, "g")):
		return _S.read(_e, "g")
	_S.define(_e, "near", [])
	_S.define(_e, "far", [])
	_S.define(_e, "N", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "R")]), 1))
	_S.define(_e, "W", _S.binary("+", _S.binary("*", 2, _S.read(_e, "N")), 1))
	_S.define(_e, "ids", [_S.construct(_S.read(_e, "Map"), []), _S.construct(_S.read(_e, "Map"), [])])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.unary("-", _S.read(_v0, "N")))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.binary("+", _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("*", _S.read(_v0, "R"), _S.read(_v0, "SA"))]), 1))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.unary("-", _S.read(_v1, "N")))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.read(_v1, "N"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "u", _S.binary("/", _S.binary("+", _S.read(_v2, "x"), 0.5), _S.read(_v2, "R")))
			_S.define(_v2, "vy", _S.binary("/", _S.unary("-", _S.binary("+", _S.read(_v2, "y"), 0.5)), _S.read(_v2, "R")))
			_S.define(_v2, "q", _S.binary("+", _S.binary("*", _S.read(_v2, "u"), _S.read(_v2, "u")), _S.binary("*", _S.read(_v2, "vy"), _S.read(_v2, "vy"))))
			if _S.truth(_S.binary(">", _S.read(_v2, "q"), 1)):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "x", 1, "+=", true)
				continue
			_S.define(_v2, "vz", _S.invoke(_S.read(_v2, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v2, "q"))]))
			for _v3 in _S.array([1, _S.unary("-", 1)]):
				var _v4 = _S.scope(_v2)
				_S.define(_v4, "s", _v3)
				var _v5 = _S.scope(_v4)
				_S.define(_v5, "Y", _S.binary("+", _S.binary("*", _S.read(_v5, "vy"), _S.read(_v5, "CA")), _S.binary("*", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "vz")), _S.read(_v5, "SA"))))
				_S.define(_v5, "Z", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v5, "vy")), _S.read(_v5, "SA")), _S.binary("*", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "vz")), _S.read(_v5, "CA"))))
				if _S.truth(_S.binary("<", _S.read(_v5, "Y"), 0)):
					continue
				_S.define(_v5, "lon", _S.invoke(_S.read(_v5, "Math"), "atan2", [_S.read(_v5, "u"), _S.read(_v5, "Z")]))
				_S.define(_v5, "lat", _S.invoke(_S.read(_v5, "Math"), "asin", [_S.invoke(_S.read(_v5, "Math"), "min", [1, _S.read(_v5, "Y")])]))
				_S.define(_v5, "c", _S.call_value(_S.read(_v5, "cell"), [_S.binary("*", _S.read(_v5, "lon"), _S.read(_v5, "G")), _S.binary("*", _S.binary("*", _S.read(_v5, "lat"), _S.read(_v5, "G")), _S.read(_v5, "KY"))]))
				_S.define(_v5, "id", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "c"), "q"), 1000), _S.prop(_S.read(_v5, "c"), "r")))
				_S.invoke((_S.read(_v5, "near") if _S.truth(_S.binary(">", _S.read(_v5, "s"), 0)) else _S.read(_v5, "far")), "push", [_S.merge([{"x": _S.read(_v5, "x")}, {"y": _S.read(_v5, "y")}, {"X": _S.read(_v5, "u")}, {"Y": _S.read(_v5, "Y")}, {"Z": _S.read(_v5, "Z")}, {"lon": _S.read(_v5, "lon")}, {"lat": _S.read(_v5, "lat")}, {"q": _S.prop(_S.read(_v5, "c"), "q")}, {"r": _S.prop(_S.read(_v5, "c"), "r")}, {"id": _S.read(_v5, "id")}, {"e": _S.prop(_S.read(_v5, "c"), "e")}, {"corner": _S.prop(_S.read(_v5, "c"), "corner")}, {"rim": _S.binary("-", 1, _S.read(_v5, "vz"))}, {"sil": _S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v5, "Math"), "sqrt", [_S.read(_v5, "q")])), _S.read(_v5, "R"))}])])
				_S.invoke(_S.prop(_S.read(_v5, "ids"), (0 if _S.truth(_S.binary(">", _S.read(_v5, "s"), 0)) else 1)), "set", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v5, "y"), _S.read(_v5, "N")), _S.read(_v5, "W")), _S.read(_v5, "x")), _S.read(_v5, "N")), _S.read(_v5, "id")])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke([_S.read(_e, "near"), _S.read(_e, "far")], "forEach", [_S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "shells"), "set", [_S.read(_e, "R"), _S.write(_e, "g", _S.merge([{"near": _S.read(_e, "near")}, {"far": _S.read(_e, "far")}]), "=", false)])
	return _S.read(_e, "g")

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "list", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "at", _S.function_value(_e, "_f4"))
	for _v6 in _S.array(_S.read(_e, "list")):
		var _v7 = _S.scope(_e)
		_S.define(_v7, "q", _v6)
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "r", _S.call_value(_S.read(_v8, "at"), [_S.binary("+", _S.prop(_S.read(_v8, "q"), "x"), 1), _S.prop(_S.read(_v8, "q"), "y")]))
		_S.define(_v8, "d", _S.call_value(_S.read(_v8, "at"), [_S.prop(_S.read(_v8, "q"), "x"), _S.binary("+", _S.prop(_S.read(_v8, "q"), "y"), 1)]))
		_S.define(_v8, "l", _S.call_value(_S.read(_v8, "at"), [_S.binary("-", _S.prop(_S.read(_v8, "q"), "x"), 1), _S.prop(_S.read(_v8, "q"), "y")]))
		_S.define(_v8, "u", _S.call_value(_S.read(_v8, "at"), [_S.prop(_S.read(_v8, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v8, "q"), "y"), 1)]))
		_S.set_prop(_S.read(_v8, "q"), "seam", _S.logical("||", _S.logical("&&", _S.binary("!==", _S.read(_v8, "r"), null), func(): return _S.binary("!==", _S.read(_v8, "r"), _S.prop(_S.read(_v8, "q"), "id"))), func(): return _S.logical("&&", _S.binary("!==", _S.read(_v8, "d"), null), func(): return _S.binary("!==", _S.read(_v8, "d"), _S.prop(_S.read(_v8, "q"), "id")))), "=", false)
		_S.set_prop(_S.read(_v8, "q"), "bevel", _S.logical("&&", _S.unary("!", _S.prop(_S.read(_v8, "q"), "seam")), func(): return _S.logical("||", _S.logical("&&", _S.binary("!==", _S.read(_v8, "l"), null), func(): return _S.binary("!==", _S.read(_v8, "l"), _S.prop(_S.read(_v8, "q"), "id"))), func(): return _S.logical("&&", _S.binary("!==", _S.read(_v8, "u"), null), func(): return _S.binary("!==", _S.read(_v8, "u"), _S.prop(_S.read(_v8, "q"), "id"))))), "=", false)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.invoke(_S.prop(_S.read(_e, "ids"), _S.read(_e, "i")), "get", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_e, "y"), _S.read(_e, "N")), _S.read(_e, "W")), _S.read(_e, "x")), _S.read(_e, "N"))])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.arg(_args, 1))
	_S.define(_e, "s", _S.arg(_args, 2))
	_S.define(_e, "key", ("" + _S.string(_S.read(_e, "R")) + ":" + _S.string(_S.read(_e, "seed")) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "crackCache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "crackCache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.binary("+", _S.binary("*", _S.read(_e, "seed"), 13), 5)]))
	_S.define(_e, "out", [])
	_S.define(_e, "toScreen", _S.function_value(_e, "_f6"))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 5)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v13, "i"), 5), _S.read(_v13, "TAU")), _S.invoke(_S.read(_v13, "rn"), "range", [_S.unary("-", 0.35), 0.35])))
		_S.define(_v13, "L", _S.invoke(_S.read(_v13, "rn"), "range", [0.42, 0.8]))
		_S.define(_v13, "path", _S.call_value(_S.read(_v13, "bolt"), [_S.read(_v13, "rn"), _S.prop(_S.read(_v13, "s"), "lon"), _S.prop(_S.read(_v13, "s"), "lat"), _S.binary("+", _S.prop(_S.read(_v13, "s"), "lon"), _S.binary("/", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "L")), _S.invoke(_S.read(_v13, "Math"), "cos", [_S.prop(_S.read(_v13, "s"), "lat")]))), _S.binary("+", _S.prop(_S.read(_v13, "s"), "lat"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "L"))), _S.merge([{"jag": 0.2}, {"depth": 4}])]))
		_S.invoke(_S.read(_v13, "out"), "push", [_S.call_value(_S.read(_v13, "toScreen"), [_S.read(_v13, "path"), 0, 1])])
		for _v14 in _S.array(_S.call_value(_S.read(_v13, "forks"), [_S.read(_v13, "rn"), _S.read(_v13, "path"), _S.merge([{"count": _S.invoke(_S.read(_v13, "rn"), "int", [0, 2])}, {"len": _S.binary("*", _S.read(_v13, "L"), 0.5)}, {"jag": 0.25}, {"spread": 0.9}])])):
			var _v15 = _S.scope(_v13)
			_S.define(_v15, "f", _v14)
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "j", _S.invoke(_S.read(_v16, "path"), "findIndex", [_S.function_value(_v16, "_f7")]))
			_S.define(_v16, "u0", _S.binary("/", _S.invoke(_S.read(_v16, "Math"), "max", [0, _S.read(_v16, "j")]), _S.binary("-", _S.prop(_S.read(_v16, "path"), "length"), 1)))
			_S.invoke(_S.read(_v16, "out"), "push", [_S.call_value(_S.read(_v16, "toScreen"), [_S.read(_v16, "f"), _S.read(_v16, "u0"), _S.binary("+", _S.read(_v16, "u0"), 0.5)])])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "crackCache"), "set", [_S.read(_e, "key"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "path", _S.arg(_args, 0))
	_S.define(_e, "u0", _S.arg(_args, 1))
	_S.define(_e, "u1", _S.arg(_args, 2))
	_S.define(_e, "pts", [])
	var _v9 = _S.scope(_e)
	_S.define(_v9, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v9, "i"), _S.prop(_S.read(_v9, "path"), "length"))):
		var _v10 = _S.scope(_v9)
		var _v11 = _S.prop(_S.read(_v10, "path"), _S.read(_v10, "i"))
		_S.define(_v10, "lon", _S.prop(_v11, 0))
		_S.define(_v10, "lat", _S.prop(_v11, 1))
		if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v10, "lat"), 0.03), func(): return _S.binary(">", _S.read(_v10, "lat"), 1.52)), func(): return _S.binary(">", _S.invoke(_S.read(_v10, "Math"), "abs", [_S.read(_v10, "lon")]), 1.5))):
			break
		_S.invoke(_S.read(_v10, "pts"), "push", [_S.concat([_S.array(_S.call_value(_S.read(_v10, "project"), [_S.read(_v10, "R"), _S.read(_v10, "lon"), _S.read(_v10, "lat")])), [_S.binary("+", _S.read(_v10, "u0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v10, "u1"), _S.read(_v10, "u0")), _S.read(_v10, "i")), _S.binary("-", _S.prop(_S.read(_v10, "path"), "length"), 1)))]])])
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "i", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.logical("&&", _S.binary("===", _S.prop(_S.read(_e, "q"), 0), _S.prop(_S.prop(_S.read(_e, "f"), 0), 0)), func(): return _S.binary("===", _S.prop(_S.read(_e, "q"), 1), _S.prop(_S.prop(_S.read(_e, "f"), 0), 1)))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "R", _S.arg(_args, 2))
	_S.define(_e, "key", ("" + _S.string(_S.read(_e, "R")) + ":" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "sparks"), "join", [])) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "ghostCache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "ghostCache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "W", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)))
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"ground": _S.function_value(_e, "_f9")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}, {"box": [_S.unary("-", 70), _S.unary("-", 80), _S.binary("-", _S.read(_e, "W"), 6), 14]}])]))
	for _v17 in _S.array(_S.read(_e, "SHOTS")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "s", _v17)
		var _v19 = _S.scope(_v18)
		var _v20 = _S.call_value(_S.read(_v19, "project"), [_S.read(_v19, "R"), _S.prop(_S.read(_v19, "s"), "lon"), _S.prop(_S.read(_v19, "s"), "lat")])
		_S.define(_v19, "hx", _S.prop(_v20, 0))
		_S.define(_v19, "hy", _S.prop(_v20, 1))
		_S.define(_v19, "n", (1 if _S.truth(_S.prop(_S.read(_v19, "s"), "big")) else 0.55))
		var _v21 = _S.scope(_v19)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), _S.binary("*", 24, _S.read(_v21, "n")))):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "a", _S.binary("+", (_S.unary("-", 0.9) if _S.truth(_S.prop(_S.read(_v22, "s"), "big")) else _S.unary("-", 0.55)), _S.invoke(_S.read(_v22, "rn"), "range", [_S.unary("-", 0.7), 0.65])))
			_S.define(_v22, "sp", _S.binary("*", _S.invoke(_S.read(_v22, "rn"), "range", [100, 280]), _S.binary("+", 0.7, _S.binary("*", 0.3, _S.read(_v22, "n")))))
			_S.invoke(_S.read(_v22, "g"), "add", [_S.binary("+", _S.prop(_S.read(_v22, "s"), "t"), _S.invoke(_S.read(_v22, "rn"), "range", [0, 0.02])), _S.prop(_S.read(_v22, "P"), "SPARK"), _S.read(_v22, "hx"), _S.read(_v22, "hy"), _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "cos", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v22, "Math"), "sin", [_S.read(_v22, "a")]), _S.read(_v22, "sp")), 30), _S.invoke(_S.read(_v22, "rn"), "range", [0.25, 0.75])])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v23 = _S.scope(_v19)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), _S.binary("*", 7, _S.read(_v23, "n")))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "a", _S.binary("+", _S.unary("-", 0.9), _S.invoke(_S.read(_v24, "rn"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v24, "sp", _S.invoke(_S.read(_v24, "rn"), "range", [30, 90]))
			_S.invoke(_S.read(_v24, "g"), "add", [_S.binary("+", _S.prop(_S.read(_v24, "s"), "t"), _S.invoke(_S.read(_v24, "rn"), "range", [0, 0.05])), _S.prop(_S.read(_v24, "P"), "MOTE"), _S.read(_v24, "hx"), _S.read(_v24, "hy"), _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "cos", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v24, "Math"), "sin", [_S.read(_v24, "a")]), _S.read(_v24, "sp")), 15), _S.invoke(_S.read(_v24, "rn"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v24, "rn"), "pick", [[_S.prop(_S.read(_v24, "C"), 5), _S.prop(_S.read(_v24, "C"), 6), _S.prop(_S.read(_v24, "C"), 4)]]), 0.7])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
		var _v25 = _S.scope(_v19)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), _S.binary("*", 3, _S.read(_v25, "n")))):
			_S.invoke(_S.read(_v25, "g"), "add", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v25, "s"), "t"), 0.04), _S.binary("*", _S.read(_v25, "i"), 0.07)), _S.prop(_S.read(_v25, "P"), "STAR"), _S.binary("+", _S.read(_v25, "hx"), _S.invoke(_S.read(_v25, "rn"), "range", [_S.unary("-", 6), 6])), _S.binary("+", _S.read(_v25, "hy"), _S.invoke(_S.read(_v25, "rn"), "range", [_S.unary("-", 5), 5])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v25, "rn"), "range", [0.3, 0.5]), _S.prop(_S.read(_v25, "C"), 6), _S.invoke(_S.read(_v25, "rn"), "range", [1, 2])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		var _v26 = _S.scope(_v19)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), _S.binary("*", 3, _S.read(_v26, "n")))):
			_S.invoke(_S.read(_v26, "g"), "add", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v26, "s"), "t"), 0.03), _S.binary("*", _S.read(_v26, "i"), 0.04)), _S.prop(_S.read(_v26, "P"), "SMOKE"), _S.binary("+", _S.binary("+", _S.read(_v26, "hx"), 2), _S.invoke(_S.read(_v26, "rn"), "range", [_S.unary("-", 2), 2])), _S.binary("-", _S.read(_v26, "hy"), 1), _S.invoke(_S.read(_v26, "rn"), "range", [8, 22]), _S.invoke(_S.read(_v26, "rn"), "range", [_S.unary("-", 14), _S.unary("-", 4)]), _S.invoke(_S.read(_v26, "rn"), "range", [0.9, 1.3]), _S.call_value(_S.read(_v26, "hex"), ["#5b5f78"]), _S.invoke(_S.read(_v26, "rn"), "range", [2.2, 3.4])])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	var _v27 = _S.scope(_e)
	_S.define(_v27, "r", 0)
	while _S.truth(_S.binary("<", _S.read(_v27, "r"), 12)):
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "q", _S.unary("-", 14))
		while _S.truth(_S.binary("<=", _S.read(_v28, "q"), 14)):
			var _v29 = _S.scope(_v28)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v29, "glints"), [_S.prop(_S.read(_v29, "o"), "seed"), _S.read(_v29, "q"), _S.read(_v29, "r")]))):
				_v28 = _S.iteration(_v28)
				_S.write(_v28, "q", 1, "+=", true)
				continue
			_S.define(_v29, "lon", _S.binary("/", _S.binary("*", _S.read(_v29, "S3"), _S.binary("+", _S.read(_v29, "q"), _S.binary("/", _S.read(_v29, "r"), 2))), _S.read(_v29, "G")))
			_S.define(_v29, "lat", _S.binary("/", _S.binary("*", 1.5, _S.read(_v29, "r")), _S.binary("*", _S.read(_v29, "G"), _S.read(_v29, "KY"))))
			var _v30 = _S.call_value(_S.read(_v29, "project"), [_S.read(_v29, "R"), _S.read(_v29, "lon"), _S.read(_v29, "lat")])
			_S.define(_v29, "x", _S.prop(_v30, 0))
			_S.define(_v29, "y", _S.prop(_v30, 1))
			_S.define(_v29, "f", _S.prop(_v30, 2))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v29, "f"), 0.25), func(): return _S.binary("<", _S.read(_v29, "lat"), 0.15)), func(): return _S.binary(">", _S.read(_v29, "lat"), 1.45)), func(): return _S.binary(">", _S.invoke(_S.read(_v29, "Math"), "abs", [_S.read(_v29, "lon")]), 1.3))):
				_v28 = _S.iteration(_v28)
				_S.write(_v28, "q", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v29, "g"), "add", [_S.binary("+", _S.call_value(_S.read(_v29, "glintAt"), [_S.prop(_S.read(_v29, "o"), "seed"), _S.read(_v29, "q"), _S.read(_v29, "r")]), 0.03), _S.prop(_S.read(_v29, "P"), "STAR"), _S.read(_v29, "x"), _S.read(_v29, "y"), 0, _S.unary("-", 3), 0.4, _S.prop(_S.read(_v29, "C"), 6), _S.binary("+", 1.4, _S.call_value(_S.read(_v29, "rand"), [_S.read(_v29, "q"), _S.read(_v29, "r"), 9]))])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "q", 1, "+=", true)
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "r", 1, "+=", true)
	_S.invoke(_S.read(_e, "ghostCache"), "set", [_S.read(_e, "key"), _S.read(_e, "g")])
	return _S.read(_e, "g")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	var _v31 = _S.call_value(_S.read(_e, "shell"), [_S.read(_e, "R")])
	_S.define(_e, "N", _S.prop(_v31, "near"))
	_S.define(_e, "F", _S.prop(_v31, "far"))
	_S.define(_e, "ages", _S.invoke(_S.read(_e, "SHOTS"), "map", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "sk", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "ph"), 0.72), 0.26)]))
	_S.define(_e, "scanLat", _S.binary("+", _S.unary("-", 0.2), _S.binary("*", _S.read(_e, "sk"), 2)))
	_S.define(_e, "scanK", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "sk"))]))
	for _v32 in _S.array((_S.read(_e, "N") if _S.truth(_S.read(_e, "near")) else _S.read(_e, "F"))):
		var _v33 = _S.scope(_e)
		_S.define(_v33, "q", _v32)
		var _v34 = _S.scope(_v33)
		_S.define(_v34, "ff", _S.binary("*", _S.prop(_S.read(_v34, "q"), "rim"), _S.prop(_S.read(_v34, "q"), "rim")))
		_S.define(_v34, "rp", 0)
		_S.define(_v34, "hot", 0)
		var _v35 = _S.scope(_v34)
		_S.define(_v35, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "i"), _S.prop(_S.read(_v35, "SHOTS"), "length"))):
			var _v36 = _S.scope(_v35)
			_S.define(_v36, "s", _S.prop(_S.read(_v36, "SHOTS"), _S.read(_v36, "i")))
			_S.define(_v36, "age", _S.prop(_S.read(_v36, "ages"), _S.read(_v36, "i")))
			if _S.truth(_S.binary(">=", _S.read(_v36, "age"), 1)):
				_v35 = _S.iteration(_v35)
				_S.write(_v35, "i", 1, "+=", true)
				continue
			_S.define(_v36, "d", _S.invoke(_S.read(_v36, "Math"), "acos", [_S.call_value(_S.read(_v36, "clamp"), [_S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v36, "q"), "X"), _S.prop(_S.prop(_S.read(_v36, "s"), "N"), 0)), _S.binary("*", _S.prop(_S.read(_v36, "q"), "Y"), _S.prop(_S.prop(_S.read(_v36, "s"), "N"), 1))), _S.binary("*", _S.prop(_S.read(_v36, "q"), "Z"), _S.prop(_S.prop(_S.read(_v36, "s"), "N"), 2))), _S.unary("-", 1), 1])]))
			_S.define(_v36, "f", _S.binary("+", 0.06, _S.binary("*", 3.1, _S.read(_v36, "age"))))
			_S.define(_v36, "k", _S.binary("*", _S.binary("-", 1, _S.read(_v36, "age")), (1 if _S.truth(_S.prop(_S.read(_v36, "s"), "big")) else 0.7)))
			_S.write(_v36, "rp", _S.invoke(_S.read(_v36, "Math"), "max", [_S.read(_v36, "rp"), _S.binary("*", _S.invoke(_S.read(_v36, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.read(_v36, "d"), _S.read(_v36, "f")), 0.15), 2))]), _S.read(_v36, "k")), (_S.binary("*", _S.binary("*", _S.binary("*", 0.22, _S.read(_v36, "k")), _S.read(_v36, "k")), _S.binary("-", 1, _S.binary("/", _S.read(_v36, "d"), _S.read(_v36, "f")))) if _S.truth(_S.binary("<", _S.read(_v36, "d"), _S.read(_v36, "f"))) else 0)]), "=", false)
			_S.define(_v36, "hr", (0.3 if _S.truth(_S.prop(_S.read(_v36, "s"), "big")) else 0.17))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v36, "age"), 0.55), func(): return _S.binary("<", _S.read(_v36, "d"), _S.read(_v36, "hr")))):
				_S.write(_v36, "hot", _S.invoke(_S.read(_v36, "Math"), "max", [_S.read(_v36, "hot"), (2 if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v36, "age"), 0.07), func(): return _S.binary("<", _S.read(_v36, "d"), _S.binary("*", _S.read(_v36, "hr"), 0.75)))) else _S.binary("*", _S.binary("**", _S.binary("-", 1, _S.binary("/", _S.read(_v36, "age"), 0.55)), 1.5), _S.binary("-", 1.1, _S.binary("/", _S.binary("*", 0.6, _S.read(_v36, "d")), _S.read(_v36, "hr")))))]), "=", false)
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "i", 1, "+=", true)
		_S.define(_v34, "gl", 0)
		if _S.truth(_S.call_value(_S.read(_v34, "glints"), [_S.read(_v34, "S"), _S.prop(_S.read(_v34, "q"), "q"), _S.prop(_S.read(_v34, "q"), "r")])):
			var _v37 = _S.scope(_v34)
			_S.define(_v37, "a", _S.call_value(_S.read(_v37, "since"), [_S.read(_v37, "t"), _S.call_value(_S.read(_v37, "glintAt"), [_S.read(_v37, "S"), _S.prop(_S.read(_v37, "q"), "q"), _S.prop(_S.read(_v37, "q"), "r")]), _S.read(_v37, "D")]))
			if _S.truth(_S.binary("<", _S.read(_v37, "a"), 0.45)):
				_S.write(_v37, "gl", _S.binary("-", 1, _S.binary("/", _S.read(_v37, "a"), 0.45)), "=", false)
		_S.define(_v34, "sc", _S.binary("*", _S.read(_v34, "scanK"), _S.invoke(_S.read(_v34, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("-", _S.prop(_S.read(_v34, "q"), "lat"), _S.read(_v34, "scanLat")), 0.09), 2))])))
		if _S.truth(_S.unary("!", _S.read(_v34, "near"))):
			var _v38 = _S.scope(_v34)
			if _S.truth(_S.prop(_S.read(_v38, "q"), "seam")):
				_S.invoke(_S.read(_v38, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v38, "q"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v38, "q"), "y"), 0.5), (_S.prop(_S.read(_v38, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v38, "rp"), 0.3)) else _S.prop(_S.read(_v38, "C"), 3)), _S.call_value(_S.read(_v38, "clamp"), [_S.binary("+", _S.binary("+", _S.binary("+", 0.18, _S.binary("*", 0.25, _S.read(_v38, "ff"))), _S.binary("*", 0.6, _S.read(_v38, "rp"))), _S.binary("*", 0.3, _S.read(_v38, "sc")))])])
			else:
				_S.invoke(_S.read(_v38, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v38, "q"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v38, "q"), "y"), 0.5), _S.prop(_S.read(_v38, "C"), 2), _S.binary("+", _S.binary("+", 0.04, _S.binary("*", 0.06, _S.read(_v38, "ff"))), _S.binary("*", 0.15, _S.read(_v38, "rp")))])
			continue
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v34, "q"), "sil"), 1.15)):
			var _v39 = _S.scope(_v34)
			_S.define(_v39, "lit", _S.binary("+", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v39, "q"), "X")), 0.55), _S.binary("*", _S.prop(_S.read(_v39, "q"), "Y"), 0.85)))
			_S.invoke(_S.read(_v39, "p"), "px", [_S.prop(_S.read(_v39, "q"), "x"), _S.prop(_S.read(_v39, "q"), "y"), (_S.read(_v39, "WHITE") if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v39, "rp"), 0.4), func(): return _S.binary(">", _S.read(_v39, "lit"), 0.8))) else (_S.prop(_S.read(_v39, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v39, "lit"), 0.3)) else _S.prop(_S.read(_v39, "C"), 5)))])
			_S.invoke(_S.read(_v39, "p"), "light", [_S.prop(_S.read(_v39, "q"), "x"), _S.prop(_S.read(_v39, "q"), "y"), _S.prop(_S.read(_v39, "C"), 4), 0.3])
			continue
		if _S.truth(_S.binary(">=", _S.read(_v34, "hot"), 2)):
			var _v40 = _S.scope(_v34)
			_S.invoke(_S.read(_v40, "p"), "px", [_S.prop(_S.read(_v40, "q"), "x"), _S.prop(_S.read(_v40, "q"), "y"), (_S.prop(_S.read(_v40, "C"), 6) if _S.truth(_S.prop(_S.read(_v40, "q"), "seam")) else _S.read(_v40, "WHITE"))])
			continue
		if _S.truth(_S.prop(_S.read(_v34, "q"), "seam")):
			var _v41 = _S.scope(_v34)
			_S.define(_v41, "I", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", 0.12, _S.binary("*", 0.5, _S.read(_v41, "ff"))), _S.binary("*", 0.08, _S.invoke(_S.read(_v41, "Math"), "sin", [_S.binary("-", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v41, "q"), "lon"), 2.3), _S.binary("*", _S.prop(_S.read(_v41, "q"), "lat"), 3)), _S.binary("*", _S.read(_v41, "ph"), _S.read(_v41, "TAU")))]))), (0.18 if _S.truth(_S.binary("<", _S.prop(_S.read(_v41, "q"), "corner"), 0.32)) else 0)), _S.binary("*", 0.9, _S.read(_v41, "gl"))), _S.binary("*", 0.7, _S.read(_v41, "sc"))), _S.binary("*", 1.3, _S.read(_v41, "rp"))), _S.read(_v41, "hot")))
			_S.define(_v41, "c", (_S.read(_v41, "WHITE") if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_v41, "gl"), 0.6), func(): return _S.binary(">", _S.read(_v41, "rp"), 0.55)), func(): return _S.binary(">", _S.read(_v41, "hot"), 0.5))) else (_S.prop(_S.read(_v41, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v41, "I"), 0.8)) else (_S.prop(_S.read(_v41, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v41, "I"), 0.55)) else _S.prop(_S.read(_v41, "C"), 4)))))
			if _S.truth(_S.binary(">", _S.read(_v41, "I"), 0.36)):
				_S.invoke(_S.read(_v41, "p"), "px", [_S.prop(_S.read(_v41, "q"), "x"), _S.prop(_S.read(_v41, "q"), "y"), _S.read(_v41, "c")])
			else:
				_S.invoke(_S.read(_v41, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v41, "q"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v41, "q"), "y"), 0.5), _S.read(_v41, "c"), _S.binary("+", 0.3, _S.read(_v41, "I"))])
			_S.invoke(_S.read(_v41, "p"), "light", [_S.prop(_S.read(_v41, "q"), "x"), _S.prop(_S.read(_v41, "q"), "y"), _S.prop(_S.read(_v41, "C"), 4), _S.binary("+", 0.04, _S.binary("*", 0.08, _S.read(_v41, "I")))])
		else:
			var _v42 = _S.scope(_v34)
			_S.define(_v42, "a", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("+", 0.05, _S.binary("*", _S.binary("*", 0.34, _S.read(_v42, "ff")), _S.prop(_S.read(_v42, "q"), "rim"))), _S.binary("*", 0.1, _S.binary("**", _S.prop(_S.read(_v42, "q"), "e"), 4))), (_S.binary("+", 0.12, _S.binary("*", 0.2, _S.read(_v42, "ff"))) if _S.truth(_S.prop(_S.read(_v42, "q"), "bevel")) else 0)), _S.binary("*", 0.35, _S.read(_v42, "gl"))), _S.binary("*", 0.1, _S.read(_v42, "sc"))), _S.binary("*", 0.3, _S.read(_v42, "rp"))), _S.binary("*", 0.6, _S.read(_v42, "hot"))))
			_S.define(_v42, "c", (_S.read(_v42, "WHITE") if _S.truth(_S.binary(">", _S.read(_v42, "hot"), 0.6)) else (_S.prop(_S.read(_v42, "C"), 6) if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v42, "hot"), 0.3), func(): return _S.binary(">", _S.read(_v42, "gl"), 0.5))) else (_S.prop(_S.read(_v42, "C"), 5) if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v42, "rp"), 0.4), func(): return _S.prop(_S.read(_v42, "q"), "bevel"))) else (_S.prop(_S.read(_v42, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v42, "ff"), 0.5)) else _S.prop(_S.read(_v42, "C"), 3))))))
			_S.invoke(_S.read(_v42, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v42, "q"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v42, "q"), "y"), 0.5), _S.read(_v42, "c"), _S.call_value(_S.read(_v42, "clamp"), [_S.read(_v42, "a")])])
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_v42, "rp"), 0.1), func(): return _S.binary(">", _S.read(_v42, "hot"), 0)), func(): return _S.binary(">", _S.read(_v42, "gl"), 0))):
				_S.invoke(_S.read(_v42, "p"), "light", [_S.prop(_S.read(_v42, "q"), "x"), _S.prop(_S.read(_v42, "q"), "y"), _S.prop(_S.read(_v42, "C"), 4), _S.binary("*", 0.06, _S.binary("+", _S.binary("+", _S.read(_v42, "rp"), _S.read(_v42, "hot")), _S.read(_v42, "gl")))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t"), _S.read(_e, "D")])

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "R", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "keep", _S.function_value(_e, "_f13"))
	_S.call_value(_S.read(_e, "band"), [_S.read(_e, "p"), 0, 0, _S.binary("+", _S.read(_e, "R"), 1), _S.read(_e, "SA"), 2, 1, [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 3), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 6)], _S.read(_e, "keep")])
	var _v43 = _S.scope(_e)
	_S.define(_v43, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v43, "i"), 10)):
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "g", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v44, "i"), 10), _S.read(_v44, "TAU")), 0.31))
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v44, "keep"), [_S.read(_v44, "g")]))):
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "i", 1, "+=", true)
			continue
		_S.define(_v44, "x", _S.binary("*", _S.invoke(_S.read(_v44, "Math"), "cos", [_S.read(_v44, "g")]), _S.binary("-", _S.read(_v44, "R"), 0.5)))
		_S.define(_v44, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v44, "Math"), "sin", [_S.read(_v44, "g")]), _S.read(_v44, "R")), _S.read(_v44, "SA")))
		_S.define(_v44, "k", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v44, "Math"), "cos", [_S.binary("*", _S.read(_v44, "TAU"), _S.binary("-", _S.binary("*", 2, _S.binary("/", _S.read(_v44, "t"), _S.read(_v44, "D"))), _S.binary("/", _S.read(_v44, "i"), 10)))]))))
		_S.invoke(_S.read(_v44, "p"), "px", [_S.binary("-", _S.read(_v44, "x"), 1), _S.read(_v44, "y"), _S.prop(_S.read(_v44, "C"), 2)])
		_S.invoke(_S.read(_v44, "p"), "px", [_S.binary("+", _S.read(_v44, "x"), 1), _S.read(_v44, "y"), _S.prop(_S.read(_v44, "C"), 2)])
		_S.invoke(_S.read(_v44, "p"), "px", [_S.read(_v44, "x"), _S.read(_v44, "y"), (_S.read(_v44, "WHITE") if _S.truth(_S.binary(">", _S.read(_v44, "k"), 0.6)) else _S.prop(_S.read(_v44, "C"), 5))])
		_S.invoke(_S.read(_v44, "p"), "glow", [_S.read(_v44, "x"), _S.read(_v44, "y"), _S.binary("+", 6, _S.binary("*", 4, _S.read(_v44, "k"))), _S.prop(_S.read(_v44, "C"), 4), _S.binary("*", (0.25 if _S.truth(_S.read(_v44, "near")) else 0.15), _S.binary("+", 0.4, _S.read(_v44, "k")))])
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "i", 1, "+=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "g")]), 0), _S.read(_e, "near"))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "radius"))
	var _v45 = _S.scope(_e)
	_S.define(_v45, "x", _S.unary("-", _S.read(_v45, "R")))
	while _S.truth(_S.binary("<=", _S.read(_v45, "x"), _S.read(_v45, "R"))):
		_S.invoke(_S.read(_v45, "p"), "glow", [_S.read(_v45, "x"), _S.unary("-", 1), 22, _S.prop(_S.read(_v45, "C"), 3), 0.1])
		_v45 = _S.iteration(_v45)
		_S.write(_v45, "x", _S.binary("/", _S.read(_v45, "R"), 3), "+=", false)
	_S.call_value(_S.read(_e, "drawFoot"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "R"), false])
	_S.call_value(_S.read(_e, "drawShell"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "C"), false])
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "SP", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "sparks"), 4]))
	_S.define(_e, "R", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "W", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)))
	_S.call_value(_S.read(_e, "drawShell"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "o"), _S.read(_e, "C"), true])
	_S.call_value(_S.read(_e, "drawFoot"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "R"), true])
	for _v46 in _S.array(_S.read(_e, "SHOTS")):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "s", _v46)
		var _v48 = _S.scope(_v47)
		_S.define(_v48, "age", _S.call_value(_S.read(_v48, "since"), [_S.read(_v48, "t"), _S.prop(_S.read(_v48, "s"), "t"), _S.read(_v48, "D")]))
		var _v49 = _S.call_value(_S.read(_v48, "project"), [_S.read(_v48, "R"), _S.prop(_S.read(_v48, "s"), "lon"), _S.prop(_S.read(_v48, "s"), "lat")])
		_S.define(_v48, "hx", _S.prop(_v49, 0))
		_S.define(_v48, "hy", _S.prop(_v49, 1))
		_S.define(_v48, "n", (1 if _S.truth(_S.prop(_S.read(_v48, "s"), "big")) else 0.6))
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v48, "s"), "big"), func(): return _S.binary("<", _S.read(_v48, "age"), 0.9))):
			var _v50 = _S.scope(_v48)
			_S.define(_v50, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v50, "smooth"), [0.35, 0.9, _S.read(_v50, "age")])))
			_S.define(_v50, "reach", _S.call_value(_S.read(_v50, "clamp"), [_S.binary("/", _S.read(_v50, "age"), 0.09)]))
			for _v51 in _S.array([0, 1]):
				var _v52 = _S.scope(_v50)
				_S.define(_v52, "pass", _v51)
				for _v53 in _S.array(_S.call_value(_S.read(_v52, "cracks"), [_S.read(_v52, "R"), _S.prop(_S.read(_v52, "o"), "seed"), _S.read(_v52, "s")])):
					var _v54 = _S.scope(_v52)
					_S.define(_v54, "c", _v53)
					var _v55 = _S.scope(_v54)
					_S.define(_v55, "i", 1)
					while _S.truth(_S.binary("<", _S.read(_v55, "i"), _S.prop(_S.read(_v55, "c"), "length"))):
						var _v56 = _S.scope(_v55)
						var _v57 = _S.prop(_S.read(_v56, "c"), _S.binary("-", _S.read(_v56, "i"), 1))
						_S.define(_v56, "x0", _S.prop(_v57, 0))
						_S.define(_v56, "y0", _S.prop(_v57, 1))
						_S.define(_v56, "f0", _S.prop(_v57, 2))
						var _v58 = _S.prop(_S.read(_v56, "c"), _S.read(_v56, "i"))
						_S.define(_v56, "x1", _S.prop(_v58, 0))
						_S.define(_v56, "y1", _S.prop(_v58, 1))
						_S.define(_v56, "f1", _S.prop(_v58, 2))
						_S.define(_v56, "u", _S.prop(_v58, 3))
						if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.read(_v56, "u"), _S.read(_v56, "reach")), func(): return _S.binary("<", _S.read(_v56, "f0"), 0.05)), func(): return _S.binary("<", _S.read(_v56, "f1"), 0.05))):
							_v55 = _S.iteration(_v55)
							_S.write(_v55, "i", 1, "+=", true)
							continue
						_S.define(_v56, "k", _S.binary("*", _S.read(_v56, "fade"), _S.binary("-", 1.2, _S.binary("*", _S.read(_v56, "u"), 0.4))))
						if _S.truth(_S.binary("===", _S.read(_v56, "pass"), 0)):
							var _v59 = _S.scope(_v56)
							if _S.truth(_S.binary("<", _S.read(_v59, "age"), 0.32)):
								for _v60 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
									var _v61 = _S.scope(_v59)
									var _v62 = _v60
									_S.define(_v61, "ox", _S.prop(_v62, 0))
									_S.define(_v61, "oy", _S.prop(_v62, 1))
									_S.invoke(_S.read(_v61, "p"), "line", [_S.binary("+", _S.read(_v61, "x0"), _S.read(_v61, "ox")), _S.binary("+", _S.read(_v61, "y0"), _S.read(_v61, "oy")), _S.binary("+", _S.read(_v61, "x1"), _S.read(_v61, "ox")), _S.binary("+", _S.read(_v61, "y1"), _S.read(_v61, "oy")), (_S.prop(_S.read(_v61, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v61, "age"), 0.12)) else _S.prop(_S.read(_v61, "C"), 5)), _S.binary("*", _S.read(_v61, "k"), _S.binary("-", 1, _S.binary("/", _S.read(_v61, "age"), 0.32)))])
							_v55 = _S.iteration(_v55)
							_S.write(_v55, "i", 1, "+=", true)
							continue
						_S.invoke(_S.read(_v56, "p"), "line", [_S.read(_v56, "x0"), _S.read(_v56, "y0"), _S.read(_v56, "x1"), _S.read(_v56, "y1"), (_S.read(_v56, "WHITE") if _S.truth(_S.binary("<", _S.read(_v56, "age"), _S.binary("+", 0.12, _S.binary("*", _S.read(_v56, "u"), 0.08)))) else (_S.prop(_S.read(_v56, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v56, "age"), _S.binary("+", 0.3, _S.binary("*", _S.read(_v56, "u"), 0.1)))) else _S.prop(_S.read(_v56, "C"), 5))), _S.read(_v56, "k")])
						if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v56, "i"), 3), 0)):
							_S.invoke(_S.read(_v56, "p"), "glow", [_S.read(_v56, "x1"), _S.read(_v56, "y1"), 6, _S.prop(_S.read(_v56, "C"), 4), _S.binary("*", _S.binary("*", 0.35, _S.read(_v56, "fade")), _S.binary("-", 1, _S.binary("*", _S.read(_v56, "u"), 0.5)))])
						_v55 = _S.iteration(_v55)
						_S.write(_v55, "i", 1, "+=", true)
		_S.define(_v48, "tk", _S.binary("/", _S.binary("-", _S.read(_v48, "t"), _S.binary("-", _S.prop(_S.read(_v48, "s"), "t"), 0.1)), 0.1))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v48, "tk"), 0), func(): return _S.binary("<", _S.read(_v48, "tk"), 1))):
			var _v63 = _S.scope(_v48)
			_S.define(_v63, "sx", _S.binary("-", _S.read(_v63, "W"), 3))
			_S.define(_v63, "sy", _S.binary("-", _S.read(_v63, "hy"), 12))
			_S.define(_v63, "L", _S.invoke(_S.read(_v63, "Math"), "hypot", [_S.binary("-", _S.read(_v63, "sx"), _S.read(_v63, "hx")), _S.binary("-", _S.read(_v63, "sy"), _S.read(_v63, "hy"))]))
			_S.define(_v63, "at", _S.function_value(_v63, "_f16"))
			_S.define(_v63, "h", _S.binary("*", _S.read(_v63, "L"), _S.read(_v63, "tk")))
			var _v64 = _S.call_value(_S.read(_v63, "at"), [_S.read(_v63, "h")])
			_S.define(_v63, "x", _S.prop(_v64, 0))
			_S.define(_v63, "y", _S.prop(_v64, 1))
			var _v65 = _S.call_value(_S.read(_v63, "at"), [_S.binary("-", _S.read(_v63, "h"), 2)])
			_S.define(_v63, "x2", _S.prop(_v65, 0))
			_S.define(_v63, "y2", _S.prop(_v65, 1))
			var _v66 = _S.call_value(_S.read(_v63, "at"), [_S.binary("-", _S.read(_v63, "h"), 7)])
			_S.define(_v63, "x7", _S.prop(_v66, 0))
			_S.define(_v63, "y7", _S.prop(_v66, 1))
			var _v67 = _S.call_value(_S.read(_v63, "at"), [_S.binary("-", _S.read(_v63, "h"), 16)])
			_S.define(_v63, "x16", _S.prop(_v67, 0))
			_S.define(_v63, "y16", _S.prop(_v67, 1))
			_S.invoke(_S.read(_v63, "p"), "line", [_S.read(_v63, "x16"), _S.read(_v63, "y16"), _S.read(_v63, "x7"), _S.read(_v63, "y7"), _S.prop(_S.read(_v63, "SP"), 3)])
			_S.invoke(_S.read(_v63, "p"), "line", [_S.read(_v63, "x7"), _S.read(_v63, "y7"), _S.read(_v63, "x2"), _S.read(_v63, "y2"), _S.prop(_S.read(_v63, "SP"), 1)])
			_S.invoke(_S.read(_v63, "p"), "line", [_S.read(_v63, "x2"), _S.read(_v63, "y2"), _S.read(_v63, "x"), _S.read(_v63, "y"), _S.prop(_S.read(_v63, "SP"), 0)])
			_S.invoke(_S.read(_v63, "p"), "px", [_S.read(_v63, "x"), _S.read(_v63, "y"), _S.read(_v63, "WHITE")])
			_S.invoke(_S.read(_v63, "p"), "glow", [_S.read(_v63, "x"), _S.read(_v63, "y"), 9, _S.prop(_S.read(_v63, "SP"), 1), 0.55])
		if _S.truth(_S.binary("<", _S.read(_v48, "age"), 0.14)):
			_S.call_value(_S.read(_v48, "sparkle"), [_S.read(_v48, "p"), _S.read(_v48, "hx"), _S.read(_v48, "hy"), _S.binary("*", _S.binary("+", _S.binary("*", 7, _S.binary("-", 1, _S.binary("/", _S.read(_v48, "age"), 0.14))), 1), _S.read(_v48, "n")), _S.prop(_S.read(_v48, "C"), 6), _S.prop(_S.read(_v48, "C"), 5), 0.4])
		_S.call_value(_S.read(_v48, "flash"), [_S.read(_v48, "p"), _S.read(_v48, "t"), _S.prop(_S.read(_v48, "s"), "t"), _S.read(_v48, "hx"), _S.read(_v48, "hy"), _S.binary("*", 56, _S.read(_v48, "n")), _S.prop(_S.read(_v48, "C"), 4), 0.45, 0.45])
		_S.call_value(_S.read(_v48, "flash"), [_S.read(_v48, "p"), _S.read(_v48, "t"), _S.prop(_S.read(_v48, "s"), "t"), _S.read(_v48, "hx"), _S.read(_v48, "hy"), 12, _S.read(_v48, "WHITE"), _S.binary("*", 0.5, _S.read(_v48, "n")), 0.08])
		_S.call_value(_S.read(_v48, "flash"), [_S.read(_v48, "p"), _S.read(_v48, "t"), _S.prop(_S.read(_v48, "s"), "t"), _S.binary("+", _S.read(_v48, "hx"), 3), _S.read(_v48, "hy"), 22, _S.prop(_S.read(_v48, "SP"), 1), _S.binary("*", 0.4, _S.read(_v48, "n")), 0.15])
	_S.define(_e, "a0", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "SHOTS"), 0), "t"), _S.read(_e, "D")]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.binary("*", _S.unary("-", _S.read(_e, "R")), 0.45), _S.binary("*", _S.read(_e, "R"), 1.3), _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.11, _S.binary("*", 0.1, _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("*", _S.read(_e, "a0"), 2))])))])
	_S.invoke(_S.invoke(_S.call_value(_S.read(_e, "ghosts"), [_S.read(_e, "o"), _S.read(_e, "C"), _S.read(_e, "R")]), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p")])
	return null

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return [_S.binary("+", _S.read(_e, "sx"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "hx"), _S.read(_e, "sx")), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "d")])), _S.read(_e, "L"))), _S.binary("+", _S.read(_e, "sy"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "hy"), _S.read(_e, "sy")), _S.invoke(_S.read(_e, "Math"), "max", [0, _S.read(_e, "d")])), _S.read(_e, "L")))]

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "s"), {"N": [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "lat")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "lon")])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "lat")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "lat")]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "lon")]))]}])

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "q"), _S.read(_e, "r"), 3]), 0.2)

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "S", _S.arg(_args, 0))
	_S.define(_e, "q", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "g", _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "S"), _S.read(_e, "q"), _S.read(_e, "r")]), 1.7))
	return (_S.binary("+", 1, _S.read(_e, "g")) if _S.truth(_S.binary("<", _S.read(_e, "g"), 1.4)) else _S.binary("-", _S.read(_e, "g"), 1.4))
