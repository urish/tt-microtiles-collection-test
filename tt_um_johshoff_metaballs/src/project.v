/*
 * Copyright (c) 2024 Johannes Hoff
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_johshoff_metaballs (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  wire display;
  wire rgb;
  wire[9:0] x;
  wire[9:0] y;

  wire h_sync;
  wire v_sync;
  assign uo_out = {h_sync, rgb, rgb, rgb, v_sync, rgb, rgb, rgb};
  assign uio_out = 0;
  assign uio_oe = 0;

  metaballs mb(
    rgb, v_sync,
    display,
    x,
    y
  );

  vga v(
    clk,
    ~rst_n,
    h_sync, v_sync,
    display,
    x,
    y
  );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in, uio_in, 1'b0};

endmodule
