@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/lightning-strike.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "SOOT", _S.import_value("fx/lightning/_lib.js", "SOOT"))
	_S.define(_e, "SOOT2", _S.import_value("fx/lightning/_lib.js", "SOOT2"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "bend", _S.import_value("fx/lightning/_lib.js", "bend"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "trace", _S.import_value("fx/lightning/_lib.js", "trace"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "heat", _S.import_value("fx/lightning/_lib.js", "heat"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f0"))
	_S.define(_e, "sigil", _S.function_value(_e, "_f2"))
	_S.define(_e, "keep", _S.function_value(_e, "_f5"))
	_S.define(_e, "create", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Lightning strike"}, {"desc": "A targeted strike: a sigil charges on the floor, the scene darkens, a thick bolt slams into it, arcs race out along the cracks it splits, the channel crumbles to a scorch."}, {"tags": ["lightning", "electric", "strike", "spell", "target", "impact", "ground", "one-shot"]}, {"size": [240, 264]}, {"origin": [120, 228]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "W", 120)
	_S.define(_e, "TOP", _S.unary("-", 224))
	_S.define(_e, "RX", 28)
	_S.define(_e, "SY", 0.22)
	_S.define(_e, "REACH", 52)
	_S.define(_e, "LEAD0", 0.48)
	_S.define(_e, "STEPS", 9)
	_S.define(_e, "MEET", _S.unary("-", 30))
	_S.define(_e, "STROKES", [_S.merge([{"t": 0.76}, {"k": 1}]), _S.merge([{"t": 1.04}, {"k": 0.8}]), _S.merge([{"t": 1.26}, {"k": 0.55}])])
	_S.define(_e, "FLICK", [1, 0.72, 0.3, 0.95, 0.5, 0.8, 0.22])
	_S.define(_e, "level", _S.function_value(_e, "_f22"))
	_S.define(_e, "NIGHT", _S.call_value(_S.read(_e, "hex"), ["#04030a"]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#6e6382"]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "STONE", _S.invoke(["#655b7a", "#4a4263", "#342d45"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "S1", _S.prop(_S.prop(_S.read(_e, "STROKES"), 0), "t"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "out", [])
	_S.define(_e, "grow", _S.function_value(_e, "_f1"))
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 6)):
		_S.call_value(_S.read(_v2, "grow"), [_S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 1), 1]), _S.invoke(_S.read(_v2, "R"), "range", [0, 1]), (_S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.5), 0.7]) if _S.truth(_S.binary("%", _S.read(_v2, "i"), 2)) else _S.binary("+", _S.prop(_S.read(_v2, "Math"), "PI"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 0.7), 0.5]))), _S.binary("*", _S.read(_v2, "REACH"), _S.invoke(_S.read(_v2, "R"), "range", [0.55, 1])), 1, 0, 0])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "w", _S.arg(_args, 4))
	_S.define(_e, "d", _S.arg(_args, 5))
	_S.define(_e, "depth", _S.arg(_args, 6))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "d")]])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "s"), _S.read(_v0, "len"))):
		var _v1 = _S.scope(_v0)
		_S.write(_v1, "a", _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 0.32), 0.32]), "+=", false)
		_S.write(_v1, "x", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), 1.5), "+=", false)
		_S.write(_v1, "y", _S.call_value(_S.read(_v1, "clamp"), [_S.binary("+", _S.read(_v1, "y"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), 0.45)), 0, 5]), "=", false)
		_S.write(_v1, "d", 1.5, "+=", false)
		_S.invoke(_S.read(_v1, "pts"), "push", [[_S.read(_v1, "x"), _S.read(_v1, "y"), _S.read(_v1, "d")]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.read(_v1, "depth"), 2), func(): return _S.binary(">", _S.read(_v1, "s"), 3)), func(): return _S.invoke(_S.read(_v1, "R"), "chance", [0.09]))):
			_S.call_value(_S.read(_v1, "grow"), [_S.read(_v1, "x"), _S.read(_v1, "y"), _S.binary("+", _S.read(_v1, "a"), _S.binary("*", _S.invoke(_S.read(_v1, "R"), "sign", []), _S.invoke(_S.read(_v1, "R"), "range", [0.5, 1.2]))), _S.binary("*", _S.binary("-", _S.read(_v1, "len"), _S.read(_v1, "s")), _S.invoke(_S.read(_v1, "R"), "range", [0.3, 0.6])), _S.binary("*", _S.read(_v1, "w"), 0.6), _S.read(_v1, "d"), _S.binary("+", _S.read(_v1, "depth"), 1)])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "s", 1.5, "+=", false)
	_S.invoke(_S.read(_e, "out"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": _S.read(_e, "w")}])])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "k", _S.arg(_args, 3))
	_S.define(_e, "near", _S.arg(_args, 4))
	_S.define(_e, "reveal", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), 0.22)]))
	_S.define(_e, "spin", _S.binary("*", _S.read(_e, "t"), 0.8))
	_S.define(_e, "burnt", (_S.binary("-", _S.read(_e, "t"), _S.read(_e, "S1")) if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "S1"))) else _S.unary("-", 1)))
	if _S.truth(_S.binary(">", _S.read(_e, "burnt"), 0.45)):
		return null
	_S.define(_e, "a0", (1 if _S.truth(_S.binary("<", _S.read(_e, "burnt"), 0)) else (1 if _S.truth(_S.binary("<", _S.read(_e, "burnt"), 0.07)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "burnt"), 0.07), 0.38)))))
	_S.define(_e, "hot", _S.logical("&&", _S.binary(">=", _S.read(_e, "burnt"), 0), func(): return _S.binary("<", _S.read(_e, "burnt"), 0.07)))
	_S.define(_e, "on", _S.function_value(_e, "_f3"))
	_S.define(_e, "from", _S.function_value(_e, "_f4"))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), 22)):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v4, "i"), 22), _S.read(_v4, "TAU")), _S.read(_v4, "spin")))
		if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_v4, "on"), [_S.read(_v4, "a")])), func(): return _S.binary(">", _S.call_value(_S.read(_v4, "from"), [_S.read(_v4, "a")]), _S.read(_v4, "reveal")))):
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
			continue
		for _v5 in _S.array([0, 0.06, 0.12]):
			var _v6 = _S.scope(_v4)
			_S.define(_v6, "da", _v5)
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "x", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.binary("+", _S.read(_v7, "a"), _S.read(_v7, "da"))]), _S.read(_v7, "RX")))
			_S.define(_v7, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.binary("+", _S.read(_v7, "a"), _S.read(_v7, "da"))]), _S.read(_v7, "RX")), _S.read(_v7, "SY")))
			_S.invoke(_S.read(_v7, "p"), "dot", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.read(_v7, "WHITE") if _S.truth(_S.read(_v7, "hot")) else ((_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.7)) else _S.prop(_S.read(_v7, "C"), 5)) if _S.truth(_S.read(_v7, "near")) else (_S.prop(_S.read(_v7, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v7, "k"), 0.7)) else _S.prop(_S.read(_v7, "C"), 3)))), _S.read(_v7, "a0")])
			if _S.truth(_S.read(_v7, "near")):
				_S.invoke(_S.read(_v7, "p"), "dot", [_S.read(_v7, "x"), _S.binary("+", _S.read(_v7, "y"), 1), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.read(_v7, "hot")) else _S.prop(_S.read(_v7, "C"), 2)), _S.read(_v7, "a0")])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v4, "i"), 3), 0)):
			_S.invoke(_S.read(_v4, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "RX")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "RX")), _S.read(_v4, "SY")), 5, _S.prop(_S.read(_v4, "C"), 4), _S.binary("*", _S.binary("*", 0.3, _S.read(_v4, "k")), _S.read(_v4, "a0"))])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "j"), 4)):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "a", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v9, "spin"), _S.unary("-", 0.5)), _S.binary("/", _S.binary("*", _S.read(_v9, "j"), _S.read(_v9, "TAU")), 4)), _S.binary("/", _S.prop(_S.read(_v9, "Math"), "PI"), 4)))
		if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_v9, "on"), [_S.read(_v9, "a")])), func(): return _S.binary("<", _S.read(_v9, "reveal"), 1))):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "j", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v9, "p"), "line", [_S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.binary("-", _S.read(_v9, "RX"), 5)), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.binary("-", _S.read(_v9, "RX"), 5)), _S.read(_v9, "SY")), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.binary("+", _S.read(_v9, "RX"), 5)), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.binary("+", _S.read(_v9, "RX"), 5)), _S.read(_v9, "SY")), (_S.read(_v9, "WHITE") if _S.truth(_S.read(_v9, "hot")) else (_S.prop(_S.read(_v9, "C"), 6) if _S.truth(_S.read(_v9, "near")) else _S.prop(_S.read(_v9, "C"), 4))), _S.read(_v9, "a0")])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "j", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "t"), 0.3)):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "a", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "a"), _S.read(_v10, "TAU"))):
			var _v11 = _S.scope(_v10)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v11, "on"), [_S.read(_v11, "a")]))):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "a", 0.09, "+=", false)
				continue
			_S.invoke(_S.read(_v11, "p"), "dot", [_S.binary("*", _S.invoke(_S.read(_v11, "Math"), "cos", [_S.read(_v11, "a")]), 14), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v11, "Math"), "sin", [_S.read(_v11, "a")]), 14), _S.read(_v11, "SY")), (_S.read(_v11, "WHITE") if _S.truth(_S.read(_v11, "hot")) else (_S.prop(_S.read(_v11, "C"), 4) if _S.truth(_S.read(_v11, "near")) else _S.prop(_S.read(_v11, "C"), 2))), _S.binary("*", _S.read(_v11, "a0"), _S.call_value(_S.read(_v11, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v11, "t"), 0.3), 0.12)]))])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "a", 0.09, "+=", false)
	if _S.truth(_S.logical("&&", _S.read(_e, "near"), func(): return _S.binary("<", _S.read(_e, "burnt"), 0))):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "pulse", _S.binary("+", 0.6, _S.binary("*", 0.4, _S.invoke(_S.read(_v12, "Math"), "sin", [_S.binary("*", _S.read(_v12, "t"), _S.binary("+", 10, _S.binary("*", 30, _S.read(_v12, "k"))))]))))
		_S.invoke(_S.read(_v12, "p"), "px", [0, 0, (_S.read(_v12, "WHITE") if _S.truth(_S.binary(">", _S.read(_v12, "k"), 0.5)) else _S.prop(_S.read(_v12, "C"), 6))])
		for _v13 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, _S.unary("-", 1)]]):
			var _v14 = _S.scope(_v12)
			var _v15 = _v13
			_S.define(_v14, "dx", _S.prop(_v15, 0))
			_S.define(_v14, "dy", _S.prop(_v15, 1))
			_S.invoke(_S.read(_v14, "p"), "px", [_S.read(_v14, "dx"), _S.read(_v14, "dy"), _S.prop(_S.read(_v14, "C"), 5)])
		_S.invoke(_S.read(_v12, "p"), "glow", [0, _S.unary("-", 1), _S.binary("+", 10, _S.binary("*", 10, _S.read(_v12, "k"))), _S.prop(_S.read(_v12, "C"), 5), _S.binary("+", 0.3, _S.binary("*", _S.binary("*", 0.4, _S.read(_v12, "k")), _S.read(_v12, "pulse")))])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("===", _S.binary(">=", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), 0), _S.read(_e, "near"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_e, "a"), _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2)), _S.read(_e, "TAU")), _S.read(_e, "TAU")), _S.prop(_S.read(_e, "Math"), "PI")), _S.read(_e, "TAU")), _S.prop(_S.read(_e, "Math"), "PI"))]), _S.prop(_S.read(_e, "Math"), "PI"))

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "paths", [])
	for _v16 in _S.array(_S.prop(_S.read(_e, "b"), "paths")):
		var _v17 = _S.scope(_e)
		_S.define(_v17, "q", _v16)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "pts", [])
		for _v19 in _S.array(_S.prop(_S.read(_v18, "q"), "pts")):
			var _v20 = _S.scope(_v18)
			_S.define(_v20, "pt", _v19)
			var _v21 = _S.scope(_v20)
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary(">", _S.invoke(_S.read(_v21, "Math"), "abs", [_S.prop(_S.read(_v21, "pt"), 0)]), _S.binary("-", _S.read(_v21, "W"), 5)), func(): return _S.binary(">", _S.prop(_S.read(_v21, "pt"), 1), _S.unary("-", 3))), func(): return _S.binary("<", _S.prop(_S.read(_v21, "pt"), 1), _S.binary("+", _S.read(_v21, "TOP"), 6)))):
				break
			_S.invoke(_S.read(_v21, "pts"), "push", [_S.read(_v21, "pt")])
		if _S.truth(_S.logical("||", _S.binary(">=", _S.prop(_S.read(_v18, "q"), "w"), 1), func(): return _S.binary(">", _S.prop(_S.read(_v18, "pts"), "length"), 3))):
			_S.invoke(_S.read(_v18, "paths"), "push", [_S.merge([{"w": _S.prop(_S.read(_v18, "q"), "w")}, {"pts": (_S.prop(_S.read(_v18, "q"), "pts") if _S.truth(_S.binary(">=", _S.prop(_S.read(_v18, "q"), "w"), 1)) else _S.read(_v18, "pts"))}])])
	return _S.merge([{"paths": _S.read(_e, "paths")}])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "hot", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "X0", _S.binary("*", _S.invoke(_S.read(_e, "R"), "range", [8, 18]), (1 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.5])) else _S.unary("-", 1))))
	_S.define(_e, "main", _S.call_value(_S.read(_e, "keep"), [_S.call_value(_S.read(_e, "zigzag"), [_S.read(_e, "R"), _S.read(_e, "X0"), _S.read(_e, "TOP"), 0, _S.unary("-", 1), 0.17, 0.5])]))
	_S.define(_e, "trunk", _S.prop(_S.prop(_S.prop(_S.read(_e, "main"), "paths"), 0), "pts"))
	_S.define(_e, "drift", _S.function_value(_e, "_f8"))
	_S.define(_e, "bolts", [_S.read(_e, "main"), _S.call_value(_S.read(_e, "bend"), [_S.merge([{"paths": [_S.merge([{"pts": _S.read(_e, "trunk")}, {"w": 1}])]}]), _S.call_value(_S.read(_e, "drift"), [1.5])]), _S.call_value(_S.read(_e, "bend"), [_S.merge([{"paths": [_S.merge([{"pts": _S.read(_e, "trunk")}, {"w": 1}])]}]), _S.call_value(_S.read(_e, "drift"), [3])])])
	_S.define(_e, "chan", _S.function_value(_e, "_f10"))
	_S.define(_e, "last", _S.prop(_S.read(_e, "STROKES"), _S.binary("-", _S.prop(_S.read(_e, "STROKES"), "length"), 1)))
	_S.define(_e, "end", _S.call_value(_S.read(_e, "chan"), [_S.binary("-", _S.prop(_S.read(_e, "STROKES"), "length"), 1)]))
	_S.define(_e, "tree", _S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "R")]))
	_S.define(_e, "gone", _S.invoke(_S.read(_e, "end"), "map", [_S.function_value(_e, "_f11")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "struck", _S.unary("-", 1))
	_S.define(_e, "now", _S.function_value(_e, "_f12"))
	_S.define(_e, "charge", _S.function_value(_e, "_f13"))
	_S.define(_e, "heatAt", _S.function_value(_e, "_f14"))
	return _S.merge([{"update": _S.function_value(_e, "_f16")}, {"drawBack": _S.function_value(_e, "_f17")}, {"draw": _S.function_value(_e, "_f18")}])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "dx", _S.arg(_args, 0))
	return _S.function_value(_e, "_f9")

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "dx"), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "y")), _S.read(_e, "TOP"))]))), _S.read(_e, "y")]

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "i", _S.arg(_args, 0))
	return _S.prop(_S.prop(_S.prop(_S.prop(_S.read(_e, "bolts"), _S.read(_e, "i")), "paths"), 0), "pts")

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v22 = _S.arg(_args, 0)
	_S.define(_e, "y", _S.prop(_v22, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "last"), "t"), 0.25), _S.binary("*", 0.75, _S.binary("+", _S.binary("*", 0.55, _S.call_value(_S.read(_e, "rand"), [_S.prop(_S.read(_e, "o"), "seed"), _S.read(_e, "i"), 5])), _S.binary("*", 0.45, _S.binary("-", 1, _S.binary("/", _S.read(_e, "y"), _S.read(_e, "TOP")))))))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v23 = _S.scope(_e)
	_S.define(_v23, "i", _S.binary("-", _S.prop(_S.read(_v23, "STROKES"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v23, "i"), 0)):
		if _S.truth(_S.binary(">=", _S.read(_v23, "t"), _S.prop(_S.prop(_S.read(_v23, "STROKES"), _S.read(_v23, "i")), "t"))):
			return _S.merge([{"i": _S.read(_v23, "i")}, {"s": _S.prop(_S.read(_v23, "STROKES"), _S.read(_v23, "i"))}, {"a": _S.binary("-", _S.read(_v23, "t"), _S.prop(_S.prop(_S.read(_v23, "STROKES"), _S.read(_v23, "i")), "t"))}, {"k": _S.binary("*", _S.call_value(_S.read(_v23, "level"), [_S.binary("-", _S.read(_v23, "t"), _S.prop(_S.prop(_S.read(_v23, "STROKES"), _S.read(_v23, "i")), "t"))]), _S.prop(_S.prop(_S.read(_v23, "STROKES"), _S.read(_v23, "i")), "k"))}])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "i", 1, "-=", true)
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.binary("**", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "S1"))]), 1.5)

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "struck"), 0)) else _S.invoke(_S.read(_e, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.invoke(_S.read(_e, "STROKES"), "slice", [0, _S.binary("+", _S.read(_e, "struck"), 1)]), "map", [_S.function_value(_e, "_f15")]))])))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.binary("*", _S.prop(_S.read(_e, "s"), "k"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.prop(_S.read(_e, "s"), "t")), 1.6))]), 1.4]))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	for _v24 in _S.array(_S.invoke(_S.read(_e, "STROKES"), "entries", [])):
		var _v25 = _S.scope(_e)
		var _v26 = _v24
		_S.define(_v25, "i", _S.prop(_v26, 0))
		_S.define(_v25, "s", _S.prop(_v26, 1))
		var _v27 = _S.scope(_v25)
		if _S.truth(_S.logical("||", _S.binary(">=", _S.read(_v27, "struck"), _S.read(_v27, "i")), func(): return _S.binary("<", _S.read(_v27, "t"), _S.prop(_S.read(_v27, "s"), "t")))):
			continue
		_S.write(_v27, "struck", _S.read(_v27, "i"), "=", false)
		_S.define(_v27, "k", _S.prop(_S.read(_v27, "s"), "k"))
		_S.invoke(_S.read(_v27, "lights"), "add", [0, _S.unary("-", 50), 120, _S.prop(_S.read(_v27, "C"), 4), _S.binary("*", 0.55, _S.read(_v27, "k")), 0.4])
		_S.invoke(_S.read(_v27, "lights"), "add", [0, _S.unary("-", 3), 24, _S.read(_v27, "WHITE"), _S.binary("*", 0.5, _S.read(_v27, "k")), 0.1])
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v28, "j"), _S.invoke(_S.read(_v28, "Math"), "round", [_S.binary("*", 44, _S.read(_v28, "k"))]))):
			var _v29 = _S.scope(_v28)
			_S.define(_v29, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v29, "Math"), "PI")), 2), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 1.3), 1.3])))
			_S.define(_v29, "sp", _S.binary("*", _S.invoke(_S.read(_v29, "R"), "range", [110, 320]), _S.binary("+", 0.65, _S.binary("*", 0.35, _S.read(_v29, "k")))))
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "SPARK"), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 1.5), 1.5]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "cos", [_S.read(_v29, "a")]), _S.read(_v29, "sp")), _S.binary("*", _S.invoke(_S.read(_v29, "Math"), "sin", [_S.read(_v29, "a")]), _S.read(_v29, "sp")), _S.invoke(_S.read(_v29, "R"), "range", [0.2, 0.55])])
			_v28 = _S.iteration(_v28)
			_S.write(_v28, "j", 1, "+=", true)
		var _v30 = _S.scope(_v27)
		_S.define(_v30, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v30, "j"), _S.invoke(_S.read(_v30, "Math"), "round", [_S.binary("*", 12, _S.read(_v30, "k"))]))):
			var _v31 = _S.scope(_v30)
			_S.define(_v31, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v31, "Math"), "PI")), 2), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v31, "sp", _S.invoke(_S.read(_v31, "R"), "range", [70, 220]))
			_S.invoke(_S.read(_v31, "hot"), "spawn", [_S.prop(_S.read(_v31, "P"), "SPARK"), _S.invoke(_S.read(_v31, "R"), "range", [_S.unary("-", 2), 2]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "cos", [_S.read(_v31, "a")]), _S.read(_v31, "sp")), _S.binary("*", _S.invoke(_S.read(_v31, "Math"), "sin", [_S.read(_v31, "a")]), _S.read(_v31, "sp")), _S.invoke(_S.read(_v31, "R"), "range", [0.5, 1])])
			_v30 = _S.iteration(_v30)
			_S.write(_v30, "j", 1, "+=", true)
		var _v32 = _S.scope(_v27)
		_S.define(_v32, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v32, "j"), _S.invoke(_S.read(_v32, "Math"), "round", [_S.binary("*", 5, _S.read(_v32, "k"))]))):
			_S.invoke(_S.read(_v32, "hot"), "spawn", [_S.prop(_S.read(_v32, "P"), "EMBER"), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", 2), _S.invoke(_S.read(_v32, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v32, "R"), "range", [30, 80])), _S.invoke(_S.read(_v32, "R"), "range", [0.8, 1.5])])
			_v32 = _S.iteration(_v32)
			_S.write(_v32, "j", 1, "+=", true)
		var _v33 = _S.scope(_v27)
		_S.define(_v33, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "j"), _S.invoke(_S.read(_v33, "Math"), "round", [_S.binary("*", 18, _S.read(_v33, "k"))]))):
			var _v34 = _S.scope(_v33)
			_S.define(_v34, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v34, "Math"), "PI")), 2), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v34, "sp", _S.invoke(_S.read(_v34, "R"), "range", [50, 190]))
			_S.invoke(_S.read(_v34, "ps"), "spawn", [_S.prop(_S.read(_v34, "P"), "GRIT"), _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "a")]), _S.read(_v34, "sp")), _S.invoke(_S.read(_v34, "R"), "range", [1, 1.5]), _S.invoke(_S.read(_v34, "R"), "pick", [_S.read(_v34, "STONE")]), (2 if _S.truth(_S.invoke(_S.read(_v34, "R"), "chance", [0.35])) else 1)])
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "j", 1, "+=", true)
		var _v35 = _S.scope(_v27)
		_S.define(_v35, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v35, "j"), 8)):
			_S.invoke(_S.read(_v35, "ps"), "spawn", [_S.prop(_S.read(_v35, "P"), "DUST"), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v35, "R"), "sign", []), _S.invoke(_S.read(_v35, "R"), "range", [30, 110])), _S.unary("-", _S.invoke(_S.read(_v35, "R"), "range", [4, 24])), _S.invoke(_S.read(_v35, "R"), "range", [0.4, 0.8]), _S.read(_v35, "DUST"), _S.invoke(_S.read(_v35, "R"), "range", [1.5, 3])])
			_v35 = _S.iteration(_v35)
			_S.write(_v35, "j", 1, "+=", true)
		var _v36 = _S.scope(_v27)
		_S.define(_v36, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v36, "j"), _S.invoke(_S.read(_v36, "Math"), "round", [_S.binary("*", 4, _S.read(_v36, "k"))]))):
			_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "SMOKE"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 4), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [10, 25])), _S.invoke(_S.read(_v36, "R"), "range", [1.1, 1.6]), _S.call_value(_S.read(_v36, "mix"), [_S.read(_v36, "ASH"), _S.prop(_S.read(_v36, "C"), 2), 0.3]), _S.invoke(_S.read(_v36, "R"), "range", [3, 6]), _S.invoke(_S.read(_v36, "R"), "range", [0.05, 0.25])])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "j", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "struck"), 0), func(): return _S.binary("<", _S.read(_e, "t"), 1.7)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 6, _S.read(_e, "dt"))]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "SMOKE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 2), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [9, 17])), _S.invoke(_S.read(_e, "R"), "range", [1, 1.3]), 0, _S.invoke(_S.read(_e, "R"), "range", [2, 3.5])])
	var _v37 = _S.scope(_e)
	_S.define(_v37, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v37, "i"), _S.binary("-", _S.prop(_S.read(_v37, "gone"), "length"), 1))):
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<=", _S.prop(_S.read(_v37, "gone"), _S.read(_v37, "i")), _S.read(_v37, "t")), func(): return _S.binary(">", _S.prop(_S.read(_v37, "gone"), _S.read(_v37, "i")), _S.binary("-", _S.read(_v37, "t"), _S.read(_v37, "dt")))), func(): return _S.binary("<", _S.call_value(_S.read(_v37, "rand"), [_S.prop(_S.read(_v37, "o"), "seed"), _S.read(_v37, "i"), 6]), 0.5))):
			var _v38 = _S.scope(_v37)
			var _v39 = _S.prop(_S.read(_v38, "end"), _S.read(_v38, "i"))
			_S.define(_v38, "x", _S.prop(_v39, 0))
			_S.define(_v38, "y", _S.prop(_v39, 1))
			_S.invoke(_S.read(_v38, "ps"), "spawn", [_S.prop(_S.read(_v38, "P"), "MOTE"), _S.read(_v38, "x"), _S.read(_v38, "y"), _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 8), 8]), _S.invoke(_S.read(_v38, "R"), "range", [6, 22]), _S.invoke(_S.read(_v38, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_v38, "C"), 5) if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.5])) else _S.prop(_S.read(_v38, "C"), 4)), _S.invoke(_S.read(_v38, "R"), "range", [0.5, 0.9])])
		_v37 = _S.iteration(_v37)
		_S.write(_v37, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "hot"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "dark", _S.binary("*", _S.binary("*", 0.5, _S.call_value(_S.read(_e, "smooth"), [0.46, 0.66, _S.read(_e, "t")])), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "S1"), 0.01), _S.binary("+", _S.read(_e, "S1"), 0.02), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "dark"), 0.01)):
		var _v40 = _S.scope(_e)
		_S.define(_v40, "y", _S.unary("-", 228))
		while _S.truth(_S.binary("<", _S.read(_v40, "y"), 36)):
			var _v41 = _S.scope(_v40)
			_S.define(_v41, "x", _S.unary("-", _S.read(_v41, "W")))
			while _S.truth(_S.binary("<", _S.read(_v41, "x"), _S.read(_v41, "W"))):
				var _v42 = _S.scope(_v41)
				_S.define(_v42, "d", _S.invoke(_S.read(_v42, "Math"), "hypot", [_S.binary("/", _S.read(_v42, "x"), _S.read(_v42, "W")), _S.binary("/", _S.binary("+", _S.read(_v42, "y"), 96), 132)]))
				_S.define(_v42, "a", _S.binary("*", _S.read(_v42, "dark"), _S.binary("-", 1, _S.call_value(_S.read(_v42, "smooth"), [0.55, 1, _S.read(_v42, "d")]))))
				if _S.truth(_S.binary(">", _S.read(_v42, "a"), 0.01)):
					_S.invoke(_S.read(_v42, "p"), "blend", [_S.binary("+", _S.read(_v42, "x"), 0.5), _S.binary("+", _S.read(_v42, "y"), 0.5), _S.read(_v42, "NIGHT"), _S.read(_v42, "a")])
				_v41 = _S.iteration(_v41)
				_S.write(_v41, "x", 1, "+=", true)
			_v40 = _S.iteration(_v40)
			_S.write(_v40, "y", 1, "+=", true)
	_S.call_value(_S.read(_e, "sigil"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.call_value(_S.read(_e, "charge"), []), false])
	if _S.truth(_S.binary(">=", _S.read(_e, "struck"), 0)):
		var _v43 = _S.scope(_e)
		_S.define(_v43, "s", _S.call_value(_S.read(_v43, "now"), []))
		_S.define(_v43, "front", _S.binary("*", _S.read(_v43, "REACH"), _S.invoke(_S.read(_v43, "ease"), "outCubic", [_S.call_value(_S.read(_v43, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v43, "t"), _S.read(_v43, "S1")), 0.35)])])))
		_S.define(_v43, "T0", _S.call_value(_S.read(_v43, "heatAt"), []))
		_S.define(_v43, "fade", _S.binary("-", 1, _S.call_value(_S.read(_v43, "smooth"), [2.3, 2.95, _S.read(_v43, "t")])))
		_S.define(_v43, "elec", (_S.binary("*", _S.prop(_S.prop(_S.read(_v43, "s"), "s"), "k"), _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v43, "s"), "a"), 0.14))) if _S.truth(_S.binary("<", _S.prop(_S.read(_v43, "s"), "a"), 0.14)) else 0))
		for _v44 in _S.array(_S.read(_v43, "tree")):
			var _v45 = _S.scope(_v43)
			_S.define(_v45, "br", _v44)
			for _v46 in _S.array(_S.prop(_S.read(_v45, "br"), "pts")):
				var _v47 = _S.scope(_v45)
				var _v48 = _v46
				_S.define(_v47, "x", _S.prop(_v48, 0))
				_S.define(_v47, "y", _S.prop(_v48, 1))
				_S.define(_v47, "d", _S.prop(_v48, 2))
				var _v49 = _S.scope(_v47)
				if _S.truth(_S.binary(">", _S.read(_v49, "d"), _S.read(_v49, "front"))):
					break
				_S.define(_v49, "q", _S.binary("/", _S.read(_v49, "d"), _S.read(_v49, "REACH")))
				_S.define(_v49, "n", _S.call_value(_S.read(_v49, "rand"), [_S.invoke(_S.read(_v49, "Math"), "round", [_S.binary("*", _S.read(_v49, "x"), 2)]), _S.invoke(_S.read(_v49, "Math"), "round", [_S.binary("*", _S.read(_v49, "y"), 2)]), 9]))
				_S.define(_v49, "fresh", _S.logical("&&", _S.binary(">", _S.read(_v49, "d"), _S.binary("-", _S.read(_v49, "front"), 6)), func(): return _S.binary("<", _S.read(_v49, "front"), _S.read(_v49, "REACH"))))
				_S.define(_v49, "T", _S.binary("-", _S.binary("*", _S.binary("*", _S.read(_v49, "T0"), _S.binary("-", 1.15, _S.read(_v49, "q"))), (0.8 if _S.truth(_S.binary("<", _S.prop(_S.read(_v49, "br"), "w"), 1)) else 1)), _S.binary("*", _S.read(_v49, "n"), 0.25)))
				_S.define(_v49, "c", ((_S.read(_v49, "WHITE") if _S.truth(_S.binary("<", _S.read(_v49, "q"), 0.5)) else _S.prop(_S.read(_v49, "C"), 6)) if _S.truth(_S.logical("||", _S.read(_v49, "fresh"), func(): return _S.logical("&&", _S.binary(">", _S.read(_v49, "elec"), 0.3), func(): return _S.binary("<", _S.read(_v49, "n"), 0.85)))) else _S.logical("||", _S.call_value(_S.read(_v49, "heat"), [_S.read(_v49, "T")]), func(): return _S.read(_v49, "SOOT2"))))
				_S.invoke(_S.read(_v49, "p"), "dot", [_S.read(_v49, "x"), _S.binary("+", _S.read(_v49, "y"), 1), _S.read(_v49, "SOOT"), _S.read(_v49, "fade")])
				_S.invoke(_S.read(_v49, "p"), "dot", [_S.read(_v49, "x"), _S.read(_v49, "y"), _S.read(_v49, "c"), _S.read(_v49, "fade")])
				if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v49, "br"), "w"), 1), func(): return _S.binary("<", _S.read(_v49, "d"), 9))):
					_S.invoke(_S.read(_v49, "p"), "dot", [_S.read(_v49, "x"), _S.binary("+", _S.read(_v49, "y"), 2), _S.read(_v49, "SOOT"), _S.read(_v49, "fade")])
				if _S.truth(_S.logical("&&", _S.logical("||", _S.read(_v49, "fresh"), func(): return _S.binary(">", _S.read(_v49, "elec"), 0.3)), func(): return _S.binary("===", _S.binary("&", _S.invoke(_S.read(_v49, "Math"), "round", [_S.read(_v49, "d")]), 3), 0))):
					_S.invoke(_S.read(_v49, "p"), "glow", [_S.read(_v49, "x"), _S.read(_v49, "y"), 7, _S.prop(_S.read(_v49, "C"), 5), 0.4])
				else:
					if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v49, "T"), 0.2), func(): return _S.binary("===", _S.binary("&", _S.invoke(_S.read(_v49, "Math"), "round", [_S.read(_v49, "d")]), 3), 0))):
						_S.invoke(_S.read(_v49, "p"), "glow", [_S.read(_v49, "x"), _S.read(_v49, "y"), 5, _S.read(_v49, "c"), _S.binary("*", 0.2, _S.read(_v49, "T"))])
		_S.call_value(_S.read(_v43, "scorch"), [_S.read(_v43, "p"), 0, 0, 12, _S.read(_v43, "T0"), _S.read(_v43, "fade")])
		if _S.truth(_S.binary(">", _S.read(_v43, "T0"), 0)):
			_S.invoke(_S.read(_v43, "p"), "glow", [0, _S.unary("-", 2), 34, _S.call_value(_S.read(_v43, "heat"), [0.55]), _S.binary("*", 0.3, _S.read(_v43, "T0"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	_S.invoke(_S.read(_e, "hot"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "s", _S.call_value(_S.read(_e, "now"), []))
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), 30), 0.0001)]))
	_S.define(_e, "k", _S.call_value(_S.read(_e, "charge"), []))
	_S.call_value(_S.read(_e, "sigil"), [_S.read(_e, "p"), _S.read(_e, "t"), _S.read(_e, "C"), _S.read(_e, "k"), true])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.15), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "S1")))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "r", _S.call_value(_S.read(_v50, "rng"), [_S.prop(_S.read(_v50, "o"), "seed"), 61, _S.read(_v50, "f")]))
		var _v51 = _S.scope(_v50)
		_S.define(_v51, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v51, "i"), _S.invoke(_S.read(_v51, "Math"), "round", [_S.binary("+", 1, _S.binary("*", 4, _S.read(_v51, "k")))]))):
			var _v52 = _S.scope(_v51)
			_S.define(_v52, "a", _S.invoke(_S.read(_v52, "r"), "range", [0, _S.read(_v52, "TAU")]))
			_S.define(_v52, "x", _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "cos", [_S.read(_v52, "a")]), _S.read(_v52, "RX")))
			_S.define(_v52, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "sin", [_S.read(_v52, "a")]), _S.read(_v52, "RX")), _S.read(_v52, "SY")))
			_S.call_value(_S.read(_v52, "crackle"), [_S.read(_v52, "p"), _S.call_value(_S.read(_v52, "zigzag"), [_S.read(_v52, "r"), _S.read(_v52, "x"), _S.read(_v52, "y"), _S.binary("+", _S.read(_v52, "x"), _S.invoke(_S.read(_v52, "r"), "range", [_S.unary("-", 2.5), 2.5])), _S.binary("-", _S.read(_v52, "y"), _S.binary("*", _S.invoke(_S.read(_v52, "r"), "range", [4, 9]), _S.binary("+", 0.6, _S.read(_v52, "k")))), 0.45, 0.3]), _S.binary("+", 0.45, _S.binary("*", 0.4, _S.read(_v52, "k"))), _S.read(_v52, "C"), 0.3])
			_v51 = _S.iteration(_v51)
			_S.write(_v51, "i", 1, "+=", true)
		_S.invoke(_S.read(_v50, "p"), "glow", [0, _S.unary("-", 2), 36, _S.prop(_S.read(_v50, "C"), 4), _S.binary("+", 0.12, _S.binary("*", 0.3, _S.read(_v50, "k")))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LEAD0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "S1")))):
		var _v53 = _S.scope(_e)
		_S.define(_v53, "u", _S.call_value(_S.read(_v53, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v53, "t"), _S.read(_v53, "LEAD0")), _S.binary("-", _S.read(_v53, "S1"), _S.read(_v53, "LEAD0")))]))
		_S.define(_v53, "st", _S.invoke(_S.read(_v53, "Math"), "min", [_S.read(_v53, "STEPS"), _S.binary("+", _S.invoke(_S.read(_v53, "Math"), "floor", [_S.binary("*", _S.read(_v53, "u"), _S.read(_v53, "STEPS"))]), 1)]))
		_S.define(_v53, "fresh", _S.binary("-", 1, _S.binary("%", _S.binary("*", _S.read(_v53, "u"), _S.read(_v53, "STEPS")), 1)))
		_S.define(_v53, "reach", _S.binary("+", _S.read(_v53, "TOP"), _S.binary("*", _S.binary("-", _S.read(_v53, "MEET"), _S.read(_v53, "TOP")), _S.invoke(_S.read(_v53, "Math"), "pow", [_S.binary("/", _S.read(_v53, "st"), _S.read(_v53, "STEPS")), 1.2]))))
		_S.define(_v53, "prev", _S.binary("+", _S.read(_v53, "TOP"), _S.binary("*", _S.binary("-", _S.read(_v53, "MEET"), _S.read(_v53, "TOP")), _S.invoke(_S.read(_v53, "Math"), "pow", [_S.binary("/", _S.binary("-", _S.read(_v53, "st"), 1), _S.read(_v53, "STEPS")), 1.2]))))
		for _v54 in _S.array(_S.prop(_S.read(_v53, "main"), "paths")):
			var _v55 = _S.scope(_v53)
			_S.define(_v55, "q", _v54)
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "tk", _S.binary(">=", _S.prop(_S.read(_v56, "q"), "w"), 1))
			var _v57 = _S.scope(_v56)
			_S.define(_v57, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v57, "i"), _S.binary("-", _S.prop(_S.prop(_S.read(_v57, "q"), "pts"), "length"), 1))):
				var _v58 = _S.scope(_v57)
				var _v59 = _S.prop(_S.prop(_S.read(_v58, "q"), "pts"), _S.read(_v58, "i"))
				_S.define(_v58, "ax", _S.prop(_v59, 0))
				_S.define(_v58, "ay", _S.prop(_v59, 1))
				var _v60 = _S.prop(_S.prop(_S.read(_v58, "q"), "pts"), _S.binary("+", _S.read(_v58, "i"), 1))
				_S.define(_v58, "bx", _S.prop(_v60, 0))
				_S.define(_v58, "by", _S.prop(_v60, 1))
				if _S.truth(_S.binary(">", _S.read(_v58, "by"), _S.read(_v58, "reach"))):
					var _v61 = _S.scope(_v58)
					if _S.truth(_S.logical("&&", _S.binary("<=", _S.read(_v61, "ay"), _S.read(_v61, "reach")), func(): return _S.binary(">", _S.read(_v61, "i"), 0))):
						_S.last([_S.invoke(_S.read(_v61, "p"), "px", [_S.read(_v61, "ax"), _S.read(_v61, "ay"), _S.read(_v61, "WHITE")]), _S.invoke(_S.read(_v61, "p"), "glow", [_S.read(_v61, "ax"), _S.read(_v61, "ay"), 7, _S.prop(_S.read(_v61, "C"), 5), _S.binary("+", _S.binary("*", 0.5, _S.read(_v61, "fresh")), 0.15)])])
					break
				_S.define(_v58, "young", _S.binary(">", _S.read(_v58, "by"), _S.read(_v58, "prev")))
				_S.invoke(_S.read(_v58, "p"), "line", [_S.read(_v58, "ax"), _S.read(_v58, "ay"), _S.read(_v58, "bx"), _S.read(_v58, "by"), (((_S.prop(_S.read(_v58, "C"), 6) if _S.truth(_S.read(_v58, "tk")) else _S.prop(_S.read(_v58, "C"), 5)) if _S.truth(_S.binary(">", _S.read(_v58, "fresh"), 0.4)) else _S.prop(_S.read(_v58, "C"), 4)) if _S.truth(_S.read(_v58, "young")) else (_S.prop(_S.read(_v58, "C"), 3) if _S.truth(_S.read(_v58, "tk")) else _S.prop(_S.read(_v58, "C"), 2)))])
				if _S.truth(_S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_v58, "i"), 4), 0), func(): return _S.binary(">", _S.read(_v58, "ay"), _S.binary("+", _S.read(_v58, "TOP"), 14)))):
					_S.invoke(_S.read(_v58, "p"), "glow", [_S.read(_v58, "ax"), _S.read(_v58, "ay"), (8 if _S.truth(_S.read(_v58, "young")) else 5), _S.prop(_S.read(_v58, "C"), 4), (_S.binary("+", _S.binary("*", 0.3, _S.read(_v58, "fresh")), 0.1) if _S.truth(_S.read(_v58, "young")) else 0.12)])
				_v57 = _S.iteration(_v57)
				_S.write(_v57, "i", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.read(_v53, "t"), 0.62)):
			var _v62 = _S.scope(_v53)
			_S.define(_v62, "h", _S.binary("*", _S.unary("-", _S.read(_v62, "MEET")), _S.invoke(_S.read(_v62, "ease"), "outQuad", [_S.binary("/", _S.binary("-", _S.read(_v62, "t"), 0.62), _S.binary("-", _S.read(_v62, "S1"), 0.62))])))
			_S.define(_v62, "r", _S.call_value(_S.read(_v62, "rng"), [_S.prop(_S.read(_v62, "o"), "seed"), 77, _S.read(_v62, "f")]))
			_S.define(_v62, "b", _S.call_value(_S.read(_v62, "zigzag"), [_S.read(_v62, "r"), 0, _S.unary("-", 1), _S.invoke(_S.read(_v62, "r"), "range", [_S.unary("-", 2), 2]), _S.unary("-", _S.invoke(_S.read(_v62, "Math"), "max", [3, _S.read(_v62, "h")])), 0.3, 0.3]))
			_S.define(_v62, "tip", _S.invoke(_S.prop(_S.prop(_S.prop(_S.read(_v62, "b"), "paths"), 0), "pts"), "at", [_S.unary("-", 1)]))
			_S.call_value(_S.read(_v62, "crackle"), [_S.read(_v62, "p"), _S.read(_v62, "b"), 0.85, _S.read(_v62, "C"), 0.45])
			_S.invoke(_S.read(_v62, "p"), "px", [_S.prop(_S.read(_v62, "tip"), 0), _S.prop(_S.read(_v62, "tip"), 1), _S.read(_v62, "WHITE")])
			_S.invoke(_S.read(_v62, "p"), "glow", [_S.prop(_S.read(_v62, "tip"), 0), _S.prop(_S.read(_v62, "tip"), 1), 9, _S.prop(_S.read(_v62, "C"), 5), 0.5])
	_S.define(_e, "next", _S.invoke(_S.read(_e, "STROKES"), "find", [_S.function_value(_e, "_f19")]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "next"), func(): return _S.binary("!==", _S.read(_e, "next"), _S.prop(_S.read(_e, "STROKES"), 0))), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "next"), "t"), 0.06)))):
		var _v63 = _S.scope(_e)
		_S.define(_v63, "tr", _S.call_value(_S.read(_v63, "chan"), [_S.invoke(_S.read(_v63, "STROKES"), "indexOf", [_S.read(_v63, "next")])]))
		_S.define(_v63, "u", _S.binary("/", _S.binary("-", _S.read(_v63, "t"), _S.binary("-", _S.prop(_S.read(_v63, "next"), "t"), 0.06)), 0.06))
		_S.define(_v63, "i1", _S.invoke(_S.read(_v63, "Math"), "floor", [_S.binary("*", _S.read(_v63, "u"), _S.prop(_S.read(_v63, "tr"), "length"))]))
		_S.call_value(_S.read(_v63, "trace"), [_S.read(_v63, "p"), _S.read(_v63, "tr"), _S.prop(_S.read(_v63, "C"), 3), 1])
		_S.call_value(_S.read(_v63, "trace"), [_S.read(_v63, "p"), _S.read(_v63, "tr"), _S.prop(_S.read(_v63, "C"), 6), 1, _S.binary("-", _S.read(_v63, "i1"), 18), _S.read(_v63, "i1")])
		var _v64 = _S.scope(_v63)
		_S.define(_v64, "i", _S.invoke(_S.read(_v64, "Math"), "max", [0, _S.binary("-", _S.read(_v64, "i1"), 18)]))
		while _S.truth(_S.binary("<", _S.read(_v64, "i"), _S.invoke(_S.read(_v64, "Math"), "min", [_S.prop(_S.read(_v64, "tr"), "length"), _S.read(_v64, "i1")]))):
			if _S.truth(_S.binary(">", _S.prop(_S.prop(_S.read(_v64, "tr"), _S.read(_v64, "i")), 1), _S.binary("+", _S.read(_v64, "TOP"), 14))):
				_S.invoke(_S.read(_v64, "p"), "glow", [_S.prop(_S.prop(_S.read(_v64, "tr"), _S.read(_v64, "i")), 0), _S.prop(_S.prop(_S.read(_v64, "tr"), _S.read(_v64, "i")), 1), 9, _S.prop(_S.read(_v64, "C"), 4), 0.35])
			_v64 = _S.iteration(_v64)
			_S.write(_v64, "i", 4, "+=", false)
	else:
		if _S.truth(_S.logical("&&", _S.read(_e, "s"), func(): return _S.binary(">", _S.prop(_S.read(_e, "s"), "k"), 0))):
			var _v65 = _S.scope(_e)
			_S.define(_v65, "hero", _S.logical("&&", _S.binary("===", _S.prop(_S.read(_v65, "s"), "i"), 0), func(): return _S.binary("<", _S.prop(_S.read(_v65, "s"), "a"), _S.binary("/", 1, 30))))
			_S.call_value(_S.read(_v65, "stroke"), [_S.read(_v65, "p"), _S.prop(_S.read(_v65, "bolts"), _S.prop(_S.read(_v65, "s"), "i")), _S.prop(_S.read(_v65, "s"), "k"), _S.read(_v65, "C"), (1.5 if _S.truth(_S.binary("===", _S.prop(_S.read(_v65, "s"), "i"), 0)) else 1.2), _S.merge([{"hero": _S.read(_v65, "hero")}, {"core": ((1.2 if _S.truth(_S.read(_v65, "hero")) else 0.8) if _S.truth(_S.binary(">", _S.prop(_S.read(_v65, "s"), "k"), 0.6)) else 0)}, {"minY": _S.binary("+", _S.read(_v65, "TOP"), 14)}])])
			_S.define(_v65, "r", _S.binary("*", 4.5, _S.prop(_S.read(_v65, "s"), "k")))
			_S.invoke(_S.read(_v65, "p"), "circle", [0, _S.unary("-", 1), _S.binary("+", _S.read(_v65, "r"), 1.5), _S.prop(_S.read(_v65, "C"), 2)])
			_S.invoke(_S.read(_v65, "p"), "circle", [0, _S.unary("-", 1), _S.binary("+", _S.read(_v65, "r"), 0.5), _S.prop(_S.read(_v65, "C"), 5)])
			_S.invoke(_S.read(_v65, "p"), "circle", [0, _S.unary("-", 1), _S.binary("*", _S.read(_v65, "r"), 0.65), _S.read(_v65, "WHITE")])
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v65, "s"), "a"), 0.07)):
				_S.call_value(_S.read(_v65, "sparkle"), [_S.read(_v65, "p"), 0, _S.unary("-", 2), _S.invoke(_S.read(_v65, "Math"), "round", [_S.binary("*", _S.binary("*", 12, _S.prop(_S.read(_v65, "s"), "k")), _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v65, "s"), "a"), 0.07)))]), _S.prop(_S.read(_v65, "C"), 6), _S.prop(_S.read(_v65, "C"), 4), 0.25])
			_S.invoke(_S.read(_v65, "p"), "glow", [0, _S.unary("-", 16), 96, _S.prop(_S.read(_v65, "C"), 3), _S.binary("*", 0.42, _S.prop(_S.read(_v65, "s"), "k"))])
			_S.invoke(_S.read(_v65, "p"), "glow", [0, _S.unary("-", 3), 22, _S.prop(_S.read(_v65, "C"), 5), _S.binary("*", 0.3, _S.prop(_S.read(_v65, "s"), "k"))])
			if _S.truth(_S.read(_v65, "hero")):
				_S.invoke(_S.read(_v65, "p"), "glow", [_S.binary("*", _S.read(_v65, "X0"), 0.5), _S.unary("-", 110), 170, _S.prop(_S.read(_v65, "C"), 3), 0.3])
		else:
			if _S.truth(_S.read(_e, "s")):
				var _v66 = _S.scope(_e)
				_S.define(_v66, "crumble", _S.binary("===", _S.prop(_S.read(_v66, "s"), "i"), _S.binary("-", _S.prop(_S.read(_v66, "STROKES"), "length"), 1)))
				_S.define(_v66, "cool", _S.call_value(_S.read(_v66, "clamp"), [_S.binary("/", _S.binary("-", _S.prop(_S.read(_v66, "s"), "a"), 0.23), 0.45)]))
				_S.define(_v66, "tr", _S.call_value(_S.read(_v66, "chan"), [_S.prop(_S.read(_v66, "s"), "i")]))
				var _v67 = _S.scope(_v66)
				_S.define(_v67, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v67, "i"), _S.binary("-", _S.prop(_S.read(_v67, "tr"), "length"), 1))):
					var _v68 = _S.scope(_v67)
					if _S.truth(_S.logical("&&", _S.read(_v68, "crumble"), func(): return _S.binary(">=", _S.read(_v68, "t"), _S.prop(_S.read(_v68, "gone"), _S.read(_v68, "i"))))):
						_v67 = _S.iteration(_v67)
						_S.write(_v67, "i", 1, "+=", true)
						continue
					_S.define(_v68, "h", (_S.binary("-", 1, _S.call_value(_S.read(_v68, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_v68, "t"), _S.prop(_S.read(_v68, "last"), "t")), 0.23), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v68, "gone"), _S.read(_v68, "i")), _S.prop(_S.read(_v68, "last"), "t")), 0.23))])) if _S.truth(_S.read(_v68, "crumble")) else _S.binary("-", 1, _S.read(_v68, "cool"))))
					_S.invoke(_S.read(_v68, "p"), "line", [_S.prop(_S.prop(_S.read(_v68, "tr"), _S.read(_v68, "i")), 0), _S.prop(_S.prop(_S.read(_v68, "tr"), _S.read(_v68, "i")), 1), _S.prop(_S.prop(_S.read(_v68, "tr"), _S.binary("+", _S.read(_v68, "i"), 1)), 0), _S.prop(_S.prop(_S.read(_v68, "tr"), _S.binary("+", _S.read(_v68, "i"), 1)), 1), (_S.prop(_S.read(_v68, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v68, "h"), 0.7)) else (_S.prop(_S.read(_v68, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v68, "h"), 0.4)) else (_S.prop(_S.read(_v68, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v68, "h"), 0.15)) else _S.prop(_S.read(_v68, "C"), 2))))])
					if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("===", _S.binary("%", _S.read(_v68, "i"), 6), 0), func(): return _S.binary(">", _S.read(_v68, "h"), 0.3)), func(): return _S.binary(">", _S.prop(_S.prop(_S.read(_v68, "tr"), _S.read(_v68, "i")), 1), _S.binary("+", _S.read(_v68, "TOP"), 14)))):
						_S.invoke(_S.read(_v68, "p"), "glow", [_S.prop(_S.prop(_S.read(_v68, "tr"), _S.read(_v68, "i")), 0), _S.prop(_S.prop(_S.read(_v68, "tr"), _S.read(_v68, "i")), 1), 6, _S.prop(_S.read(_v68, "C"), 4), _S.binary("*", 0.15, _S.read(_v68, "h"))])
					_v67 = _S.iteration(_v67)
					_S.write(_v67, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "s"), func(): return _S.binary("<", _S.prop(_S.read(_e, "s"), "a"), 0.4))):
		var _v69 = _S.scope(_e)
		_S.define(_v69, "r", _S.call_value(_S.read(_v69, "rng"), [_S.prop(_S.read(_v69, "o"), "seed"), 91, _S.read(_v69, "f")]))
		_S.define(_v69, "run", (_S.binary("*", _S.read(_v69, "REACH"), _S.invoke(_S.read(_v69, "ease"), "outCubic", [_S.call_value(_S.read(_v69, "clamp"), [_S.binary("/", _S.prop(_S.read(_v69, "s"), "a"), 0.35)])])) if _S.truth(_S.binary("===", _S.prop(_S.read(_v69, "s"), "i"), 0)) else _S.binary("*", _S.read(_v69, "REACH"), _S.call_value(_S.read(_v69, "clamp"), [_S.binary("/", _S.prop(_S.read(_v69, "s"), "a"), 0.22)]))))
		for _v70 in _S.array(_S.read(_v69, "tree")):
			var _v71 = _S.scope(_v69)
			_S.define(_v71, "br", _v70)
			var _v72 = _S.scope(_v71)
			if _S.truth(_S.logical("||", _S.binary("<", _S.prop(_S.read(_v72, "br"), "w"), 1), func(): return _S.binary("<", _S.invoke(_S.read(_v72, "r"), "next", []), 0.3))):
				continue
			_S.define(_v72, "i1", _S.invoke(_S.prop(_S.read(_v72, "br"), "pts"), "findIndex", [_S.function_value(_v72, "_f20")]))
			_S.define(_v72, "j1", (_S.prop(_S.prop(_S.read(_v72, "br"), "pts"), "length") if _S.truth(_S.binary("<", _S.read(_v72, "i1"), 0)) else _S.read(_v72, "i1")))
			_S.define(_v72, "j0", _S.invoke(_S.read(_v72, "Math"), "max", [0, _S.binary("-", _S.read(_v72, "j1"), _S.invoke(_S.read(_v72, "r"), "int", [7, 13]))]))
			_S.define(_v72, "pts", _S.invoke(_S.invoke(_S.prop(_S.read(_v72, "br"), "pts"), "slice", [_S.read(_v72, "j0"), _S.read(_v72, "j1")]), "map", [_S.function_value(_v72, "_f21")]))
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v72, "pts"), "length"), 1)):
				_S.call_value(_S.read(_v72, "crackle"), [_S.read(_v72, "p"), _S.merge([{"paths": [_S.merge([{"pts": _S.read(_v72, "pts")}, {"w": 1}])]}]), _S.binary("+", _S.binary("*", 0.9, _S.binary("-", 1, _S.binary("/", _S.prop(_S.read(_v72, "s"), "a"), 0.4))), 0.1), _S.read(_v72, "C"), 0.35])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "hot"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	return _S.binary(">", _S.prop(_S.read(_e, "q"), "t"), _S.read(_e, "t"))

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v73 = _S.arg(_args, 0)
	_S.define(_e, "d", _S.prop(_v73, 2))
	return _S.binary(">", _S.read(_e, "d"), _S.read(_e, "run"))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v74 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v74, 0))
	_S.define(_e, "y", _S.prop(_v74, 1))
	return [_S.binary("+", _S.read(_e, "x"), _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 0.6), 0.6])), _S.binary("-", _S.binary("-", _S.read(_e, "y"), 1.5), _S.invoke(_S.read(_e, "r"), "range", [0, 2.5]))]

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<", _S.read(_e, "a"), 0)) else _S.logical("??", _S.prop(_S.read(_e, "FLICK"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "a"), 30), 0.0001)])), func(): return 0))
