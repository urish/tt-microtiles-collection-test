/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_ring_divider (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
	wire tst_clk;  // REV2 : wire to route input
	wire _n2, _n4;
	assign uio_oe = 8'b0000_0000;
	assign uio_out[7:3] = 5'b0000_0;
	assign uo_out[7] = 1'b0;
	
	assign uo_out[2] = ena;    // REV2 :  routed ena to output
	assign uo_out[3] = clk;  // REV2 :  routed the system clock to output
	assign uo_out[4] = rst_n;   // REV2 :  routed rst to output
	
	
	assign tst_clk = ui_in[0];
	
	RING_DIVIDER RING_DIV (
		.enable(ena),             // REV2: Disconnected fom the enable1 signal in REV 1.
        	.enable1(tst_clk),    // REV2 : created a dedicated input for the enable 1. could used to provide a clk for testing or a 1 for enabling ring osc.   
        	.osc_out(uio_out[2]),
        	.final_out(uo_out[0]),
        	.n1(_n1),
        	.n2(_n2),
        	.n3(_n3),
        	.n4(_n4),
        	.n5(uo_out[1])
	);
	
	// REV2: buffers 
	assign uo_out[5] = !(_n2 & _n2);
	assign uo_out[6] = !(_n4 & _n4);
	
	wire _n1, _n3;
	assign uio_out[0] = !(_n1 & _n1);
	assign uio_out[1] = !(_n3 & _n3);
	
	// wire osc_out_buffer;
	// assign uo_out[1] = !(osc_out_buffer & osc_out_buffer);
    
endmodule

