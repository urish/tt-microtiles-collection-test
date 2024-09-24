`default_nettype none

module bin2bcd(
	input [9:0]	bin_in,
	output reg [11:0] bcd_out
    );
	
reg [3:0] ones;
reg [3:0] tens;
reg [3:0] hundreds;

integer i;
always @(*) begin
	ones = 4'd0;
	tens = 4'd0;
	hundreds = 4'd0;
	for(i = 9; i >= 0; i = i - 1) begin
		if(ones >= 4'd5)  ones = ones + 4'd3;
		if(tens >= 4'd5)  tens = tens + 4'd3;
		if(hundreds >= 4'd5)  hundreds = hundreds + 4'd3;
		hundreds = {hundreds[2:0], tens[3]};
		tens = {tens[2:0],ones[3]};
		ones = {ones[2:0],bin_in[i]};
	end
end	
assign bcd_out = {hundreds, tens, ones};

endmodule
