@tool
extends RefCounted
## Fire recipes adapted upstream from Sprite Fusion, (c) 2026 Hugo Duprez, MIT.
const C = preload("../core/color.gd")
const LAYERS = [[1,1,6],[0.76,0.86,4],[0.54,0.68,2],[0.3,0.42,0]]

static func flame_blade(p,x: float,y: float,ux: float,uy: float,length: float,w: float,bend: float,noise_fn: Callable,n: int,hot: Array,layers: Array=LAYERS,jit: float=0.5,wob: float=1.1) -> void:
	if length < 1: return
	var nx := -uy; var ny := ux
	for entry in layers:
		var lw: float=entry[0]; var lh: float=entry[1]; var c: int=hot[entry[2]]
		var extent := length*lh; var r := 0.0
		while r <= extent:
			var u := r/maxf(1,extent)
			var half: float=w*lw*pow(1-u,0.85)*minf(1,(r+1.5)/3.5)+noise_fn.call(9,n,r*0.45)*jit
			if half >= 0.3:
				var off: float=bend*u*u*lh+noise_fn.call(4,n+7,r*0.2)*u*wob
				var cx := x+ux*r+nx*off; var cy := y+uy*r+ny*off
				var q := -half
				while q <= half:
					p.px(cx+nx*q,cy+ny*q,c); q += 0.5
			r += 0.5
static func solid(p,x: float,y: float,r: float,c: int) -> void:
	if r < 0.6: p.px(x,y,c); return
	var cx: float=p.to_x(x,y); var cy: float=p.to_y(x,y); var r2 := r*r
	for sy in range(floori(cy-r),ceili(cy+r)+1):
		var dy := sy+0.5-cy; var s2 := r2-dy*dy
		if s2 < 0: continue
		var s := sqrt(s2)
		for sx in range(ceili(cx-s-0.5),floori(cx+s-0.5)+1): p.put(sx,sy,c,1)
static func soft(p,x: float,y: float,r: float,c: int,a: float) -> void:
	if a <= 0.004: return
	if r < 0.5: p.blend(x,y,c,a); return
	var cx: float=p.to_x(x,y); var cy: float=p.to_y(x,y); var r2 := r*r
	for sy in range(floori(cy-r),ceili(cy+r)+1):
		var dy := sy+0.5-cy; var s2 := r2-dy*dy
		if s2 < 0: continue
		var s := sqrt(s2)
		for sx in range(ceili(cx-s-0.5),floori(cx+s-0.5)+1): p.blend_px(sx,sy,c,a)
static func fire_puff(p,x: float,y: float,k: float,size: float,frac: float,hot: Array,glow_k: float=0.18,tx: float=0,ty: float=-1) -> void:
	var age := 1-k; var n := hot.size(); var heat := minf(0.999,pow(age,0.62)+frac*0.1)
	var idx := mini(n-2,floori(heat*(n-1)))
	var r := size*(0.55+0.45*minf(1,age*7))*(1-age*0.55); var c: int=hot[idx]
	if idx >= n-2: soft(p,x,y,r,c,minf(1,k*3)*0.85); return
	solid(p,x,y,r,hot[mini(n-1,idx+2)])
	if r > 1.6 and ty > -0.99: solid(p,x+tx*r*1.5,y+ty*r*1.5,r*0.3,hot[mini(n-1,idx+1)])
	solid(p,x-r*0.16,y-r*0.22,r*0.78,c)
	if r > 1.6: solid(p,x+tx*r*0.9,y+ty*r*0.9,r*0.42,c)
	if idx <= 3 and r > 1.8: solid(p,x-r*0.28,y-r*0.34,r*0.36,hot[maxi(0,idx-1)])
	if idx < 6: p.glow(x,y,r*2.4+2,c,glow_k*k)
static func smoke_puff(p,x: float,y: float,k: float,size: float,col: int=0,big: bool=false,a_mul: float=1) -> void:
	var age := 1-k
	var r := size*(0.65+minf(1,age*2.5)*0.45+age*(0.5 if big else 0.4))
	var a := minf(1,age*12)*minf(1,k*2.4)*(0.7 if big else 0.58)*a_mul
	var c := C.mix(col,C.at(C.SMOKE_RAMP,age),age) if col else C.at(C.SMOKE_RAMP,age*1.05)
	soft(p,x,y,r,c,a*0.45); soft(p,x+r*0.05,y+r*0.06,r*0.74,c,a*0.62)
	if age < 0.5: soft(p,x-r*0.22,y-r*0.3,r*0.5,C.mix(c,C.WHITE,0.12),a*0.4*(1-age*2))
static func ember(p,x: float,y: float,k: float,size: float,cols: Array,ph: float) -> void:
	if k < 0.25 and sin(ph) < 0: return
	var c: int=cols[0] if k > 0.6 else (cols[1] if k > 0.3 else cols[2])
	if size >= 2:
		var rim: int=cols[2] if k > 0.45 else cols[3]
		p.px(x-1,y,rim); p.px(x+1,y,rim); p.px(x,y-1,rim); p.px(x,y+1,rim); p.px(x,y,c)
		p.glow(x,y,8,c,0.4*k); return
	p.px(x,y,c)
	if size > 1.4: p.px(x,y+1,cols[3])
	p.glow(x,y,3+size,c,0.35*k)
static func spark(p,x: float,y: float,vx: float,vy: float,k: float,cols: Array) -> void:
	var sp := sqrt(vx*vx+vy*vy)
	if sp == 0: sp=1
	var ux := vx/sp; var uy := vy/sp; var length := minf(9,1+sp*0.022)
	var head: int=cols[0] if k > 0.6 else (cols[1] if k > 0.3 else cols[2])
	p.line(x-ux*length,y-uy*length,x-ux*length*0.4,y-uy*length*0.4,head if k > 0.5 else cols[-1])
	p.line(x-ux*length*0.45,y-uy*length*0.45,x,y,head); p.glow(x,y,3,head,0.45*k)
