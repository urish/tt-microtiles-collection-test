// 4-bit ALU slice design
// Mike McCann 7/5/2024
// tested on an Altera/Intel Cyclone II EP2C20F484C7 FPGA

module tt_um_kb2ghz_xalu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

assign uio_oe = 8'b00001001;

// define two 4-bit data input ports 

// port A
`define da0 ui_in[0] 
`define da1 ui_in[1]  
`define da2 ui_in[2]  
`define da3 ui_in[3]  

// port B
`define db0 ui_in[4] 
`define db1 ui_in[5] 
`define db2 ui_in[6]
`define db3 ui_in[7] 

// define an 4-bit data output port

`define d0 uo_out[0] 
`define d1 uo_out[1]  
`define d2 uo_out[2]  
`define d3 uo_out[3]  

// function code inputs
`define F0 uio_in[4]
`define F1 uio_in[5]
`define F2 uio_in[6]	
	
// define carry outputs

`define co_left uo_out[4]   // left carry output
`define co_right uo_out[5]  // right carry ouput

// comparator output

`define EQU uo_out[6]      //  A=B

// zero detect

`define ZERO uo_out[7]       // output = +zero
`define NEG_ZERO uio_out[0]  // output = -zero

// define carry inputs

`define ci_left uio_in[1]        // left side carry input
`define ci_right uio_in[2]       // right side carry input

// 1's complement mode
`define COM uio_in[3]
	
// list unused inputs to prevent warnings
wire _unused =&{ena, clk, rst_n, 1'b0};
assign uio_out[1] = 1'b0;
assign uio_out[2] = 1'b0;
assign uio_out[3] = 1'b0;
assign uio_out[4] = 1'b0;
assign uio_out[5] = 1'b0;
assign uio_out[6] = 1'b0;
assign uio_out[7] = 1'b0;
	
wire bit0cy, bit1cy, bit2cy;  // carry signals between full adders
wire d0int, d1int, d2int, d3int; // bus connecting the 1's complement section and output port

// implement 1's complement function
assign `d0 = `COM ^ d0int;
assign `d1 = `COM ^ d1int;
assign `d2 = `COM ^ d2int;
assign `d3 = `COM ^ d3int;

wire ADD, AND, OR, XOR, PASSA, PASSB, SHL, SHR;

assign d0int = (ADD & (`da0 ^ `db0 ^ `ci_right)) |
		(AND & `da0 & `db0)   |
		(OR & (`da0 | `db0))  |
		(XOR & (`da0 ^ `db0)) |
		(PASSA & `da0) |
		(PASSB & `db0) |
		(SHL & `ci_right) |
	        (SHR & `da1);

assign d1int = (ADD & (`da1 ^ `db1 ^ bit0cy)) |
		(AND & `da1 & `db1)   |
		(OR & (`da1 | `db1))  |
		(XOR & (`da1 ^ `db1)) |
		(PASSA & `da1) |
		(PASSB & `db1) |
		(SHL & `da0) |
	        (SHR & `da2);

assign d2int = (ADD & (`da2 ^ `db2 ^ bit1cy)) |
		(AND & `da2 & `db2)   |
		(OR & (`da2 | `db2))  |
		(XOR & (`da2 ^ `db2)) |
		(PASSA & `da2) |
		(PASSB & `db2) |
		(SHL & `da1) |
	        (SHR & `da3);

assign d3int = (ADD & (`da3 ^ `db3 ^ bit2cy)) |
		(AND & `da3 & `db3)   |
		(OR & (`da3 | `db3))  |
	        (XOR & (`da3 ^ `db3)) |
		(PASSA & `da3) |
		(PASSB & `db3) |
		(SHL & `da2) |
	        (SHR & `ci_left);

assign bit0cy = `da0 & `db0 | `ci_right & (`da0 | `db0);
assign bit1cy = `da1 & `db1 | bit0cy & (`da1 | `db1);
assign bit2cy = `da2 & `db2 | bit1cy & (`da2 | `db2);

// function code decode

assign ADD = ~`F2 & ~`F1 & ~`F0;     // 0
assign AND = ~`F2 & ~`F1 & `F0;      // 1
assign OR = ~`F2 & `F1 & ~`F0;       // 2
assign XOR = ~`F2 & `F1 & `F0;       // 3
assign PASSA = `F2 & ~`F1 & ~`F0;    // 4
assign PASSB = `F2 & ~`F1 & `F0;     // 5
assign SHR = `F2 & `F1 & ~`F0;       // 6
assign SHL = `F2 & `F1 & `F0;        // 7
	
// carry outputs

assign `co_left = (SHL & `da3) | (ADD & (`da3 & `db3 | bit2cy & (`da3 | `db3)));
assign `co_right = SHR & `da0;

// output status signals

assign `ZERO = ~`d0 & ~`d1 & ~`d2 & ~`d3;
assign `NEG_ZERO = `d0 & `d1 & `d2 & `d3;

assign `EQU = ((`da0 & `db0) | (~`da0 & ~`db0)) &
	((`da1 & `db1) | (~`da1 & ~`db1)) &
	((`da2 & `db2) | (~`da2 & ~`db2)) &
	((`da3 & `db3) | (~`da3 & ~`db3));
endmodule

