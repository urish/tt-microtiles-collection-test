module bootrom (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
`endif
  input clk,
  input rst,
  input cs,
  input we,
  input [4:0] addr,
  output reg [15:0] dout
);

  reg [15:0] outbuf0, outbuf1, outbuf2, outbuf3, outbuf4, outbuf5, outbuf6, outbuf7;
  reg [15:0] outbuf8, outbuf9, outbufA, outbufB, outbufC, outbufD, outbufE, outbufF;
  reg [15:0] outbuf10, outbuf11, outbuf12, outbuf13, outbuf14, outbuf15, outbuf16, outbuf17;
  reg [15:0] outbuf18, outbuf19, outbuf1A, outbuf1B, outbuf1C, outbuf1D, outbuf1E, outbuf1F;
  reg [15:0] dout_internal;
  wire romclk;
  
  always_latch begin
    if (~we & cs) begin
      dout = dout_internal;
    end
  end

  assign romclk = clk & 1'b0;
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf0 <= 16'hF200; // SKI
    end else begin
      outbuf0 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1 <= 16'h4000; // BUN
    end else begin
      outbuf1 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf2 <= 16'hF800; // INP
    end else begin
      outbuf2 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf3 <= 16'h1007; // ADD 07
    end else begin
      outbuf3 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf4 <= 16'hF400; // OUT
    end else begin
      outbuf4 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf5 <= 16'h3050; // STA 50 -> spi
    end else begin
      outbuf5 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf6 <= 16'h7010; // SPA
    end else begin
      outbuf6 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf7 <= 16'h0011; // data
    end else begin
      outbuf7 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf8 <= 16'h2007; // LDA 07
    end else begin
      outbuf8 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf9 <= 16'h000B; // AND 0B
    end else begin
      outbuf9 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbufA <= 16'h7004; // SZA
    end else begin
      outbufA <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbufB <= 16'h0050; // data
    end else begin
      outbufB <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbufC <= 16'hA007; // LDAI 07
    end else begin
      outbufC <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbufD <= 16'h9011; // ADDI 11
    end else begin
      outbufD <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbufE <= 16'hB00B; // STAI 0B -> spi
    end else begin
      outbufE <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbufF <= 16'h7200; // CMA
    end else begin
      outbufF <= 16'h0000;
    end
  end

  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf10 <= 16'h7008; // SNA
    end else begin
      outbuf10 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf11 <= 16'h0007; // data
    end else begin
      outbuf11 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf12 <= 16'h7080; // CIR
    end else begin
      outbuf12 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf13 <= 16'hF400; // OUT
    end else begin
      outbuf13 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf14 <= 16'h7400; // CLE
    end else begin
      outbuf14 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf15 <= 16'h7040; // CIL
    end else begin
      outbuf15 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf16 <= 16'hF400; // OUT
    end else begin
      outbuf16 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf17 <= 16'h7020; // INC
    end else begin
      outbuf17 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf18 <= 16'h7100; // CME
    end else begin
      outbuf18 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf19 <= 16'h7040; // CIL
    end else begin
      outbuf19 <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1A <= 16'hF400; // OUT
    end else begin
      outbuf1A <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1B <= 16'h501E; // BSA 1E
    end else begin
      outbuf1B <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1C <= 16'h6051; // ISZ 51 icrement register inside spi
    end else begin
      outbuf1C <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1D <= 16'h7001; // HLT
    end else begin
      outbuf1D <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1E <= 16'h001C; // return address
    end else begin
      outbuf1E <= 16'h0000;
    end
  end
  always @ (posedge romclk or posedge rst) begin
    if (rst) begin
      outbuf1F <= 16'hC01E; // BUNI 1E
    end else begin
      outbuf1F <= 16'h0000;
    end
  end

  always @* begin
    case (addr)
      'h00: dout_internal = outbuf0;
      'h01: dout_internal = outbuf1;
      'h02: dout_internal = outbuf2;
      'h03: dout_internal = outbuf3;
      'h04: dout_internal = outbuf4;
      'h05: dout_internal = outbuf5;
      'h06: dout_internal = outbuf6;
      'h07: dout_internal = outbuf7;
      'h08: dout_internal = outbuf8;
      'h09: dout_internal = outbuf9;
      'h0A: dout_internal = outbufA;
      'h0B: dout_internal = outbufB;
      'h0C: dout_internal = outbufC;
      'h0D: dout_internal = outbufD;
      'h0E: dout_internal = outbufE;
      'h0F: dout_internal = outbufF;
      'h10: dout_internal = outbuf10;
      'h11: dout_internal = outbuf11;
      'h12: dout_internal = outbuf12;
      'h13: dout_internal = outbuf13;
      'h14: dout_internal = outbuf14;
      'h15: dout_internal = outbuf15;
      'h16: dout_internal = outbuf16;
      'h17: dout_internal = outbuf17;
      'h18: dout_internal = outbuf18;
      'h19: dout_internal = outbuf19;
      'h1A: dout_internal = outbuf1A;
      'h1B: dout_internal = outbuf1B;
      'h1C: dout_internal = outbuf1C;
      'h1D: dout_internal = outbuf1D;
      'h1E: dout_internal = outbuf1E;
      'h1F: dout_internal = outbuf1F;
    endcase
  end

endmodule
