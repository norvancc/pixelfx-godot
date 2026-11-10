@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/glitch.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Glitch"}, {"desc": "The hero's signal breaks up in bursts: an RGB split, slices torn sideways, rows smeared out, junk blocks and dead pixels, then snaps back clean."}, {"tags": ["scifi", "glitch", "digital", "corrupt", "hologram", "status", "loop"]}, {"size": [88, 64]}, {"origin": [44, 54]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#14101f", "#3b1f5c", "#ff2e63", "#ff7aa8", "#2ef2ff", "#b4fbff", "#ffffff"]}, {"seed": 7}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TWITCH_A", _S.merge([{"turn": 0.3}, {"lean": 3}, {"crouch": 1}, {"fx": 13}, {"fy": _S.unary("-", 31)}, {"bx": 6}, {"by": _S.unary("-", 14)}, {"hx": 1}]))
	_S.define(_e, "TWITCH_B", _S.merge([{"turn": 1.2}, {"lean": _S.unary("-", 3)}, {"crouch": 0}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 14)}, {"bx": 14}, {"by": _S.unary("-", 31)}, {"hx": _S.unary("-", 1)}]))
	_S.define(_e, "FINE", _S.merge([]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "FINE")], [0.3, _S.read(_e, "TWITCH_A"), "snap"], [0.37, _S.read(_e, "TWITCH_B"), "snap"], [0.44, _S.read(_e, "TWITCH_A"), "snap"], [0.53, _S.read(_e, "FINE"), "snap"], [1.1, _S.read(_e, "TWITCH_B"), "snap"], [1.23, _S.read(_e, "FINE"), "snap"], [1.7, _S.read(_e, "TWITCH_A"), "snap"], [1.8, _S.merge([_S.read(_e, "TWITCH_B"), {"crouch": 3}]), "snap"], [1.9, _S.read(_e, "TWITCH_A"), "snap"], [2, _S.read(_e, "TWITCH_B"), "snap"], [2.07, _S.read(_e, "FINE"), "snap"], [2.4, _S.read(_e, "FINE")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "NF", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "FPS"))]))
	_S.define(_e, "BURSTS", [[9, 16, 0.8], [33, 37, 0.5], [51, 62, 1]])
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f7"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.define(_e, "RED", _S.prop(_S.read(_e, "C"), 2))
	_S.define(_e, "CYAN", _S.prop(_S.read(_e, "C"), 4))
	_S.define(_e, "f", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "FPS")), 0.000001)]), _S.read(_e, "NF")))
	_S.define(_e, "burst", _S.invoke(_S.read(_e, "BURSTS"), "find", [_S.function_value(_e, "_f1")]))
	_S.define(_e, "k", (_S.prop(_S.read(_e, "burst"), 2) if _S.truth(_S.read(_e, "burst")) else 0))
	_S.define(_e, "r", _S.function_value(_e, "_f2"))
	_S.define(_e, "split", (_S.binary("*", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("+", 1, _S.binary("*", _S.binary("*", _S.call_value(_S.read(_e, "r"), [1]), 3), _S.read(_e, "k")))]), (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "r"), [2]), 0.5)) else 1)) if _S.truth(_S.read(_e, "burst")) else 0))
	_S.define(_e, "tears", [])
	if _S.truth(_S.read(_e, "burst")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.binary("+", 1, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.binary("*", _S.call_value(_S.read(_v1, "r"), [3]), 4), _S.read(_v1, "k"))])))):
			_S.invoke(_S.read(_v1, "tears"), "push", [[_S.binary("+", _S.prop(_S.read(_v1, "A"), "y"), _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v1, "r"), [4, _S.read(_v1, "i")]), _S.prop(_S.read(_v1, "A"), "h"))])), _S.binary("+", 1, _S.invoke(_S.read(_v1, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v1, "r"), [5, _S.read(_v1, "i")]), 5)])), _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_v1, "r"), [6, _S.read(_v1, "i")]), 0.5), 16), _S.read(_v1, "k"))]), _S.call_value(_S.read(_v1, "r"), [7, _S.read(_v1, "i")])]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary("<", _S.call_value(_S.read(_e, "r"), [8]), 0.07))):
		_S.invoke(_S.read(_e, "tears"), "push", [[_S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "r"), [9]), _S.prop(_S.read(_e, "A"), "h"))])), 1, (_S.unary("-", 2) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "r"), [10]), 0.5)) else 2), 1]])
	_S.define(_e, "interlace", _S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.call_value(_S.read(_e, "r"), [11]), 0.3)))
	_S.define(_e, "roll", (_S.binary("-", _S.unary("-", 2), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_e, "r"), [13]), 2)])) if _S.truth(_S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.call_value(_S.read(_e, "r"), [12]), 0.15))) else 0))
	_S.define(_e, "poster", _S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.call_value(_S.read(_e, "r"), [14]), _S.binary("*", 0.15, _S.read(_e, "k")))))
	_S.define(_e, "tearAt", _S.function_value(_e, "_f3"))
	_S.define(_e, "bar", _S.binary("-", _S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.binary("%", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration")), 2), _S.binary("+", _S.prop(_S.read(_e, "A"), "h"), 12)), _S.binary("+", _S.prop(_S.read(_e, "A"), "h"), 12))), 6))
	_S.define(_e, "px", _S.function_value(_e, "_f4"))
	if _S.truth(_S.read(_e, "split")):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "my", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "my"), _S.prop(_S.read(_v5, "A"), "h"))):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "mx", 0)
			while _S.truth(_S.binary("<", _S.read(_v6, "mx"), _S.prop(_S.read(_v6, "A"), "w"))):
				var _v7 = _S.scope(_v6)
				if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.prop(_S.read(_v7, "A"), "mask"), "data"), _S.binary("+", _S.binary("*", _S.read(_v7, "my"), _S.prop(_S.read(_v7, "A"), "w")), _S.read(_v7, "mx"))))):
					_v6 = _S.iteration(_v6)
					_S.write(_v6, "mx", 1, "+=", true)
					continue
				_S.define(_v7, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v7, "A"), "y"), _S.read(_v7, "my")), _S.read(_v7, "roll")))
				_S.define(_v7, "tr", _S.call_value(_S.read(_v7, "tearAt"), [_S.binary("+", _S.prop(_S.read(_v7, "A"), "y"), _S.read(_v7, "my"))]))
				_S.define(_v7, "dx", (_S.prop(_S.read(_v7, "tr"), 0) if _S.truth(_S.read(_v7, "tr")) else 0))
				_S.call_value(_S.read(_v7, "px"), [_S.binary("-", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v7, "A"), "x"), _S.read(_v7, "mx")), _S.read(_v7, "dx")), _S.read(_v7, "split")), _S.read(_v7, "y"), _S.read(_v7, "RED")])
				_S.call_value(_S.read(_v7, "px"), [_S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v7, "A"), "x"), _S.read(_v7, "mx")), _S.read(_v7, "dx")), _S.read(_v7, "split")), _S.read(_v7, "y"), _S.read(_v7, "CYAN")])
				_v6 = _S.iteration(_v6)
				_S.write(_v6, "mx", 1, "+=", true)
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "my", 1, "+=", true)
	var _v8 = _S.scope(_e)
	_S.define(_v8, "my", 0)
	while _S.truth(_S.binary("<", _S.read(_v8, "my"), _S.prop(_S.read(_v8, "A"), "h"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "ry", _S.binary("+", _S.prop(_S.read(_v9, "A"), "y"), _S.read(_v9, "my")))
		_S.define(_v9, "y", _S.binary("+", _S.read(_v9, "ry"), _S.read(_v9, "roll")))
		if _S.truth(_S.logical("&&", _S.read(_v9, "interlace"), func(): return _S.binary("&", _S.read(_v9, "my"), 1))):
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "my", 1, "+=", true)
			continue
		_S.define(_v9, "tr", _S.call_value(_S.read(_v9, "tearAt"), [_S.read(_v9, "ry")]))
		_S.define(_v9, "dx", (_S.prop(_S.read(_v9, "tr"), 0) if _S.truth(_S.read(_v9, "tr")) else 0))
		_S.define(_v9, "tint", ((_S.read(_v9, "RED") if _S.truth(_S.binary("<", _S.prop(_S.read(_v9, "tr"), 1), 0.18)) else _S.read(_v9, "CYAN")) if _S.truth(_S.logical("&&", _S.read(_v9, "tr"), func(): return _S.binary("<", _S.prop(_S.read(_v9, "tr"), 1), 0.35))) else 0))
		_S.define(_v9, "near", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.binary("-", _S.read(_v9, "ry"), _S.read(_v9, "bar"))]))
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "mx", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "mx"), _S.prop(_S.read(_v10, "A"), "w"))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "c", _S.prop(_S.prop(_S.read(_v11, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v11, "my"), _S.prop(_S.read(_v11, "A"), "w")), _S.read(_v11, "mx"))))
			if _S.truth(_S.unary("!", _S.read(_v11, "c"))):
				_v10 = _S.iteration(_v10)
				_S.write(_v10, "mx", 1, "+=", true)
				continue
			_S.define(_v11, "col", _S.read(_v11, "c"))
			if _S.truth(_S.read(_v11, "poster")):
				_S.write(_v11, "col", (_S.prop(_S.read(_v11, "C"), 5) if _S.truth(_S.binary(">", _S.call_value(_S.read(_v11, "luma"), [_S.read(_v11, "c")]), 0.32)) else _S.prop(_S.read(_v11, "C"), 1)), "=", false)
			else:
				if _S.truth(_S.read(_v11, "tint")):
					_S.write(_v11, "col", _S.call_value(_S.read(_v11, "mix"), [_S.read(_v11, "c"), _S.read(_v11, "tint"), 0.6]), "=", false)
				else:
					if _S.truth(_S.binary("<", _S.read(_v11, "near"), 1)):
						_S.write(_v11, "col", _S.call_value(_S.read(_v11, "mix"), [_S.read(_v11, "c"), _S.prop(_S.read(_v11, "C"), 5), 0.35]), "=", false)
			_S.call_value(_S.read(_v11, "px"), [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v11, "A"), "x"), _S.read(_v11, "mx")), _S.read(_v11, "dx")), _S.read(_v11, "y"), _S.read(_v11, "col")])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "mx", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v9, "tr"), func(): return _S.binary(">", _S.invoke(_S.read(_v9, "Math"), "abs", [_S.read(_v9, "dx")]), 2)), func(): return _S.binary("<", _S.call_value(_S.read(_v9, "rand"), [_S.read(_v9, "S"), _S.read(_v9, "f"), _S.read(_v9, "ry")]), 0.6))):
			var _v12 = _S.scope(_v9)
			_S.define(_v12, "right", _S.binary(">", _S.read(_v12, "dx"), 0))
			_S.define(_v12, "mx", (_S.binary("-", _S.binary("-", _S.prop(_S.read(_v12, "A"), "w"), 1), _S.invoke(_S.concat([_S.array(_S.call_value(_S.read(_v12, "Array"), [_S.prop(_S.read(_v12, "A"), "w")]))]), "findIndex", [_S.function_value(_v12, "_f5")])) if _S.truth(_S.read(_v12, "right")) else _S.invoke(_S.concat([_S.array(_S.call_value(_S.read(_v12, "Array"), [_S.prop(_S.read(_v12, "A"), "w")]))]), "findIndex", [_S.function_value(_v12, "_f6")])))
			if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v12, "mx"), 0), func(): return _S.binary("<", _S.read(_v12, "mx"), _S.prop(_S.read(_v12, "A"), "w")))):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "c", _S.prop(_S.prop(_S.read(_v13, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v13, "my"), _S.prop(_S.read(_v13, "A"), "w")), _S.read(_v13, "mx"))))
				_S.define(_v13, "L", _S.binary("+", 4, _S.invoke(_S.read(_v13, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v13, "rand"), [_S.read(_v13, "S"), _S.read(_v13, "f"), _S.read(_v13, "ry"), 1]), 10)])))
				var _v14 = _S.scope(_v13)
				_S.define(_v14, "i", 1)
				while _S.truth(_S.binary("<=", _S.read(_v14, "i"), _S.read(_v14, "L"))):
					_S.invoke(_S.read(_v14, "p"), "dot", [_S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v14, "A"), "x"), _S.read(_v14, "mx")), _S.read(_v14, "dx")), (_S.read(_v14, "i") if _S.truth(_S.read(_v14, "right")) else _S.unary("-", _S.read(_v14, "i")))), _S.read(_v14, "y"), _S.read(_v14, "c"), _S.binary("-", 1, _S.binary("/", _S.read(_v14, "i"), _S.binary("+", _S.read(_v14, "L"), 1)))])
					_v14 = _S.iteration(_v14)
					_S.write(_v14, "i", 1, "+=", true)
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "my", 1, "+=", true)
	if _S.truth(_S.read(_e, "roll")):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "my", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "my"), _S.unary("-", _S.read(_v15, "roll")))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "mx", 0)
			while _S.truth(_S.binary("<", _S.read(_v16, "mx"), _S.prop(_S.read(_v16, "A"), "w"))):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "c", _S.prop(_S.prop(_S.read(_v17, "A"), "pixels"), _S.binary("+", _S.binary("*", _S.read(_v17, "my"), _S.prop(_S.read(_v17, "A"), "w")), _S.read(_v17, "mx"))))
				if _S.truth(_S.logical("&&", _S.read(_v17, "c"), func(): return _S.binary("&", _S.binary("+", _S.read(_v17, "mx"), _S.read(_v17, "my")), 1))):
					_S.call_value(_S.read(_v17, "px"), [_S.binary("+", _S.prop(_S.read(_v17, "A"), "x"), _S.read(_v17, "mx")), _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v17, "A"), "y"), _S.prop(_S.read(_v17, "A"), "h")), _S.read(_v17, "roll")), _S.read(_v17, "my")), _S.call_value(_S.read(_v17, "mix"), [_S.read(_v17, "c"), _S.prop(_S.read(_v17, "C"), 1), 0.5])])
				_v16 = _S.iteration(_v16)
				_S.write(_v16, "mx", 1, "+=", true)
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "my", 1, "+=", true)
	if _S.truth(_S.read(_e, "burst")):
		var _v18 = _S.scope(_e)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), _S.binary("+", 2, _S.invoke(_S.read(_v18, "Math"), "floor", [_S.binary("*", _S.binary("*", _S.call_value(_S.read(_v18, "r"), [20]), 5), _S.read(_v18, "k"))])))):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "w", _S.binary("+", 2, _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "r"), [21, _S.read(_v19, "i")]), 9)])))
			_S.define(_v19, "h", _S.binary("+", 1, _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "r"), [22, _S.read(_v19, "i")]), 3)])))
			_S.define(_v19, "x", _S.binary("+", _S.binary("-", _S.prop(_S.read(_v19, "A"), "x"), 6), _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "r"), [23, _S.read(_v19, "i")]), _S.binary("+", _S.prop(_S.read(_v19, "A"), "w"), 12))])))
			_S.define(_v19, "y", _S.binary("+", _S.prop(_S.read(_v19, "A"), "y"), _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "r"), [24, _S.read(_v19, "i")]), _S.prop(_S.read(_v19, "A"), "h"))])))
			_S.define(_v19, "c", _S.prop([_S.read(_v19, "WHITE"), _S.read(_v19, "RED"), _S.read(_v19, "CYAN"), _S.prop(_S.read(_v19, "C"), 5), _S.prop(_S.read(_v19, "C"), 3)], _S.invoke(_S.read(_v19, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v19, "r"), [25, _S.read(_v19, "i")]), 5)])))
			if _S.truth(_S.binary("<", _S.call_value(_S.read(_v19, "r"), [26, _S.read(_v19, "i")]), 0.4)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "yy", 0)
				while _S.truth(_S.binary("<", _S.read(_v20, "yy"), _S.read(_v20, "h"))):
					var _v21 = _S.scope(_v20)
					_S.define(_v21, "xx", 0)
					while _S.truth(_S.binary("<", _S.read(_v21, "xx"), _S.read(_v21, "w"))):
						_S.invoke(_S.read(_v21, "p"), "px", [_S.binary("+", _S.read(_v21, "x"), _S.read(_v21, "xx")), _S.binary("+", _S.read(_v21, "y"), _S.read(_v21, "yy")), (_S.read(_v21, "c") if _S.truth(_S.binary("&", _S.binary("+", _S.read(_v21, "xx"), _S.read(_v21, "yy")), 1)) else _S.prop(_S.read(_v21, "C"), 0))])
						_v21 = _S.iteration(_v21)
						_S.write(_v21, "xx", 1, "+=", true)
					_v20 = _S.iteration(_v20)
					_S.write(_v20, "yy", 1, "+=", true)
			else:
				_S.invoke(_S.read(_v19, "p"), "rect", [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.read(_v19, "w"), _S.read(_v19, "h"), _S.read(_v19, "c")])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
	for _v22 in _S.array(_S.read(_e, "BURSTS")):
		var _v23 = _S.scope(_e)
		var _v24 = _v22
		_S.define(_v23, "a", _S.prop(_v24, 0))
		_S.define(_v23, "b", _S.prop(_v24, 1))
		_S.define(_v23, "kk", _S.prop(_v24, 2))
		var _v25 = _S.scope(_v23)
		_S.define(_v25, "age", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v25, "f"), _S.read(_v25, "a")), _S.read(_v25, "NF")), _S.read(_v25, "NF")))
		if _S.truth(_S.binary(">", _S.read(_v25, "age"), _S.binary("+", _S.binary("-", _S.read(_v25, "b"), _S.read(_v25, "a")), 8))):
			continue
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v26, "i"), _S.binary("*", 10, _S.read(_v26, "kk")))):
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "life", _S.binary("+", 4, _S.invoke(_S.read(_v27, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v27, "rand"), [_S.read(_v27, "S"), _S.read(_v27, "a"), _S.read(_v27, "i")]), 6)])))
			_S.define(_v27, "at", _S.invoke(_S.read(_v27, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v27, "rand"), [_S.read(_v27, "S"), _S.read(_v27, "a"), _S.read(_v27, "i"), 1]), _S.binary("+", _S.binary("-", _S.read(_v27, "b"), _S.read(_v27, "a")), 1))]))
			_S.define(_v27, "q", _S.binary("-", _S.read(_v27, "age"), _S.read(_v27, "at")))
			if _S.truth(_S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v27, "q"), 0), func(): return _S.binary(">", _S.read(_v27, "q"), _S.read(_v27, "life"))), func(): return _S.logical("&&", _S.binary(">", _S.read(_v27, "q"), _S.binary("/", _S.read(_v27, "life"), 2)), func(): return _S.binary("&", _S.read(_v27, "q"), 1)))):
				_v26 = _S.iteration(_v26)
				_S.write(_v26, "i", 1, "+=", true)
				continue
			_S.define(_v27, "x0", _S.binary("+", _S.prop(_S.read(_v27, "A"), "x"), _S.binary("*", _S.call_value(_S.read(_v27, "rand"), [_S.read(_v27, "S"), _S.read(_v27, "a"), _S.read(_v27, "i"), 2]), _S.prop(_S.read(_v27, "A"), "w"))))
			_S.define(_v27, "y0", _S.binary("+", _S.prop(_S.read(_v27, "A"), "y"), _S.binary("*", _S.call_value(_S.read(_v27, "rand"), [_S.read(_v27, "S"), _S.read(_v27, "a"), _S.read(_v27, "i"), 3]), _S.prop(_S.read(_v27, "A"), "h"))))
			_S.define(_v27, "side", (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v27, "rand"), [_S.read(_v27, "S"), _S.read(_v27, "a"), _S.read(_v27, "i"), 4]), 0.5)) else 1))
			_S.invoke(_S.read(_v27, "p"), "px", [_S.binary("+", _S.read(_v27, "x0"), _S.binary("*", _S.binary("*", _S.read(_v27, "side"), _S.read(_v27, "q")), _S.binary("+", 1, _S.binary("*", _S.call_value(_S.read(_v27, "rand"), [_S.read(_v27, "S"), _S.read(_v27, "a"), _S.read(_v27, "i"), 5]), 2)))), _S.binary("-", _S.read(_v27, "y0"), _S.binary("*", _S.read(_v27, "q"), 0.5)), _S.prop([_S.read(_v27, "WHITE"), _S.read(_v27, "RED"), _S.read(_v27, "CYAN")], _S.binary("%", _S.read(_v27, "i"), 3))])
			_v26 = _S.iteration(_v26)
			_S.write(_v26, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "burst")):
		var _v28 = _S.scope(_e)
		if _S.truth(_S.binary("===", _S.read(_v28, "f"), _S.prop(_S.read(_v28, "burst"), 0))):
			_S.invoke(_S.read(_v28, "p"), "glow", [_S.binary("+", _S.prop(_S.read(_v28, "A"), "x"), _S.binary("/", _S.prop(_S.read(_v28, "A"), "w"), 2)), _S.binary("+", _S.prop(_S.read(_v28, "A"), "y"), _S.binary("/", _S.prop(_S.read(_v28, "A"), "h"), 2)), 26, _S.prop(_S.read(_v28, "C"), 5), 0.4])
		_S.invoke(_S.read(_v28, "p"), "glow", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v28, "A"), "x"), _S.binary("/", _S.prop(_S.read(_v28, "A"), "w"), 2)), _S.binary("*", _S.read(_v28, "split"), 4)), _S.binary("+", _S.prop(_S.read(_v28, "A"), "y"), _S.binary("/", _S.prop(_S.read(_v28, "A"), "h"), 2)), 18, _S.read(_v28, "RED"), _S.binary("*", 0.18, _S.read(_v28, "k"))])
		_S.invoke(_S.read(_v28, "p"), "glow", [_S.binary("+", _S.binary("+", _S.prop(_S.read(_v28, "A"), "x"), _S.binary("/", _S.prop(_S.read(_v28, "A"), "w"), 2)), _S.binary("*", _S.read(_v28, "split"), 4)), _S.binary("+", _S.prop(_S.read(_v28, "A"), "y"), _S.binary("/", _S.prop(_S.read(_v28, "A"), "h"), 2)), 18, _S.read(_v28, "CYAN"), _S.binary("*", 0.18, _S.read(_v28, "k"))])
	if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "bar"), _S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.binary("/", _S.prop(_S.read(_e, "A"), "h"), 2)))]), _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "A"), "h"), 2), 3))):
		_S.invoke(_S.read(_e, "p"), "glowLine", [_S.binary("-", _S.prop(_S.read(_e, "A"), "x"), 2), _S.read(_e, "bar"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "w")), 2), _S.read(_e, "bar"), 4, _S.prop(_S.read(_e, "C"), 4), 0.12])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _tuple_0 = _S.arg(_args,0)
	var _n_a_b0 = _S.prop(_tuple_0,0)
	var _n_b_b1 = _S.prop(_tuple_0,1)
	return ((_n_f <= _n_b_b1) if _S.truth((_n_f >= _n_a_b0)) else (_n_f >= _n_a_b0))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "n", _args.slice(0))
	return _S.call_value(_S.read(_e, "rand"), _S.concat([[_S.read(_e, "S")], [_S.read(_e, "f")], _S.array(_S.read(_e, "n"))]))

static func _f3(_parent,_args:Array,_this=null):
	var _n_tears = _S.read(_parent,"tears")
	var _n_y_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_tears):
		var _tuple_1 = _iter_0
		var _n_y0_b1 = _S.prop(_tuple_1,0)
		var _n_h_b2 = _S.prop(_tuple_1,1)
		var _n_dx_b3 = _S.prop(_tuple_1,2)
		var _n_tint_b4 = _S.prop(_tuple_1,3)
		if _S.truth(((_n_y_b0 < (_n_y0_b1 + _n_h_b2)) if _S.truth((_n_y_b0 >= _n_y0_b1)) else (_n_y_b0 >= _n_y0_b1))):
			return [_n_dx_b3, _n_tint_b4]
	return null
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	return _S.invoke(_n_p,"px",[_n_x_b0, _n_y_b1, _n_c_b2])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_my = _S.read(_parent,"my")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((((_n_my * _S.named_value(_n_A,"w")) + _S.named_value(_n_A,"w")) - 1) - _n_i_b1))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_my = _S.read(_parent,"my")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((_n_my * _S.named_value(_n_A,"w")) + _n_i_b1))
	return null

static func _f7(_parent,_args:Array,_this=null):
	return 0
	return null
