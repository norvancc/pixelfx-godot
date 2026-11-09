@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/glitch-wipe.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "bands", _S.function_value(_e, "_f0"))
	_S.define(_e, "tear", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Glitch wipe"}, {"desc": "Torn bands of black stutter across the screen, freezing and jerking back, their ragged edges split into magenta and cyan ghosts spitting data slivers; then they tear on through."}, {"tags": ["glitch", "digital", "rgb", "bands", "wipe"]}, {"duration": 1.8}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "cyber")}, {"split": "#ff2d6f"}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TICK", _S.binary("/", 1, 18))
	_S.define(_e, "IN0", 0.03)
	_S.define(_e, "IN1", 0.78)
	_S.define(_e, "OUT0", 0.98)
	_S.define(_e, "OUT1", 1.66)
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
	_S.define(_v0, "y", 0)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.read(_v0, "H"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "r", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.read(_v1, "seed")]))
		_S.define(_v1, "h", _S.invoke(_S.read(_v1, "Math"), "min", [_S.binary("-", _S.read(_v1, "H"), _S.read(_v1, "y")), (_S.binary("+", 5, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 1)]), 6)])) if _S.truth(_S.binary("<", _S.read(_v1, "r"), 0.4)) else (_S.binary("+", 10, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 1)]), 10)])) if _S.truth(_S.binary("<", _S.read(_v1, "r"), 0.85)) else _S.binary("+", 20, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 1)]), 12)]))))]))
		_S.define(_v1, "a", _S.call_value(_S.read(_v1, "clamp"), [_S.binary("+", _S.binary("+", 0.5, _S.binary("*", 0.55, _S.call_value(_S.read(_v1, "noise"), [_S.binary("/", _S.read(_v1, "y"), 40), _S.binary("+", _S.read(_v1, "seed"), 9)]))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 2)]), 0.5), 0.25))]))
		_S.define(_v1, "b", _S.call_value(_S.read(_v1, "clamp"), [_S.binary("+", _S.binary("+", 0.5, _S.binary("*", 0.55, _S.call_value(_S.read(_v1, "noise"), [_S.binary("/", _S.read(_v1, "y"), 40), _S.binary("+", _S.read(_v1, "seed"), 19)]))), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 3)]), 0.5), 0.25))]))
		_S.define(_v1, "span", _S.binary("+", 0.32, _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 6)]), 0.12)))
		_S.invoke(_S.read(_v1, "out"), "push", [_S.merge([{"i": _S.read(_v1, "i")}, {"y": _S.read(_v1, "y")}, {"h": _S.read(_v1, "h")}, {"dir": (1 if _S.truth(_S.binary("<", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 4)]), 0.82)) else _S.unary("-", 1))}, {"off": _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.binary("+", _S.read(_v1, "seed"), 5)])}, {"t0": _S.binary("+", _S.read(_v1, "IN0"), _S.binary("*", _S.read(_v1, "a"), _S.binary("-", _S.binary("-", _S.read(_v1, "IN1"), _S.read(_v1, "IN0")), _S.read(_v1, "span"))))}, {"t1": _S.binary("+", _S.binary("+", _S.read(_v1, "IN0"), _S.binary("*", _S.read(_v1, "a"), _S.binary("-", _S.binary("-", _S.read(_v1, "IN1"), _S.read(_v1, "IN0")), _S.read(_v1, "span")))), _S.read(_v1, "span"))}, {"o0": _S.binary("+", _S.read(_v1, "OUT0"), _S.binary("*", _S.read(_v1, "b"), _S.binary("-", _S.binary("-", _S.read(_v1, "OUT1"), _S.read(_v1, "OUT0")), _S.read(_v1, "span"))))}, {"o1": _S.binary("+", _S.binary("+", _S.read(_v1, "OUT0"), _S.binary("*", _S.read(_v1, "b"), _S.binary("-", _S.binary("-", _S.read(_v1, "OUT1"), _S.read(_v1, "OUT0")), _S.read(_v1, "span")))), _S.read(_v1, "span"))}])])
		_S.write(_v1, "y", _S.read(_v1, "h"), "+=", false)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "cache"), "set", [_S.read(_e, "seed"), _S.read(_e, "out")])
	return _S.read(_e, "out")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "b", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "t0", _S.arg(_args, 2))
	_S.define(_e, "t1", _S.arg(_args, 3))
	_S.define(_e, "salt", _S.arg(_args, 4))
	if _S.truth(_S.binary("<=", _S.read(_e, "t"), _S.read(_e, "t0"))):
		return 0
	if _S.truth(_S.binary(">=", _S.read(_e, "t"), _S.read(_e, "t1"))):
		return 1
	_S.define(_e, "n", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.binary("+", _S.read(_e, "t"), _S.binary("*", _S.prop(_S.read(_e, "b"), "off"), _S.read(_e, "TICK"))), _S.read(_e, "TICK"))]))
	while _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "n"), 0), func(): return _S.binary("<", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "n"), _S.prop(_S.read(_e, "b"), "i"), _S.read(_e, "salt")]), 0.22))):
		_S.write(_e, "n", 1, "-=", true)
	_S.define(_e, "tq", _S.binary("-", _S.binary("*", _S.read(_e, "n"), _S.read(_e, "TICK")), _S.binary("*", _S.prop(_S.read(_e, "b"), "off"), _S.read(_e, "TICK"))))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "tq"), _S.read(_e, "t0")), _S.binary("-", _S.read(_e, "t1"), _S.read(_e, "t0")))]))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("+", _S.invoke(_S.read(_e, "ease"), "inOutQuad", [_S.read(_e, "u")]), _S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "n"), _S.prop(_S.read(_e, "b"), "i"), _S.binary("+", _S.read(_e, "salt"), 1)]), 0.6), 0.12), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "u"))])))])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p0", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "RED", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "split")]))
	_S.define(_e, "p", _S.call_value(_S.read(_e, "clipTo"), [_S.read(_e, "p0")]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "bands"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "fr", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "TICK"))]))
	_S.define(_e, "out", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OUT0")))
	for _v2 in _S.array(_S.read(_e, "B")):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "b", _v2)
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "k", (_S.call_value(_S.read(_v4, "tear"), [_S.read(_v4, "b"), _S.read(_v4, "t"), _S.prop(_S.read(_v4, "b"), "o0"), _S.prop(_S.read(_v4, "b"), "o1"), 7]) if _S.truth(_S.read(_v4, "out")) else _S.call_value(_S.read(_v4, "tear"), [_S.read(_v4, "b"), _S.read(_v4, "t"), _S.prop(_S.read(_v4, "b"), "t0"), _S.prop(_S.read(_v4, "b"), "t1"), 3])))
		if _S.truth(_S.logical("||", _S.logical("&&", _S.unary("!", _S.read(_v4, "out")), func(): return _S.binary("<=", _S.read(_v4, "k"), 0)), func(): return _S.logical("&&", _S.read(_v4, "out"), func(): return _S.binary(">=", _S.read(_v4, "k"), 1)))):
			continue
		_S.define(_v4, "moving", _S.logical("&&", _S.binary(">", _S.read(_v4, "k"), 0), func(): return _S.binary("<", _S.read(_v4, "k"), 1)))
		_S.define(_v4, "slip", (_S.invoke(_S.read(_v4, "Math"), "round", [_S.binary("*", _S.binary("-", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "fr"), _S.prop(_S.read(_v4, "b"), "i"), 12]), 0.5), 18)]) if _S.truth(_S.logical("&&", _S.read(_v4, "moving"), func(): return _S.binary("<", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "fr"), _S.prop(_S.read(_v4, "b"), "i"), 11]), 0.12))) else 0))
		_S.define(_v4, "fwd", _S.prop(_S.read(_v4, "b"), "dir"))
		_S.define(_v4, "e", _S.binary("+", (_S.binary("*", _S.read(_v4, "k"), _S.read(_v4, "W")) if _S.truth(_S.binary(">", _S.prop(_S.read(_v4, "b"), "dir"), 0)) else _S.binary("-", _S.read(_v4, "W"), _S.binary("*", _S.read(_v4, "k"), _S.read(_v4, "W")))), _S.read(_v4, "slip")))
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "y", _S.prop(_S.read(_v5, "b"), "y"))
		while _S.truth(_S.binary("<", _S.read(_v5, "y"), _S.binary("+", _S.prop(_S.read(_v5, "b"), "y"), _S.prop(_S.read(_v5, "b"), "h")))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "jag", (_S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("+", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v6, "rand"), [_S.read(_v6, "fr"), _S.read(_v6, "y"), 14]), 0.5), 6), _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v6, "rand"), [_S.binary(">>", _S.read(_v6, "fr"), 1), _S.prop(_S.read(_v6, "b"), "i"), 15]), 0.5), 6))]) if _S.truth(_S.read(_v6, "moving")) else 0))
			_S.define(_v6, "ex", _S.call_value(_S.read(_v6, "clamp"), [_S.invoke(_S.read(_v6, "Math"), "round", [_S.binary("+", _S.read(_v6, "e"), _S.read(_v6, "jag"))]), 0, _S.read(_v6, "W")]))
			_S.define(_v6, "behind", _S.binary("!==", _S.binary(">", _S.read(_v6, "fwd"), 0), _S.read(_v6, "out")))
			if _S.truth(_S.read(_v6, "behind")):
				_S.logical("&&", _S.binary(">", _S.read(_v6, "ex"), 0), func(): return _S.call_value(_S.read(_v6, "rect"), [_S.read(_v6, "p0"), 0, _S.read(_v6, "y"), _S.read(_v6, "ex"), 1, _S.read(_v6, "ink")]))
			else:
				_S.logical("&&", _S.binary("<", _S.read(_v6, "ex"), _S.read(_v6, "W")), func(): return _S.call_value(_S.read(_v6, "rect"), [_S.read(_v6, "p0"), _S.read(_v6, "ex"), _S.read(_v6, "y"), _S.binary("-", _S.read(_v6, "W"), _S.read(_v6, "ex")), 1, _S.read(_v6, "ink")]))
			if _S.truth(_S.unary("!", _S.read(_v6, "moving"))):
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "y", 1, "+=", true)
				continue
			_S.define(_v6, "e1", (_S.binary("-", _S.read(_v6, "ex"), 1) if _S.truth(_S.read(_v6, "behind")) else _S.read(_v6, "ex")))
			_S.define(_v6, "side", (1 if _S.truth(_S.read(_v6, "behind")) else _S.unary("-", 1)))
			_S.define(_v6, "sp", _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.prop(_S.read(_v6, "b"), "i"), _S.read(_v6, "fr")), 3)))
			_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "e1"), _S.read(_v6, "y"), _S.read(_v6, "WHITE")])
			_S.last([_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.read(_v6, "sp"))), _S.read(_v6, "y"), _S.read(_v6, "RED")]), _S.invoke(_S.read(_v6, "p"), "px", [_S.binary("+", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 1))), _S.read(_v6, "y"), _S.read(_v6, "RED")])])
			_S.last([_S.invoke(_S.read(_v6, "p"), "px", [_S.binary("-", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 1))), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 5)]), _S.invoke(_S.read(_v6, "p"), "px", [_S.binary("-", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 2))), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 4)])])
			_S.invoke(_S.read(_v6, "p"), "light", [_S.read(_v6, "e1"), _S.read(_v6, "y"), _S.read(_v6, "WHITE"), 0.45])
			_S.last([_S.invoke(_S.read(_v6, "p"), "light", [_S.binary("+", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 1))), _S.read(_v6, "y"), _S.read(_v6, "RED"), 0.5]), _S.invoke(_S.read(_v6, "p"), "light", [_S.binary("+", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 3))), _S.read(_v6, "y"), _S.read(_v6, "RED"), 0.22])])
			_S.last([_S.invoke(_S.read(_v6, "p"), "light", [_S.binary("-", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 1))), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 5), 0.45]), _S.invoke(_S.read(_v6, "p"), "light", [_S.binary("-", _S.read(_v6, "e1"), _S.binary("*", _S.read(_v6, "side"), _S.binary("+", _S.read(_v6, "sp"), 3))), _S.read(_v6, "y"), _S.prop(_S.read(_v6, "C"), 5), 0.22])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "y", 1, "+=", true)
		if _S.truth(_S.unary("!", _S.read(_v4, "moving"))):
			continue
		_S.define(_v4, "ex", _S.call_value(_S.read(_v4, "clamp"), [_S.invoke(_S.read(_v4, "Math"), "round", [_S.read(_v4, "e")]), 0, _S.read(_v4, "W")]))
		_S.define(_v4, "open", (1 if _S.truth(_S.binary("!==", _S.binary(">", _S.read(_v4, "fwd"), 0), _S.read(_v4, "out"))) else _S.unary("-", 1)))
		_S.invoke(_S.read(_v4, "p"), "glow", [_S.read(_v4, "ex"), _S.binary("+", _S.prop(_S.read(_v4, "b"), "y"), _S.binary("/", _S.prop(_S.read(_v4, "b"), "h"), 2)), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v4, "b"), "h"), 0.7), 7), (_S.read(_v4, "RED") if _S.truth(_S.binary("&", _S.prop(_S.read(_v4, "b"), "i"), 1)) else _S.prop(_S.read(_v4, "C"), 5)), 0.28])
		var _v7 = _S.scope(_v4)
		_S.define(_v7, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "s"), _S.prop(_S.read(_v7, "b"), "h"))):
			var _v8 = _S.scope(_v7)
			if _S.truth(_S.binary(">", _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "fr"), _S.prop(_S.read(_v8, "b"), "i"), _S.binary("+", 100, _S.read(_v8, "s"))]), 0.55)):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "s", 1, "+=", true)
				continue
			_S.define(_v8, "x", _S.binary("+", _S.read(_v8, "ex"), _S.binary("*", _S.read(_v8, "open"), _S.invoke(_S.read(_v8, "Math"), "round", [_S.binary("-", _S.binary("*", _S.binary("**", _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "fr"), _S.prop(_S.read(_v8, "b"), "i"), _S.binary("+", 200, _S.read(_v8, "s"))]), 2), 22), 4)]))))
			_S.define(_v8, "y", _S.binary("+", _S.prop(_S.read(_v8, "b"), "y"), _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "fr"), _S.prop(_S.read(_v8, "b"), "i"), _S.binary("+", 300, _S.read(_v8, "s"))]), _S.prop(_S.read(_v8, "b"), "h"))])))
			_S.invoke(_S.read(_v8, "p"), "px", [_S.read(_v8, "x"), _S.read(_v8, "y"), _S.prop([_S.read(_v8, "WHITE"), _S.prop(_S.read(_v8, "C"), 6), _S.prop(_S.read(_v8, "C"), 5), _S.read(_v8, "RED")], _S.invoke(_S.read(_v8, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "fr"), _S.prop(_S.read(_v8, "b"), "i"), _S.binary("+", 400, _S.read(_v8, "s"))]), 4)]))])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "s", 1, "+=", true)
		var _v9 = _S.scope(_v4)
		_S.define(_v9, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "s"), 4)):
			var _v10 = _S.scope(_v9)
			if _S.truth(_S.binary(">", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "fr"), _S.prop(_S.read(_v10, "b"), "i"), _S.binary("+", 20, _S.read(_v10, "s"))]), 0.5)):
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "s", 1, "+=", true)
				continue
			_S.define(_v10, "len", _S.binary("+", 2, _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.binary("**", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "fr"), _S.prop(_S.read(_v10, "b"), "i"), _S.binary("+", 30, _S.read(_v10, "s"))]), 2), 60)])))
			_S.define(_v10, "ahead", _S.binary("<", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "fr"), _S.prop(_S.read(_v10, "b"), "i"), _S.binary("+", 40, _S.read(_v10, "s"))]), 0.6))
			_S.define(_v10, "d", _S.binary("+", _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.binary("**", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "fr"), _S.prop(_S.read(_v10, "b"), "i"), _S.binary("+", 50, _S.read(_v10, "s"))]), 1.5), 70)]), 4))
			_S.define(_v10, "y", _S.binary("+", _S.prop(_S.read(_v10, "b"), "y"), _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "fr"), _S.prop(_S.read(_v10, "b"), "i"), _S.binary("+", 60, _S.read(_v10, "s"))]), _S.prop(_S.read(_v10, "b"), "h"))])))
			_S.define(_v10, "x", ((_S.binary("+", _S.read(_v10, "ex"), _S.read(_v10, "d")) if _S.truth(_S.binary(">", _S.read(_v10, "open"), 0)) else _S.binary("-", _S.binary("-", _S.read(_v10, "ex"), _S.read(_v10, "d")), _S.read(_v10, "len"))) if _S.truth(_S.read(_v10, "ahead")) else (_S.binary("-", _S.binary("-", _S.read(_v10, "ex"), _S.read(_v10, "d")), _S.read(_v10, "len")) if _S.truth(_S.binary(">", _S.read(_v10, "open"), 0)) else _S.binary("+", _S.read(_v10, "ex"), _S.read(_v10, "d")))))
			_S.define(_v10, "c", _S.prop([_S.read(_v10, "WHITE"), _S.prop(_S.read(_v10, "C"), 6), _S.prop(_S.read(_v10, "C"), 5), _S.read(_v10, "RED")], _S.invoke(_S.read(_v10, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v10, "rand"), [_S.read(_v10, "fr"), _S.prop(_S.read(_v10, "b"), "i"), _S.binary("+", 70, _S.read(_v10, "s"))]), 4)])))
			_S.invoke(_S.read(_v10, "p"), "rect", [_S.read(_v10, "x"), _S.read(_v10, "y"), _S.read(_v10, "len"), 1, _S.read(_v10, "c")])
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "q", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "q"), _S.read(_v11, "len"))):
				_S.invoke(_S.read(_v11, "p"), "light", [_S.binary("+", _S.read(_v11, "x"), _S.read(_v11, "q")), _S.read(_v11, "y"), _S.read(_v11, "c"), 0.35])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "q", 3, "+=", false)
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "s", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v4, "b"), "h"), 8), func(): return _S.binary("<", _S.call_value(_S.read(_v4, "rand"), [_S.read(_v4, "fr"), _S.prop(_S.read(_v4, "b"), "i"), 80]), 0.35))):
			var _v12 = _S.scope(_v4)
			_S.define(_v12, "bw", _S.binary("+", 6, _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "fr"), _S.prop(_S.read(_v12, "b"), "i"), 81]), 10)])))
			_S.define(_v12, "bh", _S.binary("+", 3, _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "fr"), _S.prop(_S.read(_v12, "b"), "i"), 82]), _S.invoke(_S.read(_v12, "Math"), "min", [6, _S.binary("-", _S.prop(_S.read(_v12, "b"), "h"), 3)]))])))
			_S.define(_v12, "x", _S.binary("-", _S.binary("+", _S.read(_v12, "ex"), _S.binary("*", _S.read(_v12, "open"), _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("-", _S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "fr"), _S.prop(_S.read(_v12, "b"), "i"), 83]), 24), 4)]))), (_S.read(_v12, "bw") if _S.truth(_S.binary("<", _S.read(_v12, "open"), 0)) else 0)))
			_S.define(_v12, "y", _S.binary("+", _S.prop(_S.read(_v12, "b"), "y"), _S.invoke(_S.read(_v12, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "fr"), _S.prop(_S.read(_v12, "b"), "i"), 84]), _S.binary("-", _S.prop(_S.read(_v12, "b"), "h"), _S.read(_v12, "bh")))])))
			_S.define(_v12, "c", (_S.prop(_S.read(_v12, "C"), 5) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v12, "rand"), [_S.read(_v12, "fr"), _S.prop(_S.read(_v12, "b"), "i"), 85]), 0.5)) else _S.read(_v12, "RED")))
			_S.last([_S.invoke(_S.read(_v12, "p"), "rect", [_S.read(_v12, "x"), _S.read(_v12, "y"), _S.read(_v12, "bw"), 1, _S.read(_v12, "c")]), _S.invoke(_S.read(_v12, "p"), "rect", [_S.read(_v12, "x"), _S.binary("-", _S.binary("+", _S.read(_v12, "y"), _S.read(_v12, "bh")), 1), _S.read(_v12, "bw"), 1, _S.read(_v12, "c")]), _S.invoke(_S.read(_v12, "p"), "rect", [_S.read(_v12, "x"), _S.read(_v12, "y"), 1, _S.read(_v12, "bh"), _S.read(_v12, "c")]), _S.invoke(_S.read(_v12, "p"), "rect", [_S.binary("-", _S.binary("+", _S.read(_v12, "x"), _S.read(_v12, "bw")), 1), _S.read(_v12, "y"), 1, _S.read(_v12, "bh"), _S.read(_v12, "c")])])
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "q", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "q"), _S.read(_v13, "bw"))):
				_S.invoke(_S.read(_v13, "p"), "light", [_S.binary("+", _S.read(_v13, "x"), _S.read(_v13, "q")), _S.read(_v13, "y"), _S.read(_v13, "c"), 0.25])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "q", 2, "+=", false)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "IN1")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT0"), 0.05)))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "s", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "s"), 3)):
			var _v15 = _S.scope(_v14)
			if _S.truth(_S.binary(">", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "fr"), _S.read(_v15, "s"), 90]), 0.4)):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "s", 1, "+=", true)
				continue
			_S.define(_v15, "y", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "fr"), _S.read(_v15, "s"), 91]), _S.read(_v15, "H"))]))
			_S.define(_v15, "x", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "fr"), _S.read(_v15, "s"), 92]), _S.read(_v15, "W"))]))
			_S.define(_v15, "len", _S.binary("+", 3, _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("*", _S.binary("**", _S.call_value(_S.read(_v15, "rand"), [_S.read(_v15, "fr"), _S.read(_v15, "s"), 93]), 2), 40)])))
			_S.invoke(_S.read(_v15, "p"), "rect", [_S.read(_v15, "x"), _S.read(_v15, "y"), _S.read(_v15, "len"), 1, (_S.prop(_S.read(_v15, "C"), 4) if _S.truth(_S.binary("===", _S.read(_v15, "s"), 0)) else (_S.prop(_S.read(_v15, "C"), 3) if _S.truth(_S.binary("===", _S.read(_v15, "s"), 1)) else _S.read(_v15, "RED")))])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "s", 1, "+=", true)
	return null
