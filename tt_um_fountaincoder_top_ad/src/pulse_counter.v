// Gray counter

module PULSE
(
	input clk, enable, reset, 
	input [7:0] pulse,
	output reg [7:0] gray_count
);

reg [7:0] out_gray;
reg [3:0] pulse_count ;
reg count_enable;
GREY_COUNT gray
	(
		.clk (clk), 
		.enable (count_enable), 
		.reset (reset),
		.gray_count (out_gray)
	);

	

	always @ (posedge reset or posedge clk)
	begin
		if (reset) begin
			pulse_count <= 0;
		end
		else if (enable)
		begin
			if (pulse_count == 1) begin
				count_enable <= 1;
			end
			pulse_count <= pulse_count + pulse ;
			if (pulse_count > 3) begin
				gray_count <= out_gray;
				count_enable <= 0;
			end
			else begin 
				gray_count <= 0;
			end
		end
	end

endmodule
