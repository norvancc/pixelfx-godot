@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/force-field.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "band", _S.import_value("core/index.js", "band"))
	_S.define(_e, "bolt", _S.import_value("core/index.js", "bolt"))
	_S.define(_e, "forks", _S.import_value("core/index.js", "forks"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "flash", _S.import_value("fx/scifi/_lib.js", "flash"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "cell", _S.function_value(_e, "_f0"))
	_S.define(_e, "project", _S.function_value(_e, "_f1"))
	_S.define(_e, "shell", _S.function_value(_e, "_f2"))
	_S.define(_e, "cracks", _S.function_value(_e, "_f5"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f8"))
	_S.define(_e, "drawShell", _S.function_value(_e, "_f10"))
	_S.define(_e, "drawFoot", _S.function_value(_e, "_f12"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f14"))
	_S.define(_e, "draw", _S.function_value(_e, "_f15"))
	_S.define(_e, "meta", _S.merge([{"name": "Force field"}, {"desc": "A glassy dome of hex plates over the hero: plates glint, tracers from the right slam into it, a ripple and cracks of light race across, sparks glance off."}, {"tags": ["scifi", "shield", "barrier", "dome", "hex", "hit", "defense", "loop"]}, {"size": [184, 104]}, {"origin": [76, 84]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0b1030", "#152a63", "#1d4f9e", "#2582d2", "#36b9ee", "#8ae8ff", "#d4fbff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"radius": 44}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "HOLD", _S.merge([{"turn": 1}, {"crouch": 3}, {"lean": 1}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 38)}, {"bx": 10}, {"by": _S.unary("-", 38)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "HIT_", _S.merge([_S.read(_e, "HOLD"), {"x": _S.unary("-", 2)}, {"crouch": 5}, {"lean": _S.unary("-", 3)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[0, _S.read(_e, "HOLD")], [0.42, _S.read(_e, "HOLD")], [0.42, _S.read(_e, "HIT_"), "snap"], [0.7, _S.merge([_S.read(_e, "HOLD"), {"x": _S.unary("-", 1)}])], [1.1, _S.read(_e, "HOLD")], [1.5, _S.read(_e, "HOLD")], [1.5, _S.merge([_S.read(_e, "HIT_"), {"crouch": 4}, {"lean": _S.unary("-", 2)}]), "snap"], [1.75, _S.read(_e, "HOLD")], [2.4, _S.read(_e, "HOLD")]]}, {"hits": [_S.merge([{"t": 0.42}, {"stop": 0.07}, {"shake": 0.16}, {"amp": 2}]), _S.merge([{"t": 1.5}, {"stop": 0.03}, {"shake": 0.08}, {"amp": 1}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "S3", _S.invoke(_S.read(_e, "Math"), "sqrt", [3]))
	_S.define(_e, "SA", 0.13)
	_S.define(_e, "CA", _S.invoke(_S.read(_e, "Math"), "sqrt", [_S.binary("-", 1, _S.binary("*", _S.read(_e, "SA"), _S.read(_e, "SA")))]))
	_S.define(_e, "G", 6.3)
	_S.define(_e, "KY", 1.12)
	_S.define(_e, "SHOTS", _S.invoke([_S.merge([{"t": 0.42}, {"lon": 0.66}, {"lat": 0.62}, {"big": true}]), _S.merge([{"t": 1.5}, {"lon": 0.95}, {"lat": 0.26}, {"big": false}])], "map", [_S.function_value(_e, "_f17")]))
	_S.define(_e, "shells", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "crackCache", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "ghostCache", _S.construct(_S.read(_e, "Map"), []))
	_S.define(_e, "glints", _S.function_value(_e, "_f18"))
	_S.define(_e, "glintAt", _S.function_value(_e, "_f19"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_S3 = _S.read(_parent,"S3")
	var _n_gx_b0 = _S.arg(_args,0)
	var _n_gy_b1 = _S.arg(_args,1)
	var _n_fq_b2 = (((float(_n_S3)/3) * _n_gx_b0) - (float(_n_gy_b1)/3))
	var _n_fr_b3 = ((float(2)/3) * _n_gy_b1)
	var _n_fs_b4 = ((-_n_fq_b2) - _n_fr_b3)
	var _n_q_b5 = floori(_n_fq_b2+0.5)
	var _n_r_b6 = floori(_n_fr_b3+0.5)
	var _n_s_b7 = floori(_n_fs_b4+0.5)
	var _n_dq_b8 = absf((_n_q_b5 - _n_fq_b2))
	var _n_dr_b9 = absf((_n_r_b6 - _n_fr_b3))
	var _n_ds_b10 = absf((_n_s_b7 - _n_fs_b4))
	if _S.truth(((_n_dq_b8 > _n_ds_b10) if _S.truth((_n_dq_b8 > _n_dr_b9)) else (_n_dq_b8 > _n_dr_b9))):
		_n_q_b5 = ((-_n_r_b6) - _n_s_b7)
	else:
		if _S.truth((_n_dr_b9 > _n_ds_b10)):
			_n_r_b6 = ((-_n_q_b5) - _n_s_b7)
	var _n_hx_b11 = (_n_S3 * (_n_q_b5 + (float(_n_r_b6)/2)))
	var _n_hy_b12 = (1.5 * _n_r_b6)
	var _n_dx_b13 = (_n_gx_b0 - _n_hx_b11)
	var _n_dy_b14 = (_n_gy_b1 - _n_hy_b12)
	var _n_ax_b15 = absf(_n_dx_b13)
	var _n_e_b16 = (float(maxf(maxf(_n_ax_b15,absf(((float(_n_ax_b15)/2) + (float((_n_dy_b14 * _n_S3))/2)))),absf(((float(_n_ax_b15)/2) - (float((_n_dy_b14 * _n_S3))/2)))))/(float(_n_S3)/2))
	var _n_k_b17 = floori((float((atan2(_n_dy_b14,_n_dx_b13) - (float(PI)/6)))/(float(PI)/3))+0.5)
	var _n_ca_b18 = ((float(PI)/6) + (float((_n_k_b17 * PI))/3))
	return {"q":_n_q_b5,"r":_n_r_b6,"hx":_n_hx_b11,"hy":_n_hy_b12,"e":_n_e_b16,"corner":_S.Bridge.hypot([(_n_dx_b13 - cos(_n_ca_b18)), (_n_dy_b14 - sin(_n_ca_b18))])}
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_CA = _S.read(_parent,"CA")
	var _n_SA = _S.read(_parent,"SA")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_lon_b1 = _S.arg(_args,1)
	var _n_lat_b2 = _S.arg(_args,2)
	var _n_X_b3 = (cos(_n_lat_b2) * sin(_n_lon_b1))
	var _n_Y_b4 = sin(_n_lat_b2)
	var _n_Z_b5 = (cos(_n_lat_b2) * cos(_n_lon_b1))
	return [(_n_R_b0 * _n_X_b3), ((-_n_R_b0) * ((_n_Y_b4 * _n_CA) - (_n_Z_b5 * _n_SA))), ((_n_Y_b4 * _n_SA) + (_n_Z_b5 * _n_CA))]
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "R", _S.arg(_args, 0))
	_S.define(_e, "g", _S.invoke(_S.read(_e, "shells"), "get", [_S.read(_e, "R")]))
	if _S.truth(_S.read(_e, "g")):
		return _S.read(_e, "g")
	_S.define(_e, "near", [])
	_S.define(_e, "far", [])
	_S.define(_e, "N", _S.binary("+", _S.invoke(_S.read(_e, "Math"), "ceil", [_S.read(_e, "R")]), 1))
	_S.define(_e, "W", _S.binary("+", _S.binary("*", 2, _S.read(_e, "N")), 1))
	_S.define(_e, "ids", [_S.construct(_S.read(_e, "Map"), []), _S.construct(_S.read(_e, "Map"), [])])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.unary("-", _S.read(_v0, "N")))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.binary("+", _S.invoke(_S.read(_v0, "Math"), "ceil", [_S.binary("*", _S.read(_v0, "R"), _S.read(_v0, "SA"))]), 1))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.unary("-", _S.read(_v1, "N")))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.read(_v1, "N"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "u", _S.binary("/", _S.binary("+", _S.read(_v2, "x"), 0.5), _S.read(_v2, "R")))
			_S.define(_v2, "vy", _S.binary("/", _S.unary("-", _S.binary("+", _S.read(_v2, "y"), 0.5)), _S.read(_v2, "R")))
			_S.define(_v2, "q", _S.binary("+", _S.binary("*", _S.read(_v2, "u"), _S.read(_v2, "u")), _S.binary("*", _S.read(_v2, "vy"), _S.read(_v2, "vy"))))
			if _S.truth(_S.binary(">", _S.read(_v2, "q"), 1)):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "x", 1, "+=", true)
				continue
			_S.define(_v2, "vz", _S.invoke(_S.read(_v2, "Math"), "sqrt", [_S.binary("-", 1, _S.read(_v2, "q"))]))
			for _v3 in _S.array([1, _S.unary("-", 1)]):
				var _v4 = _S.scope(_v2)
				_S.define(_v4, "s", _v3)
				var _v5 = _S.scope(_v4)
				_S.define(_v5, "Y", _S.binary("+", _S.binary("*", _S.read(_v5, "vy"), _S.read(_v5, "CA")), _S.binary("*", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "vz")), _S.read(_v5, "SA"))))
				_S.define(_v5, "Z", _S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v5, "vy")), _S.read(_v5, "SA")), _S.binary("*", _S.binary("*", _S.read(_v5, "s"), _S.read(_v5, "vz")), _S.read(_v5, "CA"))))
				if _S.truth(_S.binary("<", _S.read(_v5, "Y"), 0)):
					continue
				_S.define(_v5, "lon", _S.invoke(_S.read(_v5, "Math"), "atan2", [_S.read(_v5, "u"), _S.read(_v5, "Z")]))
				_S.define(_v5, "lat", _S.invoke(_S.read(_v5, "Math"), "asin", [_S.invoke(_S.read(_v5, "Math"), "min", [1, _S.read(_v5, "Y")])]))
				_S.define(_v5, "c", _S.call_value(_S.read(_v5, "cell"), [_S.binary("*", _S.read(_v5, "lon"), _S.read(_v5, "G")), _S.binary("*", _S.binary("*", _S.read(_v5, "lat"), _S.read(_v5, "G")), _S.read(_v5, "KY"))]))
				_S.define(_v5, "id", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v5, "c"), "q"), 1000), _S.prop(_S.read(_v5, "c"), "r")))
				_S.invoke((_S.read(_v5, "near") if _S.truth(_S.binary(">", _S.read(_v5, "s"), 0)) else _S.read(_v5, "far")), "push", [_S.merge([{"x": _S.read(_v5, "x")}, {"y": _S.read(_v5, "y")}, {"X": _S.read(_v5, "u")}, {"Y": _S.read(_v5, "Y")}, {"Z": _S.read(_v5, "Z")}, {"lon": _S.read(_v5, "lon")}, {"lat": _S.read(_v5, "lat")}, {"q": _S.prop(_S.read(_v5, "c"), "q")}, {"r": _S.prop(_S.read(_v5, "c"), "r")}, {"id": _S.read(_v5, "id")}, {"e": _S.prop(_S.read(_v5, "c"), "e")}, {"corner": _S.prop(_S.read(_v5, "c"), "corner")}, {"rim": _S.binary("-", 1, _S.read(_v5, "vz"))}, {"sil": _S.binary("*", _S.binary("-", 1, _S.invoke(_S.read(_v5, "Math"), "sqrt", [_S.read(_v5, "q")])), _S.read(_v5, "R"))}])])
				_S.invoke(_S.prop(_S.read(_v5, "ids"), (0 if _S.truth(_S.binary(">", _S.read(_v5, "s"), 0)) else 1)), "set", [_S.binary("+", _S.binary("+", _S.binary("*", _S.binary("+", _S.read(_v5, "y"), _S.read(_v5, "N")), _S.read(_v5, "W")), _S.read(_v5, "x")), _S.read(_v5, "N")), _S.read(_v5, "id")])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke([_S.read(_e, "near"), _S.read(_e, "far")], "forEach", [_S.function_value(_e, "_f3")])
	_S.invoke(_S.read(_e, "shells"), "set", [_S.read(_e, "R"), _S.write(_e, "g", _S.merge([{"near": _S.read(_e, "near")}, {"far": _S.read(_e, "far")}]), "=", false)])
	return _S.read(_e, "g")

static func _f3(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_list_b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	var _n_at_b2 = _S.function_value(_S.capture(_parent,{"i":_n_i_b1,"this":_n_this}),"_f4")
	for _iter_0 in _S.array(_n_list_b0):
		var _n_q_b3 = _iter_0
		var _n_r_b4 = _S.call_value(_n_at_b2,[(_S.named_value(_n_q_b3,"x") + 1), _S.named_value(_n_q_b3,"y")])
		var _n_d_b5 = _S.call_value(_n_at_b2,[_S.named_value(_n_q_b3,"x"), (_S.named_value(_n_q_b3,"y") + 1)])
		var _n_l_b6 = _S.call_value(_n_at_b2,[(_S.named_value(_n_q_b3,"x") - 1), _S.named_value(_n_q_b3,"y")])
		var _n_u_b7 = _S.call_value(_n_at_b2,[_S.named_value(_n_q_b3,"x"), (_S.named_value(_n_q_b3,"y") - 1)])
		_S.set_prop(_n_q_b3,"seam",((_S.binary("!==",_n_r_b4,_S.named_value(_n_q_b3,"id")) if _S.truth(_S.binary("!==",_n_r_b4,null)) else _S.binary("!==",_n_r_b4,null)) if _S.truth((_S.binary("!==",_n_r_b4,_S.named_value(_n_q_b3,"id")) if _S.truth(_S.binary("!==",_n_r_b4,null)) else _S.binary("!==",_n_r_b4,null))) else (_S.binary("!==",_n_d_b5,_S.named_value(_n_q_b3,"id")) if _S.truth(_S.binary("!==",_n_d_b5,null)) else _S.binary("!==",_n_d_b5,null))),"=")
		_S.set_prop(_n_q_b3,"bevel",(((_S.binary("!==",_n_l_b6,_S.named_value(_n_q_b3,"id")) if _S.truth(_S.binary("!==",_n_l_b6,null)) else _S.binary("!==",_n_l_b6,null)) if _S.truth((_S.binary("!==",_n_l_b6,_S.named_value(_n_q_b3,"id")) if _S.truth(_S.binary("!==",_n_l_b6,null)) else _S.binary("!==",_n_l_b6,null))) else (_S.binary("!==",_n_u_b7,_S.named_value(_n_q_b3,"id")) if _S.truth(_S.binary("!==",_n_u_b7,null)) else _S.binary("!==",_n_u_b7,null))) if _S.truth(not _S.truth(_S.named_value(_n_q_b3,"seam"))) else not _S.truth(_S.named_value(_n_q_b3,"seam"))),"=")
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ids = _S.read(_parent,"ids")
	var _n_i = _S.read(_parent,"i")
	var _n_N = _S.read(_parent,"N")
	var _n_W = _S.read(_parent,"W")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.invoke(_S.index_value(_n_ids,_n_i),"get",[((((_n_y_b1 + _n_N) * _n_W) + _n_x_b0) + _n_N)])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_crackCache = _S.read(_parent,"crackCache")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_bolt = _S.read(_parent,"bolt")
	var _n_forks = _S.read(_parent,"forks")
	var _n_R_b0 = _S.arg(_args,0)
	var _n_seed_b1 = _S.arg(_args,1)
	var _n_s_b2 = _S.arg(_args,2)
	var _n_key_b3 = ("" + _S.string(_n_R_b0) + ":" + _S.string(_n_seed_b1) + "")
	if _S.truth(_S.invoke(_n_crackCache,"has",[_n_key_b3])):
		return _S.invoke(_n_crackCache,"get",[_n_key_b3])
	var _n_rn_b4 = _S.construct(_n_Rng,[((_n_seed_b1 * 13) + 5)])
	var _n_out_b5 = []
	var _n_toScreen_b6 = _S.function_value(_S.capture(_parent,{"R":_n_R_b0,"this":_this}),"_f6")
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 5)):
			var _n_a_b8 = (((float(_n_i_b7)/5) * _n_TAU) + _S.invoke(_n_rn_b4,"range",[(-0.35), 0.35]))
			var _n_L_b9 = _S.invoke(_n_rn_b4,"range",[0.42, 0.8])
			var _n_path_b10 = _S.call_value(_n_bolt,[_n_rn_b4, _S.named_value(_n_s_b2,"lon"), _S.named_value(_n_s_b2,"lat"), (_S.named_value(_n_s_b2,"lon") + (float((cos(_n_a_b8) * _n_L_b9))/cos(_S.named_value(_n_s_b2,"lat")))), (_S.named_value(_n_s_b2,"lat") + (sin(_n_a_b8) * _n_L_b9)), {"jag":0.2,"depth":4}])
			_S.invoke(_n_out_b5,"push",[_S.call_value(_n_toScreen_b6,[_n_path_b10, 0, 1])])
			for _iter_0 in _S.array(_S.call_value(_n_forks,[_n_rn_b4, _n_path_b10, {"count":_S.invoke(_n_rn_b4,"int",[0, 2]),"len":(_n_L_b9 * 0.5),"jag":0.25,"spread":0.9}])):
				var _n_f_b11 = _iter_0
				var _n_j_b12 = _S.invoke(_n_path_b10,"findIndex",[_S.function_value(_S.capture(_parent,{"f":_n_f_b11,"this":_this}),"_f7")])
				var _n_u0_b13 = (float(maxf(0,_n_j_b12))/(_S.prop(_n_path_b10,"length") - 1))
				_S.invoke(_n_out_b5,"push",[_S.call_value(_n_toScreen_b6,[_n_f_b11, _n_u0_b13, (_n_u0_b13 + 0.5)])])
			_n_i_b7 += 1.0
	_S.invoke(_n_crackCache,"set",[_n_key_b3, _n_out_b5])
	return _n_out_b5
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_project = _S.read(_parent,"project")
	var _n_R = _S.read(_parent,"R")
	var _n_path_b0 = _S.arg(_args,0)
	var _n_u0_b1 = _S.arg(_args,1)
	var _n_u1_b2 = _S.arg(_args,2)
	var _n_pts_b3 = []
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < _S.prop(_n_path_b0,"length"))):
			var _tuple_0 = _S.index_value(_n_path_b0,_n_i_b4)
			var _n_lon_b5 = _S.prop(_tuple_0,0)
			var _n_lat_b6 = _S.prop(_tuple_0,1)
			if _S.truth((((_n_lat_b6 < 0.03) if _S.truth((_n_lat_b6 < 0.03)) else (_n_lat_b6 > 1.52)) if _S.truth(((_n_lat_b6 < 0.03) if _S.truth((_n_lat_b6 < 0.03)) else (_n_lat_b6 > 1.52))) else (absf(_n_lon_b5) > 1.5))):
				break
			_S.invoke(_n_pts_b3,"push",[_S.concat([_S.array(_S.call_value(_n_project,[_n_R, _n_lon_b5, _n_lat_b6])),[(_n_u0_b1 + (float(((_n_u1_b2 - _n_u0_b1) * _n_i_b4))/(_S.prop(_n_path_b0,"length") - 1)))]])])
			_n_i_b4 += 1.0
	return _n_pts_b3
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_f = _S.read(_parent,"f")
	var _n_q_b0 = _S.arg(_args,0)
	return (_S.binary("===",_S.index_value(_n_q_b0,1),_S.index_value(_S.index_value(_n_f,0),1)) if _S.truth(_S.binary("===",_S.index_value(_n_q_b0,0),_S.index_value(_S.index_value(_n_f,0),0))) else _S.binary("===",_S.index_value(_n_q_b0,0),_S.index_value(_S.index_value(_n_f,0),0)))
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_ghostCache = _S.read(_parent,"ghostCache")
	var _n_meta = _S.read(_parent,"meta")
	var _n_Rng = _S.read(_parent,"Rng")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_project = _S.read(_parent,"project")
	var _n_P = _S.read(_parent,"P")
	var _n_hex = _S.read(_parent,"hex")
	var _n_SHOTS = _S.read(_parent,"SHOTS")
	var _n_glints = _S.read(_parent,"glints")
	var _n_S3 = _S.read(_parent,"S3")
	var _n_G = _S.read(_parent,"G")
	var _n_KY = _S.read(_parent,"KY")
	var _n_glintAt = _S.read(_parent,"glintAt")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_R_b2 = _S.arg(_args,2)
	var _n_key_b3 = ("" + _S.string(_n_R_b2) + ":" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"sparks"),"join",[])) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + "")
	if _S.truth(_S.invoke(_n_ghostCache,"has",[_n_key_b3])):
		return _S.invoke(_n_ghostCache,"get",[_n_key_b3])
	var _n_W_b4 = (_S.index_value(_S.named_value(_n_meta,"size"),0) - _S.index_value(_S.named_value(_n_meta,"origin"),0))
	var _n_rn_b5 = _S.construct(_n_Rng,[_S.named_value(_n_o_b0,"seed")])
	var _n_D_b6 = _S.named_value(_n_meta,"duration")
	var _n_g_b7 = _S.construct(_n_Ghosts,[_n_D_b6, {"ground":_S.function_value(_S.capture(_parent,{"this":_this}),"_f9"),"sparks":_S.named_value(_n_o_b0,"sparks"),"box":[(-70), (-80), (_n_W_b4 - 6), 14]}])
	for _iter_0 in _S.array(_n_SHOTS):
		var _n_s_b8 = _iter_0
		var _tuple_1 = _S.call_value(_n_project,[_n_R_b2, _S.named_value(_n_s_b8,"lon"), _S.named_value(_n_s_b8,"lat")])
		var _n_hx_b9 = _S.prop(_tuple_1,0)
		var _n_hy_b10 = _S.prop(_tuple_1,1)
		var _n_n_b11 = (1 if _S.truth(_S.named_value(_n_s_b8,"big")) else 0.55)
		if true:
			var _n_i_b12 = 0
			while _S.truth((_n_i_b12 < (24 * _n_n_b11))):
				var _n_a_b13 = (((-0.9) if _S.truth(_S.named_value(_n_s_b8,"big")) else (-0.55)) + _S.invoke(_n_rn_b5,"range",[(-0.7), 0.65]))
				var _n_sp_b14 = (_S.invoke(_n_rn_b5,"range",[100, 280]) * (0.7 + (0.3 * _n_n_b11)))
				_S.invoke(_n_g_b7,"add",[(_S.named_value(_n_s_b8,"t") + _S.invoke(_n_rn_b5,"range",[0, 0.02])), _S.named_value(_n_P,"SPARK"), _n_hx_b9, _n_hy_b10, (cos(_n_a_b13) * _n_sp_b14), ((sin(_n_a_b13) * _n_sp_b14) - 30), _S.invoke(_n_rn_b5,"range",[0.25, 0.75])])
				_n_i_b12 += 1.0
		if true:
			var _n_i_b15 = 0
			while _S.truth((_n_i_b15 < (7 * _n_n_b11))):
				var _n_a_b16 = ((-0.9) + _S.invoke(_n_rn_b5,"range",[(-1.2), 1.2]))
				var _n_sp_b17 = _S.invoke(_n_rn_b5,"range",[30, 90])
				_S.invoke(_n_g_b7,"add",[(_S.named_value(_n_s_b8,"t") + _S.invoke(_n_rn_b5,"range",[0, 0.05])), _S.named_value(_n_P,"MOTE"), _n_hx_b9, _n_hy_b10, (cos(_n_a_b16) * _n_sp_b17), ((sin(_n_a_b16) * _n_sp_b17) - 15), _S.invoke(_n_rn_b5,"range",[0.3, 0.6]), _S.invoke(_n_rn_b5,"pick",[[_S.index_value(_n_C_b1,5), _S.index_value(_n_C_b1,6), _S.index_value(_n_C_b1,4)]]), 0.7])
				_n_i_b15 += 1.0
		if true:
			var _n_i_b18 = 0
			while _S.truth((_n_i_b18 < (3 * _n_n_b11))):
				_S.invoke(_n_g_b7,"add",[((_S.named_value(_n_s_b8,"t") + 0.04) + (_n_i_b18 * 0.07)), _S.named_value(_n_P,"STAR"), (_n_hx_b9 + _S.invoke(_n_rn_b5,"range",[(-6), 6])), (_n_hy_b10 + _S.invoke(_n_rn_b5,"range",[(-5), 5])), 0, (-4), _S.invoke(_n_rn_b5,"range",[0.3, 0.5]), _S.index_value(_n_C_b1,6), _S.invoke(_n_rn_b5,"range",[1, 2])])
				_n_i_b18 += 1.0
		if true:
			var _n_i_b19 = 0
			while _S.truth((_n_i_b19 < (3 * _n_n_b11))):
				_S.invoke(_n_g_b7,"add",[((_S.named_value(_n_s_b8,"t") + 0.03) + (_n_i_b19 * 0.04)), _S.named_value(_n_P,"SMOKE"), ((_n_hx_b9 + 2) + _S.invoke(_n_rn_b5,"range",[(-2), 2])), (_n_hy_b10 - 1), _S.invoke(_n_rn_b5,"range",[8, 22]), _S.invoke(_n_rn_b5,"range",[(-14), (-4)]), _S.invoke(_n_rn_b5,"range",[0.9, 1.3]), _S.call_value(_n_hex,["#5b5f78"]), _S.invoke(_n_rn_b5,"range",[2.2, 3.4])])
				_n_i_b19 += 1.0
	if true:
		var _n_r_b20 = 0
		while _S.truth((_n_r_b20 < 12)):
			if true:
				var _n_q_b21 = (-14)
				while _S.truth((_n_q_b21 <= 14)):
					if _S.truth(not _S.truth(_S.call_value(_n_glints,[_S.named_value(_n_o_b0,"seed"), _n_q_b21, _n_r_b20]))):
						_n_q_b21 += 1.0
						continue
					var _n_lon_b22 = (float((_n_S3 * (_n_q_b21 + (float(_n_r_b20)/2))))/_n_G)
					var _n_lat_b23 = (float((1.5 * _n_r_b20))/(_n_G * _n_KY))
					var _tuple_2 = _S.call_value(_n_project,[_n_R_b2, _n_lon_b22, _n_lat_b23])
					var _n_x_b24 = _S.prop(_tuple_2,0)
					var _n_y_b25 = _S.prop(_tuple_2,1)
					var _n_f_b26 = _S.prop(_tuple_2,2)
					if _S.truth(((((_n_f_b26 < 0.25) if _S.truth((_n_f_b26 < 0.25)) else (_n_lat_b23 < 0.15)) if _S.truth(((_n_f_b26 < 0.25) if _S.truth((_n_f_b26 < 0.25)) else (_n_lat_b23 < 0.15))) else (_n_lat_b23 > 1.45)) if _S.truth((((_n_f_b26 < 0.25) if _S.truth((_n_f_b26 < 0.25)) else (_n_lat_b23 < 0.15)) if _S.truth(((_n_f_b26 < 0.25) if _S.truth((_n_f_b26 < 0.25)) else (_n_lat_b23 < 0.15))) else (_n_lat_b23 > 1.45))) else (absf(_n_lon_b22) > 1.3))):
						_n_q_b21 += 1.0
						continue
					_S.invoke(_n_g_b7,"add",[(_S.call_value(_n_glintAt,[_S.named_value(_n_o_b0,"seed"), _n_q_b21, _n_r_b20]) + 0.03), _S.named_value(_n_P,"STAR"), _n_x_b24, _n_y_b25, 0, (-3), 0.4, _S.index_value(_n_C_b1,6), (1.4 + _S.MathFX.rand([_n_q_b21,_n_r_b20,9]))])
					_n_q_b21 += 1.0
			_n_r_b20 += 1.0
	_S.invoke(_n_ghostCache,"set",[_n_key_b3, _n_g_b7])
	return _n_g_b7
	return null

static func _f9(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_shell = _S.read(_parent,"shell")
	var _n_SHOTS = _S.read(_parent,"SHOTS")
	var _n_glints = _S.read(_parent,"glints")
	var _n_glintAt = _S.read(_parent,"glintAt")
	var _n_since = _S.read(_parent,"since")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _n_R_b5 = _S.named_value(_n_o_b2,"radius")
	var _n_D_b6 = _S.named_value(_n_meta,"duration")
	var _n_S_b7 = _S.named_value(_n_o_b2,"seed")
	var _n_ph_b8 = (float(_n_t_b1)/_n_D_b6)
	var _object_0 = _S.call_value(_n_shell,[_n_R_b5])
	var _n_N_b9 = _S.named_value(_object_0,"near")
	var _n_F_b10 = _S.named_value(_object_0,"far")
	var _n_ages_b11 = _S.invoke(_n_SHOTS,"map",[_S.function_value(_S.capture(_parent,{"t":_n_t_b1,"D":_n_D_b6,"this":_this}),"_f11")])
	var _n_sk_b12 = clampf((float((_n_ph_b8 - 0.72))/0.26),0.0,1.0)
	var _n_scanLat_b13 = ((-0.2) + (_n_sk_b12 * 2))
	var _n_scanK_b14 = sin((PI * _n_sk_b12))
	for _iter_1 in _S.array((_n_N_b9 if _S.truth(_n_near_b4) else _n_F_b10)):
		var _n_q_b15 = _iter_1
		var _n_ff_b16 = (_S.named_value(_n_q_b15,"rim") * _S.named_value(_n_q_b15,"rim"))
		var _n_rp_b17 = 0
		var _n_hot_b18 = 0
		if true:
			var _n_i_b21 = 0
			while _S.truth((_n_i_b21 < _S.prop(_n_SHOTS,"length"))):
				var _n_s_b22 = _S.index_value(_n_SHOTS,_n_i_b21)
				var _n_age_b23 = _S.index_value(_n_ages_b11,_n_i_b21)
				if _S.truth((_n_age_b23 >= 1)):
					_n_i_b21 += 1.0
					continue
				var _n_d_b24 = acos(clampf((((_S.named_value(_n_q_b15,"X") * _S.index_value(_S.named_value(_n_s_b22,"N"),0)) + (_S.named_value(_n_q_b15,"Y") * _S.index_value(_S.named_value(_n_s_b22,"N"),1))) + (_S.named_value(_n_q_b15,"Z") * _S.index_value(_S.named_value(_n_s_b22,"N"),2))),(-1),1))
				var _n_f_b25 = (0.06 + (3.1 * _n_age_b23))
				var _n_k_b26 = ((1 - _n_age_b23) * (1 if _S.truth(_S.named_value(_n_s_b22,"big")) else 0.7))
				_n_rp_b17 = maxf(maxf(_n_rp_b17,(exp((-pow((float((_n_d_b24 - _n_f_b25))/0.15),2))) * _n_k_b26)),((((0.22 * _n_k_b26) * _n_k_b26) * (1 - (float(_n_d_b24)/_n_f_b25))) if _S.truth((_n_d_b24 < _n_f_b25)) else 0))
				var _n_hr_b27 = (0.3 if _S.truth(_S.named_value(_n_s_b22,"big")) else 0.17)
				if _S.truth(((_n_d_b24 < _n_hr_b27) if _S.truth((_n_age_b23 < 0.55)) else (_n_age_b23 < 0.55))):
					_n_hot_b18 = maxf(_n_hot_b18,(2 if _S.truth(((_n_d_b24 < (_n_hr_b27 * 0.75)) if _S.truth((_n_age_b23 < 0.07)) else (_n_age_b23 < 0.07))) else (pow((1 - (float(_n_age_b23)/0.55)),1.5) * (1.1 - (float((0.6 * _n_d_b24))/_n_hr_b27)))))
				_n_i_b21 += 1.0
		var _n_gl_b19 = 0
		if _S.truth(_S.call_value(_n_glints,[_n_S_b7, _S.named_value(_n_q_b15,"q"), _S.named_value(_n_q_b15,"r")])):
			var _n_a_b28 = _S.call_value(_n_since,[_n_t_b1, _S.call_value(_n_glintAt,[_n_S_b7, _S.named_value(_n_q_b15,"q"), _S.named_value(_n_q_b15,"r")]), _n_D_b6])
			if _S.truth((_n_a_b28 < 0.45)):
				_n_gl_b19 = (1 - (float(_n_a_b28)/0.45))
		var _n_sc_b20 = (_n_scanK_b14 * exp((-pow((float((_S.named_value(_n_q_b15,"lat") - _n_scanLat_b13))/0.09),2))))
		if _S.truth(not _S.truth(_n_near_b4)):
			if _S.truth(_S.named_value(_n_q_b15,"seam")):
				_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_q_b15,"x") + 0.5), (_S.named_value(_n_q_b15,"y") + 0.5), (_S.index_value(_n_C_b3,5) if _S.truth((_n_rp_b17 > 0.3)) else _S.index_value(_n_C_b3,3)), clampf((((0.18 + (0.25 * _n_ff_b16)) + (0.6 * _n_rp_b17)) + (0.3 * _n_sc_b20)),0.0,1.0)])
			else:
				_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_q_b15,"x") + 0.5), (_S.named_value(_n_q_b15,"y") + 0.5), _S.index_value(_n_C_b3,2), ((0.04 + (0.06 * _n_ff_b16)) + (0.15 * _n_rp_b17))])
			continue
		if _S.truth((_S.named_value(_n_q_b15,"sil") < 1.15)):
			var _n_lit_b29 = (((-_S.named_value(_n_q_b15,"X")) * 0.55) + (_S.named_value(_n_q_b15,"Y") * 0.85))
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), (_n_WHITE if _S.truth(((_n_rp_b17 > 0.4) if _S.truth((_n_rp_b17 > 0.4)) else (_n_lit_b29 > 0.8))) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_lit_b29 > 0.3)) else _S.index_value(_n_C_b3,5)))])
			_S.invoke(_n_p_b0,"light",[_S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), _S.index_value(_n_C_b3,4), 0.3])
			continue
		if _S.truth((_n_hot_b18 >= 2)):
			_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), (_S.index_value(_n_C_b3,6) if _S.truth(_S.named_value(_n_q_b15,"seam")) else _n_WHITE)])
			continue
		if _S.truth(_S.named_value(_n_q_b15,"seam")):
			var _n_I_b30 = (((((((0.12 + (0.5 * _n_ff_b16)) + (0.08 * sin((((_S.named_value(_n_q_b15,"lon") * 2.3) + (_S.named_value(_n_q_b15,"lat") * 3)) - (_n_ph_b8 * _n_TAU))))) + (0.18 if _S.truth((_S.named_value(_n_q_b15,"corner") < 0.32)) else 0)) + (0.9 * _n_gl_b19)) + (0.7 * _n_sc_b20)) + (1.3 * _n_rp_b17)) + _n_hot_b18)
			var _n_c_b31 = (_n_WHITE if _S.truth((((_n_gl_b19 > 0.6) if _S.truth((_n_gl_b19 > 0.6)) else (_n_rp_b17 > 0.55)) if _S.truth(((_n_gl_b19 > 0.6) if _S.truth((_n_gl_b19 > 0.6)) else (_n_rp_b17 > 0.55))) else (_n_hot_b18 > 0.5))) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_I_b30 > 0.8)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_I_b30 > 0.55)) else _S.index_value(_n_C_b3,4))))
			if _S.truth((_n_I_b30 > 0.36)):
				_S.invoke(_n_p_b0,"px",[_S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), _n_c_b31])
			else:
				_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_q_b15,"x") + 0.5), (_S.named_value(_n_q_b15,"y") + 0.5), _n_c_b31, (0.3 + _n_I_b30)])
			_S.invoke(_n_p_b0,"light",[_S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), _S.index_value(_n_C_b3,4), (0.04 + (0.08 * _n_I_b30))])
		else:
			var _n_a_b32 = (((((((0.05 + ((0.34 * _n_ff_b16) * _S.named_value(_n_q_b15,"rim"))) + (0.1 * pow(_S.named_value(_n_q_b15,"e"),4))) + ((0.12 + (0.2 * _n_ff_b16)) if _S.truth(_S.named_value(_n_q_b15,"bevel")) else 0)) + (0.35 * _n_gl_b19)) + (0.1 * _n_sc_b20)) + (0.3 * _n_rp_b17)) + (0.6 * _n_hot_b18))
			var _n_c_b33 = (_n_WHITE if _S.truth((_n_hot_b18 > 0.6)) else (_S.index_value(_n_C_b3,6) if _S.truth(((_n_hot_b18 > 0.3) if _S.truth((_n_hot_b18 > 0.3)) else (_n_gl_b19 > 0.5))) else (_S.index_value(_n_C_b3,5) if _S.truth(((_n_rp_b17 > 0.4) if _S.truth((_n_rp_b17 > 0.4)) else _S.named_value(_n_q_b15,"bevel"))) else (_S.index_value(_n_C_b3,4) if _S.truth((_n_ff_b16 > 0.5)) else _S.index_value(_n_C_b3,3)))))
			_S.invoke(_n_p_b0,"blend",[(_S.named_value(_n_q_b15,"x") + 0.5), (_S.named_value(_n_q_b15,"y") + 0.5), _n_c_b33, clampf(_n_a_b32,0.0,1.0)])
			if _S.truth((((_n_rp_b17 > 0.1) if _S.truth((_n_rp_b17 > 0.1)) else (_n_hot_b18 > 0)) if _S.truth(((_n_rp_b17 > 0.1) if _S.truth((_n_rp_b17 > 0.1)) else (_n_hot_b18 > 0))) else (_n_gl_b19 > 0))):
				_S.invoke(_n_p_b0,"light",[_S.named_value(_n_q_b15,"x"), _S.named_value(_n_q_b15,"y"), _S.index_value(_n_C_b3,4), (0.06 * ((_n_rp_b17 + _n_hot_b18) + _n_gl_b19))])
	return null

static func _f11(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _n_s_b0 = _S.arg(_args,0)
	return _S.call_value(_n_since,[_n_t, _S.named_value(_n_s_b0,"t"), _n_D])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_SA = _S.read(_parent,"SA")
	var _n_band = _S.read(_parent,"band")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_R_b3 = _S.arg(_args,3)
	var _n_near_b4 = _S.arg(_args,4)
	var _n_D_b5 = _S.named_value(_n_meta,"duration")
	var _n_keep_b6 = _S.function_value(_S.capture(_parent,{"near":_n_near_b4,"this":_this}),"_f13")
	_S.call_value(_n_band,[_n_p_b0, 0, 0, (_n_R_b3 + 1), _n_SA, 2, 1, [_S.index_value(_n_C_b2,1), _S.index_value(_n_C_b2,3), _S.index_value(_n_C_b2,5), _S.index_value(_n_C_b2,6)], _n_keep_b6])
	if true:
		var _n_i_b7 = 0
		while _S.truth((_n_i_b7 < 10)):
			var _n_g_b8 = (((float(_n_i_b7)/10) * _n_TAU) + 0.31)
			if _S.truth(not _S.truth(_S.call_value(_n_keep_b6,[_n_g_b8]))):
				_n_i_b7 += 1.0
				continue
			var _n_x_b9 = (cos(_n_g_b8) * (_n_R_b3 - 0.5))
			var _n_y_b10 = ((sin(_n_g_b8) * _n_R_b3) * _n_SA)
			var _n_k_b11 = (0.5 + (0.5 * cos((_n_TAU * ((2 * (float(_n_t_b1)/_n_D_b5)) - (float(_n_i_b7)/10))))))
			_S.invoke(_n_p_b0,"px",[(_n_x_b9 - 1), _n_y_b10, _S.index_value(_n_C_b2,2)])
			_S.invoke(_n_p_b0,"px",[(_n_x_b9 + 1), _n_y_b10, _S.index_value(_n_C_b2,2)])
			_S.invoke(_n_p_b0,"px",[_n_x_b9, _n_y_b10, (_n_WHITE if _S.truth((_n_k_b11 > 0.6)) else _S.index_value(_n_C_b2,5))])
			_S.invoke(_n_p_b0,"glow",[_n_x_b9, _n_y_b10, (6 + (4 * _n_k_b11)), _S.index_value(_n_C_b2,4), ((0.25 if _S.truth(_n_near_b4) else 0.15) * (0.4 + _n_k_b11))])
			_n_i_b7 += 1.0
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_near = _S.read(_parent,"near")
	var _n_g_b0 = _S.arg(_args,0)
	return _S.binary("===",(sin(_n_g_b0) >= 0),_n_near)
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_drawFoot = _S.read(_parent,"drawFoot")
	var _n_drawShell = _S.read(_parent,"drawShell")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_R_b4 = _S.named_value(_n_o_b2,"radius")
	if true:
		var _n_x_b5 = (-_n_R_b4)
		while _S.truth((_n_x_b5 <= _n_R_b4)):
			_S.invoke(_n_p_b0,"glow",[_n_x_b5, (-1), 22, _S.index_value(_n_C_b3,3), 0.1])
			_n_x_b5 += (float(_n_R_b4)/3)
	_S.call_value(_n_drawFoot,[_n_p_b0, _n_t_b1, _n_C_b3, _n_R_b4, false])
	_S.call_value(_n_drawShell,[_n_p_b0, _n_t_b1, _n_o_b2, _n_C_b3, false])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_drawShell = _S.read(_parent,"drawShell")
	var _n_drawFoot = _S.read(_parent,"drawFoot")
	var _n_since = _S.read(_parent,"since")
	var _n_project = _S.read(_parent,"project")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_flash = _S.read(_parent,"flash")
	var _n_SHOTS = _S.read(_parent,"SHOTS")
	var _n_ghosts = _S.read(_parent,"ghosts")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_SP_b4 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"sparks"),4)
	var _n_R_b5 = _S.named_value(_n_o_b2,"radius")
	var _n_D_b6 = _S.named_value(_n_meta,"duration")
	var _n_W_b7 = (_S.index_value(_S.named_value(_n_meta,"size"),0) - _S.index_value(_S.named_value(_n_meta,"origin"),0))
	_S.call_value(_n_drawShell,[_n_p_b0, _n_t_b1, _n_o_b2, _n_C_b3, true])
	_S.call_value(_n_drawFoot,[_n_p_b0, _n_t_b1, _n_C_b3, _n_R_b5, true])
	for _iter_0 in _S.array(_n_SHOTS):
		var _n_s_b9 = _iter_0
		var _n_age_b10 = _S.call_value(_n_since,[_n_t_b1, _S.named_value(_n_s_b9,"t"), _n_D_b6])
		var _tuple_1 = _S.call_value(_n_project,[_n_R_b5, _S.named_value(_n_s_b9,"lon"), _S.named_value(_n_s_b9,"lat")])
		var _n_hx_b11 = _S.prop(_tuple_1,0)
		var _n_hy_b12 = _S.prop(_tuple_1,1)
		var _n_n_b13 = (1 if _S.truth(_S.named_value(_n_s_b9,"big")) else 0.6)
		if _S.truth(((_n_age_b10 < 0.9) if _S.truth(_S.named_value(_n_s_b9,"big")) else _S.named_value(_n_s_b9,"big"))):
			var _n_fade_b15 = (1 - _S.MathFX.smooth(0.35,0.9,_n_age_b10))
			var _n_reach_b16 = clampf((float(_n_age_b10)/0.09),0.0,1.0)
			for _iter_2 in _S.array([0, 1]):
				var _n_pass_b17 = _iter_2
				for _iter_3 in _S.array(_S.call_value(_n_cracks,[_n_R_b5, _S.named_value(_n_o_b2,"seed"), _n_s_b9])):
					var _n_c_b18 = _iter_3
					if true:
						var _n_i_b19 = 1
						while _S.truth((_n_i_b19 < _S.prop(_n_c_b18,"length"))):
							var _tuple_4 = _S.index_value(_n_c_b18,(_n_i_b19 - 1))
							var _n_x0_b20 = _S.prop(_tuple_4,0)
							var _n_y0_b21 = _S.prop(_tuple_4,1)
							var _n_f0_b22 = _S.prop(_tuple_4,2)
							var _tuple_5 = _S.index_value(_n_c_b18,_n_i_b19)
							var _n_x1_b23 = _S.prop(_tuple_5,0)
							var _n_y1_b24 = _S.prop(_tuple_5,1)
							var _n_f1_b25 = _S.prop(_tuple_5,2)
							var _n_u_b26 = _S.prop(_tuple_5,3)
							if _S.truth((((_n_u_b26 > _n_reach_b16) if _S.truth((_n_u_b26 > _n_reach_b16)) else (_n_f0_b22 < 0.05)) if _S.truth(((_n_u_b26 > _n_reach_b16) if _S.truth((_n_u_b26 > _n_reach_b16)) else (_n_f0_b22 < 0.05))) else (_n_f1_b25 < 0.05))):
								_n_i_b19 += 1.0
								continue
							var _n_k_b27 = (_n_fade_b15 * (1.2 - (_n_u_b26 * 0.4)))
							if _S.truth(_S.binary("===",_n_pass_b17,0)):
								if _S.truth((_n_age_b10 < 0.32)):
									for _iter_6 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
										var _tuple_7 = _iter_6
										var _n_ox_b28 = _S.prop(_tuple_7,0)
										var _n_oy_b29 = _S.prop(_tuple_7,1)
										_S.invoke(_n_p_b0,"line",[(_n_x0_b20 + _n_ox_b28), (_n_y0_b21 + _n_oy_b29), (_n_x1_b23 + _n_ox_b28), (_n_y1_b24 + _n_oy_b29), (_S.index_value(_n_C_b3,6) if _S.truth((_n_age_b10 < 0.12)) else _S.index_value(_n_C_b3,5)), (_n_k_b27 * (1 - (float(_n_age_b10)/0.32)))])
								_n_i_b19 += 1.0
								continue
							_S.invoke(_n_p_b0,"line",[_n_x0_b20, _n_y0_b21, _n_x1_b23, _n_y1_b24, (_n_WHITE if _S.truth((_n_age_b10 < (0.12 + (_n_u_b26 * 0.08)))) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_age_b10 < (0.3 + (_n_u_b26 * 0.1)))) else _S.index_value(_n_C_b3,5))), _n_k_b27])
							if _S.truth(_S.binary("===",fmod(_n_i_b19,3),0)):
								_S.invoke(_n_p_b0,"glow",[_n_x1_b23, _n_y1_b24, 6, _S.index_value(_n_C_b3,4), ((0.35 * _n_fade_b15) * (1 - (_n_u_b26 * 0.5)))])
							_n_i_b19 += 1.0
		var _n_tk_b14 = (float((_n_t_b1 - (_S.named_value(_n_s_b9,"t") - 0.1)))/0.1)
		if _S.truth(((_n_tk_b14 < 1) if _S.truth((_n_tk_b14 >= 0)) else (_n_tk_b14 >= 0))):
			var _n_sx_b30 = (_n_W_b7 - 3)
			var _n_sy_b31 = (_n_hy_b12 - 12)
			var _n_L_b32 = _S.Bridge.hypot([(_n_sx_b30 - _n_hx_b11), (_n_sy_b31 - _n_hy_b12)])
			var _n_at_b33 = _S.function_value(_S.capture(_parent,{"sx":_n_sx_b30,"hx":_n_hx_b11,"L":_n_L_b32,"sy":_n_sy_b31,"hy":_n_hy_b12,"this":_this}),"_f16")
			var _n_h_b34 = (_n_L_b32 * _n_tk_b14)
			var _tuple_8 = _S.call_value(_n_at_b33,[_n_h_b34])
			var _n_x_b35 = _S.prop(_tuple_8,0)
			var _n_y_b36 = _S.prop(_tuple_8,1)
			var _tuple_9 = _S.call_value(_n_at_b33,[(_n_h_b34 - 2)])
			var _n_x2_b37 = _S.prop(_tuple_9,0)
			var _n_y2_b38 = _S.prop(_tuple_9,1)
			var _tuple_10 = _S.call_value(_n_at_b33,[(_n_h_b34 - 7)])
			var _n_x7_b39 = _S.prop(_tuple_10,0)
			var _n_y7_b40 = _S.prop(_tuple_10,1)
			var _tuple_11 = _S.call_value(_n_at_b33,[(_n_h_b34 - 16)])
			var _n_x16_b41 = _S.prop(_tuple_11,0)
			var _n_y16_b42 = _S.prop(_tuple_11,1)
			_S.invoke(_n_p_b0,"line",[_n_x16_b41, _n_y16_b42, _n_x7_b39, _n_y7_b40, _S.index_value(_n_SP_b4,3)])
			_S.invoke(_n_p_b0,"line",[_n_x7_b39, _n_y7_b40, _n_x2_b37, _n_y2_b38, _S.index_value(_n_SP_b4,1)])
			_S.invoke(_n_p_b0,"line",[_n_x2_b37, _n_y2_b38, _n_x_b35, _n_y_b36, _S.index_value(_n_SP_b4,0)])
			_S.invoke(_n_p_b0,"px",[_n_x_b35, _n_y_b36, _n_WHITE])
			_S.invoke(_n_p_b0,"glow",[_n_x_b35, _n_y_b36, 9, _S.index_value(_n_SP_b4,1), 0.55])
		if _S.truth((_n_age_b10 < 0.14)):
			_S.call_value(_n_sparkle,[_n_p_b0, _n_hx_b11, _n_hy_b12, (((7 * (1 - (float(_n_age_b10)/0.14))) + 1) * _n_n_b13), _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.4])
		_S.call_value(_n_flash,[_n_p_b0, _n_t_b1, _S.named_value(_n_s_b9,"t"), _n_hx_b11, _n_hy_b12, (56 * _n_n_b13), _S.index_value(_n_C_b3,4), 0.45, 0.45])
		_S.call_value(_n_flash,[_n_p_b0, _n_t_b1, _S.named_value(_n_s_b9,"t"), _n_hx_b11, _n_hy_b12, 12, _n_WHITE, (0.5 * _n_n_b13), 0.08])
		_S.call_value(_n_flash,[_n_p_b0, _n_t_b1, _S.named_value(_n_s_b9,"t"), (_n_hx_b11 + 3), _n_hy_b12, 22, _S.index_value(_n_SP_b4,1), (0.4 * _n_n_b13), 0.15])
	var _n_a0_b8 = _S.call_value(_n_since,[_n_t_b1, _S.named_value(_S.index_value(_n_SHOTS,0),"t"), _n_D_b6])
	_S.invoke(_n_p_b0,"glow",[0, ((-_n_R_b5) * 0.45), (_n_R_b5 * 1.3), _S.index_value(_n_C_b3,3), (0.11 + (0.1 * maxf(0,(1 - (_n_a0_b8 * 2)))))])
	_S.invoke(_S.invoke(_S.call_value(_n_ghosts,[_n_o_b2, _n_C_b3, _n_R_b5]),"at",[_n_t_b1]),"draw",[_n_p_b0])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_sx = _S.read(_parent,"sx")
	var _n_hx = _S.read(_parent,"hx")
	var _n_L = _S.read(_parent,"L")
	var _n_sy = _S.read(_parent,"sy")
	var _n_hy = _S.read(_parent,"hy")
	var _n_d_b0 = _S.arg(_args,0)
	return [(_n_sx + (float(((_n_hx - _n_sx) * maxf(0,_n_d_b0)))/_n_L)), (_n_sy + (float(((_n_hy - _n_sy) * maxf(0,_n_d_b0)))/_n_L))]
	return null

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "s", _S.arg(_args, 0))
	return _S.merge([_S.read(_e, "s"), {"N": [_S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "lat")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "lon")])), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "s"), "lat")]), _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "lat")]), _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "s"), "lon")]))]}])

static func _f18(_parent,_args:Array,_this=null):
	var _n_S_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	return (_S.MathFX.rand([_n_S_b0,_n_q_b1,_n_r_b2,3]) < 0.2)
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_S_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_r_b2 = _S.arg(_args,2)
	var _n_g_b3 = (_S.MathFX.rand([_n_S_b0,_n_q_b1,_n_r_b2]) * 1.7)
	return ((1 + _n_g_b3) if _S.truth((_n_g_b3 < 1.4)) else (_n_g_b3 - 1.4))
	return null
