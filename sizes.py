
import os
from pathlib import Path

def find_o3d_files(root_dir="."):
    files = []
    for path in Path(root_dir).rglob("*.o3d"):
        size = path.stat().st_size
        files.append((path, size))
    
    files.sort(key=lambda x: x[1], reverse=True)
    
    if not files:
        print("No .o3d files found.")
        return
    
    print(f"{'Size':>12}  Path")
    print("-" * 60)
    for path, size in files:
        if size >= 1_048_576:
            size_str = f"{size / 1_048_576:.2f} MB"
        elif size >= 1024:
            size_str = f"{size / 1024:.2f} KB"
        else:
            size_str = f"{size} B"
        print(f"{size_str:>12}  {path}")

find_o3d_files()