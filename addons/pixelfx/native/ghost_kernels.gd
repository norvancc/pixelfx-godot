@tool
extends RefCounted
## Same 1/240-second particle integration as the pinned looping Ghosts, with scalar locals.
const M=preload("../core/math.gd")
static func state(_e,args,receiver):
	var s:Dictionary=args[0];var age:float=args[1];var kind:int=s.k;var x:float=s.x;var y:float=s.y;var vx:float=s.vx;var vy:float=s.vy;var life:float=s.life;var maximum:float=s.life;var color:int=s.col;var size:float=s.size;var seed:float=s.seed;var flag:int=s.flag;var hops:int=0;var elapsed:float=0;var ground=receiver.ground;var semantics=load("res://addons/pixelfx/native/semantics.gd")
	while elapsed<age-1e-9:
		var dt:float=minf(1.0/240,age-elapsed);var integrated:bool=false
		match kind:
			9:
				vy-=95*dt;vx+=sin(elapsed*17+seed)*30*dt;vx-=vx*5*dt;vy-=vy*3.2*dt
			11:
				vy+=950*dt;vx-=vx*0.8*dt
				var floor_y:float=semantics.call_value(ground,[x]);var ny:float=y+vy*dt;x+=vx*dt
				if vy>0 and y<=floor_y and ny>=floor_y:
					y=floor_y-0.25
					var bounce:bool=false
					if vy>130:bounce=M.rand([seed*1000,hops])<0.4;hops+=1
					if bounce:vy=-vy*0.25;vx=vx*0.5
					else:vx=0;vy=0;life=minf(life,0.5)
				else:y=ny
				integrated=true
			0:
				vy+=950*0.45*dt;vx-=vx*2.2*dt;vy-=vy*2.2*dt
				var floor_y:float=semantics.call_value(ground,[x]);var ny:float=y+vy*dt;x+=vx*dt
				if vy>0 and y<=floor_y and ny>=floor_y:vy=-vy*0.45;vx*=0.7;y=floor_y-0.25
				else:y=ny
				integrated=true
			2:vx+=vx*3*dt;vy+=vy*3*dt
			3:vx-=vx*2.2*dt;vy-=vy*2.2*dt-35*dt;x+=sin(elapsed*2.5+seed)*7*dt
			7:vy+=(-30+sin(elapsed*3+seed)*20)*dt;vx+=cos(elapsed*2.3+seed)*45*dt;vx-=vx*1.6*dt;vy-=vy*1.6*dt
			8:vy-=(23 if flag&2 else 16)*dt;vx+=sin(elapsed*1.3+seed)*8*dt;vx-=vx*1.6*dt;vy-=vy*1.2*dt
			1:vx-=vx*0.6*dt;vy-=vy*0.6*dt
			_:
				var drag:float=4 if kind in [4,5,8] else 1.6;vx-=vx*drag*dt;vy-=vy*drag*dt+5*dt
		if not integrated:x+=vx*dt;y+=vy*dt
		elapsed+=dt;life-=dt
		if life<=0:
			if kind!=9 or not flag&1:return null
			var big:bool=bool(flag&2);var next_life:float=1.3+M.rand([seed*7,1]) if big else 0.8+M.rand([seed*7,1])*0.6
			kind=8;vx=vx*0.6;vy=vy*0.6-6;life=next_life;maximum=next_life;color=0;size=size*(0.85 if big else 0.7);flag=2 if big else 0
	var box=receiver.box
	if box!=null and (x<box[0] or x>box[2] or y<box[1] or y>box[3]):return null
	return {"k":kind,"x":x,"y":y,"vx":vx,"vy":vy,"life":life,"max":maximum,"col":color,"size":size,"seed":seed,"delay":0,"flag":flag,"hops":hops}
