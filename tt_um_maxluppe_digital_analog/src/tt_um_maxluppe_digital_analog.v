/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_maxluppe_digital_analog (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

  // List all unused inputs to prevent warnings
    wire _unused = &{clk, ui_in[6], ui_in[7], 1'b0};

  (* keep_hierarchy = "yes" *) Digital_Analog u0 (
      .CLK_CNT0(ui_in[0]),
      .CLK_CNT1(ui_in[1]),
      .CLK_COMP(ui_in[2]),//clk),
      .RSTN(rst_n),
      .EN0(ui_in[3]),
      .EN1(ui_in[4]),
      .SEL(ui_in[5]),
      .VinP(uo_out[0]),
      .VinM(uo_out[1]),
      .VoutP_NAND(uo_out[2]),
      .VoutM_NAND(uo_out[3]),
      .VoutP_AO22(uo_out[4]),
      .VoutM_AO22(uo_out[5]),
      .VoutP_MX21(uo_out[6]),
      .VoutM_MX21(uo_out[7])
  );

endmodule
