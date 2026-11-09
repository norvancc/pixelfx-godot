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

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	var _v0 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "t"), _S.read(_e, "T")])
	_S.define(_e, "y", _S.prop(_v0, "y"))
	_S.define(_e, "spin", _S.prop(_v0, "spin"))
	_S.define(_e, "lift", _S.binary("/", _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "y")), _S.read(_e, "HOVER")), 2), 4))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, _S.binary("-", 8, _S.binary("*", _S.read(_e, "lift"), 1.5)), _S.binary("-", 0.75, _S.binary("*", _S.read(_e, "lift"), 0.2))])
	var _v1 = _S.scope(_e)
	_S.define(_v1, "k", 0)
	while _S.truth(_S.binary("<", _S.read(_v1, "k"), 3)):
		var _v2 = _S.scope(_v1)
		_S.define(_v2, "a", _S.binary("+", _S.binary("*", _S.read(_v2, "spin"), 4), _S.binary("/", _S.binary("*", _S.read(_v2, "k"), _S.read(_v2, "TAU")), 3)))
		_S.define(_v2, "x", _S.binary("*", _S.invoke(_S.read(_v2, "Math"), "sin", [_S.read(_v2, "a")]), 9))
		_S.define(_v2, "k2", _S.binary("+", 0.5, _S.binary("*", 0.5, _S.invoke(_S.read(_v2, "Math"), "cos", [_S.read(_v2, "a")]))))
		if _S.truth(_S.binary("<", _S.read(_v2, "k2"), 0.15)):
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "k", 1, "+=", true)
			continue
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.read(_v2, "x"), 0, (_S.prop(_S.read(_v2, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v2, "k2"), 0.7)) else _S.prop(_S.read(_v2, "C"), 5)), _S.binary("*", _S.read(_v2, "k2"), 1.2)])
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("+", _S.read(_v2, "x"), 1), 0, _S.prop(_S.read(_v2, "C"), 4), _S.binary("*", _S.read(_v2, "k2"), 0.8)])
		_S.invoke(_S.read(_v2, "p"), "dot", [_S.binary("-", _S.read(_v2, "x"), 1), 0, _S.prop(_S.read(_v2, "C"), 4), _S.binary("*", _S.read(_v2, "k2"), 0.6)])
		_S.invoke(_S.read(_v2, "p"), "glow", [_S.binary("+", _S.read(_v2, "x"), 0.5), 0, 6, _S.prop(_S.read(_v2, "C"), 5), _S.binary("*", 0.3, _S.read(_v2, "k2"))])
		_v1 = _S.iteration(_v1)
		_S.write(_v1, "k", 1, "+=", true)
	return null

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")))
	var _v3 = _S.call_value(_S.read(_e, "pose"), [_S.read(_e, "t"), _S.read(_e, "T")])
	_S.define(_e, "y", _S.prop(_v3, "y"))
	_S.define(_e, "spin", _S.prop(_v3, "spin"))
	_S.invoke(_S.read(_e, "p"), "glowRing", [0, _S.binary("-", _S.read(_e, "y"), 1), 5, 15, _S.prop(_S.read(_e, "C"), 4), 0.34])
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y"), 26, _S.prop(_S.read(_e, "C"), 3), 0.14])
	_S.define(_e, "hi", _S.call_value(_S.read(_e, "drawGem"), [_S.read(_e, "L"), _S.read(_e, "p"), _S.read(_e, "GEM"), 0, _S.read(_e, "y"), _S.read(_e, "spin"), _S.read(_e, "C"), _S.merge([{"tilt": 0.22}])]))
	_S.define(_e, "f", _S.binary("%", _S.binary("/", _S.binary("*", _S.read(_e, "spin"), 4), _S.read(_e, "TAU")), 1))
	_S.define(_e, "fk", _S.invoke(_S.read(_e, "Math"), "max", [0, _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.read(_e, "f"), 0.5)]), 0.08))]))
	if _S.truth(_S.binary(">", _S.read(_e, "fk"), 0)):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.unary("-", 3), _S.binary("-", _S.read(_e, "y"), 3), _S.binary("*", 3.4, _S.invoke(_S.read(_e, "ease"), "outQuad", [_S.read(_e, "fk")])), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.45, _S.read(_e, "fk"))])
	var _v4 = _S.scope(_e)
	_S.define(_v4, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v4, "i"), 8)):
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "life", 0.4)
		_S.define(_v5, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("-", _S.read(_v5, "t"), _S.binary("*", _S.binary("/", _S.read(_v5, "i"), 8), _S.read(_v5, "T"))), _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "i"), _S.prop(_S.read(_v5, "o"), "seed"), 3]), 0.1)), _S.read(_v5, "T")), _S.read(_v5, "T")), _S.read(_v5, "T")))
		if _S.truth(_S.binary(">", _S.read(_v5, "age"), _S.read(_v5, "life"))):
			_v4 = _S.iteration(_v4)
			_S.write(_v4, "i", 1, "+=", true)
			continue
		_S.define(_v5, "a", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "i"), _S.prop(_S.read(_v5, "o"), "seed"), 1]), _S.read(_v5, "TAU")), _S.binary("*", _S.read(_v5, "i"), 2.4)))
		_S.define(_v5, "d", _S.binary("+", 10, _S.binary("*", _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "i"), _S.prop(_S.read(_v5, "o"), "seed"), 2]), 7)))
		_S.define(_v5, "k", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v5, "age"), _S.read(_v5, "life")), _S.prop(_S.read(_v5, "Math"), "PI"))]))
		_S.call_value(_S.read(_v5, "glint"), [_S.read(_v5, "p"), _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "cos", [_S.read(_v5, "a")]), _S.read(_v5, "d")), _S.binary("-", _S.binary("+", _S.read(_v5, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v5, "Math"), "sin", [_S.read(_v5, "a")]), _S.read(_v5, "d")), 0.8)), _S.binary("*", _S.read(_v5, "age"), 6)), _S.invoke(_S.read(_v5, "Math"), "round", [_S.binary("*", _S.binary("*", 2.4, _S.read(_v5, "k")), _S.binary("+", 0.6, _S.binary("*", 0.4, _S.call_value(_S.read(_v5, "rand"), [_S.read(_v5, "i"), 9]))))]), (_S.prop(_S.read(_v5, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v5, "i"), 3)) else _S.read(_v5, "WHITE")), _S.binary("*", 0.4, _S.read(_v5, "k"))])
		_v4 = _S.iteration(_v4)
		_S.write(_v4, "i", 1, "+=", true)
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "T", _S.arg(_args, 1))
	return _S.merge([{"y": _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 1.8, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.read(_e, "TAU"))])))}, {"spin": _S.binary("*", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")), _S.prop(_S.read(_e, "Math"), "PI"))}])
