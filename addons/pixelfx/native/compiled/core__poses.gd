@tool
extends RefCounted
## Generated native GDScript from pinned PixelFX core/poses.js; MIT Patch / Hugo Duprez.
## Regenerate with tools/pixelfx/codegen/generate.mjs; no JavaScript runtime is shipped.
const _S = preload("../semantics.gd")
static func build(_script) -> Dictionary:
	var _e = _S.scope(null, _script)
	var _exports: Dictionary = {}
	_S.define(_e, "READY", _S.merge([{"crouch": 3}, {"fx": 11}, {"fy": _S.unary("-", 21)}, {"bx": 9}, {"by": _S.unary("-", 21)}, {"ffx": 7}, {"fbx": _S.unary("-", 7)}]))
	_exports["READY"] = _S.read(_e, "READY")
	_exports["__scope"] = _e
	return _exports

