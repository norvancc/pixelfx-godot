@tool
extends RefCounted
## Scalar native implementations of the pinned weather sampling helpers.
const M=preload("../core/math.gd")
const Painter=preload("painter.gd")
static func _semantics():return load("res://addons/pixelfx/native/semantics.gd")
static func field(e,a,_receiver):
	var seed:int=a[0];var w:int=a[1] if a.size()>1 else 256;var h:int=a[2] if a.size()>2 else 128;var cells:Array=a[3] if a.size()>3 else [4,8,16,32]
	var key:String=str(seed)+"|"+str(w)+"|"+str(h)+"|"+",".join(cells.map(func(n):return str(n)))
	var cache=_semantics().read(e,"FIELDS");var cached:int=cache.index(key)
	if cached>=0:return cache.items[cached][1]
	var data:PackedFloat32Array=[];data.resize(w*h);var amp:float=0.5;var total:float=0
	for n_value in cells:
		var n:int=n_value;var cs:float=float(w)/n;var rows:int=maxi(1,M.js_round(h/cs));var lattice:PackedFloat64Array=[]
		for y in range(rows):
			for x in range(n):lattice.append(M.rand([x,y,seed,n]))
		for y in range(h):
			var gy:float=(float(y)/h)*rows;var iy:int=floori(gy);var v:float=gy-iy;var sv:float=v*v*(3-2*v)
			var y0:int=posmod(iy,rows)*n;var y1:int=posmod(iy+1,rows)*n
			for x in range(w):
				var gx:float=x/cs;var ix:int=floori(gx);var u:float=gx-ix;var su:float=u*u*(3-2*u);var x0:int=posmod(ix,n);var x1:int=posmod(ix+1,n)
				var top:float=lattice[y0+x0]+(lattice[y0+x1]-lattice[y0+x0])*su;var bottom:float=lattice[y1+x0]+(lattice[y1+x1]-lattice[y1+x0])*su
				data[y*w+x]+=(top+(bottom-top)*sv)*amp
		total+=amp;amp*=0.5
	for i in range(data.size()):data[i]/=total
	var semantics=_semantics();var buffer=semantics.Buffer.new("Float32Array");buffer.floats=data;var result={"w":w,"h":h,"d":buffer};cache.items.append([key,result]);return result
static func sample(_e,a,_receiver):return sample_at(a[0],a[1],a[2])
static func sample_at(field:Dictionary,u:float,v:float):
	var x:int=floori(u);var y:int=floori(v);var fx:float=u-x;var fy:float=v-y;var mask_x:int=field.w-1;var mask_y:int=field.h-1;var data:PackedFloat32Array=field.d.floats
	var x0:int=x&mask_x;var x1:int=(x+1)&mask_x;var y0:int=(y&mask_y)*int(field.w);var y1:int=((y+1)&mask_y)*int(field.w)
	var c0:float=data[y0+x0];var c1:float=data[y0+x1];var c2:float=data[y1+x0];var c3:float=data[y1+x1]
	return c0+(c1-c0)*fx+(c2-c0+(c0-c1-c2+c3)*fx)*fy
static func shader_pass(_e,a,_receiver):
	var p:Painter=a[0];var meta:Dictionary=a[1];var y0:int=maxi(-int(meta.origin[1]),floori(a[2]));var y1:int=mini(int(meta.size[1])-int(meta.origin[1])-1,ceili(a[3]));var fn=a[4]
	if p.sn!=0:p=_semantics().call_builtin("native.weather_clip",[p,meta])
	var out={"c":0,"a":1,"b":0,"l":0,"k":0};var semantics=_semantics();var x0:int=-int(meta.origin[0]);var x1:int=int(meta.size[0])-int(meta.origin[0])
	if p.sn==0 and not p.clipped and fn is Object and fn.has_method("invoke") and fn.native_method=="weather_storm_veil_pixel":
		storm_veil_rows(p,y0,y1,fn.environment);return
	if p.sn==0 and not p.clipped and fn is Object and fn.has_method("invoke") and fn.native_method=="weather_snow_haze_pixel":
		snow_haze_rows(p,y0,y1,fn.environment);return
	for y in range(y0,y1+1):
		var sxf:float=p.tx+(x0+0.5)*p.fx
		for x in range(x0,x1):
			out.c=0;out.a=1;out.b=0;out.l=0;out.k=0;semantics.call_value(fn,[x+0.5,y+0.5,out])
			if p.sn!=0:
				if out.c:
					if out.b:p.blend(x,y,out.c,out.a)
					else:p.dot(x,y,out.c,out.a)
				if out.k>0:p.light(x,y,out.l if out.l else out.c,out.k)
			else:
				var sx:int=floori(sxf);var sy:int=floori(p.ty+y+0.5)
				if out.c:
					if out.b:p.blend_px(sx,sy,out.c,out.a)
					elif out.a*p.fade>=1 or out.a*p.fade>(Painter.BAYER[((sy&3)<<2)|(sx&3)]+0.5)/16.0:
						var lx:int=sx-p.frame.ox;var ly:int=sy-p.frame.oy
						if lx>=0 and ly>=0 and lx<p.frame.w and ly<p.frame.h:
							p.frame.color[ly*p.frame.w+lx]=out.c
							if p.frame.track_writes:p.frame.touch(lx,ly)
				if out.k>0:p.add(sx,sy,out.l if out.l else out.c,out.k)
			sxf+=p.fx
static func trips(_e,a,_receiver):
	var t:float=a[0];var duration:float=a[1];var count:int=a[2];var seed:int=a[3];var m0:int=a[4];var m1:int=a[5];var fn=a[6];var semantics=_semantics()
	for i in range(count):
		var m:int=m0+floori(M.rand([seed,i,72])*(m1-m0+1));var phase:float=(t/duration)*m+M.rand([seed,i,71]);var cycle:int=floori(phase)
		semantics.call_value(fn,[phase-cycle,cycle,m,i])
static func shader_rows(e,a,_receiver):
	var p:Painter=a[0];var meta:Dictionary=a[1];var y0:int=maxi(-int(meta.origin[1]),floori(a[2]));var y1:int=mini(int(meta.size[1])-int(meta.origin[1])-1,ceili(a[3]));var fn=a[4];var semantics=_semantics()
	if p.sn!=0:p=semantics.call_builtin("native.weather_clip",[p,meta])
	var width:int=meta.size[0];var row=semantics.read(e,"ROW")
	if row.w!=width:
		row.w=width
		for name in ["c","a","b","l","k"]:row[name]=semantics.Buffer.new("Float32Array" if name in ["a","k"] else "Uint8Array" if name=="b" else "Uint32Array",width)
	var x0:int=-int(meta.origin[0])
	for y in range(y0,y1+1):
		row.c.ints.fill(0);row.k.floats.fill(0);row.a.floats.fill(1);row.b.ints.fill(0)
		semantics.call_value(fn,[y+0.5,row])
		if p.sn==0 and not p.clipped:_composite_row(p,x0,y,row);continue
		var colors:PackedInt64Array=row.c.ints;var alphas:PackedFloat32Array=row.a.floats;var blends:PackedInt64Array=row.b.ints;var lights:PackedInt64Array=row.l.ints;var strengths:PackedFloat32Array=row.k.floats
		var sxf:float=p.tx+(x0+0.5)*p.fx;var sy:int=floori(p.ty+y+0.5)
		for i in range(width):
			var c:int=colors[i];var k:float=strengths[i];var sx:int=floori(sxf);sxf+=p.fx
			if c==0 and not k>0:continue
			if p.sn!=0:
				if c:
					if blends[i]:p.blend(x0+i,y,c,alphas[i])
					else:p.dot(x0+i,y,c,alphas[i])
				if k>0:p.light(x0+i,y,lights[i] if lights[i] else c,k)
				continue
			var lx:int=sx-p.frame.ox;var ly:int=sy-p.frame.oy
			if lx<0 or ly<0 or lx>=p.frame.w or ly>=p.frame.h:continue
			if c:
				var alpha:float=alphas[i]*p.fade
				if blends[i]:p.blend_px(sx,sy,c,alphas[i])
				elif alpha>=1 or alpha>(Painter.BAYER[((sy&3)<<2)|(sx&3)]+0.5)/16.0:
					p.frame.color[ly*p.frame.w+lx]=c
					if p.frame.track_writes:p.frame.touch(lx,ly)
			if k>0:p.add(sx,sy,lights[i] if lights[i] else c,k)
static func aurora_blur(e,a,_receiver):
	var source:PackedFloat32Array=a[0].floats;var output=a[1];var radius:int=a[2];var width:int=320;var height:int=180;var n:int=2*radius+1;var temporary:PackedFloat32Array=[];temporary.resize(width*height);var result:PackedFloat32Array=[];result.resize(width*height)
	for y in range(height):
		var acc:float=0;var row:int=y*width
		for x in range(-radius,width+radius):
			if x+radius<width:acc+=source[row+mini(width-1,x+radius)]
			if x-radius-1>=0:acc-=source[row+x-radius-1]
			if x>=0 and x<width:temporary[row+x]=acc/n
	for x in range(width):
		var acc:float=0
		for y in range(-radius,height+radius):
			if y+radius<height:acc+=temporary[mini(height-1,y+radius)*width+x]
			if y-radius-1>=0:acc-=temporary[(y-radius-1)*width+x]
			if y>=0 and y<height:result[y*width+x]=acc/n
	output.floats=result;_semantics().read(e,"TMP").floats=temporary
static func aurora_curtain(e,a,_receiver):
	var c:Dictionary=a[1];var n:int=a[2];var t:float=a[3];var field:Dictionary=a[4];var breath:float=a[5];var rays:Array=a[6]
	var intensities=_semantics().read(e,"I");var hues=_semantics().read(e,"HV");var profile:PackedFloat32Array=_semantics().read(e,"PROF").floats
	var intensity:PackedFloat32Array=intensities.floats;var hue:PackedFloat32Array=hues.floats;intensities.floats=PackedFloat32Array();hues.floats=PackedFloat32Array()
	var fast:float=(256*2*t)/12;var slow:float=(256*t)/12;var p1:float=0;var p2:float=0;var last_x:float=-999;var s:float=c.s0
	while s<c.s1:
		var x:float=s+c.fold*sin((TAU*s)/c.flam+(TAU*c.c[0]*t)/12+n*2)+5*sin((TAU*s)/64+(TAU*c.c[2]*t)/12+n)
		if x< -162 or x>=161:s+=0.5;continue
		var hem:float=c.y+c.slope*s+c.amp*sin((TAU*s)/c.lam+(TAU*c.c[1]*t)/12+n*1.7)+c.rip*sin((TAU*s)/23-((TAU*7*t)/12+n))
		var envelope:float=M.smooth(c.s0,c.s0+60,s)*(1-M.smooth(c.s1-70,c.s1,s))
		var ray1:float=clampf((sample_at(field,s*5-fast+n*40,10+n*30)-0.38)*3.2,0,1);var ray2:float=clampf((sample_at(field,s*4.3+fast*0.7+n*90,50+n*13)-0.35)*3,0,1);var patch:float=sample_at(field,s*0.7+slow+n*17,80+n*9)
		var k:float=c.k*envelope*breath*(0.2+0.8*ray1)*(0.3+1.4*maxf(0,patch-0.3))
		if k<0.01:s+=0.5;continue
		var h:float=c.height*(0.45+0.75*ray2)*(0.75+0.5*patch);var xi:int=floori(x+160);var fraction:float=x+160-xi
		if p1>0.75 and p1>=p2 and p1>=ray1 and absf(x-last_x)>2 and k>0.25:rays.append({"x":x,"hem":hem-1,"h":h*0.9,"k":minf(0.85,k*0.9)});last_x=x
		p2=p1;p1=ray1
		if xi< -1 or xi>=320:s+=0.5;continue
		var top:int=maxi(0,floori(hem-h+180));var bottom:int=mini(179,floori(hem+180)+3);var inverse:float=1/h;var k0:float=k*0.5*(1-fraction);var k1:float=k*0.5*fraction;var v:float=(hem+180-0.5-top)*inverse
		for yi in range(top,bottom+1):
			var pr:float=profile[mini(200,int(v*200))] if v>=0 else maxf(0,0.45+v*h*0.16);var index:int=yi*320+xi;var hv:float=0 if v+c.hue<0 else 1 if v+c.hue>1 else v+c.hue
			if pr>0:
				if xi>=0:intensity[index]+=k0*pr;hue[index]+=k0*pr*hv
				if xi+1<320:intensity[index+1]+=k1*pr;hue[index+1]+=k1*pr*hv
			v-=inverse
		s+=0.5
	intensities.floats=intensity;hues.floats=hue
static func aurora_row(e,a,_receiver):
	var y:float=a[0];var row=a[1];var semantics=_semantics();var intensity:PackedFloat32Array=semantics.read(e,"I").floats;var bloom:PackedFloat32Array=semantics.read(e,"BL").floats;var hues:PackedFloat32Array=semantics.read(e,"HV").floats;var green:Array=semantics.read(e,"G");var violet:Array=semantics.read(e,"U");var middle:Array=semantics.read(e,"GM");var base:int=(floori(y)+180)*320;var by:int=(floori(y)&3)<<2
	var colors:PackedInt64Array=row.c.ints;row.c.ints=PackedInt64Array();var alphas:PackedFloat32Array=row.a.floats;row.a.floats=PackedFloat32Array();var blends:PackedInt64Array=row.b.ints;row.b.ints=PackedInt64Array();var lights:PackedInt64Array=row.l.ints;row.l.ints=PackedInt64Array();var strengths:PackedFloat32Array=row.k.floats;row.k.floats=PackedFloat32Array()
	for x in range(320):
		var i:int=base+x;var raw:float=intensity[i];var blurred:float=bloom[i];var k:float=minf(0.4,blurred*0.6) if blurred>0.015 else 0
		if raw>=0.03:
			var exposure:float=(raw*1.5)/(1+raw*1.5);var v:float=hues[i]/raw;var threshold:float=((Painter.BAYER[by|(x&3)]+0.5)/16.0)*0.06 if exposure>0.45 else 0
			var level:int=6 if exposure>0.86+threshold else 5 if exposure>0.72+threshold else 4 if exposure>0.56+threshold else 3 if exposure>0.4+threshold else 2 if exposure>0.24 else 1
			if v>0.35:level=mini(level,5)
			var c:int=green[level] if v<0.3 else middle[level] if v<0.5 else violet[level]
			if level>=3:colors[x]=c;alphas[x]=clampf((exposure-0.3)*2.2,0,1);blends[x]=1 if level<5 else 0
			lights[x]=(green[4] if v<0.4 else violet[4]) if level>=3 else green[4] if c==green[level] else violet[4] if c==violet[level] else middle[4]
			k+=exposure*(0.28 if level>=3 else 0.72)
		else:lights[x]=green[4]
		strengths[x]=k
	row.c.ints=colors;row.a.floats=alphas;row.b.ints=blends;row.l.ints=lights;row.k.floats=strengths

static func _sample_data(data:PackedFloat32Array,width:int,height:int,u:float,v:float) -> float:
	var x:int=floori(u);var y:int=floori(v);var fx:float=u-x;var fy:float=v-y
	var x0:int=x&(width-1);var x1:int=(x+1)&(width-1);var y0:int=(y&(height-1))*width;var y1:int=((y+1)&(height-1))*width
	var c0:float=data[y0+x0];var c1:float=data[y0+x1];var c2:float=data[y1+x0];var c3:float=data[y1+x1]
	return c0+(c1-c0)*fx+(c2-c0+(c0-c1-c2+c3)*fx)*fy
static func _rain_density(data:PackedFloat32Array,x:float,y:float,drift:float)->float:
	var profile:float=M.smooth(-22,-4,y)*(1-M.smooth(7,10,y))
	return profile*(0.62+(_sample_data(data,256,128,x*0.45+drift,y*4+30)-0.5)*2)
static func rain_mist(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var t:float=a[1];var seed:int=a[2];var palette:Array=a[3];var f=semantics.call_value(semantics.read(e,"field"),[seed+9,256,128,[4,8,16,32]]);var data:PackedFloat32Array=f.d.floats;var drift:float=(256*t)/8;var crest:int=semantics.call_value(semantics.read(e,"mix"),[palette[4],palette[5],0.5]);var meta:Dictionary=semantics.read(e,"meta");var width:int=meta.size[0];var x0:int=-int(meta.origin[0]);var colors:PackedInt64Array=[];colors.resize(width);var alphas:PackedFloat64Array=[];alphas.resize(width);var blends:PackedInt64Array=[];blends.resize(width);blends.fill(1);var lights:PackedInt64Array=[];lights.resize(width);lights.fill(palette[4]);var strengths:PackedFloat64Array=[];strengths.resize(width)
	if p.sn!=0:p=semantics.call_builtin("native.weather_clip",[p,meta])
	for y in range(-20,10):
		colors.fill(0);strengths.fill(0)
		for i in range(width):
			var x:float=x0+i+0.5;var cy:float=y+0.5;var density:float=_rain_density(data,x,cy,drift)
			if density<0.28:continue
			var threshold:float=((Painter.BAYER[((floori(cy)&3)<<2)|(floori(x)&3)]+0.5)/16.0)*0.06
			if density>0.46+threshold and _rain_density(data,x,cy-1,drift)<0.43:colors[i]=crest;alphas[i]=0.5
			else:colors[i]=palette[4] if density>0.58+threshold else palette[3];alphas[i]=clampf((density-0.28)*1.6,0,1)*0.5
			strengths[i]=(density-0.3)*0.1
		if p.sn==0:_composite_buffers(p,x0,y,colors,alphas,blends,lights,strengths)
		else:
			for i in range(width):
				if colors[i]:p.blend(x0+i,y,colors[i],alphas[i])
				if strengths[i]>0:p.light(x0+i,y,lights[i],strengths[i])
static func rain_floor(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var t:float=a[1];var palette:Array=a[3];var pools:Array=a[4];var meta:Dictionary=semantics.read(e,"meta");var width:int=meta.size[0];var x0:int=-int(meta.origin[0]);var q:Painter=p;var colors:PackedInt64Array=[];colors.resize(width);var alphas:PackedFloat64Array=[];alphas.resize(width);var blends:PackedInt64Array=[];blends.resize(width);var lights:PackedInt64Array=[];lights.resize(width);lights.fill(palette[5]);var strengths:PackedFloat64Array=[];strengths.resize(width)
	if p.sn!=0:q=semantics.call_builtin("native.weather_clip",[p,meta])
	for y in range(10):
		for i in range(width):
			var x:float=x0+i+0.5;colors[i]=palette[4] if y==0 else palette[1] if y==1 else palette[0];alphas[i]=1 if y<2 else 0.55;blends[i]=0 if y<2 else 1;strengths[i]=0.08 if y==0 else 0
			if y<2:continue
			for pool in pools:
				if x>=pool.x0 and x<pool.x1 and y==pool.y:colors[i]=palette[3] if x<pool.x0+2 or x>=pool.x1-2 else palette[4];alphas[i]=1;blends[i]=0;strengths[i]=0.06
		if p.sn==0:_composite_buffers(p,x0,y,colors,alphas,blends,lights,strengths)
		else:
			for i in range(width):
				if blends[i]:q.blend(x0+i,y,colors[i],alphas[i])
				else:q.dot(x0+i,y,colors[i],alphas[i])
				if strengths[i]>0:q.light(x0+i,y,lights[i],strengths[i])
	for i in range(pools.size()):
		var pool:Dictionary=pools[i];var gx:int=M.js_round(pool.x0+3+(pool.x1-pool.x0-6)*(0.5+0.5*sin((PI*2*t)/8+i*1.9)))
		p.px(gx,pool.y,palette[6]);p.glow(gx,pool.y,4,palette[5],0.2)
static func rain_back(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var t:float=M.js_round(a[1]*30000)/30000.0;var opts:Dictionary=a[2];var meta:Dictionary=semantics.read(e,"meta");var q:Painter=semantics.call_builtin("native.weather_clip",[p,meta]);var seed:int=opts.seed;var palette:Array=semantics.ColorFX.fit(opts.palette,8);var pools=semantics.call_value(semantics.read(e,"pools"),[seed]);var haze:int=semantics.ColorFX.mix(palette[0],palette[1],0.6);var width:int=meta.size[0];var x0:int=-int(meta.origin[0]);var colors:PackedInt64Array=[];colors.resize(width);colors.fill(haze);var alphas:PackedFloat64Array=[];alphas.resize(width);var blends:PackedInt64Array=[];blends.resize(width);blends.fill(1);var lights:PackedInt64Array=[];lights.resize(width);var strengths:PackedFloat64Array=[];strengths.resize(width)
	for y in range(-170,1):
		var alpha:float=0.3+0.26*M.smooth(-170,0,y+0.5)
		if p.sn==0:alphas.fill(alpha);_composite_buffers(p,x0,y,colors,alphas,blends,lights,strengths)
		else:
			for i in range(width):q.blend(x0+i,y,haze,alpha)
	rain_floor(e,[q,t,seed,palette,pools],null)
	for layer in range(3):semantics.call_value(semantics.read(e,"layer"),[q,t,seed,palette,pools,layer,opts.density])
	rain_mist(e,[p,t,seed,palette],null)
static func fog_bank_row(e,a,_receiver):
	var semantics=_semantics();var y:float=a[0];var row=a[1];var bank:Dictionary=semantics.read(e,"B");var field:Dictionary=semantics.read(e,"F");var warp_field:Dictionary=semantics.read(e,"G");var n:int=semantics.read(e,"n");var drift:float=semantics.read(e,"drift");var boil:float=semantics.read(e,"boil");var tones:Array=semantics.read(e,"tones");var crest:int=semantics.read(e,"crest");var palette:Array=semantics.read(e,"C")
	var data:PackedFloat32Array=field.d.floats;var warp_data:PackedFloat32Array=warp_field.d.floats;var breathing:PackedFloat32Array=semantics.read(e,"BR").floats
	var first=semantics.read(e,"prev1");var second=semantics.read(e,"prev2");var warp_buffer=semantics.read(e,"WARP");var prev1:PackedFloat32Array=first.floats;var prev2:PackedFloat32Array=second.floats;var warp:PackedFloat32Array=warp_buffer.floats;first.floats=PackedFloat32Array();second.floats=PackedFloat32Array();warp_buffer.floats=PackedFloat32Array()
	var colors:PackedInt64Array=row.c.ints;row.c.ints=PackedInt64Array();var alphas:PackedFloat32Array=row.a.floats;row.a.floats=PackedFloat32Array();var blends:PackedInt64Array=row.b.ints;row.b.ints=PackedInt64Array();var lights:PackedInt64Array=row.l.ints;row.l.ints=PackedInt64Array();var strengths:PackedFloat32Array=row.k.floats;row.k.floats=PackedFloat32Array()
	var top:float=bank.top;var base:float=bank.base;var bot:float=bank.bot;var sx:float=bank.sx;var sy:float=bank.sy;var warp_amount:float=bank.warp;var alpha:float=bank.alpha;var crest_from:int=bank.crestFrom;var profile:float=M.smooth(top,base,y)*(1-M.smooth(bot-(14 if bot<10 else 4),bot+1,y));var by:int=(floori(y)&3)<<2
	for i in range(0,320,2):
		var value:float=_sample_data(warp_data,warp_field.w,warp_field.h,i*0.35+n*70,y*0.5+boil)-0.5;warp[i+1]=value;warp[i]=value
	for i in range(320):
		var x:float=i-160+0.5;var w:float=warp[i];var nn:float=clampf((_sample_data(data,field.w,field.h,x*sx+drift+w*warp_amount,(y+breathing[i])*sy+w*8)-0.5)*2.6+0.5,0,1)-0.5
		var f:float=0 if profile<=0.01 else (profile*0.72+nn*0.95)*(0.6+0.5*profile);var above:float=prev2[i];prev2[i]=prev1[i];prev1[i]=f
		if f<=0.3:continue
		var threshold:float=((Painter.BAYER[by|(i&3)]+0.5)/16.0)*0.06;var band:int=2 if f>0.7+threshold else 1 if f>0.5+threshold else 0;var solid:int=2 if f>0.7 else 1 if f>0.5 else 0
		if solid>=crest_from and above<[0.3,0.5,0.7][solid]:colors[i]=crest;alphas[i]=alpha*0.95;lights[i]=palette[6];strengths[i]=0.07
		else:
			colors[i]=tones[band];alphas[i]=alpha*(0.55+0.25*band)
			if band==2:lights[i]=palette[5];strengths[i]=0.03+0.02*n
		blends[i]=1
	first.floats=prev1;second.floats=prev2;warp_buffer.floats=warp
	row.c.ints=colors;row.a.floats=alphas;row.b.ints=blends;row.l.ints=lights;row.k.floats=strengths
static func fog_streak_row(e,a,_receiver):
	var semantics=_semantics();var y:float=a[0];var row=a[1];var field:Dictionary=semantics.read(e,"F");var data:PackedFloat32Array=field.d.floats;var drift:float=semantics.read(e,"drift");var sx:float=semantics.read(e,"sx");var y0:float=semantics.read(e,"y0");var y1:float=semantics.read(e,"y1");var palette:Array=semantics.read(e,"C");var envelope:float=M.smooth(y0,y0+10,y)*(1-M.smooth(y1-10,y1,y))
	var colors:PackedInt64Array=row.c.ints;row.c.ints=PackedInt64Array();var alphas:PackedFloat32Array=row.a.floats;row.a.floats=PackedFloat32Array();var blends:PackedInt64Array=row.b.ints;row.b.ints=PackedInt64Array();var lights:PackedInt64Array=row.l.ints;row.l.ints=PackedInt64Array();var strengths:PackedFloat32Array=row.k.floats;row.k.floats=PackedFloat32Array()
	for i in range(320):
		var x:float=i-160+0.5;var s:float=(_sample_data(data,field.w,field.h,x*sx+drift,y*6.5+30)-0.64)*3*envelope
		if s<=0.05:continue
		colors[i]=palette[5 if s>0.35 else 4];alphas[i]=minf(0.4,s);blends[i]=1;lights[i]=palette[5];strengths[i]=s*0.05
	row.c.ints=colors;row.a.floats=alphas;row.b.ints=blends;row.l.ints=lights;row.k.floats=strengths
static func _composite_row(p:Painter,x0:int,y:int,row):
	var colors:PackedInt64Array=row.c.ints;var alphas:PackedFloat32Array=row.a.floats;var blends:PackedInt64Array=row.b.ints;var lights:PackedInt64Array=row.l.ints;var strengths:PackedFloat32Array=row.k.floats
	_composite_buffers(p,x0,y,colors,alphas,blends,lights,strengths)
static func _composite_buffers(p:Painter,x0:int,y:int,colors:PackedInt64Array,alphas,blends:PackedInt64Array,lights:PackedInt64Array,strengths):
	var frame=p.frame;var sy:int=floori(p.ty+y+0.5);var ly:int=sy-frame.oy
	if ly<0 or ly>=frame.h:return
	var target:PackedInt64Array=frame.color;frame.color=PackedInt64Array();var lighting:PackedInt64Array=frame.light;frame.light=PackedInt64Array();var sxf:float=p.tx+(x0+0.5)*p.fx;var fade:float=p.fade;var light_multiplier:float=fade*p.light_k;var by:int=(sy&3)<<2;var min_x:int=frame.w;var max_x:int=-1;var base:int=ly*frame.w
	for i in range(colors.size()):
		var sx:int=floori(sxf);sxf+=p.fx;var lx:int=sx-frame.ox
		if lx<0 or lx>=frame.w:continue
		var c:int=colors[i];var index:int=base+lx
		if c:
			var alpha:float=alphas[i]*fade
			if blends[i]:
				if alpha>0.004:
					var previous:int=target[index]
					if previous==0 and is_finite(alpha):target[index]=((int(alpha*255)&255)<<24)|(c&0xffffff)
					else:
						var da:float=((previous>>24)&255)/255.0;var oa:float=alpha+da*(1-alpha);var ratio:float=alpha/oa
						target[index]=((int(oa*255)&255)<<24)|((int(((c>>16)&255)*ratio+((previous>>16)&255)*(1-ratio))&255)<<16)|((int(((c>>8)&255)*ratio+((previous>>8)&255)*(1-ratio))&255)<<8)|(int((c&255)*ratio+(previous&255)*(1-ratio))&255)
					min_x=mini(min_x,lx);max_x=maxi(max_x,lx)
			elif alpha>=1 or alpha>(Painter.BAYER[by|(sx&3)]+0.5)/16.0:target[index]=c;min_x=mini(min_x,lx);max_x=maxi(max_x,lx)
		var k:float=strengths[i]
		if k>0:
			k*=light_multiplier
			if k>0.004:
				var light_color:int=lights[i] if lights[i] else c;var previous:int=lighting[index]
				lighting[index]=0xff000000|(int(minf(255,((previous>>16)&255)+((light_color>>16)&255)*k))<<16)|(int(minf(255,((previous>>8)&255)+((light_color>>8)&255)*k))<<8)|int(minf(255,(previous&255)+(light_color&255)*k));min_x=mini(min_x,lx);max_x=maxi(max_x,lx)
	frame.color=target;frame.light=lighting
	if frame.track_writes and min_x<=max_x:frame.touch(min_x,ly);frame.touch(max_x,ly)

static func storm_veil_pixel(e,a,_receiver):
	var semantics=_semantics();var x:float=a[0];var y:float=a[1];var out:Dictionary=a[2];var field:Dictionary=semantics.read(e,"F");var shift:float=semantics.read(e,"shift");var f:float=semantics.read(e,"f");var palette:Array=semantics.read(e,"C");var glow:int=semantics.read(e,"glow")
	var noise_value:float=sample_at(field,(x-y*0.42)*1.9-shift,y*0.16+7);var density:float=clampf(0.45+(noise_value-0.5)*2.6,0,1)
	out.c=preload("../core/color.gd").mix(palette[1],glow,minf(1,f*density*0.7*maxf(0.25,1-absf(x-52)/220))) if f>0.05 else palette[1];out.a=0.4+0.38*density;out.b=1
static func storm_veil_rows(p:Painter,y0:int,y1:int,e):
	var semantics=_semantics();var field:Dictionary=semantics.read(e,"F");var data:PackedFloat32Array=field.d.floats;var shift:float=semantics.read(e,"shift");var f:float=semantics.read(e,"f");var palette:Array=semantics.read(e,"C");var glow:int=semantics.read(e,"glow")
	var colors:PackedInt64Array=[];colors.resize(320);var alphas:PackedFloat64Array=[];alphas.resize(320);var blends:PackedInt64Array=[];blends.resize(320);blends.fill(1);var lights:PackedInt64Array=[];lights.resize(320);var strengths:PackedFloat64Array=[];strengths.resize(320)
	for sy in range(y0,y1+1):
		var y:float=sy+0.5
		for i in range(320):
			var x:float=i-160+0.5;var noise_value:float=_sample_data(data,field.w,field.h,(x-y*0.42)*1.9-shift,y*0.16+7);var density:float=clampf(0.45+(noise_value-0.5)*2.6,0,1)
			colors[i]=preload("../core/color.gd").mix(palette[1],glow,minf(1,f*density*0.7*maxf(0.25,1-absf(x-52)/220))) if f>0.05 else palette[1];alphas[i]=0.4+0.38*density
		_composite_buffers(p,-160,sy,colors,alphas,blends,lights,strengths)

static func blizzard_sheet_row(e,a,_receiver):
	var semantics=_semantics();var y:float=a[0];var row=a[1];var field:Dictionary=semantics.read(e,"F");var data:PackedFloat32Array=field.d.floats;var shift:float=semantics.read(e,"shift");var near:bool=bool(semantics.read(e,"near"));var sy:float=semantics.read(e,"sy");var threshold:float=semantics.read(e,"th");var color:int=semantics.read(e,"c");var haze:int=semantics.read(e,"haze");var palette:Array=semantics.read(e,"C");var gusts:PackedFloat32Array=semantics.read(e,"GX").floats;var waves:PackedFloat32Array=semantics.read(e,"WV").floats;var fade:float=M.smooth(-110,-40,y) if near else 1
	var colors:PackedInt64Array=row.c.ints;row.c.ints=PackedInt64Array();var alphas:PackedFloat32Array=row.a.floats;row.a.floats=PackedFloat32Array();var blends:PackedInt64Array=row.b.ints;row.b.ints=PackedInt64Array();var lights:PackedInt64Array=row.l.ints;row.l.ints=PackedInt64Array();var strengths:PackedFloat32Array=row.k.floats;row.k.floats=PackedFloat32Array()
	for i in range(320):
		var g:float=gusts[i];var noise_value:float=_sample_data(data,field.w,field.h,(i-160)*0.16-shift,(y+waves[i])*sy+40);var d:float=(noise_value-threshold)*2.2*(0.35+g)*fade
		if near:
			if d<=0.02:continue
			colors[i]=color;alphas[i]=minf(0.5,d)
		else:colors[i]=color if d>0.08 else haze;alphas[i]=0.3+0.12*g+minf(0.42,maxf(0,d))
		blends[i]=1
		if d>0.05:lights[i]=palette[5];strengths[i]=d*0.08
	row.c.ints=colors;row.a.floats=alphas;row.b.ints=blends;row.l.ints=lights;row.k.floats=strengths
static func blizzard_ground_row(e,a,_receiver):
	var semantics=_semantics();var y:float=a[0];var row=a[1];var field:Dictionary=semantics.read(e,"F");var data:PackedFloat32Array=field.d.floats;var shift:float=semantics.read(e,"shift");var palette:Array=semantics.read(e,"C");var gusts:PackedFloat32Array=semantics.read(e,"GX").floats;var waves:PackedFloat32Array=semantics.read(e,"WV").floats
	var colors:PackedInt64Array=row.c.ints;row.c.ints=PackedInt64Array();var alphas:PackedFloat32Array=row.a.floats;row.a.floats=PackedFloat32Array();var blends:PackedInt64Array=row.b.ints;row.b.ints=PackedInt64Array();var lights:PackedInt64Array=row.l.ints;row.l.ints=PackedInt64Array();var strengths:PackedFloat32Array=row.k.floats;row.k.floats=PackedFloat32Array()
	for i in range(320):
		var x:float=i-160+0.5;var d:float=y-waves[i]
		if d>=0:
			colors[i]=0xffffffff if d<1 else palette[6 if d<2 else 5 if d<4 else 4]
			if d<1:lights[i]=palette[6];strengths[i]=0.1
			continue
		if y< -14:continue
		var noise_value:float=_sample_data(data,field.w,field.h,x*0.5-shift,y*3+9);var s:float=(noise_value-0.5)*3*M.smooth(-14,-1,y)*(0.4+gusts[i])
		if s>0.02:colors[i]=palette[6];alphas[i]=minf(0.55,s);blends[i]=1
	row.c.ints=colors;row.a.floats=alphas;row.b.ints=blends;row.l.ints=lights;row.k.floats=strengths

static func storm_deck(e,a,_receiver):
	var semantics=_semantics();var p:Painter=a[0];var bounds:Dictionary=a[1];var t:float=a[2];var seed:int=a[3];var palette:Array=a[4];var volts:Array=a[5];var light_at=a[6];var lit:bool=a[7]
	var rolls:Array=semantics.call_value(semantics.read(e,"rolls"),[seed,t]);var field:Dictionary=semantics.call_value(semantics.read(e,"field"),[seed*3+1,256,128]);var data:PackedFloat32Array=field.d.floats;var drift:float=(256*t)/10;var rows:Array=semantics.read(e,"ROWS");var count:int=rows.size();var mo:float=pow(cos((PI*t)/10),2)
	var ramp:Array=[palette[0],palette[1],palette[2],palette[3],palette[4],palette[5],palette[6],volts[4],0xffffffff];var bottom:PackedFloat32Array=[];bottom.resize(count);var bulges:PackedFloat32Array=[];bulges.resize(count)
	for x in range(int(bounds.x0),int(bounds.x1)):
		var cx:float=x+0.5;var low:float=-170
		for j in range(count):
			var row:Dictionary=rows[j];var und:float=(_sample_data(data,field.w,field.h,cx*0.55+j*91,3)*mo+_sample_data(data,field.w,field.h,cx*0.55+j*91,60)*(1-mo)-0.5)*2
			var sag:float=9*exp(-pow((cx-40)/95,2))-3
			var center:float=row.base+sag*(0.4+j*0.3)+7*und+row.wob*2*(_sample_data(data,field.w,field.h,cx*1.8+j*61-drift*(0.5-j*0.1),20+j*17)-0.5);var bump:float=0
			for billow in rolls[j]:
				var dx:float=(cx-billow.x)/billow.rx
				if dx*dx<1:bump=maxf(bump,billow.h*sqrt(1-dx*dx))
			var y1:float=center+bump;bottom[j]=y1;bulges[j]=bump;low=maxf(low,y1)
		var previous:int=-1;var previous_bottom:float=-999
		for y in range(int(bounds.y0),ceili(low)):
			var cy:float=y+0.5;var j:int=0
			while j<count and not (cy>= -999 and cy<bottom[j]):j+=1
			if j>=count:previous=-1;continue
			if j!=previous:
				if previous>=0 and previous<j:previous_bottom=cy
				previous=j
			var row:Dictionary=rows[j];var distance:float=bottom[j]-cy;var tone:Array=row.tone;var threshold:float=(Painter.BAYER[((y&3)<<2)|(x&3)]+0.5)/16.0;var color_index:int
			if distance<1:color_index=tone[3] if bulges[j]>3 else tone[3]-1
			elif cy-previous_bottom<1.5 and j>0:color_index=maxi(0,tone[0]-1)
			elif distance<2+bulges[j]*0.25+threshold*2:color_index=tone[2]
			elif distance<6+bulges[j]*0.4+threshold*3:color_index=tone[1]
			else:
				var noise_value:float=_sample_data(data,field.w,field.h,cx*0.9+j*77-drift*(0.6-j*0.12),cy*1.7+j*31);color_index=tone[0]+(1 if row.tex and noise_value>0.6 else 0)
			var light_strength:float=0
			if lit:
				var value:float=semantics.call_value(light_at,[cx,cy])
				if value>0.02:color_index=mini(8,color_index+M.js_round(value*(4.4 if distance<1 else 3.8 if distance<4 else 3.1)));light_strength=value
			if row.get("haze",false) and light_strength==0 and distance>=1:p.blend(x,y,ramp[color_index],0.75)
			else:p.px(x,y,ramp[maxi(0,color_index)])
			if light_strength>0.03:p.light(x,y,volts[3],light_strength*(0.4 if distance<3 else 0.22))

static func god_rays_row(e,a,_receiver):
	var semantics=_semantics();var y:float=a[0];var row=a[1];var centers:PackedFloat32Array=semantics.read(e,"SC").floats;var inverse:PackedFloat32Array=semantics.read(e,"SI").floats;var strengths_by_shaft:PackedFloat32Array=semantics.read(e,"SK").floats;var strands:PackedFloat32Array=semantics.read(e,"STR").floats;var palette:Array=semantics.read(e,"C");var dim:Array=semantics.read(e,"L");var axis_x:float=semantics.read(e,"AX");var axis_y:float=semantics.read(e,"AY");var normal_x:float=semantics.read(e,"NX");var normal_y:float=semantics.read(e,"NY");var floor_pixel:bool=y>0;var dy:float=y+300;var air:float=0.8 if floor_pixel else 0.66;var boost:float=1.6 if floor_pixel else 1;var radius:float=(-160+0.5+230)*axis_x+dy*axis_y;var normal:float=(-160+0.5+230)*normal_x+dy*normal_y
	var colors:PackedInt64Array=row.c.ints;row.c.ints=PackedInt64Array();var alphas:PackedFloat32Array=row.a.floats;row.a.floats=PackedFloat32Array();var blends:PackedInt64Array=row.b.ints;row.b.ints=PackedInt64Array();var lights:PackedInt64Array=row.l.ints;row.l.ints=PackedInt64Array();var strengths:PackedFloat32Array=row.k.floats;row.k.floats=PackedFloat32Array();colors.fill(palette[0]);alphas.fill(air);blends.fill(1)
	for i in range(320):
		var angle:float=normal/radius;var exposure:float=0
		for j in range(centers.size()):
			var q:float=(angle-centers[j])*inverse[j]
			if q> -1 and q<1:
				var w:float=1-q*q;exposure+=strengths_by_shaft[j]*w*sqrt(w)
		if exposure>0:
			var fall:float=1.35-(radius-200)/330;var si:int=int((angle+0.36)*700);exposure*=(1 if fall>1 else 0 if fall<0 else fall)*(0.7+0.45*strands[clampi(si,0,511)])*boost
			if exposure>=0.06:
				var level:int=6 if exposure>1.05 else 5 if exposure>0.78 else 4 if exposure>0.52 else 3 if exposure>0.3 else 2;colors[i]=palette[level] if floor_pixel else dim[level];alphas[i]=0.85 if floor_pixel else minf(0.78,0.12+exposure*0.5);lights[i]=palette[4];strengths[i]=exposure*(0.32 if floor_pixel else 0.26)
		radius+=axis_x;normal+=normal_x
	row.c.ints=colors;row.a.floats=alphas;row.b.ints=blends;row.l.ints=lights;row.k.floats=strengths
static func snow_haze_pixel(e,a,_receiver):
	var semantics=_semantics();var out:Dictionary=a[2];out.c=semantics.read(e,"haze");out.a=0.26+0.22*M.smooth(-170,0,a[1]);out.b=1
static func snow_haze_rows(p:Painter,y0:int,y1:int,e):
	var haze:int=_semantics().read(e,"haze");var colors:PackedInt64Array=[];colors.resize(320);colors.fill(haze);var alphas:PackedFloat64Array=[];alphas.resize(320);var blends:PackedInt64Array=[];blends.resize(320);blends.fill(1);var lights:PackedInt64Array=[];lights.resize(320);var strengths:PackedFloat64Array=[];strengths.resize(320)
	for y in range(y0,y1+1):alphas.fill(0.26+0.22*M.smooth(-170,0,y+0.5));_composite_buffers(p,-160,y,colors,alphas,blends,lights,strengths)
