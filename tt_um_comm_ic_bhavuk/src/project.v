/*
 * Copyright (c) 2024 Bhavuk (Github: Bhavuk-HDL)
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_comm_ic_bhavuk (
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
	assign uio_out[7] = clk;
	assign uio_oe[1]  = 1'b1;
	assign uio_oe[6]  = 1'b1;
	assign uio_oe[7]  = 1'b1;

	// List all unused inputs to prevent warnings
	wire _unused = &{ena, ui_in[7:3], uio_in[1], uio_in[7:6]};
	
	comm_ic comm_ic0 (.clk(clk), .reset_n(rst_n), 
			  .UART_RX(ui_in[0]), .UART_TX(uo_out[0]),
			  .SEN(uo_out[1]), .SCLK(uo_out[2]), .MOSI(uo_out[3]), .MISO(ui_in[1]),
			  .SCL(uo_out[4]), .SDA_in(uio_in[0]), .SDA_op(uio_out[0]), .SDA_op_en(uio_oe[0]),
			  .busy_uart(uo_out[5]), .busy_spi(uo_out[6]), .busy_i2c(uo_out[7]), .new_uart(uio_out[1]), .error_i2c(uio_out[6]),
			  .data_in(uio_in[5:2]), .data_out(uio_out[5:2]), .data_op_en(uio_oe[5:2]), .data_en(ui_in[2]));
			  
endmodule
