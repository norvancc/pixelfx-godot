@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/emp-blast.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "strokeArc", _S.import_value("fx/scifi/_lib.js", "strokeArc"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "EMP blast"}, {"desc": "A disc charge ticks, pops white, and a bubble of rolling scanlines swells out with arcs crawling its skin; it strobes, tears and shorts out into falling dead pixels."}, {"tags": ["scifi", "emp", "pulse", "shockwave", "electric", "grenade", "glitch", "one-shot"]}, {"size": [152, 116]}, {"origin": [76, 84]}, {"duration": 3.2}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#0d0820", "#1c1658", "#2d2aa0", "#3f55e8", "#5a8eff", "#9cc4ff", "#dceaff", "#ffffff"]}, {"fringe": "#ff5ad8"}, {"radius": 56}, {"seed": 33}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "POP", 0.42)
	_S.define(_e, "GROW", 0.32)
	_S.define(_e, "STROBE", 1.25)
	_S.define(_e, "BREAK", 1.58)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "F", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "fringe")]))
	_S.define(_e, "RM", _S.prop(_S.read(_e, "o"), "radius"))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.function_value(_e, "_f1")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "arcs", [])
	_S.define(_e, "dead", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "broke", false)
	_S.define(_e, "nextArc", 0)
	_S.define(_e, "star", [])
	_S.define(_e, "starAt", _S.unary("-", 1))
	_S.define(_e, "radius", _S.function_value(_e, "_f2"))
	_S.define(_e, "off", _S.function_value(_e, "_f3"))
	_S.define(_e, "charge", _S.function_value(_e, "_f4"))
	_S.define(_e, "bubble", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"drawBack": _S.function_value(_e, "_f7")}, {"draw": _S.function_value(_e, "_f8")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_RM = _S.read(_parent,"RM")
	var _n_ease = _S.read(_parent,"ease")
	var _n_GROW = _S.read(_parent,"GROW")
	return (0 if _S.truth((_n_t < _n_POP)) else ((_n_RM * (0.12 + (0.88 * _S.invoke(_n_ease,"outExpo",[clampf((float((_n_t - _n_POP))/_n_GROW),0.0,1.0)])))) * (1 + (0.04 * clampf((float(((_n_t - _n_POP) - _n_GROW))/0.8),0.0,1.0)))))
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_STROBE = _S.read(_parent,"STROBE")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_o = _S.read(_parent,"o")
	return ((_S.MathFX.rand([_S.named_value(_n_o,"seed"),floori((_n_t * 30))]) < (0.2 + (0.5 * (float((_n_t - _n_STROBE))/(_n_BREAK - _n_STROBE))))) if _S.truth(((_n_t < _n_BREAK) if _S.truth((_n_t > _n_STROBE)) else (_n_t > _n_STROBE))) else ((_n_t < _n_BREAK) if _S.truth((_n_t > _n_STROBE)) else (_n_t > _n_STROBE)))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_o = _S.read(_parent,"o")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_strokeArc = _S.read(_parent,"strokeArc")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t >= _n_POP)):
		return null
	var _n_k_b1 = (float(_n_t)/_n_POP)
	var _n_r_b2 = (1 + ((3.2 * _n_k_b1) * _n_k_b1))
	var _n_tick_b3 = (sin((_n_TAU * ((2 * _n_t) + ((10 * _n_t) * _n_t)))) > 0)
	_S.invoke(_n_p_b0,"circle",[0, (-7), (_n_r_b2 + 1), _S.index_value(_n_C,4)])
	_S.invoke(_n_p_b0,"circle",[0, (-7), _n_r_b2, (_n_WHITE if _S.truth(_n_tick_b3) else _S.index_value(_n_C,6))])
	var _n_f_b4 = floori((_n_t * 30))
	var _n_rr_b5 = _S.construct(_n_Rng,[((_S.named_value(_n_o,"seed") * 97) + _n_f_b4)])
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < (1 + floori((_n_k_b1 * 3))))):
			var _n_a_b7 = _S.invoke(_n_rr_b5,"range",[0, _n_TAU])
			var _n_l_b8 = ((_n_r_b2 + 2) + (_S.invoke(_n_rr_b5,"range",[2, 6]) * _n_k_b1))
			_S.call_value(_n_strokeArc,[_n_p_b0, _S.call_value(_n_bolt,[_n_rr_b5, (cos(_n_a_b7) * _n_r_b2), ((-7) + (sin(_n_a_b7) * _n_r_b2)), (cos(_n_a_b7) * _n_l_b8), ((-7) + (sin(_n_a_b7) * _n_l_b8)), {"jag":0.4,"depth":2}]), [_S.index_value(_n_C,2), _S.index_value(_n_C,5), _S.index_value(_n_C,4)], 0.7, 0.5])
			_n_i_b6 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-7), (8 + (16 * _n_k_b1)), _S.index_value(_n_C,4), (0.4 + ((0.5 * _n_k_b1) * (1 if _S.truth(_n_tick_b3) else 0.6)))])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_radius = _S.read(_parent,"radius")
	var _n_t = _S.read(_parent,"t")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_off = _S.read(_parent,"off")
	var _n_POP = _S.read(_parent,"POP")
	var _n_Map = _S.read(_parent,"Map")
	var _n_o = _S.read(_parent,"o")
	var _n_STROBE = _S.read(_parent,"STROBE")
	var _n_F = _S.read(_parent,"F")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_near_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.call_value(_n_radius,[])
	if _S.truth((((_n_r_b2 <= 1) if _S.truth((_n_r_b2 <= 1)) else (_n_t >= _n_BREAK)) if _S.truth(((_n_r_b2 <= 1) if _S.truth((_n_r_b2 <= 1)) else (_n_t >= _n_BREAK))) else _S.call_value(_n_off,[]))):
		return null
	var _n_age_b3 = (_n_t - _n_POP)
	var _n_slot_b4 = floori((_n_t * 30))
	var _n_roll_b5 = (_n_age_b3 * 40)
	var _n_ry_b6 = (_n_r_b2 * 0.16)
	var _n_tears_b7 = _S.construct(_n_Map,[])
	if true:
		var _n_i_b8 = 0
		while _S.truth((_n_i_b8 < (2 + (4 if _S.truth((_n_t > _n_STROBE)) else 0)))):
			_S.invoke(_n_tears_b7,"set",[floori(((-_S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_slot_b4,_n_i_b8])) * _n_r_b2)), (((-1) if _S.truth((_S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_slot_b4,_n_i_b8,1]) < 0.5)) else 1) * (2 + floori((_S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_slot_b4,_n_i_b8,2]) * 4))))])
			_n_i_b8 += 1.0
	if true:
		var _n_y_b9 = floori((-_n_r_b2))
		while _S.truth((_n_y_b9 <= ceili(_n_ry_b6))):
			var _n_shift_b10 = _S.logical("??",_S.invoke(_n_tears_b7,"get",[_n_y_b9]),func():return 0)
			if true:
				var _n_x_b11 = floori((-_n_r_b2))
				while _S.truth((_n_x_b11 <= ceili(_n_r_b2))):
					var _n_sx_b12 = (_n_x_b11 - _n_shift_b10)
					var _n_d_b13 = (float(_S.Bridge.hypot([(_n_sx_b12 + 0.5), ((_n_y_b9 + 0.5) if _S.truth((_n_y_b9 < 0)) else 0)]))/_n_r_b2)
					if _S.truth((_n_d_b13 > 1)):
						if _S.truth((_S.binary("===",fmod((_n_x_b11 + _n_y_b9),2),0) if _S.truth(((_n_d_b13 < (1 + (float(1.4)/_n_r_b2))) if _S.truth(((_n_y_b9 < 0) if _S.truth(_n_near_b1) else _n_near_b1)) else ((_n_y_b9 < 0) if _S.truth(_n_near_b1) else _n_near_b1))) else ((_n_d_b13 < (1 + (float(1.4)/_n_r_b2))) if _S.truth(((_n_y_b9 < 0) if _S.truth(_n_near_b1) else _n_near_b1)) else ((_n_y_b9 < 0) if _S.truth(_n_near_b1) else _n_near_b1)))):
							_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b9, _n_F])
						_n_x_b11 += 1.0
						continue
					if _S.truth((_n_y_b9 >= 0)):
						var _n_e_b17 = _S.Bridge.hypot([(float((_n_sx_b12 + 0.5))/_n_r_b2), (float((_n_y_b9 + 0.5))/_n_ry_b6)])
						if _S.truth((((_n_e_b17 > 1) if _S.truth((_n_e_b17 > 1)) else (_n_e_b17 < 0.92)) if _S.truth(((_n_e_b17 > 1) if _S.truth((_n_e_b17 > 1)) else (_n_e_b17 < 0.92))) else _S.binary("!==",(_n_y_b9 > 0),_n_near_b1))):
							_n_x_b11 += 1.0
							continue
						_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b9, (_S.index_value(_n_C,6) if _S.truth((_n_e_b17 > 0.97)) else _S.index_value(_n_C,4))])
						_n_x_b11 += 1.0
						continue
					if _S.truth(not _S.truth(_n_near_b1)):
						_n_x_b11 += 1.0
						continue
					var _n_rim_b14 = pow(_n_d_b13,6)
					var _n_line_b15 = (fmod((fmod((_n_y_b9 - _n_roll_b5),4) + 4),4) < 1)
					var _n_band_b16 = (fmod((fmod((_n_y_b9 - (_n_roll_b5 * 0.5)),22) + 22),22) < 4)
					if _S.truth((_n_d_b13 > 0.965)):
						_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b9, (_n_WHITE if _S.truth(_n_shift_b10) else (_n_WHITE if _S.truth(((_n_sx_b12 < 0) if _S.truth(((-_n_y_b9) > (_n_r_b2 * 0.55))) else ((-_n_y_b9) > (_n_r_b2 * 0.55)))) else _S.index_value(_n_C,6)))])
					else:
						if _S.truth((_n_d_b13 > 0.93)):
							_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b9, _S.index_value(_n_C,4)])
						else:
							if _S.truth(_n_shift_b10):
								_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b9, (_n_F if _S.truth((absf(_n_sx_b12) > (_n_r_b2 * 0.8))) else (_S.index_value(_n_C,6) if _S.truth(_S.binary("&",_n_x_b11,1)) else _S.index_value(_n_C,5)))])
							else:
								_S.invoke(_n_p_b0,"blend",[(_n_x_b11 + 0.5), (_n_y_b9 + 0.5), (_S.index_value(_n_C,6) if _S.truth((_n_band_b16 if _S.truth(_n_line_b15) else _n_line_b15)) else (_S.index_value(_n_C,5) if _S.truth(_n_line_b15) else (_S.index_value(_n_C,4) if _S.truth(_n_band_b16) else _S.index_value(_n_C,3)))), (((0.06 + (0.42 * _n_rim_b14)) + ((0.14 + (0.24 * _n_rim_b14)) if _S.truth(_n_line_b15) else 0)) + (0.16 if _S.truth(_n_band_b16) else 0))])
					_n_x_b11 += 1.0
			if _S.truth((_n_near_b1 if _S.truth(_n_shift_b10) else _n_shift_b10)):
				_S.invoke(_n_p_b0,"glowLine",[(-_n_r_b2), _n_y_b9, _n_r_b2, _n_y_b9, 4, _S.index_value(_n_C,5), 0.3])
			_n_y_b9 += 1.0
	if _S.truth(_n_near_b1):
		if true:
			var _n_a_b18 = 0.15
			while _S.truth((_n_a_b18 < (PI - 0.1))):
				_S.invoke(_n_p_b0,"glow",[(cos(_n_a_b18) * _n_r_b2), ((-sin(_n_a_b18)) * _n_r_b2), 8, _S.index_value(_n_C,4), 0.12])
				_n_a_b18 += 0.35
		if true:
			var _n_i_b19 = 0
			while _S.truth((_n_i_b19 < 3)):
				var _n_k_b20 = _S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_slot_b4,_n_i_b19,7])
				if _S.truth((_n_k_b20 > 0.5)):
					_n_i_b19 += 1.0
					continue
				var _n_a_b21 = (_S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_slot_b4,_n_i_b19,8]) * PI)
				var _n_d_b22 = ((_S.MathFX.rand([_S.named_value(_n_o,"seed"),_n_slot_b4,_n_i_b19,9]) * _n_r_b2) * 0.85)
				var _n_bx_b23 = floori((cos(_n_a_b21) * _n_d_b22)+0.5)
				var _n_by_b24 = floori(((-sin(_n_a_b21)) * _n_d_b22)+0.5)
				_S.invoke(_n_p_b0,"rect",[_n_bx_b23, _n_by_b24, (2 + floori((_n_k_b20 * 8))), (1 + floori((_n_k_b20 * 4))), (_n_WHITE if _S.truth((_n_k_b20 < 0.2)) else _S.index_value(_n_C,5))])
				_n_i_b19 += 1.0
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.read(_e, "POP"), 0.05)), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.6]))):
		var _v13 = _S.scope(_e)
		_S.define(_v13, "a", _S.invoke(_S.read(_v13, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v13, "Math"), "PI")), 0]))
		_S.define(_v13, "D", _S.invoke(_S.read(_v13, "R"), "range", [16, 40]))
		_S.define(_v13, "T", _S.invoke(_S.read(_v13, "R"), "range", [0.14, 0.22]))
		_S.define(_v13, "v", _S.binary("/", _S.binary("*", _S.read(_v13, "D"), 3), _S.binary("-", _S.invoke(_S.read(_v13, "Math"), "exp", [_S.binary("*", 3, _S.read(_v13, "T"))]), 1)))
		_S.invoke(_S.read(_v13, "ps"), "spawn", [_S.prop(_S.read(_v13, "P"), "STREAK"), _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")]), _S.read(_v13, "D")), _S.binary("+", _S.unary("-", 5), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")]), _S.read(_v13, "D")), 0.7)), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "a")])), _S.read(_v13, "v")), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "a")])), _S.read(_v13, "v")), 0.7), _S.read(_v13, "T"), (_S.prop(_S.read(_v13, "C"), 6) if _S.truth(_S.invoke(_S.read(_v13, "R"), "chance", [0.5])) else _S.prop(_S.read(_v13, "C"), 5))])
	_S.define(_e, "sa", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "POP")))
	_S.define(_e, "sf", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.read(_e, "t"), 30)]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "sa"), 0), func(): return _S.binary("<", _S.read(_e, "sa"), 0.26)), func(): return _S.binary("!==", _S.read(_e, "sf"), _S.read(_e, "starAt")))):
		var _v14 = _S.scope(_e)
		_S.write(_v14, "starAt", _S.read(_v14, "sf"), "=", false)
		_S.define(_v14, "len", (_S.invoke(_S.read(_v14, "ease"), "outBack", [_S.binary("/", _S.read(_v14, "sa"), 0.05), 2]) if _S.truth(_S.binary("<", _S.read(_v14, "sa"), 0.05)) else _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v14, "sa"), 0.05), 0.26))))
		_S.write(_v14, "star", [], "=", false)
		var _v15 = _S.scope(_v14)
		_S.define(_v15, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v15, "i"), 7)):
			var _v16 = _S.scope(_v15)
			_S.define(_v16, "a", _S.binary("+", _S.binary("-", _S.binary("+", _S.binary("+", _S.unary("-", _S.prop(_S.read(_v16, "Math"), "PI")), _S.binary("*", _S.binary("/", _S.read(_v16, "i"), 6), _S.prop(_S.read(_v16, "Math"), "PI"))), _S.binary("*", _S.call_value(_S.read(_v16, "rand"), [_S.prop(_S.read(_v16, "o"), "seed"), _S.read(_v16, "i"), 3]), 0.3)), 0.15), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 0.1), 0.1])))
			_S.define(_v16, "L", _S.binary("*", _S.binary("+", 20, _S.binary("*", 16, _S.call_value(_S.read(_v16, "rand"), [_S.prop(_S.read(_v16, "o"), "seed"), _S.read(_v16, "i"), 5]))), _S.invoke(_S.read(_v16, "Math"), "max", [0.15, _S.read(_v16, "len")])))
			_S.invoke(_S.read(_v16, "star"), "push", [_S.call_value(_S.read(_v16, "bolt"), [_S.read(_v16, "R"), 0, _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "cos", [_S.read(_v16, "a")]), _S.read(_v16, "L")), _S.invoke(_S.read(_v16, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v16, "Math"), "sin", [_S.read(_v16, "a")]), _S.read(_v16, "L")))]), _S.merge([{"jag": 0.28}, {"depth": 4}])])])
			_v15 = _S.iteration(_v15)
			_S.write(_v15, "i", 1, "+=", true)
	if _S.truth(_S.binary(">=", _S.read(_e, "sa"), 0.26)):
		_S.write(_e, "star", [], "=", false)
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "POP")), func(): return _S.unary("!", _S.read(_e, "popped")))):
		var _v17 = _S.scope(_e)
		_S.write(_v17, "popped", true, "=", false)
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "i"), 16)):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "a", _S.invoke(_S.read(_v19, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v19, "Math"), "PI")), 0]))
			_S.define(_v19, "sp", _S.invoke(_S.read(_v19, "R"), "range", [50, 150]))
			_S.invoke(_S.read(_v19, "ps"), "spawn", [_S.prop(_S.read(_v19, "P"), "MOTE"), 0, _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "cos", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.binary("*", _S.invoke(_S.read(_v19, "Math"), "sin", [_S.read(_v19, "a")]), _S.read(_v19, "sp")), _S.invoke(_S.read(_v19, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_v19, "R"), "pick", [[_S.read(_v19, "WHITE"), _S.prop(_S.read(_v19, "C"), 6), _S.prop(_S.read(_v19, "C"), 5)]]), 0.8])
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "i", 1, "+=", true)
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 20), 72, _S.prop(_S.read(_v17, "C"), 4), 0.9, 0.5])
		_S.invoke(_S.read(_v17, "lights"), "add", [0, _S.unary("-", 7), 30, _S.read(_v17, "WHITE"), 0.9, 0.12])
		var _v20 = _S.scope(_v17)
		_S.define(_v20, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v20, "i"), 60)):
			var _v21 = _S.scope(_v20)
			_S.define(_v21, "a", _S.invoke(_S.read(_v21, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v21, "Math"), "PI")), 0]))
			_S.define(_v21, "sp", _S.invoke(_S.read(_v21, "R"), "range", [90, 220]))
			_S.invoke(_S.read(_v21, "ps"), "spawn", [_S.prop(_S.read(_v21, "P"), "SPARK"), 0, _S.unary("-", 7), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "cos", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "sin", [_S.read(_v21, "a")]), _S.read(_v21, "sp")), _S.invoke(_S.read(_v21, "R"), "range", [0.2, 0.6])])
			_v20 = _S.iteration(_v20)
			_S.write(_v20, "i", 1, "+=", true)
		var _v22 = _S.scope(_v17)
		_S.define(_v22, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v22, "i"), 6)):
			_S.invoke(_S.read(_v22, "ps"), "spawn", [_S.prop(_S.read(_v22, "P"), "SMOKE"), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 4), _S.invoke(_S.read(_v22, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v22, "R"), "range", [10, 24])), _S.invoke(_S.read(_v22, "R"), "range", [1, 1.6]), _S.call_value(_S.read(_v22, "hex"), ["#3c3a52"]), _S.invoke(_S.read(_v22, "R"), "range", [2.5, 4]), _S.invoke(_S.read(_v22, "R"), "range", [0.05, 0.3])])
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "popped"), func(): return _S.unary("!", _S.read(_e, "broke"))), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "nextArc")))):
		var _v23 = _S.scope(_e)
		_S.write(_v23, "nextArc", _S.binary("+", _S.read(_v23, "t"), (_S.invoke(_S.read(_v23, "R"), "range", [0.02, 0.05]) if _S.truth(_S.binary(">", _S.read(_v23, "t"), _S.read(_v23, "STROBE"))) else _S.invoke(_S.read(_v23, "R"), "range", [0.05, 0.11]))), "=", false)
		_S.define(_v23, "r", _S.call_value(_S.read(_v23, "radius"), []))
		_S.define(_v23, "a0", _S.invoke(_S.read(_v23, "R"), "range", [0.1, _S.binary("-", _S.prop(_S.read(_v23, "Math"), "PI"), 0.1)]))
		_S.define(_v23, "a1", _S.binary("+", _S.read(_v23, "a0"), _S.binary("*", _S.invoke(_S.read(_v23, "R"), "sign", []), _S.invoke(_S.read(_v23, "R"), "range", [0.25, 0.6]))))
		_S.define(_v23, "rr", _S.binary("*", _S.read(_v23, "r"), _S.invoke(_S.read(_v23, "R"), "range", [0.92, 1])))
		_S.invoke(_S.read(_v23, "arcs"), "push", [_S.merge([{"t": _S.read(_v23, "t")}, {"pts": _S.call_value(_S.read(_v23, "bolt"), [_S.read(_v23, "R"), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a0")]), _S.read(_v23, "rr")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a0")])), _S.read(_v23, "rr")), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a1")]), _S.read(_v23, "rr")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "Math"), "max", [0.05, _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a1")])])), _S.read(_v23, "rr")), _S.merge([{"jag": 0.3}, {"depth": 4}])])}, {"life": _S.invoke(_S.read(_v23, "R"), "range", [0.05, 0.1])}])])
		if _S.truth(_S.invoke(_S.read(_v23, "R"), "chance", [0.35])):
			_S.invoke(_S.read(_v23, "ps"), "spawn", [_S.prop(_S.read(_v23, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v23, "Math"), "cos", [_S.read(_v23, "a1")]), _S.read(_v23, "rr")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v23, "Math"), "max", [0.05, _S.invoke(_S.read(_v23, "Math"), "sin", [_S.read(_v23, "a1")])])), _S.read(_v23, "rr")), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 80), 80]), _S.invoke(_S.read(_v23, "R"), "range", [_S.unary("-", 90), 10]), _S.invoke(_S.read(_v23, "R"), "range", [0.15, 0.3])])
	if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.unary("!", _S.read(_e, "broke")))):
		var _v24 = _S.scope(_e)
		_S.write(_v24, "broke", true, "=", false)
		_S.define(_v24, "r", _S.call_value(_S.read(_v24, "radius"), []))
		_S.invoke(_S.read(_v24, "lights"), "add", [0, _S.binary("*", _S.unary("-", _S.read(_v24, "r")), 0.4), _S.binary("*", _S.read(_v24, "r"), 1.3), _S.prop(_S.read(_v24, "C"), 5), 0.8, 0.3])
		var _v25 = _S.scope(_v24)
		_S.define(_v25, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v25, "i"), 70)):
			var _v26 = _S.scope(_v25)
			_S.define(_v26, "a", _S.invoke(_S.read(_v26, "R"), "range", [0.05, _S.binary("-", _S.prop(_S.read(_v26, "Math"), "PI"), 0.05)]))
			_S.define(_v26, "d", _S.binary("*", _S.read(_v26, "r"), _S.invoke(_S.read(_v26, "R"), "range", [0.6, 1])))
			_S.invoke(_S.read(_v26, "dead"), "push", [_S.merge([{"x": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.read(_v26, "d"))}, {"y": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v26, "Math"), "sin", [_S.read(_v26, "a")])), _S.read(_v26, "d"))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v26, "Math"), "cos", [_S.read(_v26, "a")]), _S.invoke(_S.read(_v26, "R"), "range", [5, 25]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v26, "R"), "range", [0, 20]))}, {"life": _S.invoke(_S.read(_v26, "R"), "range", [0.4, 1])}, {"max": 1}, {"s": (2 if _S.truth(_S.invoke(_S.read(_v26, "R"), "chance", [0.3])) else 1)}, {"c": _S.invoke(_S.read(_v26, "R"), "pick", [[_S.read(_v26, "WHITE"), _S.prop(_S.read(_v26, "C"), 6), _S.prop(_S.read(_v26, "C"), 5), _S.prop(_S.read(_v26, "C"), 4)]])}, {"ph": _S.invoke(_S.read(_v26, "R"), "range", [0, 9])}])])
			_v25 = _S.iteration(_v25)
			_S.write(_v25, "i", 1, "+=", true)
		var _v27 = _S.scope(_v24)
		_S.define(_v27, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v27, "i"), 6)):
			var _v28 = _S.scope(_v27)
			_S.define(_v28, "a0", _S.invoke(_S.read(_v28, "R"), "range", [0.1, _S.binary("-", _S.prop(_S.read(_v28, "Math"), "PI"), 0.1)]))
			_S.define(_v28, "a1", _S.binary("+", _S.read(_v28, "a0"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 0.5), 0.5])))
			_S.invoke(_S.read(_v28, "arcs"), "push", [_S.merge([{"t": _S.read(_v28, "t")}, {"pts": _S.call_value(_S.read(_v28, "bolt"), [_S.read(_v28, "R"), _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a0")]), _S.read(_v28, "r")), _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a0")])), _S.read(_v28, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v28, "Math"), "cos", [_S.read(_v28, "a1")]), _S.read(_v28, "r")), 0.6), _S.binary("*", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v28, "Math"), "max", [0.05, _S.invoke(_S.read(_v28, "Math"), "sin", [_S.read(_v28, "a1")])])), _S.read(_v28, "r")), 0.6), _S.merge([{"jag": 0.35}, {"depth": 4}])])}, {"life": 0.1}])])
			_v27 = _S.iteration(_v27)
			_S.write(_v27, "i", 1, "+=", true)
		var _v29 = _S.scope(_v24)
		_S.define(_v29, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v29, "i"), 8)):
			_S.invoke(_S.read(_v29, "ps"), "spawn", [_S.prop(_S.read(_v29, "P"), "SMOKE"), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 4), _S.invoke(_S.read(_v29, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v29, "R"), "range", [8, 18])), _S.invoke(_S.read(_v29, "R"), "range", [0.8, 1.2]), _S.call_value(_S.read(_v29, "hex"), ["#2f2c3c"]), _S.invoke(_S.read(_v29, "R"), "range", [2, 3.4]), _S.invoke(_S.read(_v29, "R"), "range", [0, 0.35])])
			_v29 = _S.iteration(_v29)
			_S.write(_v29, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "broke"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.8))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "SPARK"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 3), 3]), _S.unary("-", 3), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 60), 60]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [40, 120])), _S.invoke(_S.read(_e, "R"), "range", [0.15, 0.3])])
	var _v30 = _S.scope(_e)
	_S.define(_v30, "i", _S.binary("-", _S.prop(_S.read(_v30, "arcs"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v30, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v30, "t"), _S.prop(_S.prop(_S.read(_v30, "arcs"), _S.read(_v30, "i")), "t")), _S.prop(_S.prop(_S.read(_v30, "arcs"), _S.read(_v30, "i")), "life"))):
			_S.invoke(_S.read(_v30, "arcs"), "splice", [_S.read(_v30, "i"), 1])
		_v30 = _S.iteration(_v30)
		_S.write(_v30, "i", 1, "-=", true)
	var _v31 = _S.scope(_e)
	_S.define(_v31, "i", _S.binary("-", _S.prop(_S.read(_v31, "dead"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v31, "i"), 0)):
		var _v32 = _S.scope(_v31)
		_S.define(_v32, "d", _S.prop(_S.read(_v32, "dead"), _S.read(_v32, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v32, "d"), "life", _S.read(_v32, "dt"), "-=", false), 0)):
			_S.invoke(_S.read(_v32, "dead"), "splice", [_S.read(_v32, "i"), 1])
		_S.set_prop(_S.read(_v32, "d"), "vy", _S.binary("*", 60, _S.read(_v32, "dt")), "+=", false)
		_S.set_prop(_S.read(_v32, "d"), "x", _S.binary("*", _S.prop(_S.read(_v32, "d"), "vx"), _S.read(_v32, "dt")), "+=", false)
		_S.set_prop(_S.read(_v32, "d"), "y", _S.invoke(_S.read(_v32, "Math"), "min", [_S.unary("-", 1), _S.binary("+", _S.prop(_S.read(_v32, "d"), "y"), _S.binary("*", _S.prop(_S.read(_v32, "d"), "vy"), _S.read(_v32, "dt")))]), "=", false)
		_v31 = _S.iteration(_v31)
		_S.write(_v31, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_bubble = _S.read(_parent,"bubble")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_bubble,[_n_p_b0, false])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_charge = _S.read(_parent,"charge")
	var _n_bubble = _S.read(_parent,"bubble")
	var _n_t = _S.read(_parent,"t")
	var _n_POP = _S.read(_parent,"POP")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_RM = _S.read(_parent,"RM")
	var _n_ease = _S.read(_parent,"ease")
	var _n_band = _S.read(_parent,"band")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_strokeArc = _S.read(_parent,"strokeArc")
	var _n_star = _S.read(_parent,"star")
	var _n_arcs = _S.read(_parent,"arcs")
	var _n_dead = _S.read(_parent,"dead")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_charge,[_n_p_b0])
	_S.call_value(_n_bubble,[_n_p_b0, true])
	var _n_a_b1 = (_n_t - _n_POP)
	if _S.truth(((_n_a_b1 < 0.06) if _S.truth((_n_a_b1 >= 0)) else (_n_a_b1 >= 0))):
		_S.invoke(_n_p_b0,"circle",[0, (-7), ((12 * (1 - (float(_n_a_b1)/0.06))) + 3), _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"circle",[0, (-7), ((9 * (1 - (float(_n_a_b1)/0.06))) + 1), _n_WHITE])
	if _S.truth(((_n_a_b1 < 0.4) if _S.truth((_n_a_b1 >= 0)) else (_n_a_b1 >= 0))):
		var _n_k_b2 = (float(_n_a_b1)/0.4)
		var _n_rr_b3 = (6 + ((_n_RM + 14) * _S.invoke(_n_ease,"outCubic",[_n_k_b2])))
		_S.call_value(_n_band,[_n_p_b0, 0, 0, _n_rr_b3, 0.16, maxf(1,(3 * (1 - _n_k_b2))), (1.2 - _n_k_b2), [_S.index_value(_n_C,3), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _n_WHITE], _S.function_value(_S.capture(_parent,{"this":_this}),"_f9"), (_n_k_b2 < 0.3)])
	if _S.truth(((_n_a_b1 < 0.16) if _S.truth((_n_a_b1 >= 0)) else (_n_a_b1 >= 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, 0, (-7), (10 * (1 - (float(_n_a_b1)/0.16))), _S.index_value(_n_C,6), _S.index_value(_n_C,5), 0.6])
	for _iter_0 in _S.array(_n_star):
		var _n_b_b4 = _iter_0
		_S.call_value(_n_strokeArc,[_n_p_b0, _n_b_b4, [_S.index_value(_n_C,3), _S.index_value(_n_C,6), _S.index_value(_n_C,5)], (1 - (float((_n_t - _n_POP))/0.3)), 1.3])
	for _iter_1 in _S.array(_n_arcs):
		var _n_c_b5 = _iter_1
		_S.call_value(_n_strokeArc,[_n_p_b0, _S.named_value(_n_c_b5,"pts"), [_S.index_value(_n_C,2), _S.index_value(_n_C,5), _S.index_value(_n_C,4)], (1 - (float((_n_t - _S.named_value(_n_c_b5,"t")))/(_S.named_value(_n_c_b5,"life") + 0.03))), 0.8])
	for _iter_2 in _S.array(_n_dead):
		var _n_d_b6 = _iter_2
		if _S.truth(_S.logical("&&",(sin(((_n_t * 40) + _S.named_value(_n_d_b6,"ph"))) < (-0.3)),func():return (_S.named_value(_n_d_b6,"life") < 0.6))):
			continue
		_S.invoke(_n_p_b0,"rect",[_S.named_value(_n_d_b6,"x"), _S.named_value(_n_d_b6,"y"), _S.named_value(_n_d_b6,"s"), _S.named_value(_n_d_b6,"s"), (_S.named_value(_n_d_b6,"c") if _S.truth((_S.named_value(_n_d_b6,"life") > 0.5)) else _S.index_value(_n_C,3))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f9(_parent,_args:Array,_this=null):
	return true
	return null
