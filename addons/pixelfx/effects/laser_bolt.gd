@tool
extends "../core/effect.gd"
## Algorithm port of src/fx/projectiles/laser-bolt.js. MIT; see ../NOTICE.md and provenance.json.
const C = preload("../core/color.gd")
const M = preload("../core/math.gd")
const P = preload("../core/particles.gd")
const H = preload("analytic_helpers.gd")
const META = {"id": "pixelfx.laser_bolt", "name": "Laser bolt", "duration": 0.5, "loop": true, "fps": 30, "cacheable": true, "layers": ["front"], "options": {"palette": ["#2a0610", "#5c0d1c", "#9a1428", "#d8243a", "#ff4d5e", "#ff8a94", "#ffd0d4", "#ffffff"], "seed": 2, "length": 40.0}}
func metadata() -> Dictionary: return META
func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray()
	for color in META.options.palette: palette.append(Color(color))
	return [
		{"name":"length", "type":TYPE_FLOAT, "default":40.0, "min":8.0, "max":80.0, "hint":PROPERTY_HINT_RANGE, "hint_string":"8.0,80.0,1"},
		{"name":"seed", "type":TYPE_INT, "default":2},
		{"name":"light", "type":TYPE_FLOAT, "default":1.0, "min":0.0, "max":3.0, "hint":PROPERTY_HINT_RANGE, "hint_string":"0,3,0.05"},
		{"name":"palette", "type":TYPE_PACKED_COLOR_ARRAY, "default":palette}
	]
func bounds(o:Dictionary) -> Rect2i:
	var left := ceili(maxf(116,o.length+16))
	return Rect2i(-left,-24,left+28,48)
func draw(p,t:float,o:Dictionary) -> void:
	var c := C.fit(o.palette,8); var length:float=o.length; var seed_value:int=o.seed; var ph := t/META.duration; var fr := floori(t*30+1e-6)
	H.beat(t,META.duration,14,seed_value,func(r): return r.range_value(0.18,0.3),func(age,life,r):
		var k:float=age/life; var x0:float=-length*0.8-age*r.range_value(150,230); var l:float=r.range_value(3,7)*(1-k*0.5)
		var y:float=0.5+sin(x0*0.25+ph*TAU*2)*(0.5+k*1.5)+r.range_value(-0.6,0.6)*k
		if x0-l < -106 or M.rand([fr,r.int_value(0,999)]) < k*0.5: return
		p.line(x0,y,x0-l,y,c[5] if k < 0.3 else (c[4] if k < 0.6 else c[3]))
		if k < 0.4: p.glow(x0-l/2,y,4,c[4],0.3*(1-k))
	)
	p.shade(-length-1,-5,4,6,func(x,y,_out):
		var d:float=-x+3; var u:float=d/(length+3)
		if u < 0 or u > 1: return 0
		var head := sqrt(maxf(0,1-pow((3-d)/3,2))) if d < 3 else 1.0
		var w := (3.4*pow(1-u,0.9)+0.5)*head*(1+0.08*sin(d*0.9-ph*TAU*4)); var v:float=absf(y-0.5)/w
		if v > 1.2: return 0
		if v > 1 and (u > 0.5 or M.rand([floori(x),fr]) > 0.6): return 0
		var pulse := 1 if fposmod(d*0.05-ph*3,1) < 0.12 else 0
		var lvl := (7 if u < 0.6 else 6) if v < 0.22 else ((6-(1 if u > 0.5 else 0)) if v < 0.45 else (4 if v < 0.72 else (3 if v <= 1 else 2)))
		return c[mini(7,lvl+(pulse if v < 0.72 else 0))]
	)
	for s in [0,PI]:
		var d := 2.0
		while d < length*0.7:
			var a:float=d*0.45-ph*TAU*3+s; var y := 0.5+sin(a)*(2.2*(1-d/length)+0.6)
			if cos(a) > 0.3: p.dot(-d,y,C.WHITE if cos(a) > 0.8 else c[6])
			d += 1
	var g := 0.75+0.25*sin(ph*TAU*2)
	H.sparkle(p,1,0.5,3+M.js_round(g*2),c[6],c[4],0.5)
	p.glow_line(1,0.5,-length,0.5,9,c[3],0.4); p.glow(-2,0.5,20,c[3],0.5*g); p.glow(1,0.5,6,C.WHITE,0.25)
