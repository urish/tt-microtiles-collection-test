#!/usr/bin/env python3

from math import sin, cos, pi

f = open('../sine_table.v', 'w')

f.write(f"""`default_nettype none

module sine_table(
    input wire [4:0] in,
    output reg [11:0] out
);

always @(*) begin
    case(in)
""")

for i in range(32):
    sin_data = round(sin(pi/256*(2*i+1))*63.5)
    cos_data = round(cos(pi/256*(2*i+1))*63.5)
    f.write(f"        5'b{i:05b}: out = 12'b{sin_data:06b}_{cos_data:06b};\n")

f.write("""    endcase
end

endmodule
""")

f.close()
