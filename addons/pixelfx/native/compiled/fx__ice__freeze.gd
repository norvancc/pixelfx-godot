@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/ice/freeze.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
const ACCELERATED = {"_f0":"freeze_floor","_f4":"freeze_on","_f17":"freeze_character","_f18":"freeze_block"}
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "flare", _S.import_value("core/index.js", "flare"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "seg", _S.import_value("core/index.js", "seg"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "Panes", _S.import_value("fx/ice/_lib.js", "Panes"))
	_S.define(_e, "endBy", _S.import_value("fx/ice/_lib.js", "endBy"))
	_S.define(_e, "inPoly", _S.import_value("fx/ice/_lib.js", "inPoly"))
	_S.define(_e, "centroid", _S.import_value("fx/ice/_lib.js", "centroid"))
	_S.define(_e, "splitPoly", _S.import_value("fx/ice/_lib.js", "splitPoly"))
	_S.define(_e, "iceOf", _S.import_value("fx/ice/_lib.js", "iceOf"))
	_S.define(_e, "fractures", _S.import_value("fx/ice/_lib.js", "fractures"))
	_S.define(_e, "drawFractures", _S.import_value("fx/ice/_lib.js", "drawFractures"))
	_S.define(_e, "floorFrost", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f1"))
	_S.define(_e, "meta", _S.merge([{"name": "Freeze"}, {"desc": "Frost races in and climbs the character, turning it to ice; a faceted block crystallizes round it pane by pane, glints, cracks and bursts, and the character thaws free."}, {"tags": ["ice", "freeze", "frozen", "status", "crowd-control", "one-shot"]}, {"size": [176, 128]}, {"origin": [88, 108]}, {"duration": 4}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"seed": 5}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FEAR", _S.merge([{"turn": 0.9}, {"lean": _S.unary("-", 2)}, {"crouch": 2}, {"fx": _S.unary("-", 8)}, {"fy": _S.unary("-", 31)}, {"bx": 9}, {"by": _S.unary("-", 31)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "FREE", _S.merge([{"turn": 1}, {"crouch": 5}, {"fx": _S.unary("-", 12)}, {"fy": _S.unary("-", 18)}, {"bx": 12}, {"by": _S.unary("-", 18)}, {"ffx": _S.unary("-", 5)}, {"fbx": 6}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.2), _S.read(_e, "READY")], [0.05, _S.read(_e, "READY")], [0.16, _S.read(_e, "FEAR"), "snap"], [0.3, _S.merge([_S.read(_e, "FEAR"), {"lean": _S.unary("-", 1)}, {"fx": _S.unary("-", 10)}, {"fy": _S.unary("-", 34)}])], [0.45, _S.merge([_S.read(_e, "FEAR"), {"lean": _S.unary("-", 3)}, {"bx": 11}, {"by": _S.unary("-", 34)}, {"fx": _S.unary("-", 7)}, {"fy": _S.unary("-", 29)}])], [0.62, _S.read(_e, "FEAR")], [2.52, _S.read(_e, "FEAR")], [2.54, _S.read(_e, "FREE"), "snap"], [2.9, _S.merge([_S.read(_e, "FREE"), {"crouch": 4}])], [3.1, _S.merge([_S.read(_e, "FREE"), {"crouch": 3}, {"lean": 1}])], [3.3, _S.merge([_S.read(_e, "FREE"), {"crouch": 3}, {"lean": _S.unary("-", 1)}])], [4, _S.read(_e, "READY")]]}, {"hits": [_S.merge([{"t": 0.62}, {"stop": 0.03}, {"shake": 0.08}, {"amp": 1}]), _S.merge([{"t": 2.52}, {"stop": 0.05}, {"shake": 0.2}, {"amp": 2}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "SNAP", 0.16)
	_S.define(_e, "CLIMB", [0.14, 0.62])
	_S.define(_e, "SEAL", 0.6)
	_S.define(_e, "SWEEPS", [1.12, 1.82])
	_S.define(_e, "CRACK", 2.2)
	_S.define(_e, "CRACK2", 2.34)
	_S.define(_e, "FLASH", 2.46)
	_S.define(_e, "BURST", 2.52)
	_S.define(_e, "THAW", 0.36)
	_S.define(_e, "MELT", [2.95, 3.7])
	_S.define(_e, "REACH", 38)
	_S.define(_e, "CORE", [0, _S.unary("-", 21)])
	_S.define(_e, "V", _S.merge([{"l0": [_S.unary("-", 15), 0]}, {"l1": [_S.unary("-", 17), _S.unary("-", 10)]}, {"l2": [_S.unary("-", 17), _S.unary("-", 31)]}, {"p1": [_S.unary("-", 12), _S.unary("-", 45)]}, {"n1": [_S.unary("-", 6), _S.unary("-", 42)]}, {"p2": [0, _S.unary("-", 52)]}, {"n2": [6, _S.unary("-", 43)]}, {"p3": [12, _S.unary("-", 47)]}, {"r2": [17, _S.unary("-", 30)]}, {"r1": [16, _S.unary("-", 9)]}, {"r0": [14, 0]}, {"i0": [_S.unary("-", 6), _S.unary("-", 36)]}, {"i1": [6, _S.unary("-", 35)]}, {"i2": [_S.unary("-", 9), _S.unary("-", 21)]}, {"i3": [3, _S.unary("-", 25)]}, {"i4": [9, _S.unary("-", 13)]}, {"i5": [_S.unary("-", 5), _S.unary("-", 8)]}, {"i6": [2, 0]}, {"i7": [0, _S.unary("-", 40)]}]))
	_S.define(_e, "FACETS", _S.invoke([["l0 l1 i5 i6", 0.62, 0], ["i5 i4 i6", 0.42, 0.03], ["i4 r2 r1 r0 i6", 0.2, 0.05], ["l1 l2 i2 i5", 0.74, 0.08], ["i2 i3 i4 i5", 0.5, 0.1], ["i1 r2 i4 i3", 0.28, 0.13], ["l2 i0 i2", 0.7, 0.15], ["i0 i1 i3 i2", 0.58, 0.18], ["n1 i7 n2 i1 i0", 0.52, 0.2], ["i1 n2 p3 r2", 0.4, 0.23], ["l2 p1 n1 i0", 0.88, 0.25], ["p2 n2 i7", 0.66, 0.28], ["n1 p2 i7", 1, 0.31]], "map", [_S.function_value(_e, "_f27")]))
	_S.define(_e, "OUTLINE", _S.invoke(_S.invoke("l0 l1 l2 p1 n1 p2 n2 p3 r2 r1 r0", "split", [" "]), "map", [_S.function_value(_e, "_f29")]))
	_S.define(_e, "X0", _S.unary("-", 18))
	_S.define(_e, "X1", 18)
	_S.define(_e, "Y0", _S.unary("-", 53))
	_S.define(_e, "Y1", 0)
	_S.define(_e, "BW", _S.binary("-", _S.read(_e, "X1"), _S.read(_e, "X0")))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent,_args:Array,_this=null):
	var _n_REACH = _S.read(_parent,"REACH")
	var _n_SNAP = _S.read(_parent,"SNAP")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_C_b1 = _S.arg(_args,1)
	var _n_t_b2 = _S.arg(_args,2)
	var _n_out_b3 = _S.arg(_args,3)
	if true:
		var _n_x_b4 = (-_n_REACH)
		while _S.truth((_n_x_b4 <= _n_REACH)):
			var _n_d_b5 = (float(absf((_n_x_b4 + 0.5)))/_n_REACH)
			var _n_arrive_b6 = (_n_SNAP * (1 - _n_d_b5))
			var _n_age_b7 = (_n_t_b2 - _n_arrive_b6)
			if _S.truth((_n_age_b7 < 0)):
				_n_x_b4 += 1.0
				continue
			var _n_a_b8 = (_n_out_b3 * clampf((float((1.12 - _n_d_b5))/0.2),0.0,1.0))
			var _n_g_b9 = _S.MathFX.smooth(0,0.4,_n_age_b7)
			var _n_h_b10 = _S.MathFX.rand([_n_x_b4,31])
			var _n_s_b11 = ((-1) if _S.truth((_n_x_b4 < 0)) else 1)
			if _S.truth((_n_a_b8 <= 0)):
				_n_x_b4 += 1.0
				continue
			_S.invoke(_n_p_b0,"dot",[_n_x_b4, 0, (_n_WHITE if _S.truth(((_n_age_b7 < 0.05) if _S.truth((_n_age_b7 < 0.05)) else (_n_h_b10 < 0.3))) else _S.index_value(_n_C_b1,6)), _n_a_b8])
			if _S.truth((_n_h_b10 < 0.55)):
				var _n_L_b13 = floori(((_n_g_b9 * (1 + (_S.MathFX.rand([_n_x_b4,7]) * 3.4))) * (1 - (_n_d_b5 * 0.55)))+0.5)
				if true:
					var _n_j_b14 = 1
					while _S.truth((_n_j_b14 <= _n_L_b13)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b4, (-_n_j_b14), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b14,_n_L_b13)) else _S.index_value(_n_C_b1,5)), _n_a_b8])
						_n_j_b14 += 1.0
				if _S.truth((_n_L_b13 >= 2)):
					_S.invoke(_n_p_b0,"dot",[(_n_x_b4 + _n_s_b11), ((-_n_L_b13) + 1), _S.index_value(_n_C_b1,6), _n_a_b8])
				if _S.truth((_n_L_b13 >= 4)):
					_S.invoke(_n_p_b0,"dot",[(_n_x_b4 - _n_s_b11), ((-_n_L_b13) + 2), _S.index_value(_n_C_b1,5), _n_a_b8])
			var _n_D_b12 = ((_n_g_b9 * (2 + (_S.MathFX.rand([_n_x_b4,11]) * 4))) * (1 - (_n_d_b5 * 0.5)))
			if true:
				var _n_j_b15 = 1
				while _S.truth((_n_j_b15 <= _n_D_b12)):
					_S.invoke(_n_p_b0,"dot",[_n_x_b4, _n_j_b15, (_n_WHITE if _S.truth((_S.MathFX.rand([((_n_x_b4 * 13) + _n_j_b15),5]) < 0.07)) else (_S.index_value(_n_C_b1,5) if _S.truth((_n_j_b15 < 2)) else (_S.index_value(_n_C_b1,4) if _S.truth((_n_j_b15 < 4)) else _S.index_value(_n_C_b1,3)))), (_n_a_b8 * (1.05 - (float(_n_j_b15)/(_n_D_b12 + 1))))])
					_n_j_b15 += 1.0
			_n_x_b4 += 1.0
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "A", _S.prop(_S.read(_e, "o"), "actor"))
	_S.define(_e, "floor", _S.function_value(_e, "_f2"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 7), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "panes", _S.construct(_S.read(_e, "Panes"), [_S.merge([{"ground": _S.read(_e, "floor")}, {"onLand": _S.function_value(_e, "_f3")}])]))
	_S.define(_e, "W", _S.prop(_S.read(_e, "A"), "w"))
	_S.define(_e, "H", _S.prop(_S.read(_e, "A"), "h"))
	_S.define(_e, "N", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")))
	_S.define(_e, "on", _S.function_value(_e, "_f4"))
	_S.define(_e, "dist", _S.invoke(_S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]), "fill", [INF]))
	_S.define(_e, "ice", _S.construct(_S.read(_e, "Uint32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "rim", _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")]))
	_S.define(_e, "open", [])
	var _v6 = _S.scope(_e)
	_S.define(_v6, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v6, "y"), _S.read(_v6, "H"))):
		var _v7 = _S.scope(_v6)
		_S.define(_v7, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v7, "x"), _S.read(_v7, "W"))):
			var _v8 = _S.scope(_v7)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.read(_v8, "x"), _S.read(_v8, "y")]))):
				_v7 = _S.iteration(_v7)
				_S.write(_v7, "x", 1, "+=", true)
				continue
			_S.define(_v8, "i", _S.binary("+", _S.binary("*", _S.read(_v8, "y"), _S.read(_v8, "W")), _S.read(_v8, "x")))
			_S.set_prop(_S.read(_v8, "rim"), _S.read(_v8, "i"), (1 if _S.truth(_S.logical("||", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.binary("-", _S.read(_v8, "x"), 1), _S.read(_v8, "y")])), func(): return _S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.binary("+", _S.read(_v8, "x"), 1), _S.read(_v8, "y")]))), func(): return _S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.read(_v8, "x"), _S.binary("-", _S.read(_v8, "y"), 1)])))) else 0), "=", false)
			_S.define(_v8, "up", _S.logical("||", _S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.binary("-", _S.read(_v8, "x"), 1), _S.read(_v8, "y")])), func(): return _S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.read(_v8, "x"), _S.binary("-", _S.read(_v8, "y"), 1)]))))
			_S.set_prop(_S.read(_v8, "ice"), _S.read(_v8, "i"), _S.call_value(_S.read(_v8, "mix"), [(_S.prop(_S.read(_v8, "C"), _S.invoke(_S.read(_v8, "Math"), "min", [7, _S.binary("+", _S.invoke(_S.read(_v8, "C"), "indexOf", [_S.call_value(_S.read(_v8, "iceOf"), [_S.prop(_S.prop(_S.read(_v8, "A"), "pixels"), _S.read(_v8, "i")), _S.read(_v8, "C")])]), 1)])) if _S.truth(_S.read(_v8, "up")) else _S.call_value(_S.read(_v8, "iceOf"), [_S.prop(_S.prop(_S.read(_v8, "A"), "pixels"), _S.read(_v8, "i")), _S.read(_v8, "C")])), _S.prop(_S.read(_v8, "C"), 6), 0.2]), "=", false)
			if _S.truth(_S.logical("||", _S.binary("===", _S.read(_v8, "y"), _S.binary("-", _S.read(_v8, "H"), 1)), func(): return _S.unary("!", _S.call_value(_S.read(_v8, "on"), [_S.read(_v8, "x"), _S.binary("+", _S.read(_v8, "y"), 1)])))):
				if _S.truth(_S.binary(">=", _S.read(_v8, "y"), _S.binary("-", _S.read(_v8, "H"), 4))):
					_S.last([_S.set_prop(_S.read(_v8, "dist"), _S.read(_v8, "i"), _S.invoke(_S.read(_v8, "R"), "range", [0, 1.5]), "=", false), _S.invoke(_S.read(_v8, "open"), "push", [_S.read(_v8, "i")])])
			_v7 = _S.iteration(_v7)
			_S.write(_v7, "x", 1, "+=", true)
		_v6 = _S.iteration(_v6)
		_S.write(_v6, "y", 1, "+=", true)
	_S.define(_e, "done", _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")]))
	while _S.truth(_S.prop(_S.read(_e, "open"), "length")):
		var _v9 = _S.scope(_e)
		_S.define(_v9, "bi", 0)
		var _v10 = _S.scope(_v9)
		_S.define(_v10, "j", 1)
		while _S.truth(_S.binary("<", _S.read(_v10, "j"), _S.prop(_S.read(_v10, "open"), "length"))):
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v10, "dist"), _S.prop(_S.read(_v10, "open"), _S.read(_v10, "j"))), _S.prop(_S.read(_v10, "dist"), _S.prop(_S.read(_v10, "open"), _S.read(_v10, "bi"))))):
				_S.write(_v10, "bi", _S.read(_v10, "j"), "=", false)
			_v10 = _S.iteration(_v10)
			_S.write(_v10, "j", 1, "+=", true)
		_S.define(_v9, "i", _S.prop(_S.read(_v9, "open"), _S.read(_v9, "bi")))
		_S.set_prop(_S.read(_v9, "open"), _S.read(_v9, "bi"), _S.prop(_S.read(_v9, "open"), _S.binary("-", _S.prop(_S.read(_v9, "open"), "length"), 1)), "=", false)
		_S.invoke(_S.read(_v9, "open"), "pop", [])
		if _S.truth(_S.prop(_S.read(_v9, "done"), _S.read(_v9, "i"))):
			continue
		_S.set_prop(_S.read(_v9, "done"), _S.read(_v9, "i"), 1, "=", false)
		_S.define(_v9, "x", _S.binary("%", _S.read(_v9, "i"), _S.read(_v9, "W")))
		_S.define(_v9, "y", _S.binary("|", _S.binary("/", _S.read(_v9, "i"), _S.read(_v9, "W")), 0))
		for _v11 in _S.array([[1, 0], [_S.unary("-", 1), 0], [0, _S.unary("-", 1)], [0, 1]]):
			var _v12 = _S.scope(_v9)
			var _v13 = _v11
			_S.define(_v12, "dx", _S.prop(_v13, 0))
			_S.define(_v12, "dy", _S.prop(_v13, 1))
			var _v14 = _S.scope(_v12)
			_S.define(_v14, "nx", _S.binary("+", _S.read(_v14, "x"), _S.read(_v14, "dx")))
			_S.define(_v14, "ny", _S.binary("+", _S.read(_v14, "y"), _S.read(_v14, "dy")))
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v14, "on"), [_S.read(_v14, "nx"), _S.read(_v14, "ny")]))):
				continue
			_S.define(_v14, "j", _S.binary("+", _S.binary("*", _S.read(_v14, "ny"), _S.read(_v14, "W")), _S.read(_v14, "nx")))
			_S.define(_v14, "w", _S.binary("+", _S.binary("*", (0.55 if _S.truth(_S.prop(_S.read(_v14, "rim"), _S.read(_v14, "j"))) else 1), (1 if _S.truth(_S.binary("<", _S.read(_v14, "dy"), 0)) else 1.3)), _S.invoke(_S.read(_v14, "R"), "range", [0, 1.5])))
			if _S.truth(_S.binary("<", _S.binary("+", _S.prop(_S.read(_v14, "dist"), _S.read(_v14, "i")), _S.read(_v14, "w")), _S.prop(_S.read(_v14, "dist"), _S.read(_v14, "j")))):
				_S.last([_S.set_prop(_S.read(_v14, "dist"), _S.read(_v14, "j"), _S.binary("+", _S.prop(_S.read(_v14, "dist"), _S.read(_v14, "i")), _S.read(_v14, "w")), "=", false), _S.invoke(_S.read(_v14, "open"), "push", [_S.read(_v14, "j")])])
	_S.define(_e, "maxD", 0)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), _S.read(_v15, "N"))):
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v15, "dist"), _S.read(_v15, "i")), INF)):
			_S.write(_v15, "maxD", _S.invoke(_S.read(_v15, "Math"), "max", [_S.read(_v15, "maxD"), _S.prop(_S.read(_v15, "dist"), _S.read(_v15, "i"))]), "=", false)
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	_S.define(_e, "reach", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "order", [])
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), _S.read(_v16, "N"))):
		if _S.truth(_S.binary("<", _S.prop(_S.read(_v16, "dist"), _S.read(_v16, "i")), INF)):
			var _v17 = _S.scope(_v16)
			_S.set_prop(_S.read(_v17, "reach"), _S.read(_v17, "i"), _S.binary("+", _S.prop(_S.read(_v17, "CLIMB"), 0), _S.binary("*", _S.binary("-", _S.prop(_S.read(_v17, "CLIMB"), 1), _S.prop(_S.read(_v17, "CLIMB"), 0)), _S.invoke(_S.read(_v17, "Math"), "pow", [_S.binary("/", _S.prop(_S.read(_v17, "dist"), _S.read(_v17, "i")), _S.read(_v17, "maxD")), 0.85]))), "=", false)
			_S.invoke(_S.read(_v17, "order"), "push", [_S.read(_v17, "i")])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "order"), "sort", [_S.function_value(_e, "_f5")])
	_S.define(_e, "feathers", [])
	for _v18 in _S.array(_S.read(_e, "order")):
		var _v19 = _S.scope(_e)
		_S.define(_v19, "i", _v18)
		var _v20 = _S.scope(_v19)
		_S.define(_v20, "x", _S.binary("%", _S.read(_v20, "i"), _S.read(_v20, "W")))
		_S.define(_v20, "y", _S.binary("|", _S.binary("/", _S.read(_v20, "i"), _S.read(_v20, "W")), 0))
		if _S.truth(_S.logical("||", _S.logical("||", _S.unary("!", _S.prop(_S.read(_v20, "rim"), _S.read(_v20, "i"))), func(): return _S.binary(">", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "i"), _S.prop(_S.read(_v20, "o"), "seed"), 3]), 0.42)), func(): return _S.binary(">", _S.read(_v20, "y"), _S.binary("-", _S.read(_v20, "H"), 3)))):
			continue
		_S.define(_v20, "dx", (_S.unary("-", 1) if _S.truth(_S.unary("!", _S.call_value(_S.read(_v20, "on"), [_S.binary("-", _S.read(_v20, "x"), 1), _S.read(_v20, "y")]))) else (1 if _S.truth(_S.unary("!", _S.call_value(_S.read(_v20, "on"), [_S.binary("+", _S.read(_v20, "x"), 1), _S.read(_v20, "y")]))) else (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "i"), 9]), 0.5)) else 1))))
		_S.define(_v20, "dy", (_S.unary("-", 1) if _S.truth(_S.unary("!", _S.call_value(_S.read(_v20, "on"), [_S.read(_v20, "x"), _S.binary("-", _S.read(_v20, "y"), 1)]))) else (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "i"), 4]), 0.5)) else 0)))
		_S.invoke(_S.read(_v20, "feathers"), "push", [_S.merge([{"x": _S.binary("+", _S.binary("+", _S.prop(_S.read(_v20, "A"), "x"), _S.read(_v20, "x")), _S.read(_v20, "dx"))}, {"y": _S.binary("+", _S.binary("+", _S.prop(_S.read(_v20, "A"), "y"), _S.read(_v20, "y")), _S.read(_v20, "dy"))}, {"dx": _S.read(_v20, "dx")}, {"dy": _S.read(_v20, "dy")}, {"L": _S.binary("+", 1, _S.invoke(_S.read(_v20, "Math"), "floor", [_S.binary("*", _S.call_value(_S.read(_v20, "rand"), [_S.read(_v20, "i"), 7]), 2.6)]))}, {"at": _S.binary("+", _S.prop(_S.read(_v20, "reach"), _S.read(_v20, "i")), 0.04)}])])
	_S.define(_e, "fid", _S.invoke(_S.construct(_S.read(_e, "Int8Array"), [_S.binary("*", _S.read(_e, "BW"), _S.binary("-", _S.read(_e, "Y1"), _S.read(_e, "Y0")))]), "fill", [_S.unary("-", 1)]))
	_S.define(_e, "inBlock", _S.function_value(_e, "_f6"))
	var _v21 = _S.scope(_e)
	_S.define(_v21, "y", _S.read(_v21, "Y0"))
	while _S.truth(_S.binary("<", _S.read(_v21, "y"), _S.read(_v21, "Y1"))):
		var _v22 = _S.scope(_v21)
		_S.define(_v22, "x", _S.read(_v22, "X0"))
		while _S.truth(_S.binary("<", _S.read(_v22, "x"), _S.read(_v22, "X1"))):
			var _v23 = _S.scope(_v22)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v23, "inBlock"), [_S.binary("+", _S.read(_v23, "x"), 0.5), _S.binary("+", _S.read(_v23, "y"), 0.5)]))):
				_v22 = _S.iteration(_v22)
				_S.write(_v22, "x", 1, "+=", true)
				continue
			_S.define(_v23, "f", _S.invoke(_S.read(_v23, "FACETS"), "findIndex", [_S.function_value(_v23, "_f7")]))
			if _S.truth(_S.binary("<", _S.read(_v23, "f"), 0)):
				_S.write(_v23, "f", _S.invoke(_S.read(_v23, "FACETS"), "reduce", [_S.function_value(_v23, "_f8"), 0]), "=", false)
			_S.set_prop(_S.read(_v23, "fid"), _S.binary("+", _S.binary("*", _S.binary("-", _S.read(_v23, "y"), _S.read(_v23, "Y0")), _S.read(_v23, "BW")), _S.binary("-", _S.read(_v23, "x"), _S.read(_v23, "X0"))), _S.read(_v23, "f"), "=", false)
			_v22 = _S.iteration(_v22)
			_S.write(_v22, "x", 1, "+=", true)
		_v21 = _S.iteration(_v21)
		_S.write(_v21, "y", 1, "+=", true)
	_S.define(_e, "at", _S.function_value(_e, "_f9"))
	for _v24 in _S.array(_S.read(_e, "FACETS")):
		var _v25 = _S.scope(_e)
		_S.define(_v25, "F", _v24)
		var _v26 = _S.scope(_v25)
		_S.set_prop(_S.read(_v26, "F"), "c", _S.call_value(_S.read(_v26, "centroid"), [_S.prop(_S.read(_v26, "F"), "pts")]), "=", false)
		_S.set_prop(_S.read(_v26, "F"), "tint", _S.prop(_S.read(_v26, "C"), _S.binary("+", 3, _S.invoke(_S.read(_v26, "Math"), "round", [_S.binary("*", _S.prop(_S.read(_v26, "F"), "lit"), 3)]))), "=", false)
		_S.set_prop(_S.read(_v26, "F"), "alpha", _S.binary("+", 0.2, _S.binary("*", 0.24, _S.prop(_S.read(_v26, "F"), "lit"))), "=", false)
		_S.set_prop(_S.read(_v26, "F"), "d", _S.call_value(_S.read(_v26, "clamp"), [_S.binary("/", _S.binary("+", _S.binary("+", _S.prop(_S.prop(_S.read(_v26, "F"), "c"), "x"), _S.binary("*", 0.55, _S.prop(_S.prop(_S.read(_v26, "F"), "c"), "y"))), 36), 46)]), "=", false)
		_S.set_prop(_S.read(_v26, "F"), "len", _S.invoke(_S.prop(_S.read(_v26, "F"), "pts"), "reduce", [_S.function_value(_v26, "_f10"), 0]), "=", false)
	_S.define(_e, "EDGES", [])
	for _v27 in _S.array(_S.read(_e, "FACETS")):
		var _v28 = _S.scope(_e)
		_S.define(_v28, "F", _v27)
		_S.invoke(_S.prop(_S.read(_v28, "F"), "pts"), "forEach", [_S.function_value(_v28, "_f11")])
	for _v29 in _S.array(_S.read(_e, "EDGES")):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "e", _v29)
		var _v31 = _S.scope(_v30)
		var _v32 = _S.prop(_S.read(_v31, "e"), "a")
		_S.define(_v31, "x0", _S.prop(_v32, 0))
		_S.define(_v31, "y0", _S.prop(_v32, 1))
		var _v33 = _S.prop(_S.read(_v31, "e"), "b")
		_S.define(_v31, "x1", _S.prop(_v33, 0))
		_S.define(_v31, "y1", _S.prop(_v33, 1))
		_S.define(_v31, "c", _S.prop(_S.prop(_S.prop(_S.read(_v31, "e"), "fs"), 0), "c"))
		_S.define(_v31, "nx", _S.binary("-", _S.read(_v31, "y1"), _S.read(_v31, "y0")))
		_S.define(_v31, "ny", _S.binary("-", _S.read(_v31, "x0"), _S.read(_v31, "x1")))
		if _S.truth(_S.binary("<", _S.binary("+", _S.binary("*", _S.read(_v31, "nx"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v31, "x0"), _S.read(_v31, "x1")), 2), _S.prop(_S.read(_v31, "c"), "x"))), _S.binary("*", _S.read(_v31, "ny"), _S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v31, "y0"), _S.read(_v31, "y1")), 2), _S.prop(_S.read(_v31, "c"), "y")))), 0)):
			_S.last([_S.write(_v31, "nx", _S.unary("-", _S.read(_v31, "nx")), "=", false), _S.write(_v31, "ny", _S.unary("-", _S.read(_v31, "ny")), "=", false)])
		_S.set_prop(_S.read(_v31, "e"), "outer", _S.binary("===", _S.prop(_S.prop(_S.read(_v31, "e"), "fs"), "length"), 1), "=", false)
		_S.set_prop(_S.read(_v31, "e"), "lit", _S.binary("/", _S.binary("-", _S.binary("*", _S.unary("-", _S.read(_v31, "nx")), 0.55), _S.binary("*", _S.read(_v31, "ny"), 0.84)), _S.invoke(_S.read(_v31, "Math"), "hypot", [_S.read(_v31, "nx"), _S.read(_v31, "ny")])), "=", false)
		_S.set_prop(_S.read(_v31, "e"), "floor", _S.logical("&&", _S.binary("===", _S.read(_v31, "y0"), 0), func(): return _S.binary("===", _S.read(_v31, "y1"), 0)), "=", false)
		_S.set_prop(_S.read(_v31, "e"), "at", _S.invoke(_S.read(_v31, "Math"), "min", _S.concat([_S.array(_S.invoke(_S.prop(_S.read(_v31, "e"), "fs"), "map", [_S.function_value(_v31, "_f13")]))])), "=", false)
	_S.define(_e, "VERTS", _S.invoke(_S.read(_e, "Object"), "values", [_S.read(_e, "V")]))
	_S.define(_e, "cracks", _S.call_value(_S.read(_e, "fractures"), [_S.read(_e, "R"), _S.function_value(_e, "_f14"), _S.prop(_S.read(_e, "CORE"), 0), _S.prop(_S.read(_e, "CORE"), 1), 3, _S.merge([{"len": 9}, {"a0": _S.unary("-", 2.2)}, {"spread": 3.6}])]))
	_S.define(_e, "cracks2", _S.call_value(_S.read(_e, "fractures"), [_S.read(_e, "R"), _S.function_value(_e, "_f15"), _S.binary("+", _S.prop(_S.read(_e, "CORE"), 0), 1), _S.binary("-", _S.prop(_S.read(_e, "CORE"), 1), 2), 6, _S.merge([{"len": 16}, {"fork": 0.22}])]))
	_S.define(_e, "t", 0)
	_S.define(_e, "formed", 0)
	_S.define(_e, "sealed", false)
	_S.define(_e, "struck", 0)
	_S.define(_e, "burst", false)
	_S.define(_e, "white", false)
	_S.define(_e, "jolt", _S.function_value(_e, "_f16"))
	_S.define(_e, "drawCharacter", _S.function_value(_e, "_f17"))
	_S.define(_e, "drawBlock", _S.function_value(_e, "_f18"))
	return _S.merge([{"update": _S.function_value(_e, "_f21")}, {"drawBack": _S.function_value(_e, "_f25")}, {"draw": _S.function_value(_e, "_f26")}])

static func _f2(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_bits = _S.read(_parent,"bits")
	var _n_B = _S.read(_parent,"B")
	var _n_R = _S.read(_parent,"R")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_P = _S.read(_parent,"P")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_q_b0 = _S.arg(_args,0)
	var _n_x_b1 = _S.arg(_args,1)
	var _n_y_b2 = _S.arg(_args,2)
	var _n_v_b3 = _S.arg(_args,3)
	if true:
		var _n_i_b4 = 0
		while _S.truth((_n_i_b4 < 3)):
			_S.invoke(_n_bits,"add",[{"kind":_S.named_value(_n_B,"SHARD"),"x":(_n_x_b1 + _S.invoke(_n_R,"range",[(-2), 2])),"y":(_n_y_b2 - 1),"vx":((_S.named_value(_n_q_b0,"vx") * 0.6) + _S.invoke(_n_R,"range",[(-50), 50])),"vy":(-_S.invoke(_n_R,"range",[30, 100])),"g":0.8,"drag":0.6,"bounce":0.35,"life":_S.invoke(_n_R,"range",[0.4, 0.8]),"a":_S.invoke(_n_R,"range",[0, _n_TAU]),"va":_S.invoke(_n_R,"range",[(-18), 18]),"s":_S.invoke(_n_R,"range",[1.2, 2.4]),"c":_S.index_value(_n_C,_S.invoke(_n_R,"int",[5, 7]))}])
			_n_i_b4 += 1.0
	_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"VAPOUR"), _n_x_b1, (_n_y_b2 - 1), _S.invoke(_n_R,"range",[(-25), 25]), (-_S.invoke(_n_R,"range",[2, 10])), _S.invoke(_n_R,"range",[0.4, 0.7]), _S.index_value(_n_C,6), _S.invoke(_n_R,"range",[1.4, 2.4])])
	if _S.truth(_S.invoke(_n_R,"chance",[0.4])):
		_S.invoke(_n_ps,"spawn",[_S.named_value(_n_P,"STAR"), _n_x_b1, (_n_y_b2 - 2), 0, (-6), _S.invoke(_n_R,"range",[0.2, 0.4]), _n_WHITE, _S.invoke(_n_R,"range",[0.8, 1.6])])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_A = _S.read(_parent,"A")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((_S.index_value(_S.named_value(_S.named_value(_n_A,"mask"),"data"),((_n_y_b1 * _n_W) + _n_x_b0)) > 0) if _S.truth(((_n_y_b1 < _n_H) if _S.truth(((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _n_H) if _S.truth(((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_reach = _S.read(_parent,"reach")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_reach,_n_a_b0) - _S.index_value(_n_reach,_n_b_b1))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_OUTLINE = _S.read(_parent,"OUTLINE")
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.call_value(_n_inPoly,[_n_OUTLINE, _n_x_b0, _n_y_b1])
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_inPoly = _S.read(_parent,"inPoly")
	var _n_F_b0 = _S.arg(_args,0)
	return _S.call_value(_n_inPoly,[_S.named_value(_n_F_b0,"pts"), (_n_x + 0.5), (_n_y + 0.5)])
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_centroid = _S.read(_parent,"centroid")
	var _n_x = _S.read(_parent,"x")
	var _n_y = _S.read(_parent,"y")
	var _n_FACETS = _S.read(_parent,"FACETS")
	var _n_b_b0 = _S.arg(_args,0)
	var _n_F_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return (_n_k_b2 if _S.truth((_S.Bridge.hypot([(_S.named_value(_S.call_value(_n_centroid,[_S.named_value(_n_F_b1,"pts")]),"x") - _n_x), (_S.named_value(_S.call_value(_n_centroid,[_S.named_value(_n_F_b1,"pts")]),"y") - _n_y)]) < _S.Bridge.hypot([(_S.named_value(_S.call_value(_n_centroid,[_S.named_value(_S.index_value(_n_FACETS,_n_b_b0),"pts")]),"x") - _n_x), (_S.named_value(_S.call_value(_n_centroid,[_S.named_value(_S.index_value(_n_FACETS,_n_b_b0),"pts")]),"y") - _n_y)]))) else _n_b_b0)
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_X0 = _S.read(_parent,"X0")
	var _n_X1 = _S.read(_parent,"X1")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_Y1 = _S.read(_parent,"Y1")
	var _n_fid = _S.read(_parent,"fid")
	var _n_BW = _S.read(_parent,"BW")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((-1) if _S.truth(((((_n_x_b0 < _n_X0) if _S.truth((_n_x_b0 < _n_X0)) else (_n_x_b0 >= _n_X1)) if _S.truth(((_n_x_b0 < _n_X0) if _S.truth((_n_x_b0 < _n_X0)) else (_n_x_b0 >= _n_X1))) else (_n_y_b1 < _n_Y0)) if _S.truth((((_n_x_b0 < _n_X0) if _S.truth((_n_x_b0 < _n_X0)) else (_n_x_b0 >= _n_X1)) if _S.truth(((_n_x_b0 < _n_X0) if _S.truth((_n_x_b0 < _n_X0)) else (_n_x_b0 >= _n_X1))) else (_n_y_b1 < _n_Y0))) else (_n_y_b1 >= _n_Y1))) else _S.index_value(_n_fid,(((_n_y_b1 - _n_Y0) * _n_BW) + (_n_x_b0 - _n_X0))))
	return null

static func _f10(_parent,_args:Array,_this=null):
	var _n_F = _S.read(_parent,"F")
	var _n_s_b0 = _S.arg(_args,0)
	var _n_q_b1 = _S.arg(_args,1)
	var _n_k_b2 = _S.arg(_args,2)
	return (_n_s_b0 + _S.Bridge.hypot([(_S.index_value(_S.index_value(_S.named_value(_n_F,"pts"),fmod((_n_k_b2 + 1),_S.prop(_S.named_value(_n_F,"pts"),"length"))),0) - _S.index_value(_n_q_b1,0)), (_S.index_value(_S.index_value(_S.named_value(_n_F,"pts"),fmod((_n_k_b2 + 1),_S.prop(_S.named_value(_n_F,"pts"),"length"))),1) - _S.index_value(_n_q_b1,1))]))
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "k", _S.arg(_args, 1))
	_S.define(_e, "b", _S.prop(_S.prop(_S.read(_e, "F"), "pts"), _S.binary("%", _S.binary("+", _S.read(_e, "k"), 1), _S.prop(_S.prop(_S.read(_e, "F"), "pts"), "length"))))
	_S.define(_e, "e", _S.invoke(_S.read(_e, "EDGES"), "find", [_S.function_value(_e, "_f12")]))
	if _S.truth(_S.unary("!", _S.read(_e, "e"))):
		_S.invoke(_S.read(_e, "EDGES"), "push", [_S.write(_e, "e", _S.merge([{"a": _S.read(_e, "a")}, {"b": _S.read(_e, "b")}, {"fs": []}]), "=", false)])
	_S.invoke(_S.prop(_S.read(_e, "e"), "fs"), "push", [_S.read(_e, "F")])
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_a = _S.read(_parent,"a")
	var _n_b = _S.read(_parent,"b")
	var _n_e_b0 = _S.arg(_args,0)
	return ((_S.binary("===",_S.named_value(_n_e_b0,"b"),_n_b) if _S.truth(_S.binary("===",_S.named_value(_n_e_b0,"a"),_n_a)) else _S.binary("===",_S.named_value(_n_e_b0,"a"),_n_a)) if _S.truth((_S.binary("===",_S.named_value(_n_e_b0,"b"),_n_b) if _S.truth(_S.binary("===",_S.named_value(_n_e_b0,"a"),_n_a)) else _S.binary("===",_S.named_value(_n_e_b0,"a"),_n_a))) else (_S.binary("===",_S.named_value(_n_e_b0,"b"),_n_a) if _S.truth(_S.binary("===",_S.named_value(_n_e_b0,"a"),_n_b)) else _S.binary("===",_S.named_value(_n_e_b0,"a"),_n_b)))
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_F_b0 = _S.arg(_args,0)
	return _S.named_value(_n_F_b0,"at")
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_inBlock = _S.read(_parent,"inBlock")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.call_value(_n_inBlock,[_n_x_b0, _n_y_b1])
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_inBlock = _S.read(_parent,"inBlock")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return _S.call_value(_n_inBlock,[_n_x_b0, _n_y_b1])
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_CRACK2 = _S.read(_parent,"CRACK2")
	var _n_FLASH = _S.read(_parent,"FLASH")
	return (1 if _S.truth(((_n_t < (_n_CRACK + 0.06)) if _S.truth((_n_t >= _n_CRACK)) else (_n_t >= _n_CRACK))) else ((1 if _S.truth(fmod(floori((_n_t * 40)),2)) else (-1)) if _S.truth(((_n_t < _n_FLASH) if _S.truth((_n_t >= _n_CRACK2)) else (_n_t >= _n_CRACK2))) else 0))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_ease = _S.read(_parent,"ease")
	var _n_t = _S.read(_parent,"t")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_THAW = _S.read(_parent,"THAW")
	var _n_H = _S.read(_parent,"H")
	var _n_reach = _S.read(_parent,"reach")
	var _n_W = _S.read(_parent,"W")
	var _n_A = _S.read(_parent,"A")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_ice = _S.read(_parent,"ice")
	var _n_order = _S.read(_parent,"order")
	var _n_feathers = _S.read(_parent,"feathers")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_thaw_b1 = (((_S.invoke(_n_ease,"inQuad",[_S.MathFX.seg(_n_t,_n_BURST,(_n_BURST + _n_THAW))]) * (_n_H + 2)) - 2) if _S.truth((_n_t >= _n_BURST)) else (-1))
	for _iter_0 in _S.array(_n_order):
		var _n_i_b2 = _iter_0
		var _n_age_b3 = (_n_t - _S.index_value(_n_reach,_n_i_b2))
		if _S.truth((_n_age_b3 < 0)):
			break
		var _n_x_b4 = fmod(_n_i_b2,_n_W)
		var _n_y_b5 = _S.binary("|",(float(_n_i_b2)/_n_W),0)
		if _S.truth((_n_y_b5 < _n_thaw_b1)):
			continue
		_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_A,"x") + _n_x_b4), (_S.named_value(_n_A,"y") + _n_y_b5), (_S.index_value(_n_C,7) if _S.truth(((_n_t >= _n_BURST) if _S.truth((_n_y_b5 < (_n_thaw_b1 + 1.2))) else (_n_y_b5 < (_n_thaw_b1 + 1.2)))) else (_n_WHITE if _S.truth((_n_age_b3 < 0.016)) else (_S.index_value(_n_C,6) if _S.truth((_n_age_b3 < 0.045)) else _S.index_value(_n_ice,_n_i_b2))))])
		if _S.truth((_n_age_b3 < 0.03)):
			_S.invoke(_n_p_b0,"light",[(_S.named_value(_n_A,"x") + _n_x_b4), (_S.named_value(_n_A,"y") + _n_y_b5), _S.index_value(_n_C,6), 0.3])
	if _S.truth((_n_t >= _n_BURST)):
		return null
	for _iter_1 in _S.array(_n_feathers):
		var _n_f_b6 = _iter_1
		var _n_g_b7 = clampf((float((_n_t - _S.named_value(_n_f_b6,"at")))/0.08),0.0,1.0)
		if _S.truth((_n_g_b7 <= 0)):
			continue
		var _n_L_b8 = floori((_S.named_value(_n_f_b6,"L") * _n_g_b7)+0.5)
		if true:
			var _n_j_b9 = 0
			while _S.truth((_n_j_b9 < _n_L_b8)):
				_S.invoke(_n_p_b0,"px",[(_S.named_value(_n_f_b6,"x") + (_S.named_value(_n_f_b6,"dx") * _n_j_b9)), (_S.named_value(_n_f_b6,"y") + (_S.named_value(_n_f_b6,"dy") * _n_j_b9)), (_n_WHITE if _S.truth(_S.binary("===",_n_j_b9,(_n_L_b8 - 1))) else _S.index_value(_n_C,6))])
				_n_j_b9 += 1.0
	return null

static func _f18(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_SEAL = _S.read(_parent,"SEAL")
	var _n_jolt = _S.read(_parent,"jolt")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_SWEEPS = _S.read(_parent,"SWEEPS")
	var _n_this = _S.read(_parent,"this")
	var _n_FACETS = _S.read(_parent,"FACETS")
	var _n_Y0 = _S.read(_parent,"Y0")
	var _n_X0 = _S.read(_parent,"X0")
	var _n_at = _S.read(_parent,"at")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_X1 = _S.read(_parent,"X1")
	var _n_Y1 = _S.read(_parent,"Y1")
	var _n_EDGES = _S.read(_parent,"EDGES")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_drawFractures = _S.read(_parent,"drawFractures")
	var _n_CRACK2 = _S.read(_parent,"CRACK2")
	var _n_cracks2 = _S.read(_parent,"cracks2")
	var _n_p_b0 = _S.arg(_args,0)
	if _S.truth(((_n_t >= _n_BURST) if _S.truth((_n_t >= _n_BURST)) else (_n_t < (_n_SEAL - 0.08)))):
		return null
	var _n_jx_b1 = _S.call_value(_n_jolt,[])
	var _n_wh_b2 = (_n_t >= _n_FLASH)
	for _iter_0 in _S.array(_n_FACETS):
		var _n_F_b3 = _iter_0
		_S.set_prop(_n_F_b3,"g",(_S.invoke(_n_SWEEPS,"reduce",[_S.function_value(_S.capture(_parent,{"F":_n_F_b3,"this":_n_this}),"_f19"), 0]) * (0.35 + (0.65 * _S.named_value(_n_F_b3,"lit")))),"=")
	if true:
		var _n_y_b4 = _n_Y0
		while _S.truth((_n_y_b4 < _n_Y1)):
			if true:
				var _n_x_b5 = _n_X0
				while _S.truth((_n_x_b5 < _n_X1)):
					var _n_f_b6 = _S.call_value(_n_at,[_n_x_b5, _n_y_b4])
					if _S.truth((_n_f_b6 < 0)):
						_n_x_b5 += 1.0
						continue
					var _n_F_b7 = _S.index_value(_n_FACETS,_n_f_b6)
					var _n_age_b8 = (_n_t - _S.named_value(_n_F_b7,"at"))
					if _S.truth((_n_age_b8 < 0)):
						_n_x_b5 += 1.0
						continue
					if _S.truth(_n_wh_b2):
						_S.invoke(_n_p_b0,"px",[(_n_x_b5 + _n_jx_b1), _n_y_b4, _n_WHITE])
						_n_x_b5 += 1.0
						continue
					if _S.truth((_n_age_b8 < 0.03)):
						_S.invoke(_n_p_b0,"blend",[(_n_x_b5 + _n_jx_b1), _n_y_b4, _S.index_value(_n_C,7), 0.55])
						_n_x_b5 += 1.0
						continue
					var _n_fresh_b9 = (1 - clampf((float((_n_age_b8 - 0.03))/0.1),0.0,1.0))
					var _n_g_b10 = _S.named_value(_n_F_b7,"g")
					_S.invoke(_n_p_b0,"blend",[(_n_x_b5 + _n_jx_b1), _n_y_b4, (_S.index_value(_n_C,6) if _S.truth(((_n_fresh_b9 > 0.5) if _S.truth((_n_fresh_b9 > 0.5)) else (_n_g_b10 > 0.5))) else _S.named_value(_n_F_b7,"tint")), ((_S.named_value(_n_F_b7,"alpha") + (0.25 * _n_fresh_b9)) + (0.15 * _n_g_b10))])
					if _S.truth((_n_g_b10 > 0.05)):
						_S.invoke(_n_p_b0,"light",[(_n_x_b5 + _n_jx_b1), _n_y_b4, _S.index_value(_n_C,5), (0.42 * _n_g_b10)])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	for _iter_1 in _S.array(_n_EDGES):
		var _n_e_b11 = _iter_1
		if _S.truth((_S.named_value(_n_e_b11,"floor") if _S.truth(_S.named_value(_n_e_b11,"floor")) else (_n_t < _S.named_value(_n_e_b11,"at")))):
			continue
		var _tuple_2 = _S.named_value(_n_e_b11,"a")
		var _n_x0_b12 = _S.prop(_tuple_2,0)
		var _n_y0_b13 = _S.prop(_tuple_2,1)
		var _tuple_3 = _S.named_value(_n_e_b11,"b")
		var _n_x1_b14 = _S.prop(_tuple_3,0)
		var _n_y1_b15 = _S.prop(_tuple_3,1)
		var _n_fresh_b16 = _S.invoke(_S.named_value(_n_e_b11,"fs"),"some",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f20")])
		if _S.truth((not _S.truth(_n_wh_b2) if _S.truth(((_S.named_value(_n_e_b11,"lit") < 0) if _S.truth(_S.named_value(_n_e_b11,"outer")) else _S.named_value(_n_e_b11,"outer"))) else ((_S.named_value(_n_e_b11,"lit") < 0) if _S.truth(_S.named_value(_n_e_b11,"outer")) else _S.named_value(_n_e_b11,"outer")))):
			_S.invoke(_n_p_b0,"line",[((_n_x0_b12 + _n_jx_b1) + 1), _n_y0_b13, ((_n_x1_b14 + _n_jx_b1) + 1), _n_y1_b15, _S.index_value(_n_C,1)])
		if _S.truth(_S.named_value(_n_e_b11,"outer")):
			_S.invoke(_n_p_b0,"glowLine",[(_n_x0_b12 + _n_jx_b1), _n_y0_b13, (_n_x1_b14 + _n_jx_b1), _n_y1_b15, 5, _S.index_value(_n_C,4), 0.1])
		_S.invoke(_n_p_b0,"line",[(_n_x0_b12 + _n_jx_b1), _n_y0_b13, (_n_x1_b14 + _n_jx_b1), _n_y1_b15, (_S.index_value(_n_C,6) if _S.truth(_n_wh_b2) else (_n_WHITE if _S.truth(_n_fresh_b16) else ((_n_WHITE if _S.truth((_S.named_value(_n_e_b11,"lit") > 0.3)) else (_S.index_value(_n_C,6) if _S.truth((_S.named_value(_n_e_b11,"lit") > (-0.2))) else _S.index_value(_n_C,4))) if _S.truth(_S.named_value(_n_e_b11,"outer")) else (_S.index_value(_n_C,6) if _S.truth(((float((_n_y0_b13 + _n_y1_b15))/2) < (-30))) else _S.index_value(_n_C,5)))))])
	for _iter_4 in _S.array(_n_FACETS):
		var _n_F_b17 = _iter_4
		var _n_age_b18 = (_n_t - _S.named_value(_n_F_b17,"at"))
		if _S.truth(((_n_age_b18 < (-0.07)) if _S.truth((_n_age_b18 < (-0.07))) else (_n_age_b18 >= 0))):
			continue
		var _n_left_b19 = ((float((_n_age_b18 + 0.07))/0.07) * _S.named_value(_n_F_b17,"len"))
		if true:
			var _n_k_b20 = 0
			while _S.truth(((_n_left_b19 > 0) if _S.truth((_n_k_b20 < _S.prop(_S.named_value(_n_F_b17,"pts"),"length"))) else (_n_k_b20 < _S.prop(_S.named_value(_n_F_b17,"pts"),"length")))):
				var _tuple_5 = _S.index_value(_S.named_value(_n_F_b17,"pts"),_n_k_b20)
				var _n_x0_b21 = _S.prop(_tuple_5,0)
				var _n_y0_b22 = _S.prop(_tuple_5,1)
				var _tuple_6 = _S.index_value(_S.named_value(_n_F_b17,"pts"),fmod((_n_k_b20 + 1),_S.prop(_S.named_value(_n_F_b17,"pts"),"length")))
				var _n_x1_b23 = _S.prop(_tuple_6,0)
				var _n_y1_b24 = _S.prop(_tuple_6,1)
				var _n_L_b25 = _S.Bridge.hypot([(_n_x1_b23 - _n_x0_b21), (_n_y1_b24 - _n_y0_b22)])
				var _n_v_b26 = minf(1,(float(_n_left_b19)/_n_L_b25))
				_n_left_b19 -= _n_L_b25
				_S.invoke(_n_p_b0,"line",[(_n_x0_b21 + _n_jx_b1), _n_y0_b22, ((_n_x0_b21 + _n_jx_b1) + ((_n_x1_b23 - _n_x0_b21) * _n_v_b26)), (_n_y0_b22 + ((_n_y1_b24 - _n_y0_b22) * _n_v_b26)), _n_WHITE])
				if _S.truth((_n_v_b26 < 1)):
					_S.invoke(_n_p_b0,"glow",[((_n_x0_b21 + _n_jx_b1) + ((_n_x1_b23 - _n_x0_b21) * _n_v_b26)), (_n_y0_b22 + ((_n_y1_b24 - _n_y0_b22) * _n_v_b26)), 6, _S.index_value(_n_C,6), 0.6])
				_n_k_b20 += 1.0
	if _S.truth((not _S.truth(_n_wh_b2) if _S.truth((_n_t >= _n_CRACK)) else (_n_t >= _n_CRACK))):
		_S.call_value(_n_drawFractures,[_n_p_b0, _n_cracks, ((_n_t - _n_CRACK) * 150), _n_C, {"ox":_n_jx_b1}])
	if _S.truth((not _S.truth(_n_wh_b2) if _S.truth((_n_t >= _n_CRACK2)) else (_n_t >= _n_CRACK2))):
		_S.call_value(_n_drawFractures,[_n_p_b0, _n_cracks2, ((_n_t - _n_CRACK2) * 190), _n_C, {"ox":_n_jx_b1}])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_F = _S.read(_parent,"F")
	var _n_g_b0 = _S.arg(_args,0)
	var _n_s0_b1 = _S.arg(_args,1)
	return maxf(_n_g_b0,sin((PI * clampf((float(((_n_t - _n_s0_b1) - (_S.named_value(_n_F,"d") * 0.32)))/0.13),0.0,1.0))))
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_t = _S.read(_parent,"t")
	var _n_F_b0 = _S.arg(_args,0)
	return (((_n_t - _S.named_value(_n_F_b0,"at")) < 0.1) if _S.truth(((_n_t - _S.named_value(_n_F_b0,"at")) < 0.1)) else (_S.named_value(_n_F_b0,"g") > 0.6))
	return null

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "SNAP"))):
		for _v60 in _S.array([_S.unary("-", 1), 1]):
			var _v61 = _S.scope(_e)
			_S.define(_v61, "s", _v60)
			var _v62 = _S.scope(_v61)
			_S.define(_v62, "x", _S.binary("*", _S.binary("*", _S.read(_v62, "s"), _S.read(_v62, "REACH")), _S.binary("-", 1, _S.binary("/", _S.read(_v62, "t"), _S.read(_v62, "SNAP")))))
			if _S.truth(_S.invoke(_S.read(_v62, "R"), "chance", [0.12])):
				_S.invoke(_S.read(_v62, "ps"), "spawn", [_S.prop(_S.read(_v62, "P"), "VAPOUR"), _S.read(_v62, "x"), _S.unary("-", _S.invoke(_S.read(_v62, "R"), "range", [0, 2])), _S.binary("*", _S.unary("-", _S.read(_v62, "s")), _S.invoke(_S.read(_v62, "R"), "range", [40, 90])), _S.unary("-", _S.invoke(_S.read(_v62, "R"), "range", [0, 5])), _S.invoke(_S.read(_v62, "R"), "range", [0.3, 0.5]), _S.prop(_S.read(_v62, "C"), 6), _S.invoke(_S.read(_v62, "R"), "range", [1.4, 2.4])])
			if _S.truth(_S.invoke(_S.read(_v62, "R"), "chance", [0.45])):
				_S.invoke(_S.read(_v62, "ps"), "spawn", [_S.prop(_S.read(_v62, "P"), "STREAK"), _S.binary("+", _S.read(_v62, "x"), _S.binary("*", _S.read(_v62, "s"), _S.invoke(_S.read(_v62, "R"), "range", [0, 6]))), _S.unary("-", _S.invoke(_S.read(_v62, "R"), "range", [1, 4])), _S.binary("*", _S.unary("-", _S.read(_v62, "s")), _S.invoke(_S.read(_v62, "R"), "range", [50, 90])), 0, _S.invoke(_S.read(_v62, "R"), "range", [0.1, 0.16]), (_S.prop(_S.read(_v62, "C"), 6) if _S.truth(_S.invoke(_S.read(_v62, "R"), "chance", [0.5])) else _S.prop(_S.read(_v62, "C"), 5))])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.prop(_S.read(_e, "CLIMB"), 0)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.prop(_S.read(_e, "CLIMB"), 1), 0.03)))):
		var _v63 = _S.scope(_e)
		_S.define(_v63, "lo", 0)
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v63, "lo"), _S.prop(_S.read(_v63, "order"), "length")), func(): return _S.binary("<", _S.prop(_S.read(_v63, "reach"), _S.prop(_S.read(_v63, "order"), _S.read(_v63, "lo"))), _S.binary("-", _S.read(_v63, "t"), 0.06)))):
			_S.write(_v63, "lo", 1, "+=", true)
		_S.define(_v63, "hi", _S.read(_v63, "lo"))
		while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v63, "hi"), _S.prop(_S.read(_v63, "order"), "length")), func(): return _S.binary("<=", _S.prop(_S.read(_v63, "reach"), _S.prop(_S.read(_v63, "order"), _S.read(_v63, "hi"))), _S.read(_v63, "t")))):
			_S.write(_v63, "hi", 1, "+=", true)
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v63, "hi"), _S.read(_v63, "lo")), func(): return _S.invoke(_S.read(_v63, "R"), "chance", [0.45]))):
			var _v64 = _S.scope(_v63)
			_S.define(_v64, "i", _S.prop(_S.read(_v64, "order"), _S.invoke(_S.read(_v64, "R"), "int", [_S.read(_v64, "lo"), _S.binary("-", _S.read(_v64, "hi"), 1)])))
			_S.invoke(_S.read(_v64, "ps"), "spawn", [_S.prop(_S.read(_v64, "P"), "STAR"), _S.binary("+", _S.binary("+", _S.prop(_S.read(_v64, "A"), "x"), _S.binary("%", _S.read(_v64, "i"), _S.read(_v64, "W"))), 0.5), _S.binary("+", _S.prop(_S.read(_v64, "A"), "y"), _S.binary("|", _S.binary("/", _S.read(_v64, "i"), _S.read(_v64, "W")), 0)), _S.invoke(_S.read(_v64, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", _S.invoke(_S.read(_v64, "R"), "range", [0, 18])), _S.invoke(_S.read(_v64, "R"), "range", [0.2, 0.42]), (_S.prop(_S.read(_v64, "C"), 6) if _S.truth(_S.invoke(_S.read(_v64, "R"), "chance", [0.5])) else _S.read(_v64, "WHITE")), _S.invoke(_S.read(_v64, "R"), "range", [0.6, 1.9])])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v63, "hi"), _S.read(_v63, "lo")), func(): return _S.invoke(_S.read(_v63, "R"), "chance", [0.12]))):
			var _v65 = _S.scope(_v63)
			_S.define(_v65, "i", _S.prop(_S.read(_v65, "order"), _S.invoke(_S.read(_v65, "R"), "int", [_S.read(_v65, "lo"), _S.binary("-", _S.read(_v65, "hi"), 1)])))
			_S.invoke(_S.read(_v65, "ps"), "spawn", [_S.prop(_S.read(_v65, "P"), "FLAKE"), _S.binary("+", _S.prop(_S.read(_v65, "A"), "x"), _S.binary("%", _S.read(_v65, "i"), _S.read(_v65, "W"))), _S.binary("+", _S.prop(_S.read(_v65, "A"), "y"), _S.binary("|", _S.binary("/", _S.read(_v65, "i"), _S.read(_v65, "W")), 0)), _S.invoke(_S.read(_v65, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [10, 30])), _S.invoke(_S.read(_v65, "R"), "range", [0.5, 0.9]), _S.prop(_S.read(_v65, "C"), 6), _S.invoke(_S.read(_v65, "R"), "range", [0.5, 1.2])])
	while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_e, "formed"), _S.prop(_S.read(_e, "FACETS"), "length")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.prop(_S.prop(_S.read(_e, "FACETS"), _S.read(_e, "formed")), "at")))):
		var _v66 = _S.scope(_e)
		_S.define(_v66, "F", _S.prop(_S.read(_v66, "FACETS"), _S.write(_v66, "formed", 1, "+=", true)))
		_S.define(_v66, "c", _S.call_value(_S.read(_v66, "centroid"), [_S.prop(_S.read(_v66, "F"), "pts")]))
		var _v67 = _S.scope(_v66)
		_S.define(_v67, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v67, "i"), 3)):
			var _v68 = _S.scope(_v67)
			_S.define(_v68, "a", _S.binary("+", _S.invoke(_S.read(_v68, "Math"), "atan2", [_S.binary("-", _S.prop(_S.read(_v68, "c"), "y"), _S.prop(_S.read(_v68, "CORE"), 1)), _S.binary("-", _S.prop(_S.read(_v68, "c"), "x"), _S.prop(_S.read(_v68, "CORE"), 0))]), _S.invoke(_S.read(_v68, "R"), "range", [_S.unary("-", 0.7), 0.7])))
			_S.define(_v68, "sp", _S.invoke(_S.read(_v68, "R"), "range", [50, 120]))
			_S.invoke(_S.read(_v68, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v68, "B"), "SHARD")}, {"x": _S.prop(_S.read(_v68, "c"), "x")}, {"y": _S.prop(_S.read(_v68, "c"), "y")}, {"vx": _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "cos", [_S.read(_v68, "a")]), _S.read(_v68, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v68, "Math"), "sin", [_S.read(_v68, "a")]), _S.read(_v68, "sp")), 40)}, {"g": 0.8}, {"drag": 0.8}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v68, "R"), "range", [0.35, 0.7])}, {"a": _S.invoke(_S.read(_v68, "R"), "range", [0, _S.read(_v68, "TAU")])}, {"va": _S.invoke(_S.read(_v68, "R"), "range", [_S.unary("-", 18), 18])}, {"s": _S.invoke(_S.read(_v68, "R"), "range", [1, 2.2])}, {"c": _S.prop(_S.read(_v68, "C"), _S.invoke(_S.read(_v68, "R"), "int", [5, 7]))}])])
			_v67 = _S.iteration(_v67)
			_S.write(_v67, "i", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v66, "c"), "y"), _S.unary("-", 14))):
			_S.invoke(_S.read(_v66, "ps"), "spawn", [_S.prop(_S.read(_v66, "P"), "VAPOUR"), _S.prop(_S.read(_v66, "c"), "x"), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v66, "Math"), "sign", [_S.logical("||", _S.prop(_S.read(_v66, "c"), "x"), func(): return 1)]), _S.invoke(_S.read(_v66, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v66, "R"), "range", [2, 8])), _S.invoke(_S.read(_v66, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v66, "C"), 6), _S.invoke(_S.read(_v66, "R"), "range", [2.2, 3.4])])
		_S.invoke(_S.read(_v66, "ps"), "spawn", [_S.prop(_S.read(_v66, "P"), "STAR"), _S.binary("+", _S.prop(_S.read(_v66, "c"), "x"), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 2), 2])), _S.binary("+", _S.prop(_S.read(_v66, "c"), "y"), _S.invoke(_S.read(_v66, "R"), "range", [_S.unary("-", 2), 2])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v66, "R"), "range", [0.25, 0.45]), _S.read(_v66, "WHITE"), _S.invoke(_S.read(_v66, "R"), "range", [1.2, 2.2])])
		_S.invoke(_S.read(_v66, "lights"), "add", [_S.prop(_S.read(_v66, "c"), "x"), _S.prop(_S.read(_v66, "c"), "y"), 16, _S.prop(_S.read(_v66, "C"), 6), 0.4, 0.12])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "sealed")), func(): return _S.binary("===", _S.read(_e, "formed"), _S.prop(_S.read(_e, "FACETS"), "length")))):
		var _v69 = _S.scope(_e)
		_S.write(_v69, "sealed", true, "=", false)
		_S.invoke(_S.read(_v69, "lights"), "add", [0, _S.unary("-", 26), 70, _S.prop(_S.read(_v69, "C"), 5), 0.6, 0.4])
		var _v70 = _S.scope(_v69)
		_S.define(_v70, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v70, "i"), 5)):
			_S.invoke(_S.read(_v70, "ps"), "spawn", [_S.prop(_S.read(_v70, "P"), "STAR"), _S.invoke(_S.read(_v70, "R"), "range", [_S.unary("-", 15), 15]), _S.unary("-", _S.invoke(_S.read(_v70, "R"), "range", [6, 44])), _S.invoke(_S.read(_v70, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v70, "R"), "range", [0, 8])), _S.invoke(_S.read(_v70, "R"), "range", [0.3, 0.6]), (_S.read(_v70, "WHITE") if _S.truth(_S.invoke(_S.read(_v70, "R"), "chance", [0.5])) else _S.prop(_S.read(_v70, "C"), 6)), _S.invoke(_S.read(_v70, "R"), "range", [1, 2.2])])
			_v70 = _S.iteration(_v70)
			_S.write(_v70, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.read(_e, "sealed"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRACK2")))):
		var _v71 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v71, "R"), "chance", [0.035])):
			var _v72 = _S.scope(_v71)
			var _v73 = _S.invoke(_S.read(_v72, "R"), "pick", [_S.read(_v72, "VERTS")])
			_S.define(_v72, "x", _S.prop(_v73, 0))
			_S.define(_v72, "y", _S.prop(_v73, 1))
			_S.invoke(_S.read(_v72, "ps"), "spawn", [_S.prop(_S.read(_v72, "P"), "STAR"), _S.binary("+", _S.read(_v72, "x"), _S.invoke(_S.read(_v72, "R"), "range", [_S.unary("-", 1), 1])), _S.binary("+", _S.read(_v72, "y"), _S.invoke(_S.read(_v72, "R"), "range", [_S.unary("-", 1), 1])), 0, _S.unary("-", 2), _S.invoke(_S.read(_v72, "R"), "range", [0.3, 0.6]), (_S.prop(_S.read(_v72, "C"), 6) if _S.truth(_S.invoke(_S.read(_v72, "R"), "chance", [0.6])) else _S.read(_v72, "WHITE")), _S.invoke(_S.read(_v72, "R"), "range", [0.8, 2.2])])
		if _S.truth(_S.invoke(_S.read(_v71, "R"), "chance", [0.025])):
			var _v74 = _S.scope(_v71)
			_S.define(_v74, "s", _S.invoke(_S.read(_v74, "R"), "sign", []))
			_S.invoke(_S.read(_v74, "ps"), "spawn", [_S.prop(_S.read(_v74, "P"), "VAPOUR"), _S.binary("*", _S.read(_v74, "s"), _S.invoke(_S.read(_v74, "R"), "range", [12, 18])), _S.unary("-", _S.invoke(_S.read(_v74, "R"), "range", [1, 3])), _S.binary("*", _S.read(_v74, "s"), _S.invoke(_S.read(_v74, "R"), "range", [8, 24])), _S.unary("-", _S.invoke(_S.read(_v74, "R"), "range", [1, 5])), _S.invoke(_S.read(_v74, "R"), "range", [0.7, 1.1]), _S.prop(_S.read(_v74, "C"), 6), _S.invoke(_S.read(_v74, "R"), "range", [1.8, 3])])
		if _S.truth(_S.invoke(_S.read(_v71, "R"), "chance", [0.012])):
			_S.invoke(_S.read(_v71, "ps"), "spawn", [_S.prop(_S.read(_v71, "P"), "FLAKE"), _S.invoke(_S.read(_v71, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v71, "R"), "range", [56, 76])), _S.invoke(_S.read(_v71, "R"), "range", [_S.unary("-", 4), 4]), _S.invoke(_S.read(_v71, "R"), "range", [4, 10]), _S.invoke(_S.read(_v71, "R"), "range", [1.2, 1.8]), (_S.read(_v71, "WHITE") if _S.truth(_S.invoke(_S.read(_v71, "R"), "chance", [0.5])) else _S.prop(_S.read(_v71, "C"), 6)), _S.invoke(_S.read(_v71, "R"), "range", [0.5, 1.4])])
	if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "struck"), 0), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v75 = _S.scope(_e)
		_S.write(_v75, "struck", 1, "=", false)
		_S.invoke(_S.read(_v75, "lights"), "add", [_S.prop(_S.read(_v75, "CORE"), 0), _S.prop(_S.read(_v75, "CORE"), 1), 26, _S.read(_v75, "WHITE"), 0.4, 0.1])
		var _v76 = _S.scope(_v75)
		_S.define(_v76, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v76, "i"), 4)):
			_S.invoke(_S.read(_v76, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v76, "B"), "SHARD")}, {"x": _S.invoke(_S.read(_v76, "R"), "range", [_S.unary("-", 14), 14])}, {"y": _S.unary("-", _S.invoke(_S.read(_v76, "R"), "range", [10, 40]))}, {"vx": _S.invoke(_S.read(_v76, "R"), "range", [_S.unary("-", 40), 40])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v76, "R"), "range", [10, 60]))}, {"g": 0.9}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v76, "R"), "range", [0.5, 0.9])}, {"a": _S.invoke(_S.read(_v76, "R"), "range", [0, _S.read(_v76, "TAU")])}, {"va": _S.invoke(_S.read(_v76, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v76, "R"), "range", [1, 2])}, {"c": _S.prop(_S.read(_v76, "C"), _S.invoke(_S.read(_v76, "R"), "int", [5, 7]))}])])
			_v76 = _S.iteration(_v76)
			_S.write(_v76, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_e, "struck"), 1), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK2")))):
		var _v77 = _S.scope(_e)
		_S.write(_v77, "struck", 2, "=", false)
		_S.invoke(_S.read(_v77, "lights"), "add", [_S.prop(_S.read(_v77, "CORE"), 0), _S.prop(_S.read(_v77, "CORE"), 1), 40, _S.prop(_S.read(_v77, "C"), 6), 0.35, 0.16])
		var _v78 = _S.scope(_v77)
		_S.define(_v78, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v78, "i"), 3)):
			_S.invoke(_S.read(_v78, "ps"), "spawn", [_S.prop(_S.read(_v78, "P"), "STAR"), _S.invoke(_S.read(_v78, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v78, "R"), "range", [8, 40])), 0, _S.unary("-", 3), _S.invoke(_S.read(_v78, "R"), "range", [0.15, 0.3]), _S.read(_v78, "WHITE"), _S.invoke(_S.read(_v78, "R"), "range", [1, 2])])
			_v78 = _S.iteration(_v78)
			_S.write(_v78, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "white")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "FLASH")))):
		var _v79 = _S.scope(_e)
		_S.write(_v79, "white", true, "=", false)
		_S.invoke(_S.read(_v79, "lights"), "add", [_S.prop(_S.read(_v79, "CORE"), 0), _S.prop(_S.read(_v79, "CORE"), 1), 60, _S.read(_v79, "WHITE"), 0.9, 0.1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURST")))):
		var _v80 = _S.scope(_e)
		_S.write(_v80, "burst", true, "=", false)
		_S.invoke(_S.read(_v80, "lights"), "add", [_S.prop(_S.read(_v80, "CORE"), 0), _S.prop(_S.read(_v80, "CORE"), 1), 64, _S.read(_v80, "WHITE"), 0.85, 0.14])
		_S.invoke(_S.read(_v80, "lights"), "add", [_S.prop(_S.read(_v80, "CORE"), 0), _S.binary("-", _S.prop(_S.read(_v80, "CORE"), 1), 4), 72, _S.prop(_S.read(_v80, "C"), 4), 0.55, 0.6])
		_S.define(_v80, "chop", _S.function_value(_v80, "_f22"))
		for _v81 in _S.array(_S.read(_v80, "FACETS")):
			var _v82 = _S.scope(_v80)
			_S.define(_v82, "F", _v81)
			var _v83 = _S.scope(_v82)
			for _v84 in _S.array(_S.call_value(_S.read(_v83, "chop"), [_S.prop(_S.read(_v83, "F"), "pts"), 0])):
				var _v85 = _S.scope(_v83)
				_S.define(_v85, "part", _v84)
				var _v86 = _S.scope(_v85)
				_S.define(_v86, "m", _S.call_value(_S.read(_v86, "centroid"), [_S.read(_v86, "part")]))
				_S.define(_v86, "dx", _S.binary("-", _S.prop(_S.read(_v86, "m"), "x"), _S.prop(_S.read(_v86, "CORE"), 0)))
				_S.define(_v86, "dy", _S.binary("-", _S.prop(_S.read(_v86, "m"), "y"), _S.prop(_S.read(_v86, "CORE"), 1)))
				_S.define(_v86, "d", _S.logical("||", _S.invoke(_S.read(_v86, "Math"), "hypot", [_S.read(_v86, "dx"), _S.read(_v86, "dy")]), func(): return 1))
				_S.define(_v86, "sp", _S.binary("*", _S.invoke(_S.read(_v86, "R"), "range", [40, 85]), _S.binary("-", 1.2, _S.invoke(_S.read(_v86, "Math"), "min", [0.5, _S.binary("/", _S.prop(_S.read(_v86, "m"), "area"), 120)]))))
				_S.invoke(_S.read(_v86, "panes"), "add", [_S.merge([{"pts": _S.invoke(_S.read(_v86, "part"), "map", [_S.function_value(_v86, "_f24")])}, {"x": _S.prop(_S.read(_v86, "m"), "x")}, {"y": _S.prop(_S.read(_v86, "m"), "y")}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v86, "dx"), _S.read(_v86, "d")), _S.read(_v86, "sp")), _S.invoke(_S.read(_v86, "R"), "range", [_S.unary("-", 15), 15]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v86, "dy"), _S.read(_v86, "d")), _S.read(_v86, "sp")), 0.6), _S.invoke(_S.read(_v86, "R"), "range", [90, 190]))}, {"a": 0}, {"va": _S.invoke(_S.read(_v86, "R"), "range", [_S.unary("-", 9), 9])}, {"f": _S.invoke(_S.read(_v86, "R"), "range", [_S.unary("-", 0.8), 0.8])}, {"vf": _S.binary("*", _S.invoke(_S.read(_v86, "R"), "sign", []), _S.invoke(_S.read(_v86, "R"), "range", [5, 13]))}, {"lit": _S.prop(_S.read(_v86, "F"), "lit")}, {"g": 0.85}, {"drag": 0.7}, {"brittle": true}, {"life": _S.invoke(_S.read(_v86, "R"), "range", [1, 1.45])}])])
		var _v88 = _S.scope(_v80)
		_S.define(_v88, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v88, "i"), 50)):
			var _v89 = _S.scope(_v88)
			_S.define(_v89, "x", 0)
			_S.define(_v89, "y", 0)
			var _v90 = _S.scope(_v89)
			_S.define(_v90, "k", 0)
			while _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v90, "k"), 12), func(): return _S.binary("<", _S.call_value(_S.read(_v90, "at"), [_S.read(_v90, "x"), _S.read(_v90, "y")]), 0))):
				_S.last([_S.write(_v90, "x", _S.invoke(_S.read(_v90, "R"), "int", [_S.read(_v90, "X0"), _S.binary("-", _S.read(_v90, "X1"), 1)]), "=", false), _S.write(_v90, "y", _S.invoke(_S.read(_v90, "R"), "int", [_S.read(_v90, "Y0"), _S.binary("-", _S.read(_v90, "Y1"), 1)]), "=", false)])
				_v90 = _S.iteration(_v90)
				_S.write(_v90, "k", 1, "+=", true)
			_S.define(_v89, "dx", _S.binary("-", _S.read(_v89, "x"), _S.prop(_S.read(_v89, "CORE"), 0)))
			_S.define(_v89, "dy", _S.binary("-", _S.read(_v89, "y"), _S.prop(_S.read(_v89, "CORE"), 1)))
			_S.define(_v89, "d", _S.logical("||", _S.invoke(_S.read(_v89, "Math"), "hypot", [_S.read(_v89, "dx"), _S.read(_v89, "dy")]), func(): return 1))
			_S.define(_v89, "sp", _S.invoke(_S.read(_v89, "R"), "range", [50, 130]))
			_S.invoke(_S.read(_v89, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v89, "B"), "SHARD")}, {"x": _S.read(_v89, "x")}, {"y": _S.read(_v89, "y")}, {"vx": _S.binary("*", _S.binary("/", _S.read(_v89, "dx"), _S.read(_v89, "d")), _S.read(_v89, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v89, "dy"), _S.read(_v89, "d")), _S.read(_v89, "sp")), 0.7), _S.invoke(_S.read(_v89, "R"), "range", [60, 170]))}, {"g": 0.85}, {"drag": 0.9}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v89, "R"), "range", [0.8, 1.4])}, {"a": _S.invoke(_S.read(_v89, "R"), "range", [0, _S.read(_v89, "TAU")])}, {"va": _S.invoke(_S.read(_v89, "R"), "range", [_S.unary("-", 22), 22])}, {"s": _S.invoke(_S.read(_v89, "R"), "range", [1.5, 3.2])}, {"c": _S.prop(_S.read(_v89, "C"), _S.invoke(_S.read(_v89, "R"), "int", [4, 7]))}])])
			_v88 = _S.iteration(_v88)
			_S.write(_v88, "i", 1, "+=", true)
		for _v91 in _S.array(_S.read(_v80, "feathers")):
			var _v92 = _S.scope(_v80)
			_S.define(_v92, "f", _v91)
			if _S.truth(_S.invoke(_S.read(_v92, "R"), "chance", [0.5])):
				_S.invoke(_S.read(_v92, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v92, "B"), "SHARD")}, {"x": _S.prop(_S.read(_v92, "f"), "x")}, {"y": _S.prop(_S.read(_v92, "f"), "y")}, {"vx": _S.binary("*", _S.prop(_S.read(_v92, "f"), "dx"), _S.invoke(_S.read(_v92, "R"), "range", [20, 70]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v92, "R"), "range", [20, 90]))}, {"g": 0.8}, {"drag": 0.8}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v92, "R"), "range", [0.4, 0.8])}, {"a": _S.invoke(_S.read(_v92, "R"), "range", [0, _S.read(_v92, "TAU")])}, {"va": _S.invoke(_S.read(_v92, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v92, "R"), "range", [1, 1.8])}, {"c": _S.read(_v92, "WHITE")}])])
		var _v93 = _S.scope(_v80)
		_S.define(_v93, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v93, "i"), 12)):
			var _v94 = _S.scope(_v93)
			_S.define(_v94, "s", _S.invoke(_S.read(_v94, "R"), "sign", []))
			_S.invoke(_S.read(_v94, "ps"), "spawn", [_S.prop(_S.read(_v94, "P"), "VAPOUR"), _S.binary("*", _S.read(_v94, "s"), _S.invoke(_S.read(_v94, "R"), "range", [2, 16])), _S.unary("-", _S.invoke(_S.read(_v94, "R"), "range", [1, 6])), _S.binary("*", _S.read(_v94, "s"), _S.invoke(_S.read(_v94, "R"), "range", [30, 90])), _S.unary("-", _S.invoke(_S.read(_v94, "R"), "range", [4, 16])), _S.invoke(_S.read(_v94, "R"), "range", [0.6, 1.1]), _S.prop(_S.read(_v94, "C"), 6), _S.invoke(_S.read(_v94, "R"), "range", [2.2, 4])])
			_v93 = _S.iteration(_v93)
			_S.write(_v93, "i", 1, "+=", true)
		var _v95 = _S.scope(_v80)
		_S.define(_v95, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v95, "i"), 8)):
			_S.invoke(_S.read(_v95, "ps"), "spawn", [_S.prop(_S.read(_v95, "P"), "VAPOUR"), _S.invoke(_S.read(_v95, "R"), "range", [_S.unary("-", 14), 14]), _S.unary("-", _S.invoke(_S.read(_v95, "R"), "range", [8, 40])), _S.invoke(_S.read(_v95, "R"), "range", [_S.unary("-", 30), 30]), _S.unary("-", _S.invoke(_S.read(_v95, "R"), "range", [10, 30])), _S.invoke(_S.read(_v95, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v95, "C"), 6), _S.invoke(_S.read(_v95, "R"), "range", [3, 5])])
			_v95 = _S.iteration(_v95)
			_S.write(_v95, "i", 1, "+=", true)
		var _v96 = _S.scope(_v80)
		_S.define(_v96, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v96, "i"), 18)):
			var _v97 = _S.scope(_v96)
			_S.define(_v97, "a", _S.invoke(_S.read(_v97, "R"), "range", [_S.unary("-", _S.prop(_S.read(_v97, "Math"), "PI")), 0]))
			_S.define(_v97, "sp", _S.invoke(_S.read(_v97, "R"), "range", [40, 130]))
			_S.invoke(_S.read(_v97, "ps"), "spawn", [_S.prop(_S.read(_v97, "P"), "FLAKE"), _S.invoke(_S.read(_v97, "R"), "range", [_S.unary("-", 10), 10]), _S.binary("+", _S.prop(_S.read(_v97, "CORE"), 1), _S.invoke(_S.read(_v97, "R"), "range", [_S.unary("-", 12), 12])), _S.binary("*", _S.invoke(_S.read(_v97, "Math"), "cos", [_S.read(_v97, "a")]), _S.read(_v97, "sp")), _S.binary("*", _S.invoke(_S.read(_v97, "Math"), "sin", [_S.read(_v97, "a")]), _S.read(_v97, "sp")), _S.invoke(_S.read(_v97, "R"), "range", [1, 1.5]), (_S.read(_v97, "WHITE") if _S.truth(_S.invoke(_S.read(_v97, "R"), "chance", [0.6])) else _S.prop(_S.read(_v97, "C"), 6)), _S.invoke(_S.read(_v97, "R"), "range", [0.5, 1.6])])
			_v96 = _S.iteration(_v96)
			_S.write(_v96, "i", 1, "+=", true)
		var _v98 = _S.scope(_v80)
		_S.define(_v98, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v98, "i"), 7)):
			_S.invoke(_S.read(_v98, "ps"), "spawn", [_S.prop(_S.read(_v98, "P"), "STAR"), _S.invoke(_S.read(_v98, "R"), "range", [_S.unary("-", 26), 26]), _S.unary("-", _S.invoke(_S.read(_v98, "R"), "range", [6, 52])), _S.invoke(_S.read(_v98, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v98, "R"), "range", [4, 16])), _S.invoke(_S.read(_v98, "R"), "range", [0.4, 0.8]), (_S.read(_v98, "WHITE") if _S.truth(_S.invoke(_S.read(_v98, "R"), "chance", [0.5])) else _S.prop(_S.read(_v98, "C"), 6)), _S.invoke(_S.read(_v98, "R"), "range", [1, 2.4])])
			_v98 = _S.iteration(_v98)
			_S.write(_v98, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BURST"), 0.9))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.07]))):
		var _v99 = _S.scope(_e)
		_S.define(_v99, "b", _S.invoke(_S.read(_v99, "R"), "pick", [(_S.prop(_S.read(_v99, "bits"), "list") if _S.truth(_S.prop(_S.prop(_S.read(_v99, "bits"), "list"), "length")) else [_S.merge([{"x": 0}, {"y": _S.unary("-", 10)}])])]))
		_S.invoke(_S.read(_v99, "ps"), "spawn", [_S.prop(_S.read(_v99, "P"), "STAR"), _S.prop(_S.read(_v99, "b"), "x"), _S.binary("-", _S.prop(_S.read(_v99, "b"), "y"), 1), 0, _S.unary("-", 3), _S.invoke(_S.read(_v99, "R"), "range", [0.2, 0.4]), (_S.read(_v99, "WHITE") if _S.truth(_S.invoke(_S.read(_v99, "R"), "chance", [0.5])) else _S.prop(_S.read(_v99, "C"), 6)), _S.invoke(_S.read(_v99, "R"), "range", [0.6, 1.6])])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "burst"), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BURST"), _S.read(_e, "THAW")))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.12]))):
		var _v100 = _S.scope(_e)
		_S.define(_v100, "y", _S.binary("+", _S.unary("-", _S.read(_v100, "H")), _S.binary("*", _S.invoke(_S.read(_v100, "ease"), "inQuad", [_S.call_value(_S.read(_v100, "seg"), [_S.read(_v100, "t"), _S.read(_v100, "BURST"), _S.binary("+", _S.read(_v100, "BURST"), _S.read(_v100, "THAW"))])]), _S.read(_v100, "H"))))
		_S.invoke(_S.read(_v100, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v100, "B"), "DRIP")}, {"x": _S.invoke(_S.read(_v100, "R"), "range", [_S.unary("-", 9), 9])}, {"y": _S.read(_v100, "y")}, {"vy": 10}, {"g": 0.5}, {"life": 0.8}, {"c": _S.prop(_S.read(_v100, "C"), 5)}])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "panes"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	_S.call_value(_S.read(_e, "endBy"), [_S.read(_e, "t"), _S.prop(_S.read(_e, "meta"), "duration"), _S.read(_e, "ps"), _S.read(_e, "bits"), _S.read(_e, "panes")])
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_centroid = _S.read(_parent,"centroid")
	var _n_R = _S.read(_parent,"R")
	var _n_splitPoly = _S.read(_parent,"splitPoly")
	var _n_this = _S.read(_parent,"this")
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_depth_b1 = _S.arg(_args,1)
	var _n_c_b2 = _S.call_value(_n_centroid,[_n_pts_b0])
	return ([_n_pts_b0] if _S.truth(((_S.named_value(_n_c_b2,"area") < 20) if _S.truth((_S.named_value(_n_c_b2,"area") < 20)) else (_n_depth_b1 > 2))) else _S.invoke(_S.call_value(_n_splitPoly,[_n_pts_b0, _S.named_value(_n_c_b2,"x"), _S.named_value(_n_c_b2,"y"), _S.invoke(_n_R,"range",[0, PI])]),"flatMap",[_S.function_value(_S.capture(_parent,{"depth":_n_depth_b1,"this":_n_this}),"_f23")]))
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_chop = _S.read(_parent,"chop")
	var _n_depth = _S.read(_parent,"depth")
	var _n_q_b0 = _S.arg(_args,0)
	return _S.call_value(_n_chop,[_n_q_b0, (_n_depth + 1)])
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_m = _S.read(_parent,"m")
	var _tuple_0 = _S.arg(_args,0)
	var _n_x_b0 = _S.prop(_tuple_0,0)
	var _n_y_b1 = _S.prop(_tuple_0,1)
	return [(_n_x_b0 - _S.named_value(_n_m,"x")), (_n_y_b1 - _S.named_value(_n_m,"y"))]
	return null

static func _f25(_parent,_args:Array,_this=null):
	var _n_MELT = _S.read(_parent,"MELT")
	var _n_t = _S.read(_parent,"t")
	var _n_floorFrost = _S.read(_parent,"floorFrost")
	var _n_C = _S.read(_parent,"C")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_out_b1 = (1 - _S.MathFX.smooth(_S.index_value(_n_MELT,0),_S.index_value(_n_MELT,1),_n_t))
	if _S.truth((_n_out_b1 > 0)):
		_S.call_value(_n_floorFrost,[_n_p_b0, _n_C, _n_t, _n_out_b1])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f26(_parent,_args:Array,_this=null):
	var _n_drawCharacter = _S.read(_parent,"drawCharacter")
	var _n_drawBlock = _S.read(_parent,"drawBlock")
	var _n_CLIMB = _S.read(_parent,"CLIMB")
	var _n_SEAL = _S.read(_parent,"SEAL")
	var _n_t = _S.read(_parent,"t")
	var _n_BURST = _S.read(_parent,"BURST")
	var _n_CRACK = _S.read(_parent,"CRACK")
	var _n_FLASH = _S.read(_parent,"FLASH")
	var _n_C = _S.read(_parent,"C")
	var _n_CORE = _S.read(_parent,"CORE")
	var _n_ease = _S.read(_parent,"ease")
	var _n_FACETS = _S.read(_parent,"FACETS")
	var _n_V = _S.read(_parent,"V")
	var _n_sparkle = _S.read(_parent,"sparkle")
	var _n_flare = _S.read(_parent,"flare")
	var _n_panes = _S.read(_parent,"panes")
	var _n_bits = _S.read(_parent,"bits")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_drawCharacter,[_n_p_b0])
	_S.call_value(_n_drawBlock,[_n_p_b0])
	var _n_hold_b1 = (_S.MathFX.smooth(_S.index_value(_n_CLIMB,0),_n_SEAL,_n_t) * (1 - _S.MathFX.smooth(_n_BURST,(_n_BURST + 0.6),_n_t)))
	var _n_crk_b2 = _S.MathFX.smooth(_n_CRACK,_n_FLASH,_n_t)
	if _S.truth((_n_hold_b1 > 0)):
		_S.invoke(_n_p_b0,"glow",[0, (-2), 34, _S.index_value(_n_C,4), ((0.22 * _n_hold_b1) * (0.85 + (0.15 * sin((_n_t * 3)))))])
		_S.invoke(_n_p_b0,"glow",[_S.index_value(_n_CORE,0), (_S.index_value(_n_CORE,1) - 4), 40, _S.index_value(_n_C,3), ((0.22 + (0.1 * _n_crk_b2)) * _n_hold_b1)])
	if _S.truth(((_n_t < _S.index_value(_n_CLIMB,1)) if _S.truth((_n_t > _S.index_value(_n_CLIMB,0))) else (_n_t > _S.index_value(_n_CLIMB,0)))):
		_S.invoke(_n_p_b0,"glow",[0, ((-38) * _S.invoke(_n_ease,"outQuad",[_S.MathFX.seg(_n_t,_S.index_value(_n_CLIMB,0),_S.index_value(_n_CLIMB,1))])), 18, _S.index_value(_n_C,5), 0.28])
	var _n_top_b3 = _S.named_value(_S.index_value(_n_FACETS,(_S.prop(_n_FACETS,"length") - 1)),"at")
	var _n_g_b4 = (_n_t - _n_top_b3)
	if _S.truth(((_n_g_b4 < 0.3) if _S.truth((_n_g_b4 > 0)) else (_n_g_b4 > 0))):
		_S.call_value(_n_sparkle,[_n_p_b0, _S.index_value(_S.named_value(_n_V,"p2"),0), _S.index_value(_S.named_value(_n_V,"p2"),1), ((8 * _S.invoke(_n_ease,"outBack",[minf(1,(float(_n_g_b4)/0.06))])) * (1 - (float(_n_g_b4)/0.3))), _S.index_value(_n_C,6), _S.index_value(_n_C,4), 0.6])
	if _S.truth(((_n_t < (_n_BURST + 0.16)) if _S.truth((_n_t >= _n_FLASH)) else (_n_t >= _n_FLASH))):
		var _n_a_b5 = clampf((float((_n_t - _n_FLASH))/0.22),0.0,1.0)
		_S.call_value(_n_flare,[_n_p_b0, _S.index_value(_n_CORE,0), _S.index_value(_n_CORE,1), (34 * pow((1 - _n_a_b5),1.4)), (1 - _n_a_b5), _n_C])
	_S.invoke(_n_panes,"draw",[_n_p_b0, _n_C])
	_S.invoke(_n_bits,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f27(_parent,_args:Array,_this=null):
	var _n_this = _S.read(_parent,"this")
	var _n_SEAL = _S.read(_parent,"SEAL")
	var _tuple_0 = _S.arg(_args,0)
	var _n_k_b0 = _S.prop(_tuple_0,0)
	var _n_lit_b1 = _S.prop(_tuple_0,1)
	var _n_at_b2 = _S.prop(_tuple_0,2)
	var _n_i_b3 = _S.arg(_args,1)
	return {"pts":_S.invoke(_S.invoke(_n_k_b0,"split",[" "]),"map",[_S.function_value(_S.capture(_parent,{"this":_n_this}),"_f28")]),"lit":_n_lit_b1,"at":(_n_SEAL + _n_at_b2),"i":_n_i_b3}
	return null

static func _f28(_parent,_args:Array,_this=null):
	var _n_V = _S.read(_parent,"V")
	var _n_v_b0 = _S.arg(_args,0)
	return _S.index_value(_n_V,_n_v_b0)
	return null

static func _f29(_parent,_args:Array,_this=null):
	var _n_V = _S.read(_parent,"V")
	var _n_v_b0 = _S.arg(_args,0)
	return _S.index_value(_n_V,_n_v_b0)
	return null
