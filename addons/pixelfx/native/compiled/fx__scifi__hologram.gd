@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/hologram.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "draw", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Hologram"}, {"desc": "A floor projector throws a cone of light holding a turning wireframe model: scanlines roll through it, a data ring circles it, and it flickers, tears and jitters."}, {"tags": ["scifi", "hologram", "projector", "wireframe", "display", "glitch", "ground", "loop"]}, {"size": [112, 104]}, {"origin": [56, 92]}, {"duration": 4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#050c1e", "#0a1f48", "#123b80", "#1d64b8", "#2e98e8", "#6cd0ff", "#c8f0ff", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"split": "#ff4fd8"}, {"seed": 21}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "OY", _S.unary("-", 50))
	_S.define(_e, "RAD", 16)
	_S.define(_e, "LENS", _S.unary("-", 6))
	_S.define(_e, "VERTS", _S.concat([[[0, 1.45, 0]], [[0, _S.unary("-", 1.45), 0]], _S.array(_S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f14")]))]))
	_S.define(_e, "FACES", [])
	var _v32 = _S.scope(_e)
	_S.define(_v32, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "i"), 6)):
		_S.invoke(_S.read(_v32, "FACES"), "push", [[0, _S.binary("+", 2, _S.read(_v32, "i")), _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.read(_v32, "i"), 1), 6))], [1, _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.read(_v32, "i"), 1), 6)), _S.binary("+", 2, _S.read(_v32, "i"))]])
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "i", 1, "+=", true)
	_S.define(_e, "EDGES", [])
	var _v33 = _S.scope(_e)
	_S.define(_v33, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "i"), 6)):
		_S.invoke(_S.read(_v33, "EDGES"), "push", [[0, _S.binary("+", 2, _S.read(_v33, "i"))], [1, _S.binary("+", 2, _S.read(_v33, "i"))], [_S.binary("+", 2, _S.read(_v33, "i")), _S.binary("+", 2, _S.binary("%", _S.binary("+", _S.read(_v33, "i"), 1), 6))]])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "i", 1, "+=", true)
	_S.define(_e, "GLITCHES", [[0.92, 0.12, 1], [2.55, 0.2, 1.4], [3.42, 0.06, 0.7]])
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_D = _S.read(_parent,"D")
	var _n_GLITCHES = _S.read(_parent,"GLITCHES")
	var _n_OY = _S.read(_parent,"OY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_LENS = _S.read(_parent,"LENS")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_VERTS = _S.read(_parent,"VERTS")
	var _n_FACES = _S.read(_parent,"FACES")
	var _n_EDGES = _S.read(_parent,"EDGES")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),6)
	var _n_SPLIT_b5 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"split")])
	var _n_S_b6 = _S.named_value(_n_o_b2,"seed")
	var _n_ph_b7 = (float(_n_t_b1)/_n_D)
	var _n_frame_b8 = floori((_n_t_b1 * 30))
	var _n_gl_b9 = _S.invoke(_n_GLITCHES,"reduce",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"this":_this}),"_f1"), 0])
	var _n_flick_b10 = (1 if _S.truth(((_S.MathFX.rand([_n_S_b6,_n_frame_b8]) < 0.5) if _S.truth((_n_gl_b9 > 0)) else (_n_gl_b9 > 0))) else 0)
	var _n_cx_b11 = ((((-2) if _S.truth((_S.MathFX.rand([_n_S_b6,_n_frame_b8,2]) < 0.5)) else 2) * _n_gl_b9) if _S.truth(_n_gl_b9) else 0)
	var _n_cy_b12 = (_n_OY + (1.5 * sin(((_n_TAU * _n_ph_b7) * 2))))
	var _n_tears_b13 = []
	if _S.truth(_n_gl_b9):
		if true:
			var _n_i_b23 = 0
			while _S.truth((_n_i_b23 < 2)):
				_S.invoke(_n_tears_b13,"push",[[floori(((_n_cy_b12 - _n_RAD) + ((_S.MathFX.rand([_n_S_b6,_n_frame_b8,_n_i_b23]) * _n_RAD) * 2))), (2 + floori((_S.MathFX.rand([_n_S_b6,_n_frame_b8,_n_i_b23,1]) * 4))), floori((((_S.MathFX.rand([_n_S_b6,_n_frame_b8,_n_i_b23,2]) - 0.5) * 10) * _n_gl_b9)+0.5)]])
				_n_i_b23 += 1.0
	var _n_tearAt_b14 = _S.function_value(_S.capture(_parent,{"tears":_n_tears_b13,"this":_this}),"_f2")
	var _n_put_b15 = _S.function_value(_S.capture(_parent,{"flick":_n_flick_b10,"tearAt":_n_tearAt_b14,"p":_n_p_b0,"SPLIT":_n_SPLIT_b5,"this":_this}),"_f3")
	_S.invoke(_n_p_b0,"shade",[(-16), (-8), 16, 2, _S.function_value(_S.capture(_parent,{"H":_n_H_b4,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"ellipse",[0, (_n_LENS + 0.5), 5.5, 1.6, _S.function_value(_S.capture(_parent,{"C":_n_C_b3,"this":_this}),"_f5")])
	if true:
		var _n_i_b24 = 0
		while _S.truth((_n_i_b24 < 4)):
			var _n_k_b25 = (0.5 + (0.5 * cos((_n_TAU * ((2 * _n_ph_b7) - (float(_n_i_b24)/4))))))
			_S.invoke(_n_p_b0,"px",[((-9) + (_n_i_b24 * 6)), (-2), (_S.index_value(_n_C_b3,6) if _S.truth((_n_k_b25 > 0.7)) else _S.index_value(_n_C_b3,3))])
			_n_i_b24 += 1.0
	var _n_top_b16 = (_n_cy_b12 + (_n_RAD * 1.3))
	if true:
		var _n_y_b26 = ceili(_n_top_b16)
		while _S.truth((_n_y_b26 < _n_LENS)):
			var _n_v_b27 = (float((_n_y_b26 - _n_LENS))/(_n_top_b16 - _n_LENS))
			var _n_w_b28 = _S.numeric_lerp(4,(_n_RAD + 4),_n_v_b27)
			var _n_lineOn_b29 = (fmod((fmod((_n_y_b26 + (_n_t_b1 * 24)),5) + 5),5) < 1)
			if true:
				var _n_x_b30 = floori((-_n_w_b28))
				while _S.truth((_n_x_b30 <= ceili(_n_w_b28))):
					var _n_q_b31 = (float(absf((_n_x_b30 + 0.5)))/_n_w_b28)
					if _S.truth((_n_q_b31 > 1)):
						_n_x_b30 += 1.0
						continue
					if _S.truth((_n_q_b31 > (1 - (float(1)/_n_w_b28)))):
						_S.call_value(_n_put_b15,[_n_x_b30, _n_y_b26, (_S.index_value(_n_C_b3,5) if _S.truth((_n_v_b27 < 0.5)) else _S.index_value(_n_C_b3,4))])
					else:
						_S.invoke(_n_p_b0,"blend",[(_n_x_b30 + 0.5), (_n_y_b26 + 0.5), (_S.index_value(_n_C_b3,5) if _S.truth(_n_lineOn_b29) else _S.index_value(_n_C_b3,4)), (((0.05 + (0.12 * (1 - _n_v_b27))) * (1 - ((0.6 * _n_q_b31) * _n_q_b31))) + (0.06 if _S.truth(_n_lineOn_b29) else 0))])
					_n_x_b30 += 1.0
			_n_y_b26 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, _n_LENS, 12, _S.index_value(_n_C_b3,5), 0.6])
	if true:
		var _n_i_b32 = 0
		while _S.truth((_n_i_b32 < 56)):
			var _n_a_b33 = (((float(_n_i_b32)/56) * _n_TAU) - (_n_ph_b7 * _n_TAU))
			var _n_x_b34 = (cos(_n_a_b33) * (_n_RAD + 4))
			var _n_y_b35 = (_n_top_b16 + (sin(_n_a_b33) * 3))
			if _S.truth((fmod(_n_i_b32,7) < 5)):
				_S.call_value(_n_put_b15,[_n_x_b34, _n_y_b35, (_S.index_value(_n_C_b3,6) if _S.truth((sin(_n_a_b33) > 0)) else _S.index_value(_n_C_b3,4)), (1 if _S.truth((sin(_n_a_b33) > 0)) else 0.7)])
			_n_i_b32 += 1.0
	_S.invoke(_n_p_b0,"glowLine",[((-_n_RAD) - 4), _n_top_b16, (_n_RAD + 4), _n_top_b16, 4, _S.index_value(_n_C_b3,4), 0.2])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 18, (_n_S_b6 + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f6"), _S.function_value(_S.capture(_parent,{"top":_n_top_b16,"put":_n_put_b15,"C":_n_C_b3,"this":_this}),"_f7")])
	var _n_spin_b17 = (_n_TAU * _n_ph_b7)
	var _n_tilt_b18 = 0.32
	var _n_P3_b19 = _S.invoke(_n_VERTS,"map",[_S.function_value(_S.capture(_parent,{"spin":_n_spin_b17,"tilt":_n_tilt_b18,"cx":_n_cx_b11,"cy":_n_cy_b12,"this":_this}),"_f8")])
	var _n_scanY_b20 = _S.numeric_lerp((_n_cy_b12 + (_n_RAD * 1.5)),(_n_cy_b12 - (_n_RAD * 1.5)),(float(fmod((_n_ph_b7 * 2),1))/0.8))
	for _iter_0 in _S.array(_n_FACES):
		var _n_f_b36 = _iter_0
		var _tuple_1 = _S.invoke(_n_f_b36,"map",[_S.function_value(_S.capture(_parent,{"P3":_n_P3_b19,"this":_this}),"_f9")])
		var _n_a_b37 = _S.prop(_tuple_1,0)
		var _n_b_b38 = _S.prop(_tuple_1,1)
		var _n_c_b39 = _S.prop(_tuple_1,2)
		var _n_nz_b40 = (((_S.index_value(_n_b_b38,0) - _S.index_value(_n_a_b37,0)) * (_S.index_value(_n_c_b39,1) - _S.index_value(_n_a_b37,1))) - ((_S.index_value(_n_b_b38,1) - _S.index_value(_n_a_b37,1)) * (_S.index_value(_n_c_b39,0) - _S.index_value(_n_a_b37,0))))
		if _S.truth((_n_nz_b40 >= 0)):
			continue
		var _n_shade_b41 = clampf((0.3 + (0.7 * ((float(((_S.index_value(_n_a_b37,2) + _S.index_value(_n_b_b38,2)) + _S.index_value(_n_c_b39,2)))/3) + 0.5))),0.0,1.0)
		_S.invoke(_n_p_b0,"poly",[[_n_a_b37, _n_b_b38, _n_c_b39], _S.function_value(_S.capture(_parent,{"scanY":_n_scanY_b20,"C":_n_C_b3,"shade":_n_shade_b41,"this":_this}),"_f10"), _S.function_value(_S.capture(_parent,{"flick":_n_flick_b10,"scanY":_n_scanY_b20,"this":_this}),"_f11")])
	var _n_edges_b21 = _S.invoke(_S.invoke(_n_EDGES,"map",[_S.function_value(_S.capture(_parent,{"P3":_n_P3_b19,"this":_this}),"_f12")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f13")])
	for _iter_2 in _S.array(_n_edges_b21):
		var _tuple_3 = _iter_2
		var _n_a_b42 = _S.prop(_tuple_3,0)
		var _n_b_b43 = _S.prop(_tuple_3,1)
		var _n_z_b44 = _S.prop(_tuple_3,2)
		var _n_L_b45 = _S.Bridge.hypot([(_S.index_value(_n_b_b43,0) - _S.index_value(_n_a_b42,0)), (_S.index_value(_n_b_b43,1) - _S.index_value(_n_a_b42,1))])
		if true:
			var _n_d_b46 = 0
			while _S.truth((_n_d_b46 <= _n_L_b45)):
				var _n_x_b47 = _S.numeric_lerp(_S.index_value(_n_a_b42,0),_S.index_value(_n_b_b43,0),(float(_n_d_b46)/_n_L_b45))
				var _n_y_b48 = _S.numeric_lerp(_S.index_value(_n_a_b42,1),_S.index_value(_n_b_b43,1),(float(_n_d_b46)/_n_L_b45))
				var _n_hot_b49 = (absf((_n_y_b48 - _n_scanY_b20)) < 1.5)
				if _S.truth((_n_z_b44 < (-0.15))):
					_S.call_value(_n_put_b15,[_n_x_b47, _n_y_b48, (_S.index_value(_n_C_b3,5) if _S.truth(_n_hot_b49) else _S.index_value(_n_C_b3,3)), 0.7])
				else:
					_S.call_value(_n_put_b15,[_n_x_b47, _n_y_b48, (_n_WHITE if _S.truth(_n_hot_b49) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_z_b44 > 0.4)) else _S.index_value(_n_C_b3,5)))])
				_n_d_b46 += 0.5
	for _iter_4 in _S.array(_n_P3_b19):
		var _tuple_5 = _iter_4
		var _n_x_b50 = _S.prop(_tuple_5,0)
		var _n_y_b51 = _S.prop(_tuple_5,1)
		var _n_z_b52 = _S.prop(_tuple_5,2)
		if _S.truth((_n_z_b52 < (-0.15))):
			continue
		_S.call_value(_n_put_b15,[_n_x_b50, _n_y_b51, _n_WHITE])
		_S.invoke(_n_p_b0,"glow",[_n_x_b50, _n_y_b51, 4, _S.index_value(_n_C_b3,5), 0.3])
	if true:
		var _n_i_b53 = 0
		while _S.truth((_n_i_b53 < 64)):
			var _n_a_b54 = (((float(_n_i_b53)/64) * _n_TAU) + ((_n_ph_b7 * _n_TAU) * 2))
			var _n_x_b55 = (_n_cx_b11 + (cos(_n_a_b54) * (_n_RAD + 9)))
			var _n_y_b56 = ((_n_cy_b12 + 3) + (sin(_n_a_b54) * 4))
			if _S.truth(_S.binary("===",fmod(floori((float(_n_i_b53)/3)),3),2)):
				_n_i_b53 += 1.0
				continue
			_S.call_value(_n_put_b15,[_n_x_b55, _n_y_b56, ((_n_WHITE if _S.truth(_S.binary("===",fmod(_n_i_b53,9),0)) else _S.index_value(_n_C_b3,5)) if _S.truth((sin(_n_a_b54) > 0)) else _S.index_value(_n_C_b3,3)), (1 if _S.truth((sin(_n_a_b54) > 0)) else 0.6)])
			_n_i_b53 += 1.0
	var _n_lk_b22 = (0.5 if _S.truth(_n_flick_b10) else 1)
	_S.invoke(_n_p_b0,"glow",[_n_cx_b11, _n_cy_b12, (_n_RAD * 2.2), _S.index_value(_n_C_b3,4), (0.36 * _n_lk_b22)])
	_S.invoke(_n_p_b0,"glow",[_n_cx_b11, (_n_cy_b12 - (_n_RAD * 0.6)), _n_RAD, _S.index_value(_n_C_b3,5), (0.15 * _n_lk_b22)])
	if _S.truth((absf((_n_scanY_b20 - _n_cy_b12)) < (_n_RAD * 1.4))):
		_S.invoke(_n_p_b0,"glowLine",[(_n_cx_b11 - _n_RAD), _n_scanY_b20, (_n_cx_b11 + _n_RAD), _n_scanY_b20, 5, _S.index_value(_n_C_b3,5), (0.3 * _n_lk_b22)])
	_S.invoke(_n_p_b0,"glow",[0, (-2), 22, _S.index_value(_n_C_b3,4), 0.2])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_m_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.arg(_args,1)
	var _n_g0_b1 = _S.prop(_tuple_0,0)
	var _n_len_b2 = _S.prop(_tuple_0,1)
	var _n_k_b3 = _S.prop(_tuple_0,2)
	return (maxf(_n_m_b0,_n_k_b3) if _S.truth(((_n_t < (_n_g0_b1 + _n_len_b2)) if _S.truth((_n_t >= _n_g0_b1)) else (_n_t >= _n_g0_b1))) else _n_m_b0)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_tears = _S.read(_parent,"tears")
	var _n_y_b0 = _S.arg(_args,0)
	for _iter_0 in _S.array(_n_tears):
		var _tuple_1 = _iter_0
		var _n_y0_b1 = _S.prop(_tuple_1,0)
		var _n_h_b2 = _S.prop(_tuple_1,1)
		var _n_dx_b3 = _S.prop(_tuple_1,2)
		if _S.truth(((_n_y_b0 < (_n_y0_b1 + _n_h_b2)) if _S.truth((_n_y_b0 >= _n_y0_b1)) else (_n_y_b0 >= _n_y0_b1))):
			return _n_dx_b3
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_flick = _S.read(_parent,"flick")
	var _n_tearAt = _S.read(_parent,"tearAt")
	var _n_p = _S.read(_parent,"p")
	var _n_SPLIT = _S.read(_parent,"SPLIT")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_yy_b4 = floori(_n_y_b1)
	if _S.truth((_S.binary("&",_n_yy_b4,1) if _S.truth(_n_flick) else _n_flick)):
		return null
	var _n_dx_b5 = _S.call_value(_n_tearAt,[_n_yy_b4])
	if _S.truth(_n_dx_b5):
		_S.invoke(_n_p,"dot",[(_n_x_b0 + _n_dx_b5), _n_y_b1, _n_SPLIT, (_n_a_b3 * 0.8)])
		_S.invoke(_n_p,"dot",[((_n_x_b0 + _n_dx_b5) + signf(_n_dx_b5)), _n_y_b1, _n_c_b2, _n_a_b3])
		return null
	_S.invoke(_n_p,"dot",[_n_x_b0, _n_y_b1, _n_c_b2, _n_a_b3])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_top_b3 = ((pow((float(_n_x_b0)/15),2) + pow((float((_n_y_b1 + 5))/3),2)) <= 1)
	var _n_side_b4 = _S.logical("&&",_S.logical("&&",(absf(_n_x_b0) <= 15),func():return (_n_y_b1 > (-5))),func():return (_n_y_b1 <= 0))
	if _S.truth((not _S.truth(_n_side_b4) if _S.truth(not _S.truth(_n_top_b3)) else not _S.truth(_n_top_b3))):
		return null
	if _S.truth(_n_top_b3):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth(((pow((float(_n_x_b0)/15),2) + pow((float((_n_y_b1 + 5))/3),2)) > 0.8)) else (_S.index_value(_n_H,5) if _S.truth((_n_y_b1 < (-6))) else _S.index_value(_n_H,3))),"=")
	else:
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth(_S.logical("||",(absf(_n_x_b0) > 14),func():return _S.binary("===",_n_y_b1,0))) else (_S.index_value(_n_H,4) if _S.truth(_S.binary("===",_n_y_b1,(-4))) else (_S.index_value(_n_H,3) if _S.truth((_n_x_b0 < (-6))) else (_S.index_value(_n_H,1) if _S.truth((_n_x_b0 > 6)) else _S.index_value(_n_H,2))))),"=")
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_d_b0 < 0.4)) else (_S.index_value(_n_C,6) if _S.truth((_n_d_b0 < 0.8)) else _S.index_value(_n_C,4)))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.8, 1.4])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_LENS = _S.read(_parent,"LENS")
	var _n_top = _S.read(_parent,"top")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_put = _S.read(_parent,"put")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_life_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_k_b3 = (float(_n_age_b0)/_n_life_b1)
	var _n_y_b4 = _S.numeric_lerp((_n_LENS - 2),_n_top,_n_k_b3)
	var _n_w_b5 = _S.numeric_lerp(4,(_n_RAD + 2),_n_k_b3)
	_S.call_value(_n_put,[(_S.invoke(_n_r_b2,"range",[(-0.8), 0.8]) * _n_w_b5), _n_y_b4, (_n_WHITE if _S.truth(_S.invoke(_n_r_b2,"chance",[0.3])) else _S.index_value(_n_C,5)), minf(1,((1 - _n_k_b3) * 2))])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_spin = _S.read(_parent,"spin")
	var _n_tilt = _S.read(_parent,"tilt")
	var _n_cx = _S.read(_parent,"cx")
	var _n_RAD = _S.read(_parent,"RAD")
	var _n_cy = _S.read(_parent,"cy")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	var _n_z_b2 = _S.prop(_tuple_0,2)
	var _n_x1_b3 = ((_n_x_b0 * cos(_n_spin)) + (_n_z_b2 * sin(_n_spin)))
	var _n_z1_b4 = (((-_n_x_b0) * sin(_n_spin)) + (_n_z_b2 * cos(_n_spin)))
	var _n_y2_b5 = ((_n_y_b1 * cos(_n_tilt)) - (_n_z1_b4 * sin(_n_tilt)))
	var _n_z2_b6 = ((_n_y_b1 * sin(_n_tilt)) + (_n_z1_b4 * cos(_n_tilt)))
	return [(_n_cx + (_n_x1_b3 * _n_RAD)), (_n_cy - (_n_y2_b5 * _n_RAD)), _n_z2_b6]
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_P3 = _S.read(_parent,"P3")
	var _n_i_b0 = _S.arg(_args,0)
	return _S.index_value(_n_P3,_n_i_b0)
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_scanY = _S.read(_parent,"scanY")
	var _n_shade = _S.read(_parent,"shade")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_C,6) if _S.truth((absf((_n_y_b1 - _n_scanY)) < 2)) else (_S.index_value(_n_C,4) if _S.truth((_n_shade > 0.6)) else _S.index_value(_n_C,3)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_flick = _S.read(_parent,"flick")
	var _n_scanY = _S.read(_parent,"scanY")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_yy_b2 = floori(_n_y_b1)
	return (1 if _S.truth(((not _S.truth((_S.binary("&",_n_yy_b2,1) if _S.truth(_n_flick) else _n_flick)) if _S.truth(_S.binary("===",fmod(_n_yy_b2,3),0)) else _S.binary("===",fmod(_n_yy_b2,3),0)) if _S.truth((not _S.truth((_S.binary("&",_n_yy_b2,1) if _S.truth(_n_flick) else _n_flick)) if _S.truth(_S.binary("===",fmod(_n_yy_b2,3),0)) else _S.binary("===",fmod(_n_yy_b2,3),0))) else (absf((_n_y_b1 - _n_scanY)) < 1.5))) else 0)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_P3 = _S.read(_parent,"P3")
	var _tuple_0 = _S.arg(_args,0)
	var _n_i_b0 = _S.prop(_tuple_0,0)
	var _n_j_b1 = _S.prop(_tuple_0,1)
	return [_S.index_value(_n_P3,_n_i_b0), _S.index_value(_n_P3,_n_j_b1), (float((_S.index_value(_S.index_value(_n_P3,_n_i_b0),2) + _S.index_value(_S.index_value(_n_P3,_n_j_b1),2)))/2)]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_a_b0,2) - _S.index_value(_n_b_b1,2))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return [(cos(((float(_n_i_b1)/6) * _n_TAU)) * 0.9), 0.12, (sin(((float(_n_i_b1)/6) * _n_TAU)) * 0.9)]
	return null
