@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/arcane/blink-in.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "LINE", 0.26)
	_S.define(_e, "GROW", 0.1)
	_S.define(_e, "OPEN", 0.12)
	_S.define(_e, "ARRIVE", _S.binary("+", _S.binary("+", _S.read(_e, "LINE"), _S.read(_e, "GROW")), _S.read(_e, "OPEN")))
	_S.define(_e, "meta", _S.merge([{"name": "Blink in"}, {"desc": "Glittering bits spiral in to a point of light that opens into a line, then into a white silhouette that cools into the caster."}, {"tags": ["arcane", "blink", "teleport", "appear", "movement", "magic", "one-shot"]}, {"size": [136, 96]}, {"origin": [68, 80]}, {"duration": 1.4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "LANDED", _S.merge([{"crouch": 7}, {"lean": 3}, {"fx": 9}, {"fy": _S.unary("-", 12)}, {"bx": 12}, {"by": _S.unary("-", 12)}, {"ffx": 8}, {"fbx": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.read(_e, "LANDED")], [0.48, _S.read(_e, "LANDED")], [0.56, _S.merge([_S.read(_e, "LANDED"), {"crouch": 6}]), "snap"], [0.95, _S.read(_e, "READY")], [1.4, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.48}, {"stop": 0.03}, {"shake": 0.1}, {"amp": 1}])]}, {"dust": [_S.merge([{"t": 0.48}, {"x": 0}, {"n": 7}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f10"))
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
	_S.define(_e, "bits", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 230}]), _S.function_value(_e, "_f3")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "arrived", false)
	_S.define(_e, "at", _S.function_value(_e, "_f4"))
	return _S.merge([{"update": _S.function_value(_e, "_f5")}, {"drawBack": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((_n_y_b1 * _S.named_value(_n_A,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_A = _S.read(_parent,"A")
	var _n_mx = _S.read(_parent,"mx")
	var _n_LINE = _S.read(_parent,"LINE")
	var _n_GROW = _S.read(_parent,"GROW")
	var _n_COLS = _S.read(_parent,"COLS")
	var _n_a_b0 = _S.invoke(_n_R,"range",[0, _n_TAU])
	var _n_d_b1 = _S.invoke(_n_R,"range",[16, 46])
	var _n_ty_b2 = (_S.named_value(_n_A,"y") + _S.invoke(_n_R,"range",[3, (_S.named_value(_n_A,"h") - 2)]))
	var _n_oy_b3 = (((sin(_n_a_b0) * _n_d_b1) * 0.8) - 6)
	if _S.truth(((_n_ty_b2 + _n_oy_b3) > (-2))):
		_n_oy_b3 = ((-absf(_n_oy_b3)) - 2)
	return {"tx":(_n_mx + _S.invoke(_n_R,"range",[(-1), 1])),"ty":_n_ty_b2,"ox":(cos(_n_a_b0) * _n_d_b1),"oy":_n_oy_b3,"t0":_S.invoke(_n_R,"range",[0, 0.1]),"t1":(_n_LINE + _S.invoke(_n_R,"range",[(-0.02), _n_GROW])),"spin":(_S.invoke(_n_R,"range",[0.8, 1.8]) * _S.invoke(_n_R,"sign",[])),"c":_S.invoke(_n_R,"pick",[_n_COLS])}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_tt_b1 = _S.arg(_args,1)
	var _n_k_b2 = clampf((float((_n_tt_b1 - _S.named_value(_n_b_b0,"t0")))/(_S.named_value(_n_b_b0,"t1") - _S.named_value(_n_b_b0,"t0"))),0.0,1.0)
	var _n_e_b3 = _S.invoke(_n_ease,"outCubic",[_n_k_b2])
	var _n_r_b4 = (1 - _n_e_b3)
	var _n_sp_b5 = ((_S.named_value(_n_b_b0,"spin") * _n_r_b4) * 1.2)
	var _n_ox_b6 = ((_S.named_value(_n_b_b0,"ox") * cos(_n_sp_b5)) - (_S.named_value(_n_b_b0,"oy") * sin(_n_sp_b5)))
	var _n_oy_b7 = ((_S.named_value(_n_b_b0,"ox") * sin(_n_sp_b5)) + (_S.named_value(_n_b_b0,"oy") * cos(_n_sp_b5)))
	return [(_S.named_value(_n_b_b0,"tx") + (_n_ox_b6 * _n_r_b4)), minf((-1),(_S.named_value(_n_b_b0,"ty") + (_n_oy_b7 * _n_r_b4))), _n_k_b2]
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "LINE")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "a", _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "TAU")]))
		_S.define(_v0, "D", _S.invoke(_S.read(_v0, "R"), "range", [22, 44]))
		_S.define(_v0, "T", _S.invoke(_S.read(_v0, "R"), "range", [0.12, 0.18]))
		_S.define(_v0, "v", _S.binary("/", _S.binary("*", _S.read(_v0, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v0, "Math"), "exp", [_S.binary("*", 3, _S.read(_v0, "T"))]), 1)))
		_S.define(_v0, "x", _S.binary("+", _S.read(_v0, "mx"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "cos", [_S.read(_v0, "a")]), _S.read(_v0, "D"))))
		_S.define(_v0, "y", _S.invoke(_S.read(_v0, "Math"), "min", [_S.unary("-", 2), _S.binary("+", _S.read(_v0, "my"), _S.binary("*", _S.invoke(_S.read(_v0, "Math"), "sin", [_S.read(_v0, "a")]), _S.read(_v0, "D")))]))
		_S.define(_v0, "l", _S.logical("||", _S.invoke(_S.read(_v0, "Math"), "hypot", [_S.binary("-", _S.read(_v0, "x"), _S.read(_v0, "mx")), _S.binary("-", _S.read(_v0, "y"), _S.read(_v0, "my"))]), func(): return 1))
		_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "STREAK"), _S.read(_v0, "x"), _S.read(_v0, "y"), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "mx"), _S.read(_v0, "x")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v0, "my"), _S.read(_v0, "y")), _S.read(_v0, "l")), _S.read(_v0, "v")), _S.read(_v0, "T"), (_S.prop(_S.read(_v0, "C"), 6) if _S.truth(_S.invoke(_S.read(_v0, "R"), "chance", [0.5])) else _S.prop(_S.read(_v0, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "arrived")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "ARRIVE")))):
		var _v1 = _S.scope(_e)
		_S.write(_v1, "arrived", true, "=", false)
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.binary("-", _S.read(_v1, "my"), 6), 56, _S.prop(_S.read(_v1, "C"), 5), 0.9, 0.35])
		_S.invoke(_S.read(_v1, "lights"), "add", [_S.read(_v1, "mx"), _S.read(_v1, "my"), 24, _S.read(_v1, "WHITE"), 0.8, 0.1])
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v2, "i"), 30)):
			var _v3 = _S.scope(_v2)
			_S.define(_v3, "a", _S.invoke(_S.read(_v3, "R"), "range", [0, _S.read(_v3, "TAU")]))
			_S.define(_v3, "sp", _S.invoke(_S.read(_v3, "R"), "range", [35, 110]))
			_S.invoke(_S.read(_v3, "ps"), "spawn", [(_S.prop(_S.read(_v3, "P"), "STAR") if _S.truth(_S.invoke(_S.read(_v3, "R"), "chance", [0.6])) else _S.prop(_S.read(_v3, "P"), "MOTE")), _S.read(_v3, "mx"), _S.read(_v3, "my"), _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "cos", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v3, "Math"), "sin", [_S.read(_v3, "a")]), _S.read(_v3, "sp")), 0.7), 30), _S.invoke(_S.read(_v3, "R"), "range", [0.4, 0.85]), _S.invoke(_S.read(_v3, "R"), "pick", [_S.read(_v3, "COLS")]), _S.invoke(_S.read(_v3, "R"), "range", [0.6, 1.6])])
			_v2 = _S.iteration(_v2)
			_S.write(_v2, "i", 1, "+=", true)
		var _v4 = _S.scope(_v1)
		_S.define(_v4, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "i"), 12)):
			var _v5 = _S.scope(_v4)
			_S.define(_v5, "s", _S.invoke(_S.read(_v5, "R"), "sign", []))
			_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "SPARK"), _S.binary("+", _S.read(_v5, "mx"), _S.binary("*", _S.read(_v5, "s"), _S.invoke(_S.read(_v5, "R"), "range", [2, 8]))), _S.unary("-", 1), _S.binary("*", _S.read(_v5, "s"), _S.invoke(_S.read(_v5, "R"), "range", [60, 180])), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [20, 110])), _S.invoke(_S.read(_v5, "R"), "range", [0.2, 0.45])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_ARRIVE = _S.read(_parent,"ARRIVE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (float(((_n_t - _n_ARRIVE) + 0.03))/0.5)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 >= 0)) else (_n_k_b1 >= 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b1]))), 0.2, maxf(1,(3 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f7"), (_n_k_b1 < 0.25)])
	_S.invoke(_n_p_b0,"glow",[0, (-1), 26, _S.index_value(_n_C,5), (0.3 * ((float(_n_t)/_n_ARRIVE) if _S.truth((_n_t < _n_ARRIVE)) else (1 - clampf((float((_n_t - _n_ARRIVE))/0.5),0.0,1.0))))])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) < 0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_at = _S.read(_parent,"at")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_bits = _S.read(_parent,"bits")
	var _n_LINE = _S.read(_parent,"LINE")
	var _n_mx = _S.read(_parent,"mx")
	var _n_my = _S.read(_parent,"my")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_GROW = _S.read(_parent,"GROW")
	var _n_ease = _S.read(_parent,"ease")
	var _n_A = _S.read(_parent,"A")
	var _n_ARRIVE = _S.read(_parent,"ARRIVE")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_sh = _S.read(_parent,"sh")
	var _n_squeezed = _S.read(_parent,"squeezed")
	var _n_inside = _S.read(_parent,"inside")
	var _n_flare = _S.read(_parent,"flare")
	var _n_band = _S.read(_parent,"band")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_bits):
		var _n_b_b2 = _iter_0
		if _S.truth(((_n_t < _S.named_value(_n_b_b2,"t0")) if _S.truth((_n_t < _S.named_value(_n_b_b2,"t0"))) else (_n_t > (_S.named_value(_n_b_b2,"t1") + 0.02)))):
			continue
		var _tuple_1 = _S.call_value(_n_at,[_n_b_b2, _n_t])
		var _n_x_b3 = _S.prop(_tuple_1,0)
		var _n_y_b4 = _S.prop(_tuple_1,1)
		var _n_k_b5 = _S.prop(_tuple_1,2)
		_S.invoke(_n_p_b0,"dot",[_n_x_b3, _n_y_b4, (_n_WHITE if _S.truth((_n_k_b5 > 0.75)) else _S.named_value(_n_b_b2,"c")), minf(1,(0.35 + (_n_k_b5 * 2)))])
		if _S.truth((_n_k_b5 > 0.55)):
			var _tuple_2 = _S.call_value(_n_at,[_n_b_b2, (_n_t - 0.015)])
			var _n_px_b6 = _S.prop(_tuple_2,0)
			var _n_py_b7 = _S.prop(_tuple_2,1)
			_S.invoke(_n_p_b0,"dot",[(float((_n_x_b3 + _n_px_b6))/2), (float((_n_y_b4 + _n_py_b7))/2), _S.index_value(_n_C,5), 0.8])
		if _S.truth((_n_k_b5 > 0.8)):
			_S.invoke(_n_p_b0,"glow",[_n_x_b3, _n_y_b4, 3, _S.index_value(_n_C,6), 0.3])
	if _S.truth(((_n_t < _n_LINE) if _S.truth((_n_t >= (_n_LINE - 0.04))) else (_n_t >= (_n_LINE - 0.04)))):
		var _n_q_b8 = (float(((_n_t - _n_LINE) + 0.04))/0.04)
		_S.call_value(_n_sparkle,[_n_p_b0, _n_mx, _n_my, (2 + (3 * _n_q_b8)), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.6])
	else:
		if _S.truth(((_n_t < (_n_LINE + _n_GROW)) if _S.truth((_n_t >= _n_LINE)) else (_n_t >= _n_LINE))):
			var _n_q_b9 = _S.invoke(_n_ease,"outCubic",[(float((_n_t - _n_LINE))/_n_GROW)])
			var _n_hh_b10 = (((float(_S.named_value(_n_A,"h"))/2) + 3) * _n_q_b9)
			if true:
				var _n_y_b11 = ((-_n_hh_b10) - 2)
				while _S.truth((_n_y_b11 <= (_n_hh_b10 + 2))):
					_S.invoke(_n_p_b0,"dot",[_n_mx, (_n_my + _n_y_b11), (_n_WHITE if _S.truth((absf(_n_y_b11) < _n_hh_b10)) else _S.index_value(_n_C,6)), (1 if _S.truth((absf(_n_y_b11) < _n_hh_b10)) else 0.7)])
					_n_y_b11 += 1.0
			if true:
				var _n_y_b12 = ((-_n_hh_b10) * 0.7)
				while _S.truth((_n_y_b12 <= (_n_hh_b10 * 0.7))):
					_S.invoke(_n_p_b0,"dot",[(_n_mx - 1), (_n_my + _n_y_b12), _S.index_value(_n_C,5), 0.6])
					_S.invoke(_n_p_b0,"dot",[(_n_mx + 1), (_n_my + _n_y_b12), _S.index_value(_n_C,5), 0.6])
					_n_y_b12 += 1.0
			_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 30, _S.index_value(_n_C,5), 0.9])
			_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 8, _n_WHITE, 0.5])
		else:
			if _S.truth(((_n_t < _n_ARRIVE) if _S.truth((_n_t >= (_n_LINE + _n_GROW))) else (_n_t >= (_n_LINE + _n_GROW)))):
				var _n_q_b13 = _S.invoke(_n_ease,"outCubic",[(float(((_n_t - _n_LINE) - _n_GROW))/_n_OPEN)])
				_S.call_value(_n_squeezed,[_n_p_b0, _n_A, _n_sh, _n_q_b13, _n_WHITE, _S.index_value(_n_C,6)])
				_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 36, _S.index_value(_n_C,5), 0.8])
			else:
				if _S.truth(((_n_t < (_n_ARRIVE + 0.42)) if _S.truth((_n_t >= _n_ARRIVE)) else (_n_t >= _n_ARRIVE))):
					var _n_k_b14 = (1 - (float((_n_t - _n_ARRIVE))/0.42))
					var _n_f_b15 = floori((_n_t * 30))
					if _S.truth((_n_k_b14 > 0.86)):
						_S.call_value(_n_squeezed,[_n_p_b0, _n_A, _n_sh, 1, _n_WHITE, _S.index_value(_n_C,6)])
					if true:
						var _n_y_b16 = 0
						while _S.truth((_n_y_b16 < _S.named_value(_n_A,"h"))):
							if true:
								var _n_x_b17 = 0
								while _S.truth((_n_x_b17 < _S.named_value(_n_A,"w"))):
									if _S.truth(_S.call_value(_n_inside,[_n_x_b17, _n_y_b16])):
										_S.invoke(_n_p_b0,"light",[(_S.named_value(_n_A,"x") + _n_x_b17), (_S.named_value(_n_A,"y") + _n_y_b16), _S.index_value(_n_C,6), ((_n_k_b14 * _n_k_b14) * (0.3 if _S.truth(_S.binary("===",_S.index_value(_n_sh,((_n_y_b16 * _S.named_value(_n_A,"w")) + _n_x_b17)),1)) else 0.8))])
									else:
										if _S.truth(_S.logical("&&",_S.logical("||",_S.logical("||",_S.logical("||",_S.call_value(_n_inside,[(_n_x_b17 - 1), _n_y_b16]),func():return _S.call_value(_n_inside,[(_n_x_b17 + 1), _n_y_b16])),func():return _S.call_value(_n_inside,[_n_x_b17, (_n_y_b16 - 1)])),func():return _S.call_value(_n_inside,[_n_x_b17, (_n_y_b16 + 1)])),func():return (_S.MathFX.rand([_n_x_b17,_n_y_b16,_n_f_b15]) < (0.85 * _n_k_b14)))):
											_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A,"x") + _n_x_b17), (_S.named_value(_n_A,"y") + _n_y_b16), (_n_WHITE if _S.truth(((_S.MathFX.rand([_n_x_b17,_n_y_b16,7]) < 0.5) if _S.truth((_n_k_b14 > 0.5)) else (_n_k_b14 > 0.5))) else _S.index_value(_n_C,6))])
									_n_x_b17 += 1.0
							_n_y_b16 += 1.0
					_S.invoke(_n_p_b0,"glow",[_n_mx, _n_my, 34, _S.index_value(_n_C,5), (0.6 * _n_k_b14)])
	if _S.truth(((_n_t < (_n_ARRIVE + 0.2)) if _S.truth((_n_t >= _n_ARRIVE)) else (_n_t >= _n_ARRIVE))):
		var _n_q_b18 = (float((_n_t - _n_ARRIVE))/0.2)
		_S.call_value(_n_flare,[_n_p_b0, _n_mx, (_n_my - 4), ((18 * pow((1 - _n_q_b18),1.5)) + 2), (1 - _n_q_b18), _n_C])
	var _n_k_b1 = (float(((_n_t - _n_ARRIVE) + 0.03))/0.5)
	if _S.truth(((_n_k_b1 < 1) if _S.truth((_n_k_b1 >= 0)) else (_n_k_b1 >= 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (4 + (30 * _S.invoke(_n_ease,"outCubic",[_n_k_b1]))), 0.2, maxf(1,(3 * (1 - _n_k_b1))), (1.15 - _n_k_b1), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), (_n_k_b1 < 0.25)])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_g_b0 = _S.arg(_args,0)
	return (sin(_n_g_b0) >= 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_ARRIVE = _S.read(_parent,"ARRIVE")
	var _n_t_b0 = _S.arg(_args,0)
	return (0 if _S.truth((_n_t_b0 < _n_ARRIVE)) else 1)
	return null
