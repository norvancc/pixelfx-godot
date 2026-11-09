@tool
extends "../../core/effect.gd"
## Port of src/fx/impacts/hit-spark.js from the pinned PixelFX source.
## This is intentionally stateful: sparks and chips fall and bounce, so seek and frame caching are disabled.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const Sim = preload("../../core/sim.gd")
const P = Sim.P

var _ramp: Array = []
var _particles: Sim.Particles
var _lights: Sim.Lights
var _rays: Array = []
var _time := 0.0
var _x := 0.0
var _y := 0.0
var _aim := 0.0

const META := {
	"id": "pixelfx.hit_spark",
	"name": "Hit spark",
	"duration": 0.5,
	"loop": false,
	"fps": 30,
	"cacheable": false,
	"layers": ["front"],
	"options": {
		"palette": ["#4a1712", "#c9281f", "#f2561d", "#ff8a2a", "#ffe26b", "#fff3a6", "#ffffff"],
		"height": 20.0,
		"aim": 0.1,
		"seed": 4,
	},
}

func metadata() -> Dictionary:
	return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray()
	for value in META.options.palette: palette.append(Color(value))
	return [
		{"name": "height", "type": TYPE_FLOAT, "default": 20.0, "min": 1.0, "max": 64.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "1,64,1"},
		{"name": "aim", "type": TYPE_FLOAT, "default": 0.1, "min": -PI, "max": PI, "hint": PROPERTY_HINT_RANGE, "hint_string": "-3.14159,3.14159,0.01"},
		{"name": "seed", "type": TYPE_INT, "default": 4},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette},
	]

func bounds(_options: Dictionary) -> Rect2i:
	# Include the aim cone, bounced chips and the glow falloff. The frame is deliberately
	# larger than the upstream nominal canvas so height/aim extremes cannot be clipped.
	return Rect2i(-128, -ceili(_options.height + 128), 256, ceili(_options.height + 192))

func _ray(p, x: float, y: float, angle: float, length: float, width: float, ramp: Array, from_u: float = 0.0) -> void:
	var ca := cos(angle); var sa := sin(angle)
	var d := from_u * length
	while d <= length:
		var u := d / length
		var half := width * pow(1.0 - u, 1.6)
		var colour: int = C.WHITE if u < 0.3 else (ramp[5] if u < 0.62 else (ramp[4] if u < 0.88 else ramp[3]))
		p.px(x + ca * d, y + sa * d, colour)
		var side := 0.5
		while side <= half:
			for edge in [-side, side]:
				p.px(x + ca * d - sa * edge, y + sa * d + ca * edge, ramp[5] if u < 0.3 and side < 1.0 else ramp[4])
			side += 0.5
		d += 0.5

func _diamond(p, x: float, y: float, radius: int, ramp: Array) -> void:
	for dy in range(-radius - 1, radius + 2):
		for dx in range(-radius - 1, radius + 2):
			var manhattan := absi(dx) + absi(dy)
			if manhattan <= radius: p.px(x + dx, y + dy, C.WHITE)
			elif manhattan == radius + 1: p.px(x + dx, y + dy, ramp[3])

func create(o: Dictionary):
	_ramp = C.fit(o.palette, 7)
	var r := M.Rng.new(int(o.seed))
	_particles = Sim.Particles.new({"rng":r,"ground":func(_x): return 0.0,"sparks":[_ramp[6],_ramp[5],_ramp[4],_ramp[2]]})
	_lights = Sim.Lights.new()
	_x = 0.0; _y = -float(o.height); _aim = float(o.aim); _time = 0.0
	var tilt := r.range_value(-0.08, 0.08)
	_rays = [
		{"a":_aim+tilt,"length":r.range_value(33,37),"width":2.2},
		{"a":_aim+PI+tilt,"length":r.range_value(8,10),"width":2.2},
		{"a":_aim-PI/2+tilt,"length":r.range_value(15,18),"width":2.6},
		{"a":_aim+PI/2+tilt,"length":r.range_value(10,12),"width":2.3},
		{"a":_aim-PI/4+tilt,"length":r.range_value(5,7),"width":1.0},
	]
	_lights.add(_x,_y,38,_ramp[4],0.35,0.18)
	_lights.add(_x+cos(_aim)*10,_y+sin(_aim)*10,22,_ramp[5],0.45,0.1)
	_lights.add(_x,-2,26,_ramp[3],0.22,0.22)
	for i in range(9):
		var a = _aim+r.range_value(-0.6,0.6)-0.15; var v = r.range_value(170,360)
		_particles.spawn(P.SPARK,_x+1,_y,cos(a)*v,sin(a)*v-40,r.range_value(0.25,0.45),C.WHITE,1,r.range_value(0.01,0.03) if i > 6 else 0)
	for i in range(6):
		var a = _aim+r.range_value(-1.1,0.5)-0.3; var v = r.range_value(70,170)
		_particles.spawn(P.GRIT,_x+1,_y,cos(a)*v,sin(a)*v-r.range_value(30,80),r.range_value(0.35,0.45),r.pick([_ramp[5],_ramp[4],_ramp[4],_ramp[3]]),1)
	return self

func update(dt: float, _options: Dictionary) -> void:
	_time += dt; _particles.update(dt); _lights.update(dt)

func draw(p, _time_argument: float, _options: Dictionary) -> void:
	_particles.draw(p)
	if _time < 0.025:
		for ray in _rays: _ray(p, _x, _y, ray.a, ray.length, ray.width, _ramp)
		_diamond(p, _x, _y, 4, _ramp)
	elif _time < 0.058:
		for ray in _rays: _ray(p, _x, _y, ray.a, ray.length * 1.2, ray.width * 0.55, _ramp, 0.12)
		_diamond(p, _x, _y, 3, _ramp)
	elif _time < 0.092:
		var ray = _rays[0]
		_ray(p, _x, _y, ray.a, ray.length * 1.3, 0.6, [_ramp[0],_ramp[1],_ramp[2],_ramp[3],_ramp[3],_ramp[4]],0.4)
	var pop = exp(-_time/0.045)
	if pop > 0.02:
		p.glow(_x,_y,22,_ramp[4],0.3*pop); p.glow(_x,_y,7,C.WHITE,0.15*pop)
		p.glow_line(_x,_y,_x+cos(_aim)*26,_y+sin(_aim)*26,4,_ramp[5],0.25*pop)
	_lights.draw(p)
