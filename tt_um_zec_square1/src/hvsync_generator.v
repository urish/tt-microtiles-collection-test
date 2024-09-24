/*
 * Copyright (c) 2024 Zachary Catlin
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

// This intentionally has the same interface as the "hvsync_generator"
// module in the VGA Playground (https://tinytapeout.github.io/vga-playground/)
// to make it easy to copy-and-paste code for _in silico_ prototyping.
module hvsync_generator(
  input  wire       clk,   // clock, assumed to be ~25.175 or 25.2 MHz
                           // (for 640x480 pixel, 59.94 or 60 Hz video)
  input  wire       reset, // reset (active HIGH)
  output reg        vsync, // VSync
  output reg        hsync, // HSync
  output reg  [9:0] hpos,  // horizontal position in frame
  output reg  [9:0] vpos,  // vertical position in frame
  output wire       display_on  // are we in the "addressable" part of the frame
                                // (i.e., the part which actually contains image data)?
);

// Like other VGA timing modules, we rotate the parts of the line and frame
// from the depiction in, e.g., VESA standards
// so as to have (hpos, vpos) == (0, 0) be the first pixel of image data.

// length of the addressable portion of a line (all H lengths in pixels)
`define H_ADDR 640
// length of the right border and front porch of a line
`define H_FRONT 16
// length of the HSync pulse
`define H_SYNC 96
// length of the back porch and left porder of a line
`define H_BACK 48

// height of the addressible portion of a frame (all V heights in lines)
`define V_ADDR 480
// height of the bottom border and front porch of a frame
`define V_FRONT 10
// height of the VSync pulse
`define V_SYNC 2
// height of the back porch and top border of a frame
`define V_BACK 33

// For VGA video, VSync and HSync are active-low.

always @(posedge clk) begin
  if (reset) begin
    {vsync, hsync} <= 2'b11;
    hpos <= 10'd0;
    vpos <= 10'd0;
  end
  else begin
    hsync <= ~((hpos >= (`H_ADDR + `H_FRONT)) & (hpos < (`H_ADDR + `H_FRONT + `H_SYNC)));
    vsync <= ~((vpos >= (`V_ADDR + `V_FRONT)) & (vpos < (`V_ADDR + `V_FRONT + `V_SYNC)));
    hpos <= (hpos >= (`H_ADDR + `H_FRONT + `H_SYNC + `H_BACK - 1)) ? 10'd0 : hpos + 10'd1;
    if (hpos >= (`H_ADDR + `H_FRONT + `H_SYNC + `H_BACK - 1)) begin
      vpos <= (vpos >= (`V_ADDR + `V_FRONT + `V_SYNC + `V_BACK - 1)) ? 10'd0 : vpos + 10'd1;
    end
  end
end

wire out_of_h_addr = hpos[9] & |hpos[8:7]; // "hpos >= 640"
wire out_of_v_addr = vpos[9] | &vpos[8:5]; // "vpos >= 480"

assign display_on = ~(out_of_h_addr | out_of_v_addr);

endmodule
