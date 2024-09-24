`ifndef _BYTE_RECEIVER_
`define _BYTE_RECEIVER_

`default_nettype none `timescale 1us / 100 ns


// Reads in a full byte 1 bit at a time as long as enable is high.
// Assumes the caller is tracking when 8 bits have been read.
module byte_receiver (
    input clk,
    input reset,
    input enable,
    input in,
    output [7:0] out  // byte_buffer
);

  reg [7:0] r_out;
  assign out = r_out;
`ifdef SIMULATION
  reg running;
`endif

  always @(posedge clk) begin
    if (reset) begin
      r_out <= 8'b0000_0000;
`ifdef SIMULATION
      running <= 0;
`endif
    end else begin
      if (enable) begin
        r_out[7:1] <= r_out[6:0];
        r_out[0]   <= in;
`ifdef SIMULATION
        running <= 1;
`endif
      end else begin
        r_out <= 8'b0000_0000;
      end
    end
  end
endmodule
`endif
