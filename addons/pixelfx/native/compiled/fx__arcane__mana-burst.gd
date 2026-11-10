@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/mana-burst.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "sigil", _S.import_value("fx/arcane/_lib.js", "sigil"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "CY", _S.unary("-", 28))
	_S.define(_e, "GATHER", 0.22)
	_S.define(_e, "N", 9)
	_S.define(_e, "meta", _S.merge([{"name": "Mana burst"}, {"desc": "Energy rushes into a point and blows out in a white flash and rings, flinging glowing runes that flare and pop into sparks one after another."}, {"tags": ["arcane", "burst", "mana", "rune", "nova", "magic", "ground", "one-shot"]}, {"size": [208, 150]}, {"origin": [104, 124]}, {"duration": 1.8}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "runes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": _S.read(_e, "N")}]), _S.function_value(_e, "_f2")]))
	_S.define(_e, "pops", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_N = _S.read(_parent,"N")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_CY = _S.read(_parent,"CY")
	var _n_GATHER = _S.read(_parent,"GATHER")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((((float(_n_i_b1)/_n_N) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.25), 0.25])) - (float(PI)/2))
	var _n_sp_b3 = _S.invoke(_n_R,"range",[150, 210])
	return {"g":_n_i_b1,"x":0,"y":_n_CY,"vx":(cos(_n_a_b2) * _n_sp_b3),"vy":((sin(_n_a_b2) * _n_sp_b3) * (0.42 if _S.truth((sin(_n_a_b2) > 0)) else 0.85)),"pop":(((_n_GATHER + 0.42) + (_n_i_b1 * 0.065)) + _S.invoke(_n_R,"range",[0, 0.05])),"popped":false,"ph":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "GATHER"), 0.03))):
		var _v0 = _S.scope(_e)
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 2)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "a", _S.invoke(_S.read(_v2, "R"), "range", [0, _S.read(_v2, "TAU")]))
			_S.define(_v2, "D", _S.invoke(_S.read(_v2, "R"), "range", [24, 52]))
			_S.define(_v2, "T", _S.invoke(_S.read(_v2, "R"), "range", [0.12, 0.18]))
			_S.define(_v2, "v", _S.binary("/", _S.binary("*", _S.read(_v2, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v2, "Math"), "exp", [_S.binary("*", 3, _S.read(_v2, "T"))]), 1)))
			_S.define(_v2, "x", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "D")))
			_S.define(_v2, "y", _S.invoke(_S.read(_v2, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v2, "CY"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "D")), 0.85))]))
			_S.define(_v2, "l", _S.logical("||", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.read(_v2, "x"), _S.binary("-", _S.read(_v2, "y"), _S.read(_v2, "CY"))]), func(): return 1))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STREAK"), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v2, "x")), _S.read(_v2, "l")), _S.read(_v2, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v2, "CY"), _S.read(_v2, "y")), _S.read(_v2, "l")), _S.read(_v2, "v")), _S.read(_v2, "T"), (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 5))])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "GATHER")), func(): return _S.unary("!", _S.read(_e, "released")))):
		var _v3 = _S.scope(_e)
		_S.write(_v3, "released", true, "=", false)
		_S.invoke(_S.read(_v3, "lights"), "add", [0, _S.binary("-", _S.read(_v3, "CY"), 12), 96, _S.prop(_S.read(_v3, "C"), 5), 1, 0.5])
		_S.invoke(_S.read(_v3, "lights"), "add", [0, _S.read(_v3, "CY"), 40, _S.read(_v3, "WHITE"), 0.9, 0.1])
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 96)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [100, 250]))
			_S.define(_v5, "dn", (0.45 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), 0)) else 1))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [(_S.prop(_S.read(_v5, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.65])) else _S.prop(_S.read(_v5, "P"), "STAR")), 0, _S.read(_v5, "CY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "sp")), _S.read(_v5, "dn")), _S.invoke(_S.read(_v5, "R"), "range", [0.25, 0.55]), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.read(_v5, "WHITE"), _S.prop(_S.read(_v5, "C"), 6), _S.prop(_S.read(_v5, "C"), 5)]]), _S.invoke(_S.read(_v5, "R"), "range", [0.8, 1.8])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
		var _v6 = _S.scope(_v3)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 20)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "sp", _S.invoke(_S.read(_v7, "R"), "range", [130, 280]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "SPARK"), 0, _S.read(_v7, "CY"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "sp")), _S.invoke(_S.read(_v7, "R"), "range", [0.2, 0.45])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	if _S.truth(_S.read(_e, "released")):
		for _v8 in _S.array(_S.read(_e, "runes")):
			var _v9 = _S.scope(_e)
			_S.define(_v9, "r", _v8)
			var _v10 = _S.scope(_v9)
			if _S.truth(_S.prop(_S.read(_v10, "r"), "popped")):
				continue
			_S.set_prop(_S.read(_v10, "r"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "r"), "vx"), 4.2), _S.read(_v10, "dt")), "-=", false)
			_S.set_prop(_S.read(_v10, "r"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v10, "r"), "vy"), 4.2), _S.read(_v10, "dt")), _S.binary("*", 8, _S.read(_v10, "dt"))), "-=", false)
			_S.set_prop(_S.read(_v10, "r"), "x", _S.binary("*", _S.prop(_S.read(_v10, "r"), "vx"), _S.read(_v10, "dt")), "+=", false)
			_S.set_prop(_S.read(_v10, "r"), "y", _S.binary("*", _S.prop(_S.read(_v10, "r"), "vy"), _S.read(_v10, "dt")), "+=", false)
			if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.35])):
				_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "MOTE"), _S.binary("+", _S.prop(_S.read(_v10, "r"), "x"), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.prop(_S.read(_v10, "r"), "y"), _S.binary("+", _S.binary("*", _S.prop(_S.read(_v10, "r"), "vx"), 0.2), _S.invoke(_S.read(_v10, "R"), "range", [_S.unary("-", 10), 10])), _S.binary("-", _S.binary("*", _S.prop(_S.read(_v10, "r"), "vy"), 0.2), _S.invoke(_S.read(_v10, "R"), "range", [5, 25])), _S.invoke(_S.read(_v10, "R"), "range", [0.2, 0.4]), _S.prop(_S.read(_v10, "C"), 5), 0.5])
			if _S.truth(_S.binary(">=", _S.read(_v10, "t"), _S.prop(_S.read(_v10, "r"), "pop"))):
				var _v11 = _S.scope(_v10)
				_S.set_prop(_S.read(_v11, "r"), "popped", true, "=", false)
				_S.invoke(_S.read(_v11, "pops"), "push", [_S.merge([{"t": _S.read(_v11, "t")}, {"x": _S.prop(_S.read(_v11, "r"), "x")}, {"y": _S.prop(_S.read(_v11, "r"), "y")}])])
				_S.invoke(_S.read(_v11, "lights"), "add", [_S.prop(_S.read(_v11, "r"), "x"), _S.prop(_S.read(_v11, "r"), "y"), 34, _S.prop(_S.read(_v11, "C"), 5), 0.9, 0.22])
				_S.invoke(_S.read(_v11, "lights"), "add", [_S.prop(_S.read(_v11, "r"), "x"), _S.prop(_S.read(_v11, "r"), "y"), 12, _S.read(_v11, "WHITE"), 0.8, 0.06])
				var _v12 = _S.scope(_v11)
				_S.define(_v12, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v12, "i"), 9)):
					var _v13 = _S.scope(_v12)
					_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [0, _S.read(_v13, "TAU")]))
					_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "R"), "range", [70, 200]))
					_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "SPARK"), _S.prop(_S.read(_v13, "r"), "x"), _S.prop(_S.read(_v13, "r"), "y"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "sp")), 40), _S.invoke(_S.read(_v13, "R"), "range", [0.15, 0.4])])
					_v12 = _S.iteration(_v12)
					_S.write(_v12, "i", 1, "+=", true)
				var _v14 = _S.scope(_v11)
				_S.define(_v14, "i", 0)
				while _S.truth(_S.binary("<", _S.read(_v14, "i"), 5)):
					var _v15 = _S.scope(_v14)
					_S.define(_v15, "a", _S.invoke(_S.read(_v15, "R"), "range", [0, _S.read(_v15, "TAU")]))
					_S.define(_v15, "sp", _S.invoke(_S.read(_v15, "R"), "range", [20, 80]))
					_S.invoke(_S.read(_v15, "ps"), "spawn", [(_S.prop(_S.read(_v15, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v15, "i"), 2)) else _S.prop(_S.read(_v15, "P"), "MOTE")), _S.prop(_S.read(_v15, "r"), "x"), _S.prop(_S.read(_v15, "r"), "y"), _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "a")]), _S.read(_v15, "sp")), 20), _S.invoke(_S.read(_v15, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v15, "R"), "pick", [[_S.read(_v15, "WHITE"), _S.prop(_S.read(_v15, "C"), 6)]]), _S.invoke(_S.read(_v15, "R"), "range", [0.8, 1.6])])
					_v14 = _S.iteration(_v14)
					_S.write(_v14, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_GATHER = _S.read(_parent,"GATHER")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = ((0.4 * (float(_n_t)/_n_GATHER)) if _S.truth((_n_t < _n_GATHER)) else maxf(0,(1 - (float((_n_t - _n_GATHER))/1.1))))
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 50, _S.index_value(_n_C,4), (0.3 * _n_k_b1)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_GATHER = _S.read(_parent,"GATHER")
	var _n_CY = _S.read(_parent,"CY")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_flare = _S.read(_parent,"flare")
	var _n_released = _S.read(_parent,"released")
	var _n_sigil = _S.read(_parent,"sigil")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_runes = _S.read(_parent,"runes")
	var _n_pops = _S.read(_parent,"pops")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_GATHER)):
		var _n_k_b1 = (float(_n_t)/_n_GATHER)
		var _n_r_b2 = (1 + ((3.5 * _n_k_b1) * _n_k_b1))
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, (_n_r_b2 + 1.2), _S.index_value(_n_C,4)])
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, _n_r_b2, _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"circle",[0, _n_CY, (_n_r_b2 * 0.5), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, _n_CY, (10 + (20 * _n_k_b1)), _S.index_value(_n_C,5), (0.4 + (0.4 * _n_k_b1))])
		var _n_q_b3 = clampf((float((_n_t - (_n_GATHER * 0.35)))/(_n_GATHER * 0.65)),0.0,1.0)
		if _S.truth(((_n_q_b3 < 1) if _S.truth((_n_q_b3 > 0)) else (_n_q_b3 > 0))):
			_S.invoke(_n_p_b0,"ring",[0, _n_CY, ((_n_r_b2 + 2) + (16 * (1 - _S.invoke(_n_ease,"outCubic",[_n_q_b3])))), 1, (_n_WHITE if _S.truth((_n_q_b3 > 0.6)) else _S.index_value(_n_C,6)), (1 - (_n_q_b3 * 0.5))])
	else:
		var _n_q_b4 = (float((_n_t - _n_GATHER))/0.6)
		if _S.truth((_n_q_b4 < 1)):
			var _n_e_b5 = _S.invoke(_n_ease,"outCubic",[_n_q_b4])
			if _S.truth((_n_q_b4 < 0.12)):
				_S.invoke(_n_p_b0,"circle",[0, _n_CY, ((12 * (1 - (float(_n_q_b4)/0.12))) + 2), _S.index_value(_n_C,5)])
				_S.invoke(_n_p_b0,"circle",[0, _n_CY, (12 * (1 - (float(_n_q_b4)/0.12))), _n_WHITE])
			if _S.truth((_n_q_b4 < 0.32)):
				_S.call_value(_n_flare,[_n_p_b0, 0, _n_CY, ((30 * (1 - (float(_n_q_b4)/0.32))) + 4), (1 - (float(_n_q_b4)/0.32)), _n_C])
			_S.invoke(_n_p_b0,"ring",[0, _n_CY, (4 + (62 * _n_e_b5)), maxf(1,(5 * (1 - _n_q_b4))), (_n_WHITE if _S.truth((_n_q_b4 < 0.2)) else _S.index_value(_n_C,6)), _S.function_value(_S.capture(_parent,{"e":_n_e_b5,"q":_n_q_b4,"this":_this}),"_f6")])
			_S.invoke(_n_p_b0,"ring",[0, _n_CY, (2 + (38 * _S.invoke(_n_ease,"outCubic",[minf(1,(_n_q_b4 * 1.4))]))), maxf(1,(2 * (1 - _n_q_b4))), _S.index_value(_n_C,5), _S.function_value(_S.capture(_parent,{"q":_n_q_b4,"this":_this}),"_f7")])
			_S.invoke(_n_p_b0,"glow",[0, _n_CY, (60 * (0.4 + (0.6 * _n_e_b5))), _S.index_value(_n_C,5), (0.9 * (1 - _n_q_b4))])
	for _iter_0 in _S.array(_n_runes):
		var _n_r_b6 = _iter_0
		if _S.truth((not _S.truth(_n_released) if _S.truth(not _S.truth(_n_released)) else _S.named_value(_n_r_b6,"popped"))):
			continue
		var _n_left_b7 = (_S.named_value(_n_r_b6,"pop") - _n_t)
		var _n_hot_b8 = (((_n_t - _n_GATHER) < 0.08) if _S.truth(((_n_t - _n_GATHER) < 0.08)) else (_n_left_b7 < 0.06))
		var _n_bob_b9 = (sin(((_n_t * 9) + _S.named_value(_n_r_b6,"ph"))) * 0.6)
		_S.call_value(_n_sigil,[_n_p_b0, _S.named_value(_n_r_b6,"g"), _S.named_value(_n_r_b6,"x"), (_S.named_value(_n_r_b6,"y") + _n_bob_b9), (_n_WHITE if _S.truth(_n_hot_b8) else _S.index_value(_n_C,6)), 1, (_S.index_value(_n_C,4) if _S.truth(_n_hot_b8) else _S.index_value(_n_C,3))])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_r_b6,"x"), (_S.named_value(_n_r_b6,"y") + _n_bob_b9), 10, _S.index_value(_n_C,5), (0.7 if _S.truth(_n_hot_b8) else 0.35)])
		if _S.truth((_n_left_b7 < 0.06)):
			_S.call_value(_n_sparkle,[_n_p_b0, _S.named_value(_n_r_b6,"x"), (_S.named_value(_n_r_b6,"y") + _n_bob_b9), (3 + (4 * (1 - (float(_n_left_b7)/0.06)))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.5])
	for _iter_1 in _S.array(_n_pops):
		var _n_q_b10 = _iter_1
		var _n_k_b11 = (float((_n_t - _S.named_value(_n_q_b10,"t")))/0.32)
		if _S.truth((_n_k_b11 >= 1)):
			continue
		if _S.truth((_n_k_b11 < 0.35)):
			_S.call_value(_n_flare,[_n_p_b0, _S.named_value(_n_q_b10,"x"), _S.named_value(_n_q_b10,"y"), ((11 * (1 - (float(_n_k_b11)/0.35))) + 2), (1 - (float(_n_k_b11)/0.35)), _n_C])
		_S.invoke(_n_p_b0,"ring",[_S.named_value(_n_q_b10,"x"), _S.named_value(_n_q_b10,"y"), (2 + (11 * _S.invoke(_n_ease,"outCubic",[_n_k_b11]))), maxf(1,(2 * (1 - _n_k_b11))), (_n_WHITE if _S.truth((_n_k_b11 < 0.3)) else _S.index_value(_n_C,6)), (1.15 - _n_k_b11)])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_e = _S.read(_parent,"e")
	var _n_q = _S.read(_parent,"q")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_ang_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_CY + (sin(_n_ang_b1) * (4 + (62 * _n_e)))) > 0)) else (1.2 - _n_q))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_q = _S.read(_parent,"q")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_ang_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_CY + (sin(_n_ang_b1) * 40)) > 0)) else (1 - _n_q))
	return null
