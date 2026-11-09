@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX fx/spawn/shatter-death.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
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
	_S.define(_e, "crystal", _S.import_value("core/index.js", "crystal"))
	_S.define(_e, "sparkle", _S.import_value("core/index.js", "sparkle"))
	_S.define(_e, "clamp", _S.import_value("core/index.js", "clamp"))
	_S.define(_e, "smooth", _S.import_value("core/index.js", "smooth"))
	_S.define(_e, "ease", _S.import_value("core/index.js", "ease"))
	_S.define(_e, "rand", _S.import_value("core/index.js", "rand"))
	_S.define(_e, "TAU", _S.import_value("core/index.js", "TAU"))
	_S.define(_e, "WHITE", _S.import_value("core/index.js", "WHITE"))
	_S.define(_e, "mix", _S.import_value("core/index.js", "mix"))
	_S.define(_e, "READY", _S.import_value("core/index.js", "READY"))
	_S.define(_e, "bodyOf", _S.import_value("fx/spawn/_lib.js", "bodyOf"))
	_S.define(_e, "create", _S.function_value(_e, "_f0"))
	_S.define(_e, "meta", _S.merge([{"name": "Shatter death"}, {"desc": "Frost races up the body and seals it in faceted ice, a glint sweeps it, cracks spread from the chest, then it bursts into its own facets that tumble, bounce and melt."}, {"tags": ["spawn", "death", "ice", "freeze", "shatter", "shards", "one-shot"]}, {"size": [172, 96]}, {"origin": [84, 84]}, {"duration": 3.3}, {"loop": false}, {"fps": 30}, {"bg": "ground"}, {"actor": 2}, {"options": _S.merge([{"palette": ["#0e1636", "#1a2f66", "#2557a3", "#3488d6", "#5fc0f0", "#a2e6ff", "#dcf8ff", "#ffffff"]}, {"seed": 14}])}]))
	_exports["meta"] = _S.read(_e, "meta")
	_S.define(_e, "FEAR", _S.merge([{"turn": 0.9}, {"lean": _S.unary("-", 2)}, {"crouch": 2}, {"fx": _S.unary("-", 9)}, {"fy": _S.unary("-", 31)}, {"bx": 9}, {"by": _S.unary("-", 31)}, {"ffx": _S.unary("-", 3)}, {"fbx": 4}]))
	_S.define(_e, "act", _S.merge([{"onBody": true}, {"poses": [[_S.unary("-", 0.2), _S.read(_e, "READY")], [0.08, _S.read(_e, "FEAR"), "snap"], [0.3, _S.merge([_S.read(_e, "FEAR"), {"lean": _S.unary("-", 3)}, {"fy": _S.unary("-", 34)}])], [0.5, _S.read(_e, "FEAR")], [3.3, _S.read(_e, "FEAR")]]}, {"hits": [_S.merge([{"t": 0.5}, {"stop": 0.02}, {"shake": 0.06}, {"amp": 1}]), _S.merge([{"t": 1.4}, {"stop": 0.09}, {"shake": 0.26}, {"amp": 3}])]}]))
	_exports["act"] = _S.read(_e, "act")
	_S.define(_e, "LOCK", 0.5)
	_S.define(_e, "CRACK", 1.05)
	_S.define(_e, "BURST", 1.4)
	_S.define(_e, "actorAlpha", _S.function_value(_e, "_f12"))
	_exports["actorAlpha"] = _S.read(_e, "actorAlpha")
	_exports["create"] = _S.read(_e, "create")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "o", _S.arg(_args, 0))
	_S.define(_e, "shatter", _S.function_value(_e, "_f1"))
	_S.define(_e, "C", _S.call_value(_S.read(_e, "fit"), [_S.prop(_S.read(_e, "o"), "palette"), 8]))
	_S.define(_e, "R", _S.construct(_S.read(_e, "Rng"), [_S.prop(_S.read(_e, "o"), "seed")]))
	_S.define(_e, "floor", _S.function_value(_e, "_f3"))
	_S.define(_e, "body", _S.call_value(_S.read(_e, "bodyOf"), [_S.prop(_S.read(_e, "o"), "actor"), _S.read(_e, "C")]))
	_S.define(_e, "W", _S.binary("+", _S.prop(_S.read(_e, "body"), "w"), 2))
	_S.define(_e, "H", _S.binary("+", _S.prop(_S.read(_e, "body"), "h"), 1))
	_S.define(_e, "X0", _S.binary("-", _S.prop(_S.read(_e, "body"), "x"), 1))
	_S.define(_e, "Y0", _S.binary("-", _S.prop(_S.read(_e, "body"), "y"), 1))
	_S.define(_e, "ice", _S.invoke(_S.construct(_S.read(_e, "Int16Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]), "fill", [_S.unary("-", 1)]))
	_S.define(_e, "col", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "glass", _S.construct(_S.read(_e, "Uint32Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "solid", _S.construct(_S.read(_e, "Uint8Array"), [_S.binary("*", _S.read(_e, "W"), _S.read(_e, "H"))]))
	_S.define(_e, "inBody", _S.function_value(_e, "_f4"))
	var _v17 = _S.scope(_e)
	_S.define(_v17, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v17, "y"), _S.read(_v17, "H"))):
		var _v18 = _S.scope(_v17)
		_S.define(_v18, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v18, "x"), _S.read(_v18, "W"))):
			var _v19 = _S.scope(_v18)
			_S.define(_v19, "mx", _S.binary("-", _S.read(_v19, "x"), 1))
			_S.define(_v19, "my", _S.binary("-", _S.read(_v19, "y"), 1))
			if _S.truth(_S.logical("||", _S.call_value(_S.read(_v19, "inBody"), [_S.read(_v19, "mx"), _S.read(_v19, "my")]), func(): return _S.logical("&&", _S.binary("<", _S.read(_v19, "my"), _S.binary("-", _S.prop(_S.read(_v19, "body"), "h"), 1)), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v19, "inBody"), [_S.binary("-", _S.read(_v19, "mx"), 1), _S.read(_v19, "my")]), func(): return _S.call_value(_S.read(_v19, "inBody"), [_S.binary("+", _S.read(_v19, "mx"), 1), _S.read(_v19, "my")])), func(): return _S.call_value(_S.read(_v19, "inBody"), [_S.read(_v19, "mx"), _S.binary("-", _S.read(_v19, "my"), 1)])), func(): return _S.call_value(_S.read(_v19, "inBody"), [_S.read(_v19, "mx"), _S.binary("+", _S.read(_v19, "my"), 1)]))))):
				_S.set_prop(_S.read(_v19, "ice"), _S.binary("+", _S.binary("*", _S.read(_v19, "y"), _S.read(_v19, "W")), _S.read(_v19, "x")), 0, "=", false)
			_v18 = _S.iteration(_v18)
			_S.write(_v18, "x", 1, "+=", true)
		_v17 = _S.iteration(_v17)
		_S.write(_v17, "y", 1, "+=", true)
	_S.define(_e, "seeds", [])
	var _v20 = _S.scope(_e)
	_S.define(_v20, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v20, "i"), 22)):
		var _v21 = _S.scope(_v20)
		_S.define(_v21, "x", null)
		_S.define(_v21, "y", null)
		_S.define(_v21, "tries", 0)
		while true:
			_S.last([_S.write(_v21, "x", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "W")]), "=", false), _S.write(_v21, "y", _S.invoke(_S.read(_v21, "R"), "range", [0, _S.read(_v21, "H")]), "=", false)])
			if not _S.truth(_S.logical("&&", _S.binary("<", _S.prop(_S.read(_v21, "ice"), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_v21, "Math"), "floor", [_S.read(_v21, "y")]), _S.read(_v21, "W")), _S.invoke(_S.read(_v21, "Math"), "floor", [_S.read(_v21, "x")]))), 0), func(): return _S.binary("<", _S.write(_v21, "tries", 1, "+=", false), 40))): break
		_S.invoke(_S.read(_v21, "seeds"), "push", [[_S.read(_v21, "x"), _S.read(_v21, "y")]])
		_v20 = _S.iteration(_v20)
		_S.write(_v20, "i", 1, "+=", true)
	_S.define(_e, "at", _S.function_value(_e, "_f5"))
	var _v22 = _S.scope(_e)
	_S.define(_v22, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v22, "y"), _S.read(_v22, "H"))):
		var _v23 = _S.scope(_v22)
		_S.define(_v23, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v23, "x"), _S.read(_v23, "W"))):
			var _v24 = _S.scope(_v23)
			_S.define(_v24, "i", _S.binary("+", _S.binary("*", _S.read(_v24, "y"), _S.read(_v24, "W")), _S.read(_v24, "x")))
			if _S.truth(_S.binary("<", _S.prop(_S.read(_v24, "ice"), _S.read(_v24, "i")), 0)):
				_v23 = _S.iteration(_v23)
				_S.write(_v23, "x", 1, "+=", true)
				continue
			_S.define(_v24, "d1", 1000000000)
			_S.define(_v24, "d2", 1000000000)
			_S.define(_v24, "k", 0)
			_S.invoke(_S.read(_v24, "seeds"), "forEach", [_S.function_value(_v24, "_f6")])
			_S.set_prop(_S.read(_v24, "ice"), _S.read(_v24, "i"), _S.read(_v24, "k"), "=", false)
			var _v26 = _S.prop(_S.read(_v24, "seeds"), _S.read(_v24, "k"))
			_S.define(_v24, "sx", _S.prop(_v26, 0))
			_S.define(_v24, "sy", _S.prop(_v26, 1))
			_S.define(_v24, "lit", _S.call_value(_S.read(_v24, "clamp"), [_S.binary("-", _S.binary("-", _S.binary("+", 0.55, _S.binary("*", 0.35, _S.binary("-", _S.call_value(_S.read(_v24, "rand"), [_S.read(_v24, "k"), 41]), 0.5))), _S.binary("*", 0.5, _S.binary("/", _S.binary("-", _S.read(_v24, "sx"), _S.binary("/", _S.read(_v24, "W"), 2)), _S.read(_v24, "W")))), _S.binary("*", 0.55, _S.binary("/", _S.binary("-", _S.read(_v24, "sy"), _S.binary("/", _S.read(_v24, "H"), 2)), _S.read(_v24, "H"))))]))
			_S.define(_v24, "own", _S.prop(_S.invoke(_S.read(_v24, "body"), "cell", [_S.binary("-", _S.read(_v24, "x"), 1), _S.binary("-", _S.read(_v24, "y"), 1)]), "c"))
			_S.set_prop(_S.read(_v24, "col"), _S.read(_v24, "i"), (_S.call_value(_S.read(_v24, "mix"), [_S.read(_v24, "own"), _S.prop(_S.read(_v24, "C"), 4), 0.36]) if _S.truth(_S.read(_v24, "own")) else _S.prop(_S.read(_v24, "C"), 3)), "=", false)
			_S.set_prop(_S.read(_v24, "glass"), _S.read(_v24, "i"), _S.prop(_S.read(_v24, "C"), _S.binary("+", 3, _S.invoke(_S.read(_v24, "Math"), "min", [2, _S.invoke(_S.read(_v24, "Math"), "floor", [_S.binary("*", _S.read(_v24, "lit"), 3)])]))), "=", false)
			_S.define(_v24, "sc", 0)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.binary("-", _S.read(_v24, "d2"), _S.read(_v24, "d1")), 0.42), func(): return _S.unary("!", _S.read(_v24, "own")))):
				_S.write(_v24, "sc", (_S.prop(_S.read(_v24, "C"), 6) if _S.truth(_S.binary(">", _S.read(_v24, "lit"), 0.5)) else _S.prop(_S.read(_v24, "C"), 5)), "=", false)
			else:
				if _S.truth(_S.binary("<", _S.binary("-", _S.read(_v24, "d2"), _S.read(_v24, "d1")), 0.42)):
					_S.set_prop(_S.read(_v24, "col"), _S.read(_v24, "i"), _S.call_value(_S.read(_v24, "mix"), [_S.prop(_S.read(_v24, "col"), _S.read(_v24, "i")), _S.prop(_S.read(_v24, "C"), 6), 0.45]), "=", false)
			if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_v24, "at"), [_S.binary("-", _S.read(_v24, "x"), 1), _S.read(_v24, "y")])), func(): return _S.unary("!", _S.call_value(_S.read(_v24, "at"), [_S.read(_v24, "x"), _S.binary("-", _S.read(_v24, "y"), 1)])))):
				_S.write(_v24, "sc", _S.prop(_S.read(_v24, "C"), 6), "=", false)
			if _S.truth(_S.logical("||", _S.unary("!", _S.call_value(_S.read(_v24, "at"), [_S.binary("+", _S.read(_v24, "x"), 1), _S.read(_v24, "y")])), func(): return _S.logical("&&", _S.unary("!", _S.call_value(_S.read(_v24, "at"), [_S.read(_v24, "x"), _S.binary("+", _S.read(_v24, "y"), 1)])), func(): return _S.binary("<", _S.read(_v24, "y"), _S.binary("-", _S.read(_v24, "H"), 1))))):
				_S.write(_v24, "sc", _S.prop(_S.read(_v24, "C"), 3), "=", false)
			if _S.truth(_S.read(_v24, "sc")):
				_S.last([_S.set_prop(_S.read(_v24, "col"), _S.read(_v24, "i"), _S.read(_v24, "sc"), "=", false), _S.set_prop(_S.read(_v24, "solid"), _S.read(_v24, "i"), 1, "=", false)])
			_v23 = _S.iteration(_v23)
			_S.write(_v23, "x", 1, "+=", true)
		_v22 = _S.iteration(_v22)
		_S.write(_v22, "y", 1, "+=", true)
	_S.define(_e, "spikes", [])
	var _v27 = _S.scope(_e)
	_S.define(_v27, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v27, "i"), 7)):
		var _v28 = _S.scope(_v27)
		_S.define(_v28, "x", _S.invoke(_S.read(_v28, "R"), "int", [1, _S.binary("-", _S.read(_v28, "W"), 2)]))
		_S.define(_v28, "y0", _S.invoke(_S.read(_v28, "R"), "int", [2, _S.binary("-", _S.read(_v28, "H"), 3)]))
		_S.define(_v28, "y", _S.read(_v28, "y0"))
		while _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v28, "y"), 0), func(): return _S.call_value(_S.read(_v28, "at"), [_S.read(_v28, "x"), _S.binary("-", _S.read(_v28, "y"), 1)]))):
			_S.write(_v28, "y", 1, "-=", true)
		if _S.truth(_S.call_value(_S.read(_v28, "at"), [_S.read(_v28, "x"), _S.read(_v28, "y")])):
			_S.invoke(_S.read(_v28, "spikes"), "push", [_S.merge([{"x": _S.binary("+", _S.binary("+", _S.read(_v28, "X0"), _S.read(_v28, "x")), 0.5)}, {"base": _S.binary("+", _S.binary("+", _S.read(_v28, "Y0"), _S.read(_v28, "y")), 1)}, {"h": _S.invoke(_S.read(_v28, "R"), "range", [3, 6])}, {"w": _S.invoke(_S.read(_v28, "R"), "range", [2.5, 3.5])}, {"lean": _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 2.5), 2.5])}, {"at": _S.binary("+", _S.read(_v28, "LOCK"), _S.invoke(_S.read(_v28, "R"), "range", [_S.unary("-", 0.02), 0.08]))}])])
		_v27 = _S.iteration(_v27)
		_S.write(_v27, "i", 1, "+=", true)
	for _v29 in _S.array([_S.unary("-", 1), 1]):
		var _v30 = _S.scope(_e)
		_S.define(_v30, "sd", _v29)
		var _v31 = _S.scope(_v30)
		_S.define(_v31, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v31, "i"), 2)):
			var _v32 = _S.scope(_v31)
			_S.define(_v32, "h", (_S.invoke(_S.read(_v32, "R"), "range", [5, 7]) if _S.truth(_S.read(_v32, "i")) else _S.invoke(_S.read(_v32, "R"), "range", [8, 11])))
			_S.invoke(_S.read(_v32, "spikes"), "push", [_S.merge([{"x": _S.binary("*", _S.read(_v32, "sd"), (_S.invoke(_S.read(_v32, "R"), "range", [11, 13]) if _S.truth(_S.read(_v32, "i")) else _S.invoke(_S.read(_v32, "R"), "range", [7, 9])))}, {"base": 0}, {"h": _S.read(_v32, "h")}, {"w": (3.5 if _S.truth(_S.read(_v32, "i")) else 4.5)}, {"lean": _S.binary("*", _S.binary("*", _S.read(_v32, "sd"), _S.read(_v32, "h")), _S.invoke(_S.read(_v32, "R"), "range", [0.25, 0.45]))}, {"at": _S.invoke(_S.read(_v32, "R"), "range", [0.08, 0.2])}])])
			_v31 = _S.iteration(_v31)
			_S.write(_v31, "i", 1, "+=", true)
	_S.define(_e, "IX", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "W"), 0.48)]))
	_S.define(_e, "IY", _S.invoke(_S.read(_e, "Math"), "round", [_S.binary("*", _S.read(_e, "H"), 0.42)]))
	_S.define(_e, "cracks", [])
	_S.define(_e, "walk", _S.function_value(_e, "_f7"))
	var _v35 = _S.scope(_e)
	_S.define(_v35, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v35, "i"), 7)):
		_S.call_value(_S.read(_v35, "walk"), [_S.read(_v35, "IX"), _S.read(_v35, "IY"), _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v35, "i"), 7), _S.read(_v35, "TAU")), _S.invoke(_S.read(_v35, "R"), "range", [_S.unary("-", 0.3), 0.3])), 20])
		_v35 = _S.iteration(_v35)
		_S.write(_v35, "i", 1, "+=", true)
	_S.define(_e, "ps", _S.construct(_S.read(_e, "Particles"), [_S.merge([{"rng": _S.read(_e, "R")}, {"ground": _S.read(_e, "floor")}, {"sparks": [_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6), _S.prop(_S.read(_e, "C"), 5), _S.prop(_S.read(_e, "C"), 4)]}, {"haze": _S.prop(_S.read(_e, "C"), 5)}])]))
	_S.define(_e, "bits", _S.construct(_S.read(_e, "Bits"), [_S.merge([{"ground": _S.read(_e, "floor")}])]))
	_S.define(_e, "lights", _S.construct(_S.read(_e, "Lights"), []))
	_S.define(_e, "pieces", [])
	_S.define(_e, "rime", [])
	_S.define(_e, "t", 0)
	_S.define(_e, "locked", false)
	_S.define(_e, "cracked", false)
	_S.define(_e, "burst", false)
	_S.define(_e, "level", _S.function_value(_e, "_f8"))
	return _S.merge([{"update": _S.function_value(_e, "_f9")}, {"drawBack": _S.function_value(_e, "_f10")}, {"draw": _S.function_value(_e, "_f11")}])

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "cells", _S.construct(_S.read(_e, "Map"), []))
	var _v0 = _S.scope(_e)
	_S.define(_v0, "y", 0)
	while _S.truth(_S.binary("<", _S.read(_v0, "y"), _S.read(_v0, "H"))):
		var _v1 = _S.scope(_v0)
		_S.define(_v1, "x", 0)
		while _S.truth(_S.binary("<", _S.read(_v1, "x"), _S.read(_v1, "W"))):
			var _v2 = _S.scope(_v1)
			_S.define(_v2, "k", _S.prop(_S.read(_v2, "ice"), _S.binary("+", _S.binary("*", _S.read(_v2, "y"), _S.read(_v2, "W")), _S.read(_v2, "x"))))
			if _S.truth(_S.binary("<", _S.read(_v2, "k"), 0)):
				_v1 = _S.iteration(_v1)
				_S.write(_v1, "x", 1, "+=", true)
				continue
			if _S.truth(_S.unary("!", _S.invoke(_S.read(_v2, "cells"), "has", [_S.read(_v2, "k")]))):
				_S.invoke(_S.read(_v2, "cells"), "set", [_S.read(_v2, "k"), []])
			_S.define(_v2, "i", _S.binary("+", _S.binary("*", _S.read(_v2, "y"), _S.read(_v2, "W")), _S.read(_v2, "x")))
			_S.invoke(_S.invoke(_S.read(_v2, "cells"), "get", [_S.read(_v2, "k")]), "push", [[_S.read(_v2, "x"), _S.read(_v2, "y"), (_S.prop(_S.read(_v2, "col"), _S.read(_v2, "i")) if _S.truth(_S.prop(_S.read(_v2, "solid"), _S.read(_v2, "i"))) else _S.call_value(_S.read(_v2, "mix"), [_S.prop(_S.read(_v2, "col"), _S.read(_v2, "i")), _S.prop(_S.read(_v2, "glass"), _S.read(_v2, "i")), 0.3]))]])
			_v1 = _S.iteration(_v1)
			_S.write(_v1, "x", 1, "+=", true)
		_v0 = _S.iteration(_v0)
		_S.write(_v0, "y", 1, "+=", true)
	for _v3 in _S.array(_S.invoke(_S.read(_e, "cells"), "values", [])):
		var _v4 = _S.scope(_e)
		_S.define(_v4, "px", _v3)
		var _v5 = _S.scope(_v4)
		_S.define(_v5, "cx", 0)
		_S.define(_v5, "cy", 0)
		for _v6 in _S.array(_S.read(_v5, "px")):
			var _v7 = _S.scope(_v5)
			var _v8 = _v6
			_S.define(_v7, "x", _S.prop(_v8, 0))
			_S.define(_v7, "y", _S.prop(_v8, 1))
			_S.last([_S.write(_v7, "cx", _S.binary("+", _S.read(_v7, "x"), 0.5), "+=", false), _S.write(_v7, "cy", _S.binary("+", _S.read(_v7, "y"), 0.5), "+=", false)])
		_S.last([_S.write(_v5, "cx", _S.prop(_S.read(_v5, "px"), "length"), "/=", false), _S.write(_v5, "cy", _S.prop(_S.read(_v5, "px"), "length"), "/=", false)])
		_S.define(_v5, "map", _S.construct(_S.read(_v5, "Map"), []))
		_S.define(_v5, "r", _S.binary("+", _S.invoke(_S.read(_v5, "Math"), "max", _S.concat([_S.array(_S.invoke(_S.read(_v5, "px"), "map", [_S.function_value(_v5, "_f2")]))])), 1))
		for _v10 in _S.array(_S.read(_v5, "px")):
			var _v11 = _S.scope(_v5)
			var _v12 = _v10
			_S.define(_v11, "x", _S.prop(_v12, 0))
			_S.define(_v11, "y", _S.prop(_v12, 1))
			_S.define(_v11, "c", _S.prop(_v12, 2))
			_S.invoke(_S.read(_v11, "map"), "set", [("" + _S.string(_S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v11, "x"), 0.5), _S.read(_v11, "cx"))])) + "," + _S.string(_S.invoke(_S.read(_v11, "Math"), "round", [_S.binary("-", _S.binary("+", _S.read(_v11, "y"), 0.5), _S.read(_v11, "cy"))])) + ""), _S.read(_v11, "c")])
		_S.define(_v5, "dx", _S.binary("-", _S.read(_v5, "cx"), _S.read(_v5, "IX")))
		_S.define(_v5, "dy", _S.binary("-", _S.read(_v5, "cy"), _S.read(_v5, "IY")))
		_S.define(_v5, "d", _S.logical("||", _S.invoke(_S.read(_v5, "Math"), "hypot", [_S.read(_v5, "dx"), _S.read(_v5, "dy")]), func(): return 1))
		_S.define(_v5, "sp", _S.invoke(_S.read(_v5, "R"), "range", [55, 115]))
		_S.define(_v5, "life", _S.invoke(_S.read(_v5, "R"), "range", [1.3, 1.85]))
		_S.invoke(_S.read(_v5, "pieces"), "push", [_S.merge([{"id": _S.binary("+", _S.prop(_S.read(_v5, "pieces"), "length"), 1)}, {"x": _S.binary("+", _S.read(_v5, "X0"), _S.read(_v5, "cx"))}, {"y": _S.binary("+", _S.read(_v5, "Y0"), _S.read(_v5, "cy"))}, {"vx": _S.binary("+", _S.binary("*", _S.binary("/", _S.read(_v5, "dx"), _S.read(_v5, "d")), _S.read(_v5, "sp")), _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 18), 18]))}, {"vy": _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("/", _S.read(_v5, "dy"), _S.read(_v5, "d")), _S.read(_v5, "sp")), 0.6), _S.invoke(_S.read(_v5, "R"), "range", [110, 220]))}, {"a": 0}, {"va": _S.invoke(_S.read(_v5, "R"), "range", [_S.unary("-", 9), 9])}, {"r": _S.read(_v5, "r")}, {"map": _S.read(_v5, "map")}, {"life": _S.read(_v5, "life")}, {"max": _S.read(_v5, "life")}, {"rest": false}, {"n": _S.prop(_S.read(_v5, "px"), "length")}])])
	var _v13 = _S.scope(_e)
	_S.define(_v13, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v13, "i"), 64)):
		var _v14 = _S.scope(_v13)
		_S.define(_v14, "a", _S.binary("+", _S.binary("/", _S.unary("-", _S.prop(_S.read(_v14, "Math"), "PI")), 2), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 1.45), 1.45])))
		_S.define(_v14, "sp", _S.invoke(_S.read(_v14, "R"), "range", [60, 180]))
		_S.invoke(_S.read(_v14, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v14, "B"), "SHARD")}, {"x": _S.binary("+", _S.binary("+", _S.read(_v14, "X0"), _S.read(_v14, "IX")), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 6), 6]))}, {"y": _S.binary("+", _S.binary("+", _S.read(_v14, "Y0"), _S.read(_v14, "IY")), _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 8), 8]))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "cos", [_S.read(_v14, "a")]), _S.read(_v14, "sp"))}, {"vy": _S.binary("*", _S.invoke(_S.read(_v14, "Math"), "sin", [_S.read(_v14, "a")]), _S.read(_v14, "sp"))}, {"g": 0.85}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v14, "R"), "range", [0.9, 1.6])}, {"a": _S.invoke(_S.read(_v14, "R"), "range", [0, _S.read(_v14, "TAU")])}, {"va": _S.invoke(_S.read(_v14, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v14, "R"), "range", [1.5, 3.2])}, {"c": _S.invoke(_S.read(_v14, "R"), "pick", [[_S.prop(_S.read(_v14, "C"), 7), _S.prop(_S.read(_v14, "C"), 6), _S.prop(_S.read(_v14, "C"), 5)]])}])])
		_v13 = _S.iteration(_v13)
		_S.write(_v13, "i", 1, "+=", true)
	var _v15 = _S.scope(_e)
	_S.define(_v15, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v15, "i"), 14)):
		_S.invoke(_S.read(_v15, "ps"), "spawn", [_S.prop(_S.read(_v15, "P"), "VAPOUR"), _S.invoke(_S.read(_v15, "R"), "range", [_S.unary("-", 10), 10]), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [1, 20])), _S.binary("*", _S.invoke(_S.read(_v15, "R"), "sign", []), _S.invoke(_S.read(_v15, "R"), "range", [20, 80])), _S.unary("-", _S.invoke(_S.read(_v15, "R"), "range", [4, 20])), _S.invoke(_S.read(_v15, "R"), "range", [0.6, 1.1]), (_S.prop(_S.read(_v15, "C"), 6) if _S.truth(_S.invoke(_S.read(_v15, "R"), "chance", [0.5])) else _S.prop(_S.read(_v15, "C"), 5)), _S.invoke(_S.read(_v15, "R"), "range", [2.5, 4.5])])
		_v15 = _S.iteration(_v15)
		_S.write(_v15, "i", 1, "+=", true)
	var _v16 = _S.scope(_e)
	_S.define(_v16, "i", 0)
	while _S.truth(_S.binary("<", _S.read(_v16, "i"), 16)):
		_S.invoke(_S.read(_v16, "ps"), "spawn", [_S.prop(_S.read(_v16, "P"), "STAR"), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 16), 16]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [4, 38])), _S.invoke(_S.read(_v16, "R"), "range", [_S.unary("-", 40), 40]), _S.unary("-", _S.invoke(_S.read(_v16, "R"), "range", [10, 60])), _S.invoke(_S.read(_v16, "R"), "range", [0.4, 1]), _S.invoke(_S.read(_v16, "R"), "pick", [[_S.read(_v16, "WHITE"), _S.prop(_S.read(_v16, "C"), 6)]]), _S.invoke(_S.read(_v16, "R"), "range", [1, 2.4])])
		_v16 = _S.iteration(_v16)
		_S.write(_v16, "i", 1, "+=", true)
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("+", _S.read(_e, "Y0"), _S.read(_e, "IY")), 46, _S.read(_e, "WHITE"), 0.75, 0.14])
	_S.invoke(_S.read(_e, "lights"), "add", [0, _S.binary("+", _S.read(_e, "Y0"), _S.read(_e, "IY")), 70, _S.prop(_S.read(_e, "C"), 4), 0.6, 0.5])
	return null

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v9 = _S.arg(_args, 0)
	_S.define(_e, "x", _S.prop(_v9, 0))
	_S.define(_e, "y", _S.prop(_v9, 1))
	return _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.binary("+", _S.read(_e, "x"), 0.5), _S.read(_e, "cx")), _S.binary("-", _S.binary("+", _S.read(_e, "y"), 0.5), _S.read(_e, "cy"))])

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	return 0

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "mx", _S.arg(_args, 0))
	_S.define(_e, "my", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "body"), "on", [_S.read(_e, "mx"), _S.read(_e, "my")])

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	return _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.logical("&&", _S.binary(">=", _S.read(_e, "x"), 0), func(): return _S.binary(">=", _S.read(_e, "y"), 0)), func(): return _S.binary("<", _S.read(_e, "x"), _S.read(_e, "W"))), func(): return _S.binary("<", _S.read(_e, "y"), _S.read(_e, "H"))), func(): return _S.binary(">=", _S.prop(_S.read(_e, "ice"), _S.binary("+", _S.binary("*", _S.read(_e, "y"), _S.read(_e, "W")), _S.read(_e, "x"))), 0))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	var _v25 = _S.arg(_args, 0)
	_S.define(_e, "sx", _S.prop(_v25, 0))
	_S.define(_e, "sy", _S.prop(_v25, 1))
	_S.define(_e, "j", _S.arg(_args, 1))
	_S.define(_e, "d", _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.binary("+", _S.read(_e, "x"), 0.5), _S.read(_e, "sx")), _S.binary("*", _S.binary("-", _S.binary("+", _S.read(_e, "y"), 0.5), _S.read(_e, "sy")), 0.85)]))
	if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.read(_e, "d1"))):
		_S.last([_S.write(_e, "d2", _S.read(_e, "d1"), "=", false), _S.write(_e, "d1", _S.read(_e, "d"), "=", false), _S.write(_e, "k", _S.read(_e, "j"), "=", false)])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "d"), _S.read(_e, "d2"))):
			_S.write(_e, "d2", _S.read(_e, "d"), "=", false)
	return null

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "a", _S.arg(_args, 2))
	_S.define(_e, "len", _S.arg(_args, 3))
	_S.define(_e, "pts", [[_S.read(_e, "x"), _S.read(_e, "y")]])
	var _v33 = _S.scope(_e)
	_S.define(_v33, "s", 0)
	while _S.truth(_S.binary("<", _S.read(_v33, "s"), _S.read(_v33, "len"))):
		var _v34 = _S.scope(_v33)
		_S.write(_v34, "a", _S.invoke(_S.read(_v34, "R"), "range", [_S.unary("-", 0.5), 0.5]), "+=", false)
		_S.write(_v34, "x", _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "cos", [_S.read(_v34, "a")]), _S.invoke(_S.read(_v34, "R"), "range", [1.4, 2.4])), "+=", false)
		_S.write(_v34, "y", _S.binary("*", _S.invoke(_S.read(_v34, "Math"), "sin", [_S.read(_v34, "a")]), _S.invoke(_S.read(_v34, "R"), "range", [1.4, 2.4])), "+=", false)
		if _S.truth(_S.unary("!", _S.call_value(_S.read(_v34, "at"), [_S.invoke(_S.read(_v34, "Math"), "floor", [_S.read(_v34, "x")]), _S.invoke(_S.read(_v34, "Math"), "floor", [_S.read(_v34, "y")])]))):
			break
		_S.invoke(_S.read(_v34, "pts"), "push", [[_S.read(_v34, "x"), _S.read(_v34, "y")]])
		if _S.truth(_S.logical("&&", _S.logical("&&", _S.binary(">", _S.prop(_S.read(_v34, "pts"), "length"), 3), func(): return _S.binary("<", _S.prop(_S.read(_v34, "cracks"), "length"), 18)), func(): return _S.invoke(_S.read(_v34, "R"), "chance", [0.15]))):
			_S.call_value(_S.read(_v34, "walk"), [_S.read(_v34, "x"), _S.read(_v34, "y"), _S.binary("+", _S.read(_v34, "a"), _S.binary("*", _S.invoke(_S.read(_v34, "R"), "sign", []), _S.invoke(_S.read(_v34, "R"), "range", [0.6, 1.1]))), _S.binary("/", _S.read(_v34, "len"), 2)])
		_v33 = _S.iteration(_v33)
		_S.write(_v33, "s", 1, "+=", true)
	_S.invoke(_S.read(_e, "cracks"), "push", [_S.read(_e, "pts")])
	return null

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "H"), _S.binary("-", 1, _S.invoke(_S.read(_e, "ease"), "outCubic", [_S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.read(_e, "t"), _S.read(_e, "LOCK"))])])))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "dt", _S.arg(_args, 0))
	_S.write(_e, "t", _S.read(_e, "dt"), "+=", false)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "LOCK"))):
		var _v36 = _S.scope(_e)
		_S.define(_v36, "y", _S.binary("+", _S.read(_v36, "Y0"), _S.call_value(_S.read(_v36, "level"), [_S.read(_v36, "t")])))
		if _S.truth(_S.invoke(_S.read(_v36, "R"), "chance", [0.7])):
			_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "STAR"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 10), 10]), _S.read(_v36, "y"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [0, 18])), _S.invoke(_S.read(_v36, "R"), "range", [0.25, 0.5]), (_S.read(_v36, "WHITE") if _S.truth(_S.invoke(_S.read(_v36, "R"), "chance", [0.5])) else _S.prop(_S.read(_v36, "C"), 6)), _S.invoke(_S.read(_v36, "R"), "range", [0.8, 1.8])])
		if _S.truth(_S.invoke(_S.read(_v36, "R"), "chance", [0.25])):
			_S.invoke(_S.read(_v36, "ps"), "spawn", [_S.prop(_S.read(_v36, "P"), "VAPOUR"), _S.invoke(_S.read(_v36, "R"), "range", [_S.unary("-", 8), 8]), _S.unary("-", 1), _S.binary("*", _S.invoke(_S.read(_v36, "R"), "sign", []), _S.invoke(_S.read(_v36, "R"), "range", [15, 50])), _S.unary("-", _S.invoke(_S.read(_v36, "R"), "range", [2, 10])), _S.invoke(_S.read(_v36, "R"), "range", [0.6, 1]), _S.prop(_S.read(_v36, "C"), 6), _S.invoke(_S.read(_v36, "R"), "range", [2, 3.5])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "locked")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "LOCK")))):
		var _v37 = _S.scope(_e)
		_S.write(_v37, "locked", true, "=", false)
		_S.invoke(_S.read(_v37, "lights"), "add", [0, _S.unary("-", 20), 54, _S.prop(_S.read(_v37, "C"), 4), 0.6, 0.3])
		var _v38 = _S.scope(_v37)
		_S.define(_v38, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v38, "i"), 6)):
			_S.invoke(_S.read(_v38, "ps"), "spawn", [_S.prop(_S.read(_v38, "P"), "STAR"), _S.invoke(_S.read(_v38, "R"), "range", [_S.unary("-", 12), 12]), _S.unary("-", _S.invoke(_S.read(_v38, "R"), "range", [4, 36])), 0, _S.unary("-", 4), _S.invoke(_S.read(_v38, "R"), "range", [0.35, 0.7]), _S.invoke(_S.read(_v38, "R"), "pick", [[_S.read(_v38, "WHITE"), _S.prop(_S.read(_v38, "C"), 6)]]), _S.invoke(_S.read(_v38, "R"), "range", [1.2, 2.4])])
			_v38 = _S.iteration(_v38)
			_S.write(_v38, "i", 1, "+=", true)
	if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_e, "locked"), func(): return _S.binary("<", _S.read(_e, "t"), _S.read(_e, "CRACK"))), func(): return _S.invoke(_S.read(_e, "R"), "chance", [0.08]))):
		_S.invoke(_S.read(_e, "ps"), "spawn", [_S.prop(_S.read(_e, "P"), "STAR"), _S.invoke(_S.read(_e, "R"), "range", [_S.unary("-", 11), 11]), _S.unary("-", _S.invoke(_S.read(_e, "R"), "range", [2, 36])), 0, _S.unary("-", 3), _S.invoke(_S.read(_e, "R"), "range", [0.3, 0.6]), _S.invoke(_S.read(_e, "R"), "pick", [[_S.read(_e, "WHITE"), _S.prop(_S.read(_e, "C"), 6)]]), _S.invoke(_S.read(_e, "R"), "range", [0.8, 2])])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "cracked")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "CRACK")))):
		var _v39 = _S.scope(_e)
		_S.write(_v39, "cracked", true, "=", false)
		var _v40 = _S.scope(_v39)
		_S.define(_v40, "i", 0)
		while _S.truth(_S.binary("<", _S.read(_v40, "i"), 5)):
			var _v41 = _S.scope(_v40)
			_S.define(_v41, "a", _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")]))
			_S.define(_v41, "sp", _S.invoke(_S.read(_v41, "R"), "range", [60, 150]))
			_S.invoke(_S.read(_v41, "bits"), "add", [_S.merge([{"kind": _S.prop(_S.read(_v41, "B"), "SHARD")}, {"x": _S.binary("+", _S.read(_v41, "X0"), _S.read(_v41, "IX"))}, {"y": _S.binary("+", _S.read(_v41, "Y0"), _S.read(_v41, "IY"))}, {"vx": _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "cos", [_S.read(_v41, "a")]), _S.read(_v41, "sp"))}, {"vy": _S.binary("-", _S.binary("*", _S.invoke(_S.read(_v41, "Math"), "sin", [_S.read(_v41, "a")]), _S.read(_v41, "sp")), 60)}, {"g": 0.8}, {"drag": 0.6}, {"bounce": 0.3}, {"life": _S.invoke(_S.read(_v41, "R"), "range", [0.5, 0.9])}, {"a": _S.invoke(_S.read(_v41, "R"), "range", [0, _S.read(_v41, "TAU")])}, {"va": _S.invoke(_S.read(_v41, "R"), "range", [_S.unary("-", 20), 20])}, {"s": _S.invoke(_S.read(_v41, "R"), "range", [1, 2])}, {"c": _S.prop(_S.read(_v41, "C"), 6)}])])
			_v40 = _S.iteration(_v40)
			_S.write(_v40, "i", 1, "+=", true)
		_S.invoke(_S.read(_v39, "lights"), "add", [0, _S.binary("+", _S.read(_v39, "Y0"), _S.read(_v39, "IY")), 24, _S.read(_v39, "WHITE"), 0.7, 0.1])
	if _S.truth(_S.logical("&&", _S.unary("!", _S.read(_e, "burst")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "BURST")))):
		var _v42 = _S.scope(_e)
		_S.write(_v42, "burst", true, "=", false)
		_S.call_value(_S.read(_v42, "shatter"), [])
	var _v43 = _S.scope(_e)
	_S.define(_v43, "i", _S.binary("-", _S.prop(_S.read(_v43, "pieces"), "length"), 1))
	while _S.truth(_S.binary(">=", _S.read(_v43, "i"), 0)):
		var _v44 = _S.scope(_v43)
		_S.define(_v44, "q", _S.prop(_S.read(_v44, "pieces"), _S.read(_v44, "i")))
		if _S.truth(_S.binary("<=", _S.set_prop(_S.read(_v44, "q"), "life", _S.read(_v44, "dt"), "-=", false), 0)):
			var _v45 = _S.scope(_v44)
			_S.invoke(_S.read(_v45, "pieces"), "splice", [_S.read(_v45, "i"), 1])
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "i", 1, "-=", true)
			continue
		if _S.truth(_S.prop(_S.read(_v44, "q"), "rest")):
			var _v46 = _S.scope(_v44)
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v46, "t"), _S.binary("-", _S.prop(_S.read(_v46, "meta"), "duration"), 0.9)), func(): return _S.invoke(_S.read(_v46, "R"), "chance", [0.02]))):
				_S.invoke(_S.read(_v46, "ps"), "spawn", [_S.prop(_S.read(_v46, "P"), "VAPOUR"), _S.prop(_S.read(_v46, "q"), "x"), _S.binary("-", _S.prop(_S.read(_v46, "q"), "y"), 1), _S.invoke(_S.read(_v46, "R"), "range", [_S.unary("-", 4), 4]), _S.unary("-", _S.invoke(_S.read(_v46, "R"), "range", [4, 10])), _S.invoke(_S.read(_v46, "R"), "range", [0.5, 0.8]), _S.prop(_S.read(_v46, "C"), 5), _S.invoke(_S.read(_v46, "R"), "range", [1.5, 2.5])])
			_v43 = _S.iteration(_v43)
			_S.write(_v43, "i", 1, "-=", true)
			continue
		_S.set_prop(_S.read(_v44, "q"), "vy", _S.binary("*", 900, _S.read(_v44, "dt")), "+=", false)
		_S.set_prop(_S.read(_v44, "q"), "vx", _S.binary("*", _S.binary("*", _S.prop(_S.read(_v44, "q"), "vx"), 0.5), _S.read(_v44, "dt")), "-=", false)
		_S.set_prop(_S.read(_v44, "q"), "x", _S.binary("*", _S.prop(_S.read(_v44, "q"), "vx"), _S.read(_v44, "dt")), "+=", false)
		_S.set_prop(_S.read(_v44, "q"), "y", _S.binary("*", _S.prop(_S.read(_v44, "q"), "vy"), _S.read(_v44, "dt")), "+=", false)
		_S.set_prop(_S.read(_v44, "q"), "a", _S.binary("*", _S.prop(_S.read(_v44, "q"), "va"), _S.read(_v44, "dt")), "+=", false)
		_S.define(_v44, "g", _S.binary("*", _S.unary("-", _S.prop(_S.read(_v44, "q"), "r")), 0.55))
		if _S.truth(_S.logical("&&", _S.binary(">", _S.prop(_S.read(_v44, "q"), "y"), _S.read(_v44, "g")), func(): return _S.binary(">", _S.prop(_S.read(_v44, "q"), "vy"), 0))):
			var _v47 = _S.scope(_v44)
			_S.set_prop(_S.read(_v47, "q"), "y", _S.read(_v47, "g"), "=", false)
			if _S.truth(_S.binary(">", _S.prop(_S.read(_v47, "q"), "vy"), 90)):
				var _v48 = _S.scope(_v47)
				_S.invoke(_S.read(_v48, "rime"), "push", [_S.merge([{"x": _S.prop(_S.read(_v48, "q"), "x")}, {"w": _S.binary("+", 2, _S.binary("*", _S.prop(_S.read(_v48, "q"), "r"), 0.6))}, {"t0": _S.read(_v48, "t")}])])
				_S.set_prop(_S.read(_v48, "q"), "vy", _S.unary("-", 0.32), "*=", false)
				_S.set_prop(_S.read(_v48, "q"), "vx", 0.65, "*=", false)
				_S.set_prop(_S.read(_v48, "q"), "va", _S.binary("+", _S.binary("*", _S.prop(_S.read(_v48, "q"), "va"), 0.5), _S.invoke(_S.read(_v48, "R"), "range", [_S.unary("-", 4), 4])), "=", false)
				if _S.truth(_S.binary(">", _S.prop(_S.read(_v48, "q"), "n"), 8)):
					_S.invoke(_S.read(_v48, "ps"), "spawn", [_S.prop(_S.read(_v48, "P"), "STAR"), _S.prop(_S.read(_v48, "q"), "x"), _S.prop(_S.read(_v48, "q"), "y"), 0, _S.unary("-", 6), 0.3, _S.read(_v48, "WHITE"), 1.2])
				var _v49 = _S.scope(_v48)
				_S.define(_v49, "j", 0)
				while _S.truth(_S.binary("<", _S.read(_v49, "j"), 2)):
					_S.invoke(_S.read(_v49, "ps"), "spawn", [_S.prop(_S.read(_v49, "P"), "DUST"), _S.binary("+", _S.prop(_S.read(_v49, "q"), "x"), _S.invoke(_S.read(_v49, "R"), "range", [_S.unary("-", 2), 2])), _S.unary("-", 0.5), _S.binary("*", _S.invoke(_S.read(_v49, "R"), "sign", []), _S.invoke(_S.read(_v49, "R"), "range", [10, 30])), _S.unary("-", _S.invoke(_S.read(_v49, "R"), "range", [2, 8])), _S.invoke(_S.read(_v49, "R"), "range", [0.3, 0.5]), _S.prop(_S.read(_v49, "C"), 5), _S.invoke(_S.read(_v49, "R"), "range", [1.2, 2])])
					_v49 = _S.iteration(_v49)
					_S.write(_v49, "j", 1, "+=", true)
			else:
				if _S.truth(_S.binary(">", _S.invoke(_S.read(_v47, "Math"), "abs", [_S.prop(_S.read(_v47, "q"), "vx")]), 12)):
					_S.last([_S.set_prop(_S.read(_v47, "q"), "vy", 0, "=", false), _S.set_prop(_S.read(_v47, "q"), "vx", 0.9, "*=", false), _S.set_prop(_S.read(_v47, "q"), "va", 0.85, "*=", false)])
				else:
					_S.last([_S.set_prop(_S.read(_v47, "q"), "rest", true, "=", false), _S.set_prop(_S.read(_v47, "q"), "vx", _S.set_prop(_S.read(_v47, "q"), "vy", 0, "=", false), "=", false)])
		_v43 = _S.iteration(_v43)
		_S.write(_v43, "i", 1, "-=", true)
	_S.invoke(_S.read(_e, "bits"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "ps"), "update", [_S.read(_e, "dt")])
	_S.invoke(_S.read(_e, "lights"), "update", [_S.read(_e, "dt")])
	return null

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	_S.define(_e, "k", _S.binary("*", _S.call_value(_S.read(_e, "smooth"), [0.1, _S.read(_e, "LOCK"), _S.read(_e, "t")]), _S.binary("-", 1, _S.call_value(_S.read(_e, "smooth"), [_S.binary("+", _S.read(_e, "BURST"), 0.6), _S.binary("+", _S.read(_e, "BURST"), 1.6), _S.read(_e, "t")]))))
	_S.define(_e, "reach", _S.binary("+", 6, _S.binary("*", 12, _S.call_value(_S.read(_e, "smooth"), [0, _S.binary("+", _S.read(_e, "LOCK"), 0.3), _S.read(_e, "t")]))))
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		var _v50 = _S.scope(_e)
		_S.define(_v50, "x", _S.invoke(_S.read(_v50, "Math"), "floor", [_S.unary("-", _S.read(_v50, "reach"))]))
		while _S.truth(_S.binary("<=", _S.read(_v50, "x"), _S.invoke(_S.read(_v50, "Math"), "ceil", [_S.read(_v50, "reach")]))):
			var _v51 = _S.scope(_v50)
			_S.define(_v51, "h", _S.call_value(_S.read(_v51, "rand"), [_S.read(_v51, "x"), 17]))
			_S.define(_v51, "e", _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_v51, "Math"), "abs", [_S.read(_v51, "x")]), _S.binary("+", _S.read(_v51, "reach"), 1))))
			_S.invoke(_S.read(_v51, "p"), "dot", [_S.read(_v51, "x"), 0, (_S.read(_v51, "WHITE") if _S.truth(_S.binary("<", _S.read(_v51, "h"), 0.3)) else _S.prop(_S.read(_v51, "C"), 6)), _S.binary("*", _S.read(_v51, "k"), _S.invoke(_S.read(_v51, "Math"), "min", [1, _S.binary("*", _S.read(_v51, "e"), 2)]))])
			if _S.truth(_S.binary("<", _S.read(_v51, "h"), 0.5)):
				_S.invoke(_S.read(_v51, "p"), "dot", [_S.read(_v51, "x"), 1, _S.prop(_S.read(_v51, "C"), 5), _S.binary("*", _S.read(_v51, "k"), _S.read(_v51, "e"))])
			if _S.truth(_S.logical("&&", _S.binary("<", _S.read(_v51, "h"), 0.35), func(): return _S.binary(">", _S.read(_v51, "e"), 0.3))):
				_S.invoke(_S.read(_v51, "p"), "dot", [_S.read(_v51, "x"), _S.unary("-", 1), _S.prop(_S.read(_v51, "C"), 6), _S.binary("*", _S.read(_v51, "k"), _S.read(_v51, "e"))])
			_v50 = _S.iteration(_v50)
			_S.write(_v50, "x", 1, "+=", true)
	if _S.truth(_S.binary(">", _S.read(_e, "k"), 0)):
		_S.invoke(_S.read(_e, "p"), "glow", [0, _S.unary("-", 2), 26, _S.prop(_S.read(_e, "C"), 4), _S.binary("*", 0.25, _S.read(_e, "k"))])
	for _v52 in _S.array(_S.read(_e, "rime")):
		var _v53 = _S.scope(_e)
		_S.define(_v53, "r", _v52)
		var _v54 = _S.scope(_v53)
		_S.define(_v54, "a", _S.binary("*", _S.call_value(_S.read(_v54, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v54, "t"), _S.prop(_S.read(_v54, "r"), "t0")), 0.08)]), _S.binary("-", 1, _S.call_value(_S.read(_v54, "smooth"), [_S.binary("-", _S.prop(_S.read(_v54, "meta"), "duration"), 1), _S.binary("-", _S.prop(_S.read(_v54, "meta"), "duration"), 0.15), _S.read(_v54, "t")]))))
		var _v55 = _S.scope(_v54)
		_S.define(_v55, "x", _S.invoke(_S.read(_v55, "Math"), "floor", [_S.binary("-", _S.prop(_S.read(_v55, "r"), "x"), _S.prop(_S.read(_v55, "r"), "w"))]))
		while _S.truth(_S.binary("<=", _S.read(_v55, "x"), _S.binary("+", _S.prop(_S.read(_v55, "r"), "x"), _S.prop(_S.read(_v55, "r"), "w")))):
			var _v56 = _S.scope(_v55)
			_S.define(_v56, "h", _S.call_value(_S.read(_v56, "rand"), [_S.read(_v56, "x"), 23]))
			if _S.truth(_S.binary("<", _S.read(_v56, "h"), 0.7)):
				_S.invoke(_S.read(_v56, "p"), "dot", [_S.read(_v56, "x"), 0, (_S.read(_v56, "WHITE") if _S.truth(_S.binary("<", _S.read(_v56, "h"), 0.25)) else _S.prop(_S.read(_v56, "C"), 6)), _S.read(_v56, "a")])
			if _S.truth(_S.binary("<", _S.read(_v56, "h"), 0.3)):
				_S.invoke(_S.read(_v56, "p"), "dot", [_S.read(_v56, "x"), 1, _S.prop(_S.read(_v56, "C"), 5), _S.binary("*", _S.read(_v56, "a"), 0.7)])
			_v55 = _S.iteration(_v55)
			_S.write(_v55, "x", 1, "+=", true)
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "back"])
	return null

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	if _S.truth(_S.unary("!", _S.read(_e, "burst"))):
		var _v57 = _S.scope(_e)
		_S.define(_v57, "lv", _S.call_value(_S.read(_v57, "level"), [_S.read(_v57, "t")]))
		_S.define(_v57, "shake", (_S.binary("*", (1 if _S.truth(_S.binary("%", _S.invoke(_S.read(_v57, "Math"), "floor", [_S.binary("*", _S.read(_v57, "t"), 50)]), 2)) else _S.unary("-", 1)), (1 if _S.truth(_S.binary(">", _S.read(_v57, "t"), _S.binary("-", _S.read(_v57, "BURST"), 0.15))) else 0.5)) if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v57, "t"), _S.read(_v57, "CRACK")), func(): return _S.binary("<", _S.read(_v57, "t"), _S.read(_v57, "BURST")))) else 0))
		_S.define(_v57, "glint", (_S.binary("%", _S.binary("*", _S.binary("-", _S.read(_v57, "t"), _S.read(_v57, "LOCK")), 0.9), 1.6) if _S.truth(_S.binary(">", _S.read(_v57, "t"), _S.read(_v57, "LOCK"))) else _S.unary("-", 1)))
		var _v58 = _S.scope(_v57)
		_S.define(_v58, "y", 0)
		while _S.truth(_S.binary("<", _S.read(_v58, "y"), _S.read(_v58, "H"))):
			var _v59 = _S.scope(_v58)
			if _S.truth(_S.binary("<", _S.read(_v59, "y"), _S.invoke(_S.read(_v59, "Math"), "floor", [_S.read(_v59, "lv")]))):
				_v58 = _S.iteration(_v58)
				_S.write(_v58, "y", 1, "+=", true)
				continue
			var _v60 = _S.scope(_v59)
			_S.define(_v60, "x", 0)
			while _S.truth(_S.binary("<", _S.read(_v60, "x"), _S.read(_v60, "W"))):
				var _v61 = _S.scope(_v60)
				_S.define(_v61, "i", _S.binary("+", _S.binary("*", _S.read(_v61, "y"), _S.read(_v61, "W")), _S.read(_v61, "x")))
				if _S.truth(_S.binary("<", _S.prop(_S.read(_v61, "ice"), _S.read(_v61, "i")), 0)):
					_v60 = _S.iteration(_v60)
					_S.write(_v60, "x", 1, "+=", true)
					continue
				_S.define(_v61, "c", ((_S.read(_v61, "WHITE") if _S.truth(_S.binary("<", _S.call_value(_S.read(_v61, "rand"), [_S.read(_v61, "x"), 5]), 0.6)) else _S.prop(_S.read(_v61, "C"), 6)) if _S.truth(_S.logical("&&", _S.binary("===", _S.read(_v61, "y"), _S.invoke(_S.read(_v61, "Math"), "floor", [_S.read(_v61, "lv")])), func(): return _S.binary("<", _S.read(_v61, "t"), _S.read(_v61, "LOCK")))) else (_S.read(_v61, "WHITE") if _S.truth(_S.logical("&&", _S.binary(">=", _S.read(_v61, "t"), _S.read(_v61, "LOCK")), func(): return _S.binary("<", _S.read(_v61, "t"), _S.binary("+", _S.read(_v61, "LOCK"), 0.05)))) else _S.prop(_S.read(_v61, "col"), _S.read(_v61, "i")))))
				_S.define(_v61, "g", _S.invoke(_S.read(_v61, "Math"), "abs", [_S.binary("-", _S.binary("/", _S.binary("+", _S.read(_v61, "x"), _S.binary("*", _S.binary("-", _S.read(_v61, "H"), _S.read(_v61, "y")), 0.6)), _S.binary("+", _S.read(_v61, "W"), _S.binary("*", _S.read(_v61, "H"), 0.6))), _S.read(_v61, "glint"))]))
				_S.define(_v61, "on", _S.logical("&&", _S.binary(">=", _S.read(_v61, "glint"), 0), func(): return _S.binary("<=", _S.read(_v61, "glint"), 1)))
				if _S.truth(_S.logical("&&", _S.read(_v61, "on"), func(): return _S.binary("<", _S.read(_v61, "g"), 0.035))):
					_S.write(_v61, "c", _S.read(_v61, "WHITE"), "=", false)
				else:
					if _S.truth(_S.logical("&&", _S.logical("&&", _S.read(_v61, "on"), func(): return _S.binary("<", _S.read(_v61, "g"), 0.07)), func(): return _S.binary("!==", _S.read(_v61, "c"), _S.prop(_S.read(_v61, "C"), 3)))):
						_S.write(_v61, "c", _S.prop(_S.read(_v61, "C"), 6), "=", false)
				_S.invoke(_S.read(_v61, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v61, "X0"), _S.read(_v61, "x")), _S.read(_v61, "shake")), _S.binary("+", _S.read(_v61, "Y0"), _S.read(_v61, "y")), _S.read(_v61, "c")])
				if _S.truth(_S.logical("&&", _S.unary("!", _S.prop(_S.read(_v61, "solid"), _S.read(_v61, "i"))), func(): return _S.binary("===", _S.read(_v61, "c"), _S.prop(_S.read(_v61, "col"), _S.read(_v61, "i"))))):
					_S.invoke(_S.read(_v61, "p"), "blend", [_S.binary("+", _S.binary("+", _S.read(_v61, "X0"), _S.read(_v61, "x")), _S.read(_v61, "shake")), _S.binary("+", _S.read(_v61, "Y0"), _S.read(_v61, "y")), _S.prop(_S.read(_v61, "glass"), _S.read(_v61, "i")), 0.3])
				_v60 = _S.iteration(_v60)
				_S.write(_v60, "x", 1, "+=", true)
			_v58 = _S.iteration(_v58)
			_S.write(_v58, "y", 1, "+=", true)
		var _v62 = _S.scope(_v57)
		_S.define(_v62, "y", _S.invoke(_S.read(_v62, "Math"), "max", [0, _S.binary("-", _S.invoke(_S.read(_v62, "Math"), "floor", [_S.read(_v62, "lv")]), 1)]))
		while _S.truth(_S.binary("<=", _S.read(_v62, "y"), _S.read(_v62, "H"))):
			var _v63 = _S.scope(_v62)
			_S.define(_v63, "x", _S.unary("-", 1))
			while _S.truth(_S.binary("<=", _S.read(_v63, "x"), _S.read(_v63, "W"))):
				if _S.truth(_S.logical("&&", _S.logical("&&", _S.unary("!", _S.call_value(_S.read(_v63, "at"), [_S.read(_v63, "x"), _S.read(_v63, "y")])), func(): return _S.logical("||", _S.logical("||", _S.logical("||", _S.call_value(_S.read(_v63, "at"), [_S.binary("-", _S.read(_v63, "x"), 1), _S.read(_v63, "y")]), func(): return _S.call_value(_S.read(_v63, "at"), [_S.binary("+", _S.read(_v63, "x"), 1), _S.read(_v63, "y")])), func(): return _S.logical("&&", _S.call_value(_S.read(_v63, "at"), [_S.read(_v63, "x"), _S.binary("+", _S.read(_v63, "y"), 1)]), func(): return _S.binary(">=", _S.binary("+", _S.read(_v63, "y"), 1), _S.read(_v63, "lv")))), func(): return _S.call_value(_S.read(_v63, "at"), [_S.read(_v63, "x"), _S.binary("-", _S.read(_v63, "y"), 1)]))), func(): return _S.binary("<", _S.read(_v63, "y"), _S.read(_v63, "H")))):
					_S.invoke(_S.read(_v63, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v63, "X0"), _S.read(_v63, "x")), _S.read(_v63, "shake")), _S.binary("+", _S.read(_v63, "Y0"), _S.read(_v63, "y")), _S.prop(_S.read(_v63, "C"), 0)])
				_v63 = _S.iteration(_v63)
				_S.write(_v63, "x", 1, "+=", true)
			_v62 = _S.iteration(_v62)
			_S.write(_v62, "y", 1, "+=", true)
		for _v64 in _S.array(_S.read(_v57, "spikes")):
			var _v65 = _S.scope(_v57)
			_S.define(_v65, "s", _v64)
			var _v66 = _S.scope(_v65)
			_S.define(_v66, "g", _S.invoke(_S.read(_v66, "ease"), "outBack", [_S.call_value(_S.read(_v66, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v66, "t"), _S.prop(_S.read(_v66, "s"), "at")), 0.12)]), 2.4]))
			if _S.truth(_S.binary(">", _S.read(_v66, "g"), 0)):
				_S.call_value(_S.read(_v66, "crystal"), [_S.read(_v66, "p"), _S.binary("+", _S.prop(_S.read(_v66, "s"), "x"), _S.read(_v66, "shake")), _S.prop(_S.read(_v66, "s"), "base"), _S.binary("*", _S.prop(_S.read(_v66, "s"), "h"), _S.read(_v66, "g")), _S.prop(_S.read(_v66, "s"), "w"), _S.binary("*", _S.prop(_S.read(_v66, "s"), "lean"), _S.read(_v66, "g")), _S.read(_v66, "C"), _S.merge([{"white": _S.binary("<", _S.read(_v66, "t"), _S.binary("+", _S.prop(_S.read(_v66, "s"), "at"), 0.04))}])])
		if _S.truth(_S.read(_v57, "cracked")):
			var _v67 = _S.scope(_v57)
			_S.define(_v67, "k", _S.call_value(_S.read(_v67, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_v67, "t"), _S.read(_v67, "CRACK")), 0.25)]))
			for _v68 in _S.array(_S.read(_v67, "cracks")):
				var _v69 = _S.scope(_v67)
				_S.define(_v69, "pts", _v68)
				var _v70 = _S.scope(_v69)
				_S.define(_v70, "i", 0)
				_S.define(_v70, "n", _S.invoke(_S.read(_v70, "Math"), "floor", [_S.binary("*", _S.prop(_S.read(_v70, "pts"), "length"), _S.read(_v70, "k"))]))
				while _S.truth(_S.binary("<", _S.read(_v70, "i"), _S.read(_v70, "n"))):
					var _v71 = _S.scope(_v70)
					var _v72 = _S.prop(_S.read(_v71, "pts"), _S.read(_v71, "i"))
					_S.define(_v71, "x", _S.prop(_v72, 0))
					_S.define(_v71, "y", _S.prop(_v72, 1))
					_S.define(_v71, "fresh", _S.logical("&&", _S.binary(">", _S.read(_v71, "i"), _S.binary("-", _S.read(_v71, "n"), 3)), func(): return _S.binary("<", _S.binary("-", _S.read(_v71, "t"), _S.read(_v71, "CRACK")), 0.3)))
					_S.invoke(_S.read(_v71, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v71, "X0"), _S.read(_v71, "x")), _S.read(_v71, "shake")), _S.binary("+", _S.read(_v71, "Y0"), _S.read(_v71, "y")), (_S.read(_v71, "WHITE") if _S.truth(_S.read(_v71, "fresh")) else _S.prop(_S.read(_v71, "C"), 7))])
					if _S.truth(_S.unary("!", _S.read(_v71, "fresh"))):
						_S.invoke(_S.read(_v71, "p"), "px", [_S.binary("+", _S.binary("+", _S.read(_v71, "X0"), _S.read(_v71, "x")), _S.read(_v71, "shake")), _S.binary("+", _S.binary("+", _S.read(_v71, "Y0"), _S.read(_v71, "y")), 1), _S.prop(_S.read(_v71, "C"), 1)])
					_v70 = _S.iteration(_v70)
					_S.write(_v70, "i", 1, "+=", true)
		_S.invoke(_S.read(_v57, "p"), "glow", [0, _S.unary("-", 18), 30, _S.prop(_S.read(_v57, "C"), 4), _S.binary("*", 0.18, _S.call_value(_S.read(_v57, "smooth"), [0, _S.read(_v57, "LOCK"), _S.read(_v57, "t")]))])
		if _S.truth(_S.logical("&&", _S.binary(">", _S.read(_v57, "t"), _S.read(_v57, "LOCK")), func(): return _S.binary("<", _S.read(_v57, "t"), _S.binary("+", _S.read(_v57, "LOCK"), 0.18)))):
			_S.call_value(_S.read(_v57, "sparkle"), [_S.read(_v57, "p"), _S.unary("-", 4), _S.binary("+", _S.read(_v57, "Y0"), 8), _S.invoke(_S.read(_v57, "Math"), "round", [_S.binary("*", 8, _S.binary("-", 1, _S.binary("/", _S.binary("-", _S.read(_v57, "t"), _S.read(_v57, "LOCK")), 0.18)))]), _S.read(_v57, "WHITE"), _S.prop(_S.read(_v57, "C"), 5), 0.6])
	else:
		if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("+", _S.read(_e, "BURST"), 0.08))):
			var _v73 = _S.scope(_e)
			_S.define(_v73, "k", _S.binary("/", _S.binary("-", _S.read(_v73, "t"), _S.read(_v73, "BURST")), 0.08))
			_S.invoke(_S.read(_v73, "p"), "circle", [_S.binary("+", _S.read(_v73, "X0"), _S.read(_v73, "IX")), _S.binary("+", _S.read(_v73, "Y0"), _S.read(_v73, "IY")), _S.binary("+", _S.binary("*", 10, _S.binary("-", 1, _S.read(_v73, "k"))), 3), _S.read(_v73, "WHITE")])
	for _v74 in _S.array(_S.read(_e, "pieces")):
		var _v75 = _S.scope(_e)
		_S.define(_v75, "q", _v74)
		var _v76 = _S.scope(_v75)
		_S.define(_v76, "ca", _S.invoke(_S.read(_v76, "Math"), "cos", [_S.prop(_S.read(_v76, "q"), "a")]))
		_S.define(_v76, "sa", _S.invoke(_S.read(_v76, "Math"), "sin", [_S.prop(_S.read(_v76, "q"), "a")]))
		_S.define(_v76, "fade", _S.invoke(_S.read(_v76, "Math"), "min", [1, _S.binary("/", _S.prop(_S.read(_v76, "q"), "life"), 0.5)]))
		_S.define(_v76, "r", _S.invoke(_S.read(_v76, "Math"), "ceil", [_S.prop(_S.read(_v76, "q"), "r")]))
		var _v77 = _S.scope(_v76)
		_S.define(_v77, "py", _S.unary("-", _S.read(_v77, "r")))
		while _S.truth(_S.binary("<=", _S.read(_v77, "py"), _S.read(_v77, "r"))):
			var _v78 = _S.scope(_v77)
			_S.define(_v78, "px", _S.unary("-", _S.read(_v78, "r")))
			while _S.truth(_S.binary("<=", _S.read(_v78, "px"), _S.read(_v78, "r"))):
				var _v79 = _S.scope(_v78)
				_S.define(_v79, "ux", _S.invoke(_S.read(_v79, "Math"), "round", [_S.binary("+", _S.binary("*", _S.read(_v79, "px"), _S.read(_v79, "ca")), _S.binary("*", _S.read(_v79, "py"), _S.read(_v79, "sa")))]))
				_S.define(_v79, "uy", _S.invoke(_S.read(_v79, "Math"), "round", [_S.binary("+", _S.binary("*", _S.unary("-", _S.read(_v79, "px")), _S.read(_v79, "sa")), _S.binary("*", _S.read(_v79, "py"), _S.read(_v79, "ca")))]))
				_S.define(_v79, "c", _S.invoke(_S.prop(_S.read(_v79, "q"), "map"), "get", [("" + _S.string(_S.read(_v79, "ux")) + "," + _S.string(_S.read(_v79, "uy")) + "")]))
				if _S.truth(_S.logical("&&", _S.read(_v79, "c"), func(): return _S.binary("<", _S.call_value(_S.read(_v79, "rand"), [_S.read(_v79, "ux"), _S.read(_v79, "uy"), _S.prop(_S.read(_v79, "q"), "id")]), _S.read(_v79, "fade")))):
					_S.invoke(_S.read(_v79, "p"), "px", [_S.binary("+", _S.invoke(_S.read(_v79, "Math"), "floor", [_S.prop(_S.read(_v79, "q"), "x")]), _S.read(_v79, "px")), _S.binary("+", _S.invoke(_S.read(_v79, "Math"), "floor", [_S.prop(_S.read(_v79, "q"), "y")]), _S.read(_v79, "py")), (_S.read(_v79, "WHITE") if _S.truth(_S.binary("<", _S.binary("-", _S.prop(_S.read(_v79, "q"), "max"), _S.prop(_S.read(_v79, "q"), "life")), 0.05)) else _S.read(_v79, "c"))])
				_v78 = _S.iteration(_v78)
				_S.write(_v78, "px", 1, "+=", true)
			_v77 = _S.iteration(_v77)
			_S.write(_v77, "py", 1, "+=", true)
		if _S.truth(_S.binary(">", _S.prop(_S.read(_v76, "q"), "n"), 6)):
			_S.invoke(_S.read(_v76, "p"), "glow", [_S.prop(_S.read(_v76, "q"), "x"), _S.prop(_S.read(_v76, "q"), "y"), 6, _S.prop(_S.read(_v76, "C"), 5), _S.binary("*", 0.2, _S.read(_v76, "fade"))])
	_S.invoke(_S.read(_e, "bits"), "draw", [_S.read(_e, "p")])
	_S.invoke(_S.read(_e, "ps"), "draw", [_S.read(_e, "p"), "front"])
	_S.invoke(_S.read(_e, "lights"), "draw", [_S.read(_e, "p")])
	return null

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.read(_e, "BURST"))) else 0)
