/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_brandonramos_VGA_Pong_with_NES_Controllers (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock will be 25.175MHz
    input  wire       rst_n     // reset_n - low to reset
);

wire [4:0] out;
wire [5:0] bidir;

Pong Pong(
  .clk(clk),
  .reset_n(rst_n),
  .out(out),
  .bidir(bidir)
  );

  // All output pins must be assigned. If not used, assign to 0.
  // assign uo_out  = ({3'b000, out[4], out[3], out[2], out[1], out[0]});
  assign uo_out = {out[2], out[3], out[4], out[1], out[2], out[3], out[4], out[0]};//for TinyTapeout Tiny VGA Pmod
  assign uio_out = ({2'b00, bidir[5], bidir[4], 1'b0, bidir[2], bidir[1], 1'b0});
  assign uio_oe  = 8'b0110_110;

  assign bidir[0] = uio_in[0];
  assign bidir[3] = uio_in[3];

  // List all unused inputs to prevent warnings
  wire _unused = &{ena};

endmodule
