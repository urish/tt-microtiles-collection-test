`default_nettype none `timescale 1us / 100 ns

`include "lzc.v"

module lzc_formal (
    input  logic [31:0] in,
    output logic [31:0] out
);

  /* verilator lint_off WIDTHEXPAND */
  lzc lzc (
      .in (in),
      .out(out)
  );

`ifdef FORMAL
  always_comb begin
    cover (out == 32'h0);
  end
`endif

endmodule
