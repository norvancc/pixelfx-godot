@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/nature/boulder.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "stoneShape", _S.import_value("fx/nature/_lib.js", "stoneShape"))
	_S.define(_e, "drawRock", _S.import_value("fx/nature/_lib.js", "drawRock"))
	_S.define(_e, "surface", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Boulder"}, {"desc": "A spinning boulder arcs right shedding dust and pebbles, smashes into the floor in a white flash and bursts into tumbling chunks, gravel and rolling dust."}, {"tags": ["nature", "earth", "rock", "projectile", "impact", "directional", "one-shot"]}, {"size": [264, 120]}, {"origin": [40, 104]}, {"duration": 2.3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#100e12", "#1e1a22", "#302a36", "#463e4c", "#5e5464", "#7c7080", "#a0949e", "#cec4c8"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"size": 11}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "X0", 6)
	_S.define(_e, "Y0", _S.unary("-", 26))
	_S.define(_e, "VX", 220)
	_S.define(_e, "VY", _S.unary("-", 170))
	_S.define(_e, "G", 860)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_r_b3 = _S.arg(_args,3)
	var _n_a_b4 = _S.arg(_args,4)
	var _n_S_b5 = _S.arg(_args,5)
	var _n_M_b6 = _S.arg(_args,6)
	var _n_c_b7 = cos(_n_a_b4)
	var _n_s_b8 = sin(_n_a_b4)
	var _n_at_b9 = _S.function_value(_S.capture(_parent,{"x":_n_x_b1,"c":_n_c_b7,"s":_n_s_b8,"r":_n_r_b3,"y":_n_y_b2,"this":_this}),"_f1")
	for _iter_0 in _S.array([[0.42, 0.12], [(-0.3), 0.38]]):
		var _tuple_1 = _iter_0
		var _n_u_b10 = _S.prop(_tuple_1,0)
		var _n_v_b11 = _S.prop(_tuple_1,1)
		var _tuple_2 = _S.call_value(_n_at_b9,[_n_u_b10, _n_v_b11])
		var _n_px_b12 = _S.prop(_tuple_2,0)
		var _n_py_b13 = _S.prop(_tuple_2,1)
		_S.invoke(_n_p_b0,"px",[_n_px_b12, _n_py_b13, _S.index_value(_n_S_b5,3)])
	if true:
		var _n_k_b14 = 0
		while _S.truth((_n_k_b14 < 9)):
			var _n_g_b15 = (3.6 + ((float(_n_k_b14)/8) * 1.3))
			var _n_rr_b16 = (0.78 if _S.truth(_S.binary("===",fmod(_n_k_b14,3),1)) else 0.92)
			var _tuple_3 = _S.call_value(_n_at_b9,[(cos(_n_g_b15) * _n_rr_b16), (sin(_n_g_b15) * _n_rr_b16)])
			var _n_px_b17 = _S.prop(_tuple_3,0)
			var _n_py_b18 = _S.prop(_tuple_3,1)
			_S.invoke(_n_p_b0,"px",[_n_px_b17, _n_py_b18, _S.index_value(_n_M_b6,(0 if _S.truth(_S.binary("===",fmod(_n_k_b14,3),1)) else (2 if _S.truth((_n_py_b18 < _n_y_b2)) else 1)))])
			_n_k_b14 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_c = _S.read(_parent,"c")
	var _n_s = _S.read(_parent,"s")
	var _n_r = _S.read(_parent,"r")
	var _n_y = _S.read(_parent,"y")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.arg(_args,1)
	return [(_n_x + (((_n_u_b0 * _n_c) - (_n_v_b1 * _n_s)) * _n_r)), (_n_y + (((_n_u_b0 * _n_s) + (_n_v_b1 * _n_c)) * _n_r))]
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "RAD", _S.prop(_S.read(_e, "o"), "size"))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 6), _S.call_value(_S.read(_e, "hex"), ["#9a8f86"]), 0.4]))
	_S.define(_e, "DUST2", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "S"), 5), _S.call_value(_S.read(_e, "hex"), ["#7a7068"]), 0.35]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "MOSSC", [_S.call_value(_S.read(_e, "hex"), ["#1f3a1e"]), _S.call_value(_S.read(_e, "hex"), ["#3f7a2c"]), _S.call_value(_S.read(_e, "hex"), ["#7cb83a"])])
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "shape", _S.call_value(_S.read(_e, "stoneShape"), [_S.read(_e, "R"), 8]))
	_S.define(_e, "tHit", _S.binary("/", _S.binary("+", _S.unary("-", _S.read(_e, "VY")), _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", _S.binary("*", _S.read(_e, "VY"), _S.read(_e, "VY")), _S.binary("*", _S.binary("*", 2, _S.read(_e, "G")), _S.binary("+", _S.read(_e, "Y0"), _S.binary("*", _S.read(_e, "RAD"), 0.8))))])), _S.read(_e, "G")))
	_S.define(_e, "xHit", _S.binary("+", _S.read(_e, "X0"), _S.binary("*", _S.read(_e, "VX"), _S.read(_e, "tHit"))))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "thrown", false)
	_S.define(_e, "at", _S.function_value(_e, "_f4"))
	_S.define(_e, "rock", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_X0 = _S.read(_parent,"X0")
	var _n_VX = _S.read(_parent,"VX")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_VY = _S.read(_parent,"VY")
	var _n_G = _S.read(_parent,"G")
	var _n_tt_b0 = _S.arg(_args,0)
	return [(_n_X0 + (_n_VX * _n_tt_b0)), ((_n_Y0 + (_n_VY * _n_tt_b0)) + (((0.5 * _n_G) * _n_tt_b0) * _n_tt_b0))]
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "b", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "bits"), "add", [_S.merge([_S.read(_e, "b"), {"pts": _S.call_value(_S.read(_e, "stoneShape"), [_S.read(_e, "R")])}])])

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.invoke(_S.read(_e, "Math"), "min", [1, _S.binary("*", _S.read(_e, "dt"), 120)]))
	if _S.truth(_S.unary("!", _S.read(_e, "thrown"))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "thrown", true, "=", false)
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 6)):
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "DUST"), _S.binary("-", _S.read(_v9, "X0"), _S.invoke(_S.read(_v9, "R"), "range", [0, 6])), _S.binary("+", _S.read(_v9, "Y0"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v9, "R"), "range", [20, 70])), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v9, "R"), "range", [0.4, 0.7]), _S.read(_v9, "DUST"), _S.invoke(_S.read(_v9, "R"), "range", [2.5, 4.5])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "X0"), _S.read(_v8, "Y0"), 30, _S.read(_v8, "WHITE"), 0.3, 0.1])
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "tHit"))):
		var _v10 = _S.scope(_e)
		var _v11 = _S.call_value(_S.read(_v10, "at"), [_S.read(_v10, "t")])
		_S.define(_v10, "x", _S.prop(_v11, 0))
		_S.define(_v10, "y", _S.prop(_v11, 1))
		if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [_S.binary("*", 0.5, _S.read(_v10, "f"))])):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "DUST"), _S.binary("-", _S.read(_v10, "x"), _S.invoke(_S.read(_v10, "R"), "range", [2, 6])), _S.binary("+", _S.read(_v10, "y"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [10, 40])), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v10, "R"), "range", [0.3, 0.6]), _S.read(_v10, "DUST"), _S.invoke(_S.read(_v10, "R"), "range", [2, 3.5])])
		if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [_S.binary("*", 0.12, _S.read(_v10, "f"))])):
			_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "GRIT"), _S.binary("+", _S.read(_v10, "x"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("+", _S.read(_v10, "y"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 2), 4])), _S.binary("*", _S.read(_v10, "VX"), 0.3), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 40), 20]), _S.invoke(_S.read(_v10, "R"), "range", [0.6, 0.9]), _S.invoke(_S.read(_v10, "R"), "pick", [[_S.prop(_S.read(_v10, "S"), 5), _S.prop(_S.read(_v10, "S"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.3])) else 1)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "tHit")))):
		var _v12 = _S.scope(_e)
		_S.write(_v12, "hit", true, "=", false)
		_S.define(_v12, "x", _S.read(_v12, "xHit"))
		_S.define(_v12, "y", _S.binary("*", _S.unary("-", _S.read(_v12, "RAD")), 0.6))
		_S.invoke(_S.read(_v12, "lights"), "add", [_S.read(_v12, "x"), _S.read(_v12, "y"), 36, _S.read(_v12, "WHITE"), 0.75, 0.1])
		_S.invoke(_S.read(_v12, "lights"), "add", [_S.read(_v12, "x"), _S.read(_v12, "y"), 60, _S.call_value(_S.read(_v12, "hex"), ["#ffb060"]), 0.45, 0.5])
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 9)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.2), 1.1])))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [100, 240]))
			_S.call_value(_S.read(_v14, "rock"), [_S.merge([{"kind": _S.prop(_S.read(_v14, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 5), 5]))}, {"y": _S.binary("+", _S.read(_v14, "y"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 5), 5]))}, {"vx": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), 30)}, {"vy": _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp"))}, {"g": 1}, {"drag": 0.7}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v14, "R"), "range", [1.3, 1.7])}, {"a": _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")])}, {"va": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v14, "R"), "range", [2.8, 5.2])}])])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v12)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 14)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v16, "Math"), "PI")), 2), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "R"), "range", [120, 280]))
			_S.call_value(_S.read(_v16, "rock"), [_S.merge([{"kind": _S.prop(_S.read(_v16, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v16, "x"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 4), 4]))}, {"y": _S.read(_v16, "y")}, {"vx": _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "sp")), 25)}, {"vy": _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "sp"))}, {"g": 1}, {"drag": 0.8}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v16, "R"), "range", [1.1, 1.5])}, {"a": _S.invoke(_S.read(_v16, "R"), "range", [0, _S.read(_v16, "TAU")])}, {"va": _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v16, "R"), "range", [1.4, 2.6])}])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v12)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 60)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "u", _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 1), 1]))
			_S.define(_v18, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v18, "Math"), "PI")), 2), _S.binary("*", _S.read(_v18, "u"), 1.1)))
			_S.define(_v18, "sp", _S.binary("*", _S.invoke(_S.read(_v18, "R"), "range", [80, 300]), _S.binary("-", 1, _S.binary("*", 0.3, _S.invoke(_S.read(_v18, "Math"), "abs", [_S.read(_v18, "u")])))))
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "GRIT"), _S.binary("+", _S.read(_v18, "x"), _S.binary("*", _S.read(_v18, "u"), 6)), _S.unary("-", 1), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), _S.read(_v18, "sp")), 30), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), _S.read(_v18, "sp")), _S.invoke(_S.read(_v18, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v18, "R"), "pick", [[_S.prop(_S.read(_v18, "S"), 6), _S.prop(_S.read(_v18, "S"), 5), _S.prop(_S.read(_v18, "S"), 4), _S.prop(_S.read(_v18, "S"), 4), _S.prop(_S.read(_v18, "S"), 3)]]), (2 if _S.truth(_S.invoke(_S.read(_v18, "R"), "chance", [0.4])) else 1)])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
		var _v19 = _S.scope(_v12)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 12)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v20, "Math"), "PI")), 2), _S.invoke(_S.read(_v20, "R"), "range", [_S.unary("-", 1.3), 1.3])))
			_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [150, 380]))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), 40), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.invoke(_S.read(_v20, "R"), "range", [0.15, 0.4])])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v12)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 14)):
			var _v22 = _S.scope(_v21)
			_S.define(_v22, "sd", _S.invoke(_S.read(_v22, "R"), "sign", []))
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.binary("+", _S.read(_v22, "x"), _S.binary("*", _S.read(_v22, "sd"), _S.invoke(_S.read(_v22, "R"), "range", [2, 10]))), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [1, 5])), _S.binary("+", _S.binary("*", _S.read(_v22, "sd"), _S.invoke(_S.read(_v22, "R"), "range", [40, 140])), 10), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [4, 20])), _S.invoke(_S.read(_v22, "R"), "range", [1.1, 1.8]), (_S.read(_v22, "DUST") if _S.truth(_S.invoke(_S.read(_v22, "R"), "chance", [0.5])) else _S.read(_v22, "DUST2")), _S.invoke(_S.read(_v22, "R"), "range", [4.5, 8]), _S.invoke(_S.read(_v22, "R"), "range", [0, 0.05]), _S.prop(_S.read(_v22, "PF"), "BIG")])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v23 = _S.scope(_v12)
		_S.define(_v23, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "i"), 6)):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SMOKE"), _S.binary("+", _S.read(_v23, "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [4, 14])), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 15), 25]), _S.unary("-", _S.invoke(_S.read(_v23, "R"), "range", [30, 80])), _S.invoke(_S.read(_v23, "R"), "range", [1.2, 1.8]), _S.read(_v23, "DUST"), _S.invoke(_S.read(_v23, "R"), "range", [6, 9]), _S.invoke(_S.read(_v23, "R"), "range", [0, 0.1]), _S.prop(_S.read(_v23, "PF"), "BIG")])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "i", 1, "+=", true)
		var _v24 = _S.scope(_v12)
		_S.define(_v24, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v24, "i"), 3)):
			_S.invoke(_S.read(_v24, "ps"), "spawn", [_S.prop(_S.read(_v24, "P"), "STAR"), _S.binary("+", _S.read(_v24, "x"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 8), 8])), _S.binary("+", _S.read(_v24, "y"), _S.invoke(_S.read(_v24, "R"), "range", [_S.unary("-", 10), 4])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v24, "R"), "range", [0.2, 0.4]), _S.prop(_S.read(_v24, "S"), 7), _S.invoke(_S.read(_v24, "R"), "range", [1, 2])])
			_v24 = _S.iteration(_v24)
			_S.write(_v24, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	for _v25 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v26 = _S.scope(_e)
		_S.define(_v26, "b", _v25)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v26, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v26, "b"), "dusted")))):
			var _v27 = _S.scope(_v26)
			_S.set_prop(_S.read(_v27, "b"), "dusted", true, "=", false)
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v28, "i"), 2)):
				_S.invoke(_S.read(_v28, "ps"), "spawn", [_S.prop(_S.read(_v28, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v28, "b"), "x"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v28, "R"), "sign", []), _S.invoke(_S.read(_v28, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v28, "R"), "range", [2, 12])), _S.invoke(_S.read(_v28, "Math"), "min", [_S.invoke(_S.read(_v28, "R"), "range", [0.3, 0.6]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v28, "meta"), "duration"), 0.05), _S.read(_v28, "t"))]), _S.read(_v28, "DUST2"), _S.invoke(_S.read(_v28, "R"), "range", [1.3, 2.6])])
				_v28 = _S.iteration(_v28)
				_S.write(_v28, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_tHit = _S.read(_parent,"tHit")
	var _n_meta = _S.read(_parent,"meta")
	var _n_xHit = _S.read(_parent,"xHit")
	var _n_S = _S.read(_parent,"S")
	var _n_ease = _S.read(_parent,"ease")
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_e_b1 = (_n_t - _n_tHit)
	if _S.truth((_n_e_b1 > 0)):
		var _n_fade_b2 = (1 - _S.MathFX.smooth((_S.named_value(_n_meta,"duration") - 0.6),(_S.named_value(_n_meta,"duration") - 0.15),_n_t))
		var _n_w_b3 = (10 * minf(1,(float(_n_e_b1)/0.05)))
		if true:
			var _n_x_b5 = floori((-_n_w_b3))
			while _S.truth((_n_x_b5 <= _n_w_b3)):
				var _n_d_b6 = (float(absf(_n_x_b5))/_n_w_b3)
				_S.invoke(_n_p_b0,"dot",[(_n_xHit + _n_x_b5), 0, (_S.index_value(_n_S,0) if _S.truth((_n_d_b6 < 0.6)) else _S.index_value(_n_S,1)), _n_fade_b2])
				if _S.truth((_n_d_b6 < 0.5)):
					_S.invoke(_n_p_b0,"dot",[(_n_xHit + _n_x_b5), 1, _S.index_value(_n_S,1), (_n_fade_b2 * 0.8)])
				_n_x_b5 += 1.0
		for _iter_0 in _S.array([(-1), 1]):
			var _n_sd_b7 = _iter_0
			if true:
				var _n_k_b8 = 0
				while _S.truth((_n_k_b8 < 4)):
					_S.invoke(_n_p_b0,"dot",[(_n_xHit + (_n_sd_b7 * ((_n_w_b3 + 2) + (_n_k_b8 * 3)))), (1 if _S.truth(_S.binary("&",_n_k_b8,1)) else 0), _S.index_value(_n_S,1), (_n_fade_b2 * (1 - (float(_n_k_b8)/4)))])
					_n_k_b8 += 1.0
		var _n_k_b4 = (float(_n_e_b1)/0.45)
		if _S.truth((_n_k_b4 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_xHit, 0.5, (46 * _S.invoke(_n_ease,"outCubic",[_n_k_b4])), 0.18, maxf(1,(3 * (1 - _n_k_b4))), (1.15 - _n_k_b4), [_S.index_value(_n_S,4), _S.index_value(_n_S,6), _S.call_value(_n_hex,["#ffd27a"]), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_tHit = _S.read(_parent,"tHit")
	var _n_at = _S.read(_parent,"at")
	var _n_VX = _S.read(_parent,"VX")
	var _n_VY = _S.read(_parent,"VY")
	var _n_G = _S.read(_parent,"G")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_S = _S.read(_parent,"S")
	var _n_shape = _S.read(_parent,"shape")
	var _n_drawRock = _S.read(_parent,"drawRock")
	var _n_surface = _S.read(_parent,"surface")
	var _n_MOSSC = _S.read(_parent,"MOSSC")
	var _n_xHit = _S.read(_parent,"xHit")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_hex = _S.read(_parent,"hex")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_tHit)):
		var _tuple_0 = _S.call_value(_n_at,[_n_t])
		var _n_x_b2 = _S.prop(_tuple_0,0)
		var _n_y_b3 = _S.prop(_tuple_0,1)
		var _n_sp_b4 = _S.Bridge.hypot([_n_VX, (_n_VY + (_n_G * _n_t))])
		var _n_ux_b5 = (float(_n_VX)/_n_sp_b4)
		var _n_uy_b6 = (float((_n_VY + (_n_G * _n_t)))/_n_sp_b4)
		if true:
			var _n_i_b7 = 0
			while _S.truth((_n_i_b7 < 4)):
				var _n_off_b8 = (((_n_i_b7 - 1.5) * _n_RAD) * 0.55)
				var _n_nx_b9 = ((-_n_uy_b6) * _n_off_b8)
				var _n_ny_b10 = (_n_ux_b5 * _n_off_b8)
				var _n_L_b11 = (10 + (fmod(_n_i_b7,2) * 6))
				_S.invoke(_n_p_b0,"line",[((_n_x_b2 - (_n_ux_b5 * (_n_RAD + 2))) + _n_nx_b9), ((_n_y_b3 - (_n_uy_b6 * (_n_RAD + 2))) + _n_ny_b10), ((_n_x_b2 - (_n_ux_b5 * ((_n_RAD + 2) + _n_L_b11))) + _n_nx_b9), ((_n_y_b3 - (_n_uy_b6 * ((_n_RAD + 2) + _n_L_b11))) + _n_ny_b10), (_S.index_value(_n_S,5) if _S.truth(fmod(_n_i_b7,2)) else _S.index_value(_n_S,6)), 0.8])
				_n_i_b7 += 1.0
		_S.call_value(_n_drawRock,[_n_p_b0, _n_x_b2, _n_y_b3, _n_RAD, (_n_t * 13), _n_shape, _n_S])
		_S.call_value(_n_surface,[_n_p_b0, _n_x_b2, _n_y_b3, (_n_RAD * 0.8), (_n_t * 13), _n_S, _n_MOSSC])
		_S.invoke(_n_p_b0,"glow",[_n_x_b2, _n_y_b3, (_n_RAD * 2), _S.index_value(_n_S,6), 0.12])
	var _n_e_b1 = (_n_t - _n_tHit)
	if _S.truth(((_n_e_b1 < 0.07) if _S.truth((_n_e_b1 >= 0)) else (_n_e_b1 >= 0))):
		_S.call_value(_n_drawRock,[_n_p_b0, _n_xHit, ((-_n_RAD) * 0.8), _n_RAD, (_n_tHit * 13), _n_shape, _n_S, 1, true])
		_S.call_value(_n_sparkle,[_n_p_b0, _n_xHit, ((-_n_RAD) * 0.6), (12 * (1 - (float(_n_e_b1)/0.07))), _n_WHITE, _S.call_value(_n_hex,["#ffd27a"]), 0.6])
	if _S.truth(((_n_e_b1 < 0.14) if _S.truth((_n_e_b1 >= 0)) else (_n_e_b1 >= 0))):
		var _n_k_b12 = (float(_n_e_b1)/0.14)
		if true:
			var _n_i_b13 = 0
			while _S.truth((_n_i_b13 < 9)):
				var _n_a_b14 = ((-PI) + ((float(_n_i_b13)/8) * PI))
				var _n_r0_b15 = ((_n_RAD + 4) + (16 * _n_k_b12))
				var _n_r1_b16 = (_n_r0_b15 + (8 * (1 - _n_k_b12)))
				_S.invoke(_n_p_b0,"line",[(_n_xHit + (cos(_n_a_b14) * _n_r0_b15)), (((-_n_RAD) * 0.6) + (sin(_n_a_b14) * _n_r0_b15)), (_n_xHit + (cos(_n_a_b14) * _n_r1_b16)), (((-_n_RAD) * 0.6) + (sin(_n_a_b14) * _n_r1_b16)), (_n_WHITE if _S.truth((_n_k_b12 < 0.5)) else _S.index_value(_n_S,6))])
				_n_i_b13 += 1.0
	if _S.truth((_n_e_b1 > 0)):
		var _n_k_b17 = (float(_n_e_b1)/0.45)
		if _S.truth((_n_k_b17 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_xHit, 0.5, (46 * _S.invoke(_n_ease,"outCubic",[_n_k_b17])), 0.18, maxf(1,(3 * (1 - _n_k_b17))), (1.15 - _n_k_b17), [_S.index_value(_n_S,4), _S.index_value(_n_S,6), _S.call_value(_n_hex,["#ffd27a"]), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f10")])
	for _iter_1 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b18 = _iter_1
		_S.call_value(_n_drawRock,[_n_p_b0, _S.named_value(_n_b_b18,"x"), _S.named_value(_n_b_b18,"y"), _S.named_value(_n_b_b18,"s"), _S.named_value(_n_b_b18,"a"), _S.named_value(_n_b_b18,"pts"), _n_S, minf(1,(float(_S.named_value(_n_b_b18,"life"))/0.4))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null
