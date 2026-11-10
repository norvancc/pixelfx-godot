@tool
extends RefCounted
const Painter=preload("painter.gd")
static func _semantics():return load("res://addons/pixelfx/native/semantics.gd")
static func _index(frame,x:float,y:float)->int:
	var i:int=floori(x)-frame.ox;var j:int=floori(y)-frame.oy
	return -1 if i<0 or j<0 or i>=frame.w or j>=frame.h else j*frame.w+i
static func begin(_e,a,r):
	var frame=r.f;frame.ox=floori(a[0]);frame.oy=floori(a[1]);frame.clear();r.q.reset();r.q.place(0,0);return r.q
static func idx(_e,a,r):return _index(r.f,a[0],a[1])
static func get_value(_e,a,r):
	var frame=r.f;var i:int=_index(frame,a[0],a[1]);return 0 if i<0 else frame.color[i]&0xffffffff
static func set_value(_e,a,r):
	var frame=r.f;var i:int=_index(frame,a[0],a[1])
	if i>=0:frame.color[i]=int(a[2])&0xffffffff
static func fill(_e,a,r):
	var frame=r.f;var semantics=_semantics();var fn=a[4]
	for y in range(floori(a[1]),floori(a[3])+1):
		for x in range(floori(a[0]),floori(a[2])+1):
			var color=semantics.call_value(fn,[x+0.5,y+0.5])
			if color:
				var i:int=_index(frame,x,y)
				if i>=0:frame.color[i]=int(color)&0xffffffff
static func outline(_e,a,r):
	var frame=r.f;var colors:PackedInt64Array=frame.color;var width:int=frame.w;var height:int=frame.h;var color=a[0];var corners:bool=bool(a[1]) if a.size()>1 else false;var temporary:PackedInt64Array=[];temporary.resize(width*height);var semantics=_semantics();var fn:bool=color is Object or color is Callable
	for j in range(height):
		for i in range(width):
			var index:int=j*width+i
			if colors[index]:continue
			var neighbor:int=colors[index-1] if i>0 else 0
			if not neighbor and i<width-1:neighbor=colors[index+1]
			if not neighbor and j>0:neighbor=colors[index-width]
			if not neighbor and j<height-1:neighbor=colors[index+width]
			if not neighbor and corners:
				if i>0 and j>0:neighbor=colors[index-width-1]
				if not neighbor and i<width-1 and j>0:neighbor=colors[index-width+1]
				if not neighbor and i>0 and j<height-1:neighbor=colors[index+width-1]
				if not neighbor and i<width-1 and j<height-1:neighbor=colors[index+width+1]
			if neighbor:temporary[index]=int(semantics.call_value(color,[i+frame.ox,j+frame.oy,neighbor]) if fn else color)&0xffffffff
	for i in range(temporary.size()):
		if temporary[i]:frame.color[i]=temporary[i]
	r.tmp.ints=temporary;return r
static func map_pixels(_e,a,r):
	var frame=r.f;var semantics=_semantics();var fn=a[0]
	for i in range(frame.w*frame.h):
		var color:int=frame.color[i]&0xffffffff
		if not color:continue
		var result=semantics.call_value(fn,[i%frame.w+frame.ox,floori(float(i)/frame.w)+frame.oy,color])
		if result:frame.color[i]=int(result)&0xffffffff
	return r
static func draw(_e,a,r):
	var p:Painter=a[0];var dx:float=a[1] if a.size()>1 else 0;var dy:float=a[2] if a.size()>2 else 0;var alpha:float=a[3] if a.size()>3 else 1;var clip=a[4] if a.size()>4 else null;var frame=r.f;var colors:PackedInt64Array=frame.color;var width:int=frame.w
	for i in range(colors.size()):
		var color:int=colors[i]
		if not color:continue
		var x:float=i%width+frame.ox+dx
		if clip!=null and (x<clip[0] or x>=clip[1]):continue
		p.dot(x,floori(float(i)/width)+frame.oy+dy,color,alpha)
	return r

static func draw_gem(_e,args,_receiver):
	var layer=args[0];var p:Painter=args[1];var gem:Dictionary=args[2];var x:float=args[3];var y:float=args[4];var spin:float=args[5];var ramp:Array=args[6];var options:Dictionary=args[7] if args.size()>7 else {};var tilt:float=options.get("tilt",0.32);var white:bool=options.get("white",false);var alpha:float=options.get("a",1);var edges:bool=options.get("edges",true);var gain:float=options.get("gain",1)
	var cs:float=cos(spin);var sn:float=sin(spin);var ct:float=cos(tilt);var st:float=sin(tilt);var bridge=preload("../effects/simulation_bridge.gd");var math=preload("../core/math.gd");var planes:Array=[]
	var light_x:float=-0.55;var light_y:float=0.72;var light_z:float=0.42;var half_length:float=bridge.hypot([light_x+0,light_y+st,light_z+ct]);var hx:float=(light_x+0)/half_length;var hy:float=(light_y+st)/half_length;var hz:float=(light_z+ct)/half_length
	for plane in gem.planes:
		var nx:float=plane.n[0]*cs-plane.n[2]*sn;var ny:float=plane.n[1];var nz:float=plane.n[0]*sn+plane.n[2]*cs;var kind:int=plane.kind;var pavilion:bool=kind in [4,5,8];var my:float=-ny*0.6 if pavilion else ny;var ml:float=bridge.hypot([nx,my,nz]);var lam:float=maxf(0,(nx*light_x+my*light_y+nz*light_z)/ml);var spec:float=pow(maxf(0,(nx*hx+my*hy+nz*hz)/ml),18)
		var brightness:float=0.02+0.72*pow(lam,2.4) if pavilion else 0.12+0.4*lam if kind==3 else 0.04+0.66*pow(lam,1.8)
		if kind==6:brightness=0.16+0.66*pow(maxf(0,(nx*light_x+nz*light_z)/bridge.hypot([light_x,light_z])),1.3)
		elif kind==7:brightness=0.22+0.62*pow(lam,1.2)
		elif kind==9:brightness=0.62+0.25*lam
		elif kind==10:brightness=0.3+0.5*lam
		planes.append({"nx":nx,"ny":ny,"nz":nz,"nd":nx*0+ny*(-st)+nz*(-ct),"d":plane.d,"kind":kind,"pavilion":pavilion,"brightness":brightness,"spec":spec})
	var center_x:int=math.js_round(x);var center_y:int=math.js_round(y);var radius:int=ceili(gem.r)+2;var top:int=ceili(gem.top+2);var bottom:int=ceili(gem.bottom+2);var best:float=-1;var best_x:float=center_x;var best_y:float=center_y;var ids:Dictionary={};begin(null,[center_x-radius,center_y-top],layer);var frame=layer.f
	for iy in range(center_y-top,center_y+bottom+1):
		for ix in range(center_x-radius,center_x+radius+1):
			var px:float=ix+0.5;var py:float=iy+0.5;var sx:float=px-center_x;var sy:float=-(py-center_y);var oy:float=sy*ct;var oz:float=-sy*st;var t0:float=-1e9;var t1:float=1e9;var hit:int=-1;var rejected:bool=false
			for j in range(planes.size()):
				var plane:Dictionary=planes[j];var nd:float=plane.nd;var no:float=plane.nx*sx+plane.ny*oy+plane.nz*oz
				if absf(nd)<1e-6:
					if no>plane.d:rejected=true;break
					continue
				var tt:float=(plane.d-no)/nd
				if nd<0:
					if tt>t0:t0=tt;hit=j
				elif tt<t1:t1=tt
			if rejected or hit<0 or t0>t1:continue
			var color:int=0xffffffff
			if not white:
				ids[(ix+500)*1000+iy+500]=hit;var plane:Dictionary=planes[hit];var brightness:float=plane.brightness;var spec:float=plane.spec
				if plane.kind==10:brightness+=(math.rand([floori(px-center_x),floori(py-center_y),43])-0.5)*0.08
				if plane.kind!=9:brightness*=gain
				if plane.kind==0:brightness-=0.04
				var shine:float=brightness+spec*0.6
				if shine>best:best=shine;best_x=px;best_y=py
				color=(ramp[6] if plane.pavilion else 0xffffffff) if spec>0.8 else ramp[maxi(1,mini(6,math.js_round(1+shine*5.6)))]
			var index:int=_index(frame,ix,iy)
			if index>=0:frame.color[index]=color&0xffffffff
	if not white and edges:
		var replacements:Array=[]
		for key in ids:
			var id:int=ids[key];var kx:int=floori(float(key)/1000);var ky:int=key-kx*1000;var px:int=kx-500;var py:int=ky-500
			if ids.has(key+1000) and ids[key+1000]!=id or ids.has(key+1) and ids[key+1]!=id:
				var c:int=get_value(null,[px,py],layer);var index:int=-1
				for j in range(ramp.size()):
					if (int(ramp[j])&0xffffffff)==c:index=j;break
				if index>0:replacements.append([px,py,ramp[maxi(1,index-1)] if planes[id].pavilion else ramp[mini(7,index+1)]])
		for replacement in replacements:set_value(null,replacement,layer)
	outline(null,[ramp[0]],layer);draw(null,[p,0,0,alpha],layer)
	return {"x":best_x,"y":best_y,"k":best}
