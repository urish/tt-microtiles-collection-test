#!/usr/bin/env python3

from math import sqrt

f = open('../arc_table.v', 'w')

f.write(f"""`default_nettype none

module arc_table(
    input wire [5:0] in,
    output reg [5:0] out
);

always @(*) begin
    case(in)
""")

for i in range(64):
    arc_data = round((sqrt(1-(i/64)**2))*64-1)
    f.write(f"        6'b{i:06b}: out = 6'b{arc_data:06b};\n")

f.write("""    endcase
end

endmodule
""")

f.close()
