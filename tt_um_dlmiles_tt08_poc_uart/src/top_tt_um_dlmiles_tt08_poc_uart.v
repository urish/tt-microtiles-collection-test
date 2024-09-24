/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

`ifdef TIMESCALE
`timescale 1ns/1ps
`endif

module tt_um_dlmiles_tt08_poc_uart (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // Improve reliability when using TT PCB reset button
  reg rst_n_sync;

  always @(posedge clk)
    rst_n_sync <= rst_n;

  wire sync_reset;
  wire async_reset;
  assign async_reset = rst_n;

    // This exists outside the SpinalHDL project as it has async properties
    // SpinalHDL is based around sync design principles that make up the bulk (99.9%) of digital designs.
  (* keep = "TRUE" *)(* keep_hierarchy = "TRUE" *) async_reset_ctrl__dff_async_set async_reset_ctrl (
      .reset_out  	(sync_reset),
      .clk        	(clk),
      .async_reset_in   (async_reset)
//`ifdef COCOTB_SIM
//`ifndef GL_TEST
///        , .sim_resetn	(sim_resetn)
///        , .sim_set	(sim_set)
//`endif
//`endif
  );

`ifdef HAVE_DEBUG_UART
  wire simulation_z;
  assign simulation_z = 1'bz;
`endif

  UartTop uart (
      .ui_in         (ui_in),        //i Dedicated inputs
      .uo_out        (uo_out),       //o Dedicated outputs
      .uio_in        (uio_in),       //i IOs: Input path
      .uio_out       (uio_out),      //o IOs: Output path
      .uio_oe        (uio_oe),       //o IOs: Enable path (active high: 0=input, 1=output)
      .ena           (ena),          //i enable - goes high when design is selected
      .clk           (clk),          //i clock
      .rst_n         (rst_n_sync)    //i not reset

`ifdef HAVE_DEBUG_UART
//      ,
//      .simulation_z     (simulation_z)  //i
`endif
  );

endmodule
