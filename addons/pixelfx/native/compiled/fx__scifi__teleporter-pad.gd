@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/teleporter-pad.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f0"))
	_S.define(_e, "pad", _S.function_value(_e, "_f1"))
	_S.define(_e, "lift", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f4"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Teleporter pad"}, {"desc": "A steel pad glows on the floor, its rings rippling outward; a soft column of light rises off it and rings of light lift away, sparkles drifting up through them."}, {"tags": ["scifi", "teleporter", "pad", "portal", "beam", "spawn", "ground", "loop"]}, {"size": [96, 104]}, {"origin": [48, 92]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#120a26", "#26145a", "#3c2296", "#5a3ad2", "#7f66f0", "#b4a2ff", "#e6deff", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"seed": 26}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "RX", 31)
	_S.define(_e, "RY", 7)
	_S.define(_e, "PY", _S.unary("-", 3))
	_S.define(_e, "IN", 0.78)
	_S.define(_e, "HIGH", _S.unary("-", 84))
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ""))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "key")])
	_S.define(_e, "rn", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"box": [_S.unary("-", 46), _S.unary("-", 90), 46, 10]}])]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 40)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.invoke(_S.read(_v1, "rn"), "range", [0, _S.read(_v1, "TAU")]))
		_S.define(_v1, "r", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sqrt", [_S.invoke(_S.read(_v1, "rn"), "next", [])]), _S.read(_v1, "RX")), _S.read(_v1, "IN")), 0.9))
		_S.define(_v1, "star", _S.binary("===", _S.binary("%", _S.read(_v1, "i"), 3), 0))
		_S.invoke(_S.read(_v1, "g"), "add", [_S.invoke(_S.read(_v1, "rn"), "range", [0, _S.read(_v1, "D")]), (_S.prop(_S.read(_v1, "P"), "STAR") if _S.truth(_S.read(_v1, "star")) else _S.prop(_S.read(_v1, "P"), "MOTE")), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "r")), _S.binary("+", _S.read(_v1, "PY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "r")), _S.binary("/", _S.read(_v1, "RY"), _S.read(_v1, "RX")))), _S.invoke(_S.read(_v1, "rn"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v1, "rn"), "range", [30, 75])), _S.invoke(_S.read(_v1, "rn"), "range", [0.7, 1.3]), _S.invoke(_S.read(_v1, "rn"), "pick", [[_S.read(_v1, "WHITE"), _S.prop(_S.read(_v1, "C"), 6), _S.prop(_S.read(_v1, "C"), 5)]]), (_S.invoke(_S.read(_v1, "rn"), "range", [1.8, 3.4]) if _S.truth(_S.read(_v1, "star")) else _S.invoke(_S.read(_v1, "rn"), "range", [0.6, 1.2]))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "key"), _S.read(_e, "g")])
	return _S.read(_e, "g")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "H", _S.arg(_args, 3))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "RX")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "PY"), _S.read(_e, "RY")), 1), _S.binary("+", _S.read(_e, "RX"), 1), 2, _S.function_value(_e, "_f2")])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 10)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v5, "i"), 10), _S.read(_v5, "TAU")), 0.15))
		_S.define(_v5, "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "RX")), 0.885))
		_S.define(_v5, "y", _S.binary("+", _S.read(_v5, "PY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "RY")), 0.885)))
		_S.define(_v5, "k", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v5, "Math"), "cos", [_S.binary("*", _S.read(_v5, "TAU"), _S.binary("-", _S.binary("*", 2, _S.read(_v5, "ph")), _S.binary("/", _S.read(_v5, "i"), 10)))]))))
		_S.invoke(_S.read(_v5, "p"), "px", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.read(_v5, "WHITE") if _S.truth(_S.binary(">", _S.read(_v5, "k"), 0.7)) else (_S.prop(_S.read(_v5, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v5, "k"), 0.4)) else _S.prop(_S.read(_v5, "C"), 2)))])
		if _S.truth(_S.binary(">", _S.read(_v5, "k"), 0.5)):
			_S.invoke(_S.read(_v5, "p"), "glow", [_S.read(_v5, "x"), _S.read(_v5, "y"), 4, _S.prop(_S.read(_v5, "C"), 4), _S.binary("*", 0.35, _S.read(_v5, "k"))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "x"), _S.read(_e, "RX")))
	_S.define(_e, "v", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "PY")), _S.read(_e, "RY")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.binary("*", _S.read(_e, "v"), _S.read(_e, "v")))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		var _v2 = _S.scope(_e)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary("<=", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.read(_v2, "x")]), _S.read(_v2, "RX")), func(): return _S.binary(">", _S.read(_v2, "y"), _S.read(_v2, "PY"))), func(): return _S.binary("<=", _S.read(_v2, "y"), 1)), func(): return _S.binary("<=", _S.invoke(_S.read(_v2, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v2, "u"), _S.read(_v2, "u")), _S.binary("**", _S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v2, "y"), 3), _S.read(_v2, "PY")), _S.read(_v2, "RY")), 2))]), 1))):
			_S.set_prop(_S.read(_v2, "out"), "c", (_S.prop(_S.read(_v2, "H"), 0) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v2, "y"), 1), func(): return _S.binary(">", _S.invoke(_S.read(_v2, "Math"), "abs", [_S.read(_v2, "x")]), _S.binary("-", _S.read(_v2, "RX"), 1)))) else (_S.prop(_S.read(_v2, "H"), 3) if _S.truth(_S.binary("<", _S.read(_v2, "x"), _S.binary("*", _S.unary("-", _S.read(_v2, "RX")), 0.4))) else (_S.prop(_S.read(_v2, "H"), 1) if _S.truth(_S.binary(">", _S.read(_v2, "x"), _S.binary("*", _S.read(_v2, "RX"), 0.4))) else _S.prop(_S.read(_v2, "H"), 2)))), "=", false)
		return null
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.97)):
		return _S.set_prop(_S.read(_e, "out"), "c", _S.prop(_S.read(_e, "H"), 0), "=", false)
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.read(_e, "IN"))):
		var _v3 = _S.scope(_e)
		_S.set_prop(_S.read(_v3, "out"), "c", (_S.prop(_S.read(_v3, "H"), 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.binary("-", _S.read(_v3, "d"), _S.binary("+", _S.read(_v3, "IN"), 0.1))]), 0.03)) else (_S.prop(_S.read(_v3, "C"), 3) if _S.truth(_S.binary("<", _S.read(_v3, "d"), _S.binary("+", _S.read(_v3, "IN"), 0.03))) else (_S.prop(_S.read(_v3, "H"), 5) if _S.truth(_S.binary("<", _S.read(_v3, "v"), _S.unary("-", 0.3))) else (_S.prop(_S.read(_v3, "H"), 4) if _S.truth(_S.binary("<", _S.read(_v3, "v"), 0.2)) else _S.prop(_S.read(_v3, "H"), 3))))), "=", false)
		return null
	_S.define(_e, "r", _S.binary("/", _S.read(_e, "d"), _S.read(_e, "IN")))
	_S.define(_e, "ring", _S.binary("<", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("*", _S.read(_e, "r"), 3), _S.binary("*", _S.read(_e, "ph"), 3)), 1), 1), 1), 0.16))
	_S.define(_e, "heat", _S.binary("**", _S.binary("-", 1, _S.read(_e, "r")), 1.5))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "r"), 0.94)) else ((_S.read(_e, "WHITE") if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.3)) else _S.prop(_S.read(_e, "C"), 6)) if _S.truth(_S.read(_e, "ring")) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.55)) else (_S.prop(_S.read(_e, "C"), 5) if _S.truth(_S.binary(">", _S.read(_e, "heat"), 0.25)) else (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">", _S.read(_e, "r"), 0.8)) else _S.prop(_S.read(_e, "C"), 4)))))), "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "near", _S.arg(_args, 3))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "i"), 4)):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "k", _S.binary("/", _S.call_value(_S.read(_v7, "since"), [_S.read(_v7, "t"), _S.binary("*", _S.binary("/", _S.read(_v7, "i"), 4), _S.read(_v7, "D")), _S.read(_v7, "D")]), 1.25))
		if _S.truth(_S.binary(">=", _S.read(_v7, "k"), 1)):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
			continue
		_S.define(_v7, "y", _S.call_value(_S.read(_v7, "lerp"), [_S.read(_v7, "PY"), _S.binary("+", _S.read(_v7, "HIGH"), 12), _S.invoke(_S.read(_v7, "Math"), "pow", [_S.read(_v7, "k"), 0.85])]))
		_S.define(_v7, "rx", _S.binary("*", _S.binary("*", _S.read(_v7, "RX"), _S.read(_v7, "IN")), _S.binary("+", 1, _S.binary("*", 0.08, _S.read(_v7, "k")))))
		_S.define(_v7, "ry", _S.binary("*", _S.read(_v7, "rx"), _S.binary("/", _S.read(_v7, "RY"), _S.read(_v7, "RX"))))
		_S.define(_v7, "c", (_S.read(_v7, "WHITE") if _S.truth(_S.binary("<", _S.read(_v7, "k"), 0.12)) else (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v7, "k"), 0.4)) else (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v7, "k"), 0.65)) else (_S.prop(_S.read(_v7, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v7, "k"), 0.85)) else _S.prop(_S.read(_v7, "C"), 3))))))
		_S.define(_v7, "glint", _S.binary("*", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v7, "i"), 0.37), _S.binary("*", _S.read(_v7, "k"), 1.5)), 1), _S.read(_v7, "TAU")))
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "j", 0)
		_S.define(_v8, "n", _S.invoke(_S.read(_v8, "Math"), "ceil", [_S.binary("*", _S.read(_v8, "rx"), 7)]))
		while _S.truth(_S.binary("<", _S.read(_v8, "j"), _S.read(_v8, "n"))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "g", _S.binary("*", _S.binary("/", _S.read(_v9, "j"), _S.read(_v9, "n")), _S.read(_v9, "TAU")))
			_S.define(_v9, "sg", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "g")]))
			if _S.truth(_S.binary("!==", _S.binary(">=", _S.read(_v9, "sg"), 0), _S.read(_v9, "near"))):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "j", 1, "+=", true)
				continue
			_S.define(_v9, "x", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "g")]), _S.read(_v9, "rx")))
			_S.define(_v9, "yy", _S.binary("+", _S.read(_v9, "y"), _S.binary("*", _S.read(_v9, "sg"), _S.read(_v9, "ry"))))
			_S.define(_v9, "hot", _S.binary("<", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v9, "g"), _S.read(_v9, "glint")), _S.binary("*", _S.prop(_S.read(_v9, "Math"), "PI"), 3)), _S.read(_v9, "TAU")), _S.prop(_S.read(_v9, "Math"), "PI"))]), 0.25))
			if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v9, "k"), 0.85), func(): return _S.binary("&", _S.read(_v9, "j"), 1))):
				_v8 = _S.iteration(_v8)
				_S.write(_v8, "j", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x"), _S.read(_v9, "yy"), (_S.read(_v9, "WHITE") if _S.truth(_S.logical("&&", _S.read(_v9, "hot"), func(): return _S.binary("<", _S.read(_v9, "k"), 0.8))) else (_S.read(_v9, "c") if _S.truth(_S.read(_v9, "near")) else (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v9, "k"), 0.4)) else _S.prop(_S.read(_v9, "C"), 3))))])
			if _S.truth(_S.binary("<", _S.read(_v9, "k"), 0.3)):
				_S.invoke(_S.read(_v9, "p"), "px", [_S.read(_v9, "x"), _S.binary("+", _S.read(_v9, "yy"), 1), (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.read(_v9, "near")) else _S.prop(_S.read(_v9, "C"), 3))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "j", 1, "+=", true)
		if _S.truth(_S.read(_v7, "near")):
			_S.invoke(_S.read(_v7, "p"), "glow", [0, _S.binary("+", _S.read(_v7, "y"), _S.binary("*", _S.read(_v7, "ry"), 0.5)), _S.binary("+", _S.read(_v7, "rx"), 8), _S.prop(_S.read(_v7, "C"), 4), _S.binary("*", 0.22, _S.binary("-", 1, _S.read(_v7, "k")))])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "i", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "H", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "metal"), 6]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "pad"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "H")])
	_S.define(_e, "W", _S.binary("*", _S.read(_e, "RX"), _S.read(_e, "IN")))
	var _v10 = _S.scope(_e)
	_S.define(_v10, "y", _S.read(_v10, "HIGH"))
	while _S.truth(_S.binary("<", _S.read(_v10, "y"), _S.read(_v10, "PY"))):
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "v", _S.binary("/", _S.binary("-", _S.read(_v11, "y"), _S.read(_v11, "PY")), _S.binary("-", _S.read(_v11, "HIGH"), _S.read(_v11, "PY"))))
		_S.define(_v11, "fade", _S.binary("**", _S.binary("-", 1, _S.read(_v11, "v")), 1.6))
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "x", _S.invoke(_S.read(_v12, "Math"), "floor", [_S.unary("-", _S.read(_v12, "W"))]))
		while _S.truth(_S.binary("<=", _S.read(_v12, "x"), _S.invoke(_S.read(_v12, "Math"), "ceil", [_S.read(_v12, "W")]))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "q", _S.binary("/", _S.invoke(_S.read(_v13, "Math"), "abs", [_S.binary("+", _S.read(_v13, "x"), 0.5)]), _S.read(_v13, "W")))
			if _S.truth(_S.binary(">", _S.read(_v13, "q"), 1)):
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "x", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v13, "p"), "blend", [_S.binary("+", _S.read(_v13, "x"), 0.5), _S.binary("+", _S.read(_v13, "y"), 0.5), (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v13, "q"), 0.9)) else _S.prop(_S.read(_v13, "C"), 5)), _S.binary("*", _S.read(_v13, "fade"), _S.binary("+", _S.binary("+", 0.07, _S.binary("*", 0.26, _S.binary("**", _S.read(_v13, "q"), 4))), _S.binary("*", 0.12, _S.binary("**", _S.binary("-", 1, _S.read(_v13, "v")), 4))))])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "x", 1, "+=", true)
		_v10 = _S.iteration(_v10)
		_S.write(_v10, "y", 1, "+=", true)
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.binary("+", _S.prop(_S.read(_e, "o"), "seed"), 3), _S.function_value(_e, "_f5"), _S.function_value(_e, "_f6")])
	_S.call_value(_S.read(_e, "lift"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), false])
	var _v14 = _S.scope(_e)
	_S.define(_v14, "y", _S.binary("-", _S.read(_v14, "PY"), 6))
	while _S.truth(_S.binary(">", _S.read(_v14, "y"), _S.binary("+", _S.read(_v14, "HIGH"), 20))):
		_S.invoke(_S.read(_v14, "p"), "glow", [0, _S.read(_v14, "y"), _S.binary("+", _S.read(_v14, "W"), 8), _S.prop(_S.read(_v14, "C"), 4), _S.binary("*", 0.16, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v14, "y"), _S.read(_v14, "PY")), _S.binary("-", _S.read(_v14, "HIGH"), _S.read(_v14, "PY")))))])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "y", 12, "-=", false)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [0.6, 1.1])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "life", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "k", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "life")))
	_S.define(_e, "x", _S.binary("*", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.9), 0.9]), _S.read(_e, "W")))
	_S.define(_e, "y", _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.read(_e, "PY"), 2), _S.binary("+", _S.read(_e, "HIGH"), 10), _S.read(_e, "k")]))
	_S.define(_e, "L", _S.binary("+", 3, _S.binary("*", 7, _S.read(_e, "k"))))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "L")), _S.function_value(_e, "_f7"), _S.binary("*", _S.binary("-", 1, _S.read(_e, "k")), 1.2)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.3)) else _S.prop(_S.read(_e, "C"), 4))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")))
	_S.call_value(_S.read(_e, "lift"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), true])
	_S.invoke(_S.invoke(_S.call_value(_S.read(_e, "ghosts"), [_S.read(_e, "o"), _S.read(_e, "C")]), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p")])
	_S.define(_e, "k", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "ph"))]))))
	for _v15 in _S.array([_S.binary("*", _S.unary("-", _S.read(_e, "RX")), 0.6), 0, _S.binary("*", _S.read(_e, "RX"), 0.6)]):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "x", _v15)
		_S.invoke(_S.read(_v16, "p"), "glow", [_S.read(_v16, "x"), _S.read(_v16, "PY"), 20, _S.prop(_S.read(_v16, "C"), 4), _S.binary("*", 0.25, _S.read(_v16, "k"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "PY"), 10, _S.read(_e, "WHITE"), _S.binary("*", 0.3, _S.read(_e, "k"))])
	return null
