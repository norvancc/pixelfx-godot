@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/chest-open.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "coin", _S.import_value("fx/pickups/_lib.js", "coin"))
	_S.define(_e, "gemlet", _S.import_value("fx/pickups/_lib.js", "gemlet"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "lidRows", _S.function_value(_e, "_f0"))
	_S.define(_e, "paintHoard", _S.function_value(_e, "_f2"))
	_S.define(_e, "paintLid", _S.function_value(_e, "_f4"))
	_S.define(_e, "paintFront", _S.function_value(_e, "_f8"))
	_S.define(_e, "paintChest", _S.function_value(_e, "_f9"))
	_S.define(_e, "create", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Chest open"}, {"desc": "A banded chest rattles with gold light leaking from its seam, the lid kicks open, rays fan up, and coins and gems arc out, bounce, glint and get collected."}, {"tags": ["pickup", "chest", "treasure", "loot", "reward", "gold", "one-shot"]}, {"size": [176, 112]}, {"origin": [88, 96]}, {"duration": 4.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1e1206", "#4a2c08", "#86520c", "#c48412", "#f0b424", "#ffe066", "#fff6c4", "#ffffff"]}, {"wood": ["#110a10", "#24131a", "#3a1f1f", "#552d24", "#73402c", "#925737", "#b07246"]}, {"coins": 12}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GEMS", _S.invoke([["#2a0612", "#6e0f2a", "#b81c3c", "#f0405a", "#ff8a96", "#ffd2d6"], ["#06200f", "#0f4a26", "#1a8040", "#34c060", "#8af0a0", "#d8ffe0"], ["#0a1030", "#142a70", "#2050c0", "#3a8cf0", "#8ccaff", "#dcf0ff"], ["#1a0a2a", "#3e1466", "#6a28a8", "#a050e0", "#d09cff", "#f0e0ff"]], "map", [_S.function_value(_e, "_f29")]))
	_S.define(_e, "T_OPEN", 0.8)
	_S.define(_e, "T_COLLECT", 2.55)
	_S.define(_e, "T_POOF", 3.3)
	_S.define(_e, "RATTLES", [[0.1, 0.4], [0.32, 0.62], [0.5, 0.8], [0.64, 1]])
	_S.define(_e, "HW", 12)
	_S.define(_e, "FH", 9)
	_S.define(_e, "CS", 0.94)
	_S.define(_e, "SN", 0.34)
	_S.define(_e, "HB", _S.binary("/", _S.read(_e, "FH"), _S.read(_e, "CS")))
	_S.define(_e, "LA", 6)
	_S.define(_e, "LB", 5.5)
	_S.define(_e, "STRAPS", [_S.unary("-", 9), 7])
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 44]))
	_S.define(_e, "IL", _S.construct(_S.read(_e, "Layer"), [16, 16]))
	_S.define(_e, "tone", _S.function_value(_e, "_f30"))
	_S.define(_e, "IRON", _S.invoke(["#0e0d16", "#1d1c28", "#2f2e3e", "#474658", "#6a6a7e", "#9898ac"], "map", [_S.read(_e, "hex")]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "th", _S.arg(_args, 0))
	_S.define(_e, "best", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "ct", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))
	_S.define(_e, "st", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<=", _S.read(_v0, "i"), 260)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "al", _S.binary("*", _S.binary("/", _S.read(_v1, "i"), 260), _S.prop(_S.read(_v1, "Math"), "PI")))
		_S.define(_v1, "dz", _S.binary("+", _S.read(_v1, "LA"), _S.binary("*", _S.read(_v1, "LA"), _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "al")]))))
		_S.define(_v1, "dy", _S.binary("*", _S.read(_v1, "LB"), _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "al")])))
		_S.define(_v1, "z", _S.binary("-", _S.binary("+", _S.unary("-", _S.read(_v1, "LA")), _S.binary("*", _S.read(_v1, "dz"), _S.read(_v1, "ct"))), _S.binary("*", _S.read(_v1, "dy"), _S.read(_v1, "st"))))
		_S.define(_v1, "y", _S.binary("+", _S.binary("+", _S.read(_v1, "HB"), _S.binary("*", _S.read(_v1, "dz"), _S.read(_v1, "st"))), _S.binary("*", _S.read(_v1, "dy"), _S.read(_v1, "ct"))))
		if _S.truth(_S.binary("<", _S.read(_v1, "y"), _S.binary("-", _S.read(_v1, "HB"), 0.05))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "i", 1, "+=", true)
			continue
		_S.define(_v1, "nz", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "al")]), _S.read(_v1, "LA")))
		_S.define(_v1, "ny", _S.binary("/", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "al")]), _S.read(_v1, "LB")))
		_S.define(_v1, "nl", _S.invoke(_S.read(_v1, "Math"), "hypot", [_S.read(_v1, "nz"), _S.read(_v1, "ny")]))
		_S.last([_S.write(_v1, "nz", _S.read(_v1, "nl"), "/=", false), _S.write(_v1, "ny", _S.read(_v1, "nl"), "/=", false)])
		_S.define(_v1, "Nz", _S.binary("-", _S.binary("*", _S.read(_v1, "nz"), _S.read(_v1, "ct")), _S.binary("*", _S.read(_v1, "ny"), _S.read(_v1, "st"))))
		_S.define(_v1, "Ny", _S.binary("+", _S.binary("*", _S.read(_v1, "nz"), _S.read(_v1, "st")), _S.binary("*", _S.read(_v1, "ny"), _S.read(_v1, "ct"))))
		_S.define(_v1, "v", _S.binary("+", _S.binary("*", _S.read(_v1, "y"), _S.read(_v1, "CS")), _S.binary("*", _S.binary("-", _S.read(_v1, "LA"), _S.read(_v1, "z")), _S.read(_v1, "SN"))))
		_S.define(_v1, "dep", _S.binary("+", _S.binary("*", _S.read(_v1, "z"), _S.read(_v1, "CS")), _S.binary("*", _S.read(_v1, "y"), _S.read(_v1, "SN"))))
		_S.define(_v1, "row", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.unary("-", _S.read(_v1, "v"))]))
		_S.define(_v1, "cur", _S.invoke(_S.read(_v1, "best"), "get", [_S.read(_v1, "row")]))
		if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v1, "cur")), func(): return _S.binary(">", _S.read(_v1, "dep"), _S.prop(_S.read(_v1, "cur"), "dep")))):
			_S.invoke(_S.read(_v1, "best"), "set", [_S.read(_v1, "row"), _S.merge([{"row": _S.read(_v1, "row")}, {"al": _S.read(_v1, "al")}, {"dep": _S.read(_v1, "dep")}, {"out": _S.binary(">", _S.binary("+", _S.binary("*", _S.read(_v1, "Nz"), _S.read(_v1, "CS")), _S.binary("*", _S.read(_v1, "Ny"), _S.read(_v1, "SN"))), 0)}, {"lit": _S.binary("-", _S.binary("+", _S.binary("*", _S.read(_v1, "Ny"), 0.95), _S.binary("*", _S.read(_v1, "Nz"), 0.3)), 0.2)}])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.define(_e, "rows", _S.invoke(_S.concat([_S.array(_S.invoke(_S.read(_e, "best"), "values", []))]), "sort", [_S.function_value(_e, "_f1")]))
	_S.define(_e, "hi", null)
	for _v2 in _S.array(_S.read(_e, "rows")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "r", _v2)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v3, "r"), "out"), func(): return _S.logical("||", _S.unary("!", _S.read(_v3, "hi")), func(): return _S.binary(">", _S.prop(_S.read(_v3, "r"), "lit"), _S.prop(_S.read(_v3, "hi"), "lit"))))):
			_S.write(_v3, "hi", _S.read(_v3, "r"), "=", false)
	if _S.truth(_S.logical("&&", _S.read(_e, "hi"), func(): return _S.binary(">", _S.prop(_S.read(_e, "hi"), "lit"), 0.5))):
		_S.set_prop(_S.read(_e, "hi"), "crest", true, "=", false)
	for _v4 in _S.array([_S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 3), _S.binary("/", _S.binary("*", 2, _S.prop(_S.read(_e, "Math"), "PI")), 3)]):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "s", _v4)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "k", null)
		for _v7 in _S.array(_S.read(_v6, "rows")):
			var _v8 = _S.scope(_v6)
			_S.define(_v8, "r", _v7)
			if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v8, "k")), func(): return _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v8, "r"), "al"), _S.read(_v8, "s"))]), _S.invoke(_S.read(_v8, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v8, "k"), "al"), _S.read(_v8, "s"))])))):
				_S.write(_v8, "k", _S.read(_v8, "r"), "=", false)
		if _S.truth(_S.logical("&&", _S.read(_v6, "k"), func(): return _S.binary("<", _S.invoke(_S.read(_v6, "Math"), "abs", [_S.binary("-", _S.prop(_S.read(_v6, "k"), "al"), _S.read(_v6, "s"))]), 0.4))):
			_S.set_prop(_S.read(_v6, "k"), "seam", true, "=", false)
	return _S.read(_e, "rows")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.prop(_S.read(_e, "a"), "row"), _S.prop(_S.read(_e, "b"), "row"))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	_S.define(_e, "heat", _S.function_value(_e, "_f3"))
	var _v9 = _S.scope(_e)
	_S.define(_v9, "y", _S.unary("-", 13))
	while _S.truth(_S.binary("<=", _S.read(_v9, "y"), _S.unary("-", 10))):
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "x", _S.unary("-", _S.read(_v10, "HW")))
		while _S.truth(_S.binary("<", _S.read(_v10, "x"), _S.read(_v10, "HW"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "h", _S.call_value(_S.read(_v11, "rand"), [_S.read(_v11, "x"), _S.read(_v11, "y"), 7]))
			_S.define(_v11, "k", (5 if _S.truth(_S.binary("<", _S.read(_v11, "h"), 0.18)) else (4 if _S.truth(_S.binary("<", _S.read(_v11, "h"), 0.55)) else 3)))
			_S.invoke(_S.read(_v11, "L"), "set", [_S.read(_v11, "x"), _S.read(_v11, "y"), (_S.prop(_S.read(_v11, "W"), 2) if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v11, "y"), _S.unary("-", 13)), func(): return _S.binary(">", _S.invoke(_S.read(_v11, "Math"), "abs", [_S.binary("+", _S.read(_v11, "x"), 0.5)]), 9))) else _S.call_value(_S.read(_v11, "heat"), [_S.binary("-", _S.read(_v11, "k"), (1 if _S.truth(_S.binary("===", _S.read(_v11, "y"), _S.unary("-", 13))) else 0))]))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "x", 1, "+=", true)
		_v9 = _S.iteration(_v9)
		_S.write(_v9, "y", 1, "+=", true)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "x", _S.unary("-", 9))
	while _S.truth(_S.binary("<", _S.read(_v12, "x"), 9)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "top", _S.binary("-", _S.unary("-", 13), _S.invoke(_S.read(_v13, "Math"), "round", [_S.binary("*", 2.2, _S.invoke(_S.read(_v13, "Math"), "pow", [_S.invoke(_S.read(_v13, "Math"), "cos", [_S.binary("*", _S.binary("/", _S.binary("+", _S.read(_v13, "x"), 0.5), 10), _S.binary("/", _S.prop(_S.read(_v13, "Math"), "PI"), 2))]), 1.4]))])))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "y", _S.read(_v14, "top"))
		while _S.truth(_S.binary("<", _S.read(_v14, "y"), _S.unary("-", 13))):
			_S.invoke(_S.read(_v14, "L"), "set", [_S.read(_v14, "x"), _S.read(_v14, "y"), _S.call_value(_S.read(_v14, "heat"), [(5 if _S.truth(_S.binary("===", _S.read(_v14, "y"), _S.read(_v14, "top"))) else _S.binary("+", 4, (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v14, "rand"), [_S.read(_v14, "x"), _S.read(_v14, "y"), 3]), 0.3)) else 0)))])])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "y", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "x", 1, "+=", true)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "k"), _S.binary("*", _S.read(_e, "g"), 2.2))]), 0, 7]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "th", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	_S.define(_e, "rows", _S.call_value(_S.read(_e, "lidRows"), [_S.read(_e, "th")]))
	_S.define(_e, "heat", _S.function_value(_e, "_f5"))
	_S.define(_e, "top", (_S.prop(_S.prop(_S.read(_e, "rows"), 0), "row") if _S.truth(_S.prop(_S.read(_e, "rows"), "length")) else 0))
	for _v15 in _S.array(_S.read(_e, "rows")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "r", _v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "u", _S.prop(_S.read(_v17, "r"), "al"))
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "x", _S.unary("-", _S.read(_v18, "HW")))
		while _S.truth(_S.binary("<", _S.read(_v18, "x"), _S.read(_v18, "HW"))):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "strap", _S.invoke(_S.read(_v19, "STRAPS"), "some", [_S.function_value(_v19, "_f6")]))
			_S.define(_v19, "left", _S.invoke(_S.read(_v19, "STRAPS"), "some", [_S.function_value(_v19, "_f7")]))
			_S.define(_v19, "side", _S.binary("/", _S.binary("+", _S.binary("+", _S.read(_v19, "x"), _S.read(_v19, "HW")), 0.5), _S.binary("*", 2, _S.read(_v19, "HW"))))
			_S.define(_v19, "corner", _S.logical("||", _S.binary("===", _S.read(_v19, "x"), _S.unary("-", _S.read(_v19, "HW"))), func(): return _S.binary("===", _S.read(_v19, "x"), _S.binary("-", _S.read(_v19, "HW"), 1))))
			_S.define(_v19, "c", null)
			if _S.truth(_S.prop(_S.read(_v19, "r"), "out")):
				var _v20 = _S.scope(_v19)
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.prop(_S.read(_v20, "r"), "row"), _S.read(_v20, "top")), func(): return _S.read(_v20, "corner")), func(): return _S.binary("<", _S.read(_v20, "th"), 0.6))):
					_v18 = _S.iteration(_v18)
					_S.write(_v18, "x", 1, "+=", true)
					continue
				_S.define(_v20, "l", _S.binary("-", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v20, "r"), "lit"), 0.2), _S.binary("*", _S.read(_v20, "side"), 0.35)), (0.45 if _S.truth(_S.binary("===", _S.prop(_S.read(_v20, "r"), "row"), _S.read(_v20, "top"))) else 0)))
				if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v20, "u"), 0.3), func(): return _S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v20, "u"), 0.55), func(): return _S.binary(">=", _S.read(_v20, "x"), _S.unary("-", 2))), func(): return _S.binary("<=", _S.read(_v20, "x"), 1)))):
					_S.write(_v20, "c", _S.call_value(_S.read(_v20, "tone"), [_S.read(_v20, "C"), _S.binary("+", _S.read(_v20, "l"), (0.15 if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v20, "x"), _S.unary("-", 2)), func(): return _S.binary("<=", _S.read(_v20, "x"), 1))) else 0.1)), [6, 5, 5, 4, 3]]), "=", false)
				else:
					if _S.truth(_S.read(_v20, "corner")):
						_S.write(_v20, "c", (_S.prop(_S.read(_v20, "IRON"), 4) if _S.truth(_S.binary("<", _S.read(_v20, "x"), 0)) else _S.prop(_S.read(_v20, "IRON"), 2)), "=", false)
					else:
						if _S.truth(_S.read(_v20, "strap")):
							_S.write(_v20, "c", _S.call_value(_S.read(_v20, "tone"), [_S.read(_v20, "IRON"), _S.binary("+", _S.read(_v20, "l"), (0.3 if _S.truth(_S.read(_v20, "left")) else _S.unary("-", 0.3))), [5, 4, 3, 2, 1]]), "=", false)
						else:
							if _S.truth(_S.prop(_S.read(_v20, "r"), "seam")):
								_S.write(_v20, "c", _S.prop(_S.read(_v20, "W"), 0), "=", false)
							else:
								var _v21 = _S.scope(_v20)
								_S.write(_v21, "c", (_S.prop(_S.read(_v21, "W"), 6) if _S.truth(_S.logical("&&", _S.prop(_S.read(_v21, "r"), "crest"), func(): return _S.binary("<", _S.read(_v21, "side"), 0.62))) else _S.call_value(_S.read(_v21, "tone"), [_S.read(_v21, "W"), _S.read(_v21, "l"), [5, 4, 3, 2, 1]])), "=", false)
								if _S.truth(_S.binary("<", _S.call_value(_S.read(_v21, "rand"), [_S.binary(">>", _S.read(_v21, "x"), 1), _S.invoke(_S.read(_v21, "Math"), "round", [_S.binary("*", _S.read(_v21, "u"), 6)]), 11]), 0.2)):
									_S.write(_v21, "c", _S.prop(_S.read(_v21, "W"), _S.invoke(_S.read(_v21, "Math"), "max", [0, _S.binary("-", _S.invoke(_S.read(_v21, "W"), "indexOf", [_S.read(_v21, "c")]), 1)])), "=", false)
			else:
				var _v22 = _S.scope(_v19)
				_S.define(_v22, "k", _S.binary("*", _S.read(_v22, "g"), _S.invoke(_S.read(_v22, "Math"), "pow", [_S.binary("/", _S.read(_v22, "u"), _S.prop(_S.read(_v22, "Math"), "PI")), 1.3])))
				if _S.truth(_S.binary("<", _S.read(_v22, "u"), 0.3)):
					_S.write(_v22, "c", _S.call_value(_S.read(_v22, "heat"), [1]), "=", false)
				else:
					if _S.truth(_S.prop(_S.read(_v22, "r"), "seam")):
						_S.write(_v22, "c", _S.prop(_S.read(_v22, "W"), 0), "=", false)
					else:
						_S.write(_v22, "c", (_S.call_value(_S.read(_v22, "mix"), [_S.prop(_S.read(_v22, "W"), 4), _S.prop(_S.read(_v22, "C"), 5), 0.3]) if _S.truth(_S.binary(">", _S.read(_v22, "k"), 0.6)) else (_S.prop(_S.read(_v22, "W"), 3) if _S.truth(_S.binary(">", _S.read(_v22, "k"), 0.35)) else (_S.prop(_S.read(_v22, "W"), 2) if _S.truth(_S.binary(">", _S.read(_v22, "k"), 0.15)) else _S.prop(_S.read(_v22, "W"), 1)))), "=", false)
				if _S.truth(_S.read(_v22, "corner")):
					_S.write(_v22, "c", _S.prop(_S.read(_v22, "W"), 0), "=", false)
			_S.invoke(_S.read(_v19, "L"), "set", [_S.read(_v19, "x"), _S.prop(_S.read(_v19, "r"), "row"), _S.read(_v19, "c")])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "x", 1, "+=", true)
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "C"), _S.call_value(_S.read(_e, "clamp"), [_S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", _S.read(_e, "k"), _S.binary("*", _S.read(_e, "g"), 2.2))]), 0, 7]))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.logical("||", _S.binary("===", _S.read(_e, "x"), _S.read(_e, "s")), func(): return _S.binary("===", _S.read(_e, "x"), _S.binary("+", _S.read(_e, "s"), 1)))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.binary("===", _S.read(_e, "x"), _S.read(_e, "s"))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "g", _S.arg(_args, 2))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "y", _S.unary("-", _S.read(_v23, "FH")))
	while _S.truth(_S.binary("<=", _S.read(_v23, "y"), _S.unary("-", 1))):
		var _v24 = _S.scope(_v23)
		_S.define(_v24, "x", _S.unary("-", _S.read(_v24, "HW")))
		while _S.truth(_S.binary("<", _S.read(_v24, "x"), _S.read(_v24, "HW"))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "side", _S.binary("/", _S.binary("+", _S.binary("+", _S.read(_v25, "x"), _S.read(_v25, "HW")), 0.5), _S.binary("*", 2, _S.read(_v25, "HW"))))
			_S.define(_v25, "c", null)
			if _S.truth(_S.binary("===", _S.read(_v25, "y"), _S.unary("-", _S.read(_v25, "FH")))):
				_S.write(_v25, "c", (_S.prop(_S.read(_v25, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v25, "side"), 0.3)) else (_S.prop(_S.read(_v25, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v25, "side"), 0.7)) else _S.prop(_S.read(_v25, "C"), 4))), "=", false)
			else:
				if _S.truth(_S.binary("===", _S.read(_v25, "y"), _S.unary("-", 1))):
					_S.write(_v25, "c", _S.prop(_S.read(_v25, "W"), 1), "=", false)
				else:
					if _S.truth(_S.binary("===", _S.read(_v25, "y"), _S.unary("-", 5))):
						_S.write(_v25, "c", _S.prop(_S.read(_v25, "W"), 0), "=", false)
					else:
						var _v26 = _S.scope(_v25)
						_S.define(_v26, "top", _S.logical("||", _S.binary("===", _S.read(_v26, "y"), _S.unary("-", 8)), func(): return _S.binary("===", _S.read(_v26, "y"), _S.unary("-", 4))))
						_S.define(_v26, "bot", _S.logical("||", _S.binary("===", _S.read(_v26, "y"), _S.unary("-", 6)), func(): return _S.binary("===", _S.read(_v26, "y"), _S.unary("-", 2))))
						_S.write(_v26, "c", _S.prop(_S.read(_v26, "W"), ((4 if _S.truth(_S.binary("<", _S.read(_v26, "side"), 0.45)) else 3) if _S.truth(_S.read(_v26, "top")) else (2 if _S.truth(_S.read(_v26, "bot")) else 3))), "=", false)
						if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_v26, "top")), func(): return _S.binary("<", _S.call_value(_S.read(_v26, "rand"), [_S.binary(">>", _S.read(_v26, "x"), 1), _S.read(_v26, "y"), 5]), 0.2))):
							_S.write(_v26, "c", _S.prop(_S.read(_v26, "W"), (1 if _S.truth(_S.read(_v26, "bot")) else 2)), "=", false)
			if _S.truth(_S.binary("===", _S.read(_v25, "x"), _S.unary("-", _S.read(_v25, "HW")))):
				_S.write(_v25, "c", (_S.prop(_S.read(_v25, "C"), 5) if _S.truth(_S.binary("===", _S.read(_v25, "y"), _S.unary("-", _S.read(_v25, "FH")))) else _S.prop(_S.read(_v25, "IRON"), 4)), "=", false)
			if _S.truth(_S.binary("===", _S.read(_v25, "x"), _S.binary("-", _S.read(_v25, "HW"), 1))):
				_S.write(_v25, "c", (_S.prop(_S.read(_v25, "C"), 3) if _S.truth(_S.binary("===", _S.read(_v25, "y"), _S.unary("-", _S.read(_v25, "FH")))) else _S.prop(_S.read(_v25, "IRON"), 2)), "=", false)
			for _v27 in _S.array(_S.read(_v25, "STRAPS")):
				var _v28 = _S.scope(_v25)
				_S.define(_v28, "s", _v27)
				var _v29 = _S.scope(_v28)
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v29, "x"), _S.read(_v29, "s")), func(): return _S.binary(">", _S.read(_v29, "y"), _S.unary("-", _S.read(_v29, "FH"))))):
					_S.write(_v29, "c", (_S.prop(_S.read(_v29, "IRON"), 5) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v29, "y"), _S.unary("-", 7)), func(): return _S.binary("===", _S.read(_v29, "y"), _S.unary("-", 3)))) else _S.prop(_S.read(_v29, "IRON"), 4)), "=", false)
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v29, "x"), _S.binary("+", _S.read(_v29, "s"), 1)), func(): return _S.binary(">", _S.read(_v29, "y"), _S.unary("-", _S.read(_v29, "FH"))))):
					_S.write(_v29, "c", _S.prop(_S.read(_v29, "IRON"), 2), "=", false)
			_S.invoke(_S.read(_v25, "L"), "set", [_S.read(_v25, "x"), _S.read(_v25, "y"), _S.read(_v25, "c")])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "x", 1, "+=", true)
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "y", 1, "+=", true)
	var _v30 = _S.scope(_e)
	_S.define(_v30, "y", _S.unary("-", _S.read(_v30, "FH")))
	while _S.truth(_S.binary("<=", _S.read(_v30, "y"), _S.unary("-", 4))):
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "x", _S.unary("-", 2))
		while _S.truth(_S.binary("<=", _S.read(_v31, "x"), 1)):
			_S.invoke(_S.read(_v31, "L"), "set", [_S.read(_v31, "x"), _S.read(_v31, "y"), (_S.prop(_S.read(_v31, "C"), 3) if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v31, "x"), 1), func(): return _S.binary("===", _S.read(_v31, "y"), _S.unary("-", 4)))) else (_S.prop(_S.read(_v31, "C"), 7) if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v31, "x"), _S.unary("-", 2)), func(): return _S.binary("===", _S.read(_v31, "y"), _S.unary("-", _S.read(_v31, "FH"))))) else _S.prop(_S.read(_v31, "C"), 5)))])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "x", 1, "+=", true)
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "y", 1, "+=", true)
	_S.define(_e, "kh", (_S.prop(_S.read(_e, "W"), 0) if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.15)) else (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.4)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "g"), 0.7)) else _S.read(_e, "WHITE")))))
	_S.last([_S.invoke(_S.read(_e, "L"), "set", [_S.unary("-", 1), _S.unary("-", 7), _S.read(_e, "kh")]), _S.invoke(_S.read(_e, "L"), "set", [0, _S.unary("-", 7), _S.read(_e, "kh")]), _S.invoke(_S.read(_e, "L"), "set", [_S.unary("-", 1), _S.unary("-", 6), _S.read(_e, "kh")]), _S.invoke(_S.read(_e, "L"), "set", [0, _S.unary("-", 6), _S.call_value(_S.read(_e, "scale"), [_S.read(_e, "kh"), 0.85])])])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "C", _S.arg(_args, 0))
	_S.define(_e, "W", _S.arg(_args, 1))
	_S.define(_e, "th", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	if _S.truth(_S.binary(">", _S.read(_e, "th"), 1.2)):
		_S.last([_S.call_value(_S.read(_e, "paintLid"), [_S.read(_e, "C"), _S.read(_e, "W"), _S.read(_e, "th"), _S.read(_e, "g")]), _S.call_value(_S.read(_e, "paintHoard"), [_S.read(_e, "C"), _S.read(_e, "W"), _S.read(_e, "g")])])
	else:
		_S.last([_S.call_value(_S.read(_e, "paintHoard"), [_S.read(_e, "C"), _S.read(_e, "W"), _S.read(_e, "g")]), _S.call_value(_S.read(_e, "paintLid"), [_S.read(_e, "C"), _S.read(_e, "W"), _S.read(_e, "th"), _S.read(_e, "g")])])
	_S.call_value(_S.read(_e, "paintFront"), [_S.read(_e, "C"), _S.read(_e, "W"), _S.read(_e, "g")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "wood"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f11"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "loot", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "bits", [])
	_S.define(_e, "dust", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#5e5068"]))
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "o"), "coins"))
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "i"), _S.binary("+", _S.read(_v32, "n"), 4))):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "gem", _S.binary(">=", _S.read(_v33, "i"), _S.read(_v33, "n")))
		_S.define(_v33, "s", (1 if _S.truth(_S.binary("%", _S.read(_v33, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v33, "a", _S.binary("*", _S.read(_v33, "s"), _S.invoke(_S.read(_v33, "R"), "range", [0.1, 0.5])))
		_S.define(_v33, "sp", _S.invoke(_S.read(_v33, "R"), "range", [190, 270]))
		_S.invoke(_S.read(_v33, "loot"), "push", [_S.merge([{"gem": _S.read(_v33, "gem")}, {"G": (_S.prop(_S.read(_v33, "GEMS"), _S.binary("%", _S.binary("-", _S.read(_v33, "i"), _S.read(_v33, "n")), _S.prop(_S.read(_v33, "GEMS"), "length"))) if _S.truth(_S.read(_v33, "gem")) else null)}, {"x": _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 7), 7])}, {"y": _S.unary("-", 12)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "a")]), _S.read(_v33, "sp"))}, {"vy": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "a")])), _S.read(_v33, "sp"))}, {"t0": _S.binary("+", _S.binary("+", _S.read(_v33, "T_OPEN"), 0.03), _S.invoke(_S.read(_v33, "R"), "range", [0, 0.2]))}, {"up": false}, {"rest": false}, {"r": (2.6 if _S.truth(_S.read(_v33, "gem")) else 3)}, {"ax": _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 0.6), 0.6])}, {"spin": _S.invoke(_S.read(_v33, "R"), "range", [0, _S.read(_v33, "TAU")])}, {"vs": _S.binary("*", _S.invoke(_S.read(_v33, "R"), "sign", []), _S.invoke(_S.read(_v33, "R"), "range", [14, 24]))}, {"settle": 0}, {"ph": _S.invoke(_S.read(_v33, "R"), "next", [])}, {"pop": 0}, {"gone": false}])])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "+=", true)
	_S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "loot"))]), "sort", [_S.function_value(_e, "_f13")]), "forEach", [_S.function_value(_e, "_f14")])
	_S.define(_e, "t", 0)
	_S.define(_e, "opened", false)
	_S.define(_e, "poofed", false)
	_S.define(_e, "shake", _S.function_value(_e, "_f15"))
	_S.define(_e, "lidAngle", _S.function_value(_e, "_f16"))
	_S.define(_e, "inner", _S.function_value(_e, "_f17"))
	_S.define(_e, "rayK", _S.function_value(_e, "_f18"))
	return _S.merge([{"update": _S.function_value(_e, "_f19")}, {"drawBack": _S.function_value(_e, "_f22")}, {"draw": _S.function_value(_e, "_f23")}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "u", _S.binary("-", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 8), 2), 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.read(_e, "u"), 1.05), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 0.06), 0.06]))}, {"len": _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [46, 64]), _S.binary("-", 1.2, _S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "abs", [_S.read(_e, "u")]))))}, {"w": _S.invoke(_S.read(_e, "R"), "range", [0.035, 0.08])}, {"d": _S.invoke(_S.read(_e, "R"), "range", [0, 0.06])}, {"f": _S.invoke(_S.read(_e, "R"), "range", [5, 10])}, {"ph": _S.invoke(_S.read(_e, "R"), "range", [0, _S.read(_e, "TAU")])}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("-", _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.read(_e, "b"), "vx")]), _S.invoke(_S.read(_e, "Math"), "abs", [_S.prop(_S.read(_e, "a"), "vx")]))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "it", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	return _S.set_prop(_S.read(_e, "it"), "pop", _S.binary("+", _S.binary("+", _S.read(_e, "T_COLLECT"), _S.binary("*", _S.read(_e, "k"), 0.04)), _S.invoke(_S.read(_e, "R"), "range", [0, 0.02])), "=", false)

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", 0)
	_S.define(_e, "hop", 0)
	_S.define(_e, "lid", 0)
	for _v34 in _S.array(_S.read(_e, "RATTLES")):
		var _v35 = _S.scope(_e)
		var _v36 = _v34
		_S.define(_v35, "t0", _S.prop(_v36, 0))
		_S.define(_v35, "s", _S.prop(_v36, 1))
		var _v37 = _S.scope(_v35)
		_S.define(_v37, "u", _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "t0")))
		if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v37, "u"), 0), func(): return _S.binary(">", _S.read(_v37, "u"), 0.18))):
			continue
		_S.define(_v37, "e", _S.binary("-", 1, _S.binary("/", _S.read(_v37, "u"), 0.18)))
		_S.write(_v37, "dx", _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("*", _S.read(_v37, "u"), 90)]), 1.6), _S.read(_v37, "s")), _S.read(_v37, "e")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v37, "u"), 0.06), func(): return _S.binary(">", _S.read(_v37, "s"), 0.5))):
			_S.write(_v37, "hop", 1, "=", false)
		_S.write(_v37, "lid", _S.invoke(_S.read(_v37, "Math"), "max", [_S.read(_v37, "lid"), _S.binary("*", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v37, "Math"), "max", [0, _S.invoke(_S.read(_v37, "Math"), "sin", [_S.binary("*", _S.read(_v37, "u"), 38)])]), 0.13), _S.read(_v37, "s")), _S.read(_v37, "e"))]), "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "T_OPEN"), 0.08)))):
		_S.write(_e, "hop", 1, "=", false)
	_S.define(_e, "strain", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "T_OPEN"), 0.14), _S.read(_e, "T_OPEN"), _S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_OPEN"))):
		_S.last([_S.write(_e, "lid", _S.invoke(_S.read(_e, "Math"), "max", [_S.read(_e, "lid"), _S.binary("*", 0.07, _S.read(_e, "strain"))]), "=", false), _S.write(_e, "dx", (_S.binary("*", (1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 60)]), 2)) else _S.unary("-", 1)), 0.6) if _S.truth(_S.binary(">", _S.read(_e, "strain"), 0.2)) else 0), "+=", false)])
	return _S.merge([{"dx": _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "dx")])}, {"hop": _S.read(_e, "hop")}, {"lid": _S.read(_e, "lid")}])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "lid", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_OPEN"))):
		return _S.read(_e, "lid")
	_S.define(_e, "u", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_OPEN")))
	_S.define(_e, "w", 30)
	_S.define(_e, "z", 0.55)
	_S.define(_e, "wd", _S.binary("*", _S.read(_e, "w"), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "z"), _S.read(_e, "z")))])))
	return _S.binary("*", 1.98, _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.binary("*", _S.unary("-", _S.read(_e, "z")), _S.read(_e, "w")), _S.read(_e, "u"))]), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.read(_e, "wd"), _S.read(_e, "u"))]), _S.binary("*", _S.binary("/", _S.binary("*", _S.read(_e, "z"), _S.read(_e, "w")), _S.read(_e, "wd")), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "wd"), _S.read(_e, "u"))]))))))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_OPEN"))):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "k", _S.binary("+", _S.binary("+", 0.1, _S.binary("*", 0.45, _S.call_value(_S.read(_v38, "smooth"), [0, _S.read(_v38, "T_OPEN"), _S.read(_v38, "t")]))), _S.binary("*", 0.5, _S.call_value(_S.read(_v38, "smooth"), [_S.binary("-", _S.read(_v38, "T_OPEN"), 0.14), _S.read(_v38, "T_OPEN"), _S.read(_v38, "t")]))))
		for _v39 in _S.array(_S.read(_v38, "RATTLES")):
			var _v40 = _S.scope(_v38)
			var _v41 = _v39
			_S.define(_v40, "t0", _S.prop(_v41, 0))
			_S.define(_v40, "s", _S.prop(_v41, 1))
			if _S.truth(_S.binary(">", _S.read(_v40, "t"), _S.read(_v40, "t0"))):
				_S.write(_v40, "k", _S.binary("*", _S.binary("*", 0.45, _S.read(_v40, "s")), _S.invoke(_S.read(_v40, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_v40, "t"), _S.read(_v40, "t0"))), 9)])), "+=", false)
		return _S.read(_v38, "k")
	return _S.binary("+", _S.binary("*", _S.binary("+", 0.62, _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_OPEN"))), 5)]))), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "T_COLLECT"), 0.3), _S.read(_e, "T_POOF"), _S.read(_e, "t")]))), _S.binary("*", 0.05, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "t"), 9)])))

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	_S.define(_e, "u", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), _S.prop(_S.read(_e, "r"), "d")))
	if _S.truth(_S.binary("<", _S.read(_e, "u"), 0)):
		return 0
	return _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "u"), 0.1)])]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [1, 2.1, _S.read(_e, "u")]))), _S.binary("+", 0.72, _S.binary("*", 0.28, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "r"), "f")), _S.prop(_S.read(_e, "r"), "ph"))]))))

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "g", _S.call_value(_S.read(_e, "inner"), []))
	for _v42 in _S.array(_S.read(_e, "RATTLES")):
		var _v43 = _S.scope(_e)
		var _v44 = _v42
		_S.define(_v43, "t0", _S.prop(_v44, 0))
		_S.define(_v43, "s", _S.prop(_v44, 1))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v43, "s"), 0.5), func(): return _S.binary("<", _S.binary("-", _S.read(_v43, "t"), _S.read(_v43, "dt")), _S.binary("+", _S.read(_v43, "t0"), 0.05))), func(): return _S.binary(">=", _S.read(_v43, "t"), _S.binary("+", _S.read(_v43, "t0"), 0.05)))):
			var _v45 = _S.scope(_v43)
			_S.define(_v45, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v45, "i"), 4)):
				var _v46 = _S.scope(_v45)
				_S.define(_v46, "sd", (1 if _S.truth(_S.binary("%", _S.read(_v46, "i"), 2)) else _S.unary("-", 1)))
				_S.invoke(_S.read(_v46, "ps"), "spawn", [_S.prop(_S.read(_v46, "P"), "DUST"), _S.binary("*", _S.read(_v46, "sd"), _S.invoke(_S.read(_v46, "R"), "range", [9, 13])), _S.unary("-", 1), _S.binary("*", _S.read(_v46, "sd"), _S.invoke(_S.read(_v46, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [2, 8])), _S.invoke(_S.read(_v46, "R"), "range", [0.3, 0.5]), _S.read(_v46, "DUST"), _S.binary("*", _S.invoke(_S.read(_v46, "R"), "range", [1.2, 2.2]), _S.read(_v46, "s"))])
				_v45 = _S.iteration(_v45)
				_S.write(_v45, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.read(_e, "g"), 0.08)]))):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "x", _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 11), 11]))
		_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STAR"), _S.read(_v47, "x"), _S.unary("-", 10), _S.binary("*", _S.read(_v47, "x"), 1.5), _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [8, 30])), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v47, "C"), 6) if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])) else _S.prop(_S.read(_v47, "C"), 5)), _S.invoke(_S.read(_v47, "R"), "range", [0.4, 1.2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "opened")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_OPEN")))):
		var _v48 = _S.scope(_e)
		_S.write(_v48, "opened", true, "=", false)
		_S.invoke(_S.read(_v48, "lights"), "add", [0, _S.unary("-", 18), 64, _S.prop(_S.read(_v48, "C"), 5), 0.45, 0.7])
		_S.invoke(_S.read(_v48, "lights"), "add", [0, _S.unary("-", 16), 22, _S.read(_v48, "WHITE"), 0.35, 0.1])
		var _v49 = _S.scope(_v48)
		_S.define(_v49, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v49, "i"), 7)):
			var _v50 = _S.scope(_v49)
			_S.define(_v50, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v50, "Math"), "PI")), 2), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v50, "sp", _S.invoke(_S.read(_v50, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v50, "ps"), "spawn", [_S.prop(_S.read(_v50, "P"), "SPARK"), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 13), _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "cos", [_S.read(_v50, "a")]), _S.read(_v50, "sp")), _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "sin", [_S.read(_v50, "a")]), _S.read(_v50, "sp")), _S.invoke(_S.read(_v50, "R"), "range", [0.12, 0.26])])
			_v49 = _S.iteration(_v49)
			_S.write(_v49, "i", 1, "+=", true)
		var _v51 = _S.scope(_v48)
		_S.define(_v51, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v51, "i"), 8)):
			var _v52 = _S.scope(_v51)
			_S.define(_v52, "s", _S.invoke(_S.read(_v52, "R"), "sign", []))
			_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "DUST"), _S.binary("*", _S.read(_v52, "s"), _S.invoke(_S.read(_v52, "R"), "range", [10, 14])), _S.unary("-", 1), _S.binary("*", _S.read(_v52, "s"), _S.invoke(_S.read(_v52, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v52, "R"), "range", [2, 10])), _S.invoke(_S.read(_v52, "R"), "range", [0.4, 0.7]), _S.read(_v52, "DUST"), _S.invoke(_S.read(_v52, "R"), "range", [1.6, 3])])
			_v51 = _S.iteration(_v51)
			_S.write(_v51, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_COLLECT")))):
		var _v53 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v53, "R"), "chance", [0.22])):
			_S.invoke(_S.read(_v53, "ps"), "spawn", [_S.prop(_S.read(_v53, "P"), "EMBER"), _S.invoke(_S.read(_v53, "R"), "range", [_S.unary("-", 9), 9]), _S.unary("-", 13), _S.invoke(_S.read(_v53, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v53, "R"), "range", [25, 60])), _S.invoke(_S.read(_v53, "R"), "range", [0.8, 1.5]), _S.prop(_S.read(_v53, "C"), 5), _S.invoke(_S.read(_v53, "R"), "range", [0.8, 1.6])])
		if _S.truth(_S.invoke(_S.read(_v53, "R"), "chance", [0.12])):
			var _v54 = _S.scope(_v53)
			_S.define(_v54, "a", _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 1), 1]))
			_S.define(_v54, "d", _S.invoke(_S.read(_v54, "R"), "range", [10, 40]))
			_S.invoke(_S.read(_v54, "ps"), "spawn", [_S.prop(_S.read(_v54, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "sin", [_S.read(_v54, "a")]), _S.read(_v54, "d")), _S.binary("-", _S.unary("-", 12), _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "cos", [_S.read(_v54, "a")]), _S.read(_v54, "d"))), 0, _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [4, 12])), _S.invoke(_S.read(_v54, "R"), "range", [0.3, 0.7]), (_S.read(_v54, "WHITE") if _S.truth(_S.invoke(_S.read(_v54, "R"), "chance", [0.5])) else _S.prop(_S.read(_v54, "C"), 6)), _S.invoke(_S.read(_v54, "R"), "range", [0.5, 2])])
	for _v55 in _S.array(_S.read(_e, "loot")):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "it", _v55)
		var _v57 = _S.scope(_v56)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v57, "it"), "gone"), func(): return _S.binary("<", _S.read(_v57, "t"), _S.prop(_S.read(_v57, "it"), "t0")))):
			continue
		_S.set_prop(_S.read(_v57, "it"), "up", true, "=", false)
		if _S.truth(_S.binary(">=", _S.read(_v57, "t"), _S.binary("+", _S.prop(_S.read(_v57, "it"), "pop"), 0.13))):
			var _v58 = _S.scope(_v57)
			_S.set_prop(_S.read(_v58, "it"), "gone", true, "=", false)
			_S.define(_v58, "y", _S.binary("-", _S.prop(_S.read(_v58, "it"), "y"), 6))
			if _S.truth(_S.prop(_S.read(_v58, "it"), "gem")):
				_S.invoke(_S.read(_v58, "rings"), "push", [_S.merge([{"x": _S.prop(_S.read(_v58, "it"), "x")}, {"y": _S.read(_v58, "y")}, {"t0": _S.read(_v58, "t")}])])
			_S.invoke(_S.read(_v58, "lights"), "add", [_S.prop(_S.read(_v58, "it"), "x"), _S.read(_v58, "y"), 18, (_S.prop(_S.prop(_S.read(_v58, "it"), "G"), 4) if _S.truth(_S.prop(_S.read(_v58, "it"), "gem")) else _S.prop(_S.read(_v58, "C"), 5)), 0.65, 0.25])
			var _v59 = _S.scope(_v58)
			_S.define(_v59, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v59, "i"), 4)):
				var _v60 = _S.scope(_v59)
				_S.define(_v60, "a", _S.invoke(_S.read(_v60, "R"), "range", [0, _S.read(_v60, "TAU")]))
				_S.define(_v60, "sp", _S.invoke(_S.read(_v60, "R"), "range", [25, 55]))
				_S.invoke(_S.read(_v60, "ps"), "spawn", [_S.prop(_S.read(_v60, "P"), "STAR"), _S.prop(_S.read(_v60, "it"), "x"), _S.read(_v60, "y"), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v60, "Math"), "cos", [_S.read(_v60, "a")]), _S.read(_v60, "sp")), _S.binary("*", _S.prop(_S.read(_v60, "it"), "x"), 0.25)), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v60, "Math"), "sin", [_S.read(_v60, "a")]), _S.read(_v60, "sp")), 20), _S.invoke(_S.read(_v60, "R"), "range", [0.3, 0.55]), ((_S.prop(_S.prop(_S.read(_v60, "it"), "G"), 5) if _S.truth(_S.prop(_S.read(_v60, "it"), "gem")) else _S.prop(_S.read(_v60, "C"), 6)) if _S.truth(_S.read(_v60, "i")) else _S.read(_v60, "WHITE")), _S.invoke(_S.read(_v60, "R"), "range", [0.6, 1.5])])
				_v59 = _S.iteration(_v59)
				_S.write(_v59, "i", 1, "+=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v57, "it"), "rest")):
			var _v61 = _S.scope(_v57)
			_S.set_prop(_S.read(_v61, "it"), "settle", _S.read(_v61, "dt"), "+=", false)
			_S.set_prop(_S.read(_v61, "it"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v61, "it"), "vx"), 9), _S.read(_v61, "dt")), "-=", false)
			_S.set_prop(_S.read(_v61, "it"), "x", _S.call_value(_S.read(_v61, "clamp"), [_S.binary("+", _S.prop(_S.read(_v61, "it"), "x"), _S.binary("*", _S.prop(_S.read(_v61, "it"), "vx"), _S.read(_v61, "dt"))), _S.unary("-", 74), 74]), "=", false)
			continue
		_S.set_prop(_S.read(_v57, "it"), "vy", _S.binary("*", 950, _S.read(_v57, "dt")), "+=", false)
		_S.set_prop(_S.read(_v57, "it"), "x", _S.binary("*", _S.prop(_S.read(_v57, "it"), "vx"), _S.read(_v57, "dt")), "+=", false)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v57, "Math"), "abs", [_S.prop(_S.read(_v57, "it"), "x")]), 74)):
			_S.last([_S.set_prop(_S.read(_v57, "it"), "x", _S.binary("*", _S.invoke(_S.read(_v57, "Math"), "sign", [_S.prop(_S.read(_v57, "it"), "x")]), 74), "=", false), _S.set_prop(_S.read(_v57, "it"), "vx", _S.unary("-", 0.3), "*=", false)])
		_S.set_prop(_S.read(_v57, "it"), "y", _S.binary("*", _S.prop(_S.read(_v57, "it"), "vy"), _S.read(_v57, "dt")), "+=", false)
		_S.set_prop(_S.read(_v57, "it"), "spin", _S.binary("*", _S.prop(_S.read(_v57, "it"), "vs"), _S.read(_v57, "dt")), "+=", false)
		_S.define(_v57, "bottom", _S.binary("+", _S.prop(_S.read(_v57, "it"), "y"), _S.prop(_S.read(_v57, "it"), "r")))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v57, "bottom"), _S.unary("-", 0.5)), func(): return _S.binary(">", _S.prop(_S.read(_v57, "it"), "vy"), 0))):
			var _v62 = _S.scope(_v57)
			_S.set_prop(_S.read(_v62, "it"), "y", _S.binary("-", _S.unary("-", 0.5), _S.prop(_S.read(_v62, "it"), "r")), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v62, "it"), "vy"), 110)):
				var _v63 = _S.scope(_v62)
				_S.invoke(_S.read(_v63, "ps"), "spawn", [_S.prop(_S.read(_v63, "P"), "DUST"), _S.prop(_S.read(_v63, "it"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v63, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v63, "R"), "range", [4, 12])), _S.invoke(_S.read(_v63, "R"), "range", [0.25, 0.45]), _S.read(_v63, "DUST"), _S.invoke(_S.read(_v63, "R"), "range", [1, 1.8])])
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v63, "it"), "vy"), 220)):
					var _v64 = _S.scope(_v63)
					var _v65 = _S.scope(_v64)
					_S.define(_v65, "i", 0)
					while _S.truth(_S.binary("<", _S.read(_v65, "i"), 2)):
						_S.invoke(_S.read(_v65, "ps"), "spawn", [_S.prop(_S.read(_v65, "P"), "SPARK"), _S.prop(_S.read(_v65, "it"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v65, "R"), "range", [_S.unary("-", 90), 90]), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [60, 140])), _S.invoke(_S.read(_v65, "R"), "range", [0.1, 0.22])])
						_v65 = _S.iteration(_v65)
						_S.write(_v65, "i", 1, "+=", true)
					_S.invoke(_S.read(_v64, "lights"), "add", [_S.prop(_S.read(_v64, "it"), "x"), _S.unary("-", 2), 9, _S.prop(_S.read(_v64, "C"), 5), 0.5, 0.12])
				_S.set_prop(_S.read(_v63, "it"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v63, "it"), "vy")), 0.42), "=", false)
				_S.set_prop(_S.read(_v63, "it"), "vx", 0.5, "*=", false)
				_S.set_prop(_S.read(_v63, "it"), "vs", 0.55, "*=", false)
			else:
				var _v66 = _S.scope(_v62)
				_S.set_prop(_S.read(_v66, "it"), "rest", true, "=", false)
				_S.set_prop(_S.read(_v66, "it"), "vy", 0, "=", false)
	var _v67 = _S.scope(_e)
	_S.define(_v67, "i", _S.binary("-", _S.prop(_S.read(_v67, "rings"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v67, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v67, "t"), _S.prop(_S.prop(_S.read(_v67, "rings"), _S.read(_v67, "i")), "t0")), 0.3)):
			_S.invoke(_S.read(_v67, "rings"), "splice", [_S.read(_v67, "i"), 1])
		_v67 = _S.iteration(_v67)
		_S.write(_v67, "i", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "poofed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_POOF")))):
		var _v68 = _S.scope(_e)
		_S.write(_v68, "poofed", true, "=", false)
		_S.invoke(_S.read(_v68, "lights"), "add", [0, _S.unary("-", 12), 40, _S.prop(_S.read(_v68, "C"), 5), 0.5, 0.6])
		_S.invoke(_S.read(_v68, "L"), "begin", [_S.unary("-", 20), _S.unary("-", 32)])
		_S.call_value(_S.read(_v68, "paintChest"), [_S.read(_v68, "C"), _S.read(_v68, "W"), _S.call_value(_S.read(_v68, "lidAngle"), [0]), 0.3])
		_S.invoke(_S.read(_v68, "L"), "outline", [_S.prop(_S.read(_v68, "W"), 0)])
		_S.define(_v68, "f", _S.prop(_S.read(_v68, "L"), "f"))
		_S.define(_v68, "top", 0)
		_S.invoke(_S.prop(_S.read(_v68, "f"), "color"), "forEach", [_S.function_value(_v68, "_f20")])
		_S.invoke(_S.prop(_S.read(_v68, "f"), "color"), "forEach", [_S.function_value(_v68, "_f21")])
	for _v69 in _S.array(_S.read(_e, "bits")):
		var _v70 = _S.scope(_e)
		_S.define(_v70, "b", _v69)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v70, "b"), "done")), func(): return _S.binary(">=", _S.read(_v70, "t"), _S.prop(_S.read(_v70, "b"), "td")))):
			var _v71 = _S.scope(_v70)
			_S.set_prop(_S.read(_v71, "b"), "done", true, "=", false)
			if _S.truth(_S.prop(_S.read(_v71, "b"), "mote")):
				_S.invoke(_S.read(_v71, "dust"), "spawn", [_S.prop(_S.read(_v71, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v71, "b"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v71, "b"), "y"), 0.5), _S.invoke(_S.read(_v71, "R"), "range", [_S.unary("-", 28), 28]), _S.unary("-", _S.invoke(_S.read(_v71, "R"), "range", [14, 50])), _S.invoke(_S.read(_v71, "R"), "range", [0.4, 0.8]), _S.prop(_S.read(_v71, "C"), 5), _S.invoke(_S.read(_v71, "R"), "range", [0.5, 1.1])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "dust"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.read(_e, "c"), func(): return _S.write(_e, "top", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "top"), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "i"), _S.prop(_S.read(_e, "f"), "w"))]), _S.prop(_S.read(_e, "f"), "oy"))]), "=", false))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	if _S.truth(_S.unary("!", _S.read(_e, "c"))):
		return null
	_S.define(_e, "x", _S.binary("+", _S.binary("%", _S.read(_e, "i"), _S.prop(_S.read(_e, "f"), "w")), _S.prop(_S.read(_e, "f"), "ox")))
	_S.define(_e, "y", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "i"), _S.prop(_S.read(_e, "f"), "w"))]), _S.prop(_S.read(_e, "f"), "oy")))
	_S.invoke(_S.read(_e, "bits"), "push", [_S.merge([{"x": _S.read(_e, "x")}, {"y": _S.read(_e, "y")}, {"c": _S.read(_e, "c")}, {"td": _S.binary("+", _S.binary("+", _S.read(_e, "T_POOF"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "top")), _S.unary("-", _S.read(_e, "top"))), 0.32)), _S.binary("*", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x"), _S.read(_e, "y"), 21]), 0.05))}, {"mote": _S.logical("&&", _S.binary("!==", _S.read(_e, "c"), _S.prop(_S.read(_e, "W"), 0)), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x"), _S.read(_e, "y"), 23]), 0.14))}])])
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "T_POOF"), 0.2))):
		_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, 15, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "T_POOF"), _S.binary("+", _S.read(_e, "T_POOF"), 0.2), _S.read(_e, "t")]))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "inner"), []))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "shake"), []))
	_S.define(_e, "th", _S.call_value(_S.read(_e, "lidAngle"), [_S.prop(_S.read(_e, "sh"), "lid")]))
	_S.define(_e, "open", (1 if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_OPEN"))) else 0))
	_S.call_value(_S.read(_e, "pool"), [_S.read(_e, "p"), 0, 0, _S.binary("+", 30, _S.binary("*", 10, _S.read(_e, "g"))), 4, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("+", 0.1, _S.binary("*", 0.18, _S.read(_e, "open"))), _S.read(_e, "g"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 16), _S.binary("+", 24, _S.binary("*", 8, _S.read(_e, "g"))), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.binary("+", 0.1, _S.binary("*", 0.2, _S.read(_e, "open"))), _S.read(_e, "g"))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_POOF"))):
		var _v72 = _S.scope(_e)
		_S.invoke(_S.read(_v72, "L"), "begin", [_S.unary("-", 20), _S.unary("-", 32)])
		_S.call_value(_S.read(_v72, "paintChest"), [_S.read(_v72, "C"), _S.read(_v72, "W"), _S.read(_v72, "th"), _S.invoke(_S.read(_v72, "Math"), "min", [1.2, _S.read(_v72, "g")])])
		_S.invoke(_S.read(_v72, "L"), "outline", [_S.prop(_S.read(_v72, "W"), 0)])
		_S.invoke(_S.read(_v72, "L"), "draw", [_S.read(_v72, "p"), _S.prop(_S.read(_v72, "sh"), "dx"), _S.unary("-", _S.prop(_S.read(_v72, "sh"), "hop"))])
	else:
		for _v73 in _S.array(_S.read(_e, "bits")):
			var _v74 = _S.scope(_e)
			_S.define(_v74, "b", _v73)
			if _S.truth(_S.unary("!", _S.prop(_S.read(_v74, "b"), "done"))):
				_S.invoke(_S.read(_v74, "p"), "px", [_S.prop(_S.read(_v74, "b"), "x"), _S.prop(_S.read(_v74, "b"), "y"), ((_S.prop(_S.read(_v74, "C"), 3) if _S.truth(_S.binary("===", _S.prop(_S.read(_v74, "b"), "c"), _S.prop(_S.read(_v74, "W"), 0))) else _S.prop(_S.read(_v74, "C"), 6)) if _S.truth(_S.binary("<", _S.binary("-", _S.prop(_S.read(_v74, "b"), "td"), _S.read(_v74, "t")), 0.04)) else _S.prop(_S.read(_v74, "b"), "c"))])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_OPEN"))):
		var _v75 = _S.scope(_e)
		_S.invoke(_S.read(_v75, "p"), "glowLine", [_S.unary("-", 11), _S.binary("-", _S.unary("-", 9.5), _S.prop(_S.read(_v75, "sh"), "hop")), 11, _S.binary("-", _S.unary("-", 9.5), _S.prop(_S.read(_v75, "sh"), "hop")), 5, _S.prop(_S.read(_v75, "C"), 5), _S.binary("*", 0.22, _S.read(_v75, "g"))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v75, "g"), 0.35), func(): return _S.binary("<", _S.prop(_S.read(_v75, "sh"), "lid"), 0.015))):
			_S.invoke(_S.read(_v75, "p"), "line", [_S.binary("+", _S.unary("-", 10), _S.prop(_S.read(_v75, "sh"), "dx")), _S.binary("-", _S.unary("-", 10), _S.prop(_S.read(_v75, "sh"), "hop")), _S.binary("+", 9, _S.prop(_S.read(_v75, "sh"), "dx")), _S.binary("-", _S.unary("-", 10), _S.prop(_S.read(_v75, "sh"), "hop")), _S.function_value(_v75, "_f24"), _S.function_value(_v75, "_f25")])
		_S.invoke(_S.read(_v75, "p"), "glow", [_S.prop(_S.read(_v75, "sh"), "dx"), _S.binary("-", _S.unary("-", 7), _S.prop(_S.read(_v75, "sh"), "hop")), 6, _S.prop(_S.read(_v75, "C"), 6), _S.binary("*", 0.35, _S.read(_v75, "g"))])
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v75, "sh"), "lid"), 0.015)):
			var _v76 = _S.scope(_v75)
			_S.define(_v76, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v76, "i"), 8)):
				var _v77 = _S.scope(_v76)
				_S.define(_v77, "x", _S.binary("+", _S.binary("+", _S.binary("+", _S.unary("-", 10.5), _S.binary("*", _S.read(_v77, "i"), 3)), _S.prop(_S.read(_v77, "sh"), "dx")), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v77, "rand"), [_S.read(_v77, "i"), 3]), 0.5), 1.5)))
				_S.define(_v77, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v77, "Math"), "PI")), 2), _S.binary("*", _S.binary("/", _S.read(_v77, "x"), 11), 1.25)))
				_S.define(_v77, "l", _S.binary("*", _S.binary("+", 7, _S.binary("*", _S.call_value(_S.read(_v77, "rand"), [_S.read(_v77, "i"), _S.invoke(_S.read(_v77, "Math"), "floor", [_S.binary("*", _S.read(_v77, "t"), 30)]), 1]), 12)), _S.invoke(_S.read(_v77, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v77, "sh"), "lid"), 0.05)])))
				_S.define(_v77, "y0", _S.binary("-", _S.unary("-", 10), _S.prop(_S.read(_v77, "sh"), "hop")))
				_S.invoke(_S.read(_v77, "p"), "line", [_S.read(_v77, "x"), _S.read(_v77, "y0"), _S.binary("+", _S.read(_v77, "x"), _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "cos", [_S.read(_v77, "a")]), _S.read(_v77, "l"))), _S.binary("+", _S.read(_v77, "y0"), _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "sin", [_S.read(_v77, "a")]), _S.read(_v77, "l"))), _S.function_value(_v77, "_f26"), _S.function_value(_v77, "_f27")])
				_S.invoke(_S.read(_v77, "p"), "glowLine", [_S.read(_v77, "x"), _S.read(_v77, "y0"), _S.binary("+", _S.read(_v77, "x"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "cos", [_S.read(_v77, "a")]), _S.read(_v77, "l")), 0.7)), _S.binary("+", _S.read(_v77, "y0"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v77, "Math"), "sin", [_S.read(_v77, "a")]), _S.read(_v77, "l")), 0.7)), 3, _S.prop(_S.read(_v77, "C"), 5), 0.25])
				_v76 = _S.iteration(_v76)
				_S.write(_v76, "i", 1, "+=", true)
	for _v78 in _S.array(_S.read(_e, "rays")):
		var _v79 = _S.scope(_e)
		_S.define(_v79, "r", _v78)
		var _v80 = _S.scope(_v79)
		_S.define(_v80, "k", _S.call_value(_S.read(_v80, "rayK"), [_S.read(_v80, "r")]))
		if _S.truth(_S.binary("<=", _S.read(_v80, "k"), 0.01)):
			continue
		_S.define(_v80, "ox", _S.binary("*", _S.invoke(_S.read(_v80, "Math"), "sin", [_S.prop(_S.read(_v80, "r"), "a")]), 7))
		_S.define(_v80, "oy", _S.unary("-", 12))
		_S.define(_v80, "dx", _S.invoke(_S.read(_v80, "Math"), "sin", [_S.prop(_S.read(_v80, "r"), "a")]))
		_S.define(_v80, "dy", _S.unary("-", _S.invoke(_S.read(_v80, "Math"), "cos", [_S.prop(_S.read(_v80, "r"), "a")])))
		_S.define(_v80, "len", _S.binary("*", _S.prop(_S.read(_v80, "r"), "len"), _S.binary("+", 0.88, _S.binary("*", 0.12, _S.invoke(_S.read(_v80, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.binary("*", _S.read(_v80, "t"), _S.prop(_S.read(_v80, "r"), "f")), 0.7), _S.prop(_S.read(_v80, "r"), "ph"))])))))
		_S.define(_v80, "tw", _S.invoke(_S.read(_v80, "Math"), "tan", [_S.prop(_S.read(_v80, "r"), "w")]))
		_S.define(_v80, "x1", _S.binary("+", _S.read(_v80, "ox"), _S.binary("*", _S.read(_v80, "dx"), _S.read(_v80, "len"))))
		_S.define(_v80, "y1", _S.binary("+", _S.read(_v80, "oy"), _S.binary("*", _S.read(_v80, "dy"), _S.read(_v80, "len"))))
		_S.invoke(_S.read(_v80, "p"), "shade", [_S.binary("-", _S.invoke(_S.read(_v80, "Math"), "min", [_S.read(_v80, "ox"), _S.read(_v80, "x1")]), 8), _S.binary("-", _S.invoke(_S.read(_v80, "Math"), "min", [_S.read(_v80, "oy"), _S.read(_v80, "y1")]), 8), _S.binary("+", _S.invoke(_S.read(_v80, "Math"), "max", [_S.read(_v80, "ox"), _S.read(_v80, "x1")]), 8), _S.binary("+", _S.invoke(_S.read(_v80, "Math"), "max", [_S.read(_v80, "oy"), _S.read(_v80, "y1")]), 8), _S.function_value(_v80, "_f28")])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "T_OPEN"), 0.2)))):
		var _v81 = _S.scope(_e)
		_S.define(_v81, "a", _S.binary("/", _S.binary("-", _S.read(_v81, "t"), _S.read(_v81, "T_OPEN")), 0.2))
		_S.call_value(_S.read(_v81, "flare"), [_S.read(_v81, "p"), 0, _S.unary("-", 14), _S.binary("*", 22, _S.invoke(_S.read(_v81, "Math"), "pow", [_S.binary("-", 1, _S.read(_v81, "a")), 1.4])), _S.binary("-", 1, _S.read(_v81, "a")), _S.read(_v81, "C")])
	for _v82 in _S.array(_S.read(_e, "loot")):
		var _v83 = _S.scope(_e)
		_S.define(_v83, "it", _v82)
		var _v84 = _S.scope(_v83)
		if _S.truth(_S.logical("||", _S.unary("!", _S.prop(_S.read(_v84, "it"), "up")), func(): return _S.prop(_S.read(_v84, "it"), "gone"))):
			continue
		_S.define(_v84, "pu", _S.binary("-", _S.read(_v84, "t"), _S.prop(_S.read(_v84, "it"), "pop")))
		_S.define(_v84, "lift", (_S.binary("*", 6, _S.invoke(_S.read(_v84, "ease"), "outCubic", [_S.call_value(_S.read(_v84, "clamp"), [_S.binary("/", _S.read(_v84, "pu"), 0.1)])])) if _S.truth(_S.binary(">", _S.read(_v84, "pu"), 0)) else 0))
		_S.define(_v84, "wh", _S.binary(">", _S.read(_v84, "pu"), 0.095))
		_S.define(_v84, "y", _S.binary("-", _S.prop(_S.read(_v84, "it"), "y"), _S.read(_v84, "lift")))
		_S.define(_v84, "ax", _S.prop(_S.read(_v84, "it"), "ax"))
		_S.define(_v84, "spin", _S.prop(_S.read(_v84, "it"), "spin"))
		_S.define(_v84, "flat", false)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v84, "it"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v84, "it"), "gem")))):
			var _v85 = _S.scope(_v84)
			_S.define(_v85, "w", _S.binary("*", _S.invoke(_S.read(_v85, "Math"), "exp", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v85, "it"), "settle")), 8)]), _S.invoke(_S.read(_v85, "Math"), "abs", [_S.invoke(_S.read(_v85, "Math"), "cos", [_S.binary("*", _S.prop(_S.read(_v85, "it"), "settle"), 22)])])))
			_S.write(_v85, "ax", 0, "=", false)
			_S.write(_v85, "spin", _S.invoke(_S.read(_v85, "Math"), "acos", [_S.call_value(_S.read(_v85, "clamp"), [_S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_v85, "w"))), 0, 1])]), "=", false)
			_S.write(_v85, "flat", _S.binary("<", _S.read(_v85, "w"), 0.12), "=", false)
			_S.write(_v85, "y", (_S.binary("-", _S.unary("-", 1.5), _S.read(_v85, "lift")) if _S.truth(_S.read(_v85, "flat")) else _S.binary("-", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v85, "it"), "r")), _S.invoke(_S.read(_v85, "Math"), "cos", [_S.read(_v85, "spin")])), _S.read(_v85, "lift"))), "=", false)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v84, "it"), "y"), _S.unary("-", 10))):
			_S.call_value(_S.read(_v84, "blobShadow"), [_S.read(_v84, "p"), _S.prop(_S.read(_v84, "it"), "x"), 3, _S.binary("*", 0.7, _S.binary("-", 1, _S.call_value(_S.read(_v84, "clamp"), [_S.binary("/", _S.unary("-", _S.prop(_S.read(_v84, "it"), "y")), 30)])))])
		if _S.truth(_S.prop(_S.read(_v84, "it"), "gem")):
			_S.call_value(_S.read(_v84, "gemlet"), [_S.read(_v84, "IL"), _S.read(_v84, "p"), _S.prop(_S.read(_v84, "it"), "x"), _S.read(_v84, "y"), _S.prop(_S.read(_v84, "it"), "r"), (_S.binary("*", 0.4, _S.invoke(_S.read(_v84, "Math"), "sign", [_S.prop(_S.read(_v84, "it"), "vs")])) if _S.truth(_S.prop(_S.read(_v84, "it"), "rest")) else _S.prop(_S.read(_v84, "it"), "spin")), _S.prop(_S.read(_v84, "it"), "G"), _S.read(_v84, "wh")])
		else:
			_S.call_value(_S.read(_v84, "coin"), [_S.read(_v84, "IL"), _S.read(_v84, "p"), (_S.binary("+", _S.invoke(_S.read(_v84, "Math"), "round", [_S.prop(_S.read(_v84, "it"), "x")]), 0.5) if _S.truth(_S.read(_v84, "flat")) else _S.prop(_S.read(_v84, "it"), "x")), _S.read(_v84, "y"), _S.prop(_S.read(_v84, "it"), "r"), _S.read(_v84, "ax"), (_S.invoke(_S.read(_v84, "Math"), "acos", [0.5]) if _S.truth(_S.read(_v84, "flat")) else _S.read(_v84, "spin")), _S.read(_v84, "C"), _S.read(_v84, "wh"), 1, _S.unary("!", _S.read(_v84, "flat"))])
		_S.invoke(_S.read(_v84, "p"), "glow", [_S.prop(_S.read(_v84, "it"), "x"), _S.read(_v84, "y"), 9, (_S.prop(_S.prop(_S.read(_v84, "it"), "G"), 4) if _S.truth(_S.prop(_S.read(_v84, "it"), "gem")) else _S.prop(_S.read(_v84, "C"), 5)), (0.26 if _S.truth(_S.prop(_S.read(_v84, "it"), "rest")) else 0.18)])
		_S.invoke(_S.read(_v84, "p"), "glow", [_S.prop(_S.read(_v84, "it"), "x"), _S.read(_v84, "y"), 3, _S.read(_v84, "WHITE"), 0.12])
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v84, "it"), "rest"), func(): return _S.binary("<", _S.read(_v84, "t"), _S.prop(_S.read(_v84, "it"), "pop")))):
			var _v86 = _S.scope(_v84)
			_S.define(_v86, "u", _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_v86, "t"), 0.9), _S.prop(_S.read(_v86, "it"), "ph")), 1))
			if _S.truth(_S.binary("<", _S.read(_v86, "u"), 0.16)):
				_S.call_value(_S.read(_v86, "glint"), [_S.read(_v86, "p"), _S.binary("-", _S.prop(_S.read(_v86, "it"), "x"), 1), _S.binary("-", _S.read(_v86, "y"), 1.5), _S.binary("*", 2.6, _S.invoke(_S.read(_v86, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v86, "u"), 0.16), _S.prop(_S.read(_v86, "Math"), "PI"))])), (_S.prop(_S.prop(_S.read(_v86, "it"), "G"), 5) if _S.truth(_S.prop(_S.read(_v86, "it"), "gem")) else _S.prop(_S.read(_v86, "C"), 6)), 0.5])
	for _v87 in _S.array(_S.read(_e, "rings")):
		var _v88 = _S.scope(_e)
		_S.define(_v88, "r", _v87)
		var _v89 = _S.scope(_v88)
		_S.define(_v89, "k", _S.binary("/", _S.binary("-", _S.read(_v89, "t"), _S.prop(_S.read(_v89, "r"), "t0")), 0.3))
		_S.define(_v89, "e", _S.invoke(_S.read(_v89, "ease"), "outCubic", [_S.read(_v89, "k")]))
		_S.invoke(_S.read(_v89, "p"), "ring", [_S.prop(_S.read(_v89, "r"), "x"), _S.prop(_S.read(_v89, "r"), "y"), _S.binary("+", 2, _S.binary("*", 5, _S.read(_v89, "e"))), 1, (_S.read(_v89, "WHITE") if _S.truth(_S.binary("<", _S.read(_v89, "k"), 0.3)) else _S.prop(_S.read(_v89, "C"), 6)), _S.binary("-", 1.15, _S.read(_v89, "k"))])
		_S.invoke(_S.read(_v89, "p"), "glow", [_S.prop(_S.read(_v89, "r"), "x"), _S.prop(_S.read(_v89, "r"), "y"), 12, _S.prop(_S.read(_v89, "C"), 5), _S.binary("*", 0.45, _S.binary("-", 1, _S.read(_v89, "k")))])
		if _S.truth(_S.binary("<", _S.read(_v89, "k"), 0.5)):
			_S.call_value(_S.read(_v89, "glint"), [_S.read(_v89, "p"), _S.prop(_S.read(_v89, "r"), "x"), _S.prop(_S.read(_v89, "r"), "y"), _S.binary("*", 3.4, _S.binary("-", 1, _S.binary("/", _S.read(_v89, "k"), 0.5))), _S.prop(_S.read(_v89, "C"), 6), 0.55])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "dust"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), 0.5)]), 0.2)) else _S.prop(_S.read(_e, "C"), 6))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "g"), 0.35), 2.2), _S.binary("-", 1, _S.binary("*", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), 0.5)]), 0.9)))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.25)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "u"), 0.6)) else _S.prop(_S.read(_e, "C"), 5)))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return _S.binary("-", 1.15, _S.read(_e, "u"))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "rx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ox")))
	_S.define(_e, "ry", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "oy")))
	_S.define(_e, "d", _S.binary("+", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "dy"))))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "d"), 0), func(): return _S.binary(">", _S.read(_e, "d"), _S.read(_e, "len")))):
		return null
	_S.define(_e, "q", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("*", _S.read(_e, "rx"), _S.read(_e, "dy")), _S.binary("*", _S.read(_e, "ry"), _S.read(_e, "dx")))]))
	_S.define(_e, "hw", _S.binary("+", 0.6, _S.binary("*", _S.read(_e, "d"), _S.read(_e, "tw"))))
	_S.define(_e, "f", (_S.binary("-", 1, _S.binary("*", 0.35, _S.binary("/", _S.read(_e, "q"), _S.read(_e, "hw")))) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.read(_e, "hw"))) else _S.binary("*", 0.65, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "q"), _S.read(_e, "hw")), 1.6)))))
	if _S.truth(_S.binary("<=", _S.read(_e, "f"), 0)):
		return null
	_S.set_prop(_S.read(_e, "out"), "l", (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.read(_e, "q"), _S.binary("*", _S.read(_e, "hw"), 0.45))) else _S.prop(_S.read(_e, "C"), 5)), "=", false)
	_S.set_prop(_S.read(_e, "out"), "k", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "k"), 0.55), _S.read(_e, "f")), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.binary("/", _S.read(_e, "d"), _S.read(_e, "len"))), 1.4])), _S.call_value(_S.read(_e, "smooth"), [5, 14, _S.read(_e, "d")])), "=", false)
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "g", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "g"), "map", [_S.read(_e, "hex")])

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "l", _S.arg(_args, 1))
	_S.define(_e, "steps", _S.arg(_args, 2))
	return _S.prop(_S.read(_e, "R"), _S.prop(_S.read(_e, "steps"), (0 if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.6)) else (1 if _S.truth(_S.binary(">", _S.read(_e, "l"), 0.25)) else (2 if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.1))) else (3 if _S.truth(_S.binary(">", _S.read(_e, "l"), _S.unary("-", 0.45))) else 4))))))
