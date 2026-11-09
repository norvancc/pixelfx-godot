@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/summon-rise.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "beast", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Summon rise"}, {"desc": "A rune circle burns into the floor, the ground bursts, and a horned brute heaves up out of it through dust and rubble, lit from below, until its eyes flare."}, {"tags": ["spawn", "summon", "demon", "rise", "runes", "dust", "rubble", "ground", "one-shot"]}, {"size": [176, 116]}, {"origin": [88, 94]}, {"duration": 4.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0608", "#3d0c0c", "#7a1a10", "#c0381a", "#f06a1e", "#ffae3a", "#ffe08a", "#ffffff"]}, {"body": ["#060409", "#0e0913", "#170f1e", "#211628", "#2d2036"]}, {"horn": ["#0c080c", "#201820", "#352a32", "#4e3f48", "#6e5c64"]}, {"stone": ["#1a1424", "#2b2639", "#4a4263", "#6c6488", "#9a91b4"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#2a1e2a"]))
	_S.define(_e, "IGN", 0.5)
	_S.define(_e, "RUNES", 0.78)
	_S.define(_e, "BREAK", 1.05)
	_S.define(_e, "EYES", 2.3)
	_S.define(_e, "FADE", 3.4)
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "R0", 36)
	_S.define(_e, "R1", 27)
	_S.define(_e, "PARTS", ["head", "horns", "arms", "shoulders", "chest", "waist", "legs", "tail"])
	_S.define(_e, "BEAST", _S.call_value(_S.read(_e, "beast"), []))
	_S.define(_e, "GLYPHS", [[[[0, _S.unary("-", 2)], [0, 2]], [[_S.unary("-", 1.5), _S.unary("-", 1)], [1.5, 1]]], [[[_S.unary("-", 1.5), 2], [0, _S.unary("-", 2)], [1.5, 2]], [[_S.unary("-", 0.8), 0.4], [0.8, 0.4]]], [[[_S.unary("-", 1.5), _S.unary("-", 2)], [_S.unary("-", 1.5), 2], [1.5, 2]], [[0, _S.unary("-", 2)], [1.5, _S.unary("-", 0.5)]]], [[[0, _S.unary("-", 2)], [0, 2]], [[0, _S.unary("-", 2)], [1.6, _S.unary("-", 0.6)], [0, 0.6]]], [[[_S.unary("-", 1.5), _S.unary("-", 2)], [1.5, 2]], [[1.5, _S.unary("-", 2)], [_S.unary("-", 1.5), 2]], [[_S.unary("-", 1.5), 0], [1.5, 0]]], [[[_S.unary("-", 1.4), _S.unary("-", 2)], [1.4, _S.unary("-", 2)], [_S.unary("-", 1.4), 2], [1.4, 2]]]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "W", 46)
	_S.define(_e, "H", 46)
	_S.define(_e, "N", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")))
	_S.define(_e, "C", 22.5)
	_S.define(_e, "parts", _S.invoke(_S.read(_e, "PARTS"), "map", [_S.function_value(_e, "_f1")]))
	_S.define(_e, "cur", null)
	_S.define(_e, "put", _S.function_value(_e, "_f2"))
	_S.define(_e, "ell", _S.function_value(_e, "_f3"))
	_S.define(_e, "stroke", _S.function_value(_e, "_f4"))
	var _v8 = _S.read(_e, "parts")
	_S.define(_e, "HEAD", _S.prop(_v8, 0))
	_S.define(_e, "HORNS", _S.prop(_v8, 1))
	_S.define(_e, "ARMS", _S.prop(_v8, 2))
	_S.define(_e, "SHOULDERS", _S.prop(_v8, 3))
	_S.define(_e, "CHEST", _S.prop(_v8, 4))
	_S.define(_e, "WAIST", _S.prop(_v8, 5))
	_S.define(_e, "LEGS", _S.prop(_v8, 6))
	_S.define(_e, "TAIL", _S.prop(_v8, 7))
	for _v9 in _S.array([_S.unary("-", 1), 1]):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "s", _v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "X", _S.function_value(_v11, "_f5"))
		_S.write(_v11, "cur", _S.read(_v11, "HORNS"), "=", false)
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [4]), 11], [_S.call_value(_S.read(_v11, "X"), [8]), 8], [_S.call_value(_S.read(_v11, "X"), [12]), 6.5], [_S.call_value(_S.read(_v11, "X"), [15]), 4], [_S.call_value(_S.read(_v11, "X"), [16]), 1.5], [_S.call_value(_S.read(_v11, "X"), [15.2]), 0]], 2.3, 0.45])
		_S.write(_v11, "cur", _S.read(_v11, "SHOULDERS"), "=", false)
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [10]), 16, 7, 5])
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [8.5]), 19.5, 5.5, 4.2])
		_S.write(_v11, "cur", _S.read(_v11, "ARMS"), "=", false)
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [14.5]), 16.5], [_S.call_value(_S.read(_v11, "X"), [17.5]), 22], [_S.call_value(_S.read(_v11, "X"), [18.5]), 28]], 4, 3.2])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [18.5]), 28], [_S.call_value(_S.read(_v11, "X"), [19]), 33], [_S.call_value(_S.read(_v11, "X"), [19.2]), 36.5]], 3.4, 2.8])
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [19.2]), 37.8, 3, 2.3])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [17.2]), 39], [_S.call_value(_S.read(_v11, "X"), [16.6]), 41.8]], 0.9, 0.4])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [19.2]), 39.5], [_S.call_value(_S.read(_v11, "X"), [19.3]), 42.6]], 0.9, 0.4])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [21.2]), 38.8], [_S.call_value(_S.read(_v11, "X"), [22]), 41.4]], 0.9, 0.4])
		_S.write(_v11, "cur", _S.read(_v11, "LEGS"), "=", false)
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [5.5]), 31], [_S.call_value(_S.read(_v11, "X"), [8]), 37], [_S.call_value(_S.read(_v11, "X"), [7.5]), 42]], 4, 3])
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [8.5]), 44.3, 4.2, 1.7])
	_S.write(_e, "cur", _S.read(_e, "TAIL"), "=", false)
	_S.call_value(_S.read(_e, "stroke"), [[[_S.read(_e, "C"), 30], [_S.binary("+", _S.read(_e, "C"), 0.5), 36], [_S.binary("+", _S.read(_e, "C"), 2.5), 41.5], [_S.binary("+", _S.read(_e, "C"), 7), 44.6], [_S.binary("+", _S.read(_e, "C"), 12.5), 44.2], [_S.binary("+", _S.read(_e, "C"), 14.5), 42.5]], 2.3, 0.6])
	_S.write(_e, "cur", _S.read(_e, "CHEST"), "=", false)
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 22.5, 8.2, 7.5])
	_S.write(_e, "cur", _S.read(_e, "WAIST"), "=", false)
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 29.5, 6.2, 4.5])
	_S.write(_e, "cur", _S.read(_e, "HEAD"), "=", false)
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 12.5, 5.2, 4.6])
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 16, 4.2, 2.8])
	_S.define(_e, "part", _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "N"))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "k"), _S.prop(_S.read(_v13, "parts"), "length"))):
			if _S.truth(_S.prop(_S.prop(_S.read(_v13, "parts"), _S.read(_v13, "k")), _S.read(_v13, "i"))):
				var _v14 = _S.scope(_v13)
				_S.set_prop(_S.read(_v14, "part"), _S.read(_v14, "i"), _S.binary("+", _S.read(_v14, "k"), 1), "=", false)
				break
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "k", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	_S.define(_e, "on", _S.function_value(_e, "_f6"))
	_S.define(_e, "blur", _S.function_value(_e, "_f7"))
	_S.define(_e, "amb", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "down", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "rim", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "crease", _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")]))
	_S.invoke(_S.read(_e, "parts"), "forEach", [_S.function_value(_e, "_f8")])
	var _v32 = _S.scope(_e)
	_S.define(_v32, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "y"), _S.read(_v32, "H"))):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "x"), _S.read(_v33, "W"))):
			var _v34 = _S.scope(_v33)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "on"), [_S.read(_v34, "x"), _S.read(_v34, "y")]))):
				_v33 = _S.iteration(_v33)
				_S.write(_v33, "x", 1, "+=", true)
				continue
			_S.define(_v34, "k", (1 if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "on"), [_S.read(_v34, "x"), _S.binary("+", _S.read(_v34, "y"), 1)]))) else (0.5 if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "on"), [_S.read(_v34, "x"), _S.binary("+", _S.read(_v34, "y"), 2)]))) else 0)))
			_S.set_prop(_S.read(_v34, "rim"), _S.binary("+", _S.binary("*", _S.read(_v34, "y"), _S.read(_v34, "W")), _S.read(_v34, "x")), (_S.binary("*", _S.read(_v34, "k"), 0.3) if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v34, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v34, "x"), 0.5), _S.read(_v34, "C"))]), 7), func(): return _S.binary(">", _S.read(_v34, "y"), 27))) else _S.read(_v34, "k")), "=", false)
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "x", 1, "+=", true)
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "y", 1, "+=", true)
	_S.define(_e, "outline", [])
	var _v35 = _S.scope(_e)
	_S.define(_v35, "y", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v35, "y"), _S.read(_v35, "H"))):
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "x", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v36, "x"), _S.read(_v36, "W"))):
			if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_v36, "on"), [_S.read(_v36, "x"), _S.read(_v36, "y")])), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v36, "on"), [_S.binary("-", _S.read(_v36, "x"), 1), _S.read(_v36, "y")]), func(): return _S.call_value(_S.read(_v36, "on"), [_S.binary("+", _S.read(_v36, "x"), 1), _S.read(_v36, "y")])), func(): return _S.call_value(_S.read(_v36, "on"), [_S.read(_v36, "x"), _S.binary("-", _S.read(_v36, "y"), 1)])), func(): return _S.call_value(_S.read(_v36, "on"), [_S.read(_v36, "x"), _S.binary("+", _S.read(_v36, "y"), 1)])))):
				_S.invoke(_S.read(_v36, "outline"), "push", [[_S.read(_v36, "x"), _S.read(_v36, "y")]])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "x", 1, "+=", true)
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "y", 1, "+=", true)
	_S.define(_e, "eyes", [])
	_S.define(_e, "tusks", [])
	for _v37 in _S.array([_S.unary("-", 1), 1]):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "s", _v37)
		var _v39 = _S.scope(_v38)
		_S.invoke(_S.read(_v39, "eyes"), "push", [[_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 2.2)), 0.5)]), 12], [_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 3.2)), 0.5)]), 12]])
		_S.invoke(_S.read(_v39, "tusks"), "push", [[_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 3.4)), 0.5)]), 16], [_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 3.6)), 0.5)]), 15]])
	return _S.merge([{"w": _S.read(_e, "W")}, {"h": _S.read(_e, "H")}, {"part": _S.read(_e, "part")}, {"amb": _S.read(_e, "amb")}, {"down": _S.read(_e, "down")}, {"rim": _S.read(_e, "rim")}, {"crease": _S.read(_e, "crease")}, {"outline": _S.read(_e, "outline")}, {"eyes": _S.read(_e, "eyes")}, {"tusks": _S.read(_e, "tusks")}, {"glints": [[_S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.binary("-", _S.read(_e, "C"), 2.7), 0.5)]), _S.binary("/", _S.read(_e, "W"), 2)), _S.binary("-", 12, _S.read(_e, "H"))], [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_e, "C"), 2.7), 0.5)]), _S.binary("/", _S.read(_e, "W"), 2)), _S.binary("-", 12, _S.read(_e, "H"))]]}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.last([_S.write(_e, "x", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "x")]), "=", false), _S.write(_e, "y", _S.invoke(_S.read(_e, "Math"), "round", [_S.read(_e, "y")]), "=", false)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.read(_e, "W"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "H")))):
		_S.set_prop(_S.read(_e, "cur"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "W")), _S.read(_e, "x")), 1, "=", false)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "cx", _S.arg(_args, 0))
	_S.define(_e, "cy", _S.arg(_args, 1))
	_S.define(_e, "rx", _S.arg(_args, 2))
	_S.define(_e, "ry", _S.arg(_args, 3))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "floor", [_S.binary("-", _S.read(_v0, "cy"), _S.read(_v0, "ry"))]))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("+", _S.read(_v0, "cy"), _S.read(_v0, "ry"))]))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("-", _S.read(_v1, "cx"), _S.read(_v1, "rx"))]))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.invoke(_S.read(_v1, "Math"), "ceil", [_S.binary("+", _S.read(_v1, "cx"), _S.read(_v1, "rx"))]))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "dx", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v2, "x"), 0.5), _S.read(_v2, "cx")), _S.read(_v2, "rx")))
			_S.define(_v2, "dy", _S.binary("/", _S.binary("-", _S.binary("+", _S.read(_v2, "y"), 0.5), _S.read(_v2, "cy")), _S.read(_v2, "ry")))
			if _S.truth(_S.binary("<=", _S.binary("+", _S.binary("*", _S.read(_v2, "dx"), _S.read(_v2, "dx")), _S.binary("*", _S.read(_v2, "dy"), _S.read(_v2, "dy"))), 1)):
				_S.call_value(_S.read(_v2, "put"), [_S.read(_v2, "x"), _S.read(_v2, "y")])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pts", _S.arg(_args, 0))
	_S.define(_e, "r0", _S.arg(_args, 1))
	_S.define(_e, "r1", _S.arg(_args, 2))
	_S.define(_e, "L", [])
	_S.define(_e, "total", 0)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "i", 1)
	while _S.truth(_S.binary("<", _S.read(_v3, "i"), _S.prop(_S.read(_v3, "pts"), "length"))):
		_S.write(_v3, "total", _S.set_prop(_S.read(_v3, "L"), _S.binary("-", _S.read(_v3, "i"), 1), _S.invoke(_S.read(_v3, "Math"), "hypot", [_S.binary("-", _S.prop(_S.prop(_S.read(_v3, "pts"), _S.read(_v3, "i")), 0), _S.prop(_S.prop(_S.read(_v3, "pts"), _S.binary("-", _S.read(_v3, "i"), 1)), 0)), _S.binary("-", _S.prop(_S.prop(_S.read(_v3, "pts"), _S.read(_v3, "i")), 1), _S.prop(_S.prop(_S.read(_v3, "pts"), _S.binary("-", _S.read(_v3, "i"), 1)), 1))]), "=", false), "+=", false)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "i", 1, "+=", true)
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 1)
	_S.define(_v4, "acc", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.prop(_S.read(_v4, "pts"), "length"))):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "n", _S.binary("+", _S.invoke(_S.read(_v5, "Math"), "ceil", [_S.binary("*", _S.prop(_S.read(_v5, "L"), _S.binary("-", _S.read(_v5, "i"), 1)), 3)]), 1))
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "j", 0)
		while _S.truth(_S.binary("<=", _S.read(_v6, "j"), _S.read(_v6, "n"))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "u", _S.binary("/", _S.read(_v7, "j"), _S.read(_v7, "n")))
			_S.define(_v7, "r", _S.binary("+", _S.read(_v7, "r0"), _S.binary("*", _S.binary("-", _S.read(_v7, "r1"), _S.read(_v7, "r0")), _S.binary("/", _S.binary("+", _S.read(_v7, "acc"), _S.binary("*", _S.prop(_S.read(_v7, "L"), _S.binary("-", _S.read(_v7, "i"), 1)), _S.read(_v7, "u"))), _S.read(_v7, "total")))))
			_S.call_value(_S.read(_v7, "ell"), [_S.binary("+", _S.prop(_S.prop(_S.read(_v7, "pts"), _S.binary("-", _S.read(_v7, "i"), 1)), 0), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v7, "pts"), _S.read(_v7, "i")), 0), _S.prop(_S.prop(_S.read(_v7, "pts"), _S.binary("-", _S.read(_v7, "i"), 1)), 0)), _S.read(_v7, "u"))), _S.binary("+", _S.prop(_S.prop(_S.read(_v7, "pts"), _S.binary("-", _S.read(_v7, "i"), 1)), 1), _S.binary("*", _S.binary("-", _S.prop(_S.prop(_S.read(_v7, "pts"), _S.read(_v7, "i")), 1), _S.prop(_S.prop(_S.read(_v7, "pts"), _S.binary("-", _S.read(_v7, "i"), 1)), 1)), _S.read(_v7, "u"))), _S.read(_v7, "r"), _S.read(_v7, "r")])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "j", 1, "+=", true)
		_v4 = _S.iteration(_v4)
		_S.last([_S.write(_v4, "acc", _S.prop(_S.read(_v4, "L"), _S.binary("-", _S.read(_v4, "i"), 1)), "+=", false), _S.write(_v4, "i", 1, "+=", true)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "d", _S.arg(_args, 0))
	return _S.binary("+", _S.read(_e, "C"), _S.binary("*", _S.read(_e, "s"), _S.read(_e, "d")))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.read(_e, "W"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "H"))), func(): return _S.binary(">", _S.prop(_S.read(_e, "part"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "W")), _S.read(_e, "x"))), 0))

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "src", _S.arg(_args, 0))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Float32Array"), "from", [_S.read(_e, "src")]))
	_S.define(_e, "b", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	var _v15 = _S.scope(_e)
	_S.define(_v15, "pass", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "pass"), 2)):
		var _v16 = _S.scope(_v15)
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "y"), _S.read(_v17, "H"))):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v18, "x"), _S.read(_v18, "W"))):
				var _v19 = _S.scope(_v18)
				_S.define(_v19, "s", 0)
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "d", _S.unary("-", 2))
				while _S.truth(_S.binary("<=", _S.read(_v20, "d"), 2)):
					_S.write(_v20, "s", (_S.prop(_S.read(_v20, "a"), _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v20, "y"), _S.read(_v20, "W")), _S.read(_v20, "x")), _S.read(_v20, "d"))) if _S.truth(_S.logical("&&", _S.binary(">=", _S.binary("+", _S.read(_v20, "x"), _S.read(_v20, "d")), 0), func(): return _S.binary("<", _S.binary("+", _S.read(_v20, "x"), _S.read(_v20, "d")), _S.read(_v20, "W")))) else 0), "+=", false)
					_v20 = _S.iteration(_v20)
					_S.write(_v20, "d", 1, "+=", true)
				_S.set_prop(_S.read(_v19, "b"), _S.binary("+", _S.binary("*", _S.read(_v19, "y"), _S.read(_v19, "W")), _S.read(_v19, "x")), _S.binary("/", _S.read(_v19, "s"), 5), "=", false)
				_v18 = _S.iteration(_v18)
				_S.write(_v18, "x", 1, "+=", true)
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "y", 1, "+=", true)
		var _v21 = _S.scope(_v16)
		_S.define(_v21, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "y"), _S.read(_v21, "H"))):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v22, "x"), _S.read(_v22, "W"))):
				var _v23 = _S.scope(_v22)
				_S.define(_v23, "s", 0)
				var _v24 = _S.scope(_v23)
				_S.define(_v24, "d", _S.unary("-", 2))
				while _S.truth(_S.binary("<=", _S.read(_v24, "d"), 2)):
					_S.write(_v24, "s", (_S.prop(_S.read(_v24, "b"), _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v24, "y"), _S.read(_v24, "d")), _S.read(_v24, "W")), _S.read(_v24, "x"))) if _S.truth(_S.logical("&&", _S.binary(">=", _S.binary("+", _S.read(_v24, "y"), _S.read(_v24, "d")), 0), func(): return _S.binary("<", _S.binary("+", _S.read(_v24, "y"), _S.read(_v24, "d")), _S.read(_v24, "H")))) else 0), "+=", false)
					_v24 = _S.iteration(_v24)
					_S.write(_v24, "d", 1, "+=", true)
				_S.set_prop(_S.read(_v23, "a"), _S.binary("+", _S.binary("*", _S.read(_v23, "y"), _S.read(_v23, "W")), _S.read(_v23, "x")), _S.binary("/", _S.read(_v23, "s"), 5), "=", false)
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "x", 1, "+=", true)
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "y", 1, "+=", true)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "pass", 1, "+=", true)
	return _S.read(_e, "a")

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "pm", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "blur"), [_S.read(_e, "pm")]))
	_S.define(_e, "at", _S.function_value(_e, "_f9"))
	var _v25 = _S.scope(_e)
	_S.define(_v25, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v25, "y"), _S.read(_v25, "H"))):
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "x"), _S.read(_v26, "W"))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "i", _S.binary("+", _S.binary("*", _S.read(_v27, "y"), _S.read(_v27, "W")), _S.read(_v27, "x")))
			if _S.truth(_S.binary("!==", _S.prop(_S.read(_v27, "part"), _S.read(_v27, "i")), _S.binary("+", _S.read(_v27, "k"), 1))):
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "x", 1, "+=", true)
				continue
			_S.define(_v27, "gx", _S.binary("-", _S.call_value(_S.read(_v27, "at"), [_S.binary("+", _S.read(_v27, "x"), 1), _S.read(_v27, "y")]), _S.call_value(_S.read(_v27, "at"), [_S.binary("-", _S.read(_v27, "x"), 1), _S.read(_v27, "y")])))
			_S.define(_v27, "gy", _S.binary("-", _S.call_value(_S.read(_v27, "at"), [_S.read(_v27, "x"), _S.binary("+", _S.read(_v27, "y"), 1)]), _S.call_value(_S.read(_v27, "at"), [_S.read(_v27, "x"), _S.binary("-", _S.read(_v27, "y"), 1)])))
			_S.define(_v27, "g", _S.logical("||", _S.invoke(_S.read(_v27, "Math"), "hypot", [_S.read(_v27, "gx"), _S.read(_v27, "gy")]), func(): return 0.000001))
			_S.define(_v27, "ox", _S.binary("/", _S.unary("-", _S.read(_v27, "gx")), _S.read(_v27, "g")))
			_S.define(_v27, "oy", _S.binary("/", _S.unary("-", _S.read(_v27, "gy")), _S.read(_v27, "g")))
			_S.define(_v27, "e", _S.call_value(_S.read(_v27, "clamp"), [_S.binary("/", _S.read(_v27, "g"), 0.28)]))
			_S.set_prop(_S.read(_v27, "amb"), _S.read(_v27, "i"), _S.binary("+", 0.42, _S.binary("*", _S.read(_v27, "e"), _S.binary("-", _S.binary("-", _S.binary("+", _S.binary("*", 0.4, _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.unary("-", _S.read(_v27, "oy"))])), _S.binary("*", 0.14, _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.unary("-", _S.read(_v27, "ox"))]))), _S.binary("*", 0.3, _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.read(_v27, "oy")]))), _S.binary("*", 0.08, _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.read(_v27, "ox")]))))), "=", false)
			_S.set_prop(_S.read(_v27, "down"), _S.read(_v27, "i"), _S.binary("*", _S.binary("*", _S.read(_v27, "e"), _S.invoke(_S.read(_v27, "Math"), "max", [0, _S.read(_v27, "oy")])), (0.3 if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v27, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v27, "x"), 0.5), _S.read(_v27, "C"))]), 7), func(): return _S.binary(">", _S.read(_v27, "y"), 27))) else 1)), "=", false)
			for _v28 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]]):
				var _v29 = _S.scope(_v27)
				var _v30 = _v28
				_S.define(_v29, "dx", _S.prop(_v30, 0))
				_S.define(_v29, "dy", _S.prop(_v30, 1))
				var _v31 = _S.scope(_v29)
				_S.define(_v31, "j", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v31, "y"), _S.read(_v31, "dy")), _S.read(_v31, "W")), _S.read(_v31, "x")), _S.read(_v31, "dx")))
				if _S.truth(_S.logical("&&", _S.call_value(_S.read(_v31, "on"), [_S.binary("+", _S.read(_v31, "x"), _S.read(_v31, "dx")), _S.binary("+", _S.read(_v31, "y"), _S.read(_v31, "dy"))]), func(): return _S.binary(">", _S.prop(_S.read(_v31, "part"), _S.read(_v31, "j")), _S.binary("+", _S.read(_v31, "k"), 1)))):
					_S.set_prop(_S.read(_v31, "crease"), _S.read(_v31, "i"), 1, "=", false)
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "x", 1, "+=", true)
		_v25 = _S.iteration(_v25)
		_S.write(_v25, "y", 1, "+=", true)
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return (_S.prop(_S.read(_e, "B"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "W")), _S.read(_e, "x"))) if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.read(_e, "W"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "H")))) else 0)

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "SH", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "body"), 5]))
	_S.define(_e, "HR", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "horn"), 5]))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stone"), 5]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 2), _S.call_value(_S.read(_e, "hex"), ["#7a6c78"]), 0.45]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f11"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "RUB", [_S.prop(_S.read(_e, "ST"), 0), _S.prop(_S.read(_e, "ST"), 1), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 2), _S.prop(_S.read(_e, "C"), 2), 0.3]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 3), _S.prop(_S.read(_e, "C"), 4), 0.3]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 4), _S.prop(_S.read(_e, "C"), 5), 0.35])])
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "runes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 12}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "cracks", [])
	var _v40 = _S.scope(_e)
	_S.define(_v40, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v40, "i"), 7)):
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v41, "i"), 7), _S.read(_v41, "TAU")), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 0.25), 0.25])))
		_S.define(_v41, "r", 3)
		_S.define(_v41, "pts", [[0, 0]])
		_S.define(_v41, "len", _S.invoke(_S.read(_v41, "R"), "range", [_S.binary("*", _S.read(_v41, "R1"), 0.6), _S.binary("*", _S.read(_v41, "R1"), 1.05)]))
		while _S.truth(_S.binary("<", _S.read(_v41, "r"), _S.read(_v41, "len"))):
			var _v42 = _S.scope(_v41)
			_S.write(_v42, "r", _S.invoke(_S.read(_v42, "R"), "range", [2, 4]), "+=", false)
			_S.write(_v42, "a", _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 0.3), 0.3]), "+=", false)
			_S.invoke(_S.read(_v42, "pts"), "push", [[_S.binary("*", _S.invoke(_S.read(_v42, "Math"), "cos", [_S.read(_v42, "a")]), _S.read(_v42, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "sin", [_S.read(_v42, "a")]), _S.read(_v42, "r")), _S.read(_v42, "SY"))]])
		_S.invoke(_S.read(_v41, "cracks"), "push", [_S.read(_v41, "pts")])
		_v40 = _S.iteration(_v40)
		_S.write(_v40, "i", 1, "+=", true)
	_S.define(_e, "rise", _S.function_value(_e, "_f13"))
	_S.define(_e, "heat", _S.function_value(_e, "_f14"))
	_S.define(_e, "t", 0)
	_S.define(_e, "done", _S.merge([]))
	_S.define(_e, "left", _S.function_value(_e, "_f15"))
	_S.define(_e, "once", _S.function_value(_e, "_f16"))
	_S.define(_e, "topEdge", _S.function_value(_e, "_f17"))
	return _S.merge([{"update": _S.function_value(_e, "_f18")}, {"drawBack": _S.function_value(_e, "_f19")}, {"draw": _S.function_value(_e, "_f22")}])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "_", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.merge([{"a": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_e, "i"), 12), _S.read(_e, "TAU")), 0.13)}, {"g": _S.prop(_S.read(_e, "GLYPHS"), _S.binary("%", _S.binary("+", _S.binary("*", _S.read(_e, "i"), 5), 2), _S.prop(_S.read(_e, "GLYPHS"), "length")))}])

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))):
		return 0
	_S.define(_e, "a", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BREAK")), 0.4)])]), 0.56))
	_S.define(_e, "sag", _S.binary("*", 0.04, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BREAK")), 0.42), 0.3)]))])))
	_S.define(_e, "b", _S.binary("*", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BREAK")), 0.62), 0.45)]), 1.4]), 0.44))
	return _S.binary("+", _S.binary("-", _S.read(_e, "a"), _S.read(_e, "sag")), _S.read(_e, "b"))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0, _S.read(_e, "IGN"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "FADE"), _S.binary("+", _S.read(_e, "FADE"), 0.8), _S.read(_e, "t")]))), _S.binary("-", 1, _S.binary("*", 0.25, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "EYES"), 0.2), _S.binary("+", _S.read(_e, "EYES"), 0.9), _S.read(_e, "t")])))), _S.binary("+", _S.binary("+", _S.binary("+", 0.85, _S.binary("*", 0.15, _S.call_value(_S.read(_e, "noise"), [_S.binary("*", _S.read(_e, "t"), 9), 3]))), _S.binary("*", 0.5, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "BREAK")), 2)), 0.02)]))), _S.binary("*", 0.3, _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("/", _S.unary("-", _S.binary("**", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "EYES")), 2)), 0.01)]))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Math"), "max", [0.05, _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [_S.read(_e, "a"), _S.read(_e, "b")]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.1), _S.read(_e, "t"))])])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "k", _S.arg(_args, 0))
	_S.define(_e, "at", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.unary("!", _S.prop(_S.read(_e, "done"), _S.read(_e, "k"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "at"))), func(): return _S.set_prop(_S.read(_e, "done"), _S.read(_e, "k"), true, "=", false))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "off", _S.binary("*", _S.prop(_S.read(_e, "BEAST"), "h"), _S.binary("-", 1, _S.call_value(_S.read(_e, "rise"), [_S.read(_e, "t")]))))
	_S.define(_e, "pts", [])
	var _v43 = _S.scope(_e)
	_S.define(_v43, "x", 0)
	while _S.truth(_S.binary("<", _S.read(_v43, "x"), _S.prop(_S.read(_v43, "BEAST"), "w"))):
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v44, "y"), _S.prop(_S.read(_v44, "BEAST"), "h"))):
			if _S.truth(_S.prop(_S.prop(_S.read(_v44, "BEAST"), "part"), _S.binary("+", _S.binary("*", _S.read(_v44, "y"), _S.prop(_S.read(_v44, "BEAST"), "w")), _S.read(_v44, "x")))):
				var _v45 = _S.scope(_v44)
				_S.define(_v45, "ly", _S.binary("+", _S.binary("-", _S.read(_v45, "y"), _S.prop(_S.read(_v45, "BEAST"), "h")), _S.read(_v45, "off")))
				if _S.truth(_S.binary("<", _S.read(_v45, "ly"), 0)):
					_S.invoke(_S.read(_v45, "pts"), "push", [[_S.binary("-", _S.read(_v45, "x"), _S.binary("/", _S.prop(_S.read(_v45, "BEAST"), "w"), 2)), _S.read(_v45, "ly")]])
				break
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "y", 1, "+=", true)
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "x", 1, "+=", true)
	return _S.read(_e, "pts")

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "h", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "IGN"))):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "ph", _S.binary("*", _S.binary("/", _S.read(_v46, "t"), _S.read(_v46, "IGN")), _S.prop(_S.read(_v46, "Math"), "PI")))
		for _v47 in _S.array([_S.unary("-", 1), 1]):
			var _v48 = _S.scope(_v46)
			_S.define(_v48, "s", _v47)
			var _v49 = _S.scope(_v48)
			_S.define(_v49, "a", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v49, "Math"), "PI"), 2), _S.binary("*", _S.read(_v49, "s"), _S.read(_v49, "ph"))))
			_S.define(_v49, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "sin", [_S.read(_v49, "a")]), _S.read(_v49, "R0")), _S.read(_v49, "SY")))
			if _S.truth(_S.invoke(_S.read(_v49, "R"), "chance", [0.5])):
				(_S.invoke(_S.read(_v49, "ps"), "spawn", [_S.prop(_S.read(_v49, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "a")]), _S.read(_v49, "R0")), _S.read(_v49, "y"), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [40, 130])), _S.invoke(_S.read(_v49, "R"), "range", [0.2, 0.45])]) if _S.truth(_S.binary("<", _S.read(_v49, "y"), _S.unary("-", 0.5))) else _S.invoke(_S.read(_v49, "ps"), "spawn", [_S.prop(_S.read(_v49, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "a")]), _S.read(_v49, "R0")), _S.read(_v49, "y"), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [30, 70])), _S.invoke(_S.read(_v49, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v49, "C"), 6), 1.4]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.2), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.6))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.2, _S.read(_e, "h"))]))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "a", _S.invoke(_S.read(_v50, "R"), "range", [0, _S.read(_v50, "TAU")]))
		_S.define(_v50, "r", _S.invoke(_S.read(_v50, "R"), "pick", [[_S.read(_v50, "R0"), _S.read(_v50, "R1"), _S.read(_v50, "R0")]]))
		_S.invoke(_S.read(_v50, "ps"), "spawn", [_S.prop(_S.read(_v50, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "cos", [_S.read(_v50, "a")]), _S.read(_v50, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "sin", [_S.read(_v50, "a")]), _S.read(_v50, "r")), _S.read(_v50, "SY")), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v50, "R"), "range", [20, 50])), _S.call_value(_S.read(_v50, "left"), [0.8, 1.6]), _S.prop(_S.read(_v50, "C"), 5), _S.invoke(_S.read(_v50, "R"), "range", [1, 1.8])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.15), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "h")]))]))):
		var _v51 = _S.scope(_e)
		_S.define(_v51, "a", _S.invoke(_S.read(_v51, "R"), "range", [0, _S.read(_v51, "TAU")]))
		_S.define(_v51, "r", (_S.read(_v51, "R0") if _S.truth(_S.invoke(_S.read(_v51, "R"), "chance", [0.7])) else _S.read(_v51, "R1")))
		if _S.truth((_S.binary("<", _S.invoke(_S.read(_v51, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v51, "a"), _S.binary("/", _S.prop(_S.read(_v51, "Math"), "PI"), 2)), _S.binary("*", _S.prop(_S.read(_v51, "Math"), "PI"), 3)), _S.read(_v51, "TAU")), _S.prop(_S.read(_v51, "Math"), "PI"))]), _S.binary("*", _S.binary("/", _S.read(_v51, "t"), _S.read(_v51, "IGN")), _S.prop(_S.read(_v51, "Math"), "PI"))) if _S.truth(_S.binary("<", _S.read(_v51, "t"), _S.read(_v51, "IGN"))) else true)):
			_S.invoke(_S.read(_v51, "ps"), "spawn", [_S.prop(_S.read(_v51, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v51, "Math"), "cos", [_S.read(_v51, "a")]), _S.read(_v51, "r")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v51, "Math"), "sin", [_S.read(_v51, "a")]), _S.read(_v51, "r")), _S.read(_v51, "SY")), 0.5), _S.invoke(_S.read(_v51, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v51, "R"), "range", [6, 16])), _S.invoke(_S.read(_v51, "R"), "range", [0.18, 0.4]), 0, _S.binary("*", _S.invoke(_S.read(_v51, "R"), "range", [0.8, 1.6]), _S.invoke(_S.read(_v51, "Math"), "min", [1, _S.read(_v51, "h")])), 0, (_S.prop(_S.read(_v51, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v51, "R"), "chance", [0.25])) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.4))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.05, _S.read(_e, "h"))]))):
		var _v52 = _S.scope(_e)
		_S.define(_v52, "a", _S.invoke(_S.read(_v52, "R"), "range", [0, _S.read(_v52, "TAU")]))
		_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "SMOKE"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "cos", [_S.read(_v52, "a")]), _S.read(_v52, "R0")), 0.9), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "sin", [_S.read(_v52, "a")]), _S.read(_v52, "R0")), _S.read(_v52, "SY")), 1), _S.invoke(_S.read(_v52, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v52, "R"), "range", [12, 24])), _S.call_value(_S.read(_v52, "left"), [1.4, 2.2]), 0, _S.invoke(_S.read(_v52, "R"), "range", [2.2, 3.4])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["ign", _S.read(_e, "IGN")])):
		_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 4), 60, _S.prop(_S.read(_e, "C"), 4), 0.55, 0.5])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["runes", _S.read(_e, "RUNES")])):
		_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 4), 50, _S.prop(_S.read(_e, "C"), 5), 0.5, 0.35])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RUNES")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "GRIT"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "R1")), _S.read(_e, "R1")]), _S.unary("-", 0.5), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [40, 120])), _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "ST"), 2), _S.prop(_S.read(_e, "ST"), 3), _S.prop(_S.read(_e, "ST"), 4)]]), 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RUNES")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "DUST"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "R1")), _S.read(_e, "R1")]), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 12])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.7]), _S.read(_e, "DUST"), _S.invoke(_S.read(_e, "R"), "range", [1.5, 2.5])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["break", _S.read(_e, "BREAK")])):
		var _v53 = _S.scope(_e)
		_S.invoke(_S.read(_v53, "lights"), "add", [0, _S.unary("-", 18), 64, _S.prop(_S.read(_v53, "C"), 4), 0.9, 0.6])
		_S.invoke(_S.read(_v53, "lights"), "add", [0, _S.unary("-", 8), 26, _S.prop(_S.read(_v53, "C"), 6), 0.8, 0.14])
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v54, "i"), 18)):
			_S.invoke(_S.read(_v54, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v54, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 14), 14])}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 75), 75])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [170, 320]))}, {"g": 1}, {"drag": 0.7}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v54, "R"), "range", [1.6, 2.4])}, {"a": _S.invoke(_S.read(_v54, "R"), "range", [0, _S.read(_v54, "TAU")])}, {"va": _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v54, "R"), "range", [1.3, 3])}, {"ramp": _S.read(_v54, "RUB")}])])
			_v54 = _S.iteration(_v54)
			_S.write(_v54, "i", 1, "+=", true)
		var _v55 = _S.scope(_v53)
		_S.define(_v55, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v55, "i"), 60)):
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "u", _S.invoke(_S.read(_v56, "R"), "range", [_S.unary("-", 1), 1]))
			_S.define(_v56, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v56, "Math"), "PI")), 2), _S.binary("*", _S.read(_v56, "u"), 0.7)))
			_S.define(_v56, "sp", _S.binary("*", _S.invoke(_S.read(_v56, "R"), "range", [80, 230]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v56, "Math"), "abs", [_S.read(_v56, "u")])))))
			_S.invoke(_S.read(_v56, "ps"), "spawn", [_S.prop(_S.read(_v56, "P"), "GRIT"), _S.binary("*", _S.read(_v56, "u"), 10), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "cos", [_S.read(_v56, "a")]), _S.read(_v56, "sp")), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "sin", [_S.read(_v56, "a")]), _S.read(_v56, "sp")), _S.invoke(_S.read(_v56, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v56, "R"), "pick", [[_S.prop(_S.read(_v56, "ST"), 2), _S.prop(_S.read(_v56, "ST"), 3), _S.prop(_S.read(_v56, "ST"), 3), _S.prop(_S.read(_v56, "ST"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v56, "R"), "chance", [0.4])) else 1)])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
		var _v57 = _S.scope(_v53)
		_S.define(_v57, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v57, "i"), 12)):
			var _v58 = _S.scope(_v57)
			_S.define(_v58, "s", _S.invoke(_S.read(_v58, "R"), "sign", []))
			_S.invoke(_S.read(_v58, "ps"), "spawn", [_S.prop(_S.read(_v58, "P"), "SMOKE"), _S.binary("*", _S.read(_v58, "s"), _S.invoke(_S.read(_v58, "R"), "range", [2, 14])), _S.unary("-", _S.invoke(_S.read(_v58, "R"), "range", [1, 5])), _S.binary("*", _S.read(_v58, "s"), _S.invoke(_S.read(_v58, "R"), "range", [35, 100])), _S.unary("-", _S.invoke(_S.read(_v58, "R"), "range", [4, 24])), _S.invoke(_S.read(_v58, "R"), "range", [1.2, 2]), _S.read(_v58, "DUST"), _S.invoke(_S.read(_v58, "R"), "range", [3.5, 6]), _S.invoke(_S.read(_v58, "R"), "range", [0, 0.1]), _S.prop(_S.read(_v58, "PF"), "BIG")])
			_v57 = _S.iteration(_v57)
			_S.write(_v57, "i", 1, "+=", true)
		var _v59 = _S.scope(_v53)
		_S.define(_v59, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v59, "i"), 4)):
			var _v60 = _S.scope(_v59)
			_S.define(_v60, "s", _S.invoke(_S.read(_v60, "R"), "sign", []))
			_S.invoke(_S.read(_v60, "ps"), "spawn", [_S.prop(_S.read(_v60, "P"), "SMOKE"), _S.binary("*", _S.read(_v60, "s"), _S.invoke(_S.read(_v60, "R"), "range", [10, 18])), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [2, 8])), _S.binary("*", _S.read(_v60, "s"), _S.invoke(_S.read(_v60, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [40, 90])), _S.invoke(_S.read(_v60, "R"), "range", [1.4, 2.2]), _S.read(_v60, "DUST"), _S.invoke(_S.read(_v60, "R"), "range", [4, 6.5]), _S.invoke(_S.read(_v60, "R"), "range", [0, 0.12]), _S.prop(_S.read(_v60, "PF"), "BIG")])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "+=", true)
		var _v61 = _S.scope(_v53)
		_S.define(_v61, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v61, "i"), 24)):
			var _v62 = _S.scope(_v61)
			_S.define(_v62, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v62, "Math"), "PI")), 2), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v62, "sp", _S.invoke(_S.read(_v62, "R"), "range", [150, 360]))
			_S.invoke(_S.read(_v62, "ps"), "spawn", [_S.prop(_S.read(_v62, "P"), "SPARK"), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "cos", [_S.read(_v62, "a")]), _S.read(_v62, "sp")), _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "sin", [_S.read(_v62, "a")]), _S.read(_v62, "sp")), _S.invoke(_S.read(_v62, "R"), "range", [0.25, 0.65])])
			_v61 = _S.iteration(_v61)
			_S.write(_v61, "i", 1, "+=", true)
	_S.define(_e, "rv", _S.binary("-", _S.call_value(_S.read(_e, "rise"), [_S.read(_e, "t")]), _S.call_value(_S.read(_e, "rise"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt"))])))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 1.2))), func(): return _S.binary(">", _S.read(_e, "rv"), 0))):
		var _v63 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v63, "R"), "chance", [_S.invoke(_S.read(_v63, "Math"), "min", [0.9, _S.binary("*", _S.read(_v63, "rv"), 140)])])):
			var _v64 = _S.scope(_v63)
			_S.define(_v64, "e", _S.call_value(_S.read(_v64, "topEdge"), []))
			if _S.truth(_S.prop(_S.read(_v64, "e"), "length")):
				var _v65 = _S.scope(_v64)
				var _v66 = _S.invoke(_S.read(_v65, "R"), "pick", [_S.read(_v65, "e")])
				_S.define(_v65, "x", _S.prop(_v66, 0))
				_S.define(_v65, "y", _S.prop(_v66, 1))
				_S.invoke(_S.read(_v65, "ps"), "spawn", [_S.prop(_S.read(_v65, "P"), "GRIT"), _S.read(_v65, "x"), _S.read(_v65, "y"), _S.invoke(_S.read(_v65, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [10, 60])), _S.invoke(_S.read(_v65, "R"), "range", [0.8, 1.4]), _S.invoke(_S.read(_v65, "R"), "pick", [[_S.prop(_S.read(_v65, "ST"), 2), _S.prop(_S.read(_v65, "ST"), 3), _S.prop(_S.read(_v65, "ST"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v65, "R"), "chance", [0.3])) else 1)])
		if _S.truth(_S.invoke(_S.read(_v63, "R"), "chance", [_S.invoke(_S.read(_v63, "Math"), "min", [0.8, _S.binary("*", _S.read(_v63, "rv"), 70)])])):
			var _v67 = _S.scope(_v63)
			_S.define(_v67, "s", _S.invoke(_S.read(_v67, "R"), "sign", []))
			_S.invoke(_S.read(_v67, "ps"), "spawn", [_S.prop(_S.read(_v67, "P"), "SMOKE"), _S.binary("*", _S.read(_v67, "s"), _S.invoke(_S.read(_v67, "R"), "range", [10, 22])), _S.unary("-", _S.invoke(_S.read(_v67, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v67, "s"), _S.invoke(_S.read(_v67, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v67, "R"), "range", [2, 12])), _S.invoke(_S.read(_v67, "R"), "range", [1, 1.8]), _S.read(_v67, "DUST"), _S.invoke(_S.read(_v67, "R"), "range", [3, 5.5]), 0, _S.prop(_S.read(_v67, "PF"), "BIG")])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["heave2", _S.binary("+", _S.read(_e, "BREAK"), 0.64)])):
		var _v68 = _S.scope(_e)
		_S.invoke(_S.read(_v68, "lights"), "add", [0, _S.unary("-", 10), 56, _S.prop(_S.read(_v68, "C"), 4), 0.6, 0.4])
		var _v69 = _S.scope(_v68)
		_S.define(_v69, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v69, "i"), 8)):
			_S.invoke(_S.read(_v69, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v69, "B"), "CHUNK")}, {"x": _S.binary("*", _S.invoke(_S.read(_v69, "R"), "sign", []), _S.invoke(_S.read(_v69, "R"), "range", [10, 22]))}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v69, "R"), "sign", []), _S.invoke(_S.read(_v69, "R"), "range", [25, 70]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v69, "R"), "range", [90, 180]))}, {"g": 1}, {"drag": 0.7}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v69, "R"), "range", [1.2, 1.8])}, {"a": _S.invoke(_S.read(_v69, "R"), "range", [0, _S.read(_v69, "TAU")])}, {"va": _S.invoke(_S.read(_v69, "R"), "range", [_S.unary("-", 12), 12])}, {"s": _S.invoke(_S.read(_v69, "R"), "range", [1.2, 2.4])}, {"ramp": _S.read(_v69, "RUB")}])])
			_v69 = _S.iteration(_v69)
			_S.write(_v69, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["eyes", _S.read(_e, "EYES")])):
		var _v70 = _S.scope(_e)
		for _v71 in _S.array(_S.prop(_S.read(_v70, "BEAST"), "glints")):
			var _v72 = _S.scope(_v70)
			var _v73 = _v71
			_S.define(_v72, "ex", _S.prop(_v73, 0))
			_S.define(_v72, "ey", _S.prop(_v73, 1))
			var _v74 = _S.scope(_v72)
			_S.invoke(_S.read(_v74, "lights"), "add", [_S.read(_v74, "ex"), _S.read(_v74, "ey"), 14, _S.prop(_S.read(_v74, "C"), 6), 0.7, 0.3])
			var _v75 = _S.scope(_v74)
			_S.define(_v75, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v75, "i"), 5)):
				_S.invoke(_S.read(_v75, "ps"), "spawn", [_S.prop(_S.read(_v75, "P"), "SPARK"), _S.read(_v75, "ex"), _S.read(_v75, "ey"), _S.invoke(_S.read(_v75, "R"), "range", [_S.unary("-", 90), 90]), _S.invoke(_S.read(_v75, "R"), "range", [_S.unary("-", 90), 20]), _S.invoke(_S.read(_v75, "R"), "range", [0.15, 0.35])])
				_v75 = _S.iteration(_v75)
				_S.write(_v75, "i", 1, "+=", true)
		var _v76 = _S.scope(_v70)
		_S.define(_v76, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v76, "i"), 10)):
			var _v77 = _S.scope(_v76)
			_S.define(_v77, "s", _S.invoke(_S.read(_v77, "R"), "sign", []))
			_S.invoke(_S.read(_v77, "ps"), "spawn", [_S.prop(_S.read(_v77, "P"), "DUST"), _S.binary("*", _S.read(_v77, "s"), _S.invoke(_S.read(_v77, "R"), "range", [8, 20])), _S.unary("-", 1), _S.binary("*", _S.read(_v77, "s"), _S.invoke(_S.read(_v77, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v77, "R"), "range", [3, 10])), _S.invoke(_S.read(_v77, "R"), "range", [0.4, 0.8]), _S.read(_v77, "DUST"), _S.invoke(_S.read(_v77, "R"), "range", [1.5, 3])])
			_v76 = _S.iteration(_v76)
			_S.write(_v76, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.05)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.75))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.45]))):
		var _v78 = _S.scope(_e)
		_S.define(_v78, "x", _S.invoke(_S.read(_v78, "R"), "int", [4, _S.binary("-", _S.prop(_S.read(_v78, "BEAST"), "w"), 5)]))
		_S.define(_v78, "y", _S.invoke(_S.read(_v78, "R"), "int", [2, _S.binary("-", _S.prop(_S.read(_v78, "BEAST"), "h"), 4)]))
		if _S.truth(_S.prop(_S.prop(_S.read(_v78, "BEAST"), "part"), _S.binary("+", _S.binary("*", _S.read(_v78, "y"), _S.prop(_S.read(_v78, "BEAST"), "w")), _S.read(_v78, "x")))):
			var _v79 = _S.scope(_v78)
			_S.define(_v79, "lx", _S.binary("-", _S.read(_v79, "x"), _S.binary("/", _S.prop(_S.read(_v79, "BEAST"), "w"), 2)))
			_S.define(_v79, "ly", _S.binary("-", _S.read(_v79, "y"), _S.prop(_S.read(_v79, "BEAST"), "h")))
			_S.invoke(_S.read(_v79, "ps"), "spawn", [_S.prop(_S.read(_v79, "P"), "SMOKE"), _S.read(_v79, "lx"), _S.read(_v79, "ly"), _S.invoke(_S.read(_v79, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v79, "R"), "range", [10, 26])), _S.call_value(_S.read(_v79, "left"), [0.9, 1.5]), _S.read(_v79, "SOOT"), _S.invoke(_S.read(_v79, "R"), "range", [2, 3.4])])
			if _S.truth(_S.invoke(_S.read(_v79, "R"), "chance", [0.3])):
				_S.invoke(_S.read(_v79, "ps"), "spawn", [_S.prop(_S.read(_v79, "P"), "EMBER"), _S.read(_v79, "lx"), _S.read(_v79, "ly"), _S.invoke(_S.read(_v79, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v79, "R"), "range", [15, 40])), _S.call_value(_S.read(_v79, "left"), [0.6, 1.2]), _S.prop(_S.read(_v79, "C"), 4), 1])
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	for _v80 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v81 = _S.scope(_e)
		_S.define(_v81, "b", _v80)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v81, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v81, "b"), "dusted")))):
			var _v82 = _S.scope(_v81)
			_S.set_prop(_S.read(_v82, "b"), "dusted", true, "=", false)
			var _v83 = _S.scope(_v82)
			_S.define(_v83, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v83, "i"), 2)):
				_S.invoke(_S.read(_v83, "ps"), "spawn", [_S.prop(_S.read(_v83, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v83, "b"), "x"), _S.invoke(_S.read(_v83, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v83, "R"), "sign", []), _S.invoke(_S.read(_v83, "R"), "range", [6, 30])), _S.unary("-", _S.invoke(_S.read(_v83, "R"), "range", [2, 12])), _S.invoke(_S.read(_v83, "R"), "range", [0.3, 0.6]), _S.read(_v83, "DUST"), _S.invoke(_S.read(_v83, "R"), "range", [1.2, 2.4])])
				_v83 = _S.iteration(_v83)
				_S.write(_v83, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<=", _S.read(_e, "h"), 0.01)):
		return null
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 52, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.28, _S.read(_e, "h"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 22), 72, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.1, _S.read(_e, "h"))])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 22, _S.prop(_S.read(_e, "C"), 5), _S.binary("*", 0.2, _S.read(_e, "h"))])
	_S.define(_e, "ck", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "RUNES"), _S.read(_e, "BREAK"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "FADE"), _S.binary("+", _S.read(_e, "FADE"), 0.7), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "ck"), 0)):
		for _v84 in _S.array(_S.read(_e, "cracks")):
			var _v85 = _S.scope(_e)
			_S.define(_v85, "pts", _v84)
			var _v86 = _S.scope(_v85)
			_S.define(_v86, "i", 1)
			while _S.truth(_S.binary("<", _S.read(_v86, "i"), _S.prop(_S.read(_v86, "pts"), "length"))):
				var _v87 = _S.scope(_v86)
				_S.define(_v87, "u", _S.binary("/", _S.read(_v87, "i"), _S.prop(_S.read(_v87, "pts"), "length")))
				if _S.truth(_S.binary(">", _S.read(_v87, "u"), _S.binary("*", _S.read(_v87, "ck"), 1.1))):
					break
				_S.define(_v87, "cool", _S.call_value(_S.read(_v87, "smooth"), [_S.binary("+", _S.read(_v87, "BREAK"), 0.1), _S.binary("+", _S.read(_v87, "BREAK"), 1.1), _S.read(_v87, "t")]))
				_S.define(_v87, "ci", _S.invoke(_S.read(_v87, "Math"), "round", [_S.binary("-", _S.binary("-", 6, _S.binary("*", _S.read(_v87, "u"), 2)), _S.binary("*", _S.read(_v87, "cool"), 2.6))]))
				_S.invoke(_S.read(_v87, "p"), "line", [_S.prop(_S.prop(_S.read(_v87, "pts"), _S.binary("-", _S.read(_v87, "i"), 1)), 0), _S.prop(_S.prop(_S.read(_v87, "pts"), _S.binary("-", _S.read(_v87, "i"), 1)), 1), _S.prop(_S.prop(_S.read(_v87, "pts"), _S.read(_v87, "i")), 0), _S.prop(_S.prop(_S.read(_v87, "pts"), _S.read(_v87, "i")), 1), _S.prop(_S.read(_v87, "C"), _S.call_value(_S.read(_v87, "clamp"), [_S.read(_v87, "ci"), 2, 6])), 1])
				_v86 = _S.iteration(_v86)
				_S.write(_v86, "i", 1, "+=", true)
	_S.define(_e, "n", 220)
	_S.define(_e, "prog", _S.binary("*", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "IGN"))]), _S.prop(_S.read(_e, "Math"), "PI")))
	var _v88 = _S.scope(_e)
	_S.define(_v88, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v88, "j"), _S.read(_v88, "n"))):
		var _v89 = _S.scope(_v88)
		_S.define(_v89, "a", _S.binary("*", _S.binary("/", _S.read(_v89, "j"), _S.read(_v89, "n")), _S.read(_v89, "TAU")))
		_S.define(_v89, "d", _S.invoke(_S.read(_v89, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v89, "a"), _S.binary("/", _S.prop(_S.read(_v89, "Math"), "PI"), 2)), _S.binary("*", _S.prop(_S.read(_v89, "Math"), "PI"), 3)), _S.read(_v89, "TAU")), _S.prop(_S.read(_v89, "Math"), "PI"))]))
		if _S.truth(_S.binary(">", _S.read(_v89, "d"), _S.read(_v89, "prog"))):
			_v88 = _S.iteration(_v88)
			_S.write(_v88, "j", 1, "+=", true)
			continue
		_S.define(_v89, "fresh", _S.logical("&&", _S.binary("<", _S.binary("-", _S.read(_v89, "prog"), _S.read(_v89, "d")), 0.25), func(): return _S.binary("<", _S.read(_v89, "t"), _S.binary("+", _S.read(_v89, "IGN"), 0.1))))
		_S.define(_v89, "f", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v89, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v89, "a"), 6), _S.binary("*", _S.read(_v89, "t"), 5)), 4]), 0.5), 0.5))
		_S.define(_v89, "k", _S.binary("*", _S.read(_v89, "h"), _S.binary("+", 0.7, _S.binary("*", 0.5, _S.read(_v89, "f")))))
		_S.define(_v89, "ca", _S.invoke(_S.read(_v89, "Math"), "cos", [_S.read(_v89, "a")]))
		_S.define(_v89, "sa", _S.invoke(_S.read(_v89, "Math"), "sin", [_S.read(_v89, "a")]))
		_S.invoke(_S.read(_v89, "p"), "dot", [_S.binary("*", _S.read(_v89, "ca"), _S.read(_v89, "R0")), _S.binary("*", _S.binary("*", _S.read(_v89, "sa"), _S.read(_v89, "R0")), _S.read(_v89, "SY")), (_S.read(_v89, "WHITE") if _S.truth(_S.read(_v89, "fresh")) else (_S.prop(_S.read(_v89, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v89, "k"), 0.95)) else (_S.prop(_S.read(_v89, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v89, "k"), 0.6)) else (_S.prop(_S.read(_v89, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v89, "k"), 0.35)) else _S.prop(_S.read(_v89, "C"), 3)))))])
		_S.invoke(_S.read(_v89, "p"), "dot", [_S.binary("*", _S.read(_v89, "ca"), _S.binary("+", _S.read(_v89, "R0"), 2.2)), _S.binary("*", _S.binary("*", _S.read(_v89, "sa"), _S.binary("+", _S.read(_v89, "R0"), 2.2)), _S.read(_v89, "SY")), (_S.prop(_S.read(_v89, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v89, "k"), 0.8)) else _S.prop(_S.read(_v89, "C"), 3)), 0.9])
		if _S.truth(_S.binary(">", _S.read(_v89, "t"), _S.binary("-", _S.read(_v89, "RUNES"), 0.15))):
			_S.invoke(_S.read(_v89, "p"), "dot", [_S.binary("*", _S.read(_v89, "ca"), _S.read(_v89, "R1")), _S.binary("*", _S.binary("*", _S.read(_v89, "sa"), _S.read(_v89, "R1")), _S.read(_v89, "SY")), (_S.prop(_S.read(_v89, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v89, "k"), 0.9)) else (_S.prop(_S.read(_v89, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v89, "k"), 0.5)) else _S.prop(_S.read(_v89, "C"), 3))), _S.call_value(_S.read(_v89, "smooth"), [_S.binary("-", _S.read(_v89, "RUNES"), 0.15), _S.binary("+", _S.read(_v89, "RUNES"), 0.05), _S.read(_v89, "t")])])
		if _S.truth(_S.binary("===", _S.binary("%", _S.read(_v89, "j"), 11), 0)):
			_S.invoke(_S.read(_v89, "p"), "glow", [_S.binary("*", _S.read(_v89, "ca"), _S.read(_v89, "R0")), _S.binary("*", _S.binary("*", _S.read(_v89, "sa"), _S.read(_v89, "R0")), _S.read(_v89, "SY")), 9, _S.prop(_S.read(_v89, "C"), 4), _S.binary("*", 0.22, _S.read(_v89, "k"))])
		_v88 = _S.iteration(_v88)
		_S.write(_v88, "j", 1, "+=", true)
	_S.define(_e, "rk", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "RUNES"), 0.1), _S.binary("+", _S.read(_e, "RUNES"), 0.15), _S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "rk"), 0)):
		for _v90 in _S.array(_S.read(_e, "runes")):
			var _v91 = _S.scope(_e)
			_S.define(_v91, "r", _v90)
			var _v92 = _S.scope(_v91)
			_S.define(_v92, "k", _S.binary("*", _S.binary("*", _S.read(_v92, "h"), _S.read(_v92, "rk")), _S.binary("+", 0.75, _S.binary("*", 0.35, _S.call_value(_S.read(_v92, "noise"), [_S.binary("+", _S.binary("*", _S.read(_v92, "t"), 4), _S.binary("*", _S.prop(_S.read(_v92, "r"), "a"), 5)), 8])))))
			_S.define(_v92, "mid", _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v92, "R0"), _S.read(_v92, "R1")), 2), 0.5))
			_S.define(_v92, "ta", [_S.unary("-", _S.invoke(_S.read(_v92, "Math"), "sin", [_S.prop(_S.read(_v92, "r"), "a")])), _S.invoke(_S.read(_v92, "Math"), "cos", [_S.prop(_S.read(_v92, "r"), "a")])])
			_S.define(_v92, "na", [_S.invoke(_S.read(_v92, "Math"), "cos", [_S.prop(_S.read(_v92, "r"), "a")]), _S.invoke(_S.read(_v92, "Math"), "sin", [_S.prop(_S.read(_v92, "r"), "a")])])
			_S.define(_v92, "proj", _S.function_value(_v92, "_f20"))
			for _v94 in _S.array(_S.prop(_S.read(_v92, "r"), "g")):
				var _v95 = _S.scope(_v92)
				_S.define(_v95, "stroke", _v94)
				var _v96 = _S.scope(_v95)
				_S.define(_v96, "i", 1)
				while _S.truth(_S.binary("<", _S.read(_v96, "i"), _S.prop(_S.read(_v96, "stroke"), "length"))):
					var _v97 = _S.scope(_v96)
					var _v98 = _S.call_value(_S.read(_v97, "proj"), [_S.prop(_S.read(_v97, "stroke"), _S.binary("-", _S.read(_v97, "i"), 1))])
					_S.define(_v97, "x0", _S.prop(_v98, 0))
					_S.define(_v97, "y0", _S.prop(_v98, 1))
					var _v99 = _S.call_value(_S.read(_v97, "proj"), [_S.prop(_S.read(_v97, "stroke"), _S.read(_v97, "i"))])
					_S.define(_v97, "x1", _S.prop(_v99, 0))
					_S.define(_v97, "y1", _S.prop(_v99, 1))
					_S.invoke(_S.read(_v97, "p"), "line", [_S.read(_v97, "x0"), _S.read(_v97, "y0"), _S.read(_v97, "x1"), _S.read(_v97, "y1"), (_S.prop(_S.read(_v97, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v97, "k"), 0.9)) else (_S.prop(_S.read(_v97, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v97, "k"), 0.55)) else _S.prop(_S.read(_v97, "C"), 4))), _S.invoke(_S.read(_v97, "Math"), "min", [1, _S.binary("*", _S.read(_v97, "k"), 1.5)])])
					_v96 = _S.iteration(_v96)
					_S.write(_v96, "i", 1, "+=", true)
	_S.define(_e, "hole", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "BREAK"), 0.05), _S.binary("+", _S.read(_e, "BREAK"), 0.15), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "BREAK"), 0.95), _S.binary("+", _S.read(_e, "BREAK"), 1.5), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "hole"), 0)):
		var _v100 = _S.scope(_e)
		_S.define(_v100, "hw", _S.binary("*", 15, _S.read(_v100, "hole")))
		_S.invoke(_S.read(_v100, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_v100, "hw")), 1), _S.unary("-", 1), _S.binary("+", _S.read(_v100, "hw"), 1), 4, _S.function_value(_v100, "_f21")])
		_S.invoke(_S.read(_v100, "p"), "glow", [0, 0, 24, _S.prop(_S.read(_v100, "C"), 5), _S.binary("*", _S.binary("*", 0.3, _S.read(_v100, "hole")), _S.read(_v100, "h"))])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v93 = _S.arg(_args, 0)
	_S.define(_e, "u", _S.prop(_v93, 0))
	_S.define(_e, "v", _S.prop(_v93, 1))
	return [_S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "na"), 0), _S.read(_e, "mid")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "ta"), 0), _S.read(_e, "u")), 1.1)), _S.binary("*", _S.prop(_S.read(_e, "na"), 0), _S.read(_e, "v"))), _S.binary("*", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "na"), 1), _S.read(_e, "mid")), _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "ta"), 1), _S.read(_e, "u")), 1.1)), _S.binary("*", _S.prop(_S.read(_e, "na"), 1), _S.read(_e, "v"))), _S.read(_e, "SY"))]

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("/", _S.read(_e, "x"), _S.read(_e, "hw")), _S.binary("/", _S.binary("-", _S.read(_e, "y"), 0.5), 3.2)]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), 1)):
		return null
	_S.set_prop(_S.read(_e, "out"), "c", (_S.prop(_S.read(_e, "C"), 4) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.86)) else (_S.prop(_S.read(_e, "C"), 1) if _S.truth(_S.binary(">", _S.read(_e, "d"), 0.62)) else _S.prop(_S.read(_e, "C"), 0))), "=", false)
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "r", _S.call_value(_S.read(_e, "rise"), [_S.read(_e, "t")]))
	_S.define(_e, "off", _S.binary("*", _S.prop(_S.read(_e, "BEAST"), "h"), _S.binary("-", 1, _S.read(_e, "r"))))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	_S.define(_e, "fade", _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "FADE"), 0.1), _S.binary("+", _S.read(_e, "FADE"), 0.8), _S.read(_e, "t")]))
	if _S.truth(_S.binary(">", _S.read(_e, "r"), 0)):
		var _v101 = _S.scope(_e)
		_S.define(_v101, "W", _S.prop(_S.read(_v101, "BEAST"), "w"))
		_S.define(_v101, "H", _S.prop(_S.read(_v101, "BEAST"), "h"))
		_S.define(_v101, "x0", _S.binary("/", _S.unary("-", _S.read(_v101, "W")), 2))
		_S.define(_v101, "oy", _S.binary("-", _S.read(_v101, "off"), _S.read(_v101, "H")))
		_S.define(_v101, "k", _S.invoke(_S.read(_v101, "Math"), "min", [1, _S.read(_v101, "h")]))
		_S.define(_v101, "gone", _S.function_value(_v101, "_f23"))
		for _v102 in _S.array(_S.prop(_S.read(_v101, "BEAST"), "outline")):
			var _v103 = _S.scope(_v101)
			var _v104 = _v102
			_S.define(_v103, "x", _S.prop(_v104, 0))
			_S.define(_v103, "y", _S.prop(_v104, 1))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.read(_v103, "y"), _S.read(_v103, "oy")), 0), func(): return _S.unary("!", _S.call_value(_S.read(_v103, "gone"), [_S.read(_v103, "x"), _S.invoke(_S.read(_v103, "Math"), "min", [_S.binary("-", _S.read(_v103, "H"), 1), _S.invoke(_S.read(_v103, "Math"), "max", [0, _S.read(_v103, "y")])])])))):
				_S.invoke(_S.read(_v103, "p"), "px", [_S.binary("+", _S.read(_v103, "x0"), _S.read(_v103, "x")), _S.binary("+", _S.read(_v103, "y"), _S.read(_v103, "oy")), _S.prop(_S.read(_v103, "SH"), 0)])
		var _v105 = _S.scope(_v101)
		_S.define(_v105, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v105, "y"), _S.read(_v105, "H"))):
			var _v106 = _S.scope(_v105)
			_S.define(_v106, "ly", _S.binary("+", _S.read(_v106, "y"), _S.read(_v106, "oy")))
			if _S.truth(_S.binary(">=", _S.read(_v106, "ly"), 0)):
				break
			_S.define(_v106, "upRim", _S.binary("*", _S.invoke(_S.read(_v106, "Math"), "exp", [_S.binary("/", _S.read(_v106, "ly"), 17)]), _S.read(_v106, "k")))
			_S.define(_v106, "upPlane", _S.binary("*", _S.invoke(_S.read(_v106, "Math"), "exp", [_S.binary("/", _S.read(_v106, "ly"), 19)]), _S.read(_v106, "k")))
			var _v107 = _S.scope(_v106)
			_S.define(_v107, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v107, "x"), _S.read(_v107, "W"))):
				var _v108 = _S.scope(_v107)
				_S.define(_v108, "i", _S.binary("+", _S.binary("*", _S.read(_v108, "y"), _S.read(_v108, "W")), _S.read(_v108, "x")))
				_S.define(_v108, "pt", _S.prop(_S.prop(_S.read(_v108, "BEAST"), "part"), _S.read(_v108, "i")))
				if _S.truth(_S.logical("||", _S.unary("!", _S.read(_v108, "pt")), func(): return _S.call_value(_S.read(_v108, "gone"), [_S.read(_v108, "x"), _S.read(_v108, "y")]))):
					_v107 = _S.iteration(_v107)
					_S.write(_v107, "x", 1, "+=", true)
					continue
				_S.define(_v108, "ramp", (_S.read(_v108, "HR") if _S.truth(_S.binary("===", _S.read(_v108, "pt"), 2)) else _S.read(_v108, "SH")))
				_S.define(_v108, "a", _S.prop(_S.prop(_S.read(_v108, "BEAST"), "amb"), _S.read(_v108, "i")))
				_S.define(_v108, "si", (0 if _S.truth(_S.prop(_S.prop(_S.read(_v108, "BEAST"), "crease"), _S.read(_v108, "i"))) else (4 if _S.truth(_S.binary(">", _S.read(_v108, "a"), 0.74)) else (3 if _S.truth(_S.binary(">", _S.read(_v108, "a"), 0.56)) else (2 if _S.truth(_S.binary(">", _S.read(_v108, "a"), 0.36)) else 1)))))
				if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v108, "pt"), 2), func(): return _S.binary(">", _S.read(_v108, "si"), 0))):
					_S.write(_v108, "si", _S.invoke(_S.read(_v108, "Math"), "min", [4, _S.binary("+", _S.read(_v108, "si"), (2 if _S.truth(_S.binary("<", _S.read(_v108, "y"), 3)) else 1))]), "=", false)
				_S.define(_v108, "Lr", _S.binary("*", _S.prop(_S.prop(_S.read(_v108, "BEAST"), "rim"), _S.read(_v108, "i")), _S.read(_v108, "upRim")))
				_S.define(_v108, "Lp", _S.binary("*", _S.binary("*", _S.prop(_S.prop(_S.read(_v108, "BEAST"), "down"), _S.read(_v108, "i")), _S.read(_v108, "upPlane")), 0.6))
				_S.define(_v108, "c", _S.prop(_S.read(_v108, "ramp"), _S.read(_v108, "si")))
				if _S.truth(_S.binary(">", _S.read(_v108, "Lr"), 0.7)):
					_S.write(_v108, "c", _S.prop(_S.read(_v108, "C"), 5), "=", false)
				else:
					if _S.truth(_S.binary(">", _S.read(_v108, "Lr"), 0.48)):
						_S.write(_v108, "c", _S.prop(_S.read(_v108, "C"), 4), "=", false)
					else:
						if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v108, "Lr"), 0.3), func(): return _S.binary(">", _S.read(_v108, "Lp"), 0.42))):
							_S.write(_v108, "c", _S.prop(_S.read(_v108, "C"), 3), "=", false)
						else:
							if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v108, "Lr"), 0.17), func(): return _S.binary(">", _S.read(_v108, "Lp"), 0.26))):
								_S.write(_v108, "c", _S.call_value(_S.read(_v108, "mix"), [_S.prop(_S.read(_v108, "C"), 2), _S.prop(_S.read(_v108, "ramp"), _S.read(_v108, "si")), 0.3]), "=", false)
							else:
								if _S.truth(_S.logical("||", _S.binary(">", _S.read(_v108, "Lr"), 0.08), func(): return _S.binary(">", _S.read(_v108, "Lp"), 0.12))):
									_S.write(_v108, "c", _S.call_value(_S.read(_v108, "mix"), [_S.prop(_S.read(_v108, "ramp"), _S.read(_v108, "si")), _S.prop(_S.read(_v108, "C"), 1), 0.6]), "=", false)
				_S.invoke(_S.read(_v108, "p"), "px", [_S.binary("+", _S.read(_v108, "x0"), _S.read(_v108, "x")), _S.read(_v108, "ly"), _S.read(_v108, "c")])
				_v107 = _S.iteration(_v107)
				_S.write(_v107, "x", 1, "+=", true)
			_v105 = _S.iteration(_v105)
			_S.write(_v105, "y", 1, "+=", true)
		for _v109 in _S.array(_S.prop(_S.read(_v101, "BEAST"), "tusks")):
			var _v110 = _S.scope(_v101)
			var _v111 = _v109
			_S.define(_v110, "x", _S.prop(_v111, 0))
			_S.define(_v110, "y", _S.prop(_v111, 1))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.read(_v110, "y"), _S.read(_v110, "oy")), 0), func(): return _S.unary("!", _S.call_value(_S.read(_v110, "gone"), [_S.read(_v110, "x"), _S.read(_v110, "y")])))):
				_S.invoke(_S.read(_v110, "p"), "px", [_S.binary("+", _S.read(_v110, "x0"), _S.read(_v110, "x")), _S.binary("+", _S.read(_v110, "y"), _S.read(_v110, "oy")), _S.call_value(_S.read(_v110, "mix"), [_S.prop(_S.read(_v110, "HR"), 4), _S.prop(_S.read(_v110, "C"), 4), _S.binary("*", 0.35, _S.read(_v110, "k"))])])
		for _v112 in _S.array(_S.prop(_S.read(_v101, "BEAST"), "eyes")):
			var _v113 = _S.scope(_v101)
			var _v114 = _v112
			_S.define(_v113, "x", _S.prop(_v114, 0))
			_S.define(_v113, "y", _S.prop(_v114, 1))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("+", _S.read(_v113, "y"), _S.read(_v113, "oy")), 0), func(): return _S.unary("!", _S.call_value(_S.read(_v113, "gone"), [_S.read(_v113, "x"), _S.read(_v113, "y")])))):
				_S.invoke(_S.read(_v113, "p"), "px", [_S.binary("+", _S.read(_v113, "x0"), _S.read(_v113, "x")), _S.binary("+", _S.read(_v113, "y"), _S.read(_v113, "oy")), ((_S.read(_v113, "WHITE") if _S.truth(_S.binary("<", _S.read(_v113, "t"), _S.binary("+", _S.read(_v113, "EYES"), 0.1))) else _S.prop(_S.read(_v113, "C"), 6)) if _S.truth(_S.binary(">", _S.read(_v113, "t"), _S.binary("-", _S.read(_v113, "EYES"), 0.05))) else (_S.prop(_S.read(_v113, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v113, "t"), _S.binary("+", _S.read(_v113, "BREAK"), 0.5))) else _S.prop(_S.read(_v113, "SH"), 0)))])
		if _S.truth(_S.binary(">", _S.read(_v101, "t"), _S.binary("-", _S.read(_v101, "EYES"), 0.05))):
			var _v115 = _S.scope(_v101)
			_S.define(_v115, "k", _S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v115, "smooth"), [_S.binary("+", _S.read(_v115, "FADE"), 0.6), _S.binary("+", _S.read(_v115, "FADE"), 1), _S.read(_v115, "t")])), _S.binary("+", 0.85, _S.binary("*", 0.15, _S.invoke(_S.read(_v115, "Math"), "sin", [_S.binary("*", _S.read(_v115, "t"), 13)])))))
			for _v116 in _S.array(_S.prop(_S.read(_v115, "BEAST"), "glints")):
				var _v117 = _S.scope(_v115)
				var _v118 = _v116
				_S.define(_v117, "ex", _S.prop(_v118, 0))
				_S.define(_v117, "ey0", _S.prop(_v118, 1))
				var _v119 = _S.scope(_v117)
				_S.define(_v119, "ey", _S.binary("+", _S.read(_v119, "ey0"), _S.read(_v119, "off")))
				if _S.truth(_S.binary(">=", _S.read(_v119, "ey"), 0)):
					continue
				_S.invoke(_S.read(_v119, "p"), "glow", [_S.binary("+", _S.read(_v119, "ex"), 0.5), _S.read(_v119, "ey"), 6, _S.prop(_S.read(_v119, "C"), 5), _S.binary("*", 0.5, _S.read(_v119, "k"))])
				_S.define(_v119, "g", _S.binary("/", _S.binary("-", _S.read(_v119, "t"), _S.read(_v119, "EYES")), 0.3))
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v119, "g"), 0), func(): return _S.binary("<", _S.read(_v119, "g"), 1))):
					var _v120 = _S.scope(_v119)
					_S.define(_v120, "L", _S.binary("*", 9, _S.invoke(_S.read(_v120, "Math"), "pow", [_S.binary("-", 1, _S.read(_v120, "g")), 1.5])))
					_S.invoke(_S.read(_v120, "p"), "line", [_S.binary("-", _S.read(_v120, "ex"), _S.read(_v120, "L")), _S.read(_v120, "ey"), _S.binary("+", _S.read(_v120, "ex"), _S.read(_v120, "L")), _S.read(_v120, "ey"), _S.function_value(_v120, "_f24")])
					if _S.truth(_S.binary("<", _S.read(_v120, "g"), 0.4)):
						_S.invoke(_S.read(_v120, "p"), "line", [_S.read(_v120, "ex"), _S.binary("-", _S.read(_v120, "ey"), _S.binary("*", 2, _S.binary("-", 1, _S.read(_v120, "g")))), _S.read(_v120, "ex"), _S.binary("+", _S.read(_v120, "ey"), _S.binary("*", 2, _S.binary("-", 1, _S.read(_v120, "g")))), _S.prop(_S.read(_v120, "C"), 6)])
				else:
					if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v119, "fade"), 0.6), func(): return _S.binary(">", _S.read(_v119, "k"), 0.05))):
						_S.invoke(_S.read(_v119, "p"), "px", [_S.read(_v119, "ex"), _S.read(_v119, "ey"), _S.prop(_S.read(_v119, "C"), 6)])
		_S.invoke(_S.read(_v101, "p"), "glow", [0, _S.unary("-", 6), 30, _S.prop(_S.read(_v101, "C"), 4), _S.binary("*", _S.binary("*", 0.25, _S.read(_v101, "h")), _S.read(_v101, "r"))])
	_S.invoke(_S.read(_e, "rocks"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.binary(">", _S.read(_e, "fade"), 0), func(): return _S.binary(">", _S.read(_e, "fade"), _S.binary("+", 0.06, _S.binary("*", 0.86, _S.binary("+", _S.binary("*", 0.55, _S.binary("-", 1, _S.binary("/", _S.read(_e, "y"), _S.read(_e, "H")))), _S.binary("*", 0.45, _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x"), _S.read(_e, "y"), 3])))))))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "u", _S.arg(_args, 0))
	return (_S.read(_e, "WHITE") if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), 0.5)]), 0.18)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "u"), 0.5)]), 0.35)) else _S.prop(_S.read(_e, "C"), 5)))
