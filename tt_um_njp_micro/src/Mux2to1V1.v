// Four bit 2to1 multiplexer
// sel = '0' pass A, sel = '1' pass B

module Mux2to1V1(output [3:0] Y, input [3:0] A, B, input sel);
  assign Y = (sel) ? B : A;
endmodule
