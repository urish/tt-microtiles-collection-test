/*
 * Copyright (c) 2024 Jonny Edwards
 * SPDX-License-Identifier: Apache-2.0
 */

module tt_um_fountaincoder_top_ad (
    input  wire       clk,      // clock
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire       rst_n     // reset_n - low to reset
);

// All output pins must be assigned. If not used, assign to 0.
// assign uio_out = 8'b0;
// assign uio_out = 8'b0;
// assign uio_oe  = 8'b0;

PULSE pulse_count
(
	.clk (clk),
    .enable (1'b1),
    .reset (rst_n), 
    .pulse (ui_in),
	.gray_count (uo_out)
);
endmodule

