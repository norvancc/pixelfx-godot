@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/hit-flash.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "red", _S.import_value("core/index.js", "red"))
	_S.define(_e, "green", _S.import_value("core/index.js", "green"))
	_S.define(_e, "blue", _S.import_value("core/index.js", "blue"))
	_S.define(_e, "rgb", _S.import_value("core/index.js", "rgb"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Hit flash"}, {"desc": "The character takes damage: a white frame, then their own colors flushed red and blinking white, cooling off, while comic hit lines jab in at them."}, {"tags": ["impact", "hit", "damage", "hurt", "flash", "blink", "actor", "comic", "one-shot"]}, {"size": [80, 64]}, {"origin": [40, 54]}, {"duration": 0.5}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#14040a", "#3a0a14", "#6a101c", "#a01824", "#d42a30", "#ff5a50", "#ff9a8a"]}, {"lines": 7}, {"side": 1}, {"seed": 17}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BLOWN", _S.merge([{"x": _S.unary("-", 5)}, {"crouch": 4}, {"lean": _S.unary("-", 5)}, {"hx": _S.unary("-", 1)}, {"fx": 8}, {"fy": _S.unary("-", 33)}, {"bx": _S.unary("-", 11)}, {"by": _S.unary("-", 27)}, {"ffx": 9}, {"ffy": _S.unary("-", 7)}, {"fbx": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.26), _S.merge([_S.read(_e, "READY"), {"x": 0}])], [0, _S.read(_e, "BLOWN"), "snap"], [0.16, _S.merge([_S.read(_e, "BLOWN"), {"x": _S.unary("-", 8)}, {"crouch": 5}])], [0.42, _S.merge([_S.read(_e, "BLOWN"), {"x": _S.unary("-", 8)}, {"crouch": 5}, {"lean": _S.unary("-", 2)}, {"fx": 9}, {"fy": _S.unary("-", 22)}, {"bx": 6}, {"by": _S.unary("-", 20)}, {"ffy": _S.unary("-", 4)}])], [0.86, _S.merge([_S.read(_e, "READY"), {"x": 0}])]]}, {"hits": [_S.merge([{"t": 0}, {"stop": 0.07}, {"shake": 0.14}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "BEATS", [[0.025, "white"], [0.058, "white2"], [0.125, "red"], [0.158, "rim"], [0.36, "cool"]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "M", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "PX", _S.prop(_S.read(_e, "A"), "pixels"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "side"))
	var _v0 = _S.prop(_S.read(_e, "A"), "chest")
	_S.define(_e, "cx", _S.prop(_v0, 0))
	_S.define(_e, "cy", _S.prop(_v0, 1))
	_S.define(_e, "hx", _S.binary("+", _S.read(_e, "cx"), _S.binary("*", _S.read(_e, "S"), 12)))
	_S.define(_e, "hy", _S.binary("-", _S.read(_e, "cy"), 5))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "hx"), _S.read(_e, "hy"), 34, _S.read(_e, "WHITE"), 0.6, 0.1])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "cx"), _S.read(_e, "cy"), 30, _S.prop(_S.read(_e, "C"), 4), 0.5, 0.35])
	_S.define(_e, "reds", _S.construct(_S.read(_e, "Uint32Array"), [_S.prop(_S.read(_e, "PX"), "length")]))
	_S.define(_e, "tints", _S.construct(_S.read(_e, "Uint32Array"), [_S.prop(_S.read(_e, "PX"), "length")]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.prop(_S.read(_v1, "PX"), "length"))):
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.unary("!", _S.prop(_S.read(_v2, "PX"), _S.read(_v2, "i")))):
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
			continue
		_S.define(_v2, "l", _S.call_value(_S.read(_v2, "luma"), [_S.binary("|", _S.prop(_S.read(_v2, "PX"), _S.read(_v2, "i")), 4278190080)]))
		_S.set_prop(_S.read(_v2, "reds"), _S.read(_v2, "i"), _S.prop(_S.read(_v2, "C"), _S.call_value(_S.read(_v2, "clamp"), [_S.invoke(_S.read(_v2, "Math"), "round", [_S.binary("+", 2, _S.binary("*", _S.read(_v2, "l"), 5))]), 2, 6])), "=", false)
		_S.set_prop(_S.read(_v2, "tints"), _S.read(_v2, "i"), _S.call_value(_S.read(_v2, "mix"), [_S.binary("|", _S.prop(_S.read(_v2, "PX"), _S.read(_v2, "i")), 4278190080), _S.prop(_S.read(_v2, "C"), 4), 0.55]), "=", false)
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	_S.define(_e, "lines", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.prop(_S.read(_e, "o"), "lines")}]), _S.function_value(_e, "_f1")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "beat", _S.function_value(_e, "_f2"))
	_S.define(_e, "body", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "a", _S.binary("+", _S.binary("-", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 0.3), _S.binary("*", _S.binary("/", _S.binary("+", _S.read(_e, "i"), _S.invoke(_S.read(_e, "R"), "range", [0.25, 0.75])), _S.prop(_S.read(_e, "o"), "lines")), _S.binary("+", _S.prop(_S.read(_e, "Math"), "PI"), 0.6))))
	return _S.merge([{"a": _S.read(_e, "a")}, {"d": _S.invoke(_S.read(_e, "R"), "range", [15, 19])}, {"len": _S.invoke(_S.read(_e, "R"), "range", [6, 9])}, {"t0": _S.invoke(_S.read(_e, "R"), "range", [0, 0.04])}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	for _v3 in _S.array(_S.read(_e, "BEATS")):
		var _v4 = _S.scope(_e)
		var _v5 = _v3
		_S.define(_v4, "end", _S.prop(_v5, 0))
		_S.define(_v4, "b", _S.prop(_v5, 1))
		if _S.truth(_S.binary("<", _S.read(_v4, "t"), _S.read(_v4, "end"))):
			return _S.read(_v4, "b")
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "color", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "p"), "mask", [_S.read(_e, "M"), _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "y"), _S.function_value(_e, "_f4")])

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "color"), [_S.binary("+", _S.binary("*", _S.read(_e, "my"), _S.prop(_S.read(_e, "M"), "w")), _S.read(_e, "mx"))])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "beat"), []))
	if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "b"), "white"), func(): return _S.binary("===", _S.read(_e, "b"), "white2"))):
		var _v6 = _S.scope(_e)
		_S.call_value(_S.read(_v6, "body"), [_S.read(_v6, "p"), _S.function_value(_v6, "_f7")])
		_S.invoke(_S.read(_v6, "p"), "outline", [_S.read(_v6, "M"), _S.prop(_S.read(_v6, "A"), "x"), _S.prop(_S.read(_v6, "A"), "y"), (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("===", _S.read(_v6, "b"), "white")) else _S.prop(_S.read(_v6, "C"), 5))])
	else:
		if _S.truth(_S.binary("===", _S.read(_e, "b"), "red")):
			var _v7 = _S.scope(_e)
			_S.call_value(_S.read(_v7, "body"), [_S.read(_v7, "p"), _S.function_value(_v7, "_f8")])
			_S.invoke(_S.read(_v7, "p"), "outline", [_S.read(_v7, "M"), _S.prop(_S.read(_v7, "A"), "x"), _S.prop(_S.read(_v7, "A"), "y"), _S.prop(_S.read(_v7, "C"), 5)])
		else:
			if _S.truth(_S.binary("===", _S.read(_e, "b"), "rim")):
				_S.invoke(_S.read(_e, "p"), "outline", [_S.read(_e, "M"), _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "y"), _S.read(_e, "WHITE")])
			else:
				if _S.truth(_S.binary("===", _S.read(_e, "b"), "cool")):
					var _v8 = _S.scope(_e)
					_S.define(_v8, "k", _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v8, "t"), 0.158), _S.binary("-", 0.36, 0.158))))
					_S.call_value(_S.read(_v8, "body"), [_S.read(_v8, "p"), _S.function_value(_v8, "_f9")])
					if _S.truth(_S.binary(">", _S.read(_v8, "k"), 0.5)):
						_S.invoke(_S.read(_v8, "p"), "outline", [_S.read(_v8, "M"), _S.prop(_S.read(_v8, "A"), "x"), _S.prop(_S.read(_v8, "A"), "y"), _S.prop(_S.read(_v8, "C"), 4), _S.binary("*", _S.binary("-", _S.read(_v8, "k"), 0.5), 2)])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.07)):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "big", (1 if _S.truth(_S.binary("<", _S.read(_v9, "t"), 0.035)) else 1.3))
		_S.define(_v9, "k", (0 if _S.truth(_S.binary("<", _S.read(_v9, "t"), 0.035)) else 1))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), 8)):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v11, "i"), 8), _S.read(_v11, "TAU")), 0.2))
			_S.define(_v11, "L", _S.binary("*", (4 if _S.truth(_S.binary("%", _S.read(_v11, "i"), 2)) else 9), _S.read(_v11, "big")))
			_S.invoke(_S.read(_v11, "p"), "line", [_S.binary("+", _S.read(_v11, "hx"), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "L")), 0.45), _S.read(_v11, "k"))), _S.binary("+", _S.read(_v11, "hy"), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "L")), 0.45), _S.read(_v11, "k"))), _S.binary("+", _S.read(_v11, "hx"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), _S.read(_v11, "L"))), _S.binary("+", _S.read(_v11, "hy"), _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), _S.read(_v11, "L"))), _S.function_value(_v11, "_f10")])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		if _S.truth(_S.unary("!", _S.read(_v9, "k"))):
			for _v12 in _S.array([[0, 0], [1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v13 = _S.scope(_v9)
				var _v14 = _v12
				_S.define(_v13, "dx", _S.prop(_v14, 0))
				_S.define(_v13, "dy", _S.prop(_v14, 1))
				_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("+", _S.read(_v13, "hx"), _S.read(_v13, "dx")), _S.binary("+", _S.read(_v13, "hy"), _S.read(_v13, "dy")), _S.read(_v13, "WHITE")])
		_S.invoke(_S.read(_v9, "p"), "glow", [_S.read(_v9, "hx"), _S.read(_v9, "hy"), 14, _S.prop(_S.read(_v9, "C"), 6), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_v9, "t"), 0.07)))])
	for _v15 in _S.array(_S.read(_e, "lines")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "l", _v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "u", _S.binary("/", _S.binary("-", _S.read(_v17, "t"), _S.prop(_S.read(_v17, "l"), "t0")), 0.16))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v17, "u"), 0), func(): return _S.binary(">=", _S.read(_v17, "u"), 1))):
			continue
		_S.define(_v17, "d0", _S.binary("-", _S.prop(_S.read(_v17, "l"), "d"), _S.binary("*", 6, _S.invoke(_S.read(_v17, "ease"), "outCubic", [_S.read(_v17, "u")]))))
		_S.define(_v17, "L", _S.binary("*", _S.prop(_S.read(_v17, "l"), "len"), _S.binary("-", 1, _S.read(_v17, "u"))))
		_S.define(_v17, "ca", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.prop(_S.read(_v17, "l"), "a")]))
		_S.define(_v17, "sa", _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.prop(_S.read(_v17, "l"), "a")]), 1.15))
		if _S.truth(_S.binary("<", _S.read(_v17, "L"), 1)):
			continue
		_S.define(_v17, "w", _S.binary("/", _S.binary("-", 2.8, _S.binary("*", 1.6, _S.read(_v17, "u"))), 2))
		_S.define(_v17, "nx", _S.binary("*", _S.unary("-", _S.read(_v17, "sa")), _S.read(_v17, "w")))
		_S.define(_v17, "ny", _S.binary("*", _S.read(_v17, "ca"), _S.read(_v17, "w")))
		_S.define(_v17, "ex", _S.binary("+", _S.read(_v17, "cx"), _S.binary("*", _S.read(_v17, "ca"), _S.binary("+", _S.read(_v17, "d0"), _S.read(_v17, "L")))))
		_S.define(_v17, "ey", _S.binary("+", _S.read(_v17, "cy"), _S.binary("*", _S.read(_v17, "sa"), _S.binary("+", _S.read(_v17, "d0"), _S.read(_v17, "L")))))
		_S.define(_v17, "px0", _S.binary("+", _S.read(_v17, "cx"), _S.binary("*", _S.read(_v17, "ca"), _S.read(_v17, "d0"))))
		_S.define(_v17, "py0", _S.binary("+", _S.read(_v17, "cy"), _S.binary("*", _S.read(_v17, "sa"), _S.read(_v17, "d0"))))
		_S.invoke(_S.read(_v17, "p"), "poly", [[[_S.binary("-", _S.read(_v17, "px0"), _S.read(_v17, "ca")), _S.binary("-", _S.read(_v17, "py0"), _S.read(_v17, "sa"))], [_S.binary("+", _S.binary("+", _S.read(_v17, "ex"), _S.binary("*", _S.read(_v17, "nx"), 1.5)), _S.read(_v17, "ca")), _S.binary("+", _S.binary("+", _S.read(_v17, "ey"), _S.binary("*", _S.read(_v17, "ny"), 1.5)), _S.read(_v17, "sa"))], [_S.binary("+", _S.binary("-", _S.read(_v17, "ex"), _S.binary("*", _S.read(_v17, "nx"), 1.5)), _S.read(_v17, "ca")), _S.binary("+", _S.binary("-", _S.read(_v17, "ey"), _S.binary("*", _S.read(_v17, "ny"), 1.5)), _S.read(_v17, "sa"))]], _S.prop(_S.read(_v17, "C"), 3)])
		_S.invoke(_S.read(_v17, "p"), "poly", [[[_S.read(_v17, "px0"), _S.read(_v17, "py0")], [_S.binary("+", _S.read(_v17, "ex"), _S.read(_v17, "nx")), _S.binary("+", _S.read(_v17, "ey"), _S.read(_v17, "ny"))], [_S.binary("-", _S.read(_v17, "ex"), _S.read(_v17, "nx")), _S.binary("-", _S.read(_v17, "ey"), _S.read(_v17, "ny"))]], (_S.read(_v17, "WHITE") if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.5)) else _S.prop(_S.read(_v17, "C"), 6))])
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.read(_e, "t")), 0.08)]))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0.02)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "cx"), _S.read(_e, "cy"), 26, (_S.read(_e, "WHITE") if _S.truth(_S.logical("||", _S.binary("===", _S.read(_e, "b"), "white"), func(): return _S.binary("===", _S.read(_e, "b"), "white2"))) else _S.prop(_S.read(_e, "C"), 5)), _S.binary("*", 0.35, _S.read(_e, "k"))])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.read(_e, "WHITE")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "reds"), _S.read(_e, "i"))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.call_value(_S.read(_e, "mix"), [_S.binary("|", _S.prop(_S.read(_e, "PX"), _S.read(_e, "i")), 4278190080), _S.prop(_S.read(_e, "tints"), _S.read(_e, "i")), _S.read(_e, "k")])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "u"), 0.45), func(): return _S.unary("!", _S.read(_e, "k")))) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.75)) else _S.prop(_S.read(_e, "C"), 4)))
