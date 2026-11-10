@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/math.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "hash", _S.function_value(_e, "_f0"))
	_S.define(_e, "noise", _S.function_value(_e, "_f1"))
	_S.define(_e, "noise2", _S.function_value(_e, "_f2"))
	_S.define(_e, "fbm", _S.function_value(_e, "_f3"))
	_S.define(_e, "tileNoise", _S.function_value(_e, "_f4"))
	_S.define(_e, "tileFbm", _S.function_value(_e, "_f5"))
	_S.define(_e, "loopNoise", _S.function_value(_e, "_f6"))
	_S.define(_e, "TAU", _S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), 2))
	_exports["TAU"] = _S.read(_e, "TAU")
	_S.define(_e, "clamp", _S.function_value(_e, "_f7"))
	_exports["clamp"] = _S.read(_e, "clamp")
	_S.define(_e, "lerp", _S.function_value(_e, "_f8"))
	_exports["lerp"] = _S.read(_e, "lerp")
	_S.define(_e, "invLerp", _S.function_value(_e, "_f9"))
	_exports["invLerp"] = _S.read(_e, "invLerp")
	_S.define(_e, "remap", _S.function_value(_e, "_f10"))
	_exports["remap"] = _S.read(_e, "remap")
	_S.define(_e, "fract", _S.function_value(_e, "_f11"))
	_exports["fract"] = _S.read(_e, "fract")
	_S.define(_e, "wrap", _S.function_value(_e, "_f12"))
	_exports["wrap"] = _S.read(_e, "wrap")
	_S.define(_e, "seg", _S.function_value(_e, "_f13"))
	_exports["seg"] = _S.read(_e, "seg")
	_S.define(_e, "smooth", _S.function_value(_e, "_f14"))
	_exports["smooth"] = _S.read(_e, "smooth")
	_S.define(_e, "bump", _S.function_value(_e, "_f15"))
	_exports["bump"] = _S.read(_e, "bump")
	_S.define(_e, "pingpong", _S.function_value(_e, "_f16"))
	_exports["pingpong"] = _S.read(_e, "pingpong")
	_S.define(_e, "dist", _S.function_value(_e, "_f17"))
	_exports["dist"] = _S.read(_e, "dist")
	_S.define(_e, "angleTo", _S.function_value(_e, "_f18"))
	_exports["angleTo"] = _S.read(_e, "angleTo")
	_S.define(_e, "ease", _S.merge([{"linear": _S.function_value(_e, "_f19")}, {"inQuad": _S.function_value(_e, "_f20")}, {"outQuad": _S.function_value(_e, "_f21")}, {"inOutQuad": _S.function_value(_e, "_f22")}, {"inCubic": _S.function_value(_e, "_f23")}, {"outCubic": _S.function_value(_e, "_f24")}, {"inOutCubic": _S.function_value(_e, "_f25")}, {"inQuart": _S.function_value(_e, "_f26")}, {"outQuart": _S.function_value(_e, "_f27")}, {"inExpo": _S.function_value(_e, "_f28")}, {"outExpo": _S.function_value(_e, "_f29")}, {"inSine": _S.function_value(_e, "_f30")}, {"outSine": _S.function_value(_e, "_f31")}, {"inOutSine": _S.function_value(_e, "_f32")}, {"inBack": _S.function_value(_e, "_f33")}, {"outBack": _S.function_value(_e, "_f34")}, {"outElastic": _S.function_value(_e, "_f35")}, {"outBounce": _S.function_value(_e, "_f36")}]))
	_exports["ease"] = _S.read(_e, "ease")
	_exports["hash"] = _S.read(_e, "hash")
	_S.define(_e, "rand", _S.function_value(_e, "_f37"))
	_exports["rand"] = _S.read(_e, "rand")
	_S.define(_e, "Rng", _S.class_value("Rng", _S.function_value(_e, "_f38"), {"next": _S.function_value(_e, "_f39"), "range": _S.function_value(_e, "_f40"), "int": _S.function_value(_e, "_f41"), "chance": _S.function_value(_e, "_f42"), "sign": _S.function_value(_e, "_f43"), "pick": _S.function_value(_e, "_f44"), "gauss": _S.function_value(_e, "_f45")}, {}, {}, null))
	_exports["Rng"] = _S.read(_e, "Rng")
	_S.define(_e, "rng", _S.function_value(_e, "_f46"))
	_exports["rng"] = _S.read(_e, "rng")
	_exports["noise"] = _S.read(_e, "noise")
	_exports["noise2"] = _S.read(_e, "noise2")
	_exports["fbm"] = _S.read(_e, "fbm")
	_exports["tileNoise"] = _S.read(_e, "tileNoise")
	_exports["tileFbm"] = _S.read(_e, "tileFbm")
	_exports["loopNoise"] = _S.read(_e, "loopNoise")
	_exports["__scope"] = _e
	return _exports

static func _f0(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "ns", _args.slice(0))
	_S.define(_e, "h", 2654435769)
	for _v0 in _S.array(_S.read(_e, "ns")):
		var _v1 = _S.scope(_e)
		_S.define(_v1, "n", _v0)
		var _v2 = _S.scope(_v1)
		_S.write(_v2, "h", _S.invoke(_S.read(_v2, "Math"), "imul", [_S.binary("^", _S.read(_v2, "h"), _S.binary("|", _S.read(_v2, "n"), 0)), 2246822507]), "=", false)
		_S.write(_v2, "h", _S.binary(">>>", _S.read(_v2, "h"), 13), "^=", false)
		_S.write(_v2, "h", _S.invoke(_S.read(_v2, "Math"), "imul", [_S.read(_v2, "h"), 3266489909]), "=", false)
		_S.write(_v2, "h", _S.binary(">>>", _S.read(_v2, "h"), 16), "^=", false)
	return _S.binary(">>>", _S.read(_e, "h"), 0)

static func _f1(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "i", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "f", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "i")))
	_S.define(_e, "u", _S.binary("*", _S.binary("*", _S.read(_e, "f"), _S.read(_e, "f")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "f")))))
	return _S.binary("-", _S.binary("*", _S.call_value(_S.read(_e, "lerp"), [_S.call_value(_S.read(_e, "rand"), [_S.read(_e, "i"), _S.read(_e, "seed")]), _S.call_value(_S.read(_e, "rand"), [_S.binary("+", _S.read(_e, "i"), 1), _S.read(_e, "seed")]), _S.read(_e, "u")]), 2), 1)

static func _f2(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "ix", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "iy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	_S.define(_e, "fx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ix")))
	_S.define(_e, "fy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "iy")))
	_S.define(_e, "ux", _S.binary("*", _S.binary("*", _S.read(_e, "fx"), _S.read(_e, "fx")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "fx")))))
	_S.define(_e, "uy", _S.binary("*", _S.binary("*", _S.read(_e, "fy"), _S.read(_e, "fy")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "fy")))))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "ix"), _S.read(_e, "iy"), _S.read(_e, "seed")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "rand"), [_S.binary("+", _S.read(_e, "ix"), 1), _S.read(_e, "iy"), _S.read(_e, "seed")]))
	_S.define(_e, "c", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "ix"), _S.binary("+", _S.read(_e, "iy"), 1), _S.read(_e, "seed")]))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "rand"), [_S.binary("+", _S.read(_e, "ix"), 1), _S.binary("+", _S.read(_e, "iy"), 1), _S.read(_e, "seed")]))
	return _S.binary("-", _S.binary("*", _S.call_value(_S.read(_e, "lerp"), [_S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "a"), _S.read(_e, "b"), _S.read(_e, "ux")]), _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "c"), _S.read(_e, "d"), _S.read(_e, "ux")]), _S.read(_e, "uy")]), 2), 1)

static func _f3(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "octaves", _S.coalesce(_S.arg(_args, 3), func(): return 3))
	_S.define(_e, "s", 0)
	_S.define(_e, "a", 0.5)
	_S.define(_e, "n", 0)
	var _v3 = _S.scope(_e)
	_S.define(_v3, "o", 0)
	while _S.truth(_S.binary("<", _S.read(_v3, "o"), _S.read(_v3, "octaves"))):
		var _v4 = _S.scope(_v3)
		_S.write(_v4, "s", _S.binary("*", _S.call_value(_S.read(_v4, "noise2"), [_S.read(_v4, "x"), _S.read(_v4, "y"), _S.binary("+", _S.read(_v4, "seed"), _S.binary("*", _S.read(_v4, "o"), 101))]), _S.read(_v4, "a")), "+=", false)
		_S.write(_v4, "n", _S.read(_v4, "a"), "+=", false)
		_S.write(_v4, "x", 2.03, "*=", false)
		_S.write(_v4, "y", 2.03, "*=", false)
		_S.write(_v4, "a", 0.5, "*=", false)
		_v3 = _S.iteration(_v3)
		_S.write(_v3, "o", 1, "+=", true)
	return _S.binary("/", _S.read(_e, "s"), _S.read(_e, "n"))

static func _f4(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "px", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "py", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	_S.define(_e, "ix", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))
	_S.define(_e, "iy", _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "y")]))
	_S.define(_e, "fx", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "ix")))
	_S.define(_e, "fy", _S.binary("-", _S.read(_e, "y"), _S.read(_e, "iy")))
	_S.define(_e, "ux", _S.binary("*", _S.binary("*", _S.read(_e, "fx"), _S.read(_e, "fx")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "fx")))))
	_S.define(_e, "uy", _S.binary("*", _S.binary("*", _S.read(_e, "fy"), _S.read(_e, "fy")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "fy")))))
	_S.define(_e, "x0", (_S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "ix"), _S.read(_e, "px")]) if _S.truth(_S.read(_e, "px")) else _S.read(_e, "ix")))
	_S.define(_e, "x1", (_S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.read(_e, "ix"), 1), _S.read(_e, "px")]) if _S.truth(_S.read(_e, "px")) else _S.binary("+", _S.read(_e, "ix"), 1)))
	_S.define(_e, "y0", (_S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "iy"), _S.read(_e, "py")]) if _S.truth(_S.read(_e, "py")) else _S.read(_e, "iy")))
	_S.define(_e, "y1", (_S.call_value(_S.read(_e, "wrap"), [_S.binary("+", _S.read(_e, "iy"), 1), _S.read(_e, "py")]) if _S.truth(_S.read(_e, "py")) else _S.binary("+", _S.read(_e, "iy"), 1)))
	_S.define(_e, "a", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x0"), _S.read(_e, "y0"), _S.read(_e, "seed")]))
	_S.define(_e, "b", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x1"), _S.read(_e, "y0"), _S.read(_e, "seed")]))
	_S.define(_e, "c", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x0"), _S.read(_e, "y1"), _S.read(_e, "seed")]))
	_S.define(_e, "d", _S.call_value(_S.read(_e, "rand"), [_S.read(_e, "x1"), _S.read(_e, "y1"), _S.read(_e, "seed")]))
	return _S.binary("-", _S.binary("*", _S.call_value(_S.read(_e, "lerp"), [_S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "a"), _S.read(_e, "b"), _S.read(_e, "ux")]), _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "c"), _S.read(_e, "d"), _S.read(_e, "ux")]), _S.read(_e, "uy")]), 2), 1)

static func _f5(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "y", _S.arg(_args, 1))
	_S.define(_e, "px", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "py", _S.coalesce(_S.arg(_args, 3), func(): return 0))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 4), func(): return 0))
	_S.define(_e, "octaves", _S.coalesce(_S.arg(_args, 5), func(): return 3))
	_S.define(_e, "s", 0)
	_S.define(_e, "a", 0.5)
	_S.define(_e, "n", 0)
	_S.define(_e, "k", 1)
	var _v5 = _S.scope(_e)
	_S.define(_v5, "o", 0)
	while _S.truth(_S.binary("<", _S.read(_v5, "o"), _S.read(_v5, "octaves"))):
		var _v6 = _S.scope(_v5)
		_S.write(_v6, "s", _S.binary("*", _S.call_value(_S.read(_v6, "tileNoise"), [_S.binary("*", _S.read(_v6, "x"), _S.read(_v6, "k")), _S.binary("*", _S.read(_v6, "y"), _S.read(_v6, "k")), _S.binary("*", _S.read(_v6, "px"), _S.read(_v6, "k")), _S.binary("*", _S.read(_v6, "py"), _S.read(_v6, "k")), _S.binary("+", _S.read(_v6, "seed"), _S.binary("*", _S.read(_v6, "o"), 101))]), _S.read(_v6, "a")), "+=", false)
		_S.write(_v6, "n", _S.read(_v6, "a"), "+=", false)
		_S.write(_v6, "a", 0.5, "*=", false)
		_S.write(_v6, "k", 2, "*=", false)
		_v5 = _S.iteration(_v5)
		_S.write(_v5, "o", 1, "+=", true)
	return _S.binary("/", _S.read(_e, "s"), _S.read(_e, "n"))

static func _f6(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "phase", _S.arg(_args, 0))
	_S.define(_e, "radius", _S.coalesce(_S.arg(_args, 1), func(): return 1))
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 2), func(): return 0))
	_S.define(_e, "a", _S.binary("*", _S.read(_e, "phase"), _S.read(_e, "TAU")))
	return _S.call_value(_S.read(_e, "noise2"), [_S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "cos", [_S.read(_e, "a")]), _S.read(_e, "radius")), 50), _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "sin", [_S.read(_e, "a")]), _S.read(_e, "radius")), 50), _S.read(_e, "seed")])

static func _f7(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "a", _S.coalesce(_S.arg(_args, 1), func(): return 0))
	_S.define(_e, "b", _S.coalesce(_S.arg(_args, 2), func(): return 1))
	return (_S.read(_e, "a") if _S.truth(_S.binary("<", _S.read(_e, "x"), _S.read(_e, "a"))) else (_S.read(_e, "b") if _S.truth(_S.binary(">", _S.read(_e, "x"), _S.read(_e, "b"))) else _S.read(_e, "x")))

static func _f8(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "t", _S.arg(_args, 2))
	return _S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a")), _S.read(_e, "t")))

static func _f9(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	return (0 if _S.truth(_S.binary("===", _S.read(_e, "b"), _S.read(_e, "a"))) else _S.binary("/", _S.binary("-", _S.read(_e, "x"), _S.read(_e, "a")), _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a"))))

static func _f10(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "a0", _S.arg(_args, 1))
	_S.define(_e, "a1", _S.arg(_args, 2))
	_S.define(_e, "b0", _S.arg(_args, 3))
	_S.define(_e, "b1", _S.arg(_args, 4))
	return _S.call_value(_S.read(_e, "lerp"), [_S.read(_e, "b0"), _S.read(_e, "b1"), _S.call_value(_S.read(_e, "invLerp"), [_S.read(_e, "a0"), _S.read(_e, "a1"), _S.read(_e, "x")])])

static func _f11(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", _S.read(_e, "x"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.read(_e, "x")]))

static func _f12(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	_S.define(_e, "m", _S.arg(_args, 1))
	return _S.binary("%", _S.binary("+", _S.binary("%", _S.read(_e, "x"), _S.read(_e, "m")), _S.read(_e, "m")), _S.read(_e, "m"))

static func _f13(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "t0", _S.arg(_args, 1))
	_S.define(_e, "t1", _S.arg(_args, 2))
	return _S.call_value(_S.read(_e, "clamp"), [_S.binary("/", _S.binary("-", _S.read(_e, "t"), _S.read(_e, "t0")), _S.binary("-", _S.read(_e, "t1"), _S.read(_e, "t0")))])

static func _f14(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "e0", _S.arg(_args, 0))
	_S.define(_e, "e1", _S.arg(_args, 1))
	_S.define(_e, "x", _S.arg(_args, 2))
	_S.define(_e, "t", _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "x"), _S.read(_e, "e0"), _S.read(_e, "e1")]))
	return _S.binary("*", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "t")), _S.binary("-", 3, _S.binary("*", 2, _S.read(_e, "t"))))

static func _f15(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "t0", _S.arg(_args, 1))
	_S.define(_e, "t1", _S.arg(_args, 2))
	return (0 if _S.truth(_S.logical("||", _S.binary("<=", _S.read(_e, "t"), _S.read(_e, "t0")), func(): return _S.binary(">=", _S.read(_e, "t"), _S.read(_e, "t1")))) else _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.call_value(_S.read(_e, "seg"), [_S.read(_e, "t"), _S.read(_e, "t0"), _S.read(_e, "t1")]))]))

static func _f16(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "abs", [_S.binary("-", _S.call_value(_S.read(_e, "wrap"), [_S.read(_e, "x"), 2]), 1)]))

static func _f17(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	return _S.invoke(_S.read(_e, "Math"), "hypot", [_S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0")), _S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0"))])

static func _f18(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "x0", _S.arg(_args, 0))
	_S.define(_e, "y0", _S.arg(_args, 1))
	_S.define(_e, "x1", _S.arg(_args, 2))
	_S.define(_e, "y1", _S.arg(_args, 3))
	return _S.invoke(_S.read(_e, "Math"), "atan2", [_S.binary("-", _S.read(_e, "y1"), _S.read(_e, "y0")), _S.binary("-", _S.read(_e, "x1"), _S.read(_e, "x0"))])

static func _f19(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.read(_e, "t")

static func _f20(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.read(_e, "t"), _S.read(_e, "t"))

static func _f21(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.binary("*", _S.binary("-", 1, _S.read(_e, "t")), _S.binary("-", 1, _S.read(_e, "t"))))

static func _f22(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("*", _S.binary("*", 2, _S.read(_e, "t")), _S.read(_e, "t")) if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.5)) else _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", _S.binary("*", _S.unary("-", 2), _S.read(_e, "t")), 2), 2]), 2)))

static func _f23(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "t")), _S.read(_e, "t"))

static func _f24(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "t")), 3]))

static func _f25(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (_S.binary("*", _S.binary("*", _S.binary("*", 4, _S.read(_e, "t")), _S.read(_e, "t")), _S.read(_e, "t")) if _S.truth(_S.binary("<", _S.read(_e, "t"), 0.5)) else _S.binary("-", 1, _S.binary("/", _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("+", _S.binary("*", _S.unary("-", 2), _S.read(_e, "t")), 2), 3]), 2)))

static func _f26(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("*", _S.binary("*", _S.binary("*", _S.read(_e, "t"), _S.read(_e, "t")), _S.read(_e, "t")), _S.read(_e, "t"))

static func _f27(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", 1, _S.read(_e, "t")), 4]))

static func _f28(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<=", _S.read(_e, "t"), 0)) else _S.invoke(_S.read(_e, "Math"), "pow", [2, _S.binary("-", _S.binary("*", 10, _S.read(_e, "t")), 10)]))

static func _f29(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (1 if _S.truth(_S.binary(">=", _S.read(_e, "t"), 1)) else _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "pow", [2, _S.binary("*", _S.unary("-", 10), _S.read(_e, "t"))])))

static func _f30(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("-", 1, _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("/", _S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "Math"), "PI")), 2)]))

static func _f31(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("/", _S.binary("*", _S.read(_e, "t"), _S.prop(_S.read(_e, "Math"), "PI")), 2)])

static func _f32(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return _S.binary("/", _S.unary("-", _S.binary("-", _S.invoke(_S.read(_e, "Math"), "cos", [_S.binary("*", _S.prop(_S.read(_e, "Math"), "PI"), _S.read(_e, "t"))]), 1)), 2)

static func _f33(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "s", _S.coalesce(_S.arg(_args, 1), func(): return 1.70158))
	return (0 if _S.truth(_S.binary("<=", _S.read(_e, "t"), 0)) else (1 if _S.truth(_S.binary(">=", _S.read(_e, "t"), 1)) else _S.binary("-", _S.binary("*", _S.binary("*", _S.binary("*", _S.binary("+", _S.read(_e, "s"), 1), _S.read(_e, "t")), _S.read(_e, "t")), _S.read(_e, "t")), _S.binary("*", _S.binary("*", _S.read(_e, "s"), _S.read(_e, "t")), _S.read(_e, "t")))))

static func _f34(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "s", _S.coalesce(_S.arg(_args, 1), func(): return 1.70158))
	return (0 if _S.truth(_S.binary("<=", _S.read(_e, "t"), 0)) else (1 if _S.truth(_S.binary(">=", _S.read(_e, "t"), 1)) else _S.binary("+", _S.binary("+", 1, _S.binary("*", _S.binary("+", _S.read(_e, "s"), 1), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", _S.read(_e, "t"), 1), 3]))), _S.binary("*", _S.read(_e, "s"), _S.invoke(_S.read(_e, "Math"), "pow", [_S.binary("-", _S.read(_e, "t"), 1), 2])))))

static func _f35(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	return (0 if _S.truth(_S.binary("<=", _S.read(_e, "t"), 0)) else (1 if _S.truth(_S.binary(">=", _S.read(_e, "t"), 1)) else _S.binary("+", _S.binary("*", _S.invoke(_S.read(_e, "Math"), "pow", [2, _S.binary("*", _S.unary("-", 10), _S.read(_e, "t"))]), _S.invoke(_S.read(_e, "Math"), "sin", [_S.binary("*", _S.binary("-", _S.binary("*", _S.read(_e, "t"), 10), 0.75), _S.binary("/", _S.binary("*", 2, _S.prop(_S.read(_e, "Math"), "PI")), 3))])), 1)))

static func _f36(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "t", _S.arg(_args, 0))
	_S.define(_e, "n", 7.5625)
	_S.define(_e, "d", 2.75)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("/", 1, _S.read(_e, "d")))):
		return _S.binary("*", _S.binary("*", _S.read(_e, "n"), _S.read(_e, "t")), _S.read(_e, "t"))
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("/", 2, _S.read(_e, "d")))):
		return _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "n"), _S.write(_e, "t", _S.binary("/", 1.5, _S.read(_e, "d")), "-=", false)), _S.read(_e, "t")), 0.75)
	if _S.truth(_S.binary("<", _S.read(_e, "t"), _S.binary("/", 2.5, _S.read(_e, "d")))):
		return _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "n"), _S.write(_e, "t", _S.binary("/", 2.25, _S.read(_e, "d")), "-=", false)), _S.read(_e, "t")), 0.9375)
	return _S.binary("+", _S.binary("*", _S.binary("*", _S.read(_e, "n"), _S.write(_e, "t", _S.binary("/", 2.625, _S.read(_e, "d")), "-=", false)), _S.read(_e, "t")), 0.984375)

static func _f37(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ns", _args.slice(0))
	return _S.binary("/", _S.call_value(_S.read(_e, "hash"), _S.concat([_S.array(_S.read(_e, "ns"))])), 4294967296)

static func _f38(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "seed", _S.coalesce(_S.arg(_args, 0), func(): return 1))
	_S.set_prop(_S.read(_e, "this"), "s", _S.logical("||", _S.binary(">>>", _S.read(_e, "seed"), 0), func(): return 1), "=", false)
	return null

static func _f39(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "t", _S.set_prop(_S.read(_e, "this"), "s", _S.binary(">>>", _S.binary("+", _S.prop(_S.read(_e, "this"), "s"), 1831565813), 0), "=", false))
	_S.write(_e, "t", _S.invoke(_S.read(_e, "Math"), "imul", [_S.binary("^", _S.read(_e, "t"), _S.binary(">>>", _S.read(_e, "t"), 15)), _S.binary("|", _S.read(_e, "t"), 1)]), "=", false)
	_S.write(_e, "t", _S.binary("+", _S.read(_e, "t"), _S.invoke(_S.read(_e, "Math"), "imul", [_S.binary("^", _S.read(_e, "t"), _S.binary(">>>", _S.read(_e, "t"), 7)), _S.binary("|", _S.read(_e, "t"), 61)])), "^=", false)
	return _S.binary("/", _S.binary(">>>", _S.binary("^", _S.read(_e, "t"), _S.binary(">>>", _S.read(_e, "t"), 14)), 0), 4294967296)

static func _f40(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.binary("+", _S.read(_e, "a"), _S.binary("*", _S.binary("-", _S.read(_e, "b"), _S.read(_e, "a")), _S.invoke(_S.read(_e, "this"), "next", [])))

static func _f41(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "a", _S.arg(_args, 0))
	_S.define(_e, "b", _S.arg(_args, 1))
	return _S.invoke(_S.read(_e, "Math"), "floor", [_S.invoke(_S.read(_e, "this"), "range", [_S.read(_e, "a"), _S.binary("+", _S.read(_e, "b"), 1)])])

static func _f42(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "p", _S.arg(_args, 0))
	return _S.binary("<", _S.invoke(_S.read(_e, "this"), "next", []), _S.read(_e, "p"))

static func _f43(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return (_S.unary("-", 1) if _S.truth(_S.binary("<", _S.invoke(_S.read(_e, "this"), "next", []), 0.5)) else 1)

static func _f44(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	_S.define(_e, "list", _S.arg(_args, 0))
	return _S.prop(_S.read(_e, "list"), _S.invoke(_S.read(_e, "Math"), "floor", [_S.binary("*", _S.invoke(_S.read(_e, "this"), "next", []), _S.prop(_S.read(_e, "list"), "length"))]))

static func _f45(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "this", _this)
	return _S.binary("*", _S.binary("-", _S.binary("+", _S.binary("+", _S.binary("+", _S.invoke(_S.read(_e, "this"), "next", []), _S.invoke(_S.read(_e, "this"), "next", [])), _S.invoke(_S.read(_e, "this"), "next", [])), _S.invoke(_S.read(_e, "this"), "next", [])), 2), 1.732)

static func _f46(_parent, _args: Array, _this=null):
	var _e = _S.scope(_parent)
	_S.define(_e, "ns", _args.slice(0))
	return _S.construct(_S.read(_e, "Rng"), [_S.call_value(_S.read(_e, "hash"), _S.concat([_S.array(_S.read(_e, "ns"))]))])
