/*
 * Copyright (c) 2024 Ephren Manning
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ephrenm_tsal (
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
  assign uo_out[7:2]  = 6'd0; 
  assign uio_out[7:4] = 4'd0;
  assign uio_out[2:1] = 2'd0;
  assign uio_oe  = 8'b00001001;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, rst_n, 1'b0};

  top #() top_instance (
    .clk(clk),
    .rst_btn(rst_n),
    .s_data(uio_in[1]), //input
    .comparison_value(ui_in[7:0]),
    .s_clk(uio_out[3]), //output
    .cs(uio_out[0]), //output
    .green_led(uo_out[0]),
    .red_led(uo_out[1])
  );

endmodule
