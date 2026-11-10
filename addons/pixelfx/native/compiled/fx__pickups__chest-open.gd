@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/chest-open.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "coin", _S.import_value("fx/pickups/_lib.js", "coin"))
	_S.define(_e, "gemlet", _S.import_value("fx/pickups/_lib.js", "gemlet"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "pool", _S.import_value("fx/pickups/_lib.js", "pool"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "lidRows", _S.function_value(_e, "_f0"))
	_S.define(_e, "paintHoard", _S.function_value(_e, "_f2"))
	_S.define(_e, "paintLid", _S.function_value(_e, "_f4"))
	_S.define(_e, "paintFront", _S.function_value(_e, "_f8"))
	_S.define(_e, "paintChest", _S.function_value(_e, "_f9"))
	_S.define(_e, "create", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Chest open"}, {"desc": "A banded chest rattles with gold light leaking from its seam, the lid kicks open, rays fan up, and coins and gems arc out, bounce, glint and get collected."}, {"tags": ["pickup", "chest", "treasure", "loot", "reward", "gold", "one-shot"]}, {"size": [176, 112]}, {"origin": [88, 96]}, {"duration": 4.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1e1206", "#4a2c08", "#86520c", "#c48412", "#f0b424", "#ffe066", "#fff6c4", "#ffffff"]}, {"wood": ["#110a10", "#24131a", "#3a1f1f", "#552d24", "#73402c", "#925737", "#b07246"]}, {"coins": 12}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GEMS", _S.invoke([["#2a0612", "#6e0f2a", "#b81c3c", "#f0405a", "#ff8a96", "#ffd2d6"], ["#06200f", "#0f4a26", "#1a8040", "#34c060", "#8af0a0", "#d8ffe0"], ["#0a1030", "#142a70", "#2050c0", "#3a8cf0", "#8ccaff", "#dcf0ff"], ["#1a0a2a", "#3e1466", "#6a28a8", "#a050e0", "#d09cff", "#f0e0ff"]], "map", [_S.function_value(_e, "_f29")]))
	_S.define(_e, "T_OPEN", 0.8)
	_S.define(_e, "T_COLLECT", 2.55)
	_S.define(_e, "T_POOF", 3.3)
	_S.define(_e, "RATTLES", [[0.1, 0.4], [0.32, 0.62], [0.5, 0.8], [0.64, 1]])
	_S.define(_e, "HW", 12)
	_S.define(_e, "FH", 9)
	_S.define(_e, "CS", 0.94)
	_S.define(_e, "SN", 0.34)
	_S.define(_e, "HB", _S.binary("/", _S.read(_e, "FH"), _S.read(_e, "CS")))
	_S.define(_e, "LA", 6)
	_S.define(_e, "LB", 5.5)
	_S.define(_e, "STRAPS", [_S.unary("-", 9), 7])
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [40, 44]))
	_S.define(_e, "IL", _S.construct(_S.read(_e, "Layer"), [16, 16]))
	_S.define(_e, "tone", _S.function_value(_e, "_f30"))
	_S.define(_e, "IRON", _S.invoke(["#0e0d16", "#1d1c28", "#2f2e3e", "#474658", "#6a6a7e", "#9898ac"], "map", [_S.read(_e, "hex")]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_Map = _S.read(_parent,"Map")
	var _n_LA = _S.read(_parent,"LA")
	var _n_LB = _S.read(_parent,"LB")
	var _n_HB = _S.read(_parent,"HB")
	var _n_CS = _S.read(_parent,"CS")
	var _n_SN = _S.read(_parent,"SN")
	var _n_th_b0 = _S.arg(_args,0)
	var _n_best_b1 = _S.construct(_n_Map,[])
	var _n_ct_b2 = cos(_n_th_b0)
	var _n_st_b3 = sin(_n_th_b0)
	if true:
		var _n_i_b6 = 0
		while _S.truth((_n_i_b6 <= 260)):
			var _n_al_b7 = ((float(_n_i_b6)/260) * PI)
			var _n_dz_b8 = (_n_LA + (_n_LA * cos(_n_al_b7)))
			var _n_dy_b9 = (_n_LB * sin(_n_al_b7))
			var _n_z_b10 = (((-_n_LA) + (_n_dz_b8 * _n_ct_b2)) - (_n_dy_b9 * _n_st_b3))
			var _n_y_b11 = ((_n_HB + (_n_dz_b8 * _n_st_b3)) + (_n_dy_b9 * _n_ct_b2))
			if _S.truth((_n_y_b11 < (_n_HB - 0.05))):
				_n_i_b6 += 1.0
				continue
			var _n_nz_b12 = (float(cos(_n_al_b7))/_n_LA)
			var _n_ny_b13 = (float(sin(_n_al_b7))/_n_LB)
			var _n_nl_b14 = _S.Bridge.hypot([_n_nz_b12, _n_ny_b13])
			_n_nz_b12 /= _n_nl_b14
			_n_ny_b13 /= _n_nl_b14
			var _n_Nz_b15 = ((_n_nz_b12 * _n_ct_b2) - (_n_ny_b13 * _n_st_b3))
			var _n_Ny_b16 = ((_n_nz_b12 * _n_st_b3) + (_n_ny_b13 * _n_ct_b2))
			var _n_v_b17 = ((_n_y_b11 * _n_CS) + ((_n_LA - _n_z_b10) * _n_SN))
			var _n_dep_b18 = ((_n_z_b10 * _n_CS) + (_n_y_b11 * _n_SN))
			var _n_row_b19 = floori((-_n_v_b17))
			var _n_cur_b20 = _S.invoke(_n_best_b1,"get",[_n_row_b19])
			if _S.truth((not _S.truth(_n_cur_b20) if _S.truth(not _S.truth(_n_cur_b20)) else (_n_dep_b18 > _S.named_value(_n_cur_b20,"dep")))):
				_S.invoke(_n_best_b1,"set",[_n_row_b19, {"row":_n_row_b19,"al":_n_al_b7,"dep":_n_dep_b18,"out":(((_n_Nz_b15 * _n_CS) + (_n_Ny_b16 * _n_SN)) > 0),"lit":(((_n_Ny_b16 * 0.95) + (_n_Nz_b15 * 0.3)) - 0.2)}])
			_n_i_b6 += 1.0
	var _n_rows_b4 = _S.invoke(_S.concat([_S.array(_S.invoke(_n_best_b1,"values",[]))]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f1")])
	var _n_hi_b5 = null
	for _iter_0 in _S.array(_n_rows_b4):
		var _n_r_b21 = _iter_0
		if _S.truth(((not _S.truth(_n_hi_b5) if _S.truth(not _S.truth(_n_hi_b5)) else (_S.named_value(_n_r_b21,"lit") > _S.named_value(_n_hi_b5,"lit"))) if _S.truth(_S.named_value(_n_r_b21,"out")) else _S.named_value(_n_r_b21,"out"))):
			_n_hi_b5 = _n_r_b21
	if _S.truth(((_S.named_value(_n_hi_b5,"lit") > 0.5) if _S.truth(_n_hi_b5) else _n_hi_b5)):
		_S.set_prop(_n_hi_b5,"crest",true,"=")
	for _iter_1 in _S.array([(float(PI)/3), (float((2 * PI))/3)]):
		var _n_s_b22 = _iter_1
		var _n_k_b23 = null
		for _iter_2 in _S.array(_n_rows_b4):
			var _n_r_b24 = _iter_2
			if _S.truth((not _S.truth(_n_k_b23) if _S.truth(not _S.truth(_n_k_b23)) else (absf((_S.named_value(_n_r_b24,"al") - _n_s_b22)) < absf((_S.named_value(_n_k_b23,"al") - _n_s_b22))))):
				_n_k_b23 = _n_r_b24
		if _S.truth(((absf((_S.named_value(_n_k_b23,"al") - _n_s_b22)) < 0.4) if _S.truth(_n_k_b23) else _n_k_b23)):
			_S.set_prop(_n_k_b23,"seam",true,"=")
	return _n_rows_b4
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.named_value(_n_a_b0,"row") - _S.named_value(_n_b_b1,"row"))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_HW = _S.read(_parent,"HW")
	var _n_L = _S.read(_parent,"L")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	var _n_heat_b3 = _S.function_value(_S.capture(_parent,{"C":_n_C_b0,"g":_n_g_b2,"this":_this}),"_f3")
	if true:
		var _n_y_b4 = (-13)
		while _S.truth((_n_y_b4 <= (-10))):
			if true:
				var _n_x_b5 = (-_n_HW)
				while _S.truth((_n_x_b5 < _n_HW)):
					var _n_h_b6 = _S.MathFX.rand([_n_x_b5,_n_y_b4,7])
					var _n_k_b7 = (5 if _S.truth((_n_h_b6 < 0.18)) else (4 if _S.truth((_n_h_b6 < 0.55)) else 3))
					_S.invoke(_n_L,"set",[_n_x_b5, _n_y_b4, (_S.index_value(_n_W_b1,2) if _S.truth(((absf((_n_x_b5 + 0.5)) > 9) if _S.truth(_S.binary("===",_n_y_b4,(-13))) else _S.binary("===",_n_y_b4,(-13)))) else _S.call_value(_n_heat_b3,[(_n_k_b7 - (1 if _S.truth(_S.binary("===",_n_y_b4,(-13))) else 0))]))])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	if true:
		var _n_x_b8 = (-9)
		while _S.truth((_n_x_b8 < 9)):
			var _n_top_b9 = ((-13) - floori((2.2 * pow(cos(((float((_n_x_b8 + 0.5))/10) * (float(PI)/2))),1.4))+0.5))
			if true:
				var _n_y_b10 = _n_top_b9
				while _S.truth((_n_y_b10 < (-13))):
					_S.invoke(_n_L,"set",[_n_x_b8, _n_y_b10, _S.call_value(_n_heat_b3,[(5 if _S.truth(_S.binary("===",_n_y_b10,_n_top_b9)) else (4 + (1 if _S.truth((_S.MathFX.rand([_n_x_b8,_n_y_b10,3]) < 0.3)) else 0)))])])
					_n_y_b10 += 1.0
			_n_x_b8 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_g = _S.read(_parent,"g")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,clampf(floori((_n_k_b0 + (_n_g * 2.2))+0.5),0,7))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_lidRows = _S.read(_parent,"lidRows")
	var _n_HW = _S.read(_parent,"HW")
	var _n_STRAPS = _S.read(_parent,"STRAPS")
	var _n_tone = _S.read(_parent,"tone")
	var _n_IRON = _S.read(_parent,"IRON")
	var _n_L = _S.read(_parent,"L")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_th_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	var _n_rows_b4 = _S.call_value(_n_lidRows,[_n_th_b2])
	var _n_heat_b5 = _S.function_value(_S.capture(_parent,{"C":_n_C_b0,"g":_n_g_b3,"this":_this}),"_f5")
	var _n_top_b6 = (_S.named_value(_S.index_value(_n_rows_b4,0),"row") if _S.truth(_S.prop(_n_rows_b4,"length")) else 0)
	for _iter_0 in _S.array(_n_rows_b4):
		var _n_r_b7 = _iter_0
		var _n_u_b8 = _S.named_value(_n_r_b7,"al")
		if true:
			var _n_x_b9 = (-_n_HW)
			while _S.truth((_n_x_b9 < _n_HW)):
				var _n_strap_b10 = _S.invoke(_n_STRAPS,"some",[_S.function_value(_S.capture(_parent,{"x":_n_x_b9,"this":_this}),"_f6")])
				var _n_left_b11 = _S.invoke(_n_STRAPS,"some",[_S.function_value(_S.capture(_parent,{"x":_n_x_b9,"this":_this}),"_f7")])
				var _n_side_b12 = (float(((_n_x_b9 + _n_HW) + 0.5))/(2 * _n_HW))
				var _n_corner_b13 = (_S.binary("===",_n_x_b9,(-_n_HW)) if _S.truth(_S.binary("===",_n_x_b9,(-_n_HW))) else _S.binary("===",_n_x_b9,(_n_HW - 1)))
				var _n_c_b14 = null
				if _S.truth(_S.named_value(_n_r_b7,"out")):
					if _S.truth(((_n_th_b2 < 0.6) if _S.truth((_n_corner_b13 if _S.truth(_S.binary("===",_S.named_value(_n_r_b7,"row"),_n_top_b6)) else _S.binary("===",_S.named_value(_n_r_b7,"row"),_n_top_b6))) else (_n_corner_b13 if _S.truth(_S.binary("===",_S.named_value(_n_r_b7,"row"),_n_top_b6)) else _S.binary("===",_S.named_value(_n_r_b7,"row"),_n_top_b6)))):
						_n_x_b9 += 1.0
						continue
					var _n_l_b15 = (((_S.named_value(_n_r_b7,"lit") + 0.2) - (_n_side_b12 * 0.35)) - (0.45 if _S.truth(_S.binary("===",_S.named_value(_n_r_b7,"row"),_n_top_b6)) else 0))
					if _S.truth(((_n_u_b8 < 0.3) if _S.truth((_n_u_b8 < 0.3)) else ((_n_x_b9 <= 1) if _S.truth(((_n_x_b9 >= (-2)) if _S.truth((_n_u_b8 < 0.55)) else (_n_u_b8 < 0.55))) else ((_n_x_b9 >= (-2)) if _S.truth((_n_u_b8 < 0.55)) else (_n_u_b8 < 0.55))))):
						_n_c_b14 = _S.call_value(_n_tone,[_n_C_b0, (_n_l_b15 + (0.15 if _S.truth(((_n_x_b9 <= 1) if _S.truth((_n_x_b9 >= (-2))) else (_n_x_b9 >= (-2)))) else 0.1)), [6, 5, 5, 4, 3]])
					else:
						if _S.truth(_n_corner_b13):
							_n_c_b14 = (_S.index_value(_n_IRON,4) if _S.truth((_n_x_b9 < 0)) else _S.index_value(_n_IRON,2))
						else:
							if _S.truth(_n_strap_b10):
								_n_c_b14 = _S.call_value(_n_tone,[_n_IRON, (_n_l_b15 + (0.3 if _S.truth(_n_left_b11) else (-0.3))), [5, 4, 3, 2, 1]])
							else:
								if _S.truth(_S.named_value(_n_r_b7,"seam")):
									_n_c_b14 = _S.index_value(_n_W_b1,0)
								else:
									_n_c_b14 = (_S.index_value(_n_W_b1,6) if _S.truth(((_n_side_b12 < 0.62) if _S.truth(_S.named_value(_n_r_b7,"crest")) else _S.named_value(_n_r_b7,"crest"))) else _S.call_value(_n_tone,[_n_W_b1, _n_l_b15, [5, 4, 3, 2, 1]]))
									if _S.truth((_S.MathFX.rand([_S.binary(">>",_n_x_b9,1),floori((_n_u_b8 * 6)+0.5),11]) < 0.2)):
										_n_c_b14 = _S.index_value(_n_W_b1,maxf(0,(_S.invoke(_n_W_b1,"indexOf",[_n_c_b14]) - 1)))
				else:
					var _n_k_b16 = (_n_g_b3 * pow((float(_n_u_b8)/PI),1.3))
					if _S.truth((_n_u_b8 < 0.3)):
						_n_c_b14 = _S.call_value(_n_heat_b5,[1])
					else:
						if _S.truth(_S.named_value(_n_r_b7,"seam")):
							_n_c_b14 = _S.index_value(_n_W_b1,0)
						else:
							_n_c_b14 = (_S.ColorFX.mix(_S.index_value(_n_W_b1,4),_S.index_value(_n_C_b0,5),0.3) if _S.truth((_n_k_b16 > 0.6)) else (_S.index_value(_n_W_b1,3) if _S.truth((_n_k_b16 > 0.35)) else (_S.index_value(_n_W_b1,2) if _S.truth((_n_k_b16 > 0.15)) else _S.index_value(_n_W_b1,1))))
					if _S.truth(_n_corner_b13):
						_n_c_b14 = _S.index_value(_n_W_b1,0)
				_S.invoke(_n_L,"set",[_n_x_b9, _S.named_value(_n_r_b7,"row"), _n_c_b14])
				_n_x_b9 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_g = _S.read(_parent,"g")
	var _n_k_b0 = _S.arg(_args,0)
	return _S.index_value(_n_C,clampf(floori((_n_k_b0 + (_n_g * 2.2))+0.5),0,7))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_s_b0 = _S.arg(_args,0)
	return (_S.binary("===",_n_x,_n_s_b0) if _S.truth(_S.binary("===",_n_x,_n_s_b0)) else _S.binary("===",_n_x,(_n_s_b0 + 1)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_s_b0 = _S.arg(_args,0)
	return _S.binary("===",_n_x,_n_s_b0)
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_FH = _S.read(_parent,"FH")
	var _n_HW = _S.read(_parent,"HW")
	var _n_IRON = _S.read(_parent,"IRON")
	var _n_STRAPS = _S.read(_parent,"STRAPS")
	var _n_L = _S.read(_parent,"L")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_g_b2 = _S.arg(_args,2)
	if true:
		var _n_y_b4 = (-_n_FH)
		while _S.truth((_n_y_b4 <= (-1))):
			if true:
				var _n_x_b5 = (-_n_HW)
				while _S.truth((_n_x_b5 < _n_HW)):
					var _n_side_b6 = (float(((_n_x_b5 + _n_HW) + 0.5))/(2 * _n_HW))
					var _n_c_b7 = null
					if _S.truth(_S.binary("===",_n_y_b4,(-_n_FH))):
						_n_c_b7 = (_S.index_value(_n_C_b0,6) if _S.truth((_n_side_b6 < 0.3)) else (_S.index_value(_n_C_b0,5) if _S.truth((_n_side_b6 < 0.7)) else _S.index_value(_n_C_b0,4)))
					else:
						if _S.truth(_S.binary("===",_n_y_b4,(-1))):
							_n_c_b7 = _S.index_value(_n_W_b1,1)
						else:
							if _S.truth(_S.binary("===",_n_y_b4,(-5))):
								_n_c_b7 = _S.index_value(_n_W_b1,0)
							else:
								var _n_top_b8 = (_S.binary("===",_n_y_b4,(-8)) if _S.truth(_S.binary("===",_n_y_b4,(-8))) else _S.binary("===",_n_y_b4,(-4)))
								var _n_bot_b9 = (_S.binary("===",_n_y_b4,(-6)) if _S.truth(_S.binary("===",_n_y_b4,(-6))) else _S.binary("===",_n_y_b4,(-2)))
								_n_c_b7 = _S.index_value(_n_W_b1,((4 if _S.truth((_n_side_b6 < 0.45)) else 3) if _S.truth(_n_top_b8) else (2 if _S.truth(_n_bot_b9) else 3)))
								if _S.truth(((_S.MathFX.rand([_S.binary(">>",_n_x_b5,1),_n_y_b4,5]) < 0.2) if _S.truth(not _S.truth(_n_top_b8)) else not _S.truth(_n_top_b8))):
									_n_c_b7 = _S.index_value(_n_W_b1,(1 if _S.truth(_n_bot_b9) else 2))
					if _S.truth(_S.binary("===",_n_x_b5,(-_n_HW))):
						_n_c_b7 = (_S.index_value(_n_C_b0,5) if _S.truth(_S.binary("===",_n_y_b4,(-_n_FH))) else _S.index_value(_n_IRON,4))
					if _S.truth(_S.binary("===",_n_x_b5,(_n_HW - 1))):
						_n_c_b7 = (_S.index_value(_n_C_b0,3) if _S.truth(_S.binary("===",_n_y_b4,(-_n_FH))) else _S.index_value(_n_IRON,2))
					for _iter_0 in _S.array(_n_STRAPS):
						var _n_s_b10 = _iter_0
						if _S.truth(((_n_y_b4 > (-_n_FH)) if _S.truth(_S.binary("===",_n_x_b5,_n_s_b10)) else _S.binary("===",_n_x_b5,_n_s_b10))):
							_n_c_b7 = (_S.index_value(_n_IRON,5) if _S.truth((_S.binary("===",_n_y_b4,(-7)) if _S.truth(_S.binary("===",_n_y_b4,(-7))) else _S.binary("===",_n_y_b4,(-3)))) else _S.index_value(_n_IRON,4))
						if _S.truth(((_n_y_b4 > (-_n_FH)) if _S.truth(_S.binary("===",_n_x_b5,(_n_s_b10 + 1))) else _S.binary("===",_n_x_b5,(_n_s_b10 + 1)))):
							_n_c_b7 = _S.index_value(_n_IRON,2)
					_S.invoke(_n_L,"set",[_n_x_b5, _n_y_b4, _n_c_b7])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	if true:
		var _n_y_b11 = (-_n_FH)
		while _S.truth((_n_y_b11 <= (-4))):
			if true:
				var _n_x_b12 = (-2)
				while _S.truth((_n_x_b12 <= 1)):
					_S.invoke(_n_L,"set",[_n_x_b12, _n_y_b11, (_S.index_value(_n_C_b0,3) if _S.truth((_S.binary("===",_n_x_b12,1) if _S.truth(_S.binary("===",_n_x_b12,1)) else _S.binary("===",_n_y_b11,(-4)))) else (_S.index_value(_n_C_b0,7) if _S.truth((_S.binary("===",_n_y_b11,(-_n_FH)) if _S.truth(_S.binary("===",_n_x_b12,(-2))) else _S.binary("===",_n_x_b12,(-2)))) else _S.index_value(_n_C_b0,5)))])
					_n_x_b12 += 1.0
			_n_y_b11 += 1.0
	var _n_kh_b3 = (_S.index_value(_n_W_b1,0) if _S.truth((_n_g_b2 < 0.15)) else (_S.index_value(_n_C_b0,4) if _S.truth((_n_g_b2 < 0.4)) else (_S.index_value(_n_C_b0,6) if _S.truth((_n_g_b2 < 0.7)) else _n_WHITE)))
	_S.invoke(_n_L,"set",[(-1), (-7), _n_kh_b3])
	_S.invoke(_n_L,"set",[0, (-7), _n_kh_b3])
	_S.invoke(_n_L,"set",[(-1), (-6), _n_kh_b3])
	_S.invoke(_n_L,"set",[0, (-6), _S.ColorFX.scale_color(_n_kh_b3,0.85)])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_paintLid = _S.read(_parent,"paintLid")
	var _n_paintHoard = _S.read(_parent,"paintHoard")
	var _n_paintFront = _S.read(_parent,"paintFront")
	var _n_C_b0 = _S.arg(_args,0)
	var _n_W_b1 = _S.arg(_args,1)
	var _n_th_b2 = _S.arg(_args,2)
	var _n_g_b3 = _S.arg(_args,3)
	if _S.truth((_n_th_b2 > 1.2)):
		_S.call_value(_n_paintLid,[_n_C_b0, _n_W_b1, _n_th_b2, _n_g_b3])
		_S.call_value(_n_paintHoard,[_n_C_b0, _n_W_b1, _n_g_b3])
	else:
		_S.call_value(_n_paintHoard,[_n_C_b0, _n_W_b1, _n_g_b3])
		_S.call_value(_n_paintLid,[_n_C_b0, _n_W_b1, _n_th_b2, _n_g_b3])
	_S.call_value(_n_paintFront,[_n_C_b0, _n_W_b1, _n_g_b3])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "W", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "wood"), 7]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f11"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 4)}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "loot", [])
	_S.define(_e, "rings", [])
	_S.define(_e, "bits", [])
	_S.define(_e, "dust", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "hex"), ["#5e5068"]))
	_S.define(_e, "rays", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 9}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "n", _S.prop(_S.read(_e, "o"), "coins"))
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "i"), _S.binary("+", _S.read(_v32, "n"), 4))):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "gem", _S.binary(">=", _S.read(_v33, "i"), _S.read(_v33, "n")))
		_S.define(_v33, "s", (1 if _S.truth(_S.binary("%", _S.read(_v33, "i"), 2)) else _S.unary("-", 1)))
		_S.define(_v33, "a", _S.binary("*", _S.read(_v33, "s"), _S.invoke(_S.read(_v33, "R"), "range", [0.1, 0.5])))
		_S.define(_v33, "sp", _S.invoke(_S.read(_v33, "R"), "range", [190, 270]))
		_S.invoke(_S.read(_v33, "loot"), "push", [_S.merge([{"gem": _S.read(_v33, "gem")}, {"G": (_S.prop(_S.read(_v33, "GEMS"), _S.binary("%", _S.binary("-", _S.read(_v33, "i"), _S.read(_v33, "n")), _S.prop(_S.read(_v33, "GEMS"), "length"))) if _S.truth(_S.read(_v33, "gem")) else null)}, {"x": _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 7), 7])}, {"y": _S.unary("-", 12)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v33, "Math"), "sin", [_S.read(_v33, "a")]), _S.read(_v33, "sp"))}, {"vy": _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v33, "Math"), "cos", [_S.read(_v33, "a")])), _S.read(_v33, "sp"))}, {"t0": _S.binary("+", _S.binary("+", _S.read(_v33, "T_OPEN"), 0.03), _S.invoke(_S.read(_v33, "R"), "range", [0, 0.2]))}, {"up": false}, {"rest": false}, {"r": (2.6 if _S.truth(_S.read(_v33, "gem")) else 3)}, {"ax": _S.invoke(_S.read(_v33, "R"), "range", [_S.unary("-", 0.6), 0.6])}, {"spin": _S.invoke(_S.read(_v33, "R"), "range", [0, _S.read(_v33, "TAU")])}, {"vs": _S.binary("*", _S.invoke(_S.read(_v33, "R"), "sign", []), _S.invoke(_S.read(_v33, "R"), "range", [14, 24]))}, {"settle": 0}, {"ph": _S.invoke(_S.read(_v33, "R"), "next", [])}, {"pop": 0}, {"gone": false}])])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "+=", true)
	_S.invoke(_S.invoke(_S.concat([_S.array(_S.read(_e, "loot"))]), "sort", [_S.function_value(_e, "_f13")]), "forEach", [_S.function_value(_e, "_f14")])
	_S.define(_e, "t", 0)
	_S.define(_e, "opened", false)
	_S.define(_e, "poofed", false)
	_S.define(_e, "shake", _S.function_value(_e, "_f15"))
	_S.define(_e, "lidAngle", _S.function_value(_e, "_f16"))
	_S.define(_e, "inner", _S.function_value(_e, "_f17"))
	_S.define(_e, "rayK", _S.function_value(_e, "_f18"))
	return _S.merge([{"update": _S.function_value(_e, "_f19")}, {"drawBack": _S.function_value(_e, "_f22")}, {"draw": _S.function_value(_e, "_f23")}])

static func _f11(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_u_b2 = (((float(_n_i_b1)/8) * 2) - 1)
	return {"a":((_n_u_b2 * 1.05) + _S.invoke(_n_R,"range",[(-0.06), 0.06])),"len":(_S.invoke(_n_R,"range",[46, 64]) * (1.2 - (0.4 * absf(_n_u_b2)))),"w":_S.invoke(_n_R,"range",[0.035, 0.08]),"d":_S.invoke(_n_R,"range",[0, 0.06]),"f":_S.invoke(_n_R,"range",[5, 10]),"ph":_S.invoke(_n_R,"range",[0, _n_TAU])}
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (absf(_S.named_value(_n_b_b1,"vx")) - absf(_S.named_value(_n_a_b0,"vx")))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_T_COLLECT = _S.read(_parent,"T_COLLECT")
	var _n_R = _S.read(_parent,"R")
	var _n_it_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return _S.set_prop(_n_it_b0,"pop",((_n_T_COLLECT + (_n_k_b1 * 0.04)) + _S.invoke(_n_R,"range",[0, 0.02])),"=")
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_RATTLES = _S.read(_parent,"RATTLES")
	var _n_T_OPEN = _S.read(_parent,"T_OPEN")
	var _n_dx_b0 = 0
	var _n_hop_b1 = 0
	var _n_lid_b2 = 0
	for _iter_0 in _S.array(_n_RATTLES):
		var _tuple_1 = _iter_0
		var _n_t0_b4 = _S.prop(_tuple_1,0)
		var _n_s_b5 = _S.prop(_tuple_1,1)
		var _n_u_b6 = (_n_t - _n_t0_b4)
		if _S.truth(((_n_u_b6 < 0) if _S.truth((_n_u_b6 < 0)) else (_n_u_b6 > 0.18))):
			continue
		var _n_e_b7 = (1 - (float(_n_u_b6)/0.18))
		_n_dx_b0 += (((sin((_n_u_b6 * 90)) * 1.6) * _n_s_b5) * _n_e_b7)
		if _S.truth(((_n_s_b5 > 0.5) if _S.truth((_n_u_b6 < 0.06)) else (_n_u_b6 < 0.06))):
			_n_hop_b1 = 1
		_n_lid_b2 = maxf(_n_lid_b2,(((maxf(0,sin((_n_u_b6 * 38))) * 0.13) * _n_s_b5) * _n_e_b7))
	if _S.truth(((_n_t < (_n_T_OPEN + 0.08)) if _S.truth((_n_t >= _n_T_OPEN)) else (_n_t >= _n_T_OPEN))):
		_n_hop_b1 = 1
	var _n_strain_b3 = _S.MathFX.smooth((_n_T_OPEN - 0.14),_n_T_OPEN,_n_t)
	if _S.truth((_n_t < _n_T_OPEN)):
		_n_lid_b2 = maxf(_n_lid_b2,(0.07 * _n_strain_b3))
		_n_dx_b0 += (((1 if _S.truth(fmod(floori((_n_t * 60)),2)) else (-1)) * 0.6) if _S.truth((_n_strain_b3 > 0.2)) else 0)
	return {"dx":floori(_n_dx_b0+0.5),"hop":_n_hop_b1,"lid":_n_lid_b2}
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_T_OPEN = _S.read(_parent,"T_OPEN")
	var _n_lid_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < _n_T_OPEN)):
		return _n_lid_b0
	var _n_u_b1 = (_n_t - _n_T_OPEN)
	var _n_w_b2 = 30
	var _n_z_b3 = 0.55
	var _n_wd_b4 = (_n_w_b2 * sqrt((1 - (_n_z_b3 * _n_z_b3))))
	return (1.98 * (1 - (exp((((-_n_z_b3) * _n_w_b2) * _n_u_b1)) * (cos((_n_wd_b4 * _n_u_b1)) + ((float((_n_z_b3 * _n_w_b2))/_n_wd_b4) * sin((_n_wd_b4 * _n_u_b1)))))))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_T_OPEN = _S.read(_parent,"T_OPEN")
	var _n_RATTLES = _S.read(_parent,"RATTLES")
	var _n_T_COLLECT = _S.read(_parent,"T_COLLECT")
	var _n_T_POOF = _S.read(_parent,"T_POOF")
	if _S.truth((_n_t < _n_T_OPEN)):
		var _n_k_b0 = ((0.1 + (0.45 * _S.MathFX.smooth(0,_n_T_OPEN,_n_t))) + (0.5 * _S.MathFX.smooth((_n_T_OPEN - 0.14),_n_T_OPEN,_n_t)))
		for _iter_0 in _S.array(_n_RATTLES):
			var _tuple_1 = _iter_0
			var _n_t0_b1 = _S.prop(_tuple_1,0)
			var _n_s_b2 = _S.prop(_tuple_1,1)
			if _S.truth((_n_t > _n_t0_b1)):
				_n_k_b0 += ((0.45 * _n_s_b2) * exp(((-(_n_t - _n_t0_b1)) * 9)))
		return _n_k_b0
	return (((0.62 + (0.3 * exp(((-(_n_t - _n_T_OPEN)) * 5)))) * (1 - _S.MathFX.smooth((_n_T_COLLECT - 0.3),_n_T_POOF,_n_t))) + (0.05 * sin((_n_t * 9))))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_T_OPEN = _S.read(_parent,"T_OPEN")
	var _n_ease = _S.read(_parent,"ease")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_u_b1 = ((_n_t - _n_T_OPEN) - _S.named_value(_n_r_b0,"d"))
	if _S.truth((_n_u_b1 < 0)):
		return 0
	return ((_S.invoke(_n_ease,"outCubic",[clampf((float(_n_u_b1)/0.1),0.0,1.0)]) * (1 - _S.MathFX.smooth(1,2.1,_n_u_b1))) * (0.72 + (0.28 * sin(((_n_t * _S.named_value(_n_r_b0,"f")) + _S.named_value(_n_r_b0,"ph"))))))
	return null

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "g", _S.call_value(_S.read(_e, "inner"), []))
	for _v42 in _S.array(_S.read(_e, "RATTLES")):
		var _v43 = _S.scope(_e)
		var _v44 = _v42
		_S.define(_v43, "t0", _S.prop(_v44, 0))
		_S.define(_v43, "s", _S.prop(_v44, 1))
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_v43, "s"), 0.5), func(): return _S.binary("<", _S.binary("-", _S.read(_v43, "t"), _S.read(_v43, "dt")), _S.binary("+", _S.read(_v43, "t0"), 0.05))), func(): return _S.binary(">=", _S.read(_v43, "t"), _S.binary("+", _S.read(_v43, "t0"), 0.05)))):
			var _v45 = _S.scope(_v43)
			_S.define(_v45, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v45, "i"), 4)):
				var _v46 = _S.scope(_v45)
				_S.define(_v46, "sd", (1 if _S.truth(_S.binary("%", _S.read(_v46, "i"), 2)) else _S.unary("-", 1)))
				_S.invoke(_S.read(_v46, "ps"), "spawn", [_S.prop(_S.read(_v46, "P"), "DUST"), _S.binary("*", _S.read(_v46, "sd"), _S.invoke(_S.read(_v46, "R"), "range", [9, 13])), _S.unary("-", 1), _S.binary("*", _S.read(_v46, "sd"), _S.invoke(_S.read(_v46, "R"), "range", [20, 50])), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [2, 8])), _S.invoke(_S.read(_v46, "R"), "range", [0.3, 0.5]), _S.read(_v46, "DUST"), _S.binary("*", _S.invoke(_S.read(_v46, "R"), "range", [1.2, 2.2]), _S.read(_v46, "s"))])
				_v45 = _S.iteration(_v45)
				_S.write(_v45, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", _S.read(_e, "g"), 0.08)]))):
		var _v47 = _S.scope(_e)
		_S.define(_v47, "x", _S.invoke(_S.read(_v47, "R"), "range", [_S.unary("-", 11), 11]))
		_S.invoke(_S.read(_v47, "ps"), "spawn", [_S.prop(_S.read(_v47, "P"), "STAR"), _S.read(_v47, "x"), _S.unary("-", 10), _S.binary("*", _S.read(_v47, "x"), 1.5), _S.unary("-", _S.invoke(_S.read(_v47, "R"), "range", [8, 30])), _S.invoke(_S.read(_v47, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v47, "C"), 6) if _S.truth(_S.invoke(_S.read(_v47, "R"), "chance", [0.5])) else _S.prop(_S.read(_v47, "C"), 5)), _S.invoke(_S.read(_v47, "R"), "range", [0.4, 1.2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "opened")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_OPEN")))):
		var _v48 = _S.scope(_e)
		_S.write(_v48, "opened", true, "=", false)
		_S.invoke(_S.read(_v48, "lights"), "add", [0, _S.unary("-", 18), 64, _S.prop(_S.read(_v48, "C"), 5), 0.45, 0.7])
		_S.invoke(_S.read(_v48, "lights"), "add", [0, _S.unary("-", 16), 22, _S.read(_v48, "WHITE"), 0.35, 0.1])
		var _v49 = _S.scope(_v48)
		_S.define(_v49, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v49, "i"), 7)):
			var _v50 = _S.scope(_v49)
			_S.define(_v50, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v50, "Math"), "PI")), 2), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v50, "sp", _S.invoke(_S.read(_v50, "R"), "range", [120, 260]))
			_S.invoke(_S.read(_v50, "ps"), "spawn", [_S.prop(_S.read(_v50, "P"), "SPARK"), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 13), _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "cos", [_S.read(_v50, "a")]), _S.read(_v50, "sp")), _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "sin", [_S.read(_v50, "a")]), _S.read(_v50, "sp")), _S.invoke(_S.read(_v50, "R"), "range", [0.12, 0.26])])
			_v49 = _S.iteration(_v49)
			_S.write(_v49, "i", 1, "+=", true)
		var _v51 = _S.scope(_v48)
		_S.define(_v51, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v51, "i"), 8)):
			var _v52 = _S.scope(_v51)
			_S.define(_v52, "s", _S.invoke(_S.read(_v52, "R"), "sign", []))
			_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "DUST"), _S.binary("*", _S.read(_v52, "s"), _S.invoke(_S.read(_v52, "R"), "range", [10, 14])), _S.unary("-", 1), _S.binary("*", _S.read(_v52, "s"), _S.invoke(_S.read(_v52, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v52, "R"), "range", [2, 10])), _S.invoke(_S.read(_v52, "R"), "range", [0.4, 0.7]), _S.read(_v52, "DUST"), _S.invoke(_S.read(_v52, "R"), "range", [1.6, 3])])
			_v51 = _S.iteration(_v51)
			_S.write(_v51, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "T_OPEN")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "T_COLLECT")))):
		var _v53 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v53, "R"), "chance", [0.22])):
			_S.invoke(_S.read(_v53, "ps"), "spawn", [_S.prop(_S.read(_v53, "P"), "EMBER"), _S.invoke(_S.read(_v53, "R"), "range", [_S.unary("-", 9), 9]), _S.unary("-", 13), _S.invoke(_S.read(_v53, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v53, "R"), "range", [25, 60])), _S.invoke(_S.read(_v53, "R"), "range", [0.8, 1.5]), _S.prop(_S.read(_v53, "C"), 5), _S.invoke(_S.read(_v53, "R"), "range", [0.8, 1.6])])
		if _S.truth(_S.invoke(_S.read(_v53, "R"), "chance", [0.12])):
			var _v54 = _S.scope(_v53)
			_S.define(_v54, "a", _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 1), 1]))
			_S.define(_v54, "d", _S.invoke(_S.read(_v54, "R"), "range", [10, 40]))
			_S.invoke(_S.read(_v54, "ps"), "spawn", [_S.prop(_S.read(_v54, "P"), "STAR"), _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "sin", [_S.read(_v54, "a")]), _S.read(_v54, "d")), _S.binary("-", _S.unary("-", 12), _S.binary("*", _S.invoke(_S.read(_v54, "Math"), "cos", [_S.read(_v54, "a")]), _S.read(_v54, "d"))), 0, _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [4, 12])), _S.invoke(_S.read(_v54, "R"), "range", [0.3, 0.7]), (_S.read(_v54, "WHITE") if _S.truth(_S.invoke(_S.read(_v54, "R"), "chance", [0.5])) else _S.prop(_S.read(_v54, "C"), 6)), _S.invoke(_S.read(_v54, "R"), "range", [0.5, 2])])
	for _v55 in _S.array(_S.read(_e, "loot")):
		var _v56 = _S.scope(_e)
		_S.define(_v56, "it", _v55)
		var _v57 = _S.scope(_v56)
		if _S.truth(_S.logical("||", _S.prop(_S.read(_v57, "it"), "gone"), func(): return _S.binary("<", _S.read(_v57, "t"), _S.prop(_S.read(_v57, "it"), "t0")))):
			continue
		_S.set_prop(_S.read(_v57, "it"), "up", true, "=", false)
		if _S.truth(_S.binary(">=", _S.read(_v57, "t"), _S.binary("+", _S.prop(_S.read(_v57, "it"), "pop"), 0.13))):
			var _v58 = _S.scope(_v57)
			_S.set_prop(_S.read(_v58, "it"), "gone", true, "=", false)
			_S.define(_v58, "y", _S.binary("-", _S.prop(_S.read(_v58, "it"), "y"), 6))
			if _S.truth(_S.prop(_S.read(_v58, "it"), "gem")):
				_S.invoke(_S.read(_v58, "rings"), "push", [_S.merge([{"x": _S.prop(_S.read(_v58, "it"), "x")}, {"y": _S.read(_v58, "y")}, {"t0": _S.read(_v58, "t")}])])
			_S.invoke(_S.read(_v58, "lights"), "add", [_S.prop(_S.read(_v58, "it"), "x"), _S.read(_v58, "y"), 18, (_S.prop(_S.prop(_S.read(_v58, "it"), "G"), 4) if _S.truth(_S.prop(_S.read(_v58, "it"), "gem")) else _S.prop(_S.read(_v58, "C"), 5)), 0.65, 0.25])
			var _v59 = _S.scope(_v58)
			_S.define(_v59, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v59, "i"), 4)):
				var _v60 = _S.scope(_v59)
				_S.define(_v60, "a", _S.invoke(_S.read(_v60, "R"), "range", [0, _S.read(_v60, "TAU")]))
				_S.define(_v60, "sp", _S.invoke(_S.read(_v60, "R"), "range", [25, 55]))
				_S.invoke(_S.read(_v60, "ps"), "spawn", [_S.prop(_S.read(_v60, "P"), "STAR"), _S.prop(_S.read(_v60, "it"), "x"), _S.read(_v60, "y"), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v60, "Math"), "cos", [_S.read(_v60, "a")]), _S.read(_v60, "sp")), _S.binary("*", _S.prop(_S.read(_v60, "it"), "x"), 0.25)), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v60, "Math"), "sin", [_S.read(_v60, "a")]), _S.read(_v60, "sp")), 20), _S.invoke(_S.read(_v60, "R"), "range", [0.3, 0.55]), ((_S.prop(_S.prop(_S.read(_v60, "it"), "G"), 5) if _S.truth(_S.prop(_S.read(_v60, "it"), "gem")) else _S.prop(_S.read(_v60, "C"), 6)) if _S.truth(_S.read(_v60, "i")) else _S.read(_v60, "WHITE")), _S.invoke(_S.read(_v60, "R"), "range", [0.6, 1.5])])
				_v59 = _S.iteration(_v59)
				_S.write(_v59, "i", 1, "+=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v57, "it"), "rest")):
			var _v61 = _S.scope(_v57)
			_S.set_prop(_S.read(_v61, "it"), "settle", _S.read(_v61, "dt"), "+=", false)
			_S.set_prop(_S.read(_v61, "it"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v61, "it"), "vx"), 9), _S.read(_v61, "dt")), "-=", false)
			_S.set_prop(_S.read(_v61, "it"), "x", _S.call_value(_S.read(_v61, "clamp"), [_S.binary("+", _S.prop(_S.read(_v61, "it"), "x"), _S.binary("*", _S.prop(_S.read(_v61, "it"), "vx"), _S.read(_v61, "dt"))), _S.unary("-", 74), 74]), "=", false)
			continue
		_S.set_prop(_S.read(_v57, "it"), "vy", _S.binary("*", 950, _S.read(_v57, "dt")), "+=", false)
		_S.set_prop(_S.read(_v57, "it"), "x", _S.binary("*", _S.prop(_S.read(_v57, "it"), "vx"), _S.read(_v57, "dt")), "+=", false)
		if _S.truth(_S.binary(">", _S.invoke(_S.read(_v57, "Math"), "abs", [_S.prop(_S.read(_v57, "it"), "x")]), 74)):
			_S.last([_S.set_prop(_S.read(_v57, "it"), "x", _S.binary("*", _S.invoke(_S.read(_v57, "Math"), "sign", [_S.prop(_S.read(_v57, "it"), "x")]), 74), "=", false), _S.set_prop(_S.read(_v57, "it"), "vx", _S.unary("-", 0.3), "*=", false)])
		_S.set_prop(_S.read(_v57, "it"), "y", _S.binary("*", _S.prop(_S.read(_v57, "it"), "vy"), _S.read(_v57, "dt")), "+=", false)
		_S.set_prop(_S.read(_v57, "it"), "spin", _S.binary("*", _S.prop(_S.read(_v57, "it"), "vs"), _S.read(_v57, "dt")), "+=", false)
		_S.define(_v57, "bottom", _S.binary("+", _S.prop(_S.read(_v57, "it"), "y"), _S.prop(_S.read(_v57, "it"), "r")))
		if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v57, "bottom"), _S.unary("-", 0.5)), func(): return _S.binary(">", _S.prop(_S.read(_v57, "it"), "vy"), 0))):
			var _v62 = _S.scope(_v57)
			_S.set_prop(_S.read(_v62, "it"), "y", _S.binary("-", _S.unary("-", 0.5), _S.prop(_S.read(_v62, "it"), "r")), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v62, "it"), "vy"), 110)):
				var _v63 = _S.scope(_v62)
				_S.invoke(_S.read(_v63, "ps"), "spawn", [_S.prop(_S.read(_v63, "P"), "DUST"), _S.prop(_S.read(_v63, "it"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v63, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v63, "R"), "range", [4, 12])), _S.invoke(_S.read(_v63, "R"), "range", [0.25, 0.45]), _S.read(_v63, "DUST"), _S.invoke(_S.read(_v63, "R"), "range", [1, 1.8])])
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v63, "it"), "vy"), 220)):
					var _v64 = _S.scope(_v63)
					var _v65 = _S.scope(_v64)
					_S.define(_v65, "i", 0)
					while _S.truth(_S.binary("<", _S.read(_v65, "i"), 2)):
						_S.invoke(_S.read(_v65, "ps"), "spawn", [_S.prop(_S.read(_v65, "P"), "SPARK"), _S.prop(_S.read(_v65, "it"), "x"), _S.unary("-", 1), _S.invoke(_S.read(_v65, "R"), "range", [_S.unary("-", 90), 90]), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [60, 140])), _S.invoke(_S.read(_v65, "R"), "range", [0.1, 0.22])])
						_v65 = _S.iteration(_v65)
						_S.write(_v65, "i", 1, "+=", true)
					_S.invoke(_S.read(_v64, "lights"), "add", [_S.prop(_S.read(_v64, "it"), "x"), _S.unary("-", 2), 9, _S.prop(_S.read(_v64, "C"), 5), 0.5, 0.12])
				_S.set_prop(_S.read(_v63, "it"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v63, "it"), "vy")), 0.42), "=", false)
				_S.set_prop(_S.read(_v63, "it"), "vx", 0.5, "*=", false)
				_S.set_prop(_S.read(_v63, "it"), "vs", 0.55, "*=", false)
			else:
				var _v66 = _S.scope(_v62)
				_S.set_prop(_S.read(_v66, "it"), "rest", true, "=", false)
				_S.set_prop(_S.read(_v66, "it"), "vy", 0, "=", false)
	var _v67 = _S.scope(_e)
	_S.define(_v67, "i", _S.binary("-", _S.prop(_S.read(_v67, "rings"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v67, "i"), 0)):
		if _S.truth(_S.binary(">", _S.binary("-", _S.read(_v67, "t"), _S.prop(_S.prop(_S.read(_v67, "rings"), _S.read(_v67, "i")), "t0")), 0.3)):
			_S.invoke(_S.read(_v67, "rings"), "splice", [_S.read(_v67, "i"), 1])
		_v67 = _S.iteration(_v67)
		_S.write(_v67, "i", 1, "-=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "poofed")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "T_POOF")))):
		var _v68 = _S.scope(_e)
		_S.write(_v68, "poofed", true, "=", false)
		_S.invoke(_S.read(_v68, "lights"), "add", [0, _S.unary("-", 12), 40, _S.prop(_S.read(_v68, "C"), 5), 0.5, 0.6])
		_S.invoke(_S.read(_v68, "L"), "begin", [_S.unary("-", 20), _S.unary("-", 32)])
		_S.call_value(_S.read(_v68, "paintChest"), [_S.read(_v68, "C"), _S.read(_v68, "W"), _S.call_value(_S.read(_v68, "lidAngle"), [0]), 0.3])
		_S.invoke(_S.read(_v68, "L"), "outline", [_S.prop(_S.read(_v68, "W"), 0)])
		_S.define(_v68, "f", _S.prop(_S.read(_v68, "L"), "f"))
		_S.define(_v68, "top", 0)
		_S.invoke(_S.prop(_S.read(_v68, "f"), "color"), "forEach", [_S.function_value(_v68, "_f20")])
		_S.invoke(_S.prop(_S.read(_v68, "f"), "color"), "forEach", [_S.function_value(_v68, "_f21")])
	for _v69 in _S.array(_S.read(_e, "bits")):
		var _v70 = _S.scope(_e)
		_S.define(_v70, "b", _v69)
		if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v70, "b"), "done")), func(): return _S.binary(">=", _S.read(_v70, "t"), _S.prop(_S.read(_v70, "b"), "td")))):
			var _v71 = _S.scope(_v70)
			_S.set_prop(_S.read(_v71, "b"), "done", true, "=", false)
			if _S.truth(_S.prop(_S.read(_v71, "b"), "mote")):
				_S.invoke(_S.read(_v71, "dust"), "spawn", [_S.prop(_S.read(_v71, "P"), "EMBER"), _S.binary("+", _S.prop(_S.read(_v71, "b"), "x"), 0.5), _S.binary("+", _S.prop(_S.read(_v71, "b"), "y"), 0.5), _S.invoke(_S.read(_v71, "R"), "range", [_S.unary("-", 28), 28]), _S.unary("-", _S.invoke(_S.read(_v71, "R"), "range", [14, 50])), _S.invoke(_S.read(_v71, "R"), "range", [0.4, 0.8]), _S.prop(_S.read(_v71, "C"), 5), _S.invoke(_S.read(_v71, "R"), "range", [0.5, 1.1])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "dust"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "c", _S.arg(_args, 0))
	_S.define(_e, "i", _S.arg(_args, 1))
	return _S.logical("&&", _S.read(_e, "c"), func(): return _S.write(_e, "top", _S.invoke(_S.read(_e, "Math"), "min", [_S.read(_e, "top"), _S.binary("+", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("/", _S.read(_e, "i"), _S.prop(_S.read(_e, "f"), "w"))]), _S.prop(_S.read(_e, "f"), "oy"))]), "=", false))

static func _f21(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_bits = _S.read(_parent,"bits")
	var _n_T_POOF = _S.read(_parent,"T_POOF")
	var _n_top = _S.read(_parent,"top")
	var _n_W = _S.read(_parent,"W")
	var _n_c_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	if _S.truth(not _S.truth(_n_c_b0)):
		return null
	var _n_x_b2 = (fmod(_n_i_b1,_S.named_value(_n_f,"w")) + _S.named_value(_n_f,"ox"))
	var _n_y_b3 = (floori((float(_n_i_b1)/_S.named_value(_n_f,"w"))) + _S.named_value(_n_f,"oy"))
	_S.invoke(_n_bits,"push",[{"x":_n_x_b2,"y":_n_y_b3,"c":_n_c_b0,"td":((_n_T_POOF + ((float((_n_y_b3 - _n_top))/(-_n_top)) * 0.32)) + (_S.MathFX.rand([_n_x_b2,_n_y_b3,21]) * 0.05)),"mote":((_S.MathFX.rand([_n_x_b2,_n_y_b3,23]) < 0.14) if _S.truth(_S.binary("!==",_n_c_b0,_S.index_value(_n_W,0))) else _S.binary("!==",_n_c_b0,_S.index_value(_n_W,0)))}])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_T_POOF = _S.read(_parent,"T_POOF")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth((_n_t < (_n_T_POOF + 0.2))):
		_S.call_value(_n_blobShadow,[_n_p_b0, 0, 15, (1 - _S.MathFX.smooth(_n_T_POOF,(_n_T_POOF + 0.2),_n_t))])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_inner = _S.read(_parent,"inner")
	var _n_shake = _S.read(_parent,"shake")
	var _n_lidAngle = _S.read(_parent,"lidAngle")
	var _n_t = _S.read(_parent,"t")
	var _n_T_OPEN = _S.read(_parent,"T_OPEN")
	var _n_C = _S.read(_parent,"C")
	var _n_pool = _S.read(_parent,"pool")
	var _n_T_POOF = _S.read(_parent,"T_POOF")
	var _n_L = _S.read(_parent,"L")
	var _n_paintChest = _S.read(_parent,"paintChest")
	var _n_W = _S.read(_parent,"W")
	var _n_bits = _S.read(_parent,"bits")
	var _n_rayK = _S.read(_parent,"rayK")
	var _n_rays = _S.read(_parent,"rays")
	var _n_flare = _S.read(_parent,"flare")
	var _n_ease = _S.read(_parent,"ease")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_IL = _S.read(_parent,"IL")
	var _n_gemlet = _S.read(_parent,"gemlet")
	var _n_coin = _S.read(_parent,"coin")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_glint = _S.read(_parent,"glint")
	var _n_loot = _S.read(_parent,"loot")
	var _n_rings = _S.read(_parent,"rings")
	var _n_ps = _S.read(_parent,"ps")
	var _n_dust = _S.read(_parent,"dust")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_g_b1 = _S.call_value(_n_inner,[])
	var _n_sh_b2 = _S.call_value(_n_shake,[])
	var _n_th_b3 = _S.call_value(_n_lidAngle,[_S.named_value(_n_sh_b2,"lid")])
	var _n_open_b4 = (1 if _S.truth((_n_t >= _n_T_OPEN)) else 0)
	_S.call_value(_n_pool,[_n_p_b0, 0, 0, (30 + (10 * _n_g_b1)), 4, _S.index_value(_n_C,4), ((0.1 + (0.18 * _n_open_b4)) * _n_g_b1)])
	_S.invoke(_n_p_b0,"glow",[0, (-16), (24 + (8 * _n_g_b1)), _S.index_value(_n_C,4), ((0.1 + (0.2 * _n_open_b4)) * _n_g_b1)])
	if _S.truth((_n_t < _n_T_POOF)):
		_S.invoke(_n_L,"begin",[(-20), (-32)])
		_S.call_value(_n_paintChest,[_n_C, _n_W, _n_th_b3, minf(1.2,_n_g_b1)])
		_S.invoke(_n_L,"outline",[_S.index_value(_n_W,0)])
		_S.invoke(_n_L,"draw",[_n_p_b0, _S.named_value(_n_sh_b2,"dx"), (-_S.named_value(_n_sh_b2,"hop"))])
	else:
		for _iter_0 in _S.array(_n_bits):
			var _n_b_b5 = _iter_0
			if _S.truth(not _S.truth(_S.named_value(_n_b_b5,"done"))):
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_b_b5,"x"), _S.named_value(_n_b_b5,"y"), ((_S.index_value(_n_C,3) if _S.truth(_S.binary("===",_S.named_value(_n_b_b5,"c"),_S.index_value(_n_W,0))) else _S.index_value(_n_C,6)) if _S.truth(((_S.named_value(_n_b_b5,"td") - _n_t) < 0.04)) else _S.named_value(_n_b_b5,"c"))])
	if _S.truth((_n_t < _n_T_OPEN)):
		_S.invoke(_n_p_b0,"glowLine",[(-11), ((-9.5) - _S.named_value(_n_sh_b2,"hop")), 11, ((-9.5) - _S.named_value(_n_sh_b2,"hop")), 5, _S.index_value(_n_C,5), (0.22 * _n_g_b1)])
		if _S.truth(((_S.named_value(_n_sh_b2,"lid") < 0.015) if _S.truth((_n_g_b1 > 0.35)) else (_n_g_b1 > 0.35))):
			_S.invoke(_n_p_b0,"line",[((-10) + _S.named_value(_n_sh_b2,"dx")), ((-10) - _S.named_value(_n_sh_b2,"hop")), (9 + _S.named_value(_n_sh_b2,"dx")), ((-10) - _S.named_value(_n_sh_b2,"hop")), _S.function_value(_S.capture(_parent,{"this":_this}),"_f24"), _S.function_value(_S.capture(_parent,{"g":_n_g_b1,"this":_this}),"_f25")])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_sh_b2,"dx"), ((-7) - _S.named_value(_n_sh_b2,"hop")), 6, _S.index_value(_n_C,6), (0.35 * _n_g_b1)])
		if _S.truth((_S.named_value(_n_sh_b2,"lid") > 0.015)):
			if true:
				var _n_i_b6 = 0
				while _S.truth((_n_i_b6 < 8)):
					var _n_x_b7 = ((((-10.5) + (_n_i_b6 * 3)) + _S.named_value(_n_sh_b2,"dx")) + ((_S.MathFX.rand([_n_i_b6,3]) - 0.5) * 1.5))
					var _n_a_b8 = ((float((-PI))/2) + ((float(_n_x_b7)/11) * 1.25))
					var _n_l_b9 = ((7 + (_S.MathFX.rand([_n_i_b6,floori((_n_t * 30)),1]) * 12)) * minf(1,(float(_S.named_value(_n_sh_b2,"lid"))/0.05)))
					var _n_y0_b10 = ((-10) - _S.named_value(_n_sh_b2,"hop"))
					_S.invoke(_n_p_b0,"line",[_n_x_b7, _n_y0_b10, (_n_x_b7 + (cos(_n_a_b8) * _n_l_b9)), (_n_y0_b10 + (sin(_n_a_b8) * _n_l_b9)), _S.function_value(_S.capture(_parent,{"this":_this}),"_f26"), _S.function_value(_S.capture(_parent,{"this":_this}),"_f27")])
					_S.invoke(_n_p_b0,"glowLine",[_n_x_b7, _n_y0_b10, (_n_x_b7 + ((cos(_n_a_b8) * _n_l_b9) * 0.7)), (_n_y0_b10 + ((sin(_n_a_b8) * _n_l_b9) * 0.7)), 3, _S.index_value(_n_C,5), 0.25])
					_n_i_b6 += 1.0
	for _iter_1 in _S.array(_n_rays):
		var _n_r_b11 = _iter_1
		var _n_k_b12 = _S.call_value(_n_rayK,[_n_r_b11])
		if _S.truth((_n_k_b12 <= 0.01)):
			continue
		var _n_ox_b13 = (sin(_S.named_value(_n_r_b11,"a")) * 7)
		var _n_oy_b14 = (-12)
		var _n_dx_b15 = sin(_S.named_value(_n_r_b11,"a"))
		var _n_dy_b16 = (-cos(_S.named_value(_n_r_b11,"a")))
		var _n_len_b17 = (_S.named_value(_n_r_b11,"len") * (0.88 + (0.12 * sin((((_n_t * _S.named_value(_n_r_b11,"f")) * 0.7) + _S.named_value(_n_r_b11,"ph"))))))
		var _n_tw_b18 = tan(_S.named_value(_n_r_b11,"w"))
		var _n_x1_b19 = (_n_ox_b13 + (_n_dx_b15 * _n_len_b17))
		var _n_y1_b20 = (_n_oy_b14 + (_n_dy_b16 * _n_len_b17))
		_S.invoke(_n_p_b0,"shade",[(minf(_n_ox_b13,_n_x1_b19) - 8), (minf(_n_oy_b14,_n_y1_b20) - 8), (maxf(_n_ox_b13,_n_x1_b19) + 8), (maxf(_n_oy_b14,_n_y1_b20) + 8), _S.function_value(_S.capture(_parent,{"ox":_n_ox_b13,"oy":_n_oy_b14,"dx":_n_dx_b15,"dy":_n_dy_b16,"len":_n_len_b17,"tw":_n_tw_b18,"k":_n_k_b12,"this":_this}),"_f28")])
	if _S.truth(((_n_t < (_n_T_OPEN + 0.2)) if _S.truth((_n_t >= _n_T_OPEN)) else (_n_t >= _n_T_OPEN))):
		var _n_a_b21 = (float((_n_t - _n_T_OPEN))/0.2)
		_S.call_value(_n_flare,[_n_p_b0, 0, (-14), (22 * pow((1 - _n_a_b21),1.4)), (1 - _n_a_b21), _n_C])
	for _iter_2 in _S.array(_n_loot):
		var _n_it_b22 = _iter_2
		if _S.truth((not _S.truth(_S.named_value(_n_it_b22,"up")) if _S.truth(not _S.truth(_S.named_value(_n_it_b22,"up"))) else _S.named_value(_n_it_b22,"gone"))):
			continue
		var _n_pu_b23 = (_n_t - _S.named_value(_n_it_b22,"pop"))
		var _n_lift_b24 = ((6 * _S.invoke(_n_ease,"outCubic",[clampf((float(_n_pu_b23)/0.1),0.0,1.0)])) if _S.truth((_n_pu_b23 > 0)) else 0)
		var _n_wh_b25 = (_n_pu_b23 > 0.095)
		var _n_y_b26 = (_S.named_value(_n_it_b22,"y") - _n_lift_b24)
		var _n_ax_b27 = _S.named_value(_n_it_b22,"ax")
		var _n_spin_b28 = _S.named_value(_n_it_b22,"spin")
		var _n_flat_b29 = false
		if _S.truth((not _S.truth(_S.named_value(_n_it_b22,"gem")) if _S.truth(_S.named_value(_n_it_b22,"rest")) else _S.named_value(_n_it_b22,"rest"))):
			var _n_w_b30 = (exp(((-_S.named_value(_n_it_b22,"settle")) * 8)) * absf(cos((_S.named_value(_n_it_b22,"settle") * 22))))
			_n_ax_b27 = 0
			_n_spin_b28 = acos(clampf((0.5 + (0.5 * _n_w_b30)),0,1))
			_n_flat_b29 = (_n_w_b30 < 0.12)
			_n_y_b26 = (((-1.5) - _n_lift_b24) if _S.truth(_n_flat_b29) else (((-_S.named_value(_n_it_b22,"r")) * cos(_n_spin_b28)) - _n_lift_b24))
		if _S.truth((_S.named_value(_n_it_b22,"y") > (-10))):
			_S.call_value(_n_blobShadow,[_n_p_b0, _S.named_value(_n_it_b22,"x"), 3, (0.7 * (1 - clampf((float((-_S.named_value(_n_it_b22,"y")))/30),0.0,1.0)))])
		if _S.truth(_S.named_value(_n_it_b22,"gem")):
			_S.call_value(_n_gemlet,[_n_IL, _n_p_b0, _S.named_value(_n_it_b22,"x"), _n_y_b26, _S.named_value(_n_it_b22,"r"), ((0.4 * signf(_S.named_value(_n_it_b22,"vs"))) if _S.truth(_S.named_value(_n_it_b22,"rest")) else _S.named_value(_n_it_b22,"spin")), _S.named_value(_n_it_b22,"G"), _n_wh_b25])
		else:
			_S.call_value(_n_coin,[_n_IL, _n_p_b0, ((floori(_S.named_value(_n_it_b22,"x")+0.5) + 0.5) if _S.truth(_n_flat_b29) else _S.named_value(_n_it_b22,"x")), _n_y_b26, _S.named_value(_n_it_b22,"r"), _n_ax_b27, (acos(0.5) if _S.truth(_n_flat_b29) else _n_spin_b28), _n_C, _n_wh_b25, 1, not _S.truth(_n_flat_b29)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_it_b22,"x"), _n_y_b26, 9, (_S.index_value(_S.named_value(_n_it_b22,"G"),4) if _S.truth(_S.named_value(_n_it_b22,"gem")) else _S.index_value(_n_C,5)), (0.26 if _S.truth(_S.named_value(_n_it_b22,"rest")) else 0.18)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_it_b22,"x"), _n_y_b26, 3, _n_WHITE, 0.12])
		if _S.truth(((_n_t < _S.named_value(_n_it_b22,"pop")) if _S.truth(_S.named_value(_n_it_b22,"rest")) else _S.named_value(_n_it_b22,"rest"))):
			var _n_u_b31 = fmod(((_n_t * 0.9) + _S.named_value(_n_it_b22,"ph")),1)
			if _S.truth((_n_u_b31 < 0.16)):
				_S.call_value(_n_glint,[_n_p_b0, (_S.named_value(_n_it_b22,"x") - 1), (_n_y_b26 - 1.5), (2.6 * sin(((float(_n_u_b31)/0.16) * PI))), (_S.index_value(_S.named_value(_n_it_b22,"G"),5) if _S.truth(_S.named_value(_n_it_b22,"gem")) else _S.index_value(_n_C,6)), 0.5])
	for _iter_3 in _S.array(_n_rings):
		var _n_r_b32 = _iter_3
		var _n_k_b33 = (float((_n_t - _S.named_value(_n_r_b32,"t0")))/0.3)
		var _n_e_b34 = _S.invoke(_n_ease,"outCubic",[_n_k_b33])
		_S.invoke(_n_p_b0,"ring",[_S.named_value(_n_r_b32,"x"), _S.named_value(_n_r_b32,"y"), (2 + (5 * _n_e_b34)), 1, (_n_WHITE if _S.truth((_n_k_b33 < 0.3)) else _S.index_value(_n_C,6)), (1.15 - _n_k_b33)])
		_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_r_b32,"x"), _S.named_value(_n_r_b32,"y"), 12, _S.index_value(_n_C,5), (0.45 * (1 - _n_k_b33))])
		if _S.truth((_n_k_b33 < 0.5)):
			_S.call_value(_n_glint,[_n_p_b0, _S.named_value(_n_r_b32,"x"), _S.named_value(_n_r_b32,"y"), (3.4 * (1 - (float(_n_k_b33)/0.5))), _S.index_value(_n_C,6), 0.55])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_dust,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((absf((_n_u_b0 - 0.5)) < 0.2)) else _S.index_value(_n_C,6))
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_g = _S.read(_parent,"g")
	var _n_u_b0 = _S.arg(_args,0)
	return (((_n_g - 0.35) * 2.2) * (1 - (absf((_n_u_b0 - 0.5)) * 0.9)))
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.25)) else (_S.index_value(_n_C,6) if _S.truth((_n_u_b0 < 0.6)) else _S.index_value(_n_C,5)))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_u_b0 = _S.arg(_args,0)
	return (1.15 - _n_u_b0)
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_ox = _S.read(_parent,"ox")
	var _n_oy = _S.read(_parent,"oy")
	var _n_dx = _S.read(_parent,"dx")
	var _n_dy = _S.read(_parent,"dy")
	var _n_len = _S.read(_parent,"len")
	var _n_tw = _S.read(_parent,"tw")
	var _n_C = _S.read(_parent,"C")
	var _n_k = _S.read(_parent,"k")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_rx_b3 = (_n_x_b0 - _n_ox)
	var _n_ry_b4 = (_n_y_b1 - _n_oy)
	var _n_d_b5 = ((_n_rx_b3 * _n_dx) + (_n_ry_b4 * _n_dy))
	if _S.truth(((_n_d_b5 < 0) if _S.truth((_n_d_b5 < 0)) else (_n_d_b5 > _n_len))):
		return null
	var _n_q_b6 = absf(((_n_rx_b3 * _n_dy) - (_n_ry_b4 * _n_dx)))
	var _n_hw_b7 = (0.6 + (_n_d_b5 * _n_tw))
	var _n_f_b8 = ((1 - (0.35 * (float(_n_q_b6)/_n_hw_b7))) if _S.truth((_n_q_b6 < _n_hw_b7)) else (0.65 * (1 - (float((_n_q_b6 - _n_hw_b7))/1.6))))
	if _S.truth((_n_f_b8 <= 0)):
		return null
	_S.set_prop(_n_out_b2,"l",(_S.index_value(_n_C,6) if _S.truth((_n_q_b6 < (_n_hw_b7 * 0.45))) else _S.index_value(_n_C,5)),"=")
	_S.set_prop(_n_out_b2,"k",((((_n_k * 0.55) * _n_f_b8) * pow((1 - (float(_n_d_b5)/_n_len)),1.4)) * _S.MathFX.smooth(5,14,_n_d_b5)),"=")
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.invoke(_n_g_b0,"map",[_n_hex])
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_R_b0 = _S.arg(_args,0)
	var _n_l_b1 = _S.arg(_args,1)
	var _n_steps_b2 = _S.arg(_args,2)
	return _S.index_value(_n_R_b0,_S.index_value(_n_steps_b2,(0 if _S.truth((_n_l_b1 > 0.6)) else (1 if _S.truth((_n_l_b1 > 0.25)) else (2 if _S.truth((_n_l_b1 > (-0.1))) else (3 if _S.truth((_n_l_b1 > (-0.45))) else 4))))))
	return null
