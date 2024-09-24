//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Company:			BHEL - Strukton - Intel
// Engineer:		Vivek Adi, Chiranjit Patel (email: vivek.adishesha@gmail.com, chiranjitpatel08@gmail.com)
//
// Creation Date:	(c) 2022 BHEL Strukton ARM 
// Design Name:		Signed adder and subtractor
// Module Name:		signed_dd_sub - Behavioral
// Project Name:	Computational Core
// Target Devices:	Altera FPGA Cyclone II EP2C15AF484I8N / EP2C5T144C8N
// Tool Versions:	Quartus 13.1 sp1
// Description:		
// Dependencies:	sv_lib
// Revision:		Revision 0.01 - File Created
// Comments:
//-----------------------------------------------------------------------------------------------------------------------------------------------------	

module signed_addsub_4 #(N = 4) (a, b, sign, res_signed);
	input 	logic	[N-1:0]	a;
	input 	logic	[N-1:0]	b;
	input 	logic	[1:0]	sign;
	output 	logic	[N-1:0]	res_signed;
	
	logic 	[N-1:0]	xin, yin, ha_wire_carry, ha_wire_sum;
	logic	[N-2:0] fa_wire_cin;
	logic 	[1:0]	carry_sign;
		
	genvar i;
	generate
		for (i = 0; i < N; i++) begin : xor_and_result_loop
			// Input 2'C
			assign xin[i] = sign[1] ? a[i] ^ 1'b1 : a[i];
			assign yin[i] = sign[0] ? b[i] ^ 1'b1 : b[i];
		end
		
		for (i = 0; i < N-1; i++) begin : ha_in_loop
			// Half Adder 
			ha ha_input (.a(xin[i]), .b(yin[i]), .cout(ha_wire_carry[i]), .sout(ha_wire_sum[i]));
		end
		
		// Add +1 for 2'C + two sign bits for ++, +-, -+, --
		fa fa_2c (.a(ha_wire_sum[0]), .b(sign[0]), .c(sign[1]), .cout(fa_wire_cin[0]), .sout(res_signed[0]));
		
		for (i = 0; i < N-2; i++) begin : fa_in_loop
			// Full Adder
			fa fa_output (.a(ha_wire_carry[i]), .b(ha_wire_sum[i+1]), .c(fa_wire_cin[i]), .cout(fa_wire_cin[i+1]), .sout(res_signed[i+1]));
		end
		
		// Last Stage XOR
		xor xor_input 		(ha_wire_carry[N-1], xin[N-1], yin[N-1]);
		xor xor_fa_add 		(ha_wire_sum[N-1], ha_wire_carry[N-1], ha_wire_carry[N-2]);
		xor xor_fa_add_2 	(res_signed[N-1], ha_wire_sum[N-1], fa_wire_cin[N-2]);
	endgenerate
endmodule
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++