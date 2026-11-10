@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/chain-lightning.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "bowed", _S.import_value("fx/lightning/_lib.js", "bowed"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "trace", _S.import_value("fx/lightning/_lib.js", "trace"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "level", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Chain lightning"}, {"desc": "A bolt leaps from the caster's hand through three targets in turn; each flashes, sparks and grounds itself to the floor while the arcs between them flicker, then the chain snaps."}, {"tags": ["lightning", "electric", "chain", "spell", "combat", "directional", "one-shot"]}, {"size": [248, 104]}, {"origin": [40, 82]}, {"duration": 1.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "AIM", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}, {"crouch": 4}, {"lean": 4}, {"fx": 16}, {"fy": _S.unary("-", 16)}, {"bx": _S.unary("-", 6)}, {"by": _S.unary("-", 23)}, {"ffx": 11}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "BACK", _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}, {"crouch": 4}, {"lean": _S.unary("-", 3)}, {"fx": _S.unary("-", 5)}, {"fy": _S.unary("-", 32)}, {"bx": 8}, {"by": _S.unary("-", 24)}, {"armsFront": true}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "zap", _S.function_value(_e, "_f10"))
	_S.define(_e, "act", _S.merge([{"targets": [_S.merge([{"x": 58}]), _S.merge([{"x": 104}]), _S.merge([{"x": 150}])]}, {"poses": [[_S.unary("-", 0.46), _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}])], [_S.unary("-", 0.22), _S.read(_e, "BACK")], [0, _S.merge([_S.read(_e, "BACK"), {"crouch": 5}])], [0.04, _S.read(_e, "AIM"), "snap"], [0.7, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}])], [1.35, _S.merge([_S.read(_e, "AIM"), {"crouch": 3}, {"fy": _S.unary("-", 18)}])], [1.8, _S.merge([_S.read(_e, "READY"), {"x": _S.unary("-", 6)}])]]}, {"hits": [_S.call_value(_S.read(_e, "zap"), [0, 0.05]), _S.call_value(_S.read(_e, "zap"), [1, 0.14]), _S.merge([_S.call_value(_S.read(_e, "zap"), [2, 0.23, 0.07]), {"shake": 0.14}, {"amp": 1}]), _S.merge([{"t": 1.35}, {"push": 0}, {"straw": 0}, {"flash": 0}, {"skin": null}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "HAND", [10, _S.unary("-", 16)])
	_S.define(_e, "HOPS", [[58, _S.unary("-", 22)], [104, _S.unary("-", 30)], [150, _S.unary("-", 19)]])
	_S.define(_e, "WIND", 0.12)
	_S.define(_e, "LEAP", 0.05)
	_S.define(_e, "GAP", 0.075)
	_S.define(_e, "HOLD", 0.78)
	_S.define(_e, "BREAK", 0.16)
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "on", _S.function_value(_e, "_f11"))
	_S.define(_e, "off", _S.function_value(_e, "_f12"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_on = _S.read(_parent,"on")
	var _n_off = _S.read(_parent,"off")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_a_b2 = (_n_t_b1 - _S.call_value(_n_on,[_n_i_b0]))
	if _S.truth((_n_a_b2 < 0)):
		return 0
	var _n_hum_b3 = (_S.logical("??",_S.index_value([1, 0.55, 1],floori((_n_a_b2 * 30))),func():return 1) if _S.truth((_n_a_b2 < 0.1)) else (0.78 + ((0.22 * sin(((_n_t_b1 * 61) + _n_i_b0))) * sin(((_n_t_b1 * 23) + (_n_i_b0 * 2))))))
	var _n_b_b4 = (_n_t_b1 - _S.call_value(_n_off,[_n_i_b0]))
	return (_n_hum_b3 if _S.truth((_n_b_b4 < 0)) else (((_n_hum_b3 * (1 - (float(_n_b_b4)/_n_BREAK))) * (0.5 if _S.truth(_S.binary("===",fmod(floori((_n_b_b4 * 60)),3),1)) else 1)) if _S.truth((_n_b_b4 < _n_BREAK)) else 0))
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "hot", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pts", _S.concat([[_S.read(_e, "HAND")], _S.array(_S.read(_e, "HOPS"))]))
	_S.define(_e, "hit", _S.invoke(_S.read(_e, "HOPS"), "map", [_S.function_value(_e, "_f3")]))
	_S.define(_e, "popped", _S.invoke(_S.read(_e, "HOPS"), "map", [_S.function_value(_e, "_f4")]))
	_S.define(_e, "ground", _S.invoke(_S.read(_e, "HOPS"), "map", [_S.function_value(_e, "_f5")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "shape", _S.function_value(_e, "_f6"))
	return _S.merge([{"update": _S.function_value(_e, "_f7")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	return false
	return null

static func _f4(_parent,_args:Array,_this=null):
	return false
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	return (_n_x_b0 + _S.invoke(_n_R,"range",[(-5), 5]))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_o = _S.read(_parent,"o")
	var _n_pts = _S.read(_parent,"pts")
	var _n_bowed = _S.read(_parent,"bowed")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.arg(_args,1)
	var _n_salt_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	var _n_r_b3 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),(31 + _n_salt_b2),_n_i_b0,_n_f_b1])
	var _tuple_0 = _S.index_value(_n_pts,_n_i_b0)
	var _n_x0_b4 = _S.prop(_tuple_0,0)
	var _n_y0_b5 = _S.prop(_tuple_0,1)
	var _tuple_1 = _S.index_value(_n_pts,(_n_i_b0 + 1))
	var _n_x1_b6 = _S.prop(_tuple_1,0)
	var _n_y1_b7 = _S.prop(_tuple_1,1)
	var _n_L_b8 = _S.Bridge.hypot([(_n_x1_b6 - _n_x0_b4), (_n_y1_b7 - _n_y0_b5)])
	return _S.call_value(_n_bowed,[_n_r_b3, _n_x0_b4, _n_y0_b5, _n_x1_b6, _n_y1_b7, ((-_n_L_b8) * _S.invoke(_n_r_b3,"range",[0.05, 0.15])), 0.2, 0.08])
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "WIND")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 70, _S.read(_e, "dt"))]))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
		_S.define(_v3, "d", _S.invoke(_S.read(_v3, "R"), "range", [10, 24]))
		_S.define(_v3, "T", _S.invoke(_S.read(_v3, "R"), "range", [0.06, 0.1]))
		_S.define(_v3, "v", _S.binary("/", _S.binary("*", _S.read(_v3, "d"), 3), _S.binary("-", _S.invoke(_S.read(_v3, "Math"), "exp", [_S.binary("*", 3, _S.read(_v3, "T"))]), 1)))
		_S.invoke(_S.read(_v3, "ps"), "spawn", [_S.prop(_S.read(_v3, "P"), "STREAK"), _S.binary("+", _S.prop(_S.read(_v3, "HAND"), 0), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "d"))), _S.binary("+", _S.prop(_S.read(_v3, "HAND"), 1), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "d"))), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")])), _S.read(_v3, "v")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")])), _S.read(_v3, "v")), _S.read(_v3, "T"), (_S.prop(_S.read(_v3, "C"), 6) if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.5])) else _S.prop(_S.read(_v3, "C"), 5))])
	for _v4 in _S.array(_S.invoke(_S.read(_e, "HOPS"), "entries", [])):
		var _v5 = _S.scope(_e)
		var _v6 = _v4
		_S.define(_v5, "i", _S.prop(_v6, 0))
		var _v7 = _S.prop(_v6, 1)
		_S.define(_v5, "x", _S.prop(_v7, 0))
		_S.define(_v5, "y", _S.prop(_v7, 1))
		var _v8 = _S.scope(_v5)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v8, "hit"), _S.read(_v8, "i"))), func(): return _S.binary(">=", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "on"), [_S.read(_v8, "i")])))):
			var _v9 = _S.scope(_v8)
			_S.set_prop(_S.read(_v9, "hit"), _S.read(_v9, "i"), true, "=", false)
			var _v10 = _S.prop(_S.read(_v9, "pts"), _S.read(_v9, "i"))
			_S.define(_v9, "px", _S.prop(_v10, 0))
			_S.define(_v9, "py", _S.prop(_v10, 1))
			_S.define(_v9, "dir", _S.invoke(_S.read(_v9, "Math"), "atan2", [_S.binary("-", _S.read(_v9, "y"), _S.read(_v9, "py")), _S.binary("-", _S.read(_v9, "x"), _S.read(_v9, "px"))]))
			_S.invoke(_S.read(_v9, "lights"), "add", [_S.read(_v9, "x"), _S.read(_v9, "y"), 56, _S.prop(_S.read(_v9, "C"), 4), 0.85, 0.22])
			_S.invoke(_S.read(_v9, "lights"), "add", [_S.read(_v9, "x"), _S.read(_v9, "y"), 16, _S.read(_v9, "WHITE"), 0.7, 0.08])
			if _S.truth(_S.binary("===", _S.read(_v9, "i"), 0)):
				_S.invoke(_S.read(_v9, "lights"), "add", [_S.prop(_S.read(_v9, "HAND"), 0), _S.prop(_S.read(_v9, "HAND"), 1), 40, _S.prop(_S.read(_v9, "C"), 4), 0.6, 0.15])
			var _v11 = _S.scope(_v9)
			_S.define(_v11, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "j"), 18)):
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "a", (_S.binary("+", _S.read(_v12, "dir"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 1.1), 1.1])) if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.6])) else _S.invoke(_S.read(_v12, "R"), "range", [0, _S.read(_v12, "TAU")])))
				_S.define(_v12, "sp", _S.invoke(_S.read(_v12, "R"), "range", [70, 230]))
				_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SPARK"), _S.read(_v12, "x"), _S.read(_v12, "y"), _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "cos", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v12, "Math"), "sin", [_S.read(_v12, "a")]), _S.read(_v12, "sp")), 40), _S.invoke(_S.read(_v12, "R"), "range", [0.15, 0.4])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "j", 1, "+=", true)
			var _v13 = _S.scope(_v9)
			_S.define(_v13, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v13, "j"), 5)):
				_S.invoke(_S.read(_v13, "hot"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.binary("+", _S.read(_v13, "x"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.read(_v13, "y"), 2), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 50), 50]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 60), 20]), _S.invoke(_S.read(_v13, "R"), "range", [0.5, 0.9])])
				_v13 = _S.iteration(_v13)
				_S.write(_v13, "j", 1, "+=", true)
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.read(_v9, "x"), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("-", _S.read(_v9, "y"), _S.invoke(_S.read(_v9, "R"), "range", [3, 7])), 0, _S.unary("-", 6), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.4]), _S.prop(_S.read(_v9, "C"), 6), _S.invoke(_S.read(_v9, "R"), "range", [1.5, 2.5])])
			var _v14 = _S.scope(_v9)
			_S.define(_v14, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v14, "j"), 2)):
				_S.invoke(_S.read(_v14, "ps"), "spawn", [_S.prop(_S.read(_v14, "P"), "SMOKE"), _S.binary("+", _S.read(_v14, "x"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 4), 4])), _S.binary("+", _S.read(_v14, "y"), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 2), 3])), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v14, "R"), "range", [8, 16])), _S.invoke(_S.read(_v14, "R"), "range", [0.7, 1]), _S.call_value(_S.read(_v14, "mix"), [_S.read(_v14, "ASH"), _S.prop(_S.read(_v14, "C"), 2), 0.35]), _S.invoke(_S.read(_v14, "R"), "range", [2, 3.5]), _S.invoke(_S.read(_v14, "R"), "range", [0.1, 0.25])])
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "j", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v8, "hit"), _S.read(_v8, "i")), func(): return _S.binary("<", _S.read(_v8, "t"), _S.call_value(_S.read(_v8, "off"), [_S.read(_v8, "i")])))):
			var _v15 = _S.scope(_v8)
			if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [_S.binary("*", 9, _S.read(_v15, "dt"))])):
				var _v16 = _S.scope(_v15)
				_S.define(_v16, "u", _S.invoke(_S.read(_v16, "R"), "next", []))
				var _v17 = _S.prop(_S.read(_v16, "pts"), _S.read(_v16, "i"))
				_S.define(_v16, "x0", _S.prop(_v17, 0))
				_S.define(_v16, "y0", _S.prop(_v17, 1))
				_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SPARK"), _S.call_value(_S.read(_v16, "lerp"), [_S.read(_v16, "x0"), _S.read(_v16, "x"), _S.read(_v16, "u")]), _S.binary("-", _S.call_value(_S.read(_v16, "lerp"), [_S.read(_v16, "y0"), _S.read(_v16, "y"), _S.read(_v16, "u")]), 2), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 60), 60]), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 90), 20]), _S.invoke(_S.read(_v16, "R"), "range", [0.1, 0.25])])
			if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [_S.binary("*", 7, _S.read(_v15, "dt"))])):
				_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.prop(_S.read(_v15, "ground"), _S.read(_v15, "i")), _S.unary("-", 1), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 70), 70]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [40, 140])), _S.invoke(_S.read(_v15, "R"), "range", [0.12, 0.3])])
			if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [_S.binary("*", 2, _S.read(_v15, "dt"))])):
				_S.invoke(_S.read(_v15, "hot"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.binary("+", _S.read(_v15, "x"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 3), 3])), _S.binary("+", _S.read(_v15, "y"), 3), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 30), 30]), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 30), 10]), _S.invoke(_S.read(_v15, "R"), "range", [0.5, 0.8])])
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v8, "popped"), _S.read(_v8, "i"))), func(): return _S.binary(">=", _S.read(_v8, "t"), _S.binary("+", _S.call_value(_S.read(_v8, "off"), [_S.read(_v8, "i")]), _S.read(_v8, "BREAK"))))):
			var _v18 = _S.scope(_v8)
			_S.set_prop(_S.read(_v18, "popped"), _S.read(_v18, "i"), true, "=", false)
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "j", 0)
			while _S.truth(_S.binary("<", _S.read(_v19, "j"), 7)):
				var _v20 = _S.scope(_v19)
				_S.define(_v20, "a", _S.invoke(_S.read(_v20, "R"), "range", [0, _S.read(_v20, "TAU")]))
				_S.define(_v20, "sp", _S.invoke(_S.read(_v20, "R"), "range", [40, 140]))
				_S.invoke(_S.read(_v20, "ps"), "spawn", [_S.prop(_S.read(_v20, "P"), "SPARK"), _S.read(_v20, "x"), _S.read(_v20, "y"), _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "cos", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v20, "Math"), "sin", [_S.read(_v20, "a")]), _S.read(_v20, "sp")), 30), _S.invoke(_S.read(_v20, "R"), "range", [0.12, 0.3])])
				_v19 = _S.iteration(_v19)
				_S.write(_v19, "j", 1, "+=", true)
			_S.invoke(_S.read(_v18, "ps"), "spawn", [_S.prop(_S.read(_v18, "P"), "SMOKE"), _S.read(_v18, "x"), _S.read(_v18, "y"), _S.invoke(_S.read(_v18, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v18, "R"), "range", [10, 16])), _S.invoke(_S.read(_v18, "R"), "range", [0.55, 0.7]), _S.call_value(_S.read(_v18, "mix"), [_S.read(_v18, "ASH"), _S.prop(_S.read(_v18, "C"), 2), 0.35]), _S.invoke(_S.read(_v18, "R"), "range", [2.5, 3.5])])
			_S.invoke(_S.read(_v18, "lights"), "add", [_S.read(_v18, "x"), _S.read(_v18, "y"), 30, _S.prop(_S.read(_v18, "C"), 4), 0.5, 0.12])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "hot"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_on = _S.read(_parent,"on")
	var _n_off = _S.read(_parent,"off")
	var _n_ground = _S.read(_parent,"ground")
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_HOPS = _S.read(_parent,"HOPS")
	var _n_ps = _S.read(_parent,"ps")
	var _n_hot = _S.read(_parent,"hot")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_S.invoke(_n_HOPS,"entries",[])):
		var _tuple_1 = _iter_0
		var _n_i_b1 = _S.prop(_tuple_1,0)
		var _n_a_b2 = (_n_t - _S.call_value(_n_on,[_n_i_b1]))
		if _S.truth((_n_a_b2 < 0)):
			continue
		var _n_T0_b3 = ((minf(1,(float(_n_a_b2)/0.2)) * pow(clampf((1 - (float((_n_t - _S.call_value(_n_off,[_n_i_b1])))/0.7)),0.0,1.0),1.3)) * 0.9)
		_S.call_value(_n_scorch,[_n_p_b0, _S.index_value(_n_ground,_n_i_b1), 0, 7, _n_T0_b3, (1 - _S.MathFX.smooth(1.35,1.75,_n_t))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	_S.invoke(_n_hot,"draw",[_n_p_b0, "back"])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_level = _S.read(_parent,"level")
	var _n_HAND = _S.read(_parent,"HAND")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_o = _S.read(_parent,"o")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_GAP = _S.read(_parent,"GAP")
	var _n_pts = _S.read(_parent,"pts")
	var _n_on = _S.read(_parent,"on")
	var _n_ease = _S.read(_parent,"ease")
	var _n_LEAP = _S.read(_parent,"LEAP")
	var _n_shape = _S.read(_parent,"shape")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_off = _S.read(_parent,"off")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_trace = _S.read(_parent,"trace")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ground = _S.read(_parent,"ground")
	var _n_HOPS = _S.read(_parent,"HOPS")
	var _n_ps = _S.read(_parent,"ps")
	var _n_hot = _S.read(_parent,"hot")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = floori(((_n_t * 30) + 0.0001))
	var _n_f2_b2 = _S.binary(">>",_n_f_b1,1)
	var _n_kh_b3 = ((float(_n_t)/_n_WIND) if _S.truth((_n_t < _n_WIND)) else _S.call_value(_n_level,[0, _n_t]))
	if _S.truth((_n_kh_b3 > 0.02)):
		var _n_r_b4 = (((1.2 + (1.6 * _n_kh_b3)) + (sin((_n_t * 53)) * 0.4)) * minf(1,(_n_kh_b3 * 1.5)))
		_S.invoke(_n_p_b0,"circle",[_S.index_value(_n_HAND,0), _S.index_value(_n_HAND,1), (_n_r_b4 + 1.2), _S.index_value(_n_C,4)])
		_S.invoke(_n_p_b0,"circle",[_S.index_value(_n_HAND,0), _S.index_value(_n_HAND,1), _n_r_b4, _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"circle",[_S.index_value(_n_HAND,0), _S.index_value(_n_HAND,1), (_n_r_b4 * 0.5), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_HAND,0), _S.index_value(_n_HAND,1), 18, _S.index_value(_n_C,4), (0.6 * _n_kh_b3)])
		if _S.truth((_n_t > (_n_WIND * 0.5))):
			var _n_r2_b5 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),5,_n_f_b1])
			var _n_a_b6 = _S.invoke(_n_r2_b5,"range",[0, _n_TAU])
			var _n_d_b7 = _S.invoke(_n_r2_b5,"range",[4, 8])
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r2_b5, _S.index_value(_n_HAND,0), _S.index_value(_n_HAND,1), (_S.index_value(_n_HAND,0) + (cos(_n_a_b6) * _n_d_b7)), (_S.index_value(_n_HAND,1) + (sin(_n_a_b6) * _n_d_b7)), 0.4, 0.3]), (0.6 * _n_kh_b3), _n_C, 0.3])
	for _iter_0 in _S.array(_S.invoke(_n_HOPS,"entries",[])):
		var _tuple_1 = _iter_0
		var _n_i_b8 = _S.prop(_tuple_1,0)
		var _tuple_2 = _S.prop(_tuple_1,1)
		var _n_x_b9 = _S.prop(_tuple_2,0)
		var _n_y_b10 = _S.prop(_tuple_2,1)
		var _n_t0_b11 = (_n_WIND + (_n_i_b8 * _n_GAP))
		var _tuple_3 = _S.index_value(_n_pts,_n_i_b8)
		var _n_x0_b12 = _S.prop(_tuple_3,0)
		var _n_y0_b13 = _S.prop(_tuple_3,1)
		if _S.truth(((_n_t < _S.call_value(_n_on,[_n_i_b8])) if _S.truth((_n_t >= _n_t0_b11)) else (_n_t >= _n_t0_b11))):
			var _n_u_b16 = _S.invoke(_n_ease,"outQuad",[(float((_n_t - _n_t0_b11))/_n_LEAP)])
			var _n_b_b17 = _S.call_value(_n_shape,[_n_i_b8, (-1)])
			var _n_trunk_b18 = {"paths":[_S.index_value(_S.named_value(_n_b_b17,"paths"),0)]}
			_S.call_value(_n_stroke,[_n_p_b0, _n_trunk_b18, 1, _n_C, 0.75, {"upTo":_n_u_b16}])
			var _n_tp_b19 = _S.named_value(_S.index_value(_S.named_value(_n_b_b17,"paths"),0),"pts")
			var _tuple_4 = _S.index_value(_n_tp_b19,minf((_S.prop(_n_tp_b19,"length") - 1),floori((_n_u_b16 * (_S.prop(_n_tp_b19,"length") - 1)))))
			var _n_hx_b20 = _S.prop(_tuple_4,0)
			var _n_hy_b21 = _S.prop(_tuple_4,1)
			_S.invoke(_n_p_b0,"circle",[_n_hx_b20, _n_hy_b21, 2, _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_hx_b20, _n_hy_b21, 16, _S.index_value(_n_C,5), 0.7])
		var _n_k_b14 = _S.call_value(_n_level,[_n_i_b8, _n_t])
		if _S.truth((_n_k_b14 > 0)):
			_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_shape,[_n_i_b8, _n_f2_b2]), _n_k_b14, _n_C, 0.75])
		else:
			if _S.truth(_S.logical("&&",(_n_t >= (_S.call_value(_n_off,[_n_i_b8]) + _n_BREAK)),func():return (_n_t < ((_S.call_value(_n_off,[_n_i_b8]) + _n_BREAK) + 0.35)))):
				var _n_g_b22 = (1 - (float(((_n_t - _S.call_value(_n_off,[_n_i_b8])) - _n_BREAK))/0.35))
				var _n_b_b23 = _S.call_value(_n_shape,[_n_i_b8, floori(((_S.call_value(_n_off,[_n_i_b8]) + _n_BREAK) * 15))])
				_S.call_value(_n_trace,[_n_p_b0, _S.named_value(_S.index_value(_S.named_value(_n_b_b23,"paths"),0),"pts"), (_S.index_value(_n_C,4) if _S.truth((_n_g_b22 > 0.5)) else _S.index_value(_n_C,2)), (_n_g_b22 * 0.9)])
		var _n_a_b15 = (_n_t - _S.call_value(_n_on,[_n_i_b8]))
		if _S.truth(((_n_a_b15 < 0.09) if _S.truth((_n_a_b15 >= 0)) else (_n_a_b15 >= 0))):
			var _n_q_b24 = (float(_n_a_b15)/0.09)
			_S.invoke(_n_p_b0,"circle",[_n_x_b9, _n_y_b10, ((6 * (1 - _n_q_b24)) + 1.5), _S.index_value(_n_C,5)])
			_S.invoke(_n_p_b0,"circle",[_n_x_b9, _n_y_b10, (5 * (1 - _n_q_b24)), _n_WHITE])
			_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b9, _n_y_b10, floori((10 * (1 - _n_q_b24))+0.5), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.6])
		if _S.truth((_n_k_b14 > 0.05)):
			var _n_r_b25 = ((2.6 + (sin(((_n_t * 47) + _n_i_b8)) * 0.7)) * _n_k_b14)
			_S.invoke(_n_p_b0,"circle",[_n_x_b9, _n_y_b10, (_n_r_b25 + 1.5), _S.index_value(_n_C,2)])
			_S.invoke(_n_p_b0,"circle",[_n_x_b9, _n_y_b10, (_n_r_b25 + 0.7), _S.index_value(_n_C,5)])
			_S.invoke(_n_p_b0,"circle",[_n_x_b9, _n_y_b10, (_n_r_b25 * 0.6), _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_x_b9, _n_y_b10, 26, _S.index_value(_n_C,4), (0.6 * _n_k_b14)])
			_S.invoke(_n_p_b0,"glow",[_n_x_b9, _n_y_b10, 8, _S.index_value(_n_C,6), (0.5 * _n_k_b14)])
			var _n_r2_b26 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),11,_n_i_b8,_n_f_b1])
			if true:
				var _n_j_b27 = 0
				while _S.truth((_n_j_b27 < (2 if _S.truth(((_n_t - _S.call_value(_n_on,[_n_i_b8])) < 0.12)) else 1))):
					var _n_a0_b28 = _S.invoke(_n_r2_b26,"range",[0, _n_TAU])
					var _n_a1_b29 = (_n_a0_b28 + (_S.invoke(_n_r2_b26,"sign",[]) * _S.invoke(_n_r2_b26,"range",[0.5, 1])))
					var _n_d0_b30 = _S.invoke(_n_r2_b26,"range",[4, 6])
					var _n_d1_b31 = _S.invoke(_n_r2_b26,"range",[5, 8])
					_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r2_b26, (_n_x_b9 + (cos(_n_a0_b28) * _n_d0_b30)), (_n_y_b10 + (sin(_n_a0_b28) * _n_d0_b30)), (_n_x_b9 + (cos(_n_a1_b29) * _n_d1_b31)), (_n_y_b10 + (sin(_n_a1_b29) * _n_d1_b31)), 0.35, 0]), (_S.invoke(_n_r2_b26,"range",[0.45, 0.7]) * _n_k_b14), _n_C, 0.25])
					_n_j_b27 += 1.0
			if _S.truth((_S.invoke(_n_r2_b26,"next",[]) < (0.3 * _n_k_b14))):
				var _n_gx_b32 = (_S.index_value(_n_ground,_n_i_b8) + _S.invoke(_n_r2_b26,"range",[(-3), 3]))
				_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r2_b26, (_n_x_b9 + _S.invoke(_n_r2_b26,"range",[(-2), 2])), (_n_y_b10 + 3), _n_gx_b32, (-0.5), 0.3, 0.35]), (0.75 * _n_k_b14), _n_C, 0.35])
				_S.invoke(_n_p_b0,"glow",[_n_gx_b32, (-1), 12, _S.index_value(_n_C,5), (0.5 * _n_k_b14)])
				_S.invoke(_n_p_b0,"px",[_n_gx_b32, (-1), _n_WHITE])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_hot,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_at_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_stop_b2 = _S.coalesce(_S.arg(_args,2),func():return 0.03)
	return {"t":_n_t_b1,"at":_n_at_b0,"stop":_n_stop_b2,"push":1.2,"straw":6,"skin":"shock","shiver":0.7,"y":(-22)}
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_WIND = _S.read(_parent,"WIND")
	var _n_GAP = _S.read(_parent,"GAP")
	var _n_LEAP = _S.read(_parent,"LEAP")
	var _n_i_b0 = _S.arg(_args,0)
	return ((_n_WIND + (_n_i_b0 * _n_GAP)) + _n_LEAP)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_HOLD = _S.read(_parent,"HOLD")
	var _n_i_b0 = _S.arg(_args,0)
	return (_n_HOLD + (_n_i_b0 * 0.05))
	return null
