@tool
extends RefCounted
const Sim=preload("../core/sim.gd")
const Decay=preload("decay_math.gd")
static func draw(proxy,p,layer:String):
	var original:Array=proxy.list;var ordinary:Array=[]
	for q in original:
		if q.k not in [Sim.P.VAPOUR,Sim.P.DUST]:ordinary.append(q);continue
		if not ordinary.is_empty():proxy.list=ordinary;proxy.draw(p,layer);ordinary=[]
		if q.delay>0 or layer!="" and layer!="back":continue
		var k:float=q.life/q.max;var radius:float=q.size*(0.6+(1-k)*0.9)
		p.disc(q.x,q.y,radius,q.col,Decay.decay(k)*(0.45 if q.k==Sim.P.VAPOUR else 0.7))
		if q.k==Sim.P.VAPOUR and proxy.haze:p.glow(q.x,q.y,radius*1.8,proxy.haze,0.16*k)
	if not ordinary.is_empty():proxy.list=ordinary;proxy.draw(p,layer)
	proxy.list=original
