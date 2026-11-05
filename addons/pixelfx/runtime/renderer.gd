@tool
extends RefCounted
const Frame = preload("../core/frame.gd")
const Cache = preload("frame_cache.gd")
var _frames: Dictionary = {}
var _images: Dictionary = {}
var _textures: Dictionary = {}
var last_render_ms := 0.0
var cache_hit := false

func render(fx, rect: Rect2i, fps: int, signature: String, caching: bool) -> Dictionary:
	var start := Time.get_ticks_usec()
	cache_hit = false
	var use_cache: bool = caching and fx.meta.get("cacheable", false) and fx.stop_at == INF
	var original_time: float = fx.t
	var duration: float = fx.meta.duration
	var phase := fposmod(original_time, duration) if fx.meta.get("loop", false) else minf(original_time, duration)
	var sample_index := floori(phase * fps + 1e-8)
	if fx.meta.get("loop", false): sample_index = mini(sample_index, ceili(duration * fps) - 1)
	var key := signature + ":%d:%d" % [fps, sample_index]
	if use_cache:
		var cached := Cache.fetch(key)
		if not cached.is_empty():
			cache_hit = true; last_render_ms = (Time.get_ticks_usec() - start) / 1000.0
			return cached
		fx.t = minf(float(sample_index) / fps, duration)
	var packet := {"front": null, "back": null, "bounds": rect, "bytes": 0}
	for layer in fx.meta.get("layers", ["front"]):
		var frame = _frames.get(layer)
		if frame == null or frame.w != rect.size.x or frame.h != rect.size.y or frame.ox != rect.position.x or frame.oy != rect.position.y:
			frame = Frame.new(rect.size.x, rect.size.y, rect.position.x, rect.position.y)
			_frames[layer] = frame; _images.erase(layer); _textures.erase(layer)
		frame.clear(); fx.draw(frame, layer)
		var bytes: PackedByteArray = frame.composite()
		if use_cache:
			packet[layer] = ImageTexture.create_from_image(Image.create_from_data(frame.w, frame.h, false, Image.FORMAT_RGBA8, bytes))
		else:
			if not _images.has(layer):
				_images[layer] = Image.create_from_data(frame.w, frame.h, false, Image.FORMAT_RGBA8, bytes)
				_textures[layer] = ImageTexture.create_from_image(_images[layer])
			else:
				_images[layer].set_data(frame.w, frame.h, false, Image.FORMAT_RGBA8, bytes)
				_textures[layer].update(_images[layer])
			packet[layer] = _textures[layer]
		packet.bytes += rect.size.x * rect.size.y * 8
	fx.t = original_time
	if use_cache: Cache.store(key, packet)
	last_render_ms = (Time.get_ticks_usec() - start) / 1000.0
	return packet
