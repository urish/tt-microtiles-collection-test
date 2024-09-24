module pwm_generator(
	input  wire [11:0] in,	// inputs to set the duty and period, 7-bit for duty and 12-bit for period
	input  wire sel,	// used to select the one of the following regsiters: "0" - duty_reg and "1" - period_reg
 	input  wire wr_en,	// when is "1" will write the value from inputs into selected register
	input  wire out_en,	// when is "1" will enable the pwm_out 
	input  wire clk,	// clock signal : input clk = 50MHz
	input  wire rst_n,	// active low reset
	output wire pwm_out	// pwm signal
);

	reg pwm_out_s;	
	reg [11:0] period_reg;	// register to store the period value: 1-4095
	reg [11:0] duty_reg;	// register to store the duty value: 1-99%

	assign pwm_out = (out_en == 1'b1) ? pwm_out_s : 1'b0;

	always@ (posedge clk) begin
	// reset the registers to "0" when reset is active low
	if (rst_n == 1'b0) begin
	    period_reg  <= 0;
	    duty_reg    <= 0;
	end else begin
		// the values will be written into registers only when wr_en is HIGH
		if (wr_en == 1'b1) begin
		      if (sel == 1'b1)
		      begin
			// all 12-bit from can be used for period      
	        	period_reg  	<= in;
		      end  
		      else begin
			// for duty are used only first 7-bit, the rest of the bits beeing assigned to "0"
	      		duty_reg    	<= {{5{1'b0}},in[6:0]};
			end
	    end
	end
	end

	wire [12:0] t_on = (period_reg * duty_reg) / 100;
	reg  [12:0] counter;

	always@ (posedge clk) begin
	// the counter will be set to "0" when reset is low or the value will be reached period-1 value
		if((rst_n == 1'b0) || (counter == period_reg-1)) begin
			counter <= 0;
	    end
		else begin
	    // the counter will start to counter if both registers has a value > 0 
	    	if((period_reg != 0) && (duty_reg != 0))
				counter <= counter + 1;
		end
	end
    
	always@ (posedge clk) begin
		if(counter < t_on)
			pwm_out_s  <= 1'b1;
	    else 
			pwm_out_s  <= 1'b0;
	end

endmodule
