@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/blink-out.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "shades", _S.import_value("fx/arcane/_lib.js", "shades"))
	_S.define(_e, "squeezed", _S.import_value("fx/arcane/_lib.js", "squeezed"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "OUT", 0.32)
	_S.define(_e, "SQUEEZE", 0.12)
	_S.define(_e, "COLLAPSE", 0.08)
	_S.define(_e, "POP", _S.binary("+", _S.binary("+", _S.read(_e, "OUT"), _S.read(_e, "SQUEEZE")), _S.read(_e, "COLLAPSE")))
	_S.define(_e, "meta", _S.merge([{"name": "Blink out"}, {"desc": "The caster crackles with gathering light, flashes white, squeezes into a line of light that collapses and pops away in sparks."}, {"tags": ["arcane", "blink", "teleport", "vanish", "movement", "magic", "one-shot"]}, {"size": [136, 96]}, {"origin": [68, 80]}, {"duration": 1.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 11}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "IN", _S.merge([{"turn": 1}, {"crouch": 4}, {"fx": _S.unary("-", 2)}, {"fy": _S.unary("-", 25)}, {"bx": 2}, {"by": _S.unary("-", 25)}, {"armsFront": true}, {"ffx": 0}, {"fbx": 2}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.36), _S.read(_e, "READY")], [_S.unary("-", 0.1), _S.read(_e, "IN")], [0.2, _S.merge([_S.read(_e, "IN"), {"crouch": 5}])], [0.32, _S.merge([_S.read(_e, "IN"), {"crouch": 0}]), "snap"], [1.6, _S.merge([_S.read(_e, "IN"), {"crouch": 0}])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f8"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "sh", _S.call_value(_S.read(_e, "shades"), [_S.read(_e, "A")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "mx", _S.binary("+", _S.prop(_S.read(_e, "A"), "x"), _S.binary("/", _S.prop(_S.read(_e, "A"), "w"), 2)))
	_S.define(_e, "my", _S.binary("+", _S.prop(_S.read(_e, "A"), "y"), _S.binary("*", _S.prop(_S.read(_e, "A"), "h"), 0.55)))
	_S.define(_e, "COLS", [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)])
	_S.define(_e, "inside", _S.function_value(_e, "_f2"))
	_S.define(_e, "t", 0)
	_S.define(_e, "out", false)
	_S.define(_e, "popped", false)
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f6")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((_n_y_b1 * _S.named_value(_n_A,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "OUT"), 0.04)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.7]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")]))
		_S.define(_v0, "D", _S.invoke(_S.read(_v0, "R"), "range", [22, 44]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.12, 0.18]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.define(_v0, "x", _S.binary("+", _S.read(_v0, "mx"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")]), _S.read(_v0, "D"))))
		_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v0, "my"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), _S.read(_v0, "D")))]))
		_S.define(_v0, "l", _S.logical("||", _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.binary("-", _S.read(_v0, "x"), _S.read(_v0, "mx")), _S.binary("-", _S.read(_v0, "y"), _S.read(_v0, "my"))]), func(): return 1))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.read(_v0, "x"), _S.read(_v0, "y"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "mx"), _S.read(_v0, "x")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "my"), _S.read(_v0, "y")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "out")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OUT")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "out", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.binary("-", _S.read(_v1, "my"), 6), 54, _S.prop(_S.read(_v1, "C"), 5), 0.9, 0.3])
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.read(_v1, "my"), 26, _S.read(_v1, "WHITE"), 0.8, 0.1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "popped", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "mx"), _S.binary("-", _S.read(_v2, "my"), 6), 58, _S.prop(_S.read(_v2, "C"), 5), 0.9, 0.35])
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.read(_v2, "mx"), _S.read(_v2, "my"), 24, _S.read(_v2, "WHITE"), 0.9, 0.08])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 110)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "y", _S.binary("+", _S.prop(_S.read(_v4, "A"), "y"), _S.invoke(_S.read(_v4, "R"), "range", [2, _S.binary("-", _S.prop(_S.read(_v4, "A"), "h"), 2)])))
			_S.define(_v4, "s", _S.invoke(_S.read(_v4, "R"), "sign", []))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "EMBER"), _S.binary("+", _S.read(_v4, "mx"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 1), 1])), _S.read(_v4, "y"), _S.binary("*", _S.read(_v4, "s"), _S.invoke(_S.read(_v4, "R"), "range", [25, 105])), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 70), 10]), _S.invoke(_S.read(_v4, "R"), "range", [0.5, 0.95]), _S.invoke(_S.read(_v4, "R"), "pick", [_S.read(_v4, "COLS")]), (2 if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.3])) else 1)])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
		var _v5 = _S.scope(_v2)
		_S.define(_v5, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), 18)):
			var _v6 = _S.scope(_v5)
			_S.define(_v6, "a", _S.invoke(_S.read(_v6, "R"), "range", [0, _S.read(_v6, "TAU")]))
			_S.define(_v6, "sp", _S.invoke(_S.read(_v6, "R"), "range", [80, 240]))
			_S.invoke(_S.read(_v6, "ps"), "spawn", [_S.prop(_S.read(_v6, "P"), "SPARK"), _S.read(_v6, "mx"), _S.read(_v6, "my"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "sp")), 40), _S.invoke(_S.read(_v6, "R"), "range", [0.2, 0.5])])
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
		var _v7 = _S.scope(_v2)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 14)):
			var _v8 = _S.scope(_v7)
			_S.define(_v8, "a", _S.invoke(_S.read(_v8, "R"), "range", [0, _S.read(_v8, "TAU")]))
			_S.define(_v8, "sp", _S.invoke(_S.read(_v8, "R"), "range", [20, 110]))
			_S.invoke(_S.read(_v8, "ps"), "spawn", [(_S.prop(_S.read(_v8, "P"), "STAR") if _S.truth(_S.binary("%", _S.read(_v8, "i"), 2)) else _S.prop(_S.read(_v8, "P"), "MOTE")), _S.read(_v8, "mx"), _S.read(_v8, "my"), _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "cos", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v8, "Math"), "sin", [_S.read(_v8, "a")]), _S.read(_v8, "sp")), 0.8), 20), _S.invoke(_S.read(_v8, "R"), "range", [0.4, 0.9]), _S.invoke(_S.read(_v8, "R"), "pick", [[_S.read(_v8, "WHITE"), _S.prop(_S.read(_v8, "C"), 6), _S.prop(_S.read(_v8, "C"), 5)]]), _S.invoke(_S.read(_v8, "R"), "range", [0.8, 1.8])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_sh = _S.read(_parent,"sh")
	var _n_A = _S.read(_parent,"A")
	var _n_C = _S.read(_parent,"C")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t < (_n_POP + 0.6)) if _S.truth((_n_t > _n_POP)) else (_n_t > _n_POP))):
		var _n_k_b2 = (0.5 * (1 - (float((_n_t - _n_POP))/0.6)))
		if true:
			var _n_y_b3 = 0
			while _S.truth((_n_y_b3 < _S.named_value(_n_A,"h"))):
				if true:
					var _n_x_b4 = 0
					while _S.truth((_n_x_b4 < _S.named_value(_n_A,"w"))):
						if _S.truth(_S.index_value(_n_sh,((_n_y_b3 * _S.named_value(_n_A,"w")) + _n_x_b4))):
							_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_A,"x") + _n_x_b4), (_S.named_value(_n_A,"y") + _n_y_b3), (_S.index_value(_n_C,3) if _S.truth(_S.binary("===",_S.index_value(_n_sh,((_n_y_b3 * _S.named_value(_n_A,"w")) + _n_x_b4)),1)) else _S.index_value(_n_C,4)), _n_k_b2])
						_n_x_b4 += 1.0
				_n_y_b3 += 1.0
	var _n_k_b1 = (float((_n_t - _n_POP))/0.5)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 >= 0)) else (_n_k_b1 >= 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b1]))), 0.2, maxf(1,(3 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f5"), (_n_k_b1 < 0.25)])
	if _S.truth((_n_t < (_n_POP + 0.3))):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 26, _S.index_value(_n_C,5), (0.3 * ((float(_n_t)/_n_OUT) if _S.truth((_n_t < _n_OUT)) else (1 - clampf((float((_n_t - _n_POP))/0.3),0.0,1.0))))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_inside = _S.read(_parent,"inside")
	var _n_A = _S.read(_parent,"A")
	var _n_C = _S.read(_parent,"C")
	var _n_sh = _S.read(_parent,"sh")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_mx = _S.read(_parent,"mx")
	var _n_my = _S.read(_parent,"my")
	var _n_squeezed = _S.read(_parent,"squeezed")
	var _n_SQUEEZE = _S.read(_parent,"SQUEEZE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_POP = _S.read(_parent,"POP")
	var _n_COLLAPSE = _S.read(_parent,"COLLAPSE")
	var _n_flare = _S.read(_parent,"flare")
	var _n_band = _S.read(_parent,"band")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_f_b1 = floori((_n_t * 30))
	if _S.truth((_n_t < _n_OUT)):
		var _n_k_b3 = (float(_n_t)/_n_OUT)
		if true:
			var _n_y_b4 = 0
			while _S.truth((_n_y_b4 < _S.named_value(_n_A,"h"))):
				if true:
					var _n_x_b5 = 0
					while _S.truth((_n_x_b5 < _S.named_value(_n_A,"w"))):
						if _S.truth(_S.call_value(_n_inside,[_n_x_b5, _n_y_b4])):
							_S.invoke(_n_p_b0,"light",[(_S.named_value(_n_A,"x") + _n_x_b5), (_S.named_value(_n_A,"y") + _n_y_b4), _S.index_value(_n_C,6), ((_n_k_b3 * _n_k_b3) * (0.3 if _S.truth(_S.binary("===",_S.index_value(_n_sh,((_n_y_b4 * _S.named_value(_n_A,"w")) + _n_x_b5)),1)) else 0.75))])
						else:
							if _S.truth(_S.logical("&&",_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside,[(_n_x_b5 - 1), _n_y_b4]),func():return _S.call_value(_n_inside,[(_n_x_b5 + 1), _n_y_b4])),func():return _S.call_value(_n_inside,[_n_x_b5, (_n_y_b4 - 1)])),func():return _S.call_value(_n_inside,[_n_x_b5, (_n_y_b4 + 1)])),func():return (_S.MathFX.rand([_n_x_b5,_n_y_b4,_n_f_b1]) < (0.25 + (0.65 * _n_k_b3))))):
								_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A,"x") + _n_x_b5), (_S.named_value(_n_A,"y") + _n_y_b4), (_n_WHITE if _S.truth(((_S.MathFX.rand([_n_x_b5,_n_y_b4,7]) < 0.5) if _S.truth((_n_k_b3 > 0.6)) else (_n_k_b3 > 0.6))) else _S.index_value(_n_C,6))])
						_n_x_b5 += 1.0
				_n_y_b4 += 1.0
		_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 30, _S.index_value(_n_C,5), (0.5 * _n_k_b3)])
	else:
		if _S.truth((_n_t < (_n_OUT + 0.05))):
			_S.call_value(_n_squeezed,[_n_p_b0, _n_A, _n_sh, 1, _n_WHITE, _S.index_value(_n_C,6)])
			_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 40, _S.index_value(_n_C,5), 0.8])
		else:
			if _S.truth((_n_t < (_n_OUT + _n_SQUEEZE))):
				var _n_q_b6 = _S.invoke(_n_ease,"inCubic",[(float(((_n_t - _n_OUT) - 0.05))/(_n_SQUEEZE - 0.05))])
				_S.call_value(_n_squeezed,[_n_p_b0, _n_A, _n_sh, (1 - _n_q_b6), _n_WHITE, _S.index_value(_n_C,6)])
				_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 34, _S.index_value(_n_C,5), 0.8])
			else:
				if _S.truth((_n_t < _n_POP)):
					var _n_q_b7 = (float(((_n_t - _n_OUT) - _n_SQUEEZE))/_n_COLLAPSE)
					var _n_hh_b8 = (((float(_S.named_value(_n_A,"h"))/2) + 2) * (1 - _S.invoke(_n_ease,"inQuad",[_n_q_b7])))
					if true:
						var _n_y_b9 = ((-_n_hh_b8) - 3)
						while _S.truth((_n_y_b9 <= (_n_hh_b8 + 3))):
							_S.invoke(_n_p_b0,"dot",[_n_mx, (_n_my + _n_y_b9), (_n_WHITE if _S.truth((absf(_n_y_b9) < _n_hh_b8)) else _S.index_value(_n_C,6)), (1 if _S.truth((absf(_n_y_b9) < _n_hh_b8)) else 0.7)])
							_n_y_b9 += 1.0
					if _S.truth((_n_hh_b8 > 4)):
						if true:
							var _n_y_b10 = ((-_n_hh_b8) * 0.7)
							while _S.truth((_n_y_b10 <= (_n_hh_b8 * 0.7))):
								_S.invoke(_n_p_b0,"dot",[(_n_mx - 1), (_n_my + _n_y_b10), _S.index_value(_n_C,5), 0.6])
								_S.invoke(_n_p_b0,"dot",[(_n_mx + 1), (_n_my + _n_y_b10), _S.index_value(_n_C,5), 0.6])
								_n_y_b10 += 1.0
					_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 30, _S.index_value(_n_C,5), 0.9])
					_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 8, _n_WHITE, 0.5])
	if _S.truth(((_n_t < (_n_POP + 0.22)) if _S.truth((_n_t >= _n_POP)) else (_n_t >= _n_POP))):
		var _n_q_b11 = (float((_n_t - _n_POP))/0.22)
		_S.call_value(_n_flare,[_n_p_b0, _n_mx, _n_my, ((22 * pow((1 - _n_q_b11),1.5)) + 2), (1 - _n_q_b11), _n_C])
		if _S.truth((_n_q_b11 < 0.3)):
			_S.invoke(_n_p_b0,"circle",[_n_mx, _n_my, ((4 * (1 - (float(_n_q_b11)/0.3))) + 1), _n_WHITE])
	var _n_k_b2 = (float((_n_t - _n_POP))/0.5)
	if _S.truth(((_n_k_b2 < 1) if _S.truth((_n_k_b2 >= 0)) else (_n_k_b2 >= 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b2]))), 0.2, maxf(1,(3 * (1 - _n_k_b2))), (1.15 - _n_k_b2), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), (_n_k_b2 < 0.25)])
	if _S.truth(((_n_t < (_n_POP + 0.3)) if _S.truth((_n_t > _n_POP)) else (_n_t > _n_POP))):
		_S.call_value(_n_sparkle,[_n_p_b0, _n_mx, (_n_my - 1), 3, _S.index_value(_n_C,6), _S.index_value(_n_C,5), (0.3 * (1 - (float((_n_t - _n_POP))/0.3)))])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_t_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_t_b0 < _n_OUT)) else 0)
	return null
