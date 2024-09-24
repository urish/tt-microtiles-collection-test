//`timescale 1ns / 1ps

module keypad_poller(
	input clk,
	input rst_n, 
	input [3:0] keypad_row_in, //check which row receive 
	output reg [3:0] keypad_col_out, //generate 0001 0010 0100 1000 to scan each column
	output reg [3:0] row_out,
	output reg key_pressed
);


reg [2:0] state;
localparam [2:0]
	state_init  = 3'd0,
	state_shift_column  = 3'd1, 
	state_wait_debounce = 3'd2,
	state_check_row1 = 3'd3,
	state_keypress_hold  = 3'd4,
	state_check_row2  = 3'd5;
	
reg [16:0] clk_counter;
localparam [16:0] 
	// ignore the unstable transition stage
	ticks_debounce = 17'd10_0000,   //10ms clk:10Mhz 
	// hold key press state
	ticks_hold = 17'd2_0000;         //2ms
	
localparam [3:0] NO_KEY = 4'b0000;  //none of the four rows receive => no key press
	


// rotate column (0001, 0010, 0100, 1000)
// check if we get any output - if not, rotate again
// check if the output is held, emit the read row pins ???

always @(posedge clk or negedge rst_n) 
begin
	if(!rst_n) begin
		row_out <= NO_KEY;
		state <= state_init;
		keypad_col_out <= 4'b0001;
		key_pressed <= 1'b0;
	end else begin
		case(state)
			state_init:
				begin
					row_out <= NO_KEY;
					state <= state_shift_column;
					key_pressed <= 1'b0;
				end
			state_shift_column:
				begin
                    // rotate column (0001, 0010, 0100, 1000)
					keypad_col_out <= { keypad_col_out[2:0], keypad_col_out[3] };  
					state <= state_wait_debounce;
					clk_counter <= 17'h0;
				end
			state_wait_debounce:
				begin
					clk_counter <= clk_counter + 1;
					if(clk_counter == ticks_debounce)  
						state <= state_check_row1;
				end
			state_check_row1:
				//if no key pressed, check next column
				if(keypad_row_in == NO_KEY) 
					state <= state_shift_column;
				// detect key press then hold the state
				else begin  
					row_out <= keypad_row_in;
					state <= state_keypress_hold;  
					clk_counter <= 17'h0;
				end
			state_keypress_hold:
				begin
					clk_counter <= clk_counter + 1;
					if(clk_counter == ticks_hold)
						state <= state_check_row2;
				end
			state_check_row2: 
				begin
					// hold the press state utill the key is released
					if (keypad_row_in != NO_KEY)
					begin
						state <= state_keypress_hold;
						clk_counter <= 17'h0;
						key_pressed <= 1'b1;
					end else
					begin
						state <= state_init;
					end
				end

			default: begin
			end
		endcase
	end
end

endmodule
