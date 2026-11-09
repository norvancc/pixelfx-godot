@tool
extends "../../core/effect.gd"
## Algorithm port of src/fx/water/splash.js. MIT; see provenance.json.
const C = preload("../../core/color.gd")
const M = preload("../../core/math.gd")
const E = preload("../../core/ease.gd")
const Sim = preload("../../core/sim.gd")
const A = preload("../analytic_helpers.gd")
const W = preload("water_common.gd")
const P = Sim.P
const HIT = 0.16
const SY = 0.22
const TEAR = 0.11
const JET = 0.3
const META = {"id":"pixelfx.splash","name":"Splash","duration":2.5,"loop":false,"fps":30,"cacheable":false,"layers":["back","front"],"options":{"palette":W.WATER,"stone":true,"seed":3}}
var _c: Array
var _r
var _ps
var _mist
var _lights
var _rings
var _drops
var _st: Array
var _phi = 0.0
var _seed = 3
var _t = 0.0
var _done: Dictionary
var _spikes: Array
var _plinks: Array
var _bubbles: Array
func metadata() -> Dictionary: return META

func parameter_schema() -> Array[Dictionary]:
	var palette := PackedColorArray(); for value in META.options.palette: palette.append(Color(value))
	return [
		{"name": "seed", "type": TYPE_INT, "default": 3},
		{"name": "light", "type": TYPE_FLOAT, "default": 1.0, "min": 0.0, "max": 3.0, "hint": PROPERTY_HINT_RANGE, "hint_string": "0,3,0.05"},
		{"name": "palette", "type": TYPE_PACKED_COLOR_ARRAY, "default": palette},
		{"name": "stone", "type": TYPE_BOOL, "default": true},
	]

func bounds(_o: Dictionary) -> Rect2i: return Rect2i(-128,-128,256,192)
static func _height(u: float) -> float: return 19*E.out_cubic(clampf(u/0.09,0,1))*(1-E.in_quad(clampf((u-0.12)/0.3,0,1)))
static func _foot(u: float) -> float: return 3+7.5*E.out_cubic(clampf(u/0.45,0,1))
static func _lip(u: float) -> float: return _foot(u)+_height(u)*0.42+3*E.out_cubic(clampf(u/0.25,0,1))
static func _jet_h(u: float) -> float: return 26*(E.out_cubic(clampf(u/0.12,0,1))-E.in_quad(clampf((u-0.15)/0.28,0,1)))
func _scallop(a: float,h: float) -> float: return h*(0.86+0.14*M.noise(cos(a)*2.2+sin(a)*1.3+_phi*3,_seed))
func _once(key: String,at: float) -> bool:
	if _done.has(key) or _t < at: return false
	_done[key] = true; return true
func create(o: Dictionary):
	_c = C.fit(o.palette,8); _r = M.Rng.new(o.seed); _st = C.fit(W.ROCK,6); _phi = _r.range_value(0,TAU); _seed = o.seed
	_ps = Sim.Particles.new({"rng":_r}); _mist = W.Mist.new(); _lights = Sim.Lights.new(); _rings = W.Ripples.new({"sy":SY})
	_plinks = []; _bubbles = []; _spikes = []; _done = {}; _t = 0.0
	for k in range(12): _spikes.append({"a":fmod(k*TAU/12+_phi,TAU),"length":_r.range_value(0.2,0.36)})
	_drops = W.Drops.new({"sy":SY,"g":820.0,"on_land":_land})
	return self
func _land(d: Dictionary) -> void:
	_rings.add(d.x,d.z,0.6,2+d.s*1.8,0.34+d.s*0.1,{"n":1,"k":0.95,"hot":0.06})
	_plinks.append({"x":d.x,"y":d.z*SY,"s":d.s,"age":0.0})
	if d.s > 1 and not d.get("small",false):
		for i in range(d.s):
			var a = _r.range_value(0,TAU); var v = _r.range_value(10,34)
			_drops.add({"x":d.x,"z":d.z,"h":0.5,"vx":cos(a)*v,"vz":sin(a)*v,"vh":_r.range_value(55,110),"s":1,"small":true,"life":1.0})
func update(dt: float,_o: Dictionary) -> void:
	_t += dt
	var r = _r; var c = _c
	if _once("hit",HIT):
		_lights.add(0,-6,52,c[5],0.6,0.45); _lights.add(0,-4,16,C.WHITE,0.5,0.08)
		_rings.add(0,0,8,56,2,{"n":2,"gap":3.4,"k":1.35,"hot":0.16,"glint":1.0}); _rings.add(0,0,5,38,1.7,{"n":1,"k":0.9,"delay":0.14})
		for i in range(20):
			var a = r.range_value(0,TAU); var v = r.range_value(50,125)
			_drops.add({"x":cos(a)*3,"z":sin(a)*3,"h":r.range_value(1,6),"vx":cos(a)*v,"vz":sin(a)*v,"vh":r.range_value(160,270),"s":2 if r.chance(0.25) else 1,"delay":r.range_value(0,0.04)})
		for i in range(9):
			var side = 1 if i % 2 else -1; var x = side*r.range_value(4,12)
			_mist.add(x,-r.range_value(1,7),side*r.range_value(25,70),-r.range_value(4,16),r.range_value(2.5,4),r.range_value(7,11),r.range_value(0.9,1.5),c[6] if r.chance(0.5) else c[5],r.range_value(0.3,0.42),r.range_value(0,0.1))
	if _once("spray",HIT+0.04):
		for i in range(20):
			var a = r.range_value(0,TAU)
			_ps.spawn(P.FLAKE,cos(a)*9,sin(a)*9*SY-r.range_value(6,15),cos(a)*r.range_value(25,90),-r.range_value(30,100),r.range_value(0.7,1.3),C.WHITE if r.chance(0.5) else c[6],r.range_value(0.6,1.5))
		for i in range(5): _ps.spawn(P.STAR,r.range_value(-13,13),-r.range_value(6,20),0,-4,r.range_value(0.25,0.55),c[6],r.range_value(1,2.4),r.range_value(0,0.15))
	if _once("tear",HIT+TEAR):
		var h = _height(TEAR); var rt = _lip(TEAR)
		for f in _spikes:
			var a = f.a+r.range_value(-0.08,0.08); var v = r.range_value(32,88); var length = h*f.length
			_drops.add({"x":cos(f.a)*(rt+length*0.45),"z":sin(f.a)*rt,"h":h+length+1,"vx":cos(a)*v,"vz":sin(a)*v,"vh":r.range_value(90,190),"s":3 if r.chance(0.3) else 2})
	var u = _t-HIT
	if u > 0.13 and u < 0.3 and r.chance(0.3):
		var a = r.range_value(0,TAU); var rt = _lip(u); var v = r.range_value(15,45)
		_drops.add({"x":cos(a)*rt,"z":sin(a)*rt,"h":_scallop(a,_height(u))*r.range_value(0.6,1),"vx":cos(a)*v,"vz":sin(a)*v,"vh":r.range_value(-10,45),"s":2 if r.chance(0.3) else 1})
	if _once("fall",HIT+0.3):
		for i in range(8):
			var a = r.range_value(0,TAU); var rad = _lip(0.3); var v = r.range_value(15,40)
			_drops.add({"x":cos(a)*rad,"z":sin(a)*rad,"h":r.range_value(3,7),"vx":cos(a)*v,"vz":sin(a)*v,"vh":r.range_value(30,80),"s":2 if r.chance(0.4) else 1})
	if _once("bead",HIT+JET+0.12):
		_drops.add({"x":0.0,"z":0.2,"h":_jet_h(0.12)+1,"vx":r.range_value(-6,6),"vz":0.0,"vh":55.0,"s":3})
		for i in range(3): _mist.add(r.range_value(-3,3),-_jet_h(0.12)+r.range_value(2,8),r.range_value(-14,14),-r.range_value(4,12),2,r.range_value(4,6),r.range_value(0.6,1),c[6],0.3)
	if _once("slump",HIT+JET+0.38):
		_rings.add(0,0,3,30,1.5,{"n":2,"gap":2.6,"k":0.9})
		for i in range(4): _mist.add(r.range_value(-6,6),-r.range_value(1,4),r.range_value(-30,30),-r.range_value(3,10),2.5,r.range_value(6,9),r.range_value(0.8,1.2),c[5],0.28)
	for pair in [[0,0.95],[1,1.2],[2,1.5]]:
		if _once("glug"+str(pair[0]),HIT+pair[1]): _bubbles.append({"x":r.range_value(-5,5),"z":r.range_value(-6,6),"t0":_t,"r":r.range_value(1.3,2.3),"popped":false})
	for b in _bubbles:
		if not b.popped and _t-b.t0 > 0.2:
			b.popped = true; _rings.add(b.x,b.z,1,7,0.6,{"n":1,"k":0.9}); _plinks.append({"x":b.x,"y":b.z*SY,"s":1,"age":0.0})
			for i in range(2): _drops.add({"x":b.x,"z":b.z,"h":1.0,"vx":r.range_value(-20,20),"vz":r.range_value(-10,10),"vh":r.range_value(50,90),"s":1,"small":true,"life":1.0})
	for i in range(_plinks.size()-1,-1,-1):
		_plinks[i].age += dt
		if _plinks[i].age > 0.14: _plinks.remove_at(i)
	_drops.update(dt); _rings.update(dt); _mist.update(dt); _ps.update(dt); _lights.update(dt)

static func _cell(cells: Dictionary,x: float,y: float,c: int,a: float,rank: int) -> void:
	var xx = floori(x); var yy = floori(y); var key = (yy+4096)*8192+xx+4096
	if not cells.has(key) or rank > cells[key].r: cells[key] = {"x":xx,"y":yy,"c":c,"a":a,"r":rank}
func _crown(p,back: bool) -> void:
	var u = _t-HIT; var h = _height(u)
	if u < 0 or h < 0.7: return
	var r0 = _foot(u); var rt = _lip(u); var white = u < 0.045; var cells = {}; var c = _c; var n = ceili(rt*TAU*1.6)
	for i in range(n):
		var a = float(i)/n*TAU; var sa = sin(a); var ca = cos(a)
		if (sa < 0) != back: continue
		var lane = floori((a+_phi)*rt/2.2); var streak = M.rand([lane,31]) < 0.3; var hh = _scallop(a,h)
		var keep = 1-clampf((u-0.13-0.14*M.rand([lane,7]))/0.1,0,1); var steps = ceili(hh*1.4)+2
		for k in range(floori(steps*keep)+1):
			var v = float(k)/steps; var r = r0+(rt-r0)*pow(v,2.2); var x = ca*r; var y = sa*r*SY-hh*v
			if white: _cell(cells,x,y,C.WHITE,1,3)
			elif back: _cell(cells,x,y,(c[5] if streak else c[4]) if v > 0.72 else (c[3] if streak else c[2]),1,1)
			elif absf(ca) > 0.9: _cell(cells,x,y,(C.WHITE if absf(ca)>0.97 else c[6]) if ca < 0 else c[4],1,2)
			elif v < 0.1: _cell(cells,x,y,C.WHITE if v < 0.05 else c[6],1,2)
			elif streak: _cell(cells,x,y,c[6] if ca < -0.2 else c[5],1,1)
			else: _cell(cells,x,y,c[5] if ca < 0 else c[4],0.22,0)
		if not white and keep >= 1:
			var x = ca*rt; var y = sa*rt*SY-hh
			_cell(cells,x,y,c[5] if back else (C.WHITE if ca < 0.45 else c[6]),1,3)
			if not back and ca < 0.2: _cell(cells,x,y+1,c[6],1,2)
	for q in cells.values():
		if q.r == 0: p.blend(q.x,q.y,q.c,q.a)
		else: p.px(q.x,q.y,q.c)
	var reach = 1-M.smooth(TEAR,TEAR+0.1,u)
	for f in _spikes:
		if (sin(f.a)<0) != back or reach <= 0: continue
		var hh = _scallop(f.a,h); var length = h*f.length*reach; var x0 = cos(f.a)*rt; var y0 = sin(f.a)*rt*SY-hh; var x1 = x0+cos(f.a)*length*0.45; var y1 = y0-length
		if length >= 1: p.line(x0,y0,x1,y1,C.WHITE if white else (c[4] if back else c[6]))
		if u > 0.04 and u < TEAR: W.bead(p,x1-(0.0 if back else 0.5),y1-1,0,-1,1 if back else 2,c)
		if not back and sin(f.a)>0.3: p.glow(x0,y0,6,c[5],0.22*reach)
func _jet(p) -> void:
	var u = _t-HIT-JET; var h = _jet_h(u)
	if u < 0 or h < 0.8: return
	var top = -h; var c = _c
	p.ellipse(0,0,5,2.4,func(d,a): return 0 if sin(a)>0 else (C.WHITE if d<0.5 else (c[6] if cos(a)<0 else c[5])))
	p.shade(-3,top-2,3,0,func(x,y,out):
		var v = clampf((y-top)/h,0,1); var w = 1.15+1.5*v*v*v; var q = x/w
		if absf(q)>1: return
		out.c = c[6] if q < -0.5 else (C.WHITE if q < 0.3 else (c[5] if q < 0.72 else c[4]))
	)
	if u < 0.12: p.circle(0,top-1,1.7,c[5]); p.circle(-0.3,top-1.3,1.1,c[6]); p.px(-1,top-2,C.WHITE)
	p.glow_line(0,-1,0,top,7,c[5],0.3)
func draw_back(p,_time: float,_o: Dictionary) -> void:
	var u = _t-HIT; var c = _c
	if u > 0 and u < 0.26:
		var r = _foot(u)*0.85*(1-M.smooth(0.12,0.26,u))
		p.ellipse(0,0,r,r*SY+0.6,func(_d,a): return c[1] if sin(a)<0 else c[2])
	_rings.draw(p,c,-1); _crown(p,true); _drops.draw(p,c,"back")
func draw(p,_time: float,o: Dictionary) -> void:
	var u = _t-HIT; var c = _c
	_rings.draw(p,c,1)
	if u > 0.2:
		var rx = 4+11*E.out_cubic(clampf((u-0.2)/0.7,0,1)); var k = M.smooth(0.2,0.32,u)*(1-M.smooth(0.5,2,u))*0.9
		W.lace(p,0,0,rx,rx*SY+0.5,k,c,_t,o.seed)
	_crown(p,false); _jet(p)
	for b in _bubbles:
		var g = (_t-b.t0)/0.2
		if g > 1: continue
		var r = b.r*E.out_back(g); var x = b.x; var y = b.z*SY; var a = PI
		while a <= TAU+0.01: p.dot(x+cos(a)*r,y+sin(a)*r,c[6]); a += 0.5/maxf(1,r)
		p.px(x-r*0.4,y-r*0.6,C.WHITE); p.glow(x,y-1,4,c[5],0.25)
	for q in _plinks:
		var k = q.age/0.14
		if k < 0.5: p.px(q.x,q.y,C.WHITE)
		if q.s > 1: p.line(q.x,q.y-1,q.x,q.y-1-3*(1-k),C.WHITE if k < 0.4 else c[6])
		p.glow(q.x,q.y,4,c[5],0.3*(1-k))
	_drops.draw(p,c,"front")
	if u >= 0 and u < 0.07:
		p.ellipse(0,0,10,2.4,func(d,_a): return C.WHITE if d < 0.6 else c[6]); A.sparkle(p,0,-3,5*(1-u/0.07),c[6],c[5],0.5)
	if o.stone and _t < HIT:
		var v = _t/HIT; var y = -70+70*(0.4*v+0.6*v*v)
		p.line(0,y-12,0,y-3,_st[4],func(w): return w*0.8); W.pebble(p,0,y,2.6,_st)
	_mist.draw(p,c[5]); _ps.draw(p); _lights.draw(p)
	if u > 0:
		p.glow(0,-2,34,c[4],0.2*(1-M.smooth(0,1.6,u))); p.glow(0,2,64,c[3],0.16*(1-M.smooth(0.1,2.1,u)))
