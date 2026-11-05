@tool
extends "../core/effect.gd"
## Algorithm port of src/fx/holy/sunburst.js. MIT; see ../NOTICE.md and provenance.json.
const C = preload("../core/color.gd")
const M = preload("../core/math.gd")
const P = preload("../core/particles.gd")
const H = preload("analytic_helpers.gd")
const META = {"id": "pixelfx.sunburst", "name": "Sunburst", "duration": 4.0, "loop": true, "fps": 30, "cacheable": true, "layers": ["front"], "options": {"palette": ["#3b1d2a", "#7a3a2c", "#c4652e", "#f0a040", "#ffd25e", "#fff0a0", "#fffbe0", "#ffffff"], "seed": 3, "rays": 8}}
func metadata() -> Dictionary: return META
func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray()
	for color in META.options.palette: palette.append(Color(color))
	return [
		{"name":"rays", "type":TYPE_INT, "default":8, "min":2, "max":16, "hint":PROPERTY_HINT_RANGE, "hint_string":"2,16,1"},
		{"name":"seed", "type":TYPE_INT, "default":3},
		{"name":"light", "type":TYPE_FLOAT, "default":1.0, "min":0.0, "max":3.0, "hint":PROPERTY_HINT_RANGE, "hint_string":"0,3,0.05"},
		{"name":"palette", "type":TYPE_PACKED_COLOR_ARRAY, "default":palette}
	]
func bounds(_o:Dictionary) -> Rect2i: return Rect2i(-64,-64,128,128)
func _ray(p,c:Array,a:float,length:float,w0:float,k:float) -> void:
	var ca := cos(a); var sa := sin(a); var x1 := ca*(9+length); var y1 := sa*(9+length); var pad := w0+1
	p.shade(minf(0,x1)-pad,minf(0,y1)-pad,maxf(0,x1)+pad,maxf(0,y1)+pad,func(x,y,out):
		var along:float=x*ca+y*sa-9; var u:float=along/length
		if u < 0 or u > 1: return
		var across:float=absf(-x*sa+y*ca); var w := (w0/2)*(1-u*0.85)+0.25
		if across > w: return
		var spine := across < 0.5; var rim := across > w-0.6 and w > 0.9
		out.c=(C.WHITE if u < 0.4 else (c[6] if u < 0.75 else c[5])) if spine else (c[3] if rim and u > 0.15 else (c[6] if u < 0.3 else (c[5] if u < 0.62 else c[4])))
		out.a=k if u < 0.72 else k*(1-(u-0.72)/0.28)*1.2
	)
	p.glow_line(ca*9,sa*9,ca*(9+length*0.8),sa*(9+length*0.8),5,c[5],0.16*k)
func draw(p,t:float,o:Dictionary) -> void:
	var c := C.fit(o.palette,8); var n:int=o.rays*2; var rot:float=(t/META.duration)*((2*TAU)/n); var ph := t/META.duration
	p.glow(0,0,62,c[4],0.3+0.06*sin(ph*TAU*2))
	for i in range(n):
		var a := rot+((i+0.5)*TAU)/n; var length := 14+6*sin(a*3+ph*TAU)
		p.line(cos(a)*10,sin(a)*10,cos(a)*(9+length),sin(a)*(9+length),func(u): return c[6] if u < 0.3 else c[5],func(u): return 0.7-u*0.8)
	for i in range(n):
		var a := rot+(i*TAU)/n; var long_ray := i % 2 == 0; var breathe := 0.86+0.14*sin(a*3-ph*TAU*2)
		var length := (36 if long_ray else 21)*breathe
		_ray(p,c,a,length,4 if long_ray else 2.6,1)
		if long_ray:
			var g := M.fract(ph*2+(a*3)/TAU); var r := 9+g*length
			if g < 0.9:
				p.px(cos(a)*r,sin(a)*r,C.WHITE); p.glow(cos(a)*r,sin(a)*r,5,c[6],0.45*(1-g))
			else: H.sparkle(p,cos(a)*(9+length),sin(a)*(9+length),1+3*sin(((g-0.9)/0.1)*PI),C.WHITE,c[6],0.5)
	p.shade(-9.5,-9.5,9.5,9.5,func(x,y,out):
		var d := sqrt(x*x+y*y)
		if d > 7.5: return
		var flick := 0.5+0.5*sin(atan2(y,x)*5+ph*TAU*3)
		out.c=C.WHITE if d < 4.5 else ((C.WHITE if flick > 0.6 else c[6]) if d < 6 else (c[5] if flick > 0.5 else c[4]))
	)
	p.glow(0,0,16,C.WHITE,0.28)
	P.cycle(t,META.duration,10,o.seed,func(g): return g.range_value(0.35,0.7),func(age,life,r,_i):
		var a:float=r.range_value(0,TAU); var d:float=r.range_value(16,44); var k := sin((age/life)*PI)
		H.sparkle(p,cos(a)*d,sin(a)*d,1+2.4*k*r.range_value(0.5,1),C.WHITE,c[5],0.4*k)
	)
