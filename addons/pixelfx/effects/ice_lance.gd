@tool
extends "../core/effect.gd"
## Algorithm port of src/fx/ice/ice-lance.js. MIT; see ../NOTICE.md and provenance.json.
const C = preload("../core/color.gd")
const M = preload("../core/math.gd")
const P = preload("../core/particles.gd")
const H = preload("analytic_helpers.gd")
const META = {"id": "pixelfx.ice_lance", "name": "Ice lance", "duration": 0.8, "loop": true, "fps": 30, "cacheable": true, "layers": ["front"], "options": {"palette": ["#151a3d", "#212f6b", "#2c58aa", "#3a8bd8", "#62c8f4", "#a6ecff", "#dcfbff", "#ffffff"], "seed": 13, "length": 40.0}}
func metadata() -> Dictionary: return META
func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray()
	for color in META.options.palette: palette.append(Color(color))
	return [
		{"name":"length", "type":TYPE_FLOAT, "default":40.0, "min":20.0, "max":80.0, "hint":PROPERTY_HINT_RANGE, "hint_string":"20.0,80.0,1"},
		{"name":"seed", "type":TYPE_INT, "default":13},
		{"name":"light", "type":TYPE_FLOAT, "default":1.0, "min":0.0, "max":3.0, "hint":PROPERTY_HINT_RANGE, "hint_string":"0,3,0.05"},
		{"name":"palette", "type":TYPE_PACKED_COLOR_ARRAY, "default":palette}
	]
func bounds(o:Dictionary) -> Rect2i:
	# Include the fastest falling shard, the frost wake and its soft light.
	var left := ceili(o.length+160)
	return Rect2i(-left,-56,left+40,112)
func draw(p,t:float,o:Dictionary) -> void:
	var c := C.fit(o.palette,8); var length:float=o.length; var ph := t/META.duration; var seed_value:int=o.seed
	p.each(-length-100,-12,-length+4,12,func(x,y,sx,sy):
		var u:float=(-length+4-x)/104; var w := 4.5*pow(1-u,0.7)+0.5+1.5*sin(u*9-ph*TAU*2)*u; var v:float=absf(y)/w
		if v >= 1: return
		var a := (1-v*v)*pow(1-u,1.4)
		if a < 0.04: return
		p.blend_px(sx,sy,c[6] if v < 0.25 and u < 0.4 else (c[5] if v < 0.6 else c[4]),a*0.7)
		if a > 0.3: p.add(sx,sy,c[5],0.12*a)
	)
	p.glow_line(-length-60,0,0,0,14,c[4],0.22)
	P.cycle(t,META.duration,14,seed_value,func(g): return g.range_value(0.35,0.55),func(age,life,r,_i):
		var x0:float=r.range_value(-length+2,-8)
		var pos := P.fly(x0,r.range_value(-2.5,2.5),-r.range_value(150,230),r.sign_value()*r.range_value(8,30),age,0,2.2)
		var k:float=age/life; var rad := 1.2+5.5*k; var a := 0.5*pow(1-k,1.3)
		p.disc(pos[0],pos[1],rad,c[6] if k < 0.3 else c[5],func(d,_angle): return a*(1-d*d))
		p.glow(pos[0],pos[1],rad*1.6,c[4],0.1*(1-k))
	)
	P.cycle(t,META.duration,9,seed_value+1,func(g): return g.range_value(0.4,0.6),func(age,life,r,_i):
		var pos := P.fly(r.range_value(-length,-6),r.range_value(-3,3),-r.range_value(170,260),r.range_value(-35,35),age,60,1.2)
		var k:float=age/life; var a:float=r.range_value(0,TAU)+age*r.range_value(10,18)*r.sign_value(); var l:float=r.range_value(1.2,2.2)
		var ca := cos(a); var sa := sin(a)
		if k > 0.85 and fmod(age*30,2) < 1: return
		p.line(pos[0]-ca*l,pos[1]-sa*l,pos[0]+ca*l,pos[1]+sa*l,c[5]); p.px(pos[0]+ca*l,pos[1]+sa*l,C.WHITE)
		if cos(a*2) > 0.9:
			for v in H.CROSS: p.px(pos[0]+v[0],pos[1]+v[1],c[6])
			p.glow(pos[0],pos[1],6,c[5],0.45)
	)
	P.cycle(t,META.duration,12,seed_value+2,func(g): return g.range_value(0.16,0.26),func(age,life,r,_i):
		var y:float=r.sign_value()*r.range_value(4,13); var x:float=r.range_value(-20,0)-age*r.range_value(280,380); var l:float=r.range_value(6,16); var k:float=age/life
		p.line(x,y,x+l,y,func(u): return c[6] if u > 0.7 else c[4],func(u): return u*(1-k)*1.4)
	)
	for i in range(3):
		var q := fmod(ph*3+float(i)/3,1); var x := -4-q*(length+20); var ry := 4.5+q*8; var rx := 1.2+q*2.6
		if q > 0.8: continue
		for k in range(40):
			var an := float(k)/40*TAU; var xx := x+cos(an)*rx; var yy := sin(an)*ry
			if absf(yy) < 4.6 and xx > -length-2: continue
			p.px(xx,yy,(C.WHITE if q < 0.35 else c[6]) if cos(an) > 0 else (c[5] if q < 0.4 else c[4]))
		p.glow_ring(x,0,ry*0.75,3,c[5],0.14*(1-q))
	for v in [[-1,10,4],[1,9,4],[-0.2,6,3]]: H.blade(p,-length+3,v[0]*1.5,-length+3-v[1],v[0]*(2+v[1]*0.5),v[2],c)
	var pulse := -length+fmod(ph*2,1)*(length+6); var glint := -fmod(ph*2+0.5,1)*length*1.2
	p.shade(-length-1,-5.5,1,5.5,func(x,y,out):
		if x > 0 or x < -length: return
		var h:float=3.5*(-x/16)+0.3 if x > -16 else (3.5*(0.7+0.3*((x+length)/3)) if x < -length+3 else 3.5)
		if absf(y) > h+0.5:
			if absf(y) < h+1.5: out.c=c[1]
			return
		var v:float=y/maxf(0.5,h)
		if x > -1.5 or (v > -0.3 and v < 0.35 and absf(x-pulse) < 2.5) or (v < -0.3 and absf(x-glint) < 1): out.c=C.WHITE; return
		out.c=C.WHITE if v < -0.72 else (c[6] if v < -0.36 else (c[7] if v < -0.18 else (c[4] if v < 0.38 else (c[2] if v < 0.78 else c[1]))))
	)
	p.glow_line(-length,0,0,0,10,c[4],0.1); p.glow(pulse,0,8,c[6],0.3); p.glow(0,0,8,C.WHITE,0.4); p.glow(-length*0.4,0,30,c[3],0.16)
