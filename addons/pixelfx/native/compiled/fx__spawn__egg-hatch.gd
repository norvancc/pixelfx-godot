@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/egg-hatch.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Egg hatch"}, {"desc": "A speckled egg rocks three times, each rock cracking it further with warm light leaking out, then pops: light pours out of the opening and lit shell halves tumble away."}, {"tags": ["spawn", "egg", "hatch", "birth", "crack", "shell", "light", "ground", "one-shot"]}, {"size": [120, 96]}, {"origin": [60, 84]}, {"duration": 3.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1e1826", "#4a3e52", "#857684", "#c4b4ac", "#ece0d2", "#fffaf0"]}, {"glow": ["#ff8a2a", "#ffd25a", "#fff3c0"]}, {"speckle": "#9a6a52"}, {"seed": 31}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "WOBBLES", [[0.3, 0.11], [0.85, 0.19], [1.4, 0.28]])
	_S.define(_e, "POP", 1.98)
	_S.define(_e, "EW", 16)
	_S.define(_e, "EH", 20)
	_S.define(_e, "ZY", 11)
	_S.define(_e, "LIGHT", [_S.unary("-", 0.72), 0.5, 0.48])
	_S.define(_e, "EGG", [])
	var _v76 = _S.scope(_e)
	_S.define(_v76, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v76, "y"), _S.read(_v76, "EH"))):
		var _v77 = _S.scope(_v76)
		_S.define(_v77, "x", _S.binary("/", _S.unary("-", _S.read(_v77, "EW")), 2))
		while _S.truth(_S.binary("<", _S.read(_v77, "x"), _S.binary("/", _S.read(_v77, "EW"), 2))):
			var _v78 = _S.scope(_v77)
			_S.define(_v78, "v", _S.binary("/", _S.binary("+", _S.read(_v78, "y"), 0.5), _S.read(_v78, "EH")))
			_S.define(_v78, "u", _S.binary("/", _S.binary("+", _S.read(_v78, "x"), 0.5), _S.binary("/", _S.read(_v78, "EW"), 2)))
			_S.define(_v78, "half", _S.binary("*", _S.invoke(_S.read(_v78, "Math"), "sqrt", [_S.invoke(_S.read(_v78, "Math"), "max", [0, _S.binary("-", 1, _S.binary("**", _S.binary("-", _S.binary("*", 2, _S.read(_v78, "v")), 1), 2))])]), _S.binary("-", 1.08, _S.binary("*", 0.22, _S.read(_v78, "v")))))
			if _S.truth(_S.binary("<=", _S.invoke(_S.read(_v78, "Math"), "abs", [_S.read(_v78, "u")]), _S.read(_v78, "half"))):
				_S.invoke(_S.read(_v78, "EGG"), "push", [_S.merge([{"x": _S.read(_v78, "x")}, {"y": _S.read(_v78, "y")}, {"u": _S.read(_v78, "u")}, {"v": _S.read(_v78, "v")}, {"half": _S.read(_v78, "half")}])])
			_v77 = _S.iteration(_v77)
			_S.write(_v77, "x", 1, "+=", true)
		_v76 = _S.iteration(_v76)
		_S.write(_v76, "y", 1, "+=", true)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "breakUp", _S.function_value(_e, "_f1"))
	_S.define(_e, "pop", _S.function_value(_e, "_f7"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 6]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 3]))
	_S.define(_e, "SPK", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "speckle")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f11"))
	_S.define(_e, "at", _S.construct(_S.read(_e, "Map"), []))
	for _v22 in _S.array(_S.read(_e, "EGG")):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "e", _v22)
		_S.invoke(_S.read(_v23, "at"), "set", [("" + _S.string(_S.prop(_S.read(_v23, "e"), "x")) + "," + _S.string(_S.prop(_S.read(_v23, "e"), "y")) + ""), _S.read(_v23, "e")])
	_S.define(_e, "has", _S.function_value(_e, "_f12"))
	for _v24 in _S.array(_S.read(_e, "EGG")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "e", _v24)
		var _v26 = _S.scope(_v25)
		_S.define(_v26, "nx", _S.call_value(_S.read(_v26, "clamp"), [_S.binary("/", _S.prop(_S.read(_v26, "e"), "u"), _S.invoke(_S.read(_v26, "Math"), "max", [0.05, _S.prop(_S.read(_v26, "e"), "half")])), _S.unary("-", 1), 1]))
		_S.define(_v26, "ny", _S.binary("*", _S.binary("-", _S.binary("*", 2, _S.prop(_S.read(_v26, "e"), "v")), 1), 0.9))
		_S.define(_v26, "nz", _S.invoke(_S.read(_v26, "Math"), "sqrt", [_S.invoke(_S.read(_v26, "Math"), "max", [0, _S.binary("-", _S.binary("-", 1, _S.binary("*", _S.read(_v26, "nx"), _S.read(_v26, "nx"))), _S.binary("*", _S.read(_v26, "ny"), _S.read(_v26, "ny")))])]))
		_S.define(_v26, "d", _S.binary("+", _S.binary("+", _S.binary("*", _S.read(_v26, "nx"), _S.prop(_S.read(_v26, "LIGHT"), 0)), _S.binary("*", _S.read(_v26, "ny"), _S.prop(_S.read(_v26, "LIGHT"), 1))), _S.binary("*", _S.read(_v26, "nz"), _S.prop(_S.read(_v26, "LIGHT"), 2))))
		_S.define(_v26, "edge", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v26, "has"), [_S.binary("-", _S.prop(_S.read(_v26, "e"), "x"), 1), _S.prop(_S.read(_v26, "e"), "y")])), func(): return _S.unary("!", _S.call_value(_S.read(_v26, "has"), [_S.binary("+", _S.prop(_S.read(_v26, "e"), "x"), 1), _S.prop(_S.read(_v26, "e"), "y")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v26, "has"), [_S.prop(_S.read(_v26, "e"), "x"), _S.binary("-", _S.prop(_S.read(_v26, "e"), "y"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v26, "has"), [_S.prop(_S.read(_v26, "e"), "x"), _S.binary("+", _S.prop(_S.read(_v26, "e"), "y"), 1)]))))
		_S.define(_v26, "c", (_S.read(_v26, "WHITE") if _S.truth(_S.binary(">", _S.read(_v26, "d"), 0.9)) else (_S.prop(_S.read(_v26, "C"), 5) if _S.truth(_S.binary(">", _S.read(_v26, "d"), 0.62)) else (_S.prop(_S.read(_v26, "C"), 4) if _S.truth(_S.binary(">", _S.read(_v26, "d"), 0.32)) else (_S.prop(_S.read(_v26, "C"), 3) if _S.truth(_S.binary(">", _S.read(_v26, "d"), 0.02)) else (_S.prop(_S.read(_v26, "C"), 2) if _S.truth(_S.binary(">", _S.read(_v26, "d"), _S.unary("-", 0.3))) else _S.prop(_S.read(_v26, "C"), 1)))))))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v26, "edge"), func(): return _S.binary(">", _S.read(_v26, "nx"), 0.25)), func(): return _S.binary("<", _S.read(_v26, "ny"), 0.55))):
			_S.write(_v26, "c", _S.prop(_S.read(_v26, "C"), 3), "=", false)
		else:
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary("<", _S.call_value(_S.read(_v26, "rand"), [_S.prop(_S.read(_v26, "e"), "x"), _S.prop(_S.read(_v26, "e"), "y"), 3]), 0.08), func(): return _S.binary(">", _S.prop(_S.read(_v26, "e"), "v"), 0.12)), func(): return _S.unary("!", _S.read(_v26, "edge")))):
				_S.write(_v26, "c", (_S.read(_v26, "SPK") if _S.truth(_S.binary(">", _S.read(_v26, "d"), 0.2)) else _S.call_value(_S.read(_v26, "mix"), [_S.read(_v26, "SPK"), _S.prop(_S.read(_v26, "C"), 1), 0.5])), "=", false)
		_S.set_prop(_S.read(_v26, "e"), "c", _S.read(_v26, "c"), "=", false)
		_S.set_prop(_S.read(_v26, "e"), "lit", _S.read(_v26, "d"), "=", false)
	_S.define(_e, "crack", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "walk", _S.function_value(_e, "_f13"))
	_S.call_value(_S.read(_e, "walk"), [2, 15, _S.unary("-", 2.2), 3, 0])
	_S.call_value(_S.read(_e, "walk"), [2, 15, 0.3, 2, 0])
	_S.call_value(_S.read(_e, "walk"), [_S.unary("-", 2), 13, _S.unary("-", 0.6), 3, 1])
	_S.call_value(_S.read(_e, "walk"), [_S.unary("-", 2), 13, 2.7, 3, 1])
	_S.call_value(_S.read(_e, "walk"), [3, 11, 1.9, 2, 1])
	_S.call_value(_S.read(_e, "walk"), [2, 15, 1.5, 2, 1])
	_S.define(_e, "zig", [])
	var _v31 = _S.scope(_e)
	_S.define(_v31, "x", _S.binary("/", _S.unary("-", _S.read(_v31, "EW")), 2))
	while _S.truth(_S.binary("<", _S.read(_v31, "x"), _S.binary("/", _S.read(_v31, "EW"), 2))):
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "y", _S.binary("+", _S.read(_v32, "ZY"), (1 if _S.truth(_S.binary("===", _S.binary("%", _S.binary("+", _S.read(_v32, "x"), 8), 3), 0)) else (0 if _S.truth(_S.binary("===", _S.binary("%", _S.binary("+", _S.read(_v32, "x"), 8), 3), 1)) else _S.unary("-", 1)))))
		_S.invoke(_S.read(_v32, "zig"), "push", [_S.read(_v32, "y")])
		if _S.truth(_S.call_value(_S.read(_v32, "has"), [_S.read(_v32, "x"), _S.read(_v32, "y")])):
			_S.invoke(_S.read(_v32, "crack"), "set", [("" + _S.string(_S.read(_v32, "x")) + "," + _S.string(_S.read(_v32, "y")) + ""), 2])
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "x", 1, "+=", true)
	_S.define(_e, "zigAt", _S.function_value(_e, "_f14"))
	_S.define(_e, "near", _S.invoke([0, 1, 2], "map", [_S.function_value(_e, "_f15")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1), _S.prop(_S.read(_e, "G"), 0)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "pieces", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "crumbled", false)
	_S.define(_e, "cupA", 0)
	_S.define(_e, "cupV", 0)
	_S.define(_e, "done", [false, false, false])
	_S.define(_e, "CRUMBLE", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.55))
	_S.define(_e, "stage", _S.function_value(_e, "_f19"))
	_S.define(_e, "angle", _S.function_value(_e, "_f20"))
	_S.define(_e, "inner", _S.function_value(_e, "_f21"))
	return _S.merge([{"update": _S.function_value(_e, "_f22")}, {"drawBack": _S.function_value(_e, "_f27")}, {"draw": _S.function_value(_e, "_f28")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "keep", _S.arg(_args, 0))
	_S.define(_e, "n", _S.arg(_args, 1))
	_S.define(_e, "v", _S.arg(_args, 2))
	_S.define(_e, "life", _S.arg(_args, 3))
	_S.define(_e, "seeds", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "n")}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "cells", _S.construct(_S.read(_e, "Map"), []))
	for _v0 in _S.array(_S.read(_e, "EGG")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "e", _v0)
		var _v2 = _S.scope(_v1)
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v2, "keep"), [_S.prop(_S.read(_v2, "e"), "x"), _S.prop(_S.read(_v2, "e"), "y")]))):
			continue
		_S.define(_v2, "best", 0)
		_S.define(_v2, "bd", 1000000000)
		_S.invoke(_S.read(_v2, "seeds"), "forEach", [_S.function_value(_v2, "_f3")])
		if _S.truth(_S.unary("!", _S.invoke(_S.read(_v2, "cells"), "has", [_S.read(_v2, "best")]))):
			_S.invoke(_S.read(_v2, "cells"), "set", [_S.read(_v2, "best"), []])
		_S.invoke(_S.invoke(_S.read(_v2, "cells"), "get", [_S.read(_v2, "best")]), "push", [_S.read(_v2, "e")])
	for _v4 in _S.array(_S.invoke(_S.read(_e, "cells"), "values", [])):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "px", _v4)
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "cx", 0)
		_S.define(_v6, "cy", 0)
		for _v7 in _S.array(_S.read(_v6, "px")):
			var _v8 = _S.scope(_v6)
			_S.define(_v8, "e", _v7)
			_S.last([_S.write(_v8, "cx", _S.binary("+", _S.prop(_S.read(_v8, "e"), "x"), 0.5), "+=", false), _S.write(_v8, "cy", _S.binary("+", _S.prop(_S.read(_v8, "e"), "y"), 0.5), "+=", false)])
		_S.last([_S.write(_v6, "cx", _S.prop(_S.read(_v6, "px"), "length"), "/=", false), _S.write(_v6, "cy", _S.prop(_S.read(_v6, "px"), "length"), "/=", false)])
		_S.define(_v6, "map", _S.construct(_S.read(_v6, "Map"), []))
		_S.define(_v6, "mine", _S.construct(_S.read(_v6, "Set"), [_S.invoke(_S.read(_v6, "px"), "map", [_S.function_value(_v6, "_f4")])]))
		for _v9 in _S.array(_S.read(_v6, "px")):
			var _v10 = _S.scope(_v6)
			_S.define(_v10, "e", _v9)
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "edge", _S.invoke([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]], "some", [_S.function_value(_v11, "_f5")]))
			_S.define(_v11, "c", (_S.prop(_S.read(_v11, "C"), 3) if _S.truth(_S.logical("||", _S.binary("===", _S.prop(_S.read(_v11, "e"), "c"), _S.prop(_S.read(_v11, "C"), 1)), func(): return _S.binary("===", _S.prop(_S.read(_v11, "e"), "c"), _S.prop(_S.read(_v11, "C"), 2)))) else _S.prop(_S.read(_v11, "e"), "c")))
			_S.invoke(_S.read(_v11, "map"), "set", [("" + _S.string(_S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("-", _S.binary("+", _S.prop(_S.read(_v11, "e"), "x"), 0.5), _S.read(_v11, "cx"))])) + "," + _S.string(_S.invoke(_S.read(_v11, "Math"), "round", [_S.unary("-", _S.binary("-", _S.binary("+", _S.prop(_S.read(_v11, "e"), "y"), 0.5), _S.read(_v11, "cy")))])) + ""), [_S.read(_v11, "c"), _S.read(_v11, "edge")]])
		_S.define(_v6, "r", _S.binary("+", _S.invoke(_S.read(_v6, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.read(_v6, "px"), "map", [_S.function_value(_v6, "_f6")]))])), 1))
		var _v13 = _S.call_value(_S.read(_v6, "v"), [_S.read(_v6, "cx"), _S.read(_v6, "cy")])
		_S.define(_v6, "vx", _S.prop(_v13, 0))
		_S.define(_v6, "vy", _S.prop(_v13, 1))
		_S.define(_v6, "l", _S.call_value(_S.read(_v6, "life"), []))
		_S.invoke(_S.read(_v6, "pieces"), "push", [_S.merge([{"id": _S.binary("+", _S.prop(_S.read(_v6, "pieces"), "length"), 1)}, {"x": _S.read(_v6, "cx")}, {"y": _S.unary("-", _S.read(_v6, "cy"))}, {"vx": _S.read(_v6, "vx")}, {"vy": _S.read(_v6, "vy")}, {"a": 0}, {"va": _S.invoke(_S.read(_v6, "R"), "range", [_S.unary("-", 10), 10])}, {"r": _S.read(_v6, "r")}, {"map": _S.read(_v6, "map")}, {"life": _S.read(_v6, "l")}, {"max": _S.read(_v6, "l")}, {"rest": false}, {"born": _S.read(_v6, "t")}])])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_EW = _S.read(_parent,"EW")
	var _n_EH = _S.read(_parent,"EH")
	return [_S.invoke(_n_R,"range",[((float((-_n_EW))/2) + 1), ((float(_n_EW)/2) - 1)]), _S.invoke(_n_R,"range",[0, _n_EH])]
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v3 = _S.arg(_args, 0)
	_S.define(_e, "sx", _S.prop(_v3, 0))
	_S.define(_e, "sy", _S.prop(_v3, 1))
	_S.define(_e, "i", _S.arg(_args, 1))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.prop(_S.read(_e, "e"), "x"), _S.read(_e, "sx")), _S.binary("-", _S.prop(_S.read(_e, "e"), "y"), _S.read(_e, "sy"))]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.read(_e, "bd"))):
		_S.last([_S.write(_e, "bd", _S.read(_e, "d"), "=", false), _S.write(_e, "best", _S.read(_e, "i"), "=", false)])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_e_b0 = _S.arg(_args,0)
	return ("" + _S.string(_S.named_value(_n_e_b0,"x")) + "," + _S.string(_S.named_value(_n_e_b0,"y")) + "")
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_mine = _S.read(_parent,"mine")
	var _n_e = _S.read(_parent,"e")
	var _n_has = _S.read(_parent,"has")
	var _tuple_0 = _S.arg(_args,0)
	var _n_dx_b0 = _S.prop(_tuple_0,0)
	var _n_dy_b1 = _S.prop(_tuple_0,1)
	return _S.logical("&&",not _S.truth(_S.invoke(_n_mine,"has",[("" + _S.string((_S.named_value(_n_e,"x") + _n_dx_b0)) + "," + _S.string((_S.named_value(_n_e,"y") + _n_dy_b1)) + "")])),func():return _S.call_value(_n_has,[(_S.named_value(_n_e,"x") + _n_dx_b0), (_S.named_value(_n_e,"y") + _n_dy_b1)]))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_cx = _S.read(_parent,"cx")
	var _n_cy = _S.read(_parent,"cy")
	var _n_e_b0 = _S.arg(_args,0)
	return _S.Bridge.hypot([((_S.named_value(_n_e_b0,"x") + 0.5) - _n_cx), ((_S.named_value(_n_e_b0,"y") + 0.5) - _n_cy)])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.write(_e, "popped", true, "=", false)
	_S.call_value(_S.read(_e, "breakUp"), [_S.function_value(_e, "_f8"), 6, _S.function_value(_e, "_f9"), _S.function_value(_e, "_f10")])
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v14, "i"), 14)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v15, "Math"), "PI")), 2), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 1.2), 1.2])))
		_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "R"), "range", [70, 170]))
		_S.invoke(_S.read(_v15, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v15, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 5), 5])}, {"y": _S.binary("-", _S.unary("-", _S.read(_v15, "ZY")), _S.invoke(_S.read(_v15, "R"), "range", [0, 4]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp"))}, {"g": 0.9}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v15, "R"), "range", [0.55, 0.85])}, {"a": _S.invoke(_S.read(_v15, "R"), "range", [0, _S.read(_v15, "TAU")])}, {"va": _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v15, "R"), "range", [1.2, 2.4])}, {"c": _S.invoke(_S.read(_v15, "R"), "pick", [[_S.prop(_S.read(_v15, "C"), 5), _S.prop(_S.read(_v15, "C"), 5), _S.prop(_S.read(_v15, "C"), 4), _S.prop(_S.read(_v15, "G"), 2)]])}])])
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 12)):
		var _v17 = _S.scope(_v16)
		_S.define(_v17, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v17, "Math"), "PI")), 2), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 1.1), 1.1])))
		_S.define(_v17, "sp", _S.invoke(_S.read(_v17, "R"), "range", [50, 110]))
		_S.invoke(_S.read(_v17, "ps"), "spawn", [_S.prop(_S.read(_v17, "P"), "STAR"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("-", _S.unary("-", _S.read(_v17, "ZY")), 2), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "cos", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.binary("*", _S.invoke(_S.read(_v17, "Math"), "sin", [_S.read(_v17, "a")]), _S.read(_v17, "sp")), _S.invoke(_S.read(_v17, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v17, "R"), "pick", [[_S.read(_v17, "WHITE"), _S.prop(_S.read(_v17, "G"), 2), _S.prop(_S.read(_v17, "G"), 1)]]), _S.invoke(_S.read(_v17, "R"), "range", [1, 2.2])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	var _v18 = _S.scope(_e)
	_S.define(_v18, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v18, "i"), 10)):
		var _v19 = _S.scope(_v18)
		_S.define(_v19, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 2), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 1), 1])))
		_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [100, 200]))
		_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "SPARK"), _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", 3), 3]), _S.binary("-", _S.unary("-", _S.read(_v19, "ZY")), 1), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.2, 0.45])])
		_v18 = _S.iteration(_v18)
		_S.write(_v18, "i", 1, "+=", true)
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), 4)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "s", _S.invoke(_S.read(_v21, "R"), "sign", []))
		_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "DUST"), _S.binary("*", _S.read(_v21, "s"), _S.invoke(_S.read(_v21, "R"), "range", [5, 8])), _S.unary("-", 1), _S.binary("*", _S.read(_v21, "s"), _S.invoke(_S.read(_v21, "R"), "range", [25, 50])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [2, 6])), _S.invoke(_S.read(_v21, "R"), "range", [0.15, 0.25]), _S.prop(_S.read(_v21, "C"), 5), _S.invoke(_S.read(_v21, "R"), "range", [1, 1.8])])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("-", _S.unary("-", _S.read(_e, "ZY")), 10), 40, _S.prop(_S.read(_e, "G"), 1), 0.9, 0.55])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("-", _S.unary("-", _S.read(_e, "ZY")), 2), 18, _S.read(_e, "WHITE"), 0.9, 0.12])
	_S.write(_e, "cupV", _S.binary("*", _S.invoke(_S.read(_e, "R"), "sign", []), 3), "=", false)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_zigAt = _S.read(_parent,"zigAt")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_n_y_b1 >= _S.call_value(_n_zigAt,[_n_x_b0]))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_cx_b0 = _S.arg(_args,0)
	return [((_n_cx_b0 * _S.invoke(_n_R,"range",[8, 13])) + _S.invoke(_n_R,"range",[(-14), 14])), (-_S.invoke(_n_R,"range",[140, 210]))]
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return _S.invoke(_n_R,"range",[0.95, 1.15])
	return null

static func _f11(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_n_at,"has",[("" + _S.string(_n_x_b0) + "," + _S.string(_n_y_b1) + "")])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_at = _S.read(_parent,"at")
	var _n_crack = _S.read(_parent,"crack")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_a_b2 = _S.arg(_args,2)
	var _n_len_b3 = _S.arg(_args,3)
	var _n_s_b4 = _S.arg(_args,4)
	var _n_px_b5 = floori(_n_x_b0+0.5)
	var _n_py_b6 = floori(_n_y_b1+0.5)
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < _n_len_b3)):
			var _n_side_b8 = ((1 if _S.truth(fmod(_n_i_b7,2)) else (-1)) * _S.invoke(_n_R,"range",[0.6, 1.3]))
			_n_a_b2 += _S.invoke(_n_R,"range",[(-0.25), 0.25])
			_n_x_b0 += ((cos(_n_a_b2) * 1.8) - ((sin(_n_a_b2) * _n_side_b8) * 0.6))
			_n_y_b1 += ((sin(_n_a_b2) * 1.8) + ((cos(_n_a_b2) * _n_side_b8) * 0.6))
			var _n_nx_b9 = floori(_n_x_b0+0.5)
			var _n_ny_b10 = floori(_n_y_b1+0.5)
			if true:
				var _n_j_b11 = 1
				var _n_n_b12 = maxf(absf((_n_nx_b9 - _n_px_b5)),absf((_n_ny_b10 - _n_py_b6)))
				while _S.truth((_n_j_b11 <= _n_n_b12)):
					var _n_k_b13 = ("" + _S.string(floori((_n_px_b5 + (float(((_n_nx_b9 - _n_px_b5) * _n_j_b11))/_n_n_b12))+0.5)) + "," + _S.string(floori((_n_py_b6 + (float(((_n_ny_b10 - _n_py_b6) * _n_j_b11))/_n_n_b12))+0.5)) + "")
					if _S.truth(not _S.truth(_S.invoke(_n_at,"has",[_n_k_b13]))):
						return null
					if _S.truth(not _S.truth(_S.invoke(_n_crack,"has",[_n_k_b13]))):
						_S.invoke(_n_crack,"set",[_n_k_b13, _n_s_b4])
					_n_j_b11 += 1.0
			_n_px_b5 = _n_nx_b9
			_n_py_b6 = _n_ny_b10
			_n_i_b7 += 1.0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_zig = _S.read(_parent,"zig")
	var _n_EW = _S.read(_parent,"EW")
	var _n_x_b0 = _S.arg(_args,0)
	return _S.index_value(_n_zig,clampf((_n_x_b0 + (float(_n_EW)/2)),0,(_S.prop(_n_zig,"length") - 1)))
	return null

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	_S.define(_e, "pts", _S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "crack"))]), "filter", [_S.function_value(_e, "_f16")]), "map", [_S.function_value(_e, "_f17")]))
	_S.define(_e, "m", _S.construct(_S.read(_e, "Map"), []))
	for _v35 in _S.array(_S.read(_e, "EGG")):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "e", _v35)
		_S.invoke(_S.read(_v36, "m"), "set", [("" + _S.string(_S.prop(_S.read(_v36, "e"), "x")) + "," + _S.string(_S.prop(_S.read(_v36, "e"), "y")) + ""), _S.invoke(_S.read(_v36, "Math"), "min", _S.concat([[9], _S.array(_S.invoke(_S.read(_v36, "pts"), "map", [_S.function_value(_v36, "_f18")]))]))])
	return _S.read(_e, "m")

static func _f16(_parent,_args:Array,_this=null):
	var _n_s = _S.read(_parent,"s")
	var _tuple_0 = _S.arg(_args,0)
	var _n_cs_b0 = _S.prop(_tuple_0,1)
	return (_n_cs_b0 <= _n_s)
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_Number = _S.read(_parent,"Number")
	var _tuple_0 = _S.arg(_args,0)
	var _n_k_b0 = _S.prop(_tuple_0,0)
	return _S.invoke(_S.invoke(_n_k_b0,"split",[","]),"map",[_n_Number])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_e = _S.read(_parent,"e")
	var _tuple_0 = _S.arg(_args,0)
	var _n_cx_b0 = _S.prop(_tuple_0,0)
	var _n_cy_b1 = _S.prop(_tuple_0,1)
	return _S.Bridge.hypot([(_n_cx_b0 - _S.named_value(_n_e,"x")), (_n_cy_b1 - _S.named_value(_n_e,"y"))])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_WOBBLES = _S.read(_parent,"WOBBLES")
	var _n_t_b0 = _S.arg(_args,0)
	return (3 if _S.truth((_n_t_b0 > (_S.index_value(_S.index_value(_n_WOBBLES,2),0) + 0.05))) else (2 if _S.truth((_n_t_b0 > (_S.index_value(_S.index_value(_n_WOBBLES,1),0) + 0.05))) else (1 if _S.truth((_n_t_b0 > (_S.index_value(_S.index_value(_n_WOBBLES,0),0) + 0.05))) else 0)))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_WOBBLES = _S.read(_parent,"WOBBLES")
	var _n_POP = _S.read(_parent,"POP")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = 0
	for _iter_0 in _S.array(_n_WOBBLES):
		var _tuple_1 = _iter_0
		var _n_t0_b2 = _S.prop(_tuple_1,0)
		var _n_amp_b3 = _S.prop(_tuple_1,1)
		var _n_u_b4 = (_n_t_b0 - _n_t0_b2)
		if _S.truth(((_n_u_b4 < 0.55) if _S.truth((_n_u_b4 > 0)) else (_n_u_b4 > 0))):
			_n_a_b1 += ((_n_amp_b3 * sin((_n_u_b4 * 22))) * exp(((-_n_u_b4) * 5)))
	if _S.truth(((_n_t_b0 < _n_POP) if _S.truth((_n_t_b0 > (_n_POP - 0.14))) else (_n_t_b0 > (_n_POP - 0.14)))):
		_n_a_b1 += (0.05 * sin((_n_t_b0 * 120)))
	return _n_a_b1
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_stage = _S.read(_parent,"stage")
	var _n_POP = _S.read(_parent,"POP")
	var _n_t_b0 = _S.arg(_args,0)
	return (((float(_S.call_value(_n_stage,[_n_t_b0]))/3) + ((0.25 * maxf(0,sin((_n_t_b0 * 9)))) * (float(_S.call_value(_n_stage,[_n_t_b0]))/3))) if _S.truth((_n_t_b0 < _n_POP)) else (1.6 * exp(((-(_n_t_b0 - _n_POP)) * 2.6))))
	return null

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.invoke(_S.read(_e, "WOBBLES"), "forEach", [_S.function_value(_e, "_f23")])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		_S.call_value(_S.read(_e, "pop"), [])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "popped"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "POP"), 0.6))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "MOTE"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 4), 4]), _S.binary("-", _S.unary("-", _S.read(_e, "ZY")), 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [40, 80])), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.4, 0.8]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.1), _S.read(_e, "t"))]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1), _S.read(_e, "WHITE")]]), 0.7])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "popped"), func(): return _S.unary("!", _S.read(_e, "crumbled"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRUMBLE")))):
		var _v46 = _S.scope(_e)
		_S.write(_v46, "crumbled", true, "=", false)
		_S.call_value(_S.read(_v46, "breakUp"), [_S.function_value(_v46, "_f24"), 4, _S.function_value(_v46, "_f25"), _S.function_value(_v46, "_f26")])
		var _v47 = _S.scope(_v46)
		_S.define(_v47, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v47, "i"), 3)):
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "DUST"), _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v47, "R"), "sign", []), _S.invoke(_S.read(_v47, "R"), "range", [10, 25])), _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [2, 6])), _S.invoke(_S.read(_v47, "R"), "range", [0.15, 0.25]), _S.prop(_S.read(_v47, "C"), 5), _S.invoke(_S.read(_v47, "R"), "range", [1, 1.6])])
			_v47 = _S.iteration(_v47)
			_S.write(_v47, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "popped")):
		var _v48 = _S.scope(_e)
		_S.write(_v48, "cupV", _S.binary("*", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v48, "cupA")), 90), _S.binary("*", _S.read(_v48, "cupV"), 4)), _S.read(_v48, "dt")), "+=", false)
		_S.write(_v48, "cupA", _S.binary("*", _S.read(_v48, "cupV"), _S.read(_v48, "dt")), "+=", false)
	var _v49 = _S.scope(_e)
	_S.define(_v49, "i", _S.binary("-", _S.prop(_S.read(_v49, "pieces"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v49, "i"), 0)):
		var _v50 = _S.scope(_v49)
		_S.define(_v50, "q", _S.prop(_S.read(_v50, "pieces"), _S.read(_v50, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v50, "q"), "life", _S.read(_v50, "dt"), "-=", false), 0)):
			var _v51 = _S.scope(_v50)
			_S.invoke(_S.read(_v51, "pieces"), "splice", [_S.read(_v51, "i"), 1])
			_v49 = _S.iteration(_v49)
			_S.write(_v49, "i", 1, "-=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v50, "q"), "rest")):
			_v49 = _S.iteration(_v49)
			_S.write(_v49, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v50, "q"), "vy", _S.binary("*", 900, _S.read(_v50, "dt")), "+=", false)
		_S.set_prop(_S.read(_v50, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v50, "q"), "vx"), 0.6), _S.read(_v50, "dt")), "-=", false)
		_S.set_prop(_S.read(_v50, "q"), "x", _S.binary("*", _S.prop(_S.read(_v50, "q"), "vx"), _S.read(_v50, "dt")), "+=", false)
		_S.set_prop(_S.read(_v50, "q"), "y", _S.binary("*", _S.prop(_S.read(_v50, "q"), "vy"), _S.read(_v50, "dt")), "+=", false)
		_S.set_prop(_S.read(_v50, "q"), "a", _S.binary("*", _S.prop(_S.read(_v50, "q"), "va"), _S.read(_v50, "dt")), "+=", false)
		_S.define(_v50, "g", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v50, "q"), "r")), 0.45))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v50, "q"), "y"), _S.read(_v50, "g")), func(): return _S.binary(">", _S.prop(_S.read(_v50, "q"), "vy"), 0))):
			var _v52 = _S.scope(_v50)
			_S.set_prop(_S.read(_v52, "q"), "y", _S.read(_v52, "g"), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v52, "q"), "vy"), 80)):
				_S.last([_S.set_prop(_S.read(_v52, "q"), "vy", _S.unary("-", 0.35), "*=", false), _S.set_prop(_S.read(_v52, "q"), "vx", 0.6, "*=", false), _S.set_prop(_S.read(_v52, "q"), "va", 0.5, "*=", false)])
			else:
				_S.last([_S.set_prop(_S.read(_v52, "q"), "rest", true, "=", false), _S.set_prop(_S.read(_v52, "q"), "vx", _S.set_prop(_S.read(_v52, "q"), "vy", 0, "=", false), "=", false)])
		_v49 = _S.iteration(_v49)
		_S.write(_v49, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_done = _S.read(_parent,"done")
	var _n_t = _S.read(_parent,"t")
	var _n_lights = _S.read(_parent,"lights")
	var _n_G = _S.read(_parent,"G")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_R = _S.read(_parent,"R")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _tuple_0 = _S.arg(_args,0)
	var _n_t0_b0 = _S.prop(_tuple_0,0)
	var _n_i_b1 = _S.arg(_args,1)
	if _S.truth(((_n_t >= (_n_t0_b0 + 0.05)) if _S.truth(not _S.truth(_S.index_value(_n_done,_n_i_b1))) else not _S.truth(_S.index_value(_n_done,_n_i_b1)))):
		_S.set_prop(_n_done,_n_i_b1,true,"=")
		_S.invoke(_n_lights,"add",[((-3) if _S.truth(_S.binary("===",_n_i_b1,1)) else 2), ((-14) + _n_i_b1), (8 + (_n_i_b1 * 2)), _S.index_value(_n_G,1), (0.25 + (_n_i_b1 * 0.08)), 0.18])
		if true:
			var _n_j_b2 = 0
			while _S.truth((_n_j_b2 < (2 + (_n_i_b1 * 2)))):
				_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _S.invoke(_n_R,"range",[(-5), 5]), (-_S.invoke(_n_R,"range",[8, 17])), _S.invoke(_n_R,"range",[(-20), 20]), (-_S.invoke(_n_R,"range",[10, 30])), _S.invoke(_n_R,"range",[0.25, 0.5]), _S.invoke(_n_R,"pick",[[_n_WHITE, _S.index_value(_n_G,2)]]), _S.invoke(_n_R,"range",[0.6, 1.4])])
				_n_j_b2 += 1.0
		if true:
			var _n_j_b3 = 0
			while _S.truth((_n_j_b3 < (_n_i_b1 + 1))):
				_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":_S.invoke(_n_R,"range",[(-4), 4]),"y":(-_S.invoke(_n_R,"range",[10, 16])),"vx":_S.invoke(_n_R,"range",[(-50), 50]),"vy":(-_S.invoke(_n_R,"range",[40, 90])),"g":0.9,"drag":0.5,"bounce":0.3,"life":_S.invoke(_n_R,"range",[0.5, 0.8]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-20), 20]),"s":_S.invoke(_n_R,"range",[1, 1.6]),"c":_S.index_value(_n_C,4)}])
				_n_j_b3 += 1.0
		_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"DUST"), (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[5, 7])), (-0.5), (_S.invoke(_n_R,"sign",[]) * _S.invoke(_n_R,"range",[8, 18])), (-_S.invoke(_n_R,"range",[1, 3])), _S.invoke(_n_R,"range",[0.15, 0.25]), _S.index_value(_n_C,5), _S.invoke(_n_R,"range",[0.8, 1.4])])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_zigAt = _S.read(_parent,"zigAt")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_n_y_b1 < _S.call_value(_n_zigAt,[_n_x_b0]))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_cx_b0 = _S.arg(_args,0)
	return [(_n_cx_b0 * _S.invoke(_n_R,"range",[4, 8])), (-_S.invoke(_n_R,"range",[40, 80]))]
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	return _S.invoke(_n_R,"range",[0.38, 0.48])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_crumbled = _S.read(_parent,"crumbled")
	var _n_popped = _S.read(_parent,"popped")
	var _n_angle = _S.read(_parent,"angle")
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_CRUMBLE = _S.read(_parent,"CRUMBLE")
	var _n_C = _S.read(_parent,"C")
	var _n_inner = _S.read(_parent,"inner")
	var _n_G = _S.read(_parent,"G")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(not _S.truth(_n_crumbled)):
		var _n_sx_b2 = (0 if _S.truth(_n_popped) else ((-_S.call_value(_n_angle,[_n_t])) * 8))
		var _n_k_b3 = ((1 - (_S.MathFX.smooth(_n_POP,_n_CRUMBLE,_n_t) * 0.4)) if _S.truth(_n_popped) else 1)
		if true:
			var _n_y_b4 = (-1)
			while _S.truth((_n_y_b4 <= 1)):
				if true:
					var _n_x_b5 = (-10)
					while _S.truth((_n_x_b5 <= 10)):
						var _n_d_b6 = (pow((float(((_n_x_b5 + 0.5) - _n_sx_b2))/9.5),2) + pow((float((_n_y_b4 + 0.5))/1.8),2))
						if _S.truth((_n_d_b6 < 1)):
							_S.invoke(_n_p_b0,"blend",[_n_x_b5, _n_y_b4, _S.index_value(_n_C,0), ((0.5 * _n_k_b3) * (1 - _n_d_b6))])
						_n_x_b5 += 1.0
				_n_y_b4 += 1.0
	var _n_g_b1 = _S.call_value(_n_inner,[_n_t])
	if _S.truth((_n_g_b1 > 0.05)):
		_S.invoke(_n_p_b0,"glow",[0, (-3), 22, _S.index_value(_n_G,0), (0.18 * minf(1.2,_n_g_b1))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_stage = _S.read(_parent,"stage")
	var _n_t = _S.read(_parent,"t")
	var _n_cupA = _S.read(_parent,"cupA")
	var _n_popped = _S.read(_parent,"popped")
	var _n_angle = _S.read(_parent,"angle")
	var _n_inner = _S.read(_parent,"inner")
	var _n_crumbled = _S.read(_parent,"crumbled")
	var _n_EH = _S.read(_parent,"EH")
	var _n_POP = _S.read(_parent,"POP")
	var _n_ZY = _S.read(_parent,"ZY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_pieces = _S.read(_parent,"pieces")
	var _n_bits = _S.read(_parent,"bits")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_st_b1 = _S.call_value(_n_stage,[_n_t])
	var _n_a_b2 = ((_n_cupA * 0.03) if _S.truth(_n_popped) else _S.call_value(_n_angle,[_n_t]))
	var _n_ca_b3 = cos(_n_a_b2)
	var _n_sa_b4 = sin(_n_a_b2)
	var _n_g_b5 = _S.call_value(_n_inner,[_n_t])
	if _S.truth(not _S.truth(_n_crumbled)):
		_S.invoke(_n_p_b0,"shade",[(-12), ((-_n_EH) - 4), 12, 1, _S.function_value(_S.capture(_parent,{"ca":_n_ca_b3,"sa":_n_sa_b4,"g":_n_g_b5,"st":_n_st_b1,"this":_this}),"_f29")])
	var _n_q_b6 = (_n_t - _n_POP)
	if _S.truth(((_n_g_b5 > 0.22) if _S.truth((not _S.truth(_n_crumbled) if _S.truth(((_n_q_b6 < 1.2) if _S.truth(_n_popped) else _n_popped)) else ((_n_q_b6 < 1.2) if _S.truth(_n_popped) else _n_popped))) else (not _S.truth(_n_crumbled) if _S.truth(((_n_q_b6 < 1.2) if _S.truth(_n_popped) else _n_popped)) else ((_n_q_b6 < 1.2) if _S.truth(_n_popped) else _n_popped)))):
		var _n_k_b7 = clampf((float(_n_q_b6)/1.2),0.0,1.0)
		var _n_oy_b8 = ((-_n_ZY) + 0.5)
		var _n_rx_b9 = 7
		if true:
			var _n_y_b10 = (-2)
			while _S.truth((_n_y_b10 <= 2)):
				if true:
					var _n_x_b11 = (-_n_rx_b9)
					while _S.truth((_n_x_b11 <= _n_rx_b9)):
						var _n_d_b12 = _S.Bridge.hypot([(float((_n_x_b11 + 0.5))/_n_rx_b9), (float((_n_y_b10 + 0.5))/2.2)])
						if _S.truth((_n_d_b12 > 1)):
							_n_x_b11 += 1.0
							continue
						if _S.truth(((_n_d_b12 > 0.75) if _S.truth((_n_g_b5 < 0.6)) else (_n_g_b5 < 0.6))):
							_n_x_b11 += 1.0
							continue
						_S.invoke(_n_p_b0,"px",[_n_x_b11, (_n_oy_b8 + _n_y_b10), ((_n_WHITE if _S.truth((_n_d_b12 < 0.7)) else _S.index_value(_n_G,2)) if _S.truth((_n_g_b5 > 1)) else ((_S.index_value(_n_G,2) if _S.truth((_n_d_b12 < 0.5)) else _S.index_value(_n_G,1)) if _S.truth((_n_g_b5 > 0.6)) else (_S.index_value(_n_G,1) if _S.truth((_n_d_b12 < 0.45)) else _S.index_value(_n_G,0))))])
						_n_x_b11 += 1.0
				_n_y_b10 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, _n_oy_b8, 16, _S.index_value(_n_G,1), (0.6 * _n_g_b5)])
		if _S.truth((_n_q_b6 < 0.65)):
			var _n_rk_b13 = (float(_n_q_b6)/0.65)
			var _n_L_b14 = ((36 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_q_b6)/0.1),0.0,1.0)])) * (1 - (_n_rk_b13 * 0.6)))
			if true:
				var _n_i_b15 = 0
				while _S.truth((_n_i_b15 < 7)):
					var _n_an_b16 = (((float((-PI))/2) + ((_n_i_b15 - 3) * 0.24)) + (0.05 * sin(((_n_t * 6) + _n_i_b15))))
					var _n_len_b17 = (_n_L_b14 * (0.65 if _S.truth(fmod(_n_i_b15,2)) else 1))
					var _n_w_b18 = (1 if _S.truth(fmod(_n_i_b15,2)) else 2)
					var _n_x1_b19 = (cos(_n_an_b16) * _n_len_b17)
					var _n_y1_b20 = (_n_oy_b8 + (sin(_n_an_b16) * _n_len_b17))
					if true:
						var _n_j_b21 = 0
						while _S.truth((_n_j_b21 < _n_w_b18)):
							_S.invoke(_n_p_b0,"line",[((_n_j_b21 * 0.8) - 0.4), (_n_oy_b8 - 1), ((_n_x1_b19 + (_n_j_b21 * 0.8)) - 0.4), _n_y1_b20, _S.function_value(_S.capture(_parent,{"this":_this}),"_f31"), _S.function_value(_S.capture(_parent,{"rk":_n_rk_b13,"this":_this}),"_f32")])
							_n_j_b21 += 1.0
					_S.invoke(_n_p_b0,"glowLine",[0, _n_oy_b8, _n_x1_b19, _n_y1_b20, 5, _S.index_value(_n_G,1), (0.35 * (1 - _n_rk_b13))])
					_n_i_b15 += 1.0
		if _S.truth((_n_q_b6 < 0.1)):
			_S.invoke(_n_p_b0,"glow",[0, (_n_oy_b8 - 4), 30, _n_WHITE, (0.6 * (1 - (float(_n_q_b6)/0.1)))])
		_S.invoke(_n_p_b0,"glowLine",[0, _n_oy_b8, 0, (_n_oy_b8 - 26), 8, _S.index_value(_n_G,1), (0.25 * _n_g_b5)])
	if _S.truth(((_n_g_b5 > 0) if _S.truth(not _S.truth(_n_popped)) else not _S.truth(_n_popped))):
		_S.invoke(_n_p_b0,"glow",[0, ((-_n_EH) * 0.55), (7 + (2 * _n_st_b1)), _S.index_value(_n_G,1), (0.05 * _n_g_b5)])
	for _iter_0 in _S.array(_n_pieces):
		var _n_s_b22 = _iter_0
		var _n_c2_b23 = cos(_S.named_value(_n_s_b22,"a"))
		var _n_s2_b24 = sin(_S.named_value(_n_s_b22,"a"))
		var _n_f_b25 = minf(1,(float(_S.named_value(_n_s_b22,"life"))/0.4))
		var _n_r_b26 = ceili(_S.named_value(_n_s_b22,"r"))
		var _n_hot_b27 = ((_n_t - _S.named_value(_n_s_b22,"born")) < 0.35)
		if true:
			var _n_py_b28 = (-_n_r_b26)
			while _S.truth((_n_py_b28 <= _n_r_b26)):
				if true:
					var _n_px_b29 = (-_n_r_b26)
					while _S.truth((_n_px_b29 <= _n_r_b26)):
						var _n_ux_b30 = floori(((_n_px_b29 * _n_c2_b23) + (_n_py_b28 * _n_s2_b24))+0.5)
						var _n_uy_b31 = floori((((-_n_px_b29) * _n_s2_b24) + (_n_py_b28 * _n_c2_b23))+0.5)
						var _n_m_b32 = _S.invoke(_S.named_value(_n_s_b22,"map"),"get",[("" + _S.string(_n_ux_b30) + "," + _S.string(_n_uy_b31) + "")])
						if _S.truth(((_S.MathFX.rand([_n_ux_b30,_n_uy_b31,_S.named_value(_n_s_b22,"id")]) < _n_f_b25) if _S.truth(_n_m_b32) else _n_m_b32)):
							_S.invoke(_n_p_b0,"px",[(floori(_S.named_value(_n_s_b22,"x")) + _n_px_b29), (floori(_S.named_value(_n_s_b22,"y")) + _n_py_b28), ((_S.index_value(_n_G,2) if _S.truth(_n_hot_b27) else _S.index_value(_n_C,4)) if _S.truth(_S.index_value(_n_m_b32,1)) else _S.index_value(_n_m_b32,0))])
						_n_px_b29 += 1.0
				_n_py_b28 += 1.0
		if _S.truth(_n_hot_b27):
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b22,"x"), _S.named_value(_n_s_b22,"y"), 6, _S.index_value(_n_G,1), 0.3])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	if _S.truth(((_n_q_b6 < 0.9) if _S.truth(_n_popped) else _n_popped)):
		_S.call_value(_n_sparkle,[_n_p_b0, (-3), ((-_n_ZY) - 6), floori((4 * (1 - (float(_n_q_b6)/0.9)))+0.5), _n_WHITE, _S.index_value(_n_G,1), 0.4])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "out", _S.arg(_args, 2))
	_S.define(_e, "ux", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("+", _S.binary("*", _S.read(_e, "x"), _S.read(_e, "ca")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "sa")))]))
	_S.define(_e, "uy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.unary("-", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_e, "x")), _S.read(_e, "sa")), _S.binary("*", _S.read(_e, "y"), _S.read(_e, "ca"))))]))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "at"), "get", [("" + _S.string(_S.read(_e, "ux")) + "," + _S.string(_S.read(_e, "uy")) + "")]))
	_S.define(_e, "inside", _S.logical("&&", _S.read(_e, "e"), func(): return _S.unary("!", _S.logical("&&", _S.read(_e, "popped"), func(): return _S.binary(">=", _S.read(_e, "uy"), _S.call_value(_S.read(_e, "zigAt"), [_S.read(_e, "ux")]))))))
	if _S.truth(_S.unary("!", _S.read(_e, "inside"))):
		var _v57 = _S.scope(_e)
		_S.define(_v57, "n", _S.invoke([[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]], "some", [_S.function_value(_v57, "_f30")]))
		if _S.truth(_S.logical("&&", _S.read(_v57, "n"), func(): return _S.unary("!", _S.logical("&&", _S.logical("&&", _S.read(_v57, "popped"), func(): return _S.binary(">=", _S.read(_v57, "uy"), _S.call_value(_S.read(_v57, "zigAt"), [_S.read(_v57, "ux")]))), func(): return _S.binary("<=", _S.read(_v57, "uy"), _S.binary("+", _S.call_value(_S.read(_v57, "zigAt"), [_S.read(_v57, "ux")]), 1)))))):
			_S.set_prop(_S.read(_v57, "out"), "c", _S.prop(_S.read(_v57, "C"), 0), "=", false)
		return null
	_S.define(_e, "cs", _S.invoke(_S.read(_e, "crack"), "get", [("" + _S.string(_S.read(_e, "ux")) + "," + _S.string(_S.read(_e, "uy")) + "")]))
	if _S.truth(_S.read(_e, "popped")):
		var _v59 = _S.scope(_e)
		_S.set_prop(_S.read(_v59, "out"), "c", ((_S.read(_v59, "WHITE") if _S.truth(_S.binary(">", _S.read(_v59, "g"), 0.9)) else (_S.prop(_S.read(_v59, "G"), 2) if _S.truth(_S.binary(">", _S.read(_v59, "g"), 0.4)) else (_S.prop(_S.read(_v59, "G"), 1) if _S.truth(_S.binary(">", _S.read(_v59, "g"), 0.12)) else _S.prop(_S.read(_v59, "C"), 4)))) if _S.truth(_S.binary(">=", _S.read(_v59, "uy"), _S.binary("-", _S.call_value(_S.read(_v59, "zigAt"), [_S.read(_v59, "ux")]), 1))) else _S.prop(_S.read(_v59, "e"), "c")), "=", false)
		if _S.truth(_S.binary(">=", _S.read(_v59, "uy"), _S.binary("-", _S.call_value(_S.read(_v59, "zigAt"), [_S.read(_v59, "ux")]), 1))):
			_S.last([_S.set_prop(_S.read(_v59, "out"), "k", _S.binary("*", 0.25, _S.read(_v59, "g")), "=", false), _S.set_prop(_S.read(_v59, "out"), "l", _S.prop(_S.read(_v59, "G"), 1), "=", false)])
		return null
	if _S.truth(_S.logical("&&", _S.binary("!==", _S.read(_e, "cs"), null), func(): return _S.binary("<", _S.read(_e, "cs"), _S.read(_e, "st")))):
		var _v60 = _S.scope(_e)
		_S.define(_v60, "fresh", _S.binary("<", _S.binary("-", _S.read(_v60, "t"), _S.prop(_S.prop(_S.read(_v60, "WOBBLES"), _S.read(_v60, "cs")), 0)), 0.17))
		_S.set_prop(_S.read(_v60, "out"), "c", (_S.read(_v60, "WHITE") if _S.truth(_S.read(_v60, "fresh")) else (_S.prop(_S.read(_v60, "G"), 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v60, "rand"), [_S.read(_v60, "ux"), _S.read(_v60, "uy"), _S.binary("|", _S.binary("*", _S.read(_v60, "t"), 20), 0)]), _S.binary("+", 0.25, _S.binary("*", 0.1, _S.read(_v60, "st"))))) else _S.prop(_S.read(_v60, "G"), 0))), "=", false)
		_S.set_prop(_S.read(_v60, "out"), "k", _S.binary("+", 0.14, _S.binary("*", 0.06, _S.read(_v60, "st"))), "=", false)
		_S.set_prop(_S.read(_v60, "out"), "l", _S.prop(_S.read(_v60, "G"), 1), "=", false)
		return null
	if _S.truth(_S.logical("||", _S.binary("<", _S.relational_get(_S.read(_e, "crack"), [("" + _S.string(_S.read(_e, "ux")) + "," + _S.string(_S.binary("+", _S.read(_e, "uy"), 1)) + "")]), _S.read(_e, "st")), func(): return _S.binary("<", _S.relational_get(_S.read(_e, "crack"), [("" + _S.string(_S.binary("+", _S.read(_e, "ux"), 1)) + "," + _S.string(_S.read(_e, "uy")) + "")]), _S.read(_e, "st")))):
		var _v61 = _S.scope(_e)
		_S.set_prop(_S.read(_v61, "out"), "c", (_S.prop(_S.read(_v61, "C"), 2) if _S.truth(_S.binary(">", _S.prop(_S.read(_v61, "e"), "lit"), 0.3)) else _S.prop(_S.read(_v61, "C"), 1)), "=", false)
		return null
	_S.define(_e, "dn", (_S.invoke(_S.prop(_S.read(_e, "near"), _S.binary("-", _S.read(_e, "st"), 1)), "get", [("" + _S.string(_S.read(_e, "ux")) + "," + _S.string(_S.read(_e, "uy")) + "")]) if _S.truth(_S.binary(">", _S.read(_e, "st"), 0)) else 9))
	_S.define(_e, "k", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "g"), 1.5)]))
	_S.define(_e, "base", (_S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "e"), "c"), _S.prop(_S.read(_e, "G"), 0), _S.binary("*", _S.binary("*", 0.05, _S.read(_e, "st")), _S.read(_e, "k"))]) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "st"), 0), func(): return _S.binary("!==", _S.prop(_S.read(_e, "e"), "c"), _S.read(_e, "SPK")))) else _S.prop(_S.read(_e, "e"), "c")))
	_S.set_prop(_S.read(_e, "out"), "c", (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "base"), _S.prop(_S.read(_e, "G"), 1), _S.binary("*", (0.32 if _S.truth(_S.binary(">=", _S.read(_e, "st"), 2)) else 0.2), _S.read(_e, "k"))]) if _S.truth(_S.binary("<", _S.read(_e, "dn"), 1.6)) else (_S.call_value(_S.read(_e, "mix"), [_S.read(_e, "base"), _S.prop(_S.read(_e, "G"), 1), _S.binary("*", 0.14, _S.read(_e, "k"))]) if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "dn"), 2.7), func(): return _S.binary(">=", _S.read(_e, "st"), 2))) else _S.read(_e, "base"))), "=", false)
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_ux = _S.read(_parent,"ux")
	var _n_uy = _S.read(_parent,"uy")
	var _n_popped = _S.read(_parent,"popped")
	var _n_zigAt = _S.read(_parent,"zigAt")
	var _tuple_0 = _S.arg(_args,0)
	var _n_dx_b0 = _S.prop(_tuple_0,0)
	var _n_dy_b1 = _S.prop(_tuple_0,1)
	var _n_f_b2 = _S.invoke(_n_at,"get",[("" + _S.string((_n_ux + _n_dx_b0)) + "," + _S.string((_n_uy + _n_dy_b1)) + "")])
	return (not _S.truth((((_n_uy + _n_dy_b1) >= _S.call_value(_n_zigAt,[(_n_ux + _n_dx_b0)])) if _S.truth(_n_popped) else _n_popped)) if _S.truth(_n_f_b2) else _n_f_b2)
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.3)) else (_S.index_value(_n_G,2) if _S.truth((_n_u_b0 < 0.65)) else _S.index_value(_n_G,1)))
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_rk = _S.read(_parent,"rk")
	var _n_u_b0 = _S.arg(_args,0)
	return ((1 - (_n_u_b0 * _n_u_b0)) * (1.1 - _n_rk))
	return null
