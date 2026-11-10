@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/blinds.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "angle", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Blinds"}, {"desc": "Slats catch the light edge-on, then tilt shut top to bottom, lit rims glinting as warm light squeezes through the closing gaps with dust in it; then they tilt open and fade."}, {"tags": ["blinds", "slats", "light", "wipe"]}, {"duration": 2}, {"options": _S.merge([{"palette": ["#1a120c", "#33241a", "#5a4030", "#8a6848", "#c09a6a", "#e8cc98", "#fff0cc", "#ffffff"]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "N", 12)
	_S.define(_e, "SH", _S.binary("/", _S.read(_e, "H"), _S.read(_e, "N")))
	_S.define(_e, "SHUT0", 0.08)
	_S.define(_e, "OPEN0", 1.02)
	_S.define(_e, "STEP", 0.038)
	_S.define(_e, "TURN", 0.42)
	_S.define(_e, "OSTEP", 0.03)
	_S.define(_e, "OTURN", 0.4)
	_S.define(_e, "FADE0", 1.72)
	_S.define(_e, "FADE1", 1.94)
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_OPEN0 = _S.read(_parent,"OPEN0")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SHUT0 = _S.read(_parent,"SHUT0")
	var _n_STEP = _S.read(_parent,"STEP")
	var _n_TURN = _S.read(_parent,"TURN")
	var _n_OSTEP = _S.read(_parent,"OSTEP")
	var _n_OTURN = _S.read(_parent,"OTURN")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	if _S.truth((_n_t_b1 < _n_OPEN0)):
		return ((float(PI)/2) * _S.invoke(_n_ease,"outBack",[clampf((float(((_n_t_b1 - _n_SHUT0) - (_n_i_b0 * _n_STEP)))/_n_TURN),0.0,1.0), 1.6]))
	return ((float(PI)/2) * (1 - _S.invoke(_n_ease,"inOutCubic",[clampf((float(((_n_t_b1 - _n_OPEN0) - (_n_i_b0 * _n_OSTEP)))/_n_OTURN),0.0,1.0)])))
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "FADE0")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.8]))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "i", _S.invoke(_S.read(_v0, "R"), "int", [0, _S.binary("-", _S.read(_v0, "N"), 1)]))
		_S.define(_v0, "th", _S.call_value(_S.read(_v0, "angle"), [_S.read(_v0, "i"), _S.read(_v0, "t")]))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v0, "th"), 0.2), func(): return _S.binary("<", _S.read(_v0, "th"), 1.45))):
			_S.invoke(_S.read(_v0, "ps"), "spawn", [_S.prop(_S.read(_v0, "P"), "EMBER"), _S.invoke(_S.read(_v0, "R"), "range", [0, _S.read(_v0, "W")]), _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v0, "i"), 1), _S.read(_v0, "SH")), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 2), 2])), _S.invoke(_S.read(_v0, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v0, "R"), "range", [2, 8])), _S.invoke(_S.read(_v0, "Math"), "min", [_S.invoke(_S.read(_v0, "R"), "range", [0.5, 1]), _S.binary("-", _S.read(_v0, "end"), _S.read(_v0, "t"))]), 0, 1])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_H = _S.read(_parent,"H")
	var _n_SH = _S.read(_parent,"SH")
	var _n_angle = _S.read(_parent,"angle")
	var _n_t = _S.read(_parent,"t")
	var _n_N = _S.read(_parent,"N")
	var _n_W = _S.read(_parent,"W")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_FADE0 = _S.read(_parent,"FADE0")
	var _n_FADE1 = _S.read(_parent,"FADE1")
	var _n_SHUT0 = _S.read(_parent,"SHUT0")
	var _n_rect = _S.read(_parent,"rect")
	var _n_ink = _S.read(_parent,"ink")
	var _n_STEP = _S.read(_parent,"STEP")
	var _n_TURN = _S.read(_parent,"TURN")
	var _n_OPEN0 = _S.read(_parent,"OPEN0")
	var _n_OSTEP = _S.read(_parent,"OSTEP")
	var _n_OTURN = _S.read(_parent,"OTURN")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _n_open_b2 = _S.invoke(_S.construct(_n_Uint8Array,[_n_H]),"fill",[1])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < _n_N)):
			var _n_h_b6 = maxf(1,((_n_SH + 1) * absf(sin(_S.call_value(_n_angle,[_n_i_b5, _n_t])))))
			var _n_yc_b7 = ((_n_i_b5 + 0.5) * _n_SH)
			if true:
				var _n_y_b8 = maxf(0,ceili(((_n_yc_b7 - (float(_n_h_b6)/2)) - 0.5)))
				while _S.truth((_n_y_b8 <= minf((_n_H - 1),floori(((_n_yc_b7 + (float(_n_h_b6)/2)) - 0.5))))):
					_S.set_prop(_n_open_b2,_n_y_b8,0,"=")
					_n_y_b8 += 1.0
			_n_i_b5 += 1.0
	for _iter_0 in _S.array(_S.named_value(_n_ps,"list")):
		var _n_q_b9 = _iter_0
		var _n_y_b10 = floori(_S.named_value(_n_q_b9,"y"))
		var _n_k_b11 = (float(_S.named_value(_n_q_b9,"life"))/_S.named_value(_n_q_b9,"max"))
		if _S.truth(((((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H)) if _S.truth((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H))) else not _S.truth(_S.index_value(_n_open_b2,_n_y_b10))) if _S.truth(((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H)) if _S.truth((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H))) else not _S.truth(_S.index_value(_n_open_b2,_n_y_b10)))) else (_S.named_value(_n_q_b9,"x") < 0)) if _S.truth((((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H)) if _S.truth((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H))) else not _S.truth(_S.index_value(_n_open_b2,_n_y_b10))) if _S.truth(((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H)) if _S.truth((((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0)) if _S.truth(((_S.named_value(_n_q_b9,"delay") > 0) if _S.truth((_S.named_value(_n_q_b9,"delay") > 0)) else (_n_y_b10 < 0))) else (_n_y_b10 >= _n_H))) else not _S.truth(_S.index_value(_n_open_b2,_n_y_b10)))) else (_S.named_value(_n_q_b9,"x") < 0))) else (_S.named_value(_n_q_b9,"x") >= _n_W))):
			continue
		var _n_tw_b12 = ((sin(((_n_t * 14) + _S.named_value(_n_q_b9,"seed"))) > 0) if _S.truth((fmod(_S.named_value(_n_q_b9,"seed"),1) < 0.3)) else (fmod(_S.named_value(_n_q_b9,"seed"),1) < 0.3))
		_S.invoke(_n_p0_b0,"px",[_S.named_value(_n_q_b9,"x"), _n_y_b10, (_n_WHITE if _S.truth((_n_tw_b12 if _S.truth(_n_tw_b12) else (_n_k_b11 > 0.5))) else _S.index_value(_n_C,5))])
		if _S.truth(_n_tw_b12):
			for _iter_1 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
				var _tuple_2 = _iter_1
				var _n_dx_b13 = _S.prop(_tuple_2,0)
				var _n_dy_b14 = _S.prop(_tuple_2,1)
				if _S.truth(_S.index_value(_n_open_b2,(_n_y_b10 + _n_dy_b14))):
					_S.invoke(_n_p_b1,"px",[(_S.named_value(_n_q_b9,"x") + _n_dx_b13), (_n_y_b10 + _n_dy_b14), _S.index_value(_n_C,6)])
		_S.invoke(_n_p0_b0,"light",[_S.named_value(_n_q_b9,"x"), _n_y_b10, _S.index_value(_n_C,6), ((0.7 if _S.truth(_n_tw_b12) else 0.4) * _n_k_b11)])
	var _n_fade_b3 = (1 - clampf((float((_n_t - _n_FADE0))/(_n_FADE1 - _n_FADE0)),0.0,1.0))
	var _n_appear_b4 = clampf((float(_n_t)/_n_SHUT0),0.0,1.0)
	if true:
		var _n_i_b15 = 0
		while _S.truth((_n_i_b15 < _n_N)):
			var _n_th_b16 = _S.call_value(_n_angle,[_n_i_b15, _n_t])
			var _n_s_b17 = sin(_n_th_b16)
			var _n_c_b18 = cos(_n_th_b16)
			var _n_yc_b19 = ((_n_i_b15 + 0.5) * _n_SH)
			var _n_h_b20 = maxf(1,((_n_SH + 1) * absf(_n_s_b17)))
			var _n_y0_b21 = maxf(0,ceili(((_n_yc_b19 - (float(_n_h_b20)/2)) - 0.5)))
			var _n_y1_b22 = minf((_n_H - 1),floori(((_n_yc_b19 + (float(_n_h_b20)/2)) - 0.5)))
			var _n_under_b23 = (_n_th_b16 > (float(PI)/2))
			if _S.truth((_n_h_b20 < 2.5)):
				var _n_k_b27 = minf(_n_appear_b4,_n_fade_b3)
				if _S.truth((_n_k_b27 <= 0)):
					_n_i_b15 += 1.0
					continue
				var _n_yy_b28 = floori((_n_yc_b19 - 0.5)+0.5)
				_S.call_value(_n_rect,[_n_p0_b0, 0, _n_yy_b28, _n_W, 1, (_S.index_value(_n_C,6) if _S.truth((_n_k_b27 > 0.66)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b27 > 0.33)) else _S.index_value(_n_C,2)))])
				if _S.truth((((_n_yy_b28 + 1) < _n_H) if _S.truth((_n_h_b20 >= 1.5)) else (_n_h_b20 >= 1.5))):
					_S.call_value(_n_rect,[_n_p0_b0, 0, (_n_yy_b28 + 1), _n_W, 1, (_S.index_value(_n_C,3) if _S.truth((_n_k_b27 > 0.5)) else _S.index_value(_n_C,1))])
				if true:
					var _n_x_b29 = 0
					while _S.truth((_n_x_b29 < _n_W)):
						_S.invoke(_n_p0_b0,"light",[_n_x_b29, _n_yy_b28, _S.index_value(_n_C,5), (0.18 * _n_k_b27)])
						_n_x_b29 += 2
				_n_i_b15 += 1.0
				continue
			var _n_lit_b24 = (0 if _S.truth(_n_under_b23) else _n_c_b18)
			if true:
				var _n_y_b30 = _n_y0_b21
				while _S.truth((_n_y_b30 <= _n_y1_b22)):
					var _n_r_b31 = (_n_y_b30 - _n_y0_b21)
					var _n_last_b32 = _S.binary("===",_n_y_b30,_n_y1_b22)
					var _n_v_b33 = (float(_n_r_b31)/maxf(1,(_n_y1_b22 - _n_y0_b21)))
					var _n_f_b34 = (_n_lit_b24 * (1 - (_n_v_b33 * 0.8)))
					var _n_col_b35 = ((_n_WHITE if _S.truth((_n_lit_b24 > 0.55)) else (_S.index_value(_n_C,6) if _S.truth((_n_lit_b24 > 0.3)) else (_S.index_value(_n_C,4) if _S.truth((_n_lit_b24 > 0.12)) else _n_ink))) if _S.truth(_S.binary("===",_n_r_b31,0)) else ((_S.index_value(_n_C,5) if _S.truth((_n_lit_b24 > 0.45)) else (_S.index_value(_n_C,3) if _S.truth((_n_lit_b24 > 0.2)) else _n_ink)) if _S.truth(_S.binary("===",_n_r_b31,1)) else (_n_ink if _S.truth(_n_last_b32) else (_S.index_value(_n_C,3) if _S.truth((_n_f_b34 > 0.55)) else (_S.index_value(_n_C,2) if _S.truth((_n_f_b34 > 0.35)) else (_S.index_value(_n_C,1) if _S.truth((_n_f_b34 > 0.15)) else _n_ink))))))
					_S.call_value(_n_rect,[_n_p0_b0, 0, _n_y_b30, _n_W, 1, _n_col_b35])
					if _S.truth(((_n_lit_b24 > 0.12) if _S.truth(_S.binary("===",_n_r_b31,0)) else _S.binary("===",_n_r_b31,0))):
						if true:
							var _n_x_b36 = 0
							while _S.truth((_n_x_b36 < _n_W)):
								_S.invoke(_n_p0_b0,"light",[_n_x_b36, _n_y_b30, _S.index_value(_n_C,5), (0.35 * _n_lit_b24)])
								_n_x_b36 += 2
					_n_y_b30 += 1.0
			var _n_gap_b25 = (_n_SH - _n_h_b20)
			if _S.truth((not _S.truth(_n_under_b23) if _S.truth(((_n_th_b16 > 0.12) if _S.truth((_n_gap_b25 > 0.5)) else (_n_gap_b25 > 0.5))) else ((_n_th_b16 > 0.12) if _S.truth((_n_gap_b25 > 0.5)) else (_n_gap_b25 > 0.5)))):
				var _n_k_b37 = ((0.2 + (0.45 * pow((1 - (float(_n_gap_b25)/_n_SH)),1.5))) * minf(1,(float(_n_th_b16)/0.4)))
				var _n_gy_b38 = (_n_y1_b22 + 1)
				if true:
					var _n_y_b39 = _n_gy_b38
					while _S.truth((_n_y_b39 < minf(_n_H,(_n_gy_b38 + ceili(_n_gap_b25))))):
						var _n_v_b40 = (float(((_n_y_b39 - _n_gy_b38) + 0.5))/_n_gap_b25)
						var _n_kk_b41 = (_n_k_b37 * (1 - (absf((_n_v_b40 - 0.5)) * 1.2)))
						if _S.truth((_n_kk_b41 > 0.01)):
							if true:
								var _n_x_b42 = 0
								while _S.truth((_n_x_b42 < _n_W)):
									_S.invoke(_n_p0_b0,"light",[_n_x_b42, _n_y_b39, _S.index_value(_n_C,6), _n_kk_b41])
									_S.invoke(_n_p0_b0,"light",[_n_x_b42, _n_y_b39, _S.index_value(_n_C,4), (_n_kk_b41 * 0.5)])
									_n_x_b42 += 1
						_n_y_b39 += 1.0
			var _n_u_b26 = (clampf((float(((_n_t - _n_SHUT0) - (_n_i_b15 * _n_STEP)))/_n_TURN),0.0,1.0) if _S.truth((_n_t < _n_OPEN0)) else clampf((float(((_n_t - _n_OPEN0) - (_n_i_b15 * _n_OSTEP)))/_n_OTURN),0.0,1.0))
			if _S.truth(((_n_u_b26 < 0.95) if _S.truth(((_n_u_b26 > 0.05) if _S.truth((_n_lit_b24 > 0.3)) else (_n_lit_b24 > 0.3))) else ((_n_u_b26 > 0.05) if _S.truth((_n_lit_b24 > 0.3)) else (_n_lit_b24 > 0.3)))):
				_S.call_value(_n_glint,[_n_p_b1, (_n_W * (_n_u_b26 if _S.truth((_n_t < _n_OPEN0)) else (1 - _n_u_b26))), _n_y0_b21, (6 * sin((PI * _n_u_b26))), (_n_u_b26 * 3), _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
			_n_i_b15 += 1.0
	return null
