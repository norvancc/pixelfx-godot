@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/critters/flying-skull.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "wrap", _S.import_value("core/index.js", "wrap"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "fly", _S.import_value("core/index.js", "fly"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "Grid", _S.import_value("fx/critters/_lib.js", "Grid"))
	_S.define(_e, "Swarm", _S.import_value("fx/critters/_lib.js", "Swarm"))
	_S.define(_e, "shift", _S.import_value("fx/critters/_lib.js", "shift"))
	_S.define(_e, "lnoise", _S.import_value("fx/critters/_lib.js", "lnoise"))
	_S.define(_e, "tongue", _S.import_value("fx/critters/_lib.js", "tongue"))
	_S.define(_e, "firePuff", _S.import_value("fx/critters/_lib.js", "firePuff"))
	_S.define(_e, "shadow", _S.import_value("fx/critters/_lib.js", "shadow"))
	_S.define(_e, "bounce", _S.import_value("fx/critters/_lib.js", "bounce"))
	_S.define(_e, "at", _S.function_value(_e, "_f0"))
	_S.define(_e, "jaw", _S.function_value(_e, "_f1"))
	_S.define(_e, "skull", _S.function_value(_e, "_f2"))
	_S.define(_e, "inJaw", _S.function_value(_e, "_f8"))
	_S.define(_e, "crown", _S.function_value(_e, "_f9"))
	_S.define(_e, "height", _S.function_value(_e, "_f10"))
	_S.define(_e, "draw", _S.function_value(_e, "_f11"))
	_S.define(_e, "particles", _S.function_value(_e, "_f14"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f24"))
	_S.define(_e, "meta", _S.merge([{"name": "Flying skull"}, {"desc": "A cracked bone skull bobs in the air, jaw chattering, eyes burning, a fire roaring off its crown that sheds flame puffs, embers and smoke and throws warm light."}, {"tags": ["critter", "skull", "undead", "fire", "flying", "monster", "loop"]}, {"size": [96, 132]}, {"origin": [48, 120]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"]}, {"bone": ["#1a1114", "#3e2b2a", "#6b5144", "#9e8467", "#cdb892", "#efe2bf", "#fffaea"]}, {"hover": 40}, {"floor": true}, {"seed": 1}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Grid"), [_S.unary("-", 14), _S.unary("-", 20), 28, 40]))
	_S.define(_e, "SOCKET", _S.call_value(_S.read(_e, "hex"), ["#120a0c"]))
	_S.define(_e, "SWARM", _S.construct(_S.read(_e, "Swarm"), []))
	_S.define(_e, "burst", _S.function_value(_e, "_f25"))
	_S.define(_e, "flick", _S.function_value(_e, "_f26"))
	_S.define(_e, "inCranium", _S.function_value(_e, "_f27"))
	_S.define(_e, "inFace", _S.function_value(_e, "_f28"))
	_S.define(_e, "inSkull", _S.function_value(_e, "_f29"))
	_S.define(_e, "browY", _S.function_value(_e, "_f30"))
	_S.define(_e, "inSocket", _S.function_value(_e, "_f31"))
	_S.define(_e, "NOSE", [[_S.unary("-", 1), 1], [0, 1], [_S.unary("-", 2), 2], [_S.unary("-", 1), 2], [0, 2], [1, 2], [_S.unary("-", 2), 3], [1, 3]])
	_S.define(_e, "CRACK", [[4, _S.unary("-", 16)], [4, _S.unary("-", 15)], [5, _S.unary("-", 14)], [5, _S.unary("-", 13)], [4, _S.unary("-", 12)], [5, _S.unary("-", 11)], [6, _S.unary("-", 10)], [6, _S.unary("-", 9)]])
	_S.define(_e, "topY", _S.function_value(_e, "_f32"))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_hover_b1 = _S.arg(_args,1)
	var _n_a_b2 = ((float(_n_t_b0)/_n_D) * _n_TAU)
	return {"x":(3 * sin(_n_a_b2)),"y":((-_n_hover_b1) + (3 * sin(((2 * _n_a_b2) + 0.5)))),"vx":(float(((3 * _n_TAU) * cos(_n_a_b2)))/_n_D),"vy":(float(((6 * _n_TAU) * cos(((2 * _n_a_b2) + 0.5))))/_n_D)}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_burst = _S.read(_parent,"burst")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_ch_b1 = maxf(0,sin((((float(_n_t_b0)/_n_D) * _n_TAU) * 22)))
	var _n_b1_b2 = _S.call_value(_n_burst,[_n_t_b0, 0.15, 0.75])
	var _n_b2_b3 = _S.call_value(_n_burst,[_n_t_b0, 1.3, 1.95])
	var _n_gape_b4 = _S.call_value(_n_burst,[_n_t_b0, 1.95, 2.3])
	return floori(maxf(((_n_ch_b1 * 2.4) * maxf(_n_b1_b2,_n_b2_b3)),(_n_gape_b4 * 3.4))+0.5)
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_SOCKET = _S.read(_parent,"SOCKET")
	var _n_NOSE = _S.read(_parent,"NOSE")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_B_b1 = _S.arg(_args,1)
	var _n_F_b2 = _S.arg(_args,2)
	var _n_open_b3 = _S.arg(_args,3)
	var _n_t_b4 = _S.arg(_args,4)
	var _n_warm_b5 = _S.ColorFX.mix(_S.index_value(_n_B_b1,6),_S.index_value(_n_F_b2,6),0.45)
	var _n_rim_b6 = _S.ColorFX.mix(_S.index_value(_n_B_b1,5),_S.index_value(_n_F_b2,5),0.3)
	var _n_lx_b7 = (-4)
	var _n_ly_b8 = (-15)
	var _n_lit_b9 = _S.function_value(_S.capture(_parent,{"lx":_n_lx_b7,"ly":_n_ly_b8,"this":_this}),"_f3")
	_S.invoke(_n_g_b0,"clear",[])
	_S.invoke(_n_g_b0,"shade",[(-12), (-17), 12, 8, _S.function_value(_S.capture(_parent,{"lit":_n_lit_b9,"B":_n_B_b1,"warm":_n_warm_b5,"rim":_n_rim_b6,"this":_this}),"_f4")])
	_S.invoke(_n_g_b0,"shade",[(-9), (-7), 9, 1, _S.function_value(_S.capture(_parent,{"B":_n_B_b1,"F":_n_F_b2,"this":_this}),"_f5")])
	for _iter_0 in _S.array(_n_NOSE):
		var _tuple_1 = _iter_0
		var _n_x_b11 = _S.prop(_tuple_1,0)
		var _n_y_b12 = _S.prop(_tuple_1,1)
		_S.invoke(_n_g_b0,"set",[_n_x_b11, _n_y_b12, (_S.index_value(_n_B_b1,1) if _S.truth(_S.binary("===",_n_y_b12,3)) else _n_SOCKET)])
	_S.invoke(_n_g_b0,"set",[(-1), 3, _S.index_value(_n_B_b1,2)])
	_S.invoke(_n_g_b0,"set",[0, 3, _S.index_value(_n_B_b1,2)])
	for _iter_2 in _S.array(_n_CRACK):
		var _tuple_3 = _iter_2
		var _n_x_b13 = _S.prop(_tuple_3,0)
		var _n_y_b14 = _S.prop(_tuple_3,1)
		_S.invoke(_n_g_b0,"set",[_n_x_b13, _n_y_b14, _S.index_value(_n_B_b1,1)])
		_S.invoke(_n_g_b0,"set",[(_n_x_b13 - 1), _n_y_b14, _S.index_value(_n_B_b1,5)])
	_S.invoke(_n_g_b0,"set",[7, (-7), _S.index_value(_n_B_b1,1)])
	_S.invoke(_n_g_b0,"set",[8, (-6), _S.index_value(_n_B_b1,1)])
	var _n_jy_b10 = (8 + _n_open_b3)
	_S.invoke(_n_g_b0,"shade",[(-8), 4, 8, (_n_jy_b10 + 6), _S.function_value(_S.capture(_parent,{"jy":_n_jy_b10,"B":_n_B_b1,"this":_this}),"_f6")])
	if _S.truth((_n_open_b3 > 0)):
		if true:
			var _n_y_b15 = 8
			while _S.truth((_n_y_b15 < _n_jy_b10)):
				if true:
					var _n_x_b16 = (-6)
					while _S.truth((_n_x_b16 <= 5)):
						_S.invoke(_n_g_b0,"set",[_n_x_b16, _n_y_b15, (_S.ColorFX.mix(_n_SOCKET,_S.index_value(_n_F_b2,3),0.5) if _S.truth(_S.binary("===",_n_y_b15,(_n_jy_b10 - 1))) else _n_SOCKET)])
						_n_x_b16 += 1.0
				_n_y_b15 += 1.0
	_S.invoke(_n_g_b0,"outline",[_S.function_value(_S.capture(_parent,{"B":_n_B_b1,"F":_n_F_b2,"this":_this}),"_f7")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_inSkull = _S.read(_parent,"inSkull")
	var _n_lx = _S.read(_parent,"lx")
	var _n_ly = _S.read(_parent,"ly")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return _S.call_value(_n_inSkull,[(_n_lx + (float((_n_x_b0 - _n_lx))/_n_k_b2)), (_n_ly + (float((_n_y_b1 - _n_ly))/_n_k_b2))])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_inSkull = _S.read(_parent,"inSkull")
	var _n_B = _S.read(_parent,"B")
	var _n_lit = _S.read(_parent,"lit")
	var _n_warm = _S.read(_parent,"warm")
	var _n_rim = _S.read(_parent,"rim")
	var _n_browY = _S.read(_parent,"browY")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	if _S.truth(not _S.truth(_S.call_value(_n_inSkull,[_n_x_b0, _n_y_b1]))):
		return 0
	var _n_c_b3 = (_S.index_value(_n_B,5) if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.45])) else (_S.index_value(_n_B,4) if _S.truth(_S.call_value(_n_lit,[_n_x_b0, _n_y_b1, 0.74])) else _S.index_value(_n_B,3)))
	if _S.truth(_S.logical("&&",_S.logical("&&",(absf(_n_x_b0) > 8.2),func():return (_n_y_b1 > (-7))),func():return (_n_y_b1 < (-1)))):
		_n_c_b3 = (_S.index_value(_n_B,3) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,2))
	if _S.truth(_S.logical("||",not _S.truth(_S.call_value(_n_inSkull,[(_n_x_b0 + 2), (_n_y_b1 + 2.2)])),func():return (not _S.truth(_S.call_value(_n_inSkull,[(_n_x_b0 + 2.6), _n_y_b1])) if _S.truth((_n_x_b0 > 0)) else (_n_x_b0 > 0)))):
		_n_c_b3 = _S.index_value(_n_B,2)
	if _S.truth(_S.logical("&&",not _S.truth(_S.call_value(_n_inSkull,[(_n_x_b0 + 1), (_n_y_b1 + 1.2)])),func():return (_n_y_b1 > 2))):
		_n_c_b3 = _S.index_value(_n_B,1)
	if _S.truth(not _S.truth(_S.call_value(_n_inSkull,[_n_x_b0, (_n_y_b1 - 1.5)]))):
		_n_c_b3 = (_n_warm if _S.truth((absf(_n_x_b0) < 7)) else _n_rim)
	else:
		if _S.truth(_S.logical("&&",not _S.truth(_S.call_value(_n_inSkull,[_n_x_b0, (_n_y_b1 - 2.5)])),func():return (absf(_n_x_b0) < 6))):
			_n_c_b3 = _n_rim
	if _S.truth(_S.logical("&&",_S.logical("&&",_S.logical("&&",(_n_y_b1 > (_S.call_value(_n_browY,[_n_x_b0]) - 1.2)),func():return (_n_y_b1 < (_S.call_value(_n_browY,[_n_x_b0]) + 0.4))),func():return (absf(_n_x_b0) > 1.6)),func():return (absf(_n_x_b0) < 8.6))):
		_n_c_b3 = (_S.index_value(_n_B,4) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,3))
	if _S.truth(_S.logical("&&",_S.logical("&&",_S.logical("&&",(absf(_n_x_b0) > 6.2),func():return (absf(_n_x_b0) < 9.2)),func():return (_n_y_b1 > 0)),func():return (_n_y_b1 < 2))):
		_n_c_b3 = (_S.index_value(_n_B,5) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,3))
	if _S.truth((_n_y_b1 > 6)):
		if _S.truth((absf(_n_x_b0) > 6.4)):
			return 0
		var _n_cx_b4 = floori(_n_x_b0)
		var _n_gap_b5 = (((_S.binary("===",_n_cx_b4,(-6)) if _S.truth(_S.binary("===",_n_cx_b4,(-6))) else _S.binary("===",_n_cx_b4,(-3))) if _S.truth((_S.binary("===",_n_cx_b4,(-6)) if _S.truth(_S.binary("===",_n_cx_b4,(-6))) else _S.binary("===",_n_cx_b4,(-3)))) else _S.binary("===",_n_cx_b4,2)) if _S.truth(((_S.binary("===",_n_cx_b4,(-6)) if _S.truth(_S.binary("===",_n_cx_b4,(-6))) else _S.binary("===",_n_cx_b4,(-3))) if _S.truth((_S.binary("===",_n_cx_b4,(-6)) if _S.truth(_S.binary("===",_n_cx_b4,(-6))) else _S.binary("===",_n_cx_b4,(-3)))) else _S.binary("===",_n_cx_b4,2))) else _S.binary("===",_n_cx_b4,5))
		_n_c_b3 = (_S.index_value(_n_B,1) if _S.truth(_n_gap_b5) else ((_S.index_value(_n_B,5) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,4)) if _S.truth((_n_y_b1 < 7)) else (_S.index_value(_n_B,3) if _S.truth((_S.binary("===",_n_cx_b4,(-1)) if _S.truth(_S.binary("===",_n_cx_b4,(-1))) else _S.binary("===",_n_cx_b4,0))) else _S.index_value(_n_B,4))))
	return _n_c_b3
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_inSocket = _S.read(_parent,"inSocket")
	var _n_B = _S.read(_parent,"B")
	var _n_F = _S.read(_parent,"F")
	var _n_SOCKET = _S.read(_parent,"SOCKET")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	if _S.truth(not _S.truth(_S.call_value(_n_inSocket,[_n_x_b0, _n_y_b1]))):
		return 0
	if _S.truth(not _S.truth(_S.call_value(_n_inSocket,[_n_x_b0, (_n_y_b1 + 1.3)]))):
		return _S.ColorFX.mix(_S.index_value(_n_B,2),_S.index_value(_n_F,4),0.55)
	return _n_SOCKET
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_jy = _S.read(_parent,"jy")
	var _n_B = _S.read(_parent,"B")
	var _n_inJaw = _S.read(_parent,"inJaw")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_ax_b2 = absf(_n_x_b0)
	if _S.truth(((_n_y_b1 < (_n_jy + 2)) if _S.truth(((_n_y_b1 > 4) if _S.truth(((_n_ax_b2 < 8.1) if _S.truth((_n_ax_b2 > 6.6)) else (_n_ax_b2 > 6.6))) else ((_n_ax_b2 < 8.1) if _S.truth((_n_ax_b2 > 6.6)) else (_n_ax_b2 > 6.6)))) else ((_n_y_b1 > 4) if _S.truth(((_n_ax_b2 < 8.1) if _S.truth((_n_ax_b2 > 6.6)) else (_n_ax_b2 > 6.6))) else ((_n_ax_b2 < 8.1) if _S.truth((_n_ax_b2 > 6.6)) else (_n_ax_b2 > 6.6))))):
		return (_S.index_value(_n_B,3) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,2))
	if _S.truth(((_n_y_b1 < _n_jy) if _S.truth((_n_y_b1 < _n_jy)) else (_n_y_b1 > (_n_jy + 5.5)))):
		return 0
	var _n_v_b3 = (_n_y_b1 - _n_jy)
	var _n_hw_b4 = ((7.4 - (_n_v_b3 * 0.45)) - (((_n_v_b3 - 4) * 1.2) if _S.truth((_n_v_b3 > 4)) else 0))
	if _S.truth((_n_ax_b2 > _n_hw_b4)):
		return 0
	if _S.truth((_n_v_b3 < 1.5)):
		if _S.truth((_n_ax_b2 > 6)):
			return (_S.index_value(_n_B,4) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,3))
		var _n_cx_b5 = floori(_n_x_b0)
		var _n_gap_b6 = (((_S.binary("===",_n_cx_b5,(-5)) if _S.truth(_S.binary("===",_n_cx_b5,(-5))) else _S.binary("===",_n_cx_b5,(-2))) if _S.truth((_S.binary("===",_n_cx_b5,(-5)) if _S.truth(_S.binary("===",_n_cx_b5,(-5))) else _S.binary("===",_n_cx_b5,(-2)))) else _S.binary("===",_n_cx_b5,1)) if _S.truth(((_S.binary("===",_n_cx_b5,(-5)) if _S.truth(_S.binary("===",_n_cx_b5,(-5))) else _S.binary("===",_n_cx_b5,(-2))) if _S.truth((_S.binary("===",_n_cx_b5,(-5)) if _S.truth(_S.binary("===",_n_cx_b5,(-5))) else _S.binary("===",_n_cx_b5,(-2)))) else _S.binary("===",_n_cx_b5,1))) else _S.binary("===",_n_cx_b5,4))
		return (_S.index_value(_n_B,1) if _S.truth(_n_gap_b6) else (_S.index_value(_n_B,5) if _S.truth((_n_v_b3 < 1)) else _S.index_value(_n_B,4)))
	return (_S.index_value(_n_B,1) if _S.truth(not _S.truth(_S.call_value(_n_inJaw,[(_n_x_b0 + 1.6), (_n_y_b1 + 1.6), _n_jy]))) else ((_S.index_value(_n_B,4) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_B,3)) if _S.truth((_n_v_b3 < 2.5)) else _S.index_value(_n_B,3)))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_F = _S.read(_parent,"F")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_nx_b2 = _S.arg(_args,2)
	var _n_ny_b3 = _S.arg(_args,3)
	return (_S.ColorFX.mix(_S.index_value(_n_B,0),_S.index_value(_n_F,1),0.75) if _S.truth((_n_ny_b3 < 0)) else _S.index_value(_n_B,0))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_jy_b2 = _S.arg(_args,2)
	var _n_v_b3 = (_n_y_b1 - _n_jy_b2)
	var _n_hw_b4 = ((7.4 - (_n_v_b3 * 0.45)) - (((_n_v_b3 - 4) * 1.2) if _S.truth((_n_v_b3 > 4)) else 0))
	return ((absf(_n_x_b0) <= _n_hw_b4) if _S.truth(((_n_v_b3 <= 5.5) if _S.truth((_n_v_b3 >= 0)) else (_n_v_b3 >= 0))) else ((_n_v_b3 <= 5.5) if _S.truth((_n_v_b3 >= 0)) else (_n_v_b3 >= 0)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_seed_b0 = _S.arg(_args,0)
	var _n_out_b1 = []
	if true:
		var _n_x_b2 = (-10)
		while _S.truth((_n_x_b2 <= 10)):
			_S.invoke(_n_out_b1,"push",[{"x":_n_x_b2,"h":(13 + (13 * (1 - pow((float(_n_x_b2)/11),2)))),"w":(2.3 + (_S.MathFX.rand([(_n_x_b2 + 20),_n_seed_b0,3]) * 0.8)),"n":((37 + (_n_x_b2 * 3)) + (_n_seed_b0 * 11)),"front":false}])
			_n_x_b2 += 2
	for _iter_0 in _S.array([(-1), 1]):
		var _n_s_b3 = _iter_0
		_S.invoke(_n_out_b1,"push",[{"x":(_n_s_b3 * 11),"y":(-5),"h":10,"w":1.8,"n":((61 + (_n_s_b3 * 13)) + (_n_seed_b0 * 5)),"front":false}])
	if true:
		var _n_x_b4 = (-5)
		while _S.truth((_n_x_b4 <= 5)):
			_S.invoke(_n_out_b1,"push",[{"x":_n_x_b4,"h":(5 + (3 * _S.MathFX.rand([((_n_x_b4 * 4) + 20),_n_seed_b0,5]))),"w":1.6,"n":((91 + (_n_x_b4 * 5)) + (_n_seed_b0 * 7)),"front":true}])
			_n_x_b4 += 2.5
	return _n_out_b1
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	var _n_leap_b3 = (maxf(0,(_S.call_value(_n_lnoise,[_n_t_b1, _n_D, 6, (_S.named_value(_n_f_b0,"n") * 3.1), 70]) - 0.55)) * 1.6)
	return (((_S.named_value(_n_f_b0,"h") + ((0.25 * _S.named_value(_n_f_b0,"h")) * _S.call_value(_n_lnoise,[_n_t_b1, _n_D, 8, (_S.named_value(_n_f_b0,"n") * 1.7), 5]))) + (_S.named_value(_n_f_b0,"h") * _n_leap_b3)) * (0.9 + (0.1 * _n_k_b2)))
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_flick = _S.read(_parent,"flick")
	var _n_crown = _S.read(_parent,"crown")
	var _n_topY = _S.read(_parent,"topY")
	var _n_height = _S.read(_parent,"height")
	var _n_tongue = _S.read(_parent,"tongue")
	var _n_particles = _S.read(_parent,"particles")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_skull = _S.read(_parent,"skull")
	var _n_jaw = _S.read(_parent,"jaw")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_fly = _S.read(_parent,"fly")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_F_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_heat_b5 = _S.invoke(_S.concat([_S.array(_n_F_b4)]),"reverse",[])
	var _n_B_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"bone"),7)
	var _n_S_b7 = _S.call_value(_n_at,[_n_t_b3, _S.named_value(_n_o_b2,"hover")])
	var _n_k_b8 = _S.call_value(_n_flick,[_n_t_b3])
	var _n_lean_b9 = clampf((float((-_S.named_value(_n_S_b7,"vx")))/60),(-0.8),0.8)
	var _n_stretch_b10 = clampf((float(_S.named_value(_n_S_b7,"vy"))/90),(-0.3),0.45)
	var _n_tongues_b11 = _S.invoke(_S.call_value(_n_crown,[_S.named_value(_n_o_b2,"seed")]),"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f12")])
	var _n_X_b12 = floori(_S.named_value(_n_S_b7,"x")+0.5)
	var _n_Y_b13 = floori(_S.named_value(_n_S_b7,"y")+0.5)
	var _n_lick_b14 = _S.function_value(_S.capture(_parent,{"t":_n_t_b3,"lean":_n_lean_b9,"k":_n_k_b8,"this":_this}),"_f13")
	if true:
		var _n_li_b18 = 0
		while _S.truth((_n_li_b18 < 4)):
			for _iter_0 in _S.array(_n_tongues_b11):
				var _n_f_b19 = _iter_0
				if _S.truth(not _S.truth(_S.named_value(_n_f_b19,"front"))):
					_S.call_value(_n_tongue,[_n_p_b0, (_n_X_b12 + _S.named_value(_n_f_b19,"x")), (_n_Y_b13 + (_S.named_value(_n_f_b19,"y") if _S.named_value(_n_f_b19,"y")!=null else (_S.call_value(_n_topY,[_S.named_value(_n_f_b19,"x")]) + 3))), (_S.call_value(_n_height,[_n_f_b19, _n_t_b3, _n_k_b8]) * (1 + _n_stretch_b10)), (_S.named_value(_n_f_b19,"w") * (1 - (0.25 * absf(_n_lean_b9)))), _S.call_value(_n_lick_b14,[_n_f_b19]), _n_t_b3, _n_D, _S.named_value(_n_f_b19,"n"), _n_heat_b5, _n_li_b18])
			_n_li_b18 += 1.0
	_S.call_value(_n_particles,[_n_p_b0, _n_t_b3, _n_o_b2, _n_heat_b5, _n_F_b4, true])
	var _n_g_b15 = _n_GRID
	_S.call_value(_n_skull,[_n_g_b15, _n_B_b6, _n_F_b4, _S.call_value(_n_jaw,[_n_t_b3]), _n_t_b3])
	_S.invoke(_n_g_b15,"draw",[_n_p_b0, 1, _n_X_b12, _n_Y_b13])
	for _iter_1 in _S.array([(-1), 1]):
		var _n_s_b20 = _iter_1
		var _n_ex_b21 = ((_n_X_b12 + (_n_s_b20 * 5.1)) - 0.5)
		var _n_ey_b22 = (_n_Y_b13 - 2.4)
		var _n_fl_b23 = (0.75 + (0.25 * _S.call_value(_n_lnoise,[_n_t_b3, _n_D, 30, (_n_s_b20 * 9), 12])))
		_S.invoke(_n_p_b0,"px",[_n_ex_b21, _n_ey_b22, _S.index_value(_n_heat_b5,0)])
		_S.invoke(_n_p_b0,"px",[(_n_ex_b21 + 1), _n_ey_b22, _S.index_value(_n_heat_b5,1)])
		_S.invoke(_n_p_b0,"px",[_n_ex_b21, (_n_ey_b22 + 1), _S.index_value(_n_heat_b5,2)])
		_S.invoke(_n_p_b0,"px",[(_n_ex_b21 + 1), (_n_ey_b22 + 1), _S.index_value(_n_heat_b5,3)])
		if _S.truth((_n_fl_b23 > 0.8)):
			_S.invoke(_n_p_b0,"px",[_n_ex_b21, (_n_ey_b22 - 1), _S.index_value(_n_heat_b5,3)])
			_S.invoke(_n_p_b0,"px",[(_n_ex_b21 + 1), (_n_ey_b22 - 1), _S.index_value(_n_heat_b5,5)])
		_S.invoke(_n_p_b0,"glow",[(_n_ex_b21 + 1), (_n_ey_b22 + 1), 6, _S.index_value(_n_F_b4,5), (0.45 * _n_fl_b23)])
		_S.invoke(_n_p_b0,"glow",[(_n_ex_b21 + 1), (_n_ey_b22 + 0.5), 3, _S.index_value(_n_F_b4,7), (0.5 * _n_fl_b23)])
	var _n_open_b16 = _S.call_value(_n_jaw,[_n_t_b3])
	if _S.truth((_n_open_b16 > 0)):
		_S.invoke(_n_p_b0,"glow",[_n_X_b12, ((_n_Y_b13 + 8) + (_n_open_b16 * 0.5)), (4 + (_n_open_b16 * 2)), _S.index_value(_n_F_b4,5), (0.25 * _n_open_b16)])
	if true:
		var _n_i_b24 = 0
		while _S.truth((_n_i_b24 < 9)):
			var _n_r_b25 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),_n_i_b24,21])
			var _n_born_b26 = (1.98 + (_n_i_b24 * 0.03))
			var _n_age_b27 = _S.call_value(_n_wrap,[(_n_t_b3 - _n_born_b26), _n_D])
			var _n_L_b28 = _S.invoke(_n_r_b25,"range",[0.25, 0.45])
			if _S.truth((_n_age_b27 >= _n_L_b28)):
				_n_i_b24 += 1.0
				continue
			var _n_S0_b29 = _S.call_value(_n_at,[_n_born_b26, _S.named_value(_n_o_b2,"hover")])
			var _tuple_2 = _S.call_value(_n_fly,[(_S.named_value(_n_S0_b29,"x") + _S.invoke(_n_r_b25,"range",[(-3), 3])), (_S.named_value(_n_S0_b29,"y") + 11), _S.invoke(_n_r_b25,"range",[(-22), 22]), _S.invoke(_n_r_b25,"range",[40, 75]), _n_age_b27, (-70), 3.5])
			var _n_x_b30 = _S.prop(_tuple_2,0)
			var _n_y_b31 = _S.prop(_tuple_2,1)
			_S.call_value(_n_firePuff,[_n_p_b0, _n_x_b30, _n_y_b31, (1 - (float(_n_age_b27)/_n_L_b28)), _S.invoke(_n_r_b25,"range",[1.1, 2]), (_S.invoke(_n_r_b25,"next",[]) * 100), _n_heat_b5])
			_n_i_b24 += 1.0
	if true:
		var _n_li_b32 = 0
		while _S.truth((_n_li_b32 < 4)):
			for _iter_3 in _S.array(_n_tongues_b11):
				var _n_f_b33 = _iter_3
				if _S.truth(_S.named_value(_n_f_b33,"front")):
					_S.call_value(_n_tongue,[_n_p_b0, (_n_X_b12 + _S.named_value(_n_f_b33,"x")), ((_n_Y_b13 + _S.call_value(_n_topY,[_S.named_value(_n_f_b33,"x")])) + 1.5), (_S.call_value(_n_height,[_n_f_b33, _n_t_b3, _n_k_b8]) * (1 + _n_stretch_b10)), _S.named_value(_n_f_b33,"w"), (_S.call_value(_n_lick_b14,[_n_f_b33]) * 0.6), _n_t_b3, _n_D, _S.named_value(_n_f_b33,"n"), _n_heat_b5, _n_li_b32])
			_n_li_b32 += 1.0
	_S.call_value(_n_particles,[_n_p_b0, _n_t_b3, _n_o_b2, _n_heat_b5, _n_F_b4, false])
	var _n_br_b17 = (0.92 + (0.08 * sin((((float(_n_t_b3)/_n_D) * _n_TAU) * 2))))
	_S.invoke(_n_p_b0,"glow",[(_n_X_b12 + (_n_lean_b9 * 4)), (_n_Y_b13 - 20), ((74 * _n_br_b17) * (0.9 + (0.1 * _n_k_b8))), _S.ColorFX.mix(_S.index_value(_n_F_b4,4),_S.index_value(_n_F_b4,5),0.5), (0.48 * _n_k_b8)])
	_S.invoke(_n_p_b0,"glow",[_n_X_b12, (_n_Y_b13 - 21), 24, _S.index_value(_n_F_b4,6), (0.3 * _n_k_b8)])
	_S.invoke(_n_p_b0,"glow",[_n_X_b12, (_n_Y_b13 - 15), 9, _S.index_value(_n_F_b4,8), (0.16 * _n_k_b8)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (absf(_S.named_value(_n_b_b1,"x")) - absf(_S.named_value(_n_a_b0,"x")))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_lean = _S.read(_parent,"lean")
	var _n_height = _S.read(_parent,"height")
	var _n_k = _S.read(_parent,"k")
	var _n_f_b0 = _S.arg(_args,0)
	return (((_S.call_value(_n_lnoise,[_n_t, _n_D, 5, _S.named_value(_n_f_b0,"n"), 40]) * 2) + ((_n_lean * _S.call_value(_n_height,[_n_f_b0, _n_t, _n_k])) * 0.9)) - clampf((_S.named_value(_n_f_b0,"x") * 0.25),(-2),2))
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_SWARM = _S.read(_parent,"SWARM")
	var _n_D = _S.read(_parent,"D")
	var _n_cycle = _S.read(_parent,"cycle")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_heat_b3 = _S.arg(_args,3)
	var _n_F_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _n_sw_b6 = _S.invoke(_n_SWARM,"begin",[_n_t_b1])
	_S.set_prop(_S.named_value(_n_sw_b6,"ps"),"sparks",[_S.index_value(_n_F_b4,7), _S.index_value(_n_F_b4,6), _S.index_value(_n_F_b4,4), _S.index_value(_n_F_b4,2)],"=")
	if _S.truth(_n_back_b5):
		_S.call_value(_n_cycle,[_n_t_b1, _n_D, 15, ((_S.named_value(_n_o_b2,"seed") * 7) + 1), _S.function_value(_S.capture(_parent,{"this":_this}),"_f15"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"o":_n_o_b2,"sw":_n_sw_b6,"F":_n_F_b4,"this":_this}),"_f16")])
		_S.invoke(_n_sw_b6,"draw",[_n_p_b0])
		return null
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 40, ((_S.named_value(_n_o_b2,"seed") * 7) + 2), _S.function_value(_S.capture(_parent,{"this":_this}),"_f17"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"o":_n_o_b2,"p":_n_p_b0,"heat":_n_heat_b3,"this":_this}),"_f18")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 18, ((_S.named_value(_n_o_b2,"seed") * 7) + 3), 0.26, _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"o":_n_o_b2,"p":_n_p_b0,"heat":_n_heat_b3,"this":_this}),"_f19")])
	_S.call_value(_n_cycle,[_n_t_b1, _n_D, 24, ((_S.named_value(_n_o_b2,"seed") * 7) + 4), _S.function_value(_S.capture(_parent,{"this":_this}),"_f20"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"o":_n_o_b2,"sw":_n_sw_b6,"F":_n_F_b4,"this":_this}),"_f21")])
	if _S.truth(_S.named_value(_n_o_b2,"floor")):
		_S.call_value(_n_cycle,[_n_t_b1, _n_D, 5, ((_S.named_value(_n_o_b2,"seed") * 7) + 5), _S.function_value(_S.capture(_parent,{"this":_this}),"_f22"), _S.function_value(_S.capture(_parent,{"t":_n_t_b1,"o":_n_o_b2,"sw":_n_sw_b6,"this":_this}),"_f23")])
	_S.invoke(_n_sw_b6,"draw",[_n_p_b0])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1.7, 2.5])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_fly = _S.read(_parent,"fly")
	var _n_sw = _S.read(_parent,"sw")
	var _n_P = _S.read(_parent,"P")
	var _n_hex = _S.read(_parent,"hex")
	var _n_F = _S.read(_parent,"F")
	var _n_PF = _S.read(_parent,"PF")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_x0_b4 = (_S.named_value(_n_S0_b3,"x") + _S.invoke(_n_r_b2,"range",[(-6), 6]))
	var _n_y0_b5 = ((_S.named_value(_n_S0_b3,"y") - 22) - _S.invoke(_n_r_b2,"range",[0, 8]))
	var _tuple_0 = _S.call_value(_n_fly,[_n_x0_b4, _n_y0_b5, _S.invoke(_n_r_b2,"range",[(-5), 5]), (-_S.invoke(_n_r_b2,"range",[16, 26])), _n_age_b0, (-12), 1.2])
	var _n_x_b6 = _S.prop(_tuple_0,0)
	var _n_y_b7 = _S.prop(_tuple_0,1)
	_S.invoke(_n_sw,"add",[_S.named_value(_n_P,"SMOKE"), (_n_x_b6 + ((sin(((_n_age_b0 * 1.3) + (_S.invoke(_n_r_b2,"next",[]) * 6))) * 3) * _n_age_b0)), _n_y_b7, 0, 0, _n_age_b0, _n_L_b1, _S.ColorFX.mix(_S.call_value(_n_hex,["#5b5566"]),_S.index_value(_n_F,2),0.3), _S.invoke(_n_r_b2,"range",[2.8, 4.4]), _S.named_value(_n_PF,"BIG")])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.18, 0.36])
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_fly = _S.read(_parent,"fly")
	var _n_p = _S.read(_parent,"p")
	var _n_heat = _S.read(_parent,"heat")
	var _n_firePuff = _S.read(_parent,"firePuff")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_side_b4 = _S.invoke(_n_r_b2,"chance",[0.3])
	var _n_a_b5 = ((_S.invoke(_n_r_b2,"sign",[]) * _S.invoke(_n_r_b2,"range",[0.9, 1.45])) if _S.truth(_n_side_b4) else _S.invoke(_n_r_b2,"range",[(-0.8), 0.8]))
	var _n_x0_b6 = (_S.named_value(_n_S0_b3,"x") + (sin(_n_a_b5) * 10.5))
	var _n_y0_b7 = (((_S.named_value(_n_S0_b3,"y") - 6) - (cos(_n_a_b5) * 10)) - (0 if _S.truth(_n_side_b4) else _S.invoke(_n_r_b2,"range",[2, 10])))
	var _tuple_0 = _S.call_value(_n_fly,[_n_x0_b6, _n_y0_b7, (_S.invoke(_n_r_b2,"range",[(-6), 6]) + (sin(_n_a_b5) * 6)), (-_S.invoke(_n_r_b2,"range",[18, 34])), _n_age_b0, (-95), 3.2])
	var _n_x_b8 = _S.prop(_tuple_0,0)
	var _n_y_b9 = _S.prop(_tuple_0,1)
	_S.call_value(_n_firePuff,[_n_p, (_n_x_b8 + (sin(((_n_age_b0 * 17) + (_S.invoke(_n_r_b2,"next",[]) * 6))) * 0.8)), _n_y_b9, (1 - (float(_n_age_b0)/_n_L_b1)), _S.invoke(_n_r_b2,"range",[1, 2.2]), (_S.invoke(_n_r_b2,"next",[]) * 100), _n_heat])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_topY = _S.read(_parent,"topY")
	var _n_p = _S.read(_parent,"p")
	var _n_heat = _S.read(_parent,"heat")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_fx_b4 = _S.invoke(_n_r_b2,"range",[(-10), 10])
	var _n_x0_b5 = (_S.named_value(_n_S0_b3,"x") + _n_fx_b4)
	var _n_y0_b6 = ((_S.named_value(_n_S0_b3,"y") + _S.call_value(_n_topY,[_n_fx_b4])) - (_S.invoke(_n_r_b2,"range",[4, 16]) * (1 - (float(absf(_n_fx_b4))/14))))
	var _n_kk_b7 = (1 - (float(_n_age_b0)/_n_L_b1))
	var _n_x_b8 = (_n_x0_b5 + (_S.invoke(_n_r_b2,"range",[(-3), 3]) * _n_age_b0))
	var _n_y_b9 = (_n_y0_b6 - (_S.invoke(_n_r_b2,"range",[12, 20]) * _n_age_b0))
	var _n_rr_b10 = (_S.invoke(_n_r_b2,"range",[0.9, 1.7]) * (0.4 + (0.6 * _n_kk_b7)))
	_S.invoke(_n_p,"circle",[_n_x_b8, _n_y_b9, (_n_rr_b10 + 0.6), (_S.index_value(_n_heat,5) if _S.truth((_n_kk_b7 > 0.5)) else _S.index_value(_n_heat,6))])
	if _S.truth((_n_kk_b7 > 0.35)):
		_S.invoke(_n_p,"circle",[_n_x_b8, (_n_y_b9 - 0.3), (_n_rr_b10 * 0.6), (_S.index_value(_n_heat,2) if _S.truth((_n_kk_b7 > 0.7)) else _S.index_value(_n_heat,4))])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[1, 2.4])
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_fly = _S.read(_parent,"fly")
	var _n_sw = _S.read(_parent,"sw")
	var _n_P = _S.read(_parent,"P")
	var _n_F = _S.read(_parent,"F")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_x0_b4 = (_S.named_value(_n_S0_b3,"x") + _S.invoke(_n_r_b2,"range",[(-11), 11]))
	var _n_y0_b5 = (_S.named_value(_n_S0_b3,"y") - _S.invoke(_n_r_b2,"range",[6, 24]))
	var _n_s_b6 = (_S.invoke(_n_r_b2,"next",[]) * 100)
	var _tuple_0 = _S.call_value(_n_fly,[_n_x0_b4, _n_y0_b5, _S.invoke(_n_r_b2,"range",[(-22), 22]), (-_S.invoke(_n_r_b2,"range",[25, 70])), _n_age_b0, (-20), 1.6])
	var _n_x_b7 = _S.prop(_tuple_0,0)
	var _n_y_b8 = _S.prop(_tuple_0,1)
	_S.invoke(_n_sw,"add",[_S.named_value(_n_P,"EMBER"), (_n_x_b7 + ((sin(((_n_age_b0 * 2.3) + _n_s_b6)) * 4) * minf(1,_n_age_b0))), _n_y_b8, 0, 0, _n_age_b0, _n_L_b1, _S.index_value(_n_F,4), (2 if _S.truth(_S.invoke(_n_r_b2,"chance",[0.3])) else 1), 0, _n_s_b6])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_r_b0 = _S.arg(_args,0)
	return _S.invoke(_n_r_b0,"range",[0.9, 1.4])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_at = _S.read(_parent,"at")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_wrap = _S.read(_parent,"wrap")
	var _n_o = _S.read(_parent,"o")
	var _n_bounce = _S.read(_parent,"bounce")
	var _n_sw = _S.read(_parent,"sw")
	var _n_P = _S.read(_parent,"P")
	var _n_age_b0 = _S.arg(_args,0)
	var _n_L_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_S0_b3 = _S.call_value(_n_at,[_S.call_value(_n_wrap,[(_n_t - _n_age_b0), _n_D]), _S.named_value(_n_o,"hover")])
	var _n_b_b4 = _S.call_value(_n_bounce,[(_S.named_value(_n_S0_b3,"x") + _S.invoke(_n_r_b2,"range",[(-6), 6])), (_S.named_value(_n_S0_b3,"y") - _S.invoke(_n_r_b2,"range",[10, 18])), _S.invoke(_n_r_b2,"range",[(-28), 28]), (-_S.invoke(_n_r_b2,"range",[50, 110])), _n_age_b0, 430, (-0.5), 0.42])
	_S.invoke(_n_sw,"add",[_S.named_value(_n_P,"SPARK"), _S.named_value(_n_b_b4,"x"), _S.named_value(_n_b_b4,"y"), (0.1 if _S.truth(_S.named_value(_n_b_b4,"rest")) else _S.named_value(_n_b_b4,"vx")), (0 if _S.truth(_S.named_value(_n_b_b4,"rest")) else _S.named_value(_n_b_b4,"vy")), _n_age_b0, _n_L_b1, 0, 1, 0, (_S.invoke(_n_r_b2,"next",[]) * 100)])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_shift = _S.read(_parent,"shift")
	var _n_at = _S.read(_parent,"at")
	var _n_flick = _S.read(_parent,"flick")
	var _n_hex = _S.read(_parent,"hex")
	var _n_shadow = _S.read(_parent,"shadow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_time_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	if _S.truth(not _S.truth(_S.named_value(_n_o_b2,"floor"))):
		return null
	var _n_t_b3 = _S.call_value(_n_shift,[_n_time_b1, _n_D, _S.named_value(_n_o_b2,"seed")])
	var _n_F_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),9)
	var _n_S_b5 = _S.call_value(_n_at,[_n_t_b3, _S.named_value(_n_o_b2,"hover")])
	var _n_k_b6 = _S.call_value(_n_flick,[_n_t_b3])
	_S.call_value(_n_shadow,[_n_p_b0, _S.named_value(_n_S_b5,"x"), 0, 9, 1.6, _S.call_value(_n_hex,["#0d0a12"]), 0.6])
	if true:
		var _n_x_b7 = (-30)
		while _S.truth((_n_x_b7 <= 30)):
			_S.invoke(_n_p_b0,"glow",[(_S.named_value(_n_S_b5,"x") + _n_x_b7), (-1), 20, _S.ColorFX.mix(_S.index_value(_n_F_b4,4),_S.index_value(_n_F_b4,5),0.5), ((0.15 * _n_k_b6) * (1 - (float(absf(_n_x_b7))/40)))])
			_n_x_b7 += 6
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.arg(_args,1)
	var _n_b_b2 = _S.arg(_args,2)
	return (0 if _S.truth(((_n_t_b0 <= _n_a_b1) if _S.truth((_n_t_b0 <= _n_a_b1)) else (_n_t_b0 >= _n_b_b2))) else pow(sin((PI * (float((_n_t_b0 - _n_a_b1))/(_n_b_b2 - _n_a_b1)))),0.5))
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_lnoise = _S.read(_parent,"lnoise")
	var _n_t_b0 = _S.arg(_args,0)
	return ((0.74 + (0.16 * _S.call_value(_n_lnoise,[_n_t_b0, _n_D, 18, 0, 1]))) + (0.1 * _S.call_value(_n_lnoise,[_n_t_b0, _n_D, 46, 0, 2])))
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((pow((float(_n_x_b0)/11),2) + pow((float((_n_y_b1 + 6))/10.5),2)) <= 1)
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((absf(_n_x_b0) <= _S.numeric_lerp(10.2,7.2,(float((_n_y_b1 + 3))/9.5))) if _S.truth(((_n_y_b1 <= 6.5) if _S.truth((_n_y_b1 >= (-3))) else (_n_y_b1 >= (-3)))) else ((_n_y_b1 <= 6.5) if _S.truth((_n_y_b1 >= (-3))) else (_n_y_b1 >= (-3))))
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_inCranium = _S.read(_parent,"inCranium")
	var _n_inFace = _S.read(_parent,"inFace")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.logical("||",_S.call_value(_n_inCranium,[_n_x_b0, _n_y_b1]),func():return _S.call_value(_n_inFace,[_n_x_b0, _n_y_b1]))
	return null

static func _f30(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return ((-6.6) + ((8.5 - absf(_n_x_b0)) * 0.3))
	return null

static func _f31(_parent,_args:Array,_this=null):
	var _n_browY = _S.read(_parent,"browY")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.logical("&&",((pow((float((absf(_n_x_b0) - 5.1))/3.3),2) + pow((float((_n_y_b1 + 2.9))/3.3),2)) <= 1),func():return (_n_y_b1 > _S.call_value(_n_browY,[_n_x_b0])))
	return null

static func _f32(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	return ((-6) - (10.5 * sqrt(maxf(0,(1 - pow((float(_n_x_b0)/11),2))))))
	return null
