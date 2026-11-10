@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/transitions/star-iris.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "PAL", _S.import_value("core/index.js", "PAL"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "W", _S.import_value("fx/transitions/_lib.js", "W"))
	_S.define(_e, "H", _S.import_value("fx/transitions/_lib.js", "H"))
	_S.define(_e, "screenMeta", _S.import_value("fx/transitions/_lib.js", "screenMeta"))
	_S.define(_e, "clipTo", _S.import_value("fx/transitions/_lib.js", "clipTo"))
	_S.define(_e, "glint", _S.import_value("fx/transitions/_lib.js", "glint"))
	_S.define(_e, "rect", _S.import_value("fx/transitions/_lib.js", "rect"))
	_S.define(_e, "starAt", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.call_value(_S.read(_e, "screenMeta"), [_S.merge([{"name": "Star iris"}, {"desc": "A five-point star iris spins shut on the middle of the screen, its gold rim lit and its tips twinkling and shedding motes; it closes on a glint and spins open again from a flash."}, {"tags": ["iris", "star", "gold", "wipe"]}, {"duration": 2.2}, {"options": _S.merge([{"palette": _S.prop(_S.read(_e, "PAL"), "gold")}, {"focus": [160, 96]}, {"seed": 1}])}])]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "CLOSE", 0.98)
	_S.define(_e, "OPEN0", 1.16)
	_S.define(_e, "OPEN1", 2)
	_S.define(_e, "RMAX", 430)
	_S.define(_e, "INNER", 0.46)
	_S.define(_e, "RW", 4)
	_S.define(_e, "points", _S.function_value(_e, "_f5"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_RMAX = _S.read(_parent,"RMAX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_OPEN0 = _S.read(_parent,"OPEN0")
	var _n_OPEN1 = _S.read(_parent,"OPEN1")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth((_n_t_b0 < _n_CLOSE)):
		return {"r":(_n_RMAX * pow((1 - _S.invoke(_n_ease,"inOutQuad",[(float(_n_t_b0)/_n_CLOSE)])),1.3)),"a":((float((-PI))/2) + ((_S.invoke(_n_ease,"inOutCubic",[(float(_n_t_b0)/_n_CLOSE)]) * 1.6) * _n_TAU))}
	if _S.truth((_n_t_b0 < _n_OPEN0)):
		return {"r":0,"a":0}
	var _n_u_b1 = clampf((float((_n_t_b0 - _n_OPEN0))/(_n_OPEN1 - _n_OPEN0)),0.0,1.0)
	return {"r":(_n_RMAX * pow(_S.invoke(_n_ease,"inOutCubic",[_n_u_b1]),1.15)),"a":((float((-PI))/2) - ((_S.invoke(_n_ease,"inOutCubic",[_n_u_b1]) * 1.6) * _n_TAU))}
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "ink", _S.call_value(_S.read(_e, "hex"), [_S.prop(_S.read(_e, "o"), "color")]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	var _v0 = _S.prop(_S.read(_e, "o"), "focus")
	_S.define(_e, "fx", _S.prop(_v0, 0))
	_S.define(_e, "fy", _S.prop(_v0, 1))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "t", 0)
	_S.define(_e, "shut", false)
	_S.define(_e, "opened", false)
	_S.define(_e, "prev", _S.call_value(_S.read(_e, "starAt"), [0]))
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	return _S.merge([{"update": _S.function_value(_e, "_f2")}, {"draw": _S.function_value(_e, "_f3")}])

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "s", _S.call_value(_S.read(_e, "starAt"), [_S.read(_e, "t")]))
	_S.define(_e, "pts", _S.call_value(_S.read(_e, "points"), [_S.read(_e, "fx"), _S.read(_e, "fy"), _S.prop(_S.read(_e, "s"), "r"), _S.prop(_S.read(_e, "s"), "a")]))
	_S.define(_e, "spin", _S.binary("/", _S.binary("-", _S.prop(_S.read(_e, "s"), "a"), _S.prop(_S.read(_e, "prev"), "a")), _S.read(_e, "dt")))
	if _S.truth(_S.binary(">", _S.prop(_S.read(_e, "s"), "r"), 2)):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), 10)):
			var _v2 = _S.scope(_v1)
			var _v3 = _S.prop(_S.read(_v2, "pts"), _S.read(_v2, "i"))
			_S.define(_v2, "x", _S.prop(_v3, 0))
			_S.define(_v2, "y", _S.prop(_v3, 1))
			if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.logical("||", _S.binary("<", _S.read(_v2, "x"), 0), func(): return _S.binary("<", _S.read(_v2, "y"), 0)), func(): return _S.binary(">=", _S.read(_v2, "x"), _S.read(_v2, "W"))), func(): return _S.binary(">=", _S.read(_v2, "y"), _S.read(_v2, "H"))), func(): return _S.unary("!", _S.invoke(_S.read(_v2, "R"), "chance", [0.35])))):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "i", 2, "+=", false)
				continue
			_S.define(_v2, "an", _S.binary("+", _S.prop(_S.read(_v2, "s"), "a"), _S.binary("/", _S.binary("*", _S.read(_v2, "i"), _S.prop(_S.read(_v2, "Math"), "PI")), 5)))
			_S.define(_v2, "v", _S.binary("*", _S.binary("*", _S.read(_v2, "spin"), _S.prop(_S.read(_v2, "s"), "r")), 0.25))
			_S.invoke(_S.read(_v2, "ps"), "spawn", [(_S.prop(_S.read(_v2, "P"), "STAR") if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.6])) else _S.prop(_S.read(_v2, "P"), "MOTE")), _S.read(_v2, "x"), _S.read(_v2, "y"), _S.binary("+", _S.binary("*", _S.unary("-", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")])), _S.read(_v2, "v")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), 20)), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "an")]), _S.read(_v2, "v")), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "an")]), 20)), _S.invoke(_S.read(_v2, "Math"), "min", [_S.invoke(_S.read(_v2, "R"), "range", [0.25, 0.55]), _S.binary("-", _S.read(_v2, "end"), _S.read(_v2, "t"))]), (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.invoke(_S.read(_v2, "R"), "chance", [0.5])) else _S.prop(_S.read(_v2, "C"), 5)), _S.invoke(_S.read(_v2, "R"), "range", [0.6, 1.8])])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 2, "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "shut")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CLOSE")))):
		var _v4 = _S.scope(_e)
		_S.write(_v4, "shut", true, "=", false)
		_S.invoke(_S.read(_v4, "lights"), "add", [_S.read(_v4, "fx"), _S.read(_v4, "fy"), 60, _S.prop(_S.read(_v4, "C"), 5), 0.7, 0.3])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "opened")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "OPEN0")))):
		var _v5 = _S.scope(_e)
		_S.write(_v5, "opened", true, "=", false)
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "fx"), _S.read(_v5, "fy"), 120, _S.prop(_S.read(_v5, "C"), 5), 0.7, 0.4])
		_S.invoke(_S.read(_v5, "lights"), "add", [_S.read(_v5, "fx"), _S.read(_v5, "fy"), 40, _S.read(_v5, "WHITE"), 0.8, 0.12])
		var _v6 = _S.scope(_v5)
		_S.define(_v6, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v6, "i"), 24)):
			var _v7 = _S.scope(_v6)
			_S.define(_v7, "a", _S.invoke(_S.read(_v7, "R"), "range", [0, _S.read(_v7, "TAU")]))
			_S.define(_v7, "v", _S.invoke(_S.read(_v7, "R"), "range", [60, 200]))
			_S.invoke(_S.read(_v7, "ps"), "spawn", [_S.prop(_S.read(_v7, "P"), "STAR"), _S.read(_v7, "fx"), _S.read(_v7, "fy"), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "cos", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.binary("*", _S.invoke(_S.read(_v7, "Math"), "sin", [_S.read(_v7, "a")]), _S.read(_v7, "v")), _S.invoke(_S.read(_v7, "R"), "range", [0.3, 0.6]), (_S.read(_v7, "WHITE") if _S.truth(_S.invoke(_S.read(_v7, "R"), "chance", [0.5])) else _S.prop(_S.read(_v7, "C"), 6)), _S.invoke(_S.read(_v7, "R"), "range", [0.6, 2])])
			_v6 = _S.iteration(_v6)
			_S.write(_v6, "i", 1, "+=", true)
	_S.write(_e, "prev", _S.read(_e, "s"), "=", false)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_clipTo = _S.read(_parent,"clipTo")
	var _n_starAt = _S.read(_parent,"starAt")
	var _n_t = _S.read(_parent,"t")
	var _n_CLOSE = _S.read(_parent,"CLOSE")
	var _n_OPEN0 = _S.read(_parent,"OPEN0")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_ink = _S.read(_parent,"ink")
	var _n_rect = _S.read(_parent,"rect")
	var _n_RMAX = _S.read(_parent,"RMAX")
	var _n_points = _S.read(_parent,"points")
	var _n_fx = _S.read(_parent,"fx")
	var _n_fy = _S.read(_parent,"fy")
	var _n_RW = _S.read(_parent,"RW")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_glint = _S.read(_parent,"glint")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p0_b0 = _S.arg(_args,0)
	var _n_p_b1 = _S.call_value(_n_clipTo,[_n_p0_b0])
	var _n_s_b2 = _S.call_value(_n_starAt,[_n_t])
	if _S.truth(((_n_t < _n_OPEN0) if _S.truth((_n_t >= _n_CLOSE)) else (_n_t >= _n_CLOSE))):
		_S.call_value(_n_rect,[_n_p0_b0, 0, 0, _n_W, _n_H, _n_ink])
	else:
		if _S.truth((_S.named_value(_n_s_b2,"r") < (_n_RMAX - 2))):
			var _n_pts_b5 = _S.call_value(_n_points,[_n_fx, _n_fy, _S.named_value(_n_s_b2,"r"), _S.named_value(_n_s_b2,"a")])
			if true:
				var _n_y_b6 = 0
				while _S.truth((_n_y_b6 < _n_H)):
					var _n_yc_b7 = (_n_y_b6 + 0.5)
					var _n_xs_b8 = []
					if true:
						var _n_i_b10 = 0
						var _n_j_b11 = 9
						while _S.truth((_n_i_b10 < 10)):
							var _tuple_0 = _S.index_value(_n_pts_b5,_n_i_b10)
							var _n_xi_b12 = _S.prop(_tuple_0,0)
							var _n_yi_b13 = _S.prop(_tuple_0,1)
							var _tuple_1 = _S.index_value(_n_pts_b5,_n_j_b11)
							var _n_xj_b14 = _S.prop(_tuple_1,0)
							var _n_yj_b15 = _S.prop(_tuple_1,1)
							if _S.truth(_S.binary("!==",(_n_yi_b13 > _n_yc_b7),(_n_yj_b15 > _n_yc_b7))):
								_S.invoke(_n_xs_b8,"push",[(_n_xi_b12 + (float(((_n_yc_b7 - _n_yi_b13) * (_n_xj_b14 - _n_xi_b12)))/(_n_yj_b15 - _n_yi_b13)))])
							_n_j_b11 = _n_i_b10
							_n_i_b10 += 1.0
					_S.invoke(_n_xs_b8,"sort",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f4")])
					var _n_x_b9 = 0
					if true:
						var _n_k_b16 = 0
						while _S.truth(((_n_k_b16 + 1) < _S.prop(_n_xs_b8,"length"))):
							var _n_a_b17 = clampf(floori(_S.index_value(_n_xs_b8,_n_k_b16)+0.5),0,_n_W)
							if _S.truth((_n_a_b17 > _n_x_b9)):
								_S.call_value(_n_rect,[_n_p0_b0, _n_x_b9, _n_y_b6, (_n_a_b17 - _n_x_b9), 1, _n_ink])
							_n_x_b9 = maxf(_n_x_b9,clampf(floori(_S.index_value(_n_xs_b8,(_n_k_b16 + 1))+0.5),0,_n_W))
							_n_k_b16 += 2
					if _S.truth((_n_x_b9 < _n_W)):
						_S.call_value(_n_rect,[_n_p0_b0, _n_x_b9, _n_y_b6, (_n_W - _n_x_b9), 1, _n_ink])
					_n_y_b6 += 1.0
			if true:
				var _n_i_b18 = 0
				var _n_j_b19 = 9
				while _S.truth((_n_i_b18 < 10)):
					var _tuple_2 = _S.index_value(_n_pts_b5,_n_j_b19)
					var _n_ax_b20 = _S.prop(_tuple_2,0)
					var _n_ay_b21 = _S.prop(_tuple_2,1)
					var _tuple_3 = _S.index_value(_n_pts_b5,_n_i_b18)
					var _n_bx_b22 = _S.prop(_tuple_3,0)
					var _n_by_b23 = _S.prop(_tuple_3,1)
					var _n_L_b24 = _S.Bridge.hypot([(_n_bx_b22 - _n_ax_b20), (_n_by_b23 - _n_ay_b21)])
					if _S.truth((_n_L_b24 < 0.5)):
						_n_j_b19 = _n_i_b18
						_n_i_b18 += 1.0
						continue
					var _n_ux_b25 = (float((_n_bx_b22 - _n_ax_b20))/_n_L_b24)
					var _n_uy_b26 = (float((_n_by_b23 - _n_ay_b21))/_n_L_b24)
					var _n_nx_b27 = (-_n_uy_b26)
					var _n_ny_b28 = _n_ux_b25
					var _n_lit_b29 = (((_n_nx_b27 * (-0.6)) + (_n_ny_b28 * (-0.8))) > 0.1)
					if true:
						var _n_sx_b30 = 0
						while _S.truth((_n_sx_b30 <= _n_L_b24)):
							var _n_x0_b31 = (_n_ax_b20 + (_n_ux_b25 * _n_sx_b30))
							var _n_y0_b32 = (_n_ay_b21 + (_n_uy_b26 * _n_sx_b30))
							if _S.truth(((((_n_x0_b31 < (-_n_RW)) if _S.truth((_n_x0_b31 < (-_n_RW))) else (_n_y0_b32 < (-_n_RW))) if _S.truth(((_n_x0_b31 < (-_n_RW)) if _S.truth((_n_x0_b31 < (-_n_RW))) else (_n_y0_b32 < (-_n_RW)))) else (_n_x0_b31 > (_n_W + _n_RW))) if _S.truth((((_n_x0_b31 < (-_n_RW)) if _S.truth((_n_x0_b31 < (-_n_RW))) else (_n_y0_b32 < (-_n_RW))) if _S.truth(((_n_x0_b31 < (-_n_RW)) if _S.truth((_n_x0_b31 < (-_n_RW))) else (_n_y0_b32 < (-_n_RW)))) else (_n_x0_b31 > (_n_W + _n_RW)))) else (_n_y0_b32 > (_n_H + _n_RW)))):
								_n_sx_b30 += 0.5
								continue
							if true:
								var _n_d_b33 = 0
								while _S.truth((_n_d_b33 < _n_RW)):
									var _n_c_b34 = ((_n_WHITE if _S.truth(_n_lit_b29) else _S.index_value(_n_C,6)) if _S.truth((_n_d_b33 < 1)) else (_S.index_value(_n_C,5) if _S.truth((_n_d_b33 < 2)) else (_S.index_value(_n_C,4) if _S.truth((_n_d_b33 < 3)) else _S.index_value(_n_C,3))))
									_S.invoke(_n_p_b1,"px",[(_n_x0_b31 + (_n_nx_b27 * _n_d_b33)), (_n_y0_b32 + (_n_ny_b28 * _n_d_b33)), _n_c_b34])
									_n_d_b33 += 0.5
							if _S.truth(_S.binary("===",fmod(_n_sx_b30,2),0)):
								_S.invoke(_n_p_b1,"light",[_n_x0_b31, _n_y0_b32, _S.index_value(_n_C,5), 0.5])
							_n_sx_b30 += 0.5
					_n_j_b19 = _n_i_b18
					_n_i_b18 += 1.0
			if true:
				var _n_i_b35 = 0
				while _S.truth((_n_i_b35 < 10)):
					var _tuple_4 = _S.index_value(_n_pts_b5,_n_i_b35)
					var _n_x_b36 = _S.prop(_tuple_4,0)
					var _n_y_b37 = _S.prop(_tuple_4,1)
					if _S.truth(((((_n_x_b36 < 2) if _S.truth((_n_x_b36 < 2)) else (_n_y_b37 < 2)) if _S.truth(((_n_x_b36 < 2) if _S.truth((_n_x_b36 < 2)) else (_n_y_b37 < 2))) else (_n_x_b36 > (_n_W - 2))) if _S.truth((((_n_x_b36 < 2) if _S.truth((_n_x_b36 < 2)) else (_n_y_b37 < 2)) if _S.truth(((_n_x_b36 < 2) if _S.truth((_n_x_b36 < 2)) else (_n_y_b37 < 2))) else (_n_x_b36 > (_n_W - 2)))) else (_n_y_b37 > (_n_H - 2)))):
						_n_i_b35 += 2
						continue
					_S.call_value(_n_glint,[_n_p_b1, _n_x_b36, _n_y_b37, (5 + (3 * sin(((_n_t * 13) + _n_i_b35)))), ((_n_t * 2) + _n_i_b35), _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
					_n_i_b35 += 2
			if _S.truth((_S.named_value(_n_s_b2,"r") < 140)):
				_S.invoke(_n_p_b1,"glow",[_n_fx, _n_fy, ((_S.named_value(_n_s_b2,"r") * 0.7) + 8), _S.index_value(_n_C,5), (0.35 * (1 - (float(_S.named_value(_n_s_b2,"r"))/140)))])
	var _n_u_b3 = (_n_t - _n_CLOSE)
	if _S.truth(((_n_u_b3 < 0.2) if _S.truth((_n_u_b3 > (-0.05))) else (_n_u_b3 > (-0.05)))):
		_S.call_value(_n_glint,[_n_p_b1, _n_fx, _n_fy, (14 * (1 - (float(absf(_n_u_b3))/0.2))), (_n_u_b3 * 4), _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
	var _n_v_b4 = (_n_t - _n_OPEN0)
	if _S.truth(((_n_v_b4 < 0.16) if _S.truth((_n_v_b4 >= 0)) else (_n_v_b4 >= 0))):
		_S.call_value(_n_glint,[_n_p_b1, _n_fx, _n_fy, (18 * (1 - (float(_n_v_b4)/0.16))), (0.3 - (_n_v_b4 * 5)), _S.index_value(_n_C,6), _S.index_value(_n_C,5)])
		_S.invoke(_n_p_b1,"glow",[_n_fx, _n_fy, 50, _n_WHITE, (0.5 * (1 - (float(_n_v_b4)/0.16)))])
	_S.invoke(_n_ps,"draw",[_n_p_b1])
	_S.invoke(_n_lights,"draw",[_n_p_b1])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_n_a_b0 - _n_b_b1)
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_Array = _S.read(_parent,"Array")
	var _n_this = _S.read(_parent,"this")
	var _n_fx_b0 = _S.arg(_args,0)
	var _n_fy_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.arg(_args,3)
	return _S.invoke(_n_Array,"from",[{"length":10}, _S.function_value(_S.capture(_parent,{"r":_n_r_b2,"a":_n_a_b3,"fx":_n_fx_b0,"fy":_n_fy_b1,"this":_n_this}),"_f6")])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_r = _S.read(_parent,"r")
	var _n_INNER = _S.read(_parent,"INNER")
	var _n_a = _S.read(_parent,"a")
	var _n_fx = _S.read(_parent,"fx")
	var _n_fy = _S.read(_parent,"fy")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_rr_b2 = ((_n_r * _n_INNER) if _S.truth(fmod(_n_i_b1,2)) else _n_r)
	var _n_an_b3 = (_n_a + (float((_n_i_b1 * PI))/5))
	return [(_n_fx + (cos(_n_an_b3) * _n_rr_b2)), (_n_fy + (sin(_n_an_b3) * _n_rr_b2))]
	return null
