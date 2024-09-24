/*
 * Copyright (c) 2024 Emmy Xu
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_emmyxu_obstacle_detection (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
wire reset;
wire sensor_left;
wire sensor_right;
    
  // All output pins must be assigned. If not used, assign to 0.
  //assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  assign uio_out = 0;
  assign uio_oe  = 0;
  assign reset = !rst_n;
  assign sensor_left = ui_in[0];
  assign sensor_right = ui_in[1];
  assign uo_out[7:4] = 0;
  generate
      obstacle_detection u_obstacle_detection(
          .reset(reset),
          .sensor_left(sensor_left),
          .sensor_right(sensor_right),
          .left_buzz(uo_out[1:0]),
          .right_buzz(uo_out[3:2])
      );
  endgenerate
  // List all unused inputs to prevent warnings
    wire _unused = &{ena, clk, rst_n, ui_in[7:2], uio_in, 1'b0};

endmodule
