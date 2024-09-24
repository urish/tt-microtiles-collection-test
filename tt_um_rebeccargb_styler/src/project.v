/*
 * Copyright (c) 2024 Rebecca G. Bettencourt
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_rebeccargb_styler (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  reg [3:0] scanlineIn;
  wire [3:0] scanlineOut;
  reg [5:0] ctrl;
  reg [15:0] bitmapIn;
  wire [15:0] bitmapOut;
  reg [24:0] attr;

  styler s(
    .scanlineIn(scanlineIn), .bitmapIn(bitmapIn),
    .xoffset(attr[0]), .xscale(attr[1]), .yoffset(attr[2]), .yscale(attr[3]),
    .xPreMirror(attr[4]), .xPostMirror(attr[5]), .yPreMirror(attr[6]), .yPostMirror(attr[7]),
    .bold(attr[8]), .faint(attr[9]), .italic(attr[10]), .reverseItalic(attr[11]),
    .blink(attr[12]), .alternate(attr[13]), .inverse(attr[14]), .hidden(attr[15]),
    .underline(attr[16]), .doubleUnderline(attr[17]), .dottedUnderline(attr[18]),
    .strikethru(attr[19]), .doubleStrikethru(attr[20]), .dottedStrikethru(attr[21]),
    .overline(attr[22]), .doubleOverline(attr[23]), .dottedOverline(attr[24]),
    .blinkEnable(ctrl[5]), .lineEnable(ctrl[4]), .cursorEnable(ctrl[3]),
    .cursorBlink(ctrl[2]), .cursorTop(ctrl[1]), .cursorBottom(ctrl[0]),
    .faintPhase(ui_in[3]), .blinkPhase(ui_in[4]), .cursorPhase(ui_in[5]),
    .scanlineOut(scanlineOut), .bitmapOut(bitmapOut)
  );

  wire [7:0] a8 = (
    ui_in[1] ?
    (ui_in[0] ? {7'b0, attr[24]} : attr[23:16]) :
    (ui_in[0] ? attr[15:8] : attr[7:0])
  );

  wire [7:0] b8 = (
    ui_in[0] ? bitmapOut[15:8] : bitmapOut[7:0]
  );

  wire [7:0] f8 = (
    ui_in[2] ? a8 :
    ui_in[1] ? b8 :
    ui_in[0] ? {2'b0, ctrl} :
    {4'b0, scanlineOut}
  );

  assign uo_out  = f8;
  assign uio_out = f8;
  assign uio_oe  = {8{~ui_in[6]}};

  task reset; begin
    scanlineIn <= 0;
    ctrl <= 6'h3C;
    bitmapIn <= 0;
    attr <= 0;
  end endtask

  task write; begin
    case (ui_in[2:0])
      0: scanlineIn <= uio_in[3:0];
      1: ctrl <= uio_in[5:0];
      2: bitmapIn[7:0] <= uio_in;
      3: bitmapIn[15:8] <= uio_in;
      4: attr[7:0] <= uio_in;
      5: attr[15:8] <= uio_in;
      6: attr[23:16] <= uio_in;
      7: attr[24] <= uio_in[0];
    endcase
  end endtask

  always @(posedge clk) begin
    if (~rst_n) reset;
    else if (~ui_in[7]) write;
  end

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
