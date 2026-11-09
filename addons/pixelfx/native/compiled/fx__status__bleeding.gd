@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/status/bleeding.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "shape", _S.import_value("fx/status/_lib.js", "shape"))
	_S.define(_e, "travel", _S.import_value("fx/status/_lib.js", "travel"))
	_S.define(_e, "wounds", _S.function_value(_e, "_f0"))
	_S.define(_e, "drop", _S.function_value(_e, "_f4"))
	_S.define(_e, "splat", _S.function_value(_e, "_f5"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f7"))
	_S.define(_e, "meta", _S.merge([{"name": "Bleeding"}, {"desc": "Bleeding out: beads swell at three wounds, run, let go and fall to spatter into a glossy pool that ripples; each heartbeat spurts a little and flashes the body red."}, {"tags": ["status", "bleed", "blood", "dot", "debuff", "wound", "loop"]}, {"size": [60, 56]}, {"origin": [30, 46]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#350711", "#5e0c1b", "#931327", "#c71e33", "#f2384a", "#ff8a7a"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CLUTCH", _S.merge([{"turn": 0.7}, {"crouch": 3}, {"lean": 2}, {"fx": 2}, {"fy": _S.unary("-", 21)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": 3}, {"fbx": _S.unary("-", 3)}]))
	_S.define(_e, "BEAT_", _S.merge([_S.read(_e, "CLUTCH"), {"crouch": 5}, {"lean": 4}, {"hy": 1}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "BEAT_")], [0.18, _S.read(_e, "CLUTCH")], [1.2, _S.read(_e, "CLUTCH")], [1.2, _S.read(_e, "BEAT_"), "snap"], [1.38, _S.read(_e, "CLUTCH")], [2.4, _S.read(_e, "CLUTCH")], [2.4, _S.read(_e, "BEAT_"), "snap"]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "BEAT", _S.binary("/", _S.read(_e, "D"), 2))
	_S.define(_e, "G", 900)
	_S.define(_e, "WOUNDS", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "w", _S.invoke(_S.read(_e, "WOUNDS"), "get", [_S.prop(_S.read(_e, "a"), "mask")]))
	if _S.truth(_S.read(_e, "w")):
		return _S.read(_e, "w")
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "S"), "h"))
	_S.define(_e, "W", _S.prop(_S.read(_e, "S"), "w"))
	_S.define(_e, "make", _S.function_value(_e, "_f1"))
	_S.define(_e, "edge", _S.function_value(_e, "_f2"))
	_S.define(_e, "front", _S.logical("??", _S.prop(_S.invoke(_S.prop(_S.read(_e, "S"), "body"), "filter", [_S.function_value(_e, "_f3")]), 0), func(): return _S.call_value(_S.read(_e, "edge"), [0.55, 1])))
	_S.write(_e, "w", [_S.call_value(_S.read(_e, "make"), _S.concat([_S.array(_S.call_value(_S.read(_e, "edge"), [0.57, _S.unary("-", 1)])), [3], [0]])), _S.call_value(_S.read(_e, "make"), _S.concat([_S.array(_S.read(_e, "front")), [2], [0.35]])), _S.call_value(_S.read(_e, "make"), _S.concat([_S.array(_S.call_value(_S.read(_e, "edge"), [0.6, 1])), [2], [0.7]]))], "=", false)
	_S.invoke(_S.read(_e, "WOUNDS"), "set", [_S.prop(_S.read(_e, "a"), "mask"), _S.read(_e, "w")])
	return _S.read(_e, "w")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	_S.define(_e, "drops", _S.arg(_args, 2))
	_S.define(_e, "phase", _S.arg(_args, 3))
	_S.define(_e, "run", 1)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "run"), 3), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "mx"), _S.binary("+", _S.binary("+", _S.read(_e, "my"), _S.read(_e, "run")), 1)]))):
		_S.write(_e, "run", 1, "+=", true)
	return _S.merge([{"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "x"), _S.read(_e, "mx")), 0.5)}, {"mx": _S.read(_e, "mx")}, {"y0": _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "my"))}, {"yb": _S.binary("+", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "a"), "y"), _S.read(_e, "my")), _S.read(_e, "run")), 1)}, {"drops": _S.read(_e, "drops")}, {"phase": _S.read(_e, "phase")}, {"side": (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.read(_e, "mx"), _S.binary("/", _S.read(_e, "W"), 2))) else 1)}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "side", _S.arg(_args, 1))
	_S.define(_e, "my", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), _S.read(_e, "q"))]))
	var _v0 = _S.prop(_S.prop(_S.read(_e, "S"), "rows"), _S.read(_e, "my"))
	_S.define(_e, "l", _S.prop(_v0, 0))
	_S.define(_e, "r", _S.prop(_v0, 1))
	return [(_S.binary("+", _S.read(_e, "l"), 1) if _S.truth(_S.binary("<", _S.read(_e, "side"), 0)) else _S.binary("-", _S.read(_e, "r"), 1)), _S.read(_e, "my")]

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v1 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v1, 0))
	_S.define(_e, "y", _S.prop(_v1, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.5)), func(): return _S.binary("<", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "H"), 0.62))), func(): return _S.binary(">", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "W"), 0.55))), func(): return _S.binary("<", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "W"), 0.75))), func(): return _S.invoke(_S.read(_e, "S"), "on", [_S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), 3)]))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "y", _S.arg(_args, 3))
	_S.define(_e, "v", _S.arg(_args, 4))
	_S.define(_e, "s", _S.arg(_args, 5))
	_S.define(_e, "tail", _S.invoke(_S.read(_e, "Math"), "min", [5, _S.binary("*", _S.read(_e, "v"), 0.012)]))
	if _S.truth(_S.binary(">=", _S.read(_e, "tail"), 1)):
		_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), _S.read(_e, "tail")), _S.read(_e, "x"), _S.binary("-", _S.read(_e, "y"), 1), (_S.prop(_S.read(_e, "C"), 3) if _S.truth(_S.binary(">=", _S.read(_e, "s"), 2)) else _S.prop(_S.read(_e, "C"), 2))])
	if _S.truth(_S.binary(">=", _S.read(_e, "s"), 2)):
		var _v2 = _S.scope(_e)
		_S.invoke(_S.read(_v2, "p"), "px", [_S.read(_v2, "x"), _S.read(_v2, "y"), _S.prop(_S.read(_v2, "C"), 5)])
		_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.read(_v2, "x"), 1), _S.read(_v2, "y"), _S.prop(_S.read(_v2, "C"), 4)])
		_S.invoke(_S.read(_v2, "p"), "px", [_S.read(_v2, "x"), _S.binary("+", _S.read(_v2, "y"), 1), _S.prop(_S.read(_v2, "C"), 3)])
		_S.invoke(_S.read(_v2, "p"), "px", [_S.binary("+", _S.read(_v2, "x"), 1), _S.binary("+", _S.read(_v2, "y"), 1), _S.prop(_S.read(_v2, "C"), 2)])
	else:
		_S.invoke(_S.read(_e, "p"), "px", [_S.read(_e, "x"), _S.read(_e, "y"), _S.prop(_S.read(_e, "C"), 4)])
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "ground", _S.arg(_args, 3))
	_S.define(_e, "age", _S.arg(_args, 4))
	_S.define(_e, "big", _S.arg(_args, 5))
	_S.define(_e, "seed", _S.arg(_args, 6))
	_S.define(_e, "life", _S.binary("*", _S.read(_e, "D"), 0.85))
	if _S.truth(_S.logical("||", _S.binary("<", _S.read(_e, "age"), 0), func(): return _S.binary(">", _S.read(_e, "age"), _S.read(_e, "life")))):
		return null
	_S.define(_e, "spread", _S.call_value(_S.read(_e, "smooth"), [0, 0.1, _S.read(_e, "age")]))
	_S.define(_e, "hw", _S.binary("*", (2.2 if _S.truth(_S.read(_e, "big")) else 1.4), _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_e, "spread")))))
	_S.define(_e, "fade", _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "life"), 0.5), _S.read(_e, "life"), _S.read(_e, "age")])))
	_S.define(_e, "dry", (4 if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.35)) else (3 if _S.truth(_S.binary("<", _S.read(_e, "age"), 1)) else 2)))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "xx", _S.invoke(_S.read(_v3, "Math"), "floor", [_S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "hw"))]))
	while _S.truth(_S.binary("<=", _S.read(_v3, "xx"), _S.invoke(_S.read(_v3, "Math"), "ceil", [_S.binary("+", _S.read(_v3, "x"), _S.read(_v3, "hw"))]))):
		_S.invoke(_S.read(_v3, "p"), "dot", [_S.read(_v3, "xx"), _S.binary("-", _S.read(_v3, "ground"), 1), (_S.prop(_S.read(_v3, "C"), _S.binary("-", _S.read(_v3, "dry"), 1)) if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v3, "xx"), 0.5), _S.read(_v3, "x"))]), _S.binary("*", _S.read(_v3, "hw"), 0.75))) else _S.prop(_S.read(_v3, "C"), _S.read(_v3, "dry"))), _S.read(_v3, "fade")])
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "xx", 1, "+=", true)
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.3)):
		_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "x"), 0.5), _S.binary("-", _S.read(_e, "ground"), 1), _S.prop(_S.read(_e, "C"), 5)])
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.4)):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "j"), (3 if _S.truth(_S.read(_v4, "big")) else 2))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "vx", _S.binary("*", (1 if _S.truth(_S.binary("%", _S.read(_v5, "j"), 2)) else _S.unary("-", 1)), _S.binary("+", 18, _S.binary("*", 24, _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "seed"), _S.read(_v5, "j"), 1])))))
			_S.define(_v5, "vy", _S.unary("-", _S.binary("+", 40, _S.binary("*", 40, _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "seed"), _S.read(_v5, "j"), 2])))))
			_S.define(_v5, "tt", _S.read(_v5, "age"))
			_S.define(_v5, "dx", _S.binary("*", _S.read(_v5, "vx"), _S.read(_v5, "tt")))
			_S.define(_v5, "dy", _S.binary("+", _S.binary("*", _S.read(_v5, "vy"), _S.read(_v5, "tt")), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v5, "G")), _S.read(_v5, "tt")), _S.read(_v5, "tt"))))
			if _S.truth(_S.binary("<=", _S.read(_v5, "dy"), 0)):
				_S.invoke(_S.read(_v5, "p"), "px", [_S.binary("+", _S.read(_v5, "x"), _S.read(_v5, "dx")), _S.binary("+", _S.binary("-", _S.read(_v5, "ground"), 1), _S.read(_v5, "dy")), (_S.prop(_S.read(_v5, "C"), 3) if _S.truth(_S.read(_v5, "j")) else _S.prop(_S.read(_v5, "C"), 4))])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "j", 1, "+=", true)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "wounds"), [_S.read(_e, "a")]))
	_S.define(_e, "px", _S.binary("-", _S.binary("/", _S.binary("+", _S.prop(_S.prop(_S.read(_e, "W"), 0), "x"), _S.prop(_S.prop(_S.read(_e, "W"), 2), "x")), 2), 1))
	_S.define(_e, "rx", 6.5)
	_S.define(_e, "beat", _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("/", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")), 0.25))]))
	var _v6 = _S.scope(_e)
	_S.define(_v6, "x", _S.invoke(_S.read(_v6, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_v6, "px"), _S.read(_v6, "rx")), 1)]))
	while _S.truth(_S.binary("<=", _S.read(_v6, "x"), _S.binary("+", _S.binary("+", _S.read(_v6, "px"), _S.read(_v6, "rx")), 1))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "q", _S.binary("/", _S.invoke(_S.read(_v7, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v7, "x"), 0.5), _S.read(_v7, "px"))]), _S.read(_v7, "rx")))
		if _S.truth(_S.binary(">", _S.read(_v7, "q"), 1.1)):
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "x", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.unary("-", 1), (_S.prop(_S.read(_v7, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v7, "q"), 0.85)) else _S.prop(_S.read(_v7, "C"), 1))])
		if _S.truth(_S.binary("<", _S.read(_v7, "q"), 0.8)):
			_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), 0, (_S.prop(_S.read(_v7, "C"), 1) if _S.truth(_S.binary("<", _S.read(_v7, "q"), 0.5)) else _S.prop(_S.read(_v7, "C"), 0))])
		if _S.truth(_S.binary("<", _S.read(_v7, "q"), 0.45)):
			_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), 1, _S.prop(_S.read(_v7, "C"), 0)])
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "px"), 2), _S.unary("-", 1), _S.prop(_S.read(_e, "C"), 4)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("-", _S.read(_e, "px"), 1), _S.unary("-", 1), _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "p"), "px", [_S.binary("+", _S.read(_e, "px"), 3), _S.unary("-", 1), _S.prop(_S.read(_e, "C"), 3)])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "px"), _S.unary("-", 1), 8, _S.prop(_S.read(_e, "C"), 3), _S.binary("+", 0.06, _S.binary("*", 0.04, _S.read(_e, "beat")))])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "a", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "wounds"), [_S.read(_e, "a")]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "shape"), [_S.read(_e, "a")]))
	_S.define(_e, "ph", _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "t"), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")), _S.read(_e, "BEAT")))
	_S.define(_e, "hurt", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.read(_e, "ph"), 0.12))]))
	if _S.truth(_S.binary(">", _S.read(_e, "hurt"), 0)):
		for _v8 in _S.array(_S.prop(_S.read(_e, "S"), "body")):
			var _v9 = _S.scope(_e)
			var _v10 = _v8
			_S.define(_v9, "mx", _S.prop(_v10, 0))
			_S.define(_v9, "my", _S.prop(_v10, 1))
			_S.invoke(_S.read(_v9, "p"), "blend", [_S.binary("+", _S.prop(_S.read(_v9, "a"), "x"), _S.read(_v9, "mx")), _S.binary("+", _S.prop(_S.read(_v9, "a"), "y"), _S.read(_v9, "my")), _S.prop(_S.read(_v9, "C"), 4), _S.binary("*", 0.26, _S.read(_v9, "hurt"))])
	for _v11 in _S.array(_S.read(_e, "W")):
		var _v12 = _S.scope(_e)
		_S.define(_v12, "w", _v11)
		var _v13 = _S.scope(_v12)
		_S.invoke(_S.read(_v13, "p"), "px", [_S.prop(_S.read(_v13, "w"), "x"), _S.binary("-", _S.prop(_S.read(_v13, "w"), "y0"), 1), _S.prop(_S.read(_v13, "C"), 1)])
		_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v13, "w"), "x"), _S.prop(_S.read(_v13, "w"), "side")), _S.binary("-", _S.prop(_S.read(_v13, "w"), "y0"), 1), _S.prop(_S.read(_v13, "C"), 0)])
		_S.invoke(_S.read(_v13, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v13, "w"), "x"), _S.prop(_S.read(_v13, "w"), "side")), _S.prop(_S.read(_v13, "w"), "y0"), _S.prop(_S.read(_v13, "C"), 2)])
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "y", _S.prop(_S.read(_v14, "w"), "y0"))
		while _S.truth(_S.binary("<", _S.read(_v14, "y"), _S.prop(_S.read(_v14, "w"), "yb"))):
			_S.invoke(_S.read(_v14, "p"), "px", [_S.prop(_S.read(_v14, "w"), "x"), _S.read(_v14, "y"), (_S.prop(_S.read(_v14, "C"), 4) if _S.truth(_S.binary("===", _S.read(_v14, "y"), _S.prop(_S.read(_v14, "w"), "y0"))) else (_S.prop(_S.read(_v14, "C"), 3) if _S.truth(_S.binary(">=", _S.read(_v14, "y"), _S.binary("-", _S.prop(_S.read(_v14, "w"), "yb"), 1))) else _S.prop(_S.read(_v14, "C"), 2)))])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "y", 1, "+=", true)
		_S.define(_v13, "period", _S.binary("/", _S.read(_v13, "D"), _S.prop(_S.read(_v13, "w"), "drops")))
		var _v15 = _S.scope(_v13)
		_S.define(_v15, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "k"), _S.prop(_S.read(_v15, "w"), "drops"))):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "born", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v16, "w"), "phase"), _S.read(_v16, "period")), _S.binary("*", _S.read(_v16, "k"), _S.read(_v16, "period"))))
			_S.define(_v16, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.read(_v16, "t"), _S.read(_v16, "born")), _S.read(_v16, "D")), _S.read(_v16, "D")), _S.read(_v16, "D")))
			_S.define(_v16, "swell", _S.binary("*", _S.read(_v16, "period"), 0.62))
			_S.define(_v16, "big", _S.binary("===", _S.binary("%", _S.binary("+", _S.read(_v16, "k"), _S.prop(_S.read(_v16, "w"), "mx")), 2), 0))
			_S.define(_v16, "fallH", _S.invoke(_S.read(_v16, "Math"), "max", [1, _S.binary("-", _S.unary("-", 1), _S.prop(_S.read(_v16, "w"), "yb"))]))
			_S.define(_v16, "fall", _S.invoke(_S.read(_v16, "Math"), "sqrt", [_S.binary("/", _S.binary("*", 2, _S.read(_v16, "fallH")), _S.read(_v16, "G"))]))
			_S.define(_v16, "ground", 0)
			if _S.truth(_S.binary("<", _S.read(_v16, "age"), _S.read(_v16, "swell"))):
				var _v17 = _S.scope(_v16)
				_S.define(_v17, "u", _S.binary("/", _S.read(_v17, "age"), _S.read(_v17, "swell")))
				_S.define(_v17, "len", (1 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.35)) else (2 if _S.truth(_S.binary("<", _S.read(_v17, "u"), 0.75)) else 3)))
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "j", 0)
				while _S.truth(_S.binary("<", _S.read(_v18, "j"), _S.read(_v18, "len"))):
					_S.invoke(_S.read(_v18, "p"), "px", [_S.prop(_S.read(_v18, "w"), "x"), _S.binary("+", _S.prop(_S.read(_v18, "w"), "yb"), _S.read(_v18, "j")), (_S.prop(_S.read(_v18, "C"), 2) if _S.truth(_S.binary("===", _S.read(_v18, "j"), _S.binary("-", _S.read(_v18, "len"), 1))) else _S.prop(_S.read(_v18, "C"), 3))])
					_v18 = _S.iteration(_v18)
					_S.write(_v18, "j", 1, "+=", true)
				if _S.truth(_S.binary("===", _S.read(_v17, "len"), 3)):
					_S.invoke(_S.read(_v17, "p"), "px", [_S.binary("-", _S.prop(_S.read(_v17, "w"), "x"), 1), _S.binary("+", _S.prop(_S.read(_v17, "w"), "yb"), 2), _S.prop(_S.read(_v17, "C"), 1)])
				_S.invoke(_S.read(_v17, "p"), "px", [_S.prop(_S.read(_v17, "w"), "x"), _S.binary("-", _S.binary("+", _S.prop(_S.read(_v17, "w"), "yb"), _S.read(_v17, "len")), 2), (_S.prop(_S.read(_v17, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v17, "u"), 0.5)) else _S.prop(_S.read(_v17, "C"), 4))])
			else:
				if _S.truth(_S.binary("<", _S.read(_v16, "age"), _S.binary("+", _S.read(_v16, "swell"), _S.read(_v16, "fall")))):
					var _v19 = _S.scope(_v16)
					_S.define(_v19, "f", _S.binary("-", _S.read(_v19, "age"), _S.read(_v19, "swell")))
					_S.define(_v19, "y", _S.binary("+", _S.binary("+", _S.prop(_S.read(_v19, "w"), "yb"), 2), _S.binary("*", _S.binary("*", _S.binary("*", 0.5, _S.read(_v19, "G")), _S.read(_v19, "f")), _S.read(_v19, "f"))))
					_S.call_value(_S.read(_v19, "drop"), [_S.read(_v19, "p"), _S.read(_v19, "C"), _S.prop(_S.read(_v19, "w"), "x"), _S.read(_v19, "y"), _S.binary("*", _S.read(_v19, "G"), _S.read(_v19, "f")), (2 if _S.truth(_S.read(_v19, "big")) else 1)])
				else:
					_S.call_value(_S.read(_v16, "splat"), [_S.read(_v16, "p"), _S.read(_v16, "C"), _S.prop(_S.read(_v16, "w"), "x"), _S.read(_v16, "ground"), _S.binary("-", _S.binary("-", _S.read(_v16, "age"), _S.read(_v16, "swell")), _S.read(_v16, "fall")), _S.read(_v16, "big"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v16, "w"), "mx"), 31), _S.read(_v16, "k"))])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "k", 1, "+=", true)
	_S.define(_e, "w", _S.prop(_S.read(_e, "W"), 0))
	if _S.truth(_S.binary("<", _S.read(_e, "ph"), 0.5)):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "j"), 7)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "vx", _S.binary("*", _S.prop(_S.read(_v21, "w"), "side"), _S.binary("+", 18, _S.binary("*", 42, _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "j"), 7])))))
			_S.define(_v21, "vy", _S.unary("-", _S.binary("+", 15, _S.binary("*", 50, _S.call_value(_S.read(_v21, "rand"), [_S.read(_v21, "j"), 8])))))
			_S.define(_v21, "tt", _S.binary("-", _S.read(_v21, "ph"), _S.binary("*", _S.read(_v21, "j"), 0.012)))
			if _S.truth(_S.binary("<=", _S.read(_v21, "tt"), 0)):
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "j", 1, "+=", true)
				continue
			_S.define(_v21, "x", _S.binary("+", _S.prop(_S.read(_v21, "w"), "x"), _S.call_value(_S.read(_v21, "travel"), [_S.read(_v21, "vx"), 0, 1.2, _S.read(_v21, "tt")])))
			_S.define(_v21, "y", _S.binary("+", _S.prop(_S.read(_v21, "w"), "y0"), _S.call_value(_S.read(_v21, "travel"), [_S.read(_v21, "vy"), _S.binary("*", _S.read(_v21, "G"), 0.8), 0.6, _S.read(_v21, "tt")])))
			_S.define(_v21, "x2", _S.binary("+", _S.prop(_S.read(_v21, "w"), "x"), _S.call_value(_S.read(_v21, "travel"), [_S.read(_v21, "vx"), 0, 1.2, _S.binary("-", _S.read(_v21, "tt"), 0.02)])))
			_S.define(_v21, "y2", _S.binary("+", _S.prop(_S.read(_v21, "w"), "y0"), _S.call_value(_S.read(_v21, "travel"), [_S.read(_v21, "vy"), _S.binary("*", _S.read(_v21, "G"), 0.8), 0.6, _S.binary("-", _S.read(_v21, "tt"), 0.02)])))
			if _S.truth(_S.binary(">=", _S.read(_v21, "y"), _S.unary("-", 1))):
				_v20 = _S.iteration(_v20)
				_S.write(_v20, "j", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v21, "p"), "line", [_S.read(_v21, "x2"), _S.read(_v21, "y2"), _S.read(_v21, "x"), _S.read(_v21, "y"), (_S.prop(_S.read(_v21, "C"), 3) if _S.truth(_S.binary("%", _S.read(_v21, "j"), 3)) else _S.prop(_S.read(_v21, "C"), 2))])
			_S.invoke(_S.read(_v21, "p"), "px", [_S.read(_v21, "x"), _S.read(_v21, "y"), (_S.prop(_S.read(_v21, "C"), 5) if _S.truth(_S.binary("%", _S.read(_v21, "j"), 2)) else _S.prop(_S.read(_v21, "C"), 4))])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "j", 1, "+=", true)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.prop(_S.read(_e, "w"), "x"), _S.prop(_S.read(_e, "w"), "y0"), 6, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.25, _S.read(_e, "hurt"))])
	return null
