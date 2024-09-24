/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`define TRIPLE(X) ((X) + ((X) << 1))

module tt_um_dendraws_donut (
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
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
  assign uo_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};

  // Unused outputs assigned to 0.
  assign uio_out = 0;
  assign uio_oe  = 0;

  // Suppress unused signals warning
  wire _unused_ok = &{ena, ui_in, uio_in};

  // TODO: slow hvsync_generator
  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(~rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .phase(phase),
    .display_on(video_active),
    .hpos(pix_x),
    .vpos(pix_y)
  );

  reg phase;
  reg i_phase_0;
  wire [20:0] i;

  always @(posedge clk) begin
    if (phase == 1'b0)
      i_phase_0 = i[17] || |i[15:14] || i[10] || |i[8:7];
  end

  reg [9:0] square_in [7:0];
  wire [19:0] square_out [7:0];
  wire [19:0] square_out_d0_x, square_out_d0_y;

  wire [6:0] d0_x = square_out_d0_x[6:0];
  wire [6:0] d0_y = square_out_d0_y[6:0];
  wire [6:0] d1_y = square_out[1][6:0];
  wire [6:0] d2_y = square_out[2][6:0];
  wire [5:0] d5_y = square_out[6][5:0];
  wire [6:0] d6_y = square_out[7][6:0];
  wire [6:0] d7_x = square_out[6][6:0];
  wire [6:0] d7_y = square_out[1][6:0];
  wire [6:0] d8_x = square_out[7][6:0];
  wire [7:0] d9_x = square_out[4][7:0];
  wire [6:0] d10_x = square_out[3][6:0];
  wire [6:0] d10_y = square_out[2][6:0];
  wire [7:0] d11_x = square_out[3][7:0];
  wire [6:0] d14_x = square_out[4][6:0];
  wire [6:0] d15_x = square_out[5][6:0];
  wire [7:0] d16_x = square_out[5][7:0];
  wire [6:0] d17_x = square_out[0][6:0];
  wire [7:0] d18_x = square_out[0][7:0];

  always @(*) begin
    if (phase == 1'b0) begin
      square_in[0] = pix_x_mirr - 10'd397;
      square_in[1] = pix_y - 10'd305;
      square_in[2] = pix_y - 10'd266;
      square_in[3] = pix_x - 10'd397;
      square_in[4] = pix_x_mirr - 10'd305;
      square_in[5] = pix_x_mirr - 10'd362;
      square_in[6] = pix_x - 10'd305;
      square_in[7] = pix_x - 10'd362;
    end else begin
      square_in[0] = pix_x_mirr - 10'd420;
      square_in[1] = pix_y - 10'd229;
      square_in[2] = pix_y - 10'd205;
      square_in[3] = pix_x - 10'd420;
      square_in[4] = pix_x - 10'd276;
      square_in[5] = pix_x_mirr - 10'd276;
      square_in[6] = pix_y - 10'd250;
      square_in[7] = pix_y - 10'd291;
    end
  end

  square #(.N(10), .K(7), .POST_SHIFT(8)) square_d0_x (.in(pix_x - 10'd320), .out(square_out_d0_x));
  square #(.N(10), .K(7), .POST_SHIFT(8)) square_d0_y (.in(pix_y - 10'd240), .out(square_out_d0_y));

  genvar j, k;
  generate
    for(j = 0; j < 8; j = j + 1) begin : square_gen
      // k = (j == 4 || j == 5) ? 7 : 6;
      square #(.N(10), .K((j == 4 || j == 5) ? 7 : 6), .POST_SHIFT(8)) square_inst (.in(square_in[j]), .out(square_out[j]));
    end
  endgenerate


  // ------------------------------ Major Axis ------------------------------
  
  // ------------------------------
  wire [6:0] d0 = (d0_x >> 1) + d0_y;
  assign i[0] = d0 < 7'd52 && d0 > 7'd45;

  // ------------------------------
  wire [6:0] d1 = d0_x + `TRIPLE(d1_y);
  assign i[1] = d1 < 7'd100 && d1 > 90 && pix_y > 230;

  // ------------------------------
  wire [5:0] d2 = ((d0_x >> 1) - (d0_x >> 3)) + d2_y;
  assign i[2] = d2 < 30 && d2 > 26 && pix_y > 150;

  // ------------------------------
  wire [7:0] d3 = d0_x + `TRIPLE(d2_y);
  assign i[3] = d3 < 43 && d3 > 37;

  // ------------------------------
  wire [7:0] d4 = d0_x + `TRIPLE(d2_y);
  assign i[4] = d4 < 18 && d4 > 13;

  // ------------------------------
  wire [5:0] d5 = (d0_x >> 1) + d5_y;
  assign i[5] = d5 < 14 && d5 > 11 && pix_y < 210;

  // ------------------------------
  wire [6:0] d6 = d0_x + d6_y;
  assign i[6] = d6 < 25 && d6 > 22 && pix_y < 233;


  // ------------------------------ Minor Axis Right ------------------------------

  // ------------------------------
  wire [6:0] d7 = d7_x + (d7_y >> 1);
  assign i[7] = d7 < 15 && d7 > 11 && pix_x > 344;

  // ------------------------------
  wire [5:0] d8 = d8_x + ((d7_y >> 1) + (d7_y >> 3));
  assign i[8] = d8 < 15 && d8 > 12 && pix_x > 375 && pix_y < 305;

  // ------------------------------
  wire [6:0] d9 = ((d9_x >> 1) - (d9_x >> 3)) + d6_y;
  assign i[9] = d9 < 33 && d9 > 29 && pix_x > 320 && pix_y >= 225;

  // ------------------------------
  wire [5:0] d10 = d10_x + d10_y;
  assign i[10] = d10 < 16 && d10 > 12 && pix_x > 380 && pix_y < 305;

  // ------------------------------
  wire [8:0] d11 = (d11_x + (d11_x >> 2)) + d1_y;
  assign i[11] = d11 < 16 && d11 > 12 && pix_y < 225 && pix_x < 455;

  // ------------------------------
  wire [7:0] d12 = (d11_x - (d11_x >> 2)) + d2_y;
  assign i[12] = d12 < 18 && d12 > 15 && pix_y < 218;

  // ------------------------------
  wire [7:0] d13 = d11_x + d2_y;
  assign i[13] = d13 < 35 && d13 > 31 && pix_y < 215;


  // ------------------------------ Minor Axis Left ------------------------------
  wire [9:0] pix_x_mirr = 640 - pix_x;

  // ------------------------------ 
  wire [6:0] d14 = d14_x + (d7_y >> 1);
  assign i[14] = d14 < 15 && d14 > 11 && pix_x_mirr > 344;

  // ------------------------------
  wire [5:0] d15 = d15_x + ((d7_y >> 1) + (d7_y >> 3));
  assign i[15] = d15 < 15 && d15 > 12 && pix_x_mirr > 375 && pix_y < 305;

  // ------------------------------
  wire [6:0] d16 = ((d16_x >> 1) - (d16_x >> 3)) + d6_y;
  assign i[16] = d16 < 33 && d16 > 29 && pix_x_mirr > 320 && pix_y >= 225;

  // ------------------------------
  wire [5:0] d17 = d17_x + d10_y;
  assign i[17] = d17 < 16 && d17 > 12 && pix_x_mirr > 380 && pix_y < 305;

  // ------------------------------
  wire [8:0] d18 = (d18_x + (d18_x >> 2)) + d1_y;
  assign i[18] = d18 < 16 && d18 > 12 && pix_y < 225 && pix_x_mirr < 455;

  // ------------------------------
  wire [7:0] d19 = (d18_x - (d18_x >> 2)) + d2_y;
  assign i[19] = d19 < 18 && d19 > 15 && pix_y < 218;

  // ------------------------------
  wire [7:0] d20 = d18_x + d2_y;
  assign i[20] = d20 < 35 && d20 > 31 && pix_y < 215;

  // ------------------------------ Squares ------------------------------
  /*
  wire [11:0] i_squares;

  localparam N_FC = 8;

  // Frame counter
  reg [N_FC-1:0] fc;
  wire [N_FC-1:0] fc_2 = fc >> 1;
  wire [N_FC-1:0] fc_l = fc + (1 << (N_FC - 1));
  wire [N_FC-1:0] fc_l_2 = fc_l >> 2;
  reg frame_fired;

  always @(posedge clk) begin
    if (~rst_n) begin
      fc <= 0;
      frame_fired <= 0;
    end else if (pix_y == 0 && ~frame_fired) begin
      fc <= fc + 8;
      frame_fired <= 1'b1;
    end else if (vsync) begin
      frame_fired <= 0;
    end
  end

  assign i_squares[0] = (pix_x - 230 + fc_2) < 10 && (pix_y - 300 - fc) < 10;
  assign i_squares[1] = (pix_x - 230 + fc_l) < 10 && (pix_y - 300 - fc_l) < 10;
  
  assign i_squares[2] = (pix_x - 360 - fc_l_2) < 10 && (pix_y - 300 - fc_l) < 10;
  assign i_squares[3] = (pix_x - 360 - fc) < 10 && (pix_y - 300 - fc) < 10;

  // assign i_squares[4] = (pix_x - 200 + fc_l) < 10 && (pix_y - 275 - fc_l_2) < 10;
  // assign i_squares[5] = (pix_x - 200 + fc) < 10 && (pix_y - 275 - fc) < 10;

  assign i_squares[6] = (pix_x - 430 - fc) < 10 && (pix_y - 275 - fc_2) < 10;
  assign i_squares[7] = (pix_x - 430 - fc_l) < 10 && (pix_y - 275 - fc_l_2) < 10;

  assign i_squares[8] = (pix_x - 230 + fc) < 10 && (pix_y - 240 + fc) < 10;
  assign i_squares[9] = (pix_x - 230 + fc_l) < 10 && (pix_y - 240 + fc_l_2) < 10;

  assign i_squares[10] = (pix_x - 430 - fc) < 10 && (pix_y - 200 + fc) < 10;
  assign i_squares[11] = (pix_x - 430 - fc_l_2) < 10 && (pix_y - 200 + fc_l) < 10;

  // assign i_squares[12] = (pix_x - 360 + fc_2) < 10 && (pix_y - 240 + fc) < 10;
  // assign i_squares[13] = (pix_x - 360 + fc_l) < 10 && (pix_y - 240 + fc_l) < 10;

  assign i_squares[4] = (pix_x - 230 - fc_l_2) < 10 && (pix_y - 275 + fc_l) < 10;
  assign i_squares[5] = (pix_x - 230 - fc) < 10 && (pix_y - 275 + fc) < 10;
  */
  // ------------------------------ Display ------------------------------

  // Values for bounds will be valid in phase 1
  wire in_bounds_rect = pix_x > 150 && pix_y > 120 && pix_x < 490 && pix_y < 360;
  wire in_bounds_circ = d0 < 52;
  wire in_bounds = in_bounds_rect && in_bounds_circ;
  wire in_bounds_hole = (d6 < 23 && pix_y < 233) || (d4 < 14 && pix_y >= 233);
  
  wire circ_fire = in_bounds_rect && in_bounds_circ && (i_phase_0 || i_phase_1);
  // wire square_fire = |i_squares;

  wire i_phase_1 = |i[20:18] || i[16] || |i[13:11] || i[9] || |i[6:0];
  
  /*
  always @(*) begin
    if (~video_active) begin
      {R, G, B} = 6'd0;
    end else begin
      if (circ_fire)
        {R, G, B} = 6'b111111;
      else if (in_bounds && ~in_bounds_hole)
        {R, G, B} = 6'b001010;
      else if (in_bounds && in_bounds_hole)
        {R, G, B} = 6'b000001;
      else if (square_fire)
        // {R, G, B} = 6'b001010;
        {R, G, B} = 6'b011111;
      else
        {R, G, B} = 6'b000001;
    end
  end
  */


  always @(*) begin
    if (~video_active) begin
      {R, G, B} = 6'd0;
    end else begin
      if (circ_fire)
        {R, G, B} = 6'b111111;
      else if (in_bounds && ~in_bounds_hole)
        {R, G, B} = 6'b001010;
      else
        {R, G, B} = 6'b000001;
    end
  end
  
  
endmodule