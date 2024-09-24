/*
 * Copyright (c) 2024 Ciro Cattuto <ciro.cattuto@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_cattuto_sr_latch (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7:1] = 0;
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused signals to prevent warnings
  wire _unused = &{ena, rst_n, clk, ui_in[7:2], uio_in, dclk[0], 1'b0};

  wire sr_in, sr_out;
  assign sr_in = ui_in[0];
  assign sr_out = q[SR_LEN-1];
  assign uo_out[0] = sr_out;

  wire trig;
  assign trig = ui_in[1];

  // ripple pulse generation for the shift register, triggered by transitions of trig
  wire shift, ntrig, trig_delayed;
  (* dont_touch = "true" *) INV u_invA (.out(ntrig), .in(trig));
  (* dont_touch = "true" *) INV u_invB (.out(trig_delayed), .in(ntrig));
  assign shift = trig ^ trig_delayed;

  parameter SR_LEN = 512; // length of the shift register

  // shift register wiring
  wire [SR_LEN-1:0] q;
  wire [SR_LEN-1:0] dclk;

  // Shift register and pulse delay chain
  genvar i;
  generate
    for (i = 0; i < SR_LEN; i = i + 1) begin : shift_reg
      if (i == 0) begin
        // first latch
        d_latch latch (.d(sr_in), .clk(dclk[i+1]), .clkout(dclk[i]), .q(q[i]));
      end else if (i == SR_LEN-1) begin
        // last latch
        d_latch latch (.d(q[i-1]), .clk(shift), .clkout(dclk[i]), .q(q[i]));
      end else begin
        // all other latches
        d_latch latch (.d(q[i-1]), .clk(dclk[i+1]), .clkout(dclk[i]), .q(q[i]));
      end
    end
  endgenerate

endmodule

`ifndef RTL_TEST

module INV (
	input  wire in,
  output wire out
);

  sky130_fd_sc_hd__inv_1 inv (
    .A     (in),
    .Y     (out)
  );
endmodule

`else

module INV (
	input  wire in,
  output wire out
);

  not (out, in);

endmodule

`endif

// D latch + delay line segment
module d_latch (
    input  wire d,
    input  wire clk,
    output wire clkout,
    output reg q
);

  // latch
  always @* begin
    if (clk) begin
      q = d;
    end
  end

  // delay line segment
  wire nclk;
  (* dont_touch = "true" *) INV u_inv1 (.out(nclk), .in(clk));
  (* dont_touch = "true" *) INV u_inv2 (.out(clkout), .in(nclk));

endmodule
