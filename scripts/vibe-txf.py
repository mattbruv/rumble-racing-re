
# Attempt best-effort decode: interpret CLDA as 256x16-bit BGR555 palette, and render TXDA as indexed image
from PIL import Image
import struct, binascii, math, os
path = '../OUT/FE2/txf/10000_RS-TXF-STOCKCAR_1_A.TXF.txf'
path = '../test.txf'
# path = '../OUT/FE2/txf/1_SOURCES-TRACK-TRACK.TXF.txf'
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
        # print(i, val, hex(r), hex(g), hex(b))
        palette.append((r,g,b))
    # pad palette to 256
    while len(palette) < 256:
        palette.append((0,0,0))

if len(palette) > 256:
    palette = palette[0:256]
print(len(txda))
print("max:", len(txda) / 512)
print("clda: ", len(clda) // 2)


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

out_paths
