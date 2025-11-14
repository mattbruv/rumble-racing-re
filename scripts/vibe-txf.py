
# Attempt best-effort decode: interpret CLDA as 256x16-bit BGR555 palette, and render TXDA as indexed image
from PIL import Image
import struct, binascii, math, os
path = '../OUT/FE2/txf/10000_RS-TXF-STOCKCAR_1_A.TXF.txf'
data = open(path,'rb').read()

# parse chunks as before
pos = 8
chunks = []
while pos + 8 <= len(data):
    tag = data[pos:pos+4].decode('ascii', errors='replace')
    size = struct.unpack_from('<I', data, pos+4)[0]
    payload_start = pos + 8
    payload_end = payload_start + size
    if payload_end > len(data):
        break
    chunks.append({'tag': tag, 'size': size, 'start': payload_start, 'end': payload_end})
    pos = payload_end
    if pos % 4 != 0:
        pos += (4 - (pos % 4))

def get_chunk(tag):
    for c in chunks:
        if c['tag']==tag:
            return data[c['start']:c['end']]
    return None

txda = get_chunk('TXDA')
clda = get_chunk('CLDA')

print("TXDA len", len(txda), "CLDA len", len(clda) if clda else None)

# parse CLDA as 256 entries of little-endian u16 (BGR555)
palette = []
if clda and len(clda) >= 2:
    for i in range(0, len(clda), 2):
        if i+2 > len(clda): break
        val = struct.unpack_from('<H', clda, i)[0]
        # PS2 16-bit format typically: 0BBBBBGGGGGRRRRR? or BGR555: bits 0-4 R,5-9 G,10-14 B
        r = (val & 0x1F) << 3
        g = ((val >> 5) & 0x1F) << 3
        b = ((val >> 10) & 0x1F) << 3
        palette.append((r,g,b))
    # pad palette to 256
    while len(palette) < 256:
        palette.append((0,0,0))
else:
    palette = [(i,i,i) for i in range(256)]

out_paths = []
# try a set of plausible widths
width_candidates = [64,128,256,512,1024,2048]
for w in width_candidates:
    h = math.ceil(len(txda) / w)
    # create indexed image
    img = Image.new('P', (w,h))
    img.putpalette([c for rgb in palette for c in rgb])
    # fill pixels with txda bytes row-major; pad with 0
    pixels = bytearray(txda) + bytes([0]) * (w*h - len(txda))
    img.frombytes(bytes(pixels))
    out = f'../test/tex_auto_w{w}.png'
    img.save(out)
    out_paths.append(out)

# Also try a simple "unswizzled by 16x8 tiles" naive reordering (best-effort)
def unswizzle_ps2_8bpp(src, width, height):
    # PS2 swizzle often arranges in 16x8 tiles; we'll try that mapping.
    dst = bytearray(len(src) if len(src)>=width*height else width*height)
    tile_w, tile_h = 16, 8
    tiles_x = math.ceil(width / tile_w)
    tiles_y = math.ceil(height / tile_h)
    si = 0
    for ty in range(tiles_y):
        for tx in range(tiles_x):
            for y in range(tile_h):
                for x in range(tile_w):
                    px = tx*tile_w + x
                    py = ty*tile_h + y
                    if px < width and py < height:
                        di = py*width + px
                        if si < len(src):
                            dst[di] = src[si]
                        si += 1
    return bytes(dst)

# try unswizzle for candidate widths
for w in [64,128,256,512]:
    h = math.ceil(len(txda) / w)
    # only try if reasonable size
    if w*h > 0 and w*h <= 4000000:
        out_img = Image.new('RGB', (w,h))
        uns = unswizzle_ps2_8bpp(txda, w, h)
        # map palette
        px = out_img.load()
        for y in range(h):
            for x in range(w):
                idx = uns[y*w + x]
                px[x,y] = palette[idx]
        out = f'../test/tex_unsw_w{w}.png'
        out_img.save(out)
        out_paths.append(out)

out_paths
