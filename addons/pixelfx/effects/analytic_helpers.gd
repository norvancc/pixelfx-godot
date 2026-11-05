@tool
extends RefCounted
## Selected upstream helpers: core/sim.js sparkle, projectiles/_lib.js beat,
## ice/_lib.js blade (default options), water/_lib.js ring. MIT; see provenance.json.
const C = preload("../core/color.gd")
const M = preload("../core/math.gd")
const CROSS = [[1,0],[-1,0],[0,1],[0,-1]]
const DIAG = [[1,1],[-1,1],[1,-1],[-1,-1]]
static func sparkle(p,x:float,y:float,arm:float,c:int,tip:int,k:float=0.6) -> void:
	var n := M.js_round(arm)
	if n < 1: return
	var xx := floori(x); var yy := floori(y)
	for d in range(1,n+1):
		for v in CROSS: p.px(xx+v[0]*d,yy+v[1]*d,tip if d > n*0.6 else c)
	if n >= 3:
		for v in DIAG: p.px(xx+v[0],yy+v[1],c)
	if n >= 6:
		for v in DIAG: p.px(xx+v[0]*2,yy+v[1]*2,tip)
	p.px(xx,yy,C.WHITE); p.glow(x,y,4+n*2,c,k)
static func beat(t:float,period:float,n:int,seed_value:int,life:Callable,fn:Callable) -> void:
	for i in range(n):
		var duration:float=life.call(M.rng([seed_value,i,911]))
		var age := fposmod(t-i*period/n+1e-7,period)
		while age < duration:
			fn.call(age,duration,M.rng([seed_value,i])); age += period
static func blade(p,bx:float,by:float,tx:float,ty:float,w:float,c:Array) -> void:
	var dx := tx-bx; var dy := ty-by; var length := sqrt(dx*dx+dy*dy)
	if length < 1.5 or w < 0.5: return
	var ux := dx/length; var uy := dy/length; var hw := w/2; var pad := hw+2
	p.shade(minf(bx,tx)-pad,minf(by,ty)-pad,maxf(bx,tx)+pad,maxf(by,ty),func(x,y,out):
		var rx:float=x-bx; var ry:float=y-by; var u:float=(rx*ux+ry*uy)/length; var s:float=-rx*uy+ry*ux
		if u < 0: return
		var side := hw*(1-minf(u,1))+0.35
		if u > 1 or s < -side or s > side:
			var over := (u-1)*length if u > 1 else 0.0
			if maxf(over,-side-s if s < -side else s-side) < 1 and u < 1+1/length: out.c=c[0]
			return
		var rd := -w*0.12*(1-u); var col:int
		if u > 0.88: col=C.WHITE
		elif absf(s-rd) < 0.55: col=c[6]
		elif s < rd: col=c[6] if s+side < 1 else (c[5] if (s+side)/maxf(1,rd+side) > 0.55 else c[4])
		else: col=c[1] if side-s < 1.1 else (c[2] if (s-rd)/maxf(1,side-rd) > 0.5 else c[3])
		# JS XOR is signed int32 and remainder retains its sign.
		var bits := ((floori(x)*73856093) ^ (floori(y)*19349663)) & 0xffffffff
		if bits >= 0x80000000: bits -= 0x100000000
		if s < rd and col != c[6] and bits % 997 < 30: col=c[7]
		out.c=col
	)
static func water_ring(p,r:float,sy:float,k:float,c:Array,gap:float,half:int,hot:bool,glint:float,seed_value:int,wob:float) -> void:
	if k <= 0.02 or r < 0.5: return
	for j in range(2):
		var rr := r-j*gap
		if rr < 0.6: break
		var kj := k*(1-j*0.42); var m := maxi(6,ceili(rr*TAU*1.3)); var need := 1.15-2.3*minf(1,kj*1.25)
		for i in range(m):
			var a := float(i)/m*TAU; var s := sin(a); var near := s > 0
			if (half > 0 and not near) or (half < 0 and near): continue
			if M.noise(a*4.7+seed_value*13.1+j*5.3,seed_value)*0.65+M.noise(a*11.3+seed_value*7.7,seed_value+3)*0.35 < need: continue
			var lit := kj*(1.0 if near else 0.7)*(0.88-0.12*cos(a))
			var col:int=C.WHITE if hot and near and j == 0 else c[6 if lit > 0.7 else (5 if lit > 0.38 else 4)]
			var ra := rr+wob*M.noise(a*2.6+seed_value*1.9+j,seed_value+11)
			var x := cos(a)*ra; var y := s*ra*sy
			p.dot(x,y,col)
			if j == 0: p.light(x,y,c[4],0.3*lit)
	if glint > 0 and half >= 0:
		var x := cos(2.05)*r; var y := sin(2.05)*r*sy
		p.px(x,y,C.WHITE); p.glow(x,y,3+glint*2,c[5],0.35*glint)
