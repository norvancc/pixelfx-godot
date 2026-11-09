@tool
extends "../../core/effect.gd"
## Port of src/fx/spawn/poof.js from the pinned PixelFX source.
## The cloud owns mutable balls and delayed stars, therefore it is deliberately non-cacheable.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const Sim = preload("../../core/sim.gd")
const P = Sim.P
const E = preload("../../core/ease.gd")

const META := {
	"id": "pixelfx.poof", "name": "Poof", "duration": 1.6, "loop": false, "fps": 30,
	"cacheable": false, "layers": ["back", "front"],
	"options": {
		"palette": ["#2a2440", "#5e5878", "#9a94b4", "#cdc8e0", "#f2f0fa", "#ffffff"],
		"stars": ["#ffd84a", "#fff3a6", "#ffffff"], "seed": 21,
	},
}
const CY := -17.0
var _cloud: Array = []
var _lines: Array = []
var _particles: Sim.Particles
var _lights: Sim.Lights
var _ramp: Array = []
var _stars: Array = []
var _t := 0.0

func metadata() -> Dictionary: return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray(); var stars := PackedColorArray()
	for value in META.options.palette: palette.append(Color(value))
	for value in META.options.stars: stars.append(Color(value))
	return [
		{"name": "seed", "type": TYPE_INT, "default": 21},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette},
		{"name": "stars", "type": TYPE_PACKED_COLOR_ARRAY, "default": stars},
	]

func bounds(_options: Dictionary) -> Rect2i: return Rect2i(-96, -128, 192, 176)

func create(o: Dictionary):
	var r := M.Rng.new(int(o.seed)); _ramp = C.fit(o.palette, 6); _stars = C.fit(o.stars, 3)
	_particles = Sim.Particles.new({"rng":r,"ground":func(_x): return 0.0,"sparks":[C.WHITE,_stars[1],_stars[0],_ramp[2]]}); _lights = Sim.Lights.new(); _cloud = []; _lines = []; _t = 0.0
	for i in range(9):
		var a := float(i) / 9.0 * TAU + r.range_value(-0.2, 0.2); var speed := r.range_value(95.0, 140.0); var radius := r.range_value(5.0, 7.0)
		_cloud.append({"x": cos(a) * 3.0, "y": CY + sin(a) * 3.0, "vx": cos(a) * speed, "vy": sin(a) * speed * 0.8 - 12.0, "r0": radius * 0.5, "r1": radius, "life": r.range_value(0.7, 1.05), "delay": r.range_value(0.0, 0.03)})
	for i in range(5):
		var a := r.range_value(0.0, TAU); var speed := r.range_value(20.0, 60.0)
		_cloud.append({"x": cos(a) * 2.0, "y": CY + sin(a) * 2.0, "vx": cos(a) * speed, "vy": sin(a) * speed - 16.0, "r0": 4.0, "r1": r.range_value(6.5, 8.5), "life": r.range_value(0.85, 1.2), "delay": r.range_value(0.02, 0.06)})
	for i in range(7):
		var a := r.range_value(0.0, TAU); var speed := r.range_value(170.0, 240.0); var radius := r.range_value(2.2, 3.6)
		_cloud.append({"x": cos(a) * 4.0, "y": CY + sin(a) * 4.0, "vx": cos(a) * speed, "vy": sin(a) * speed * 0.75 - 10.0, "r0": radius * 0.6, "r1": radius, "life": r.range_value(0.32, 0.5), "delay": r.range_value(0.01, 0.04)})
	for b in _cloud: b.max = b.life
	for i in range(12):
		var a := float(i) / 12.0 * TAU + r.range_value(-0.12, 0.12) + 0.13; var sa := sin(a)
		_lines.append({"a": a, "r1": minf(r.range_value(24.0, 34.0), (-2.0 - CY) / sa if sa > 0.1 else 99.0), "delay": r.range_value(0.0, 0.04)})
	for i in range(7):
		var a := r.range_value(-PI, 0.3); var speed := r.range_value(70.0, 125.0)
		_particles.spawn(P.STAR, cos(a) * 6.0, CY + sin(a) * 6.0, cos(a) * speed, sin(a) * speed - 30.0, r.range_value(0.55, 0.95), r.pick([_stars[2], _stars[1], _stars[1], _stars[0]]), r.range_value(1.3, 2.4), r.range_value(0.02, 0.1))
	for i in range(10):
		var a := r.range_value(0.0, TAU); var speed := r.range_value(40.0, 110.0)
		_particles.spawn(P.STAR, cos(a) * 5.0, CY + sin(a) * 5.0, cos(a) * speed, sin(a) * speed - 20.0, r.range_value(0.3, 0.6), r.pick([C.WHITE,_stars[1]]), 0.6, r.range_value(0.0, 0.08))
	for i in range(6):
		var sign := r.sign_value()
		_particles.spawn(P.DUST, sign * r.range_value(1.0, 6.0), -1.0, sign * r.range_value(25.0, 70.0), -r.range_value(2.0, 10.0), r.range_value(0.4, 0.7), _ramp[2], r.range_value(1.6, 3.0), r.range_value(0.02, 0.08))
	_lights.add(0,CY,46,_ramp[4],0.8,0.4)
	_lights.add(0,CY,22,C.WHITE,0.8,0.1)
	return self

func update(dt: float, _options: Dictionary) -> void:
	_t += dt
	for i in range(_cloud.size() - 1, -1, -1):
		var b: Dictionary = _cloud[i]
		if b.delay > 0.0: b.delay -= dt; continue
		b.life -= dt
		if b.life <= 0.0:
			if b.r1 > 4.0: _particles.spawn(P.STAR, b.x, b.y, 0.0, -8.0, 0.22, C.WHITE, 0.6, 0.0)
			_cloud.remove_at(i); continue
		b.vx -= b.vx * 7.0 * dt; b.vy -= b.vy * 7.0 * dt + 30.0 * dt; b.x += b.vx * dt
		var radius := _radius(b); b.y = minf(b.y + b.vy * dt, -radius * 0.7)
	_particles.update(dt); _lights.update(dt)

func _radius(b: Dictionary) -> float:
	var age: float = b.max - b.life; var u: float = age / b.max
	var grow: float = b.r0 + (b.r1 - b.r0) * E.out_back(age / 0.22, 2.0); var breathe := 1.0 + 0.06 * sin(age * 14.0 + b.r1)
	return grow * breathe * (1.0 if u < 0.62 else 1.0 - E.in_back((u - 0.62) / 0.38, 1.4))

func _draw_ball(p, b: Dictionary, layer: String) -> void:
	var age: float = b.max - b.life; var radius := _radius(b); var alpha := minf(1.0, age * 20.0); var lit := age < 0.12
	if radius < 0.6: return
	var hy: float = (b.y - CY + 6.0) / 14.0; var low: bool = hy > 0.4; var high: bool = hy < -0.3
	if layer == "shade": p.disc(b.x + radius * 0.16, b.y + radius * 0.2, radius, _ramp[3] if lit else (_ramp[1] if low else _ramp[2]), 0.8 * alpha)
	elif layer == "body": p.disc(b.x - radius * 0.06, b.y - radius * 0.08, radius * 0.86, _ramp[4] if lit else (_ramp[2] if low else _ramp[3]), 0.88 * alpha)
	elif not low or lit:
		p.disc(b.x - radius * 0.28, b.y - radius * 0.34, radius * 0.42, C.WHITE if lit or high else _ramp[4], 0.85 * alpha)
		if age < 0.25: p.disc(b.x - radius * 0.3, b.y - radius * 0.38, radius * 0.2, C.WHITE, 0.9 * alpha * (1.0 - age / 0.25))

func draw_back(p, _time: float, _options: Dictionary) -> void:
	var fade := 1.0 - M.smooth(0.1, 0.9, _t)
	if fade > 0.0: p.glow(0, -1, 26, _ramp[4], 0.25 * fade)
	_particles.draw(p,"back")

func draw(p, _time: float, _options: Dictionary) -> void:
	var live: Array = []
	for b in _cloud:
		if b.delay <= 0.0: live.append(b)
	for layer in ["shade", "body", "cap"]:
		for b in live: _draw_ball(p, b, layer)
	if _t < 0.07:
		var k := _t / 0.07; p.circle(0, CY, 9.0 + 3.0 * k, _ramp[4]); p.circle(0, CY, 7.0 + 3.0 * k, C.WHITE)
		Sim.flare(p,0,CY,20*(1-k*0.5),1-k,_ramp)
	var ring_k := (_t - 0.03) / 0.2
	if ring_k > 0.0 and ring_k < 1.0: p.ring(0, CY, 8.0 + 18.0 * E.out_cubic(ring_k), maxf(1.0, 2.5 * (1.0 - ring_k)), C.WHITE if ring_k < 0.3 else _ramp[4], 1.1 - ring_k)
	for line_data in _lines:
		var u: float = (_t - line_data.delay) / 0.2
		if u <= 0.0 or u >= 1.0: continue
		var head: float = 8.0 + (line_data.r1 - 8.0) * E.out_expo(clampf(u / 0.6, 0.0, 1.0)); var tail: float = 8.0 + (line_data.r1 - 8.0) * E.in_cubic(u); var ca: float = cos(line_data.a); var sa: float = sin(line_data.a)
		p.line(ca * tail, CY + sa * tail, ca * head, CY + sa * head, func(v): return C.WHITE if v > 0.6 else _ramp[4])
		p.glow_line(ca * tail, CY + sa * tail, ca * head, CY + sa * head, 3.0, _ramp[4], 0.25)
	_particles.draw(p,"front"); _lights.draw(p)
