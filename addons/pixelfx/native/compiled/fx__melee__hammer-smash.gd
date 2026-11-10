@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/melee/hammer-smash.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "swing", _S.import_value("fx/melee/_lib.js", "swing"))
	_S.define(_e, "onSwing", _S.import_value("fx/melee/_lib.js", "onSwing"))
	_S.define(_e, "smear", _S.import_value("fx/melee/_lib.js", "smear"))
	_S.define(_e, "stone", _S.import_value("fx/melee/_lib.js", "stone"))
	_S.define(_e, "rock", _S.import_value("fx/melee/_lib.js", "rock"))
	_S.define(_e, "cracks", _S.import_value("fx/melee/_lib.js", "cracks"))
	_S.define(_e, "along", _S.import_value("fx/melee/_lib.js", "along"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Hammer smash"}, {"desc": "A hammer drops in front in a wedge of motion: a white slam with rays, a dome of force, a dent with cracks, rocks thrown up that bounce and settle, and dust."}, {"tags": ["melee", "smash", "hammer", "heavy", "ground", "shockwave", "debris", "combat", "directional", "one-shot"]}, {"size": [208, 112]}, {"origin": [80, 92]}, {"duration": 2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#141834", "#242c5c", "#38479a", "#5a72d0", "#8fa8f0", "#c4d4ff", "#eef3ff", "#ffffff"]}, {"stone": "#4a3f69"}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "REST_", _S.merge([_S.read(_e, "READY"), {"weapon": "hammer"}, {"two": true}, {"sa": 0.62}, {"fx": 11}, {"fy": _S.unary("-", 21)}, {"crouch": 3}]))
	_S.define(_e, "TOP", _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}, {"crouch": 0}, {"lean": _S.unary("-", 3)}, {"fx": 3}, {"fy": _S.unary("-", 41)}, {"sa": _S.unary("-", 2.1)}, {"ffx": 8}, {"ffy": _S.unary("-", 8)}, {"fbx": _S.unary("-", 5)}, {"toeB": true}]))
	_S.define(_e, "SLAM", _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 1)}, {"crouch": 7}, {"lean": 6}, {"fx": 14}, {"fy": _S.unary("-", 19)}, {"sa": 0.62}, {"ffx": 11}, {"fbx": _S.unary("-", 10)}]))
	_S.define(_e, "act", _S.merge([{"target": _S.merge([{"x": 66}])}, {"poses": [[_S.unary("-", 0.72), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}])], [_S.unary("-", 0.44), _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}, {"crouch": 5}, {"lean": _S.unary("-", 1)}, {"fx": 16}, {"fy": _S.unary("-", 28)}, {"sa": _S.unary("-", 0.9)}])], [_S.unary("-", 0.2), _S.read(_e, "TOP")], [_S.unary("-", 0.03), _S.merge([_S.read(_e, "TOP"), {"y": _S.unary("-", 2)}])], [0.06, _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"y": _S.unary("-", 3)}, {"crouch": _S.unary("-", 1)}, {"lean": 2}, {"fx": 13}, {"fy": _S.unary("-", 41)}, {"sa": _S.unary("-", 1.2)}, {"ffx": 11}, {"ffy": _S.unary("-", 8)}, {"ghost": 1}]), "snap"], [0.11, _S.merge([_S.read(_e, "REST_"), {"x": 0}, {"y": _S.unary("-", 1)}, {"crouch": 3}, {"lean": 5}, {"fx": 19}, {"fy": _S.unary("-", 30)}, {"sa": _S.unary("-", 0.15)}, {"ffx": 13}, {"ghost": 1}]), "snap"], [0.15, _S.read(_e, "SLAM"), "snap"], [0.62, _S.merge([_S.read(_e, "SLAM"), {"crouch": 6}, {"lean": 5}])], [1.02, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 2)}, {"crouch": 5}, {"lean": 2}, {"fx": 14}, {"fy": _S.unary("-", 24)}, {"sa": 0.3}])], [1.4, _S.merge([_S.read(_e, "REST_"), {"x": _S.unary("-", 3)}])]]}, {"hits": [_S.merge([{"t": 0.15}, {"stop": 0.2}, {"shake": 0.34}, {"amp": 3}, {"push": 3}, {"straw": 26}, {"y": _S.unary("-", 8)}])]}, {"dust": [_S.merge([{"t": 0.15}, {"x": 10}, {"n": 8}]), _S.merge([{"t": 0.15}, {"x": _S.unary("-", 12)}, {"n": 5}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#0d0a12"]))
	_S.define(_e, "HOT", _S.invoke(["#fff3a6", "#ffc23d", "#ff8a2a", "#c9281f"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "DROP", 0.15)
	_S.define(_e, "head", _S.function_value(_e, "_f13"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "C"), "length"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "st", _S.call_value(_S.read(_e, "stone"), [_S.prop(_S.read(_e, "o"), "stone")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "chips", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "swing"), [_S.merge([{"cx": 5}, {"cy": _S.unary("-", 25)}, {"R": 32}, {"sy": 1}, {"rot": 0}, {"a0": _S.unary("-", 2.25)}, {"dir": 1}])]))
	_S.define(_e, "U1", 0)
	while _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.prop(_S.read(_e, "A"), "R"), _S.read(_e, "U1")]), 1), _S.unary("-", 0.5)), func(): return _S.binary("<", _S.read(_e, "U1"), 4))):
		_S.write(_e, "U1", 0.005, "+=", false)
	_S.define(_e, "HW", 13)
	var _v0 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), _S.binary("/", _S.read(_e, "HW"), 2)), _S.read(_e, "U1")])
	_S.define(_e, "X", _S.prop(_v0, 0))
	_S.define(_e, "lines", _S.call_value(_S.read(_e, "cracks"), [_S.read(_e, "R"), _S.read(_e, "X"), 5, 24, 6, 0]))
	_S.define(_e, "rays", _S.invoke([_S.unary("-", 0.95), _S.unary("-", 0.6), _S.unary("-", 0.3), _S.unary("-", 0.05), 0.22, 0.5, 0.85], "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "Rm", _S.binary("-", _S.prop(_S.read(_e, "A"), "R"), _S.binary("/", _S.read(_e, "HW"), 2)))
	_S.define(_e, "wedge", _S.function_value(_e, "_f3"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(((float((-PI))/2) + _n_d_b0) + _S.invoke(_n_R,"range",[(-0.06), 0.06])),"L":((34 if _S.truth(_S.binary("===",_n_i_b1,3)) else (26 if _S.truth((_S.binary("===",_n_i_b1,2) if _S.truth(_S.binary("===",_n_i_b1,2)) else _S.binary("===",_n_i_b1,4))) else (18 if _S.truth((_S.binary("===",_n_i_b1,1) if _S.truth(_S.binary("===",_n_i_b1,1)) else _S.binary("===",_n_i_b1,5))) else 12))) * _S.invoke(_n_R,"range",[0.9, 1.1]))}
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "h", _S.call_value(_S.read(_e, "head"), [_S.read(_e, "t")]))
	_S.define(_e, "U", _S.binary("*", _S.read(_e, "U1"), _S.read(_e, "h")))
	_S.define(_e, "after", _S.call_value(_S.read(_e, "smooth"), [_S.read(_e, "DROP"), _S.binary("+", _S.read(_e, "DROP"), 0.07), _S.read(_e, "t")]))
	_S.define(_e, "lagU", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", _S.read(_e, "U"), _S.binary("+", 0.3, _S.binary("*", 1.05, _S.read(_e, "h"))))]))
	_S.define(_e, "T", _S.binary("+", _S.read(_e, "lagU"), _S.binary("*", _S.binary("*", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "lagU")), _S.read(_e, "after")), 0.8)))
	if _S.truth(_S.logical("||", _S.binary("<", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T")), 0.03), func(): return _S.binary(">=", _S.read(_e, "after"), 1))):
		return null
	_S.define(_e, "len", _S.binary("*", _S.binary("-", _S.read(_e, "U"), _S.read(_e, "T")), _S.read(_e, "Rm")))
	_S.call_value(_S.read(_e, "smear"), [_S.read(_e, "p"), _S.read(_e, "A"), _S.read(_e, "T"), _S.read(_e, "U"), _S.binary("+", _S.read(_e, "HW"), 1), _S.function_value(_e, "_f4")])
	if _S.truth(_S.binary("<", _S.read(_e, "after"), 0.6)):
		for _v1 in _S.array([[_S.binary("-", _S.binary("/", _S.unary("-", _S.read(_e, "HW")), 2), 2), 3, 26], [_S.binary("-", _S.binary("/", _S.unary("-", _S.read(_e, "HW")), 2), 5), 9, 16], [_S.binary("+", _S.binary("/", _S.read(_e, "HW"), 2), 2), 2, 30], [_S.binary("+", _S.binary("/", _S.read(_e, "HW"), 2), 5), 8, 18], [_S.unary("-", 1), _S.binary("+", _S.read(_e, "len"), 2), 14], [3, _S.binary("+", _S.read(_e, "len"), 4), 9]]):
			var _v2 = _S.scope(_e)
			var _v3 = _v1
			_S.define(_v2, "dr", _S.prop(_v3, 0))
			_S.define(_v2, "l0", _S.prop(_v3, 1))
			_S.define(_v2, "L", _S.prop(_v3, 2))
			var _v4 = _S.scope(_v2)
			_S.define(_v4, "r", _S.binary("+", _S.read(_v4, "Rm"), _S.read(_v4, "dr")))
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "d", _S.read(_v5, "l0"))
			while _S.truth(_S.binary("<", _S.read(_v5, "d"), _S.binary("+", _S.read(_v5, "l0"), _S.binary("*", _S.read(_v5, "L"), _S.binary("-", 1, _S.read(_v5, "after")))))):
				var _v6 = _S.scope(_v5)
				_S.define(_v6, "u", _S.binary("-", _S.read(_v6, "U"), _S.binary("/", _S.read(_v6, "d"), _S.read(_v6, "r"))))
				_S.define(_v6, "k", _S.binary("/", _S.binary("-", _S.read(_v6, "d"), _S.read(_v6, "l0")), _S.read(_v6, "L")))
				if _S.truth(_S.binary("<", _S.read(_v6, "u"), 0)):
					break
				_S.invoke(_S.read(_v6, "p"), "dot", _S.concat([_S.array(_S.call_value(_S.read(_v6, "onSwing"), [_S.read(_v6, "A"), _S.read(_v6, "r"), _S.read(_v6, "u")])), [(_S.prop(_S.read(_v6, "C"), 6) if _S.truth(_S.binary("<", _S.read(_v6, "k"), 0.25)) else (_S.prop(_S.read(_v6, "C"), 5) if _S.truth(_S.binary("<", _S.read(_v6, "k"), 0.6)) else _S.prop(_S.read(_v6, "C"), 4)))], [_S.binary("*", _S.binary("-", 1, _S.read(_v6, "k")), _S.binary("-", 1, _S.read(_v6, "after")))]]))
				_v5 = _S.iteration(_v5)
				_S.write(_v5, "d", 0.5, "+=", false)
	var _v7 = _S.call_value(_S.read(_e, "onSwing"), [_S.read(_e, "A"), _S.read(_e, "Rm"), _S.read(_e, "U")])
	_S.define(_e, "hx", _S.prop(_v7, 0))
	_S.define(_e, "hy", _S.prop(_v7, 1))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.read(_e, "hx"), _S.read(_e, "hy"), 34, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.5, _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("-", _S.read(_e, "DROP"), 0.03), _S.read(_e, "DROP"), _S.read(_e, "t")])))])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_U = _S.read(_parent,"U")
	var _n_Rm = _S.read(_parent,"Rm")
	var _n_len = _S.read(_parent,"len")
	var _n_HW = _S.read(_parent,"HW")
	var _n_after = _S.read(_parent,"after")
	var _n_n = _S.read(_parent,"n")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_lead_b3 = ((_n_U - _n_u_b0) * _n_Rm)
	var _n_f_b4 = (float(_n_lead_b3)/_n_len)
	var _n_w_b5 = ((_n_HW * (1 if _S.truth((_n_lead_b3 < 3)) else pow((1 - (float((_n_lead_b3 - 3))/maxf(1,(_n_len - 3)))),0.85))) * (1 - (_n_after * 0.5)))
	var _n_off_b6 = (float((_n_r_b1 - _n_Rm))/((float(_n_w_b5)/2) + 0.01))
	if _S.truth(((_n_w_b5 < 0.6) if _S.truth((_n_w_b5 < 0.6)) else (absf(_n_off_b6) > 1))):
		return null
	var _n_ci_b7 = (0 if _S.truth((_n_lead_b3 < 2)) else floori(((((1 + (_n_f_b4 * 3.4)) + (absf(_n_off_b6) * 1.4)) - (1 if _S.truth((_n_off_b6 > 0.55)) else 0)) + (_n_after * 3))+0.5))
	if _S.truth((_n_ci_b7 > (_n_n - 3))):
		return null
	_S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,((_n_n - 1) - maxf(0,_n_ci_b7))),"=")
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DROP")))):
		var _v8 = _S.scope(_e)
		_S.write(_v8, "hit", true, "=", false)
		_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "X"), _S.unary("-", 5), 16, _S.read(_v8, "WHITE"), 0.35, 0.08])
		_S.invoke(_S.read(_v8, "lights"), "add", [_S.read(_v8, "X"), _S.unary("-", 10), 64, _S.prop(_S.read(_v8, "C"), 4), 0.42, 0.6])
		var _v9 = _S.scope(_v8)
		_S.define(_v9, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v9, "i"), 15)):
			var _v10 = _S.scope(_v9)
			_S.define(_v10, "s", _S.invoke(_S.read(_v10, "R"), "sign", []))
			_S.invoke(_S.read(_v10, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v10, "B"), "CHUNK")}, {"x": _S.binary("+", _S.read(_v10, "X"), _S.binary("*", _S.read(_v10, "s"), _S.invoke(_S.read(_v10, "R"), "range", [0, 5])))}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.read(_v10, "s"), _S.invoke(_S.read(_v10, "R"), "range", [20, 105]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v10, "R"), "range", [110, 300]))}, {"g": 1}, {"drag": 0.35}, {"bounce": 0.38}, {"life": _S.invoke(_S.read(_v10, "R"), "range", [1.25, 1.65])}, {"a": _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")])}, {"va": _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 16), 16])}, {"s": _S.invoke(_S.read(_v10, "R"), "pick", [[1, 1, 2, 2, 3]])}])])
			_v9 = _S.iteration(_v9)
			_S.write(_v9, "i", 1, "+=", true)
		var _v11 = _S.scope(_v8)
		_S.define(_v11, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v11, "i"), 11)):
			var _v12 = _S.scope(_v11)
			_S.define(_v12, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v12, "Math"), "PI")), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.2), 1.2])))
			_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [90, 230]))
			_S.invoke(_S.read(_v12, "chips"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v12, "B"), "SHARD")}, {"x": _S.binary("+", _S.read(_v12, "X"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 4), 4]))}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp"))}, {"g": 0.9}, {"drag": 0.5}, {"bounce": 0.35}, {"life": _S.invoke(_S.read(_v12, "R"), "range", [0.9, 1.5])}, {"s": 1}])])
			_v11 = _S.iteration(_v11)
			_S.write(_v11, "i", 1, "+=", true)
		var _v13 = _S.scope(_v8)
		_S.define(_v13, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "i"), 40)):
			var _v14 = _S.scope(_v13)
			_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [50, 210]))
			_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "GRIT"), _S.binary("+", _S.read(_v14, "X"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 4), 4])), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp")), _S.invoke(_S.read(_v14, "R"), "range", [0.9, 1.5]), _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "st"), "light"), _S.prop(_S.read(_v14, "st"), "body"), _S.prop(_S.read(_v14, "st"), "body"), _S.prop(_S.read(_v14, "st"), "shade")]]), (2 if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.4])) else 1)])
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "i", 1, "+=", true)
		var _v15 = _S.scope(_v8)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 14)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "s", (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.read(_v16, "i"), 2)) else 1))
			_S.define(_v16, "sp", _S.invoke(_S.read(_v16, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "MOTE"), _S.binary("+", _S.read(_v16, "X"), _S.binary("*", _S.read(_v16, "s"), 6)), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v16, "s"), _S.read(_v16, "sp")), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [0, 30])), _S.invoke(_S.read(_v16, "R"), "range", [0.18, 0.34]), (_S.prop(_S.read(_v16, "C"), 6) if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])) else _S.prop(_S.read(_v16, "C"), 5)), 0.8, _S.invoke(_S.read(_v16, "R"), "range", [0.02, 0.05])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
		var _v17 = _S.scope(_v8)
		_S.define(_v17, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v17, "i"), 24)):
			var _v18 = _S.scope(_v17)
			_S.define(_v18, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v18, "Math"), "PI")), 2), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v18, "sp", _S.invoke(_S.read(_v18, "R"), "range", [150, 380]))
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SPARK"), _S.binary("+", _S.read(_v18, "X"), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), 6)), _S.binary("+", _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), 4)), _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "cos", [_S.read(_v18, "a")]), _S.read(_v18, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v18, "Math"), "sin", [_S.read(_v18, "a")]), _S.read(_v18, "sp")), 30), _S.invoke(_S.read(_v18, "R"), "range", [0.12, 0.42]), 0, 1, _S.invoke(_S.read(_v18, "R"), "range", [0.035, 0.08])])
			_v17 = _S.iteration(_v17)
			_S.write(_v17, "i", 1, "+=", true)
		var _v19 = _S.scope(_v8)
		_S.define(_v19, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v19, "i"), 20)):
			var _v20 = _S.scope(_v19)
			_S.define(_v20, "s", (_S.unary("-", 1) if _S.truth(_S.binary("%", _S.read(_v20, "i"), 2)) else 1))
			_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SMOKE"), _S.binary("+", _S.read(_v20, "X"), _S.binary("*", _S.read(_v20, "s"), _S.invoke(_S.read(_v20, "R"), "range", [2, 10]))), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 7])), _S.binary("*", _S.read(_v20, "s"), _S.invoke(_S.read(_v20, "R"), "range", [40, 125])), _S.unary("-", _S.invoke(_S.read(_v20, "R"), "range", [2, 14])), _S.invoke(_S.read(_v20, "R"), "range", [0.95, 1.5]), _S.prop(_S.read(_v20, "st"), "dust"), _S.invoke(_S.read(_v20, "R"), "range", [6, 9]), _S.invoke(_S.read(_v20, "R"), "range", [0.02, 0.08]), _S.prop(_S.read(_v20, "PF"), "BIG")])
			_v19 = _S.iteration(_v19)
			_S.write(_v19, "i", 1, "+=", true)
		var _v21 = _S.scope(_v8)
		_S.define(_v21, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v21, "i"), 7)):
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "SMOKE"), _S.binary("+", _S.read(_v21, "X"), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [3, 9])), _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v21, "R"), "range", [30, 80])), _S.invoke(_S.read(_v21, "R"), "range", [1, 1.4]), _S.prop(_S.read(_v21, "st"), "dust"), _S.invoke(_S.read(_v21, "R"), "range", [5, 7.5]), _S.invoke(_S.read(_v21, "R"), "range", [0.04, 0.14]), _S.prop(_S.read(_v21, "PF"), "BIG")])
			_v21 = _S.iteration(_v21)
			_S.write(_v21, "i", 1, "+=", true)
		var _v22 = _S.scope(_v8)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 8)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "DUST"), _S.binary("+", _S.read(_v22, "X"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 6), 6])), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [1, 4])), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [8, 30])), _S.invoke(_S.read(_v22, "R"), "range", [0.35, 0.7]), _S.prop(_S.read(_v22, "st"), "dust"), _S.invoke(_S.read(_v22, "R"), "range", [2, 3.5])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "chips"), "update", [_S.read(_e, "dt")])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.logical("&&", _S.read(_e, "hit"), func(): return _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DROP"), 0.4))), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "DROP"), 1.2))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08]))):
		var _v23 = _S.scope(_e)
		_S.define(_v23, "b", _S.invoke(_S.read(_v23, "R"), "pick", [_S.prop(_S.read(_v23, "bits"), "list")]))
		if _S.truth(_S.logical("&&", _S.read(_v23, "b"), func(): return _S.prop(_S.read(_v23, "b"), "rest"))):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v23, "b"), "x"), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v23, "b"), "y"), 1.5), _S.prop(_S.read(_v23, "b"), "s")), 0, _S.unary("-", 2), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.45]), (_S.prop(_S.read(_v23, "HOT"), 0) if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.5])) else _S.read(_v23, "WHITE")), _S.invoke(_S.read(_v23, "R"), "range", [0.6, 1.6])])
	for _v24 in _S.array(_S.prop(_S.read(_e, "bits"), "list")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "b", _v24)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v25, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v25, "b"), "dusted")))):
			var _v26 = _S.scope(_v25)
			_S.set_prop(_S.read(_v26, "b"), "dusted", true, "=", false)
			var _v27 = _S.scope(_v26)
			_S.define(_v27, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v27, "i"), 3)):
				_S.invoke(_S.read(_v27, "ps"), "spawn", [_S.prop(_S.read(_v27, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v27, "b"), "x"), _S.invoke(_S.read(_v27, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v27, "R"), "sign", []), _S.invoke(_S.read(_v27, "R"), "range", [8, 35])), _S.unary("-", _S.invoke(_S.read(_v27, "R"), "range", [2, 14])), _S.invoke(_S.read(_v27, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v27, "st"), "dust"), _S.invoke(_S.read(_v27, "R"), "range", [1.3, 2.6])])
				_v27 = _S.iteration(_v27)
				_S.write(_v27, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_DROP = _S.read(_parent,"DROP")
	var _n_X = _S.read(_parent,"X")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_st = _S.read(_parent,"st")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = (_n_t - _n_DROP)
	if _S.truth((_n_q_b1 >= 0)):
		var _n_fade_b2 = (1 - _S.MathFX.smooth(1.3,1.7,_n_q_b1))
		if true:
			var _n_x_b4 = (-11)
			while _S.truth((_n_x_b4 <= 11)):
				var _n_u_b5 = (float(_n_x_b4)/10)
				var _n_d_b6 = (0 if _S.truth((absf(_n_x_b4) > 10)) else floori(((3.2 * (1 - (_n_u_b5 * _n_u_b5))) + ((_S.MathFX.rand([_n_x_b4,4]) - 0.5) * 0.8))+0.5))
				if true:
					var _n_y_b7 = 0
					while _S.truth((_n_y_b7 < _n_d_b6)):
						_S.invoke(_n_p_b0,"dot",[(_n_X + _n_x_b4), _n_y_b7, (_n_SOOT if _S.truth(_S.binary("===",_n_y_b7,0)) else _S.named_value(_n_st,"dark")), _n_fade_b2])
						_n_y_b7 += 1.0
				if _S.truth((_n_d_b6 > 0)):
					_S.invoke(_n_p_b0,"dot",[(_n_X + _n_x_b4), _n_d_b6, (_S.named_value(_n_st,"light") if _S.truth((absf(_n_x_b4) < 7)) else _S.named_value(_n_st,"body")), _n_fade_b2])
				if _S.truth((absf(_n_x_b4) >= 8)):
					_S.invoke(_n_p_b0,"dot",[(_n_X + _n_x_b4), (-1), (_S.named_value(_n_st,"body") if _S.truth((absf(_n_x_b4) >= 10)) else _S.named_value(_n_st,"light")), _n_fade_b2])
				if _S.truth(_S.logical("&&",_S.binary("===",absf(_n_x_b4),9),func():return (_S.MathFX.rand([_n_x_b4,7]) < 0.7))):
					_S.invoke(_n_p_b0,"dot",[(_n_X + _n_x_b4), (-2), _S.named_value(_n_st,"body"), _n_fade_b2])
				_n_x_b4 += 1.0
		var _n_k_b3 = (float(_n_q_b1)/0.5)
		if _S.truth((_n_k_b3 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_X, 0.5, (6 + (50 * _S.invoke(_n_ease,"outCubic",[_n_k_b3]))), 0.16, maxf(1,(2 * (1 - _n_k_b3))), (1.15 - _n_k_b3), [_S.named_value(_n_st,"body"), _S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,7)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7")])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_DROP = _S.read(_parent,"DROP")
	var _n_wedge = _S.read(_parent,"wedge")
	var _n_ease = _S.read(_parent,"ease")
	var _n_along = _S.read(_parent,"along")
	var _n_lines = _S.read(_parent,"lines")
	var _n_X = _S.read(_parent,"X")
	var _n_st = _S.read(_parent,"st")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_rays = _S.read(_parent,"rays")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_HOT = _S.read(_parent,"HOT")
	var _n_rock = _S.read(_parent,"rock")
	var _n_bits = _S.read(_parent,"bits")
	var _n_chips = _S.read(_parent,"chips")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_q_b1 = (_n_t - _n_DROP)
	_S.call_value(_n_wedge,[_n_p_b0])
	if _S.truth((_n_q_b1 >= 0)):
		var _n_fade_b2 = (1 - _S.MathFX.smooth(1.3,1.7,_n_q_b1))
		for _iter_0 in _S.array(_n_lines):
			var _n_c_b5 = _iter_0
			var _n_reach_b6 = ((30 * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_q_b1 - (_S.named_value(_n_c_b5,"at") * 0.06)))/0.08),0.0,1.0)])) * (0.3 if _S.truth(_S.named_value(_n_c_b5,"fork")) else 1))
			if _S.truth((_n_reach_b6 > 0)):
				_S.call_value(_n_along,[_S.named_value(_n_c_b5,"pts"), _n_reach_b6, _S.function_value(_S.capture(_parent,{"q":_n_q_b1,"p":_n_p_b0,"fade":_n_fade_b2,"this":_this}),"_f9")])
		var _n_k_b3 = (float(_n_q_b1)/0.5)
		if _S.truth((_n_k_b3 < 1)):
			_S.call_value(_n_band,[_n_p_b0, _n_X, 0.5, (6 + (50 * _S.invoke(_n_ease,"outCubic",[_n_k_b3]))), 0.16, maxf(1,(2 * (1 - _n_k_b3))), (1.15 - _n_k_b3), [_S.named_value(_n_st,"body"), _S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,7)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f10")])
		var _n_d_b4 = (float((_n_q_b1 - 0.045))/0.4)
		if _S.truth(((_n_d_b4 < 1) if _S.truth((_n_d_b4 >= 0)) else (_n_d_b4 >= 0))):
			var _n_r_b7 = (12 + (30 * _S.invoke(_n_ease,"outCubic",[_n_d_b4])))
			var _n_th_b8 = maxf(1,(3.6 * pow((1 - _n_d_b4),0.8)))
			var _n_a_b9 = (1 if _S.truth((_n_d_b4 < 0.6)) else (float((1 - _n_d_b4))/0.4))
			_S.invoke(_n_p_b0,"shade",[((_n_X - _n_r_b7) - 1), ((-_n_r_b7) - 1), ((_n_X + _n_r_b7) + 1), 0, _S.function_value(_S.capture(_parent,{"r":_n_r_b7,"th":_n_th_b8,"d":_n_d_b4,"a":_n_a_b9,"this":_this}),"_f11")])
			if true:
				var _n_i_b10 = 0
				while _S.truth((_n_i_b10 < 7)):
					var _n_g_b11 = ((-PI) * (0.08 + ((float(_n_i_b10)/6) * 0.84)))
					_S.invoke(_n_p_b0,"glow",[(_n_X + (cos(_n_g_b11) * _n_r_b7)), (sin(_n_g_b11) * _n_r_b7), 14, _S.index_value(_n_C,4), (0.36 * (1 - _n_d_b4))])
					_n_i_b10 += 1.0
		if _S.truth((_n_q_b1 < 0.2)):
			for _iter_1 in _S.array(_n_rays):
				var _n_ry_b12 = _iter_1
				var _n_d1_b13 = (_S.named_value(_n_ry_b12,"L") * _S.invoke(_n_ease,"outCubic",[minf(1,(float(_n_q_b1)/0.05))]))
				var _n_d0_b14 = (_S.named_value(_n_ry_b12,"L") * _S.MathFX.smooth(0.04,0.2,_n_q_b1))
				var _n_ca_b15 = cos(_S.named_value(_n_ry_b12,"a"))
				var _n_sa_b16 = sin(_S.named_value(_n_ry_b12,"a"))
				if _S.truth(((_n_d1_b13 - _n_d0_b14) < 1)):
					continue
				_S.invoke(_n_p_b0,"line",[(_n_X + (_n_ca_b15 * (2 + _n_d0_b14))), ((-1) + (_n_sa_b16 * (2 + _n_d0_b14))), (_n_X + (_n_ca_b15 * _n_d1_b13)), ((-1) + (_n_sa_b16 * _n_d1_b13)), _S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
				_S.invoke(_n_p_b0,"glowLine",[(_n_X + (_n_ca_b15 * _n_d0_b14)), ((-1) + (_n_sa_b16 * _n_d0_b14)), (_n_X + (_n_ca_b15 * _n_d1_b13)), ((-1) + (_n_sa_b16 * _n_d1_b13)), 4, _S.index_value(_n_C,5), (0.18 * (1 - (float(_n_q_b1)/0.2)))])
		if _S.truth((_n_q_b1 < 0.07)):
			var _n_hot_b17 = (_n_q_b1 < 0.035)
			var _n_rx_b18 = (16 if _S.truth(_n_hot_b17) else 12)
			var _n_ry_b19 = (3 if _S.truth(_n_hot_b17) else 2)
			_S.invoke(_n_p_b0,"ellipse",[_n_X, 0, (_n_rx_b18 + 2), (_n_ry_b19 + 1), (_S.index_value(_n_C,6) if _S.truth(_n_hot_b17) else _S.index_value(_n_C,5))])
			_S.invoke(_n_p_b0,"ellipse",[_n_X, 0, _n_rx_b18, _n_ry_b19, (_n_WHITE if _S.truth(_n_hot_b17) else _S.index_value(_n_C,7))])
		if _S.truth((_n_q_b1 < 0.2)):
			var _n_pop_b20 = exp((float((-_n_q_b1))/0.05))
			_S.invoke(_n_p_b0,"glow",[_n_X, (-5), 26, _S.index_value(_n_C,5), (0.3 * _n_pop_b20)])
		_S.invoke(_n_p_b0,"glow",[_n_X, (-1), 16, _S.index_value(_n_HOT,2), (0.28 * exp((float((-_n_q_b1))/0.35)))])
	for _iter_2 in _S.array(_S.named_value(_n_bits,"list")):
		var _n_b_b21 = _iter_2
		_S.call_value(_n_rock,[_n_p_b0, _n_b_b21, _n_st])
	for _iter_3 in _S.array(_S.named_value(_n_chips,"list")):
		var _n_b_b22 = _iter_3
		var _n_k_b23 = (float(_S.named_value(_n_b_b22,"life"))/_S.named_value(_n_b_b22,"max"))
		var _n_c_b24 = (_S.index_value(_n_HOT,0) if _S.truth((_n_k_b23 > 0.7)) else (_S.index_value(_n_HOT,1) if _S.truth((_n_k_b23 > 0.45)) else (_S.index_value(_n_HOT,2) if _S.truth((_n_k_b23 > 0.25)) else _S.index_value(_n_HOT,3))))
		_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_b_b22,"x"), _S.named_value(_n_b_b22,"y"), _n_c_b24, minf(1,(_n_k_b23 * 4))])
		if _S.truth(not _S.truth(_S.named_value(_n_b_b22,"rest"))):
			_S.invoke(_n_p_b0,"dot",[(_S.named_value(_n_b_b22,"x") - (_S.named_value(_n_b_b22,"vx") * 0.012)), (_S.named_value(_n_b_b22,"y") - (_S.named_value(_n_b_b22,"vy") * 0.012)), _S.index_value(_n_HOT,3), minf(1,(_n_k_b23 * 4))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b22,"x"), _S.named_value(_n_b_b22,"y"), 4, _n_c_b24, (0.35 * _n_k_b23)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_q = _S.read(_parent,"q")
	var _n_p = _S.read(_parent,"p")
	var _n_st = _S.read(_parent,"st")
	var _n_fade = _S.read(_parent,"fade")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_x0_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	var _n_x1_b2 = _S.arg(_args,2)
	var _n_y1_b3 = _S.arg(_args,3)
	if _S.truth((_n_q >= 0.12)):
		_S.invoke(_n_p,"line",[_n_x0_b0, (_n_y0_b1 + 3), _n_x1_b2, (_n_y1_b3 + 3), _S.named_value(_n_st,"shade"), _n_fade])
	_S.invoke(_n_p,"line",[_n_x0_b0, (_n_y0_b1 + 2), _n_x1_b2, (_n_y1_b3 + 2), (_n_WHITE if _S.truth((_n_q < 0.05)) else (_S.index_value(_n_C,5) if _S.truth((_n_q < 0.12)) else _n_SOOT)), _n_fade])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_X = _S.read(_parent,"X")
	var _n_th = _S.read(_parent,"th")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d = _S.read(_parent,"d")
	var _n_a = _S.read(_parent,"a")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_e_b3 = (_n_r - _S.Bridge.hypot([(_n_x_b0 - _n_X), _n_y_b1]))
	if _S.truth((((_n_e_b3 < 0) if _S.truth((_n_e_b3 < 0)) else (_n_e_b3 > _n_th)) if _S.truth(((_n_e_b3 < 0) if _S.truth((_n_e_b3 < 0)) else (_n_e_b3 > _n_th))) else (_n_y_b1 > (-0.5)))):
		return null
	var _n_v_b4 = (float(_n_e_b3)/_n_th)
	_S.set_prop(_n_out_b2,"c",((_n_WHITE if _S.truth((_n_v_b4 < 0.6)) else _S.index_value(_n_C,6)) if _S.truth((_n_d < 0.1)) else ((_n_WHITE if _S.truth((_n_d < 0.45)) else _S.index_value(_n_C,6)) if _S.truth((_n_v_b4 < 0.34)) else (_S.index_value(_n_C,5) if _S.truth((_n_v_b4 < 0.67)) else _S.index_value(_n_C,4)))),"=")
	_S.set_prop(_n_out_b2,"a",_n_a,"=")
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.5)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.8)) else _S.index_value(_n_C,5)))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_DROP = _S.read(_parent,"DROP")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_x_b1 = clampf((float((_n_t_b0 + 0.03))/(_n_DROP + 0.03)),0.0,1.0)
	return ((0.28 * _n_x_b1) + ((0.72 * _n_x_b1) * _n_x_b1))
	return null
