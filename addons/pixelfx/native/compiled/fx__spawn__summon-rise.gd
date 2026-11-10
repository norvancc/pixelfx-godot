@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/summon-rise.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "Particles", _S.import_value("core/index.js", "Particles"))
	_S.define(_e, "Bits", _S.import_value("core/index.js", "Bits"))
	_S.define(_e, "Lights", _S.import_value("core/index.js", "Lights"))
	_S.define(_e, "P", _S.import_value("core/index.js", "P"))
	_S.define(_e, "PF", _S.import_value("core/index.js", "PF"))
	_S.define(_e, "B", _S.import_value("core/index.js", "B"))
	_S.define(_e, "Rng", _S.import_value("core/index.js", "Rng"))
	_S.define(_e, "fit", _S.import_value("core/index.js", "fit"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "noise", _S.import_value("core/index.js", "noise"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "hex", _S.import_value("core/index.js", "hex"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "beast", _S.function_value(_e, "_f0"))
	_S.define(_e, "create", _S.function_value(_e, "_f10"))
	_S.define(_e, "meta", _S.merge([{"name": "Summon rise"}, {"desc": "A rune circle burns into the floor, the ground bursts, and a horned brute heaves up out of it through dust and rubble, lit from below, until its eyes flare."}, {"tags": ["spawn", "summon", "demon", "rise", "runes", "dust", "rubble", "ground", "one-shot"]}, {"size": [176, 116]}, {"origin": [88, 94]}, {"duration": 4.6}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"options": _S.merge([{"palette": ["#1a0608", "#3d0c0c", "#7a1a10", "#c0381a", "#f06a1e", "#ffae3a", "#ffe08a", "#ffffff"]}, {"body": ["#060409", "#0e0913", "#170f1e", "#211628", "#2d2036"]}, {"horn": ["#0c080c", "#201820", "#352a32", "#4e3f48", "#6e5c64"]}, {"stone": ["#1a1424", "#2b2639", "#4a4263", "#6c6488", "#9a91b4"]}, {"seed": 9}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "SOOT", _S.call_value(_S.read(_e, "hex"), ["#2a1e2a"]))
	_S.define(_e, "IGN", 0.5)
	_S.define(_e, "RUNES", 0.78)
	_S.define(_e, "BREAK", 1.05)
	_S.define(_e, "EYES", 2.3)
	_S.define(_e, "FADE", 3.4)
	_S.define(_e, "SY", 0.3)
	_S.define(_e, "R0", 36)
	_S.define(_e, "R1", 27)
	_S.define(_e, "PARTS", ["head", "horns", "arms", "shoulders", "chest", "waist", "legs", "tail"])
	_S.define(_e, "BEAST", _S.call_value(_S.read(_e, "beast"), []))
	_S.define(_e, "GLYPHS", [[[[0, _S.unary("-", 2)], [0, 2]], [[_S.unary("-", 1.5), _S.unary("-", 1)], [1.5, 1]]], [[[_S.unary("-", 1.5), 2], [0, _S.unary("-", 2)], [1.5, 2]], [[_S.unary("-", 0.8), 0.4], [0.8, 0.4]]], [[[_S.unary("-", 1.5), _S.unary("-", 2)], [_S.unary("-", 1.5), 2], [1.5, 2]], [[0, _S.unary("-", 2)], [1.5, _S.unary("-", 0.5)]]], [[[0, _S.unary("-", 2)], [0, 2]], [[0, _S.unary("-", 2)], [1.6, _S.unary("-", 0.6)], [0, 0.6]]], [[[_S.unary("-", 1.5), _S.unary("-", 2)], [1.5, 2]], [[1.5, _S.unary("-", 2)], [_S.unary("-", 1.5), 2]], [[_S.unary("-", 1.5), 0], [1.5, 0]]], [[[_S.unary("-", 1.4), _S.unary("-", 2)], [1.4, _S.unary("-", 2)], [_S.unary("-", 1.4), 2], [1.4, 2]]]])
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "W", 46)
	_S.define(_e, "H", 46)
	_S.define(_e, "N", _S.binary("*", _S.read(_e, "W"), _S.read(_e, "H")))
	_S.define(_e, "C", 22.5)
	_S.define(_e, "parts", _S.invoke(_S.read(_e, "PARTS"), "map", [_S.function_value(_e, "_f1")]))
	_S.define(_e, "cur", null)
	_S.define(_e, "put", _S.function_value(_e, "_f2"))
	_S.define(_e, "ell", _S.function_value(_e, "_f3"))
	_S.define(_e, "stroke", _S.function_value(_e, "_f4"))
	var _v8 = _S.read(_e, "parts")
	_S.define(_e, "HEAD", _S.prop(_v8, 0))
	_S.define(_e, "HORNS", _S.prop(_v8, 1))
	_S.define(_e, "ARMS", _S.prop(_v8, 2))
	_S.define(_e, "SHOULDERS", _S.prop(_v8, 3))
	_S.define(_e, "CHEST", _S.prop(_v8, 4))
	_S.define(_e, "WAIST", _S.prop(_v8, 5))
	_S.define(_e, "LEGS", _S.prop(_v8, 6))
	_S.define(_e, "TAIL", _S.prop(_v8, 7))
	for _v9 in _S.array([_S.unary("-", 1), 1]):
		var _v10 = _S.scope(_e)
		_S.define(_v10, "s", _v9)
		var _v11 = _S.scope(_v10)
		_S.define(_v11, "X", _S.function_value(_v11, "_f5"))
		_S.write(_v11, "cur", _S.read(_v11, "HORNS"), "=", false)
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [4]), 11], [_S.call_value(_S.read(_v11, "X"), [8]), 8], [_S.call_value(_S.read(_v11, "X"), [12]), 6.5], [_S.call_value(_S.read(_v11, "X"), [15]), 4], [_S.call_value(_S.read(_v11, "X"), [16]), 1.5], [_S.call_value(_S.read(_v11, "X"), [15.2]), 0]], 2.3, 0.45])
		_S.write(_v11, "cur", _S.read(_v11, "SHOULDERS"), "=", false)
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [10]), 16, 7, 5])
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [8.5]), 19.5, 5.5, 4.2])
		_S.write(_v11, "cur", _S.read(_v11, "ARMS"), "=", false)
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [14.5]), 16.5], [_S.call_value(_S.read(_v11, "X"), [17.5]), 22], [_S.call_value(_S.read(_v11, "X"), [18.5]), 28]], 4, 3.2])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [18.5]), 28], [_S.call_value(_S.read(_v11, "X"), [19]), 33], [_S.call_value(_S.read(_v11, "X"), [19.2]), 36.5]], 3.4, 2.8])
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [19.2]), 37.8, 3, 2.3])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [17.2]), 39], [_S.call_value(_S.read(_v11, "X"), [16.6]), 41.8]], 0.9, 0.4])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [19.2]), 39.5], [_S.call_value(_S.read(_v11, "X"), [19.3]), 42.6]], 0.9, 0.4])
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [21.2]), 38.8], [_S.call_value(_S.read(_v11, "X"), [22]), 41.4]], 0.9, 0.4])
		_S.write(_v11, "cur", _S.read(_v11, "LEGS"), "=", false)
		_S.call_value(_S.read(_v11, "stroke"), [[[_S.call_value(_S.read(_v11, "X"), [5.5]), 31], [_S.call_value(_S.read(_v11, "X"), [8]), 37], [_S.call_value(_S.read(_v11, "X"), [7.5]), 42]], 4, 3])
		_S.call_value(_S.read(_v11, "ell"), [_S.call_value(_S.read(_v11, "X"), [8.5]), 44.3, 4.2, 1.7])
	_S.write(_e, "cur", _S.read(_e, "TAIL"), "=", false)
	_S.call_value(_S.read(_e, "stroke"), [[[_S.read(_e, "C"), 30], [_S.binary("+", _S.read(_e, "C"), 0.5), 36], [_S.binary("+", _S.read(_e, "C"), 2.5), 41.5], [_S.binary("+", _S.read(_e, "C"), 7), 44.6], [_S.binary("+", _S.read(_e, "C"), 12.5), 44.2], [_S.binary("+", _S.read(_e, "C"), 14.5), 42.5]], 2.3, 0.6])
	_S.write(_e, "cur", _S.read(_e, "CHEST"), "=", false)
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 22.5, 8.2, 7.5])
	_S.write(_e, "cur", _S.read(_e, "WAIST"), "=", false)
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 29.5, 6.2, 4.5])
	_S.write(_e, "cur", _S.read(_e, "HEAD"), "=", false)
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 12.5, 5.2, 4.6])
	_S.call_value(_S.read(_e, "ell"), [_S.read(_e, "C"), 16, 4.2, 2.8])
	_S.define(_e, "part", _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")]))
	var _v12 = _S.scope(_e)
	_S.define(_v12, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v12, "i"), _S.read(_v12, "N"))):
		var _v13 = _S.scope(_v12)
		_S.define(_v13, "k", 0)
		while _S.truth(_S.binary("<", _S.read(_v13, "k"), _S.prop(_S.read(_v13, "parts"), "length"))):
			if _S.truth(_S.prop(_S.prop(_S.read(_v13, "parts"), _S.read(_v13, "k")), _S.read(_v13, "i"))):
				var _v14 = _S.scope(_v13)
				_S.set_prop(_S.read(_v14, "part"), _S.read(_v14, "i"), _S.binary("+", _S.read(_v14, "k"), 1), "=", false)
				break
			_v13 = _S.iteration(_v13)
			_S.write(_v13, "k", 1, "+=", true)
		_v12 = _S.iteration(_v12)
		_S.write(_v12, "i", 1, "+=", true)
	_S.define(_e, "on", _S.function_value(_e, "_f6"))
	_S.define(_e, "blur", _S.function_value(_e, "_f7"))
	_S.define(_e, "amb", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "down", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "rim", _S.construct(_S.read(_e, "Float32Array"), [_S.read(_e, "N")]))
	_S.define(_e, "crease", _S.construct(_S.read(_e, "Uint8Array"), [_S.read(_e, "N")]))
	_S.invoke(_S.read(_e, "parts"), "forEach", [_S.function_value(_e, "_f8")])
	var _v32 = _S.scope(_e)
	_S.define(_v32, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v32, "y"), _S.read(_v32, "H"))):
		var _v33 = _S.scope(_v32)
		_S.define(_v33, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v33, "x"), _S.read(_v33, "W"))):
			var _v34 = _S.scope(_v33)
			if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "on"), [_S.read(_v34, "x"), _S.read(_v34, "y")]))):
				_v33 = _S.iteration(_v33)
				_S.write(_v33, "x", 1, "+=", true)
				continue
			_S.define(_v34, "k", (1 if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "on"), [_S.read(_v34, "x"), _S.binary("+", _S.read(_v34, "y"), 1)]))) else (0.5 if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "on"), [_S.read(_v34, "x"), _S.binary("+", _S.read(_v34, "y"), 2)]))) else 0)))
			_S.set_prop(_S.read(_v34, "rim"), _S.binary("+", _S.binary("*", _S.read(_v34, "y"), _S.read(_v34, "W")), _S.read(_v34, "x")), (_S.binary("*", _S.read(_v34, "k"), 0.3) if _S.truth(_S.logical("&&", _S.binary("<", _S.invoke(_S.read(_v34, "Math"), "abs", [_S.binary("-", _S.binary("+", _S.read(_v34, "x"), 0.5), _S.read(_v34, "C"))]), 7), func(): return _S.binary(">", _S.read(_v34, "y"), 27))) else _S.read(_v34, "k")), "=", false)
			_v33 = _S.iteration(_v33)
			_S.write(_v33, "x", 1, "+=", true)
		_v32 = _S.iteration(_v32)
		_S.write(_v32, "y", 1, "+=", true)
	_S.define(_e, "outline", [])
	var _v35 = _S.scope(_e)
	_S.define(_v35, "y", _S.unary("-", 1))
	while _S.truth(_S.binary("<=", _S.read(_v35, "y"), _S.read(_v35, "H"))):
		var _v36 = _S.scope(_v35)
		_S.define(_v36, "x", _S.unary("-", 1))
		while _S.truth(_S.binary("<=", _S.read(_v36, "x"), _S.read(_v36, "W"))):
			if _S.truth(_S.logical("&&", _S.unary("!", _S.call_value(_S.read(_v36, "on"), [_S.read(_v36, "x"), _S.read(_v36, "y")])), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v36, "on"), [_S.binary("-", _S.read(_v36, "x"), 1), _S.read(_v36, "y")]), func(): return _S.call_value(_S.read(_v36, "on"), [_S.binary("+", _S.read(_v36, "x"), 1), _S.read(_v36, "y")])), func(): return _S.call_value(_S.read(_v36, "on"), [_S.read(_v36, "x"), _S.binary("-", _S.read(_v36, "y"), 1)])), func(): return _S.call_value(_S.read(_v36, "on"), [_S.read(_v36, "x"), _S.binary("+", _S.read(_v36, "y"), 1)])))):
				_S.invoke(_S.read(_v36, "outline"), "push", [[_S.read(_v36, "x"), _S.read(_v36, "y")]])
			_v36 = _S.iteration(_v36)
			_S.write(_v36, "x", 1, "+=", true)
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "y", 1, "+=", true)
	_S.define(_e, "eyes", [])
	_S.define(_e, "tusks", [])
	for _v37 in _S.array([_S.unary("-", 1), 1]):
		var _v38 = _S.scope(_e)
		_S.define(_v38, "s", _v37)
		var _v39 = _S.scope(_v38)
		_S.invoke(_S.read(_v39, "eyes"), "push", [[_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 2.2)), 0.5)]), 12], [_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 3.2)), 0.5)]), 12]])
		_S.invoke(_S.read(_v39, "tusks"), "push", [[_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 3.4)), 0.5)]), 16], [_S.invoke(_S.read(_v39, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v39, "C"), _S.binary("*", _S.read(_v39, "s"), 3.6)), 0.5)]), 15]])
	return _S.merge([{"w": _S.read(_e, "W")}, {"h": _S.read(_e, "H")}, {"part": _S.read(_e, "part")}, {"amb": _S.read(_e, "amb")}, {"down": _S.read(_e, "down")}, {"rim": _S.read(_e, "rim")}, {"crease": _S.read(_e, "crease")}, {"outline": _S.read(_e, "outline")}, {"eyes": _S.read(_e, "eyes")}, {"tusks": _S.read(_e, "tusks")}, {"glints": [[_S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.binary("-", _S.read(_e, "C"), 2.7), 0.5)]), _S.binary("/", _S.read(_e, "W"), 2)), _S.binary("-", 12, _S.read(_e, "H"))], [_S.binary("-", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_e, "C"), 2.7), 0.5)]), _S.binary("/", _S.read(_e, "W"), 2)), _S.binary("-", 12, _S.read(_e, "H"))]]}])

static func _f1(_parent,_args:Array,_this=null):
	var _n_Uint8Array = _S.read(_parent,"Uint8Array")
	var _n_N = _S.read(_parent,"N")
	return _S.construct(_n_Uint8Array,[_n_N])
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_cur = _S.read(_parent,"cur")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	_n_x_b0 = floori(_n_x_b0+0.5)
	_n_y_b1 = floori(_n_y_b1+0.5)
	if _S.truth(((_n_y_b1 < _n_H) if _S.truth(((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))):
		_S.set_prop(_n_cur,((_n_y_b1 * _n_W) + _n_x_b0),1,"=")
	return null

static func _f3(_parent,_args:Array,_this=null):
	var _n_put = _S.read(_parent,"put")
	var _n_cx_b0 = _S.arg(_args,0)
	var _n_cy_b1 = _S.arg(_args,1)
	var _n_rx_b2 = _S.arg(_args,2)
	var _n_ry_b3 = _S.arg(_args,3)
	if true:
		var _n_y_b4 = floori((_n_cy_b1 - _n_ry_b3))
		while _S.truth((_n_y_b4 <= ceili((_n_cy_b1 + _n_ry_b3)))):
			if true:
				var _n_x_b5 = floori((_n_cx_b0 - _n_rx_b2))
				while _S.truth((_n_x_b5 <= ceili((_n_cx_b0 + _n_rx_b2)))):
					var _n_dx_b6 = (float(((_n_x_b5 + 0.5) - _n_cx_b0))/_n_rx_b2)
					var _n_dy_b7 = (float(((_n_y_b4 + 0.5) - _n_cy_b1))/_n_ry_b3)
					if _S.truth((((_n_dx_b6 * _n_dx_b6) + (_n_dy_b7 * _n_dy_b7)) <= 1)):
						_S.call_value(_n_put,[_n_x_b5, _n_y_b4])
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_ell = _S.read(_parent,"ell")
	var _n_pts_b0 = _S.arg(_args,0)
	var _n_r0_b1 = _S.arg(_args,1)
	var _n_r1_b2 = _S.arg(_args,2)
	var _n_L_b3 = []
	var _n_total_b4 = 0
	if true:
		var _n_i_b5 = 1
		while _S.truth((_n_i_b5 < _S.prop(_n_pts_b0,"length"))):
			_n_total_b4 += _S.set_prop(_n_L_b3,(_n_i_b5 - 1),_S.Bridge.hypot([(_S.index_value(_S.index_value(_n_pts_b0,_n_i_b5),0) - _S.index_value(_S.index_value(_n_pts_b0,(_n_i_b5 - 1)),0)), (_S.index_value(_S.index_value(_n_pts_b0,_n_i_b5),1) - _S.index_value(_S.index_value(_n_pts_b0,(_n_i_b5 - 1)),1))]),"=")
			_n_i_b5 += 1.0
	if true:
		var _n_i_b6 = 1
		var _n_acc_b7 = 0
		while _S.truth((_n_i_b6 < _S.prop(_n_pts_b0,"length"))):
			var _n_n_b8 = (ceili((_S.index_value(_n_L_b3,(_n_i_b6 - 1)) * 3)) + 1)
			if true:
				var _n_j_b9 = 0
				while _S.truth((_n_j_b9 <= _n_n_b8)):
					var _n_u_b10 = (float(_n_j_b9)/_n_n_b8)
					var _n_r_b11 = (_n_r0_b1 + ((_n_r1_b2 - _n_r0_b1) * (float((_n_acc_b7 + (_S.index_value(_n_L_b3,(_n_i_b6 - 1)) * _n_u_b10)))/_n_total_b4)))
					_S.call_value(_n_ell,[(_S.index_value(_S.index_value(_n_pts_b0,(_n_i_b6 - 1)),0) + ((_S.index_value(_S.index_value(_n_pts_b0,_n_i_b6),0) - _S.index_value(_S.index_value(_n_pts_b0,(_n_i_b6 - 1)),0)) * _n_u_b10)), (_S.index_value(_S.index_value(_n_pts_b0,(_n_i_b6 - 1)),1) + ((_S.index_value(_S.index_value(_n_pts_b0,_n_i_b6),1) - _S.index_value(_S.index_value(_n_pts_b0,(_n_i_b6 - 1)),1)) * _n_u_b10)), _n_r_b11, _n_r_b11])
					_n_j_b9 += 1.0
			_n_acc_b7 += _S.index_value(_n_L_b3,(_n_i_b6 - 1))
			_n_i_b6 += 1.0
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_C = _S.read(_parent,"C")
	var _n_s = _S.read(_parent,"s")
	var _n_d_b0 = _S.arg(_args,0)
	return (_n_C + (_n_s * _n_d_b0))
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_part = _S.read(_parent,"part")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((_S.index_value(_n_part,((_n_y_b1 * _n_W) + _n_x_b0)) > 0) if _S.truth(((_n_y_b1 < _n_H) if _S.truth(((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else ((_n_y_b1 < _n_H) if _S.truth(((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))))
	return null

static func _f7(_parent,_args:Array,_this=null):
	var _n_Float32Array = _S.read(_parent,"Float32Array")
	var _n_N = _S.read(_parent,"N")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_src_b0 = _S.arg(_args,0)
	var _n_a_b1 = _S.invoke(_n_Float32Array,"from",[_n_src_b0])
	var _n_b_b2 = _S.construct(_n_Float32Array,[_n_N])
	if true:
		var _n_pass_b3 = 0
		while _S.truth((_n_pass_b3 < 2)):
			if true:
				var _n_y_b4 = 0
				while _S.truth((_n_y_b4 < _n_H)):
					if true:
						var _n_x_b5 = 0
						while _S.truth((_n_x_b5 < _n_W)):
							var _n_s_b6 = 0
							if true:
								var _n_d_b7 = (-2)
								while _S.truth((_n_d_b7 <= 2)):
									_n_s_b6 += (_S.index_value(_n_a_b1,(((_n_y_b4 * _n_W) + _n_x_b5) + _n_d_b7)) if _S.truth((((_n_x_b5 + _n_d_b7) < _n_W) if _S.truth(((_n_x_b5 + _n_d_b7) >= 0)) else ((_n_x_b5 + _n_d_b7) >= 0))) else 0)
									_n_d_b7 += 1.0
							_S.set_prop(_n_b_b2,((_n_y_b4 * _n_W) + _n_x_b5),(float(_n_s_b6)/5),"=")
							_n_x_b5 += 1.0
					_n_y_b4 += 1.0
			if true:
				var _n_y_b8 = 0
				while _S.truth((_n_y_b8 < _n_H)):
					if true:
						var _n_x_b9 = 0
						while _S.truth((_n_x_b9 < _n_W)):
							var _n_s_b10 = 0
							if true:
								var _n_d_b11 = (-2)
								while _S.truth((_n_d_b11 <= 2)):
									_n_s_b10 += (_S.index_value(_n_b_b2,(((_n_y_b8 + _n_d_b11) * _n_W) + _n_x_b9)) if _S.truth((((_n_y_b8 + _n_d_b11) < _n_H) if _S.truth(((_n_y_b8 + _n_d_b11) >= 0)) else ((_n_y_b8 + _n_d_b11) >= 0))) else 0)
									_n_d_b11 += 1.0
							_S.set_prop(_n_a_b1,((_n_y_b8 * _n_W) + _n_x_b9),(float(_n_s_b10)/5),"=")
							_n_x_b9 += 1.0
					_n_y_b8 += 1.0
			_n_pass_b3 += 1.0
	return _n_a_b1
	return null

static func _f8(_parent,_args:Array,_this=null):
	var _n_blur = _S.read(_parent,"blur")
	var _n_this = _S.read(_parent,"this")
	var _n_W = _S.read(_parent,"W")
	var _n_part = _S.read(_parent,"part")
	var _n_amb = _S.read(_parent,"amb")
	var _n_down = _S.read(_parent,"down")
	var _n_C = _S.read(_parent,"C")
	var _n_on = _S.read(_parent,"on")
	var _n_crease = _S.read(_parent,"crease")
	var _n_H = _S.read(_parent,"H")
	var _n_pm_b0 = _S.arg(_args,0)
	var _n_k_b1 = _S.arg(_args,1)
	var _n_B_b2 = _S.call_value(_n_blur,[_n_pm_b0])
	var _n_at_b3 = _S.function_value(_S.capture(_parent,{"B":_n_B_b2,"this":_n_this}),"_f9")
	if true:
		var _n_y_b4 = 0
		while _S.truth((_n_y_b4 < _n_H)):
			if true:
				var _n_x_b5 = 0
				while _S.truth((_n_x_b5 < _n_W)):
					var _n_i_b6 = ((_n_y_b4 * _n_W) + _n_x_b5)
					if _S.truth(_S.binary("!==",_S.index_value(_n_part,_n_i_b6),(_n_k_b1 + 1))):
						_n_x_b5 += 1.0
						continue
					var _n_gx_b7 = (_S.call_value(_n_at_b3,[(_n_x_b5 + 1), _n_y_b4]) - _S.call_value(_n_at_b3,[(_n_x_b5 - 1), _n_y_b4]))
					var _n_gy_b8 = (_S.call_value(_n_at_b3,[_n_x_b5, (_n_y_b4 + 1)]) - _S.call_value(_n_at_b3,[_n_x_b5, (_n_y_b4 - 1)]))
					var _n_g_b9 = _S.logical("||",_S.Bridge.hypot([_n_gx_b7, _n_gy_b8]),func():return 0.000001)
					var _n_ox_b10 = (float((-_n_gx_b7))/_n_g_b9)
					var _n_oy_b11 = (float((-_n_gy_b8))/_n_g_b9)
					var _n_e_b12 = clampf((float(_n_g_b9)/0.28),0.0,1.0)
					_S.set_prop(_n_amb,_n_i_b6,(0.42 + (_n_e_b12 * ((((0.4 * maxf(0,(-_n_oy_b11))) + (0.14 * maxf(0,(-_n_ox_b10)))) - (0.3 * maxf(0,_n_oy_b11))) - (0.08 * maxf(0,_n_ox_b10))))),"=")
					_S.set_prop(_n_down,_n_i_b6,((_n_e_b12 * maxf(0,_n_oy_b11)) * (0.3 if _S.truth(_S.logical("&&",(absf(((_n_x_b5 + 0.5) - _n_C)) < 7),func():return (_n_y_b4 > 27))) else 1)),"=")
					for _iter_0 in _S.array([[1, 0], [(-1), 0], [0, 1], [0, (-1)]]):
						var _tuple_1 = _iter_0
						var _n_dx_b13 = _S.prop(_tuple_1,0)
						var _n_dy_b14 = _S.prop(_tuple_1,1)
						var _n_j_b15 = ((((_n_y_b4 + _n_dy_b14) * _n_W) + _n_x_b5) + _n_dx_b13)
						if _S.truth(_S.logical("&&",_S.call_value(_n_on,[(_n_x_b5 + _n_dx_b13), (_n_y_b4 + _n_dy_b14)]),func():return (_S.index_value(_n_part,_n_j_b15) > (_n_k_b1 + 1)))):
							_S.set_prop(_n_crease,_n_i_b6,1,"=")
					_n_x_b5 += 1.0
			_n_y_b4 += 1.0
	return null

static func _f9(_parent,_args:Array,_this=null):
	var _n_B = _S.read(_parent,"B")
	var _n_W = _S.read(_parent,"W")
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return (_S.index_value(_n_B,((_n_y_b1 * _n_W) + _n_x_b0)) if _S.truth(((_n_y_b1 < _n_H) if _S.truth(((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0)))) else ((_n_x_b0 < _n_W) if _S.truth(((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))) else ((_n_y_b1 >= 0) if _S.truth((_n_x_b0 >= 0)) else (_n_x_b0 >= 0))))) else 0)
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "SH", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "body"), 5]))
	_S.define(_e, "HR", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "horn"), 5]))
	_S.define(_e, "ST", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "stone"), 5]))
	_S.define(_e, "DUST", _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 2), _S.call_value(_S.read(_e, "hex"), ["#7a6c78"]), 0.45]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f11"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4), _S.prop(_S.read(_e, "C"), 3)]}])]))
	_S.define(_e, "RUB", [_S.prop(_S.read(_e, "ST"), 0), _S.prop(_S.read(_e, "ST"), 1), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 2), _S.prop(_S.read(_e, "C"), 2), 0.3]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 3), _S.prop(_S.read(_e, "C"), 4), 0.3]), _S.call_value(_S.read(_e, "mix"), [_S.prop(_S.read(_e, "ST"), 4), _S.prop(_S.read(_e, "C"), 5), 0.35])])
	_S.define(_e, "rocks", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "runes", _S.invoke(_S.read(_e, "Array"), "from", [_S.merge([{"length": 12}]), _S.function_value(_e, "_f12")]))
	_S.define(_e, "cracks", [])
	var _v40 = _S.scope(_e)
	_S.define(_v40, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v40, "i"), 7)):
		var _v41 = _S.scope(_v40)
		_S.define(_v41, "a", _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v41, "i"), 7), _S.read(_v41, "TAU")), _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 0.25), 0.25])))
		_S.define(_v41, "r", 3)
		_S.define(_v41, "pts", [[0, 0]])
		_S.define(_v41, "len", _S.invoke(_S.read(_v41, "R"), "range", [_S.binary("*", _S.read(_v41, "R1"), 0.6), _S.binary("*", _S.read(_v41, "R1"), 1.05)]))
		while _S.truth(_S.binary("<", _S.read(_v41, "r"), _S.read(_v41, "len"))):
			var _v42 = _S.scope(_v41)
			_S.write(_v42, "r", _S.invoke(_S.read(_v42, "R"), "range", [2, 4]), "+=", false)
			_S.write(_v42, "a", _S.invoke(_S.read(_v42, "R"), "range", [_S.unary("-", 0.3), 0.3]), "+=", false)
			_S.invoke(_S.read(_v42, "pts"), "push", [[_S.binary("*", _S.invoke(_S.read(_v42, "Math"), "cos", [_S.read(_v42, "a")]), _S.read(_v42, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v42, "Math"), "sin", [_S.read(_v42, "a")]), _S.read(_v42, "r")), _S.read(_v42, "SY"))]])
		_S.invoke(_S.read(_v41, "cracks"), "push", [_S.read(_v41, "pts")])
		_v40 = _S.iteration(_v40)
		_S.write(_v40, "i", 1, "+=", true)
	_S.define(_e, "rise", _S.function_value(_e, "_f13"))
	_S.define(_e, "heat", _S.function_value(_e, "_f14"))
	_S.define(_e, "t", 0)
	_S.define(_e, "done", _S.merge([]))
	_S.define(_e, "left", _S.function_value(_e, "_f15"))
	_S.define(_e, "once", _S.function_value(_e, "_f16"))
	_S.define(_e, "topEdge", _S.function_value(_e, "_f17"))
	return _S.merge([{"update": _S.function_value(_e, "_f18")}, {"drawBack": _S.function_value(_e, "_f19")}, {"draw": _S.function_value(_e, "_f22")}])

static func _f11(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f12(_parent,_args:Array,_this=null):
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_GLYPHS = _S.read(_parent,"GLYPHS")
	var _n___b0 = _S.arg(_args,0)
	var _n_i_b1 = _S.arg(_args,1)
	return {"a":(((float(_n_i_b1)/12) * _n_TAU) + 0.13),"g":_S.index_value(_n_GLYPHS,fmod(((_n_i_b1 * 5) + 2),_S.prop(_n_GLYPHS,"length")))}
	return null

static func _f13(_parent,_args:Array,_this=null):
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_ease = _S.read(_parent,"ease")
	var _n_t_b0 = _S.arg(_args,0)
	if _S.truth((_n_t_b0 < _n_BREAK)):
		return 0
	var _n_a_b1 = (_S.invoke(_n_ease,"outCubic",[clampf((float((_n_t_b0 - _n_BREAK))/0.4),0.0,1.0)]) * 0.56)
	var _n_sag_b2 = (0.04 * sin((PI * clampf((float(((_n_t_b0 - _n_BREAK) - 0.42))/0.3),0.0,1.0))))
	var _n_b_b3 = (_S.invoke(_n_ease,"outBack",[clampf((float(((_n_t_b0 - _n_BREAK) - 0.62))/0.45),0.0,1.0), 1.4]) * 0.44)
	return ((_n_a_b1 - _n_sag_b2) + _n_b_b3)
	return null

static func _f14(_parent,_args:Array,_this=null):
	var _n_IGN = _S.read(_parent,"IGN")
	var _n_FADE = _S.read(_parent,"FADE")
	var _n_EYES = _S.read(_parent,"EYES")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_t_b0 = _S.arg(_args,0)
	return (((_S.MathFX.smooth(0,_n_IGN,_n_t_b0) * (1 - _S.MathFX.smooth(_n_FADE,(_n_FADE + 0.8),_n_t_b0))) * (1 - (0.25 * _S.MathFX.smooth((_n_EYES + 0.2),(_n_EYES + 0.9),_n_t_b0)))) * (((0.85 + (0.15 * _S.MathFX.noise((_n_t_b0 * 9),3))) + (0.5 * exp((float((-pow((_n_t_b0 - _n_BREAK),2)))/0.02)))) + (0.3 * exp((float((-pow((_n_t_b0 - _n_EYES),2)))/0.01)))))
	return null

static func _f15(_parent,_args:Array,_this=null):
	var _n_R = _S.read(_parent,"R")
	var _n_meta = _S.read(_parent,"meta")
	var _n_t = _S.read(_parent,"t")
	var _n_a_b0 = _S.arg(_args,0)
	var _n_b_b1 = _S.arg(_args,1)
	return maxf(0.05,minf(_S.invoke(_n_R,"range",[_n_a_b0, _n_b_b1]),((_S.named_value(_n_meta,"duration") - 0.1) - _n_t)))
	return null

static func _f16(_parent,_args:Array,_this=null):
	var _n_done = _S.read(_parent,"done")
	var _n_t = _S.read(_parent,"t")
	var _n_k_b0 = _S.arg(_args,0)
	var _n_at_b1 = _S.arg(_args,1)
	return (_S.set_prop(_n_done,_n_k_b0,true,"=") if _S.truth(((_n_t >= _n_at_b1) if _S.truth(not _S.truth(_S.index_value(_n_done,_n_k_b0))) else not _S.truth(_S.index_value(_n_done,_n_k_b0)))) else ((_n_t >= _n_at_b1) if _S.truth(not _S.truth(_S.index_value(_n_done,_n_k_b0))) else not _S.truth(_S.index_value(_n_done,_n_k_b0))))
	return null

static func _f17(_parent,_args:Array,_this=null):
	var _n_BEAST = _S.read(_parent,"BEAST")
	var _n_rise = _S.read(_parent,"rise")
	var _n_t = _S.read(_parent,"t")
	var _n_off_b0 = (_S.named_value(_n_BEAST,"h") * (1 - _S.call_value(_n_rise,[_n_t])))
	var _n_pts_b1 = []
	if true:
		var _n_x_b2 = 0
		while _S.truth((_n_x_b2 < _S.named_value(_n_BEAST,"w"))):
			if true:
				var _n_y_b3 = 0
				while _S.truth((_n_y_b3 < _S.named_value(_n_BEAST,"h"))):
					if _S.truth(_S.index_value(_S.named_value(_n_BEAST,"part"),((_n_y_b3 * _S.named_value(_n_BEAST,"w")) + _n_x_b2))):
						var _n_ly_b4 = ((_n_y_b3 - _S.named_value(_n_BEAST,"h")) + _n_off_b0)
						if _S.truth((_n_ly_b4 < 0)):
							_S.invoke(_n_pts_b1,"push",[[(_n_x_b2 - (float(_S.named_value(_n_BEAST,"w"))/2)), _n_ly_b4]])
						break
					_n_y_b3 += 1.0
			_n_x_b2 += 1.0
	return _n_pts_b1
	return null

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	_S.define(_e, "h", _S.call_value(_S.read(_e, "heat"), [_S.read(_e, "t")]))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "IGN"))):
		var _v46 = _S.scope(_e)
		_S.define(_v46, "ph", _S.binary("*", _S.binary("/", _S.read(_v46, "t"), _S.read(_v46, "IGN")), _S.prop(_S.read(_v46, "Math"), "PI")))
		for _v47 in _S.array([_S.unary("-", 1), 1]):
			var _v48 = _S.scope(_v46)
			_S.define(_v48, "s", _v47)
			var _v49 = _S.scope(_v48)
			_S.define(_v49, "a", _S.binary("+", _S.binary("/", _S.prop(_S.read(_v49, "Math"), "PI"), 2), _S.binary("*", _S.read(_v49, "s"), _S.read(_v49, "ph"))))
			_S.define(_v49, "y", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "sin", [_S.read(_v49, "a")]), _S.read(_v49, "R0")), _S.read(_v49, "SY")))
			if _S.truth(_S.invoke(_S.read(_v49, "R"), "chance", [0.5])):
				(_S.invoke(_S.read(_v49, "ps"), "spawn", [_S.prop(_S.read(_v49, "P"), "SPARK"), _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "a")]), _S.read(_v49, "R0")), _S.read(_v49, "y"), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [40, 130])), _S.invoke(_S.read(_v49, "R"), "range", [0.2, 0.45])]) if _S.truth(_S.binary("<", _S.read(_v49, "y"), _S.unary("-", 0.5))) else _S.invoke(_S.read(_v49, "ps"), "spawn", [_S.prop(_S.read(_v49, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v49, "Math"), "cos", [_S.read(_v49, "a")]), _S.read(_v49, "R0")), _S.read(_v49, "y"), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [30, 70])), _S.invoke(_S.read(_v49, "R"), "range", [0.3, 0.6]), _S.prop(_S.read(_v49, "C"), 6), 1.4]))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.2), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.6))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.2, _S.read(_e, "h"))]))):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "a", _S.invoke(_S.read(_v50, "R"), "range", [0, _S.read(_v50, "TAU")]))
		_S.define(_v50, "r", _S.invoke(_S.read(_v50, "R"), "pick", [[_S.read(_v50, "R0"), _S.read(_v50, "R1"), _S.read(_v50, "R0")]]))
		_S.invoke(_S.read(_v50, "ps"), "spawn", [_S.prop(_S.read(_v50, "P"), "EMBER"), _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "cos", [_S.read(_v50, "a")]), _S.read(_v50, "r")), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v50, "Math"), "sin", [_S.read(_v50, "a")]), _S.read(_v50, "r")), _S.read(_v50, "SY")), _S.invoke(_S.read(_v50, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v50, "R"), "range", [20, 50])), _S.call_value(_S.read(_v50, "left"), [0.8, 1.6]), _S.prop(_S.read(_v50, "C"), 5), _S.invoke(_S.read(_v50, "R"), "range", [1, 1.8])])
	if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.15), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.4, _S.invoke(_S.read(_e, "Math"), "min", [1, _S.read(_e, "h")]))]))):
		var _v51 = _S.scope(_e)
		_S.define(_v51, "a", _S.invoke(_S.read(_v51, "R"), "range", [0, _S.read(_v51, "TAU")]))
		_S.define(_v51, "r", (_S.read(_v51, "R0") if _S.truth(_S.invoke(_S.read(_v51, "R"), "chance", [0.7])) else _S.read(_v51, "R1")))
		if _S.truth((_S.binary("<", _S.invoke(_S.read(_v51, "Math"), "abs", [_S.binary("-", _S.binary("%", _S.binary("+", _S.binary("-", _S.read(_v51, "a"), _S.binary("/", _S.prop(_S.read(_v51, "Math"), "PI"), 2)), _S.binary("*", _S.prop(_S.read(_v51, "Math"), "PI"), 3)), _S.read(_v51, "TAU")), _S.prop(_S.read(_v51, "Math"), "PI"))]), _S.binary("*", _S.binary("/", _S.read(_v51, "t"), _S.read(_v51, "IGN")), _S.prop(_S.read(_v51, "Math"), "PI"))) if _S.truth(_S.binary("<", _S.read(_v51, "t"), _S.read(_v51, "IGN"))) else true)):
			_S.invoke(_S.read(_v51, "ps"), "spawn", [_S.prop(_S.read(_v51, "P"), "FIRE"), _S.binary("*", _S.invoke(_S.read(_v51, "Math"), "cos", [_S.read(_v51, "a")]), _S.read(_v51, "r")), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v51, "Math"), "sin", [_S.read(_v51, "a")]), _S.read(_v51, "r")), _S.read(_v51, "SY")), 0.5), _S.invoke(_S.read(_v51, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v51, "R"), "range", [6, 16])), _S.invoke(_S.read(_v51, "R"), "range", [0.18, 0.4]), 0, _S.binary("*", _S.invoke(_S.read(_v51, "R"), "range", [0.8, 1.6]), _S.invoke(_S.read(_v51, "Math"), "min", [1, _S.read(_v51, "h")])), 0, (_S.prop(_S.read(_v51, "PF"), "SMOKES") if _S.truth(_S.invoke(_S.read(_v51, "R"), "chance", [0.25])) else 0)])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), 0.3), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.4))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [_S.binary("*", 0.05, _S.read(_e, "h"))]))):
		var _v52 = _S.scope(_e)
		_S.define(_v52, "a", _S.invoke(_S.read(_v52, "R"), "range", [0, _S.read(_v52, "TAU")]))
		_S.invoke(_S.read(_v52, "ps"), "spawn", [_S.prop(_S.read(_v52, "P"), "SMOKE"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "cos", [_S.read(_v52, "a")]), _S.read(_v52, "R0")), 0.9), _S.binary("-", _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v52, "Math"), "sin", [_S.read(_v52, "a")]), _S.read(_v52, "R0")), _S.read(_v52, "SY")), 1), _S.invoke(_S.read(_v52, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v52, "R"), "range", [12, 24])), _S.call_value(_S.read(_v52, "left"), [1.4, 2.2]), 0, _S.invoke(_S.read(_v52, "R"), "range", [2.2, 3.4])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["ign", _S.read(_e, "IGN")])):
		_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 4), 60, _S.prop(_S.read(_e, "C"), 4), 0.55, 0.5])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["runes", _S.read(_e, "RUNES")])):
		_S.invoke(_S.read(_e, "lights"), "add", [0, _S.unary("-", 4), 50, _S.prop(_S.read(_e, "C"), 5), 0.5, 0.35])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RUNES")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.35]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "GRIT"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "R1")), _S.read(_e, "R1")]), _S.unary("-", 0.5), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 20), 20]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [40, 120])), _S.invoke(_S.read(_e, "R"), "range", [0.5, 0.9]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.prop(_S.read(_e, "ST"), 2), _S.prop(_S.read(_e, "ST"), 3), _S.prop(_S.read(_e, "ST"), 4)]]), 1])
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "RUNES")), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "BREAK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.1]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "DUST"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", _S.read(_e, "R1")), _S.read(_e, "R1")]), _S.unary("-", 1), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [4, 12])), _S.invoke(_S.read(_e, "R"), "range", [0.4, 0.7]), _S.read(_e, "DUST"), _S.invoke(_S.read(_e, "R"), "range", [1.5, 2.5])])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["break", _S.read(_e, "BREAK")])):
		var _v53 = _S.scope(_e)
		_S.invoke(_S.read(_v53, "lights"), "add", [0, _S.unary("-", 18), 64, _S.prop(_S.read(_v53, "C"), 4), 0.9, 0.6])
		_S.invoke(_S.read(_v53, "lights"), "add", [0, _S.unary("-", 8), 26, _S.prop(_S.read(_v53, "C"), 6), 0.8, 0.14])
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v54, "i"), 18)):
			_S.invoke(_S.read(_v54, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v54, "B"), "CHUNK")}, {"x": _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 14), 14])}, {"y": _S.unary("-", 2)}, {"vx": _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 75), 75])}, {"vy": _S.unary("-", _S.invoke(_S.read(_v54, "R"), "range", [170, 320]))}, {"g": 1}, {"drag": 0.7}, {"bounce": 0.32}, {"life": _S.invoke(_S.read(_v54, "R"), "range", [1.6, 2.4])}, {"a": _S.invoke(_S.read(_v54, "R"), "range", [0, _S.read(_v54, "TAU")])}, {"va": _S.invoke(_S.read(_v54, "R"), "range", [_S.unary("-", 14), 14])}, {"s": _S.invoke(_S.read(_v54, "R"), "range", [1.3, 3])}, {"ramp": _S.read(_v54, "RUB")}])])
			_v54 = _S.iteration(_v54)
			_S.write(_v54, "i", 1, "+=", true)
		var _v55 = _S.scope(_v53)
		_S.define(_v55, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v55, "i"), 60)):
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "u", _S.invoke(_S.read(_v56, "R"), "range", [_S.unary("-", 1), 1]))
			_S.define(_v56, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v56, "Math"), "PI")), 2), _S.binary("*", _S.read(_v56, "u"), 0.7)))
			_S.define(_v56, "sp", _S.binary("*", _S.invoke(_S.read(_v56, "R"), "range", [80, 230]), _S.binary("-", 1, _S.binary("*", 0.4, _S.invoke(_S.read(_v56, "Math"), "abs", [_S.read(_v56, "u")])))))
			_S.invoke(_S.read(_v56, "ps"), "spawn", [_S.prop(_S.read(_v56, "P"), "GRIT"), _S.binary("*", _S.read(_v56, "u"), 10), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "cos", [_S.read(_v56, "a")]), _S.read(_v56, "sp")), _S.binary("*", _S.invoke(_S.read(_v56, "Math"), "sin", [_S.read(_v56, "a")]), _S.read(_v56, "sp")), _S.invoke(_S.read(_v56, "R"), "range", [1, 1.8]), _S.invoke(_S.read(_v56, "R"), "pick", [[_S.prop(_S.read(_v56, "ST"), 2), _S.prop(_S.read(_v56, "ST"), 3), _S.prop(_S.read(_v56, "ST"), 3), _S.prop(_S.read(_v56, "ST"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v56, "R"), "chance", [0.4])) else 1)])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "i", 1, "+=", true)
		var _v57 = _S.scope(_v53)
		_S.define(_v57, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v57, "i"), 12)):
			var _v58 = _S.scope(_v57)
			_S.define(_v58, "s", _S.invoke(_S.read(_v58, "R"), "sign", []))
			_S.invoke(_S.read(_v58, "ps"), "spawn", [_S.prop(_S.read(_v58, "P"), "SMOKE"), _S.binary("*", _S.read(_v58, "s"), _S.invoke(_S.read(_v58, "R"), "range", [2, 14])), _S.unary("-", _S.invoke(_S.read(_v58, "R"), "range", [1, 5])), _S.binary("*", _S.read(_v58, "s"), _S.invoke(_S.read(_v58, "R"), "range", [35, 100])), _S.unary("-", _S.invoke(_S.read(_v58, "R"), "range", [4, 24])), _S.invoke(_S.read(_v58, "R"), "range", [1.2, 2]), _S.read(_v58, "DUST"), _S.invoke(_S.read(_v58, "R"), "range", [3.5, 6]), _S.invoke(_S.read(_v58, "R"), "range", [0, 0.1]), _S.prop(_S.read(_v58, "PF"), "BIG")])
			_v57 = _S.iteration(_v57)
			_S.write(_v57, "i", 1, "+=", true)
		var _v59 = _S.scope(_v53)
		_S.define(_v59, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v59, "i"), 4)):
			var _v60 = _S.scope(_v59)
			_S.define(_v60, "s", _S.invoke(_S.read(_v60, "R"), "sign", []))
			_S.invoke(_S.read(_v60, "ps"), "spawn", [_S.prop(_S.read(_v60, "P"), "SMOKE"), _S.binary("*", _S.read(_v60, "s"), _S.invoke(_S.read(_v60, "R"), "range", [10, 18])), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [2, 8])), _S.binary("*", _S.read(_v60, "s"), _S.invoke(_S.read(_v60, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v60, "R"), "range", [40, 90])), _S.invoke(_S.read(_v60, "R"), "range", [1.4, 2.2]), _S.read(_v60, "DUST"), _S.invoke(_S.read(_v60, "R"), "range", [4, 6.5]), _S.invoke(_S.read(_v60, "R"), "range", [0, 0.12]), _S.prop(_S.read(_v60, "PF"), "BIG")])
			_v59 = _S.iteration(_v59)
			_S.write(_v59, "i", 1, "+=", true)
		var _v61 = _S.scope(_v53)
		_S.define(_v61, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v61, "i"), 24)):
			var _v62 = _S.scope(_v61)
			_S.define(_v62, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v62, "Math"), "PI")), 2), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 1.1), 1.1])))
			_S.define(_v62, "sp", _S.invoke(_S.read(_v62, "R"), "range", [150, 360]))
			_S.invoke(_S.read(_v62, "ps"), "spawn", [_S.prop(_S.read(_v62, "P"), "SPARK"), _S.invoke(_S.read(_v62, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", 2), _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "cos", [_S.read(_v62, "a")]), _S.read(_v62, "sp")), _S.binary("*", _S.invoke(_S.read(_v62, "Math"), "sin", [_S.read(_v62, "a")]), _S.read(_v62, "sp")), _S.invoke(_S.read(_v62, "R"), "range", [0.25, 0.65])])
			_v61 = _S.iteration(_v61)
			_S.write(_v61, "i", 1, "+=", true)
	_S.define(_e, "rv", _S.binary("-", _S.call_value(_S.read(_e, "rise"), [_S.read(_e, "t")]), _S.call_value(_S.read(_e, "rise"), [_S.binary("-", _S.read(_e, "t"), _S.read(_e, "dt"))])))
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "BREAK")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BREAK"), 1.2))), func(): return _S.binary(">", _S.read(_e, "rv"), 0))):
		var _v63 = _S.scope(_e)
		if _S.truth(_S.invoke(_S.read(_v63, "R"), "chance", [_S.invoke(_S.read(_v63, "Math"), "min", [0.9, _S.binary("*", _S.read(_v63, "rv"), 140)])])):
			var _v64 = _S.scope(_v63)
			_S.define(_v64, "e", _S.call_value(_S.read(_v64, "topEdge"), []))
			if _S.truth(_S.prop(_S.read(_v64, "e"), "length")):
				var _v65 = _S.scope(_v64)
				var _v66 = _S.invoke(_S.read(_v65, "R"), "pick", [_S.read(_v65, "e")])
				_S.define(_v65, "x", _S.prop(_v66, 0))
				_S.define(_v65, "y", _S.prop(_v66, 1))
				_S.invoke(_S.read(_v65, "ps"), "spawn", [_S.prop(_S.read(_v65, "P"), "GRIT"), _S.read(_v65, "x"), _S.read(_v65, "y"), _S.invoke(_S.read(_v65, "R"), "range", [_S.unary("-", 25), 25]), _S.unary("-", _S.invoke(_S.read(_v65, "R"), "range", [10, 60])), _S.invoke(_S.read(_v65, "R"), "range", [0.8, 1.4]), _S.invoke(_S.read(_v65, "R"), "pick", [[_S.prop(_S.read(_v65, "ST"), 2), _S.prop(_S.read(_v65, "ST"), 3), _S.prop(_S.read(_v65, "ST"), 4)]]), (2 if _S.truth(_S.invoke(_S.read(_v65, "R"), "chance", [0.3])) else 1)])
		if _S.truth(_S.invoke(_S.read(_v63, "R"), "chance", [_S.invoke(_S.read(_v63, "Math"), "min", [0.8, _S.binary("*", _S.read(_v63, "rv"), 70)])])):
			var _v67 = _S.scope(_v63)
			_S.define(_v67, "s", _S.invoke(_S.read(_v67, "R"), "sign", []))
			_S.invoke(_S.read(_v67, "ps"), "spawn", [_S.prop(_S.read(_v67, "P"), "SMOKE"), _S.binary("*", _S.read(_v67, "s"), _S.invoke(_S.read(_v67, "R"), "range", [10, 22])), _S.unary("-", _S.invoke(_S.read(_v67, "R"), "range", [1, 4])), _S.binary("*", _S.read(_v67, "s"), _S.invoke(_S.read(_v67, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v67, "R"), "range", [2, 12])), _S.invoke(_S.read(_v67, "R"), "range", [1, 1.8]), _S.read(_v67, "DUST"), _S.invoke(_S.read(_v67, "R"), "range", [3, 5.5]), 0, _S.prop(_S.read(_v67, "PF"), "BIG")])
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["heave2", _S.binary("+", _S.read(_e, "BREAK"), 0.64)])):
		var _v68 = _S.scope(_e)
		_S.invoke(_S.read(_v68, "lights"), "add", [0, _S.unary("-", 10), 56, _S.prop(_S.read(_v68, "C"), 4), 0.6, 0.4])
		var _v69 = _S.scope(_v68)
		_S.define(_v69, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v69, "i"), 8)):
			_S.invoke(_S.read(_v69, "rocks"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v69, "B"), "CHUNK")}, {"x": _S.binary("*", _S.invoke(_S.read(_v69, "R"), "sign", []), _S.invoke(_S.read(_v69, "R"), "range", [10, 22]))}, {"y": _S.unary("-", 2)}, {"vx": _S.binary("*", _S.invoke(_S.read(_v69, "R"), "sign", []), _S.invoke(_S.read(_v69, "R"), "range", [25, 70]))}, {"vy": _S.unary("-", _S.invoke(_S.read(_v69, "R"), "range", [90, 180]))}, {"g": 1}, {"drag": 0.7}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v69, "R"), "range", [1.2, 1.8])}, {"a": _S.invoke(_S.read(_v69, "R"), "range", [0, _S.read(_v69, "TAU")])}, {"va": _S.invoke(_S.read(_v69, "R"), "range", [_S.unary("-", 12), 12])}, {"s": _S.invoke(_S.read(_v69, "R"), "range", [1.2, 2.4])}, {"ramp": _S.read(_v69, "RUB")}])])
			_v69 = _S.iteration(_v69)
			_S.write(_v69, "i", 1, "+=", true)
	if _S.truth(_S.call_value(_S.read(_e, "once"), ["eyes", _S.read(_e, "EYES")])):
		var _v70 = _S.scope(_e)
		for _v71 in _S.array(_S.prop(_S.read(_v70, "BEAST"), "glints")):
			var _v72 = _S.scope(_v70)
			var _v73 = _v71
			_S.define(_v72, "ex", _S.prop(_v73, 0))
			_S.define(_v72, "ey", _S.prop(_v73, 1))
			var _v74 = _S.scope(_v72)
			_S.invoke(_S.read(_v74, "lights"), "add", [_S.read(_v74, "ex"), _S.read(_v74, "ey"), 14, _S.prop(_S.read(_v74, "C"), 6), 0.7, 0.3])
			var _v75 = _S.scope(_v74)
			_S.define(_v75, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v75, "i"), 5)):
				_S.invoke(_S.read(_v75, "ps"), "spawn", [_S.prop(_S.read(_v75, "P"), "SPARK"), _S.read(_v75, "ex"), _S.read(_v75, "ey"), _S.invoke(_S.read(_v75, "R"), "range", [_S.unary("-", 90), 90]), _S.invoke(_S.read(_v75, "R"), "range", [_S.unary("-", 90), 20]), _S.invoke(_S.read(_v75, "R"), "range", [0.15, 0.35])])
				_v75 = _S.iteration(_v75)
				_S.write(_v75, "i", 1, "+=", true)
		var _v76 = _S.scope(_v70)
		_S.define(_v76, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v76, "i"), 10)):
			var _v77 = _S.scope(_v76)
			_S.define(_v77, "s", _S.invoke(_S.read(_v77, "R"), "sign", []))
			_S.invoke(_S.read(_v77, "ps"), "spawn", [_S.prop(_S.read(_v77, "P"), "DUST"), _S.binary("*", _S.read(_v77, "s"), _S.invoke(_S.read(_v77, "R"), "range", [8, 20])), _S.unary("-", 1), _S.binary("*", _S.read(_v77, "s"), _S.invoke(_S.read(_v77, "R"), "range", [30, 80])), _S.unary("-", _S.invoke(_S.read(_v77, "R"), "range", [3, 10])), _S.invoke(_S.read(_v77, "R"), "range", [0.4, 0.8]), _S.read(_v77, "DUST"), _S.invoke(_S.read(_v77, "R"), "range", [1.5, 3])])
			_v76 = _S.iteration(_v76)
			_S.write(_v76, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.05)), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "FADE"), 0.75))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.45]))):
		var _v78 = _S.scope(_e)
		_S.define(_v78, "x", _S.invoke(_S.read(_v78, "R"), "int", [4, _S.binary("-", _S.prop(_S.read(_v78, "BEAST"), "w"), 5)]))
		_S.define(_v78, "y", _S.invoke(_S.read(_v78, "R"), "int", [2, _S.binary("-", _S.prop(_S.read(_v78, "BEAST"), "h"), 4)]))
		if _S.truth(_S.prop(_S.prop(_S.read(_v78, "BEAST"), "part"), _S.binary("+", _S.binary("*", _S.read(_v78, "y"), _S.prop(_S.read(_v78, "BEAST"), "w")), _S.read(_v78, "x")))):
			var _v79 = _S.scope(_v78)
			_S.define(_v79, "lx", _S.binary("-", _S.read(_v79, "x"), _S.binary("/", _S.prop(_S.read(_v79, "BEAST"), "w"), 2)))
			_S.define(_v79, "ly", _S.binary("-", _S.read(_v79, "y"), _S.prop(_S.read(_v79, "BEAST"), "h")))
			_S.invoke(_S.read(_v79, "ps"), "spawn", [_S.prop(_S.read(_v79, "P"), "SMOKE"), _S.read(_v79, "lx"), _S.read(_v79, "ly"), _S.invoke(_S.read(_v79, "R"), "range", [_S.unary("-", 6), 6]), _S.unary("-", _S.invoke(_S.read(_v79, "R"), "range", [10, 26])), _S.call_value(_S.read(_v79, "left"), [0.9, 1.5]), _S.read(_v79, "SOOT"), _S.invoke(_S.read(_v79, "R"), "range", [2, 3.4])])
			if _S.truth(_S.invoke(_S.read(_v79, "R"), "chance", [0.3])):
				_S.invoke(_S.read(_v79, "ps"), "spawn", [_S.prop(_S.read(_v79, "P"), "EMBER"), _S.read(_v79, "lx"), _S.read(_v79, "ly"), _S.invoke(_S.read(_v79, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v79, "R"), "range", [15, 40])), _S.call_value(_S.read(_v79, "left"), [0.6, 1.2]), _S.prop(_S.read(_v79, "C"), 4), 1])
	_S.invoke(_S.read(_e, "rocks"), "update", [_S.read(_e, "dt")])
	for _v80 in _S.array(_S.prop(_S.read(_e, "rocks"), "list")):
		var _v81 = _S.scope(_e)
		_S.define(_v81, "b", _v80)
		if _S.truth(_S.logical("&&", _S.prop(_S.read(_v81, "b"), "rest"), func(): return _S.unary("!", _S.prop(_S.read(_v81, "b"), "dusted")))):
			var _v82 = _S.scope(_v81)
			_S.set_prop(_S.read(_v82, "b"), "dusted", true, "=", false)
			var _v83 = _S.scope(_v82)
			_S.define(_v83, "i", 0)
			while _S.truth(_S.binary("<", _S.read(_v83, "i"), 2)):
				_S.invoke(_S.read(_v83, "ps"), "spawn", [_S.prop(_S.read(_v83, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v83, "b"), "x"), _S.invoke(_S.read(_v83, "R"), "range", [_S.unary("-", 1.5), 1.5])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v83, "R"), "sign", []), _S.invoke(_S.read(_v83, "R"), "range", [6, 30])), _S.unary("-", _S.invoke(_S.read(_v83, "R"), "range", [2, 12])), _S.invoke(_S.read(_v83, "R"), "range", [0.3, 0.6]), _S.read(_v83, "DUST"), _S.invoke(_S.read(_v83, "R"), "range", [1.2, 2.4])])
				_v83 = _S.iteration(_v83)
				_S.write(_v83, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f19(_parent,_args:Array,_this=null):
	var _n_heat = _S.read(_parent,"heat")
	var _n_t = _S.read(_parent,"t")
	var _n_C = _S.read(_parent,"C")
	var _n_RUNES = _S.read(_parent,"RUNES")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_FADE = _S.read(_parent,"FADE")
	var _n_cracks = _S.read(_parent,"cracks")
	var _n_IGN = _S.read(_parent,"IGN")
	var _n_TAU = _S.read(_parent,"TAU")
	var _n_R0 = _S.read(_parent,"R0")
	var _n_SY = _S.read(_parent,"SY")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_R1 = _S.read(_parent,"R1")
	var _n_runes = _S.read(_parent,"runes")
	var _n_ps = _S.read(_parent,"ps")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_h_b1 = _S.call_value(_n_heat,[_n_t])
	if _S.truth((_n_h_b1 <= 0.01)):
		return null
	_S.invoke(_n_p_b0,"glow",[0, (-2), 52, _S.index_value(_n_C,4), (0.28 * _n_h_b1)])
	_S.invoke(_n_p_b0,"glow",[0, (-22), 72, _S.index_value(_n_C,4), (0.1 * _n_h_b1)])
	_S.invoke(_n_p_b0,"glow",[0, (-1), 22, _S.index_value(_n_C,5), (0.2 * _n_h_b1)])
	var _n_ck_b2 = (_S.MathFX.smooth(_n_RUNES,_n_BREAK,_n_t) * (1 - _S.MathFX.smooth(_n_FADE,(_n_FADE + 0.7),_n_t)))
	if _S.truth((_n_ck_b2 > 0)):
		for _iter_0 in _S.array(_n_cracks):
			var _n_pts_b7 = _iter_0
			if true:
				var _n_i_b8 = 1
				while _S.truth((_n_i_b8 < _S.prop(_n_pts_b7,"length"))):
					var _n_u_b9 = (float(_n_i_b8)/_S.prop(_n_pts_b7,"length"))
					if _S.truth((_n_u_b9 > (_n_ck_b2 * 1.1))):
						break
					var _n_cool_b10 = _S.MathFX.smooth((_n_BREAK + 0.1),(_n_BREAK + 1.1),_n_t)
					var _n_ci_b11 = floori(((6 - (_n_u_b9 * 2)) - (_n_cool_b10 * 2.6))+0.5)
					_S.invoke(_n_p_b0,"line",[_S.index_value(_S.index_value(_n_pts_b7,(_n_i_b8 - 1)),0), _S.index_value(_S.index_value(_n_pts_b7,(_n_i_b8 - 1)),1), _S.index_value(_S.index_value(_n_pts_b7,_n_i_b8),0), _S.index_value(_S.index_value(_n_pts_b7,_n_i_b8),1), _S.index_value(_n_C,clampf(_n_ci_b11,2,6)), 1])
					_n_i_b8 += 1.0
	var _n_n_b3 = 220
	var _n_prog_b4 = (clampf((float(_n_t)/_n_IGN),0.0,1.0) * PI)
	if true:
		var _n_j_b12 = 0
		while _S.truth((_n_j_b12 < _n_n_b3)):
			var _n_a_b13 = ((float(_n_j_b12)/_n_n_b3) * _n_TAU)
			var _n_d_b14 = absf((fmod(((_n_a_b13 - (float(PI)/2)) + (PI * 3)),_n_TAU) - PI))
			if _S.truth((_n_d_b14 > _n_prog_b4)):
				_n_j_b12 += 1.0
				continue
			var _n_fresh_b15 = ((_n_t < (_n_IGN + 0.1)) if _S.truth(((_n_prog_b4 - _n_d_b14) < 0.25)) else ((_n_prog_b4 - _n_d_b14) < 0.25))
			var _n_f_b16 = ((_S.MathFX.noise(((_n_a_b13 * 6) + (_n_t * 5)),4) * 0.5) + 0.5)
			var _n_k_b17 = (_n_h_b1 * (0.7 + (0.5 * _n_f_b16)))
			var _n_ca_b18 = cos(_n_a_b13)
			var _n_sa_b19 = sin(_n_a_b13)
			_S.invoke(_n_p_b0,"dot",[(_n_ca_b18 * _n_R0), ((_n_sa_b19 * _n_R0) * _n_SY), (_n_WHITE if _S.truth(_n_fresh_b15) else (_S.index_value(_n_C,6) if _S.truth((_n_k_b17 > 0.95)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b17 > 0.6)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b17 > 0.35)) else _S.index_value(_n_C,3)))))])
			_S.invoke(_n_p_b0,"dot",[(_n_ca_b18 * (_n_R0 + 2.2)), ((_n_sa_b19 * (_n_R0 + 2.2)) * _n_SY), (_S.index_value(_n_C,4) if _S.truth((_n_k_b17 > 0.8)) else _S.index_value(_n_C,3)), 0.9])
			if _S.truth((_n_t > (_n_RUNES - 0.15))):
				_S.invoke(_n_p_b0,"dot",[(_n_ca_b18 * _n_R1), ((_n_sa_b19 * _n_R1) * _n_SY), (_S.index_value(_n_C,5) if _S.truth((_n_k_b17 > 0.9)) else (_S.index_value(_n_C,4) if _S.truth((_n_k_b17 > 0.5)) else _S.index_value(_n_C,3))), _S.MathFX.smooth((_n_RUNES - 0.15),(_n_RUNES + 0.05),_n_t)])
			if _S.truth(_S.binary("===",fmod(_n_j_b12,11),0)):
				_S.invoke(_n_p_b0,"glow",[(_n_ca_b18 * _n_R0), ((_n_sa_b19 * _n_R0) * _n_SY), 9, _S.index_value(_n_C,4), (0.22 * _n_k_b17)])
			_n_j_b12 += 1.0
	var _n_rk_b5 = _S.MathFX.smooth((_n_RUNES - 0.1),(_n_RUNES + 0.15),_n_t)
	if _S.truth((_n_rk_b5 > 0)):
		for _iter_1 in _S.array(_n_runes):
			var _n_r_b20 = _iter_1
			var _n_k_b21 = ((_n_h_b1 * _n_rk_b5) * (0.75 + (0.35 * _S.MathFX.noise(((_n_t * 4) + (_S.named_value(_n_r_b20,"a") * 5)),8))))
			var _n_mid_b22 = ((float((_n_R0 + _n_R1))/2) + 0.5)
			var _n_ta_b23 = [(-sin(_S.named_value(_n_r_b20,"a"))), cos(_S.named_value(_n_r_b20,"a"))]
			var _n_na_b24 = [cos(_S.named_value(_n_r_b20,"a")), sin(_S.named_value(_n_r_b20,"a"))]
			var _n_proj_b25 = _S.function_value(_S.capture(_parent,{"na":_n_na_b24,"mid":_n_mid_b22,"ta":_n_ta_b23,"this":_this}),"_f20")
			for _iter_2 in _S.array(_S.named_value(_n_r_b20,"g")):
				var _n_stroke_b26 = _iter_2
				if true:
					var _n_i_b27 = 1
					while _S.truth((_n_i_b27 < _S.prop(_n_stroke_b26,"length"))):
						var _tuple_3 = _S.call_value(_n_proj_b25,[_S.index_value(_n_stroke_b26,(_n_i_b27 - 1))])
						var _n_x0_b28 = _S.prop(_tuple_3,0)
						var _n_y0_b29 = _S.prop(_tuple_3,1)
						var _tuple_4 = _S.call_value(_n_proj_b25,[_S.index_value(_n_stroke_b26,_n_i_b27)])
						var _n_x1_b30 = _S.prop(_tuple_4,0)
						var _n_y1_b31 = _S.prop(_tuple_4,1)
						_S.invoke(_n_p_b0,"line",[_n_x0_b28, _n_y0_b29, _n_x1_b30, _n_y1_b31, (_S.index_value(_n_C,6) if _S.truth((_n_k_b21 > 0.9)) else (_S.index_value(_n_C,5) if _S.truth((_n_k_b21 > 0.55)) else _S.index_value(_n_C,4))), minf(1,(_n_k_b21 * 1.5))])
						_n_i_b27 += 1.0
	var _n_hole_b6 = (_S.MathFX.smooth((_n_BREAK - 0.05),(_n_BREAK + 0.15),_n_t) * (1 - _S.MathFX.smooth((_n_BREAK + 0.95),(_n_BREAK + 1.5),_n_t)))
	if _S.truth((_n_hole_b6 > 0)):
		var _n_hw_b32 = (15 * _n_hole_b6)
		_S.invoke(_n_p_b0,"shade",[((-_n_hw_b32) - 1), (-1), (_n_hw_b32 + 1), 4, _S.function_value(_S.capture(_parent,{"hw":_n_hw_b32,"this":_this}),"_f21")])
		_S.invoke(_n_p_b0,"glow",[0, 0, 24, _S.index_value(_n_C,5), ((0.3 * _n_hole_b6) * _n_h_b1)])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "back"])
	return null

static func _f20(_parent,_args:Array,_this=null):
	var _n_na = _S.read(_parent,"na")
	var _n_mid = _S.read(_parent,"mid")
	var _n_ta = _S.read(_parent,"ta")
	var _n_SY = _S.read(_parent,"SY")
	var _tuple_0 = _S.arg(_args,0)
	var _n_u_b0 = _S.prop(_tuple_0,0)
	var _n_v_b1 = _S.prop(_tuple_0,1)
	return [(((_S.index_value(_n_na,0) * _n_mid) + ((_S.index_value(_n_ta,0) * _n_u_b0) * 1.1)) + (_S.index_value(_n_na,0) * _n_v_b1)), ((((_S.index_value(_n_na,1) * _n_mid) + ((_S.index_value(_n_ta,1) * _n_u_b0) * 1.1)) + (_S.index_value(_n_na,1) * _n_v_b1)) * _n_SY)]
	return null

static func _f21(_parent,_args:Array,_this=null):
	var _n_hw = _S.read(_parent,"hw")
	var _n_C = _S.read(_parent,"C")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	var _n_out_b2 = _S.arg(_args,2)
	var _n_d_b3 = _S.Bridge.hypot([(float(_n_x_b0)/_n_hw), (float((_n_y_b1 - 0.5))/3.2)])
	if _S.truth((_n_d_b3 > 1)):
		return null
	_S.set_prop(_n_out_b2,"c",(_S.index_value(_n_C,4) if _S.truth((_n_d_b3 > 0.86)) else (_S.index_value(_n_C,1) if _S.truth((_n_d_b3 > 0.62)) else _S.index_value(_n_C,0))),"=")
	return null

static func _f22(_parent,_args:Array,_this=null):
	var _n_rise = _S.read(_parent,"rise")
	var _n_t = _S.read(_parent,"t")
	var _n_BEAST = _S.read(_parent,"BEAST")
	var _n_heat = _S.read(_parent,"heat")
	var _n_FADE = _S.read(_parent,"FADE")
	var _n_SH = _S.read(_parent,"SH")
	var _n_HR = _S.read(_parent,"HR")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_EYES = _S.read(_parent,"EYES")
	var _n_BREAK = _S.read(_parent,"BREAK")
	var _n_rocks = _S.read(_parent,"rocks")
	var _n_ps = _S.read(_parent,"ps")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_r_b1 = _S.call_value(_n_rise,[_n_t])
	var _n_off_b2 = (_S.named_value(_n_BEAST,"h") * (1 - _n_r_b1))
	var _n_h_b3 = _S.call_value(_n_heat,[_n_t])
	var _n_fade_b4 = _S.MathFX.smooth((_n_FADE + 0.1),(_n_FADE + 0.8),_n_t)
	if _S.truth((_n_r_b1 > 0)):
		var _n_W_b5 = _S.named_value(_n_BEAST,"w")
		var _n_H_b6 = _S.named_value(_n_BEAST,"h")
		var _n_x0_b7 = (float((-_n_W_b5))/2)
		var _n_oy_b8 = (_n_off_b2 - _n_H_b6)
		var _n_k_b9 = minf(1,_n_h_b3)
		var _n_gone_b10 = _S.function_value(_S.capture(_parent,{"fade":_n_fade_b4,"H":_n_H_b6,"this":_this}),"_f23")
		for _iter_0 in _S.array(_S.named_value(_n_BEAST,"outline")):
			var _tuple_1 = _iter_0
			var _n_x_b11 = _S.prop(_tuple_1,0)
			var _n_y_b12 = _S.prop(_tuple_1,1)
			if _S.truth((not _S.truth(_S.call_value(_n_gone_b10,[_n_x_b11, minf((_n_H_b6 - 1),maxf(0,_n_y_b12))])) if _S.truth(((_n_y_b12 + _n_oy_b8) < 0)) else ((_n_y_b12 + _n_oy_b8) < 0))):
				_S.invoke(_n_p_b0,"px",[(_n_x0_b7 + _n_x_b11), (_n_y_b12 + _n_oy_b8), _S.index_value(_n_SH,0)])
		if true:
			var _n_y_b13 = 0
			while _S.truth((_n_y_b13 < _n_H_b6)):
				var _n_ly_b14 = (_n_y_b13 + _n_oy_b8)
				if _S.truth((_n_ly_b14 >= 0)):
					break
				var _n_upRim_b15 = (exp((float(_n_ly_b14)/17)) * _n_k_b9)
				var _n_upPlane_b16 = (exp((float(_n_ly_b14)/19)) * _n_k_b9)
				if true:
					var _n_x_b17 = 0
					while _S.truth((_n_x_b17 < _n_W_b5)):
						var _n_i_b18 = ((_n_y_b13 * _n_W_b5) + _n_x_b17)
						var _n_pt_b19 = _S.index_value(_S.named_value(_n_BEAST,"part"),_n_i_b18)
						if _S.truth((not _S.truth(_n_pt_b19) if _S.truth(not _S.truth(_n_pt_b19)) else _S.call_value(_n_gone_b10,[_n_x_b17, _n_y_b13]))):
							_n_x_b17 += 1.0
							continue
						var _n_ramp_b20 = (_n_HR if _S.truth(_S.binary("===",_n_pt_b19,2)) else _n_SH)
						var _n_a_b21 = _S.index_value(_S.named_value(_n_BEAST,"amb"),_n_i_b18)
						var _n_si_b22 = (0 if _S.truth(_S.index_value(_S.named_value(_n_BEAST,"crease"),_n_i_b18)) else (4 if _S.truth((_n_a_b21 > 0.74)) else (3 if _S.truth((_n_a_b21 > 0.56)) else (2 if _S.truth((_n_a_b21 > 0.36)) else 1))))
						if _S.truth(((_n_si_b22 > 0) if _S.truth(_S.binary("===",_n_pt_b19,2)) else _S.binary("===",_n_pt_b19,2))):
							_n_si_b22 = minf(4,(_n_si_b22 + (2 if _S.truth((_n_y_b13 < 3)) else 1)))
						var _n_Lr_b23 = (_S.index_value(_S.named_value(_n_BEAST,"rim"),_n_i_b18) * _n_upRim_b15)
						var _n_Lp_b24 = ((_S.index_value(_S.named_value(_n_BEAST,"down"),_n_i_b18) * _n_upPlane_b16) * 0.6)
						var _n_c_b25 = _S.index_value(_n_ramp_b20,_n_si_b22)
						if _S.truth((_n_Lr_b23 > 0.7)):
							_n_c_b25 = _S.index_value(_n_C,5)
						else:
							if _S.truth((_n_Lr_b23 > 0.48)):
								_n_c_b25 = _S.index_value(_n_C,4)
							else:
								if _S.truth(((_n_Lr_b23 > 0.3) if _S.truth((_n_Lr_b23 > 0.3)) else (_n_Lp_b24 > 0.42))):
									_n_c_b25 = _S.index_value(_n_C,3)
								else:
									if _S.truth(((_n_Lr_b23 > 0.17) if _S.truth((_n_Lr_b23 > 0.17)) else (_n_Lp_b24 > 0.26))):
										_n_c_b25 = _S.ColorFX.mix(_S.index_value(_n_C,2),_S.index_value(_n_ramp_b20,_n_si_b22),0.3)
									else:
										if _S.truth(((_n_Lr_b23 > 0.08) if _S.truth((_n_Lr_b23 > 0.08)) else (_n_Lp_b24 > 0.12))):
											_n_c_b25 = _S.ColorFX.mix(_S.index_value(_n_ramp_b20,_n_si_b22),_S.index_value(_n_C,1),0.6)
						_S.invoke(_n_p_b0,"px",[(_n_x0_b7 + _n_x_b17), _n_ly_b14, _n_c_b25])
						_n_x_b17 += 1.0
				_n_y_b13 += 1.0
		for _iter_2 in _S.array(_S.named_value(_n_BEAST,"tusks")):
			var _tuple_3 = _iter_2
			var _n_x_b26 = _S.prop(_tuple_3,0)
			var _n_y_b27 = _S.prop(_tuple_3,1)
			if _S.truth((not _S.truth(_S.call_value(_n_gone_b10,[_n_x_b26, _n_y_b27])) if _S.truth(((_n_y_b27 + _n_oy_b8) < 0)) else ((_n_y_b27 + _n_oy_b8) < 0))):
				_S.invoke(_n_p_b0,"px",[(_n_x0_b7 + _n_x_b26), (_n_y_b27 + _n_oy_b8), _S.ColorFX.mix(_S.index_value(_n_HR,4),_S.index_value(_n_C,4),(0.35 * _n_k_b9))])
		for _iter_4 in _S.array(_S.named_value(_n_BEAST,"eyes")):
			var _tuple_5 = _iter_4
			var _n_x_b28 = _S.prop(_tuple_5,0)
			var _n_y_b29 = _S.prop(_tuple_5,1)
			if _S.truth((not _S.truth(_S.call_value(_n_gone_b10,[_n_x_b28, _n_y_b29])) if _S.truth(((_n_y_b29 + _n_oy_b8) < 0)) else ((_n_y_b29 + _n_oy_b8) < 0))):
				_S.invoke(_n_p_b0,"px",[(_n_x0_b7 + _n_x_b28), (_n_y_b29 + _n_oy_b8), ((_n_WHITE if _S.truth((_n_t < (_n_EYES + 0.1))) else _S.index_value(_n_C,6)) if _S.truth((_n_t > (_n_EYES - 0.05))) else (_S.index_value(_n_C,2) if _S.truth((_n_t > (_n_BREAK + 0.5))) else _S.index_value(_n_SH,0)))])
		if _S.truth((_n_t > (_n_EYES - 0.05))):
			var _n_k_b30 = ((1 - _S.MathFX.smooth((_n_FADE + 0.6),(_n_FADE + 1),_n_t)) * (0.85 + (0.15 * sin((_n_t * 13)))))
			for _iter_6 in _S.array(_S.named_value(_n_BEAST,"glints")):
				var _tuple_7 = _iter_6
				var _n_ex_b31 = _S.prop(_tuple_7,0)
				var _n_ey0_b32 = _S.prop(_tuple_7,1)
				var _n_ey_b33 = (_n_ey0_b32 + _n_off_b2)
				if _S.truth((_n_ey_b33 >= 0)):
					continue
				_S.invoke(_n_p_b0,"glow",[(_n_ex_b31 + 0.5), _n_ey_b33, 6, _S.index_value(_n_C,5), (0.5 * _n_k_b30)])
				var _n_g_b34 = (float((_n_t - _n_EYES))/0.3)
				if _S.truth(((_n_g_b34 < 1) if _S.truth((_n_g_b34 > 0)) else (_n_g_b34 > 0))):
					var _n_L_b35 = (9 * pow((1 - _n_g_b34),1.5))
					_S.invoke(_n_p_b0,"line",[(_n_ex_b31 - _n_L_b35), _n_ey_b33, (_n_ex_b31 + _n_L_b35), _n_ey_b33, _S.function_value(_S.capture(_parent,{"this":_this}),"_f24")])
					if _S.truth((_n_g_b34 < 0.4)):
						_S.invoke(_n_p_b0,"line",[_n_ex_b31, (_n_ey_b33 - (2 * (1 - _n_g_b34))), _n_ex_b31, (_n_ey_b33 + (2 * (1 - _n_g_b34))), _S.index_value(_n_C,6)])
				else:
					if _S.truth(((_n_k_b30 > 0.05) if _S.truth((_n_fade_b4 > 0.6)) else (_n_fade_b4 > 0.6))):
						_S.invoke(_n_p_b0,"px",[_n_ex_b31, _n_ey_b33, _S.index_value(_n_C,6)])
		_S.invoke(_n_p_b0,"glow",[0, (-6), 30, _S.index_value(_n_C,4), ((0.25 * _n_h_b3) * _n_r_b1)])
	_S.invoke(_n_rocks,"draw",[_n_p_b0])
	_S.invoke(_n_ps,"draw",[_n_p_b0, "front"])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f23(_parent,_args:Array,_this=null):
	var _n_fade = _S.read(_parent,"fade")
	var _n_H = _S.read(_parent,"H")
	var _n_x_b0 = _S.arg(_args,0)
	var _n_y_b1 = _S.arg(_args,1)
	return ((_n_fade > (0.06 + (0.86 * ((0.55 * (1 - (float(_n_y_b1)/_n_H))) + (0.45 * _S.MathFX.rand([_n_x_b0,_n_y_b1,3])))))) if _S.truth((_n_fade > 0)) else (_n_fade > 0))
	return null

static func _f24(_parent,_args:Array,_this=null):
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_u_b0 = _S.arg(_args,0)
	return (_n_WHITE if _S.truth((absf((_n_u_b0 - 0.5)) < 0.18)) else (_S.index_value(_n_C,6) if _S.truth((absf((_n_u_b0 - 0.5)) < 0.35)) else _S.index_value(_n_C,5)))
	return null
