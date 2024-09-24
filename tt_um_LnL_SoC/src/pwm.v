module pwm (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
`endif
  input clkin,
  input reset,
  input cs,
  input [2:0] uptime,
  output clkout
);

  reg [2:0] uptimelat, uptimereg, countreg;
  wire count1, uptime1;

  always @(posedge clkin or posedge reset) begin
    if (reset) begin
      uptimelat <= 3'h0;
    end else if (cs) begin
      uptimelat <= uptime;
    end
  end

  always @(posedge clkin or posedge reset) begin
    if (reset) begin
      uptimereg  <= 3'h0;
    end else if (!count1) begin
      uptimereg <= uptimelat;
    end else if (uptime1) begin
      uptimereg <= uptimereg - 1;
    end
  end

  always @(posedge clkin or posedge reset) begin
    if (reset) begin
      countreg  <= 3'h0;
    end else begin
      countreg <= countreg + 1;
    end
  end

  assign uptime1 = |uptimereg;
  assign count1 = |countreg;
  assign clkout = uptime1;

endmodule
