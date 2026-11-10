@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ui/achievement.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "star", _S.import_value("core/index.js", "star"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "spell", _S.import_value("fx/ui/_lib.js", "spell"))
	_S.define(_e, "drawWord", _S.import_value("fx/ui/_lib.js", "drawWord"))
	_S.define(_e, "panel", _S.import_value("fx/ui/_lib.js", "panel"))
	_S.define(_e, "medal", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f4"))
	_S.define(_e, "meta", _S.merge([{"name": "Achievement"}, {"desc": "A toast slides in on speed lines and settles; a gold medal pops onto it in a burst of sparkles, a shine sweeps the whole toast, then it slides away."}, {"tags": ["ui", "achievement", "toast", "medal", "reward", "text", "one-shot"]}, {"size": [220, 72]}, {"origin": [110, 36]}, {"duration": 2.4}, {"loop": false}, {"fps": 30}, {"bg": "dark"}, {"options": _S.merge([{"palette": ["#2a1405", "#5c3008", "#9a5a0e", "#d48e18", "#f5b92c", "#ffde5e", "#fff4bc", "#ffffff"]}, {"ribbon": ["#0c1430", "#1f3a7a", "#2f66c4", "#5aa0f0", "#a6d4ff"]}, {"title": "ACHIEVEMENT"}, {"text": "UNLOCKED"}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "PW", 130)
	_S.define(_e, "PH", 34)
	_S.define(_e, "PX", _S.binary("/", _S.unary("-", _S.read(_e, "PW")), 2))
	_S.define(_e, "PY", _S.binary("/", _S.unary("-", _S.read(_e, "PH")), 2))
	_S.define(_e, "IN", 0.2)
	_S.define(_e, "MEDAL", 0.26)
	_S.define(_e, "SHINE", 0.95)
	_S.define(_e, "OUT", 1.92)
	_S.define(_e, "MX", _S.binary("+", _S.read(_e, "PX"), 17))
	_S.define(_e, "MY", 2)
	_S.define(_e, "INK", _S.merge([{"outline": _S.call_value(_S.read(_e, "hex"), ["#0d0a14"])}, {"rim": _S.call_value(_S.read(_e, "hex"), ["#5a4f74"])}, {"top": _S.call_value(_S.read(_e, "hex"), ["#2a2338"])}, {"body": _S.call_value(_S.read(_e, "hex"), ["#211b2d"])}, {"low": _S.call_value(_S.read(_e, "hex"), ["#15111c"])}]))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_PY = _S.read(_parent,"PY")
	var _n_star = _S.read(_parent,"star")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_G_b1 = _S.arg(_args,1)
	var _n_B_b2 = _S.arg(_args,2)
	var _n_x_b3 = _S.arg(_args,3)
	var _n_y_b4 = _S.arg(_args,4)
	var _n_s_b5 = _S.arg(_args,5)
	var _n_white_b6 = _S.arg(_args,6)
	var _n_shine_b7 = _S.arg(_args,7)
	var _n_r_b8 = (10 * _n_s_b5)
	for _iter_0 in _S.array([(-1), 1]):
		var _n_sd_b11 = _iter_0
		_S.invoke(_n_p_b0,"poly",[[[(_n_x_b3 + ((_n_sd_b11 * 2) * _n_s_b5)), ((_n_y_b4 - _n_r_b8) + 2)], [(_n_x_b3 + ((_n_sd_b11 * 7) * _n_s_b5)), ((_n_y_b4 - _n_r_b8) + 2)], [(_n_x_b3 + ((_n_sd_b11 * 9) * _n_s_b5)), (_n_PY + 1)], [(_n_x_b3 + ((_n_sd_b11 * 4) * _n_s_b5)), (_n_PY + 1)]], _S.function_value(_S.capture(_parent,{"x":_n_x_b3,"s":_n_s_b5,"B":_n_B_b2,"this":_this}),"_f1")])
		_S.invoke(_n_p_b0,"line",[(_n_x_b3 + ((_n_sd_b11 * 2) * _n_s_b5)), ((_n_y_b4 - _n_r_b8) + 2), (_n_x_b3 + ((_n_sd_b11 * 4) * _n_s_b5)), (_n_PY + 1), _S.index_value(_n_B_b2,0)])
		_S.invoke(_n_p_b0,"line",[(_n_x_b3 + ((_n_sd_b11 * 7) * _n_s_b5)), ((_n_y_b4 - _n_r_b8) + 2), (_n_x_b3 + ((_n_sd_b11 * 9) * _n_s_b5)), (_n_PY + 1), _S.index_value(_n_B_b2,0)])
	var _n_st_b9 = _S.call_value(_n_star,[_n_x_b3, (_n_y_b4 + 0.5), (2.8 * _n_s_b5), (6.5 * _n_s_b5), 5])
	var _n_inStar_b10 = _S.function_value(_S.capture(_parent,{"st":_n_st_b9,"this":_this}),"_f2")
	_S.invoke(_n_p_b0,"shade",[((_n_x_b3 - _n_r_b8) - 1), ((_n_y_b4 - _n_r_b8) - 1), ((_n_x_b3 + _n_r_b8) + 1), ((_n_y_b4 + _n_r_b8) + 1), _S.function_value(_S.capture(_parent,{"x":_n_x_b3,"y":_n_y_b4,"r":_n_r_b8,"white":_n_white_b6,"G":_n_G_b1,"shine":_n_shine_b7,"inStar":_n_inStar_b10,"this":_this}),"_f3")])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_x = _S.read(_parent,"x")
	var _n_s = _S.read(_parent,"s")
	var _n_px_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_B,2) if _S.truth((absf((_n_px_b0 - _n_x)) < (4.5 * _n_s))) else _S.index_value(_n_B,3))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_st = _S.read(_parent,"st")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_inside_b2 = false
	if true:
		var _n_i_b3 = 0
		var _n_j_b4 = (_S.prop(_n_st,"length") - 1)
		while _S.truth((_n_i_b3 < _S.prop(_n_st,"length"))):
			var _tuple_0 = _S.index_value(_n_st,_n_i_b3)
			var _n_xi_b5 = _S.prop(_tuple_0,0)
			var _n_yi_b6 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_st,_n_j_b4)
			var _n_xj_b7 = _S.prop(_tuple_1,0)
			var _n_yj_b8 = _S.prop(_tuple_1,1)
			if _S.truth(((_n_px_b0 < ((float(((_n_xj_b7 - _n_xi_b5) * (_n_py_b1 - _n_yi_b6)))/(_n_yj_b8 - _n_yi_b6)) + _n_xi_b5)) if _S.truth(_S.binary("!==",(_n_yi_b6 > _n_py_b1),(_n_yj_b8 > _n_py_b1))) else _S.binary("!==",(_n_yi_b6 > _n_py_b1),(_n_yj_b8 > _n_py_b1)))):
				_n_inside_b2 = not _S.truth(_n_inside_b2)
			_n_j_b4 = _n_i_b3
			_n_i_b3 += 1.0
	return _n_inside_b2
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_r = _S.read(_parent,"r")
	var _n_white = _S.read(_parent,"white")
	var _n_G = _S.read(_parent,"G")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_shine = _S.read(_parent,"shine")
	var _n_inStar = _S.read(_parent,"inStar")
	var _n_px_b0 = _S.arg(_args,0)
	var _n_py_b1 = _S.arg(_args,1)
	var _n_dx_b2 = (_n_px_b0 - _n_x)
	var _n_dy_b3 = (_n_py_b1 - _n_y)
	var _n_d_b4 = _S.Bridge.hypot([_n_dx_b2, _n_dy_b3])
	if _S.truth((_n_d_b4 > _n_r)):
		return null
	if _S.truth(_n_white):
		return (_S.index_value(_n_G,6) if _S.truth(((_n_r - _n_d_b4) < 1)) else _n_WHITE)
	if _S.truth(((_n_r - _n_d_b4) < 1)):
		return _S.index_value(_n_G,0)
	var _n_l_b5 = (float((-((_n_dx_b2 * 0.6) + (_n_dy_b3 * 0.8))))/_n_r)
	if _S.truth(((absf(((_n_dx_b2 - (_n_dy_b3 * 0.6)) - _n_shine)) < 1.2) if _S.truth(_S.binary("!==",_n_shine,null)) else _S.binary("!==",_n_shine,null))):
		return _n_WHITE
	if _S.truth(((_n_r - _n_d_b4) < 2.5)):
		return (_S.index_value(_n_G,6) if _S.truth((_n_l_b5 > 0.2)) else (_S.index_value(_n_G,4) if _S.truth((_n_l_b5 > (-0.3))) else _S.index_value(_n_G,3)))
	if _S.truth(_S.call_value(_n_inStar,[_n_px_b0, _n_py_b1])):
		return (_S.index_value(_n_G,2) if _S.truth(_S.logical("||",_S.logical("||",_S.logical("||",not _S.truth(_S.call_value(_n_inStar,[(_n_px_b0 + 1), _n_py_b1])),func():return not _S.truth(_S.call_value(_n_inStar,[(_n_px_b0 - 1), _n_py_b1]))),func():return not _S.truth(_S.call_value(_n_inStar,[_n_px_b0, (_n_py_b1 + 1)]))),func():return not _S.truth(_S.call_value(_n_inStar,[_n_px_b0, (_n_py_b1 - 1)])))) else (_S.index_value(_n_G,7) if _S.truth(((_n_dx_b2 + _n_dy_b3) < 0)) else _S.index_value(_n_G,6)))
	return (_S.index_value(_n_G,5) if _S.truth((_n_l_b5 > 0.4)) else (_S.index_value(_n_G,4) if _S.truth((_n_l_b5 > (-0.2))) else _S.index_value(_n_G,3)))
	return null

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "G", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "B", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "ribbon"), 5]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"sparks": [_S.prop(_S.read(_e, "G"), 7), _S.prop(_S.read(_e, "G"), 6), _S.prop(_S.read(_e, "G"), 5), _S.prop(_S.read(_e, "G"), 3)]}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "title", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "title"), "mini"]))
	_S.define(_e, "sub", _S.call_value(_S.read(_e, "spell"), [_S.prop(_S.read(_e, "o"), "text"), "mini"]))
	_S.define(_e, "TX", _S.binary("+", _S.read(_e, "PX"), 34))
	_S.define(_e, "t", 0)
	_S.define(_e, "popped", false)
	_S.define(_e, "end", _S.binary("-", _S.prop(_S.read(_e, "meta"), "duration"), 0.05))
	_S.define(_e, "xAt", _S.function_value(_e, "_f5"))
	return _S.merge([{"update": _S.function_value(_e, "_f6")}, {"draw": _S.function_value(_e, "_f7")}])

static func _f5(_parent,_args:Array,_this=null):
	var _n_IN = _S.read(_parent,"IN")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	return ((30 * pow((1 - (float(_n_t_b0)/_n_IN)),3)) if _S.truth((_n_t_b0 < _n_IN)) else ((((-3) * exp(((-(_n_t_b0 - _n_IN)) * 12))) * sin(((_n_t_b0 - _n_IN) * 30))) if _S.truth((_n_t_b0 < _n_OUT)) else (((-3) * _S.MathFX.seg(_n_t_b0,_n_OUT,(_n_OUT + 0.06))) if _S.truth((_S.MathFX.seg(_n_t_b0,_n_OUT,(_n_OUT + 0.06)) < 1)) else ((-3) + (33 * _S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_t_b0,(_n_OUT + 0.06),(_n_OUT + 0.24))]))))))
	return null

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "popped")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "MEDAL"), 0.06)))):
		var _v7 = _S.scope(_e)
		_S.write(_v7, "popped", true, "=", false)
		_S.invoke(_S.read(_v7, "lights"), "add", [_S.read(_v7, "MX"), _S.read(_v7, "MY"), 36, _S.prop(_S.read(_v7, "G"), 5), 0.7, 0.4])
		var _v8 = _S.scope(_v7)
		_S.define(_v8, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v8, "i"), 12)):
			var _v9 = _S.scope(_v8)
			_S.define(_v9, "an", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v9, "i"), 12), _S.read(_v9, "TAU")), _S.invoke(_S.read(_v9, "R"), "range", [_S.unary("-", 0.2), 0.2])))
			_S.define(_v9, "sp", _S.invoke(_S.read(_v9, "R"), "range", [40, 90]))
			_S.invoke(_S.read(_v9, "ps"), "spawn", [_S.prop(_S.read(_v9, "P"), "STAR"), _S.binary("+", _S.read(_v9, "MX"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), 9)), _S.binary("+", _S.read(_v9, "MY"), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), 9)), _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "cos", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v9, "Math"), "sin", [_S.read(_v9, "an")]), _S.read(_v9, "sp")), 0.6), _S.invoke(_S.read(_v9, "R"), "range", [0.25, 0.45]), _S.invoke(_S.read(_v9, "R"), "pick", [[_S.prop(_S.read(_v9, "G"), 7), _S.prop(_S.read(_v9, "G"), 6), _S.prop(_S.read(_v9, "G"), 5)]]), (0.6 if _S.truth(_S.binary("%", _S.read(_v9, "i"), 3)) else _S.invoke(_S.read(_v9, "R"), "range", [1.2, 1.8]))])
			_v8 = _S.iteration(_v8)
			_S.write(_v8, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.5), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "OUT"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.05]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.binary("+", _S.read(_e, "MX"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 11), 11])), _S.binary("+", _S.read(_e, "MY"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 11), 9])), 0, _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 10])), _S.invoke(_S.read(_e, "Math"), "min", [_S.invoke(_S.read(_e, "R"), "range", [0.3, 0.5]), _S.binary("-", _S.read(_e, "end"), _S.read(_e, "t"))]), _S.prop(_S.read(_e, "G"), 6), (1.4 if _S.truth(_S.invoke(_S.read(_e, "R"), "chance", [0.3])) else 0.6)])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_xAt = _S.read(_parent,"xAt")
	var _n_t = _S.read(_parent,"t")
	var _n_OUT = _S.read(_parent,"OUT")
	var _n_IN = _S.read(_parent,"IN")
	var _n_PY = _S.read(_parent,"PY")
	var _n_PH = _S.read(_parent,"PH")
	var _n_PW = _S.read(_parent,"PW")
	var _n_SHINE = _S.read(_parent,"SHINE")
	var _n_PX = _S.read(_parent,"PX")
	var _n_ease = _S.read(_parent,"ease")
	var _n_INK = _S.read(_parent,"INK")
	var _n_panel = _S.read(_parent,"panel")
	var _n_G = _S.read(_parent,"G")
	var _n_title = _S.read(_parent,"title")
	var _n_drawWord = _S.read(_parent,"drawWord")
	var _n_sub = _S.read(_parent,"sub")
	var _n_hex = _S.read(_parent,"hex")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_MEDAL = _S.read(_parent,"MEDAL")
	var _n_medal = _S.read(_parent,"medal")
	var _n_B = _S.read(_parent,"B")
	var _n_MX = _S.read(_parent,"MX")
	var _n_MY = _S.read(_parent,"MY")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.call_value(_n_xAt,[_n_t])
	var _n_out_b2 = (_n_t > (_n_OUT + 0.06))
	var _n_a_b3 = (0.5 if _S.truth((_n_t < 0.05)) else ((1 - _S.MathFX.seg(_n_t,(_n_OUT + 0.12),(_n_OUT + 0.24))) if _S.truth(_n_out_b2) else 1))
	if _S.truth((_n_a_b3 <= 0)):
		return null
	var _n_moving_b4 = ((_n_t < (_n_IN * 0.8)) if _S.truth((_n_t < (_n_IN * 0.8))) else _n_out_b2)
	if _S.truth(_n_moving_b4):
		if true:
			var _n_i_b10 = 0
			while _S.truth((_n_i_b10 < 8)):
				var _n_y_b11 = ((_n_PY + 3) + (_S.MathFX.rand([floori((_n_t * 30)),_n_i_b10,1]) * (_n_PH - 6)))
				var _n_L_b12 = (10 + (_S.MathFX.rand([floori((_n_t * 30)),_n_i_b10,2]) * 26))
				var _n_x0_b13 = (((_n_x_b1 + (float(_n_PW)/2)) + 2) + (_S.MathFX.rand([_n_i_b10,3]) * 6))
				_S.invoke(_n_p_b0,"line",[_n_x0_b13, _n_y_b11, minf(106,(_n_x0_b13 + _n_L_b12)), _n_y_b11, _S.function_value(_S.capture(_parent,{"this":_this}),"_f8"), _S.function_value(_S.capture(_parent,{"a":_n_a_b3,"this":_this}),"_f9")])
				_n_i_b10 += 1.0
	var _n_sh_b5 = _S.MathFX.seg(_n_t,_n_SHINE,(_n_SHINE + 0.36))
	var _n_shine_b6 = (((_n_PX - 12) + ((_n_PW + 30) * _S.invoke(_n_ease,"inOutSine",[_n_sh_b5]))) if _S.truth(((_n_sh_b5 < 1) if _S.truth((_n_sh_b5 > 0)) else (_n_sh_b5 > 0))) else null)
	_S.call_value(_n_panel,[_n_p_b0, (_n_PX + _n_x_b1), _n_PY, _n_PW, _n_PH, _n_INK, {"r":4,"a":_n_a_b3,"shine":(null if _S.truth(_S.binary("===",_n_shine_b6,null)) else (_n_shine_b6 + _n_x_b1))}])
	_S.invoke(_n_p_b0,"line",[((_n_PX + _n_x_b1) + 4), (_n_PY + 1), (((_n_PX + _n_x_b1) + _n_PW) - 5), (_n_PY + 1), _S.index_value(_n_G,4), _n_a_b3])
	_S.invoke(_n_p_b0,"px",[((_n_PX + _n_x_b1) + 3), (_n_PY + 1), _S.index_value(_n_G,2)])
	var _n_ti_b7 = _S.invoke(_S.invoke(_S.named_value(_n_title,"letters"),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f10")]),"map",[_S.function_value(_S.capture(_parent,{"x":_n_x_b1,"a":_n_a_b3,"this":_this}),"_f11")])
	_S.call_value(_n_drawWord,[_n_p_b0, _n_ti_b7, {"fill":[_S.index_value(_n_G,4), _S.index_value(_n_G,5), _S.index_value(_n_G,6)],"edge":_S.index_value(_n_G,7),"under":_S.index_value(_n_G,3),"outline":_S.named_value(_n_INK,"outline"),"shadow":0,"shine":(null if _S.truth(_S.binary("===",_n_shine_b6,null)) else (_n_shine_b6 + _n_x_b1)),"shineY":_n_PY,"glint":_S.index_value(_n_G,7)}])
	var _n_si_b8 = _S.invoke(_S.invoke(_S.named_value(_n_sub,"letters"),"filter",[_S.function_value(_S.capture(_parent,{"this":_this}),"_f12")]),"map",[_S.function_value(_S.capture(_parent,{"x":_n_x_b1,"a":_n_a_b3,"this":_this}),"_f13")])
	_S.call_value(_n_drawWord,[_n_p_b0, _n_si_b8, {"fill":[_S.call_value(_n_hex,["#9a94b0"]), _S.call_value(_n_hex,["#d8d4e6"]), _n_WHITE],"edge":_n_WHITE,"under":_S.call_value(_n_hex,["#6e6886"]),"outline":_S.named_value(_n_INK,"outline"),"shadow":0,"shine":(null if _S.truth(_S.binary("===",_n_shine_b6,null)) else (_n_shine_b6 + _n_x_b1)),"shineY":_n_PY}])
	var _n_mk_b9 = (_n_t - _n_MEDAL)
	if _S.truth((_n_mk_b9 > 0)):
		var _n_s_b14 = (1.5 if _S.truth((_n_mk_b9 < 0.035)) else (1 + ((0.35 * exp(((-_n_mk_b9) * 16))) * cos((_n_mk_b9 * 28)))))
		_S.call_value(_n_medal,[_n_p_b0, _n_G, _n_B, (_n_MX + _n_x_b1), _n_MY, _n_s_b14, (_n_mk_b9 < 0.07), (null if _S.truth(_S.binary("===",_n_shine_b6,null)) else ((_n_shine_b6 - _n_MX) + 4))])
		_S.invoke(_n_p_b0,"glow",[(_n_MX + _n_x_b1), _n_MY, 20, _S.index_value(_n_G,5), ((0.3 * _n_a_b3) + ((0.5 * (1 - (float(_n_mk_b9)/0.15))) if _S.truth((_n_mk_b9 < 0.15)) else 0))])
		var _n_g_b15 = (float(fmod((_n_t - 1.5),0.9))/0.9)
		if _S.truth(((_n_g_b15 < 0.25) if _S.truth((_n_t > 1.5)) else (_n_t > 1.5))):
			_S.call_value(_n_sparkle,[_n_p_b0, ((_n_MX + _n_x_b1) - 4), (_n_MY - 4), (4 * sin(((float(_n_g_b15)/0.25) * PI))), _S.index_value(_n_G,7), _S.index_value(_n_G,6), 0.5])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_G = _S.read(_parent,"G")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((_n_u_b0 < 0.3)) else (_S.index_value(_n_G,6) if _S.truth((_n_u_b0 < 0.6)) else _S.index_value(_n_G,4)))
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_a * (1.1 - _n_u_b0))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	return _S.named_value(_n_L_b0,"g")
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_TX = _S.read(_parent,"TX")
	var _n_x = _S.read(_parent,"x")
	var _n_PY = _S.read(_parent,"PY")
	var _n_a = _S.read(_parent,"a")
	var _n_L_b0 = _S.arg(_args,0)
	return {"g":_S.named_value(_n_L_b0,"g"),"x":((_n_TX + _n_x) + (_S.named_value(_n_L_b0,"x") * 2)),"y":(_n_PY + 5),"sx":2,"sy":2,"a":_n_a}
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_L_b0 = _S.arg(_args,0)
	return _S.named_value(_n_L_b0,"g")
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_TX = _S.read(_parent,"TX")
	var _n_x = _S.read(_parent,"x")
	var _n_PY = _S.read(_parent,"PY")
	var _n_a = _S.read(_parent,"a")
	var _n_L_b0 = _S.arg(_args,0)
	return {"g":_S.named_value(_n_L_b0,"g"),"x":((_n_TX + _n_x) + (_S.named_value(_n_L_b0,"x") * 2)),"y":(_n_PY + 19),"sx":2,"sy":2,"a":_n_a}
	return null
