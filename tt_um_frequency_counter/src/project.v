/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_frequency_counter (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  oled_frequency_counter counter
  (
    .clk_ref_in(clk),
    .reset_in(!rst_n),

    .clk_x_in(ui_in[0]),

	  // Interface to controll SSD1306 OLED Display
	  .oled_rstn_out(uo_out[0]),
	  .oled_vbatn_out(uo_out[1]),	
	  .oled_vcdn_out(uo_out[2]),
	  .oled_csn_out(uo_out[3]),
	  .oled_dc_out(uo_out[4]),
	  .oled_clk_out(uo_out[5]),
	  .oled_mosi_out(uo_out[6])
  );

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out[7] = ui_in[7];
  assign uio_out = 8'h00;
  assign uio_oe  = 8'h00;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[6:0], uio_in[7:0], 1'b0};

endmodule
