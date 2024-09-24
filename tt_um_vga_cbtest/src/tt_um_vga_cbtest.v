/*
 * Copyright (c) 2024 Tiny Tapeout LTD
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_vga_cbtest  (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // VGA signals
  wire hsync;
  wire vsync;
  reg [1:0] R;
  reg [1:0] G;
  reg [1:0] B;
  wire video_active;
  wire [9:0] pix_x;
  wire [9:0] pix_y;

  // TinyVGA PMOD
  assign uo_out  = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};

  // Suppress unused signals warning
  wire _unused_ok = &{ui_in};

  vga_sync_generator vga_sync_gen (
      .clk(clk),
      .reset(~rst_n),
      .hsync(hsync),
      .vsync(vsync),
      .display_on(video_active),
      .hpos(pix_x),
      .vpos(pix_y)
  );

  wire [2:0] pixel_value;
  wire [5:0] color;

    wire logo_pixels = (pix_x[9:7] == 2 && pix_y[9:7] == 1);

  bitmap_rom rom1 (
      .x(pix_x[6:0]),
      .y(pix_y[6:0]),
      .pixel(pixel_value[2:0])
  );

  palette palette_inst (
      .color_index(pixel_value[2:0]),
      .rrggbb(color)
  );

  // RGB output logic
  always @(posedge clk) begin
    if (~rst_n) begin
      R <= 0;
      G <= 0;
      B <= 0;
    end else begin
      R <= 0;
      G <= 0;
      B <= 0;
      if (video_active && logo_pixels) begin
      R <= color[5:4];
      G <= color[3:2];
      B <= color[1:0];
      end
    end
  end

endmodule
