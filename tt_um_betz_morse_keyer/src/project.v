/*
 * Copyright (c) 2024 Brady Etz
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype wire

module tt_um_betz_morse_keyer (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[7:6] = 2'b0;
  assign uio_out[1:0] = 2'b0;
  assign uio_oe  = 8'b00111100;

  // List all unused inputs to prevent warnings
	wire _unused = &{ui_in[3:2], uio_in[7:2], ena, 1'b0};
  
  tt08_morse_keyer main(
    .clk_i(clk), .rstn_i(rst_n),
    .wpm_sel_i(ui_in[7:4]),                           // MSB = input[7], LSB = input[4]
    .paddle_sel_i(ui_in[0]),  .iambic_AB_i(ui_in[1]), // Straight key / paddle selection = input[0],  Iambic-A/B selection = input[1]
    .dit_i(uio_in[0]),        .dah_i(uio_in[1]),      // Inputs: Dit (active-high) = io[0], Dah (active-high) = io[1]
    .aux_dit_o(uio_out[2]),   .aux_dah_o(uio_out[3]), // Outputs: Aux dit (active-high) = io[2], Aux dah (active-high) = io[3]
	.aux_morse_o(uio_out[4]), .buzzer_o(uio_out[5]),  // Outputs: Morse Output (active-high) = io[4], Buzzer Output = io[5]
    .seven_segment(uo_out)                            // Seven-segment display output uo_out[7:0] = 7seg[.GFEDCBA]
  );

endmodule
