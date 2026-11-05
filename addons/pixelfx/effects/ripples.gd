@tool
extends "../core/effect.gd"
## Algorithm port of src/fx/water/ripples.js. MIT; see ../NOTICE.md and provenance.json.
const C = preload("../core/color.gd")
const M = preload("../core/math.gd")
const P = preload("../core/particles.gd")
const H = preload("analytic_helpers.gd")
const META = {"id": "pixelfx.ripples", "name": "Ripples", "duration": 2.0, "loop": true, "fps": 30, "cacheable": true, "layers": ["back", "front"], "options": {"palette": ["#0a1630", "#123063", "#1b5596", "#2a7fc4", "#45a9e3", "#86d3f5", "#cdf1ff", "#ffffff"], "seed": 2}}
func metadata() -> Dictionary: return META
func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray()
	for color in META.options.palette: palette.append(Color(color))
	return [
		{"name":"seed", "type":TYPE_INT, "default":2},
		{"name":"light", "type":TYPE_FLOAT, "default":1.0, "min":0.0, "max":3.0, "hint":PROPERTY_HINT_RANGE, "hint_string":"0,3,0.05"},
		{"name":"palette", "type":TYPE_PACKED_COLOR_ARRAY, "default":palette}
	]
const SY := 0.26
func bounds(_o:Dictionary) -> Rect2i: return Rect2i(-68,-44,136,88)
func _radius(a:float) -> float: return 2+58*(1-pow(1-a/2,3))
func _power(a:float) -> float: return pow(1-a/2,1.5)*minf(1,a/0.08)
func _alive(t:float) -> Array:
	var result := []
	for k in range(4):
		# Retain upstream's double remainder, including its floating-point rounding.
		var a := fmod(fmod(t-k*0.5,2)+2,2)
		if a < 2: result.append([a,M.js_round(fmod(fmod(t-a,2)+2,2)/0.5)])
	return result
func _surface(p,c:Array,t:float) -> void:
	var rings := []
	for pair in _alive(t): rings.append([_radius(pair[0]),_power(pair[0]),3+pair[0]*2.2])
	for yy in range(floori(-64*SY),ceili(64*SY)):
		for xx in range(-64,64):
			var x := xx+0.5; var y := yy+0.5; var z := y/SY; var r := sqrt(x*x+z*z); var e := r/64
			if e > 1: continue
			var edge := 1-M.smooth(0.6,1,e)
			p.blend(x,y,c[1],0.55*edge)
			var slope := 0.0
			for q in rings:
				var d:float=r-q[0]; var w:float=q[2]
				if d > 2.2*w or d < -2.2*w: continue
				slope += q[1]*exp(-pow(d/w,2))*-sin(d*1.15)*1.15
			if slope == 0: continue
			var face := slope*(-(x*-0.55+z*-0.84)/maxf(1,r))
			if face > 0.18: p.blend(x,y,c[5] if face > 0.6 else c[4],minf(0.9,(face-0.18)*2.2)*edge)
			elif face < -0.25: p.blend(x,y,c[0],minf(0.8,(-face-0.25)*2)*edge)
func _rings(p,c:Array,t:float,half:int) -> void:
	for pair in _alive(t):
		var a:float=pair[0]; var k := _power(a)
		H.water_ring(p,_radius(a),SY,0.85*k,c,3+a*1.4,half,a < 0.14,k if half > 0 and a > 0.1 else 0.0,pair[1]+1,0.4+a*1.1)
func draw_back(p,t:float,o:Dictionary) -> void:
	var c := C.fit(o.palette,8)
	_surface(p,c,t); _rings(p,c,t,-1)
func draw(p,t:float,o:Dictionary) -> void:
	var c := C.fit(o.palette,8)
	_rings(p,c,t,1)
	for pair in _alive(t):
		var a:float=pair[0]
		if a < 0.08:
			p.px(0,0,C.WHITE); p.px(-1,0,c[6]); p.px(1,0,c[6]); p.glow(0,0,8,c[5],0.5*(1-a/0.08))
		var b := a-0.04; var h := 90*b-0.5*700*b*b
		if b > 0 and h > 0: p.px(0,-h,C.WHITE); p.px(0,-h+1,c[5])
	P.cycle(t,META.duration,10,o.seed+5,func(g): return g.range_value(0.25,0.45),func(age,life,r,_i):
		var all := _alive(t); var a:float=all[floori(r.next()*all.size())][0]
		var ang:float=r.range_value(0.3,PI-0.3); var rad := _radius(a); var k := sin((PI*age)/life)*_power(a)
		if k < 0.15 or rad < 6: return
		var x := cos(ang)*rad; var y := sin(ang)*rad*SY
		p.px(x,y,C.WHITE)
		if k > 0.5:
			for v in H.CROSS: p.px(x+v[0],y+v[1],c[6])
		p.glow(x,y,5,c[5],0.4*k)
	)
	p.glow(0,0,40,c[4],0.14); p.glow(0,0,14,c[5],0.12)
