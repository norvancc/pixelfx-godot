@tool
class_name PixelFXFrameCache
extends RefCounted
## Bounded LRU of immutable runtime-generated frames, shared across players.
## GPU copies estimated at RGBA8 size. Active player references are not evicted from those players.
static var max_bytes := 32 * 1024 * 1024
static var max_entries := 256
static var _entries: Dictionary = {}
static var _clock := 0
static var _bytes := 0
static var hits := 0
static var misses := 0
static var evictions := 0

static func fetch(key: String) -> Dictionary:
	_clock += 1
	if _entries.has(key):
		hits += 1; _entries[key].used = _clock
		return _entries[key].packet
	misses += 1
	return {}

static func store(key: String, packet: Dictionary) -> void:
	var cost: int = packet.bytes
	if cost > max_bytes or max_entries <= 0: return
	if _entries.has(key): _bytes -= _entries[key].cost; _entries.erase(key)
	while not _entries.is_empty() and (_bytes + cost > max_bytes or _entries.size() >= max_entries):
		var oldest := ""; var age := 9223372036854775807
		for entry_key in _entries:
			if _entries[entry_key].used < age: oldest = entry_key; age = _entries[entry_key].used
		_bytes -= _entries[oldest].cost; _entries.erase(oldest); evictions += 1
	_clock += 1
	_entries[key] = {"packet": packet, "used": _clock, "cost": cost}; _bytes += cost

static func clear(reset_statistics: bool = true) -> void:
	_entries.clear(); _bytes = 0
	if reset_statistics: hits = 0; misses = 0; evictions = 0

static func statistics() -> Dictionary:
	return {"entries": _entries.size(), "bytes": _bytes, "limit_bytes": max_bytes, "hits": hits, "misses": misses, "evictions": evictions}

static func configure(memory_mb: int = 32, frame_limit: int = 256) -> bool:
	if memory_mb < 0 or memory_mb > 1024 or frame_limit < 0 or frame_limit > 10000: return false
	clear(); max_bytes = memory_mb * 1024 * 1024; max_entries = frame_limit
	return true
