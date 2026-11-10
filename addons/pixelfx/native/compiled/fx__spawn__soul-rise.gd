@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/soul-rise.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "luma", _S.import_value("core/index.js", "luma"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "rimOf", _S.import_value("fx/spawn/_lib.js", "rimOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Soul rise"}, {"desc": "The body's outline flares and dims, then a pale glowing copy of it lifts out, stretching as its legs melt into a rippling wisp, shedding motes until it thins into light."}, {"tags": ["spawn", "death", "soul", "ghost", "spirit", "rise", "light", "one-shot"]}, {"size": [96, 140]}, {"origin": [48, 126]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#101a33", "#1f3563", "#35609e", "#5c96d4", "#94c8f0", "#d2f0ff", "#ffffff"]}, {"height": 50}, {"seed": 27}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SLUMP", _S.merge([{"crouch": 8}, {"lean": 6}, {"hy": 2}, {"fx": 7}, {"fy": _S.unary("-", 9)}, {"bx": 11}, {"by": _S.unary("-", 9)}, {"ffx": 9}, {"fbx": _S.unary("-", 8)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[_S.unary("-", 0.2), _S.read(_e, "READY")], [0.3, _S.merge([{"turn": 1}, {"crouch": 2}, {"hy": _S.unary("-", 1)}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 24)}, {"bx": 11}, {"by": _S.unary("-", 24)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}])], [0.7, _S.merge([{"turn": 0.7}, {"crouch": 4}, {"lean": 3}, {"hy": 1}, {"fx": 2}, {"fy": _S.unary("-", 14)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": 4}, {"fbx": _S.unary("-", 3)}])], [1.1, _S.read(_e, "SLUMP")], [2.7, _S.read(_e, "SLUMP")], [3.2, _S.merge([_S.read(_e, "SLUMP"), {"crouch": 7}])]]}, {"dust": [_S.merge([{"t": 1.1}, {"x": 0}, {"n": 5}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "LEAVE", 0.35)
	_S.define(_e, "TOP", 2.05)
	_S.define(_e, "GONE", 2.55)
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "hex"), ["#0c0f1e"]))
	_exports["create"] = _S.read(_e, "create")
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f14"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "rim", _S.call_value(_S.read(_e, "rimOf"), [_S.read(_e, "body")]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "body"), "w"))
	_S.define(_e, "Hh", _S.prop(_S.read(_e, "body"), "h"))
	_S.define(_e, "waist", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "Hh"), 0.6)]))
	_S.define(_e, "tone", _S.invoke(_S.prop(_S.read(_e, "body"), "list"), "map", [_S.function_value(_e, "_f2")]))
	_S.define(_e, "toneAt", _S.invoke(_S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "Hh"))]), "fill", [_S.unary("-", 1)]))
	_S.invoke(_S.prop(_S.read(_e, "body"), "list"), "forEach", [_S.function_value(_e, "_f3")])
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "left", false)
	_S.define(_e, "lift", _S.function_value(_e, "_f4"))
	_S.define(_e, "stretch", _S.function_value(_e, "_f5"))
	_S.define(_e, "sway", _S.function_value(_e, "_f6"))
	_S.define(_e, "melt", _S.function_value(_e, "_f7"))
	_S.define(_e, "thin", _S.function_value(_e, "_f8"))
	_S.define(_e, "ring", _S.function_value(_e, "_f9"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f12")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	return (6 if _S.truth(_S.named_value(_n_b_b0,"edge")) else (3 + minf(2,floori((_S.ColorFX.luma(_S.named_value(_n_b_b0,"c")) * 3.6)))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_toneAt = _S.read(_parent,"toneAt")
	var _n_W = _S.read(_parent,"W")
	var _n_tone = _S.read(_parent,"tone")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _S.set_prop(_n_toneAt,((_S.named_value(_n_b_b0,"my") * _n_W) + _S.named_value(_n_b_b0,"mx")),_S.index_value(_n_tone,_n_i_b1),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_o = _S.read(_parent,"o")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_TOP = _S.read(_parent,"TOP")
	return (_S.named_value(_n_o,"height") * _S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t - _n_LEAVE))/(_n_TOP - _n_LEAVE)),0.0,1.0)]))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_TOP = _S.read(_parent,"TOP")
	return (1 + (0.22 * _S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t - _n_LEAVE))/(_n_TOP - _n_LEAVE)),0.0,1.0)])))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_row_b0 = _S.arg(_args,0)
	return ((sin(((_n_t * 3) - (_n_row_b0 * 0.12))) * 2.2) * _S.MathFX.smooth(_n_LEAVE,(_n_LEAVE + 0.5),_n_t))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_t = _S.read(_parent,"t")
	return _S.MathFX.smooth((_n_LEAVE + 0.1),(_n_LEAVE + 0.9),_n_t)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_t = _S.read(_parent,"t")
	return _S.MathFX.smooth((_n_TOP - 0.25),_n_GONE,_n_t)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_band = _S.read(_parent,"band")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_near_b1 = _S.arg(_args,1)
	var _n_k_b2 = (float((_n_t - _n_LEAVE))/0.5)
	if _S.truth(((_n_k_b2 < 1) if _S.truth((_n_k_b2 > 0)) else (_n_k_b2 > 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (6 + (26 * _S.invoke(_n_ease,"outCubic",[_n_k_b2]))), 0.18, maxf(1,(3 * (1 - _n_k_b2))), (1.15 - _n_k_b2), _n_C, _S.function_value(_S.capture(_parent,{"near":_n_near_b1,"this":_n_this}),"_f10"), (_n_k_b2 < 0.12)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) >= 0),_n_near)
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "left")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LEAVE")))):
		var _v0 = _S.scope(_e)
		_S.write(_v0, "left", true, "=", false)
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.unary("-", 20), 50, _S.prop(_S.read(_v0, "C"), 4), 0.85, 0.55])
		_S.invoke(_S.read(_v0, "lights"), "add", [0, _S.unary("-", 20), 24, _S.read(_v0, "WHITE"), 0.8, 0.12])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 10)):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "c", _S.invoke(_S.read(_v2, "R"), "pick", [_S.read(_v2, "rim")]))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "STAR"), _S.prop(_S.read(_v2, "c"), "x"), _S.prop(_S.read(_v2, "c"), "y"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v2, "R"), "range", [20, 60])), _S.invoke(_S.read(_v2, "R"), "range", [0.4, 0.8]), _S.invoke(_S.read(_v2, "R"), "pick", [[_S.read(_v2, "WHITE"), _S.prop(_S.read(_v2, "C"), 5)]]), _S.invoke(_S.read(_v2, "R"), "range", [0.8, 1.8])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "LEAVE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "GONE")))):
		var _v3 = _S.scope(_e)
		_S.define(_v3, "s", _S.call_value(_S.read(_v3, "stretch"), []))
		_S.define(_v3, "y0", _S.binary("-", _S.binary("*", _S.prop(_S.read(_v3, "body"), "y"), _S.read(_v3, "s")), _S.call_value(_S.read(_v3, "lift"), [])))
		_S.define(_v3, "th", _S.call_value(_S.read(_v3, "thin"), []))
		var _v4 = _S.scope(_v3)
		_S.define(_v4, "n", 0)
		while _S.truth(_S.binary("<", _S.read(_v4, "n"), (3 if _S.truth(_S.binary(">", _S.read(_v4, "th"), 0)) else 1))):
			var _v5 = _S.scope(_v4)
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v5, "R"), "chance", [(0.9 if _S.truth(_S.binary(">", _S.read(_v5, "th"), 0)) else 0.5)]))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "n", 1, "+=", true)
				continue
			_S.define(_v5, "c", _S.invoke(_S.read(_v5, "R"), "pick", [_S.read(_v5, "rim")]))
			_S.define(_v5, "row", _S.prop(_S.read(_v5, "c"), "my"))
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("/", _S.read(_v5, "row"), _S.read(_v5, "Hh")), _S.binary("-", _S.binary("-", 1, _S.binary("*", _S.read(_v5, "th"), 1.1)), 0.05)), func(): return _S.binary(">", _S.read(_v5, "th"), 0))):
				_v4 = _S.iteration(_v4)
				_S.write(_v4, "n", 1, "+=", true)
				continue
			_S.define(_v5, "x", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "c"), "x"), _S.binary("-", 1, _S.binary("*", _S.binary("*", 0.12, _S.binary("-", _S.read(_v5, "s"), 1)), 4))), _S.call_value(_S.read(_v5, "sway"), [_S.read(_v5, "row")])))
			_S.define(_v5, "y", _S.binary("+", _S.read(_v5, "y0"), _S.binary("*", _S.prop(_S.read(_v5, "c"), "my"), _S.read(_v5, "s"))))
			_S.define(_v5, "life", _S.invoke(_S.read(_v5, "Math"), "min", [_S.invoke(_S.read(_v5, "R"), "range", [0.5, 1.1]), _S.binary("-", _S.binary("-", _S.prop(_S.read(_v5, "meta"), "duration"), 0.1), _S.read(_v5, "t")), _S.binary("/", _S.binary("+", _S.read(_v5, "y"), 120), 60)]))
			if _S.truth(_S.binary(">", _S.read(_v5, "life"), 0.1)):
				_S.invoke(_S.read(_v5, "ps"), "spawn", [(_S.prop(_S.read(_v5, "P"), "MOTE") if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.7])) else _S.prop(_S.read(_v5, "P"), "STAR")), _S.read(_v5, "x"), _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [25, 60])), _S.read(_v5, "life"), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.read(_v5, "WHITE"), _S.prop(_S.read(_v5, "C"), 5), _S.prop(_S.read(_v5, "C"), 5), _S.prop(_S.read(_v5, "C"), 4)]]), _S.invoke(_S.read(_v5, "R"), "range", [0.5, 1])])
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "n", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_t = _S.read(_parent,"t")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_C = _S.read(_parent,"C")
	var _n_ring = _S.read(_parent,"ring")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_k_b1 = (_S.MathFX.smooth(0,_n_LEAVE,_n_t) * (1 - _S.MathFX.smooth((_n_LEAVE + 0.4),_n_TOP,_n_t)))
	if _S.truth((_n_k_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-1), 26, _S.index_value(_n_C,4), (0.3 * _n_k_b1)])
	_S.call_value(_n_ring,[_n_p_b0, false])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_LEAVE = _S.read(_parent,"LEAVE")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_rim = _S.read(_parent,"rim")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_meta = _S.read(_parent,"meta")
	var _n_SHADOW = _S.read(_parent,"SHADOW")
	var _n_body = _S.read(_parent,"body")
	var _n_ring = _S.read(_parent,"ring")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_stretch = _S.read(_parent,"stretch")
	var _n_lift = _S.read(_parent,"lift")
	var _n_melt = _S.read(_parent,"melt")
	var _n_thin = _S.read(_parent,"thin")
	var _n_Hh = _S.read(_parent,"Hh")
	var _n_waist = _S.read(_parent,"waist")
	var _n_sway = _S.read(_parent,"sway")
	var _n_W = _S.read(_parent,"W")
	var _n_toneAt = _S.read(_parent,"toneAt")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < (_n_LEAVE + 0.3))):
		var _n_k_b12 = ((float(_n_t)/_n_LEAVE) if _S.truth((_n_t < _n_LEAVE)) else (1 - (float((_n_t - _n_LEAVE))/0.3)))
		for _iter_0 in _S.array(_n_rim):
			var _n_c_b13 = _iter_0
			if _S.truth((_S.MathFX.rand([_S.named_value(_n_c_b13,"mx"),_S.named_value(_n_c_b13,"my"),floori((_n_t * 30))]) < (0.25 + (0.7 * _n_k_b12)))):
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_c_b13,"x"), _S.named_value(_n_c_b13,"y"), (_n_WHITE if _S.truth((_n_k_b12 > 0.7)) else _S.index_value(_n_C,5))])
		_S.invoke(_n_p_b0,"glow",[0, (-19), 26, _S.index_value(_n_C,4), (0.45 * _n_k_b12)])
	var _n_dim_b1 = (_S.MathFX.smooth(_n_LEAVE,(_n_LEAVE + 0.6),_n_t) * (1 - _S.MathFX.smooth(_n_GONE,(_S.named_value(_n_meta,"duration") - 0.1),_n_t)))
	if _S.truth((_n_dim_b1 > 0)):
		for _iter_1 in _S.array(_S.named_value(_n_body,"list")):
			var _n_b_b14 = _iter_1
			_S.invoke(_n_p_b0,"blend",[_S.named_value(_n_b_b14,"x"), _S.named_value(_n_b_b14,"y"), _n_SHADOW, (0.45 * _n_dim_b1)])
	_S.call_value(_n_ring,[_n_p_b0, true])
	if _S.truth(((_n_t < _n_LEAVE) if _S.truth((_n_t < _n_LEAVE)) else (_n_t > (_n_GONE + 0.1)))):
		_S.invoke(_n_ps,"draw",[_n_p_b0])
		_S.invoke(_n_lights,"draw",[_n_p_b0])
		return null
	var _n_s_b2 = _S.call_value(_n_stretch,[])
	var _n_L_b3 = _S.call_value(_n_lift,[])
	var _n_m_b4 = _S.call_value(_n_melt,[])
	var _n_th_b5 = _S.call_value(_n_thin,[])
	var _n_top_b6 = ((_S.named_value(_n_body,"y") * _n_s_b2) - _n_L_b3)
	var _n_sx_b7 = (1 - ((0.12 * (_n_s_b2 - 1)) * 4))
	var _n_tail_b8 = floori((10 * _n_m_b4)+0.5)
	var _n_y1_b9 = (_n_top_b6 + ((_n_Hh + _n_tail_b8) * _n_s_b2))
	var _n_fadeIn_b10 = clampf((float((_n_t - _n_LEAVE))/0.15),0.0,1.0)
	if true:
		var _n_y_b15 = floori(_n_top_b6)
		while _S.truth((_n_y_b15 <= ceili(_n_y1_b9))):
			var _n_my_b16 = floori((float(((_n_y_b15 + 0.5) - _n_top_b6))/_n_s_b2))
			if _S.truth((_n_my_b16 < 0)):
				_n_y_b15 += 1.0
				continue
			var _n_k_b17 = ((float(((_n_my_b16 - _n_waist) + 1))/((_n_Hh - _n_waist) + _n_tail_b8)) if _S.truth((_n_my_b16 >= _n_waist)) else 0)
			var _n_narrow_b18 = (1 - ((_n_k_b17 * _n_m_b4) * 0.95))
			if _S.truth((_n_narrow_b18 <= 0.05)):
				_n_y_b15 += 1.0
				continue
			var _n_cx_b19 = (_S.call_value(_n_sway,[_n_my_b16]) + (((sin(((_n_my_b16 * 0.7) - (_n_t * 8))) * 2) * _n_k_b17) * _n_m_b4))
			var _n_a_b20 = (((1 - (_n_k_b17 * 0.45)) if _S.truth((_n_my_b16 >= _n_waist)) else 1) * _n_fadeIn_b10)
			if true:
				var _n_x_b21 = floori(((_n_cx_b19 - (float(_n_W)/2)) - 4))
				while _S.truth((_n_x_b21 <= ceili(((_n_cx_b19 + (float(_n_W)/2)) + 4)))):
					var _n_mx_b22 = floori(((float(((_n_x_b21 + 0.5) - _n_cx_b19))/(_n_sx_b7 * _n_narrow_b18)) - _S.named_value(_n_body,"x")))
					if _S.truth((((float(_n_my_b16)/(_n_Hh + _n_tail_b8)) > (((1 - (_n_th_b5 * 1.25)) + (0.25 * _S.MathFX.rand([_n_mx_b22,_n_my_b16,5]))) - 0.1)) if _S.truth((_n_th_b5 > 0)) else (_n_th_b5 > 0))):
						_n_x_b21 += 1.0
						continue
					var _n_ti_b23 = null
					if _S.truth((_n_my_b16 < _n_Hh)):
						if _S.truth(((_n_mx_b22 < 0) if _S.truth((_n_mx_b22 < 0)) else (_n_mx_b22 >= _n_W))):
							_n_x_b21 += 1.0
							continue
						_n_ti_b23 = _S.index_value(_n_toneAt,((_n_my_b16 * _n_W) + _n_mx_b22))
						if _S.truth((_n_ti_b23 < 0)):
							_n_x_b21 += 1.0
							continue
					else:
						var _n_w_b24 = (((1 - (float((_n_my_b16 - _n_Hh))/maxf(1,_n_tail_b8))) * 3.2) * _n_m_b4)
						var _n_d_b25 = absf(((_n_x_b21 + 0.5) - _n_cx_b19))
						if _S.truth((_n_d_b25 > _n_w_b24)):
							_n_x_b21 += 1.0
							continue
						_n_ti_b23 = (5 if _S.truth((_n_d_b25 > (_n_w_b24 - 1))) else 4)
					if _S.truth((_n_t < (_n_LEAVE + 0.07))):
						_S.invoke(_n_p_b0,"px",[_n_x_b21, _n_y_b15, (_S.index_value(_n_C,5) if _S.truth((_n_ti_b23 >= 6)) else _n_WHITE)])
					else:
						if _S.truth((_n_ti_b23 >= 5)):
							_S.invoke(_n_p_b0,"dot",[_n_x_b21, _n_y_b15, (_n_WHITE if _S.truth((_n_ti_b23 >= 6)) else _S.index_value(_n_C,5)), minf(1,(_n_a_b20 * 1.3))])
						else:
							_S.invoke(_n_p_b0,"blend",[_n_x_b21, _n_y_b15, _S.index_value(_n_C,_n_ti_b23), (_n_a_b20 * 0.7)])
					_n_x_b21 += 1.0
			_n_y_b15 += 1.0
	var _n_cy_b11 = (_n_top_b6 + ((_n_Hh * _n_s_b2) * 0.45))
	_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_sway,[10]), _n_cy_b11, 30, _S.index_value(_n_C,4), ((0.42 * _n_fadeIn_b10) * (1 - _n_th_b5))])
	_S.invoke(_n_p_b0,"glow",[_S.call_value(_n_sway,[10]), (_n_cy_b11 - 6), 14, _S.index_value(_n_C,5), ((0.3 * _n_fadeIn_b10) * (1 - _n_th_b5))])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f14(_parent,_args:Array,_this=null):
	return 1
	return null
