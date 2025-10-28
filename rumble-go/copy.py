
from pathlib import Path
import shutil


path = Path("/Users/mattp/Downloads/Rumble Racing (USA)/Rumble Racing (USA)/")
out_dir = Path.cwd()

trk_files = [p for p in path.rglob("*") if p.suffix.lower() == ".trk"]

for f in trk_files:
    shutil.copyfile(f, out_dir / "TRK" / f.name)