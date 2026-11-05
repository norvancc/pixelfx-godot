class_name PixelFXPreloader
extends Node
## Optional loading-screen prewarm. Generates frames from algorithms, not imported atlases.
signal progress(current: int, total: int)
const Fx = preload("../core/fx.gd")
const Renderer = preload("renderer.gd")
const Cache = preload("frame_cache.gd")
var _generation := 0
func cancel() -> void: _generation += 1
func warmup(preset, overrides: Dictionary = {}, requested_fps: int = 0) -> Dictionary:
	_generation += 1
	var generation := _generation
	var result: Dictionary = preset.resolve(overrides)
	if not result.ok: return result
	if not result.meta.get("cacheable", false): return {"ok": false, "errors": ["Only time-addressable effects can be prewarmed."]}
	var fps: int = requested_fps if requested_fps > 0 else result.meta.fps
	if fps < 1 or fps > 120: return {"ok": false, "errors": ["fps must be in 1..120."]}
	var count := ceili(float(result.meta.duration) * fps)
	if count > 600: return {"ok": false, "errors": ["Prewarm is limited to 600 frames per request."]}
	var estimated: int = count * result.bounds.size.x * result.bounds.size.y * 8 * result.meta.get("layers", ["front"]).size()
	if estimated > Cache.max_bytes or count > Cache.max_entries:
		return {"ok": false, "errors": ["The full effect exceeds the configured cache budget."]}
	var signature: String = preset.signature(result.options, result.bounds)
	var fx = Fx.new(preset.new_module(), result.options)
	var renderer = Renderer.new()
	for i in range(count):
		if generation != _generation or not is_inside_tree(): return {"ok": false, "cancelled": true}
		fx.t = float(i) / fps
		renderer.render(fx, result.bounds, fps, signature, true)
		progress.emit(i + 1, count)
		await get_tree().process_frame
	return {"ok": true, "frames": count}
