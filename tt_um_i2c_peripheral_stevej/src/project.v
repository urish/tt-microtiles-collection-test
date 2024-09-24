/*
 * Copyright (c) 2024 Steve Jenson <stevej@gmail.com>
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none `timescale 1us / 100 ns

`include "i2c_periph.v"

module tt_um_i2c_peripheral_stevej (
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
  assign uo_out = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
  wire sda;
  assign uio_out = {1'b0, sda, 6'b00_0000};
  //assign uio_oe = 0;

  /**
   * TinyTapeout pinout for I2C
   * uio[0] - (INT) -- unused in our design
   * uio[1] - (RESET)
   * uio[2] - SCL
   * uio[3] - SDA
   **/

  i2c_periph i2c_periph (
      .clk(uio_in[2]),
      .reset(~uio_in[1] | ~rst_n),
      .read_channel(uio_in[6]),
      .direction(uio_oe),
      .write_channel(sda)
  );

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, clk, 1'b0};

endmodule
