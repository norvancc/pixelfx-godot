@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/gem-spin.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "cycle", _S.import_value("core/index.js", "cycle"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "brilliant", _S.import_value("fx/pickups/_lib.js", "brilliant"))
	_S.define(_e, "drawGem", _S.import_value("fx/pickups/_lib.js", "drawGem"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Gem spin"}, {"desc": "A brilliant-cut ruby turning on its axis: real facets catch the light in turn, flashes roll over the crown, refracted light slides across the floor, sparkles wink round it."}, {"tags": ["pickup", "gem", "jewel", "treasure", "ruby", "loop"]}, {"size": [64, 64]}, {"origin": [32, 56]}, {"duration": 2.4}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#16040e", "#3e0a1e", "#760e2e", "#b8163c", "#ec3250", "#ff7482", "#ffc4c8", "#ffffff"]}, {"seed": 6}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "GEM", _S.call_value(_S.read(_e, "brilliant"), [_S.merge([{"r": 7.5}, {"crown": 3.2}, {"table": 0.5}, {"pavilion": 9.5}, {"girdle": 0.9}])]))
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [32, 32]))
	_S.define(_e, "HOVER", 19)
	_S.define(_e, "pose", _S.function_value(_e, "_f2"))
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _object_0 = _S.call_value(_n_pose,[_n_t_b1, _n_T_b4])
	var _n_y_b5 = _S.named_value(_object_0,"y")
	var _n_spin_b6 = _S.named_value(_object_0,"spin")
	var _n_lift_b7 = (float((((-_n_y_b5) - _n_HOVER) + 2))/4)
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, (8 - (_n_lift_b7 * 1.5)), (0.75 - (_n_lift_b7 * 0.2))])
	if true:
		var _n_k_b8 = 0
		while _S.truth((_n_k_b8 < 3)):
			var _n_a_b9 = ((_n_spin_b6 * 4) + (float((_n_k_b8 * _n_TAU))/3))
			var _n_x_b10 = (sin(_n_a_b9) * 9)
			var _n_k2_b11 = (0.5 + (0.5 * cos(_n_a_b9)))
			if _S.truth((_n_k2_b11 < 0.15)):
				_n_k_b8 += 1.0
				continue
			_S.invoke(_n_p_b0,"dot",[_n_x_b10, 0, (_S.index_value(_n_C_b3,6) if _S.truth((_n_k2_b11 > 0.7)) else _S.index_value(_n_C_b3,5)), (_n_k2_b11 * 1.2)])
			_S.invoke(_n_p_b0,"dot",[(_n_x_b10 + 1), 0, _S.index_value(_n_C_b3,4), (_n_k2_b11 * 0.8)])
			_S.invoke(_n_p_b0,"dot",[(_n_x_b10 - 1), 0, _S.index_value(_n_C_b3,4), (_n_k2_b11 * 0.6)])
			_S.invoke(_n_p_b0,"glow",[(_n_x_b10 + 0.5), 0, 6, _S.index_value(_n_C_b3,5), (0.3 * _n_k2_b11)])
			_n_k_b8 += 1.0
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_pose = _S.read(_parent,"pose")
	var _n_L = _S.read(_parent,"L")
	var _n_GEM = _S.read(_parent,"GEM")
	var _n_drawGem = _S.read(_parent,"drawGem")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_ease = _S.read(_parent,"ease")
	var _n_glint = _S.read(_parent,"glint")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _n_ph_b5 = (float(_n_t_b1)/_n_T_b4)
	var _object_0 = _S.call_value(_n_pose,[_n_t_b1, _n_T_b4])
	var _n_y_b6 = _S.named_value(_object_0,"y")
	var _n_spin_b7 = _S.named_value(_object_0,"spin")
	_S.invoke(_n_p_b0,"glowRing",[0, (_n_y_b6 - 1), 5, 15, _S.index_value(_n_C_b3,4), 0.34])
	_S.invoke(_n_p_b0,"glow",[0, _n_y_b6, 26, _S.index_value(_n_C_b3,3), 0.14])
	var _n_hi_b8 = _S.call_value(_n_drawGem,[_n_L, _n_p_b0, _n_GEM, 0, _n_y_b6, _n_spin_b7, _n_C_b3, {"tilt":0.22}])
	var _n_f_b9 = fmod((float((_n_spin_b7 * 4))/_n_TAU),1)
	var _n_fk_b10 = maxf(0,(1 - (float(absf((_n_f_b9 - 0.5)))/0.08)))
	if _S.truth((_n_fk_b10 > 0)):
		_S.call_value(_n_glint,[_n_p_b0, (-3), (_n_y_b6 - 3), (3.4 * _S.invoke(_n_ease,"outQuad",[_n_fk_b10])), _S.index_value(_n_C_b3,6), (0.45 * _n_fk_b10)])
	if true:
		var _n_i_b11 = 0
		while _S.truth((_n_i_b11 < 8)):
			var _n_life_b12 = 0.4
			var _n_age_b13 = fmod((fmod(((_n_t_b1 - ((float(_n_i_b11)/8) * _n_T_b4)) - (_S.MathFX.rand([_n_i_b11,_S.named_value(_n_o_b2,"seed"),3]) * 0.1)),_n_T_b4) + _n_T_b4),_n_T_b4)
			if _S.truth((_n_age_b13 > _n_life_b12)):
				_n_i_b11 += 1.0
				continue
			var _n_a_b14 = ((_S.MathFX.rand([_n_i_b11,_S.named_value(_n_o_b2,"seed"),1]) * _n_TAU) + (_n_i_b11 * 2.4))
			var _n_d_b15 = (10 + (_S.MathFX.rand([_n_i_b11,_S.named_value(_n_o_b2,"seed"),2]) * 7))
			var _n_k_b16 = sin(((float(_n_age_b13)/_n_life_b12) * PI))
			_S.call_value(_n_glint,[_n_p_b0, (cos(_n_a_b14) * _n_d_b15), ((_n_y_b6 + ((sin(_n_a_b14) * _n_d_b15) * 0.8)) - (_n_age_b13 * 6)), floori(((2.4 * _n_k_b16) * (0.6 + (0.4 * _S.MathFX.rand([_n_i_b11,9]))))+0.5), (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_i_b11,3)) else _n_WHITE), (0.4 * _n_k_b16)])
			_n_i_b11 += 1.0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_t_b0 = _S.arg(_args,0)
	var _n_T_b1 = _S.arg(_args,1)
	return {"y":((-_n_HOVER) - (1.8 * sin(((float(_n_t_b0)/_n_T_b1) * _n_TAU)))),"spin":((float(_n_t_b0)/_n_T_b1) * PI)}
	return null
