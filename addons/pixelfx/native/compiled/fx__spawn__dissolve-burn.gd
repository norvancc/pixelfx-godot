@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/dissolve-burn.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Dissolve burn"}, {"desc": "An ember seam lights at the feet and climbs the body: above it the body scorches and smoulders, at it flames lick up, below it there's only falling ash, embers and smoke."}, {"tags": ["spawn", "death", "burn", "fire", "ash", "dissolve", "embers", "one-shot"]}, {"size": [96, 112]}, {"origin": [48, 100]}, {"duration": 3.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#2a0e08", "#5a1a0c", "#a8320f", "#e8601a", "#ff9a2e", "#ffd25a", "#fff3c0", "#ffffff"]}, {"ash": ["#2a2428", "#4a4248", "#6e6670"]}, {"seed": 16}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "WRITHE", _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 13)}, {"fy": _S.unary("-", 35)}, {"bx": 13}, {"by": _S.unary("-", 26)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.16), _S.read(_e, "READY")], [0.4, _S.merge([{"turn": 1}, {"crouch": 2}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 22)}, {"bx": 10}, {"by": _S.unary("-", 22)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [0.8, _S.read(_e, "WRITHE")], [1.2, _S.merge([_S.read(_e, "WRITHE"), {"lean": 2}, {"fy": _S.unary("-", 26)}, {"by": _S.unary("-", 36)}])], [1.6, _S.merge([_S.read(_e, "WRITHE"), {"lean": _S.unary("-", 2)}, {"fy": _S.unary("-", 36)}, {"by": _S.unary("-", 26)}])], [2.1, _S.merge([_S.read(_e, "WRITHE"), {"crouch": 5}, {"lean": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 38)}, {"bx": 9}, {"by": _S.unary("-", 38)}])], [3.6, _S.merge([_S.read(_e, "WRITHE"), {"crouch": 6}, {"lean": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 36)}, {"bx": 9}, {"by": _S.unary("-", 36)}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "IGNITE", 0.15)
	_S.define(_e, "BURN", 1.9)
	_S.define(_e, "CHAR", [_S.call_value(_S.read(_e, "hex"), ["#100908"]), _S.call_value(_S.read(_e, "hex"), ["#22130e"]), _S.call_value(_S.read(_e, "hex"), ["#3a2016"])])
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f9"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "tongue", _S.function_value(_e, "_f1"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "A", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ash"), 3]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "H", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "cx", 0)
	for _v7 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
		var _v8 = _S.scope(_e)
		_S.define(_v8, "b", _v7)
		var _v9 = _S.scope(_v8)
		_S.set_prop(_S.read(_v9, "b"), "key", _S.binary("-", _S.binary("+", _S.binary("+", _S.binary("/", _S.binary("-", _S.binary("-", _S.prop(_S.read(_v9, "body"), "h"), 1), _S.prop(_S.read(_v9, "b"), "my")), _S.read(_v9, "H")), _S.binary("*", 0.08, _S.binary("-", _S.call_value(_S.read(_v9, "rand"), [_S.prop(_S.read(_v9, "b"), "mx"), _S.prop(_S.read(_v9, "b"), "my"), 3]), 0.5))), _S.binary("*", 0.06, _S.call_value(_S.read(_v9, "noise"), [_S.binary("*", _S.prop(_S.read(_v9, "b"), "mx"), 0.35), 4]))), (0.02 if _S.truth(_S.prop(_S.read(_v9, "b"), "edge")) else 0)), "=", false)
		_S.set_prop(_S.read(_v9, "b"), "gone", false, "=", false)
	_S.define(_e, "front", _S.function_value(_e, "_f3"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "left", _S.function_value(_e, "_f4"))
	_S.define(_e, "tongues", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f5")]))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_h_b3 = _S.arg(_args,3)
	var _n_n_b4 = _S.arg(_args,4)
	for _iter_0 in _S.array([[1, 1, _S.index_value(_n_C,3)], [0.7, 0.8, _S.index_value(_n_C,4)], [0.45, 0.6, _S.index_value(_n_C,5)], [0.25, 0.35, _S.index_value(_n_C,6)]]):
		var _tuple_1 = _iter_0
		var _n_lw_b5 = _S.prop(_tuple_1,0)
		var _n_lh_b6 = _S.prop(_tuple_1,1)
		var _n_c_b7 = _S.prop(_tuple_1,2)
		var _n_Hh_b8 = (_n_h_b3 * _n_lh_b6)
		if true:
			var _n_r_b9 = 0
			while _S.truth((_n_r_b9 <= _n_Hh_b8)):
				var _n_u_b10 = (float(_n_r_b9)/maxf(1,_n_Hh_b8))
				var _n_half_b11 = (((1.8 * _n_lw_b5) * pow((1 - _n_u_b10),0.9)) + (_S.MathFX.noise(((_n_t * 9) + (_n_r_b9 * 0.5)),_n_n_b4) * 0.4))
				var _n_cxr_b12 = (_n_x_b1 + ((_S.MathFX.noise(((_n_t * 4) + (_n_r_b9 * 0.25)),(_n_n_b4 + 7)) * _n_u_b10) * 1.6))
				if _S.truth((_n_half_b11 < 0.3)):
					_n_r_b9 += 1.0
					continue
				if true:
					var _n_px_b13 = floori((_n_cxr_b12 - _n_half_b11)+0.5)
					while _S.truth((_n_px_b13 <= floori((_n_cxr_b12 + _n_half_b11)+0.5))):
						_S.invoke(_n_p_b0,"px",[_n_px_b13, floori((_n_y_b2 - _n_r_b9)+0.5), _n_c_b7])
						_n_px_b13 += 1.0
				_n_r_b9 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_IGNITE = _S.read(_parent,"IGNITE")
	var _n_BURN = _S.read(_parent,"BURN")
	var _n_t_b0 = _S.arg(_args,0)
	return ((-0.04) + (1.1 * _S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t_b0 - _n_IGNITE))/_n_BURN),0.0,1.0)])))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return maxf(0.05,minf(_S.invoke(_n_R,"range",[_n_a_b0, _n_b_b1]),((_S.named_value(_n_meta,"duration") - 0.1) - _n_t)))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"x":(((-9) + (_n_i_b1 * 3.6)) + (_S.MathFX.rand([_n_i_b1,1]) * 1.5)),"h":(6 + (_S.MathFX.rand([_n_i_b1,2]) * 6)),"s":(_n_i_b1 * 13)}
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "f", _S.call_value(_S.read(_e, "front"), [_S.read(_e, "t")]))
	for _v10 in _S.array(_S.prop(_S.read(_e, "body"), "list")):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "b", _v10)
		var _v12 = _S.scope(_v11)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v12, "b"), "gone"), func(): return _S.binary(">=", _S.prop(_S.read(_v12, "b"), "key"), _S.read(_v12, "f")))):
			continue
		_S.set_prop(_S.read(_v12, "b"), "gone", true, "=", false)
		_S.define(_v12, "r", _S.invoke(_S.read(_v12, "R"), "next", []))
		if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.2)):
			var _v13 = _S.scope(_v12)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v13, "b"), "y"), _S.unary("-", 7))):
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "GRIT"), _S.prop(_S.read(_v13, "b"), "x"), _S.prop(_S.read(_v13, "b"), "y"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 12), 12]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 20), 0]), _S.call_value(_S.read(_v13, "left"), [0.6, 1.2]), _S.invoke(_S.read(_v13, "R"), "pick", [_S.read(_v13, "A")]), 1])
			else:
				_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "FLAKE"), _S.prop(_S.read(_v13, "b"), "x"), _S.prop(_S.read(_v13, "b"), "y"), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", 8), 4]), _S.call_value(_S.read(_v13, "left"), [0.5, _S.invoke(_S.read(_v13, "Math"), "min", [1.5, _S.binary("/", _S.unary("-", _S.prop(_S.read(_v13, "b"), "y")), 18)])]), _S.invoke(_S.read(_v13, "R"), "pick", [_S.read(_v13, "A")]), (1.4 if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.2])) else 1)])
		else:
			if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.32)):
				_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "EMBER"), _S.prop(_S.read(_v12, "b"), "x"), _S.prop(_S.read(_v12, "b"), "y"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [15, 45])), _S.call_value(_S.read(_v12, "left"), [0.6, 1.4]), _S.prop(_S.read(_v12, "C"), 5), _S.invoke(_S.read(_v12, "R"), "range", [1, 1.6])])
			else:
				if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.46)):
					_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "FIRE"), _S.prop(_S.read(_v12, "b"), "x"), _S.prop(_S.read(_v12, "b"), "y"), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [14, 30])), _S.invoke(_S.read(_v12, "R"), "range", [0.2, 0.42]), 0, _S.invoke(_S.read(_v12, "R"), "range", [1.2, 2.2]), 0, (_S.prop(_S.read(_v12, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v12, "R"), "chance", [0.5])) else 0)])
				else:
					if _S.truth(_S.binary("<", _S.read(_v12, "r"), 0.5)):
						_S.invoke(_S.read(_v12, "ps"), "spawn", [_S.prop(_S.read(_v12, "P"), "SMOKE"), _S.prop(_S.read(_v12, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v12, "b"), "y"), 2), _S.invoke(_S.read(_v12, "R"), "range", [_S.unary("-", 5), 5]), _S.unary("-", _S.invoke(_S.read(_v12, "R"), "range", [14, 26])), _S.call_value(_S.read(_v12, "left"), [1.2, 2]), _S.call_value(_S.read(_v12, "mix"), [_S.prop(_S.read(_v12, "A"), 1), _S.prop(_S.read(_v12, "C"), 1), 0.3]), _S.invoke(_S.read(_v12, "R"), "range", [2, 3.4])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "IGNITE")), func(): return _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt")), _S.read(_e, "IGNITE")))):
		var _v14 = _S.scope(_e)
		_S.invoke(_S.read(_v14, "lights"), "add", [0, _S.unary("-", 4), 34, _S.prop(_S.read(_v14, "C"), 4), 0.8, 0.4])
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 10)):
			_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "SPARK"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 1), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 80), 80]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [40, 150])), _S.invoke(_S.read(_v15, "R"), "range", [0.2, 0.5])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "f"), 0), func(): return _S.binary("<", _S.read(_e, "f"), 1.02))):
		var _v16 = _S.scope(_e)
		_S.define(_v16, "fy", _S.binary("+", _S.prop(_S.read(_v16, "body"), "y"), _S.binary("*", _S.binary("-", 1, _S.call_value(_S.read(_v16, "clamp"), [_S.read(_v16, "f")])), _S.read(_v16, "H"))))
		if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.34])):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "SMOKE"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 7), 7]), _S.binary("-", _S.read(_v16, "fy"), 5), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [16, 30])), _S.call_value(_S.read(_v16, "left"), [1.4, 2.4]), _S.call_value(_S.read(_v16, "mix"), [_S.prop(_S.read(_v16, "A"), 1), _S.prop(_S.read(_v16, "C"), 3), 0.35]), _S.invoke(_S.read(_v16, "R"), "range", [2.6, 4.2])])
		if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.5])):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "FIRE"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_v16, "fy"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [18, 34])), _S.invoke(_S.read(_v16, "R"), "range", [0.18, 0.36]), 0, _S.invoke(_S.read(_v16, "R"), "range", [1.2, 2.4]), 0, (_S.prop(_S.read(_v16, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.35])) else 0)])
		if _S.truth(_S.invoke(_S.read(_v16, "R"), "chance", [0.15])):
			_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "EMBER"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 9), 9]), _S.read(_v16, "fy"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [30, 70])), _S.call_value(_S.read(_v16, "left"), [0.8, 1.6]), _S.prop(_S.read(_v16, "C"), 5), 1.4])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_IGNITE = _S.read(_parent,"IGNITE")
	var _n_t = _S.read(_parent,"t")
	var _n_BURN = _S.read(_parent,"BURN")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (_S.MathFX.smooth(0,(_n_IGNITE + 0.2),_n_t) * (1 - _S.MathFX.smooth((_n_IGNITE + (_n_BURN * 0.6)),((_n_IGNITE + _n_BURN) + 0.4),_n_t)))
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 30, _S.index_value(_n_C,4), (0.3 * _n_k_b1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_front = _S.read(_parent,"front")
	var _n_t = _S.read(_parent,"t")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_CHAR = _S.read(_parent,"CHAR")
	var _n_body = _S.read(_parent,"body")
	var _n_H = _S.read(_parent,"H")
	var _n_tongue = _S.read(_parent,"tongue")
	var _n_tongues = _S.read(_parent,"tongues")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.call_value(_n_front,[_n_t])
	var _n_fr_b2 = floori((_n_t * 30))
	for _iter_0 in _S.array(_S.named_value(_n_body,"list")):
		var _n_b_b3 = _iter_0
		if _S.truth(_S.named_value(_n_b_b3,"gone")):
			continue
		var _n_d_b4 = (_S.named_value(_n_b_b3,"key") - _n_f_b1)
		var _n_c_b5 = null
		if _S.truth((_n_d_b4 < 0.025)):
			_n_c_b5 = (_n_WHITE if _S.truth((_S.MathFX.rand([_S.named_value(_n_b_b3,"mx"),_S.named_value(_n_b_b3,"my"),_n_fr_b2]) < 0.35)) else _S.index_value(_n_C,6))
		else:
			if _S.truth((_n_d_b4 < 0.05)):
				_n_c_b5 = (_S.index_value(_n_C,5) if _S.truth((_S.MathFX.rand([_S.named_value(_n_b_b3,"mx"),_S.named_value(_n_b_b3,"my"),(_n_fr_b2 + 7)]) < 0.5)) else _S.index_value(_n_C,4))
			else:
				if _S.truth((_n_d_b4 < 0.11)):
					_n_c_b5 = (_S.index_value(_n_C,3) if _S.truth(_S.logical("&&",(_S.MathFX.rand([_S.named_value(_n_b_b3,"mx"),_S.named_value(_n_b_b3,"my"),13]) < 0.15),func():return (_S.MathFX.rand([_S.named_value(_n_b_b3,"mx"),_n_fr_b2,2]) < 0.6))) else _S.index_value(_n_CHAR,(0 if _S.truth((_n_d_b4 < 0.075)) else 1)))
				else:
					if _S.truth((_n_d_b4 < 0.16)):
						_n_c_b5 = _S.ColorFX.mix(_S.named_value(_n_b_b3,"c"),_S.index_value(_n_CHAR,2),0.6)
					else:
						if _S.truth((_n_d_b4 < 0.26)):
							_n_c_b5 = _S.ColorFX.mix(_S.named_value(_n_b_b3,"c"),_S.index_value(_n_C,2),0.18)
						else:
							_n_c_b5 = _S.named_value(_n_b_b3,"c")
		_S.invoke(_n_p_b0,"px",[_S.named_value(_n_b_b3,"x"), _S.named_value(_n_b_b3,"y"), _n_c_b5])
	if _S.truth(((_n_f_b1 < 1.05) if _S.truth((_n_f_b1 > (-0.02))) else (_n_f_b1 > (-0.02)))):
		var _n_fy_b6 = (_S.named_value(_n_body,"y") + ((1 - clampf(_n_f_b1,0.0,1.0)) * _n_H))
		var _n_k_b7 = (1 - _S.MathFX.smooth(0.95,1.05,_n_f_b1))
		for _iter_1 in _S.array(_n_tongues):
			var _n_g_b9 = _iter_1
			var _n_row_b10 = floori((_n_fy_b6 - _S.named_value(_n_body,"y"))+0.5)
			var _n_mx_b11 = floori((_S.named_value(_n_g_b9,"x") - _S.named_value(_n_body,"x"))+0.5)
			if _S.truth(not _S.truth(_S.invoke(_n_body,"on",[_n_mx_b11, minf((_n_H - 1),maxf(0,_n_row_b10))]))):
				continue
			var _n_h_b12 = (((_S.named_value(_n_g_b9,"h") * _n_k_b7) * (0.6 + (0.6 * ((_S.MathFX.noise(((_n_t * 2.6) + _S.named_value(_n_g_b9,"s")),_S.named_value(_n_g_b9,"s")) * 0.5) + 0.5)))) * _S.MathFX.smooth((-0.02),0.06,_n_f_b1))
			if _S.truth((_n_h_b12 >= 1)):
				_S.call_value(_n_tongue,[_n_p_b0, _S.named_value(_n_g_b9,"x"), (_n_fy_b6 + 1), _n_h_b12, _S.named_value(_n_g_b9,"s")])
		var _n_fl_b8 = (0.85 + (0.15 * _S.MathFX.noise((_n_t * 11),9)))
		_S.invoke(_n_p_b0,"glowLine",[(-11), _n_fy_b6, 11, _n_fy_b6, 9, _S.index_value(_n_C,4), (0.45 * _n_k_b7)])
		_S.invoke(_n_p_b0,"glow",[0, (_n_fy_b6 - 6), 56, _S.index_value(_n_C,4), ((0.38 * _n_k_b7) * _n_fl_b8)])
		_S.invoke(_n_p_b0,"glow",[0, (_n_fy_b6 - 2), 18, _S.index_value(_n_C,5), ((0.28 * _n_k_b7) * _n_fl_b8)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	return 0
	return null
