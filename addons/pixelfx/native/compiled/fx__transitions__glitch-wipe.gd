@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/glitch-wipe.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "bands", _S.function_value(_e, "_f0"))
	_S.define(_e, "tear", _S.function_value(_e, "_f1"))
	_S.define(_e, "draw", _S.function_value(_e, "_f2"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Glitch wipe"}, {"desc": "Torn bands of black stutter across the screen, freezing and jerking back, their ragged edges split into magenta and cyan ghosts spitting data slivers; then they tear on through."}, {"tags": ["glitch", "digital", "rgb", "bands", "wipe"]}, {"duration": 1.8}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "cyber")}, {"split": "#ff2d6f"}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "TICK", _S.binary("/", 1, 18))
	_S.define(_e, "IN0", 0.03)
	_S.define(_e, "IN1", 0.78)
	_S.define(_e, "OUT0", 0.98)
	_S.define(_e, "OUT1", 1.66)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
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
		var _n_y_b2 = 0
		var _n_i_b3 = 0
		while _S.truth((_n_y_b2 < _n_H)):
			var _n_r_b4 = _S.MathFX.rand([_n_i_b3,_n_seed_b0])
			var _n_h_b5 = minf((_n_H - _n_y_b2),((5 + floori((_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 1)]) * 6))) if _S.truth((_n_r_b4 < 0.4)) else ((10 + floori((_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 1)]) * 10))) if _S.truth((_n_r_b4 < 0.85)) else (20 + floori((_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 1)]) * 12))))))
			var _n_a_b6 = clampf(((0.5 + (0.55 * _S.MathFX.noise((float(_n_y_b2)/40),(_n_seed_b0 + 9)))) + ((_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 2)]) - 0.5) * 0.25)),0.0,1.0)
			var _n_b_b7 = clampf(((0.5 + (0.55 * _S.MathFX.noise((float(_n_y_b2)/40),(_n_seed_b0 + 19)))) + ((_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 3)]) - 0.5) * 0.25)),0.0,1.0)
			var _n_span_b8 = (0.32 + (_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 6)]) * 0.12))
			_S.invoke(_n_out_b1,"push",[{"i":_n_i_b3,"y":_n_y_b2,"h":_n_h_b5,"dir":(1 if _S.truth((_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 4)]) < 0.82)) else (-1)),"off":_S.MathFX.rand([_n_i_b3,(_n_seed_b0 + 5)]),"t0":(_n_IN0 + (_n_a_b6 * ((_n_IN1 - _n_IN0) - _n_span_b8))),"t1":((_n_IN0 + (_n_a_b6 * ((_n_IN1 - _n_IN0) - _n_span_b8))) + _n_span_b8),"o0":(_n_OUT0 + (_n_b_b7 * ((_n_OUT1 - _n_OUT0) - _n_span_b8))),"o1":((_n_OUT0 + (_n_b_b7 * ((_n_OUT1 - _n_OUT0) - _n_span_b8))) + _n_span_b8)}])
			_n_y_b2 += _n_h_b5
			_n_i_b3 += 1.0
	_S.invoke(_n_cache,"set",[_n_seed_b0, _n_out_b1])
	return _n_out_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_TICK = _S.read(_parent,"TICK")
	var _n_ease = _S.read(_parent,"ease")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_t0_b2 = _S.arg(_args,2)
	var _n_t1_b3 = _S.arg(_args,3)
	var _n_salt_b4 = _S.arg(_args,4)
	if _S.truth((_n_t_b1 <= _n_t0_b2)):
		return 0
	if _S.truth((_n_t_b1 >= _n_t1_b3)):
		return 1
	var _n_n_b5 = floori((float((_n_t_b1 + (_S.named_value(_n_b_b0,"off") * _n_TICK)))/_n_TICK))
	while _S.truth(((_S.MathFX.rand([_n_n_b5,_S.named_value(_n_b_b0,"i"),_n_salt_b4]) < 0.22) if _S.truth((_n_n_b5 > 0)) else (_n_n_b5 > 0))):
		_n_n_b5 -= 1.0
	var _n_tq_b6 = ((_n_n_b5 * _n_TICK) - (_S.named_value(_n_b_b0,"off") * _n_TICK))
	var _n_u_b7 = clampf((float((_n_tq_b6 - _n_t0_b2))/(_n_t1_b3 - _n_t0_b2)),0.0,1.0)
	return clampf((_S.invoke(_n_ease,"inOutQuad",[_n_u_b7]) + (((_S.MathFX.rand([_n_n_b5,_S.named_value(_n_b_b0,"i"),(_n_salt_b4 + 1)]) - 0.6) * 0.12) * sin((PI * _n_u_b7)))),0.0,1.0)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_bands = _S.read(_parent,"bands")
	var _n_TICK = _S.read(_parent,"TICK")
	var _n_OUT0 = _S.read(_parent,"OUT0")
	var _n_tear = _S.read(_parent,"tear")
	var _n_W = _S.read(_parent,"W")
	var _n_rect = _S.read(_parent,"rect")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_IN1 = _S.read(_parent,"IN1")
	var _n_H = _S.read(_parent,"H")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ink_b4 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"color")])
	var _n_RED_b5 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"split")])
	var _n_p_b6 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _n_B_b7 = _S.call_value(_n_bands,[_S.named_value(_n_o_b2,"seed")])
	var _n_fr_b8 = floori((float(_n_t_b1)/_n_TICK))
	var _n_out_b9 = (_n_t_b1 >= _n_OUT0)
	for _iter_0 in _S.array(_n_B_b7):
		var _n_b_b10 = _iter_0
		var _n_k_b11 = (_S.call_value(_n_tear,[_n_b_b10, _n_t_b1, _S.named_value(_n_b_b10,"o0"), _S.named_value(_n_b_b10,"o1"), 7]) if _S.truth(_n_out_b9) else _S.call_value(_n_tear,[_n_b_b10, _n_t_b1, _S.named_value(_n_b_b10,"t0"), _S.named_value(_n_b_b10,"t1"), 3]))
		if _S.truth((((_n_k_b11 <= 0) if _S.truth(not _S.truth(_n_out_b9)) else not _S.truth(_n_out_b9)) if _S.truth(((_n_k_b11 <= 0) if _S.truth(not _S.truth(_n_out_b9)) else not _S.truth(_n_out_b9))) else ((_n_k_b11 >= 1) if _S.truth(_n_out_b9) else _n_out_b9))):
			continue
		var _n_moving_b12 = ((_n_k_b11 < 1) if _S.truth((_n_k_b11 > 0)) else (_n_k_b11 > 0))
		var _n_slip_b13 = (floori(((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),12]) - 0.5) * 18)+0.5) if _S.truth(((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),11]) < 0.12) if _S.truth(_n_moving_b12) else _n_moving_b12)) else 0)
		var _n_fwd_b14 = _S.named_value(_n_b_b10,"dir")
		var _n_e_b15 = (((_n_k_b11 * _n_W) if _S.truth((_S.named_value(_n_b_b10,"dir") > 0)) else (_n_W - (_n_k_b11 * _n_W))) + _n_slip_b13)
		if true:
			var _n_y_b18 = _S.named_value(_n_b_b10,"y")
			while _S.truth((_n_y_b18 < (_S.named_value(_n_b_b10,"y") + _S.named_value(_n_b_b10,"h")))):
				var _n_jag_b19 = (floori((((_S.MathFX.rand([_n_fr_b8,_n_y_b18,14]) - 0.5) * 6) + ((_S.MathFX.rand([_S.binary(">>",_n_fr_b8,1),_S.named_value(_n_b_b10,"i"),15]) - 0.5) * 6))+0.5) if _S.truth(_n_moving_b12) else 0)
				var _n_ex_b20 = clampf(floori((_n_e_b15 + _n_jag_b19)+0.5),0,_n_W)
				var _n_behind_b21 = _S.binary("!==",(_n_fwd_b14 > 0),_n_out_b9)
				if _S.truth(_n_behind_b21):
					if _S.truth((_n_ex_b20 > 0)):
						_S.call_value(_n_rect,[_n_p0_b0, 0, _n_y_b18, _n_ex_b20, 1, _n_ink_b4])
				else:
					if _S.truth((_n_ex_b20 < _n_W)):
						_S.call_value(_n_rect,[_n_p0_b0, _n_ex_b20, _n_y_b18, (_n_W - _n_ex_b20), 1, _n_ink_b4])
				if _S.truth(not _S.truth(_n_moving_b12)):
					_n_y_b18 += 1.0
					continue
				var _n_e1_b22 = ((_n_ex_b20 - 1) if _S.truth(_n_behind_b21) else _n_ex_b20)
				var _n_side_b23 = (1 if _S.truth(_n_behind_b21) else (-1))
				var _n_sp_b24 = (2 + fmod((_S.named_value(_n_b_b10,"i") + _n_fr_b8),3))
				_S.invoke(_n_p_b6,"px",[_n_e1_b22, _n_y_b18, _n_WHITE])
				_S.invoke(_n_p_b6,"px",[(_n_e1_b22 + (_n_side_b23 * _n_sp_b24)), _n_y_b18, _n_RED_b5])
				_S.invoke(_n_p_b6,"px",[(_n_e1_b22 + (_n_side_b23 * (_n_sp_b24 + 1))), _n_y_b18, _n_RED_b5])
				_S.invoke(_n_p_b6,"px",[(_n_e1_b22 - (_n_side_b23 * (_n_sp_b24 + 1))), _n_y_b18, _S.index_value(_n_C_b3,5)])
				_S.invoke(_n_p_b6,"px",[(_n_e1_b22 - (_n_side_b23 * (_n_sp_b24 + 2))), _n_y_b18, _S.index_value(_n_C_b3,4)])
				_S.invoke(_n_p_b6,"light",[_n_e1_b22, _n_y_b18, _n_WHITE, 0.45])
				_S.invoke(_n_p_b6,"light",[(_n_e1_b22 + (_n_side_b23 * (_n_sp_b24 + 1))), _n_y_b18, _n_RED_b5, 0.5])
				_S.invoke(_n_p_b6,"light",[(_n_e1_b22 + (_n_side_b23 * (_n_sp_b24 + 3))), _n_y_b18, _n_RED_b5, 0.22])
				_S.invoke(_n_p_b6,"light",[(_n_e1_b22 - (_n_side_b23 * (_n_sp_b24 + 1))), _n_y_b18, _S.index_value(_n_C_b3,5), 0.45])
				_S.invoke(_n_p_b6,"light",[(_n_e1_b22 - (_n_side_b23 * (_n_sp_b24 + 3))), _n_y_b18, _S.index_value(_n_C_b3,5), 0.22])
				_n_y_b18 += 1.0
		if _S.truth(not _S.truth(_n_moving_b12)):
			continue
		var _n_ex_b16 = clampf(floori(_n_e_b15+0.5),0,_n_W)
		var _n_open_b17 = (1 if _S.truth(_S.binary("!==",(_n_fwd_b14 > 0),_n_out_b9)) else (-1))
		_S.invoke(_n_p_b6,"glow",[_n_ex_b16, (_S.named_value(_n_b_b10,"y") + (float(_S.named_value(_n_b_b10,"h"))/2)), ((_S.named_value(_n_b_b10,"h") * 0.7) + 7), (_n_RED_b5 if _S.truth(_S.binary("&",_S.named_value(_n_b_b10,"i"),1)) else _S.index_value(_n_C_b3,5)), 0.28])
		if true:
			var _n_s_b25 = 0
			while _S.truth((_n_s_b25 < _S.named_value(_n_b_b10,"h"))):
				if _S.truth((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(100 + _n_s_b25)]) > 0.55)):
					_n_s_b25 += 1.0
					continue
				var _n_x_b26 = (_n_ex_b16 + (_n_open_b17 * floori(((pow(_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(200 + _n_s_b25)]),2) * 22) - 4)+0.5)))
				var _n_y_b27 = (_S.named_value(_n_b_b10,"y") + floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(300 + _n_s_b25)]) * _S.named_value(_n_b_b10,"h"))))
				_S.invoke(_n_p_b6,"px",[_n_x_b26, _n_y_b27, _S.index_value([_n_WHITE, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), _n_RED_b5],floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(400 + _n_s_b25)]) * 4)))])
				_n_s_b25 += 1.0
		if true:
			var _n_s_b28 = 0
			while _S.truth((_n_s_b28 < 4)):
				if _S.truth((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(20 + _n_s_b28)]) > 0.5)):
					_n_s_b28 += 1.0
					continue
				var _n_len_b29 = (2 + floori((pow(_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(30 + _n_s_b28)]),2) * 60)))
				var _n_ahead_b30 = (_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(40 + _n_s_b28)]) < 0.6)
				var _n_d_b31 = (floori((pow(_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(50 + _n_s_b28)]),1.5) * 70)) + 4)
				var _n_y_b32 = (_S.named_value(_n_b_b10,"y") + floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(60 + _n_s_b28)]) * _S.named_value(_n_b_b10,"h"))))
				var _n_x_b33 = (((_n_ex_b16 + _n_d_b31) if _S.truth((_n_open_b17 > 0)) else ((_n_ex_b16 - _n_d_b31) - _n_len_b29)) if _S.truth(_n_ahead_b30) else (((_n_ex_b16 - _n_d_b31) - _n_len_b29) if _S.truth((_n_open_b17 > 0)) else (_n_ex_b16 + _n_d_b31)))
				var _n_c_b34 = _S.index_value([_n_WHITE, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), _n_RED_b5],floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),(70 + _n_s_b28)]) * 4)))
				_S.invoke(_n_p_b6,"rect",[_n_x_b33, _n_y_b32, _n_len_b29, 1, _n_c_b34])
				if true:
					var _n_q_b35 = 0
					while _S.truth((_n_q_b35 < _n_len_b29)):
						_S.invoke(_n_p_b6,"light",[(_n_x_b33 + _n_q_b35), _n_y_b32, _n_c_b34, 0.35])
						_n_q_b35 += 3
				_n_s_b28 += 1.0
		if _S.truth(((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),80]) < 0.35) if _S.truth((_S.named_value(_n_b_b10,"h") >= 8)) else (_S.named_value(_n_b_b10,"h") >= 8))):
			var _n_bw_b36 = (6 + floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),81]) * 10)))
			var _n_bh_b37 = (3 + floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),82]) * minf(6,(_S.named_value(_n_b_b10,"h") - 3)))))
			var _n_x_b38 = ((_n_ex_b16 + (_n_open_b17 * floori(((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),83]) * 24) - 4)))) - (_n_bw_b36 if _S.truth((_n_open_b17 < 0)) else 0))
			var _n_y_b39 = (_S.named_value(_n_b_b10,"y") + floori((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),84]) * (_S.named_value(_n_b_b10,"h") - _n_bh_b37))))
			var _n_c_b40 = (_S.index_value(_n_C_b3,5) if _S.truth((_S.MathFX.rand([_n_fr_b8,_S.named_value(_n_b_b10,"i"),85]) < 0.5)) else _n_RED_b5)
			_S.invoke(_n_p_b6,"rect",[_n_x_b38, _n_y_b39, _n_bw_b36, 1, _n_c_b40])
			_S.invoke(_n_p_b6,"rect",[_n_x_b38, ((_n_y_b39 + _n_bh_b37) - 1), _n_bw_b36, 1, _n_c_b40])
			_S.invoke(_n_p_b6,"rect",[_n_x_b38, _n_y_b39, 1, _n_bh_b37, _n_c_b40])
			_S.invoke(_n_p_b6,"rect",[((_n_x_b38 + _n_bw_b36) - 1), _n_y_b39, 1, _n_bh_b37, _n_c_b40])
			if true:
				var _n_q_b41 = 0
				while _S.truth((_n_q_b41 < _n_bw_b36)):
					_S.invoke(_n_p_b6,"light",[(_n_x_b38 + _n_q_b41), _n_y_b39, _n_c_b40, 0.25])
					_n_q_b41 += 2
	if _S.truth(((_n_t_b1 < (_n_OUT0 + 0.05)) if _S.truth((_n_t_b1 > _n_IN1)) else (_n_t_b1 > _n_IN1))):
		if true:
			var _n_s_b42 = 0
			while _S.truth((_n_s_b42 < 3)):
				if _S.truth((_S.MathFX.rand([_n_fr_b8,_n_s_b42,90]) > 0.4)):
					_n_s_b42 += 1.0
					continue
				var _n_y_b43 = floori((_S.MathFX.rand([_n_fr_b8,_n_s_b42,91]) * _n_H))
				var _n_x_b44 = floori((_S.MathFX.rand([_n_fr_b8,_n_s_b42,92]) * _n_W))
				var _n_len_b45 = (3 + floori((pow(_S.MathFX.rand([_n_fr_b8,_n_s_b42,93]),2) * 40)))
				_S.invoke(_n_p_b6,"rect",[_n_x_b44, _n_y_b43, _n_len_b45, 1, (_S.index_value(_n_C_b3,4) if _S.truth(_S.binary("===",_n_s_b42,0)) else (_S.index_value(_n_C_b3,3) if _S.truth(_S.binary("===",_n_s_b42,1)) else _n_RED_b5))])
				_n_s_b42 += 1.0
	return null
