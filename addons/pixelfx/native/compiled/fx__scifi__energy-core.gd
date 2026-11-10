@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/energy-core.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "forks", _S.import_value("core/index.js", "forks"))
	_S.define(_e, "tileFbm", _S.import_value("core/index.js", "tileFbm"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "strokeArc", _S.import_value("fx/scifi/_lib.js", "strokeArc"))
	_S.define(_e, "ringPt", _S.function_value(_e, "_f0"))
	_S.define(_e, "setup", _S.function_value(_e, "_f1"))
	_S.define(_e, "plinth", _S.function_value(_e, "_f5"))
	_S.define(_e, "barDraw", _S.function_value(_e, "_f7"))
	_S.define(_e, "hoop", _S.function_value(_e, "_f8"))
	_S.define(_e, "core", _S.function_value(_e, "_f9"))
	_S.define(_e, "ring", _S.function_value(_e, "_f13"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Energy core"}, {"desc": "A plasma core beating in a steel cage: it swells and throws a shock ring on each beat, two tilted rings orbit it, and arcs jump to the bars and spark."}, {"tags": ["scifi", "reactor", "core", "power", "plasma", "machine", "prop", "ground", "loop"]}, {"size": [112, 100]}, {"origin": [56, 88]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0516", "#3d0a33", "#701560", "#b0228f", "#f53cd1", "#ff86e6", "#ffd2f6", "#ffffff"]}, {"metal": ["#0e0d14", "#1e1c27", "#312e3e", "#4b4759", "#6f6a82", "#9d98b0"]}, {"seed": 35}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "CY", _S.unary("-", 36))
	_S.define(_e, "R0", 11)
	_S.define(_e, "RC", 24)
	_S.define(_e, "TOPY", _S.unary("-", 64))
	_S.define(_e, "BOTY", _S.unary("-", 9))
	_S.define(_e, "SLOT", 0.1)
	_S.define(_e, "NS", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("/", _S.read(_e, "D"), _S.read(_e, "SLOT"))]))
	_S.define(_e, "BEATS", [[0.05, 1, true], [0.25, 0.5, false], [1.25, 1, true], [1.45, 0.5, false]])
	_S.define(_e, "env", _S.function_value(_e, "_f17"))
	_S.define(_e, "pulseAt", _S.function_value(_e, "_f18"))
	_S.define(_e, "BARS", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 6}]), _S.function_value(_e, "_f20")]))
	_S.define(_e, "RINGS", [_S.merge([{"r": 17}, {"tilt": 1.15}, {"spin": _S.function_value(_e, "_f21")}]), _S.merge([{"r": 19}, {"tilt": _S.unary("-", 0.9)}, {"spin": _S.function_value(_e, "_f22")}])])
	_S.define(_e, "cache", _S.construct(_S.read(_e, "Map"), []))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_r_b0 = _S.arg(_args,0)
	var _n_tilt_b1 = _S.arg(_args,1)
	var _n_spin_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	var _n_x_b4 = (_n_r_b0 * cos(_n_a_b3))
	var _n_z0_b5 = (_n_r_b0 * sin(_n_a_b3))
	var _n_y_b6 = ((-_n_z0_b5) * sin(_n_tilt_b1))
	var _n_z_b7 = (_n_z0_b5 * cos(_n_tilt_b1))
	return [((_n_x_b4 * cos(_n_spin_b2)) + (_n_z_b7 * sin(_n_spin_b2))), (_n_CY - _n_y_b6), (((-_n_x_b4) * sin(_n_spin_b2)) + (_n_z_b7 * cos(_n_spin_b2)))]
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_cache = _S.read(_parent,"cache")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SLOT = _S.read(_parent,"SLOT")
	var _n_BEATS = _S.read(_parent,"BEATS")
	var _n_BARS = _S.read(_parent,"BARS")
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_BOTY = _S.read(_parent,"BOTY")
	var _n_CY = _S.read(_parent,"CY")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_forks = _S.read(_parent,"forks")
	var _n_P = _S.read(_parent,"P")
	var _n_NS = _S.read(_parent,"NS")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_key_b1 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + "")
	if _S.truth(_S.invoke(_n_cache,"has",[_n_key_b1])):
		return _S.invoke(_n_cache,"get",[_n_key_b1])
	var _n_C_b2 = _S.ColorFX.fit(_S.named_value(_n_o_b0,"palette"),8)
	var _n_rn_b3 = _S.construct(_n_Rng,[_S.named_value(_n_o_b0,"seed")])
	var _n_g_b4 = _S.construct(_n_Ghosts,[_n_D, {"ground":_S.function_value(_S.capture(_parent,{"this":_this}),"_f2"),"sparks":[_n_WHITE, _S.index_value(_n_C_b2,6), _S.index_value(_n_C_b2,5), _S.index_value(_n_C_b2,4)],"haze":_S.index_value(_n_C_b2,5),"box":[(-54), (-98), 54, 11]}])
	var _n_arcs_b5 = []
	if true:
		var _n_s_b7 = 0
		while _S.truth((_n_s_b7 < _n_NS)):
			var _n_ts_b8 = (_n_s_b7 * _n_SLOT)
			var _n_hot_b9 = _S.invoke(_n_BEATS,"some",[_S.function_value(_S.capture(_parent,{"ts":_n_ts_b8,"this":_this}),"_f3")])
			if true:
				var _n_n_b10 = 0
				while _S.truth((_n_n_b10 < (2 if _S.truth(_n_hot_b9) else 1))):
					if _S.truth((not _S.truth(_S.invoke(_n_rn_b3,"chance",[0.4])) if _S.truth(not _S.truth(_n_hot_b9)) else not _S.truth(_n_hot_b9))):
						_n_n_b10 += 1.0
						continue
					var _n_bar_b11 = _S.invoke(_n_rn_b3,"pick",[_S.invoke(_n_BARS,"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f4")])])
					var _n_ty_b12 = _S.invoke(_n_rn_b3,"range",[(_n_TOPY + 8), (_n_BOTY - 6)])
					var _n_ang_b13 = atan2((_n_ty_b12 - _n_CY),_S.named_value(_n_bar_b11,"x"))
					var _n_sx_b14 = (cos(_n_ang_b13) * _n_R0)
					var _n_sy_b15 = (_n_CY + (sin(_n_ang_b13) * _n_R0))
					var _n_path_b16 = _S.call_value(_n_bolt,[_n_rn_b3, _n_sx_b14, _n_sy_b15, (_S.named_value(_n_bar_b11,"x") - (signf(_S.named_value(_n_bar_b11,"x")) * 1.5)), _n_ty_b12, {"jag":0.3,"depth":4}])
					_S.invoke(_n_arcs_b5,"push",[{"s":_n_s_b7,"path":_n_path_b16,"fk":_S.call_value(_n_forks,[_n_rn_b3, _n_path_b16, {"count":_S.invoke(_n_rn_b3,"int",[0, 1]),"len":7,"jag":0.35}])}])
					if true:
						var _n_i_b17 = 0
						while _S.truth((_n_i_b17 < 5)):
							var _n_a_b18 = ((atan2((_n_ty_b12 - _n_sy_b15),(_S.named_value(_n_bar_b11,"x") - _n_sx_b14)) + PI) + _S.invoke(_n_rn_b3,"range",[(-1.2), 1.2]))
							var _n_sp_b19 = _S.invoke(_n_rn_b3,"range",[60, 170])
							_S.invoke(_n_g_b4,"add",[_n_ts_b8, _S.named_value(_n_P,"SPARK"), _S.named_value(_n_bar_b11,"x"), _n_ty_b12, (cos(_n_a_b18) * _n_sp_b19), ((sin(_n_a_b18) * _n_sp_b19) - 40), _S.invoke(_n_rn_b3,"range",[0.2, 0.5])])
							_n_i_b17 += 1.0
					_n_n_b10 += 1.0
			_n_s_b7 += 1.0
	for _iter_0 in _S.array(_n_BEATS):
		var _tuple_1 = _iter_0
		var _n_b_b20 = _S.prop(_tuple_1,0)
		var _n_strong_b21 = _S.prop(_tuple_1,2)
		if _S.truth(not _S.truth(_n_strong_b21)):
			continue
		if true:
			var _n_i_b22 = 0
			while _S.truth((_n_i_b22 < 12)):
				var _n_a_b23 = _S.invoke(_n_rn_b3,"range",[0, _n_TAU])
				var _n_sp_b24 = _S.invoke(_n_rn_b3,"range",[40, 110])
				_S.invoke(_n_g_b4,"add",[(_n_b_b20 + 0.02), _S.named_value(_n_P,"MOTE"), (cos(_n_a_b23) * _n_R0), (_n_CY + (sin(_n_a_b23) * _n_R0)), (cos(_n_a_b23) * _n_sp_b24), (sin(_n_a_b23) * _n_sp_b24), _S.invoke(_n_rn_b3,"range",[0.25, 0.5]), _S.invoke(_n_rn_b3,"pick",[[_n_WHITE, _S.index_value(_n_C_b2,6), _S.index_value(_n_C_b2,5)]]), 0.7])
				_n_i_b22 += 1.0
	var _n_v_b6 = {"C":_n_C_b2,"arcs":_n_arcs_b5,"g":_n_g_b4}
	_S.invoke(_n_cache,"set",[_n_key_b1, _n_v_b6])
	return _n_v_b6
	return null

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ts = _S.read(_parent,"ts")
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _tuple_0 = _S.arg(_args,0)
	var _n_b_b0 = _S.prop(_tuple_0,0)
	var _n_strong_b1 = _S.prop(_tuple_0,2)
	return ((_S.call_value(_n_since,[_n_ts, _n_b_b0, _n_D]) < 0.16) if _S.truth(_n_strong_b1) else _n_strong_b1)
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	return (_S.named_value(_n_b_b0,"z") > (-0.2))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_H_b2 = _S.arg(_args,2)
	var _n_t_b3 = _S.arg(_args,3)
	var _n_pulse_b4 = _S.arg(_args,4)
	_S.invoke(_n_p_b0,"shade",[(-30), (-10), 30, 2, _S.function_value(_S.capture(_parent,{"H":_n_H_b2,"this":_this}),"_f6")])
	if true:
		var _n_i_b5 = 0
		while _S.truth((_n_i_b5 < 7)):
			var _n_x_b6 = ((-18) + (_n_i_b5 * 6))
			var _n_k_b7 = (0.5 + (0.5 * cos((_n_TAU * ((2 * (float(_n_t_b3)/_n_D)) - (float(_n_i_b5)/7))))))
			_S.invoke(_n_p_b0,"px",[_n_x_b6, (-3), (_n_WHITE if _S.truth((_n_k_b7 > 0.75)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_k_b7 > 0.4)) else _S.index_value(_n_C_b1,2)))])
			if _S.truth((_n_k_b7 > 0.6)):
				_S.invoke(_n_p_b0,"glow",[_n_x_b6, (-3), 4, _S.index_value(_n_C_b1,4), (0.3 * _n_k_b7)])
			_n_i_b5 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, (-8), 26, _S.index_value(_n_C_b1,4), (0.25 + (0.3 * _n_pulse_b4))])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_top_b3 = ((pow((float(_n_x_b0)/29),2) + pow((float((_n_y_b1 + 7))/4),2)) <= 1)
	var _n_side_b4 = _S.logical("&&",_S.logical("&&",(absf(_n_x_b0) <= 29),func():return (_n_y_b1 > (-7))),func():return (_n_y_b1 <= 0))
	if _S.truth((not _S.truth(_n_side_b4) if _S.truth(not _S.truth(_n_top_b3)) else not _S.truth(_n_top_b3))):
		return null
	if _S.truth(_n_top_b3):
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth(((pow((float(_n_x_b0)/29),2) + pow((float((_n_y_b1 + 7))/4),2)) > 0.82)) else (_S.index_value(_n_H,5) if _S.truth((_n_y_b1 < (-8))) else (_S.index_value(_n_H,4) if _S.truth((_n_x_b0 < 0)) else _S.index_value(_n_H,3)))),"=")
	else:
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth(_S.logical("||",(absf(_n_x_b0) > 28),func():return _S.binary("===",_n_y_b1,0))) else (_S.index_value(_n_H,4) if _S.truth(_S.binary("===",_n_y_b1,(-6))) else (_S.index_value(_n_H,3) if _S.truth((_n_x_b0 < (-14))) else (_S.index_value(_n_H,1) if _S.truth((_n_x_b0 > 14)) else _S.index_value(_n_H,2))))),"=")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_BOTY = _S.read(_parent,"BOTY")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_pulse_b4 = _S.arg(_args,4)
	var _n_back_b5 = _S.arg(_args,5)
	var _n_lit_b6 = (_S.index_value(_n_C_b2,3) if _S.truth(_n_back_b5) else (_S.index_value(_n_C_b2,6) if _S.truth((_n_pulse_b4 > 0.5)) else _S.index_value(_n_C_b2,5)))
	var _n_inward_b7 = (-signf(_S.named_value(_n_b_b1,"x")))
	if true:
		var _n_y_b8 = (_n_TOPY + 2)
		while _S.truth((_n_y_b8 < _n_BOTY)):
			if true:
				var _n_i_b9 = (-1)
				while _S.truth((_n_i_b9 <= 1)):
					var _n_face_b10 = _S.binary("===",_n_i_b9,_n_inward_b7)
					_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_b_b1,"x") + _n_i_b9), _n_y_b8, ((_n_lit_b6 if _S.truth(_n_face_b10) else _S.index_value(_n_H_b3,1)) if _S.truth(_n_back_b5) else (_n_lit_b6 if _S.truth(_n_face_b10) else (_S.index_value(_n_H_b3,3) if _S.truth(_S.binary("===",_n_i_b9,0)) else _S.index_value(_n_H_b3,1))))])
					_n_i_b9 += 1.0
			_n_y_b8 += 1.0
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_H_b3 = _S.arg(_args,3)
	var _n_C_b4 = _S.arg(_args,4)
	var _n_near_b5 = _S.arg(_args,5)
	var _n_pulse_b6 = _S.arg(_args,6)
	if true:
		var _n_i_b7 = 0
		var _n_n_b8 = ceili((_n_rx_b2 * 8))
		while _S.truth((_n_i_b7 < _n_n_b8)):
			var _n_g_b9 = ((float(_n_i_b7)/_n_n_b8) * _n_TAU)
			var _n_s_b10 = sin(_n_g_b9)
			if _S.truth(_S.binary("!==",(_n_s_b10 >= 0),_n_near_b5)):
				_n_i_b7 += 1.0
				continue
			var _n_x_b11 = (cos(_n_g_b9) * _n_rx_b2)
			var _n_yy_b12 = (_n_y_b1 + (_n_s_b10 * 4))
			_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_yy_b12, ((_S.index_value(_n_H_b3,4) if _S.truth((_n_s_b10 > 0.6)) else _S.index_value(_n_H_b3,3)) if _S.truth(_n_near_b5) else _S.index_value(_n_H_b3,1))])
			_S.invoke(_n_p_b0,"px",[_n_x_b11, (_n_yy_b12 + 1), (_S.index_value(_n_H_b3,1) if _S.truth(_n_near_b5) else _S.index_value(_n_H_b3,0))])
			if _S.truth(((_n_s_b10 < 0.3) if _S.truth(_n_near_b5) else _n_near_b5)):
				_S.invoke(_n_p_b0,"px",[_n_x_b11, (_n_yy_b12 - 1), (_S.index_value(_n_C_b4,5) if _S.truth((_n_pulse_b6 > 0.5)) else _S.index_value(_n_C_b4,3))])
			_n_i_b7 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_CY = _S.read(_parent,"CY")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_R_b3 = _S.arg(_args,3)
	var _n_pulse_b4 = _S.arg(_args,4)
	var _n_seed_b5 = _S.arg(_args,5)
	var _n_ph_b6 = (float(_n_t_b1)/_n_D)
	_S.invoke(_n_p_b0,"shade",[((-_n_R_b3) - 2), ((_n_CY - _n_R_b3) - 2), (_n_R_b3 + 2), ((_n_CY + _n_R_b3) + 2), _S.function_value(_S.capture(_parent,{"R":_n_R_b3,"C":_n_C_b2,"ph":_n_ph_b6,"seed":_n_seed_b5,"pulse":_n_pulse_b4,"this":_this}),"_f10")])
	var _n_f_b7 = floori((_n_t_b1 * 15))
	var _n_r_b8 = _S.MathFX.rng([_n_seed_b5,_n_f_b7,5])
	if true:
		var _n_i_b9 = 0
		while _S.truth((_n_i_b9 < 3)):
			var _n_a_b10 = ((((float(_n_i_b9)/3) * _n_TAU) + (_n_f_b7 * 0.7)) + _S.invoke(_n_r_b8,"range",[(-0.4), 0.4]))
			var _n_pts_b11 = _S.call_value(_n_bolt,[_n_r_b8, 0, _n_CY, ((cos(_n_a_b10) * _n_R_b3) * 0.88), (_n_CY + ((sin(_n_a_b10) * _n_R_b3) * 0.88)), {"jag":0.32,"depth":3}])
			_S.invoke(_n_p_b0,"polyline",[_n_pts_b11, _S.function_value(_S.capture(_parent,{"C":_n_C_b2,"this":_this}),"_f11")])
			var _tuple_0 = _S.index_value(_n_pts_b11,(_S.prop(_n_pts_b11,"length") - 1))
			var _n_ex_b12 = _S.prop(_tuple_0,0)
			var _n_ey_b13 = _S.prop(_tuple_0,1)
			_S.invoke(_n_p_b0,"px",[_n_ex_b12, _n_ey_b13, _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_ex_b12, _n_ey_b13, 4, _S.index_value(_n_C_b2,5), 0.4])
			_n_i_b9 += 1.0
	_S.invoke(_n_p_b0,"circle",[0, _n_CY, (1.8 + (_n_pulse_b4 * 2)), _n_WHITE])
	_S.invoke(_n_p_b0,"circle",[0, _n_CY, (3 + (_n_pulse_b4 * 2)), _S.function_value(_S.capture(_parent,{"C":_n_C_b2,"this":_this}),"_f12"), 0.0001])
	_S.invoke(_n_p_b0,"px",[((-_n_R_b3) * 0.45), (_n_CY - (_n_R_b3 * 0.55)), _n_WHITE])
	_S.invoke(_n_p_b0,"px",[(((-_n_R_b3) * 0.45) + 1), (_n_CY - (_n_R_b3 * 0.55)), _S.index_value(_n_C_b2,6)])
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_CY = _S.read(_parent,"CY")
	var _n_R = _S.read(_parent,"R")
	var _n_C = _S.read(_parent,"C")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ph = _S.read(_parent,"ph")
	var _n_seed = _S.read(_parent,"seed")
	var _n_pulse = _S.read(_parent,"pulse")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_dx_b3 = _n_x_b0
	var _n_dy_b4 = (_n_y_b1 - _n_CY)
	var _n_d_b5 = (float(sqrt(((_n_dx_b3 * _n_dx_b3) + (_n_dy_b4 * _n_dy_b4))))/_n_R)
	if _S.truth((_n_d_b5 > 1.1)):
		return null
	if _S.truth((_n_d_b5 > 1)):
		return _S.set_prop(_n_out_b2,"c",_S.index_value(_n_C,2),"=")
	if _S.truth((_n_d_b5 > 0.9)):
		return _S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth(((_n_dx_b3 < (_n_R * 0.3)) if _S.truth((_n_dy_b4 < ((-_n_R) * 0.3))) else (_n_dy_b4 < ((-_n_R) * 0.3)))) else _S.index_value(_n_C,4)),"=")
	var _n_a_b6 = atan2(_n_dy_b4,_n_dx_b3)
	var _n_n_b7 = (0.5 + (0.5 * _S.NoiseKernels.tile_fbm(((((float(_n_a_b6)/_n_TAU) * 6) + (_n_ph * 6)) + (_n_d_b5 * 1.5)),((_n_d_b5 * 2.2) - (_n_ph * 4)),6,4,_n_seed,2)))
	var _n_band_b8 = (absf((_n_n_b7 - 0.5)) < (0.05 + (0.05 * _n_pulse)))
	var _n_heat_b9 = (pow((1 - _n_d_b5),2) + (_n_pulse * 0.45))
	if _S.truth(_n_band_b8):
		_S.set_prop(_n_out_b2,"c",(_n_WHITE if _S.truth((_n_heat_b9 > 0.5)) else (_S.index_value(_n_C,6) if _S.truth((_n_heat_b9 > 0.2)) else _S.index_value(_n_C,5))),"=")
	else:
		_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,6) if _S.truth((_n_heat_b9 > 0.7)) else (_S.index_value(_n_C,5) if _S.truth((_n_heat_b9 > 0.42)) else (_S.index_value(_n_C,3) if _S.truth((_n_heat_b9 > 0.2)) else (_S.index_value(_n_C,2) if _S.truth((_n_n_b7 > 0.5)) else _S.index_value(_n_C,1))))),"=")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.4)) else _S.index_value(_n_C,6))
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_d_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_C,6) if _S.truth((_n_d_b0 > 0.6)) else _n_WHITE)
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_D = _S.read(_parent,"D")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ringPt = _S.read(_parent,"ringPt")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_rg_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_front_b4 = _S.arg(_args,4)
	var _n_pulse_b5 = _S.arg(_args,5)
	var _n_spin_b6 = _S.invoke(_n_rg_b2,"spin",[_n_t_b1])
	var _n_bead_b7 = (((float(_n_t_b1)/_n_D) * _n_TAU) * 3)
	if true:
		var _n_i_b8 = 0
		var _n_n_b9 = ceili((_S.named_value(_n_rg_b2,"r") * 9))
		while _S.truth((_n_i_b8 < _n_n_b9)):
			var _n_a_b10 = ((float(_n_i_b8)/_n_n_b9) * _n_TAU)
			var _tuple_0 = _S.call_value(_n_ringPt,[_S.named_value(_n_rg_b2,"r"), _S.named_value(_n_rg_b2,"tilt"), _n_spin_b6, _n_a_b10])
			var _n_x_b11 = _S.prop(_tuple_0,0)
			var _n_y_b12 = _S.prop(_tuple_0,1)
			var _n_z_b13 = _S.prop(_tuple_0,2)
			if _S.truth(_S.binary("!==",(_n_z_b13 >= 0),_n_front_b4)):
				_n_i_b8 += 1.0
				continue
			var _n_u_b14 = fmod((fmod((float((_n_a_b10 - _n_bead_b7))/_n_TAU),1) + 1),1)
			var _n_head_b15 = (_n_u_b14 > 0.9)
			_S.invoke(_n_p_b0,"px",[_n_x_b11, _n_y_b12, (_n_WHITE if _S.truth(_n_head_b15) else (_S.index_value(_n_C_b3,3) if _S.truth(not _S.truth(_n_front_b4)) else (_S.index_value(_n_C_b3,6) if _S.truth(((_n_z_b13 > (0.5 * _S.named_value(_n_rg_b2,"r"))) if _S.truth((_n_z_b13 > (0.5 * _S.named_value(_n_rg_b2,"r")))) else (_n_pulse_b5 > 0.6))) else _S.index_value(_n_C_b3,5))))])
			_n_i_b8 += 1.0
	if _S.truth(_n_front_b4):
		var _tuple_1 = _S.call_value(_n_ringPt,[_S.named_value(_n_rg_b2,"r"), _S.named_value(_n_rg_b2,"tilt"), _n_spin_b6, _n_bead_b7])
		var _n_x_b16 = _S.prop(_tuple_1,0)
		var _n_y_b17 = _S.prop(_tuple_1,1)
		_S.invoke(_n_p_b0,"glow",[_n_x_b16, _n_y_b17, 6, _S.index_value(_n_C_b3,5), 0.5])
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_pulseAt = _S.read(_parent,"pulseAt")
	var _n_hoop = _S.read(_parent,"hoop")
	var _n_BOTY = _S.read(_parent,"BOTY")
	var _n_RC = _S.read(_parent,"RC")
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_barDraw = _S.read(_parent,"barDraw")
	var _n_BARS = _S.read(_parent,"BARS")
	var _n_ring = _S.read(_parent,"ring")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_H_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),6)
	var _n_pulse_b5 = _S.call_value(_n_pulseAt,[_n_t_b1])
	_S.call_value(_n_hoop,[_n_p_b0, _n_BOTY, _n_RC, _n_H_b4, _n_C_b3, false, _n_pulse_b5])
	_S.call_value(_n_hoop,[_n_p_b0, _n_TOPY, _n_RC, _n_H_b4, _n_C_b3, false, _n_pulse_b5])
	for _iter_0 in _S.array(_n_BARS):
		var _n_b_b6 = _iter_0
		if _S.truth((_S.named_value(_n_b_b6,"z") < 0)):
			_S.call_value(_n_barDraw,[_n_p_b0, _n_b_b6, _n_C_b3, _n_H_b4, _n_pulse_b5, true])
	for _iter_1 in _S.array(_n_RINGS):
		var _n_rg_b7 = _iter_1
		_S.call_value(_n_ring,[_n_p_b0, _n_t_b1, _n_rg_b7, _n_C_b3, false, _n_pulse_b5])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_setup = _S.read(_parent,"setup")
	var _n_pulseAt = _S.read(_parent,"pulseAt")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_plinth = _S.read(_parent,"plinth")
	var _n_core = _S.read(_parent,"core")
	var _n_ring = _S.read(_parent,"ring")
	var _n_RINGS = _S.read(_parent,"RINGS")
	var _n_barDraw = _S.read(_parent,"barDraw")
	var _n_BARS = _S.read(_parent,"BARS")
	var _n_hoop = _S.read(_parent,"hoop")
	var _n_BOTY = _S.read(_parent,"BOTY")
	var _n_RC = _S.read(_parent,"RC")
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_SLOT = _S.read(_parent,"SLOT")
	var _n_NS = _S.read(_parent,"NS")
	var _n_strokeArc = _S.read(_parent,"strokeArc")
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _n_ease = _S.read(_parent,"ease")
	var _n_CY = _S.read(_parent,"CY")
	var _n_BEATS = _S.read(_parent,"BEATS")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _object_0 = _S.call_value(_n_setup,[_n_o_b2])
	var _n_C_b3 = _S.named_value(_object_0,"C")
	var _n_arcs_b4 = _S.named_value(_object_0,"arcs")
	var _n_g_b5 = _S.named_value(_object_0,"g")
	var _n_H_b6 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"metal"),6)
	var _n_pulse_b7 = _S.call_value(_n_pulseAt,[_n_t_b1])
	var _n_R_b8 = (_n_R0 * (1 + (0.14 * _n_pulse_b7)))
	_S.call_value(_n_plinth,[_n_p_b0, _n_C_b3, _n_H_b6, _n_t_b1, _n_pulse_b7])
	_S.call_value(_n_core,[_n_p_b0, _n_t_b1, _n_C_b3, _n_R_b8, _n_pulse_b7, _S.named_value(_n_o_b2,"seed")])
	for _iter_1 in _S.array(_n_RINGS):
		var _n_rg_b11 = _iter_1
		_S.call_value(_n_ring,[_n_p_b0, _n_t_b1, _n_rg_b11, _n_C_b3, true, _n_pulse_b7])
	for _iter_2 in _S.array(_n_BARS):
		var _n_b_b12 = _iter_2
		if _S.truth((_S.named_value(_n_b_b12,"z") >= 0)):
			_S.call_value(_n_barDraw,[_n_p_b0, _n_b_b12, _n_C_b3, _n_H_b6, _n_pulse_b7, false])
	_S.call_value(_n_hoop,[_n_p_b0, _n_BOTY, _n_RC, _n_H_b6, _n_C_b3, true, _n_pulse_b7])
	_S.call_value(_n_hoop,[_n_p_b0, _n_TOPY, _n_RC, _n_H_b6, _n_C_b3, true, _n_pulse_b7])
	_S.invoke(_n_p_b0,"shade",[(-15), (_n_TOPY - 7), 15, _n_TOPY, _S.function_value(_S.capture(_parent,{"H":_n_H_b6,"this":_this}),"_f16")])
	_S.invoke(_n_p_b0,"px",[0, (_n_TOPY - 7), (_n_WHITE if _S.truth((_n_pulse_b7 > 0.4)) else _S.index_value(_n_C_b3,5))])
	_S.invoke(_n_p_b0,"glow",[0, (_n_TOPY - 7), 5, _S.index_value(_n_C_b3,4), (0.4 + (0.4 * _n_pulse_b7))])
	var _n_s_b9 = fmod(floori((float(_n_t_b1)/_n_SLOT)),_n_NS)
	var _n_k_b10 = (1 - (float((_n_t_b1 - (floori((float(_n_t_b1)/_n_SLOT)) * _n_SLOT)))/_n_SLOT))
	for _iter_3 in _S.array(_n_arcs_b4):
		var _n_a_b13 = _iter_3
		if _S.truth(_S.binary("!==",_S.named_value(_n_a_b13,"s"),_n_s_b9)):
			continue
		_S.call_value(_n_strokeArc,[_n_p_b0, _S.named_value(_n_a_b13,"path"), [_S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4)], _n_k_b10])
		for _iter_4 in _S.array(_S.named_value(_n_a_b13,"fk")):
			var _n_f_b16 = _iter_4
			_S.call_value(_n_strokeArc,[_n_p_b0, _n_f_b16, [_S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,4)], _n_k_b10, 0.6])
		var _tuple_5 = _S.index_value(_S.named_value(_n_a_b13,"path"),(_S.prop(_S.named_value(_n_a_b13,"path"),"length") - 1))
		var _n_ex_b14 = _S.prop(_tuple_5,0)
		var _n_ey_b15 = _S.prop(_tuple_5,1)
		_S.invoke(_n_p_b0,"glow",[_n_ex_b14, _n_ey_b15, 8, _S.index_value(_n_C_b3,5), (0.6 * _n_k_b10)])
	for _iter_6 in _S.array(_n_BEATS):
		var _tuple_7 = _iter_6
		var _n_b_b17 = _S.prop(_tuple_7,0)
		var _n_strong_b18 = _S.prop(_tuple_7,2)
		var _n_a_b19 = _S.call_value(_n_since,[_n_t_b1, _n_b_b17, _n_D])
		if _S.truth((not _S.truth(_n_strong_b18) if _S.truth(not _S.truth(_n_strong_b18)) else (_n_a_b19 > 0.45))):
			continue
		var _n_q_b20 = (float(_n_a_b19)/0.45)
		var _n_r_b21 = (_n_R0 + (34 * _S.invoke(_n_ease,"outCubic",[_n_q_b20])))
		_S.invoke(_n_p_b0,"ring",[0, _n_CY, _n_r_b21, maxf(1,(3 * (1 - _n_q_b20))), (_n_WHITE if _S.truth((_n_q_b20 < 0.25)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_q_b20 < 0.5)) else _S.index_value(_n_C_b3,5))), (1.1 - _n_q_b20)])
		_S.invoke(_n_p_b0,"glowRing",[0, _n_CY, _n_r_b21, 6, _S.index_value(_n_C_b3,4), (0.35 * (1 - _n_q_b20))])
	_S.invoke(_S.invoke(_n_g_b5,"at",[_n_t_b1]),"draw",[_n_p_b0])
	_S.invoke(_n_p_b0,"glow",[0, _n_CY, 46, _S.index_value(_n_C_b3,4), (0.2 + (0.3 * _n_pulse_b7))])
	_S.invoke(_n_p_b0,"glow",[0, _n_CY, 9, _n_WHITE, (0.35 + (0.4 * _n_pulse_b7))])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_TOPY = _S.read(_parent,"TOPY")
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = (pow((float(_n_x_b0)/14.5),2) + pow((float((_n_y_b1 - _n_TOPY))/6.5),2))
	if _S.truth((_n_d_b3 > 1)):
		return null
	var _n_l_b4 = (((-_n_x_b0) * 0.05) - ((_n_y_b1 - _n_TOPY) * 0.12))
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_H,0) if _S.truth((_n_d_b3 > 0.8)) else (_S.index_value(_n_H,5) if _S.truth((_n_l_b4 > 0.55)) else (_S.index_value(_n_H,4) if _S.truth((_n_l_b4 > 0.3)) else _S.index_value(_n_H,3)))),"=")
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	return ((float(_n_a_b0)/0.03) if _S.truth((_n_a_b0 < 0.03)) else exp((float((-(_n_a_b0 - 0.03)))/0.12)))
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_BEATS = _S.read(_parent,"BEATS")
	var _n_this = _S.read(_parent,"this")
	var _n_t_b0 = _S.arg(_args,0)
	return _S.invoke(_n_BEATS,"reduce",[_S.function_value(_S.capture(_parent,{"t":_n_t_b0,"this":_n_this}),"_f19"), 0])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_env = _S.read(_parent,"env")
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _n_m_b0 = _S.arg(_args,0)
	var _tuple_0 = _S.arg(_args,1)
	var _n_b_b1 = _S.prop(_tuple_0,0)
	var _n_k_b2 = _S.prop(_tuple_0,1)
	return maxf(_n_m_b0,(_n_k_b2 * _S.call_value(_n_env,[_S.call_value(_n_since,[_n_t, _n_b_b1, _n_D])])))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RC = _S.read(_parent,"RC")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_a_b2 = (((float(_n_i_b1)/6) * _n_TAU) + (float(PI)/6))
	return {"x":(_n_RC * sin(_n_a_b2)),"z":cos(_n_a_b2)}
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	return (_n_TAU * (float(_n_t_b0)/_n_D))
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_D = _S.read(_parent,"D")
	var _n_t_b0 = _S.arg(_args,0)
	return ((((-_n_TAU) * 2) * (float(_n_t_b0)/_n_D)) + 1)
	return null
