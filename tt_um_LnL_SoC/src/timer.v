module timer (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
`endif
  input rst,
  input clkin,
  input cs,
  input [2:0] divby,
  output reg clkout
);

  reg [7:0] count;
  reg [2:0] selreg;

  always @ (posedge clkin or posedge rst) begin
    if (rst) begin
      selreg <= 3'h0;
    end else if (cs) begin
      selreg <= divby;
    end
  end

  always @ (posedge clkin or posedge rst) begin
    if (rst) begin
      count <= 8'h00;
    end else begin
      count <= count + 1;
    end
  end

   always @* begin
    case (selreg)
      'h0: clkout = count[0];
      'h1: clkout = count[1];
      'h2: clkout = count[2];
      'h3: clkout = count[3];
      'h4: clkout = count[4];
      'h5: clkout = count[5];
      'h6: clkout = count[6];
      'h7: clkout = count[7];
    endcase
  end

endmodule
