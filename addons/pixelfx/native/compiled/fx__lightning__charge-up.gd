@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/charge-up.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "edgeOf", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.merge([{"name": "Charge up"}, {"desc": "Sparks streak and arcs whip in to a crackling core at the caster's hand that swells and pulses faster, then it flashes and bursts: bolts every way, a ring, a spray of sparks."}, {"tags": ["lightning", "electric", "charge", "spell", "power-up", "actor", "one-shot"]}, {"size": [272, 184]}, {"origin": [124, 148]}, {"duration": 2.7}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"charge": 1.6}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([_S.read(_e, "READY"), {"crouch": 3}, {"lean": _S.unary("-", 2)}, {"fx": 15}, {"fy": _S.unary("-", 21)}, {"bx": 9}, {"by": _S.unary("-", 17)}, {"ffx": 9}, {"fbx": _S.unary("-", 7)}]))
	_S.define(_e, "BURST", _S.merge([{"turn": 1.15}, {"y": _S.unary("-", 2)}, {"crouch": 0}, {"lean": _S.unary("-", 2)}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 37)}, {"bx": 14}, {"by": _S.unary("-", 36)}, {"ffx": _S.unary("-", 2)}, {"ffy": _S.unary("-", 6)}, {"fbx": 3}, {"fby": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[_S.unary("-", 0.36), _S.read(_e, "READY")], [0, _S.read(_e, "HOLD")], [0.8, _S.merge([_S.read(_e, "HOLD"), {"crouch": 4}])], [1.4, _S.merge([_S.read(_e, "HOLD"), {"crouch": 6}, {"lean": 0}])], [1.59, _S.merge([_S.read(_e, "HOLD"), {"crouch": 7}, {"lean": 0}])], [1.6, _S.read(_e, "BURST"), "snap"], [1.95, _S.merge([_S.read(_e, "BURST"), {"y": 0}, {"crouch": 2}, {"fy": _S.unary("-", 30)}, {"by": _S.unary("-", 30)}, {"ffy": _S.unary("-", 4)}, {"fby": _S.unary("-", 4)}])], [2.7, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 1.6}, {"stop": 0.14}, {"shake": 0.3}, {"amp": 3}])]}, {"dust": [_S.merge([{"t": 1.6}, {"x": 10}, {"n": 6}, {"dir": 1}]), _S.merge([{"t": 1.6}, {"x": _S.unary("-", 10)}, {"n": 6}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CX", 15)
	_S.define(_e, "CY", _S.unary("-", 21))
	_S.define(_e, "BK", [1, 0.7, 0.95, 0.5, 0.8, 0.35])
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "edges", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_edges = _S.read(_parent,"edges")
	var _n_A_b0 = _S.arg(_args,0)
	var _n_e_b1 = _S.invoke(_n_edges,"get",[_S.named_value(_n_A_b0,"mask")])
	if _S.truth(_n_e_b1):
		return _n_e_b1
	var _n_m_b2 = _S.named_value(_n_A_b0,"mask")
	var _n_on_b3 = _S.function_value(_S.capture(_parent,{"m":_n_m_b2,"this":_this}),"_f1")
	_n_e_b1 = []
	if true:
		var _n_y_b4 = 0
		while _S.truth((_n_y_b4 < _S.named_value(_n_m_b2,"h"))):
			if true:
				var _n_x_b5 = 0
				while _S.truth((_n_x_b5 < _S.named_value(_n_m_b2,"w"))):
					if _S.truth(_S.logical("&&",_S.call_value(_n_on_b3,[_n_x_b5, _n_y_b4]),func():return _S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_on_b3,[(_n_x_b5 - 1), _n_y_b4])),func():return not _S.truth(_S.call_value(_n_on_b3,[(_n_x_b5 + 1), _n_y_b4]))),func():return not _S.truth(_S.call_value(_n_on_b3,[_n_x_b5, (_n_y_b4 - 1)]))),func():return not _S.truth(_S.call_value(_n_on_b3,[_n_x_b5, (_n_y_b4 + 1)]))))):
						_S.invoke(_n_e_b1,"push",[[(_S.named_value(_n_A_b0,"x") + _n_x_b5), (_S.named_value(_n_A_b0,"y") + _n_y_b4)]])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	_S.invoke(_n_edges,"set",[_S.named_value(_n_A_b0,"mask"), _n_e_b1])
	return _n_e_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_n_m,"data"),((_n_y_b1 * _S.named_value(_n_m,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "REL", _S.prop(_S.read(_e, "o"), "charge"))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.prop(_S.read(_e, "o"), "sparks")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "bolts", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 8}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "arcs", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "released", false)
	_S.define(_e, "phase", 0)
	_S.define(_e, "beats", [])
	_S.define(_e, "level", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f8")}, {"draw": _S.function_value(_e, "_f9")}])

static func _f3(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n_CX = _S.read(_parent,"CX")
	var _n_CY = _S.read(_parent,"CY")
	var _n_REL = _S.read(_parent,"REL")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float(_n_i_b1)/8) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.25), 0.25]))
	var _n_L_b3 = _S.invoke(_n_R,"range",[44, 72])
	var _n_x1_b4 = (_n_CX + (cos(_n_a_b2) * _n_L_b3))
	var _n_y1_b5 = minf(0,(_n_CY + (sin(_n_a_b2) * _n_L_b3)))
	return {"x1":_n_x1_b4,"y1":_n_y1_b5,"t0":(_n_REL + _S.invoke(_n_R,"range",[0, 0.05]))}
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_REL = _S.read(_parent,"REL")
	return clampf((float(_n_t)/_n_REL),0.0,1.0)
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "k", _S.call_value(_S.read(_e, "level"), []))
	_S.define(_e, "e", _S.binary("*", _S.read(_e, "k"), _S.read(_e, "k")))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "REL"))):
		var _v2 = _S.scope(_e)
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "acc", _S.binary("*", _S.binary("+", 60, _S.binary("*", 360, _S.read(_v3, "e"))), _S.read(_v3, "dt")))
		while _S.truth(_S.binary(">", _S.read(_v3, "acc"), 0)):
			var _v4 = _S.scope(_v3)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v4, "acc"), 1), func(): return _S.unary("!", _S.invoke(_S.read(_v4, "R"), "chance", [_S.read(_v4, "acc")])))):
				break
			_S.define(_v4, "a", _S.invoke(_S.read(_v4, "R"), "range", [0, _S.read(_v4, "TAU")]))
			_S.define(_v4, "d", _S.binary("*", _S.invoke(_S.read(_v4, "R"), "range", [30, 72]), _S.binary("-", 1, _S.binary("*", 0.35, _S.read(_v4, "k")))))
			_S.define(_v4, "life", _S.invoke(_S.read(_v4, "R"), "range", [0.16, 0.26]))
			_S.define(_v4, "sp", _S.binary("*", _S.binary("/", _S.read(_v4, "d"), _S.read(_v4, "life")), 0.95))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "MOTE"), _S.binary("+", _S.read(_v4, "CX"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "d"))), _S.invoke(_S.read(_v4, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v4, "CY"), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "d")))]), _S.binary("-", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")])), _S.read(_v4, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), 0.4)), _S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "a")])), _S.read(_v4, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "a")]), _S.read(_v4, "sp")), 0.4)), _S.read(_v4, "life"), _S.invoke(_S.read(_v4, "R"), "pick", [[_S.prop(_S.read(_v4, "C"), 7), _S.prop(_S.read(_v4, "C"), 6), _S.prop(_S.read(_v4, "C"), 5)]]), 1])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "acc", 1, "-=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v2, "k"), 0.2), func(): return _S.invoke(_S.read(_v2, "R"), "chance", [_S.binary("*", _S.binary("+", 2, _S.binary("*", 16, _S.read(_v2, "e"))), _S.read(_v2, "dt"))]))):
			var _v5 = _S.scope(_v2)
			_S.define(_v5, "a", _S.invoke(_S.read(_v5, "R"), "range", [0, _S.read(_v5, "TAU")]))
			_S.define(_v5, "d", _S.invoke(_S.read(_v5, "R"), "range", [20, 40]))
			_S.invoke(_S.read(_v5, "arcs"), "push", [_S.merge([{"x": _S.binary("+", _S.read(_v5, "CX"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "d")))}, {"y": _S.invoke(_S.read(_v5, "Math"), "min", [_S.unary("-", 3), _S.binary("+", _S.read(_v5, "CY"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "d")))])}, {"t": _S.read(_v5, "t")}, {"seed": _S.invoke(_S.read(_v5, "R"), "int", [0, 1000000])}])])
		_S.write(_v2, "phase", _S.binary("*", _S.binary("+", 1.5, _S.binary("*", 11, _S.read(_v2, "e"))), _S.read(_v2, "dt")), "+=", false)
		if _S.truth(_S.binary(">=", _S.read(_v2, "phase"), 1)):
			_S.last([_S.write(_v2, "phase", 1, "-=", false), _S.invoke(_S.read(_v2, "beats"), "push", [_S.read(_v2, "t")])])
		if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [_S.binary("*", _S.binary("*", 4, _S.read(_v2, "e")), _S.read(_v2, "dt"))])):
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STAR"), _S.binary("+", _S.read(_v2, "CX"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 14), 14])), _S.binary("+", _S.read(_v2, "CY"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 14), 10])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v2, "R"), "range", [0.2, 0.35]), _S.prop(_S.read(_v2, "C"), 6), _S.invoke(_S.read(_v2, "R"), "range", [1, 2])])
	else:
		if _S.truth(_S.unary("!", _S.read(_e, "released"))):
			var _v6 = _S.scope(_e)
			_S.write(_v6, "released", true, "=", false)
			_S.invoke(_S.read(_v6, "lights"), "add", [_S.read(_v6, "CX"), _S.read(_v6, "CY"), 110, _S.prop(_S.read(_v6, "C"), 4), 0.8, 0.5])
			_S.invoke(_S.read(_v6, "lights"), "add", [_S.read(_v6, "CX"), _S.read(_v6, "CY"), 28, _S.read(_v6, "WHITE"), 0.6, 0.08])
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v7, "i"), 70)):
				var _v8 = _S.scope(_v7)
				_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
				_S.define(_v8, "sp", _S.binary("*", _S.invoke(_S.read(_v8, "R"), "range", [140, 330]), (0.55 if _S.truth(_S.binary(">", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), 0.4)) else 1)))
				_S.invoke(_S.read(_v8, "ps"), "spawn", [(_S.prop(_S.read(_v8, "P"), "MOTE") if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.unary("-", 0.2)), func(): return _S.invoke(_S.read(_v8, "R"), "chance", [0.35]))) else _S.prop(_S.read(_v8, "P"), "SPARK")), _S.read(_v8, "CX"), _S.read(_v8, "CY"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.invoke(_S.read(_v8, "R"), "range", [0.25, 0.55]), _S.invoke(_S.read(_v8, "R"), "pick", [[_S.prop(_S.read(_v8, "C"), 7), _S.prop(_S.read(_v8, "C"), 6), _S.prop(_S.read(_v8, "C"), 5)]]), _S.invoke(_S.read(_v8, "R"), "range", [0.8, 1.4])])
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "i", 1, "+=", true)
			var _v9 = _S.scope(_v6)
			_S.define(_v9, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v9, "i"), 10)):
				var _v10 = _S.scope(_v9)
				_S.define(_v10, "a", _S.invoke(_S.read(_v10, "R"), "range", [0, _S.read(_v10, "TAU")]))
				_S.define(_v10, "sp", _S.invoke(_S.read(_v10, "R"), "range", [60, 160]))
				_S.invoke(_S.read(_v10, "ps"), "spawn", [_S.prop(_S.read(_v10, "P"), "STAR"), _S.read(_v10, "CX"), _S.read(_v10, "CY"), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "cos", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.binary("*", _S.invoke(_S.read(_v10, "Math"), "sin", [_S.read(_v10, "a")]), _S.read(_v10, "sp")), _S.invoke(_S.read(_v10, "R"), "range", [0.4, 0.8]), (_S.prop(_S.read(_v10, "C"), 6) if _S.truth(_S.invoke(_S.read(_v10, "R"), "chance", [0.5])) else _S.prop(_S.read(_v10, "C"), 5)), _S.invoke(_S.read(_v10, "R"), "range", [1.2, 2.4])])
				_v9 = _S.iteration(_v9)
				_S.write(_v9, "i", 1, "+=", true)
			var _v11 = _S.scope(_v6)
			_S.define(_v11, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v11, "i"), 4)):
				_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "SMOKE"), _S.binary("+", _S.read(_v11, "CX"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 5), 5])), _S.binary("+", _S.read(_v11, "CY"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 4), 4])), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [8, 18])), _S.invoke(_S.read(_v11, "R"), "range", [0.6, 0.85]), _S.call_value(_S.read(_v11, "mix"), [_S.read(_v11, "ASH"), _S.prop(_S.read(_v11, "C"), 4), 0.3]), _S.invoke(_S.read(_v11, "R"), "range", [3, 5]), _S.invoke(_S.read(_v11, "R"), "range", [0.05, 0.15])])
				_v11 = _S.iteration(_v11)
				_S.write(_v11, "i", 1, "+=", true)
	_S.write(_e, "beats", _S.invoke(_S.read(_e, "beats"), "filter", [_S.function_value(_e, "_f7")]), "=", false)
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", _S.binary("-", _S.prop(_S.read(_v12, "arcs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v12, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v12, "t"), _S.prop(_S.prop(_S.read(_v12, "arcs"), _S.read(_v12, "i")), "t")), 0.07)):
			_S.invoke(_S.read(_v12, "arcs"), "splice", [_S.read(_v12, "i"), 1])
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_b_b0 = _S.arg(_args,0)
	return ((_n_t - _n_b_b0) < 0.22)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_level = _S.read(_parent,"level")
	var _n_t = _S.read(_parent,"t")
	var _n_REL = _S.read(_parent,"REL")
	var _n_CX = _S.read(_parent,"CX")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_level,[])
	if _S.truth((_n_t < _n_REL)):
		_S.invoke(_n_p_b0,"glow",[(_n_CX * 0.5), (-3), 40, _S.index_value(_n_C,3), ((0.3 * _n_k_b1) * _n_k_b1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_level = _S.read(_parent,"level")
	var _n_t = _S.read(_parent,"t")
	var _n_o = _S.read(_parent,"o")
	var _n_REL = _S.read(_parent,"REL")
	var _n_CX = _S.read(_parent,"CX")
	var _n_CY = _S.read(_parent,"CY")
	var _n_phase = _S.read(_parent,"phase")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_edgeOf = _S.read(_parent,"edgeOf")
	var _n_ease = _S.read(_parent,"ease")
	var _n_beats = _S.read(_parent,"beats")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_arcs = _S.read(_parent,"arcs")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_BK = _S.read(_parent,"BK")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_bolts = _S.read(_parent,"bolts")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.call_value(_n_level,[])
	var _n_e_b2 = (_n_k_b1 * _n_k_b1)
	var _n_f_b3 = floori(((_n_t * 30) + 0.0001))
	var _n_A_b4 = _S.named_value(_n_o,"actor")
	if _S.truth((_n_t < _n_REL)):
		var _n_jit_b5 = (((1 if _S.truth(fmod(_n_f_b3,2)) else (-1)) * (float((_n_k_b1 - 0.85))/0.15)) if _S.truth((_n_k_b1 > 0.85)) else 0)
		var _n_x_b6 = (_n_CX + _n_jit_b5)
		var _n_y_b7 = _n_CY
		var _n_pr_b8 = (0.5 + (0.5 * sin((_n_phase * _n_TAU))))
		for _iter_0 in _S.array(_S.call_value(_n_edgeOf,[_n_A_b4])):
			var _tuple_1 = _iter_0
			var _n_ex_b10 = _S.prop(_tuple_1,0)
			var _n_ey_b11 = _S.prop(_tuple_1,1)
			var _n_d_b12 = _S.Bridge.hypot([((_n_ex_b10 + 0.5) - _n_x_b6), ((_n_ey_b11 + 0.5) - _n_y_b7)])
			if _S.truth(((_n_e_b2 > 0.08) if _S.truth((_n_d_b12 < (6 + (10 * _n_k_b1)))) else (_n_d_b12 < (6 + (10 * _n_k_b1))))):
				_S.invoke(_n_p_b0,"px",[_n_ex_b10, _n_ey_b11, (_S.index_value(_n_C,6) if _S.truth(((_n_e_b2 > 0.4) if _S.truth((_n_d_b12 < (4 + (6 * _n_k_b1)))) else (_n_d_b12 < (4 + (6 * _n_k_b1))))) else _S.index_value(_n_C,4))])
		for _iter_2 in _S.array(_n_beats):
			var _n_b_b13 = _iter_2
			var _n_q_b14 = (float((_n_t - _n_b_b13))/0.22)
			_S.invoke(_n_p_b0,"ring",[_n_x_b6, _n_y_b7, (4 + ((20 * (1 - _S.invoke(_n_ease,"inQuad",[_n_q_b14]))) * (0.5 + _n_k_b1))), 1, (_S.index_value(_n_C,6) if _S.truth((_n_q_b14 > 0.6)) else _S.index_value(_n_C,4)), (0.4 + (0.6 * _n_q_b14))])
		for _iter_3 in _S.array(_n_arcs):
			var _n_a_b15 = _iter_3
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_S.MathFX.rng([_S.named_value(_n_a_b15,"seed"),_n_f_b3]), _S.named_value(_n_a_b15,"x"), _S.named_value(_n_a_b15,"y"), _n_x_b6, _n_y_b7, 0.35, 0.4]), 0.85, _n_C, 0.4])
		var _n_r_b9 = ((1.2 + (6.5 * _n_e_b2)) + (_n_pr_b8 * (0.5 + (1.2 * _n_k_b1))))
		_S.invoke(_n_p_b0,"circle",[_n_x_b6, _n_y_b7, (_n_r_b9 + 1.3), _S.index_value(_n_C,2)])
		_S.invoke(_n_p_b0,"circle",[_n_x_b6, _n_y_b7, _n_r_b9, _S.index_value(_n_C,4)])
		_S.invoke(_n_p_b0,"circle",[(_n_x_b6 - (_n_r_b9 * 0.12)), (_n_y_b7 - (_n_r_b9 * 0.12)), (_n_r_b9 * 0.7), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b0,"circle",[_n_x_b6, _n_y_b7, (_n_r_b9 * 0.38), _n_WHITE])
		if _S.truth((_n_r_b9 > 3)):
			for _iter_4 in _S.array([0, PI]):
				var _n_s_b16 = _iter_4
				if true:
					var _n_a_b17 = 0
					while _S.truth((_n_a_b17 < 1.3)):
						var _n_ang_b18 = (((_n_t * 10) + _n_s_b16) + _n_a_b17)
						var _n_rr_b19 = (_n_r_b9 * (0.62 + (0.1 * sin((_n_a_b17 * 3)))))
						_S.invoke(_n_p_b0,"dot",[(_n_x_b6 + (cos(_n_ang_b18) * _n_rr_b19)), (_n_y_b7 + (sin(_n_ang_b18) * _n_rr_b19)), (_n_WHITE if _S.truth((_n_a_b17 < 0.5)) else _S.index_value(_n_C,6))])
						_n_a_b17 += 0.12
		if _S.truth((_n_k_b1 > 0.35)):
			var _n_q_b20 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),5,_n_f_b3])
			var _n_a_b21 = _S.invoke(_n_q_b20,"range",[0, _n_TAU])
			var _n_l_b22 = (_S.invoke(_n_q_b20,"range",[3, 6]) * (0.5 + _n_k_b1))
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_q_b20, (_n_x_b6 + (cos(_n_a_b21) * _n_r_b9)), (_n_y_b7 + (sin(_n_a_b21) * _n_r_b9)), (_n_x_b6 + (cos(_n_a_b21) * (_n_r_b9 + _n_l_b22))), (_n_y_b7 + (sin(_n_a_b21) * (_n_r_b9 + _n_l_b22))), 0.4, 0.3]), 0.7, _n_C, 0.3])
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, (12 + (30 * _n_k_b1)), _S.index_value(_n_C,4), (0.35 + (0.45 * _n_k_b1))])
		_S.invoke(_n_p_b0,"glow",[_n_x_b6, _n_y_b7, (6 + (6 * _n_k_b1)), _S.index_value(_n_C,6), (0.25 + (0.3 * _n_k_b1))])
	else:
		var _n_a_b23 = (_n_t - _n_REL)
		if _S.truth((_n_a_b23 < 0.07)):
			_S.invoke(_n_p_b0,"mask",[_S.named_value(_n_A_b4,"mask"), _S.named_value(_n_A_b4,"x"), _S.named_value(_n_A_b4,"y"), (_n_WHITE if _S.truth((_n_a_b23 < 0.035)) else _S.index_value(_n_C,6))])
		if _S.truth((_n_a_b23 < 0.22)):
			var _n_q_b25 = (float(_n_a_b23)/0.22)
			_S.call_value(_n_flare,[_n_p_b0, _n_CX, _n_CY, (46 * pow((1 - _n_q_b25),1.4)), (1 - _n_q_b25), _n_C])
			if _S.truth((_n_q_b25 < 0.3)):
				_S.invoke(_n_p_b0,"circle",[_n_CX, _n_CY, ((12 * (1 - (_n_q_b25 * 2.5))) + 1.5), _n_WHITE])
		for _iter_5 in _S.array(_S.invoke(_n_bolts,"entries",[])):
			var _tuple_6 = _iter_5
			var _n_i_b26 = _S.prop(_tuple_6,0)
			var _n_b_b27 = _S.prop(_tuple_6,1)
			var _n_ba_b28 = floori((((_n_t - _S.named_value(_n_b_b27,"t0")) * 30) + 0.0001))
			if _S.truth(((_n_t < _S.named_value(_n_b_b27,"t0")) if _S.truth((_n_t < _S.named_value(_n_b_b27,"t0"))) else (_n_ba_b28 >= _S.prop(_n_BK,"length")))):
				continue
			_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_zigzag,[_S.MathFX.rng([_S.named_value(_n_o,"seed"),3,_n_i_b26,_S.binary(">>",_n_ba_b28,1)]), _n_CX, _n_CY, _S.named_value(_n_b_b27,"x1"), _S.named_value(_n_b_b27,"y1"), 0.25, 0.75]), _S.index_value(_n_BK,_n_ba_b28), _n_C, (0.95 if _S.truth(_S.binary("===",_n_ba_b28,0)) else 0.75), {"hero":_S.binary("===",_n_ba_b28,0)}])
			if _S.truth((_S.named_value(_n_b_b27,"y1") > (-1))):
				_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_b_b27,"x1"), (-3), 18, _S.index_value(_n_C,5), (0.5 * _S.index_value(_n_BK,_n_ba_b28))])
		var _n_q_b24 = (float(_n_a_b23)/0.45)
		if _S.truth((_n_q_b24 < 1)):
			var _n_r_b29 = (8 + (80 * _S.invoke(_n_ease,"outCubic",[_n_q_b24])))
			var _n_hide_b30 = _S.function_value(_S.capture(_parent,{"q":_n_q_b24,"this":_this}),"_f10")
			_S.invoke(_n_p_b0,"ring",[_n_CX, _n_CY, _n_r_b29, maxf(1,(3 * (1 - _n_q_b24))), (_n_WHITE if _S.truth((_n_q_b24 < 0.25)) else _S.index_value(_n_C,5)), _S.call_value(_n_hide_b30,[_n_r_b29])])
			var _n_r2_b31 = (6 + (56 * _S.invoke(_n_ease,"outCubic",[minf(1,(_n_q_b24 * 1.3))])))
			_S.invoke(_n_p_b0,"ring",[_n_CX, _n_CY, _n_r2_b31, 1, _S.index_value(_n_C,4), _S.function_value(_S.capture(_parent,{"r2":_n_r2_b31,"q":_n_q_b24,"this":_this}),"_f12")])
			_S.invoke(_n_p_b0,"glow",[_n_CX, (_n_CY - 6), minf((_n_r_b29 * 0.9),46), _S.index_value(_n_C,3), ((0.42 * (1 - _n_q_b24)) * (1 - _n_q_b24))])
		if _S.truth(((_n_a_b23 < 0.5) if _S.truth((_n_a_b23 > 0.15)) else (_n_a_b23 > 0.15))):
			var _n_qq_b32 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),8,_n_f_b3])
			var _n_ang_b33 = _S.invoke(_n_qq_b32,"range",[0, _n_TAU])
			var _n_l_b34 = _S.invoke(_n_qq_b32,"range",[5, 10])
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_qq_b32, _n_CX, _n_CY, (_n_CX + (cos(_n_ang_b33) * _n_l_b34)), (_n_CY + (sin(_n_ang_b33) * _n_l_b34)), 0.45, 0.3]), ((0.8 * (1 - (float((_n_a_b23 - 0.15))/0.35))) + 0.15), _n_C, 0.3])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_rr_b0 = _S.arg(_args,0)
	return _S.function_value(_S.capture(_parent,{"rr":_n_rr_b0,"this":_n_this}),"_f11")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_rr = _S.read(_parent,"rr")
	var _n_q = _S.read(_parent,"q")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_CY + (sin(_n_g_b1) * _n_rr)) > (-1))) else (1.1 - _n_q))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_r2 = _S.read(_parent,"r2")
	var _n_q = _S.read(_parent,"q")
	var _n_v_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.arg(_args,1)
	return (0 if _S.truth(((_n_CY + (sin(_n_g_b1) * _n_r2)) > (-1))) else (0.8 - _n_q))
	return null
