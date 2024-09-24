`default_nettype none
`ifdef TIMESCALE
`timescale 1ns/1ps
`endif
//
// MetaData-1.0::
// Module-Name: dff
// Module-Language: Verilog-200?
// Output-Count: q
// Output-1: q Q
// Input-Count: 2
// input-1: clk Clock (posedge)
// input-2: d data
//
//
//  D Flip-Flop (verilog register simulation)
//	Master-Slave D type FlipFlop
//	One such implementation can be made from a
//	Level Triggered Gated SR Latch connected to
//      output of a Level Triggered Gated D Latch
//	with an inverter added to the clock line internally.
//	UPPERCASE represents external signal names
//		sr_latch_nand_gated(.s(sr_set_net_Qm), .r(sr_reset_net), .e(!CLK), .q(Q), .qn(QN))	// slave
//		d_latch_nand(.d(D), .gate(CLK), .q(sr_set_net_Qm), .qn(sr_reset_net))	// master
//
//
//
module dff (
    output reg			q,

    input			clk,
    input			d
);

    always @ (posedge clk) begin
        q <= d;
    end

endmodule
