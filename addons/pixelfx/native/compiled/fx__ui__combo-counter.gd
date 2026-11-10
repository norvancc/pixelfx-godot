@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/combo-counter.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "shake", _S.import_value("fx/ui/_lib.js", "shake"))
	_S.define(_e, "speedLines", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f3"))
	_S.define(_e, "meta", _S.merge([{"name": "Combo counter"}, {"desc": "x5 COMBO rockets in on streaming speed lines, smearing, and slams to a stop: a white flash, a ring, sparks; it pulses while a timer bar drains, then whooshes out."}, {"tags": ["ui", "combo", "counter", "combat", "text", "one-shot"]}, {"size": [208, 100]}, {"origin": [104, 50]}, {"duration": 1.45}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"count": 5}, {"label": "COMBO"}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HIT", 0.1)
	_S.define(_e, "BEAT", 0.5)
	_S.define(_e, "OUT", 1.1)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.arg(_args,3)
	var _n_dir_b4 = _S.arg(_args,4)
	if _S.truth((_n_k_b3 <= 0.02)):
		return null
	var _n_f_b5 = floori((_n_t_b2 * 30))
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 < 18)):
			if _S.truth((_S.MathFX.rand([_n_f_b5,_n_i_b6,3]) > _n_k_b3)):
				_n_i_b6 += 1.0
				continue
			var _n_y_b7 = floori(((_S.MathFX.rand([_n_f_b5,_n_i_b6,1]) - 0.5) * 60)+0.5)
			var _n_L_b8 = (16 + (_S.MathFX.rand([_n_f_b5,_n_i_b6,2]) * 50))
			var _n_x_b9 = ((_S.MathFX.rand([_n_f_b5,_n_i_b6,4]) - 0.5) * 190)
			var _n_x0_b10 = maxf((-100),(_n_x_b9 - (float(_n_L_b8)/2)))
			var _n_x1_b11 = minf(100,(_n_x_b9 + (float(_n_L_b8)/2)))
			_S.invoke(_n_p_b0,"line",[_n_x0_b10, _n_y_b7, _n_x1_b11, _n_y_b7, _S.function_value(_S.capture(_parent,{"dir":_n_dir_b4,"C":_n_C_b1,"this":_this}),"_f1"), _S.function_value(_S.capture(_parent,{"dir":_n_dir_b4,"this":_this}),"_f2")])
			_n_i_b6 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_dir = _S.read(_parent,"dir")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth(((_n_u_b0 if _S.truth((_n_dir > 0)) else (1 - _n_u_b0)) > 0.75)) else (_S.index_value(_n_C,6) if _S.truth(((_n_u_b0 if _S.truth((_n_dir > 0)) else (1 - _n_u_b0)) > 0.35)) else _S.index_value(_n_C,4)))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_dir = _S.read(_parent,"dir")
	var _n_u_b0 = _S.arg(_args,0)
	return (0.6 if _S.truth(((_n_u_b0 if _S.truth((_n_dir > 0)) else (1 - _n_u_b0)) < 0.25)) else 1)
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "SHADOW", _S.call_value(_S.read(_e, "scale"), [_S.prop(_S.read(_e, "C"), 0), 0.5]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "big", _S.call_value(_S.read(_e, "spell"), [_S.binary("+", "x", _S.invoke(_S.read(_e, "Math"), "round", [_S.prop(_S.read(_e, "o"), "count")]))]))
	_S.define(_e, "lab", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "label")]))
	_S.define(_e, "BS", 4)
	_S.define(_e, "LS", 2)
	_S.define(_e, "W", _S.binary("+", _S.binary("+", _S.binary("*", _S.prop(_S.read(_e, "big"), "w"), _S.read(_e, "BS")), 4), _S.binary("*", _S.prop(_S.read(_e, "lab"), "w"), _S.read(_e, "LS"))))
	_S.define(_e, "X0", _S.binary("/", _S.unary("-", _S.read(_e, "W")), 2))
	_S.define(_e, "BASE", 12)
	_S.define(_e, "spikes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 10}]), _S.function_value(_e, "_f4")]))
	_S.define(_e, "t", 0)
	_S.define(_e, "hit", false)
	_S.define(_e, "out", false)
	_S.define(_e, "xAt", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f4(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R = _S.read(_parent,"R")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [(((float(_n_i_b1)/10) * _n_TAU) + _S.invoke(_n_R,"range",[(-0.15), 0.15])), _S.invoke(_n_R,"range",[14, 24])]
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	_n_t_b0 = maxf(0,_n_t_b0)
	if _S.truth((_n_t_b0 < _n_HIT)):
		return ((-32) * pow((1 - (float(_n_t_b0)/_n_HIT)),2))
	if _S.truth((_n_t_b0 < _n_OUT)):
		return ((7 * exp(((-(_n_t_b0 - _n_HIT)) * 18))) * sin(((_n_t_b0 - _n_HIT) * 34)))
	var _n_u_b1 = _S.MathFX.seg(_n_t_b0,_n_OUT,(_n_OUT + 0.2))
	return (((-4) * _S.invoke(_n_ease,"outQuad",[(float(_n_u_b1)/0.3)])) if _S.truth((_n_u_b1 < 0.3)) else ((-4) + (24 * _S.invoke(_n_ease,"inQuad",[(float((_n_u_b1 - 0.3))/0.7)]))))
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "hit")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "HIT")))):
		var _v2 = _S.scope(_e)
		_S.write(_v2, "hit", true, "=", false)
		_S.invoke(_S.read(_v2, "lights"), "add", [0, 0, 70, _S.prop(_S.read(_v2, "C"), 5), 0.7, 0.4])
		_S.invoke(_S.read(_v2, "lights"), "add", [_S.unary("-", 20), 0, 34, _S.read(_v2, "WHITE"), 0.8, 0.1])
		var _v3 = _S.scope(_v2)
		_S.define(_v3, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v3, "i"), 26)):
			var _v4 = _S.scope(_v3)
			_S.define(_v4, "an", _S.binary("+", _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 1.2), 1.2]), (_S.prop(_S.read(_v4, "Math"), "PI") if _S.truth(_S.invoke(_S.read(_v4, "R"), "chance", [0.3])) else 0)))
			_S.define(_v4, "sp", _S.invoke(_S.read(_v4, "R"), "range", [120, 300]))
			_S.invoke(_S.read(_v4, "ps"), "spawn", [_S.prop(_S.read(_v4, "P"), "SPARK"), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 20), 20]), _S.invoke(_S.read(_v4, "R"), "range", [_S.unary("-", 8), 8]), _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "cos", [_S.read(_v4, "an")]), _S.read(_v4, "sp")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v4, "Math"), "sin", [_S.read(_v4, "an")]), _S.read(_v4, "sp")), 0.6), 20), _S.invoke(_S.read(_v4, "R"), "range", [0.12, 0.3])])
			_v3 = _S.iteration(_v3)
			_S.write(_v3, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "BEAT")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1]))):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "x", _S.binary("+", _S.read(_v5, "X0"), _S.invoke(_S.read(_v5, "R"), "range", [0, _S.binary("*", _S.prop(_S.read(_v5, "big"), "w"), _S.read(_v5, "BS"))])))
		_S.define(_v5, "y", _S.binary("-", _S.read(_v5, "BASE"), _S.invoke(_S.read(_v5, "R"), "range", [0, 30])))
		_S.invoke(_S.read(_v5, "ps"), "spawn", [_S.prop(_S.read(_v5, "P"), "STAR"), _S.read(_v5, "x"), _S.read(_v5, "y"), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v5, "R"), "range", [5, 20])), _S.invoke(_S.read(_v5, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v5, "R"), "pick", [[_S.prop(_S.read(_v5, "C"), 7), _S.prop(_S.read(_v5, "C"), 6)]]), (1.6 if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [0.3])) else 0.6)])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "out")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "OUT"), 0.06)))):
		var _v6 = _S.scope(_e)
		_S.write(_v6, "out", true, "=", false)
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "i"), 10)):
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "MOTE"), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 50), 30]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 14), 10]), _S.invoke(_S.read(_v7, "R"), "range", [220, 320]), _S.invoke(_S.read(_v7, "R"), "range", [_S.unary("-", 10), 10]), _S.invoke(_S.read(_v7, "R"), "range", [0.06, 0.14]), _S.invoke(_S.read(_v7, "R"), "pick", [[_S.prop(_S.read(_v7, "C"), 7), _S.prop(_S.read(_v7, "C"), 6)]]), 1])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_o = _S.read(_parent,"o")
	var _n_shake = _S.read(_parent,"shake")
	var _n_speedLines = _S.read(_parent,"speedLines")
	var _n_C = _S.read(_parent,"C")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_X0 = _S.read(_parent,"X0")
	var _n_big = _S.read(_parent,"big")
	var _n_BS = _S.read(_parent,"BS")
	var _n_spikes = _S.read(_parent,"spikes")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ps = _S.read(_parent,"ps")
	var _n_xAt = _S.read(_parent,"xAt")
	var _n_BEAT = _S.read(_parent,"BEAT")
	var _n_drawWord = _S.read(_parent,"drawWord")
	var _n_SHADOW = _S.read(_parent,"SHADOW")
	var _n_W = _S.read(_parent,"W")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.call_value(_n_shake,[_n_t, 3, _n_HIT, 0.25, _S.named_value(_n_o,"seed")])
	var _n_sx_b1 = _S.prop(_tuple_0,0)
	var _n_sy_b2 = _S.prop(_tuple_0,1)
	_S.call_value(_n_speedLines,[_n_p_b0, _n_C, _n_t, (1 if _S.truth((_n_t < _n_HIT)) else ((maxf(0,(1 - (float((_n_t - _n_HIT))/0.35))) * 0.9) if _S.truth((_n_t < _n_OUT)) else (_S.MathFX.seg(_n_t,(_n_OUT + 0.04),(_n_OUT + 0.12)) * (1 - _S.MathFX.seg(_n_t,(_n_OUT + 0.18),(_n_OUT + 0.3)))))), ((-1) if _S.truth((_n_t >= _n_OUT)) else 1)])
	var _n_hk_b3 = (_n_t - _n_HIT)
	if _S.truth(((_n_hk_b3 < 0.07) if _S.truth((_n_hk_b3 >= 0)) else (_n_hk_b3 >= 0))):
		var _n_cx_b13 = (_n_X0 + (float((_S.named_value(_n_big,"w") * _n_BS))/2))
		var _n_k_b14 = (1 if _S.truth((_n_hk_b3 < 0.035)) else 1.3)
		for _iter_1 in _S.array(_n_spikes):
			var _tuple_2 = _iter_1
			var _n_an_b15 = _S.prop(_tuple_2,0)
			var _n_L_b16 = _S.prop(_tuple_2,1)
			var _n_ca_b17 = (cos(_n_an_b15) * 1.4)
			var _n_sa_b18 = sin(_n_an_b15)
			if _S.truth(_S.binary("===",_n_k_b14,1)):
				_S.invoke(_n_p_b0,"beam",[_n_cx_b13, 0, (_n_cx_b13 + (_n_ca_b17 * _n_L_b16)), (_n_sa_b18 * _n_L_b16), 3, _S.function_value(_S.capture(_parent,{"this":_this}),"_f8")])
			else:
				_S.invoke(_n_p_b0,"line",[(_n_cx_b13 + ((_n_ca_b17 * _n_L_b16) * 0.5)), ((_n_sa_b18 * _n_L_b16) * 0.5), (_n_cx_b13 + ((_n_ca_b17 * _n_L_b16) * _n_k_b14)), ((_n_sa_b18 * _n_L_b16) * _n_k_b14), _S.index_value(_n_C,5)])
	var _n_rk_b4 = (float((_n_t - _n_HIT))/0.32)
	if _S.truth(((_n_rk_b4 < 1) if _S.truth((_n_rk_b4 > 0)) else (_n_rk_b4 > 0))):
		var _n_r_b19 = (20 + (34 * _S.invoke(_n_ease,"outCubic",[_n_rk_b4])))
		_S.invoke(_n_p_b0,"ellipse",[_n_sx_b1, _n_sy_b2, (_n_r_b19 * 1.5), (_n_r_b19 * 0.75), (_n_WHITE if _S.truth((_n_rk_b4 < 0.3)) else _S.index_value(_n_C,5)), _S.function_value(_S.capture(_parent,{"r":_n_r_b19,"rk":_n_rk_b4,"this":_this}),"_f9")])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	var _n_x_b5 = _S.call_value(_n_xAt,[_n_t])
	var _n_moving_b6 = ((_n_t < _n_HIT) if _S.truth((_n_t < _n_HIT)) else (_n_t > (_n_OUT + 0.06)))
	var _n_stretch_b7 = ((1.22 if _S.truth((_n_t < _n_HIT)) else 1.12) if _S.truth(_n_moving_b6) else 1)
	var _n_pulse_b8 = exp((-pow((float((_n_t - _n_BEAT))/0.05),2)))
	var _n_flash_b9 = (1 if _S.truth((((_n_t < (_n_HIT + 0.07)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT)) if _S.truth(((_n_t < (_n_HIT + 0.07)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))) else (_n_pulse_b8 > 0.6))) else 0)
	var _n_a_b10 = ((1 - _S.MathFX.seg(_n_t,(_n_OUT + 0.08),(_n_OUT + 0.2))) if _S.truth((_n_t > _n_OUT)) else (0.5 if _S.truth((_n_t < 0.035)) else 1))
	var _n_layout_b11 = _S.function_value(_S.capture(_parent,{"pulse":_n_pulse_b8,"stretch":_n_stretch_b7,"flash":_n_flash_b9,"a":_n_a_b10,"this":_this}),"_f10")
	if _S.truth(((_n_a_b10 > 0) if _S.truth(_n_moving_b6) else _n_moving_b6)):
		for _iter_3 in _S.array([[0.03, _S.index_value(_n_C,2)], [0.015, _S.index_value(_n_C,3)]]):
			var _tuple_4 = _iter_3
			var _n_lag_b20 = _S.prop(_tuple_4,0)
			var _n_c_b21 = _S.prop(_tuple_4,1)
			var _n_items_b22 = _S.call_value(_n_layout_b11,[(_S.call_value(_n_xAt,[(_n_t - (_n_lag_b20 if _S.truth((_n_t < _n_HIT)) else (-_n_lag_b20)))]) + _n_sx_b1)])
			_S.call_value(_n_drawWord,[_n_p_b0, _S.invoke(_n_items_b22,"map",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f13")]), {"fill":[_n_c_b21],"edge":_n_c_b21,"under":_n_c_b21,"outline":0,"shadow":0}])
	if _S.truth((_n_a_b10 > 0)):
		var _n_sh_b23 = _S.MathFX.seg(_n_t,0.62,0.86)
		var _n_items_b24 = _S.call_value(_n_layout_b11,[(_n_x_b5 + _n_sx_b1)])
		_S.call_value(_n_drawWord,[_n_p_b0, _S.invoke(_n_items_b24,"map",[_S.function_value(_S.capture(_parent,{"sy":_n_sy_b2,"this":_this}),"_f14")]), {"fill":[_S.index_value(_n_C,4), _S.index_value(_n_C,5), _S.index_value(_n_C,6), _S.index_value(_n_C,7)],"edge":_n_WHITE,"under":_S.index_value(_n_C,3),"outline":_S.index_value(_n_C,0),"ow":2,"shadow":_n_SHADOW,"shine":(((_n_X0 - 10) + ((_n_W + 24) * _n_sh_b23)) if _S.truth(((_n_sh_b23 < 1) if _S.truth((_n_sh_b23 > 0)) else (_n_sh_b23 > 0))) else null),"shineY":(_n_BASE - 28),"glint":_S.index_value(_n_C,6)}])
		var _n_bk_b25 = (_S.MathFX.seg(_n_t,(_n_HIT + 0.1),(_n_HIT + 0.2)) * (0 if _S.truth((_n_t > _n_OUT)) else 1))
		if _S.truth((_n_bk_b25 > 0)):
			var _n_bw_b26 = (_n_W * _n_bk_b25)
			var _n_left_b27 = (1 - _S.MathFX.seg(_n_t,(_n_HIT + 0.2),_n_OUT))
			var _n_bx_b28 = ((_n_X0 + _n_x_b5) + _n_sx_b1)
			var _n_by_b29 = ((_n_BASE + 5) + _n_sy_b2)
			_S.invoke(_n_p_b0,"rect",[(_n_bx_b28 - 1), (_n_by_b29 - 1), (_n_bw_b26 + 2), 4, _S.index_value(_n_C,0)])
			_S.invoke(_n_p_b0,"rect",[_n_bx_b28, _n_by_b29, _n_bw_b26, 2, _S.index_value(_n_C,1)])
			if _S.truth((_n_left_b27 > 0)):
				_S.invoke(_n_p_b0,"rect",[_n_bx_b28, _n_by_b29, (_n_bw_b26 * _n_left_b27), 2, _S.index_value(_n_C,5)])
				_S.invoke(_n_p_b0,"rect",[_n_bx_b28, _n_by_b29, (_n_bw_b26 * _n_left_b27), 1, _S.index_value(_n_C,6)])
				_S.invoke(_n_p_b0,"px",[((_n_bx_b28 + (_n_bw_b26 * _n_left_b27)) - 1), _n_by_b29, _n_WHITE])
	_S.invoke(_n_p_b0,"glow",[(_n_sx_b1 - 20), 0, 60, _S.index_value(_n_C,4), (((0.2 * _n_a_b10) + ((0.5 * (1 - (float((_n_t - _n_HIT))/0.15))) if _S.truth(((_n_t < (_n_HIT + 0.15)) if _S.truth((_n_t >= _n_HIT)) else (_n_t >= _n_HIT))) else 0)) + (0.25 * _n_pulse_b8))])
	var _n_g_b12 = (float((_n_t - 0.86))/0.22)
	if _S.truth(((_n_g_b12 < 1) if _S.truth((_n_g_b12 > 0)) else (_n_g_b12 > 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, ((_n_X0 + _n_W) - 2), (_n_BASE - 14), (6 * sin((_n_g_b12 * PI))), _S.index_value(_n_C,7), _S.index_value(_n_C,5), 0.5])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.5)) else _S.index_value(_n_C,6))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_rk = _S.read(_parent,"rk")
	var _n_r = _S.read(_parent,"r")
	var _n_d_b0 = _S.arg(_args,0)
	return ((1.25 - _n_rk) if _S.truth((_n_d_b0 > (1 - (float(1.5)/(_n_r * 0.75))))) else 0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_BS = _S.read(_parent,"BS")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_X0 = _S.read(_parent,"X0")
	var _n_big = _S.read(_parent,"big")
	var _n_stretch = _S.read(_parent,"stretch")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_this = _S.read(_parent,"this")
	var _n_lab = _S.read(_parent,"lab")
	var _n_dx_b0 = _S.arg(_args,0)
	var _n_bs_b1 = (_n_BS * (1 + (0.12 * _n_pulse)))
	var _n_items_b2 = []
	var _n_bx_b3 = ((_n_X0 + _n_dx_b0) - (float(((_S.named_value(_n_big,"w") * _n_BS) * (_n_stretch - 1)))/2))
	var _n_by_b4 = (_n_BASE - (7 * _n_bs_b1))
	_S.invoke(_S.named_value(_n_big,"letters"),"forEach",[_S.function_value(_S.capture(_parent,{"items":_n_items_b2,"bx":_n_bx_b3,"by":_n_by_b4,"bs":_n_bs_b1,"this":_n_this}),"_f11")])
	var _n_lx_b5 = (((_n_X0 + _n_dx_b0) + ((_S.named_value(_n_big,"w") * _n_BS) * _n_stretch)) + 4)
	_S.invoke(_S.named_value(_n_lab,"letters"),"forEach",[_S.function_value(_S.capture(_parent,{"items":_n_items_b2,"lx":_n_lx_b5,"this":_n_this}),"_f12")])
	return _n_items_b2
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_items = _S.read(_parent,"items")
	var _n_bx = _S.read(_parent,"bx")
	var _n_BS = _S.read(_parent,"BS")
	var _n_stretch = _S.read(_parent,"stretch")
	var _n_by = _S.read(_parent,"by")
	var _n_bs = _S.read(_parent,"bs")
	var _n_flash = _S.read(_parent,"flash")
	var _n_a = _S.read(_parent,"a")
	var _n_L_b0 = _S.arg(_args,0)
	return (_S.invoke(_n_items,"push",[{"g":_S.named_value(_n_L_b0,"g"),"x":(_n_bx + ((_S.named_value(_n_L_b0,"x") * _n_BS) * _n_stretch)),"y":_n_by,"sx":(_n_BS * _n_stretch),"sy":_n_bs,"slant":1,"flash":_n_flash,"a":_n_a}]) if _S.truth(_S.named_value(_n_L_b0,"g")) else _S.named_value(_n_L_b0,"g"))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_items = _S.read(_parent,"items")
	var _n_lx = _S.read(_parent,"lx")
	var _n_LS = _S.read(_parent,"LS")
	var _n_stretch = _S.read(_parent,"stretch")
	var _n_BASE = _S.read(_parent,"BASE")
	var _n_flash = _S.read(_parent,"flash")
	var _n_a = _S.read(_parent,"a")
	var _n_L_b0 = _S.arg(_args,0)
	return (_S.invoke(_n_items,"push",[{"g":_S.named_value(_n_L_b0,"g"),"x":(_n_lx + ((_S.named_value(_n_L_b0,"x") * _n_LS) * _n_stretch)),"y":(_n_BASE - (7 * _n_LS)),"sx":(_n_LS * _n_stretch),"sy":_n_LS,"slant":0.5,"flash":_n_flash,"a":_n_a}]) if _S.truth(_S.named_value(_n_L_b0,"g")) else _S.named_value(_n_L_b0,"g"))
	return null

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "it", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "it"), {"flash": 0}])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "it", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "it"), {"y": _S.binary("+", _S.prop(_S.read(_e, "it"), "y"), _S.read(_e, "sy"))}])
