@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/crt-off.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
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
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "shape", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "CRT off"}, {"desc": "The picture squeezes into a white-hot glowing line, the line into a dot that lingers as a fading afterglow; then it switches back on, dot to line to picture, with a warm-up glow."}, {"tags": ["crt", "tv", "retro", "switch", "wipe"]}, {"duration": 2}, {"options": _S.merge([{"palette": ["#060a14", "#0e1a33", "#1a3360", "#2a5a9a", "#4a8fd0", "#8cc4f0", "#d4ecff", "#ffffff"]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "YC", _S.binary("/", _S.read(_e, "H"), 2))
	_S.define(_e, "XC", _S.binary("/", _S.read(_e, "W"), 2))
	_S.define(_e, "SQ0", 0.06)
	_S.define(_e, "SQ1", 0.34)
	_S.define(_e, "LN1", 0.56)
	_S.define(_e, "DOT1", 0.86)
	_S.define(_e, "ON0", 1.06)
	_S.define(_e, "ON1", 1.16)
	_S.define(_e, "OPEN1", 1.42)
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_SQ0 = _S.read(_parent,"SQ0")
	var _n_H = _S.read(_parent,"H")
	var _n_XC = _S.read(_parent,"XC")
	var _n_SQ1 = _S.read(_parent,"SQ1")
	var _n_ease = _S.read(_parent,"ease")
	var _n_LN1 = _S.read(_parent,"LN1")
	var _n_ON0 = _S.read(_parent,"ON0")
	var _n_ON1 = _S.read(_parent,"ON1")
	var _n_OPEN1 = _S.read(_parent,"OPEN1")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth((_n_t_b0 < _n_SQ0)):
		return {"h":_n_H,"w":_n_XC}
	if _S.truth((_n_t_b0 < _n_SQ1)):
		return {"h":maxf(1,(_n_H * (1 - _S.invoke(_n_ease,"inCubic",[(float((_n_t_b0 - _n_SQ0))/(_n_SQ1 - _n_SQ0))])))),"w":_n_XC}
	if _S.truth((_n_t_b0 < _n_LN1)):
		return {"h":1,"w":(_n_XC * (1 - _S.invoke(_n_ease,"inQuad",[(float((_n_t_b0 - _n_SQ1))/(_n_LN1 - _n_SQ1))])))}
	if _S.truth((_n_t_b0 < _n_ON0)):
		return {"h":0,"w":0}
	if _S.truth((_n_t_b0 < _n_ON1)):
		return {"h":1,"w":(_n_XC * _S.invoke(_n_ease,"outExpo",[(float((_n_t_b0 - _n_ON0))/(_n_ON1 - _n_ON0))]))}
	return {"h":maxf(1,(_n_H * _S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_ON1))/(_n_OPEN1 - _n_ON1)),0.0,1.0)]))),"w":_n_XC}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_shape = _S.read(_parent,"shape")
	var _n_OPEN1 = _S.read(_parent,"OPEN1")
	var _n_H = _S.read(_parent,"H")
	var _n_W = _S.read(_parent,"W")
	var _n_YC = _S.read(_parent,"YC")
	var _n_rect = _S.read(_parent,"rect")
	var _n_LN1 = _S.read(_parent,"LN1")
	var _n_ON0 = _S.read(_parent,"ON0")
	var _n_XC = _S.read(_parent,"XC")
	var _n_SQ1 = _S.read(_parent,"SQ1")
	var _n_ON1 = _S.read(_parent,"ON1")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_DOT1 = _S.read(_parent,"DOT1")
	var _n_glint = _S.read(_parent,"glint")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_ink_b4 = _S.call_value(_n_hex,[_S.named_value(_n_o_b2,"color")])
	var _n_p_b5 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _object_0 = _S.call_value(_n_shape,[_n_t_b1])
	var _n_h_b6 = _S.named_value(_object_0,"h")
	var _n_w_b7 = _S.named_value(_object_0,"w")
	var _n_fl_b8 = (0.85 + (0.15 * _S.MathFX.rand([floori((_n_t_b1 * 30)),7,_S.named_value(_n_o_b2,"seed")])))
	if _S.truth(((_n_t_b1 < (_n_OPEN1 + 0.6)) if _S.truth((_n_t_b1 >= (_n_OPEN1 + 0.02))) else (_n_t_b1 >= (_n_OPEN1 + 0.02)))):
		var _n_u_b16 = (float((_n_t_b1 - _n_OPEN1))/0.6)
		var _n_band_b17 = ((-20) + (_n_u_b16 * (_n_H + 40)))
		if true:
			var _n_y_b18 = 0
			while _S.truth((_n_y_b18 < _n_H)):
				var _n_k_b19 = (((0.22 * pow((1 - _n_u_b16),2)) + ((0.3 * pow(maxf(0,(1 - (float(absf((_n_y_b18 - _n_band_b17)))/10))),2)) * (1 - _n_u_b16))) + ((0.05 * (1 - _n_u_b16)) if _S.truth(_S.binary("&",_n_y_b18,1)) else 0))
				if _S.truth((_n_k_b19 > 0.01)):
					if true:
						var _n_x_b20 = 0
						while _S.truth((_n_x_b20 < _n_W)):
							_S.invoke(_n_p0_b0,"light",[_n_x_b20, _n_y_b18, _S.index_value(_n_C_b3,5), _n_k_b19])
							_n_x_b20 += 1
				_n_y_b18 += 1.0
		return null
	if _S.truth((_n_h_b6 >= _n_H)):
		return null
	var _n_top_b9 = floori((_n_YC - (float(_n_h_b6)/2))+0.5)
	var _n_bot_b10 = floori((_n_YC + (float(_n_h_b6)/2))+0.5)
	if _S.truth((_n_top_b9 > 0)):
		_S.call_value(_n_rect,[_n_p0_b0, 0, 0, _n_W, _n_top_b9, _n_ink_b4])
	if _S.truth((_n_bot_b10 < _n_H)):
		_S.call_value(_n_rect,[_n_p0_b0, 0, _n_bot_b10, _n_W, (_n_H - _n_bot_b10), _n_ink_b4])
	if _S.truth((_n_h_b6 > 2)):
		var _n_sq_b21 = (1 - (float(_n_h_b6)/_n_H))
		if true:
			var _n_y_b22 = _n_top_b9
			while _S.truth((_n_y_b22 < _n_bot_b10)):
				var _n_e_b23 = minf((_n_y_b22 - _n_top_b9),((_n_bot_b10 - 1) - _n_y_b22))
				var _n_k_b24 = ((((0.55 * _n_sq_b21) * _n_sq_b21) + ((0.08 * _n_sq_b21) if _S.truth(_S.binary("&",_n_y_b22,1)) else 0)) + (0.35 * pow(maxf(0,(1 - (float(_n_e_b23)/6))),2)))
				if true:
					var _n_x_b25 = 0
					while _S.truth((_n_x_b25 < _n_W)):
						_S.invoke(_n_p0_b0,"light",[_n_x_b25, _n_y_b22, _S.index_value(_n_C_b3,5), (_n_k_b24 * _n_fl_b8)])
						_n_x_b25 += 1.0
				_n_y_b22 += 1.0
		for _iter_1 in _S.array([(_n_top_b9 - 1), _n_bot_b10]):
			var _n_y_b26 = _iter_1
			if _S.truth(((_n_y_b26 < _n_H) if _S.truth((_n_y_b26 >= 0)) else (_n_y_b26 >= 0))):
				_S.call_value(_n_rect,[_n_p0_b0, 0, _n_y_b26, _n_W, 1, (_S.index_value(_n_C_b3,6) if _S.truth((_n_sq_b21 > 0.6)) else _S.index_value(_n_C_b3,5))])
		return null
	var _n_dotPhase_b11 = ((_n_t_b1 < _n_ON0) if _S.truth((_n_t_b1 >= _n_LN1)) else (_n_t_b1 >= _n_LN1))
	var _n_x0_b12 = floori((_n_XC - _n_w_b7))
	var _n_x1_b13 = ceili((_n_XC + _n_w_b7))
	var _n_fresh_b14 = ((_n_t_b1 < (_n_SQ1 + 0.08)) if _S.truth((_n_t_b1 < (_n_SQ1 + 0.08))) else ((_n_t_b1 < (_n_ON1 + 0.04)) if _S.truth((_n_t_b1 > _n_ON0)) else (_n_t_b1 > _n_ON0)))
	if _S.truth(((_n_w_b7 >= 1) if _S.truth((_n_h_b6 > 0)) else (_n_h_b6 > 0))):
		var _n_fr_b27 = floori((_n_t_b1 * 30))
		if true:
			var _n_x_b28 = maxf(0,_n_x0_b12)
			while _S.truth((_n_x_b28 < minf(_n_W,_n_x1_b13))):
				var _n_u_b29 = (float(absf(((_n_x_b28 + 0.5) - _n_XC)))/_n_w_b7)
				var _n_y_b30 = (_n_YC + floori((_S.MathFX.noise(((float(_n_x_b28)/23) + (_n_t_b1 * 9)),_S.named_value(_n_o_b2,"seed")) * (0.7 + (0.5 * _n_u_b29)))+0.5))
				_S.invoke(_n_p0_b0,"px",[_n_x_b28, _n_y_b30, (_n_WHITE if _S.truth((_n_u_b29 < 0.85)) else _S.index_value(_n_C_b3,6))])
				if _S.truth((_n_u_b29 < 0.92)):
					_S.invoke(_n_p0_b0,"px",[_n_x_b28, (_n_y_b30 - 1), _S.index_value(_n_C_b3,6)])
					_S.invoke(_n_p0_b0,"px",[_n_x_b28, (_n_y_b30 + 1), (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b29 < 0.6)) else _S.index_value(_n_C_b3,5))])
				if _S.truth(((_n_u_b29 < 0.8) if _S.truth(_n_fresh_b14) else _n_fresh_b14)):
					_S.invoke(_n_p0_b0,"dot",[_n_x_b28, (_n_y_b30 - 2), _S.index_value(_n_C_b3,4), 0.5])
					_S.invoke(_n_p0_b0,"dot",[_n_x_b28, (_n_y_b30 + 2), _S.index_value(_n_C_b3,4), 0.5])
				if _S.truth((_S.MathFX.rand([_n_x_b28,_n_fr_b27,(_S.named_value(_n_o_b2,"seed") + 3)]) < 0.06)):
					_S.invoke(_n_p_b5,"px",[_n_x_b28, (_n_y_b30 + (((-1) if _S.truth((_S.MathFX.rand([_n_x_b28,_n_fr_b27,(_S.named_value(_n_o_b2,"seed") + 4)]) < 0.5)) else 1) * (2 + floori((_S.MathFX.rand([_n_x_b28,_n_fr_b27,(_S.named_value(_n_o_b2,"seed") + 5)]) * 4))))), (_n_WHITE if _S.truth((_S.MathFX.rand([_n_x_b28,_n_fr_b27,6]) < 0.5)) else _S.index_value(_n_C_b3,5))])
				_S.invoke(_n_p0_b0,"light",[_n_x_b28, _n_y_b30, _S.index_value(_n_C_b3,6), ((0.5 * _n_fl_b8) * (1 - (_n_u_b29 * 0.6)))])
				_n_x_b28 += 1.0
		if true:
			var _n_x_b31 = _n_x0_b12
			while _S.truth((_n_x_b31 <= _n_x1_b13)):
				_S.invoke(_n_p_b5,"glow",[_n_x_b31, _n_YC, 10, _S.index_value(_n_C_b3,5), (0.35 * _n_fl_b8)])
				_n_x_b31 += 9
		_S.invoke(_n_p_b5,"glow",[_n_XC, _n_YC, minf(70,(16 + (_n_w_b7 * 0.4))), _S.index_value(_n_C_b3,5), (0.4 * _n_fl_b8)])
	if _S.truth(_n_dotPhase_b11):
		var _n_u_b32 = (float((_n_t_b1 - _n_LN1))/(_n_DOT1 - _n_LN1))
		if _S.truth((_n_u_b32 < 0.35)):
			_S.call_value(_n_glint,[_n_p_b5, _n_XC, _n_YC, ((10 * (1 - (float(_n_u_b32)/0.35))) + 3), (0.2 + (_n_u_b32 * 2)), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5)])
		if _S.truth((_n_u_b32 < 1)):
			_S.invoke(_n_p_b5,"px",[_n_XC, _n_YC, (_n_WHITE if _S.truth((_n_u_b32 < 0.5)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b32 < 0.75)) else _S.index_value(_n_C_b3,4)))])
			_S.invoke(_n_p_b5,"px",[(_n_XC - 1), _n_YC, (_S.index_value(_n_C_b3,6) if _S.truth((_n_u_b32 < 0.4)) else _S.index_value(_n_C_b3,4))])
			var _n_sm_b33 = floori((9 * (1 - _n_u_b32))+0.5)
			if true:
				var _n_k_b34 = 2
				while _S.truth((_n_k_b34 <= _n_sm_b33)):
					_S.invoke(_n_p_b5,"dot",[(_n_XC - _n_k_b34), _n_YC, _S.index_value(_n_C_b3,4), (1 - (float(_n_k_b34)/(_n_sm_b33 + 1)))])
					_S.invoke(_n_p_b5,"dot",[((_n_XC + _n_k_b34) - 1), _n_YC, _S.index_value(_n_C_b3,4), (1 - (float(_n_k_b34)/(_n_sm_b33 + 1)))])
					_n_k_b34 += 1.0
			_S.invoke(_n_p_b5,"glow",[_n_XC, _n_YC, (22 * (1 - (_n_u_b32 * 0.5))), _S.index_value(_n_C_b3,5), (0.55 * pow((1 - _n_u_b32),1.5))])
	var _n_s_b15 = (_n_t_b1 - _n_ON0)
	if _S.truth(((_n_s_b15 < 0.14) if _S.truth((_n_s_b15 >= 0)) else (_n_s_b15 >= 0))):
		_S.call_value(_n_glint,[_n_p_b5, _n_XC, _n_YC, ((12 * (1 - (float(_n_s_b15)/0.14))) + 2), (0.4 + (_n_s_b15 * 6)), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5)])
		_S.invoke(_n_p_b5,"glow",[_n_XC, _n_YC, 40, _n_WHITE, (0.5 * (1 - (float(_n_s_b15)/0.14)))])
	return null
