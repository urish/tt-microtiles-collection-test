/*
 * Copyright (c) 2024 JING Shuangyu
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module calculator(
    input clk,
    input rst_n,
	input [3:0] IO_P4_ROW,
    output reg [3:0] IO_P4_COL,
	output reg [2:0] Enable,
	output reg [7:0] SevenSegment
);


localparam [1:0]
	OP_PLUS = 2'd0,
	OP_MINUS = 2'd1,
	OP_MULTIPLY = 2'd2,
	OP_DIVIDE = 2'd3;


//calculator state
reg [3:0] state; 
localparam [3:0] 
   state_clear = 4'd0,
   state_read = 4'd1,
   state_digit_pressed = 4'd2,
   state_plus_pressed = 4'd3,
   state_minus_pressed = 4'd4,
   state_multiply_pressed = 4'd5,
   state_divide_pressed = 4'd6,
   state_calculate = 4'd7,
   state_dividing = 4'd8,
   state_display_arg = 4'd9,
   state_display_result = 4'd10;


//calculator registers
reg [9:0] reg_arg;
reg [9:0] reg_result;
reg [9:0] reg_display;
reg [1:0] reg_operator;
reg [1:0] reg_operator_next;

wire key_pressed;
reg key_pressed_prev;  //check if new key come in



//component
wire [3:0] keypad_out;
wire [3:0] keypad_poller_row;
wire [3:0] keypad_poller_column;
reg divider_start;
reg [9:0] numerator;
reg [9:0] denominator;
wire [9:0] quotient;
//wire [9:0] remainder;
wire divider_done;
wire [11:0] bcd;

keypad_poller inst_keypad_poller(
    .clk(clk),
    .rst_n(rst_n),
    .keypad_row_in(IO_P4_ROW), 
    .keypad_col_out(keypad_poller_column),
    .row_out(keypad_poller_row),
    .key_pressed(key_pressed)
);

keypad_encoder inst_keypad_encoder(
    .clk(clk),
    .rst_n(rst_n),
    .rows(keypad_poller_row),
    .cols(keypad_poller_column),
    .key(keypad_out)
);

divider #(10) inst_divider (
    .clk(clk), 
    .rst_n(rst_n), 
    .numerator(numerator), 
    .denominator(denominator), 
    .start(divider_start), 
    .quotient(quotient), 
    //.remainder(remainder), 
    .done(divider_done)
);

bin2bcd inst_bin2bcd(
	.bin_in(reg_display),
	.bcd_out(bcd)
);

drive inst_drive(
	.clk(clk),
	.rst_n(rst_n),
	.en(1'b1),
	.bcd(bcd),
	.Enable(Enable),
	.SevenSegment(SevenSegment)
);
 
 

always @(posedge clk or negedge rst_n)
begin
	if(!rst_n) begin
		state <= state_clear;
	end 
	else begin
		case(state)
			state_clear:
				begin
					reg_arg <= 0;
					reg_result <= 0;
					reg_display <= 0;
					reg_operator <= OP_PLUS;
					state <= state_read;
				end
			state_read:
				begin
					//check if a new key came in
					if(key_pressed && !key_pressed_prev) begin
						if(keypad_out < 4'hA) 
							state <= state_digit_pressed;
						else if(keypad_out >= 4'hE) //clear
							state <= state_clear;
						else if(keypad_out == 4'hA) //plus
							state <= state_plus_pressed;
						else if(keypad_out == 4'hB) //minus
							state <= state_minus_pressed;
						else if(keypad_out == 4'hC) //multiply (B)
							state <= state_multiply_pressed;
						else if(keypad_out == 4'hD) //divide (D)
						 	state <= state_divide_pressed;
					end
					key_pressed_prev <= key_pressed;
				end
			state_digit_pressed:
				begin
					/* verilator lint_off WIDTHEXPAND */
					//don't consume another keypress after hundreds
					if(reg_arg < 10'd100) 
					begin
						reg_arg <= reg_arg * 10 + keypad_out;
					end
					state <= state_display_arg;			
					/* verilator lint_on WIDTHEXPAND */		
				end
			state_plus_pressed:
				begin
					reg_operator_next <= OP_PLUS;
					state <= state_calculate; 
				end
			state_minus_pressed:
				begin
					reg_operator_next <= OP_MINUS;
					state <= state_calculate;
				end
			state_multiply_pressed:
				begin
					reg_operator_next <= OP_MULTIPLY;
					state <= state_calculate;
				end
			state_divide_pressed:
				begin
					reg_operator_next <= OP_DIVIDE;
					state <= state_calculate;
				end
			state_calculate:
				begin
					if(reg_operator == OP_PLUS) begin
						reg_result <= reg_result + reg_arg;
						state <= state_display_result;
					end 
					else if(reg_operator == OP_MINUS) begin
						reg_result <= reg_result - reg_arg;
						state <= state_display_result;
					end 
					else if(reg_operator == OP_MULTIPLY) begin
						reg_result <= reg_result * reg_arg;
						state <= state_display_result;
					end 
					else begin 
						divider_start <= 1'b1;
						numerator <= reg_result;
						denominator <= reg_arg;
						state <= state_dividing;
					end
					reg_operator <= reg_operator_next;
					reg_arg <= 0;
				end
			state_dividing:
				begin
					divider_start <= 1'b0;
					if(divider_done)
					begin
						reg_result <= quotient;
						state <= state_display_result;
					end
				end
			state_display_arg: 
				begin
					reg_display <= reg_arg;
					state <= state_read;
				end
			state_display_result:
				begin
					reg_display <= reg_result;
					state <= state_read;
				end
			default:
				begin
				end			
		endcase
	end
end

assign IO_P4_COL = keypad_poller_column;

endmodule
