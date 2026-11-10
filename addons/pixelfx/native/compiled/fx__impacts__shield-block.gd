@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/impacts/shield-block.js; MIT Patch / Hugo Duprez.
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
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "star", _S.import_value("fx/impacts/_lib.js", "star"))
	_S.define(_e, "spikes", _S.import_value("fx/impacts/_lib.js", "spikes"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Shield block"}, {"desc": "A blow is caught on a half-dome of energy in front of the character: its diamond lattice flashes, a ripple runs over it, sparks glance off, then it blinks out cell by cell."}, {"tags": ["impact", "block", "shield", "barrier", "energy", "ripple", "actor", "one-shot"]}, {"size": [148, 104]}, {"origin": [40, 88]}, {"duration": 1.1}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"]}, {"sparks": ["#fff3a6", "#ffe26b", "#ff8a2a", "#f2561d"]}, {"seed": 12}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "BRACE", _S.merge([_S.read(_e, "READY"), {"crouch": 4}, {"lean": 2}, {"fx": 13}, {"fy": _S.unary("-", 28)}, {"bx": 6}, {"by": _S.unary("-", 21)}, {"ffx": 9}, {"fbx": _S.unary("-", 9)}]))
	_S.define(_e, "act", _S.merge([{"poses": [[_S.unary("-", 0.36), _S.read(_e, "READY")], [_S.unary("-", 0.1), _S.read(_e, "BRACE")], [0, _S.merge([_S.read(_e, "BRACE"), {"x": _S.unary("-", 3)}, {"crouch": 6}, {"lean": _S.unary("-", 2)}, {"fx": 10}, {"fy": _S.unary("-", 26)}]), "snap"], [0.18, _S.merge([_S.read(_e, "BRACE"), {"x": _S.unary("-", 4)}, {"crouch": 5}, {"lean": 0}])], [0.65, _S.merge([_S.read(_e, "BRACE"), {"x": _S.unary("-", 3)}])], [1.1, _S.merge([_S.read(_e, "READY"), {"x": 0}])]]}, {"hits": [_S.merge([{"t": 0.005}, {"stop": 0.09}, {"shake": 0.2}, {"amp": 2}])]}, {"dust": [_S.merge([{"t": 0.01}, {"x": _S.unary("-", 10)}, {"n": 6}, {"dir": _S.unary("-", 1)}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "CX", 3)
	_S.define(_e, "RX", 28)
	_S.define(_e, "RY", 44)
	_S.define(_e, "GRID", 3.4)
	_S.define(_e, "HIT", _S.merge([{"lon": 1.18}, {"lat": 0.5}]))
	_S.define(_e, "GONE", 0.5)
	_S.define(_e, "onDome", _S.function_value(_e, "_f6"))
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "S", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "sparks"), 4]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f1"))
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": _S.read(_e, "S")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	var _v0 = _S.call_value(_S.read(_e, "onDome"), [_S.prop(_S.read(_e, "HIT"), "lon"), _S.prop(_S.read(_e, "HIT"), "lat")])
	_S.define(_e, "hx", _S.prop(_v0, 0))
	_S.define(_e, "hy", _S.prop(_v0, 1))
	_S.define(_e, "sp", _S.call_value(_S.read(_e, "spikes"), [_S.read(_e, "R"), 8, 0.2, _S.merge([{"len": [5, 8]}, {"w": [1.4, 1.9]}, {"fwd": 1.2}, {"back": 0.3}])]))
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "hx"), _S.read(_e, "hy"), 40, _S.prop(_S.read(_e, "S"), 1), 0.7, 0.2])
	_S.invoke(_S.read(_e, "lights"), "add", [_S.read(_e, "hx"), _S.read(_e, "hy"), 12, _S.read(_e, "WHITE"), 0.7, 0.06])
	_S.define(_e, "nA", _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("/", _S.unary("-", _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "HIT"), "lat")])), _S.read(_e, "RY")), _S.binary("/", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.prop(_S.read(_e, "HIT"), "lat")]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.prop(_S.read(_e, "HIT"), "lon")])), _S.read(_e, "RX"))]))
	var _v1 = _S.scope(_e)
	_S.define(_v1, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "i"), 14)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "a", _S.binary("+", _S.read(_v2, "nA"), _S.invoke(_S.read(_v2, "R"), "range", [_S.unary("-", 1.2), 0.9])))
		_S.define(_v2, "v", _S.invoke(_S.read(_v2, "R"), "range", [130, 300]))
		_S.invoke(_S.read(_v2, "ps"), "spawn", [_S.prop(_S.read(_v2, "P"), "SPARK"), _S.binary("+", _S.read(_v2, "hx"), 1), _S.read(_v2, "hy"), _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]), _S.read(_v2, "v")), _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), _S.read(_v2, "v")), 30), _S.invoke(_S.read(_v2, "R"), "range", [0.15, 0.42]), _S.read(_v2, "WHITE"), 1, (_S.invoke(_S.read(_v2, "R"), "range", [0.01, 0.04]) if _S.truth(_S.binary(">", _S.read(_v2, "i"), 10)) else 0)])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "i", 1, "+=", true)
	_S.define(_e, "t", 0)
	_S.define(_e, "dome", _S.function_value(_e, "_f2"))
	return _S.merge([{"update": _S.function_value(_e, "_f3")}, {"drawBack": _S.function_value(_e, "_f4")}, {"draw": _S.function_value(_e, "_f5")}])

static func _f1(_parent,_args:Array,_this=null):
	return 0
	return null

static func _f2(_parent,_args:Array,_this=null):
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_t = _S.read(_parent,"t")
	var _n_RY = _S.read(_parent,"RY")
	var _n_CX = _S.read(_parent,"CX")
	var _n_RX = _S.read(_parent,"RX")
	var _n_GRID = _S.read(_parent,"GRID")
	var _n_HIT = _S.read(_parent,"HIT")
	var _n_C = _S.read(_parent,"C")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_p_b0 = _S.arg(_args,0)
	var _n_back_b1 = _S.arg(_args,1)
	var _n_fade_b2 = (1 - _S.MathFX.smooth((_n_GONE + 0.35),(_n_GONE + 0.55),_n_t))
	if _S.truth((_n_fade_b2 <= 0)):
		return null
	if true:
		var _n_y_b3 = ((-_n_RY) - 1)
		while _S.truth((_n_y_b3 < 0)):
			if true:
				var _n_x_b4 = _n_CX
				while _S.truth((_n_x_b4 <= ((_n_CX + _n_RX) + 1))):
					var _n_u_b5 = (float(((_n_x_b4 + 0.5) - _n_CX))/_n_RX)
					var _n_v_b6 = (float((-(_n_y_b3 + 0.5)))/_n_RY)
					var _n_q_b7 = ((_n_u_b5 * _n_u_b5) + (_n_v_b6 * _n_v_b6))
					if _S.truth((((_n_q_b7 > 1) if _S.truth((_n_q_b7 > 1)) else (_n_u_b5 < 0)) if _S.truth(((_n_q_b7 > 1) if _S.truth((_n_q_b7 > 1)) else (_n_u_b5 < 0))) else (_n_v_b6 < 0))):
						_n_x_b4 += 1.0
						continue
					var _n_z_b8 = (sqrt((1 - _n_q_b7)) * ((-1) if _S.truth(_n_back_b1) else 1))
					var _n_lon_b9 = atan2(_n_u_b5,_n_z_b8)
					var _n_lat_b10 = asin(clampf(_n_v_b6,0.0,1.0))
					var _n_a_b11 = ((_n_lon_b9 + _n_lat_b10) * _n_GRID)
					var _n_b_b12 = ((_n_lon_b9 - _n_lat_b10) * _n_GRID)
					var _n_fa_b13 = (_n_a_b11 - floori(_n_a_b11))
					var _n_fb_b14 = (_n_b_b12 - floori(_n_b_b12))
					var _n_cell_b15 = _S.MathFX.rand([floori(_n_a_b11),floori(_n_b_b12),31])
					var _n_line_b16 = (minf(minf(minf(_n_fa_b13,(1 - _n_fa_b13)),_n_fb_b14),(1 - _n_fb_b14)) < 0.13)
					var _n_gone_b17 = (_n_GONE + (_n_cell_b15 * 0.35))
					if _S.truth((_n_t > _n_gone_b17)):
						_n_x_b4 += 1.0
						continue
					var _n_d_b18 = acos(clampf((((cos(_n_lat_b10) * cos(_S.named_value(_n_HIT,"lat"))) * cos((_n_lon_b9 - _S.named_value(_n_HIT,"lon")))) + (sin(_n_lat_b10) * sin(_S.named_value(_n_HIT,"lat")))),(-1),1))
					var _n_hit_b19 = 0
					for _iter_0 in _S.array([[0, 1], [0.12, 0.55]]):
						var _tuple_1 = _iter_0
						var _n_t0_b24 = _S.prop(_tuple_1,0)
						var _n_k0_b25 = _S.prop(_tuple_1,1)
						var _n_k_b26 = (_n_t - _n_t0_b24)
						var _n_front_b27 = (_n_k_b26 * 3.6)
						if _S.truth(((_n_k_b26 < 0) if _S.truth((_n_k_b26 < 0)) else (_n_k_b26 > 0.55))):
							continue
						if _S.truth((absf((_n_d_b18 - _n_front_b27)) < 0.2)):
							_n_hit_b19 = maxf(_n_hit_b19,(_n_k0_b25 * (1 - (float(_n_k_b26)/0.55))))
						else:
							if _S.truth((_n_d_b18 < _n_front_b27)):
								_n_hit_b19 = maxf(_n_hit_b19,((0.3 * _n_k0_b25) * (1 - (float(_n_k_b26)/0.55))))
					var _n_rim_b20 = (1 - absf(_n_z_b8))
					var _n_flash_b21 = (_n_t < 0.05)
					var _n_blink_b22 = (_n_t > (_n_gone_b17 - 0.06))
					var _n_sheen_b23 = (absf((fmod((fmod((((_n_lat_b10 * 0.8) - (_n_lon_b9 * 0.3)) - (_n_t * 1.6)),1) + 1),1) - 0.5)) < 0.05)
					if _S.truth(_n_back_b1):
						if _S.truth(_n_line_b16):
							_S.invoke(_n_p_b0,"dot",[_n_x_b4, _n_y_b3, _S.index_value(_n_C,3), (0.5 * _n_fade_b2)])
						_n_x_b4 += 1.0
						continue
					if _S.truth((_n_q_b7 > 0.9)):
						_S.invoke(_n_p_b0,"dot",[_n_x_b4, _n_y_b3, (_n_WHITE if _S.truth((_n_flash_b21 if _S.truth(_n_flash_b21) else (_n_hit_b19 > 0.5))) else _S.index_value(_n_C,6)), _n_fade_b2])
					else:
						if _S.truth(_n_line_b16):
							_S.invoke(_n_p_b0,"dot",[_n_x_b4, _n_y_b3, (_n_WHITE if _S.truth(((_n_flash_b21 if _S.truth(_n_flash_b21) else _n_blink_b22) if _S.truth((_n_flash_b21 if _S.truth(_n_flash_b21) else _n_blink_b22)) else (_n_hit_b19 > 0.5))) else (_S.index_value(_n_C,6) if _S.truth(((_n_hit_b19 > 0.2) if _S.truth((_n_hit_b19 > 0.2)) else _n_sheen_b23)) else (_S.index_value(_n_C,5) if _S.truth((_n_rim_b20 > 0.7)) else (_S.index_value(_n_C,4) if _S.truth((_n_rim_b20 > 0.35)) else _S.index_value(_n_C,3))))), _n_fade_b2])
						else:
							_S.invoke(_n_p_b0,"blend",[_n_x_b4, _n_y_b3, (_S.index_value(_n_C,6) if _S.truth((_n_flash_b21 if _S.truth(_n_flash_b21) else (_n_hit_b19 > 0.35))) else _S.index_value(_n_C,3)), (_n_fade_b2 * minf(0.85,((0.35 if _S.truth(_n_flash_b21) else (0.1 + ((0.25 * _n_rim_b20) * _n_rim_b20))) + (_n_hit_b19 * 0.65))))])
					if _S.truth(_S.binary("===",_S.binary("&",((_n_x_b4 * 7) + (_n_y_b3 * 3)),15),0)):
						_S.invoke(_n_p_b0,"light",[_n_x_b4, _n_y_b3, _S.index_value(_n_C,4), (0.15 + (0.5 * _n_hit_b19))])
					_n_x_b4 += 1.0
			_n_y_b3 += 1.0
	return null

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.read(_e, "t"), _S.read(_e, "GONE")), func(): return _S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "GONE"), 0.38))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.5]))):
		var _v11 = _S.scope(_e)
		_S.define(_v11, "lon", _S.invoke(_S.read(_v11, "R"), "range", [0, _S.binary("/", _S.prop(_S.read(_v11, "Math"), "PI"), 2)]))
		_S.define(_v11, "lat", _S.invoke(_S.read(_v11, "R"), "range", [0.05, 1.4]))
		var _v12 = _S.call_value(_S.read(_v11, "onDome"), [_S.read(_v11, "lon"), _S.read(_v11, "lat")])
		_S.define(_v11, "x", _S.prop(_v12, 0))
		_S.define(_v11, "y", _S.prop(_v12, 1))
		_S.invoke(_S.read(_v11, "ps"), "spawn", [_S.prop(_S.read(_v11, "P"), "STAR"), _S.read(_v11, "x"), _S.read(_v11, "y"), _S.invoke(_S.read(_v11, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v11, "R"), "range", [10, 40])), _S.invoke(_S.read(_v11, "R"), "range", [0.2, 0.36]), (_S.prop(_S.read(_v11, "C"), 6) if _S.truth(_S.invoke(_S.read(_v11, "R"), "chance", [0.5])) else _S.prop(_S.read(_v11, "C"), 5)), _S.invoke(_S.read(_v11, "R"), "range", [0.6, 1.4])])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f4(_parent,_args:Array,_this=null):
	var _n_dome = _S.read(_parent,"dome")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_dome,[_n_p_b0, true])
	return null

static func _f5(_parent,_args:Array,_this=null):
	var _n_dome = _S.read(_parent,"dome")
	var _n_GONE = _S.read(_parent,"GONE")
	var _n_t = _S.read(_parent,"t")
	var _n_CX = _S.read(_parent,"CX")
	var _n_WHITE = _S.read(_parent,"WHITE")
	var _n_C = _S.read(_parent,"C")
	var _n_RX = _S.read(_parent,"RX")
	var _n_hx = _S.read(_parent,"hx")
	var _n_hy = _S.read(_parent,"hy")
	var _n_sp = _S.read(_parent,"sp")
	var _n_S = _S.read(_parent,"S")
	var _n_star = _S.read(_parent,"star")
	var _n_ps = _S.read(_parent,"ps")
	var _n_RY = _S.read(_parent,"RY")
	var _n_lights = _S.read(_parent,"lights")
	var _n_p_b0 = _S.arg(_args,0)
	_S.call_value(_n_dome,[_n_p_b0, false])
	var _n_fade_b1 = (1 - _S.MathFX.smooth((_n_GONE + 0.3),(_n_GONE + 0.55),_n_t))
	if _S.truth((_n_fade_b1 > 0)):
		if true:
			var _n_x_b2 = _n_CX
			while _S.truth((_n_x_b2 <= (_n_CX + _n_RX))):
				_S.invoke(_n_p_b0,"dot",[_n_x_b2, 0, (_n_WHITE if _S.truth((_n_t < 0.05)) else _S.index_value(_n_C,5)), (_n_fade_b1 * (0.6 + (0.4 * (float((_n_x_b2 - _n_CX))/_n_RX))))])
				_n_x_b2 += 1.0
	if _S.truth((_n_t < 0.03)):
		_S.call_value(_n_star,[_n_p_b0, _n_hx, _n_hy, _n_sp, 1, 1, [_S.index_value(_n_S,3), _S.index_value(_n_S,0), _S.index_value(_n_S,1), _n_WHITE], 1, 2])
	else:
		if _S.truth((_n_t < 0.06)):
			_S.call_value(_n_star,[_n_p_b0, _n_hx, _n_hy, _n_sp, 1.25, 0.55, [_S.index_value(_n_S,3), _S.index_value(_n_S,1), _S.index_value(_n_S,2), _S.index_value(_n_S,0)], 1, 2])
	_S.invoke(_n_ps,"draw",[_n_p_b0])
	_S.invoke(_n_p_b0,"glow",[(_n_CX + (_n_RX * 0.5)), ((-_n_RY) * 0.45), (_n_RY * 0.9), _S.index_value(_n_C,4), ((0.2 * (1 - _S.MathFX.smooth(_n_GONE,(_n_GONE + 0.55),_n_t))) + (0.35 * exp((float((-_n_t))/0.08))))])
	_S.invoke(_n_lights,"draw",[_n_p_b0])
	return null

static func _f6(_parent,_args:Array,_this=null):
	var _n_CX = _S.read(_parent,"CX")
	var _n_RX = _S.read(_parent,"RX")
	var _n_RY = _S.read(_parent,"RY")
	var _n_lon_b0 = _S.arg(_args,0)
	var _n_lat_b1 = _S.arg(_args,1)
	return [(_n_CX + ((_n_RX * cos(_n_lat_b1)) * sin(_n_lon_b0))), ((-_n_RY) * sin(_n_lat_b1))]
	return null
