@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/lightning/_lib.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "rng", _S.import_value("core/index.js", "rng"))
	_S.define(_e, "hash", _S.import_value("core/index.js", "hash"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "GRAVITY", _S.import_value("core/index.js", "GRAVITY"))
	_S.define(_e, "FIRE_RAMP", _S.import_value("core/index.js", "FIRE_RAMP"))
	_S.define(_e, "SMOKE_RAMP", _S.import_value("core/index.js", "SMOKE_RAMP"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "zigzag", _S.function_value(_e, "_f0"))
	_S.define(_e, "bowed", _S.function_value(_e, "_f1"))
	_S.define(_e, "bend", _S.function_value(_e, "_f2"))
	_S.define(_e, "mark", _S.function_value(_e, "_f5"))
	_S.define(_e, "stamp", _S.function_value(_e, "_f6"))
	_S.define(_e, "flush", _S.function_value(_e, "_f7"))
	_S.define(_e, "stroke", _S.function_value(_e, "_f8"))
	_S.define(_e, "crackle", _S.function_value(_e, "_f10"))
	_S.define(_e, "trace", _S.function_value(_e, "_f12"))
	_S.define(_e, "scorch", _S.function_value(_e, "_f13"))
	_S.define(_e, "flight", _S.function_value(_e, "_f14"))
	_S.define(_e, "spark", _S.function_value(_e, "_f15"))
	_S.define(_e, "puff", _S.function_value(_e, "_f16"))
	_S.define(_e, "VOLT", ["#120a33", "#2a1b78", "#4630c0", "#5a62f0", "#58a6ff", "#9ed8ff", "#e4f6ff", "#ffffff"])
	_exports["VOLT"] = _S.read(_e, "VOLT")
	_S.define(_e, "PLASMA", ["#ffffff", "#c8f8ff", "#7ff3ff", "#1ab8e6"])
	_exports["PLASMA"] = _S.read(_e, "PLASMA")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#110c16"]))
	_S.define(_e, "SOOT2", _S.call_value(_S.read(_e, "hex"), ["#1c1522"]))
	_exports["SOOT"] = _S.read(_e, "SOOT")
	_exports["SOOT2"] = _S.read(_e, "SOOT2")
	_exports["zigzag"] = _S.read(_e, "zigzag")
	_exports["bowed"] = _S.read(_e, "bowed")
	_exports["bend"] = _S.read(_e, "bend")
	_S.define(_e, "N", 1024)
	_S.define(_e, "HALF", 512)
	_S.define(_e, "GRID", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "N"), _S.read(_e, "N"))]))
	_S.define(_e, "HIT", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f17"))
	_exports["stroke"] = _S.read(_e, "stroke")
	_exports["crackle"] = _S.read(_e, "crackle")
	_S.define(_e, "CROSS", [[1, 0], [_S.unary("-", 1), 0], [0, 1], [0, _S.unary("-", 1)]])
	_exports["trace"] = _S.read(_e, "trace")
	_exports["scorch"] = _S.read(_e, "scorch")
	_S.define(_e, "heat", _S.function_value(_e, "_f18"))
	_exports["heat"] = _S.read(_e, "heat")
	_exports["flight"] = _S.read(_e, "flight")
	_exports["spark"] = _S.read(_e, "spark")
	_exports["puff"] = _S.read(_e, "puff")
	_S.define(_e, "frameRng", _S.function_value(_e, "_f19"))
	_exports["frameRng"] = _S.read(_e, "frameRng")
	_exports["rand"] = _S.read(_e, "rand")
	_exports["rng"] = _S.read(_e, "rng")
	_exports["hash"] = _S.read(_e, "hash")
	_exports["Rng"] = _S.read(_e, "Rng")
	_exports["clamp"] = _S.read(_e, "clamp")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "x0", _S.arg(_args, 1))
	_S.define(_e, "y0", _S.arg(_args, 2))
	_S.define(_e, "x1", _S.arg(_args, 3))
	_S.define(_e, "y1", _S.arg(_args, 4))
	_S.define(_e, "jag", _S.coalesce(_S.arg(_args, 5), func(): return 0.32))
	_S.define(_e, "forks", _S.coalesce(_S.arg(_args, 6), func(): return 0.35))
	_S.define(_e, "w", _S.coalesce(_S.arg(_args, 7), func(): return 1))
	_S.define(_e, "depth", _S.coalesce(_S.arg(_args, 8), func(): return 0))
	_S.define(_e, "out", _S.merge([{"paths": []}]))
	_S.define(_e, "L", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))]))
	_S.define(_e, "pts", [[_S.read(_e, "x0"), _S.read(_e, "y0")], [_S.read(_e, "x1"), _S.read(_e, "y1")]])
	_S.define(_e, "off", _S.binary("*", _S.read(_e, "L"), _S.read(_e, "jag")))
	while _S.truth(_S.binary("<", _S.prop(_S.read(_e, "pts"), "length"), _S.binary("+", 2, _S.binary("/", _S.read(_e, "L"), 3)))):
		var _v0 = _S.scope(_e)
		_S.define(_v0, "nxt", [_S.prop(_S.read(_v0, "pts"), 0)])
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "i"), _S.binary("-", _S.prop(_S.read(_v1, "pts"), "length"), 1))):
			var _v2 = _S.scope(_v1)
			var _v3 = _S.prop(_S.read(_v2, "pts"), _S.read(_v2, "i"))
			_S.define(_v2, "ax", _S.prop(_v3, 0))
			_S.define(_v2, "ay", _S.prop(_v3, 1))
			var _v4 = _S.prop(_S.read(_v2, "pts"), _S.binary("+", _S.read(_v2, "i"), 1))
			_S.define(_v2, "bx", _S.prop(_v4, 0))
			_S.define(_v2, "by", _S.prop(_v4, 1))
			_S.define(_v2, "l", _S.logical("||", _S.invoke(_S.read(_v2, "Math"), "hypot", [_S.binary("-", _S.read(_v2, "bx"), _S.read(_v2, "ax")), _S.binary("-", _S.read(_v2, "by"), _S.read(_v2, "ay"))]), func(): return 1))
			_S.define(_v2, "o", _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", _S.read(_v2, "off")), _S.read(_v2, "off")]))
			_S.invoke(_S.read(_v2, "nxt"), "push", [[_S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v2, "ax"), _S.read(_v2, "bx")), 2), _S.binary("*", _S.binary("/", _S.unary("-", _S.binary("-", _S.read(_v2, "by"), _S.read(_v2, "ay"))), _S.read(_v2, "l")), _S.read(_v2, "o"))), _S.binary("+", _S.binary("/", _S.binary("+", _S.read(_v2, "ay"), _S.read(_v2, "by")), 2), _S.binary("*", _S.binary("/", _S.binary("-", _S.read(_v2, "bx"), _S.read(_v2, "ax")), _S.read(_v2, "l")), _S.read(_v2, "o")))], [_S.read(_v2, "bx"), _S.read(_v2, "by")]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "i", 1, "+=", true)
		_S.write(_v0, "pts", _S.read(_v0, "nxt"), "=", false)
		_S.write(_v0, "off", 0.52, "*=", false)
	_S.invoke(_S.prop(_S.read(_e, "out"), "paths"), "push", [_S.merge([{"pts": _S.read(_e, "pts")}, {"w": _S.read(_e, "w")}])])
	if _S.truth(_S.binary("<", _S.read(_e, "depth"), 2)):
		var _v5 = _S.scope(_e)
		_S.define(_v5, "i", 2)
		while _S.truth(_S.binary("<", _S.read(_v5, "i"), _S.binary("-", _S.prop(_S.read(_v5, "pts"), "length"), 3))):
			if _S.truth(_S.invoke(_S.read(_v5, "R"), "chance", [_S.binary("/", _S.binary("/", _S.read(_v5, "forks"), _S.binary("+", 1, _S.read(_v5, "depth"))), _S.invoke(_S.read(_v5, "Math"), "max", [4, _S.binary("/", _S.prop(_S.read(_v5, "pts"), "length"), 6)]))])):
				var _v6 = _S.scope(_v5)
				var _v7 = _S.prop(_S.read(_v6, "pts"), _S.read(_v6, "i"))
				_S.define(_v6, "ax", _S.prop(_v7, 0))
				_S.define(_v6, "ay", _S.prop(_v7, 1))
				var _v8 = _S.prop(_S.read(_v6, "pts"), _S.invoke(_S.read(_v6, "Math"), "min", [_S.binary("-", _S.prop(_S.read(_v6, "pts"), "length"), 1), _S.binary("+", _S.read(_v6, "i"), 3)]))
				_S.define(_v6, "bx", _S.prop(_v8, 0))
				_S.define(_v6, "by", _S.prop(_v8, 1))
				_S.define(_v6, "a", _S.binary("+", _S.invoke(_S.read(_v6, "Math"), "atan2", [_S.binary("-", _S.read(_v6, "by"), _S.read(_v6, "ay")), _S.binary("-", _S.read(_v6, "bx"), _S.read(_v6, "ax"))]), _S.binary("*", _S.invoke(_S.read(_v6, "R"), "sign", []), _S.invoke(_S.read(_v6, "R"), "range", [0.35, 0.9]))))
				_S.define(_v6, "l", _S.binary("*", _S.binary("-", _S.read(_v6, "L"), _S.binary("*", _S.binary("/", _S.read(_v6, "i"), _S.prop(_S.read(_v6, "pts"), "length")), _S.read(_v6, "L"))), _S.invoke(_S.read(_v6, "R"), "range", [0.25, 0.55])))
				_S.invoke(_S.prop(_S.read(_v6, "out"), "paths"), "push", _S.concat([_S.array(_S.prop(_S.call_value(_S.read(_v6, "zigzag"), [_S.read(_v6, "R"), _S.read(_v6, "ax"), _S.read(_v6, "ay"), _S.binary("+", _S.read(_v6, "ax"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "cos", [_S.read(_v6, "a")]), _S.read(_v6, "l"))), _S.binary("+", _S.read(_v6, "ay"), _S.binary("*", _S.invoke(_S.read(_v6, "Math"), "sin", [_S.read(_v6, "a")]), _S.read(_v6, "l"))), _S.binary("*", _S.read(_v6, "jag"), 1.1), _S.read(_v6, "forks"), _S.binary("*", _S.read(_v6, "w"), 0.55), _S.binary("+", _S.read(_v6, "depth"), 1)]), "paths"))]))
			_v5 = _S.iteration(_v5)
			_S.write(_v5, "i", 1, "+=", true)
	return _S.read(_e, "out")

static func _f1(_parent,_args:Array,_this=null):
	var _n_zigzag = _S.read(_parent,"zigzag")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_x0_b1 = _S.arg(_args,1)
	var _n_y0_b2 = _S.arg(_args,2)
	var _n_x1_b3 = _S.arg(_args,3)
	var _n_y1_b4 = _S.arg(_args,4)
	var _n_bow_b5 = _S.arg(_args,5)
	var _n_jag_b6 = _S.coalesce(_S.arg(_args,6),func():return 0.22)
	var _n_forks_b7 = _S.coalesce(_S.arg(_args,7),func():return 0.4)
	var _n_L_b8 = _S.logical("||",_S.Bridge.hypot([(_n_x1_b3 - _n_x0_b1), (_n_y1_b4 - _n_y0_b2)]),func():return 1)
	var _n_nx_b9 = (float((-(_n_y1_b4 - _n_y0_b2)))/_n_L_b8)
	var _n_ny_b10 = (float((_n_x1_b3 - _n_x0_b1))/_n_L_b8)
	var _n_mx_b11 = (((float((_n_x0_b1 + _n_x1_b3))/2) + (_n_nx_b9 * _n_bow_b5)) + _S.invoke(_n_R_b0,"range",[(-2), 2]))
	var _n_my_b12 = ((float((_n_y0_b2 + _n_y1_b4))/2) + (_n_ny_b10 * _n_bow_b5))
	var _n_a_b13 = _S.call_value(_n_zigzag,[_n_R_b0, _n_x0_b1, _n_y0_b2, _n_mx_b11, _n_my_b12, _n_jag_b6, _n_forks_b7])
	var _n_b_b14 = _S.call_value(_n_zigzag,[_n_R_b0, _n_mx_b11, _n_my_b12, _n_x1_b3, _n_y1_b4, _n_jag_b6, _n_forks_b7])
	return {"paths":_S.concat([[{"pts":_S.concat([_S.array(_S.named_value(_S.index_value(_S.named_value(_n_a_b13,"paths"),0),"pts")),_S.array(_S.invoke(_S.named_value(_S.index_value(_S.named_value(_n_b_b14,"paths"),0),"pts"),"slice",[1]))]),"w":1}],_S.array(_S.invoke(_S.named_value(_n_a_b13,"paths"),"slice",[1])),_S.array(_S.invoke(_S.named_value(_n_b_b14,"paths"),"slice",[1]))])}
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_b_b0 = _S.arg(_args,0)
	var _n_fn_b1 = _S.arg(_args,1)
	return {"paths":_S.invoke(_S.named_value(_n_b_b0,"paths"),"map",[_S.function_value(_S.capture(_parent,{"fn":_n_fn_b1,"this":_this}),"_f3")])}
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_q_b0 = _S.arg(_args,0)
	return {"w":_S.named_value(_n_q_b0,"w"),"pts":_S.invoke(_S.named_value(_n_q_b0,"pts"),"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f4")])}
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_fn = _S.read(_parent,"fn")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return _S.call_value(_n_fn,[_n_x_b0, _n_y_b1])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_HALF = _S.read(_parent,"HALF")
	var _n_N = _S.read(_parent,"N")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_lvl_b2 = _S.arg(_args,2)
	var _n_X_b3 = (floori(_n_x_b0) + _n_HALF)
	var _n_Y_b4 = (floori(_n_y_b1) + _n_HALF)
	if _S.truth(((((_n_X_b3 < 0) if _S.truth((_n_X_b3 < 0)) else (_n_Y_b4 < 0)) if _S.truth(((_n_X_b3 < 0) if _S.truth((_n_X_b3 < 0)) else (_n_Y_b4 < 0))) else (_n_X_b3 >= _n_N)) if _S.truth((((_n_X_b3 < 0) if _S.truth((_n_X_b3 < 0)) else (_n_Y_b4 < 0)) if _S.truth(((_n_X_b3 < 0) if _S.truth((_n_X_b3 < 0)) else (_n_Y_b4 < 0))) else (_n_X_b3 >= _n_N))) else (_n_Y_b4 >= _n_N))):
		return null
	var _n_i_b5 = ((_n_Y_b4 * _n_N) + _n_X_b3)
	var _n_v_b6 = _S.index_value(_n_GRID,_n_i_b5)
	if _S.truth(not _S.truth(_n_v_b6)):
		_S.invoke(_n_HIT,"push",[_n_i_b5])
	if _S.truth((_n_lvl_b2 > _n_v_b6)):
		_S.set_prop(_n_GRID,_n_i_b5,_n_lvl_b2,"=")
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_mark = _S.read(_parent,"mark")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_lvl_b3 = _S.arg(_args,3)
	if _S.truth((_n_r_b2 <= 0.5)):
		return _S.call_value(_n_mark,[floori(_n_x_b0+0.5), floori(_n_y_b1+0.5), _n_lvl_b3])
	var _n_r2_b4 = (_n_r_b2 * _n_r_b2)
	if true:
		var _n_py_b5 = floori((_n_y_b1 - _n_r_b2))
		while _S.truth((_n_py_b5 <= ceili((_n_y_b1 + _n_r_b2)))):
			var _n_dy_b6 = ((_n_py_b5 + 0.5) - _n_y_b1)
			if true:
				var _n_px_b7 = floori((_n_x_b0 - _n_r_b2))
				while _S.truth((_n_px_b7 <= ceili((_n_x_b0 + _n_r_b2)))):
					var _n_dx_b8 = ((_n_px_b7 + 0.5) - _n_x_b0)
					if _S.truth((((_n_dx_b8 * _n_dx_b8) + (_n_dy_b6 * _n_dy_b6)) <= _n_r2_b4)):
						_S.call_value(_n_mark,[_n_px_b7, _n_py_b5, _n_lvl_b3])
					_n_px_b7 += 1.0
			_n_py_b5 += 1.0
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_N = _S.read(_parent,"N")
	var _n_HALF = _S.read(_parent,"HALF")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cols_b1 = _S.arg(_args,1)
	var _n_alphas_b2 = _S.arg(_args,2)
	for _iter_0 in _S.array(_n_HIT):
		var _n_i_b3 = _iter_0
		var _n_v_b4 = _S.index_value(_n_GRID,_n_i_b3)
		_S.set_prop(_n_GRID,_n_i_b3,0,"=")
		var _n_x_b5 = (fmod(_n_i_b3,_n_N) - _n_HALF)
		var _n_y_b6 = (_S.binary("|",(float(_n_i_b3)/_n_N),0) - _n_HALF)
		var _n_a_b7 = (_S.index_value(_n_alphas_b2,(_n_v_b4 - 1)) if _S.truth(_n_alphas_b2) else 1)
		if _S.truth((_n_a_b7 >= 1)):
			_S.invoke(_n_p_b0,"px",[_n_x_b5, _n_y_b6, _S.index_value(_n_cols_b1,(_n_v_b4 - 1))])
		else:
			if _S.truth((_n_a_b7 > 0)):
				_S.invoke(_n_p_b0,"dot",[_n_x_b5, _n_y_b6, _S.index_value(_n_cols_b1,(_n_v_b4 - 1)), _n_a_b7])
	_S.set_prop(_n_HIT,"length",0,"=")
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_walk = _S.read(_parent,"walk")
	var _n_flush = _S.read(_parent,"flush")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_s_b4 = _S.coalesce(_S.arg(_args,4),func():return 1)
	var _n_o_b5 = _S.coalesce(_S.arg(_args,5),func():return {})
	if _S.truth((_n_k_b2 <= 0.02)):
		return null
	var _n_lk_b6 = (_S.named_value(_n_o_b5,"light") if _S.named_value(_n_o_b5,"light")!=null else 0.5)
	for _iter_0 in _S.array(_S.named_value(_n_b_b1,"paths")):
		var _n_q_b8 = _iter_0
		var _n_trunk_b9 = (_S.named_value(_n_q_b8,"w") >= 1)
		if _S.truth(((_n_k_b2 < 0.5) if _S.truth(not _S.truth(_n_trunk_b9)) else not _S.truth(_n_trunk_b9))):
			continue
		var _n_rh_b10 = (((2.1 if _S.truth((_n_k_b2 > 0.6)) else 1.6) if _S.truth(_n_trunk_b9) else 1.1) * _n_s_b4)
		var _n_rb_b11 = (((1.3 if _S.truth((_n_k_b2 > 0.6)) else 0.8) if _S.truth(_n_trunk_b9) else 0.5) * _n_s_b4)
		var _n_pts_b12 = (_S.invoke(_S.named_value(_n_q_b8,"pts"),"slice",[0, maxf(2,ceili((_S.prop(_S.named_value(_n_q_b8,"pts"),"length") * _S.named_value(_n_o_b5,"upTo"))))]) if _S.truth((_n_trunk_b9 if _S.truth(_S.binary("!==",_S.named_value(_n_o_b5,"upTo"),null)) else _S.binary("!==",_S.named_value(_n_o_b5,"upTo"),null))) else _S.named_value(_n_q_b8,"pts"))
		_S.call_value(_n_walk,[_n_pts_b12, _S.function_value(_S.capture(_parent,{"rh":_n_rh_b10,"rb":_n_rb_b11,"trunk":_n_trunk_b9,"k":_n_k_b2,"o":_n_o_b5,"this":_this}),"_f9")])
		if true:
			var _n_i_b13 = 0
			while _S.truth((_n_i_b13 < (_S.prop(_n_pts_b12,"length") - 1))):
				if _S.truth((_S.binary("===",_S.named_value(_n_o_b5,"minY"),null) if _S.truth(_S.binary("===",_S.named_value(_n_o_b5,"minY"),null)) else (_S.index_value(_S.index_value(_n_pts_b12,_n_i_b13),1) > _S.named_value(_n_o_b5,"minY")))):
					_S.invoke(_n_p_b0,"glow",[_S.index_value(_S.index_value(_n_pts_b12,_n_i_b13),0), _S.index_value(_S.index_value(_n_pts_b12,_n_i_b13),1), ((14 if _S.truth(_n_trunk_b9) else 7) * _n_s_b4), _S.index_value(_n_C_b3,4), ((_n_lk_b6 * _n_k_b2) * _S.named_value(_n_q_b8,"w"))])
				_n_i_b13 += 3
	var _n_a_b7 = (_S.named_value(_n_o_b5,"a") if _S.named_value(_n_o_b5,"a")!=null else 1)
	_S.call_value(_n_flush,[_n_p_b0, ([_S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,7), _S.index_value(_n_C_b3,7)] if _S.truth(_S.named_value(_n_o_b5,"hero")) else [_S.index_value(_n_C_b3,2), _S.index_value(_n_C_b3,4), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,7)]), [_n_a_b7, _n_a_b7, _n_a_b7, _n_a_b7]])
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_stamp = _S.read(_parent,"stamp")
	var _n_rh = _S.read(_parent,"rh")
	var _n_rb = _S.read(_parent,"rb")
	var _n_trunk = _S.read(_parent,"trunk")
	var _n_k = _S.read(_parent,"k")
	var _n_o = _S.read(_parent,"o")
	var _n_mark = _S.read(_parent,"mark")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	_S.call_value(_n_stamp,[_n_x_b0, _n_y_b1, _n_rh, 1])
	_S.call_value(_n_stamp,[_n_x_b0, _n_y_b1, _n_rb, (3 if _S.truth(_n_trunk) else 2)])
	if _S.truth(((_n_k > 0.3) if _S.truth(_n_trunk) else _n_trunk)):
		(_S.call_value(_n_stamp,[_n_x_b0, _n_y_b1, _S.named_value(_n_o,"core"), 4]) if _S.truth(_S.named_value(_n_o,"core")) else _S.call_value(_n_mark,[_n_x_b0, _n_y_b1, 4]))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_walk = _S.read(_parent,"walk")
	var _n_flush = _S.read(_parent,"flush")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_glowK_b4 = _S.coalesce(_S.arg(_args,4),func():return 0.5)
	var _n_a_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	if _S.truth((_n_k_b2 <= 0.02)):
		return null
	for _iter_0 in _S.array(_S.named_value(_n_b_b1,"paths")):
		var _n_q_b6 = _iter_0
		var _n_thick_b7 = (_S.named_value(_n_q_b6,"w") >= 1)
		_S.call_value(_n_walk,[_S.named_value(_n_q_b6,"pts"), _S.function_value(_S.capture(_parent,{"k":_n_k_b2,"thick":_n_thick_b7,"q":_n_q_b6,"this":_this}),"_f11")])
		if true:
			var _n_i_b8 = 0
			while _S.truth((_n_i_b8 < (_S.prop(_S.named_value(_n_q_b6,"pts"),"length") - 1))):
				_S.invoke(_n_p_b0,"glow",[_S.index_value(_S.index_value(_S.named_value(_n_q_b6,"pts"),_n_i_b8),0), _S.index_value(_S.index_value(_S.named_value(_n_q_b6,"pts"),_n_i_b8),1), ((9 if _S.truth(_n_thick_b7) else 5) * (0.5 + (_n_k_b2 * 0.5))), _S.index_value(_n_C_b3,4), ((_n_glowK_b4 * _n_k_b2) * _S.named_value(_n_q_b6,"w"))])
				_n_i_b8 += 3
	_S.call_value(_n_flush,[_n_p_b0, [_S.index_value(_n_C_b3,3), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,5), _S.index_value(_n_C_b3,7)], [(minf(1,((_n_k_b2 - 0.45) * 1.6)) * _n_a_b5), _n_a_b5, _n_a_b5, _n_a_b5]])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_k = _S.read(_parent,"k")
	var _n_thick = _S.read(_parent,"thick")
	var _n_mark = _S.read(_parent,"mark")
	var _n_CROSS = _S.read(_parent,"CROSS")
	var _n_q = _S.read(_parent,"q")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	if _S.truth((_n_thick if _S.truth((_n_k > 0.45)) else (_n_k > 0.45))):
		for _iter_0 in _S.array(_n_CROSS):
			var _tuple_1 = _iter_0
			var _n_dx_b2 = _S.prop(_tuple_1,0)
			var _n_dy_b3 = _S.prop(_tuple_1,1)
			_S.call_value(_n_mark,[(_n_x_b0 + (_n_dx_b2 * 1.5)), (_n_y_b1 + (_n_dy_b3 * 1.5)), 1])
	if _S.truth(((_n_thick if _S.truth(_n_thick) else (_S.named_value(_n_q,"w") > 0.4)) if _S.truth((_n_k > 0.25)) else (_n_k > 0.25))):
		_S.call_value(_n_mark,[(_n_x_b0 + 1), _n_y_b1, 2])
		_S.call_value(_n_mark,[_n_x_b0, (_n_y_b1 + 1), 2])
	_S.call_value(_n_mark,[_n_x_b0, _n_y_b1, (4 if _S.truth(((_n_k > 0.3) if _S.truth(_n_thick) else _n_thick)) else 3)])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_pts_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.arg(_args,2)
	var _n_a_b3 = _S.coalesce(_S.arg(_args,3),func():return 1)
	var _n_from_b4 = _S.coalesce(_S.arg(_args,4),func():return 0)
	var _n_to_b5 = _S.coalesce(_S.arg(_args,5),func():return (_S.prop(_n_pts_b1,"length") - 1))
	if true:
		var _n_i_b6 = maxf(0,_n_from_b4)
		while _S.truth((_n_i_b6 < minf(_n_to_b5,(_S.prop(_n_pts_b1,"length") - 1)))):
			_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_n_pts_b1,_n_i_b6),0), _S.index_value(_S.index_value(_n_pts_b1,_n_i_b6),1), _S.index_value(_S.index_value(_n_pts_b1,(_n_i_b6 + 1)),0), _S.index_value(_S.index_value(_n_pts_b1,(_n_i_b6 + 1)),1), _n_c_b2, _n_a_b3])
			_n_i_b6 += 1.0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_FIRE_RAMP = _S.read(_parent,"FIRE_RAMP")
	var _n_SOOT = _S.read(_parent,"SOOT")
	var _n_SOOT2 = _S.read(_parent,"SOOT2")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_cx_b1 = _S.arg(_args,1)
	var _n_cy_b2 = _S.arg(_args,2)
	var _n_rx_b3 = _S.arg(_args,3)
	var _n_T0_b4 = _S.arg(_args,4)
	var _n_fade_b5 = _S.coalesce(_S.arg(_args,5),func():return 1)
	var _n_ry_b6 = _S.coalesce(_S.arg(_args,6),func():return maxf(2.5,(_n_rx_b3 * 0.12)))
	if _S.truth((_n_fade_b5 <= 0)):
		return null
	if true:
		var _n_y_b7 = floori(_n_cy_b2)
		while _S.truth((_n_y_b7 <= (_n_cy_b2 + _n_ry_b6))):
			if true:
				var _n_x_b8 = floori((_n_cx_b1 - _n_rx_b3))
				while _S.truth((_n_x_b8 <= ceili((_n_cx_b1 + _n_rx_b3)))):
					var _n_dx_b9 = (float(((_n_x_b8 + 0.5) - _n_cx_b1))/_n_rx_b3)
					var _n_dy_b10 = (float(((_n_y_b7 + 0.5) - _n_cy_b2))/_n_ry_b6)
					var _n_d_b11 = sqrt(((_n_dx_b9 * _n_dx_b9) + (_n_dy_b10 * _n_dy_b10)))
					if _S.truth((_n_d_b11 > 1)):
						_n_x_b8 += 1.0
						continue
					var _n_n_b12 = _S.MathFX.rand([_n_x_b8,_n_y_b7,41])
					var _n_T_b13 = ((_n_T0_b4 * (1.25 - _n_d_b11)) - (_n_n_b12 * 0.35))
					if _S.truth((_n_T_b13 > 0.06)):
						var _n_c_b14 = _S.index_value(_n_FIRE_RAMP,minf((_S.prop(_n_FIRE_RAMP,"length") - 1),floori(((1 - minf(1,_n_T_b13)) * (_S.prop(_n_FIRE_RAMP,"length") - 1)))))
						_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_y_b7, _n_c_b14, _n_fade_b5])
						if _S.truth(_S.binary("===",_S.binary("&",_n_x_b8,3),0)):
							_S.invoke(_n_p_b0,"glow",[(_n_x_b8 + 0.5), _n_y_b7, 6, _n_c_b14, ((0.18 * _n_T_b13) * _n_fade_b5)])
					else:
						_S.invoke(_n_p_b0,"dot",[_n_x_b8, _n_y_b7, (_n_SOOT if _S.truth((_n_d_b11 < 0.5)) else _n_SOOT2), ((1 if _S.truth((_n_d_b11 < (0.95 - (_n_n_b12 * 0.3)))) else (1 - _n_d_b11)) * _n_fade_b5)])
					_n_x_b8 += 1.0
			_n_y_b7 += 1.0
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_GRAVITY = _S.read(_parent,"GRAVITY")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_vx_b2 = _S.arg(_args,2)
	var _n_vy_b3 = _S.arg(_args,3)
	var _n_age_b4 = _S.arg(_args,4)
	var _object_0 = _S.coalesce(_S.arg(_args,5),func():return {})
	var _n_g_b5 = _S.coalesce(_S.named_value(_object_0,"g"),func():return 0.45)
	var _n_drag_b6 = _S.coalesce(_S.named_value(_object_0,"drag"),func():return 2.2)
	var _n_floor_b7 = _S.coalesce(_S.named_value(_object_0,"floor"),func():return INF)
	var _n_bounce_b8 = _S.coalesce(_S.named_value(_object_0,"bounce"),func():return 0.45)
	var _n_dt_b9 = (float(1)/120)
	if true:
		var _n_s_b10 = 0
		while _S.truth((_n_s_b10 < _n_age_b4)):
			var _n_h_b11 = minf(_n_dt_b9,(_n_age_b4 - _n_s_b10))
			_n_vy_b3 += ((_n_GRAVITY * _n_g_b5) * _n_h_b11)
			_n_vx_b2 -= ((_n_vx_b2 * _n_drag_b6) * _n_h_b11)
			_n_vy_b3 -= ((_n_vy_b3 * _n_drag_b6) * _n_h_b11)
			var _n_ny_b12 = (_n_y_b1 + (_n_vy_b3 * _n_h_b11))
			_n_x_b0 += (_n_vx_b2 * _n_h_b11)
			if _S.truth(((_n_ny_b12 >= _n_floor_b7) if _S.truth(((_n_y_b1 <= _n_floor_b7) if _S.truth((_n_vy_b3 > 0)) else (_n_vy_b3 > 0))) else ((_n_y_b1 <= _n_floor_b7) if _S.truth((_n_vy_b3 > 0)) else (_n_vy_b3 > 0)))):
				_n_vy_b3 = ((-_n_vy_b3) * _n_bounce_b8)
				_n_vx_b2 *= 0.7
				_n_y_b1 = (_n_floor_b7 - 0.25)
			else:
				_n_y_b1 = _n_ny_b12
			_n_s_b10 += _n_dt_b9
	return [_n_x_b0, _n_y_b1, _n_vx_b2, _n_vy_b3]
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_vx_b3 = _S.arg(_args,3)
	var _n_vy_b4 = _S.arg(_args,4)
	var _n_k_b5 = _S.arg(_args,5)
	var _n_S_b6 = _S.arg(_args,6)
	var _n_sp_b7 = _S.logical("||",_S.Bridge.hypot([_n_vx_b3, _n_vy_b4]),func():return 1)
	var _n_ux_b8 = (float(_n_vx_b3)/_n_sp_b7)
	var _n_uy_b9 = (float(_n_vy_b4)/_n_sp_b7)
	var _n_head_b10 = (_S.index_value(_n_S_b6,0) if _S.truth((_n_k_b5 > 0.6)) else (_S.index_value(_n_S_b6,1) if _S.truth((_n_k_b5 > 0.3)) else _S.index_value(_n_S_b6,2)))
	var _n_len_b11 = minf(9,(1 + (_n_sp_b7 * 0.022)))
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - (_n_ux_b8 * _n_len_b11)), (_n_y_b2 - (_n_uy_b9 * _n_len_b11)), (_n_x_b1 - ((_n_ux_b8 * _n_len_b11) * 0.4)), (_n_y_b2 - ((_n_uy_b9 * _n_len_b11) * 0.4)), (_n_head_b10 if _S.truth((_n_k_b5 > 0.5)) else _S.index_value(_n_S_b6,(_S.prop(_n_S_b6,"length") - 1)))])
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 - ((_n_ux_b8 * _n_len_b11) * 0.45)), (_n_y_b2 - ((_n_uy_b9 * _n_len_b11) * 0.45)), _n_x_b1, _n_y_b2, _n_head_b10])
	_S.invoke(_n_p_b0,"glow",[_n_x_b1, _n_y_b2, 3, _n_head_b10, (0.45 * _n_k_b5)])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_SMOKE_RAMP = _S.read(_parent,"SMOKE_RAMP")
	var _n_hex = _S.read(_parent,"hex")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_size_b3 = _S.arg(_args,3)
	var _n_u_b4 = _S.arg(_args,4)
	var _n_c_b5 = _S.arg(_args,5)
	var _n_k_b6 = (1 - _n_u_b4)
	var _n_r_b7 = (_n_size_b3 * ((0.65 + (minf(1,(_n_u_b4 * 2.5)) * 0.45)) + (_n_u_b4 * 0.4)))
	var _n_a_b8 = ((minf(1,(_n_u_b4 * 12)) * minf(1,(_n_k_b6 * 2.4))) * 0.58)
	if _S.truth((_n_a_b8 <= 0.01)):
		return null
	var _n_col_b9 = _S.ColorFX.mix(_n_c_b5,_S.index_value(_n_SMOKE_RAMP,minf((_S.prop(_n_SMOKE_RAMP,"length") - 1),floori((_n_u_b4 * _S.prop(_n_SMOKE_RAMP,"length"))))),_n_u_b4)
	_S.invoke(_n_p_b0,"disc",[_n_x_b1, _n_y_b2, _n_r_b7, _n_col_b9, (_n_a_b8 * 0.45)])
	_S.invoke(_n_p_b0,"disc",[(_n_x_b1 + (_n_r_b7 * 0.05)), (_n_y_b2 + (_n_r_b7 * 0.06)), (_n_r_b7 * 0.74), _n_col_b9, (_n_a_b8 * 0.62)])
	if _S.truth((_n_u_b4 < 0.5)):
		_S.invoke(_n_p_b0,"disc",[(_n_x_b1 - (_n_r_b7 * 0.22)), (_n_y_b2 - (_n_r_b7 * 0.3)), (_n_r_b7 * 0.5), _S.ColorFX.mix(_n_col_b9,_S.call_value(_n_hex,["#ffffff"]),0.12), ((_n_a_b8 * 0.4) * (1 - (_n_u_b4 * 2)))])
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_fn_b1 = _S.arg(_args,1)
	if true:
		var _n_i_b2 = 0
		while _S.truth((_n_i_b2 < (_S.prop(_n_pts_b0,"length") - 1))):
			var _tuple_0 = _S.index_value(_n_pts_b0,_n_i_b2)
			var _n_ax_b3 = _S.prop(_tuple_0,0)
			var _n_ay_b4 = _S.prop(_tuple_0,1)
			var _tuple_1 = _S.index_value(_n_pts_b0,(_n_i_b2 + 1))
			var _n_bx_b5 = _S.prop(_tuple_1,0)
			var _n_by_b6 = _S.prop(_tuple_1,1)
			var _n_l_b7 = maxf(1,_S.Bridge.hypot([(_n_bx_b5 - _n_ax_b3), (_n_by_b6 - _n_ay_b4)]))
			if true:
				var _n_d_b8 = 0
				while _S.truth((_n_d_b8 <= _n_l_b7)):
					_S.call_value(_n_fn_b1,[(_n_ax_b3 + (float(((_n_bx_b5 - _n_ax_b3) * _n_d_b8))/_n_l_b7)), (_n_ay_b4 + (float(((_n_by_b6 - _n_ay_b4) * _n_d_b8))/_n_l_b7)), _n_i_b2])
					_n_d_b8 += 0.5
			_n_i_b2 += 1.0
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_FIRE_RAMP = _S.read(_parent,"FIRE_RAMP")
	var _n_T_b0 = _S.arg(_args,0)
	return (_S.index_value(_n_FIRE_RAMP,minf((_S.prop(_n_FIRE_RAMP,"length") - 1),floori(((1 - minf(1,_n_T_b0)) * (_S.prop(_n_FIRE_RAMP,"length") - 1))))) if _S.truth((_n_T_b0 > 0.06)) else 0)
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_seed_b0 = _S.arg(_args,0)
	var _n_f_b1 = _S.arg(_args,1)
	var _n_salt_b2 = _S.coalesce(_S.arg(_args,2),func():return 0)
	return _S.MathFX.rng([_n_seed_b0,_n_salt_b2,_n_f_b1])
	return null
