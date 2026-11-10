@tool
extends RefCounted
## Native pixel grid operations shared by the critter algorithms.
const M=preload("../core/math.gd")
const Painter=preload("painter.gd")
static func _s():return load("res://addons/pixelfx/native/semantics.gd")
static func index(grid,x:float,y:float)->int:
 var ix:int=floori(x)-int(grid.x0);var iy:int=floori(y)-int(grid.y0)
 return -1 if ix<0 or iy<0 or ix>=grid.w or iy>=grid.h else iy*int(grid.w)+ix
static func set_pixel(grid,x:float,y:float,c,alpha:float=1,tag:int=0):
 var i:int=index(grid,x,y)
 if i>=0 and c:grid.c.ints[i]=int(c)&0xffffffff;grid.a.floats[i]=alpha;grid.tag.ints[i]=tag&255
static func idx(_e,a,r):return index(r,a[0],a[1])
static func set_value(_e,a,r):set_pixel(r,a[0],a[1],a[2],a[3] if a.size()>3 else 1,a[4] if a.size()>4 else 0)
static func get_value(_e,a,r):
 var i:int=index(r,a[0],a[1]);return 0 if i<0 else r.c.ints[i]
static func shade(_e,a,r):
 var fn=a[4];var out:Dictionary=r.o;var semantics=_s()
 for y in range(floori(a[1]),floori(a[3])+1):
  for x in range(floori(a[0]),floori(a[2])+1):
   out.a=1;out.t=0;var color=semantics.call_value(fn,[x+0.5,y+0.5,out])
   if color:set_pixel(r,x,y,color,out.a,out.t)
static func ellipse(_e,a,r):
 var cx:float=a[0];var cy:float=a[1];var rx:float=a[2];var ry:float=a[3];var color=a[4];var alpha:float=a[5] if a.size()>5 else 1
 if rx<=0 or ry<=0:return
 var semantics=_s();var callable:bool=color is Object and color.has_method("invoke") or color is Callable
 for y in range(floori(cy-ry),floori(cy+ry)+1):
  for x in range(floori(cx-rx),floori(cx+rx)+1):
   var nx:float=(x+0.5-cx)/rx;var ny:float=(y+0.5-cy)/ry
   if nx*nx+ny*ny>1:continue
   set_pixel(r,x,y,semantics.call_value(color,[nx,ny]) if callable else color,alpha)
static func line(_e,a,r):
 var x0:float=a[0];var y0:float=a[1];var x1:float=a[2];var y1:float=a[3];var color=a[4];var alpha:float=a[5] if a.size()>5 else 1
 var n:int=maxi(1,ceili(maxf(absf(x1-x0),absf(y1-y0))));var semantics=_s();var callable:bool=color is Object and color.has_method("invoke") or color is Callable
 for i in range(n+1):set_pixel(r,x0+((x1-x0)*i)/n,y0+((y1-y0)*i)/n,semantics.call_value(color,[float(i)/n]) if callable else color,alpha)
static func draw(_e,a,r):
 var p:Painter=a[0];var fade:float=a[1] if a.size()>1 else 1;var dx:float=a[2] if a.size()>2 else 0;var dy:float=a[3] if a.size()>3 else 0
 var left:int=r.x0+M.js_round(dx);var top:int=r.y0+M.js_round(dy);var colors:PackedInt64Array=r.c.ints;var alphas:PackedFloat32Array=r.a.floats;var width:int=r.w
 for y in range(int(r.h)):
  for x in range(width):
   var i:int=y*width+x;var c:int=colors[i]
   if c==0:continue
   if alphas[i]>=0.999:p.dot(left+x,top+y,c,fade)
   else:p.blend(left+x,top+y,c,alphas[i]*fade)
static func outline(_e,a,r):
 var colors:PackedInt64Array=r.c.ints.duplicate();var width:int=r.w;var height:int=r.h;var color=a[0];var alpha:float=a[1] if a.size()>1 else 1;var semantics=_s();var callable:bool=color is Object and color.has_method("invoke") or color is Callable
 for y in range(height):
  for x in range(width):
   var i:int=y*width+x
   if colors[i]!=0:continue
   var left:bool=x>0 and colors[i-1]!=0;var right:bool=x<width-1 and colors[i+1]!=0;var up:bool=y>0 and colors[i-width]!=0;var down:bool=y<height-1 and colors[i+width]!=0
   if not (left or right or up or down):continue
   var c=semantics.call_value(color,[r.x0+x,r.y0+y,int(left)-int(right),int(up)-int(down)]) if callable else color
   if c:r.c.ints[i]=int(c)&0xffffffff;r.a.floats[i]=alpha;r.tag.ints[i]=255
static func clear(_e,_a,r):r.c.ints.fill(0);r.tag.ints.fill(0);r.d=null;return r
