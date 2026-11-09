@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/shadow/void-orb.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "fbm", _S.import_value("core/index.js", "fbm"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "VOID", _S.import_value("fx/shadow/_lib.js", "VOID"))
	_S.define(_e, "halo", _S.import_value("fx/shadow/_lib.js", "halo"))
	_S.define(_e, "ringLight", _S.import_value("fx/shadow/_lib.js", "ringLight"))
	_S.define(_e, "ringFast", _S.import_value("fx/shadow/_lib.js", "ringFast"))
	_S.define(_e, "unlight", _S.import_value("fx/shadow/_lib.js", "unlight"))
	_S.define(_e, "tables", _S.function_value(_e, "_f0"))
	_S.define(_e, "vortex", _S.function_value(_e, "_f1"))
	_S.define(_e, "lensing", _S.function_value(_e, "_f2"))
	_S.define(_e, "orb", _S.function_value(_e, "_f3"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f5"))
	_S.define(_e, "draw", _S.function_value(_e, "_f6"))
	_S.define(_e, "meta", _S.merge([{"name": "Void orb"}, {"desc": "A black orb hangs in the air, a pale rim crawling round it; a dark vortex winds into it, motes and streaks are pulled in, and light bends round its edge."}, {"tags": ["shadow", "void", "orb", "vortex", "dark", "magic", "loop"]}, {"size": [168, 160]}, {"origin": [84, 150]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOID")}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "Y", _S.unary("-", 62))
	_S.define(_e, "R", 12)
	_S.define(_e, "VR", 48)
	_S.define(_e, "GAP", _S.binary("+", _S.read(_e, "R"), 9))
	_S.define(_e, "E", _S.binary("+", _S.read(_e, "R"), 4.5))
	_S.define(_e, "D", 3.2)
	_S.define(_e, "ARMS", 3)
	_S.define(_e, "K", 7)
	_S.define(_e, "WIND", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), 2), _S.read(_e, "D")))
	_S.define(_e, "GULPS", [0.2, 0.68])
	_S.define(_e, "wrap", _S.function_value(_e, "_f14"))
	_S.define(_e, "gulp", _S.function_value(_e, "_f15"))
	_S.define(_e, "SOURCES", [_S.merge([{"cx": 0}, {"cy": 0}, {"rho": 6}, {"n": 1}, {"ph": 0}, {"s": 2.6}, {"sy": 0.75}]), _S.merge([{"cx": 1}, {"cy": _S.unary("-", 1)}, {"rho": 8}, {"n": _S.unary("-", 1)}, {"ph": 2.2}, {"s": 2}, {"sy": 0.6}]), _S.merge([{"cx": 18}, {"cy": _S.unary("-", 6)}, {"rho": 24}, {"n": 1}, {"ph": 0.4}, {"s": 2.4}, {"sy": 0.7}]), _S.merge([{"cx": _S.unary("-", 26)}, {"cy": 10}, {"rho": 30}, {"n": 1}, {"ph": 2.6}, {"s": 2}, {"sy": 0.55}]), _S.merge([{"cx": 8}, {"cy": 22}, {"rho": 20}, {"n": 2}, {"ph": 4.1}, {"s": 1.6}, {"sy": 0.8}]), _S.merge([{"cx": _S.unary("-", 12)}, {"cy": _S.unary("-", 26)}, {"rho": 34}, {"n": 1}, {"ph": 5.3}, {"s": 1.8}, {"sy": 0.6}]), _S.merge([{"cx": 34}, {"cy": 18}, {"rho": 16}, {"n": 2}, {"ph": 1.2}, {"s": 1.4}, {"sy": 0.9}])])
	_S.define(_e, "TAB", null)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	if _S.truth(_S.read(_e, "TAB")):
		return _S.read(_e, "TAB")
	_S.define(_e, "n", _S.binary("*", _S.read(_e, "VR"), 2))
	_S.define(_e, "N", _S.binary("*", _S.read(_e, "n"), _S.read(_e, "n")))
	_S.define(_e, "r", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "th", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "ln", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "nz", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "j"), _S.read(_v0, "n"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.read(_v1, "n"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "x", _S.binary("+", _S.binary("-", _S.read(_v2, "i"), _S.read(_v2, "VR")), 0.5))
			_S.define(_v2, "y", _S.binary("+", _S.binary("-", _S.read(_v2, "j"), _S.read(_v2, "VR")), 0.5))
			_S.define(_v2, "k", _S.binary("+", _S.binary("*", _S.read(_v2, "j"), _S.read(_v2, "n")), _S.read(_v2, "i")))
			_S.define(_v2, "a", _S.invoke(_S.read(_v2, "Math"), "atan2", [_S.read(_v2, "y"), _S.read(_v2, "x")]))
			_S.define(_v2, "d", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.read(_v2, "x"), _S.read(_v2, "y")]))
			_S.define(_v2, "l", _S.invoke(_S.read(_v2, "Math"), "log", [_S.invoke(_S.read(_v2, "Math"), "max", [1, _S.read(_v2, "d")])]))
			_S.set_prop(_S.read(_v2, "r"), _S.read(_v2, "k"), _S.read(_v2, "d"), "=", false)
			_S.set_prop(_S.read(_v2, "th"), _S.read(_v2, "k"), _S.read(_v2, "a"), "=", false)
			_S.set_prop(_S.read(_v2, "ln"), _S.read(_v2, "k"), _S.read(_v2, "l"), "=", false)
			_S.set_prop(_S.read(_v2, "nz"), _S.read(_v2, "k"), _S.call_value(_S.read(_v2, "fbm"), [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), 2.5), _S.binary("*", _S.read(_v2, "l"), 2.4)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), 2.5), _S.binary("*", _S.read(_v2, "l"), 2.4)), 17, 3]), "=", false)
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "j", 1, "+=", true)
	return _S.write(_e, "TAB", _S.merge([{"n": _S.read(_e, "n")}, {"r": _S.read(_e, "r")}, {"th": _S.read(_e, "th")}, {"ln": _S.read(_e, "ln")}, {"nz": _S.read(_e, "nz")}]), "=", false)

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	_S.define(_e, "T", _S.call_value(_S.read(_e, "tables"), []))
	_S.define(_e, "n", _S.prop(_S.read(_e, "T"), "n"))
	_S.define(_e, "wf", _S.binary("/", _S.binary("*", _S.read(_e, "TAU"), 12), _S.read(_e, "D")))
	var _v3 = _S.scope(_e)
	_S.define(_v3, "j", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "j"), _S.read(_v3, "n"))):
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), _S.read(_v4, "n"))):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "k", _S.binary("+", _S.binary("*", _S.read(_v5, "j"), _S.read(_v5, "n")), _S.read(_v5, "i")))
			_S.define(_v5, "r", _S.prop(_S.prop(_S.read(_v5, "T"), "r"), _S.read(_v5, "k")))
			if _S.truth(_S.logical("||", _S.binary("<", _S.read(_v5, "r"), _S.read(_v5, "GAP")), func(): return _S.binary(">", _S.read(_v5, "r"), _S.read(_v5, "VR")))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "i", 1, "+=", true)
				continue
			_S.define(_v5, "env", _S.binary("*", _S.call_value(_S.read(_v5, "smooth"), [_S.read(_v5, "VR"), _S.binary("*", _S.read(_v5, "VR"), 0.42), _S.read(_v5, "r")]), _S.call_value(_S.read(_v5, "smooth"), [_S.read(_v5, "GAP"), _S.binary("+", _S.read(_v5, "GAP"), 4), _S.read(_v5, "r")])))
			_S.define(_v5, "ph", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v5, "ARMS"), _S.prop(_S.prop(_S.read(_v5, "T"), "th"), _S.read(_v5, "k"))), _S.binary("*", _S.read(_v5, "K"), _S.prop(_S.prop(_S.read(_v5, "T"), "ln"), _S.read(_v5, "k")))), _S.binary("*", _S.read(_v5, "WIND"), _S.read(_v5, "t"))), _S.binary("*", _S.prop(_S.prop(_S.read(_v5, "T"), "nz"), _S.read(_v5, "k")), 2.6)))
			_S.define(_v5, "cs", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "ph")]))
			_S.define(_v5, "A", _S.binary("*", _S.binary("*", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.read(_v5, "cs"))), _S.read(_v5, "env")), _S.binary("+", 1, _S.binary("*", 0.4, _S.read(_v5, "g")))))
			if _S.truth(_S.binary("<", _S.read(_v5, "A"), 0.16)):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "i", 1, "+=", true)
				continue
			_S.define(_v5, "x", _S.binary("+", _S.binary("-", _S.read(_v5, "i"), _S.read(_v5, "VR")), 0.5))
			_S.define(_v5, "y", _S.binary("+", _S.binary("-", _S.binary("+", _S.read(_v5, "Y"), _S.read(_v5, "j")), _S.read(_v5, "VR")), 0.5))
			_S.define(_v5, "hot", _S.binary("-", 1, _S.call_value(_S.read(_v5, "smooth"), [_S.read(_v5, "GAP"), _S.binary("+", _S.read(_v5, "GAP"), 16), _S.read(_v5, "r")])))
			_S.define(_v5, "fil", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", 12, _S.prop(_S.prop(_S.read(_v5, "T"), "th"), _S.read(_v5, "k"))), _S.binary("*", 28, _S.prop(_S.prop(_S.read(_v5, "T"), "ln"), _S.read(_v5, "k")))), _S.binary("*", _S.read(_v5, "wf"), _S.read(_v5, "t"))), _S.binary("*", _S.prop(_S.prop(_S.read(_v5, "T"), "nz"), _S.read(_v5, "k")), 1.6))]))
			_S.define(_v5, "dash", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", 9, _S.prop(_S.prop(_S.read(_v5, "T"), "ln"), _S.read(_v5, "k"))), 2.2), _S.binary("*", 2.2, _S.prop(_S.prop(_S.read(_v5, "T"), "th"), _S.read(_v5, "k")))), _S.binary("*", _S.binary("*", _S.read(_v5, "wf"), 0.75), _S.read(_v5, "t")))]))
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v5, "fil"), 0.86), func(): return _S.binary(">", _S.read(_v5, "A"), 0.3)), func(): return _S.binary(">", _S.read(_v5, "dash"), _S.unary("-", 0.55)))):
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "c", (_S.prop(_S.read(_v6, "C"), 7) if _S.truth(_S.binary(">", _S.read(_v6, "hot"), 0.6)) else (_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.logical("&&", _S.logical("||", _S.binary(">", _S.read(_v6, "hot"), 0.25), func(): return _S.binary(">", _S.read(_v6, "fil"), 0.97)), func(): return _S.binary(">", _S.read(_v6, "dash"), 0))) else _S.prop(_S.read(_v6, "C"), 5))))
				_S.invoke(_S.read(_v6, "p"), "px", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "c")])
				_S.invoke(_S.read(_v6, "p"), "light", [_S.read(_v6, "x"), _S.read(_v6, "y"), _S.read(_v6, "c"), _S.binary("+", 0.1, _S.binary("*", 0.2, _S.read(_v6, "hot")))])
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "i", 1, "+=", true)
				continue
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v5, "A"), 0.36), func(): return _S.binary("<", _S.read(_v5, "A"), 0.46)), func(): return _S.binary(">", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "ph")]), 0))):
				var _v7 = _S.scope(_v5)
				_S.invoke(_S.read(_v7, "p"), "px", [_S.read(_v7, "x"), _S.read(_v7, "y"), (_S.prop(_S.read(_v7, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v7, "hot"), 0.4)) else _S.prop(_S.read(_v7, "C"), 4))])
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "i", 1, "+=", true)
				continue
			_S.invoke(_S.read(_v5, "p"), "blend", [_S.read(_v5, "x"), _S.read(_v5, "y"), (_S.prop(_S.read(_v5, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v5, "A"), 0.6)) else _S.prop(_S.read(_v5, "C"), 2)), _S.invoke(_S.read(_v5, "Math"), "min", [0.75, _S.binary("*", _S.binary("-", _S.read(_v5, "A"), 0.16), 1.4)])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "j", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	var _v8 = _S.scope(_e)
	_S.define(_v8, "a", 0)
	_S.define(_v8, "st", _S.binary("/", 0.7, _S.read(_v8, "E")))
	while _S.truth(_S.binary("<", _S.read(_v8, "a"), _S.read(_v8, "TAU"))):
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "f", _S.binary("+", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v9, "Math"), "cos", [_S.binary("-", _S.binary("*", 5, _S.read(_v9, "a")), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v9, "TAU"), 2), _S.read(_v9, "t")), _S.read(_v9, "D")))]))), _S.binary("*", 0.5, _S.read(_v9, "g"))))
		_S.invoke(_S.read(_v9, "p"), "px", [_S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "E")), _S.binary("+", _S.read(_v9, "Y"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "E"))), (_S.prop(_S.read(_v9, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v9, "f"), 0.85)) else (_S.prop(_S.read(_v9, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v9, "f"), 0.45)) else _S.prop(_S.read(_v9, "C"), 3)))])
		_v8 = _S.iteration(_v8)
		_S.write(_v8, "a", _S.read(_v8, "st"), "+=", false)
	for _v10 in _S.array(_S.read(_e, "SOURCES")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "s", _v10)
		var _v12 = _S.scope(_v11)
		_S.define(_v12, "q", _S.binary("+", _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v12, "TAU"), _S.prop(_S.read(_v12, "s"), "n")), _S.read(_v12, "t")), _S.read(_v12, "D")), _S.prop(_S.read(_v12, "s"), "ph")))
		_S.define(_v12, "sx", _S.binary("+", _S.prop(_S.read(_v12, "s"), "cx"), _S.binary("*", _S.prop(_S.read(_v12, "s"), "rho"), _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "q")]))))
		_S.define(_v12, "sy", _S.binary("+", _S.prop(_S.read(_v12, "s"), "cy"), _S.binary("*", _S.binary("*", _S.prop(_S.read(_v12, "s"), "rho"), _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "q")])), _S.prop(_S.read(_v12, "s"), "sy"))))
		_S.define(_v12, "b", _S.invoke(_S.read(_v12, "Math"), "max", [0.3, _S.invoke(_S.read(_v12, "Math"), "hypot", [_S.read(_v12, "sx"), _S.read(_v12, "sy")])]))
		_S.define(_v12, "al", _S.invoke(_S.read(_v12, "Math"), "atan2", [_S.read(_v12, "sy"), _S.read(_v12, "sx")]))
		_S.define(_v12, "root", _S.invoke(_S.read(_v12, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_v12, "b"), _S.read(_v12, "b")), _S.binary("*", _S.binary("*", 4, _S.read(_v12, "E")), _S.read(_v12, "E")))]))
		_S.define(_v12, "images", [[_S.binary("/", _S.binary("+", _S.read(_v12, "b"), _S.read(_v12, "root")), 2), _S.read(_v12, "al"), 1], [_S.binary("/", _S.binary("-", _S.read(_v12, "root"), _S.read(_v12, "b")), 2), _S.binary("+", _S.read(_v12, "al"), _S.prop(_S.read(_v12, "Math"), "PI")), 0.55]])
		for _v13 in _S.array(_S.read(_v12, "images")):
			var _v14 = _S.scope(_v12)
			var _v15 = _v13
			_S.define(_v14, "r", _S.prop(_v15, 0))
			_S.define(_v14, "a0", _S.prop(_v15, 1))
			_S.define(_v14, "w", _S.prop(_v15, 2))
			var _v16 = _S.scope(_v14)
			if _S.truth(_S.binary("<", _S.read(_v16, "r"), _S.binary("+", _S.read(_v16, "R"), 1.5))):
				continue
			_S.define(_v16, "mag", _S.binary("*", _S.binary("/", _S.read(_v16, "r"), _S.read(_v16, "b")), _S.read(_v16, "w")))
			_S.define(_v16, "hw", _S.invoke(_S.read(_v16, "Math"), "min", [_S.prop(_S.read(_v16, "Math"), "PI"), _S.binary("/", _S.binary("*", _S.prop(_S.read(_v16, "s"), "s"), 1.6), _S.binary("*", 2, _S.read(_v16, "b")))]))
			_S.define(_v16, "step", _S.binary("/", 0.6, _S.read(_v16, "r")))
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "a", _S.binary("-", _S.read(_v17, "a0"), _S.read(_v17, "hw")))
			while _S.truth(_S.binary("<=", _S.read(_v17, "a"), _S.binary("+", _S.binary("+", _S.read(_v17, "a0"), _S.read(_v17, "hw")), 0.000001))):
				var _v18 = _S.scope(_v17)
				_S.define(_v18, "u", (_S.binary("/", _S.invoke(_S.read(_v18, "Math"), "abs", [_S.binary("-", _S.read(_v18, "a"), _S.read(_v18, "a0"))]), _S.read(_v18, "hw")) if _S.truth(_S.binary(">", _S.read(_v18, "hw"), 0)) else 0))
				_S.define(_v18, "x", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), _S.read(_v18, "r")))
				_S.define(_v18, "y", _S.binary("+", _S.read(_v18, "Y"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), _S.read(_v18, "r"))))
				_S.invoke(_S.read(_v18, "p"), "dot", [_S.read(_v18, "x"), _S.read(_v18, "y"), (_S.read(_v18, "WHITE") if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v18, "u"), 0.3), func(): return _S.binary(">", _S.read(_v18, "mag"), 0.8))) else (_S.prop(_S.read(_v18, "C"), 7) if _S.truth(_S.binary("<", _S.read(_v18, "u"), 0.65)) else _S.prop(_S.read(_v18, "C"), 5))), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "min", [1, _S.binary("*", _S.read(_v18, "mag"), 1.4)]), _S.binary("-", 1.15, _S.read(_v18, "u")))])
				if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v18, "mag"), 1.2), func(): return _S.binary("<", _S.read(_v18, "u"), 0.6))):
					_S.invoke(_S.read(_v18, "p"), "dot", [_S.binary("+", _S.read(_v18, "x"), _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")])), _S.binary("+", _S.read(_v18, "y"), _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")])), _S.prop(_S.read(_v18, "C"), 6), 0.8])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "a", _S.read(_v17, "step"), "+=", false)
			_S.invoke(_S.read(_v16, "p"), "glow", [_S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a0")]), _S.read(_v16, "r")), _S.binary("+", _S.read(_v16, "Y"), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a0")]), _S.read(_v16, "r"))), _S.binary("+", 4, _S.invoke(_S.read(_v16, "Math"), "min", [10, _S.binary("*", _S.read(_v16, "hw"), _S.read(_v16, "r"))])), _S.prop(_S.read(_v16, "C"), 6), _S.invoke(_S.read(_v16, "Math"), "min", [0.5, _S.binary("*", 0.18, _S.read(_v16, "mag"))])])
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "C", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	_S.define(_e, "g", _S.arg(_args, 3))
	_S.invoke(_S.read(_e, "p"), "shade", [_S.binary("-", _S.unary("-", _S.read(_e, "R")), 1), _S.binary("-", _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "R")), 1), _S.binary("+", _S.read(_e, "R"), 1), _S.binary("+", _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "R")), 1), _S.function_value(_e, "_f4")])
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "dx", _S.read(_e, "x"))
	_S.define(_e, "dy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("+", _S.binary("*", _S.read(_e, "dx"), _S.read(_e, "dx")), _S.binary("*", _S.read(_e, "dy"), _S.read(_e, "dy")))]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("+", _S.read(_e, "R"), 0.5))):
		return null
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.read(_e, "dy"), _S.read(_e, "dx")]))
	if _S.truth(_S.binary(">", _S.read(_e, "d"), _S.binary("-", _S.read(_e, "R"), 0.6))):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "f", _S.binary("+", _S.binary("+", _S.binary("+", _S.binary("*", 0.5, _S.invoke(_S.read(_v19, "Math"), "cos", [_S.binary("-", _S.binary("*", 3, _S.read(_v19, "a")), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v19, "TAU"), 2), _S.read(_v19, "t")), _S.read(_v19, "D")))])), _S.binary("*", 0.3, _S.invoke(_S.read(_v19, "Math"), "cos", [_S.binary("+", _S.binary("+", _S.binary("*", 7, _S.read(_v19, "a")), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v19, "TAU"), 3), _S.read(_v19, "t")), _S.read(_v19, "D"))), 1)]))), _S.binary("*", 0.25, _S.invoke(_S.read(_v19, "Math"), "cos", [_S.binary("+", _S.binary("-", _S.binary("*", 13, _S.read(_v19, "a")), _S.binary("/", _S.binary("*", _S.binary("*", _S.read(_v19, "TAU"), 5), _S.read(_v19, "t")), _S.read(_v19, "D"))), 2)]))), _S.read(_v19, "g")))
		return (_S.read(_v19, "WHITE") if _S.truth(_S.binary(">", _S.read(_v19, "f"), 0.5)) else (_S.prop(_S.read(_v19, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v19, "f"), 0.05)) else (_S.prop(_S.read(_v19, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v19, "f"), _S.unary("-", 0.4))) else _S.prop(_S.read(_v19, "C"), 4))))
	if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("-", _S.read(_e, "R"), _S.read(_e, "d")), 1.4), func(): return _S.binary(">", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("-", _S.read(_e, "a"), 0.8)]), 0.6))):
		return _S.prop(_S.read(_e, "C"), 2)
	if _S.truth(_S.binary("<", _S.binary("+", _S.binary("**", _S.binary("+", _S.read(_e, "dx"), _S.binary("*", _S.read(_e, "R"), 0.42)), 2), _S.binary("**", _S.binary("+", _S.read(_e, "dy"), _S.binary("*", _S.read(_e, "R"), 0.45)), 2)), 1.6)):
		return _S.prop(_S.read(_e, "C"), 3)
	return _S.prop(_S.read(_e, "C"), 0)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "gulp"), [_S.read(_e, "t")]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 1), 52, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.22, _S.binary("*", 0.1, _S.read(_e, "g")))])
	_S.call_value(_S.read(_e, "vortex"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "g")])
	_S.call_value(_S.read(_e, "lensing"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "g")])
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "g", _S.call_value(_S.read(_e, "gulp"), [_S.read(_e, "t")]))
	_S.define(_e, "S", _S.prop(_S.read(_e, "o"), "seed"))
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 14, _S.binary("+", _S.read(_e, "S"), 2), _S.function_value(_e, "_f7"), _S.function_value(_e, "_f8")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 30, _S.read(_e, "S"), _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	_S.call_value(_S.read(_e, "cycle"), [_S.read(_e, "t"), _S.read(_e, "D"), 9, _S.binary("+", _S.read(_e, "S"), 1), 0.42, _S.function_value(_e, "_f12")])
	for _v24 in _S.array(_S.read(_e, "GULPS")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "gp", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "u", _S.binary("/", _S.call_value(_S.read(_v26, "wrap"), [_S.binary("-", _S.binary("/", _S.read(_v26, "t"), _S.read(_v26, "D")), _S.read(_v26, "gp"))]), _S.binary("/", 0.4, _S.read(_v26, "D"))))
		if _S.truth(_S.binary(">=", _S.read(_v26, "u"), 1)):
			continue
		_S.define(_v26, "rr", _S.binary("+", _S.binary("+", _S.read(_v26, "R"), 2), _S.binary("*", _S.binary("-", _S.read(_v26, "VR"), _S.read(_v26, "R")), _S.binary("-", 1, _S.invoke(_S.read(_v26, "ease"), "inQuad", [_S.read(_v26, "u")])))))
		_S.call_value(_S.read(_v26, "ringFast"), [_S.read(_v26, "p"), 0, _S.read(_v26, "Y"), _S.read(_v26, "rr"), 1, _S.prop(_S.read(_v26, "C"), 4), _S.binary("*", 0.35, _S.binary("-", 1, _S.read(_v26, "u")))])
		_S.call_value(_S.read(_v26, "ringLight"), [_S.read(_v26, "p"), 0, _S.read(_v26, "Y"), _S.read(_v26, "rr"), 4, _S.prop(_S.read(_v26, "C"), 5), _S.binary("*", 0.3, _S.binary("-", 1, _S.read(_v26, "u")))])
	_S.call_value(_S.read(_e, "orb"), [_S.read(_e, "p"), _S.read(_e, "C"), _S.read(_e, "t"), _S.read(_e, "g")])
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p"), 0, _S.read(_e, "Y"), _S.binary("-", _S.read(_e, "R"), 0.5), _S.binary("+", _S.read(_e, "R"), 7), _S.prop(_S.read(_e, "C"), 6), _S.binary("+", 0.6, _S.binary("*", 0.3, _S.read(_e, "g")))])
	_S.call_value(_S.read(_e, "halo"), [_S.read(_e, "p"), 0, _S.read(_e, "Y"), _S.binary("-", _S.read(_e, "R"), 0.5), _S.binary("+", _S.read(_e, "R"), 46), _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.38, _S.binary("*", 0.15, _S.read(_e, "g")))])
	_S.call_value(_S.read(_e, "unlight"), [_S.read(_e, "p"), _S.unary("-", _S.read(_e, "R")), _S.binary("-", _S.read(_e, "Y"), _S.read(_e, "R")), _S.read(_e, "R"), _S.binary("+", _S.read(_e, "Y"), _S.read(_e, "R")), _S.function_value(_e, "_f13")])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.6, 2.4])

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "x0", _S.invoke(_S.read(_e, "r"), "range", [_S.unary("-", 44), 44]))
	_S.define(_e, "u", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")), 1.7]))
	_S.define(_e, "side", _S.logical("||", _S.invoke(_S.read(_e, "Math"), "sign", [_S.read(_e, "x0")]), func(): return 1))
	_S.define(_e, "ea", _S.binary("+", _S.binary("/", _S.prop(_S.read(_e, "Math"), "PI"), 2), _S.binary("*", _S.read(_e, "side"), _S.invoke(_S.read(_e, "r"), "range", [0.3, 1]))))
	_S.define(_e, "ex", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "ea")]), _S.read(_e, "R")))
	_S.define(_e, "ey", _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "ea")]), _S.read(_e, "R"))))
	_S.define(_e, "mx", _S.binary("*", _S.read(_e, "x0"), 0.2))
	_S.define(_e, "my", _S.binary("-", _S.unary("-", 18), _S.invoke(_S.read(_e, "r"), "range", [0, 12])))
	_S.define(_e, "x", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), _S.binary("-", 1, _S.read(_e, "u"))), _S.read(_e, "x0")), _S.binary("*", _S.binary("*", _S.binary("*", 2, _S.binary("-", 1, _S.read(_e, "u"))), _S.read(_e, "u")), _S.read(_e, "mx"))), _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.read(_e, "ex"))))
	_S.define(_e, "y", _S.binary("+", _S.binary("+", _S.binary("*", _S.binary("*", _S.binary("-", 1, _S.read(_e, "u")), _S.binary("-", 1, _S.read(_e, "u"))), _S.unary("-", 1)), _S.binary("*", _S.binary("*", _S.binary("*", 2, _S.binary("-", 1, _S.read(_e, "u"))), _S.read(_e, "u")), _S.read(_e, "my"))), _S.binary("*", _S.binary("*", _S.read(_e, "u"), _S.read(_e, "u")), _S.read(_e, "ey"))))
	if _S.truth(_S.binary("<", _S.read(_e, "age"), 0.5)):
		_S.invoke(_S.read(_e, "p"), "disc", [_S.read(_e, "x0"), _S.unary("-", 1.5), _S.binary("+", 2, _S.binary("*", _S.read(_e, "age"), 6)), _S.prop(_S.read(_e, "C"), 3), _S.binary("*", 0.4, _S.binary("-", 1, _S.binary("/", _S.read(_e, "age"), 0.5)))])
	_S.invoke(_S.read(_e, "p"), "dot", [_S.read(_e, "x"), _S.read(_e, "y"), (_S.prop(_S.read(_e, "C"), 7) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.6)) else (_S.prop(_S.read(_e, "C"), 6) if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.25)) else _S.prop(_S.read(_e, "C"), 5))), _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 4)])])
	if _S.truth(_S.binary(">", _S.read(_e, "u"), 0.3)):
		_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.prop(_S.read(_e, "C"), 5), 0.25])
	return null

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "r", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "r"), "range", [1.1, 1.8])

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th0", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th0")]), 0.75)):
		_S.write(_e, "th0", _S.unary("-", _S.read(_e, "th0")), "=", false)
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "r"), "range", [30, 64]))
	_S.define(_e, "sw", _S.invoke(_S.read(_e, "r"), "range", [1.4, 2.6]))
	_S.define(_e, "col", _S.invoke(_S.read(_e, "r"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5)]]))
	_S.define(_e, "pos", _S.function_value(_e, "_f11"))
	var _v20 = _S.call_value(_S.read(_e, "pos"), [_S.read(_e, "age")])
	_S.define(_e, "x", _S.prop(_v20, 0))
	_S.define(_e, "y", _S.prop(_v20, 1))
	_S.define(_e, "rr", _S.prop(_v20, 2))
	var _v21 = _S.call_value(_S.read(_e, "pos"), [_S.binary("-", _S.read(_e, "age"), 0.05)])
	_S.define(_e, "tx", _S.prop(_v21, 0))
	_S.define(_e, "ty", _S.prop(_v21, 1))
	_S.define(_e, "a", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "age"), 5)]))
	if _S.truth(_S.binary("<", _S.read(_e, "rr"), _S.binary("+", _S.read(_e, "R"), 3))):
		var _v22 = _S.scope(_e)
		_S.invoke(_S.read(_v22, "p"), "px", [_S.read(_v22, "x"), _S.read(_v22, "y"), _S.read(_v22, "WHITE")])
		_S.invoke(_S.read(_v22, "p"), "glow", [_S.read(_v22, "x"), _S.read(_v22, "y"), 5, _S.prop(_S.read(_v22, "C"), 6), 0.5])
		return null
	_S.invoke(_S.read(_e, "p"), "line", [_S.read(_e, "tx"), _S.read(_e, "ty"), _S.binary("/", _S.binary("+", _S.read(_e, "tx"), _S.read(_e, "x")), 2), _S.binary("/", _S.binary("+", _S.read(_e, "ty"), _S.read(_e, "y")), 2), _S.prop(_S.read(_e, "C"), 4), _S.binary("*", _S.read(_e, "a"), 0.8)])
	_S.invoke(_S.read(_e, "p"), "line", [_S.binary("/", _S.binary("+", _S.read(_e, "tx"), _S.read(_e, "x")), 2), _S.binary("/", _S.binary("+", _S.read(_e, "ty"), _S.read(_e, "y")), 2), _S.read(_e, "x"), _S.read(_e, "y"), _S.read(_e, "col"), _S.read(_e, "a")])
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "x"), _S.read(_e, "y"), 3, _S.read(_e, "col"), _S.binary("*", 0.3, _S.read(_e, "a"))])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "aa", _S.arg(_args, 0))
	_S.define(_e, "u", _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "aa"), _S.read(_e, "L"))]))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "pow", [_S.read(_e, "u"), 1.8]))
	_S.define(_e, "rr", _S.binary("+", _S.binary("+", _S.read(_e, "R"), 1), _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_e, "r0"), _S.read(_e, "R")), 1), _S.binary("-", 1, _S.read(_e, "k")))))
	_S.define(_e, "th", _S.binary("-", _S.read(_e, "th0"), _S.binary("*", _S.read(_e, "sw"), _S.binary("+", _S.read(_e, "k"), _S.binary("*", 0.5, _S.read(_e, "u"))))))
	return [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]), _S.read(_e, "rr")), _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), _S.read(_e, "rr"))), _S.read(_e, "rr")]

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "age", _S.arg(_args, 0))
	_S.define(_e, "L", _S.arg(_args, 1))
	_S.define(_e, "r", _S.arg(_args, 2))
	_S.define(_e, "th", _S.invoke(_S.read(_e, "r"), "range", [0, _S.read(_e, "TAU")]))
	if _S.truth(_S.binary(">", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]), 0.45)):
		_S.write(_e, "th", _S.unary("-", _S.read(_e, "th")), "=", false)
	_S.define(_e, "r0", _S.invoke(_S.read(_e, "r"), "range", [56, 74]))
	_S.define(_e, "u", _S.binary("/", _S.read(_e, "age"), _S.read(_e, "L")))
	_S.define(_e, "k", _S.binary("/", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "exp", [_S.binary("*", 3, _S.read(_e, "u"))]), 1), _S.binary("-", _S.invoke(_S.read(_e, "Math"), "exp", [3]), 1)))
	_S.define(_e, "rr", _S.binary("-", _S.read(_e, "r0"), _S.binary("*", _S.binary("-", _S.binary("-", _S.read(_e, "r0"), _S.read(_e, "R")), 1), _S.read(_e, "k"))))
	_S.define(_e, "len", _S.binary("+", 2, _S.binary("*", 10, _S.read(_e, "k"))))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")]))
	_S.define(_e, "sa", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")]))
	var _v23 = _S.scope(_e)
	_S.define(_v23, "d", 0)
	while _S.truth(_S.binary("<=", _S.read(_v23, "d"), _S.read(_v23, "len"))):
		_S.invoke(_S.read(_v23, "p"), "dot", [_S.binary("*", _S.read(_v23, "ca"), _S.binary("+", _S.read(_v23, "rr"), _S.read(_v23, "d"))), _S.binary("+", _S.read(_v23, "Y"), _S.binary("*", _S.read(_v23, "sa"), _S.binary("+", _S.read(_v23, "rr"), _S.read(_v23, "d")))), (_S.read(_v23, "WHITE") if _S.truth(_S.binary("<", _S.read(_v23, "d"), 1)) else (_S.prop(_S.read(_v23, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v23, "d"), _S.binary("*", _S.read(_v23, "len"), 0.5))) else _S.prop(_S.read(_v23, "C"), 4))), (1 if _S.truth(_S.binary("<", _S.read(_v23, "d"), _S.binary("*", _S.read(_v23, "len"), 0.5))) else _S.binary("-", 1.2, _S.binary("/", _S.read(_v23, "d"), _S.read(_v23, "len"))))])
		_v23 = _S.iteration(_v23)
		_S.write(_v23, "d", 0.5, "+=", false)
	_S.invoke(_S.read(_e, "p"), "glow", [_S.binary("*", _S.read(_e, "ca"), _S.read(_e, "rr")), _S.binary("+", _S.read(_e, "Y"), _S.binary("*", _S.read(_e, "sa"), _S.read(_e, "rr"))), 4, _S.prop(_S.read(_e, "C"), 6), 0.4])
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.binary("<", _S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "x")), _S.binary("**", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "Y")), 2)), _S.binary("**", _S.binary("-", _S.read(_e, "R"), 0.6), 2))

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "GULPS"), "reduce", [_S.function_value(_e, "_f16"), 0])

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "g", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "s"), _S.invoke(_S.read(_e, "Math"), "exp", [_S.unary("-", _S.binary("**", _S.binary("/", _S.binary("*", _S.binary("-", _S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.binary("-", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "D")), _S.read(_e, "g")), 0.5)]), 0.5), _S.read(_e, "D")), 0.07), 2))]))
