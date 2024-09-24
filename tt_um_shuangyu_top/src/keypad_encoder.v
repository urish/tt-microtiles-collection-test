//`timescale 1ns / 1ps

/*
-- 16 digit keypad encoder module
-- hex encode
-- 1 2 3 A
-- 4 5 6 B
-- 7 8 9 C
-- E 0 F D	
*/

module keypad_encoder(
	input clk,
	input rst_n,
	input [3:0] rows,
	input [3:0] cols, 
	output reg [3:0] key
 );

localparam [3:0] 
	// unknown = 4'bxxxx,
	none = 4'b0000,
	one = 4'b0001,
	two = 4'b0010,
	three = 4'b0100,
	four = 4'b1000;
	
always @(posedge clk or negedge rst_n) begin
	if(!rst_n) begin
	 	key <= none;
	end else begin
		case(cols)
			one:
				case(rows)
					one: key   <= 4'h1;
					two: key   <= 4'h4;
					three: key <= 4'h7;
					four: key  <= 4'he;
					default: key <= none;
				endcase
			two:
				case(rows)
					one: key   <= 4'h2;
					two: key   <= 4'h5;
					three: key <= 4'h8;
					four: key  <= 4'h0;
					default: key <= none;
				endcase
			three:
				case(rows)
					one: key   <= 4'h3;
					two: key   <= 4'h6;
					three: key <= 4'h9;
					four: key  <= 4'hf;
					default: key <= none;
				endcase
			four:
				case(rows)
					one: key   <= 4'ha;
					two: key   <= 4'hb;
					three: key <= 4'hc;
					four: key  <= 4'hd;
					default: key <= none;
				endcase
			default: key <= none;
		endcase
	end
end

endmodule
