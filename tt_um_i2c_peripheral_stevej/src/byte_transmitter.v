`ifndef _BYTE_TRANSMITTER_
`define _BYTE_TRANSMITTER_

`default_nettype none `timescale 1us / 100 ns

// Given a byte, writes out 1 bit at a time while enable is high.
// Assumes the caller is tracking when 8 bits is sent.
module byte_transmitter (
    input clk,
    input reset,
    input enable,
    input wire [7:0] in,  // byte_buffer
    output wire out
);

  reg [2:0] byte_count;
  reg r_out;
  assign out = r_out;

  always @(posedge clk) begin
    if (reset) begin
      byte_count <= 3'b000;
      r_out <= 0;
    end else begin
      if (enable) begin
        r_out <= in[byte_count];  // when in[byte_count] is 1, r_out becomes X as it conflicts with 
        byte_count <= byte_count + 1;
      end else begin
        // once enable is pulled low, reset byte count for next use.
        byte_count <= 0;
      end
    end
  end
endmodule
`endif
