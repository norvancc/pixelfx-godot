@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/pickups/coin-spin.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "scale", _S.import_value("core/index.js", "scale"))
	_S.define(_e, "Layer", _S.import_value("fx/pickups/_lib.js", "Layer"))
	_S.define(_e, "coin3d", _S.import_value("fx/pickups/_lib.js", "coin3d"))
	_S.define(_e, "glint", _S.import_value("fx/pickups/_lib.js", "glint"))
	_S.define(_e, "blobShadow", _S.import_value("fx/pickups/_lib.js", "blobShadow"))
	_S.define(_e, "drawBack", _S.function_value(_e, "_f0"))
	_S.define(_e, "draw", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Coin spin"}, {"desc": "A thick gold coin turning on its edge: an embossed star face, a reeded rim showing as it goes edge-on, a flash sweeping the face, bobbing over its shadow."}, {"tags": ["pickup", "coin", "gold", "money", "loop"]}, {"size": [56, 56]}, {"origin": [28, 48]}, {"duration": 1.6}, {"loop": true}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1e1206", "#4a2c08", "#86520c", "#c48412", "#f0b424", "#ffe066", "#fff6c4", "#ffffff"]}, {"seed": 3}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "L", _S.construct(_S.read(_e, "Layer"), [32, 32]))
	_S.define(_e, "R", 7)
	_S.define(_e, "TH", 3)
	_S.define(_e, "HOVER", 17)
	_exports["drawBack"] = _S.read(_e, "drawBack")
	_exports["draw"] = _S.read(_e, "draw")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_blobShadow = _S.read(_parent,"blobShadow")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_T_b3 = _S.named_value(_n_meta,"duration")
	var _n_ph_b4 = (float(_n_t_b1)/_n_T_b3)
	var _n_th_b5 = (_n_ph_b4 * _n_TAU)
	var _n_y_b6 = ((-_n_HOVER) - (2 * sin((_n_ph_b4 * _n_TAU))))
	_S.call_value(_n_blobShadow,[_n_p_b0, 0, ((2.5 + (4.5 * absf(cos(_n_th_b5)))) + (1.5 * absf(sin(_n_th_b5)))), (0.85 - ((((-_n_y_b6) - _n_HOVER) + 2) * 0.06))])
	return null

static func _f1(_parent,_args:Array,_this=null):
	var _n_meta = _S.read(_parent,"meta")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_HOVER = _S.read(_parent,"HOVER")
	var _n_L = _S.read(_parent,"L")
	var _n_R = _S.read(_parent,"R")
	var _n_TH = _S.read(_parent,"TH")
	var _n_coin3d = _S.read(_parent,"coin3d")
	var _n_glint = _S.read(_parent,"glint")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_t_b1 = _S.arg(_args,1)
	var _n_o_b2 = _S.arg(_args,2)
	var _n_C_b3 = _S.ColorFX.fit(_S.named_value(_n_o_b2,"palette"),8)
	var _n_T_b4 = _S.named_value(_n_meta,"duration")
	var _n_ph_b5 = (float(_n_t_b1)/_n_T_b4)
	var _n_th_b6 = (_n_ph_b5 * _n_TAU)
	var _n_y_b7 = ((-_n_HOVER) - (2 * sin((_n_ph_b5 * _n_TAU))))
	var _n_facing_b8 = absf(cos(_n_th_b6))
	_S.invoke(_n_p_b0,"glow",[0, _n_y_b7, 20, _S.index_value(_n_C_b3,4), (0.3 + (0.12 * _n_facing_b8))])
	var _n_flash_b9 = _S.call_value(_n_coin3d,[_n_L, _n_p_b0, 0, _n_y_b7, _n_R, _n_TH, _n_th_b6, _n_C_b3])
	_S.invoke(_n_p_b0,"glow",[(-1), (_n_y_b7 - 1), 12, _S.index_value(_n_C_b3,6), (0.35 * _n_flash_b9)])
	if _S.truth((_n_flash_b9 > 0.3)):
		_S.call_value(_n_glint,[_n_p_b0, (-4), (_n_y_b7 - 4), (1 + (3.2 * _n_flash_b9)), _S.index_value(_n_C_b3,6), (0.5 * _n_flash_b9)])
	if true:
		var _n_i_b10 = 0
		while _S.truth((_n_i_b10 < 5)):
			var _n_life_b11 = 0.35
			var _n_age_b12 = fmod((fmod(((_n_t_b1 - ((float(_n_i_b10)/5) * _n_T_b4)) - (_S.MathFX.rand([_n_i_b10,_S.named_value(_n_o_b2,"seed"),3]) * 0.08)),_n_T_b4) + _n_T_b4),_n_T_b4)
			if _S.truth((_n_age_b12 > _n_life_b11)):
				_n_i_b10 += 1.0
				continue
			var _n_a_b13 = ((_S.MathFX.rand([_n_i_b10,_S.named_value(_n_o_b2,"seed"),1]) * _n_TAU) + (_n_i_b10 * 2.1))
			var _n_d_b14 = (10 + (_S.MathFX.rand([_n_i_b10,_S.named_value(_n_o_b2,"seed"),2]) * 5))
			var _n_k_b15 = sin(((float(_n_age_b12)/_n_life_b11) * PI))
			_S.call_value(_n_glint,[_n_p_b0, (cos(_n_a_b13) * _n_d_b14), ((_n_y_b7 + ((sin(_n_a_b13) * _n_d_b14) * 0.85)) - (_n_age_b12 * 8)), floori((2 * _n_k_b15)+0.5), (_S.index_value(_n_C_b3,6) if _S.truth(fmod(_n_i_b10,2)) else _n_WHITE), (0.35 * _n_k_b15)])
			_n_i_b10 += 1.0
	return null
