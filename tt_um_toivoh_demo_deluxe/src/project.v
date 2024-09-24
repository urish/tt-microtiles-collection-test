/*
 * Copyright (c) 2024 Toivo Henningsson
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`include "common.vh"
`include "synth_common.vh"
`include "common_generated.vh"

module tt_um_toivoh_demo_deluxe (
		input  wire [7:0] ui_in,    // Dedicated inputs
		output wire [7:0] uo_out,   // Dedicated outputs
		input  wire [7:0] uio_in,   // IOs: Input path
		output wire [7:0] uio_out,  // IOs: Output path
		output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
		input  wire       ena,      // always 1 when the design is powered, so you can ignore it
		input  wire       clk,      // clock
		input  wire       rst_n     // reset_n - low to reset
	);

	reg [7:0] ui_in_reg;
	reg rst_n_reg;
	always @(posedge clk) rst_n_reg <= rst_n;

	wire reset = !rst_n_reg;
	//wire reset = !rst_n;

	wire [`EXT_CONTROL_BITS-1:0] ext_control = ui_in_reg;
	wire advance_frame = ui_in_reg[7];

	wire enable;
	wire [3*`FINAL_COLOR_CHANNEL_BITS-1:0] rgb;
	wire hsync, vsync, new_frame;
	wire audio_out0, audio_out;
	demo_top #(.FULL_FPS(1)) dtop(
		.clk(clk), .reset(reset), .advance_frame(advance_frame), .ext_control(ext_control),
		.enable(enable),
		.rgb(rgb), .hsync(hsync), .vsync(vsync), .new_frame(new_frame),
		.audio_out(audio_out0)
	);
	assign audio_out = audio_out0 & !ext_control[`EC_PAUSE];

	wire [`FINAL_COLOR_CHANNEL_BITS-1:0] r, g, b;
	assign {r, g, b} = rgb;

	wire [7:0] uo_out0a, uio_out0a, uo_out0b, uio_out0b;
	wire [7:0] uio_oe_a, uio_oe_b;
	reg [7:0] uo_out1, uio_out1, uio_oe1;

	// TinyVGA pinout, with audio on uio_out[7:6]
	assign uo_out0a = {
		!hsync,
		b[`FINAL_COLOR_CHANNEL_BITS-2],
		g[`FINAL_COLOR_CHANNEL_BITS-2],
		r[`FINAL_COLOR_CHANNEL_BITS-2],
		!vsync,
		b[`FINAL_COLOR_CHANNEL_BITS-1],
		g[`FINAL_COLOR_CHANNEL_BITS-1],
		r[`FINAL_COLOR_CHANNEL_BITS-1]
	};
	assign uio_out0a[7:6] = {audio_out, !audio_out};
	assign uio_oe_a[7:6] = '1;
	assign uio_out0a[5:0] = '0;
	assign uio_oe_a[5:0] = '0;

	// Pmod VGA pinout, with audio on the unused pins
	assign uo_out0b = {b, r};
	assign uio_oe_b = '1;
	assign uio_out0b = {audio_out, !audio_out, !vsync, !hsync, g};

	always @(posedge clk) begin
		if (enable) begin
			uo_out1 <= ext_control[`EC_PMOD_VGA] ? uo_out0b : uo_out0a;
			uio_out1 <= ext_control[`EC_PMOD_VGA] ? uio_out0b : uio_out0a;
			uio_oe1 <= ext_control[`EC_PMOD_VGA] ? uio_oe_b : uio_oe_a;
		end
		ui_in_reg <= ui_in;
	end
	assign uo_out = uo_out1;
	assign uio_out = uio_out1;
	assign uio_oe = uio_oe1;

	// List all unused inputs to prevent warnings
	wire _unused = &{ena, rst_n, ui_in, uio_in};
endmodule
