@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/scanner.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "body", _S.function_value(_e, "_f0"))
	_S.define(_e, "bracket", _S.function_value(_e, "_f2"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Scanner"}, {"desc": "Brackets snap onto the hero, a scan line sweeps head to toe leaving a cooling outline, and a readout counts up to OK before it all lets go."}, {"tags": ["scifi", "scan", "target", "hud", "tech", "status", "ui", "loop"]}, {"size": [112, 78]}, {"origin": [42, 58]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#03140a", "#06301a", "#0c5a2c", "#16893e", "#2cc256", "#7cf08c", "#d0ffd4", "#ffffff"]}, {"seed": 22}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STIFF", _S.merge([{"turn": 0.9}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 14)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "OK_", _S.merge([{"turn": 0.9}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 37)}, {"bx": 8}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([])], [0.3, _S.read(_e, "STIFF"), "snap"], [1.75, _S.read(_e, "STIFF")], [1.85, _S.read(_e, "OK_"), "snap"], [2.5, _S.read(_e, "OK_")], [2.8, _S.merge([])], [3.2, _S.merge([])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LOCK", 0.3)
	_S.define(_e, "SCAN0", 0.42)
	_S.define(_e, "SCAN1", 1.6)
	_S.define(_e, "DONE", 1.75)
	_S.define(_e, "LET", 2.5)
	_S.define(_e, "bodies", _S.construct(_S.read(_e, "WeakMap"), []))
	_S.define(_e, "scanY", _S.function_value(_e, "_f6"))
	_S.define(_e, "scanT", _S.function_value(_e, "_f7"))
	_S.define(_e, "ghostCache", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "b", _S.invoke(_S.read(_e, "bodies"), "get", [_S.read(_e, "A")]))
	if _S.truth(_S.read(_e, "b")):
		return _S.read(_e, "b")
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "on", _S.function_value(_e, "_f1"))
	_S.define(_e, "edge", [])
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.prop(_S.read(_v0, "m"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.prop(_S.read(_v1, "m"), "w"))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.read(_v2, "y")])):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "r", _S.logical("??", _S.invoke(_S.read(_v3, "rows"), "get", [_S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "y"))]), func(): return [_S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x")), _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x"))]))
				_S.invoke(_S.read(_v3, "rows"), "set", [_S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "y")), [_S.invoke(_S.read(_v3, "Math"), "min", [_S.prop(_S.read(_v3, "r"), 0), _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x"))]), _S.invoke(_S.read(_v3, "Math"), "max", [_S.prop(_S.read(_v3, "r"), 1), _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x"))])]])
			else:
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v2, "on"), [_S.binary("-", _S.read(_v2, "x"), 1), _S.read(_v2, "y")]), func(): return _S.call_value(_S.read(_v2, "on"), [_S.binary("+", _S.read(_v2, "x"), 1), _S.read(_v2, "y")])), func(): return _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.binary("-", _S.read(_v2, "y"), 1)])), func(): return _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.binary("+", _S.read(_v2, "y"), 1)]))):
					_S.invoke(_S.read(_v2, "edge"), "push", [[_S.binary("+", _S.prop(_S.read(_v2, "A"), "x"), _S.read(_v2, "x")), _S.binary("+", _S.prop(_S.read(_v2, "A"), "y"), _S.read(_v2, "y"))]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "bodies"), "set", [_S.read(_e, "A"), _S.write(_e, "b", _S.merge([{"edge": _S.read(_e, "edge")}, {"rows": _S.read(_e, "rows")}]), "=", false)])
	return _S.read(_e, "b")

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.prop(_S.read(_e, "m"), "w"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "h"))), func(): return _S.prop(_S.prop(_S.read(_e, "m"), "data"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.prop(_S.read(_e, "m"), "w")), _S.read(_e, "x"))))

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "x", _S.arg(_args, 1))
	_S.define(_e, "y", _S.arg(_args, 2))
	_S.define(_e, "sx", _S.arg(_args, 3))
	_S.define(_e, "sy", _S.arg(_args, 4))
	_S.define(_e, "L", _S.arg(_args, 5))
	_S.define(_e, "c", _S.arg(_args, 6))
	_S.define(_e, "hot", _S.arg(_args, 7))
	_S.define(_e, "a", _S.arg(_args, 8))
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.read(_e, "y"), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "sx"), _S.read(_e, "L"))), _S.read(_e, "y"), _S.read(_e, "c"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "x"), _S.binary("+", _S.read(_e, "y"), _S.binary("*", _S.read(_e, "sy"), _S.read(_e, "L"))), _S.read(_e, "c"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("+", _S.read(_e, "x"), _S.read(_e, "sx")), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "sy")), _S.binary("+", _S.read(_e, "x"), _S.binary("*", _S.read(_e, "sx"), 3)), _S.binary("+", _S.read(_e, "y"), _S.read(_e, "sy")), _S.read(_e, "c"), _S.binary("*", _S.read(_e, "a"), 0.6)])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "hot"), _S.read(_e, "a")])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	_S.define(_e, "C", _S.arg(_args, 2))
	_S.define(_e, "key", ("" + _S.string(_S.prop(_S.read(_e, "o"), "seed")) + ":" + _S.string(_S.invoke(_S.prop(_S.read(_e, "o"), "palette"), "join", [])) + ""))
	_S.define(_e, "byActor", _S.logical("??", _S.invoke(_S.read(_e, "ghostCache"), "get", [_S.read(_e, "A")]), func(): return _S.construct(_S.read(_e, "Map"), [])))
	_S.invoke(_S.read(_e, "ghostCache"), "set", [_S.read(_e, "A"), _S.read(_e, "byActor")])
	if _S.truth(_S.invoke(_S.read(_e, "byActor"), "has", [_S.read(_e, "key")])):
		return _S.invoke(_S.read(_e, "byActor"), "get", [_S.read(_e, "key")])
	var _v4 = _S.call_value(_S.read(_e, "body"), [_S.read(_e, "A")])
	_S.define(_e, "rows", _S.prop(_v4, "rows"))
	_S.define(_e, "g", _S.construct(_S.read(_e, "Ghosts"), [_S.read(_e, "D"), _S.merge([{"ground": _S.function_value(_e, "_f4")}, {"box": [_S.unary("-", 40), _S.unary("-", 58), 68, 9]}])]))
	var _v5 = _S.scope(_e)
	_S.define(_v5, "y", _S.prop(_S.read(_v5, "A"), "y"))
	while _S.truth(_S.binary("<", _S.read(_v5, "y"), 0)):
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "r", _S.invoke(_S.read(_v6, "rows"), "get", [_S.read(_v6, "y")]))
		if _S.truth(_S.unary("!", _S.read(_v6, "r"))):
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "y", 3, "+=", false)
			continue
		for _v7 in _S.array([[_S.binary("-", _S.prop(_S.read(_v6, "r"), 0), 1), _S.unary("-", 1)], [_S.binary("+", _S.prop(_S.read(_v6, "r"), 1), 1), 1]]):
			var _v8 = _S.scope(_v6)
			var _v9 = _v7
			_S.define(_v8, "x", _S.prop(_v9, 0))
			_S.define(_v8, "s", _S.prop(_v9, 1))
			if _S.truth(_S.binary("<", _S.call_value(_S.read(_v8, "rand"), [_S.prop(_S.read(_v8, "o"), "seed"), _S.read(_v8, "y"), _S.read(_v8, "s")]), 0.6)):
				_S.invoke(_S.read(_v8, "g"), "add", [_S.call_value(_S.read(_v8, "scanT"), [_S.read(_v8, "y"), _S.read(_v8, "A")]), _S.prop(_S.read(_v8, "P"), "MOTE"), _S.read(_v8, "x"), _S.read(_v8, "y"), _S.binary("*", _S.read(_v8, "s"), _S.binary("+", 30, _S.binary("*", 50, _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "y"), _S.read(_v8, "s"), 3])))), _S.binary("+", _S.unary("-", 10), _S.binary("*", 20, _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "y"), _S.read(_v8, "s"), 4]))), _S.binary("+", 0.2, _S.binary("*", 0.15, _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "y"), _S.read(_v8, "s"), 5]))), (_S.read(_v8, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v8, "rand"), [_S.read(_v8, "y"), _S.read(_v8, "s"), 6]), 0.4)) else _S.prop(_S.read(_v8, "C"), 5)), 0.6])
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "y", 3, "+=", false)
	_S.invoke(_S.read(_e, "byActor"), "set", [_S.read(_e, "key"), _S.read(_e, "g")])
	return _S.read(_e, "g")

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	var _v10 = _S.call_value(_S.read(_e, "body"), [_S.read(_e, "A")])
	_S.define(_e, "edge", _S.prop(_v10, "edge"))
	_S.define(_e, "rows", _S.prop(_v10, "rows"))
	_S.define(_e, "bx0", _S.binary("-", _S.prop(_S.read(_e, "A"), "x"), 4))
	_S.define(_e, "bx1", _S.binary("+", _S.binary("+", _S.prop(_S.read(_e, "A"), "x"), _S.prop(_S.read(_e, "A"), "w")), 3))
	_S.define(_e, "by0", _S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 4))
	_S.define(_e, "by1", 3)
	_S.define(_e, "lock", _S.invoke(_S.read(_e, "ease"), "outBack", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "LOCK"))]), 2.2]))
	_S.define(_e, "out", _S.invoke(_S.read(_e, "ease"), "inCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LET")), 0.45)])]))
	_S.define(_e, "spread", _S.binary("+", _S.binary("*", _S.binary("-", 1, _S.read(_e, "lock")), 14), _S.binary("*", _S.read(_e, "out"), 12)))
	_S.define(_e, "gone", _S.logical("||", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LET"), 0.45)), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LET"), 0.25)), func(): return _S.binary("===", _S.binary("%", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LET")), 20)]), 2), 1))))
	_S.define(_e, "vis", (0 if _S.truth(_S.read(_e, "gone")) else 1))
	_S.define(_e, "flash", _S.logical("||", _S.logical("||", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "LOCK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "LOCK"), 0.07))), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "DONE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DONE"), 0.05)))), func(): return _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DONE"), 0.12)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DONE"), 0.17)))))
	_S.define(_e, "bc", (_S.read(_e, "WHITE") if _S.truth(_S.read(_e, "flash")) else _S.prop(_S.read(_e, "C"), 5)))
	_S.define(_e, "L", 7)
	if _S.truth(_S.binary(">", _S.read(_e, "vis"), 0)):
		for _v11 in _S.array([[_S.binary("-", _S.read(_e, "bx0"), _S.read(_e, "spread")), _S.binary("-", _S.read(_e, "by0"), _S.read(_e, "spread")), 1, 1], [_S.binary("+", _S.read(_e, "bx1"), _S.read(_e, "spread")), _S.binary("-", _S.read(_e, "by0"), _S.read(_e, "spread")), _S.unary("-", 1), 1], [_S.binary("-", _S.read(_e, "bx0"), _S.read(_e, "spread")), _S.binary("+", _S.read(_e, "by1"), _S.read(_e, "spread")), 1, _S.unary("-", 1)], [_S.binary("+", _S.read(_e, "bx1"), _S.read(_e, "spread")), _S.binary("+", _S.read(_e, "by1"), _S.read(_e, "spread")), _S.unary("-", 1), _S.unary("-", 1)]]):
			var _v12 = _S.scope(_e)
			var _v13 = _v11
			_S.define(_v12, "x", _S.prop(_v13, 0))
			_S.define(_v12, "y", _S.prop(_v13, 1))
			_S.define(_v12, "sx", _S.prop(_v13, 2))
			_S.define(_v12, "sy", _S.prop(_v13, 3))
			var _v14 = _S.scope(_v12)
			_S.call_value(_S.read(_v14, "bracket"), [_S.read(_v14, "p"), _S.read(_v14, "x"), _S.read(_v14, "y"), _S.read(_v14, "sx"), _S.read(_v14, "sy"), _S.read(_v14, "L"), _S.read(_v14, "bc"), _S.read(_v14, "WHITE"), _S.read(_v14, "vis")])
			_S.invoke(_S.read(_v14, "p"), "glow", [_S.read(_v14, "x"), _S.read(_v14, "y"), 6, _S.prop(_S.read(_v14, "C"), 4), _S.binary("*", 0.35, _S.read(_v14, "vis"))])
	_S.define(_e, "lk", _S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LOCK")), 0.3))
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "lk"), 0), func(): return _S.binary("<", _S.read(_e, "lk"), 1))):
		var _v15 = _S.scope(_e)
		_S.define(_v15, "e", _S.binary("+", 3, _S.binary("*", 10, _S.invoke(_S.read(_v15, "ease"), "outCubic", [_S.read(_v15, "lk")]))))
		_S.define(_v15, "c", (_S.read(_v15, "WHITE") if _S.truth(_S.binary("<", _S.read(_v15, "lk"), 0.25)) else (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v15, "lk"), 0.5)) else (_S.prop(_S.read(_v15, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v15, "lk"), 0.75)) else _S.prop(_S.read(_v15, "C"), 3)))))
		_S.invoke(_S.read(_v15, "p"), "line", [_S.binary("-", _S.read(_v15, "bx0"), _S.read(_v15, "e")), _S.binary("-", _S.read(_v15, "by0"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "bx1"), _S.read(_v15, "e")), _S.binary("-", _S.read(_v15, "by0"), _S.read(_v15, "e")), _S.read(_v15, "c")])
		_S.invoke(_S.read(_v15, "p"), "line", [_S.binary("-", _S.read(_v15, "bx0"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "by1"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "bx1"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "by1"), _S.read(_v15, "e")), _S.read(_v15, "c")])
		_S.invoke(_S.read(_v15, "p"), "line", [_S.binary("-", _S.read(_v15, "bx0"), _S.read(_v15, "e")), _S.binary("-", _S.read(_v15, "by0"), _S.read(_v15, "e")), _S.binary("-", _S.read(_v15, "bx0"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "by1"), _S.read(_v15, "e")), _S.read(_v15, "c")])
		_S.invoke(_S.read(_v15, "p"), "line", [_S.binary("+", _S.read(_v15, "bx1"), _S.read(_v15, "e")), _S.binary("-", _S.read(_v15, "by0"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "bx1"), _S.read(_v15, "e")), _S.binary("+", _S.read(_v15, "by1"), _S.read(_v15, "e")), _S.read(_v15, "c")])
	_S.define(_e, "pulse", (_S.binary("-", 1, _S.binary("/", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.read(_e, "DONE"), _S.read(_e, "D")]), 0.3)) if _S.truth(_S.binary("<", _S.call_value(_S.read(_e, "since"), [_S.read(_e, "t"), _S.read(_e, "DONE"), _S.read(_e, "D")]), 0.3)) else 0))
	_S.define(_e, "offY", _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 2), 2, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LET")), 0.4)])]))
	if _S.truth(_S.binary(">", _S.read(_e, "t"), _S.read(_e, "SCAN0"))):
		for _v16 in _S.array(_S.read(_e, "edge")):
			var _v17 = _S.scope(_e)
			var _v18 = _v16
			_S.define(_v17, "x", _S.prop(_v18, 0))
			_S.define(_v17, "y", _S.prop(_v18, 1))
			var _v19 = _S.scope(_v17)
			_S.define(_v19, "a", _S.binary("-", _S.read(_v19, "t"), _S.call_value(_S.read(_v19, "scanT"), [_S.read(_v19, "y"), _S.read(_v19, "A")])))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v19, "a"), 0), func(): return _S.logical("&&", _S.binary(">", _S.read(_v19, "t"), _S.read(_v19, "LET")), func(): return _S.binary("<", _S.read(_v19, "y"), _S.read(_v19, "offY"))))):
				continue
			_S.define(_v19, "c", (_S.read(_v19, "WHITE") if _S.truth(_S.binary(">", _S.read(_v19, "pulse"), 0.4)) else (_S.read(_v19, "WHITE") if _S.truth(_S.binary("<", _S.read(_v19, "a"), 0.07)) else (_S.prop(_S.read(_v19, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v19, "a"), 0.25)) else (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v19, "a"), 0.6)) else (_S.prop(_S.read(_v19, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v19, "t"), _S.binary("-", _S.read(_v19, "LET"), 0.3))) else _S.prop(_S.read(_v19, "C"), 4)))))))
			_S.invoke(_S.read(_v19, "p"), "px", [_S.read(_v19, "x"), _S.read(_v19, "y"), _S.read(_v19, "c")])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SCAN0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SCAN1")))):
		var _v20 = _S.scope(_e)
		_S.define(_v20, "y", _S.invoke(_S.read(_v20, "Math"), "floor", [_S.call_value(_S.read(_v20, "scanY"), [_S.read(_v20, "t"), _S.read(_v20, "A")])]))
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "k", 1)
		while _S.truth(_S.binary("<=", _S.read(_v21, "k"), 5)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "r", _S.invoke(_S.read(_v22, "rows"), "get", [_S.binary("-", _S.read(_v22, "y"), _S.read(_v22, "k"))]))
			if _S.truth(_S.read(_v22, "r")):
				var _v23 = _S.scope(_v22)
				_S.define(_v23, "x", _S.prop(_S.read(_v23, "r"), 0))
				while _S.truth(_S.binary("<=", _S.read(_v23, "x"), _S.prop(_S.read(_v23, "r"), 1))):
					if _S.truth(_S.prop(_S.prop(_S.prop(_S.read(_v23, "A"), "mask"), "data"), _S.binary("-", _S.binary("+", _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_v23, "y"), _S.read(_v23, "k")), _S.prop(_S.read(_v23, "A"), "y")), _S.prop(_S.read(_v23, "A"), "w")), _S.read(_v23, "x")), _S.prop(_S.read(_v23, "A"), "x")))):
						_S.invoke(_S.read(_v23, "p"), "blend", [_S.binary("+", _S.read(_v23, "x"), 0.5), _S.binary("+", _S.binary("-", _S.read(_v23, "y"), _S.read(_v23, "k")), 0.5), (_S.prop(_S.read(_v23, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v23, "k"), 2)) else _S.prop(_S.read(_v23, "C"), 5)), _S.binary("-", 0.55, _S.binary("*", _S.read(_v23, "k"), 0.09))])
					_v23 = _S.iteration(_v23)
					_S.write(_v23, "x", 1, "+=", true)
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "k", 1, "+=", true)
		var _v24 = _S.scope(_v20)
		_S.define(_v24, "x", _S.binary("-", _S.read(_v24, "bx0"), 2))
		while _S.truth(_S.binary("<=", _S.read(_v24, "x"), _S.binary("+", _S.read(_v24, "bx1"), 2))):
			var _v25 = _S.scope(_v24)
			_S.define(_v25, "r", _S.invoke(_S.read(_v25, "rows"), "get", [_S.read(_v25, "y")]))
			_S.define(_v25, "inside", _S.logical("&&", _S.logical("&&", _S.read(_v25, "r"), func(): return _S.binary(">=", _S.read(_v25, "x"), _S.prop(_S.read(_v25, "r"), 0))), func(): return _S.binary("<=", _S.read(_v25, "x"), _S.prop(_S.read(_v25, "r"), 1))))
			_S.invoke(_S.read(_v25, "p"), "px", [_S.read(_v25, "x"), _S.read(_v25, "y"), (_S.read(_v25, "WHITE") if _S.truth(_S.read(_v25, "inside")) else _S.prop(_S.read(_v25, "C"), 6))])
			_S.invoke(_S.read(_v25, "p"), "blend", [_S.binary("+", _S.read(_v25, "x"), 0.5), _S.binary("-", _S.read(_v25, "y"), 0.5), _S.prop(_S.read(_v25, "C"), 5), 0.35])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "x", 1, "+=", true)
		_S.invoke(_S.read(_v20, "p"), "glowLine", [_S.read(_v20, "bx0"), _S.read(_v20, "y"), _S.read(_v20, "bx1"), _S.read(_v20, "y"), 6, _S.prop(_S.read(_v20, "C"), 5), 0.45])
		_S.define(_v20, "r", _S.invoke(_S.read(_v20, "rows"), "get", [_S.read(_v20, "y")]))
		if _S.truth(_S.read(_v20, "r")):
			for _v26 in _S.array([_S.binary("-", _S.prop(_S.read(_v20, "r"), 0), 0.5), _S.binary("+", _S.prop(_S.read(_v20, "r"), 1), 1.5)]):
				var _v27 = _S.scope(_v20)
				_S.define(_v27, "x", _v26)
				_S.call_value(_S.read(_v27, "sparkle"), [_S.read(_v27, "p"), _S.read(_v27, "x"), _S.binary("+", _S.read(_v27, "y"), 0.5), 2, _S.prop(_S.read(_v27, "C"), 6), _S.prop(_S.read(_v27, "C"), 5), 0.3])
	_S.define(_e, "lead", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "LOCK")), 0.1)]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "vis"), 0), func(): return _S.binary(">", _S.read(_e, "lead"), 0))):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "px", _S.binary("+", _S.binary("+", _S.read(_v28, "bx1"), _S.read(_v28, "spread")), 6))
		_S.define(_v28, "py", _S.binary("+", _S.binary("-", _S.read(_v28, "by0"), _S.read(_v28, "spread")), 2))
		_S.define(_v28, "k", _S.call_value(_S.read(_v28, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v28, "t"), _S.read(_v28, "SCAN0")), _S.binary("-", _S.read(_v28, "SCAN1"), _S.read(_v28, "SCAN0")))]))
		_S.define(_v28, "ok", _S.binary(">", _S.read(_v28, "t"), _S.read(_v28, "DONE")))
		_S.invoke(_S.read(_v28, "p"), "line", [_S.binary("+", _S.read(_v28, "bx1"), _S.read(_v28, "spread")), _S.binary("-", _S.read(_v28, "by0"), _S.read(_v28, "spread")), _S.call_value(_S.read(_v28, "lerp"), [_S.binary("+", _S.read(_v28, "bx1"), _S.read(_v28, "spread")), _S.binary("-", _S.read(_v28, "px"), 1), _S.read(_v28, "lead")]), _S.call_value(_S.read(_v28, "lerp"), [_S.binary("-", _S.read(_v28, "by0"), _S.read(_v28, "spread")), _S.binary("+", _S.read(_v28, "py"), 4), _S.read(_v28, "lead")]), _S.prop(_S.read(_v28, "C"), 3)])
		if _S.truth(_S.binary("<", _S.read(_v28, "lead"), 1)):
			return _S.unary("void", _S.invoke(_S.invoke(_S.call_value(_S.read(_v28, "ghosts"), [_S.read(_v28, "o"), _S.read(_v28, "A"), _S.read(_v28, "C")]), "at", [_S.read(_v28, "t")]), "draw", [_S.read(_v28, "p")]))
		_S.invoke(_S.read(_v28, "p"), "line", [_S.binary("-", _S.read(_v28, "px"), 1), _S.binary("+", _S.read(_v28, "py"), 4), _S.binary("+", _S.read(_v28, "px"), 1), _S.binary("+", _S.read(_v28, "py"), 4), _S.prop(_S.read(_v28, "C"), 3)])
		_S.define(_v28, "del", _S.call_value(_S.read(_v28, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v28, "t"), _S.read(_v28, "LET")), 0.25)]))
		_S.define(_v28, "full", ("OK" if _S.truth(_S.read(_v28, "ok")) else ("" + _S.string(_S.invoke(_S.read(_v28, "Math"), "floor", [_S.binary("*", _S.read(_v28, "k"), 100)])) + "%")))
		_S.define(_v28, "label", _S.invoke(_S.read(_v28, "full"), "slice", [0, _S.invoke(_S.read(_v28, "Math"), "ceil", [_S.binary("*", _S.prop(_S.read(_v28, "full"), "length"), _S.binary("-", 1, _S.read(_v28, "del")))])]))
		_S.define(_v28, "blinkOk", _S.logical("&&", _S.logical("&&", _S.read(_v28, "ok"), func(): return _S.binary("===", _S.binary("%", _S.invoke(_S.read(_v28, "Math"), "floor", [_S.binary("*", _S.binary("-", _S.read(_v28, "t"), _S.read(_v28, "DONE")), 8)]), 2), 0)), func(): return _S.binary("<", _S.read(_v28, "t"), _S.binary("+", _S.read(_v28, "DONE"), 0.5))))
		if _S.truth(_S.read(_v28, "label")):
			_S.invoke(_S.read(_v28, "p"), "text", [_S.read(_v28, "label"), _S.binary("+", _S.read(_v28, "px"), 2), _S.read(_v28, "py"), (_S.read(_v28, "WHITE") if _S.truth(_S.read(_v28, "blinkOk")) else _S.prop(_S.read(_v28, "C"), 6)), _S.merge([{"font": "mini"}, {"scale": 2}, {"shadow": _S.prop(_S.read(_v28, "C"), 1)}])])
		var _v29 = _S.scope(_v28)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 10)):
			var _v30 = _S.scope(_v29)
			if _S.truth(_S.binary(">=", _S.read(_v30, "i"), _S.binary("*", 10, _S.binary("-", 1, _S.read(_v30, "del"))))):
				break
			_S.define(_v30, "on", _S.logical("||", _S.binary("<=", _S.binary("/", _S.binary("+", _S.read(_v30, "i"), 1), 10), _S.binary("+", _S.read(_v30, "k"), 0.000001)), func(): return _S.read(_v30, "ok")))
			_S.invoke(_S.read(_v30, "p"), "rect", [_S.binary("+", _S.binary("+", _S.read(_v30, "px"), 2), _S.binary("*", _S.read(_v30, "i"), 3)), _S.binary("+", _S.read(_v30, "py"), 13), 2, 3, ((_S.prop(_S.read(_v30, "C"), 6) if _S.truth(_S.read(_v30, "ok")) else _S.prop(_S.read(_v30, "C"), 5)) if _S.truth(_S.read(_v30, "on")) else _S.prop(_S.read(_v30, "C"), 2))])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
		_S.invoke(_S.read(_v28, "p"), "glow", [_S.binary("+", _S.read(_v28, "px"), 16), _S.binary("+", _S.read(_v28, "py"), 6), 18, _S.prop(_S.read(_v28, "C"), 4), _S.binary("*", 0.2, _S.read(_v28, "vis"))])
	_S.invoke(_S.invoke(_S.call_value(_S.read(_e, "ghosts"), [_S.read(_e, "o"), _S.read(_e, "A"), _S.read(_e, "C")]), "at", [_S.read(_e, "t")]), "draw", [_S.read(_e, "p")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	return _S.call_value(_S.read(_e, "lerp"), [_S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 3), 1, _S.invoke(_S.read(_e, "ease"), "inOutSine", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "SCAN0")), _S.binary("-", _S.read(_e, "SCAN1"), _S.read(_e, "SCAN0")))])])])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "y", _S.arg(_args, 0))
	_S.define(_e, "A", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "SCAN0"), _S.binary("/", _S.binary("*", _S.binary("-", _S.read(_e, "SCAN1"), _S.read(_e, "SCAN0")), _S.invoke(_S.read(_e, "Math"), "acos", [_S.binary("-", 1, _S.binary("*", 2, _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.binary("+", _S.read(_e, "y"), 0.5), _S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 3)), _S.binary("-", 4, _S.prop(_S.read(_e, "A"), "y")))])))])), _S.prop(_S.read(_e, "Math"), "PI")))
