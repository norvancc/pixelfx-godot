@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/thunderclap.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Thunderclap"}, {"desc": "A thunderclap round the caster: a white flash, forked bolts burst out and stab the floor, a heavy shock ring tears across the ground raising dust and grit, sparks streak away."}, {"tags": ["lightning", "electric", "nova", "aoe", "spell", "shockwave", "one-shot"]}, {"size": [288, 156]}, {"origin": [144, 124]}, {"duration": 1.9}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"reach": 104}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "WIDE", _S.merge([{"turn": 1.15}, {"crouch": 5}, {"lean": _S.unary("-", 1)}, {"fx": _S.unary("-", 15)}, {"fy": _S.unary("-", 33)}, {"bx": 15}, {"by": _S.unary("-", 33)}, {"ffx": _S.unary("-", 7)}, {"fbx": 8}]))
	_S.define(_e, "CLAP_", _S.merge([{"turn": 1.15}, {"y": _S.unary("-", 2)}, {"crouch": 0}, {"fx": _S.unary("-", 1)}, {"fy": _S.unary("-", 45)}, {"bx": 1}, {"by": _S.unary("-", 45)}, {"ffx": _S.unary("-", 3)}, {"ffy": _S.unary("-", 5)}, {"fbx": 4}, {"fby": _S.unary("-", 5)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"target": _S.merge([{"x": 104}])}, {"poses": [[_S.unary("-", 0.46), _S.read(_e, "READY")], [_S.unary("-", 0.18), _S.read(_e, "WIDE")], [0.08, _S.merge([_S.read(_e, "WIDE"), {"crouch": 6}])], [0.12, _S.read(_e, "CLAP_"), "snap"], [0.55, _S.merge([_S.read(_e, "CLAP_"), {"y": 0}, {"ffy": _S.unary("-", 4)}, {"fby": _S.unary("-", 4)}, {"crouch": 1}])], [1.05, _S.merge([{"turn": 1}, {"crouch": 3}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 28)}, {"bx": 11}, {"by": _S.unary("-", 28)}, {"ffx": _S.unary("-", 4)}, {"fbx": 5}])], [1.7, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.12}, {"stop": 0.13}, {"shake": 0.3}, {"amp": 3}, {"target": false}]), _S.merge([{"t": 0.42}, {"push": 2}, {"straw": 14}, {"y": _S.unary("-", 8)}, {"skin": "shock"}, {"shiver": 0.5}]), _S.merge([{"t": 1.2}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CLAP", 0.12)
	_S.define(_e, "CY", _S.unary("-", 22))
	_S.define(_e, "BK", [1, 0.7, 0.95, 0.5, 0.8, 0.3])
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#6e6382"]))
	_S.define(_e, "STONE", _S.invoke(["#655b7a", "#4a4263", "#342d45"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "REACH", _S.prop(_S.read(_e, "o"), "reach"))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "hot", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bolts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "front", _S.function_value(_e, "_f3"))
	_S.define(_e, "t", 0)
	_S.define(_e, "clapped", false)
	_S.define(_e, "landed", _S.invoke(_S.read(_e, "bolts"), "map", [_S.function_value(_e, "_f4")]))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_CY = _S.read(_parent,"CY")
	var _n_CLAP = _S.read(_parent,"CLAP")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_down_b2 = _S.binary("===",fmod(_n_i_b1,2),0)
	var _n_side_b3 = ((-1) if _S.truth((fmod(_n_i_b1,4) < 2)) else 1)
	var _n_a_b4 = ((_S.invoke(_n_R,"range",[0.35, 0.75]) if _S.truth((_n_side_b3 > 0)) else (PI - _S.invoke(_n_R,"range",[0.35, 0.75]))) if _S.truth(_n_down_b2) else ((-_S.invoke(_n_R,"range",[0.15, 1.2])) if _S.truth((_n_side_b3 > 0)) else (PI + _S.invoke(_n_R,"range",[0.15, 1.2]))))
	var _n_L_b5 = ((float((-_n_CY))/sin(_n_a_b4)) if _S.truth(_n_down_b2) else _S.invoke(_n_R,"range",[40, 62]))
	var _n_x1_b6 = (cos(_n_a_b4) * _n_L_b5)
	var _n_y1_b7 = (0 if _S.truth(_n_down_b2) else (_n_CY + (sin(_n_a_b4) * _n_L_b5)))
	return {"down":_n_down_b2,"x1":_n_x1_b6,"y1":_n_y1_b7,"t0":(_n_CLAP + _S.invoke(_n_R,"range",[0, 0.06]))}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_CLAP = _S.read(_parent,"CLAP")
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t_b0 < _n_CLAP)) else (8 + ((_n_REACH - 8) * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_CLAP))/0.5),0.0,1.0)]))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	return false
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLAP")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 60, _S.read(_e, "dt"))]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")]))
		_S.define(_v0, "d", _S.invoke(_S.read(_v0, "R"), "range", [16, 30]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.07, 0.1]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "d"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")]), _S.read(_v0, "d")), _S.binary("+", _S.read(_v0, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), _S.read(_v0, "d")), 0.8)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")])), _S.read(_v0, "v")), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")])), _S.read(_v0, "v")), 0.8), _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLAP")), func(): return _S.unary("!", _S.read(_e, "clapped")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "clapped", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.binary("-", _S.read(_v1, "CY"), 10), 100, _S.prop(_S.read(_v1, "C"), 4), 0.65, 0.45])
		_S.invoke(_S.read(_v1, "lights"), "add", [0, _S.read(_v1, "CY"), 26, _S.read(_v1, "WHITE"), 0.5, 0.07])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 64)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "sp", _S.binary("*", _S.invoke(_S.read(_v3, "R"), "range", [170, 380]), (0.5 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 0.4)) else 1)))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), 6), _S.binary("+", _S.read(_v3, "CY"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), 6)), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), 40), _S.invoke(_S.read(_v3, "R"), "range", [0.2, 0.55])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 8)):
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SMOKE"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("+", _S.read(_v4, "CY"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 6), 6])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v4, "R"), "range", [10, 30])), _S.invoke(_S.read(_v4, "R"), "range", [0.8, 1.3]), _S.call_value(_S.read(_v4, "mix"), [_S.read(_v4, "ASH"), _S.prop(_S.read(_v4, "C"), 4), 0.3]), _S.invoke(_S.read(_v4, "R"), "range", [4, 7]), _S.invoke(_S.read(_v4, "R"), "range", [0.05, 0.2])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	for _v5 in _S.array(_S.invoke(_S.read(_e, "bolts"), "entries", [])):
		var _v6 = _S.scope(_e)
		var _v7 = _v5
		_S.define(_v6, "i", _S.prop(_v7, 0))
		_S.define(_v6, "b", _S.prop(_v7, 1))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.prop(_S.read(_v6, "b"), "down"), func(): return _S.unary("!", _S.prop(_S.read(_v6, "landed"), _S.read(_v6, "i")))), func(): return _S.binary(">=", _S.read(_v6, "t"), _S.prop(_S.read(_v6, "b"), "t0")))):
			var _v8 = _S.scope(_v6)
			_S.set_prop(_S.read(_v8, "landed"), _S.read(_v8, "i"), true, "=", false)
			_S.invoke(_S.read(_v8, "lights"), "add", [_S.prop(_S.read(_v8, "b"), "x1"), _S.unary("-", 4), 46, _S.prop(_S.read(_v8, "C"), 4), 0.7, 0.25])
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "j"), 12)):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v10, "Math"), "PI")), 2), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1.2), 1.2])))
				_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [70, 240]))
				_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "SPARK"), _S.prop(_S.read(_v10, "b"), "x1"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [0.2, 0.5])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "j", 1, "+=", true)
			var _v11 = _S.scope(_v8)
			_S.define(_v11, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "j"), 5)):
				_S.invoke(_S.read(_v11, "hot"), "spawn", [_S.prop(_S.read(_v11, "P"), "SPARK"), _S.binary("+", _S.prop(_S.read(_v11, "b"), "x1"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 1), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 80), 80]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [60, 180])), _S.invoke(_S.read(_v11, "R"), "range", [0.4, 0.8])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "j", 1, "+=", true)
	_S.define(_e, "fr", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "CLAP")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "CLAP"), 0.5)))):
		for _v12 in _S.array([_S.unary("-", 1), 1]):
			var _v13 = _S.scope(_e)
			_S.define(_v13, "s", _v12)
			var _v14 = _S.scope(_v13)
			if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", 70, _S.read(_v14, "dt"))])):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SMOKE"), _S.binary("+", _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "fr")), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 3), 3])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v14, "s"), _S.invoke(_S.read(_v14, "R"), "range", [10, 40])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [5, 20])), _S.invoke(_S.read(_v14, "R"), "range", [0.6, 1.1]), _S.read(_v14, "DUST"), _S.binary("*", _S.invoke(_S.read(_v14, "R"), "range", [3, 6]), _S.binary("-", 1, _S.binary("*", 0.4, _S.binary("/", _S.read(_v14, "fr"), _S.read(_v14, "REACH"))))), 0, _S.prop(_S.read(_v14, "PF"), "BIG")])
			if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [_S.binary("*", 50, _S.read(_v14, "dt"))])):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "GRIT"), _S.binary("*", _S.read(_v14, "s"), _S.read(_v14, "fr")), _S.unary("-", 1), _S.binary("*", _S.read(_v14, "s"), _S.invoke(_S.read(_v14, "R"), "range", [10, 60])), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [60, 180])), _S.invoke(_S.read(_v14, "R"), "range", [0.8, 1.3]), _S.invoke(_S.read(_v14, "R"), "pick", [_S.read(_v14, "STONE")]), (2 if _S.truth(_S.invoke(_S.read(_v14, "R"), "chance", [0.3])) else 1)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "hot"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_bolts = _S.read(_parent,"bolts")
	var _n_CLAP = _S.read(_parent,"CLAP")
	var _n_front = _S.read(_parent,"front")
	var _n_C = _S.read(_parent,"C")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_hot = _S.read(_parent,"hot")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_bolts):
		var _n_b_b2 = _iter_0
		if _S.truth(((_n_t >= _S.named_value(_n_b_b2,"t0")) if _S.truth(_S.named_value(_n_b_b2,"down")) else _S.named_value(_n_b_b2,"down"))):
			_S.call_value(_n_scorch,[_n_p_b0, _S.named_value(_n_b_b2,"x1"), 0, 9, pow(clampf((1 - (float((_n_t - _S.named_value(_n_b_b2,"t0")))/1.1)),0.0,1.0),1.3), (1 - _S.MathFX.smooth(1.4,1.85,_n_t))])
	var _n_u_b1 = (float((_n_t - _n_CLAP))/0.5)
	if _S.truth(((_n_u_b1 < 1) if _S.truth((_n_u_b1 > 0)) else (_n_u_b1 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, _S.call_value(_n_front,[_n_t]), 0.18, maxf(2,(16 * (1 - _n_u_b1))), (1.25 - _n_u_b1), [_S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,4), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), (_n_u_b1 < 0.15)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.invoke(_n_hot,"draw",[_n_p_b0, "back"])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CLAP = _S.read(_parent,"CLAP")
	var _n_o = _S.read(_parent,"o")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_CY = _S.read(_parent,"CY")
	var _n_flare = _S.read(_parent,"flare")
	var _n_BK = _S.read(_parent,"BK")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_bolts = _S.read(_parent,"bolts")
	var _n_front = _S.read(_parent,"front")
	var _n_band = _S.read(_parent,"band")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_hot = _S.read(_parent,"hot")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = floori(((_n_t * 30) + 0.0001))
	var _n_u_b2 = (float((_n_t - _n_CLAP))/0.5)
	var _n_A_b3 = _S.named_value(_n_o,"actor")
	var _n_a_b4 = (_n_t - _n_CLAP)
	if _S.truth(((_n_a_b4 < 0.07) if _S.truth((_n_a_b4 >= 0)) else (_n_a_b4 >= 0))):
		_S.invoke(_n_p_b0,"mask",[_S.named_value(_n_A_b3,"mask"), _S.named_value(_n_A_b3,"x"), _S.named_value(_n_A_b3,"y"), (_n_WHITE if _S.truth((_n_a_b4 < 0.035)) else _S.index_value(_n_C,6))])
	if _S.truth(((_n_a_b4 < 0.2) if _S.truth((_n_a_b4 >= 0)) else (_n_a_b4 >= 0))):
		var _n_q_b5 = (float(_n_a_b4)/0.2)
		_S.call_value(_n_flare,[_n_p_b0, 0, _n_CY, (44 * pow((1 - _n_q_b5),1.4)), (1 - _n_q_b5), _n_C])
		if _S.truth((_n_q_b5 < 0.35)):
			_S.invoke(_n_p_b0,"circle",[0, _n_CY, ((10 * (1 - (_n_q_b5 * 2))) + 2), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, _n_CY, 44, _S.index_value(_n_C,5), (0.32 * (1 - _n_q_b5))])
	for _iter_0 in _S.array(_S.invoke(_n_bolts,"entries",[])):
		var _tuple_1 = _iter_0
		var _n_i_b6 = _S.prop(_tuple_1,0)
		var _n_b_b7 = _S.prop(_tuple_1,1)
		var _n_ba_b8 = floori((((_n_t - _S.named_value(_n_b_b7,"t0")) * 30) + 0.0001))
		if _S.truth(((_n_t < _S.named_value(_n_b_b7,"t0")) if _S.truth((_n_t < _S.named_value(_n_b_b7,"t0"))) else (_n_ba_b8 >= _S.prop(_n_BK,"length")))):
			continue
		var _n_r_b9 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),3,_n_i_b6,_S.binary(">>",_n_ba_b8,1)])
		_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b9, 0, _n_CY, _S.named_value(_n_b_b7,"x1"), _S.named_value(_n_b_b7,"y1"), 0.25, (0.5 if _S.truth(_S.named_value(_n_b_b7,"down")) else 0.8)]), _S.index_value(_n_BK,_n_ba_b8), _n_C, (1 if _S.truth(_S.binary("===",_n_ba_b8,0)) else 0.8), {"hero":_S.binary("===",_n_ba_b8,0)}])
		if _S.truth(_S.named_value(_n_b_b7,"down")):
			_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_b_b7,"x1"), (-1), ((3 * _S.index_value(_n_BK,_n_ba_b8)) + 1), _S.index_value(_n_C,5)])
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_b_b7,"x1"), (-1), _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b7,"x1"), (-3), 20, _S.index_value(_n_C,5), (0.5 * _S.index_value(_n_BK,_n_ba_b8))])
		else:
			if _S.truth((_n_ba_b8 < 2)):
				_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_b_b7,"x1"), _S.named_value(_n_b_b7,"y1"), 4, _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.4])
	if _S.truth(((_n_u_b2 < 1) if _S.truth((_n_u_b2 > 0)) else (_n_u_b2 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0.5, _S.call_value(_n_front,[_n_t]), 0.18, maxf(2,(16 * (1 - _n_u_b2))), (1.25 - _n_u_b2), [_S.index_value(_n_C,1), _S.index_value(_n_C,2), _S.index_value(_n_C,4), _S.index_value(_n_C,6)], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), (_n_u_b2 < 0.15)])
		for _iter_2 in _S.array([(-1), 1]):
			var _n_s_b12 = _iter_2
			_S.invoke(_n_p_b0,"glow",[(_n_s_b12 * _S.call_value(_n_front,[_n_t])), (-3), 28, _S.index_value(_n_C,4), (0.45 * (1 - _n_u_b2))])
		var _n_ua_b10 = (float((_n_t - _n_CLAP))/0.26)
		var _n_ra_b11 = (8 + (60 * _S.invoke(_n_ease,"outCubic",[_n_ua_b10])))
		if _S.truth((_n_ua_b10 < 1)):
			_S.invoke(_n_p_b0,"ring",[0, _n_CY, _n_ra_b11, maxf(1,(2 * (1 - _n_ua_b10))), (_S.index_value(_n_C,5) if _S.truth((_n_ua_b10 < 0.25)) else (_S.index_value(_n_C,4) if _S.truth((_n_ua_b10 < 0.6)) else _S.index_value(_n_C,3))), _S.function_value(_S.capture(_parent,{"ra":_n_ra_b11,"ua":_n_ua_b10,"this":_this}),"_f10")])
	if _S.truth(((_n_a_b4 < 0.9) if _S.truth((_n_a_b4 > 0.2)) else (_n_a_b4 > 0.2))):
		var _n_r_b13 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),9,_n_f_b1])
		var _n_k_b14 = (1 - (float((_n_a_b4 - 0.2))/0.7))
		if _S.truth((_S.invoke(_n_r_b13,"next",[]) < 0.8)):
			var _n_x0_b15 = _S.invoke(_n_r_b13,"range",[(-14), 14])
			var _n_y0_b16 = _S.invoke(_n_r_b13,"range",[(-34), (-4)])
			var _n_b_b17 = _S.invoke(_n_r_b13,"range",[0, _n_TAU])
			var _n_l_b18 = _S.invoke(_n_r_b13,"range",[6, 13])
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b13, _n_x0_b15, _n_y0_b16, (_n_x0_b15 + (cos(_n_b_b17) * _n_l_b18)), (_n_y0_b16 + (sin(_n_b_b17) * _n_l_b18)), 0.4, 0.3]), ((0.85 * _n_k_b14) + 0.1), _n_C, 0.35])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_hot,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_ra = _S.read(_parent,"ra")
	var _n_ua = _S.read(_parent,"ua")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_CY + (sin(_n_g_b1) * _n_ra)) > (-1))) else (0.85 - (0.85 * _n_ua)))
	return null
