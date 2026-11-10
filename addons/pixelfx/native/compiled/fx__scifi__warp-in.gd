@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/warp-in.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "widthAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Warp in"}, {"desc": "A beam slams down, rings run down it and a scanline paints the hero in from head to toe, white-hot pixels cooling to their own colors; the beam pinches shut in sparks."}, {"tags": ["scifi", "teleport", "warp", "beam", "spawn", "arrive", "one-shot"]}, {"size": [192, 168]}, {"origin": [96, 128]}, {"duration": 3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0b1030", "#152a63", "#1d4f9e", "#2582d2", "#36b9ee", "#8ae8ff", "#d4fbff", "#ffffff"]}, {"width": 15}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "IN", _S.merge([{"crouch": 7}, {"lean": 3}, {"fx": 9}, {"fy": _S.unary("-", 12)}, {"bx": 12}, {"by": _S.unary("-", 12)}, {"ffx": 8}, {"fbx": _S.unary("-", 6)}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"follow": 0}, {"poses": [[0, _S.read(_e, "IN")], [1.82, _S.read(_e, "IN")], [2.05, _S.merge([{"crouch": 3}, {"fx": 8}, {"fy": _S.unary("-", 19)}, {"bx": 8}, {"by": _S.unary("-", 18)}, {"ffx": 4}, {"fbx": _S.unary("-", 3)}])], [2.5, _S.read(_e, "READY")], [3, _S.read(_e, "READY")]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SLAM", 0.34)
	_S.define(_e, "OPEN", 0.52)
	_S.define(_e, "SCAN0", 0.62)
	_S.define(_e, "SCAN1", 1.4)
	_S.define(_e, "COOL", 0.42)
	_S.define(_e, "DONE", _S.binary("+", _S.read(_e, "SCAN1"), _S.read(_e, "COOL")))
	_S.define(_e, "CLOSE", 1.9)
	_S.define(_e, "SNAP", 2.16)
	_S.define(_e, "TOP", _S.unary("-", _S.prop(_S.prop(_S.read(_e, "meta"), "origin"), 1)))
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f14"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_S.define(_e, "scanY", _S.function_value(_e, "_f15"))
	_S.define(_e, "scanT", _S.function_value(_e, "_f16"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	if _S.truth((_n_t_b0 < _n_SLAM)):
		return 0
	if _S.truth((_n_t_b0 < _n_CLOSE)):
		return (_n_W_b1 * ((1 + (0.45 * exp(((-(_n_t_b0 - _n_SLAM)) * 14)))) + (0.03 * sin((_n_t_b0 * 31)))))
	return _S.numeric_lerp(_n_W_b1,0.7,_S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_CLOSE))/(_n_SNAP - _n_CLOSE)),0.0,1.0)]))
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "o"), "width"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f2")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "body", [])
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "my", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "my"), _S.prop(_S.read(_v0, "A"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "mx", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "mx"), _S.prop(_S.read(_v1, "A"), "w"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "i", _S.binary("+", _S.binary("*", _S.read(_v2, "my"), _S.prop(_S.read(_v2, "A"), "w")), _S.read(_v2, "mx")))
			if _S.truth(_S.unary("!", _S.prop(_S.prop(_S.prop(_S.read(_v2, "A"), "mask"), "data"), _S.read(_v2, "i")))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "mx", 1, "+=", true)
				continue
			_S.define(_v2, "on", _S.function_value(_v2, "_f3"))
			_S.define(_v2, "x", _S.binary("+", _S.prop(_S.read(_v2, "A"), "x"), _S.read(_v2, "mx")))
			_S.define(_v2, "y", _S.binary("+", _S.prop(_S.read(_v2, "A"), "y"), _S.read(_v2, "my")))
			_S.define(_v2, "edge", _S.logical("||", _S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.binary("-", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")])), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.binary("+", _S.read(_v2, "mx"), 1), _S.read(_v2, "my")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("-", _S.read(_v2, "my"), 1)]))), func(): return _S.unary("!", _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "mx"), _S.binary("+", _S.read(_v2, "my"), 1)]))))
			_S.invoke(_S.read(_v2, "body"), "push", [_S.merge([{"x": _S.read(_v2, "x")}, {"y": _S.read(_v2, "y")}, {"c": _S.logical("||", _S.prop(_S.prop(_S.read(_v2, "A"), "pixels"), _S.read(_v2, "i")), func(): return _S.prop(_S.read(_v2, "C"), 2))}, {"edge": _S.read(_v2, "edge")}, {"ts": _S.call_value(_S.read(_v2, "scanT"), [_S.read(_v2, "y"), _S.prop(_S.read(_v2, "A"), "y")])}, {"j": _S.call_value(_S.read(_v2, "rand"), [_S.prop(_S.read(_v2, "o"), "seed"), _S.read(_v2, "mx"), _S.read(_v2, "my")])}])])
			_S.define(_v2, "r", _S.logical("??", _S.invoke(_S.read(_v2, "rows"), "get", [_S.read(_v2, "y")]), func(): return [_S.read(_v2, "x"), _S.read(_v2, "x")]))
			_S.invoke(_S.read(_v2, "rows"), "set", [_S.read(_v2, "y"), [_S.invoke(_S.read(_v2, "Math"), "min", [_S.prop(_S.read(_v2, "r"), 0), _S.read(_v2, "x")]), _S.invoke(_S.read(_v2, "Math"), "max", [_S.prop(_S.read(_v2, "r"), 1), _S.read(_v2, "x")])]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "mx", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "my", 1, "+=", true)
	_S.define(_e, "rings", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "slammed", false)
	_S.define(_e, "snapped", false)
	_S.define(_e, "nextRing", _S.binary("+", _S.read(_e, "SLAM"), 0.08))
	_S.define(_e, "lastRow", _S.binary("-", _S.prop(_S.read(_e, "A"), "y"), 3))
	_S.define(_e, "column", _S.function_value(_e, "_f4"))
	_S.define(_e, "ring", _S.function_value(_e, "_f5"))
	_S.define(_e, "floor", _S.function_value(_e, "_f7"))
	_S.define(_e, "hero", _S.function_value(_e, "_f9"))
	_S.define(_e, "scanline", _S.function_value(_e, "_f10"))
	return _S.merge([{"update": _S.function_value(_e, "_f11")}, {"drawBack": _S.function_value(_e, "_f12")}, {"draw": _S.function_value(_e, "_f13")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_A = _S.read(_parent,"A")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((_n_y_b1 * _S.named_value(_n_A,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_A,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_A,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_widthAt = _S.read(_parent,"widthAt")
	var _n_t = _S.read(_parent,"t")
	var _n_W = _S.read(_parent,"W")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_OPEN = _S.read(_parent,"OPEN")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_o = _S.read(_parent,"o")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_w_b1 = _S.call_value(_n_widthAt,[_n_t, _n_W])
	if _S.truth(((_n_w_b1 <= 0.05) if _S.truth((_n_w_b1 <= 0.05)) else (_n_t > (_n_SNAP + 0.14)))):
		return null
	var _n_bottom_b2 = (_S.numeric_lerp(_n_TOP,0,_S.invoke(_n_ease,"inCubic",[((clampf((float((_n_t - _n_SLAM))/0.06),0.0,1.0) * 0.5) + 0.5)])) if _S.truth(((_n_t - _n_SLAM) < 0.06)) else (_S.numeric_lerp(0,_n_TOP,_S.invoke(_n_ease,"outExpo",[(float((_n_t - _n_SNAP))/0.14)])) if _S.truth((_n_t > _n_SNAP)) else 0))
	var _n_hero_b3 = ((_n_t - _n_SLAM) < 0.07)
	var _n_hollow_b4 = (0.78 * _S.MathFX.smooth((_n_OPEN - 0.16),_n_OPEN,_n_t))
	var _n_thin_b5 = (1 - clampf((float((_n_w_b1 - 1.5))/(_n_W - 1.5)),0.0,1.0))
	if true:
		var _n_y_b6 = floori(_n_TOP)
		while _S.truth((_n_y_b6 < _n_bottom_b2)):
			var _n_pulse_b7 = (1 if _S.truth((fmod((fmod((((_n_y_b6 - _n_TOP) * 0.028) - (_n_t * 2.6)),1) + 1),1) < 0.09)) else 0)
			if true:
				var _n_x_b8 = floori(((-_n_w_b1) * 1.35))
				while _S.truth((_n_x_b8 <= ceili((_n_w_b1 * 1.35)))):
					var _n_q_b9 = (float(absf((_n_x_b8 + 0.5)))/_n_w_b1)
					if _S.truth((_n_q_b9 > 1.35)):
						_n_x_b8 += 1.0
						continue
					if _S.truth(_n_hero_b3):
						_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_y_b6, (_n_WHITE if _S.truth((_n_q_b9 < 0.55)) else (_S.index_value(_n_C,6) if _S.truth((_n_q_b9 < 0.8)) else (_S.index_value(_n_C,5) if _S.truth((_n_q_b9 < 1)) else _S.index_value(_n_C,4)))), (1 if _S.truth((_n_q_b9 < 1)) else (float((1.35 - _n_q_b9))/0.35))])
						_n_x_b8 += 1.0
						continue
					if _S.truth((_n_w_b1 < 2.4)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_y_b6, (_n_WHITE if _S.truth((_n_q_b9 < 0.7)) else _S.index_value(_n_C,6)), (1 if _S.truth((_n_q_b9 < 1)) else (float((1.35 - _n_q_b9))/0.35))])
						_n_x_b8 += 1.0
						continue
					var _n_strand_b10 = 0
					if true:
						var _n_s_b11 = 0
						while _S.truth((_n_s_b11 < 5)):
							if _S.truth((absf((((float((_n_x_b8 + 0.5))/_n_w_b1) - ((_S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_s_b11]) - 0.5) * 1.3)) - (0.06 * sin(((_n_t * (1.5 + _n_s_b11)) + (_n_s_b11 * 2)))))) < 0.05)):
								_n_strand_b10 = 1
							_n_s_b11 += 1.0
					if _S.truth((_n_q_b9 < _n_hollow_b4)):
						_S.invoke(_n_p_b0,"blend",[(_n_x_b8 + 0.5), (_n_y_b6 + 0.5), (_S.index_value(_n_C,6) if _S.truth((_n_strand_b10 if _S.truth(_n_strand_b10) else _n_pulse_b7)) else _S.index_value(_n_C,5)), clampf(((((0.12 + ((0.3 * _n_q_b9) * _n_q_b9)) + (0.3 * _n_strand_b10)) + (0.25 * _n_pulse_b7)) + (0.7 * _n_thin_b5)),0.0,1.0)])
					else:
						if _S.truth((_n_q_b9 < 0.78)):
							var _n_lvl_b12 = maxf(0,(((0 if _S.truth((_n_q_b9 < 0.22)) else (1 if _S.truth((_n_q_b9 < 0.45)) else 2)) - _n_pulse_b7) - _n_strand_b10))
							_S.invoke(_n_p_b0,"px",[_n_x_b8, _n_y_b6, (_n_WHITE if _S.truth(_S.binary("===",_n_lvl_b12,0)) else _S.index_value(_n_C,(7 - _n_lvl_b12)))])
						else:
							if _S.truth((_n_q_b9 < 0.96)):
								_S.invoke(_n_p_b0,"px",[_n_x_b8, _n_y_b6, (_n_WHITE if _S.truth(((_n_q_b9 < 0.93) if _S.truth((_n_q_b9 > 0.86)) else (_n_q_b9 > 0.86))) else _S.index_value(_n_C,6))])
							else:
								_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_y_b6, (_S.index_value(_n_C,5) if _S.truth((_n_q_b9 < 1.1)) else _S.index_value(_n_C,4)), (float((1.35 - _n_q_b9))/0.39)])
					_n_x_b8 += 1.0
			if _S.truth(_S.binary("===",_S.binary("&",_n_y_b6,7),0)):
				var _n_r_b13 = minf((_n_w_b1 + 8),((_n_y_b6 - _n_TOP) + 2))
				if _S.truth((_n_hollow_b4 < 0.4)):
					_S.invoke(_n_p_b0,"glow",[0, _n_y_b6, minf(((_n_w_b1 * 2.6) + 6),((_n_y_b6 - _n_TOP) + 2)), _S.index_value(_n_C,4), (0.55 if _S.truth(_n_hero_b3) else 0.32)])
				else:
					for _iter_0 in _S.array([(-1), 1]):
						var _n_s_b14 = _iter_0
						_S.invoke(_n_p_b0,"glow",[(_n_s_b14 * (_n_w_b1 + 3)), _n_y_b6, _n_r_b13, _S.index_value(_n_C,4), 0.24])
			_n_y_b6 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_widthAt = _S.read(_parent,"widthAt")
	var _n_t = _S.read(_parent,"t")
	var _n_W = _S.read(_parent,"W")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_band = _S.read(_parent,"band")
	var _n_rings = _S.read(_parent,"rings")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_near_b1 = _S.arg(_args,1)
	var _n_w_b2 = _S.call_value(_n_widthAt,[_n_t, _n_W])
	for _iter_0 in _S.array(_n_rings):
		var _n_r_b3 = _iter_0
		var _n_k_b4 = (float((_n_t - _S.named_value(_n_r_b3,"t0")))/0.5)
		if _S.truth(((_n_k_b4 < 0) if _S.truth((_n_k_b4 < 0)) else (_n_k_b4 >= 1))):
			continue
		var _n_y_b5 = _S.numeric_lerp((_n_TOP + 6),(-1),_S.invoke(_n_ease,"inQuad",[_n_k_b4]))
		var _n_rx_b6 = ((_n_w_b2 * 1.18) + 1)
		var _n_c_b7 = (_n_WHITE if _S.truth((_n_k_b4 < 0.25)) else _S.index_value(_n_C,6))
		_S.call_value(_n_band,[_n_p_b0, 0, _n_y_b5, _n_rx_b6, (float(2.6)/_n_rx_b6), 1.5, 1, [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _n_c_b7, _n_WHITE], _S.function_value(_S.capture(_parent,{"near":_n_near_b1,"this":_n_this}),"_f6")])
		if _S.truth(_n_near_b1):
			_S.invoke(_n_p_b0,"glow",[0, _n_y_b5, (_n_rx_b6 + 6), _S.index_value(_n_C,5), 0.25])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) >= 0),_n_near)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_t = _S.read(_parent,"t")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_W = _S.read(_parent,"W")
	var _n_C = _S.read(_parent,"C")
	var _n_this = _S.read(_parent,"this")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_rings = _S.read(_parent,"rings")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_near_b1 = _S.arg(_args,1)
	var _n_on_b2 = ((_S.MathFX.smooth(0,_n_SLAM,_n_t) * 0.5) if _S.truth((_n_t < _n_SLAM)) else (1 - _S.MathFX.smooth(_n_SNAP,(_n_SNAP + 0.5),_n_t)))
	if _S.truth(((_n_on_b2 > 0.01) if _S.truth(not _S.truth(_n_near_b1)) else not _S.truth(_n_near_b1))):
		var _n_rx_b5 = ((_n_W * 1.9) + (0 if _S.truth((_n_t < _n_SLAM)) else (2 * sin((_n_t * 6)))))
		var _n_ry_b6 = 4
		if true:
			var _n_y_b7 = (-4)
			while _S.truth((_n_y_b7 <= 4)):
				if true:
					var _n_x_b8 = floori((-_n_rx_b5))
					while _S.truth((_n_x_b8 <= ceili(_n_rx_b5))):
						var _n_d_b9 = _S.Bridge.hypot([(float((_n_x_b8 + 0.5))/_n_rx_b5), (float((_n_y_b7 + 0.5))/_n_ry_b6)])
						if _S.truth((_n_d_b9 > 1)):
							_n_x_b8 += 1.0
							continue
						_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_y_b7, (_S.index_value(_n_C,7) if _S.truth((_n_d_b9 < 0.35)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b9 < 0.6)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b9 < 0.85)) else _S.index_value(_n_C,4)))), (_n_on_b2 * clampf(((1.05 - _n_d_b9) * 2.4),0.0,1.0))])
						_n_x_b8 += 1.0
				_n_y_b7 += 1.0
		for _iter_0 in _S.array([((-_n_rx_b5) * 0.6), 0, (_n_rx_b5 * 0.6)]):
			var _n_x_b10 = _iter_0
			_S.invoke(_n_p_b0,"glow",[_n_x_b10, (-1), (_n_rx_b5 * 1.3), _S.index_value(_n_C,4), (0.3 * _n_on_b2)])
	var _n_keep_b3 = _S.function_value(_S.capture(_parent,{"near":_n_near_b1,"this":_n_this}),"_f8")
	for _iter_1 in _S.array(_n_rings):
		var _n_r_b11 = _iter_1
		var _n_k_b12 = (float(((_n_t - _S.named_value(_n_r_b11,"t0")) - 0.5))/0.35)
		if _S.truth(((_n_k_b12 < 1) if _S.truth((_n_k_b12 >= 0)) else (_n_k_b12 >= 0))):
			_S.call_value(_n_band,[_n_p_b0, 0, 0, (_n_W * (1.2 + (1.3 * _S.invoke(_n_ease,"outCubic",[_n_k_b12])))), 0.16, 1.5, (1 - _n_k_b12), [_S.index_value(_n_C,3), _S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6)], _n_keep_b3])
	for _iter_2 in _S.array([[0, 1], [0.08, 0.65]]):
		var _tuple_3 = _iter_2
		var _n_d_b13 = _S.prop(_tuple_3,0)
		var _n_s_b14 = _S.prop(_tuple_3,1)
		var _n_k_b15 = (float(((_n_t - _n_SLAM) - _n_d_b13))/0.55)
		if _S.truth(((_n_k_b15 < 1) if _S.truth((_n_k_b15 >= 0)) else (_n_k_b15 >= 0))):
			_S.call_value(_n_band,[_n_p_b0, 0, 0.5, ((92 * _n_s_b14) * _S.invoke(_n_ease,"outCubic",[_n_k_b15])), 0.16, maxf(1,(5 * (1 - _n_k_b15))), (1.15 - _n_k_b15), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _n_keep_b3, (_n_k_b15 < 0.25)])
	var _n_k_b4 = (float((_n_t - _n_SNAP))/0.45)
	if _S.truth(((_n_k_b4 < 1) if _S.truth((_n_k_b4 >= 0)) else (_n_k_b4 >= 0))):
		_S.call_value(_n_band,[_n_p_b0, 0, 0, (10 + (26 * _S.invoke(_n_ease,"outCubic",[_n_k_b4]))), 0.16, ((2 * (1 - _n_k_b4)) + 0.5), (1.1 - _n_k_b4), [_S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _n_keep_b3, (_n_k_b4 < 0.3)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) >= 0),_n_near)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_C = _S.read(_parent,"C")
	var _n_COOL = _S.read(_parent,"COOL")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_body = _S.read(_parent,"body")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t >= _n_DONE) if _S.truth((_n_t >= _n_DONE)) else (_n_t < (_n_SCAN0 - 0.2)))):
		return null
	var _n_blink_b1 = floori((_n_t * 24))
	for _iter_0 in _S.array(_n_body):
		var _n_b_b2 = _iter_0
		var _n_a_b3 = (_n_t - _S.named_value(_n_b_b2,"ts"))
		if _S.truth((_n_a_b3 < 0)):
			if _S.truth(((_S.MathFX.rand([_S.named_value(_n_b_b2,"x"),_S.named_value(_n_b_b2,"y"),_n_blink_b1]) < 0.6) if _S.truth(_S.named_value(_n_b_b2,"edge")) else _S.named_value(_n_b_b2,"edge"))):
				_S.invoke(_n_p_b0,"dot",[_S.named_value(_n_b_b2,"x"), _S.named_value(_n_b_b2,"y"), _S.index_value(_n_C,1), (0.8 * _S.MathFX.smooth((_n_SCAN0 - 0.25),(_n_SCAN0 - 0.05),_n_t))])
			continue
		var _n_k_b4 = (float(_n_a_b3)/_n_COOL)
		var _n_dx_b5 = (((-1) if _S.truth((_S.named_value(_n_b_b2,"j") < 0.15)) else 1) if _S.truth(((_S.named_value(_n_b_b2,"j") < 0.3) if _S.truth((_n_a_b3 < 0.06)) else (_n_a_b3 < 0.06))) else 0)
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_b_b2,"x") + _n_dx_b5), _S.named_value(_n_b_b2,"y"), (_n_WHITE if _S.truth((_n_k_b4 < 0.18)) else (_S.ColorFX.mix(_S.named_value(_n_b_b2,"c"),_S.index_value(_n_C,6),0.72) if _S.truth((_n_k_b4 < 0.45)) else (_S.ColorFX.mix(_S.named_value(_n_b_b2,"c"),_S.index_value(_n_C,5),0.38) if _S.truth((_n_k_b4 < 0.75)) else _S.named_value(_n_b_b2,"c"))))])
		if _S.truth((_n_k_b4 < 0.5)):
			_S.invoke(_n_p_b0,"light",[(_S.named_value(_n_b_b2,"x") + _n_dx_b5), _S.named_value(_n_b_b2,"y"), _S.index_value(_n_C,5), (0.22 * (1 - (float(_n_k_b4)/0.5)))])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_SCAN1 = _S.read(_parent,"SCAN1")
	var _n_scanY = _S.read(_parent,"scanY")
	var _n_A = _S.read(_parent,"A")
	var _n_widthAt = _S.read(_parent,"widthAt")
	var _n_W = _S.read(_parent,"W")
	var _n_rows = _S.read(_parent,"rows")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t < _n_SCAN0) if _S.truth((_n_t < _n_SCAN0)) else (_n_t > _n_SCAN1))):
		return null
	var _n_y_b1 = floori(_S.call_value(_n_scanY,[_n_t, _S.named_value(_n_A,"y")]))
	var _n_w_b2 = (_S.call_value(_n_widthAt,[_n_t, _n_W]) * 1.5)
	var _n_r_b3 = _S.invoke(_n_rows,"get",[_n_y_b1])
	if true:
		var _n_x_b4 = floori((-_n_w_b2))
		while _S.truth((_n_x_b4 <= ceili(_n_w_b2))):
			var _n_inside_b5 = ((_n_x_b4 <= _S.index_value(_n_r_b3,1)) if _S.truth(((_n_x_b4 >= _S.index_value(_n_r_b3,0)) if _S.truth(_n_r_b3) else _n_r_b3)) else ((_n_x_b4 >= _S.index_value(_n_r_b3,0)) if _S.truth(_n_r_b3) else _n_r_b3))
			_S.invoke(_n_p_b0,"dot",[_n_x_b4, _n_y_b1, (_n_WHITE if _S.truth(_n_inside_b5) else _S.index_value(_n_C,6)), (1 if _S.truth(_n_inside_b5) else (1 - (float(absf((_n_x_b4 + 0.5)))/(_n_w_b2 + 1))))])
			_n_x_b4 += 1.0
	_S.invoke(_n_p_b0,"glowLine",[(-_n_w_b2), _n_y_b1, _n_w_b2, _n_y_b1, 5, _S.index_value(_n_C,5), 0.5])
	if _S.truth(_n_r_b3):
		for _iter_0 in _S.array(_n_r_b3):
			var _n_x_b6 = _iter_0
			_S.call_value(_n_sparkle,[_n_p_b0, (_n_x_b6 + 0.5), _n_y_b1, 2, _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.3])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "SLAM"), 0.04))):
		var _v38 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.8])):
			var _v39 = _S.scope(_v38)
			_S.define(_v39, "a", _S.invoke(_S.read(_v39, "R"), "range", [_S.binary("*", _S.unary("-", _S.prop(_S.read(_v39, "Math"), "PI")), 0.95), _S.binary("*", _S.unary("-", _S.prop(_S.read(_v39, "Math"), "PI")), 0.05)]))
			_S.define(_v39, "D", _S.invoke(_S.read(_v39, "R"), "range", [30, 64]))
			_S.define(_v39, "T", _S.invoke(_S.read(_v39, "R"), "range", [0.18, 0.28]))
			_S.define(_v39, "v", _S.binary("/", _S.binary("*", _S.read(_v39, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v39, "Math"), "exp", [_S.binary("*", 3, _S.read(_v39, "T"))]), 1)))
			_S.define(_v39, "x", _S.binary("*", _S.invoke(_S.read(_v39, "Math"), "cos", [_S.read(_v39, "a")]), _S.read(_v39, "D")))
			_S.define(_v39, "y", _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v39, "Math"), "sin", [_S.read(_v39, "a")]), _S.read(_v39, "D")), 0.8), 2))
			_S.define(_v39, "l", _S.logical("||", _S.invoke(_S.read(_v39, "Math"), "hypot", [_S.read(_v39, "x"), _S.binary("+", _S.read(_v39, "y"), 2)]), func(): return 1))
			_S.invoke(_S.read(_v39, "ps"), "spawn", [_S.prop(_S.read(_v39, "P"), "STREAK"), _S.read(_v39, "x"), _S.read(_v39, "y"), _S.binary("*", _S.binary("/", _S.unary("-", _S.read(_v39, "x")), _S.read(_v39, "l")), _S.read(_v39, "v")), _S.binary("*", _S.binary("/", _S.unary("-", _S.binary("+", _S.read(_v39, "y"), 2)), _S.read(_v39, "l")), _S.read(_v39, "v")), _S.read(_v39, "T"), (_S.prop(_S.read(_v39, "C"), 6) if _S.truth(_S.invoke(_S.read(_v39, "R"), "chance", [0.5])) else _S.prop(_S.read(_v39, "C"), 5))])
		if _S.truth(_S.invoke(_S.read(_v38, "R"), "chance", [0.12])):
			var _v40 = _S.scope(_v38)
			_S.define(_v40, "s", _S.invoke(_S.read(_v40, "R"), "sign", []))
			_S.invoke(_S.read(_v40, "ps"), "spawn", [_S.prop(_S.read(_v40, "P"), "VAPOUR"), _S.binary("*", _S.read(_v40, "s"), _S.invoke(_S.read(_v40, "R"), "range", [30, 56])), _S.unary("-", _S.invoke(_S.read(_v40, "R"), "range", [0, 2])), _S.binary("*", _S.unary("-", _S.read(_v40, "s")), _S.invoke(_S.read(_v40, "R"), "range", [40, 70])), _S.unary("-", _S.invoke(_S.read(_v40, "R"), "range", [0, 4])), _S.invoke(_S.read(_v40, "R"), "range", [0.3, 0.45]), _S.prop(_S.read(_v40, "C"), 5), _S.invoke(_S.read(_v40, "R"), "range", [2, 3])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SLAM")), func(): return _S.unary("!", _S.read(_e, "slammed")))):
		var _v41 = _S.scope(_e)
		_S.write(_v41, "slammed", true, "=", false)
		_S.invoke(_S.read(_v41, "lights"), "add", [0, _S.unary("-", 40), 120, _S.prop(_S.read(_v41, "C"), 4), 1, 0.55])
		_S.invoke(_S.read(_v41, "lights"), "add", [0, _S.unary("-", 10), 44, _S.read(_v41, "WHITE"), 0.9, 0.14])
		var _v42 = _S.scope(_v41)
		_S.define(_v42, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v42, "i"), 34)):
			var _v43 = _S.scope(_v42)
			_S.define(_v43, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v43, "Math"), "PI")), 2), _S.binary("*", _S.invoke(_S.read(_v43, "R"), "sign", []), _S.invoke(_S.read(_v43, "R"), "range", [0.35, 1.45]))))
			_S.define(_v43, "sp", _S.invoke(_S.read(_v43, "R"), "range", [110, 270]))
			_S.invoke(_S.read(_v43, "ps"), "spawn", [_S.prop(_S.read(_v43, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v43, "R"), "range", [_S.unary("-", _S.read(_v43, "W")), _S.read(_v43, "W")]), 0.6), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "cos", [_S.read(_v43, "a")]), _S.read(_v43, "sp")), _S.binary("*", _S.invoke(_S.read(_v43, "Math"), "sin", [_S.read(_v43, "a")]), _S.read(_v43, "sp")), _S.invoke(_S.read(_v43, "R"), "range", [0.25, 0.75])])
			_v42 = _S.iteration(_v42)
			_S.write(_v42, "i", 1, "+=", true)
		var _v44 = _S.scope(_v41)
		_S.define(_v44, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v44, "i"), 18)):
			var _v45 = _S.scope(_v44)
			_S.define(_v45, "s", _S.invoke(_S.read(_v45, "R"), "sign", []))
			_S.invoke(_S.read(_v45, "ps"), "spawn", [_S.prop(_S.read(_v45, "P"), "VAPOUR"), _S.binary("*", _S.read(_v45, "s"), _S.invoke(_S.read(_v45, "R"), "range", [4, 18])), _S.unary("-", _S.invoke(_S.read(_v45, "R"), "range", [0, 4])), _S.binary("*", _S.read(_v45, "s"), _S.invoke(_S.read(_v45, "R"), "range", [40, 150])), _S.unary("-", _S.invoke(_S.read(_v45, "R"), "range", [2, 18])), _S.invoke(_S.read(_v45, "R"), "range", [0.5, 0.95]), (_S.prop(_S.read(_v45, "C"), 6) if _S.truth(_S.invoke(_S.read(_v45, "R"), "chance", [0.6])) else _S.prop(_S.read(_v45, "C"), 5)), _S.invoke(_S.read(_v45, "R"), "range", [3, 6])])
			_v44 = _S.iteration(_v44)
			_S.write(_v44, "i", 1, "+=", true)
		var _v46 = _S.scope(_v41)
		_S.define(_v46, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v46, "i"), 10)):
			_S.invoke(_S.read(_v46, "ps"), "spawn", [_S.prop(_S.read(_v46, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", _S.read(_v46, "W")), _S.read(_v46, "W")]), 1.3), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [2, 40])), _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [10, 40])), _S.invoke(_S.read(_v46, "R"), "range", [0.4, 0.8]), (_S.read(_v46, "WHITE") if _S.truth(_S.invoke(_S.read(_v46, "R"), "chance", [0.5])) else _S.prop(_S.read(_v46, "C"), 6)), _S.invoke(_S.read(_v46, "R"), "range", [1, 2.2])])
			_v46 = _S.iteration(_v46)
			_S.write(_v46, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "slammed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CLOSE")))):
		var _v47 = _S.scope(_e)
		if _S.truth(_S.binary(">=", _S.read(_v47, "t"), _S.read(_v47, "nextRing"))):
			_S.last([_S.invoke(_S.read(_v47, "rings"), "push", [_S.merge([{"t0": _S.read(_v47, "nextRing")}])]), _S.write(_v47, "nextRing", 0.17, "+=", false)])
		_S.define(_v47, "w", _S.call_value(_S.read(_v47, "widthAt"), [_S.read(_v47, "t"), _S.read(_v47, "W")]))
		if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])):
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 0.8), 0.8]), _S.read(_v47, "w")), _S.binary("+", _S.read(_v47, "TOP"), _S.invoke(_S.read(_v47, "R"), "range", [9, 36])), 0, _S.invoke(_S.read(_v47, "R"), "range", [60, 110]), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.45]), (_S.read(_v47, "WHITE") if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])) else _S.prop(_S.read(_v47, "C"), 6))])
		if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.18])):
			_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STAR"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v47, "R"), "sign", []), _S.read(_v47, "w")), _S.invoke(_S.read(_v47, "R"), "range", [0.8, 1.3])), _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [4, 70])), 0, _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [5, 20])), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v47, "C"), 6), _S.invoke(_S.read(_v47, "R"), "range", [0.6, 1.8])])
		if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.1])):
			var _v48 = _S.scope(_v47)
			_S.define(_v48, "s", _S.invoke(_S.read(_v48, "R"), "sign", []))
			_S.invoke(_S.read(_v48, "ps"), "spawn", [_S.prop(_S.read(_v48, "P"), "VAPOUR"), _S.binary("*", _S.read(_v48, "s"), _S.invoke(_S.read(_v48, "R"), "range", [8, 16])), _S.unary("-", _S.invoke(_S.read(_v48, "R"), "range", [0, 3])), _S.binary("*", _S.read(_v48, "s"), _S.invoke(_S.read(_v48, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v48, "R"), "range", [2, 8])), _S.invoke(_S.read(_v48, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v48, "C"), 5), _S.invoke(_S.read(_v48, "R"), "range", [2.5, 4])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "SCAN0")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "SCAN1")))):
		var _v49 = _S.scope(_e)
		_S.define(_v49, "y", _S.invoke(_S.read(_v49, "Math"), "floor", [_S.call_value(_S.read(_v49, "scanY"), [_S.read(_v49, "t"), _S.prop(_S.read(_v49, "A"), "y")])]))
		if _S.truth(_S.binary("!==", _S.read(_v49, "y"), _S.read(_v49, "lastRow"))):
			var _v50 = _S.scope(_v49)
			_S.write(_v50, "lastRow", _S.read(_v50, "y"), "=", false)
			_S.define(_v50, "r", _S.invoke(_S.read(_v50, "rows"), "get", [_S.read(_v50, "y")]))
			if _S.truth(_S.logical("&&", _S.read(_v50, "r"), func(): return _S.invoke(_S.read(_v50, "R"), "chance", [0.7]))):
				for _v51 in _S.array([[_S.prop(_S.read(_v50, "r"), 0), _S.unary("-", 1)], [_S.binary("+", _S.prop(_S.read(_v50, "r"), 1), 1), 1]]):
					var _v52 = _S.scope(_v50)
					var _v53 = _v51
					_S.define(_v52, "x", _S.prop(_v53, 0))
					_S.define(_v52, "s", _S.prop(_v53, 1))
					if _S.truth(_S.invoke(_S.read(_v52, "R"), "chance", [0.6])):
						_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "MOTE"), _S.read(_v52, "x"), _S.read(_v52, "y"), _S.binary("*", _S.read(_v52, "s"), _S.invoke(_S.read(_v52, "R"), "range", [40, 90])), _S.invoke(_S.read(_v52, "R"), "range", [_S.unary("-", 20), 10]), _S.invoke(_S.read(_v52, "R"), "range", [0.15, 0.3]), (_S.read(_v52, "WHITE") if _S.truth(_S.invoke(_S.read(_v52, "R"), "chance", [0.5])) else _S.prop(_S.read(_v52, "C"), 6)), 0.6])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "DONE")), func(): return _S.binary("<", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt")), _S.read(_e, "DONE")))):
		var _v54 = _S.scope(_e)
		var _v55 = _S.scope(_v54)
		_S.define(_v55, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v55, "i"), 6)):
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "b", _S.prop(_S.read(_v56, "body"), _S.invoke(_S.read(_v56, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_v56, "R"), "next", []), _S.prop(_S.read(_v56, "body"), "length"))])))
			_S.invoke(_S.read(_v56, "ps"), "spawn", [_S.prop(_S.read(_v56, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v56, "b"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v56, "b"), "y"), 0.5), _S.invoke(_S.read(_v56, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v56, "R"), "range", [6, 20])), _S.invoke(_S.read(_v56, "R"), "range", [0.4, 0.8]), (_S.read(_v56, "WHITE") if _S.truth(_S.invoke(_S.read(_v56, "R"), "chance", [0.5])) else _S.prop(_S.read(_v56, "C"), 6)), _S.invoke(_S.read(_v56, "R"), "range", [1, 2])])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "SNAP")), func(): return _S.unary("!", _S.read(_e, "snapped")))):
		var _v57 = _S.scope(_e)
		_S.write(_v57, "snapped", true, "=", false)
		_S.invoke(_S.read(_v57, "lights"), "add", [0, _S.unary("-", 1), 32, _S.prop(_S.read(_v57, "C"), 4), 0.5, 0.25])
		_S.invoke(_S.read(_v57, "lights"), "add", [0, _S.unary("-", 1), 10, _S.read(_v57, "WHITE"), 0.5, 0.08])
		var _v58 = _S.scope(_v57)
		_S.define(_v58, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v58, "i"), 22)):
			var _v59 = _S.scope(_v58)
			_S.define(_v59, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v59, "Math"), "PI")), 2), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 1.4), 1.4])))
			_S.define(_v59, "sp", _S.invoke(_S.read(_v59, "R"), "range", [90, 260]))
			_S.invoke(_S.read(_v59, "ps"), "spawn", [_S.prop(_S.read(_v59, "P"), "SPARK"), _S.invoke(_S.read(_v59, "R"), "range", [_S.unary("-", 2), 2]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v59, "Math"), "cos", [_S.read(_v59, "a")]), _S.read(_v59, "sp")), _S.binary("*", _S.invoke(_S.read(_v59, "Math"), "sin", [_S.read(_v59, "a")]), _S.read(_v59, "sp")), _S.invoke(_S.read(_v59, "R"), "range", [0.2, 0.6])])
			_v58 = _S.iteration(_v58)
			_S.write(_v58, "i", 1, "+=", true)
		var _v60 = _S.scope(_v57)
		_S.define(_v60, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v60, "i"), 12)):
			_S.invoke(_S.read(_v60, "ps"), "spawn", [_S.prop(_S.read(_v60, "P"), "STAR"), _S.invoke(_S.read(_v60, "R"), "range", [_S.unary("-", 16), 16]), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [0, 46])), _S.invoke(_S.read(_v60, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [8, 26])), _S.invoke(_S.read(_v60, "R"), "range", [0.5, 0.9]), (_S.read(_v60, "WHITE") if _S.truth(_S.invoke(_S.read(_v60, "R"), "chance", [0.5])) else _S.prop(_S.read(_v60, "C"), 6)), _S.invoke(_S.read(_v60, "R"), "range", [0.6, 1.8])])
			_v60 = _S.iteration(_v60)
			_S.write(_v60, "i", 1, "+=", true)
		var _v61 = _S.scope(_v57)
		_S.define(_v61, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v61, "i"), 18)):
			_S.invoke(_S.read(_v61, "ps"), "spawn", [(_S.prop(_S.read(_v61, "P"), "STAR") if _S.truth(_S.invoke(_S.read(_v61, "R"), "chance", [0.6])) else _S.prop(_S.read(_v61, "P"), "MOTE")), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v61, "R"), "range", [10, 100])), _S.invoke(_S.read(_v61, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v61, "R"), "range", [14, 40])), _S.invoke(_S.read(_v61, "R"), "range", [0.5, 0.75]), (_S.read(_v61, "WHITE") if _S.truth(_S.invoke(_S.read(_v61, "R"), "chance", [0.4])) else (_S.prop(_S.read(_v61, "C"), 6) if _S.truth(_S.invoke(_S.read(_v61, "R"), "chance", [0.5])) else _S.prop(_S.read(_v61, "C"), 5))), _S.invoke(_S.read(_v61, "R"), "range", [0.5, 1.4]), _S.invoke(_S.read(_v61, "R"), "range", [0, 0.25])])
			_v61 = _S.iteration(_v61)
			_S.write(_v61, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_floor = _S.read(_parent,"floor")
	var _n_ring = _S.read(_parent,"ring")
	var _n_column = _S.read(_parent,"column")
	var _n_t = _S.read(_parent,"t")
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_TOP = _S.read(_parent,"TOP")
	var _n_ease = _S.read(_parent,"ease")
	var _n_C = _S.read(_parent,"C")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_floor,[_n_p_b0, false])
	_S.call_value(_n_ring,[_n_p_b0, false])
	_S.call_value(_n_column,[_n_p_b0])
	if _S.truth((_n_t < _n_SLAM)):
		var _n_a_b1 = (_S.MathFX.smooth(0,(_n_SLAM * 0.8),_n_t) * 0.8)
		var _n_head_b2 = _S.numeric_lerp(_n_TOP,0,_S.invoke(_n_ease,"outCubic",[clampf((float(_n_t)/(_n_SLAM * 0.6)),0.0,1.0)]))
		if true:
			var _n_y_b5 = _n_TOP
			while _S.truth((_n_y_b5 < _n_head_b2)):
				_S.invoke(_n_p_b0,"dot",[0, _n_y_b5, (_S.index_value(_n_C,6) if _S.truth(_S.binary("===",_S.binary("&",_n_y_b5,1),0)) else _S.index_value(_n_C,5)), (_n_a_b1 * (0.35 + (0.65 * (float((_n_y_b5 - _n_TOP))/(-_n_TOP)))))])
				_n_y_b5 += 1.0
		_S.invoke(_n_p_b0,"glow",[0, _n_head_b2, 10, _S.index_value(_n_C,5), (0.5 * _n_a_b1)])
		var _n_rx_b3 = _S.numeric_lerp(34,12,_S.invoke(_n_ease,"outCubic",[(float(_n_t)/_n_SLAM)]))
		var _n_k_b4 = _S.MathFX.smooth(0,0.15,_n_t)
		if true:
			var _n_i_b6 = 0
			while _S.truth((_n_i_b6 < 48)):
				var _n_g_b7 = (((float(_n_i_b6)/48) * _n_TAU) + (_n_t * 3))
				if _S.truth(fmod(floori((float(_n_i_b6)/4)),2)):
					_n_i_b6 += 1.0
					continue
				_S.invoke(_n_p_b0,"dot",[(cos(_n_g_b7) * _n_rx_b3), ((sin(_n_g_b7) * _n_rx_b3) * 0.16), (_n_WHITE if _S.truth(_S.binary("===",fmod(_n_i_b6,4),0)) else _S.index_value(_n_C,5)), _n_k_b4])
				_n_i_b6 += 1.0
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_hero = _S.read(_parent,"hero")
	var _n_scanline = _S.read(_parent,"scanline")
	var _n_ring = _S.read(_parent,"ring")
	var _n_floor = _S.read(_parent,"floor")
	var _n_t = _S.read(_parent,"t")
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_A = _S.read(_parent,"A")
	var _n_C = _S.read(_parent,"C")
	var _n_SLAM = _S.read(_parent,"SLAM")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_hero,[_n_p_b0])
	_S.call_value(_n_scanline,[_n_p_b0])
	_S.call_value(_n_ring,[_n_p_b0, true])
	_S.call_value(_n_floor,[_n_p_b0, true])
	if _S.truth(((_n_t < (_n_DONE + 0.3)) if _S.truth((_n_t >= _n_DONE)) else (_n_t >= _n_DONE))):
		_S.invoke(_n_p_b0,"outline",[_S.named_value(_n_A,"mask"), _S.named_value(_n_A,"x"), _S.named_value(_n_A,"y"), _S.index_value(_n_C,6), (1 - (float((_n_t - _n_DONE))/0.3))])
	if _S.truth(((_n_t < (_n_SLAM + 0.16)) if _S.truth((_n_t > _n_SLAM)) else (_n_t > _n_SLAM))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-2), (12 * (1 - (float((_n_t - _n_SLAM))/0.16))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.6])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_t_b0 = _S.arg(_args,0)
	return (1 if _S.truth((_n_t_b0 >= _n_DONE)) else 0)
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_SCAN1 = _S.read(_parent,"SCAN1")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	return _S.numeric_lerp((_n_y0_b1 - 2),1,_S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t_b0 - _n_SCAN0))/(_n_SCAN1 - _n_SCAN0)),0.0,1.0)]))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_SCAN1 = _S.read(_parent,"SCAN1")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_y0_b1 = _S.arg(_args,1)
	return (_n_SCAN0 + (float(((_n_SCAN1 - _n_SCAN0) * acos((1 - (2 * clampf((float(((_n_y_b0 + 0.5) - (_n_y0_b1 - 2)))/(3 - _n_y0_b1)),0.0,1.0))))))/PI))
	return null
