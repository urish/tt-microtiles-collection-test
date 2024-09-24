/*
 * Copyright (c) 2024 Edwin Török
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_edwintorok (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  wire hsync, vsync, audio;
  wire [1:0] r,g,b;
  
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[6:0] = 0;

  assign uio_out[7] = audio; // TODO: audio

  assign uio_oe  = 8'b10000000; // the audio output pin

  // List all unused inputs to prevent warnings
  wire _unused_ok = &{ena, ui_in, uio_in[7:1], rst_n, 1'b0};

  // Tiny VGA PMOD
  assign {uo_out[0], uo_out[4]} = r[1:0];
  assign {uo_out[1], uo_out[5]} = g[1:0];
  assign {uo_out[2], uo_out[6]} = b[1:0];
  assign uo_out[3] = vsync;
  assign uo_out[7] = hsync;

  generated generated(
    .clk(clk),
    .rst_n(rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .r(r),
    .g(g),
    .b(b),
    .audio(audio),
    .test(uio_in[0])
  );

endmodule
