@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/diamond-wipe.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "lattice", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Diamond wipe"}, {"desc": "A wave of faceted diamonds swells across the screen, rims bright and ridges lit, cooling to black as they lock; then they rise as gems again and shrink away with glints."}, {"tags": ["diamond", "lattice", "geometric", "wipe"]}, {"duration": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "S", 32)
	_S.define(_e, "HD", _S.binary("+", _S.binary("/", _S.read(_e, "S"), 2), 1))
	_S.define(_e, "GROW", 0.24)
	_S.define(_e, "IN0", 0.04)
	_S.define(_e, "IN1", 0.66)
	_S.define(_e, "OUT0", 1.05)
	_S.define(_e, "OUT1", 1.56)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.arg(_args, 0))
	if _S.truth(_S.invoke(_S.read(_e, "cache"), "has", [_S.read(_e, "seed")])):
		return _S.invoke(_S.read(_e, "cache"), "get", [_S.read(_e, "seed")])
	_S.define(_e, "out", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "j"), _S.binary("+", _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("/", _S.read(_v0, "H"), _S.binary("/", _S.read(_v0, "S"), 2))]), 1))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "i"), _S.binary("+", _S.invoke(_S.read(_v1, "Math"), "ceil", [_S.binary("/", _S.read(_v1, "W"), _S.read(_v1, "S"))]), 1))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "cx", _S.binary("+", _S.binary("*", _S.read(_v2, "i"), _S.read(_v2, "S")), (_S.binary("/", _S.read(_v2, "S"), 2) if _S.truth(_S.binary("&", _S.read(_v2, "j"), 1)) else 0)))
			_S.define(_v2, "cy", _S.binary("/", _S.binary("*", _S.read(_v2, "j"), _S.read(_v2, "S")), 2))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.binary("+", _S.read(_v2, "cx"), _S.read(_v2, "HD")), 0), func(): return _S.binary("<", _S.binary("+", _S.read(_v2, "cy"), _S.read(_v2, "HD")), 0)), func(): return _S.binary(">", _S.binary("-", _S.read(_v2, "cx"), _S.read(_v2, "HD")), _S.read(_v2, "W"))), func(): return _S.binary(">", _S.binary("-", _S.read(_v2, "cy"), _S.read(_v2, "HD")), _S.read(_v2, "H")))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "i", 1, "+=", true)
				continue
			_S.define(_v2, "u", _S.call_value(_S.read(_v2, "clamp"), [_S.binary("/", _S.binary("+", _S.read(_v2, "cx"), _S.binary("*", 0.45, _S.read(_v2, "cy"))), _S.binary("+", _S.read(_v2, "W"), _S.binary("*", 0.45, _S.read(_v2, "H"))))]))
			_S.define(_v2, "jr", _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "i"), _S.read(_v2, "j"), _S.read(_v2, "seed")]))
			_S.invoke(_S.read(_v2, "out"), "push", [_S.merge([{"cx": _S.read(_v2, "cx")}, {"cy": _S.read(_v2, "cy")}, {"tin": _S.binary("+", _S.read(_v2, "IN0"), _S.binary("*", _S.binary("-", _S.read(_v2, "IN1"), _S.read(_v2, "IN0")), _S.call_value(_S.read(_v2, "clamp"), [_S.binary("+", _S.read(_v2, "u"), _S.binary("*", _S.binary("-", _S.read(_v2, "jr"), 0.5), 0.08))])))}, {"tout": _S.binary("+", _S.read(_v2, "OUT0"), _S.binary("*", _S.binary("-", _S.read(_v2, "OUT1"), _S.read(_v2, "OUT0")), _S.call_value(_S.read(_v2, "clamp"), [_S.binary("+", _S.read(_v2, "u"), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "i"), _S.read(_v2, "j"), _S.binary("+", _S.read(_v2, "seed"), 1)]), 0.5), 0.08))])))}, {"glint": _S.binary("<", _S.read(_v2, "jr"), 0.3)}, {"spin": _S.binary("*", _S.call_value(_S.read(_v2, "rand"), [_S.read(_v2, "i"), _S.read(_v2, "j"), _S.binary("+", _S.read(_v2, "seed"), 2)]), 3)}])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.define(_e, "L", _S.call_value(_S.read(_e, "lattice"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "glints", [])
	_S.define(_e, "FACE", [[_S.prop(_S.read(_e, "C"), 2), _S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0)], [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0)], [_S.prop(_S.read(_e, "C"), 1), _S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0)], [_S.prop(_S.read(_e, "C"), 0), _S.prop(_S.read(_e, "C"), 0), _S.read(_e, "ink")]])
	for _v3 in _S.array(_S.read(_e, "L")):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "d", _v3)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "ki", _S.binary("/", _S.binary("-", _S.read(_v5, "t"), _S.prop(_S.read(_v5, "d"), "tin")), _S.read(_v5, "GROW")))
		_S.define(_v5, "ko", _S.binary("/", _S.binary("-", _S.read(_v5, "t"), _S.prop(_S.read(_v5, "d"), "tout")), _S.read(_v5, "GROW")))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v5, "d"), "glint"), func(): return _S.binary(">", _S.read(_v5, "ko"), 0.7)), func(): return _S.binary("<", _S.read(_v5, "ko"), 1.5))):
			_S.invoke(_S.read(_v5, "glints"), "push", [[_S.read(_v5, "d"), _S.binary("/", _S.binary("-", _S.read(_v5, "ko"), 0.7), 0.8), 0]])
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v5, "ki"), 0), func(): return _S.binary(">=", _S.read(_v5, "ko"), 1))):
			continue
		_S.define(_v5, "hd", _S.binary("*", _S.read(_v5, "HD"), (_S.binary("-", 1, _S.invoke(_S.read(_v5, "ease"), "inBack", [_S.read(_v5, "ko"), 2])) if _S.truth(_S.binary(">", _S.read(_v5, "ko"), 0)) else _S.invoke(_S.read(_v5, "ease"), "outBack", [_S.invoke(_S.read(_v5, "Math"), "min", [1, _S.read(_v5, "ki")]), 2.2]))))
		_S.define(_v5, "heat", (_S.call_value(_S.read(_v5, "smooth"), [0, 0.35, _S.read(_v5, "ko")]) if _S.truth(_S.binary(">", _S.read(_v5, "ko"), 0)) else _S.binary("-", 1, _S.call_value(_S.read(_v5, "smooth"), [0.45, 1.25, _S.read(_v5, "ki")]))))
		if _S.truth(_S.binary("<", _S.read(_v5, "hd"), 0.5)):
			continue
		_S.define(_v5, "settled", _S.binary("<=", _S.read(_v5, "heat"), 0))
		_S.define(_v5, "y0", _S.invoke(_S.read(_v5, "Math"), "max", [0, _S.invoke(_S.read(_v5, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v5, "d"), "cy"), _S.read(_v5, "hd"))])]))
		_S.define(_v5, "y1", _S.invoke(_S.read(_v5, "Math"), "min", [_S.binary("-", _S.read(_v5, "H"), 1), _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("+", _S.prop(_S.read(_v5, "d"), "cy"), _S.read(_v5, "hd"))])]))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "y", _S.read(_v6, "y0"))
		while _S.truth(_S.binary("<=", _S.read(_v6, "y"), _S.read(_v6, "y1"))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "dy", _S.binary("-", _S.binary("+", _S.read(_v7, "y"), 0.5), _S.prop(_S.read(_v7, "d"), "cy")))
			_S.define(_v7, "w", _S.binary("-", _S.read(_v7, "hd"), _S.invoke(_S.read(_v7, "Math"), "abs", [_S.read(_v7, "dy")])))
			if _S.truth(_S.binary("<=", _S.read(_v7, "w"), 0)):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "y", 1, "+=", true)
				continue
			_S.define(_v7, "x0", _S.invoke(_S.read(_v7, "Math"), "max", [0, _S.invoke(_S.read(_v7, "Math"), "ceil", [_S.binary("-", _S.binary("-", _S.prop(_S.read(_v7, "d"), "cx"), _S.read(_v7, "w")), 0.5)])]))
			_S.define(_v7, "x1", _S.invoke(_S.read(_v7, "Math"), "min", [_S.binary("-", _S.read(_v7, "W"), 1), _S.invoke(_S.read(_v7, "Math"), "floor", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v7, "d"), "cx"), _S.read(_v7, "w")), 0.5)])]))
			if _S.truth(_S.binary("<", _S.read(_v7, "x1"), _S.read(_v7, "x0"))):
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "y", 1, "+=", true)
				continue
			if _S.truth(_S.read(_v7, "settled")):
				var _v8 = _S.scope(_v7)
				_S.call_value(_S.read(_v8, "rect"), [_S.read(_v8, "p0"), _S.read(_v8, "x0"), _S.read(_v8, "y"), _S.binary("+", _S.binary("-", _S.read(_v8, "x1"), _S.read(_v8, "x0")), 1), 1, _S.read(_v8, "ink")])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "y", 1, "+=", true)
				continue
			_S.define(_v7, "st", (0 if _S.truth(_S.binary(">", _S.read(_v7, "heat"), 0.66)) else (1 if _S.truth(_S.binary(">", _S.read(_v7, "heat"), 0.33)) else 2)))
			var _v9 = _S.scope(_v7)
			_S.define(_v9, "x", _S.read(_v9, "x0"))
			while _S.truth(_S.binary("<=", _S.read(_v9, "x"), _S.read(_v9, "x1"))):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "dx", _S.binary("-", _S.binary("+", _S.read(_v10, "x"), 0.5), _S.prop(_S.read(_v10, "d"), "cx")))
				_S.define(_v10, "e", _S.binary("-", _S.binary("-", _S.read(_v10, "hd"), _S.invoke(_S.read(_v10, "Math"), "abs", [_S.read(_v10, "dx")])), _S.invoke(_S.read(_v10, "Math"), "abs", [_S.read(_v10, "dy")])))
				_S.define(_v10, "q", _S.binary("+", (0 if _S.truth(_S.binary("<", _S.read(_v10, "dy"), 0)) else 2), (0 if _S.truth(_S.binary("<", _S.read(_v10, "dx"), 0)) else 1)))
				_S.define(_v10, "vr", _S.logical("&&", _S.binary(">", _S.read(_v10, "dx"), _S.unary("-", 1)), func(): return _S.binary("<=", _S.read(_v10, "dx"), 0)))
				_S.define(_v10, "hr", _S.logical("&&", _S.binary(">", _S.read(_v10, "dy"), _S.unary("-", 1)), func(): return _S.binary("<=", _S.read(_v10, "dy"), 0)))
				_S.define(_v10, "c", null)
				if _S.truth(_S.binary("<", _S.read(_v10, "e"), 1)):
					var _v11 = _S.scope(_v10)
					_S.define(_v11, "r", _S.prop([(_S.read(_v11, "WHITE") if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0.5)) else _S.prop(_S.read(_v11, "C"), 6)), (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0.5)) else _S.prop(_S.read(_v11, "C"), 5)), (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0.5)) else _S.prop(_S.read(_v11, "C"), 4)), (_S.prop(_S.read(_v11, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0.5)) else _S.prop(_S.read(_v11, "C"), 3))], _S.read(_v11, "q")))
					_S.write(_v11, "c", (_S.read(_v11, "r") if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0.15)) else _S.read(_v11, "ink")), "=", false)
					if _S.truth(_S.binary(">", _S.read(_v11, "heat"), 0.15)):
						_S.invoke(_S.read(_v11, "p0"), "light", [_S.read(_v11, "x"), _S.read(_v11, "y"), _S.prop(_S.read(_v11, "C"), 5), _S.binary("*", _S.binary("*", 0.4, _S.read(_v11, "heat")), (1 if _S.truth(_S.binary("===", _S.read(_v11, "q"), 0)) else 0.6))])
				else:
					if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v10, "e"), 2), func(): return _S.binary("===", _S.read(_v10, "q"), 0)), func(): return _S.binary(">", _S.read(_v10, "heat"), 0.4))):
						_S.write(_v10, "c", _S.prop(_S.read(_v10, "C"), 5), "=", false)
					else:
						if _S.truth(_S.logical("&&", _S.logical("||", _S.read(_v10, "vr"), func(): return _S.read(_v10, "hr")), func(): return _S.binary(">", _S.read(_v10, "heat"), 0.3))):
							var _v12 = _S.scope(_v10)
							_S.define(_v12, "tip", _S.logical("&&", _S.read(_v12, "vr"), func(): return _S.binary("<", _S.read(_v12, "dy"), _S.binary("+", _S.unary("-", _S.read(_v12, "hd")), 4))))
							_S.define(_v12, "sheen", _S.binary("<", _S.invoke(_S.read(_v12, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("+", _S.read(_v12, "x"), _S.read(_v12, "y")), _S.binary("*", _S.read(_v12, "t"), 260)), 90), 90), 90), 45)]), 3))
							_S.write(_v12, "c", (_S.read(_v12, "WHITE") if _S.truth(_S.logical("||", _S.read(_v12, "tip"), func(): return _S.logical("&&", _S.read(_v12, "sheen"), func(): return _S.binary(">", _S.read(_v12, "heat"), 0.5)))) else ((_S.prop(_S.read(_v12, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v12, "heat"), 0.6)) else _S.prop(_S.read(_v12, "C"), 5)) if _S.truth(_S.logical("&&", _S.read(_v12, "vr"), func(): return _S.binary("<", _S.read(_v12, "dy"), 0))) else (_S.prop(_S.read(_v12, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v12, "heat"), 0.6)) else _S.prop(_S.read(_v12, "C"), 2)))), "=", false)
						else:
							_S.write(_v10, "c", (_S.prop(_S.prop(_S.read(_v10, "FACE"), _S.read(_v10, "q")), _S.read(_v10, "st")) if _S.truth(_S.binary(">", _S.read(_v10, "heat"), 0.15)) else _S.read(_v10, "ink")), "=", false)
				_S.invoke(_S.read(_v10, "p0"), "px", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.read(_v10, "c")])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "x", 1, "+=", true)
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "y", 1, "+=", true)
		if _S.truth(_S.unary("!", _S.read(_v5, "settled"))):
			_S.invoke(_S.read(_v5, "p"), "glow", [_S.prop(_S.read(_v5, "d"), "cx"), _S.prop(_S.read(_v5, "d"), "cy"), _S.binary("+", _S.read(_v5, "hd"), 6), _S.prop(_S.read(_v5, "C"), 4), _S.binary("*", 0.22, _S.read(_v5, "heat"))])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v5, "ki"), 0.6), func(): return _S.binary("<", _S.read(_v5, "ki"), 1.8)), func(): return _S.prop(_S.read(_v5, "d"), "glint"))):
			_S.invoke(_S.read(_v5, "glints"), "push", [[_S.read(_v5, "d"), _S.binary("/", _S.binary("-", _S.read(_v5, "ki"), 0.6), 1.2), _S.read(_v5, "hd")]])
	for _v13 in _S.array(_S.read(_e, "glints")):
		var _v14 = _S.scope(_e)
		var _v15 = _v13
		_S.define(_v14, "d", _S.prop(_v15, 0))
		_S.define(_v14, "u", _S.prop(_v15, 1))
		_S.define(_v14, "hd", _S.prop(_v15, 2))
		var _v16 = _S.scope(_v14)
		if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_v16, "u"), 0), func(): return _S.binary(">=", _S.read(_v16, "u"), 1))):
			continue
		_S.define(_v16, "y", (_S.binary("-", _S.prop(_S.read(_v16, "d"), "cy"), _S.read(_v16, "hd")) if _S.truth(_S.read(_v16, "hd")) else _S.prop(_S.read(_v16, "d"), "cy")))
		_S.call_value(_S.read(_v16, "glint"), [_S.read(_v16, "p"), _S.prop(_S.read(_v16, "d"), "cx"), _S.read(_v16, "y"), _S.binary("*", 9, _S.invoke(_S.read(_v16, "Math"), "pow", [_S.invoke(_S.read(_v16, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_v16, "Math"), "PI"), _S.read(_v16, "u"))]), 0.7])), _S.binary("+", _S.prop(_S.read(_v16, "d"), "spin"), _S.binary("*", _S.read(_v16, "u"), 1.5)), _S.prop(_S.read(_v16, "C"), 6), _S.prop(_S.read(_v16, "C"), 5)])
	return null
