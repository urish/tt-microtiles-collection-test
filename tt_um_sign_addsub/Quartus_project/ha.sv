//-----------------------------------------------------------------------------------------------------------------------------------------------------
// Company:			BHEL - Strukton
// Engineer:		Vivek Adi (email: vivek.adishesha@gmail.com)
//
// Creation Date:	(c) 2022 BHEL Strukton
// Design Name:		Half Adder in Systemverilog
// Module Name:		ha	- Behavioral
// Project Name:	Multiplier Basic Library
// Target Devices:	Altera FPGA Cyclone II EP2C15AF484I8N / EP2C5T144C8N
// Tool Versions:	Quartus 13.1 sp1
// Description:		
// Dependencies:	
// Revision:		Revision 0.01 - File Created
// Comments:
//-----------------------------------------------------------------------------------------------------------------------------------------------------			
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

module ha (a, b, cout, sout);
	input	logic	a;
	input	logic	b;
	output	logic	cout;
	output	logic	sout;
	
	always_comb begin
		sout	= a^b;
		cout 	= a & b;
	end
	
endmodule