/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_zec_square1 (
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
  assign uio_out[6:0] = 7'b0;
  assign uio_oe  = 8'b1000_0000;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in, uio_in, in_frame};

  reg  [1:0] R; // red component           the components are `reg`s to
  reg  [1:0] G; // green component         match the number of reg layers from
  reg  [1:0] B; // blue component          [hv]pos to [hv]sync for inter-signal alignment
  wire vsync;   // VSync
  wire hsync;   // HSync

  wire [9:0] hpos; // X coordinate in frame
  wire [9:0] vpos; // Y coordinate in frame
  wire in_frame;

  hvsync_generator sync_gen(
      .clk(clk),
      .reset(~rst_n),
      .vsync(vsync),
      .hsync(hsync),
      .hpos(hpos),
      .vpos(vpos),
      .display_on(in_frame)
  );


  // Pinout of Tiny VGA Pmod:
  assign uo_out[0] = R[1];
  assign uo_out[1] = G[1];
  assign uo_out[2] = B[1];
  assign uo_out[3] = vsync;
  assign uo_out[4] = R[0];
  assign uo_out[5] = G[0];
  assign uo_out[6] = B[0];
  assign uo_out[7] = hsync;


  // frame counter
  reg [8:0] frame_no;
  // last clock cycle's value of VSync
  reg prev_vsync;

  always @(posedge clk) begin
    if (~rst_n) begin
      frame_no <= 9'd0;
      prev_vsync <= 1;
    end
    else begin
      if (vsync & ~prev_vsync) begin // positive edge
        frame_no <= frame_no + 9'd1;
      end
      prev_vsync <= vsync;
    end
  end


  // number of frames we emulate phosphor persistence for
  `define N_LAG 15

  // color_controls[i] and color are 3-bit color indexes where
  // 3'b0_00 is black, 3'b0_11 is bright cyan, and 3'b1_xx is shades of yellow

  wire [2:0] color_controls [(`N_LAG-1):0];
  assign color_controls[0]  = 3'b0_11; // bright cyan for lag 0...
  assign color_controls[1]  = 3'b1_11; // ...changing to bright yellow...
  assign color_controls[2]  = 3'b1_11;
  assign color_controls[3]  = 3'b1_10; // ...fading...
  assign color_controls[4]  = 3'b1_10;
  assign color_controls[5]  = 3'b1_10;
  assign color_controls[6]  = 3'b1_10;
  assign color_controls[7]  = 3'b1_01; // ...to dim yellow...
  assign color_controls[8]  = 3'b1_01;
  assign color_controls[9]  = 3'b1_01;
  assign color_controls[10] = 3'b1_01;
  assign color_controls[11] = 3'b1_01;
  assign color_controls[12] = 3'b1_01;
  assign color_controls[13] = 3'b1_01;
  assign color_controls[14] = 3'b1_01; // ...before going black after lag 14.

  wire [2:0] color_maybe [(`N_LAG-1):0];

  genvar i, j;
  generate
    for (i = 0; i < `N_LAG; i = i + 1) begin
      wire [8:0] delay = i;
      // here's the actual munching-squares algorithm:
      assign color_maybe[i] = (hpos[8:0] == (vpos[8:0] ^ (frame_no - delay))) ? color_controls[i] : 3'b0_00;
    end
  endgenerate

  // we can only do reducing operations over the least-significant dimension,
  // so we need to exchange dimensions in color_maybe before calculating
  // color
  wire [(`N_LAG-1):0] cm_transposed [2:0];

  generate
    for (i = 0; i < `N_LAG; i = i + 1) begin
      for (j = 0; j < 3; j = j + 1) begin
        assign cm_transposed[j][i] = color_maybe[i][j];
      end
    end
  endgenerate

  wire [2:0] color;

  generate
    for (i = 0; i < 3; i = i + 1) begin
      assign color[i] = rst_n & |cm_transposed[i];
    end
  endgenerate

  always @(posedge clk) begin
    if (!rst_n) begin
      {R, G, B} <= 6'd0;
    end
    else begin
      // map from 3-bit color indexes to color components, and clip to
      // a 512x480 window
      R <= ((vpos < 480) & (hpos < 512)) ? color[1:0] & {2{color[2]}} : 2'b00;
      G <= ((vpos < 480) & (hpos < 512)) ? color[1:0] : 2'b00;
      B <= ((vpos < 480) & (hpos < 512)) ? color[1:0] & {2{~color[2]}} : 2'b00;
    end
  end


  // our sound, neatly contained in a module:

  logistic_snd #(
    .N_OSC(8),
    .ITER_LEN(15_361),
    .R_INC(2),
    .FRAC(16),
    .PHASE_BITS(16),
    .FREQ_RES(0)
  ) project_audio(
    .clk(clk),
    .reset(~rst_n),
    .snd(uio_out[7])
  );

endmodule
