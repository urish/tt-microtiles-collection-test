/*
 * Copyright (c) 2024 James Ross
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_vga_glyph_mode(
	input  wire [7:0] ui_in,    // Dedicated inputs
	output wire [7:0] uo_out,   // Dedicated outputs
	input  wire [7:0] uio_in,   // IOs: Input path
	output wire [7:0] uio_out,  // IOs: Output path
	output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
	input  wire       ena,      // always 1 when the design is powered, so you can ignore it
	input  wire       clk,      // clock
	input  wire       rst_n     // reset_n - low to reset
);

	// VGA signals
	wire hsync;
	wire vsync;
	wire [5:0] RGB;
	wire video_active;
	wire [9:0] pix_x;
	wire [9:0] pix_y;

	// TinyVGA PMOD
	assign uo_out = {hsync, RGB[0], RGB[2], RGB[4], vsync, RGB[1], RGB[3], RGB[5]};

	// Unused outputs assigned to 0.
	assign uio_out = 0;
	assign uio_oe  = 0;

	wire [6:0] xb = pix_x[9:3];
	wire [6:0] x_mix = {xb[3], xb[1], xb[4], xb[1], xb[6], xb[0], xb[2]};
	wire [2:0] g_x = pix_x[2:0];
	wire [5:0] yb;
	wire [5:0] g_unused;
	wire [3:0] g_y;
	assign {g_unused, g_y} = pix_y - {yb, 3'b000} - {1'b0, yb, 2'b00};
	wire hl;

	// Suppress unused signals warning
	wire _unused_ok = &{ena, ui_in[7:2], uio_in};

	reg [9:0] counter;

	// VGA output
	hvsync_generator hvsync_gen(
		.clk(clk),
		.reset(~rst_n),
		.hsync(hsync),
		.vsync(vsync),
		.display_on(video_active),
		.hpos(pix_x),
		.vpos(pix_y)
	);

	// glyphs
	glyphs_rom glyphs(
			.c(glyph_index),
			.y(g_y),
			.x(g_x),
			.pixel(hl)
	);

	// division by 3
	div3_rom div3(
		.in(pix_y[8:2]),
		.out(yb)
	);

	wire [5:0] r = x[6:1] >> 2;
	wire [5:0] glyph_index = {xb[2] ^ yb[0], xb[0] ^ yb[1], xb[1] ^ yb[2], xb[4] ^ yb[3], xb[3] ^ yb[4]} // [0,31]
		+ {1'b0, xb[5] ^ yb[5], xb[6] ^ yb[0], xb[0] ^ yb[1], xb[1] ^ yb[2]} // [0,15]
		+ r; // [0,7]

	wire [1:0] a = xb[1:0];
	wire [3:0] b = xb[5:2];
	wire [2:0] d = xb[3:2] + 2'd3;

	wire s = xb[0] ^ xb[1] ^ xb[2] ^ xb[3] ^ xb[4] ^ xb[5] ^ xb[6];
	wire n = xb[1] ^ xb[3] ^ xb[5];

	wire [6:0] v = (counter[9:3] << s) - yb - x_mix;
	wire [3:0] c = {2'b00, a} + d;
	wire [6:0] e = {3'b000, b} << c;
	wire [6:0] f = v[6:0] & e;
	wire [6:0] x = v[6:0] >> a;
	wire [2:0] y = x[2:0] ^ 3'b111;
	wire [5:0] black = 6'b000000;

	wire [5:0] z = (((v[2:0] & 3'b111) == 3'b000) & y == 7) ? 6'b111111 : palette[ui_in[1:0]][y];

	wire [5:0] color = ((f != 7'd0) | n) ? black : z;

	assign RGB = (video_active & hl) ? color : black;
	
	always @(posedge vsync) begin
		if (~rst_n) begin
			counter <= 0;
		end else begin
			counter <= counter + 1;
		end
	end

	// color palette (RRGGBB)
	reg [5:0] palette[3:0][7:0];
	initial begin
		palette[0][0] = 6'b000000; // green (default)
		palette[0][1] = 6'b000100;
		palette[0][2] = 6'b001000;
		palette[0][3] = 6'b001100;
		palette[0][4] = 6'b001101;
		palette[0][5] = 6'b011101;
		palette[0][6] = 6'b011110;
		palette[0][7] = 6'b101110;
		palette[1][0] = 6'b000000; // red
		palette[1][1] = 6'b010000;
		palette[1][2] = 6'b100000;
		palette[1][3] = 6'b110000;
		palette[1][4] = 6'b110001;
		palette[1][5] = 6'b110101;
		palette[1][6] = 6'b110110;
		palette[1][7] = 6'b111010;
		palette[2][0] = 6'b000000; // blue
		palette[2][1] = 6'b000001;
		palette[2][2] = 6'b000010;
		palette[2][3] = 6'b000011;
		palette[2][4] = 6'b000111;
		palette[2][5] = 6'b010111;
		palette[2][6] = 6'b011011;
		palette[2][7] = 6'b101011;
		palette[3][0] = 6'b000000; // pride
		palette[3][1] = 6'b110000;
		palette[3][2] = 6'b111000;
		palette[3][3] = 6'b111100;
		palette[3][4] = 6'b001000;
		palette[3][5] = 6'b000111;
		palette[3][6] = 6'b100010;
		palette[3][7] = 6'b110011;
	end
endmodule
