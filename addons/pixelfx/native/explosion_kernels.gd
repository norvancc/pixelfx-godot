@tool
extends RefCounted
const M=preload("../core/math.gd")
const C=preload("../core/color.gd")
const Painter=preload("painter.gd")
static func lobe(_e,a,_receiver):
 var p:Painter=a[0];var x:float=a[1];var y:float=a[2];var radius:float=a[3];var fire_ramp:Array=a[4];var smoke_ramp:Array=a[5];var fire:float=a[6];var glow:float=a[7];var alpha:float=a[8];var depth:float=a[9] if a.size()>9 else 0;var dark:int=a[10] if a.size()>10 else 0;var style:int=a[11] if a.size()>11 else 0
 if radius<0.7 or alpha<=0.01:return
 var n:int=fire_ramp.size();var m:int=smoke_ramp.size();var back:int=1 if depth< -0.35 else 0;var rim:float=1-minf(0.35,1.6/radius);var seam:float=1-minf(0.3,1.3/radius);var soft:float=0.55+0.4*(1-minf(1,alpha))
 var smoke:Array=[]
 for i in range(5):smoke.append(smoke_ramp[mini(m-1,i+back+dark)])
 var pixel=func(lx:float,ly:float,sx:int,sy:int):
  var dx:float=(lx-x)/radius;var dy:float=(ly-y)/radius;var d2:float=dx*dx+dy*dy
  if d2>1:return
  var d:float=sqrt(d2);var nz:float=sqrt(1-d2);var sky:float=-0.5*dx-0.66*dy+0.56*nz;var intensity:float=fire*(1.32-0.78*d)+0.14*sky*fire
  var color:int=0;var k:float=0;var solid:bool=false
  if intensity>0.44:
   var i:int=mini(n-3,maxi(0,floori((1.3-intensity)*(n-1)*0.78)))
   if d>seam:i=mini(6,maxi(4,i+2))
   elif d>seam-0.22:i=mini(n-3,i+1)
   color=fire_ramp[i];k=0.05*fire;solid=true
  elif style:
   var lam:float=-0.42*dx-0.78*dy+0.46*nz
   if lam>0.66 and d>0.4:color=smoke[0]
   elif lam>0.16:color=smoke[1]
   elif lam> -0.3:color=smoke[2]
   else:
    color=smoke[4 if lam< -0.64 else 3];var g:float=glow*(0.6+0.4*dy)
    if g>0.55:color=fire_ramp[5 if g>0.8 else 6];k=0.08*g
    elif g>0.34:color=C.mix(color,fire_ramp[6],0.6)
    elif g>0.16:color=C.mix(color,fire_ramp[7],0.45)
  else:
   var g:float=glow*(0.82*dy+0.3*nz)
   if g>0.45:color=fire_ramp[4 if g>0.66 else 5];k=0.1*glow
   elif g>0.3:color=fire_ramp[6]
   elif g>0.2:color=fire_ramp[7]
   else:
    var s:float=sky*0.5+0.5;color=smoke[0 if s>0.8 else 1 if s>0.62 else 2 if s>0.42 else 3 if s>0.22 else 4]
  p.blend_px(sx,sy,color,alpha if solid or d<=rim else alpha*soft)
  if k>0:p.add(sx,sy,color,k)
 if p.sn!=0 or p.cs!=1:p.each(x-radius,y-radius,x+radius,y+radius,pixel);return
 var ax:float=p.tx+(x-radius)*p.fx;var bx:float=p.tx+(x+radius)*p.fx;var x0:int=maxi(p.frame.ox,floori(minf(ax,bx)));var x1:int=mini(p.frame.ox+p.frame.w-1,ceili(maxf(ax,bx)));var cx:float=p.tx+x*p.fx
 for sy in range(maxi(p.frame.oy,floori(p.ty+y-radius)),mini(p.frame.oy+p.frame.h-1,ceili(p.ty+y+radius))+1):
  var ly:float=sy+0.5-p.ty;var q:float=(ly-y)/radius
  if q*q>=1:continue
  var half:float=radius*sqrt(1-q*q)
  for sx in range(maxi(x0,floori(cx-half-0.5)),mini(x1,ceili(cx+half))+1):pixel.call((sx+0.5-p.tx)*p.fx,ly,sx,sy)
static func floor_ring(_e,a,_receiver):
 var p:Painter=a[0];var cx:float=a[1];var cy:float=a[2];var radius:float=a[3];var scale_y:float=a[4];var color=a[5];var alpha=a[6] if a.size()>6 else 1;var keep=a[7] if a.size()>7 else null
 if radius<0.5:return
 var semantics=load("res://addons/pixelfx/native/semantics.gd");var color_fn:bool=color is Object or color is Callable;var alpha_fn:bool=alpha is Object or alpha is Callable;var ry:float=radius*scale_y
 p.each(cx-radius-1,cy-ry-1,cx+radius+1,cy+ry+1,func(x:float,y:float,sx:int,sy:int):
  var nx:float=(x-cx)/radius;var ny:float=(y-cy)/maxf(0.3,ry);var d:float=sqrt(nx*nx+ny*ny)
  if d<0.000001:return
  var gx:float=nx/radius;var gy:float=ny/maxf(0.3,ry);var g:float=sqrt(gx*gx+gy*gy)/d
  if absf(d-1)/g>0.5:return
  var angle:float=atan2(ny,nx)
  if keep!=null and not semantics.truth(semantics.call_value(keep,[angle])):return
  p.put(sx,sy,semantics.call_value(color,[angle]) if color_fn else color,semantics.call_value(alpha,[angle]) if alpha_fn else alpha)
 )
