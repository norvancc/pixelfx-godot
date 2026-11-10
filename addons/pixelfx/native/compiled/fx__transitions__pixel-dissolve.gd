@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/pixel-dissolve.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "fbm", _S.import_value("core/index.js", "fbm"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "layout", _S.function_value(_e, "_f0"))
	_S.define(_e, "mote", _S.function_value(_e, "_f9"))
	_S.define(_e, "square", _S.function_value(_e, "_f10"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Pixel dissolve"}, {"desc": "Clumps of blocks wink in, each drawn in a white outline that fills black and cools, with glints; then they wink out, outlines collapsing, the last small ones sparkling away."}, {"tags": ["dissolve", "pixel", "blocks", "glint"]}, {"duration": 2.2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "neon")}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "P", 0.17)
	_S.define(_e, "IN0", 0.04)
	_S.define(_e, "IN1", 0.8)
	_S.define(_e, "OUT0", 1.12)
	_S.define(_e, "OUT1", 1.85)
	_S.define(_e, "CELL", 20)
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_CELL = _S.read(_parent,"CELL")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_seed_b0 = _S.arg(_args,0)
	if _S.truth(_S.invoke(_n_cache,"has",[_n_seed_b0])):
		return _S.invoke(_n_cache,"get",[_n_seed_b0])
	var _n_blocks_b1 = []
	if true:
		var _n_cy_b6 = 0
		while _S.truth((_n_cy_b6 < (float(_n_H)/_n_CELL))):
			if true:
				var _n_cx_b7 = 0
				while _S.truth((_n_cx_b7 < (float(_n_W)/_n_CELL))):
					var _n_h_b8 = _S.MathFX.rand([_n_cx_b7,_n_cy_b6,_n_seed_b0])
					var _n_n_b9 = (1 if _S.truth((_n_h_b8 < 0.32)) else (2 if _S.truth((_n_h_b8 < 0.74)) else 4))
					var _n_s_b10 = (float(_n_CELL)/_n_n_b9)
					if true:
						var _n_j_b11 = 0
						while _S.truth((_n_j_b11 < _n_n_b9)):
							if true:
								var _n_i_b12 = 0
								while _S.truth((_n_i_b12 < _n_n_b9)):
									_S.invoke(_n_blocks_b1,"push",[{"x":((_n_cx_b7 * _n_CELL) + (_n_i_b12 * _n_s_b10)),"y":((_n_cy_b6 * _n_CELL) + (_n_j_b11 * _n_s_b10)),"s":_n_s_b10}])
									_n_i_b12 += 1.0
							_n_j_b11 += 1.0
					_n_cx_b7 += 1.0
			_n_cy_b6 += 1.0
	var _n_rank_b2 = _S.function_value(_S.capture(_parent,{"blocks":_n_blocks_b1,"this":_this}),"_f1")
	var _n_at_b3 = _S.function_value(_S.capture(_parent,{"this":_this}),"_f5")
	var _n_uin_b4 = _S.call_value(_n_rank_b2,[_S.function_value(_S.capture(_parent,{"at":_n_at_b3,"seed":_n_seed_b0,"this":_this}),"_f6")])
	var _n_uout_b5 = _S.call_value(_n_rank_b2,[_S.function_value(_S.capture(_parent,{"at":_n_at_b3,"seed":_n_seed_b0,"this":_this}),"_f7")])
	_S.invoke(_n_blocks_b1,"forEach",[_S.function_value(_S.capture(_parent,{"uin":_n_uin_b4,"uout":_n_uout_b5,"seed":_n_seed_b0,"this":_this}),"_f8")])
	_S.invoke(_n_cache,"set",[_n_seed_b0, _n_blocks_b1])
	return _n_blocks_b1
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_blocks = _S.read(_parent,"blocks")
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_this = _S.read(_parent,"this")
	var _n_key_b0 = _S.arg(_args,0)
	var _n_v_b1 = _S.invoke(_n_blocks,"map",[_n_key_b0])
	var _n_out_b2 = _S.construct(_n_Float32Array,[_S.prop(_n_v_b1,"length")])
	_S.invoke(_S.invoke(_S.invoke(_n_v_b1,"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f2")]),"sort",[_S.function_value(_S.capture(_parent,{"v":_n_v_b1,"this":_n_this}),"_f3")]),"forEach",[_S.function_value(_S.capture(_parent,{"out":_n_out_b2,"v":_n_v_b1,"this":_n_this}),"_f4")])
	return _n_out_b2
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return _n_i_b1
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_v = _S.read(_parent,"v")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_v,_n_a_b0) - _S.index_value(_n_v,_n_b_b1))
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_out = _S.read(_parent,"out")
	var _n_v = _S.read(_parent,"v")
	var _n_i_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	return _S.set_prop(_n_out,_n_i_b0,(float(_n_k_b1)/(_S.prop(_n_v,"length") - 1)),"=")
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	var _n_sd_b1 = _S.arg(_args,1)
	return _S.NoiseKernels.fbm((float((_S.named_value(_n_b_b0,"x") + (float(_S.named_value(_n_b_b0,"s"))/2)))/64),(float((_S.named_value(_n_b_b0,"y") + (float(_S.named_value(_n_b_b0,"s"))/2)))/64),_n_sd_b1,3)
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_seed = _S.read(_parent,"seed")
	var _n_b_b0 = _S.arg(_args,0)
	return ((_S.call_value(_n_at,[_n_b_b0, _n_seed]) + (0.22 * _S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 1)]))) + (0.12 if _S.truth(_S.binary("===",_S.named_value(_n_b_b0,"s"),20)) else ((-0.08) if _S.truth(_S.binary("===",_S.named_value(_n_b_b0,"s"),5)) else 0)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_seed = _S.read(_parent,"seed")
	var _n_b_b0 = _S.arg(_args,0)
	return ((_S.call_value(_n_at,[_n_b_b0, (_n_seed + 7)]) + (0.22 * _S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 2)]))) + ((-0.14) if _S.truth(_S.binary("===",_S.named_value(_n_b_b0,"s"),20)) else (0.1 if _S.truth(_S.binary("===",_S.named_value(_n_b_b0,"s"),5)) else 0)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_IN0 = _S.read(_parent,"IN0")
	var _n_uin = _S.read(_parent,"uin")
	var _n_IN1 = _S.read(_parent,"IN1")
	var _n_OUT0 = _S.read(_parent,"OUT0")
	var _n_uout = _S.read(_parent,"uout")
	var _n_OUT1 = _S.read(_parent,"OUT1")
	var _n_seed = _S.read(_parent,"seed")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	_S.set_prop(_n_b_b0,"tin",(_n_IN0 + (_S.index_value(_n_uin,_n_i_b1) * (_n_IN1 - _n_IN0))),"=")
	_S.set_prop(_n_b_b0,"tout",(_n_OUT0 + (_S.index_value(_n_uout,_n_i_b1) * (_n_OUT1 - _n_OUT0))),"=")
	_S.set_prop(_n_b_b0,"glint",(_S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 3)]) < (0.32 if _S.truth((_S.named_value(_n_b_b0,"s") >= 10)) else 0.1)),"=")
	_S.set_prop(_n_b_b0,"gx",(_S.named_value(_n_b_b0,"x") + (0 if _S.truth((_S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 4)]) < 0.5)) else _S.named_value(_n_b_b0,"s"))),"=")
	_S.set_prop(_n_b_b0,"gy",(_S.named_value(_n_b_b0,"y") + (0 if _S.truth((_S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 5)]) < 0.5)) else _S.named_value(_n_b_b0,"s"))),"=")
	_S.set_prop(_n_b_b0,"spin",((_S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 6)]) - 0.5) * 3),"=")
	_S.set_prop(_n_b_b0,"L",((9 + (6 * _S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 9)]))) if _S.truth(((_S.MathFX.rand([_S.named_value(_n_b_b0,"x"),_S.named_value(_n_b_b0,"y"),(_n_seed + 8)]) < 0.45) if _S.truth(_S.binary("===",_S.named_value(_n_b_b0,"s"),20)) else _S.binary("===",_S.named_value(_n_b_b0,"s"),20))) else (2.5 + (_S.named_value(_n_b_b0,"s") * 0.32))),"=")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_c_b3 = _S.arg(_args,3)
	var _n_cross_b4 = _S.arg(_args,4)
	_S.invoke(_n_p_b0,"px",[_n_x_b1, _n_y_b2, _n_c_b3])
	if _S.truth(_n_cross_b4):
		for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
			var _tuple_1 = _iter_0
			var _n_dx_b5 = _S.prop(_tuple_1,0)
			var _n_dy_b6 = _S.prop(_tuple_1,1)
			_S.invoke(_n_p_b0,"px",[(_n_x_b1 + _n_dx_b5), (_n_y_b2 + _n_dy_b6), _n_c_b3])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_rect = _S.read(_parent,"rect")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_s_b3 = _S.arg(_args,3)
	var _n_fill_b4 = _S.arg(_args,4)
	var _n_rim_b5 = _S.arg(_args,5)
	var _n_X_b6 = floori(_n_x_b1+0.5)
	var _n_Y_b7 = floori(_n_y_b2+0.5)
	var _n_S_b8 = maxf(1,floori(_n_s_b3+0.5))
	if _S.truth(_n_fill_b4):
		_S.call_value(_n_rect,[_n_p_b0, _n_X_b6, _n_Y_b7, _n_S_b8, _n_S_b8, _n_fill_b4])
	if _S.truth(((_n_S_b8 > 2) if _S.truth(_n_rim_b5) else _n_rim_b5)):
		_S.call_value(_n_rect,[_n_p_b0, _n_X_b6, _n_Y_b7, _n_S_b8, 1, _n_rim_b5])
		_S.call_value(_n_rect,[_n_p_b0, _n_X_b6, ((_n_Y_b7 + _n_S_b8) - 1), _n_S_b8, 1, _n_rim_b5])
		_S.call_value(_n_rect,[_n_p_b0, _n_X_b6, _n_Y_b7, 1, _n_S_b8, _n_rim_b5])
		_S.call_value(_n_rect,[_n_p_b0, ((_n_X_b6 + _n_S_b8) - 1), _n_Y_b7, 1, _n_S_b8, _n_rim_b5])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_layout = _S.read(_parent,"layout")
	var _n_P = _S.read(_parent,"P")
	var _n_square = _S.read(_parent,"square")
	var _n_ease = _S.read(_parent,"ease")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_mote = _S.read(_parent,"mote")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ink_b4 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"color")])
	var _n_p_b5 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _n_blocks_b6 = _S.call_value(_n_layout,[_S.named_value(_n_o_b2,"seed")])
	var _n_glints_b7 = []
	var _n_frame_b8 = floori((_n_t_b1 * 15))
	if true:
		var _n_n_b9 = 0
		while _S.truth((_n_n_b9 < _S.prop(_n_blocks_b6,"length"))):
			var _n_b_b10 = _S.index_value(_n_blocks_b6,_n_n_b9)
			var _n_ki_b11 = (float((_n_t_b1 - _S.named_value(_n_b_b10,"tin")))/_n_P)
			var _n_ko_b12 = (float((_n_t_b1 - _S.named_value(_n_b_b10,"tout")))/_n_P)
			var _object_0 = _n_b_b10
			var _n_x_b13 = _S.named_value(_object_0,"x")
			var _n_y_b14 = _S.named_value(_object_0,"y")
			var _n_s_b15 = _S.named_value(_object_0,"s")
			var _n_cx_b16 = (_n_x_b13 + (float(_n_s_b15)/2))
			var _n_cy_b17 = (_n_y_b14 + (float(_n_s_b15)/2))
			if _S.truth(((_n_ki_b11 < 0) if _S.truth((_n_ki_b11 < 0)) else (_n_ko_b12 >= 1.6))):
				_n_n_b9 += 1.0
				continue
			if _S.truth((_n_ko_b12 < 0)):
				if _S.truth((_n_ki_b11 >= 1)):
					_S.call_value(_n_square,[_n_p0_b0, _n_x_b13, _n_y_b14, _n_s_b15, _n_ink_b4])
				else:
					var _n_g_b18 = ((0.35 + (0.65 * _S.invoke(_n_ease,"outBack",[(float(_n_ki_b11)/0.35)]))) if _S.truth((_n_ki_b11 < 0.35)) else 1)
					var _n_h_b19 = (_n_s_b15 * _n_g_b18)
					var _n_rim_b20 = (_n_WHITE if _S.truth((_n_ki_b11 < 0.45)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_ki_b11 < 0.6)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_ki_b11 < 0.75)) else (_S.index_value(_n_C_b3,4) if _S.truth((_n_ki_b11 < 0.9)) else _S.index_value(_n_C_b3,3)))))
					_S.call_value(_n_square,[_n_p_b5, (_n_cx_b16 - (float(_n_h_b19)/2)), (_n_cy_b17 - (float(_n_h_b19)/2)), _n_h_b19, (_n_ink_b4 if _S.truth((_n_ki_b11 > 0.2)) else 0), _n_rim_b20])
					if _S.truth(((_n_s_b15 >= 10) if _S.truth((_n_ki_b11 < 0.3)) else (_n_ki_b11 < 0.3))):
						for _iter_1 in _S.array([[0, 0], [1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
							var _tuple_2 = _iter_1
							var _n_dx_b21 = _S.prop(_tuple_2,0)
							var _n_dy_b22 = _S.prop(_tuple_2,1)
							_S.invoke(_n_p_b5,"px",[((_n_cx_b16 - 0.5) + _n_dx_b21), ((_n_cy_b17 - 0.5) + _n_dy_b22), (_S.index_value(_n_C_b3,6) if _S.truth((_n_dx_b21 if _S.truth(_n_dx_b21) else _n_dy_b22)) else _n_WHITE)])
					_S.invoke(_n_p_b5,"glow",[_n_cx_b16, _n_cy_b17, ((_n_s_b15 * 0.8) + 4), _S.index_value(_n_C_b3,5), (0.45 * (1 - _n_ki_b11))])
				if _S.truth(((_n_ki_b11 < 1.6) if _S.truth(((_n_ki_b11 > 0.15) if _S.truth(_S.named_value(_n_b_b10,"glint")) else _S.named_value(_n_b_b10,"glint"))) else ((_n_ki_b11 > 0.15) if _S.truth(_S.named_value(_n_b_b10,"glint")) else _S.named_value(_n_b_b10,"glint")))):
					_S.invoke(_n_glints_b7,"push",[[_n_b_b10, (float((_n_ki_b11 - 0.15))/1.45), 1]])
				if _S.truth(((_S.MathFX.rand([_n_frame_b8,_n_n_b9,9]) < 0.35) if _S.truth((_n_ki_b11 < 1.4)) else (_n_ki_b11 < 1.4))):
					_S.call_value(_n_mote,[_n_p_b5, ((_n_x_b13 + (_S.MathFX.rand([_n_frame_b8,_n_n_b9,10]) * (_n_s_b15 + 6))) - 3), ((_n_y_b14 + (_S.MathFX.rand([_n_frame_b8,_n_n_b9,11]) * (_n_s_b15 + 6))) - 3), (_n_WHITE if _S.truth((_S.MathFX.rand([_n_frame_b8,_n_n_b9,12]) < 0.5)) else _S.index_value(_n_C_b3,6)), (_S.MathFX.rand([_n_frame_b8,_n_n_b9,17]) < 0.25)])
			else:
				if _S.truth((_n_ko_b12 < 0.35)):
					var _n_q_b23 = (float(_n_ko_b12)/0.35)
					_S.call_value(_n_square,[_n_p0_b0, _n_x_b13, _n_y_b14, _n_s_b15, _n_ink_b4, (_S.index_value(_n_C_b3,4) if _S.truth((_n_q_b23 < 0.4)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_q_b23 < 0.75)) else _S.index_value(_n_C_b3,6)))])
					_S.invoke(_n_p_b5,"glow",[_n_cx_b16, _n_cy_b17, ((_n_s_b15 * 0.8) + 3), _S.index_value(_n_C_b3,4), (0.35 * _n_q_b23)])
				else:
					if _S.truth((_n_ko_b12 < 0.75)):
						var _n_q_b24 = (float((_n_ko_b12 - 0.35))/0.4)
						var _n_h_b25 = (_n_s_b15 * (1 - (_S.invoke(_n_ease,"inQuad",[_n_q_b24]) * 0.85)))
						_S.call_value(_n_square,[_n_p_b5, (_n_cx_b16 - (float(_n_h_b25)/2)), (_n_cy_b17 - (float(_n_h_b25)/2)), _n_h_b25, 0, (_n_WHITE if _S.truth((_n_q_b24 < 0.5)) else _S.index_value(_n_C_b3,6))])
						_S.invoke(_n_p_b5,"glow",[_n_cx_b16, _n_cy_b17, ((_n_s_b15 * 0.8) + 4), _S.index_value(_n_C_b3,5), (0.45 * (1 - (_n_q_b24 * 0.5)))])
					else:
						if _S.truth((_n_ko_b12 < 1)):
							var _n_q_b26 = (float((_n_ko_b12 - 0.75))/0.25)
							for _iter_3 in _S.array([[0, 0], [1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
								var _tuple_4 = _iter_3
								var _n_dx_b27 = _S.prop(_tuple_4,0)
								var _n_dy_b28 = _S.prop(_tuple_4,1)
								if _S.truth((not _S.truth((_n_dx_b27 if _S.truth(_n_dx_b27) else _n_dy_b28)) if _S.truth(not _S.truth((_n_dx_b27 if _S.truth(_n_dx_b27) else _n_dy_b28))) else (_n_q_b26 < 0.5))):
									_S.invoke(_n_p_b5,"px",[((_n_cx_b16 - 0.5) + _n_dx_b27), ((_n_cy_b17 - 0.5) + _n_dy_b28), (_S.index_value(_n_C_b3,6) if _S.truth((_n_dx_b27 if _S.truth(_n_dx_b27) else _n_dy_b28)) else _n_WHITE)])
							_S.invoke(_n_p_b5,"glow",[_n_cx_b16, _n_cy_b17, ((_n_s_b15 * 0.5) + 3), _S.index_value(_n_C_b3,5), (0.35 * (1 - _n_q_b26))])
				if _S.truth(((_n_ko_b12 > 0.3) if _S.truth(_S.named_value(_n_b_b10,"glint")) else _S.named_value(_n_b_b10,"glint"))):
					_S.invoke(_n_glints_b7,"push",[[_n_b_b10, (float((_n_ko_b12 - 0.3))/1.3), (-1)]])
				if _S.truth(((_S.MathFX.rand([_n_frame_b8,_n_n_b9,13]) < 0.3) if _S.truth(((_n_ko_b12 < 1.5) if _S.truth((_n_ko_b12 > 0.3)) else (_n_ko_b12 > 0.3))) else ((_n_ko_b12 < 1.5) if _S.truth((_n_ko_b12 > 0.3)) else (_n_ko_b12 > 0.3)))):
					_S.call_value(_n_mote,[_n_p_b5, ((_n_x_b13 + (_S.MathFX.rand([_n_frame_b8,_n_n_b9,14]) * (_n_s_b15 + 6))) - 3), ((_n_y_b14 + (_S.MathFX.rand([_n_frame_b8,_n_n_b9,15]) * (_n_s_b15 + 6))) - 3), (_n_WHITE if _S.truth((_S.MathFX.rand([_n_frame_b8,_n_n_b9,16]) < 0.5)) else _S.index_value(_n_C_b3,6)), (_S.MathFX.rand([_n_frame_b8,_n_n_b9,18]) < 0.25)])
			_n_n_b9 += 1.0
	for _iter_5 in _S.array(_n_glints_b7):
		var _tuple_6 = _iter_5
		var _n_b_b29 = _S.prop(_tuple_6,0)
		var _n_u_b30 = _S.prop(_tuple_6,1)
		var _n_dir_b31 = _S.prop(_tuple_6,2)
		if _S.truth(((_n_u_b30 <= 0) if _S.truth((_n_u_b30 <= 0)) else (_n_u_b30 >= 1))):
			continue
		var _n_L_b32 = (_S.named_value(_n_b_b29,"L") * pow(sin((PI * _n_u_b30)),0.7))
		_S.call_value(_n_glint,[_n_p_b5, _S.named_value(_n_b_b29,"gx"), _S.named_value(_n_b_b29,"gy"), _n_L_b32, (((_S.named_value(_n_b_b29,"spin") * _n_u_b30) * _n_dir_b31) + 0.4), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4)])
		if _S.truth((_S.named_value(_n_b_b29,"L") > 8)):
			_S.invoke(_n_p_b5,"glow",[_S.named_value(_n_b_b29,"gx"), _S.named_value(_n_b_b29,"gy"), (18 + _n_L_b32), _S.index_value(_n_C_b3,5), (0.25 * sin((PI * _n_u_b30)))])
	return null
