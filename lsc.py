from pathlib import Path
import subprocess

"""
Input #0, ipu, from 'MP/MP2.LSC':
  Duration: 00:00:00.04, start: 0.000000, bitrate: 17719 kb/s
  Stream #0:0: Video: ipu, yuv420p, 512x448, 25 tbr, 25 tbn
"""

path = Path("/Users/mattp/Downloads/Rumble Racing (USA)/Rumble Racing (USA)/")
out_dir = Path.cwd()

lsc_files = [p for p in path.rglob("*") if p.suffix.lower() == ".lsc"]

for file in lsc_files:

    out_file = out_dir / (file.stem + ".png")

    print(str(file))
    print(str(out_file))
    subprocess.run([
        "ffmpeg",
        "-i",
        str(file),
        # str(out_file)
    ])
    break
