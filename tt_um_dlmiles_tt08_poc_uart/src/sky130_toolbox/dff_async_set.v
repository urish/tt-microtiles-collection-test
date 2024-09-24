`default_nettype none
`ifdef TIMESCALE
`timescale 1ns/1ps
`endif
//
// MetaData-1.0::
// Module-Name: dff_async_set
// Module-Language: Verilog-200?
// Input-Count: 2
// Input-1: clk Clock (posedge)
// Input-2: d data
// Input-3: set Set (active high)
// Output-Count: 1
// Output-1: q Q
//
//
//  D Flip-Flop, async Set (active HIGH) (verilog register simulation)
//
//
//
module dff_async_set (
    input		clk,
    input		set,	// active high
    input		d,

    output reg		q
);

    always @ (posedge clk or posedge set) begin
        if (set) begin
            q <= 1'b1;		// set
        end else begin
            q <= d;
        end
    end

endmodule
