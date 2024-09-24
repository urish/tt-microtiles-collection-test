/*
 * Copyright (c) 2024 Nicholas Junker
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module bitmap(yofs, bits);
  
  input [4:0] yofs;
  output [31:0] bits;
  
  assign bits = bitarray[yofs];
  
  reg [31:0] bitarray[0:31];
  
  initial begin/*{w:4,h:4}*/
    bitarray[0] = 32'b00100011011100110000000000000000;
    bitarray[1] = 32'b01010100001001000000000000000000;
    bitarray[2] = 32'b11110010001001000000000000000000;
    bitarray[3] = 32'b10010001001001000000000000000000;
    bitarray[4] = 32'b10010110011100110000000000000000;
    bitarray[5] = 32'b00000000000000000000000000000000;
    bitarray[6] = 32'b11000110011011100110100100000000;
    bitarray[7] = 32'b10101000100001001000110100000000;
    bitarray[8] = 32'b10101110010001001010101100000000;
    bitarray[9] = 32'b11001000001011100110100100000000;
    bitarray[10] = 32'b00000110110000000000000000000000;
    bitarray[11] = 32'b11100000000000000000000000000000;
    bitarray[12] = 32'b01000110000010100101000000000000;
    bitarray[13] = 32'b11101000000101010101000000000000;
    bitarray[14] = 32'b00000100000100010010000000000000;
    bitarray[15] = 32'b00000010000000000010000000000000;
    bitarray[16] = 32'b00001100000000000010000000000000;
    bitarray[17] = 32'b00000001000011100000011100111100;
    bitarray[18] = 32'b11100010100100000111001001000010;
    bitarray[19] = 32'b10010100010100001000001001000010;
    bitarray[20] = 32'b10010100010011001000001001000010;
    bitarray[21] = 32'b11100111110000101000001000111100;
    bitarray[22] = 32'b10001000010000100110001000000000;
    bitarray[23] = 32'b10001000010111000001001000100100;
    bitarray[24] = 32'b01001000010000000001001000110100;
    bitarray[25] = 32'b01000000000000000001001000111100;
    bitarray[26] = 32'b00000000000000111110001000101100;
    bitarray[27] = 32'b00000000000000000000001000100100;
    bitarray[28] = 32'b00000000000000000000011100000000;
   
  end
endmodule

module tt_um_quarren42_demoscene_top(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);

  localparam h_min_width = 300;
  localparam h_max_width = 340;
  localparam v_min_width = 210;
  localparam v_max_width = 250;

  reg test_h;
  reg test_v;
  reg test_g_h;
  reg test_g_v;
  reg test_b_h;
  reg test_b_v;
  reg [9:0] v_offset;
  reg v_offset_rev_flag;

  // VGA signals
  wire hsync;
  wire vsync;
  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;
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

  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(~rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(video_active),
    .hpos(pix_x),
    .vpos(pix_y)
  );
  
  always @(posedge clk)
    begin
      if (pix_x > (h_min_width-v_offset) && pix_x < (h_max_width+v_offset))
    test_h <= 1;
  else
    test_h <= 0;
    end
  
   always @(posedge clk)
     begin
       if (pix_y > (v_min_width-v_offset) && (pix_y) < (v_max_width+v_offset))
    test_v <= 1;
  else
    test_v <= 0;
     end
  
    always @(posedge clk)
    begin
      if (pix_x > (h_min_width-v_offset+15) && pix_x < (h_max_width+v_offset-15))
    test_g_h <= 1;
  else
    test_g_h <= 0;
    end
  
   always @(posedge clk)
     begin
       if (pix_y > (v_min_width-v_offset/2) && (pix_y) < (v_max_width+v_offset*3))
    test_g_v <= 1;
  else
    test_g_v <= 0;
     end
  
    always @(posedge clk)
    begin
      if (pix_x-(v_offset*2) > (h_min_width-v_offset) && pix_x < (h_max_width+v_offset))
    test_b_h <= 1;
  else
    test_b_h <= 0;
    end
  
   always @(posedge clk)
     begin
       if ((pix_y-(v_offset*2)) > (v_min_width-v_offset) && (pix_y) < (v_max_width+v_offset))
    test_b_v <= 1;
  else
    test_b_v <= 0;
     end
  
  always @(posedge vsync or negedge rst_n)
    begin
      if (~rst_n)
        begin
        v_offset <= 0;
      	v_offset_rev_flag <= 0;
        end
      else begin
        if (v_offset == 0)
        v_offset_rev_flag <= 1;
        else if (v_offset == 200)
        v_offset_rev_flag <= 0;
        if (v_offset_rev_flag == 1)
        v_offset <= v_offset + 1;
      else
        v_offset <= v_offset - 1;
      end
    end

  reg [4:0] bitmap_xofs = pix_x[8:4];
  reg [4:0] bitmap_yofs = pix_y[8:4];
  reg [31:0] bitsTemp;
  
  reg bmpOnH;
  reg bmpOnV;
  
  bitmap myTest(
    .yofs(bitmap_yofs),
    .bits(bitsTemp)
  );

  always @ (posedge clk)
    begin
      if ((pix_x > 0) && (pix_x < 510))
      bmpOnH <= 1;
  else
    bmpOnH <= 0;
    end
 
  always @ (posedge clk)
    begin
      if ((pix_y > 0) && (pix_y < 500))
      bmpOnV <= 1;
  else
    bmpOnV <= 0;
    end

  wire bitmap_gfx = (bitsTemp[bitmap_xofs^ 5'b11111]) && bmpOnH && bmpOnV;

  wire r = (video_active && test_v && test_h) ^ bitmap_gfx;
  wire g = (video_active && test_g_h && test_g_v) ^ bitmap_gfx;
  wire b = (video_active && test_b_h && test_b_v) ^ bitmap_gfx;

  assign R[0] = b;
  assign R[1] = b;

  assign G[0] = g;
  assign G[1] = g;

  assign B[0] = r;
  assign B[1] = r;
  
endmodule
