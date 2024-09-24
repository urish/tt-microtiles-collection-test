/*
 * Copyright (c) 2024 ReJ aka Renaldas Zioma
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

/*
Video sync generator, used to drive a VGA monitor.
Timing from: https://en.wikipedia.org/wiki/Video_Graphics_Array
To use:
- Wire the hsync and vsync signals to top level outputs
- Add a 3-bit (or more) "rgb" output to the top level
*/

module hvsync_generator(clk, reset, hsync, vsync, display_on, hpos, vpos);

  input clk;
  input reset;
  output reg hsync, vsync;
  output display_on;
  output reg [9:0] hpos;
  output reg [9:0] vpos;

  // declarations for TV-simulator sync parameters
  // horizontal constants
  parameter H_DISPLAY       = 640; // horizontal display width
  parameter H_BACK          =  48; // horizontal left border (back porch)
  parameter H_FRONT         =  16; // horizontal right border (front porch)
  parameter H_SYNC          =  96; // horizontal sync width
  // vertical constants
  parameter V_DISPLAY       = 480; // vertical display height
  parameter V_TOP           =  33; // vertical top border
  parameter V_BOTTOM        =  10; // vertical bottom border
  parameter V_SYNC          =   2; // vertical sync # lines
  // derived constants
  parameter H_SYNC_START    = H_DISPLAY + H_FRONT;
  parameter H_SYNC_END      = H_DISPLAY + H_FRONT + H_SYNC - 1;
  parameter H_MAX           = H_DISPLAY + H_BACK + H_FRONT + H_SYNC - 1;
  parameter V_SYNC_START    = V_DISPLAY + V_BOTTOM;
  parameter V_SYNC_END      = V_DISPLAY + V_BOTTOM + V_SYNC - 1;
  parameter V_MAX           = V_DISPLAY + V_TOP + V_BOTTOM + V_SYNC - 1;

  wire hmaxxed = (hpos == H_MAX) || reset;  // set when hpos is maximum
  wire vmaxxed = (vpos == V_MAX) || reset;  // set when vpos is maximum
  
  // horizontal position counter
  always @(posedge clk)
  begin
    hsync <= (hpos>=H_SYNC_START && hpos<=H_SYNC_END);
    if(hmaxxed)
      hpos <= 0;
    else
      hpos <= hpos + 1;
  end

  // vertical position counter
  always @(posedge clk)
  begin
    vsync <= (vpos>=V_SYNC_START && vpos<=V_SYNC_END);
    if(hmaxxed)
      if (vmaxxed)
        vpos <= 0;
      else
        vpos <= vpos + 1;
  end
  
  // display_on is set when beam is in "safe" visible frame
  assign display_on = (hpos<H_DISPLAY) && (vpos<V_DISPLAY);

endmodule


module tt_um_rejunity_vga(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);

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
  // assign uio_out = 0;
  // assign uio_oe  = 0;

  // Suppress unused signals warning
  wire _unused_ok = &{ui_in};

  reg [9:0] counter;

  hvsync_generator hvsync_gen(
    .clk(clk),
    .reset(~rst_n),
    .hsync(hsync),
    .vsync(vsync),
    .display_on(video_active),
    .hpos(pix_x),
    .vpos(pix_y)
  );
  
  wire [9:0] moving_x = pix_x + counter*16;
  wire [9:0] moving_y = pix_y + counter*2;

  wire [9:0] moving_x2 = pix_x + counter*7;
  wire [9:0] moving_y2 = pix_y + counter + counter/2;

  wire [9:0] moving_x3 = pix_x + counter*4;
  wire [9:0] moving_y3 = pix_y + counter/2;

  wire [9:0] moving_x4 = pix_x + counter*2;
  wire [9:0] moving_y4 = pix_y + counter/4;

  wire [9:0] moving_x5 = pix_x + counter/2;
  wire [9:0] moving_y5 = pix_y + counter/6;

  wire a = moving_x[8] ^ moving_y[8];
  wire b = moving_x2[7] ^ moving_y2[7];
  wire c = moving_x3[6] ^ moving_y3[6];
  wire d = moving_x4[5] ^ moving_y4[5];
  wire e = moving_x5[4] ^ moving_y5[4];

  // wire x = a | b | c | d | e;

  // assign {R, G, B} = 
  //     video_active ? 
  //       (a ? 6'b11_11_01 :
  //         (b ? 6'b11_10_01 : 
  //           (c ? 6'b11_01_00 : 
  //             (d ? 6'b10_00_00 : 6'b00_00_00)))) : 6'b00_00_00;

  assign {R, G, B} = 
      video_active ? 
        // (a ? (pix_y[0] ^ pix_x[0] ? 6'b11_11_11 : 6'b00_00_00) :
        ((a & (pix_y[1] ^ pix_x[0])) ? 6'b11_10_10 :
          (b & (~pix_y[0] ^ pix_x[1]) ? 6'b11_01_01 : 
            (c ? 6'b10_00_00 : 
              (d ? 6'b01_00_00 :
                (e & (pix_y[1] ^ pix_x[0]) ? 6'b01_00_00 : 6'b00_00_00))))) : 6'b00_00_00;

  // assign {R, G, B} = 
  //     video_active ? 
  //       // (a ? (pix_y[0] ^ pix_x[0] ? 6'b11_11_11 : 6'b00_00_00) :
  //       ((a & (pix_y[1] ^ pix_x[0])) ? 6'b11_11_11 :
  //         (b & (~pix_y[0] ^ pix_x[1]) ? 6'b11_10_10 : 
  //           (c ? 6'b10_00_00 : 
  //             (d ? 6'b01_00_00 :
  //               (e ? 6'b01_00_00 : 6'b00_00_00))))) : 6'b00_00_00;


  // assign {R, G, B} = 
  //     video_active ? 
  //       // (a ? (pix_y[0] ^ pix_x[0] ? 6'b11_11_11 : 6'b00_00_00) :
  //       ((a & (pix_y[1] ^ pix_x[0])) ? 6'b11_11_11 :
  //         (b & (~pix_y[0] ^ pix_x[1]) ? 6'b11_10_10 : 
  //           (c ? 6'b10_00_00 : 
  //             (d ? 6'b01_00_00 : 6'b00_00_00)))) : 6'b00_00_00;


  // assign {R, G, B} = 
  //     video_active ? 
  //       // (a ? (pix_y[0] ^ pix_x[0] ? 6'b11_11_11 : 6'b00_00_00) :
  //       ((a & (pix_y[0] ^ pix_x[0])) ? 6'b11_11_11 :
  //         (b ? 6'b11_00_01 : 
  //           (c ? 6'b10_00_00 : 
  //             (d ? 6'b01_00_00 : 6'b00_00_00)))) : 6'b00_00_00;


    // video_active ? 
    //   a ? 6'b11_11_00 : 6'b00_00_00;
  

  // assign R = video_active ? {moving_x[6], moving_y[6]} : 2'b00;
  // assign R = video_active ? x * 2'b11 : 2'b00;
  // assign G = 2'b00;//video_active ? {moving_x[6], pix_y[2]} : 2'b00;
  // assign B = 2'b00;//video_active ? {moving_x[7], pix_y[5]} : 2'b00;
  
  always @(posedge vsync) begin
    if (~rst_n) begin
      counter <= 0;
    end else begin
      counter <= counter + 1;
    end
  end
  
endmodule
