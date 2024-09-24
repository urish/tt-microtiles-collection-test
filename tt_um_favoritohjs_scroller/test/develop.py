from PIL import Image, ImagePalette
import json
table = []
with open("dataout.json", "r", encoding="utf-8") as f:
    table = json.load(f)
#im = Image.fromarray(a, mode="L")
im = Image.new(mode="P", size=(800,525))
imdata = bytearray()
for row in table:
    for pixel in row:
        imdata.append(pixel)

palette = bytearray()

def getcol(i):
    r = 0
    g = 0
    b = 0
    if (i & 0b00000001 != 0):
        r += 170
    if (i & 0b00000010 != 0):
        g += 170
    if (i & 0b00000100 != 0):
        b += 170
    if (i & 0b00010000 != 0):
        r += 85
    if (i & 0b00100000 != 0):
        g += 85
    if (i & 0b01000000 != 0):
        b += 85
    if (i & 0b10001000 != 0b10001000):
        r = r // 2
        g = g // 2
        b = b // 2
        if (i & 0b00001000 == 0):
            r += 85
        if (i & 0b10000000 == 0):
            b += 85
    return (r,g,b)


for i in range(256):
    r,g,b = getcol(i)
    palette.append(r)
    palette.append(g)
    palette.append(b)



im = Image.frombytes(mode="P", size=(800, 525), data=imdata)
im.putpalette(palette)

im.save("display.png")
