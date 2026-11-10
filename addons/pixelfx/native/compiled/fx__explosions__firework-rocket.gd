@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/explosions/firework-rocket.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "cull", _S.import_value("fx/explosions/_lib.js", "cull"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Firework rocket"}, {"desc": "A rocket fizzes off the ground on a sparkling gold trail, coasts, and bursts into a palm: heavy gold fronds arc out, droop on glittering trails and crackle at the tips."}, {"tags": ["firework", "rocket", "celebration", "sparkle", "sky", "one-shot"]}, {"size": [300, 300]}, {"origin": [150, 288]}, {"duration": 3.8}, {"loop": false}, {"fps": 30}, {"bg": "sky"}, {"options": _S.merge([{"palette": ["#2a1406", "#6a3a0c", "#b8701a", "#f0a830", "#ffd860", "#fff2b0", "#ffffff"]}, {"tips": ["#0c2a3a", "#1a5a78", "#36a2c8", "#7cd8f0", "#c8f4ff", "#ffffff"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FLY", 1.05)
	_S.define(_e, "HIGH", 192)
	_S.define(_e, "DRAG", 1.35)
	_S.define(_e, "G", 105)
	_S.define(_e, "TRAIL", 1.15)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "T", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "tips"), 6]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "fronds", [])
	_S.define(_e, "pops", [])
	_S.define(_e, "at", _S.function_value(_e, "_f1"))
	_S.define(_e, "t", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "bx", 0)
	_S.define(_e, "by", 0)
	_S.define(_e, "acc", 0)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 14), 24, _S.prop(_S.read(_e, "C"), 4), 0.7, 0.35])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 18)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v1, "Math"), "PI")), 2), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 1.2), 1.2])))
		_S.define(_v1, "sp", _S.invoke(_S.read(_v1, "R"), "range", [60, 180]))
		_S.invoke(_S.read(_v1, "ps"), "spawn", [_S.prop(_S.read(_v1, "P"), "SPARK"), 0, _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "sp")), 0.6), _S.invoke(_S.read(_v1, "R"), "range", [0.15, 0.4])])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	var _v2 = _S.scope(_e)
	_S.define(_v2, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v2, "i"), 5)):
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "VAPOUR"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 2), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v2, "R"), "range", [2, 10])), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1]), _S.call_value(_S.read(_v2, "hex"), ["#5a5468"]), _S.invoke(_S.read(_v2, "R"), "range", [3, 5])])
		_v2 = _S.iteration(_v2)
		_S.write(_v2, "i", 1, "+=", true)
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"drawBack": _S.function_value(_e, "_f3")}, {"draw": _S.function_value(_e, "_f4")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_HIGH = _S.read(_parent,"HIGH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	return [((sin((_n_t_b0 * 8)) * 1.6) * (float(_n_t_b0)/_n_FLY)), ((-8) - (_n_HIGH * _S.invoke(_n_ease,"outQuad",[clampf((float(_n_t_b0)/_n_FLY),0.0,1.0)])))]
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "FLY"))):
		var _v3 = _S.scope(_e)
		var _v4 = _S.call_value(_S.read(_v3, "at"), [_S.read(_v3, "t")])
		_S.define(_v3, "x", _S.prop(_v4, 0))
		_S.define(_v3, "y", _S.prop(_v4, 1))
		var _v5 = _S.call_value(_S.read(_v3, "at"), [_S.invoke(_S.read(_v3, "Math"), "max", [0, _S.binary("-", _S.read(_v3, "t"), 0.02)])])
		_S.define(_v3, "x2", _S.prop(_v5, 0))
		_S.define(_v3, "y2", _S.prop(_v5, 1))
		_S.define(_v3, "vy", _S.binary("/", _S.binary("-", _S.read(_v3, "y"), _S.read(_v3, "y2")), 0.02))
		_S.define(_v3, "vx", _S.binary("/", _S.binary("-", _S.read(_v3, "x"), _S.read(_v3, "x2")), 0.02))
		var _v6 = _S.scope(_v3)
		_S.write(_v6, "acc", _S.binary("*", _S.read(_v6, "dt"), 90), "+=", false)
		while _S.truth(_S.binary(">", _S.read(_v6, "acc"), 1)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v7, "Math"), "PI"), 2), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.45), 0.45])))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [30, 110]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), _S.read(_v7, "x"), _S.binary("+", _S.read(_v7, "y"), 4), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.read(_v7, "vx"), 0.2)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.read(_v7, "vy"), 0.15)), _S.invoke(_S.read(_v7, "R"), "range", [0.15, 0.4])])
			if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.25])):
				_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "STAR"), _S.binary("+", _S.read(_v7, "x"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.binary("+", _S.read(_v7, "y"), _S.invoke(_S.read(_v7, "R"), "range", [2, 6])), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 6), 6]), _S.invoke(_S.read(_v7, "R"), "range", [5, 20]), _S.invoke(_S.read(_v7, "R"), "range", [0.4, 0.9]), (_S.prop(_S.read(_v7, "C"), 5) if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.5])) else _S.read(_v7, "WHITE")), (1.2 if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.15])) else 0.5)])
			if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.18])):
				_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "VAPOUR"), _S.read(_v7, "x"), _S.binary("+", _S.read(_v7, "y"), 5), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 4), 4]), _S.invoke(_S.read(_v7, "R"), "range", [4, 12]), _S.invoke(_S.read(_v7, "R"), "range", [0.6, 1.1]), _S.call_value(_S.read(_v7, "hex"), ["#4a4458"]), _S.invoke(_S.read(_v7, "R"), "range", [1.2, 2.2])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "acc", 1, "-=", true)
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "burst"))):
			var _v8 = _S.scope(_e)
			_S.write(_v8, "burst", true, "=", false)
			_S.destructure_targets(_S.call_value(_S.read(_v8, "at"), [_S.read(_v8, "FLY")]), [{"scope":_v8,"key":"bx"}, {"scope":_v8,"key":"by"}])
			_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "bx"), _S.read(_v8, "by"), 82, _S.prop(_S.read(_v8, "C"), 4), 0.8, 1.6])
			_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "bx"), _S.read(_v8, "by"), 40, _S.read(_v8, "WHITE"), 0.6, 0.08])
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "i"), 9)):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "a", _S.binary("+", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v10, "i"), 4), 4), 1.4)), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 0.1), 0.1])))
				_S.define(_v10, "sp", _S.binary("*", _S.invoke(_S.read(_v10, "R"), "range", [180, 210]), _S.binary("-", 1, _S.binary("/", _S.binary("*", 0.12, _S.invoke(_S.read(_v10, "Math"), "abs", [_S.binary("-", _S.read(_v10, "i"), 4)])), 4))))
				_S.invoke(_S.read(_v10, "fronds"), "push", [_S.merge([{"x": _S.read(_v10, "bx")}, {"y": _S.read(_v10, "by")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp"))}, {"age": 0}, {"life": _S.invoke(_S.read(_v10, "R"), "range", [1.8, 2.15])}, {"pts": []}, {"acc": _S.invoke(_S.read(_v10, "R"), "next", [])}, {"seed": _S.invoke(_S.read(_v10, "R"), "range", [0, 100])}])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
			var _v11 = _S.scope(_v8)
			_S.define(_v11, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "i"), 6)):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "VAPOUR"), _S.binary("+", _S.read(_v11, "bx"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("+", _S.read(_v11, "by"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 4), 4])), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 15), 15]), _S.invoke(_S.read(_v11, "R"), "range", [1.8, 2.6]), _S.call_value(_S.read(_v11, "hex"), ["#4a4458"]), _S.invoke(_S.read(_v11, "R"), "range", [6, 10])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
			var _v12 = _S.scope(_v8)
			_S.define(_v12, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v12, "i"), 30)):
				var _v13 = _S.scope(_v12)
				_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
				_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [40, 160]))
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.read(_v13, "bx"), _S.read(_v13, "by"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.invoke(_S.read(_v13, "R"), "range", [0.15, 0.35])])
				_v12 = _S.iteration(_v12)
				_S.write(_v12, "i", 1, "+=", true)
	var _v14 = _S.scope(_e)
	_S.define(_v14, "i", _S.binary("-", _S.prop(_S.read(_v14, "fronds"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v14, "i"), 0)):
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "f", _S.prop(_S.read(_v15, "fronds"), _S.read(_v15, "i")))
		_S.set_prop(_S.read(_v15, "f"), "age", _S.read(_v15, "dt"), "+=", false)
		_S.define(_v15, "k", _S.binary("/", _S.prop(_S.read(_v15, "f"), "age"), _S.prop(_S.read(_v15, "f"), "life")))
		if _S.truth(_S.binary(">=", _S.read(_v15, "k"), 1)):
			var _v16 = _S.scope(_v15)
			var _v17 = _S.scope(_v16)
			_S.define(_v17, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v17, "j"), 4)):
				_S.invoke(_S.read(_v17, "pops"), "push", [_S.merge([{"x": _S.binary("+", _S.prop(_S.read(_v17, "f"), "x"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 5), 5]))}, {"y": _S.binary("+", _S.prop(_S.read(_v17, "f"), "y"), _S.invoke(_S.read(_v17, "R"), "range", [_S.unary("-", 5), 5]))}, {"t0": _S.binary("+", _S.read(_v17, "t"), _S.invoke(_S.read(_v17, "R"), "range", [0, 0.2]))}, {"life": _S.invoke(_S.read(_v17, "R"), "range", [0.06, 0.12])}, {"c": (_S.read(_v17, "WHITE") if _S.truth(_S.invoke(_S.read(_v17, "R"), "chance", [0.5])) else _S.prop(_S.read(_v17, "T"), 3))}])])
				_v17 = _S.iteration(_v17)
				_S.write(_v17, "j", 1, "+=", true)
			_S.invoke(_S.read(_v16, "fronds"), "splice", [_S.read(_v16, "i"), 1])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v15, "f"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v15, "f"), "vx"), _S.read(_v15, "DRAG")), _S.read(_v15, "dt")), "-=", false)
		_S.set_prop(_S.read(_v15, "f"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v15, "f"), "vy"), _S.read(_v15, "DRAG")), _S.read(_v15, "dt")), _S.binary("*", _S.read(_v15, "G"), _S.read(_v15, "dt"))), "-=", false)
		_S.set_prop(_S.read(_v15, "f"), "x", _S.binary("*", _S.prop(_S.read(_v15, "f"), "vx"), _S.read(_v15, "dt")), "+=", false)
		_S.set_prop(_S.read(_v15, "f"), "y", _S.binary("*", _S.prop(_S.read(_v15, "f"), "vy"), _S.read(_v15, "dt")), "+=", false)
		_S.invoke(_S.prop(_S.read(_v15, "f"), "pts"), "push", [_S.prop(_S.read(_v15, "f"), "x"), _S.prop(_S.read(_v15, "f"), "y"), _S.read(_v15, "t")])
		while _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.prop(_S.read(_v15, "f"), "pts"), "length"), 3), func(): return _S.binary(">", _S.binary("-", _S.read(_v15, "t"), _S.prop(_S.prop(_S.read(_v15, "f"), "pts"), 2)), _S.read(_v15, "TRAIL")))):
			_S.invoke(_S.prop(_S.read(_v15, "f"), "pts"), "splice", [0, 3])
		var _v18 = _S.scope(_v15)
		_S.set_prop(_S.read(_v18, "f"), "acc", _S.binary("*", _S.read(_v18, "dt"), 34), "+=", false)
		while _S.truth(_S.binary(">", _S.prop(_S.read(_v18, "f"), "acc"), 1)):
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v18, "f"), "x"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("+", _S.prop(_S.read(_v18, "f"), "y"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v18, "f"), "vx"), 0.1), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 5), 5])), _S.invoke(_S.read(_v18, "R"), "range", [0, 14]), _S.invoke(_S.read(_v18, "R"), "range", [0.5, 1.1]), (_S.prop(_S.read(_v18, "C"), 5) if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.6])) else _S.read(_v18, "WHITE")), (_S.invoke(_S.read(_v18, "R"), "range", [1, 1.5]) if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.12])) else 0.5)])
			_v18 = _S.iteration(_v18)
			_S.set_prop(_S.read(_v18, "f"), "acc", 1, "-=", true)
		_v14 = _S.iteration(_v14)
		_S.write(_v14, "i", 1, "-=", true)
	var _v19 = _S.scope(_e)
	_S.define(_v19, "i", _S.binary("-", _S.prop(_S.read(_v19, "pops"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v19, "i"), 0)):
		if _S.truth(_S.binary(">", _S.read(_v19, "t"), _S.binary("+", _S.prop(_S.prop(_S.read(_v19, "pops"), _S.read(_v19, "i")), "t0"), _S.prop(_S.prop(_S.read(_v19, "pops"), _S.read(_v19, "i")), "life")))):
			_S.invoke(_S.read(_v19, "pops"), "splice", [_S.read(_v19, "i"), 1])
		_v19 = _S.iteration(_v19)
		_S.write(_v19, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "cull"), [_S.read(_e, "ps"), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2), _S.binary("+", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 2), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 0), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 0)), 2), _S.binary("-", _S.binary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "size"), 1), _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)), 2)])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_FLY = _S.read(_parent,"FLY")
	var _n_at = _S.read(_parent,"at")
	var _n_hex = _S.read(_parent,"hex")
	var _n_C = _S.read(_parent,"C")
	var _n_TRAIL = _S.read(_parent,"TRAIL")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_fronds = _S.read(_parent,"fronds")
	var _n_T = _S.read(_parent,"T")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_pops = _S.read(_parent,"pops")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bx = _S.read(_parent,"bx")
	var _n_by = _S.read(_parent,"by")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_FLY)):
		var _tuple_0 = _S.call_value(_n_at,[_n_t])
		var _n_x_b2 = _S.prop(_tuple_0,0)
		var _n_y_b3 = _S.prop(_tuple_0,1)
		_S.invoke(_n_p_b0,"line",[_n_x_b2, (_n_y_b3 + 4), _n_x_b2, (_n_y_b3 + 12), _S.call_value(_n_hex,["#5a4030"])])
		_S.invoke(_n_p_b0,"rect",[(_n_x_b2 - 1), (_n_y_b3 - 3), 3, 7, _S.call_value(_n_hex,["#b8303a"])])
		_S.invoke(_n_p_b0,"px",[(_n_x_b2 - 1), (_n_y_b3 - 3), _S.call_value(_n_hex,["#e86070"])])
		_S.invoke(_n_p_b0,"px",[_n_x_b2, (_n_y_b3 - 4), _S.call_value(_n_hex,["#d8d0c0"])])
		var _n_fl_b4 = (2 + (1 if _S.truth((sin((_n_t * 70)) > 0)) else 0))
		_S.invoke(_n_p_b0,"line",[_n_x_b2, (_n_y_b3 + 4), _n_x_b2, ((_n_y_b3 + 4) + _n_fl_b4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")])
		_S.invoke(_n_p_b0,"glow",[_n_x_b2, (_n_y_b3 + 5), 9, _S.index_value(_n_C,4), 0.6])
	for _iter_1 in _S.array(_n_fronds):
		var _n_f_b5 = _iter_1
		var _n_k_b6 = (float(_S.named_value(_n_f_b5,"age"))/_S.named_value(_n_f_b5,"life"))
		var _n_P2_b7 = _S.named_value(_n_f_b5,"pts")
		var _n_n_b8 = (float(_S.prop(_n_P2_b7,"length"))/3)
		if true:
			var _n_j_b9 = (_n_n_b8 - 1)
			while _S.truth((_n_j_b9 > 0)):
				var _n_u_b10 = (float((_n_t - _S.index_value(_n_P2_b7,((_n_j_b9 * 3) + 2))))/_n_TRAIL)
				if _S.truth((_n_u_b10 >= 1)):
					break
				var _n_c_b11 = (_S.index_value(_n_C,6) if _S.truth((_n_u_b10 < 0.08)) else (_S.index_value(_n_C,5) if _S.truth((_n_u_b10 < 0.25)) else (_S.index_value(_n_C,4) if _S.truth((_n_u_b10 < 0.5)) else (_S.index_value(_n_C,3) if _S.truth((_n_u_b10 < 0.75)) else _S.index_value(_n_C,2)))))
				var _n_a_b12 = (pow((1 - _n_u_b10),0.6) * (1.25 - (_n_k_b6 * 0.45)))
				_S.invoke(_n_p_b0,"line",[_S.index_value(_n_P2_b7,(_n_j_b9 * 3)), _S.index_value(_n_P2_b7,((_n_j_b9 * 3) + 1)), _S.index_value(_n_P2_b7,((_n_j_b9 * 3) - 3)), _S.index_value(_n_P2_b7,((_n_j_b9 * 3) - 2)), _n_c_b11, _n_a_b12])
				if _S.truth((_n_u_b10 < 0.7)):
					_S.invoke(_n_p_b0,"line",[(_S.index_value(_n_P2_b7,(_n_j_b9 * 3)) + 1), _S.index_value(_n_P2_b7,((_n_j_b9 * 3) + 1)), (_S.index_value(_n_P2_b7,((_n_j_b9 * 3) - 3)) + 1), _S.index_value(_n_P2_b7,((_n_j_b9 * 3) - 2)), (_S.index_value(_n_C,5) if _S.truth((_n_u_b10 < 0.25)) else (_S.index_value(_n_C,3) if _S.truth((_n_u_b10 < 0.5)) else _S.index_value(_n_C,2))), (_n_a_b12 * 0.85)])
				if _S.truth((_n_u_b10 < 0.35)):
					_S.invoke(_n_p_b0,"line",[_S.index_value(_n_P2_b7,(_n_j_b9 * 3)), (_S.index_value(_n_P2_b7,((_n_j_b9 * 3) + 1)) + 1), _S.index_value(_n_P2_b7,((_n_j_b9 * 3) - 3)), (_S.index_value(_n_P2_b7,((_n_j_b9 * 3) - 2)) + 1), _S.index_value(_n_C,3), (_n_a_b12 * 0.6)])
				_n_j_b9 -= 1.0
		if _S.truth(((sin(((_n_t * 55) + _S.named_value(_n_f_b5,"seed"))) < 0) if _S.truth((_n_k_b6 > 0.8)) else (_n_k_b6 > 0.8))):
			continue
		_S.invoke(_n_p_b0,"rect",[(_S.named_value(_n_f_b5,"x") - 0.5), (_S.named_value(_n_f_b5,"y") - 0.5), 2, 2, (_n_WHITE if _S.truth((_n_k_b6 < 0.5)) else _S.index_value(_n_C,6))])
		if _S.truth((_n_k_b6 < 0.6)):
			for _iter_2 in _S.array([[(-1), 0], [2, 0], [0, (-1)], [0, 2]]):
				var _tuple_3 = _iter_2
				var _n_dx_b13 = _S.prop(_tuple_3,0)
				var _n_dy_b14 = _S.prop(_tuple_3,1)
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_f_b5,"x") + _n_dx_b13), (_S.named_value(_n_f_b5,"y") + _n_dy_b14), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_f_b5,"x"), _S.named_value(_n_f_b5,"y"), 10, _S.index_value(_n_C,4), (0.6 * (1 - (_n_k_b6 * 0.5)))])
	for _iter_4 in _S.array(_n_pops):
		var _n_q_b15 = _iter_4
		var _n_u_b16 = (float((_n_t - _S.named_value(_n_q_b15,"t0")))/_S.named_value(_n_q_b15,"life"))
		if _S.truth(((_n_u_b16 < 0) if _S.truth((_n_u_b16 < 0)) else (_n_u_b16 > 1))):
			continue
		_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), (2.8 * sin((PI * _n_u_b16))), _S.named_value(_n_q_b15,"c"), _S.index_value(_n_T,2), 0.5])
	var _n_b_b1 = (_n_t - _n_FLY)
	if _S.truth(((_n_b_b1 < 0.26) if _S.truth((_n_b_b1 >= 0)) else (_n_b_b1 >= 0))):
		var _n_u_b17 = (float(_n_b_b1)/0.26)
		var _n_L_b18 = (30 * pow((1 - _n_u_b17),1.3))
		if true:
			var _n_i_b19 = 0
			while _S.truth((_n_i_b19 < 8)):
				var _n_diag_b20 = _S.binary("===",fmod(_n_i_b19,2),1)
				var _n_an_b21 = ((_n_u_b17 * 0.5) + (float((_n_i_b19 * _n_TAU))/8))
				var _n_len_b22 = ((_n_L_b18 * 0.45) if _S.truth(_n_diag_b20) else _n_L_b18)
				var _n_ca_b23 = cos(_n_an_b21)
				var _n_sa_b24 = sin(_n_an_b21)
				if true:
					var _n_d_b25 = 0
					while _S.truth((_n_d_b25 <= _n_len_b22)):
						var _n_v_b26 = (float(_n_d_b25)/_n_len_b22)
						_S.invoke(_n_p_b0,"dot",[(_n_bx + (_n_ca_b23 * _n_d_b25)), (_n_by + (_n_sa_b24 * _n_d_b25)), (_n_WHITE if _S.truth((_n_v_b26 < 0.3)) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b26 < 0.65)) else _S.index_value(_n_C,4))), (1 if _S.truth((_n_v_b26 < 0.7)) else (1 - (float((_n_v_b26 - 0.7))/0.35)))])
						_n_d_b25 += 0.5
				_n_i_b19 += 1.0
		if _S.truth((_n_b_b1 < 0.07)):
			_S.invoke(_n_p_b0,"circle",[_n_bx, _n_by, 2.5, _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_bx, _n_by, (4 + (_n_L_b18 * 1.2)), _S.index_value(_n_C,4), 0.35])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.4)) else _S.index_value(_n_C,5))
	return null
