@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/water/drip.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "WATER", _S.import_value("fx/water/_lib.js", "WATER"))
	_S.define(_e, "bead", _S.import_value("fx/water/_lib.js", "bead"))
	_S.define(_e, "ring", _S.import_value("fx/water/_lib.js", "ring"))
	_S.define(_e, "rock", _S.import_value("fx/water/_lib.js", "rock"))
	_S.define(_e, "dripstone", _S.function_value(_e, "_f0"))
	_S.define(_e, "puddle", _S.function_value(_e, "_f2"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Drip"}, {"desc": "A bead swells under a wet stone tip and catches the light, pinches off, falls stretched by its speed and plinks into a puddle with a crown, a ring and a tiny rebound."}, {"tags": ["water", "drip", "drop", "puddle", "cave", "ambient", "loop"]}, {"size": [72, 88]}, {"origin": [36, 78]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "WATER")}, {"height": 62}, {"source": true}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "SY", 0.28)
	_S.define(_e, "G", 760)
	_S.define(_e, "LET", 0.78)
	_S.define(_e, "PRX", 20)
	_S.define(_e, "C_WET", _S.invoke(["#5d6a86", "#9fb6d6"], "map", [_S.function_value(_e, "_f6")]))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_S.define(_e, "landAt", _S.function_value(_e, "_f7"))
	_S.define(_e, "REBOUND", 0.06)
	_S.define(_e, "BACK", 0.2)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_rock = _S.read(_parent,"rock")
	var _n_C_WET = _S.read(_parent,"C_WET")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_H_b1 = _S.arg(_args,1)
	var _n_ST_b2 = _S.call_value(_n_rock,[])
	var _n_top_b3 = ((-_n_H_b1) - 14)
	_S.invoke(_n_p_b0,"shade",[(-24), _n_top_b3, 22, ((-_n_H_b1) + 0.5), _S.function_value(_S.capture(_parent,{"top":_n_top_b3,"H":_n_H_b1,"ST":_n_ST_b2,"this":_this}),"_f1")])
	if true:
		var _n_y_b4 = ((-_n_H_b1) - 7)
		while _S.truth((_n_y_b4 < (-_n_H_b1))):
			_S.invoke(_n_p_b0,"px",[(-1), _n_y_b4, (_S.index_value(_n_C_WET,1) if _S.truth((_n_y_b4 > ((-_n_H_b1) - 3))) else _S.index_value(_n_C_WET,0))])
			_n_y_b4 += 1.0
	_S.invoke(_n_p_b0,"px",[(-1), ((-_n_H_b1) - 2), _n_WHITE])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_top = _S.read(_parent,"top")
	var _n_H = _S.read(_parent,"H")
	var _n_ST = _S.read(_parent,"ST")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_under_b3 = ((((_n_top + 7) + (sin((_n_x_b0 * 0.45)) * 1.2)) + (sin(((_n_x_b0 * 1.3) + 1)) * 0.6)) - (absf((_n_x_b0 + 4)) * 0.12))
	var _n_cone_b4 = ((-_n_H) - (absf(_n_x_b0) * 1.25))
	var _n_bottom_b5 = maxf(_n_under_b3,minf(_n_cone_b4,(-_n_H)))
	var _n_span_b6 = (24 if _S.truth((_n_x_b0 < 0)) else 22)
	if _S.truth(((_n_y_b1 > _n_bottom_b5) if _S.truth((_n_y_b1 > _n_bottom_b5)) else (absf(_n_x_b0) > (_n_span_b6 - (maxf(0,((_n_top + 3) - _n_y_b1)) * 4))))):
		return null
	var _n_rim_b7 = ((_n_y_b1 > (_n_bottom_b5 - 1)) if _S.truth((_n_y_b1 > (_n_bottom_b5 - 1))) else (absf(_n_x_b0) > (_n_span_b6 - 1)))
	var _n_lx_b8 = (float((_n_x_b0 + 24))/46)
	var _n_v_b9 = (float((_n_y_b1 - _n_top))/14)
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_ST,0) if _S.truth(_n_rim_b7) else (_S.index_value(_n_ST,1) if _S.truth((_n_v_b9 < 0.25)) else ((_S.index_value(_n_ST,4) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_ST,2)) if _S.truth(((absf(_n_x_b0) < 6) if _S.truth((_n_y_b1 > _n_under_b3)) else (_n_y_b1 > _n_under_b3))) else (_S.index_value(_n_ST,4) if _S.truth((_n_lx_b8 < 0.3)) else (_S.index_value(_n_ST,3) if _S.truth((_n_lx_b8 < 0.62)) else _S.index_value(_n_ST,2)))))),"=")
	if _S.truth(_S.logical("&&",_S.logical("&&",((absf(((_n_x_b0 - 9) - ((_n_y_b1 - _n_top) * 0.4))) < 0.5) if _S.truth(not _S.truth(_n_rim_b7)) else not _S.truth(_n_rim_b7)),func():return (_n_v_b9 > 0.3)),func():return (_n_v_b9 < 0.7))):
		_S.set_prop(_n_out_b2,"c",_S.index_value(_n_ST,0),"=")
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_PRX = _S.read(_parent,"PRX")
	var _n_SY = _S.read(_parent,"SY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_ry_b2 = (_n_PRX * _n_SY)
	if true:
		var _n_Y_b3 = floori((-_n_ry_b2))
		while _S.truth((_n_Y_b3 < _n_ry_b2)):
			if true:
				var _n_X_b4 = (-_n_PRX)
				while _S.truth((_n_X_b4 < _n_PRX)):
					var _n_x_b5 = (_n_X_b4 + 0.5)
					var _n_y_b6 = (_n_Y_b3 + 0.5)
					var _n_d_b7 = (pow((float(_n_x_b5)/_n_PRX),2) + pow((float(_n_y_b6)/_n_ry_b2),2))
					if _S.truth((_n_d_b7 > 1)):
						_n_X_b4 += 1.0
						continue
					_S.invoke(_n_p_b0,"blend",[_n_x_b5, _n_y_b6, _S.index_value(_n_C_b1,1), (0.72 * minf(1,((1 - _n_d_b7) * 5)))])
					_n_X_b4 += 1.0
			_n_Y_b3 += 1.0
	if true:
		var _n_X_b8 = ((-_n_PRX) + 3)
		while _S.truth((_n_X_b8 < (_n_PRX - 3))):
			var _n_x_b9 = (_n_X_b8 + 0.5)
			var _n_y_b10 = ((-sqrt((1 - pow((float(_n_x_b9)/_n_PRX),2)))) * _n_ry_b2)
			_S.invoke(_n_p_b0,"dot",[_n_x_b9, (_n_y_b10 + 0.5), (_S.index_value(_n_C_b1,4) if _S.truth((absf(_n_x_b9) < (_n_PRX * 0.5))) else _S.index_value(_n_C_b1,3)), 0.95])
			_n_X_b8 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_puddle = _S.read(_parent,"puddle")
	var _n_landAt = _S.read(_parent,"landAt")
	var _n_ease = _S.read(_parent,"ease")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_REBOUND = _S.read(_parent,"REBOUND")
	var _n_BACK = _S.read(_parent,"BACK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	_S.call_value(_n_puddle,[_n_p_b0, _n_C_b3])
	var _n_u_b4 = (_n_t_b1 - _S.call_value(_n_landAt,[_S.named_value(_n_o_b2,"height")]))
	if _S.truth((_n_u_b4 >= 0)):
		_S.call_value(_n_ring,[_n_p_b0, 0, 0, (2 + (17 * _S.invoke(_n_ease,"outCubic",[(float(_n_u_b4)/0.75)]))), _n_SY, (1.1 * (1 - (float(_n_u_b4)/0.75))), _n_C_b3, {"n":2,"gap":2.5,"half":(-1),"seed":1,"wob":0.4}])
	var _n_v_b5 = (((_n_t_b1 - _S.call_value(_n_landAt,[_S.named_value(_n_o_b2,"height")])) - _n_REBOUND) - _n_BACK)
	if _S.truth((_n_v_b5 >= 0)):
		_S.call_value(_n_ring,[_n_p_b0, 0, 0, (1.5 + (9 * _S.invoke(_n_ease,"outCubic",[(float(_n_v_b5)/0.5)]))), _n_SY, (0.9 * (1 - (float(_n_v_b5)/0.5))), _n_C_b3, {"n":1,"half":(-1),"seed":2}])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_landAt = _S.read(_parent,"landAt")
	var _n_dripstone = _S.read(_parent,"dripstone")
	var _n_LET = _S.read(_parent,"LET")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_bead = _S.read(_parent,"bead")
	var _n_SY = _S.read(_parent,"SY")
	var _n_ring = _S.read(_parent,"ring")
	var _n_REBOUND = _S.read(_parent,"REBOUND")
	var _n_BACK = _S.read(_parent,"BACK")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.named_value(_n_o_b2,"height")
	var _n_land_b5 = _S.call_value(_n_landAt,[_n_H_b4])
	if _S.truth(_S.named_value(_n_o_b2,"source")):
		_S.call_value(_n_dripstone,[_n_p_b0, _n_H_b4])
	if _S.truth((_n_t_b1 < _n_LET)):
		var _n_k_b9 = (float(_n_t_b1)/_n_LET)
		var _n_r_b10 = (0.7 + (2.3 * _S.invoke(_n_ease,"inQuad",[_n_k_b9])))
		var _n_wob_b11 = ((0.15 * sin((_n_t_b1 * 26))) * _n_k_b9)
		var _n_neck_b12 = (_S.MathFX.smooth(0.82,1,_n_k_b9) * 2.5)
		var _n_cy_b13 = (((-_n_H_b4) + _n_r_b10) + _n_neck_b12)
		if _S.truth((_n_neck_b12 > 0.2)):
			_S.invoke(_n_p_b0,"line",[0, (-_n_H_b4), 0, (_n_cy_b13 - _n_r_b10), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b0,"ellipse",[0, _n_cy_b13, (_n_r_b10 * (1 - _n_wob_b11)), ((_n_r_b10 * (1 + _n_wob_b11)) + (0.3 * _n_k_b9)), _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f5")])
		if _S.truth((_n_r_b10 > 1)):
			_S.invoke(_n_p_b0,"px",[((-_n_r_b10) * 0.4), (_n_cy_b13 - (_n_r_b10 * 0.45)), _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[0, _n_cy_b13, (4 + (_n_r_b10 * 2)), _S.index_value(_n_C_b3,5), (0.14 + (0.14 * _n_k_b9))])
	else:
		var _n_s_b14 = (float((_n_t_b1 - _n_LET))/0.15)
		if _S.truth((_n_s_b14 < 1)):
			_S.invoke(_n_p_b0,"ellipse",[0, ((-_n_H_b4) + 0.8), (1.2 * (1 - (_n_s_b14 * 0.6))), (1 + (sin((_n_s_b14 * PI)) * 0.8)), _S.index_value(_n_C_b3,4)])
	var _n_f_b6 = (_n_t_b1 - _n_LET)
	if _S.truth(((_n_t_b1 < _n_land_b5) if _S.truth((_n_f_b6 > 0)) else (_n_f_b6 > 0))):
		var _n_y_b15 = (((-_n_H_b4) + 3) + (((0.5 * _n_G) * _n_f_b6) * _n_f_b6))
		var _n_vy_b16 = (_n_G * _n_f_b6)
		_S.call_value(_n_bead,[_n_p_b0, 0, _n_y_b15, 0, _n_vy_b16, 3, _n_C_b3])
		_S.invoke(_n_p_b0,"glow",[0, _n_y_b15, 6, _S.index_value(_n_C_b3,5), 0.2])
	var _n_u_b7 = (_n_t_b1 - _n_land_b5)
	if _S.truth((_n_u_b7 >= 0)):
		_S.call_value(_n_ring,[_n_p_b0, 0, 0, (2 + (17 * _S.invoke(_n_ease,"outCubic",[(float(_n_u_b7)/0.75)]))), _n_SY, (1.1 * (1 - (float(_n_u_b7)/0.75))), _n_C_b3, {"n":2,"gap":2.5,"half":1,"hot":(_n_u_b7 < 0.08),"seed":1,"wob":0.4,"glint":((1 - (_n_u_b7 * 2)) if _S.truth((_n_u_b7 < 0.5)) else 0)}])
		if _S.truth((_n_u_b7 < 0.06)):
			_S.invoke(_n_p_b0,"px",[0, 0, _n_WHITE])
			_S.invoke(_n_p_b0,"px",[(-1), 0, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"px",[1, 0, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"glow",[0, (-1), 10, _S.index_value(_n_C_b3,5), (0.5 * (1 - (float(_n_u_b7)/0.06)))])
		for _iter_0 in _S.array([[(-26), 70], [24, 64], [(-6), 90]]):
			var _tuple_1 = _iter_0
			var _n_vx_b20 = _S.prop(_tuple_1,0)
			var _n_vh_b21 = _S.prop(_tuple_1,1)
			var _n_h_b22 = ((_n_vh_b21 * _n_u_b7) - (((0.5 * _n_G) * _n_u_b7) * _n_u_b7))
			if _S.truth(((_n_u_b7 < 0.3) if _S.truth((_n_h_b22 > 0)) else (_n_h_b22 > 0))):
				_S.invoke(_n_p_b0,"px",[(_n_vx_b20 * _n_u_b7), (-_n_h_b22), (_n_WHITE if _S.truth((_n_u_b7 < 0.1)) else _S.index_value(_n_C_b3,6))])
		var _n_r_b17 = (_n_u_b7 - _n_REBOUND)
		var _n_h_b18 = ((52 * _n_r_b17) - (((((0.5 * _n_G) * 0.5) * _n_r_b17) * _n_r_b17) * 2))
		if _S.truth(((_n_h_b18 > 0) if _S.truth((_n_r_b17 > 0)) else (_n_r_b17 > 0))):
			_S.invoke(_n_p_b0,"line",[0, (-1), 0, ((-_n_h_b18) + 1), _S.index_value(_n_C_b3,5)])
			_S.invoke(_n_p_b0,"circle",[0, (-_n_h_b18), 1.1, _S.index_value(_n_C_b3,6)])
			_S.invoke(_n_p_b0,"px",[0, ((-_n_h_b18) - 1), _n_WHITE])
		var _n_v_b19 = ((_n_u_b7 - _n_REBOUND) - _n_BACK)
		if _S.truth((_n_v_b19 >= 0)):
			_S.call_value(_n_ring,[_n_p_b0, 0, 0, (1.5 + (9 * _S.invoke(_n_ease,"outCubic",[(float(_n_v_b19)/0.5)]))), _n_SY, (0.9 * (1 - (float(_n_v_b19)/0.5))), _n_C_b3, {"n":1,"half":1,"seed":2,"hot":(_n_v_b19 < 0.06)}])
		_S.invoke(_n_p_b0,"glow",[0, 0, 18, _S.index_value(_n_C_b3,4), (0.22 * (1 - clampf((float(_n_u_b7)/0.6),0.0,1.0)))])
	var _n_sh_b8 = (0 if _S.truth((sin((_n_t_b1 * 20)) > 0)) else 1)
	_S.invoke(_n_p_b0,"px",[((-1) + _n_sh_b8), 2, _S.index_value(_n_C_b3,4)])
	if _S.truth(((_n_t_b1 < _n_land_b5) if _S.truth((_n_f_b6 > 0)) else (_n_f_b6 > 0))):
		var _n_ry_b23 = (2 + ((((0.5 * _n_G) * _n_f_b6) * _n_f_b6) * 0.04))
		_S.invoke(_n_p_b0,"px",[_n_sh_b8, minf(4,_n_ry_b23), _S.index_value(_n_C_b3,5)])
	_S.invoke(_n_p_b0,"glow",[0, ((-_n_H_b4) + 2), 8, _S.index_value(_n_C_b3,5), 0.16])
	_S.invoke(_n_p_b0,"glow",[0, 0, 26, _S.index_value(_n_C_b3,3), 0.14])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_C,5) if _S.truth(_S.logical("&&",(cos(_n_a_b1) < 0),func():return (sin(_n_a_b1) < 0.3))) else _S.index_value(_n_C,3)) if _S.truth((_n_d_b0 > 0.72)) else (_S.index_value(_n_C,6) if _S.truth(((cos(_n_a_b1) > 0) if _S.truth((_n_d_b0 < 0.35)) else (_n_d_b0 < 0.35))) else _S.index_value(_n_C,4)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_parseInt = _S.read(_parent,"parseInt")
	var _n_h_b0 = _S.arg(_args,0)
	return _S.binary("|",_S.binary("|",_S.binary("|",_S.call_value(_n_parseInt,[_S.invoke(_n_h_b0,"slice",[1, 3]), 16]),_S.binary("<<",_S.call_value(_n_parseInt,[_S.invoke(_n_h_b0,"slice",[3, 5]), 16]),8)),_S.binary("<<",_S.call_value(_n_parseInt,[_S.invoke(_n_h_b0,"slice",[5, 7]), 16]),16)),4278190080)
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_LET = _S.read(_parent,"LET")
	var _n_G = _S.read(_parent,"G")
	var _n_H_b0 = _S.arg(_args,0)
	return (_n_LET + sqrt((float((2 * _n_H_b0))/_n_G)))
	return null
