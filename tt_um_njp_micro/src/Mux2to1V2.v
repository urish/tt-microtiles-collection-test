// Eight bit 2to1 multiplexer which pads A to eight bits by default
// sel = '0' pass A, sel = '1' pass B

module Mux2to1V2(output [7:0] Y, input [3:0] A, input [7:0] B, input sel);
  wire [7:0] A8 = { 4'b0000, A};
  assign Y = (sel) ? A8 : B;
endmodule
