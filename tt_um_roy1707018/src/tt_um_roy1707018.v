/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_roy1707018 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

 // Instantiate the ro_buffer_counter module
  wire [7:0] buffer_out;
  wire [4:0] ascon_sbox_out;


  ro_buffer_counter ro_buffer_counter_inst (.rst_n(~rst_n),
                            .clk(clk),
                            .ro_activate_1(ui_in[0]),
                            .ro_activate_2(ui_in[1]),
			    .out_sel(ui_in[4:2]),
                            .out(buffer_out)
                           );
	
  ascon_sbox ascon_inst (.rst_n(~rst_n),
                            .clk(clk),
			    .activate_sbox(ui_in[7]),
			    .sbox_in(ui_in[6:2]),
                            .sbox_out(ascon_sbox_out)
                           );

  // Example: Output assignments (update based on your design needs)
  assign uo_out  = buffer_out ^ {3'b000,ascon_sbox_out};  // Example: take lower 8 bits of buffer_out ^ ascon sbox output
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, uio_in, 1'b0};

endmodule

