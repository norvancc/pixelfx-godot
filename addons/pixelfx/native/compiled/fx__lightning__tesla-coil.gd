@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/tesla-coil.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "VOLT", _S.import_value("fx/lightning/_lib.js", "VOLT"))
	_S.define(_e, "PLASMA", _S.import_value("fx/lightning/_lib.js", "PLASMA"))
	_S.define(_e, "zigzag", _S.import_value("fx/lightning/_lib.js", "zigzag"))
	_S.define(_e, "stroke", _S.import_value("fx/lightning/_lib.js", "stroke"))
	_S.define(_e, "crackle", _S.import_value("fx/lightning/_lib.js", "crackle"))
	_S.define(_e, "flight", _S.import_value("fx/lightning/_lib.js", "flight"))
	_S.define(_e, "spark", _S.import_value("fx/lightning/_lib.js", "spark"))
	_S.define(_e, "puff", _S.import_value("fx/lightning/_lib.js", "puff"))
	_S.define(_e, "scorch", _S.import_value("fx/lightning/_lib.js", "scorch"))
	_S.define(_e, "plan", _S.function_value(_e, "_f0"))
	_S.define(_e, "drawCoil", _S.function_value(_e, "_f1"))
	_S.define(_e, "torusMap", _S.function_value(_e, "_f5"))
	_S.define(_e, "drawTorus", _S.function_value(_e, "_f6"))
	_S.define(_e, "draw", _S.function_value(_e, "_f8"))
	_S.define(_e, "meta", _S.merge([{"name": "Tesla coil"}, {"desc": "A copper coil under a steel torus throws branching arcs that lash out in volleys and now and then strike the floor in a spray of sparks, lighting the metal and the ground."}, {"tags": ["lightning", "electric", "tesla", "machine", "prop", "loop"]}, {"size": [224, 136]}, {"origin": [112, 120]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": _S.read(_e, "VOLT")}, {"sparks": _S.read(_e, "PLASMA")}, {"copper": ["#2a120c", "#5a2814", "#8e4a1e", "#c4772f", "#eaa65a", "#ffd9a0"]}, {"steel": ["#0f121c", "#1f2433", "#353d52", "#556078", "#7f8ba3", "#b8c3d6", "#f2f6ff"]}, {"seed": 4}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FPS", 30)
	_S.define(_e, "N", 72)
	_S.define(_e, "P", _S.binary("/", _S.read(_e, "N"), _S.read(_e, "FPS")))
	_S.define(_e, "TY", _S.unary("-", 57))
	_S.define(_e, "RR", 12)
	_S.define(_e, "TR", 3.6)
	_S.define(_e, "SY", 0.45)
	_S.define(_e, "CTOP", _S.unary("-", 50))
	_S.define(_e, "CBOT", _S.unary("-", 12))
	_S.define(_e, "IRON", _S.invoke(["#120f18", "#1e1a27", "#2c2637", "#3f374d", "#5a5068"], "map", [_S.read(_e, "hex")]))
	_S.define(_e, "ASH", _S.call_value(_S.read(_e, "hex"), ["#5b5566"]))
	_S.define(_e, "FL", [1, 0.7, 0.95, 0.55, 0.85, 0.45, 0.7, 0.35])
	_S.define(_e, "ageOf", _S.function_value(_e, "_f11"))
	_S.define(_e, "root", _S.function_value(_e, "_f12"))
	_S.define(_e, "TORUS", null)
	_S.define(_e, "norm", _S.function_value(_e, "_f13"))
	_S.define(_e, "KEY", _S.call_value(_S.read(_e, "norm"), [_S.unary("-", 0.55), 0.75, 0.45]))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_N = _S.read(_parent,"N")
	var _n_seed_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.MathFX.rng([_n_seed_b0,1])
	var _n_arcs_b2 = []
	var _n_strikes_b3 = []
	for _iter_0 in _S.array([[2, 3], [20, 3], [30, 1], [38, 3], [56, 3], [66, 1]]):
		var _tuple_1 = _iter_0
		var _n_v_b4 = _S.prop(_tuple_1,0)
		var _n_n_b5 = _S.prop(_tuple_1,1)
		if true:
			var _n_j_b6 = 0
			while _S.truth((_n_j_b6 < (_n_n_b5 + _S.invoke(_n_r_b1,"int",[0, 1])))):
				var _n_side_b7 = (1 if _S.truth(_S.invoke(_n_r_b1,"chance",[0.5])) else (-1))
				var _n_front_b8 = _S.invoke(_n_r_b1,"chance",[0.55])
				var _n_a_b9 = _S.invoke(_n_r_b1,"range",[0.15, 1.1])
				var _n_phi_b10 = ((_n_a_b9 if _S.truth(_n_front_b8) else (-_n_a_b9)) if _S.truth((_n_side_b7 > 0)) else ((PI - _n_a_b9) if _S.truth(_n_front_b8) else (PI + _n_a_b9)))
				var _n_th0_b11 = _S.invoke(_n_r_b1,"range",[(-1.15), 0.35])
				_S.invoke(_n_arcs_b2,"push",[{"f0":fmod((_n_v_b4 + (_n_j_b6 * _S.invoke(_n_r_b1,"int",[2, 4]))),_n_N),"len":_S.invoke(_n_r_b1,"int",[3, 7]),"side":_n_side_b7,"phi":_n_phi_b10,"front":_n_front_b8,"th0":_n_th0_b11,"th1":(_n_th0_b11 + _S.invoke(_n_r_b1,"range",[(-0.6), 0.6])),"L":_S.invoke(_n_r_b1,"range",[24, 52])}])
				_n_j_b6 += 1.0
	for _iter_2 in _S.array([[14, 1], [47, (-1)]]):
		var _tuple_3 = _iter_2
		var _n_f0_b12 = _S.prop(_tuple_3,0)
		var _n_side_b13 = _S.prop(_tuple_3,1)
		_S.invoke(_n_strikes_b3,"push",[{"f0":_n_f0_b12,"side":_n_side_b13,"x":(_n_side_b13 * _S.invoke(_n_r_b1,"range",[38, 56])),"phi":(0.4 if _S.truth((_n_side_b13 > 0)) else (PI - 0.4))}])
	return {"arcs":_n_arcs_b2,"strikes":_n_strikes_b3}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_IRON = _S.read(_parent,"IRON")
	var _n_CTOP = _S.read(_parent,"CTOP")
	var _n_CBOT = _S.read(_parent,"CBOT")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_Cu_b1 = _S.arg(_args,1)
	var _n_lit_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_n_b4 = _S.prop(_n_Cu_b1,"length")
	_S.invoke(_n_p_b0,"shade",[(-14), (-8), 14, 0, _S.function_value(_S.capture(_parent,{"this":_this}),"_f2")])
	for _iter_0 in _S.array([(-10), 10]):
		var _n_rx_b6 = _iter_0
		_S.invoke(_n_p_b0,"px",[_n_rx_b6, (-4), _S.index_value(_n_IRON,4)])
		_S.invoke(_n_p_b0,"px",[_n_rx_b6, (-3), _S.index_value(_n_IRON,0)])
	var _n_turn_b5 = _S.function_value(_S.capture(_parent,{"p":_n_p_b0,"Cu":_n_Cu_b1,"n":_n_n_b4,"this":_this}),"_f3")
	_S.call_value(_n_turn_b5,[(-10.5), false])
	_S.call_value(_n_turn_b5,[(-13.5), false])
	_S.invoke(_n_p_b0,"shade",[(-6), _n_CTOP, 6, _n_CBOT, _S.function_value(_S.capture(_parent,{"Cu":_n_Cu_b1,"n":_n_n_b4,"lit":_n_lit_b2,"C":_n_C_b3,"this":_this}),"_f4")])
	_S.invoke(_n_p_b0,"line",[(-5), (_n_CTOP - 1), 5, (_n_CTOP - 1), _S.index_value(_n_IRON,3)])
	_S.invoke(_n_p_b0,"line",[(-4), (_n_CTOP - 2), 4, (_n_CTOP - 2), _S.index_value(_n_IRON,2)])
	_S.call_value(_n_turn_b5,[(-10.5), true])
	_S.call_value(_n_turn_b5,[(-13.5), true])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_IRON = _S.read(_parent,"IRON")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	if _S.truth((((_n_x_b0 < (-13)) if _S.truth((_n_x_b0 < (-13))) else (_n_x_b0 > 13)) if _S.truth(((_n_x_b0 < (-13)) if _S.truth((_n_x_b0 < (-13))) else (_n_x_b0 > 13))) else (_n_y_b1 < (-7)))):
		return null
	var _n_edge_b3 = (2 if _S.truth((_n_x_b0 < (-12))) else (0 if _S.truth((_n_x_b0 > 12)) else 1))
	_S.set_prop(_n_o_b2,"c",(_S.index_value(_n_IRON,4) if _S.truth((_n_y_b1 < (-6))) else (_S.index_value(_n_IRON,3) if _S.truth((_n_y_b1 < (-5))) else (_S.index_value(_n_IRON,0) if _S.truth((_n_y_b1 > (-1))) else _S.index_value(_n_IRON,(2 if _S.truth(((_n_edge_b3 + 1) > 2)) else (_n_edge_b3 + (1 if _S.truth((_n_y_b1 < (-3))) else 0))))))),"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_p = _S.read(_parent,"p")
	var _n_Cu = _S.read(_parent,"Cu")
	var _n_n = _S.read(_parent,"n")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_front_b1 = _S.arg(_args,1)
	if true:
		var _n_a_b2 = 0
		while _S.truth((_n_a_b2 < _n_TAU)):
			if _S.truth(_S.binary("!==",(sin(_n_a_b2) >= 0),_n_front_b1)):
				_n_a_b2 += 0.04
				continue
			var _n_x_b3 = (cos(_n_a_b2) * 10)
			var _n_yy_b4 = (_n_y_b0 + (sin(_n_a_b2) * 2.2))
			var _n_l_b5 = ((0.5 - (0.4 * cos(_n_a_b2))) + (0.25 if _S.truth(_n_front_b1) else (-0.2)))
			_S.invoke(_n_p,"px",[_n_x_b3, _n_yy_b4, _S.index_value(_n_Cu,clampf(floori((_n_l_b5 * (_n_n - 1))+0.5),0,(_n_n - 1)))])
			_S.invoke(_n_p,"px",[_n_x_b3, (_n_yy_b4 + 1), _S.index_value(_n_Cu,clampf((floori((_n_l_b5 * (_n_n - 1))+0.5) - 2),0,(_n_n - 1)))])
			_n_a_b2 += 0.04
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_Cu = _S.read(_parent,"Cu")
	var _n_n = _S.read(_parent,"n")
	var _n_lit = _S.read(_parent,"lit")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	if _S.truth(((_n_x_b0 < (-5)) if _S.truth((_n_x_b0 < (-5))) else (_n_x_b0 > 5))):
		return null
	var _n_u_b3 = (float((_n_x_b0 + 5.5))/11)
	var _n_nx_b4 = ((_n_u_b3 * 2) - 1)
	var _n_wire_b5 = _S.binary("===",_S.binary("&",floori(_n_y_b1),1),0)
	var _n_l_b6 = (((0.62 - (0.55 * _n_nx_b4)) - ((0.35 * _n_nx_b4) * _n_nx_b4)) + (0.3 if _S.truth((absf((_n_nx_b4 + 0.35)) < 0.12)) else 0))
	if _S.truth(not _S.truth(_n_wire_b5)):
		_n_l_b6 -= 0.32
	_S.set_prop(_n_o_b2,"c",_S.index_value(_n_Cu,clampf(floori((_n_l_b6 * (_n_n - 1))+0.5),0,(_n_n - 1))),"=")
	if _S.truth(((((_S.index_value(_n_lit,0) > 0.25) if _S.truth((_n_nx_b4 < (-0.75))) else (_n_nx_b4 < (-0.75))) if _S.truth(((_S.index_value(_n_lit,0) > 0.25) if _S.truth((_n_nx_b4 < (-0.75))) else (_n_nx_b4 < (-0.75)))) else ((_S.index_value(_n_lit,1) > 0.25) if _S.truth((_n_nx_b4 > 0.75)) else (_n_nx_b4 > 0.75))) if _S.truth(_n_wire_b5) else _n_wire_b5)):
		_S.set_prop(_n_o_b2,"c",((_S.index_value(_n_C,6) if _S.truth((_S.index_value(_n_lit,0) > 0.6)) else _S.index_value(_n_C,4)) if _S.truth((_n_nx_b4 < 0)) else (_S.index_value(_n_C,6) if _S.truth((_S.index_value(_n_lit,1) > 0.6)) else _S.index_value(_n_C,4))),"=")
	return null

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	if _S.truth(_S.read(_e, "TORUS")):
		return _S.read(_e, "TORUS")
	_S.define(_e, "sa", _S.read(_e, "SY"))
	_S.define(_e, "ca", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "SY"), _S.read(_e, "SY")))]))
	_S.define(_e, "X0", _S.binary("-", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.read(_e, "RR"), _S.read(_e, "TR"))])), 1))
	_S.define(_e, "Y0", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("-", _S.binary("-", _S.read(_e, "TY"), _S.binary("*", _S.read(_e, "RR"), _S.read(_e, "SY"))), _S.read(_e, "TR"))]), 2))
	_S.define(_e, "W", _S.binary("+", _S.binary("*", 2, _S.unary("-", _S.read(_e, "X0"))), 2))
	_S.define(_e, "H", _S.binary("-", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.binary("+", _S.binary("+", _S.read(_e, "TY"), _S.binary("*", _S.read(_e, "RR"), _S.read(_e, "SY"))), _S.read(_e, "TR"))]), 3), _S.read(_e, "Y0")))
	_S.define(_e, "z", _S.invoke(_S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]), "fill", [_S.unary("-", 1000000000)]))
	_S.define(_e, "n", _S.construct(_S.read(_e, "Float32Array"), [_S.binary("*", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")), 3)]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), 480)):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "phi", _S.binary("*", _S.binary("/", _S.read(_v13, "i"), 480), _S.read(_v13, "TAU")))
		_S.define(_v13, "cp", _S.invoke(_S.read(_v13, "Math"), "cos", [_S.read(_v13, "phi")]))
		_S.define(_v13, "sp", _S.invoke(_S.read(_v13, "Math"), "sin", [_S.read(_v13, "phi")]))
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "j", 0)
		while _S.truth(_S.binary("<", _S.read(_v14, "j"), 96)):
			var _v15 = _S.scope(_v14)
			_S.define(_v15, "psi", _S.binary("*", _S.binary("/", _S.read(_v15, "j"), 96), _S.read(_v15, "TAU")))
			_S.define(_v15, "cs", _S.invoke(_S.read(_v15, "Math"), "cos", [_S.read(_v15, "psi")]))
			_S.define(_v15, "ss", _S.invoke(_S.read(_v15, "Math"), "sin", [_S.read(_v15, "psi")]))
			_S.define(_v15, "rr", _S.binary("+", _S.read(_v15, "RR"), _S.binary("*", _S.read(_v15, "TR"), _S.read(_v15, "cs"))))
			_S.define(_v15, "X", _S.binary("*", _S.read(_v15, "rr"), _S.read(_v15, "cp")))
			_S.define(_v15, "Y", _S.binary("*", _S.read(_v15, "TR"), _S.read(_v15, "ss")))
			_S.define(_v15, "Z", _S.binary("*", _S.read(_v15, "rr"), _S.read(_v15, "sp")))
			_S.define(_v15, "px", _S.binary("-", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.read(_v15, "X")]), _S.read(_v15, "X0")))
			_S.define(_v15, "py", _S.binary("-", _S.invoke(_S.read(_v15, "Math"), "floor", [_S.binary("+", _S.binary("-", _S.read(_v15, "TY"), _S.binary("*", _S.read(_v15, "Y"), _S.read(_v15, "ca"))), _S.binary("*", _S.read(_v15, "Z"), _S.read(_v15, "sa")))]), _S.read(_v15, "Y0")))
			_S.define(_v15, "d", _S.binary("+", _S.binary("*", _S.read(_v15, "Z"), _S.read(_v15, "ca")), _S.binary("*", _S.read(_v15, "Y"), _S.read(_v15, "sa"))))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v15, "px"), 0), func(): return _S.binary("<", _S.read(_v15, "py"), 0)), func(): return _S.binary(">=", _S.read(_v15, "px"), _S.read(_v15, "W"))), func(): return _S.binary(">=", _S.read(_v15, "py"), _S.read(_v15, "H")))):
				_v14 = _S.iteration(_v14)
				_S.write(_v14, "j", 1, "+=", true)
				continue
			_S.define(_v15, "k", _S.binary("+", _S.binary("*", _S.read(_v15, "py"), _S.read(_v15, "W")), _S.read(_v15, "px")))
			if _S.truth(_S.binary(">", _S.read(_v15, "d"), _S.prop(_S.read(_v15, "z"), _S.read(_v15, "k")))):
				_S.last([_S.set_prop(_S.read(_v15, "z"), _S.read(_v15, "k"), _S.read(_v15, "d"), "=", false), _S.set_prop(_S.read(_v15, "n"), _S.binary("*", _S.read(_v15, "k"), 3), _S.binary("*", _S.read(_v15, "cs"), _S.read(_v15, "cp")), "=", false), _S.set_prop(_S.read(_v15, "n"), _S.binary("+", _S.binary("*", _S.read(_v15, "k"), 3), 1), _S.read(_v15, "ss"), "=", false), _S.set_prop(_S.read(_v15, "n"), _S.binary("+", _S.binary("*", _S.read(_v15, "k"), 3), 2), _S.binary("*", _S.read(_v15, "cs"), _S.read(_v15, "sp")), "=", false)])
			_v14 = _S.iteration(_v14)
			_S.write(_v14, "j", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	return _S.write(_e, "TORUS", _S.merge([{"X0": _S.read(_e, "X0")}, {"Y0": _S.read(_e, "Y0")}, {"W": _S.read(_e, "W")}, {"H": _S.read(_e, "H")}, {"z": _S.read(_e, "z")}, {"n": _S.read(_e, "n")}, {"ca": _S.read(_e, "ca")}, {"sa": _S.read(_e, "sa")}]), "=", false)

static func _f6(_parent,_args:Array,_this=null):
	var _n_torusMap = _S.read(_parent,"torusMap")
	var _n_norm = _S.read(_parent,"norm")
	var _n_KEY = _S.read(_parent,"KEY")
	var _n_RR = _S.read(_parent,"RR")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_St_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_lit_b3 = _S.arg(_args,3)
	var _n_T_b4 = _S.call_value(_n_torusMap,[])
	var _n_m_b5 = _S.prop(_n_St_b1,"length")
	var _n_HALF_b6 = _S.call_value(_n_norm,[_S.index_value(_n_KEY,0), (_S.index_value(_n_KEY,1) + _S.named_value(_n_T_b4,"sa")), (_S.index_value(_n_KEY,2) + _S.named_value(_n_T_b4,"ca"))])
	var _n_on_b7 = _S.function_value(_S.capture(_parent,{"T":_n_T_b4,"this":_this}),"_f7")
	if true:
		var _n_y_b8 = 0
		while _S.truth((_n_y_b8 < _S.named_value(_n_T_b4,"H"))):
			if true:
				var _n_x_b9 = 0
				while _S.truth((_n_x_b9 < _S.named_value(_n_T_b4,"W"))):
					var _n_k_b10 = ((_n_y_b8 * _S.named_value(_n_T_b4,"W")) + _n_x_b9)
					if _S.truth((_S.index_value(_S.named_value(_n_T_b4,"z"),_n_k_b10) < (-100000000))):
						_n_x_b9 += 1.0
						continue
					var _n_nx_b11 = _S.index_value(_S.named_value(_n_T_b4,"n"),(_n_k_b10 * 3))
					var _n_ny_b12 = _S.index_value(_S.named_value(_n_T_b4,"n"),((_n_k_b10 * 3) + 1))
					var _n_nz_b13 = _S.index_value(_S.named_value(_n_T_b4,"n"),((_n_k_b10 * 3) + 2))
					var _n_dif_b14 = maxf(0,(((_n_nx_b11 * _S.index_value(_n_KEY,0)) + (_n_ny_b12 * _S.index_value(_n_KEY,1))) + (_n_nz_b13 * _S.index_value(_n_KEY,2))))
					var _n_spec_b15 = pow(maxf(0,(((_n_nx_b11 * _S.index_value(_n_HALF_b6,0)) + (_n_ny_b12 * _S.index_value(_n_HALF_b6,1))) + (_n_nz_b13 * _S.index_value(_n_HALF_b6,2)))),28)
					var _n_inner_b16 = (0.75 if _S.truth(((absf(((_n_x_b9 + _S.named_value(_n_T_b4,"X0")) + 0.5)) < _n_RR) if _S.truth((((_n_nx_b11 * ((_n_x_b9 + _S.named_value(_n_T_b4,"X0")) + 0.5)) + (_n_nz_b13 * 0)) < 0)) else (((_n_nx_b11 * ((_n_x_b9 + _S.named_value(_n_T_b4,"X0")) + 0.5)) + (_n_nz_b13 * 0)) < 0))) else 1)
					var _n_c_b17 = (_S.index_value(_n_St_b1,(_n_m_b5 - 1)) if _S.truth((_n_spec_b15 > 0.55)) else _S.index_value(_n_St_b1,clampf(floori((((0.12 + ((0.8 * _n_dif_b14) * _n_inner_b16)) + _n_spec_b15) * (_n_m_b5 - 1.01))),0,(_n_m_b5 - 2))))
					for _iter_0 in _S.array([[(-1), _S.index_value(_n_lit_b3,0)], [1, _S.index_value(_n_lit_b3,1)]]):
						var _tuple_1 = _iter_0
						var _n_s_b18 = _S.prop(_tuple_1,0)
						var _n_l_b19 = _S.prop(_tuple_1,1)
						var _n_r_b20 = (maxf(0,((((_n_s_b18 * _n_nx_b11) * 0.85) + (_n_ny_b12 * 0.25)) + (_n_nz_b13 * 0.45))) * minf(1,_n_l_b19))
						if _S.truth((_n_r_b20 > 0.88)):
							_n_c_b17 = _S.index_value(_n_C_b2,6)
						else:
							if _S.truth((_n_r_b20 > 0.62)):
								_n_c_b17 = _S.ColorFX.mix(_n_c_b17,_S.index_value(_n_C_b2,5),0.6)
							else:
								if _S.truth((_n_r_b20 > 0.38)):
									_n_c_b17 = _S.ColorFX.mix(_n_c_b17,_S.index_value(_n_C_b2,4),0.3)
					if _S.truth(_S.logical("&&",not _S.truth(_S.call_value(_n_on_b7,[_n_x_b9, (_n_y_b8 + 1)])),func():return (_n_ny_b12 < 0.3))):
						_n_c_b17 = _S.index_value(_n_St_b1,0)
					_S.invoke(_n_p_b0,"px",[(_n_x_b9 + _S.named_value(_n_T_b4,"X0")), (_n_y_b8 + _S.named_value(_n_T_b4,"Y0")), _n_c_b17])
					_n_x_b9 += 1.0
			_n_y_b8 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_T = _S.read(_parent,"T")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((_S.index_value(_S.named_value(_n_T,"z"),((_n_y_b1 * _S.named_value(_n_T,"W")) + _n_x_b0)) > (-100000000)) if _S.truth(((_n_y_b1 < _S.named_value(_n_T,"H")) if _S.truth(((_n_x_b0 < _S.named_value(_n_T,"W")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_T,"W")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_T,"H")) if _S.truth(((_n_x_b0 < _S.named_value(_n_T,"W")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_T,"W")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_hex = _S.read(_parent,"hex")
	var _n_FPS = _S.read(_parent,"FPS")
	var _n_N = _S.read(_parent,"N")
	var _n_plan = _S.read(_parent,"plan")
	var _n_FL = _S.read(_parent,"FL")
	var _n_ageOf = _S.read(_parent,"ageOf")
	var _n_IRON = _S.read(_parent,"IRON")
	var _n_P = _S.read(_parent,"P")
	var _n_scorch = _S.read(_parent,"scorch")
	var _n_ASH = _S.read(_parent,"ASH")
	var _n_puff = _S.read(_parent,"puff")
	var _n_drawCoil = _S.read(_parent,"drawCoil")
	var _n_drawTorus = _S.read(_parent,"drawTorus")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_RR = _S.read(_parent,"RR")
	var _n_TR = _S.read(_parent,"TR")
	var _n_TY = _S.read(_parent,"TY")
	var _n_SY = _S.read(_parent,"SY")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_crackle = _S.read(_parent,"crackle")
	var _n_root = _S.read(_parent,"root")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_flight = _S.read(_parent,"flight")
	var _n_spark = _S.read(_parent,"spark")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_Cu_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"copper"),6)
	var _n_St_b5 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"steel"),7)
	var _n_S_b6 = _S.invoke(_S.named_value(_n_o_b2,"sparks"),"map",[_n_hex])
	var _n_f_b7 = fmod(floori(((_n_t_b1 * _n_FPS) + 0.000001)),_n_N)
	var _object_0 = _S.call_value(_n_plan,[_S.named_value(_n_o_b2,"seed")])
	var _n_arcs_b8 = _S.named_value(_object_0,"arcs")
	var _n_strikes_b9 = _S.named_value(_object_0,"strikes")
	var _n_lit_b10 = [0, 0]
	var _n_live_b11 = _S.invoke(_n_arcs_b8,"filter",[_S.function_value(_S.capture(_parent,{"f":_n_f_b7,"this":_this}),"_f9")])
	for _iter_1 in _S.array(_n_live_b11):
		var _n_a_b15 = _iter_1
		_S.set_prop(_n_lit_b10,(1 if _S.truth((_S.named_value(_n_a_b15,"side") > 0)) else 0),(_S.index_value(_n_FL,_S.call_value(_n_ageOf,[_n_f_b7, _S.named_value(_n_a_b15,"f0")])) * 0.6),"+=")
	for _iter_2 in _S.array(_n_strikes_b9):
		var _n_s_b16 = _iter_2
		var _n_a_b17 = _S.call_value(_n_ageOf,[_n_f_b7, _S.named_value(_n_s_b16,"f0")])
		if _S.truth((_n_a_b17 < 6)):
			_S.set_prop(_n_lit_b10,(1 if _S.truth((_S.named_value(_n_s_b16,"side") > 0)) else 0),1,"+=")
	var _n_act_b12 = minf(1,((_S.index_value(_n_lit_b10,0) + _S.index_value(_n_lit_b10,1)) * 0.5))
	_S.invoke(_n_p_b0,"glow",[0, (-10), 58, _S.index_value(_n_C_b3,3), (0.14 + (0.25 * _n_act_b12))])
	_S.invoke(_n_p_b0,"ellipse",[0, 0.5, 15, 1.6, _S.index_value(_n_IRON,0)])
	for _iter_3 in _S.array(_n_strikes_b9):
		var _n_s_b18 = _iter_3
		var _n_age_b19 = fmod((fmod((_n_t_b1 - (float(_S.named_value(_n_s_b18,"f0"))/_n_FPS)),_n_P) + _n_P),_n_P)
		_S.call_value(_n_scorch,[_n_p_b0, _S.named_value(_n_s_b18,"x"), 0, 7, pow(clampf((1 - (float(_n_age_b19)/1.1)),0.0,1.0),1.3), (1 - clampf((float((_n_age_b19 - 1.4))/0.6),0.0,1.0))])
		if true:
			var _n_j_b20 = 0
			while _S.truth((_n_j_b20 < 2)):
				var _n_u_b21 = (float(((_n_age_b19 - 0.12) - (_n_j_b20 * 0.18)))/1.2)
				if _S.truth(((_n_u_b21 < 1) if _S.truth((_n_u_b21 > 0)) else (_n_u_b21 > 0))):
					_S.call_value(_n_puff,[_n_p_b0, ((_S.named_value(_n_s_b18,"x") + (3 if _S.truth(_n_j_b20) else (-2))) + ((_n_u_b21 * 5) * _S.named_value(_n_s_b18,"side"))), (((-3) - (_n_u_b21 * 16)) - (_n_j_b20 * 2)), (2.6 + _n_j_b20), _n_u_b21, _S.ColorFX.mix(_n_ASH,_S.index_value(_n_C_b3,2),0.3)])
				_n_j_b20 += 1.0
	var _n_drawArc_b13 = _S.function_value(_S.capture(_parent,{"f":_n_f_b7,"o":_n_o_b2,"p":_n_p_b0,"C":_n_C_b3,"this":_this}),"_f10")
	for _iter_4 in _S.array(_n_live_b11):
		var _n_a_b22 = _iter_4
		if _S.truth(not _S.truth(_S.named_value(_n_a_b22,"front"))):
			_S.call_value(_n_drawArc_b13,[_n_a_b22])
	_S.call_value(_n_drawCoil,[_n_p_b0, _n_Cu_b4, _n_lit_b10, _n_C_b3])
	_S.call_value(_n_drawTorus,[_n_p_b0, _n_St_b5, _n_C_b3, _n_lit_b10])
	var _n_rc_b14 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),9,_n_f_b7])
	if true:
		var _n_i_b23 = 0
		while _S.truth((_n_i_b23 < 6)):
			var _n_phi_b24 = _S.invoke(_n_rc_b14,"range",[0, _n_TAU])
			var _n_d_b25 = _S.invoke(_n_rc_b14,"range",[1, 3])
			var _n_x_b26 = (cos(_n_phi_b24) * ((_n_RR + _n_TR) + _n_d_b25))
			var _n_y_b27 = (_n_TY + (sin(_n_phi_b24) * (((_n_RR * _n_SY) + _n_TR) + (_n_d_b25 * 0.7))))
			_S.invoke(_n_p_b0,"px",[_n_x_b26, _n_y_b27, (_S.index_value(_n_C_b3,5) if _S.truth(_S.invoke(_n_rc_b14,"chance",[0.3])) else _S.index_value(_n_C_b3,3))])
			if _S.truth(_S.invoke(_n_rc_b14,"chance",[0.4])):
				_S.invoke(_n_p_b0,"px",[(_n_x_b26 + cos(_n_phi_b24)), (_n_y_b27 + (sin(_n_phi_b24) * 0.6)), _S.index_value(_n_C_b3,2)])
			_S.invoke(_n_p_b0,"glow",[_n_x_b26, _n_y_b27, 4, _S.index_value(_n_C_b3,3), 0.3])
			_n_i_b23 += 1.0
	if true:
		var _n_i_b28 = 0
		while _S.truth((_n_i_b28 < 2)):
			var _n_phi_b29 = _S.invoke(_n_rc_b14,"range",[0, _n_TAU])
			var _n_x0_b30 = (cos(_n_phi_b29) * (_n_RR + (_n_TR * 0.8)))
			var _n_y0_b31 = (_n_TY + (sin(_n_phi_b29) * ((_n_RR * _n_SY) + (_n_TR * 0.6))))
			var _n_a_b32 = (atan2(((sin(_n_phi_b29) * 0.6) - 0.5),cos(_n_phi_b29)) + _S.invoke(_n_rc_b14,"range",[(-0.5), 0.5]))
			var _n_l_b33 = _S.invoke(_n_rc_b14,"range",[4, 10])
			_S.call_value(_n_crackle,[_n_p_b0, _S.call_value(_n_zigzag,[_n_rc_b14, _n_x0_b30, _n_y0_b31, (_n_x0_b30 + (cos(_n_a_b32) * _n_l_b33)), (_n_y0_b31 + (sin(_n_a_b32) * _n_l_b33)), 0.4, 0.4]), _S.invoke(_n_rc_b14,"range",[0.35, 0.65]), _n_C_b3, 0.3])
			_n_i_b28 += 1.0
	_S.invoke(_n_p_b0,"glow",[0, _n_TY, 34, _S.index_value(_n_C_b3,3), (0.18 + (0.3 * _n_act_b12))])
	for _iter_5 in _S.array(_n_live_b11):
		var _n_a_b34 = _iter_5
		if _S.truth(_S.named_value(_n_a_b34,"front")):
			_S.call_value(_n_drawArc_b13,[_n_a_b34])
	for _iter_6 in _S.array(_n_strikes_b9):
		var _n_s_b35 = _iter_6
		var _n_age_b36 = _S.call_value(_n_ageOf,[_n_f_b7, _S.named_value(_n_s_b35,"f0")])
		if _S.truth((_n_age_b36 < 6)):
			var _n_k_b38 = _S.index_value([1, 0.75, 1, 0.6, 0.85, 0.4],_n_age_b36)
			var _tuple_7 = _S.call_value(_n_root,[_S.named_value(_n_s_b35,"phi"), (-2)])
			var _n_x0_b39 = _S.prop(_tuple_7,0)
			var _n_y0_b40 = _S.prop(_tuple_7,1)
			var _n_r_b41 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),41,_S.named_value(_n_s_b35,"f0"),_n_f_b7])
			_S.call_value(_n_stroke,[_n_p_b0, _S.call_value(_n_zigzag,[_n_r_b41, _n_x0_b39, _n_y0_b40, _S.named_value(_n_s_b35,"x"), 0, 0.22, 0.55]), _n_k_b38, _n_C_b3, (0.95 if _S.truth(_S.binary("===",_n_age_b36,0)) else 0.8), {"hero":_S.binary("===",_n_age_b36,0)}])
			_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_s_b35,"x"), (-1), ((3 * _n_k_b38) + 1.5), _S.index_value(_n_C_b3,2)])
			_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_s_b35,"x"), (-1), ((3 * _n_k_b38) + 0.5), _S.index_value(_n_C_b3,5)])
			_S.invoke(_n_p_b0,"circle",[_S.named_value(_n_s_b35,"x"), (-1), (2 * _n_k_b38), _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b35,"x"), (-10), 40, _S.index_value(_n_C_b3,4), (0.55 * _n_k_b38)])
			_S.invoke(_n_p_b0,"glow",[_S.named_value(_n_s_b35,"x"), (-3), 12, _S.index_value(_n_C_b3,6), (0.5 * _n_k_b38)])
			if _S.truth((_n_age_b36 < 2)):
				_S.invoke(_n_p_b0,"glow",[0, (-50), 120, _S.index_value(_n_C_b3,3), (0.25 * _n_k_b38)])
		var _n_st_b37 = fmod((fmod((_n_t_b1 - (float(_S.named_value(_n_s_b35,"f0"))/_n_FPS)),_n_P) + _n_P),_n_P)
		if true:
			var _n_j_b42 = 0
			while _S.truth((_n_j_b42 < 18)):
				var _n_r_b43 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),51,_S.named_value(_n_s_b35,"f0"),_n_j_b42])
				var _n_life_b44 = _S.invoke(_n_r_b43,"range",[0.3, 0.65])
				if _S.truth((_n_st_b37 >= _n_life_b44)):
					_n_j_b42 += 1.0
					continue
				var _n_a_b45 = ((float((-PI))/2) + _S.invoke(_n_r_b43,"range",[(-1.3), 1.3]))
				var _n_sp_b46 = _S.invoke(_n_r_b43,"range",[50, 190])
				var _tuple_8 = _S.call_value(_n_flight,[_S.named_value(_n_s_b35,"x"), (-1), (cos(_n_a_b45) * _n_sp_b46), (sin(_n_a_b45) * _n_sp_b46), _n_st_b37, {"floor":0}])
				var _n_x_b47 = _S.prop(_tuple_8,0)
				var _n_y_b48 = _S.prop(_tuple_8,1)
				var _n_vx_b49 = _S.prop(_tuple_8,2)
				var _n_vy_b50 = _S.prop(_tuple_8,3)
				_S.call_value(_n_spark,[_n_p_b0, _n_x_b47, _n_y_b48, _n_vx_b49, _n_vy_b50, (1 - (float(_n_st_b37)/_n_life_b44)), _n_S_b6])
				_n_j_b42 += 1.0
	for _iter_9 in _S.array(_n_arcs_b8):
		var _n_a_b51 = _iter_9
		var _n_age_b52 = fmod((fmod((_n_t_b1 - (float(_S.named_value(_n_a_b51,"f0"))/_n_FPS)),_n_P) + _n_P),_n_P)
		var _n_ang_b53 = (_S.named_value(_n_a_b51,"th0") if _S.truth((_S.named_value(_n_a_b51,"side") > 0)) else (PI - _S.named_value(_n_a_b51,"th0")))
		var _tuple_10 = _S.call_value(_n_root,[_S.named_value(_n_a_b51,"phi")])
		var _n_x0_b54 = _S.prop(_tuple_10,0)
		var _n_y0_b55 = _S.prop(_tuple_10,1)
		if true:
			var _n_j_b56 = 0
			while _S.truth((_n_j_b56 < 3)):
				var _n_r_b57 = _S.MathFX.rng([_S.named_value(_n_o_b2,"seed"),61,_S.named_value(_n_a_b51,"f0"),_n_j_b56])
				var _n_life_b58 = _S.invoke(_n_r_b57,"range",[0.15, 0.35])
				if _S.truth((_n_age_b52 >= _n_life_b58)):
					_n_j_b56 += 1.0
					continue
				var _n_tx_b59 = (_n_x0_b54 + ((cos(_n_ang_b53) * _S.named_value(_n_a_b51,"L")) * 0.75))
				var _n_ty_b60 = (_n_y0_b55 + ((sin(_n_ang_b53) * _S.named_value(_n_a_b51,"L")) * 0.75))
				var _n_b_b61 = (_n_ang_b53 + _S.invoke(_n_r_b57,"range",[(-0.9), 0.9]))
				var _n_sp_b62 = _S.invoke(_n_r_b57,"range",[50, 150])
				var _tuple_11 = _S.call_value(_n_flight,[_n_tx_b59, _n_ty_b60, (cos(_n_b_b61) * _n_sp_b62), (sin(_n_b_b61) * _n_sp_b62), _n_age_b52, {"floor":0}])
				var _n_x_b63 = _S.prop(_tuple_11,0)
				var _n_y_b64 = _S.prop(_tuple_11,1)
				var _n_vx_b65 = _S.prop(_tuple_11,2)
				var _n_vy_b66 = _S.prop(_tuple_11,3)
				_S.call_value(_n_spark,[_n_p_b0, _n_x_b63, _n_y_b64, _n_vx_b65, _n_vy_b66, (1 - (float(_n_age_b52)/_n_life_b58)), _n_S_b6])
				_n_j_b56 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_ageOf = _S.read(_parent,"ageOf")
	var _n_f = _S.read(_parent,"f")
	var _n_a_b0 = _S.arg(_args,0)
	return (_S.call_value(_n_ageOf,[_n_f, _S.named_value(_n_a_b0,"f0")]) < _S.named_value(_n_a_b0,"len"))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_ageOf = _S.read(_parent,"ageOf")
	var _n_f = _S.read(_parent,"f")
	var _n_ease = _S.read(_parent,"ease")
	var _n_root = _S.read(_parent,"root")
	var _n_o = _S.read(_parent,"o")
	var _n_p = _S.read(_parent,"p")
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_FL = _S.read(_parent,"FL")
	var _n_C = _S.read(_parent,"C")
	var _n_stroke = _S.read(_parent,"stroke")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.call_value(_n_ageOf,[_n_f, _S.named_value(_n_a_b0,"f0")])
	var _n_u_b2 = (float(_n_age_b1)/maxf(1,(_S.named_value(_n_a_b0,"len") - 1)))
	var _n_th_b3 = (_S.named_value(_n_a_b0,"th0") + ((_S.named_value(_n_a_b0,"th1") - _S.named_value(_n_a_b0,"th0")) * _S.invoke(_n_ease,"outQuad",[_n_u_b2])))
	var _n_ang_b4 = (_n_th_b3 if _S.truth((_S.named_value(_n_a_b0,"side") > 0)) else (PI - _n_th_b3))
	var _tuple_0 = _S.call_value(_n_root,[_S.named_value(_n_a_b0,"phi")])
	var _n_x0_b5 = _S.prop(_tuple_0,0)
	var _n_y0_b6 = _S.prop(_tuple_0,1)
	var _n_L_b7 = (_S.named_value(_n_a_b0,"L") * (0.75 if _S.truth(_S.binary("===",_n_age_b1,0)) else 1))
	var _n_r_b8 = _S.MathFX.rng([_S.named_value(_n_o,"seed"),21,_S.named_value(_n_a_b0,"f0"),_n_f])
	_S.call_value(_n_stroke,[_n_p, _S.call_value(_n_zigzag,[_n_r_b8, _n_x0_b5, _n_y0_b6, (_n_x0_b5 + (cos(_n_ang_b4) * _n_L_b7)), (_n_y0_b6 + (sin(_n_ang_b4) * _n_L_b7)), 0.32, 0.75]), _S.index_value(_n_FL,_n_age_b1), _n_C, 0.6, {"light":0.4}])
	_S.invoke(_n_p,"glow",[_n_x0_b5, _n_y0_b6, 10, _S.index_value(_n_C,5), (0.5 * _S.index_value(_n_FL,_n_age_b1))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_N = _S.read(_parent,"N")
	var _n_f_b0 = _S.arg(_args,0)
	var _n_f0_b1 = _S.arg(_args,1)
	return fmod((fmod((_n_f_b0 - _n_f0_b1),_n_N) + _n_N),_n_N)
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_RR = _S.read(_parent,"RR")
	var _n_TR = _S.read(_parent,"TR")
	var _n_TY = _S.read(_parent,"TY")
	var _n_SY = _S.read(_parent,"SY")
	var _n_phi_b0 = _S.arg(_args,0)
	var _n_up_b1 = _S.coalesce(_S.arg(_args,1),func():return 0)
	return [(cos(_n_phi_b0) * (_n_RR + (_n_TR * 0.6))), ((_n_TY + ((sin(_n_phi_b0) * _n_RR) * _n_SY)) - _n_up_b1)]
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_z_b2 = _S.arg(_args,2)
	var _n_l_b3 = _S.Bridge.hypot([_n_x_b0, _n_y_b1, _n_z_b2])
	return [(float(_n_x_b0)/_n_l_b3), (float(_n_y_b1)/_n_l_b3), (float(_n_z_b2)/_n_l_b3)]
	return null
