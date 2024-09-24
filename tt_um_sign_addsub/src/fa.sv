//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Company:			BHEL - Strukton
// Engineer:		Vivek Adi (email: vivek.adishesha@gmail.com)
//
// Creation Date:	(c) 2022 BHEL Strukton
// Design Name:		Full Adder in Systemverilog
// Module Name:		fa	- Behavioral
// Project Name:	Multiplier Basic Library
// Target Devices:	Altera FPGA Cyclone II EP2C15AF484I8N / EP2C5T144C8N
// Tool Versions:	Quartus 13.1 sp1
// Description:		
// Dependencies:	
// Revision:		Revision 0.01 - File Created
// Comments:
//-----------------------------------------------------------------------------------------------------------------------------------------------------			
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module fa (a, b, c, cout, sout);
	input	logic	a;
	input	logic	b;
	input	logic	c;
	output	logic	cout;
	output	logic	sout;
	
	logic stage1;
	
	always_comb begin
		stage1	= a^b;
		sout	= stage1^c;
		cout 	= (stage1 & c) | (a & b);
	end
	
endmodule