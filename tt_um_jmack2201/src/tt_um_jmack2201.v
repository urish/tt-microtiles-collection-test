/*
 * Copyright (c) 2024 Jacob Mack
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_jmack2201 (
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
  assign uio_out = 0;
  assign uio_oe = 0;

  demoscene_wrapper wrapper(
    .clk(clk),
    .rst_n(rst_n),
    .vga_control(ui_in),
    .vga_r({uo_out[0],uo_out[4]}),
    .vga_g({uo_out[1],uo_out[5]}),
    .vga_b({uo_out[2],uo_out[6]}),
    .vsync(uo_out[3]),
    .hsync(uo_out[7])
  );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in, uio_in};

endmodule
