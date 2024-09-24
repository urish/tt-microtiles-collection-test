/*
 * Copyright (c) 2024 Nicklaus Thompson
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_NicklausThompson_SkyKing (
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
	wire [1:0] R;
	wire [1:0] G;
	wire [1:0] B;
	wire video_active;
	wire [9:0] pix_x;
	wire [9:0] pix_y;

	// BNC signals
	wire [7:0] BNC_x;
	wire [6:0] BNC_y;
	wire BNC_trig;

	// PMODs
	wire [7:0] VGA_out, BNC1_out, BNC2Y_out, BNC2X_out;
	assign VGA_out = {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]};
	assign BNC1_out = {BNC_x[4], BNC_x[6], BNC_y[4], BNC_y[6], BNC_x[5], BNC_x[7], BNC_y[5], BNC_trig};
	assign BNC2Y_out = {BNC_trig, BNC_y[5], BNC_y[3], BNC_y[1], BNC_y[6], BNC_y[4], BNC_y[2], BNC_y[0]};
	assign BNC2X_out = {BNC_x[7], BNC_x[5], BNC_x[3], BNC_x[1], BNC_x[6], BNC_x[4], BNC_x[2], BNC_x[0]};
	assign uio_oe  = 8'hFF;

	// 2'b00: VGA
	// 2'b01: XY1
	// 2'b11: XY2
	assign uo_out = ui_in[0] ? (ui_in[1] ? BNC2Y_out : BNC1_out) : VGA_out;
	assign uio_out = ui_in[1] ? BNC2X_out : 8'h00;

	// Sync generator and VGA XY coordinate reference
	hvsync_generator hvsync_gen(
		.clk(clk),
		.reset(~rst_n),
		.hsync(hsync),
		.vsync(vsync),
		.display_on(video_active),
		.hpos(pix_x),
		.vpos(pix_y)
	);

	// Suppress unused signals warning
	wire _unused_ok = &{ena, ui_in, uio_in};

	// VGA image generator
	skyking_generator vga_image_generator(clk, rst_n, hsync, vsync, video_active, pix_x, pix_y, ui_in[3], R, G, B);

	// BNC image generator
	bnc_demo bnc_image_generator(clk, rst_n, BNC_x, BNC_y, BNC_trig);

endmodule // tt_um_NicklausThompson_SkyKing

module bnc_demo(
	input wire clk, 
	input wire rst_n, 
	output reg [7:0] BNC_x,
	output reg [6:0] BNC_y, 
	output wire BNC_trig
);

	// Counter for timing
	reg [28:0] counter;
	always @(posedge clk) begin
		if (~rst_n) begin
			counter <= 0;
		end else begin
			counter <= counter + 1;
		end
	end
	
	always @(posedge clk) begin
		// 8-bit X output
		if (~rst_n) begin
			BNC_x <= 8'd0;
			BNC_y <= 7'd0;
		end
		
		case (counter[4:0])
			0: BNC_x <= 8'd186;
			1: BNC_x <= 8'd207;
			2: BNC_x <= 8'd225;
			3: BNC_x <= 8'd239;
			4: BNC_x <= 8'd249;
			5: BNC_x <= 8'd254;
			6: BNC_x <= 8'd254;
			7: BNC_x <= 8'd249;
			8: BNC_x <= 8'd240;
			9: BNC_x <= 8'd226;
			10: BNC_x <= 8'd209;
			11: BNC_x <= 8'd188;
			12: BNC_x <= 8'd165;
			13: BNC_x <= 8'd140;
			14: BNC_x <= 8'd115;
			15: BNC_x <= 8'd91;
			16: BNC_x <= 8'd68;
			17: BNC_x <= 8'd47;
			18: BNC_x <= 8'd29;
			19: BNC_x <= 8'd15;
			20: BNC_x <= 8'd5;
			21: BNC_x <= 8'd0;
			22: BNC_x <= 8'd0;
			23: BNC_x <= 8'd5;
			24: BNC_x <= 8'd14;
			25: BNC_x <= 8'd28;
			26: BNC_x <= 8'd46;
			27: BNC_x <= 8'd67;
			28: BNC_x <= 8'd90;
			29: BNC_x <= 8'd114;
			30: BNC_x <= 8'd139;
			31: BNC_x <= 8'd164;
			default: BNC_x <= 8'd0;
		endcase // counter[4:0]
		
		// 7-bit Y output
		case (counter[4:0])
			0: BNC_y <= 7'd120;
			1: BNC_y <= 7'd113;
			2: BNC_y <= 7'd104;
			3: BNC_y <= 7'd94;
			4: BNC_y <= 7'd83;
			5: BNC_y <= 7'd71;
			6: BNC_y <= 7'd58;
			7: BNC_y <= 7'd46;
			8: BNC_y <= 7'd34;
			9: BNC_y <= 7'd24;
			10: BNC_y <= 7'd15;
			11: BNC_y <= 7'd7;
			12: BNC_y <= 7'd3;
			13: BNC_y <= 7'd0;
			14: BNC_y <= 7'd0;
			15: BNC_y <= 7'd2;
			16: BNC_y <= 7'd7;
			17: BNC_y <= 7'd13;
			18: BNC_y <= 7'd22;
			19: BNC_y <= 7'd33;
			20: BNC_y <= 7'd44;
			21: BNC_y <= 7'd56;
			22: BNC_y <= 7'd69;
			23: BNC_y <= 7'd81;
			24: BNC_y <= 7'd93;
			25: BNC_y <= 7'd103;
			26: BNC_y <= 7'd112;
			27: BNC_y <= 7'd119;
			28: BNC_y <= 7'd124;
			29: BNC_y <= 7'd126;
			30: BNC_y <= 7'd126;
			31: BNC_y <= 7'd124;
			default: BNC_y <= 7'd0;
		endcase // counter[4:0]
end

	assign BNC_trig = counter[3];

endmodule

module skyking_generator(
	input wire clk, 
	input wire rst_n,
	input wire hsync, 
	input wire vsync, 
	input wire video_active, 
	input wire [9:0] pix_x, 
	input wire [9:0] pix_y,
	input wire alt, 
	output wire [1:0] R, 
	output wire [1:0] G, 
	output wire [1:0] B 
);

	// Counter for timing
	reg [28:0] counter;
	always @(posedge clk) begin
		if (~rst_n) begin
			counter <= 0;
		end else begin
			counter <= counter + 1;
		end
	end

	// Sky gradient
	wire [1:0] r_sky, g_sky;
	assign r_sky = {1'b1, ~&pix_y[8:7]};
	assign g_sky = ~pix_y[8:7];

	// Letters
  wire [17:0] do_letter;
  reg [17:0] character_hold;
  
  always @(posedge clk) begin
    if (~rst_n) character_hold <= 18'b0;
    else begin
      case (counter[24:20])
        default: character_hold <= character_hold;
        5'h00: character_hold[00] <= 1'b1;
        5'h01: character_hold[01] <= 1'b1;
        5'h02: character_hold[02] <= 1'b1;
        5'h03: character_hold[03] <= 1'b1;        
        5'h04: character_hold[04] <= 1'b1;
        5'h05: character_hold[05] <= 1'b1;
        5'h06: character_hold[06] <= 1'b1;
        5'h07: character_hold[07] <= 1'b1;
        5'h08: character_hold[08] <= 1'b1;
        5'h09: character_hold[09] <= 1'b1;
        5'h0A: character_hold[10] <= 1'b1;        
        5'h0B: character_hold[11] <= 1'b1;
        5'h0C: character_hold[12] <= 1'b1;
        5'h0D: character_hold[13] <= 1'b1;
        5'h0E: character_hold[14] <= 1'b1;
        5'h0F: character_hold[15] <= 1'b1;
        5'h11: character_hold[16] <= 1'b1;
        5'h12: character_hold[17] <= 1'b1;
      endcase
    end
  end

	wire [4:0] do_alt_letter;
  wire display_letter = |({do_letter[17:6], (alt ? do_letter[5:1] : do_alt_letter), do_letter[0]} & character_hold);
  
	// S
  assign do_letter[00] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b00000)   & ~pix_x[9]
                       | (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b0000000) & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b00000)   & ~pix_x[9]
                       | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b0000011) & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b00000)   & ~pix_x[9];
  // E
  assign do_letter[01] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b000100)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b000011)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b000100)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b000011)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b000100)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b000011)  & ~pix_x[9]
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0000110) & ~pix_x[9];
  // E
  assign do_letter[02] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b000011)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b000011)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b000011)  & ~pix_x[9]
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0001100) & ~pix_x[9];
  // Y
  assign do_letter[03] = (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b0010110) & ~pix_x[9]
                       | (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b0011001) & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b001100)  & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b001011)  & ~pix_x[9]
                       | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b0010111) & ~pix_x[9]
                       | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b0011000) & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0010111) & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0011000) & ~pix_x[9];
  // O
  assign do_letter[04] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b00111)   & ~pix_x[9]
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b00111)   & ~pix_x[9]
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0011100) & ~pix_x[9]
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0011111) & ~pix_x[9];
  // U
  assign do_letter[05] = (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b010001)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b010010)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0100101)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0100010);
  // S
  assign do_letter[06] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b01011)
                      | (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b0101100)
                      | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b01011)
                      | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b0101111)
                      | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b01011);
	// P
  assign do_letter[07] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0110010)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0110010)
                       | (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b0110101)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b011001)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b011010)
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b011001)
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b011010);
  // A
  assign do_letter[08] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b01110)
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b01110)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0111000)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0111011)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0111000)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0111011);
  // C
  assign do_letter[09] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0111110)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b011111)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b100000)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b011111)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b100000);
  // E
  assign do_letter[10] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b10001)
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b10001)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b10001)
                       | (pix_y[8:4] == 5'b11010)  & (pix_x[8:2] == 7'b1000100);
  // C
  assign do_letter[11] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1001110)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b100111)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b101000)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b100111)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b101000);
  // O
  assign do_letter[12] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b10101)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b10101)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1010100)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1010111);
	// W
  assign do_letter[13] = (pix_y[8:3] == 6'b110101) & (pix_x[8:3] == 6'b101101)
                       | (pix_y[8:3] == 6'b110101) & (pix_x[8:3] == 6'b101110)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b1011010)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b1011101)
                       | (pix_y[8:4] == 5'b11010)  & (pix_x[8:2] == 7'b1011010)
                       | (pix_y[8:4] == 5'b11010)  & (pix_x[8:2] == 7'b1011101);
  // B
  assign do_letter[14] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:4] == 5'b11000)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b11000)
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b11000)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1100000)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1100011);
  // O
  assign do_letter[15] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1100110)
                       | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b1101001)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b110011)
                       | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b110100)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b110011)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b110100);
  // Y
  assign do_letter[16] = (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b1101100)
                       | (pix_y[8:3] == 6'b110100)  & (pix_x[8:2] == 7'b1101111)
                       | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b11011)
                       | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b1101101)
                       | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b1101110)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b1101101)
                       | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b1101110);
  // Cursor
  assign do_letter[17] = ((pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b111001)
                       |  (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b111010))
                       & counter[22];

	// Alt letters
  // O
  assign do_alt_letter[00] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b000100)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b000011)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b000100)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b000011)  & ~pix_x[9]
                           | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0000110) & ~pix_x[9]
                           | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0001001) & ~pix_x[9];
  // L
  assign do_alt_letter[01] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0010000) & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:4] == 5'b00100)& ~pix_x[9];
  // O
  assign do_alt_letter[02] = (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b001011)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b001100)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b001011)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b001100)  & ~pix_x[9]
                           | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0010110) & ~pix_x[9]
                           | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0011001) & ~pix_x[9];
  // N
  assign do_alt_letter[03] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0011100) & ~pix_x[9]
                           | (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0011111) & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0011100) & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:2] == 7'b0011111) & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101010) & (pix_x[8:4] == 5'b00111)   & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101001) & (pix_x[8:3] == 6'b001110)   & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101011) & (pix_x[8:3] == 6'b001111)   & ~pix_x[9];
  // G
  assign do_alt_letter[04] = (pix_y[8:4] == 5'b11010)   & (pix_x[8:2] == 7'b0100010) & ~pix_x[9]
                           | (pix_y[8:3] == 6'b110101)  & (pix_x[8:2] == 7'b0100101) & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b010001)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101000) & (pix_x[8:3] == 6'b010010)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101010) & (pix_x[8:3] == 6'b010010)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b010001)  & ~pix_x[9]
                           | (pix_y[8:2] == 7'b1101100) & (pix_x[8:3] == 6'b010010)  & ~pix_x[9];

	// Plane
  wire do_plane;
  assign do_plane = (pix_x >= 310) & (pix_x <= 330) & (pix_y >= 180) & (pix_y <= 300) // Fuselage
                  | (pix_x >= 260) & (pix_x <= 380) & (pix_y >= 230) & (pix_y <= 240) // Wing main
                  | (pix_x >= 270) & (pix_x <= 370) & (pix_y >= 240) & (pix_y <= 244) // Wing taper
                  | (pix_x >= 290) & (pix_x <= 350) & (pix_y >= 295) & (pix_y <= 300) // Tail main
                  | (pix_x >= 300) & (pix_x <= 340) & (pix_y >= 293) & (pix_y <= 295) // Tail taper
                  | (pix_x >= 287) & (pix_x <= 293) & (pix_y >= 210) & (pix_y <= 255) // Engine L
                  | (pix_x >= 347) & (pix_x <= 353) & (pix_y >= 210) & (pix_y <= 255) // Engine R
                  | (pix_x >= 280) & (pix_x <= 300) & (pix_y >= 215) & (pix_y <= 216) // Prop L
                  | (pix_x >= 340) & (pix_x <= 360) & (pix_y >= 215) & (pix_y <= 216) // Prop R
                  | (pix_x >= 315) & (pix_x <= 325) & (pix_y >= 175) & (pix_y <= 180); // Nose

  // VGA color channels
  assign R = video_active ? (r_sky | {2{display_letter}}) & {2{~do_plane}} : 2'b00;
  assign G = video_active ? (g_sky | {2{display_letter}}) & {2{~do_plane}} : 2'b00;
  assign B = video_active ? {2{display_letter}} & {2{~do_plane}} : 2'b00;
	
	// Suppress unused signals warning
	wire _unused_ok = &{hsync, vsync};

endmodule

