@tool
extends RefCounted
## Mutable buffers owned by the frame (avoid PackedArray copy-on-write in Painter).
var w: int
var h: int
var ox: int
var oy: int
var color := PackedInt64Array()
var light := PackedInt64Array()
var rgba := PackedByteArray()
var _resolved_light:Dictionary={}
static var _light_channels:=PackedByteArray()
# Native adapters opt in; direct public buffer writes retain the full-scan default.
var track_writes := false
var dirty_x0: int
var dirty_y0: int
var dirty_x1 := -1
var dirty_y1 := -1

func _init(width: int, height: int, origin_x: int = 0, origin_y: int = 0) -> void:
	assert(width > 0 and height > 0)
	w = width; h = height; ox = origin_x; oy = origin_y
	color.resize(w * h); light.resize(w * h); rgba.resize(w * h * 4)
	clear()

func clear() -> void:
	color.fill(0); light.fill(0)
	dirty_x0=w; dirty_y0=h; dirty_x1=-1; dirty_y1=-1

func touch(x: int,y: int) -> void:
	if x<dirty_x0:dirty_x0=x
	if y<dirty_y0:dirty_y0=y
	if x>dirty_x1:dirty_x1=x
	if y>dirty_y1:dirty_y1=y

static func byte_clamp(x: float) -> int:
	# Uint8ClampedArray uses round-to-nearest, ties-to-even; Godot round() does not.
	x = clampf(x, 0, 255)
	var low := floori(x)
	if x - low == 0.5: return low if low % 2 == 0 else low + 1
	return floori(x + 0.5)

func composite(bg = null, light_k: float = 1) -> PackedByteArray:
	if _light_channels.is_empty():
		_light_channels.resize(32896)
		for alpha in range(1,256):
			var normalized:float=alpha/255.0;var base:int=alpha*(alpha+1)/2
			for channel in range(alpha+1):_light_channels[base+channel]=byte_clamp(channel/normalized)
	var normalized_channels:PackedByteArray=_light_channels
	var output:PackedByteArray=rgba
	rgba=PackedByteArray()
	output.fill(0)
	var sparse: bool=track_writes and bg==null
	var x0: int=dirty_x0 if sparse else 0; var x1: int=dirty_x1+1 if sparse else w
	var y0: int=dirty_y0 if sparse else 0; var y1: int=dirty_y1+1 if sparse else h
	if _resolved_light.size()>32768:_resolved_light.clear()
	var resolved:Dictionary=_resolved_light
	var transparent_background:bool=bg==null;var full_light:bool=light_k==1
	var lookup:bool=transparent_background and full_light
	for yy in range(y0,y1):
		var row:int=yy*w
		for xx in range(x0,x1):
			var i: int=row+xx
			var c: int = color[i]; var l: int = light[i] & 0xffffff
			if c == 0 and l == 0 and transparent_background: continue
			var ca: int = (c >> 24) & 255
			var j: int = i*4
			if l==0 and (transparent_background or ca==255):
				output.encode_u32(j,c&0xffffffff)
				continue
			if ca==255 and full_light:
				output[j]=mini(255,(c&255)+(l&255));output[j+1]=mini(255,((c>>8)&255)+((l>>8)&255));output[j+2]=mini(255,((c>>16)&255)+((l>>16)&255));output[j+3]=255
				continue
			var packed_key:int=(c<<24)|l
			var packed:int=resolved.get(packed_key,-1) if lookup else -1
			if packed>=0:
				output.encode_u32(j,packed)
				continue
			if c==0 and lookup:
				var red:int=l&255;var green:int=(l>>8)&255;var blue:int=(l>>16)&255;var alpha:int=maxi(red,maxi(green,blue));var base:int=alpha*(alpha+1)/2
				output[j]=normalized_channels[base+red];output[j+1]=normalized_channels[base+green];output[j+2]=normalized_channels[base+blue];output[j+3]=alpha
				resolved[packed_key]=int(output[j])|(int(output[j+1])<<8)|(int(output[j+2])<<16)|(alpha<<24)
				continue
			var r: float = c & 255; var g: float = (c >> 8) & 255; var b: float = (c >> 16) & 255; var a: float = ca
			if ca != 255 and bg != null:
				var k: int = bg if bg is int else bg[i]
				var f: float = ca / 255.0
				r = r * f + (k & 255) * (1 - f); g = g * f + ((k >> 8) & 255) * (1 - f); b = b * f + ((k >> 16) & 255) * (1 - f); a = 255
			if l:
				var lr: float = (l & 255) * light_k; var lg: float = ((l >> 8) & 255) * light_k; var lb: float = ((l >> 16) & 255) * light_k
				if a < 255:
					var pa := a / 255
					var na := minf(1, maxf(pa, maxf(lr, maxf(lg, lb)) / 255))
					if na > 0:
						r = minf(255, (r * pa + lr) / na); g = minf(255, (g * pa + lg) / na); b = minf(255, (b * pa + lb) / na); a = na * 255
				else:
					r = minf(255, r + lr); g = minf(255, g + lg); b = minf(255, b + lb)
			output[j] = byte_clamp(r); output[j + 1] = byte_clamp(g); output[j + 2] = byte_clamp(b); output[j + 3] = byte_clamp(a)
			if lookup:resolved[packed_key]=int(output[j])|(int(output[j+1])<<8)|(int(output[j+2])<<16)|(int(output[j+3])<<24)
	rgba=output
	return rgba

func image(bg = null) -> Image:
	return Image.create_from_data(w, h, false, Image.FORMAT_RGBA8, composite(bg))
