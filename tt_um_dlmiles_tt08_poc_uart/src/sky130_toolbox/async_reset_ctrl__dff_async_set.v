
//
//  This circuit converts an async level high or glitch-high or posedge into a sync reset high signal
//
//  The reset_out is maintained for at least 2 CLK posedge.
//
//

`default_nettype none
`ifdef TIMESCALE
`timescale 1ns/1ps
`endif

(* keep_hierarchy = "TRUE" *)
module async_reset_ctrl__dff_async_set (
    output			reset_out,

    input			clk,
    input			async_reset_in
);

    // The instance naming suffix 1,2,3,4 relates to the sequence the signal passes to get towards 'reset_out'

`ifdef TIMING
`define TIMINGONE #1
`else
`define TIMINGONE /* no TIMING */
`endif

    wire async_reset_in_triggered;
    wire dff_async_set0__set;
    assign `TIMINGONE dff_async_set0__set = async_reset_in & !async_reset_in_triggered;
    // This one is because the GL_TEST does not have delays
    dff_async_set dff_async_set0 (
      .clk   (clk),
      .set   (dff_async_set0__set),		// async_reset_in
      .d     (1'b0),
      .q     (async_reset_in_triggered)
    );

    wire posedge_det_glitcher;
    wire async_reset_in_inverted;
    // How do you simulate a glitch, well you can instruct the simulator the inverter step has a delay
//    assign `TIMINGONE async_reset_in_inverted = !async_reset_in;
    (* keep = "TRUE" *)(* keep_hierarchy = "TRUE" *)  not  `TIMINGONE  not0  (async_reset_in_inverted,  async_reset_in);
//    assign posedge_det_glitcher = async_reset_in & async_reset_in_inverted;
    // assign posedge_det_glitcher  = async_reset_in & ~async_reset_in;
    assign posedge_det_glitcher = async_reset_in_triggered;

    // This is reset_out inverted, that is gate enable for posedge_det_glitcher
    wire reset_out_inverted;
//    assign `TIMINGONE reset_out_inverted = !reset_out;
    (* keep = "TRUE" *)(* keep_hierarchy = "TRUE" *)  not  `TIMINGONE  not1  (reset_out_inverted, reset_out);
    // The purpose of this is to inhibit any output from posedge_det_glitcher
    //  while we are in a reset_out=1 output condition.  This has the effect
    //  of prioritzing the rearm process allowing.
    wire dffas2_reset_priority;
    assign dffas2_reset_priority = posedge_det_glitcher & reset_out_inverted;	// gate
    //assign dffas2_reset_priority = posedge_det_glitcher & !reset_out;

    wire dffas1q;
    wire dffas2q;
    wire dffas2q_inverted;
//    assign `TIMINGONE dffas2q_inverted = !dffas2q;
    (* keep = "TRUE" *)(* keep_hierarchy = "TRUE" *)  not  `TIMINGONE  not2  (dffas2q_inverted, dffas2q);

    // When changing the implementation to using dff_async_set instead of sr_latch_nand
    // The reset_out=1 pulse was too short having only one edge in some scenarios,
    //  depending on when the glitch arrive in.
    wire dffas1_reset_priority;
    assign dffas1_reset_priority = dffas2_reset_priority & dffas2q_inverted;	// includes posedge_det_glitcher

    dff_async_set dff_async_set1 (
      .clk  (clk),
      .set  (dffas1_reset_priority),	// set here means active reset
      .d    (1'b0),			// tied to zero
      .q    (dffas1q)
    );

    // This arrangement (of double dff_async_set) ensures we maintain reset_out=1 for at least 2 edges
    dff_async_set dff_async_set2 (
      .clk  (clk),
      .set  (dffas2_reset_priority),	// set here means active reset
      .d    (dffas1q),
      .q    (dffas2q)
    );

    wire dff3q;

    dff dff3 (
      .clk (clk),
      .d   (dffas2q),
      .q   (dff3q)
    );

    dff dff4 (
      .clk (clk),
      .d   (dff3q),
      .q   (reset_out)	// driven here
    );

endmodule
