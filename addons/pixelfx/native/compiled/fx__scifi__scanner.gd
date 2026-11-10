@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/scifi/scanner.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "lerp", _S.import_value("core/index.js", "lerp"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "Ghosts", _S.import_value("fx/scifi/_lib.js", "Ghosts"))
	_S.define(_e, "since", _S.import_value("fx/scifi/_lib.js", "since"))
	_S.define(_e, "body", _S.function_value(_e, "_f0"))
	_S.define(_e, "bracket", _S.function_value(_e, "_f2"))
	_S.define(_e, "ghosts", _S.function_value(_e, "_f3"))
	_S.define(_e, "draw", _S.function_value(_e, "_f5"))
	_S.define(_e, "meta", _S.merge([{"name": "Scanner"}, {"desc": "Brackets snap onto the hero, a scan line sweeps head to toe leaving a cooling outline, and a readout counts up to OK before it all lets go."}, {"tags": ["scifi", "scan", "target", "hud", "tech", "status", "ui", "loop"]}, {"size": [112, 78]}, {"origin": [42, 58]}, {"duration": 3.2}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#03140a", "#06301a", "#0c5a2c", "#16893e", "#2cc256", "#7cf08c", "#d0ffd4", "#ffffff"]}, {"seed": 22}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "STIFF", _S.merge([{"turn": 0.9}, {"crouch": _S.unary("-", 1)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 14)}, {"bx": 8}, {"by": _S.unary("-", 14)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "OK_", _S.merge([{"turn": 0.9}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 37)}, {"bx": 8}, {"by": _S.unary("-", 15)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[0, _S.merge([])], [0.3, _S.read(_e, "STIFF"), "snap"], [1.75, _S.read(_e, "STIFF")], [1.85, _S.read(_e, "OK_"), "snap"], [2.5, _S.read(_e, "OK_")], [2.8, _S.merge([])], [3.2, _S.merge([])]]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "D", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "LOCK", 0.3)
	_S.define(_e, "SCAN0", 0.42)
	_S.define(_e, "SCAN1", 1.6)
	_S.define(_e, "DONE", 1.75)
	_S.define(_e, "LET", 2.5)
	_S.define(_e, "bodies", _S.construct(_S.read(_e, "WeakMap"), []))
	_S.define(_e, "scanY", _S.function_value(_e, "_f6"))
	_S.define(_e, "scanT", _S.function_value(_e, "_f7"))
	_S.define(_e, "ghostCache", _S.construct(_S.read(_e, "WeakMap"), []))
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "A", _S.arg(_args, 0))
	_S.define(_e, "b", _S.invoke(_S.read(_e, "bodies"), "get", [_S.read(_e, "A")]))
	if _S.truth(_S.read(_e, "b")):
		return _S.read(_e, "b")
	_S.define(_e, "m", _S.prop(_S.read(_e, "A"), "mask"))
	_S.define(_e, "on", _S.function_value(_e, "_f1"))
	_S.define(_e, "edge", [])
	_S.define(_e, "rows", _S.construct(_S.read(_e, "Map"), []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v0, "y"), _S.prop(_S.read(_v0, "m"), "h"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v1, "x"), _S.prop(_S.read(_v1, "m"), "w"))):
			var _v2 = _S.scope(_v1)
			if _S.truth(_S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.read(_v2, "y")])):
				var _v3 = _S.scope(_v2)
				_S.define(_v3, "r", _S.logical("??", _S.invoke(_S.read(_v3, "rows"), "get", [_S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "y"))]), func(): return [_S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x")), _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x"))]))
				_S.invoke(_S.read(_v3, "rows"), "set", [_S.binary("+", _S.prop(_S.read(_v3, "A"), "y"), _S.read(_v3, "y")), [_S.invoke(_S.read(_v3, "Math"), "min", [_S.prop(_S.read(_v3, "r"), 0), _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x"))]), _S.invoke(_S.read(_v3, "Math"), "max", [_S.prop(_S.read(_v3, "r"), 1), _S.binary("+", _S.prop(_S.read(_v3, "A"), "x"), _S.read(_v3, "x"))])]])
			else:
				if _S.truth(_S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v2, "on"), [_S.binary("-", _S.read(_v2, "x"), 1), _S.read(_v2, "y")]), func(): return _S.call_value(_S.read(_v2, "on"), [_S.binary("+", _S.read(_v2, "x"), 1), _S.read(_v2, "y")])), func(): return _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.binary("-", _S.read(_v2, "y"), 1)])), func(): return _S.call_value(_S.read(_v2, "on"), [_S.read(_v2, "x"), _S.binary("+", _S.read(_v2, "y"), 1)]))):
					_S.invoke(_S.read(_v2, "edge"), "push", [[_S.binary("+", _S.prop(_S.read(_v2, "A"), "x"), _S.read(_v2, "x")), _S.binary("+", _S.prop(_S.read(_v2, "A"), "y"), _S.read(_v2, "y"))]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	_S.invoke(_S.read(_e, "bodies"), "set", [_S.read(_e, "A"), _S.write(_e, "b", _S.merge([{"edge": _S.read(_e, "edge")}, {"rows": _S.read(_e, "rows")}]), "=", false)])
	return _S.read(_e, "b")

static func _f1(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_S.named_value(_n_m,"data"),((_n_y_b1 * _S.named_value(_n_m,"w")) + _n_x_b0)) if _S.truth(((_n_y_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _S.named_value(_n_m,"h")) if _S.truth(((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _S.named_value(_n_m,"w")) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_p_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_sx_b3 = _S.arg(_args,3)
	var _n_sy_b4 = _S.arg(_args,4)
	var _n_L_b5 = _S.arg(_args,5)
	var _n_c_b6 = _S.arg(_args,6)
	var _n_hot_b7 = _S.arg(_args,7)
	var _n_a_b8 = _S.arg(_args,8)
	_S.invoke(_n_p_b0,"line",[_n_x_b1, _n_y_b2, (_n_x_b1 + (_n_sx_b3 * _n_L_b5)), _n_y_b2, _n_c_b6, _n_a_b8])
	_S.invoke(_n_p_b0,"line",[_n_x_b1, _n_y_b2, _n_x_b1, (_n_y_b2 + (_n_sy_b4 * _n_L_b5)), _n_c_b6, _n_a_b8])
	_S.invoke(_n_p_b0,"line",[(_n_x_b1 + _n_sx_b3), (_n_y_b2 + _n_sy_b4), (_n_x_b1 + (_n_sx_b3 * 3)), (_n_y_b2 + _n_sy_b4), _n_c_b6, (_n_a_b8 * 0.6)])
	_S.invoke(_n_p_b0,"dot",[_n_x_b1, _n_y_b2, _n_hot_b7, _n_a_b8])
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_ghostCache = _S.read(_parent,"ghostCache")
	var _n_Map = _S.read(_parent,"Map")
	var _n_body = _S.read(_parent,"body")
	var _n_Ghosts = _S.read(_parent,"Ghosts")
	var _n_D = _S.read(_parent,"D")
	var _n_scanT = _S.read(_parent,"scanT")
	var _n_P = _S.read(_parent,"P")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_o_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	var _n_C_b2 = _S.arg(_args,2)
	var _n_key_b3 = ("" + _S.string(_S.named_value(_n_o_b0,"seed")) + ":" + _S.string(_S.invoke(_S.named_value(_n_o_b0,"palette"),"join",[])) + "")
	var _n_byActor_b4 = _S.logical("??",_S.invoke(_n_ghostCache,"get",[_n_A_b1]),func():return _S.construct(_n_Map,[]))
	_S.invoke(_n_ghostCache,"set",[_n_A_b1, _n_byActor_b4])
	if _S.truth(_S.invoke(_n_byActor_b4,"has",[_n_key_b3])):
		return _S.invoke(_n_byActor_b4,"get",[_n_key_b3])
	var _object_0 = _S.call_value(_n_body,[_n_A_b1])
	var _n_rows_b5 = _S.named_value(_object_0,"rows")
	var _n_g_b6 = _S.construct(_n_Ghosts,[_n_D, {"ground":_S.function_value(_S.capture(_parent,{"this":_this}),"_f4"),"box":[(-40), (-58), 68, 9]}])
	if true:
		var _n_y_b7 = _S.named_value(_n_A_b1,"y")
		while _S.truth((_n_y_b7 < 0)):
			var _n_r_b8 = _S.invoke(_n_rows_b5,"get",[_n_y_b7])
			if _S.truth(not _S.truth(_n_r_b8)):
				_n_y_b7 += 3
				continue
			for _iter_1 in _S.array([[(_S.index_value(_n_r_b8,0) - 1), (-1)], [(_S.index_value(_n_r_b8,1) + 1), 1]]):
				var _tuple_2 = _iter_1
				var _n_x_b9 = _S.prop(_tuple_2,0)
				var _n_s_b10 = _S.prop(_tuple_2,1)
				if _S.truth((_S.MathFX.rand([_S.named_value(_n_o_b0,"seed"),_n_y_b7,_n_s_b10]) < 0.6)):
					_S.invoke(_n_g_b6,"add",[_S.call_value(_n_scanT,[_n_y_b7, _n_A_b1]), _S.named_value(_n_P,"MOTE"), _n_x_b9, _n_y_b7, (_n_s_b10 * (30 + (50 * _S.MathFX.rand([_n_y_b7,_n_s_b10,3])))), ((-10) + (20 * _S.MathFX.rand([_n_y_b7,_n_s_b10,4]))), (0.2 + (0.15 * _S.MathFX.rand([_n_y_b7,_n_s_b10,5]))), (_n_WHITE if _S.truth((_S.MathFX.rand([_n_y_b7,_n_s_b10,6]) < 0.4)) else _S.index_value(_n_C_b2,5)), 0.6])
			_n_y_b7 += 3
	_S.invoke(_n_byActor_b4,"set",[_n_key_b3, _n_g_b6])
	return _n_g_b6
	return null

static func _f4(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_body = _S.read(_parent,"body")
	var _n_ease = _S.read(_parent,"ease")
	var _n_LOCK = _S.read(_parent,"LOCK")
	var _n_LET = _S.read(_parent,"LET")
	var _n_DONE = _S.read(_parent,"DONE")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_bracket = _S.read(_parent,"bracket")
	var _n_D = _S.read(_parent,"D")
	var _n_since = _S.read(_parent,"since")
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_scanT = _S.read(_parent,"scanT")
	var _n_SCAN1 = _S.read(_parent,"SCAN1")
	var _n_scanY = _S.read(_parent,"scanY")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_ghosts = _S.read(_parent,"ghosts")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_A_b4 = _S.named_value(_n_o_b2,"actor")
	var _object_0 = _S.call_value(_n_body,[_n_A_b4])
	var _n_edge_b5 = _S.named_value(_object_0,"edge")
	var _n_rows_b6 = _S.named_value(_object_0,"rows")
	var _n_bx0_b7 = (_S.named_value(_n_A_b4,"x") - 4)
	var _n_bx1_b8 = ((_S.named_value(_n_A_b4,"x") + _S.named_value(_n_A_b4,"w")) + 3)
	var _n_by0_b9 = (_S.named_value(_n_A_b4,"y") - 4)
	var _n_by1_b10 = 3
	var _n_lock_b11 = _S.invoke(_n_ease,"outBack",[clampf((float(_n_t_b1)/_n_LOCK),0.0,1.0), 2.2])
	var _n_out_b12 = _S.invoke(_n_ease,"inCubic",[clampf((float((_n_t_b1 - _n_LET))/0.45),0.0,1.0)])
	var _n_spread_b13 = (((1 - _n_lock_b11) * 14) + (_n_out_b12 * 12))
	var _n_gone_b14 = ((_n_t_b1 > (_n_LET + 0.45)) if _S.truth((_n_t_b1 > (_n_LET + 0.45))) else (_S.binary("===",fmod(floori(((_n_t_b1 - _n_LET) * 20)),2),1) if _S.truth((_n_t_b1 > (_n_LET + 0.25))) else (_n_t_b1 > (_n_LET + 0.25))))
	var _n_vis_b15 = (0 if _S.truth(_n_gone_b14) else 1)
	var _n_flash_b16 = ((((_n_t_b1 < (_n_LOCK + 0.07)) if _S.truth((_n_t_b1 > _n_LOCK)) else (_n_t_b1 > _n_LOCK)) if _S.truth(((_n_t_b1 < (_n_LOCK + 0.07)) if _S.truth((_n_t_b1 > _n_LOCK)) else (_n_t_b1 > _n_LOCK))) else ((_n_t_b1 < (_n_DONE + 0.05)) if _S.truth((_n_t_b1 > _n_DONE)) else (_n_t_b1 > _n_DONE))) if _S.truth((((_n_t_b1 < (_n_LOCK + 0.07)) if _S.truth((_n_t_b1 > _n_LOCK)) else (_n_t_b1 > _n_LOCK)) if _S.truth(((_n_t_b1 < (_n_LOCK + 0.07)) if _S.truth((_n_t_b1 > _n_LOCK)) else (_n_t_b1 > _n_LOCK))) else ((_n_t_b1 < (_n_DONE + 0.05)) if _S.truth((_n_t_b1 > _n_DONE)) else (_n_t_b1 > _n_DONE)))) else ((_n_t_b1 < (_n_DONE + 0.17)) if _S.truth((_n_t_b1 > (_n_DONE + 0.12))) else (_n_t_b1 > (_n_DONE + 0.12))))
	var _n_bc_b17 = (_n_WHITE if _S.truth(_n_flash_b16) else _S.index_value(_n_C_b3,5))
	var _n_L_b18 = 7
	if _S.truth((_n_vis_b15 > 0)):
		for _iter_1 in _S.array([[(_n_bx0_b7 - _n_spread_b13), (_n_by0_b9 - _n_spread_b13), 1, 1], [(_n_bx1_b8 + _n_spread_b13), (_n_by0_b9 - _n_spread_b13), (-1), 1], [(_n_bx0_b7 - _n_spread_b13), (_n_by1_b10 + _n_spread_b13), 1, (-1)], [(_n_bx1_b8 + _n_spread_b13), (_n_by1_b10 + _n_spread_b13), (-1), (-1)]]):
			var _tuple_2 = _iter_1
			var _n_x_b23 = _S.prop(_tuple_2,0)
			var _n_y_b24 = _S.prop(_tuple_2,1)
			var _n_sx_b25 = _S.prop(_tuple_2,2)
			var _n_sy_b26 = _S.prop(_tuple_2,3)
			_S.call_value(_n_bracket,[_n_p_b0, _n_x_b23, _n_y_b24, _n_sx_b25, _n_sy_b26, _n_L_b18, _n_bc_b17, _n_WHITE, _n_vis_b15])
			_S.invoke(_n_p_b0,"glow",[_n_x_b23, _n_y_b24, 6, _S.index_value(_n_C_b3,4), (0.35 * _n_vis_b15)])
	var _n_lk_b19 = (float((_n_t_b1 - _n_LOCK))/0.3)
	if _S.truth(((_n_lk_b19 < 1) if _S.truth((_n_lk_b19 >= 0)) else (_n_lk_b19 >= 0))):
		var _n_e_b27 = (3 + (10 * _S.invoke(_n_ease,"outCubic",[_n_lk_b19])))
		var _n_c_b28 = (_n_WHITE if _S.truth((_n_lk_b19 < 0.25)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_lk_b19 < 0.5)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_lk_b19 < 0.75)) else _S.index_value(_n_C_b3,3))))
		_S.invoke(_n_p_b0,"line",[(_n_bx0_b7 - _n_e_b27), (_n_by0_b9 - _n_e_b27), (_n_bx1_b8 + _n_e_b27), (_n_by0_b9 - _n_e_b27), _n_c_b28])
		_S.invoke(_n_p_b0,"line",[(_n_bx0_b7 - _n_e_b27), (_n_by1_b10 + _n_e_b27), (_n_bx1_b8 + _n_e_b27), (_n_by1_b10 + _n_e_b27), _n_c_b28])
		_S.invoke(_n_p_b0,"line",[(_n_bx0_b7 - _n_e_b27), (_n_by0_b9 - _n_e_b27), (_n_bx0_b7 - _n_e_b27), (_n_by1_b10 + _n_e_b27), _n_c_b28])
		_S.invoke(_n_p_b0,"line",[(_n_bx1_b8 + _n_e_b27), (_n_by0_b9 - _n_e_b27), (_n_bx1_b8 + _n_e_b27), (_n_by1_b10 + _n_e_b27), _n_c_b28])
	var _n_pulse_b20 = ((1 - (float(_S.call_value(_n_since,[_n_t_b1, _n_DONE, _n_D]))/0.3)) if _S.truth((_S.call_value(_n_since,[_n_t_b1, _n_DONE, _n_D]) < 0.3)) else 0)
	var _n_offY_b21 = _S.numeric_lerp((_S.named_value(_n_A_b4,"y") - 2),2,clampf((float((_n_t_b1 - _n_LET))/0.4),0.0,1.0))
	if _S.truth((_n_t_b1 > _n_SCAN0)):
		for _iter_3 in _S.array(_n_edge_b5):
			var _tuple_4 = _iter_3
			var _n_x_b29 = _S.prop(_tuple_4,0)
			var _n_y_b30 = _S.prop(_tuple_4,1)
			var _n_a_b31 = (_n_t_b1 - _S.call_value(_n_scanT,[_n_y_b30, _n_A_b4]))
			if _S.truth(((_n_a_b31 < 0) if _S.truth((_n_a_b31 < 0)) else ((_n_y_b30 < _n_offY_b21) if _S.truth((_n_t_b1 > _n_LET)) else (_n_t_b1 > _n_LET)))):
				continue
			var _n_c_b32 = (_n_WHITE if _S.truth((_n_pulse_b20 > 0.4)) else (_n_WHITE if _S.truth((_n_a_b31 < 0.07)) else (_S.index_value(_n_C_b3,6) if _S.truth((_n_a_b31 < 0.25)) else (_S.index_value(_n_C_b3,5) if _S.truth((_n_a_b31 < 0.6)) else (_S.index_value(_n_C_b3,3) if _S.truth((_n_t_b1 > (_n_LET - 0.3))) else _S.index_value(_n_C_b3,4))))))
			_S.invoke(_n_p_b0,"px",[_n_x_b29, _n_y_b30, _n_c_b32])
	if _S.truth(((_n_t_b1 < _n_SCAN1) if _S.truth((_n_t_b1 > _n_SCAN0)) else (_n_t_b1 > _n_SCAN0))):
		var _n_y_b33 = floori(_S.call_value(_n_scanY,[_n_t_b1, _n_A_b4]))
		if true:
			var _n_k_b35 = 1
			while _S.truth((_n_k_b35 <= 5)):
				var _n_r_b36 = _S.invoke(_n_rows_b6,"get",[(_n_y_b33 - _n_k_b35)])
				if _S.truth(_n_r_b36):
					if true:
						var _n_x_b37 = _S.index_value(_n_r_b36,0)
						while _S.truth((_n_x_b37 <= _S.index_value(_n_r_b36,1))):
							if _S.truth(_S.index_value(_S.named_value(_S.named_value(_n_A_b4,"mask"),"data"),(((((_n_y_b33 - _n_k_b35) - _S.named_value(_n_A_b4,"y")) * _S.named_value(_n_A_b4,"w")) + _n_x_b37) - _S.named_value(_n_A_b4,"x")))):
								_S.invoke(_n_p_b0,"blend",[(_n_x_b37 + 0.5), ((_n_y_b33 - _n_k_b35) + 0.5), (_S.index_value(_n_C_b3,6) if _S.truth((_n_k_b35 < 2)) else _S.index_value(_n_C_b3,5)), (0.55 - (_n_k_b35 * 0.09))])
							_n_x_b37 += 1.0
				_n_k_b35 += 1.0
		if true:
			var _n_x_b38 = (_n_bx0_b7 - 2)
			while _S.truth((_n_x_b38 <= (_n_bx1_b8 + 2))):
				var _n_r_b39 = _S.invoke(_n_rows_b6,"get",[_n_y_b33])
				var _n_inside_b40 = ((_n_x_b38 <= _S.index_value(_n_r_b39,1)) if _S.truth(((_n_x_b38 >= _S.index_value(_n_r_b39,0)) if _S.truth(_n_r_b39) else _n_r_b39)) else ((_n_x_b38 >= _S.index_value(_n_r_b39,0)) if _S.truth(_n_r_b39) else _n_r_b39))
				_S.invoke(_n_p_b0,"px",[_n_x_b38, _n_y_b33, (_n_WHITE if _S.truth(_n_inside_b40) else _S.index_value(_n_C_b3,6))])
				_S.invoke(_n_p_b0,"blend",[(_n_x_b38 + 0.5), (_n_y_b33 - 0.5), _S.index_value(_n_C_b3,5), 0.35])
				_n_x_b38 += 1.0
		_S.invoke(_n_p_b0,"glowLine",[_n_bx0_b7, _n_y_b33, _n_bx1_b8, _n_y_b33, 6, _S.index_value(_n_C_b3,5), 0.45])
		var _n_r_b34 = _S.invoke(_n_rows_b6,"get",[_n_y_b33])
		if _S.truth(_n_r_b34):
			for _iter_5 in _S.array([(_S.index_value(_n_r_b34,0) - 0.5), (_S.index_value(_n_r_b34,1) + 1.5)]):
				var _n_x_b41 = _iter_5
				_S.call_value(_n_sparkle,[_n_p_b0, _n_x_b41, (_n_y_b33 + 0.5), 2, _S.index_value(_n_C_b3,6), _S.index_value(_n_C_b3,5), 0.3])
	var _n_lead_b22 = clampf((float((_n_t_b1 - _n_LOCK))/0.1),0.0,1.0)
	if _S.truth(((_n_lead_b22 > 0) if _S.truth((_n_vis_b15 > 0)) else (_n_vis_b15 > 0))):
		var _n_px_b42 = ((_n_bx1_b8 + _n_spread_b13) + 6)
		var _n_py_b43 = ((_n_by0_b9 - _n_spread_b13) + 2)
		var _n_k_b44 = clampf((float((_n_t_b1 - _n_SCAN0))/(_n_SCAN1 - _n_SCAN0)),0.0,1.0)
		var _n_ok_b45 = (_n_t_b1 > _n_DONE)
		_S.invoke(_n_p_b0,"line",[(_n_bx1_b8 + _n_spread_b13), (_n_by0_b9 - _n_spread_b13), _S.numeric_lerp((_n_bx1_b8 + _n_spread_b13),(_n_px_b42 - 1),_n_lead_b22), _S.numeric_lerp((_n_by0_b9 - _n_spread_b13),(_n_py_b43 + 4),_n_lead_b22), _S.index_value(_n_C_b3,3)])
		if _S.truth((_n_lead_b22 < 1)):
			_S.invoke(_S.invoke(_S.call_value(_n_ghosts,[_n_o_b2, _n_A_b4, _n_C_b3]),"at",[_n_t_b1]),"draw",[_n_p_b0])
			return null
		_S.invoke(_n_p_b0,"line",[(_n_px_b42 - 1), (_n_py_b43 + 4), (_n_px_b42 + 1), (_n_py_b43 + 4), _S.index_value(_n_C_b3,3)])
		var _n_del_b46 = clampf((float((_n_t_b1 - _n_LET))/0.25),0.0,1.0)
		var _n_full_b47 = ("OK" if _S.truth(_n_ok_b45) else ("" + _S.string(floori((_n_k_b44 * 100))) + "%"))
		var _n_label_b48 = _S.invoke(_n_full_b47,"slice",[0, ceili((_S.prop(_n_full_b47,"length") * (1 - _n_del_b46)))])
		var _n_blinkOk_b49 = _S.logical("&&",(_S.binary("===",fmod(floori(((_n_t_b1 - _n_DONE) * 8)),2),0) if _S.truth(_n_ok_b45) else _n_ok_b45),func():return (_n_t_b1 < (_n_DONE + 0.5)))
		if _S.truth(_n_label_b48):
			_S.invoke(_n_p_b0,"text",[_n_label_b48, (_n_px_b42 + 2), _n_py_b43, (_n_WHITE if _S.truth(_n_blinkOk_b49) else _S.index_value(_n_C_b3,6)), {"font":"mini","scale":2,"shadow":_S.index_value(_n_C_b3,1)}])
		if true:
			var _n_i_b50 = 0
			while _S.truth((_n_i_b50 < 10)):
				if _S.truth((_n_i_b50 >= (10 * (1 - _n_del_b46)))):
					break
				var _n_on_b51 = (((float((_n_i_b50 + 1))/10) <= (_n_k_b44 + 0.000001)) if _S.truth(((float((_n_i_b50 + 1))/10) <= (_n_k_b44 + 0.000001))) else _n_ok_b45)
				_S.invoke(_n_p_b0,"rect",[((_n_px_b42 + 2) + (_n_i_b50 * 3)), (_n_py_b43 + 13), 2, 3, ((_S.index_value(_n_C_b3,6) if _S.truth(_n_ok_b45) else _S.index_value(_n_C_b3,5)) if _S.truth(_n_on_b51) else _S.index_value(_n_C_b3,2))])
				_n_i_b50 += 1.0
		_S.invoke(_n_p_b0,"glow",[(_n_px_b42 + 16), (_n_py_b43 + 6), 18, _S.index_value(_n_C_b3,4), (0.2 * _n_vis_b15)])
	_S.invoke(_S.invoke(_S.call_value(_n_ghosts,[_n_o_b2, _n_A_b4, _n_C_b3]),"at",[_n_t_b1]),"draw",[_n_p_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_SCAN1 = _S.read(_parent,"SCAN1")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	return _S.numeric_lerp((_S.named_value(_n_A_b1,"y") - 3),1,_S.invoke(_n_ease,"inOutSine",[clampf((float((_n_t_b0 - _n_SCAN0))/(_n_SCAN1 - _n_SCAN0)),0.0,1.0)]))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_SCAN0 = _S.read(_parent,"SCAN0")
	var _n_SCAN1 = _S.read(_parent,"SCAN1")
	var _n_y_b0 = _S.arg(_args,0)
	var _n_A_b1 = _S.arg(_args,1)
	return (_n_SCAN0 + (float(((_n_SCAN1 - _n_SCAN0) * acos((1 - (2 * clampf((float(((_n_y_b0 + 0.5) - (_S.named_value(_n_A_b1,"y") - 3)))/(4 - _S.named_value(_n_A_b1,"y"))),0.0,1.0))))))/PI))
	return null
