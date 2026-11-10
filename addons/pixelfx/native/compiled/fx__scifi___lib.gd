@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f7":"ghost_state"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "move", _S.function_value(_e, "_f0"))
	_S.define(_e, "flash", _S.function_value(_e, "_f1"))
	_S.define(_e, "strokeArc", _S.function_value(_e, "_f2"))
	_S.define(_e, "SOFT", _S.construct(_S.read(_e, "Set"), [[_S.prop(_S.read(_e, "P"), "VAPOUR"), _S.prop(_S.read(_e, "P"), "DUST"), _S.prop(_S.read(_e, "P"), "SMOKE")]]))
	_S.define(_e, "STEP", _S.binary("/", 1, 240))
	_S.define(_e, "Ghosts", _S.class_value("Ghosts", _S.function_value(_e, "_f3"), {"add": _S.function_value(_e, "_f5"), "state": _S.function_value(_e, "_f7"), "at": _S.function_value(_e, "_f8")}, {"count": _S.function_value(_e, "_f6")}, {}, null))
	_exports["Ghosts"] = _S.read(_e, "Ghosts")
	_exports["flash"] = _S.read(_e, "flash")
	_S.define(_e, "since", _S.function_value(_e, "_f9"))
	_exports["since"] = _S.read(_e, "since")
	_exports["strokeArc"] = _S.read(_e, "strokeArc")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "q", _S.arg(_args, 0))
	_S.define(_e, "dt", _S.arg(_args, 1))
	_S.define(_e, "age", _S.arg(_args, 2))
	_S.define(_e, "ground", _S.arg(_args, 3))
	var _v0 = _S.prop(_S.read(_e, "q"), "k")
	var _v1 = false
	var _v2 = false
	while true:
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "FIRE")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", 95, _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 17), _S.prop(_S.read(_e, "q"), "seed"))]), 30), _S.read(_e, "dt")), "+=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 5), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 3.2), _S.read(_e, "dt")), "-=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "GRIT")):
			_v1 = true
			var _v3 = _S.scope(_e)
			_S.set_prop(_S.read(_v3, "q"), "vy", _S.binary("*", _S.read(_v3, "GRAVITY"), _S.read(_v3, "dt")), "+=", false)
			_S.set_prop(_S.read(_v3, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v3, "q"), "vx"), 0.8), _S.read(_v3, "dt")), "-=", false)
			_S.define(_v3, "g", _S.call_value(_S.read(_v3, "ground"), [_S.prop(_S.read(_v3, "q"), "x")]))
			_S.define(_v3, "ny", _S.binary("+", _S.prop(_S.read(_v3, "q"), "y"), _S.binary("*", _S.prop(_S.read(_v3, "q"), "vy"), _S.read(_v3, "dt"))))
			_S.set_prop(_S.read(_v3, "q"), "x", _S.binary("*", _S.prop(_S.read(_v3, "q"), "vx"), _S.read(_v3, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v3, "q"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v3, "q"), "y"), _S.read(_v3, "g"))), func(): return _S.binary(">=", _S.read(_v3, "ny"), _S.read(_v3, "g")))):
				var _v4 = _S.scope(_v3)
				_S.set_prop(_S.read(_v4, "q"), "y", _S.binary("-", _S.read(_v4, "g"), 0.25), "=", false)
				if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v4, "q"), "vy"), 130), func(): return _S.binary("<", _S.call_value(_S.read(_v4, "rand"), [_S.binary("*", _S.prop(_S.read(_v4, "q"), "seed"), 1000), _S.set_prop(_S.read(_v4, "q"), "hops", 1, "+=", true)]), 0.4))):
					_S.last([_S.set_prop(_S.read(_v4, "q"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v4, "q"), "vy")), 0.25), "=", false), _S.set_prop(_S.read(_v4, "q"), "vx", _S.binary("*", _S.prop(_S.read(_v4, "q"), "vx"), 0.5), "=", false)])
				else:
					_S.last([_S.set_prop(_S.read(_v4, "q"), "vx", _S.set_prop(_S.read(_v4, "q"), "vy", 0, "=", false), "=", false), _S.set_prop(_S.read(_v4, "q"), "life", _S.invoke(_S.read(_v4, "Math"), "min", [_S.prop(_S.read(_v4, "q"), "life"), 0.5]), "=", false)])
			else:
				_S.set_prop(_S.read(_v3, "q"), "y", _S.read(_v3, "ny"), "=", false)
			return null
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "SPARK")):
			_v1 = true
			var _v5 = _S.scope(_e)
			_S.set_prop(_S.read(_v5, "q"), "vy", _S.binary("*", _S.binary("*", _S.read(_v5, "GRAVITY"), 0.45), _S.read(_v5, "dt")), "+=", false)
			_S.set_prop(_S.read(_v5, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v5, "q"), "vx"), 2.2), _S.read(_v5, "dt")), "-=", false)
			_S.set_prop(_S.read(_v5, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v5, "q"), "vy"), 2.2), _S.read(_v5, "dt")), "-=", false)
			_S.define(_v5, "g", _S.call_value(_S.read(_v5, "ground"), [_S.prop(_S.read(_v5, "q"), "x")]))
			_S.define(_v5, "ny", _S.binary("+", _S.prop(_S.read(_v5, "q"), "y"), _S.binary("*", _S.prop(_S.read(_v5, "q"), "vy"), _S.read(_v5, "dt"))))
			_S.set_prop(_S.read(_v5, "q"), "x", _S.binary("*", _S.prop(_S.read(_v5, "q"), "vx"), _S.read(_v5, "dt")), "+=", false)
			if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v5, "q"), "vy"), 0), func(): return _S.binary("<=", _S.prop(_S.read(_v5, "q"), "y"), _S.read(_v5, "g"))), func(): return _S.binary(">=", _S.read(_v5, "ny"), _S.read(_v5, "g")))):
				_S.last([_S.set_prop(_S.read(_v5, "q"), "vy", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v5, "q"), "vy")), 0.45), "=", false), _S.set_prop(_S.read(_v5, "q"), "vx", 0.7, "*=", false), _S.set_prop(_S.read(_v5, "q"), "y", _S.binary("-", _S.read(_v5, "g"), 0.25), "=", false)])
			else:
				_S.set_prop(_S.read(_v5, "q"), "y", _S.read(_v5, "ny"), "=", false)
			return null
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "STREAK")):
			_v1 = true
			_S.last([_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 3), _S.read(_e, "dt")), "+=", false), _S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 3), _S.read(_e, "dt")), "+=", false)])
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "FLAKE")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 2.2), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("-", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 2.2), _S.read(_e, "dt")), _S.binary("*", 35, _S.read(_e, "dt"))), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "x", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.5), _S.prop(_S.read(_e, "q"), "seed"))]), 7), _S.read(_e, "dt")), "+=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "EMBER")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("+", _S.unary("-", 30), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 3), _S.prop(_S.read(_e, "q"), "seed"))]), 20)), _S.read(_e, "dt")), "+=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("+", _S.binary("*", _S.read(_e, "age"), 2.3), _S.prop(_S.read(_e, "q"), "seed"))]), 45), _S.read(_e, "dt")), "+=", false)
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 1.6), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 1.6), _S.read(_e, "dt")), "-=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "SMOKE")):
			_v1 = true
			var _v6 = _S.scope(_e)
			_S.define(_v6, "big", _S.binary("&", _S.prop(_S.read(_v6, "q"), "flag"), _S.prop(_S.read(_v6, "PF"), "BIG")))
			_S.set_prop(_S.read(_v6, "q"), "vy", _S.binary("*", (23 if _S.truth(_S.read(_v6, "big")) else 16), _S.read(_v6, "dt")), "-=", false)
			_S.set_prop(_S.read(_v6, "q"), "vx", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.binary("+", _S.binary("*", _S.read(_v6, "age"), 1.3), _S.prop(_S.read(_v6, "q"), "seed"))]), 8), _S.read(_v6, "dt")), "+=", false)
			_S.set_prop(_S.read(_v6, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "q"), "vx"), 1.6), _S.read(_v6, "dt")), "-=", false)
			_S.set_prop(_S.read(_v6, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v6, "q"), "vy"), 1.2), _S.read(_v6, "dt")), "-=", false)
			break
		if _v1 or _S.binary("===", _v0, _S.prop(_S.read(_e, "P"), "MOTE")):
			_v1 = true
			_S.set_prop(_S.read(_e, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), 0.6), _S.read(_e, "dt")), "-=", false)
			_S.set_prop(_S.read(_e, "q"), "vy", _S.binary("*", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), 0.6), _S.read(_e, "dt")), "-=", false)
			break
		if _v1 or true:
			_v1 = true
			var _v7 = _S.scope(_e)
			_S.define(_v7, "drag", (4 if _S.truth(_S.invoke(_S.read(_v7, "SOFT"), "has", [_S.prop(_S.read(_v7, "q"), "k")])) else 1.6))
			_S.set_prop(_S.read(_v7, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vx"), _S.read(_v7, "drag")), _S.read(_v7, "dt")), "-=", false)
			_S.set_prop(_S.read(_v7, "q"), "vy", _S.binary("+", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v7, "q"), "vy"), _S.read(_v7, "drag")), _S.read(_v7, "dt")), _S.binary("*", 5, _S.read(_v7, "dt"))), "-=", false)
		break
	_S.set_prop(_S.read(_e, "q"), "x", _S.binary("*", _S.prop(_S.read(_e, "q"), "vx"), _S.read(_e, "dt")), "+=", false)
	_S.set_prop(_S.read(_e, "q"), "y", _S.binary("*", _S.prop(_S.read(_e, "q"), "vy"), _S.read(_e, "dt")), "+=", false)
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_t0_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.arg(_args,3)
	var _n_y_b4 = _S.arg(_args,4)
	var _n_r_b5 = _S.arg(_args,5)
	var _n_c_b6 = _S.arg(_args,6)
	var _n_k_b7 = _S.arg(_args,7)
	var _n_life_b8 = _S.arg(_args,8)
	var _n_a_b9 = (_n_t_b1 - _n_t0_b2)
	if _S.truth(((_n_a_b9 < 0) if _S.truth((_n_a_b9 < 0)) else (_n_a_b9 >= _n_life_b8))):
		return null
	var _n_q_b10 = (1 - (float(_n_a_b9)/_n_life_b8))
	_S.invoke(_n_p_b0,"glow",[_n_x_b3, _n_y_b4, (_n_r_b5 * (0.55 + (0.45 * _n_q_b10))), _n_c_b6, ((_n_k_b7 * _n_q_b10) * _n_q_b10)])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_k_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_w_b4 = _S.coalesce(_S.arg(_args,4),func():return 1)
	var _tuple_0 = _n_C_b2
	var _n_halo_b5 = _S.prop(_tuple_0,0)
	var _n_body_b6 = _S.prop(_tuple_0,1)
	var _n_glow_b7 = _S.prop(_tuple_0,2)
	for _iter_1 in _S.array([0, 1, 2]):
		var _n_pass_b8 = _iter_1
		if true:
			var _n_i_b9 = 1
			while _S.truth((_n_i_b9 < _S.prop(_n_pts_b1,"length"))):
				var _tuple_2 = _S.index_value(_n_pts_b1,(_n_i_b9 - 1))
				var _n_ax_b10 = _S.prop(_tuple_2,0)
				var _n_ay_b11 = _S.prop(_tuple_2,1)
				var _tuple_3 = _S.index_value(_n_pts_b1,_n_i_b9)
				var _n_bx_b12 = _S.prop(_tuple_3,0)
				var _n_by_b13 = _S.prop(_tuple_3,1)
				var _n_L_b14 = maxf(1,_S.Bridge.hypot([(_n_bx_b12 - _n_ax_b10), (_n_by_b13 - _n_ay_b11)]))
				if true:
					var _n_d_b15 = 0
					while _S.truth((_n_d_b15 <= _n_L_b14)):
						var _n_x_b16 = (_n_ax_b10 + (float(((_n_bx_b12 - _n_ax_b10) * _n_d_b15))/_n_L_b14))
						var _n_y_b17 = (_n_ay_b11 + (float(((_n_by_b13 - _n_ay_b11) * _n_d_b15))/_n_L_b14))
						if _S.truth(_S.binary("===",_n_pass_b8,0)):
							_S.invoke(_n_p_b0,"circle",[_n_x_b16, _n_y_b17, ((1.6 if _S.truth((_n_k_b3 > 0.6)) else 1.1) * _n_w_b4), _n_halo_b5])
						else:
							if _S.truth(_S.binary("===",_n_pass_b8,1)):
								_S.invoke(_n_p_b0,"circle",[_n_x_b16, _n_y_b17, ((0.9 if _S.truth((_n_k_b3 > 0.6)) else 0.6) * _n_w_b4), _n_body_b6])
							else:
								if _S.truth((_n_k_b3 > 0.3)):
									_S.invoke(_n_p_b0,"px",[_n_x_b16, _n_y_b17, _n_WHITE])
						_n_d_b15 += 0.5
				if _S.truth((_S.binary("===",fmod(_n_i_b9,3),0) if _S.truth(_S.binary("===",_n_pass_b8,0)) else _S.binary("===",_n_pass_b8,0))):
					_S.invoke(_n_p_b0,"glow",[_n_ax_b10, _n_ay_b11, (9 * _n_w_b4), _n_glow_b7, (0.45 * _n_k_b3)])
				_n_i_b9 += 1.0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_Particles = _S.read(_parent,"Particles")
	var _n_period_b0 = _S.arg(_args,0)
	var _n_opts_b1 = _S.coalesce(_S.arg(_args,1),func():return {})
	_S.set_prop(_this,"D",_n_period_b0,"=")
	_S.set_prop(_this,"ground",(_S.named_value(_n_opts_b1,"ground") if _S.named_value(_n_opts_b1,"ground")!=null else _S.function_value(_S.capture(_parent,{"this":_this}),"_f4")),"=")
	_S.set_prop(_this,"box",(_S.named_value(_n_opts_b1,"box") if _S.named_value(_n_opts_b1,"box")!=null else null),"=")
	_S.set_prop(_this,"ps",_S.construct(_n_Particles,[{"ground":_S.named_value(_this,"ground"),"sparks":_S.named_value(_n_opts_b1,"sparks"),"haze":_S.named_value(_n_opts_b1,"haze")}]),"=")
	_S.set_prop(_this,"specs",[],"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	return INF
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_P = _S.read(_parent,"P")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_hex = _S.read(_parent,"hex")
	var _n_born_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_x_b2 = _S.arg(_args,2)
	var _n_y_b3 = _S.arg(_args,3)
	var _n_vx_b4 = _S.arg(_args,4)
	var _n_vy_b5 = _S.arg(_args,5)
	var _n_life_b6 = _S.arg(_args,6)
	var _n_col_b7 = _S.coalesce(_S.arg(_args,7),func():return _n_WHITE)
	var _n_size_b8 = _S.coalesce(_S.arg(_args,8),func():return 1)
	var _n_flag_b9 = _S.coalesce(_S.arg(_args,9),func():return 0)
	var _n_n_b10 = _S.prop(_S.named_value(_this,"specs"),"length")
	var _n_D_b11 = _S.named_value(_this,"D")
	var _n_seed_b12 = (_S.MathFX.rand([_n_n_b10,41]) * 100)
	if _S.truth(_S.binary("===",_n_k_b1,_S.named_value(_n_P,"STAR"))):
		var _n_m_b13 = ceili((float((8 * _n_D_b11))/_n_TAU))
		var _n_f_b14 = ((float((_n_TAU * _n_m_b13))/_n_D_b11) - 8)
		if _S.truth((_n_f_b14 < 5)):
			_n_seed_b12 = (_n_f_b14 + (5 * floori((_S.MathFX.rand([_n_n_b10,43]) * 19))))
	_S.invoke(_S.named_value(_this,"specs"),"push",[{"born":fmod((fmod(_n_born_b0,_n_D_b11) + _n_D_b11),_n_D_b11),"k":_n_k_b1,"x":_n_x_b2,"y":_n_y_b3,"vx":_n_vx_b4,"vy":_n_vy_b5,"life":_n_life_b6,"col":(_S.call_value(_n_hex,[_n_col_b7]) if _S.truth(_n_col_b7) else 0),"size":_n_size_b8,"flag":_n_flag_b9,"seed":_n_seed_b12}])
	return null

static func _f6(_parent,_args:Array,_this=null):
	return _S.prop(_S.named_value(_this,"specs"),"length")
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_STEP = _S.read(_parent,"STEP")
	var _n_move = _S.read(_parent,"move")
	var _n_P = _S.read(_parent,"P")
	var _n_PF = _S.read(_parent,"PF")
	var _n_Object = _S.read(_parent,"Object")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_age_b1 = _S.arg(_args,1)
	var _n_q_b2 = {"k":_S.named_value(_n_s_b0,"k"),"x":_S.named_value(_n_s_b0,"x"),"y":_S.named_value(_n_s_b0,"y"),"vx":_S.named_value(_n_s_b0,"vx"),"vy":_S.named_value(_n_s_b0,"vy"),"life":_S.named_value(_n_s_b0,"life"),"max":_S.named_value(_n_s_b0,"life"),"col":_S.named_value(_n_s_b0,"col"),"size":_S.named_value(_n_s_b0,"size"),"seed":_S.named_value(_n_s_b0,"seed"),"delay":0,"flag":_S.named_value(_n_s_b0,"flag"),"hops":0}
	var _n_a_b3 = 0
	while _S.truth((_n_a_b3 < (_n_age_b1 - 1e-9))):
		var _n_dt_b4 = minf(_n_STEP,(_n_age_b1 - _n_a_b3))
		_S.call_value(_n_move,[_n_q_b2, _n_dt_b4, _n_a_b3, _S.named_value(_this,"ground")])
		_n_a_b3 += _n_dt_b4
		_S.set_prop(_n_q_b2,"life",_n_dt_b4,"-=")
		if _S.truth((_S.named_value(_n_q_b2,"life") <= 0)):
			if _S.truth((_S.binary("!==",_S.named_value(_n_q_b2,"k"),_S.named_value(_n_P,"FIRE")) if _S.truth(_S.binary("!==",_S.named_value(_n_q_b2,"k"),_S.named_value(_n_P,"FIRE"))) else not _S.truth(_S.binary("&",_S.named_value(_n_q_b2,"flag"),_S.named_value(_n_PF,"SMOKES"))))):
				return null
			var _n_big_b5 = _S.binary("&",_S.named_value(_n_q_b2,"flag"),_S.named_value(_n_PF,"BIG"))
			var _n_L_b6 = ((1.3 + _S.MathFX.rand([(_S.named_value(_n_s_b0,"seed") * 7),1])) if _S.truth(_n_big_b5) else (0.8 + (_S.MathFX.rand([(_S.named_value(_n_s_b0,"seed") * 7),1]) * 0.6)))
			_S.invoke(_n_Object,"assign",[_n_q_b2, {"k":_S.named_value(_n_P,"SMOKE"),"vx":(_S.named_value(_n_q_b2,"vx") * 0.6),"vy":((_S.named_value(_n_q_b2,"vy") * 0.6) - 6),"life":_n_L_b6,"max":_n_L_b6,"col":0,"size":(_S.named_value(_n_q_b2,"size") * (0.85 if _S.truth(_n_big_b5) else 0.7)),"flag":(_S.named_value(_n_PF,"BIG") if _S.truth(_n_big_b5) else 0)}])
	if _S.truth(_S.named_value(_this,"box")):
		var _tuple_0 = _S.named_value(_this,"box")
		var _n_x0_b7 = _S.prop(_tuple_0,0)
		var _n_y0_b8 = _S.prop(_tuple_0,1)
		var _n_x1_b9 = _S.prop(_tuple_0,2)
		var _n_y1_b10 = _S.prop(_tuple_0,3)
		if _S.truth(((((_S.named_value(_n_q_b2,"x") < _n_x0_b7) if _S.truth((_S.named_value(_n_q_b2,"x") < _n_x0_b7)) else (_S.named_value(_n_q_b2,"x") > _n_x1_b9)) if _S.truth(((_S.named_value(_n_q_b2,"x") < _n_x0_b7) if _S.truth((_S.named_value(_n_q_b2,"x") < _n_x0_b7)) else (_S.named_value(_n_q_b2,"x") > _n_x1_b9))) else (_S.named_value(_n_q_b2,"y") < _n_y0_b8)) if _S.truth((((_S.named_value(_n_q_b2,"x") < _n_x0_b7) if _S.truth((_S.named_value(_n_q_b2,"x") < _n_x0_b7)) else (_S.named_value(_n_q_b2,"x") > _n_x1_b9)) if _S.truth(((_S.named_value(_n_q_b2,"x") < _n_x0_b7) if _S.truth((_S.named_value(_n_q_b2,"x") < _n_x0_b7)) else (_S.named_value(_n_q_b2,"x") > _n_x1_b9))) else (_S.named_value(_n_q_b2,"y") < _n_y0_b8))) else (_S.named_value(_n_q_b2,"y") > _n_y1_b10))):
			return null
	return _n_q_b2
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_P = _S.read(_parent,"P")
	var _n_PF = _S.read(_parent,"PF")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_D_b1 = _S.named_value(_this,"D")
	var _n_list_b2 = []
	for _iter_0 in _S.array(_S.named_value(_this,"specs")):
		var _n_s_b3 = _iter_0
		var _n_span_b4 = ((_S.named_value(_n_s_b3,"life") + 2.4) if _S.truth((_S.binary("&",_S.named_value(_n_s_b3,"flag"),_S.named_value(_n_PF,"SMOKES")) if _S.truth(_S.binary("===",_S.named_value(_n_s_b3,"k"),_S.named_value(_n_P,"FIRE"))) else _S.binary("===",_S.named_value(_n_s_b3,"k"),_S.named_value(_n_P,"FIRE")))) else _S.named_value(_n_s_b3,"life"))
		if true:
			var _n_age_b5 = fmod((fmod((_n_t_b0 - _S.named_value(_n_s_b3,"born")),_n_D_b1) + _n_D_b1),_n_D_b1)
			while _S.truth((_n_age_b5 < _n_span_b4)):
				var _n_q_b6 = _S.invoke(_this,"state",[_n_s_b3, _n_age_b5])
				if _S.truth(_n_q_b6):
					_S.invoke(_n_list_b2,"push",[_n_q_b6])
				_n_age_b5 += _n_D_b1
	_S.set_prop(_S.named_value(_this,"ps"),"list",_n_list_b2,"=")
	_S.set_prop(_S.named_value(_this,"ps"),"t",_n_t_b0,"=")
	return _S.named_value(_this,"ps")
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_t_b0 = _S.arg(_args,0)
	var _n_t0_b1 = _S.arg(_args,1)
	var _n_D_b2 = _S.arg(_args,2)
	return fmod((fmod((_n_t_b0 - _n_t0_b1),_n_D_b2) + _n_D_b2),_n_D_b2)
	return null
