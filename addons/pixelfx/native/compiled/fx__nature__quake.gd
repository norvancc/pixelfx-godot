@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/quake.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Quake"}, {"desc": "The ground jolts three times: a rift tears out along the floor glowing deep inside, slabs of floor heave up and drop back askew, pebbles hop and dust bursts out of the split."}, {"tags": ["nature", "earth", "quake", "rift", "aoe", "ground", "one-shot"]}, {"size": [288, 104]}, {"origin": [144, 88]}, {"duration": 3.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0e0c14", "#1a1724", "#211d2d", "#2b2639", "#3a3450", "#4a4263", "#6a6088", "#8e86a8"]}, {"glow": ["#4a1a0c", "#a8401a", "#ff8a2a", "#ffd27a", "#fff4d0"]}, {"reach": 118}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "JOLTS", [0.06, 0.5, 0.92])
	_S.define(_e, "CLOSE", 2.2)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "glow"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 6), _S.call_value(_S.read(_e, "hex"), ["#8c8494"]), 0.4]))
	_S.define(_e, "DUST2", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 5), _S.call_value(_S.read(_e, "hex"), ["#6c6474"]), 0.35]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "G"), 4), _S.prop(_S.read(_e, "G"), 3), _S.prop(_S.read(_e, "G"), 2), _S.prop(_S.read(_e, "G"), 1)]}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "rift", [])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "x", _S.unary("-", _S.read(_v0, "REACH")))
	while _S.truth(_S.binary("<=", _S.read(_v0, "x"), _S.read(_v0, "REACH"))):
		_S.invoke(_S.read(_v0, "rift"), "push", [[_S.read(_v0, "x"), _S.invoke(_S.read(_v0, "R"), "int", [0, 2])]])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "x", _S.invoke(_S.read(_v0, "R"), "range", [2.5, 5]), "+=", false)
	_S.define(_e, "slabs", [])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "x", _S.binary("+", _S.unary("-", _S.read(_v1, "REACH")), 8))
	while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.binary("-", _S.read(_v1, "REACH"), 6))):
		_S.invoke(_S.read(_v1, "slabs"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v1, "x"), _S.invoke(_S.read(_v1, "R"), "range", [_S.unary("-", 2), 2]))}, {"y": 0}, {"vy": 0}, {"a": 0}, {"va": 0}, {"rest": true}, {"s": _S.invoke(_S.read(_v1, "R"), "range", [4.5, 6])}, {"side": _S.invoke(_S.read(_v1, "R"), "sign", [])}, {"pts": [[_S.unary("-", 1), _S.unary("-", 0.38)], [1, _S.unary("-", 0.42)], [1.02, 0.4], [_S.unary("-", 0.98), 0.38]]}])])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "x", _S.invoke(_S.read(_v1, "R"), "range", [12, 17]), "+=", false)
	_S.define(_e, "t", 0)
	_S.define(_e, "j", 0)
	_S.define(_e, "open", _S.function_value(_e, "_f2"))
	_S.define(_e, "gap", _S.function_value(_e, "_f3"))
	_S.define(_e, "heat", _S.function_value(_e, "_f4"))
	_S.define(_e, "shake", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_JOLTS = _S.read(_parent,"JOLTS")
	var _n_REACH = _S.read(_parent,"REACH")
	return ((_S.invoke(_n_ease,"outCubic",[clampf((float((_n_t - _S.index_value(_n_JOLTS,0)))/0.45),0.0,1.0)]) * _n_REACH) * (0.55 + (0.45 * _S.MathFX.smooth(_S.index_value(_n_JOLTS,1),(_S.index_value(_n_JOLTS,1) + 0.3),_n_t))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_t = _S.read(_parent,"t")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_JOLTS = _S.read(_parent,"JOLTS")
	var _n_x_b0 = _S.arg(_args,0)
	return (((1 - _S.MathFX.smooth(_n_CLOSE,(_n_CLOSE + 0.5),_n_t)) * (1 + (2.6 * (1 - (float(absf(_n_x_b0))/_n_REACH))))) * (0.6 + (0.4 * _S.MathFX.smooth(_S.index_value(_n_JOLTS,1),(_S.index_value(_n_JOLTS,2) + 0.2),_n_t))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	return ((_S.MathFX.smooth(0,0.3,_n_t) * (1 - _S.MathFX.smooth(1.4,(_n_CLOSE + 0.3),_n_t))) * (0.8 + (0.2 * sin((_n_t * 17)))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_JOLTS = _S.read(_parent,"JOLTS")
	var _n_this = _S.read(_parent,"this")
	return _S.invoke(_n_JOLTS,"reduce",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f6"), 0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_tj_b1 = _S.arg(_args,1)
	var _n_i_b2 = _S.arg(_args,2)
	return ((_n_s_b0 + ((exp(((-(_n_t - _n_tj_b1)) * 9)) * sin(((_n_t - _n_tj_b1) * 80))) * (1.6 - (_n_i_b2 * 0.3)))) if _S.truth((_n_t > _n_tj_b1)) else _n_s_b0)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "j"), _S.prop(_S.read(_e, "JOLTS"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.read(_e, "JOLTS"), _S.read(_e, "j"))))):
		var _v2 = _S.scope(_e)
		_S.define(_v2, "k", _S.binary("-", 1, _S.binary("*", _S.read(_v2, "j"), 0.2)))
		_S.define(_v2, "L", _S.binary("+", _S.call_value(_S.read(_v2, "open"), []), 10))
		_S.write(_v2, "j", 1, "+=", true)
		_S.invoke(_S.read(_v2, "lights"), "add", [0, _S.unary("-", 2), 60, _S.prop(_S.read(_v2, "G"), 2), _S.binary("*", 0.5, _S.read(_v2, "k")), 0.5])
		_S.invoke(_S.read(_v2, "lights"), "add", [0, _S.unary("-", 2), 26, _S.read(_v2, "WHITE"), _S.binary("*", 0.4, _S.read(_v2, "k")), 0.07])
		for _v3 in _S.array(_S.read(_v2, "slabs")):
			var _v4 = _S.scope(_v2)
			_S.define(_v4, "s", _v3)
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "d", _S.binary("/", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.prop(_S.read(_v5, "s"), "x")]), _S.read(_v5, "REACH")))
			if _S.truth(_S.logical("||", _S.binary(">", _S.invoke(_S.read(_v5, "Math"), "abs", [_S.prop(_S.read(_v5, "s"), "x")]), _S.read(_v5, "L")), func(): return _S.invoke(_S.read(_v5, "R"), "chance", [_S.binary("+", 0.25, _S.binary("*", _S.read(_v5, "d"), 0.3))]))):
				continue
			_S.last([_S.set_prop(_S.read(_v5, "s"), "rest", false, "=", false), _S.set_prop(_S.read(_v5, "s"), "vy", _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [70, 170])), _S.read(_v5, "k")), _S.binary("-", 1, _S.binary("*", _S.read(_v5, "d"), 0.5))), "=", false), _S.set_prop(_S.read(_v5, "s"), "va", _S.binary("*", _S.prop(_S.read(_v5, "s"), "side"), _S.invoke(_S.read(_v5, "R"), "range", [3, 8])), "=", false)])
		var _v6 = _S.scope(_v2)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), _S.binary("*", 70, _S.read(_v6, "k")))):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "x", _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", _S.read(_v7, "L")), _S.read(_v7, "L")]))
			_S.define(_v7, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v7, "Math"), "PI")), 2), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 0.6), 0.6])))
			_S.define(_v7, "sp", _S.binary("*", _S.invoke(_S.read(_v7, "R"), "range", [40, 200]), _S.read(_v7, "k")))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "GRIT"), _S.read(_v7, "x"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "R"), "range", [0.6, 1.2]), _S.invoke(_S.read(_v7, "R"), "pick", [[_S.prop(_S.read(_v7, "S"), 7), _S.prop(_S.read(_v7, "S"), 6), _S.prop(_S.read(_v7, "S"), 5), _S.prop(_S.read(_v7, "S"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.35])) else 1)])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
		var _v8 = _S.scope(_v2)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), _S.binary("*", 8, _S.read(_v8, "k")))):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "x", _S.binary("*", _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", _S.read(_v9, "L")), _S.read(_v9, "L")]), 0.8))
			_S.define(_v9, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v9, "Math"), "PI")), 2), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.9), 0.9])))
			_S.define(_v9, "sp", _S.binary("*", _S.invoke(_S.read(_v9, "R"), "range", [100, 230]), _S.read(_v9, "k")))
			_S.invoke(_S.read(_v9, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v9, "B"), "CHUNK")}, {"x": _S.read(_v9, "x")}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "a")]), _S.read(_v9, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "a")]), _S.read(_v9, "sp"))}, {"g": 1}, {"drag": 0.5}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v9, "Math"), "min", [_S.invoke(_S.read(_v9, "R"), "range", [1.1, 1.6]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v9, "meta"), "duration"), 0.1), _S.read(_v9, "t"))])}, {"a": _S.invoke(_S.read(_v9, "R"), "range", [0, _S.read(_v9, "TAU")])}, {"va": _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v9, "R"), "range", [1.6, 3.2])}, {"pts": _S.call_value(_S.read(_v9, "stoneShape"), [_S.read(_v9, "R")])}])])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
		var _v10 = _S.scope(_v2)
		_S.define(_v10, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v10, "i"), _S.binary("*", 14, _S.read(_v10, "k")))):
			var _v11 = _S.scope(_v10)
			_S.define(_v11, "x", _S.binary("*", _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", _S.read(_v11, "L")), _S.read(_v11, "L")]), 0.9))
			_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SMOKE"), _S.read(_v11, "x"), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [1, 4])), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 40), 40]), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [15, 55])), _S.read(_v11, "k")), _S.invoke(_S.read(_v11, "R"), "range", [1, 1.7]), (_S.read(_v11, "DUST") if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.read(_v11, "DUST2")), _S.binary("*", _S.invoke(_S.read(_v11, "R"), "range", [4, 7]), _S.read(_v11, "k")), _S.invoke(_S.read(_v11, "R"), "range", [0, 0.15]), _S.prop(_S.read(_v11, "PF"), "BIG")])
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "i", 1, "+=", true)
		var _v12 = _S.scope(_v2)
		_S.define(_v12, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.binary("*", 10, _S.read(_v12, "k")))):
			var _v13 = _S.scope(_v12)
			_S.define(_v13, "x", _S.binary("*", _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", _S.read(_v13, "L")), _S.read(_v13, "L")]), 0.7))
			_S.define(_v13, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 1), 1])))
			_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [120, 300]))
			_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.read(_v13, "x"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.invoke(_S.read(_v13, "R"), "range", [0.12, 0.3])])
			_v12 = _S.iteration(_v12)
			_S.write(_v12, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "JOLTS"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLOSE"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.3, _S.read(_e, "f"))]))):
		var _v14 = _S.scope(_e)
		_S.define(_v14, "x", _S.binary("*", _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1), 1]), _S.call_value(_S.read(_v14, "open"), [])))
		_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "GRIT"), _S.read(_v14, "x"), _S.unary("-", 1), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [20, 70])), _S.invoke(_S.read(_v14, "R"), "range", [0.5, 0.8]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "S"), 6), _S.prop(_S.read(_v14, "S"), 5)]]), 1])
		if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.3])):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "EMBER"), _S.read(_v14, "x"), _S.unary("-", 1), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [20, 45])), _S.invoke(_S.read(_v14, "Math"), "min", [_S.invoke(_S.read(_v14, "R"), "range", [0.6, 1.2]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v14, "meta"), "duration"), 0.1), _S.read(_v14, "t"))]), _S.prop(_S.read(_v14, "G"), 3), 1])
		if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.25])):
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "DUST"), _S.read(_v14, "x"), _S.unary("-", 1), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [4, 14])), _S.invoke(_S.read(_v14, "R"), "range", [0.5, 0.8]), _S.read(_v14, "DUST2"), _S.invoke(_S.read(_v14, "R"), "range", [2, 3.5])])
	for _v15 in _S.array(_S.read(_e, "slabs")):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "s", _v15)
		var _v17 = _S.scope(_v16)
		if _S.truth(_S.prop(_S.read(_v17, "s"), "rest")):
			continue
		_S.set_prop(_S.read(_v17, "s"), "vy", _S.binary("*", 950, _S.read(_v17, "dt")), "+=", false)
		_S.set_prop(_S.read(_v17, "s"), "y", _S.binary("*", _S.prop(_S.read(_v17, "s"), "vy"), _S.read(_v17, "dt")), "+=", false)
		_S.set_prop(_S.read(_v17, "s"), "a", _S.binary("*", _S.prop(_S.read(_v17, "s"), "va"), _S.read(_v17, "dt")), "+=", false)
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.prop(_S.read(_v17, "s"), "y"), 0), func(): return _S.binary(">", _S.prop(_S.read(_v17, "s"), "vy"), 0))):
			var _v18 = _S.scope(_v17)
			_S.set_prop(_S.read(_v18, "s"), "y", 0, "=", false)
			_S.set_prop(_S.read(_v18, "s"), "a", _S.call_value(_S.read(_v18, "clamp"), [_S.prop(_S.read(_v18, "s"), "a"), _S.unary("-", 0.45), 0.45]), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v18, "s"), "vy"), 160)):
				_S.last([_S.set_prop(_S.read(_v18, "s"), "vy", _S.unary("-", 0.25), "*=", false), _S.set_prop(_S.read(_v18, "s"), "va", _S.unary("-", 0.4), "*=", false)])
			else:
				var _v19 = _S.scope(_v18)
				_S.set_prop(_S.read(_v19, "s"), "rest", true, "=", false)
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v20, "i"), 3)):
					_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v20, "s"), "x"), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 5), 5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v20, "R"), "sign", []), _S.invoke(_S.read(_v20, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 12])), _S.invoke(_S.read(_v20, "R"), "range", [0.4, 0.7]), _S.read(_v20, "DUST2"), _S.invoke(_S.read(_v20, "R"), "range", [1.5, 3])])
					_v20 = _S.iteration(_v20)
					_S.write(_v20, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v21 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v22 = _S.scope(_e)
		_S.define(_v22, "b", _v21)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v22, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v22, "b"), "dusted")))):
			var _v23 = _S.scope(_v22)
			_S.set_prop(_S.read(_v23, "b"), "dusted", true, "=", false)
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "DUST"), _S.prop(_S.read(_v23, "b"), "x"), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [8, 30])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [2, 10])), _S.invoke(_S.read(_v23, "Math"), "min", [_S.invoke(_S.read(_v23, "R"), "range", [0.3, 0.6]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v23, "meta"), "duration"), 0.1), _S.read(_v23, "t"))]), _S.read(_v23, "DUST2"), _S.invoke(_S.read(_v23, "R"), "range", [1.3, 2.4])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_open = _S.read(_parent,"open")
	var _n_heat = _S.read(_parent,"heat")
	var _n_shake = _S.read(_parent,"shake")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_t = _S.read(_parent,"t")
	var _n_JOLTS = _S.read(_parent,"JOLTS")
	var _n_rift = _S.read(_parent,"rift")
	var _n_gap = _S.read(_parent,"gap")
	var _n_S = _S.read(_parent,"S")
	var _n_G = _S.read(_parent,"G")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.call_value(_n_open,[])
	var _n_hk_b2 = _S.call_value(_n_heat,[])
	var _n_jx_b3 = _S.call_value(_n_shake,[])
	var _n_fade_b4 = (1 - _S.MathFX.smooth((_n_CLOSE + 0.3),(_n_CLOSE + 0.7),_n_t))
	if _S.truth((_n_t > _S.index_value(_n_JOLTS,0))):
		if true:
			var _n_i_b5 = 1
			while _S.truth((_n_i_b5 < _S.prop(_n_rift,"length"))):
				var _tuple_0 = _S.index_value(_n_rift,(_n_i_b5 - 1))
				var _n_x0_b6 = _S.prop(_tuple_0,0)
				var _n_d0_b7 = _S.prop(_tuple_0,1)
				var _tuple_1 = _S.index_value(_n_rift,_n_i_b5)
				var _n_x1_b8 = _S.prop(_tuple_1,0)
				var _n_d1_b9 = _S.prop(_tuple_1,1)
				if _S.truth((absf(_n_x0_b6) > _n_L_b1)):
					_n_i_b5 += 1.0
					continue
				if true:
					var _n_x_b10 = ceili(_n_x0_b6)
					while _S.truth((_n_x_b10 < _n_x1_b8)):
						var _n_u_b11 = (float((_n_x_b10 - _n_x0_b6))/(_n_x1_b8 - _n_x0_b6))
						var _n_d_b12 = floori((_n_d0_b7 + ((_n_d1_b9 - _n_d0_b7) * _n_u_b11))+0.5)
						var _n_w_b13 = _S.call_value(_n_gap,[_n_x_b10])
						var _n_X_b14 = (_n_x_b10 + _n_jx_b3)
						if _S.truth((_n_w_b13 < 0.4)):
							_S.invoke(_n_p_b0,"dot",[_n_X_b14, _n_d_b12, _S.index_value(_n_S,1), _n_fade_b4])
							_n_x_b10 += 1.0
							continue
						_S.invoke(_n_p_b0,"dot",[_n_X_b14, (_n_d_b12 - 1), _S.index_value(_n_S,6), _n_fade_b4])
						var _n_deep_b15 = (_S.MathFX.rand([floori((float(_n_x_b10)/3)),41]) + ((_n_w_b13 - 1.5) * 0.35))
						var _n_hot_b16 = ((_n_hk_b2 * clampf((_n_deep_b15 - 0.35),0,1)) * 1.6)
						if true:
							var _n_y_b17 = 0
							while _S.truth((_n_y_b17 < _n_w_b13)):
								_S.invoke(_n_p_b0,"dot",[_n_X_b14, (_n_d_b12 + _n_y_b17), ((_S.index_value(_n_G,3) if _S.truth(((_S.MathFX.rand([_n_x_b10,floori((_n_t * 12))]) < 0.6) if _S.truth((_n_hot_b16 > 0.9)) else (_n_hot_b16 > 0.9))) else _S.index_value(_n_G,2)) if _S.truth(((_n_hot_b16 > 0.25) if _S.truth((_n_y_b17 > ((float(_n_w_b13)/2) - 1))) else (_n_y_b17 > ((float(_n_w_b13)/2) - 1)))) else (_S.index_value(_n_G,1) if _S.truth(((_n_hot_b16 > 0.08) if _S.truth((_n_y_b17 > ((float(_n_w_b13)/2) - 1))) else (_n_y_b17 > ((float(_n_w_b13)/2) - 1)))) else _S.index_value(_n_S,0))), _n_fade_b4])
								_n_y_b17 += 1.0
						_S.invoke(_n_p_b0,"dot",[_n_X_b14, (_n_d_b12 + ceili(_n_w_b13)), _S.index_value(_n_S,2), _n_fade_b4])
						_n_x_b10 += 1.0
				if _S.truth(((_n_hk_b2 > 0) if _S.truth(_S.binary("===",fmod(_n_i_b5,3),0)) else _S.binary("===",fmod(_n_i_b5,3),0))):
					_S.invoke(_n_p_b0,"glow",[(_n_x1_b8 + _n_jx_b3), (_n_d1_b9 + 1), 9, _S.index_value(_n_G,2), ((0.35 * _n_hk_b2) * (1 - (float(absf(_n_x1_b8))/(_n_REACH * 1.2))))])
				_n_i_b5 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_shake = _S.read(_parent,"shake")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_t = _S.read(_parent,"t")
	var _n_S = _S.read(_parent,"S")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_slabs = _S.read(_parent,"slabs")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_jx_b1 = _S.call_value(_n_shake,[])
	var _n_sink_b2 = _S.MathFX.smooth(_n_CLOSE,(_n_CLOSE + 0.6),_n_t)
	for _iter_0 in _S.array(_n_slabs):
		var _n_s_b3 = _iter_0
		if _S.truth(((_n_sink_b2 < 1) if _S.truth(not _S.truth((_S.binary("===",_S.named_value(_n_s_b3,"y"),0) if _S.truth((_S.binary("===",_S.named_value(_n_s_b3,"a"),0) if _S.truth(_S.named_value(_n_s_b3,"rest")) else _S.named_value(_n_s_b3,"rest"))) else (_S.binary("===",_S.named_value(_n_s_b3,"a"),0) if _S.truth(_S.named_value(_n_s_b3,"rest")) else _S.named_value(_n_s_b3,"rest"))))) else not _S.truth((_S.binary("===",_S.named_value(_n_s_b3,"y"),0) if _S.truth((_S.binary("===",_S.named_value(_n_s_b3,"a"),0) if _S.truth(_S.named_value(_n_s_b3,"rest")) else _S.named_value(_n_s_b3,"rest"))) else (_S.binary("===",_S.named_value(_n_s_b3,"a"),0) if _S.truth(_S.named_value(_n_s_b3,"rest")) else _S.named_value(_n_s_b3,"rest")))))):
			_S.call_value(_n_drawRock,[_n_p_b0, (_S.named_value(_n_s_b3,"x") + _n_jx_b1), ((_S.named_value(_n_s_b3,"y") - 1.5) + (_n_sink_b2 * 4)), _S.named_value(_n_s_b3,"s"), _S.named_value(_n_s_b3,"a"), _S.named_value(_n_s_b3,"pts"), _n_S, (1 - _n_sink_b2)])
	for _iter_1 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b4 = _iter_1
		_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_b_b4,"x"), _S.named_value(_n_b_b4,"y"), _S.named_value(_n_b_b4,"s"), _S.named_value(_n_b_b4,"a"), _S.named_value(_n_b_b4,"pts"), _n_S, minf(1,(float(_S.named_value(_n_b_b4,"life"))/0.4))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null
