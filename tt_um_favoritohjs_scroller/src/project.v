/*
 * Copyright (c) 2024 FavoritoHJS
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

/*IDEA: Parallax scrolling city, 4 layers*/
module tt_um_favoritohjs_scroller (
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
	// assign uo_out  = ui_in + uio_in;  // Example: ou_out is the sum of ui_in and uio_in
	assign uio_out = 0;
	assign uio_oe  = 0;
	reg[9:0] lfsr1;
	reg[9:0] lfsr1b;
	reg[2:0] count1;
	reg[2:0] count1b;
	wire     hborder1 = (count1 == 0) || (count1 == 1);
	wire     border1 = vborder1 || hborder1;
	reg[9:0] lfsr2;
	reg[9:0] lfsr2b;
	reg[1:0] count2;
	reg[1:0] count2b;
	reg      count2low;
	wire     hborder2 = (count2 == 0) || (count2 == 1);
	wire     border2 = vborder2 || hborder2;
	reg      dither;
	wire     visible;

	wire[4:0] cutoff1;
	wire      vborder1;
	wire[4:0] cutoff2;
	wire      vborder2;

	wire[3:0] l1 = lfsr1[3:0];
	wire[3:0] l2 = lfsr2[3:0];
	//https://github.com/algofoogle/tt05-vga-spi-rom/blob/main/src/test/tb.v
	reg[2:0]  rd,gd,bd;
	wire[1:0]  r, g, b;
	wire      hsync;
	wire      vsync;
	wire[9:0] hcount;
	wire[9:0] vcount;
	assign uo_out[7] = hsync;
	assign uo_out[3] = vsync;
	assign {uo_out[0], uo_out[4]} = r;
	assign {uo_out[1], uo_out[5]} = g;
	assign {uo_out[2], uo_out[6]} = b;


	vga_sync vga_sync(
		.hcount(hcount),
		.vcount(vcount),
		.hsync(hsync),
		.vsync(vsync),
		.visible(visible),
		.clk(clk),
		.rst_n(rst_n)
	);
	color_ditherer color_ditherer(
		.clk(clk),
		.rst_n(rst_n),
		.dither(dither),
		.rin(rd),
		.gin(gd),
		.bin(bd),
		.r(r),
		.g(g),
		.b(b)
	);
	/*Module parameters are broken, so i have to do this and hope it gets optimized away.*/
	vertical_scheudler vscheudler1 (
		.clk(clk),
		.rst_n(rst_n),
		.hsync(hsync),
		.vsync(vsync),
		.xpos(hcount),
		.ypos(vcount),
		.START_HEIGHT(10'd116),
		.LOOP_LENGTH(5'd16),
		.val(cutoff1),
		.border(vborder1));

	vertical_scheudler vscheudler2 (
		.clk(clk),
		.rst_n(rst_n),
		.hsync(hsync),
		.vsync(vsync),
		.xpos(hcount),
		.ypos(vcount),
		.START_HEIGHT(10'd184),
		.LOOP_LENGTH(5'd8),
		.val(cutoff2),
		.border(vborder2));

	//https://stackoverflow.com/questions/12504837/verilog-generate-genvar-in-an-always-block
	/*
	genvar i;
	generate
		for (i=0; i<=16; i=i+1) begin
			always @(posedge clk) begin
				if (rst_n) begin
					if (vcount == 112 + (i*16)) cutoff1 <= i;
					if (vcount == 112 + (i*16)) vborder1 <= 1;
					if (vcount == 112 + (i*16) + 1) vborder1 <= 0;
					if (vcount == 112 + (i*16) + 15) vborder1 <= 1;
					if (vcount == 176 + (i*8)) cutoff2 <= i;
				end
			end
		end
	endgenerate
	*/
	always @(posedge clk) begin
		if (~rst_n) begin
			lfsr1 <= 10'h3ff;
			lfsr1b <= 10'h3ff;
			count1 <= 3'd7;
			count1b <= 3'd7;
			lfsr2 <= 10'h10f;
			lfsr2b <= 10'h10f;
			count2 <= 2'd3;
			count2b <= 2'd3;
			count2low <= 1'b1;
			//cutoff2 <= 5'd0;
			dither <= 1'b0;
			rd <= 3'b000;
			gd <= 3'b000;
			bd <= 3'b000;
		end else begin
			// TODO: Read multiple bits out at the same time.
			// https://zipcpu.com/dsp/2017/11/13/lfsr-multi.html
			if (visible) begin
				dither <= ~dither;
				count1 <= count1 + 1;
				if (count1 == 0) begin
					lfsr1[0] <= lfsr1[9] ^ lfsr1[6];
					lfsr1[1] <= lfsr1[8] ^ lfsr1[5];
					lfsr1[2] <= lfsr1[7] ^ lfsr1[4];
					lfsr1[3] <= lfsr1[6] ^ lfsr1[3];
					lfsr1[9:4] <= lfsr1[5:0];
				end
				count2 <= count2 + 1;
				if (count2 == 0) begin
					lfsr2[0] <= lfsr2[9] ^ lfsr2[6];
					lfsr2[1] <= lfsr2[8] ^ lfsr2[5];
					lfsr2[2] <= lfsr2[7] ^ lfsr2[4];
					lfsr2[3] <= lfsr2[6] ^ lfsr2[3];
					lfsr2[9:4] <= lfsr2[5:0];
				end
			end
			//This is executed once per scanline
			if (hcount == 656) begin
				dither <= ~dither;
				//if (vcount == 1)   cutoff1 <= 0;
				//if (vcount == 1)   cutoff2 <= 0;

				//and this once per frame
				if (vcount == 482) begin
					count1b <= count1b  + 1;
					if (count1b == 0) begin
						lfsr1b[0] <= lfsr1b[9] ^ lfsr1b[6];
						lfsr1b[1] <= lfsr1b[8] ^ lfsr1b[5];
						lfsr1b[2] <= lfsr1b[7] ^ lfsr1b[4];
						lfsr1b[3] <= lfsr1b[6] ^ lfsr1b[3];
						lfsr1b[9:4] <= lfsr1b[5:0];
					end
					{count2b, count2low}<= {count2b, count2low} + 3'd1;
					if (count2b == 0 & count2low == 1) begin
						lfsr2b[0] <= lfsr2b[9] ^ lfsr2b[6];
						lfsr2b[1] <= lfsr2b[8] ^ lfsr2b[5];
						lfsr2b[2] <= lfsr2b[7] ^ lfsr2b[4];
						lfsr2b[3] <= lfsr2b[6] ^ lfsr2b[3];
						lfsr2b[9:4] <= lfsr2b[5:0];
					end
				end
				lfsr1 <= lfsr1b;
				lfsr2 <= lfsr2b;
				count1 <= count1b;
				count2 <= count2b;
			end
			//thanks @Ravenslofty and @a1k0n for alerting me of this block and
			//how it needs to be inlined with the main block to prevent
			//conflicting drivers
			if (visible) begin
				if ({1'b0, l1} < cutoff1) begin
					if (border1) begin
						rd <= 3'b011;
						gd <= 3'b011;
						bd <= 3'b110;
					end else begin
						rd <= 3'b110;
						gd <= 3'b110;
						bd <= 3'b101;
					end
				end else if ({1'b0, l2} < cutoff2) begin
					if (border2) begin
						rd <= 3'b010;
						gd <= 3'b010;
						bd <= 3'b100;
					end else begin
						rd <= 3'b100;
						gd <= 3'b100;
						bd <= 3'b101;
					end
				end else begin
					rd <= 3'b010;
					gd <= 3'b010;
					bd <= 3'b011;
				end
			end else begin
				rd <= 3'b000;
				gd <= 3'b000;
				bd <= 3'b000;
			end
		end
	end
	// List all unused inputs to prevent warnings
	wire _unused = &{ena, 1'b0};

endmodule

/*Module parameters are broken, so i have to do this and hope it gets optimized away.*/
module vertical_scheudler(
	input wire clk,
	input wire rst_n,
	input wire hsync,
	input wire vsync,
	input wire [9:0] xpos,
	input wire [9:0] ypos,
	input wire [4:0] LOOP_LENGTH,
	input wire [9:0] START_HEIGHT,
	output wire [4:0] val,
	output wire border
);
	reg started;
	reg [4:0] blockline;
	reg [4:0] blockval;
	reg borderreg;
	assign val = blockval;
	assign border = borderreg;
	always @(posedge clk) begin
		if (~rst_n || ~vsync) begin
			started <= 1'b0;
			blockline <= (LOOP_LENGTH - 1);
			blockval <= 5'b0;
			borderreg <= 1'b0;
		end else begin
			if (ypos == START_HEIGHT) begin
				started <= 1'b1;
			end
			if (started) begin
				if (xpos == 10'd656) begin
					if (blockline == 0) begin
						blockline <= (LOOP_LENGTH - 1);
						if (blockval != 16) begin
							blockval <= blockval + 1;
						end
					end else begin
						blockline <= blockline - 1;
					end
					if (blockline == LOOP_LENGTH - 1) borderreg <= 0;
					if (blockline == 1) borderreg <= 1;
					if (blockline == 0) borderreg <= 1;
				end
			end
		end
	end
endmodule

module color_ditherer(
	input wire clk,
	input wire rst_n,
	input wire dither,
	input wire[2:0] rin,
	input wire[2:0] gin,
	input wire[2:0] bin,
	output wire[1:0] r,
	output wire[1:0] g,
	output wire[1:0] b
);
	reg[1:0] rout;
	reg[1:0] gout;
	reg[1:0] bout;
	assign r = rout;
	assign g = gout;
	assign b = bout;
	always @(posedge clk) begin
		if (~rst_n) begin
			rout <= 0;
			gout <= 0;
			bout <= 0;
		end else begin
			if (dither && rin[0]) rout <= rin[2:1] + 1;
			else rout <= rin[2:1];
			if (dither && gin[0]) gout <= gin[2:1] + 1;
			else gout <= gin[2:1];
			if (dither && bin[0]) bout <= bin[2:1] + 1;
			else bout <= bin[2:1];
		end
	end
endmodule

//https://github.com/algofoogle/tt05-vga-spi-rom/blob/main/src/vga_sync.v
/*TODO: Optimize by doing LFSR shenanigans?*/
module vga_sync(
	input wire clk,
	input wire rst_n,
	output wire[9:0] hcount,
	output wire[9:0] vcount,
	output wire visible,
	output wire vsync,
	output wire hsync
);
	reg[9:0] vga_xpos;
	reg[9:0] vga_ypos;
	reg      vga_vsync, vga_hsync;
	assign vsync = vga_vsync;
	assign hsync = vga_hsync;
	assign hcount = vga_xpos;
	assign vcount = vga_ypos;
	always @(posedge clk) begin
		if (~rst_n) begin
			vga_xpos <= 10'd1;
			vga_ypos <= 10'd1;
		end else begin
			//This code seems very odd, but apparently it works in real hardware?
			//TODO: This can be optimized by only reading the top few bits.
			if (vga_xpos == 10'd800) begin
				vga_xpos <= 1;
				if (vga_ypos == 10'd525) vga_ypos <= 1;
				else vga_ypos <= vga_ypos + 1;
			end
			else vga_xpos <= vga_xpos + 1;
		end

	end

	reg xvisible, yvisible;
	//assign xvisible = (vga_xpos < 10'd641);
	//assign yvisible = (vga_ypos < 10'd481);
	assign visible = xvisible && yvisible;
	always @(posedge clk) begin
		if (~rst_n) begin
			xvisible <= 1'b0;
			yvisible <= 1'b0;
			vga_hsync <= 1'b1;
			vga_vsync <= 1'b1;
		end else begin
			if      (vga_xpos == 10'd1)   xvisible <= 1'b1;
			else if (vga_xpos == 10'd641) xvisible <= 1'b0;
			if      (vga_ypos == 10'd1)   yvisible <= 1'b1;
			else if (vga_ypos == 10'd481) yvisible <= 1'b0;
			if      (vga_xpos == 10'd656) vga_hsync <= 1'b0;
			else if (vga_xpos == 10'd752) vga_hsync <= 1'b1;
			if      (vga_ypos == 10'd490) vga_vsync <= 1'b0;
			else if (vga_ypos == 10'd492) vga_vsync <= 1'b1;
		end
	end
endmodule
