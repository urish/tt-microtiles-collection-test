#!/usr/bin/env python3

import imageio.v3 as iio
from math import log2

im = iio.imread('bitmap.png')
height, width, _ = im.shape
size = height * width

log_height = int(round(log2(height)))
assert 2**log_height == height
log_width = int(round(log2(width)))
assert 2**log_width == width
log_size = log_height + log_width
assert 2**log_size == size

bm = [1 if im[((3*height)//2-i//width)%height, (i+width//2)%width, 0] else 0 for i in range(size)]

f = open('../bitmap_table.v', 'w')

f.write(f"""`default_nettype none

module bitmap(
    input wire [{log_size-1}:0] in,
    output reg out
);

always @(*) begin
    case(in)
""")

for i, j in enumerate(bm):
    f.write(f"        {log_size}'b" + bin(i)[2:].rjust(log_size, '0') + ": out = 1'b" + str(j) + ";\n")

f.write("""    endcase
end

endmodule
""")

f.close()
