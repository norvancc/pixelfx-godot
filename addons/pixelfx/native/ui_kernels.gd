@tool
extends RefCounted
const Painter=preload("painter.gd")
static func _row_open(row:Array,gx:int)->bool:
	return (gx<0 or gx>=row.size() or not row[gx]) and (gx-1<0 or gx-1>=row.size() or not row[gx-1]) and (gx+1<0 or gx+1>=row.size() or not row[gx+1])
static func _word_at(ids:PackedInt32Array,x:int,y:int,x0:int,y0:int,width:int,height:int)->int:
	return 0 if x<x0 or y<y0 or x>=x0+width or y>=y0+height else ids[(y-y0)*width+x-x0]
static func draw_word(_e,a,_r):
	var p:Painter=a[0];var items:Array=a[1];var style:Dictionary=a[2]
	if items.is_empty():return
	var x0:float=INF;var y0:float=INF;var x1:float=-INF;var y1:float=-INF
	for item in items:
		var glyph=item.g;var h:float=glyph.rows.size()*item.sy;var w:float=glyph.w*item.sx;var slant:float=absf(item.get("slant",0))*glyph.rows.size()
		x0=minf(x0,item.x-slant);x1=maxf(x1,item.x+w+slant);y0=minf(y0,item.y);y1=maxf(y1,item.y+h)
	var outline_width:int=style.get("ow",1);var left:int=floori(x0)-1-outline_width;var top:int=floori(y0)-1-outline_width;var right:int=ceili(x1)+2+outline_width;var bottom:int=ceili(y1)+3+outline_width;var width:int=right-left;var height:int=bottom-top;var ids:PackedInt32Array=[];ids.resize(width*height);var edges:PackedByteArray=[];edges.resize(width*height);var semantics=load("res://addons/pixelfx/native/semantics.gd")
	for k in range(items.size()):
		var item:Dictionary=items[k];var glyph=item.g;var rows:Array=[]
		for row in glyph.rows:rows.append(semantics.array(row))
		var gh:int=rows.size();var glyph_width:int=glyph.w;var sx:float=item.sx;var sy:float=item.sy;var x:float=item.x;var y:float=item.y;var bot:float=y+gh*sy;var slant:float=item.get("slant",0)
		for py in range(floori(y),ceili(bot)):
			var gy:int=floori((py+0.5-y)/sy)
			if gy<0 or gy>=gh:continue
			var shift:int=floori(((bot-py-0.5)/sy)*slant+0.5);var ry:float=py+0.5-y-gy*sy;var row:Array=rows[gy]
			for px in range(floori(x+shift)-1,ceili(x+shift+glyph_width*sx)+1):
				var fx:float=px+0.5-x-shift;var gx:int=floori(fx/sx)
				if gx<0 or gx>=glyph_width or not row[gx]:continue
				var index:int=(py-top)*width+px-left
				if index<0 or index>=width*height:continue
				ids[index]=k+1;var rx:float=fx-gx*sx;var up:bool=gy==0 or _row_open(rows[gy-1],gx);var down:bool=gy==gh-1 or _row_open(rows[gy+1],gx)
				edges[index]=(1 if ry<1 and up else 0)|(2 if ry>=sy-1 and down else 0)|(4 if rx<1 and not (gx>0 and row[gx-1]) else 0)
	var fill:Array=style.fill;var count:int=fill.size();var shine=style.get("shine");var glint:int=style.get("glint",0xffffffff);var shine_y:float=style.get("shineY",top)
	for y in range(top,bottom):
		for x in range(left,right):
			var id:int=ids[(y-top)*width+x-left]
			if id:
				var item:Dictionary=items[id-1];var v:float=(y+0.5-item.y)/(item.g.rows.size()*item.sy);var index:int=mini(count-1,maxi(0,floori((1-v)*count)));var color:int=fill[index];var edge:int=edges[(y-top)*width+x-left]
				if edge&1:color=style.get("edge",fill[count-1])
				elif edge&2:color=style.get("under",fill[0])
				elif edge&4 and index<count-1:color=fill[index+1]
				if shine!=null:
					var distance:float=absf(x+0.5-(y+0.5-shine_y)*0.6-shine)
					if distance<1.1:color=0xffffffff
					elif distance<2.4:color=glint
				var flash:float=item.get("flash",0)
				if flash>0.6 or flash>0.25 and v<0.5:color=0xffffffff
				p.dot(x,y,color,item.get("a",1));continue
			var neighbor:int=0
			for dy in range(-outline_width,outline_width+1):
				if neighbor:break
				for dx in range(-outline_width,outline_width+1):
					if neighbor:break
					if outline_width<2 or absi(dx)+absi(dy)<4:neighbor=_word_at(ids,x+dx,y+dy,left,top,width,height)
			if neighbor:
				p.dot(x,y,style.get("outline",0),items[neighbor-1].get("a",1));continue
			var shadow:int=_word_at(ids,x-outline_width,y-1-outline_width,left,top,width,height)
			if not shadow:shadow=_word_at(ids,x+1-outline_width,y-1-outline_width,left,top,width,height)
			if not shadow:shadow=_word_at(ids,x-outline_width,y-outline_width,left,top,width,height)
			if shadow and style.get("shadow",0):p.dot(x,y,style.shadow,items[shadow-1].get("a",1)*0.9)
