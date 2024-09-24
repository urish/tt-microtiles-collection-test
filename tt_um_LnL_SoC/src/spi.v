module spi (
`ifdef USE_POWER_PINS
  inout vccd1,
  inout vssd1,
`endif
  input reset,
  input clock_in,
  input load, // interface with other ip
  input unload, // interface with other ip
  input miso, // slave
  input ssn_in, // slave
  input [7:0] datain, // interface with other ip
  output sclk, // master
  output mosi, // master
  output ssn_out, // master
  output reg [7:0] dataout // interface with other ip
);

  wire cntRst, ss;
  reg [7:0] datareg;
  reg [3:0] cntreg;

  assign mosi = datareg[7];
  assign ss = |cntreg;
  assign ssn_out = ~ss;
  assign sclk = ss & clock_in;

  always @(posedge clock_in or posedge reset) begin
    if (reset) begin
      datareg  <= 8'h00;
    end else if (load) begin
      datareg <= datain;
    end else begin
      datareg <= datareg << 1;
      if (~ssn_in)
        datareg[0] <= miso;
    end
  end

  always_latch begin
    if (unload) begin
      dataout = datareg;
    end
  end

  assign cntRst = reset | (cntreg[0] & cntreg[3]);
  always @(posedge clock_in or posedge cntRst) begin
    if (cntRst) begin
      cntreg  <= 4'h0;
    end else if (ss || load) begin
      cntreg  <= cntreg + 1;
    end
  end

endmodule
