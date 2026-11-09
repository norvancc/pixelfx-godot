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

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "t", _S.arg(_args, 1))
	_S.define(_e, "o", _S.arg(_args, 2))
	_S.define(_e, "T", _S.prop(_S.read(_e, "meta"), "duration"))
	_S.define(_e, "ph", _S.binary("/", _S.read(_e, "t"), _S.read(_e, "T")))
	_S.define(_e, "th", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]))))
	_S.call_value(_S.read(_e, "blobShadow"), [_S.read(_e, "p"), 0, _S.binary("+", _S.binary("+", 2.5, _S.binary("*", 4.5, _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])]))), _S.binary("*", 1.5, _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "th")])]))), _S.binary("-", 0.85, _S.binary("*", _S.binary("+", _S.binary("-", _S.unary("-", _S.read(_e, "y")), _S.read(_e, "HOVER")), 2), 0.06))])
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
	_S.define(_e, "th", _S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU")))
	_S.define(_e, "y", _S.binary("-", _S.unary("-", _S.read(_e, "HOVER")), _S.binary("*", 2, _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.read(_e, "ph"), _S.read(_e, "TAU"))]))))
	_S.define(_e, "facing", _S.invoke(_S.read(_e, "Math"), "abs", [_S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "th")])]))
	_S.invoke(_S.read(_e, "p"), "glow", [0, _S.read(_e, "y"), 20, _S.prop(_S.read(_e, "C"), 4), _S.binary("+", 0.3, _S.binary("*", 0.12, _S.read(_e, "facing")))])
	_S.define(_e, "flash", _S.call_value(_S.read(_e, "coin3d"), [_S.read(_e, "L"), _S.read(_e, "p"), 0, _S.read(_e, "y"), _S.read(_e, "R"), _S.read(_e, "TH"), _S.read(_e, "th"), _S.read(_e, "C")]))
	_S.invoke(_S.read(_e, "p"), "glow", [_S.unary("-", 1), _S.binary("-", _S.read(_e, "y"), 1), 12, _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.35, _S.read(_e, "flash"))])
	if _S.truth(_S.binary(">", _S.read(_e, "flash"), 0.3)):
		_S.call_value(_S.read(_e, "glint"), [_S.read(_e, "p"), _S.unary("-", 4), _S.binary("-", _S.read(_e, "y"), 4), _S.binary("+", 1, _S.binary("*", 3.2, _S.read(_e, "flash"))), _S.prop(_S.read(_e, "C"), 6), _S.binary("*", 0.5, _S.read(_e, "flash"))])
	var _v0 = _S.scope(_e)
	_S.define(_v0, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "i"), 5)):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "life", 0.35)
		_S.define(_v1, "age", _S.binary("%", _S.binary("+", _S.binary("%", _S.binary("-", _S.binary("-", _S.read(_v1, "t"), _S.binary("*", _S.binary("/", _S.read(_v1, "i"), 5), _S.read(_v1, "T"))), _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.prop(_S.read(_v1, "o"), "seed"), 3]), 0.08)), _S.read(_v1, "T")), _S.read(_v1, "T")), _S.read(_v1, "T")))
		if _S.truth(_S.binary(">", _S.read(_v1, "age"), _S.read(_v1, "life"))):
			_v0 = _S.iteration(_v0)
			_S.write(_v0, "i", 1, "+=", true)
			continue
		_S.define(_v1, "a", _S.binary("+", _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.prop(_S.read(_v1, "o"), "seed"), 1]), _S.read(_v1, "TAU")), _S.binary("*", _S.read(_v1, "i"), 2.1)))
		_S.define(_v1, "d", _S.binary("+", 10, _S.binary("*", _S.call_value(_S.read(_v1, "rand"), [_S.read(_v1, "i"), _S.prop(_S.read(_v1, "o"), "seed"), 2]), 5)))
		_S.define(_v1, "k", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.binary("*", _S.binary("/", _S.read(_v1, "age"), _S.read(_v1, "life")), _S.prop(_S.read(_v1, "Math"), "PI"))]))
		_S.call_value(_S.read(_v1, "glint"), [_S.read(_v1, "p"), _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "cos", [_S.read(_v1, "a")]), _S.read(_v1, "d")), _S.binary("-", _S.binary("+", _S.read(_v1, "y"), _S.binary("*", _S.binary("*", _S.invoke(_S.read(_v1, "Math"), "sin", [_S.read(_v1, "a")]), _S.read(_v1, "d")), 0.85)), _S.binary("*", _S.read(_v1, "age"), 8)), _S.invoke(_S.read(_v1, "Math"), "round", [_S.binary("*", 2, _S.read(_v1, "k"))]), (_S.prop(_S.read(_v1, "C"), 6) if _S.truth(_S.binary("%", _S.read(_v1, "i"), 2)) else _S.read(_v1, "WHITE")), _S.binary("*", 0.35, _S.read(_v1, "k"))])
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "i", 1, "+=", true)
	return null
