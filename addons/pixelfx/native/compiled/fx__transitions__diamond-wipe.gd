@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/diamond-wipe.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f1":"transition_diamond_draw"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "lattice", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Diamond wipe"}, {"desc": "A wave of faceted diamonds swells across the screen, rims bright and ridges lit, cooling to black as they lock; then they rise as gems again and shrink away with glints."}, {"tags": ["diamond", "lattice", "geometric", "wipe"]}, {"duration": 2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "arcane")}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "S", 32)
	_S.define(_e, "HD", _S.binary("+", _S.binary("/", _S.read(_e, "S"), 2), 1))
	_S.define(_e, "GROW", 0.24)
	_S.define(_e, "IN0", 0.04)
	_S.define(_e, "IN1", 0.66)
	_S.define(_e, "OUT0", 1.05)
	_S.define(_e, "OUT1", 1.56)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_S = _S.read(_parent,"S")
	var _n_HD = _S.read(_parent,"HD")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_IN0 = _S.read(_parent,"IN0")
	var _n_IN1 = _S.read(_parent,"IN1")
	var _n_OUT0 = _S.read(_parent,"OUT0")
	var _n_OUT1 = _S.read(_parent,"OUT1")
	var _n_seed_b0 = _S.arg(_args,0)
	if _S.truth(_S.invoke(_n_cache,"has",[_n_seed_b0])):
		return _S.invoke(_n_cache,"get",[_n_seed_b0])
	var _n_out_b1 = []
	if true:
		var _n_j_b2 = (-1)
		while _S.truth((_n_j_b2 <= (ceili((float(_n_H)/(float(_n_S)/2))) + 1))):
			if true:
				var _n_i_b3 = (-1)
				while _S.truth((_n_i_b3 <= (ceili((float(_n_W)/_n_S)) + 1))):
					var _n_cx_b4 = ((_n_i_b3 * _n_S) + ((float(_n_S)/2) if _S.truth(_S.binary("&",_n_j_b2,1)) else 0))
					var _n_cy_b5 = (float((_n_j_b2 * _n_S))/2)
					if _S.truth((((((_n_cx_b4 + _n_HD) < 0) if _S.truth(((_n_cx_b4 + _n_HD) < 0)) else ((_n_cy_b5 + _n_HD) < 0)) if _S.truth((((_n_cx_b4 + _n_HD) < 0) if _S.truth(((_n_cx_b4 + _n_HD) < 0)) else ((_n_cy_b5 + _n_HD) < 0))) else ((_n_cx_b4 - _n_HD) > _n_W)) if _S.truth(((((_n_cx_b4 + _n_HD) < 0) if _S.truth(((_n_cx_b4 + _n_HD) < 0)) else ((_n_cy_b5 + _n_HD) < 0)) if _S.truth((((_n_cx_b4 + _n_HD) < 0) if _S.truth(((_n_cx_b4 + _n_HD) < 0)) else ((_n_cy_b5 + _n_HD) < 0))) else ((_n_cx_b4 - _n_HD) > _n_W))) else ((_n_cy_b5 - _n_HD) > _n_H))):
						_n_i_b3 += 1.0
						continue
					var _n_u_b6 = clampf((float((_n_cx_b4 + (0.45 * _n_cy_b5)))/(_n_W + (0.45 * _n_H))),0.0,1.0)
					var _n_jr_b7 = _S.MathFX.rand([_n_i_b3,_n_j_b2,_n_seed_b0])
					_S.invoke(_n_out_b1,"push",[{"cx":_n_cx_b4,"cy":_n_cy_b5,"tin":(_n_IN0 + ((_n_IN1 - _n_IN0) * clampf((_n_u_b6 + ((_n_jr_b7 - 0.5) * 0.08)),0.0,1.0))),"tout":(_n_OUT0 + ((_n_OUT1 - _n_OUT0) * clampf((_n_u_b6 + ((_S.MathFX.rand([_n_i_b3,_n_j_b2,(_n_seed_b0 + 1)]) - 0.5) * 0.08)),0.0,1.0))),"glint":(_n_jr_b7 < 0.3),"spin":(_S.MathFX.rand([_n_i_b3,_n_j_b2,(_n_seed_b0 + 2)]) * 3)}])
					_n_i_b3 += 1.0
			_n_j_b2 += 1.0
	_S.invoke(_n_cache,"set",[_n_seed_b0, _n_out_b1])
	return _n_out_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_lattice = _S.read(_parent,"lattice")
	var _n_GROW = _S.read(_parent,"GROW")
	var _n_HD = _S.read(_parent,"HD")
	var _n_ease = _S.read(_parent,"ease")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_rect = _S.read(_parent,"rect")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ink_b4 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"color")])
	var _n_p_b5 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _n_L_b6 = _S.call_value(_n_lattice,[_S.named_value(_n_o_b2,"seed")])
	var _n_glints_b7 = []
	var _n_FACE_b8 = [[_S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,0)], [_S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,0)], [_S.index_value(_n_C_b3,1), _S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,0)], [_S.index_value(_n_C_b3,0), _S.index_value(_n_C_b3,0), _n_ink_b4]]
	for _iter_0 in _S.array(_n_L_b6):
		var _n_d_b9 = _iter_0
		var _n_ki_b10 = (float((_n_t_b1 - _S.named_value(_n_d_b9,"tin")))/_n_GROW)
		var _n_ko_b11 = (float((_n_t_b1 - _S.named_value(_n_d_b9,"tout")))/_n_GROW)
		if _S.truth(((_n_ko_b11 < 1.5) if _S.truth(((_n_ko_b11 > 0.7) if _S.truth(_S.named_value(_n_d_b9,"glint")) else _S.named_value(_n_d_b9,"glint"))) else ((_n_ko_b11 > 0.7) if _S.truth(_S.named_value(_n_d_b9,"glint")) else _S.named_value(_n_d_b9,"glint")))):
			_S.invoke(_n_glints_b7,"push",[[_n_d_b9, (float((_n_ko_b11 - 0.7))/0.8), 0]])
		if _S.truth(((_n_ki_b10 <= 0) if _S.truth((_n_ki_b10 <= 0)) else (_n_ko_b11 >= 1))):
			continue
		var _n_hd_b12 = (_n_HD * ((1 - _S.invoke(_n_ease,"inBack",[_n_ko_b11, 2])) if _S.truth((_n_ko_b11 > 0)) else _S.invoke(_n_ease,"outBack",[minf(1,_n_ki_b10), 2.2])))
		var _n_heat_b13 = (_S.MathFX.smooth(0,0.35,_n_ko_b11) if _S.truth((_n_ko_b11 > 0)) else (1 - _S.MathFX.smooth(0.45,1.25,_n_ki_b10)))
		if _S.truth((_n_hd_b12 < 0.5)):
			continue
		var _n_settled_b14 = (_n_heat_b13 <= 0)
		var _n_y0_b15 = maxf(0,floori((_S.named_value(_n_d_b9,"cy") - _n_hd_b12)))
		var _n_y1_b16 = minf((_n_H - 1),ceili((_S.named_value(_n_d_b9,"cy") + _n_hd_b12)))
		if true:
			var _n_y_b17 = _n_y0_b15
			while _S.truth((_n_y_b17 <= _n_y1_b16)):
				var _n_dy_b18 = ((_n_y_b17 + 0.5) - _S.named_value(_n_d_b9,"cy"))
				var _n_w_b19 = (_n_hd_b12 - absf(_n_dy_b18))
				if _S.truth((_n_w_b19 <= 0)):
					_n_y_b17 += 1.0
					continue
				var _n_x0_b20 = maxf(0,ceili(((_S.named_value(_n_d_b9,"cx") - _n_w_b19) - 0.5)))
				var _n_x1_b21 = minf((_n_W - 1),floori(((_S.named_value(_n_d_b9,"cx") + _n_w_b19) - 0.5)))
				if _S.truth((_n_x1_b21 < _n_x0_b20)):
					_n_y_b17 += 1.0
					continue
				if _S.truth(_n_settled_b14):
					_S.call_value(_n_rect,[_n_p0_b0, _n_x0_b20, _n_y_b17, ((_n_x1_b21 - _n_x0_b20) + 1), 1, _n_ink_b4])
					_n_y_b17 += 1.0
					continue
				var _n_st_b22 = (0 if _S.truth((_n_heat_b13 > 0.66)) else (1 if _S.truth((_n_heat_b13 > 0.33)) else 2))
				if true:
					var _n_x_b23 = _n_x0_b20
					while _S.truth((_n_x_b23 <= _n_x1_b21)):
						var _n_dx_b24 = ((_n_x_b23 + 0.5) - _S.named_value(_n_d_b9,"cx"))
						var _n_e_b25 = ((_n_hd_b12 - absf(_n_dx_b24)) - absf(_n_dy_b18))
						var _n_q_b26 = ((0 if _S.truth((_n_dy_b18 < 0)) else 2) + (0 if _S.truth((_n_dx_b24 < 0)) else 1))
						var _n_vr_b27 = ((_n_dx_b24 <= 0) if _S.truth((_n_dx_b24 > (-1))) else (_n_dx_b24 > (-1)))
						var _n_hr_b28 = ((_n_dy_b18 <= 0) if _S.truth((_n_dy_b18 > (-1))) else (_n_dy_b18 > (-1)))
						var _n_c_b29 = null
						if _S.truth((_n_e_b25 < 1)):
							var _n_r_b30 = _S.index_value([(_n_WHITE if _S.truth((_n_heat_b13 > 0.5)) else _S.index_value(_n_C_b3,6)), (_S.index_value(_n_C_b3,6) if _S.truth((_n_heat_b13 > 0.5)) else _S.index_value(_n_C_b3,5)), (_S.index_value(_n_C_b3,5) if _S.truth((_n_heat_b13 > 0.5)) else _S.index_value(_n_C_b3,4)), (_S.index_value(_n_C_b3,4) if _S.truth((_n_heat_b13 > 0.5)) else _S.index_value(_n_C_b3,3))],_n_q_b26)
							_n_c_b29 = (_n_r_b30 if _S.truth((_n_heat_b13 > 0.15)) else _n_ink_b4)
							if _S.truth((_n_heat_b13 > 0.15)):
								_S.invoke(_n_p0_b0,"light",[_n_x_b23, _n_y_b17, _S.index_value(_n_C_b3,5), ((0.4 * _n_heat_b13) * (1 if _S.truth(_S.binary("===",_n_q_b26,0)) else 0.6))])
						else:
							if _S.truth(((_n_heat_b13 > 0.4) if _S.truth((_S.binary("===",_n_q_b26,0) if _S.truth((_n_e_b25 < 2)) else (_n_e_b25 < 2))) else (_S.binary("===",_n_q_b26,0) if _S.truth((_n_e_b25 < 2)) else (_n_e_b25 < 2)))):
								_n_c_b29 = _S.index_value(_n_C_b3,5)
							else:
								if _S.truth(((_n_heat_b13 > 0.3) if _S.truth((_n_vr_b27 if _S.truth(_n_vr_b27) else _n_hr_b28)) else (_n_vr_b27 if _S.truth(_n_vr_b27) else _n_hr_b28))):
									var _n_tip_b31 = ((_n_dy_b18 < ((-_n_hd_b12) + 4)) if _S.truth(_n_vr_b27) else _n_vr_b27)
									var _n_sheen_b32 = (absf((fmod((fmod(((_n_x_b23 + _n_y_b17) - (_n_t_b1 * 260)),90) + 90),90) - 45)) < 3)
									_n_c_b29 = (_n_WHITE if _S.truth((_n_tip_b31 if _S.truth(_n_tip_b31) else ((_n_heat_b13 > 0.5) if _S.truth(_n_sheen_b32) else _n_sheen_b32))) else ((_S.index_value(_n_C_b3,6) if _S.truth((_n_heat_b13 > 0.6)) else _S.index_value(_n_C_b3,5)) if _S.truth(((_n_dy_b18 < 0) if _S.truth(_n_vr_b27) else _n_vr_b27)) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_heat_b13 > 0.6)) else _S.index_value(_n_C_b3,2))))
								else:
									_n_c_b29 = (_S.index_value(_S.index_value(_n_FACE_b8,_n_q_b26),_n_st_b22) if _S.truth((_n_heat_b13 > 0.15)) else _n_ink_b4)
						_S.invoke(_n_p0_b0,"px",[_n_x_b23, _n_y_b17, _n_c_b29])
						_n_x_b23 += 1.0
				_n_y_b17 += 1.0
		if _S.truth(not _S.truth(_n_settled_b14)):
			_S.invoke(_n_p_b5,"glow",[_S.named_value(_n_d_b9,"cx"), _S.named_value(_n_d_b9,"cy"), (_n_hd_b12 + 6), _S.index_value(_n_C_b3,4), (0.22 * _n_heat_b13)])
		if _S.truth((_S.named_value(_n_d_b9,"glint") if _S.truth(((_n_ki_b10 < 1.8) if _S.truth((_n_ki_b10 > 0.6)) else (_n_ki_b10 > 0.6))) else ((_n_ki_b10 < 1.8) if _S.truth((_n_ki_b10 > 0.6)) else (_n_ki_b10 > 0.6)))):
			_S.invoke(_n_glints_b7,"push",[[_n_d_b9, (float((_n_ki_b10 - 0.6))/1.2), _n_hd_b12]])
	for _iter_1 in _S.array(_n_glints_b7):
		var _tuple_2 = _iter_1
		var _n_d_b33 = _S.prop(_tuple_2,0)
		var _n_u_b34 = _S.prop(_tuple_2,1)
		var _n_hd_b35 = _S.prop(_tuple_2,2)
		if _S.truth(((_n_u_b34 <= 0) if _S.truth((_n_u_b34 <= 0)) else (_n_u_b34 >= 1))):
			continue
		var _n_y_b36 = ((_S.named_value(_n_d_b33,"cy") - _n_hd_b35) if _S.truth(_n_hd_b35) else _S.named_value(_n_d_b33,"cy"))
		_S.call_value(_n_glint,[_n_p_b5, _S.named_value(_n_d_b33,"cx"), _n_y_b36, (9 * pow(sin((PI * _n_u_b34)),0.7)), (_S.named_value(_n_d_b33,"spin") + (_n_u_b34 * 1.5)), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5)])
	return null
