@tool
extends "../../core/effect.gd"
## Port of src/fx/projectiles/rocket.js from the pinned PixelFX source.
## The rocket is an analytic loop: smoke, sparks and the jet are reconstructed from time and seed.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const P = preload("../../core/particles.gd")
const H = preload("../analytic_helpers.gd")
const Q = preload("projectiles_common.gd")

const D := 1.2
const META := {
	"id": "pixelfx.rocket", "name": "Rocket", "duration": D, "loop": true, "fps": 30,
	"cacheable": true, "layers": ["front"],
	"options": {
		"palette": ["#4a1712", "#8a1f17", "#c9281f", "#f2561d", "#ff8a2a", "#ffc23d", "#ffe26b", "#fff3a6", "#ffffff"],
		"metal": ["#0f0d16", "#25243a", "#3e4058", "#61667f", "#8e97b0", "#c4cce0", "#f2f6ff"],
		"paint": ["#3a0d14", "#7c1a22", "#bd2f2c", "#ec5a45", "#ff9b7e"],
		"smoke": ["#26222e", "#3d3846", "#5a5463", "#7e7887", "#a7a1ad", "#d0cad2", "#f1ecee"],
		"speed": 120.0, "seed": 5,
	},
}
const NOZZLE := -14.0

func metadata() -> Dictionary: return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray(); var metal := PackedColorArray(); var paint := PackedColorArray(); var smoke := PackedColorArray()
	for value in META.options.palette: palette.append(Color(value))
	for value in META.options.metal: metal.append(Color(value))
	for value in META.options.paint: paint.append(Color(value))
	for value in META.options.smoke: smoke.append(Color(value))
	return [
		{"name": "speed", "type": TYPE_FLOAT, "default": 120.0, "min": 0.0, "max": 320.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,320,1"},
		{"name": "seed", "type": TYPE_INT, "default": 5},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette},
		{"name": "metal", "type": TYPE_PACKED_COLOR_ARRAY, "default": metal},
		{"name": "paint", "type": TYPE_PACKED_COLOR_ARRAY, "default": paint},
		{"name": "smoke", "type": TYPE_PACKED_COLOR_ARRAY, "default": smoke},
	]

var _ship: Dictionary = {}
func bounds(_o: Dictionary) -> Rect2i: return Rect2i(-272,-72,336,144)
func _make_ship() -> Dictionary:
	return Q.pixel_shape(-15,-9,30,19,func(set_px):
		var body = { -3:"4",-2:"6",-1:"5",0:"4",1:"3",2:"2",3:"1" }
		var seam = { -3:"3",-2:"4",-1:"4",0:"3",1:"2",2:"1",3:"1" }
		var paint = { -3:"d",-2:"e",-1:"e",0:"d",1:"c",2:"b",3:"a" }
		for y in range(-3,4):
			for x in range(-11,6): set_px.call(x,y,body[y])
		for y in range(-3,4): set_px.call(-3,y,seam[y]); set_px.call(-9,y,paint[y]); set_px.call(-8,y,paint[y])
		var nose = {6:3,7:3,8:2,9:2,10:1,11:1,12:0,13:0}
		for x in nose:
			for y in range(-nose[x],nose[x]+1): set_px.call(x,y,paint[y])
		set_px.call(7,-2,"w"); set_px.call(8,-2,"w"); set_px.call(9,-1,"e"); set_px.call(13,0,"e")
		for i in range(4):
			var end = -8-i
			for x in range(-13,end+1): set_px.call(x,-4-i,"5" if x==end else ("4" if i>1 else "3")); set_px.call(x,4+i,"3" if x==end else ("1" if i>1 else "2"))
		for y in range(-2,3): set_px.call(-12,y,"3" if y<0 else "2")
		for y in range(-3,4): set_px.call(-13,y,"2" if y < -1 else "1")
		set_px.call(-14,-3,"h"); set_px.call(-14,3,"h")
		for y in range(-2,3): set_px.call(-14,y,"x" if abs(y)<2 else "h")
	)
func _jet(p,fire: Array,x0: float,y0: float,length: float,wob: float,fr: int) -> void:
	var dia = []
	for i in range(4): dia.append(3.6+i*4.3+(M.rand([fr,i,41])-0.5)*0.7)
	p.shade(x0-length-2,y0-6,x0,y0+6,func(x,y,_out):
		var u = x0-x
		if u<0: return 0
		var q = u/length
		if q>1.05: return 0
		var ady = absf(y-y0); var qq = minf(q,1); var w = (2.6+2.4*pow(qq,0.7))*(1-qq*qq)*wob
		var m = w-ady+(M.rand([floori(x)*7+floori(y)*131,fr])-0.5)*0.9*minf(1,0.25+q*2)
		if m < -0.5: return 0
		if m < 0.5: return fire[3] if q<0.45 else fire[2]
		for i in range(dia.size()):
			if dia[i]>length*0.72: break
			var d = absf(u-dia[i])/(1.9-i*0.15)+ady/(1.7-i*0.25)
			if d<1: return fire[8] if d<0.55 and i<3 else fire[7]
		if u<1.6 and ady<1.6: return fire[8]
		var level = (1-ady/maxf(0.6,w))*(1-pow(qq,1.5))
		return (fire[7] if u<3 else fire[5]) if level>0.62 else (fire[5] if level>0.38 else (fire[4] if level>0.16 else fire[3]))
	)
func draw(p,t: float,o: Dictionary) -> void:
	var fire = C.fit(o.palette,9); var metal = C.fit(o.metal,7); var paint = C.fit(o.paint,5); var smoke = C.fit(o.smoke,7); var seed_value = o.seed; var speed = o.speed; var fr = floori(t*30+1e-6)
	var bob = func(tt): return M.js_round(sin((tt/D)*TAU)*0.62)
	var by = bob.call(t); var jet_length = 22*(0.84+0.32*M.rand([fr,seed_value,1])); var wob = 0.92+0.16*M.rand([fr,seed_value,2]); var fl = jet_length/22
	var left = -250.0; var sparks = [fire[7],fire[6],fire[4],fire[3]]; var list = []
	H.beat(t,D,66,seed_value+1,func(r): return r.range_value(1.1,1.45),func(age,life,r):
		var d = Q.wake(NOZZLE-22*r.range_value(0.62,0.8),bob.call(t-age)+r.range_value(-1,1),-r.range_value(75,105),r.range_value(-20,20),age,speed,3,0)
		var k = age/life; var rise = 0.5*r.range_value(6,16)*age*age; var sway = sin(age*2.3+r.range_value(0,TAU))*age*2
		var rad = r.range_value(2.2,3)+((r.range_value(14,19) if r.chance(0.25) else r.range_value(8,13))-2.6)*(1-exp(-2.2*age))
		if d[0]-rad<left+1: return
		var a = minf(1,age*16)*pow(1-k,1.25)*0.68*M.smooth(left,left+40,d[0]-rad)
		list.append({"x":d[0],"y":d[1]-rise+sway,"r":rad,"a":a,"b":clampf(0.95-k*0.75+r.range_value(-0.08,0.08),0,1),"w":exp(-age*r.range_value(3.5,6))})
	)
	Q.cloud(p,list,smoke,[C.mix(fire[0],smoke[0],0.5),C.mix(fire[1],smoke[1],0.45),C.mix(fire[2],smoke[2],0.35),fire[3],fire[4],fire[6],fire[7]],{"dens":1.3,"lit":1.5})
	p.glow(NOZZLE-22-6,by,26,fire[4],0.24*fl)
	H.beat(t,D,9,seed_value+4,func(r): return r.range_value(0.6,1.1),func(age,life,r):
		var k = 1-age/life; var d = Q.wake(NOZZLE-22*0.6,bob.call(t-age),-r.range_value(40,120),r.range_value(-40,30),age,speed,2.5,-8)
		if d[0]<left+2 or (k<0.3 and M.rand([fr,r.int_value(0,999)])<0.5): return
		var c = fire[6] if k>0.6 else (fire[4] if k>0.3 else fire[2]); p.px(d[0],d[1],c); p.glow(d[0],d[1],3,c,0.35*k)
	)
	H.beat(t,D,30,seed_value+3,func(r): return r.range_value(0.08,0.16),func(age,life,r):
		var k = age/life; var d = Q.wake(NOZZLE-22*r.range_value(0.6,0.9),bob.call(t-age)+r.range_value(-1.5,1.5),-r.range_value(10,50),r.range_value(-12,12),age,speed,4,-30)
		var idx = 7-floori(pow(k,0.7)*4); var rad = r.range_value(1.2,2.2)*(1-k*0.6)
		p.circle(d[0],d[1],rad,fire[idx-2]); p.circle(d[0]+rad*0.25,d[1]-rad*0.1,rad*0.65,fire[idx]); p.glow(d[0],d[1],rad*2.4+2,fire[idx],0.2*(1-k))
	)
	H.beat(t,D,30,seed_value+2,func(r): return r.range_value(0.18,0.45),func(age,life,r):
		var d = Q.wake(NOZZLE-r.range_value(2,22*0.7),bob.call(t-age)+r.range_value(-1.5,1.5),-r.range_value(20,190),r.range_value(-80,50),age,speed,2.6,160)
		if d[0]>left+10: Q.spark(p,d[0],d[1],d[2],d[3],1-age/life,sparks)
	)
	H.beat(t,D,8,seed_value+6,func(r): return r.range_value(0.5,0.8),func(age,life,r):
		var d = Q.wake(NOZZLE-r.range_value(4,22*0.8),bob.call(t-age)+r.range_value(-1,1),-r.range_value(10,80),r.range_value(-60,10),age,speed,1.8,170)
		if d[0]>left+10: Q.spark(p,d[0],d[1],d[2],d[3],1-age/life,sparks,0.5)
	)
	_jet(p,fire,NOZZLE,by+0.5,jet_length,wob,fr+seed_value*31)
	if _ship.is_empty(): _ship = _make_ship()
	p.sprite(_ship.rows,{"o":C.hex("#100d17"),"1":metal[1],"2":metal[2],"3":metal[3],"4":metal[4],"5":metal[5],"6":metal[6],"a":paint[0],"b":paint[1],"c":paint[2],"d":paint[3],"e":paint[4],"w":C.WHITE,"h":fire[5],"x":fire[8]},_ship.x0,_ship.y0+by)
	p.glow(NOZZLE-10,by,60,fire[4],0.28*fl); p.glow_line(NOZZLE-3,by+0.5,NOZZLE-jet_length*0.9,by+0.5,11,fire[4],0.2); p.glow(NOZZLE-1,by+0.5,8,fire[7],0.45); p.glow(NOZZLE+3,by+5,12,fire[4],0.22*fl)
