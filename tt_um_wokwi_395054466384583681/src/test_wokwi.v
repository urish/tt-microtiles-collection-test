// SPDX-License-Identifier: Apache2.0
`timescale 1ns / 1ps
`default_nettype none

module test_wokwi ();
  wire [7:0] uo_out;
  wire [7:0] ui_in;

  tt_um_wokwi_395054466384583681 dut (
  `ifdef GL_TEST
      .vccd1( 1'b1),
      .vssd1( 1'b0),
  `endif
      .ui_in(ui_in),
      .uo_out(uo_out)
  );

  initial begin
    $dumpfile("wokwi_tb_395054466384583681.vcd");
    $dumpvars(0, test_wokwi);
  end
endmodule
