"""Crop each GIF to one stable full-motion rectangle; keep every original frame."""
from pathlib import Path
import json,hashlib
from PIL import Image,ImageChops,ImageSequence

def finish(folder,only=None):
 manifest_path=folder/'manifest.json';items=json.loads(manifest_path.read_text())
 for item in items:
  if only and item['id'] not in only:continue
  if item.get('framing')=='full-motion-union-v1':continue
  p=folder/Path(item['gif']).name
  source=Image.open(p);frames=[];durations=[];bounds=None
  bg=Image.new('RGB',source.size,(17,13,20))
  for original in ImageSequence.Iterator(source):
   im=original.convert('RGB');frames.append(im.copy());durations.append(original.info.get('duration',30))
   diff=ImageChops.difference(im,bg)
   # Small GIF palette rounding must not count the dark field as artwork.
   mask=diff.convert('L').point(lambda x:255 if x>4 else 0);box=mask.getbbox()
   if box:bounds=box if bounds is None else (min(bounds[0],box[0]),min(bounds[1],box[1]),max(bounds[2],box[2]),max(bounds[3],box[3]))
  if bounds is None:raise RuntimeError('Empty native animation: '+item['id'])
  x0,y0,x1,y1=bounds;pad=14;bounds=(max(0,x0-pad),max(0,y0-pad),min(480,x1+pad),min(320,y1+pad))
  cw,ch=bounds[2]-bounds[0],bounds[3]-bounds[1];k=min(452/cw,292/ch)
  if k>=1:k=max(1,int(k))
  size=(max(1,round(cw*k)),max(1,round(ch*k)))
  framed=[]
  for im in frames:
   cut=im.crop(bounds).resize(size,Image.Resampling.NEAREST);canvas=Image.new('RGB',(480,320),(17,13,20));canvas.paste(cut,((480-size[0])//2,(320-size[1])//2));framed.append(canvas)
  framed[0].save(p,save_all=True,append_images=framed[1:],duration=durations,loop=0,optimize=False,disposal=2)
  # Pick a nonempty middle frame, avoiding a fully white transition flash.
  pick=min(len(framed)-1,max(0,int(len(framed)*.3)))
  framed[pick].save(folder/Path(item['poster']).name)
  item.update({'framing':'full-motion-union-v1','source_frames':item['frames'],'frames':Image.open(p).n_frames,'native_bounds':list(bounds),'bytes':p.stat().st_size,'gif_sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
  print('FRAMED',item['id'],bounds,flush=True)
 manifest_path.write_text(json.dumps(items,ensure_ascii=False,indent=2)+'\n')
if __name__=='__main__':
 import argparse
 p=argparse.ArgumentParser();p.add_argument('folder',type=Path);p.add_argument('--effects',default='');a=p.parse_args();finish(a.folder,set(filter(None,a.effects.split(','))))
