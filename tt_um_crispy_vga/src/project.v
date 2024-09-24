/*
 * Copyright (c) 2024 James Meech
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_crispy_vga(
  input  wire [7:0] ui_in,    // Dedicated inputs
  output wire [7:0] uo_out,   // Dedicated outputs
  input  wire [7:0] uio_in,   // IOs: Input path
  output wire [7:0] uio_out,  // IOs: Output path
  output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
  input  wire       ena,      // always 1 when the design is powered, so you can ignore it
  input  wire       clk,      // clock
  input  wire       rst_n     // reset_n - low to reset
);

  // VGA signals
  wire hsync;
  wire vsync;
  wire [1:0] R;
  wire [1:0] G;
  wire [1:0] B;

  wire noise_level;
  
  // Low for low noise level and high for high noise level
  assign noise_level = uio_in[5];

  // TinyVGA PMOD passthrough with programmable added noise
  assign  {hsync, B[0], G[0], R[0], vsync, B[1], G[1], R[1]} = ui_in;
  assign uo_out = {hsync + (pcg_out[0] & uio_in[0]), B[0] + (pcg_out[1] & uio_in[1]), G[0] + (pcg_out[2] & uio_in[2]), R[0] + (pcg_out[3] & uio_in[3]), vsync + (pcg_out[4] & uio_in[4]), B[1] + (pcg_out[5] & uio_in[1] & noise_level), G[1] + (pcg_out[6] & uio_in[2] & noise_level), R[1] + (pcg_out[7] & uio_in[3] & noise_level)};
  
  // Audio PMOD passthrough with programmable added noise
  assign uio_out[7] = uio_in[6] + (pcg_out[0] & uio_in[0]) + (pcg_out[1] & uio_in[1]) + (pcg_out[2] & uio_in[2]) + (pcg_out[3] & uio_in[3]) + (pcg_out[4] & uio_in[4]) + (pcg_out[5] & uio_in[4]) + (pcg_out[6] & uio_in[5]) + (pcg_out[7] & uio_in[5]);

  // Unused outputs assigned to 0.
  assign uio_out[6] = 1'b0;
  assign uio_out[5] = 1'b0;
  assign uio_out[4] = 1'b0;
  assign uio_out[3] = 1'b0;
  assign uio_out[2] = 1'b0;
  assign uio_out[1] = 1'b0;
  assign uio_out[0] = 1'b0;
  // This one is the audio output
  assign uio_oe[7]  = 1'b1;
  assign uio_oe[6]  = 1'b0;
  assign uio_oe[5]  = 1'b0;
  assign uio_oe[4]  = 1'b0;
  assign uio_oe[3]  = 1'b0;
  assign uio_oe[2]  = 1'b0;
  assign uio_oe[1]  = 1'b0;
  assign uio_oe[0]  = 1'b0;

  // Suppress unused signals warning
  wire _unused_ok = &{ena};
  
  reg [7:0] pcg_out = 8'h00;
	reg [15:0] state = 16'h0000; 

	always @ (posedge clk) 
	begin
    if(~rst_n) begin
		  pcg_out <= 8'h00;
      state <= 16'd4356;
    end else begin
        state <= state * 16'd12829 + 16'd47989;
        pcg_out <= (((state >> ((state >> 13) + 3)) ^ state) * 62169) >> 8;
    end
	end
  
endmodule
