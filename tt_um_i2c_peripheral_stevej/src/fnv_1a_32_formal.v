`default_nettype none `timescale 1us / 100 ns

`include "fnv_1a_32.v"

module fnv_1a_32_formal (
    input wire sck,
    input reg reset,
    input logic [31:0] in,
    output logic [31:0] out
);

  fnv_1a_32 fnv_1a_32 (
      .clk(sck),
      .reset(reset),
      .in(in),
      .out(out)
  );

`ifdef FORMAL
  logic f_past_valid;

  initial begin
    f_past_valid = 0;
    reset = 1;
  end

  always_comb begin
    if (!f_past_valid) assume (reset);
  end

  always @(posedge sck) begin
    if (f_past_valid) begin
      // Assert the basis of any hash function
      assert (in != out);
    end
  end
`endif

endmodule
