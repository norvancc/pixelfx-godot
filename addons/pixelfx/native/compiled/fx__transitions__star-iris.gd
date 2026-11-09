@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/star-iris.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "starAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Star iris"}, {"desc": "A five-point star iris spins shut on the middle of the screen, its gold rim lit and its tips twinkling and shedding motes; it closes on a glint and spins open again from a flash."}, {"tags": ["iris", "star", "gold", "wipe"]}, {"duration": 2.2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "gold")}, {"focus": [160, 96]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CLOSE", 0.98)
	_S.define(_e, "OPEN0", 1.16)
	_S.define(_e, "OPEN1", 2)
	_S.define(_e, "RMAX", 430)
	_S.define(_e, "INNER", 0.46)
	_S.define(_e, "RW", 4)
	_S.define(_e, "points", _S.function_value(_e, "_f5"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLOSE"))):
		return _S.merge([{"r": _S.binary("*", _S.read(_e, "RMAX"), _S.binary("**", _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "inOutQuad", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "CLOSE"))])), 1.3))}, {"a": _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "CLOSE"))]), 1.6), _S.read(_e, "TAU")))}])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "OPEN0"))):
		return _S.merge([{"r": 0}, {"a": 0}])
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OPEN0")), _S.binary("-", _S.read(_e, "OPEN1"), _S.read(_e, "OPEN0")))]))
	return _S.merge([{"r": _S.binary("*", _S.read(_e, "RMAX"), _S.binary("**", _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.read(_e, "u")]), 1.15))}, {"a": _S.binary("-", _S.binary("/", _S.unary("-", _S.prop(_S.read(_e, "Math"), "PI")), 2), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "inOutCubic", [_S.read(_e, "u")]), 1.6), _S.read(_e, "TAU")))}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	var _v0 = _S.prop(_S.read(_e, "o"), "focus")
	_S.define(_e, "fx", _S.prop(_v0, 0))
	_S.define(_e, "fy", _S.prop(_v0, 1))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "shut", false)
	_S.define(_e, "opened", false)
	_S.define(_e, "prev", _S.call_value(_S.read(_e, "starAt"), [0]))
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "s", _S.call_value(_S.read(_e, "starAt"), [_S.read(_e, "t")]))
	_S.define(_e, "pts", _S.call_value(_S.read(_e, "points"), [_S.read(_e, "fx"), _S.read(_e, "fy"), _S.prop(_S.read(_e, "s"), "r"), _S.prop(_S.read(_e, "s"), "a")]))
	_S.define(_e, "spin", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "a"), _S.prop(_S.read(_e, "prev"), "a")), _S.read(_e, "dt")))
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "s"), "r"), 2)):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 10)):
			var _v2 = _S.scope(_v1)
			var _v3 = _S.prop(_S.read(_v2, "pts"), _S.read(_v2, "i"))
			_S.define(_v2, "x", _S.prop(_v3, 0))
			_S.define(_v2, "y", _S.prop(_v3, 1))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v2, "x"), 0), func(): return _S.binary("<", _S.read(_v2, "y"), 0)), func(): return _S.binary(">=", _S.read(_v2, "x"), _S.read(_v2, "W"))), func(): return _S.binary(">=", _S.read(_v2, "y"), _S.read(_v2, "H"))), func(): return _S.unary("!", _S.invoke(_S.read(_v2, "R"), "chance", [0.35])))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "i", 2, "+=", false)
				continue
			_S.define(_v2, "an", _S.binary("+", _S.prop(_S.read(_v2, "s"), "a"), _S.binary("/", _S.binary("*", _S.read(_v2, "i"), _S.prop(_S.read(_v2, "Math"), "PI")), 5)))
			_S.define(_v2, "v", _S.binary("*", _S.binary("*", _S.read(_v2, "spin"), _S.prop(_S.read(_v2, "s"), "r")), 0.25))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [(_S.prop(_S.read(_v2, "P"), "STAR") if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.6])) else _S.prop(_S.read(_v2, "P"), "MOTE")), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")])), _S.read(_v2, "v")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), 20)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), _S.read(_v2, "v")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")]), 20)), _S.invoke(_S.read(_v2, "Math"), "min", [_S.invoke(_S.read(_v2, "R"), "range", [0.25, 0.55]), _S.binary("-", _S.read(_v2, "end"), _S.read(_v2, "t"))]), (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 5)), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1.8])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 2, "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shut")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLOSE")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "shut", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "fx"), _S.read(_v4, "fy"), 60, _S.prop(_S.read(_v4, "C"), 5), 0.7, 0.3])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "opened")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OPEN0")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "opened", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "fx"), _S.read(_v5, "fy"), 120, _S.prop(_S.read(_v5, "C"), 5), 0.7, 0.4])
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "fx"), _S.read(_v5, "fy"), 40, _S.read(_v5, "WHITE"), 0.8, 0.12])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 24)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "v", _S.invoke(_S.read(_v7, "R"), "range", [60, 200]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "STAR"), _S.read(_v7, "fx"), _S.read(_v7, "fy"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.invoke(_S.read(_v7, "R"), "range", [0.3, 0.6]), (_S.read(_v7, "WHITE") if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.5])) else _S.prop(_S.read(_v7, "C"), 6)), _S.invoke(_S.read(_v7, "R"), "range", [0.6, 2])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	_S.write(_e, "prev", _S.read(_e, "s"), "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "starAt"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLOSE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "OPEN0")))):
		_S.call_value(_S.read(_e, "rect"), [_S.read(_e, "p0"), 0, 0, _S.read(_e, "W"), _S.read(_e, "H"), _S.read(_e, "ink")])
	else:
		if _S.truth(_S.binary("<", _S.prop(_S.read(_e, "s"), "r"), _S.binary("-", _S.read(_e, "RMAX"), 2))):
			var _v8 = _S.scope(_e)
			_S.define(_v8, "pts", _S.call_value(_S.read(_v8, "points"), [_S.read(_v8, "fx"), _S.read(_v8, "fy"), _S.prop(_S.read(_v8, "s"), "r"), _S.prop(_S.read(_v8, "s"), "a")]))
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "y", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "y"), _S.read(_v9, "H"))):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "yc", _S.binary("+", _S.read(_v10, "y"), 0.5))
				_S.define(_v10, "xs", [])
				var _v11 = _S.scope(_v10)
				_S.define(_v11, "i", 0)
				_S.define(_v11, "j", 9)
				while _S.truth(_S.binary("<", _S.read(_v11, "i"), 10)):
					var _v12 = _S.scope(_v11)
					var _v13 = _S.prop(_S.read(_v12, "pts"), _S.read(_v12, "i"))
					_S.define(_v12, "xi", _S.prop(_v13, 0))
					_S.define(_v12, "yi", _S.prop(_v13, 1))
					var _v14 = _S.prop(_S.read(_v12, "pts"), _S.read(_v12, "j"))
					_S.define(_v12, "xj", _S.prop(_v14, 0))
					_S.define(_v12, "yj", _S.prop(_v14, 1))
					if _S.truth(_S.binary("!==", _S.binary(">", _S.read(_v12, "yi"), _S.read(_v12, "yc")), _S.binary(">", _S.read(_v12, "yj"), _S.read(_v12, "yc")))):
						_S.invoke(_S.read(_v12, "xs"), "push", [_S.binary("+", _S.read(_v12, "xi"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_v12, "yc"), _S.read(_v12, "yi")), _S.binary("-", _S.read(_v12, "xj"), _S.read(_v12, "xi"))), _S.binary("-", _S.read(_v12, "yj"), _S.read(_v12, "yi"))))])
					_v11 = _S.iteration(_v11)
					_S.write(_v11, "j", _S.write(_v11, "i", 1, "+=", true), "=", false)
				_S.invoke(_S.read(_v10, "xs"), "sort", [_S.function_value(_v10, "_f4")])
				_S.define(_v10, "x", 0)
				var _v15 = _S.scope(_v10)
				_S.define(_v15, "k", 0)
				while _S.truth(_S.binary("<", _S.binary("+", _S.read(_v15, "k"), 1), _S.prop(_S.read(_v15, "xs"), "length"))):
					var _v16 = _S.scope(_v15)
					_S.define(_v16, "a", _S.call_value(_S.read(_v16, "clamp"), [_S.invoke(_S.read(_v16, "Math"), "round", [_S.prop(_S.read(_v16, "xs"), _S.read(_v16, "k"))]), 0, _S.read(_v16, "W")]))
					if _S.truth(_S.binary(">", _S.read(_v16, "a"), _S.read(_v16, "x"))):
						_S.call_value(_S.read(_v16, "rect"), [_S.read(_v16, "p0"), _S.read(_v16, "x"), _S.read(_v16, "y"), _S.binary("-", _S.read(_v16, "a"), _S.read(_v16, "x")), 1, _S.read(_v16, "ink")])
					_S.write(_v16, "x", _S.invoke(_S.read(_v16, "Math"), "max", [_S.read(_v16, "x"), _S.call_value(_S.read(_v16, "clamp"), [_S.invoke(_S.read(_v16, "Math"), "round", [_S.prop(_S.read(_v16, "xs"), _S.binary("+", _S.read(_v16, "k"), 1))]), 0, _S.read(_v16, "W")])]), "=", false)
					_v15 = _S.iteration(_v15)
					_S.write(_v15, "k", 2, "+=", false)
				if _S.truth(_S.binary("<", _S.read(_v10, "x"), _S.read(_v10, "W"))):
					_S.call_value(_S.read(_v10, "rect"), [_S.read(_v10, "p0"), _S.read(_v10, "x"), _S.read(_v10, "y"), _S.binary("-", _S.read(_v10, "W"), _S.read(_v10, "x")), 1, _S.read(_v10, "ink")])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "y", 1, "+=", true)
			var _v17 = _S.scope(_v8)
			_S.define(_v17, "i", 0)
			_S.define(_v17, "j", 9)
			while _S.truth(_S.binary("<", _S.read(_v17, "i"), 10)):
				var _v18 = _S.scope(_v17)
				var _v19 = _S.prop(_S.read(_v18, "pts"), _S.read(_v18, "j"))
				_S.define(_v18, "ax", _S.prop(_v19, 0))
				_S.define(_v18, "ay", _S.prop(_v19, 1))
				var _v20 = _S.prop(_S.read(_v18, "pts"), _S.read(_v18, "i"))
				_S.define(_v18, "bx", _S.prop(_v20, 0))
				_S.define(_v18, "by", _S.prop(_v20, 1))
				_S.define(_v18, "L", _S.invoke(_S.read(_v18, "Math"), "hypot", [_S.binary("-", _S.read(_v18, "bx"), _S.read(_v18, "ax")), _S.binary("-", _S.read(_v18, "by"), _S.read(_v18, "ay"))]))
				if _S.truth(_S.binary("<", _S.read(_v18, "L"), 0.5)):
					_v17 = _S.iteration(_v17)
					_S.write(_v17, "j", _S.write(_v17, "i", 1, "+=", true), "=", false)
					continue
				_S.define(_v18, "ux", _S.binary("/", _S.binary("-", _S.read(_v18, "bx"), _S.read(_v18, "ax")), _S.read(_v18, "L")))
				_S.define(_v18, "uy", _S.binary("/", _S.binary("-", _S.read(_v18, "by"), _S.read(_v18, "ay")), _S.read(_v18, "L")))
				_S.define(_v18, "nx", _S.unary("-", _S.read(_v18, "uy")))
				_S.define(_v18, "ny", _S.read(_v18, "ux"))
				_S.define(_v18, "lit", _S.binary(">", _S.binary("+", _S.binary("*", _S.read(_v18, "nx"), _S.unary("-", 0.6)), _S.binary("*", _S.read(_v18, "ny"), _S.unary("-", 0.8))), 0.1))
				var _v21 = _S.scope(_v18)
				_S.define(_v21, "sx", 0)
				while _S.truth(_S.binary("<=", _S.read(_v21, "sx"), _S.read(_v21, "L"))):
					var _v22 = _S.scope(_v21)
					_S.define(_v22, "x0", _S.binary("+", _S.read(_v22, "ax"), _S.binary("*", _S.read(_v22, "ux"), _S.read(_v22, "sx"))))
					_S.define(_v22, "y0", _S.binary("+", _S.read(_v22, "ay"), _S.binary("*", _S.read(_v22, "uy"), _S.read(_v22, "sx"))))
					if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v22, "x0"), _S.unary("-", _S.read(_v22, "RW"))), func(): return _S.binary("<", _S.read(_v22, "y0"), _S.unary("-", _S.read(_v22, "RW")))), func(): return _S.binary(">", _S.read(_v22, "x0"), _S.binary("+", _S.read(_v22, "W"), _S.read(_v22, "RW")))), func(): return _S.binary(">", _S.read(_v22, "y0"), _S.binary("+", _S.read(_v22, "H"), _S.read(_v22, "RW"))))):
						_v21 = _S.iteration(_v21)
						_S.write(_v21, "sx", 0.5, "+=", false)
						continue
					var _v23 = _S.scope(_v22)
					_S.define(_v23, "d", 0)
					while _S.truth(_S.binary("<", _S.read(_v23, "d"), _S.read(_v23, "RW"))):
						var _v24 = _S.scope(_v23)
						_S.define(_v24, "c", ((_S.read(_v24, "WHITE") if _S.truth(_S.read(_v24, "lit")) else _S.prop(_S.read(_v24, "C"), 6)) if _S.truth(_S.binary("<", _S.read(_v24, "d"), 1)) else (_S.prop(_S.read(_v24, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v24, "d"), 2)) else (_S.prop(_S.read(_v24, "C"), 4) if _S.truth(_S.binary("<", _S.read(_v24, "d"), 3)) else _S.prop(_S.read(_v24, "C"), 3)))))
						_S.invoke(_S.read(_v24, "p"), "px", [_S.binary("+", _S.read(_v24, "x0"), _S.binary("*", _S.read(_v24, "nx"), _S.read(_v24, "d"))), _S.binary("+", _S.read(_v24, "y0"), _S.binary("*", _S.read(_v24, "ny"), _S.read(_v24, "d"))), _S.read(_v24, "c")])
						_v23 = _S.iteration(_v23)
						_S.write(_v23, "d", 0.5, "+=", false)
					if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v22, "sx"), 2), 0)):
						_S.invoke(_S.read(_v22, "p"), "light", [_S.read(_v22, "x0"), _S.read(_v22, "y0"), _S.prop(_S.read(_v22, "C"), 5), 0.5])
					_v21 = _S.iteration(_v21)
					_S.write(_v21, "sx", 0.5, "+=", false)
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "j", _S.write(_v17, "i", 1, "+=", true), "=", false)
			var _v25 = _S.scope(_v8)
			_S.define(_v25, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v25, "i"), 10)):
				var _v26 = _S.scope(_v25)
				var _v27 = _S.prop(_S.read(_v26, "pts"), _S.read(_v26, "i"))
				_S.define(_v26, "x", _S.prop(_v27, 0))
				_S.define(_v26, "y", _S.prop(_v27, 1))
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v26, "x"), 2), func(): return _S.binary("<", _S.read(_v26, "y"), 2)), func(): return _S.binary(">", _S.read(_v26, "x"), _S.binary("-", _S.read(_v26, "W"), 2))), func(): return _S.binary(">", _S.read(_v26, "y"), _S.binary("-", _S.read(_v26, "H"), 2)))):
					_v25 = _S.iteration(_v25)
					_S.write(_v25, "i", 2, "+=", false)
					continue
				_S.call_value(_S.read(_v26, "glint"), [_S.read(_v26, "p"), _S.read(_v26, "x"), _S.read(_v26, "y"), _S.binary("+", 5, _S.binary("*", 3, _S.invoke(_S.read(_v26, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v26, "t"), 13), _S.read(_v26, "i"))]))), _S.binary("+", _S.binary("*", _S.read(_v26, "t"), 2), _S.read(_v26, "i")), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 5)])
				_v25 = _S.iteration(_v25)
				_S.write(_v25, "i", 2, "+=", false)
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v8, "s"), "r"), 140)):
				_S.invoke(_S.read(_v8, "p"), "glow", [_S.read(_v8, "fx"), _S.read(_v8, "fy"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v8, "s"), "r"), 0.7), 8), _S.prop(_S.read(_v8, "C"), 5), _S.binary("*", 0.35, _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v8, "s"), "r"), 140)))])
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "CLOSE")))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "u"), _S.unary("-", 0.05)), func(): return _S.binary("<", _S.read(_e, "u"), 0.2))):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "fx"), _S.read(_e, "fy"), _S.binary("*", 14, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]), 0.2))), _S.binary("*", _S.read(_e, "u"), 4), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)])
	_S.define(_e, "v", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "OPEN0")))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "v"), 0), func(): return _S.binary("<", _S.read(_e, "v"), 0.16))):
		_S.last([_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.read(_e, "fx"), _S.read(_e, "fy"), _S.binary("*", 18, _S.binary("-", 1, _S.binary("/", _S.read(_e, "v"), 0.16))), _S.binary("-", 0.3, _S.binary("*", _S.read(_e, "v"), 5)), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]), _S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "fx"), _S.read(_e, "fy"), 50, _S.read(_e, "WHITE"), _S.binary("*", 0.5, _S.binary("-", 1, _S.binary("/", _S.read(_e, "v"), 0.16)))])])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.read(_e, "a"), _S.read(_e, "b"))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "fx", _S.arg(_args, 0))
	_S.define(_e, "fy", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "a", _S.arg(_args, 3))
	return _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f6")])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "rr", (_S.binary("*", _S.read(_e, "r"), _S.read(_e, "INNER")) if _S.truth(_S.binary("%", _S.read(_e, "i"), 2)) else _S.read(_e, "r")))
	_S.define(_e, "an", _S.binary("+", _S.read(_e, "a"), _S.binary("/", _S.binary("*", _S.read(_e, "i"), _S.prop(_S.read(_e, "Math"), "PI")), 5)))
	return [_S.binary("+", _S.read(_e, "fx"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "an")]), _S.read(_e, "rr"))), _S.binary("+", _S.read(_e, "fy"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "an")]), _S.read(_e, "rr")))]
