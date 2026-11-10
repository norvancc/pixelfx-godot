"""Export every catalog entry from native Godot into a 30 fps GIF and poster."""
from pathlib import Path
import argparse, hashlib, json, os, subprocess, time

def main():
 p=argparse.ArgumentParser();p.add_argument('--output',type=Path,required=True);p.add_argument('--effects',default='');args=p.parse_args()
 root=Path(__file__).resolve().parents[2];out=args.output.resolve();out.mkdir(parents=True,exist_ok=True)
 scratch=root/'builds/pixelfx/catalog-previews';scratch.mkdir(parents=True,exist_ok=True)
 with (scratch/'import.log').open('w') as log:
  subprocess.run([os.environ.get('GODOT_BIN','/Applications/Godot.app/Contents/MacOS/Godot'),'--headless','--path',str(root),'--editor','--import','--quit'],cwd=root,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=600)
 rows=json.loads((root/'docs/migration-status.json').read_text())['entries']
 selected=set(filter(None,args.effects.split(',')));manifest=[]
 if (out/'manifest.json').exists():manifest=json.loads((out/'manifest.json').read_text())
 for index,row in enumerate(rows):
  effect=row['effect'];slug=effect.replace('/','-')
  if selected and effect not in selected:continue
  if any(x['id']==effect for x in manifest) and (out/(slug+'.gif')).exists():continue
  folder=scratch/slug;folder.mkdir(exist_ok=True);started=time.monotonic()
  env={**os.environ,'PIXELFX_PREVIEW_EFFECT':effect,'PIXELFX_PREVIEW_DIR':str(folder),'PIXELFX_PREVIEW_IMPLEMENTATION':row['godot_path']}
  print('CAPTURE_START',index+1,'/244',effect,flush=True)
  with (folder/'godot.log').open('w') as log:
   result=subprocess.run([os.environ.get('GODOT_BIN','/Applications/Godot.app/Contents/MacOS/Godot'),'--headless','--path',str(root),'--script','tools/pixelfx/render_preview.gd'],cwd=root,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=900)
  log=(folder/'godot.log').read_text()
  if result.returncode or 'PREVIEW_CAPTURE_DONE' not in log or 'SCRIPT ERROR:' in log or '\nERROR:' in log:raise SystemExit(effect+' capture failed: '+log[-2000:])
  meta=json.loads((folder/'capture.json').read_text());w,h=meta['width'],meta['height']
  base=['ffmpeg','-hide_banner','-loglevel','error','-y','-threads','1','-filter_threads','1','-filter_complex_threads','1','-f','rawvideo','-pixel_format','rgba','-video_size',f'{w}x{h}','-framerate','30','-i',str(folder/'frames.rgba')]
  # Preserve every native time sample. finish_previews.py applies one stable full-motion crop.
  scale='scale=480:320:force_original_aspect_ratio=decrease:flags=neighbor,pad=480:320:(ow-iw)/2:(oh-ih)/2:color=0x110d14,setsar=1'
  subprocess.run(base+['-filter_complex',scale+',split[a][b];[a]palettegen=max_colors=256:stats_mode=diff[p];[b][p]paletteuse=dither=sierra2_4a','-loop','0',str(out/(slug+'.gif'))],check=True,timeout=240)
  # Poster from a useful lifecycle time; animated file retains the entire cycle.
  subprocess.run(base+['-ss',str(min(meta['duration']*.30,1.2)),'-vf',scale,'-frames:v','1',str(out/(slug+'.png'))],check=True,timeout=60)
  record={'id':effect,'name':meta['name'],'description':meta['description'],'category':effect.split('/')[0],'tags':meta['tags'],'duration':round(meta['frames']/30,3),'capture_version':meta.get('capture_version',1),'loop':meta['loop'],'gif':'assets/previews/'+slug+'.gif','poster':'assets/previews/'+slug+'.png','frames':meta['frames'],'fps':30,'width':480,'height':320,'implementation':row['godot_path'],'status':row['status'],'source_sha256':hashlib.sha256((root/row['godot_path']).read_bytes()).hexdigest(),'gif_sha256':hashlib.sha256((out/(slug+'.gif')).read_bytes()).hexdigest(),'bytes':(out/(slug+'.gif')).stat().st_size}
  manifest=[m for m in manifest if m['id']!=effect]+[record];manifest.sort(key=lambda m:m['id']);(out/'manifest.json').write_text(json.dumps(manifest,ensure_ascii=False,indent=2)+'\n')
  (folder/'frames.rgba').unlink()
  print('CAPTURE_DONE',len(manifest),'/244',effect,'frames='+str(meta['frames']),'seconds='+str(round(time.monotonic()-started,1)),flush=True)
 print('CATALOG_PREVIEWS_DONE count='+str(len(manifest)),flush=True)
if __name__=='__main__':main()
