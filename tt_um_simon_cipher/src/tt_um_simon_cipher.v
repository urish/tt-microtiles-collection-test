/*
 * Copyright (c) 2024 Secure Embedded Systems
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_simon_cipher (
						  input wire [7:0] 	ui_in,   // Dedicated inputs
						  output wire [7:0] uo_out,  // Dedicated outputs
						  input wire [7:0] 	uio_in,  // IOs: Input path
						  output wire [7:0] uio_out, // IOs: Output path
						  output wire [7:0] uio_oe,  // IOs: Enable path (active high: 0=input, 1=output)
						  input wire 		ena,     // always 1 when the design is powered, so you can ignore it
						  input wire 		clk,     // clock
						  input wire 		rst_n    // reset_n - low to reset
						  );
   
   // UI_IN    7-6  data_rdy   0 = idle   
   //                          1 = load plaintext
   //                          2 = load key
   //                          3 = encrypt
   //          5-1  _unused
   //            0  data_in    serial data input
   //
   // UO_OUT     7  valid      1 = serial data out available
   //          6-1  _unused
   //            0  cipher_out serial data output
   //
   // UIO_OUT  7-0  _unused
   //
   // UIO_OE   7-0  _unused
     
   simon_module bitserial_cipher(.clk(clk),
								 .reset(rst_n),
								 .data_in(ui_in[0]),
								 .data_rdy(ui_in[7:6]),
								 .cipher_out(uo_out[0]),
								 .valid(uo_out[7])
								 );
   
   assign uo_out[6:1] = 6'b0;
   assign uio_out = 7'b0;
   assign uio_oe  = 7'b0;

  // List all unused inputs to prevent warnings
  wire _unused = &{ena, ui_in[5:1], 1'b0};

endmodule
