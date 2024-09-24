/*
 * Copyright (c) 2024 Rebecca G. Bettencourt
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_rebeccargb_intercal_alu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  reg [31:0] a;
  reg [31:0] b;
  wire [31:0] f;

  intercal_alu ayayayayayaya(ui_in[5:2], a, b, f);

  wire [7:0] f8 = (
    ui_in[1] ?
    (ui_in[0] ? f[31:24] : f[23:16]) :
    (ui_in[0] ? f[15:8] : f[7:0])
  );

  assign uo_out  = f8;
  assign uio_out = f8;
  assign uio_oe  = {8{~ui_in[6]}};

  always @(ui_in or uio_in) begin
    if (ui_in[7] == 0 && ui_in[5:3] == 0) begin
      case (ui_in[2:0])
        0: a[7:0] <= uio_in;
        1: a[15:8] <= uio_in;
        2: a[23:16] <= uio_in;
        3: a[31:24] <= uio_in;
        4: b[7:0] <= uio_in;
        5: b[15:8] <= uio_in;
        6: b[23:16] <= uio_in;
        7: b[31:24] <= uio_in;
      endcase
    end
  end

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
