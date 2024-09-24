module mem8x16 (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
`endif
  input clk,
  input rst,
  input cs,
  input we,
  input [2:0] addr,
  input [15:0] din,
  output reg [15:0] dout
);

  wire [1:0] rowclk;
  wire [15:0] rowout[0:1];
  reg [1:0] adrDcod;
  reg [15:0] outbuf;

  always_latch begin
    if (~we & cs) begin
      dout = outbuf;
    end
  end

  always @* begin
    case (addr)
      'h0: adrDcod = 2'h1;
      'h1: adrDcod = 2'h2;
//      'h2: adrDcod = 3'h4;
//      'h3: adrDcod = 4'h8;
//      'h4: adrDcod = 5'h10;
//      'h5: adrDcod = 6'h20;
//      'h6: adrDcod = 7'h40;
//      'h7: adrDcod = 8'h80;
      default: adrDcod = 3'h0;
    endcase
  end

  assign rowclk = adrDcod & {2{we}} & {2{cs}} & {2{clk}};
  memrow row0 (.clkp(rowclk[0]), .rstp(rst), .D16(din), .Q16(rowout[0]));
  memrow row1 (.clkp(rowclk[1]), .rstp(rst), .D16(din), .Q16(rowout[1]));
//  memrow row2 (.clkp(rowclk[2]), .rstp(rst), .D16(din), .Q16(rowout[2]));
//  memrow row3 (.clkp(rowclk[3]), .rstp(rst), .D16(din), .Q16(rowout[3]));
//  memrow row4 (.clkp(rowclk[4]), .rstp(rst), .D16(din), .Q16(rowout[4]));
//  memrow row5 (.clkp(rowclk[5]), .rstp(rst), .D16(din), .Q16(rowout[5]));
//  memrow row6 (.clkp(rowclk[6]), .rstp(rst), .D16(din), .Q16(rowout[6]));
//  memrow row7 (.clkp(rowclk[7]), .rstp(rst), .D16(din), .Q16(rowout[7]));

  always @* begin
    case (addr)
      'h0: outbuf = rowout[0];
      'h1: outbuf = rowout[1];
//      'h2: outbuf = rowout[2];
//      'h3: outbuf = rowout[3];
//      'h4: outbuf = rowout[4];
//      'h5: outbuf = rowout[5];
//      'h6: outbuf = rowout[6];
//      'h7: outbuf = rowout[7];
    endcase
  end

endmodule

module memrow (
    input clkp,
    input rstp,
    input [15:0] D16,
    output reg [15:0] Q16
  );

  always @ (posedge clkp or posedge rstp) begin
    if (rstp) begin
      Q16 <= 16'h0000;
    end else begin
      Q16 <= D16;
    end
  end

endmodule
