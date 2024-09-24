`default_nettype none
`timescale 1ps/1ps

module RING_OSCILLATOR (
    input  logic en0,
    input  logic en1,
    input  logic in,
    output logic out,
    output wire n1,
    output wire n2,
    output wire n3,
    output wire n4
);

    // NAND chain (5 stages)
    nand_gate NAND1 (
    	.A(en1),
    	.B(in),
    	.Y(n1)
    );
    
    nand_gate NAND2 (
    	.A(en0),
    	.B(n1),
    	.Y(n2)
    );
    
    nand_gate NAND3 (
    	.A(en1),
    	.B(n2),
    	.Y(n3)
    );
    
    nand_gate NAND4 (
    	.A(en0),
    	.B(n3),
    	.Y(n4)
    );
    
    nand_gate NAND5 (
    	.A(en1),
    	.B(n4),
    	.Y(out)
    );
    
endmodule
